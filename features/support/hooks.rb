require 'openai'
require 'http'
require 'nokogiri'

BeforeAll do
    begin
        start_jms_server = HTTP.post('https://parabank.parasoft.com/parabank/services/bank/startupJmsListener')
        initialize_db = HTTP.post('https://parabank.parasoft.com/parabank/services/bank/initializeDB')
        clean_db = HTTP.post('https://parabank.parasoft.com/parabank/services/bank/cleanDB')

        create_checking_account = HTTP.post('https://parabank.parasoft.com/parabank/services/bank/createAccount?customerId=12212&newAccountType=0&fromAccountId=13344')
        second_account_id = Nokogiri::XML(create_checking_account.body).at_xpath('//id').text

        transfer_amount = '50'
        new_transfer = HTTP.post("https://parabank.parasoft.com/parabank/services/bank/transfer?fromAccountId=#{second_account_id}&toAccountId=13344&amount=#{transfer_amount}")
        get_transactions = HTTP.get("https://parabank.parasoft.com/parabank/services/bank/accounts/#{second_account_id}/transactions")
        new_transfer_id = Nokogiri::XML(get_transactions.body).at_xpath('//transaction[2]/id').text

        data = YAML.load_file(File.dirname(__FILE__) + "/factory/static/#{ENVIRONMENT}.yml" )
        data['admin_user_data']['second_account_id'] = second_account_id
        data['admin_user_data']['valid_transaction_id'] = new_transfer_id
        data['admin_user_data']['valid_transaction_amount'] = transfer_amount
        File.open(File.dirname(__FILE__) + "/factory/static/#{ENVIRONMENT}.yml", 'w') do |file|
            file.write(YAML.dump(data))
        end

        puts (
            "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\n" +
            "X\n" +
            "X     Start JMS status ------ #{start_jms_server.code}\n" +
            "X     Initialize DB status -- #{initialize_db.code}\n" +
            "X     Clean DB status ------- #{clean_db.code}\n" +
            "X     New account ID -------- #{second_account_id}\n" +
            "X     #{new_transfer.body.to_s}\n" +
            "X     Transfer ID ----------- #{new_transfer_id}\n" +
            "X\n" +
            "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
        )
    rescue
        puts (
            "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\n" +
            "X\n" +
            "X     ERRO AO CONFIGURAR SERVIDOR\n" +
            "X\n" +
            "X     Start JMS status -------- #{start_jms_server.status.to_s}\n" +
            "X     Initialize DB status ---- #{initialize_db.status.to_s}\n" +
            "X     Clean DB status --------- #{clean_db.status.to_s}\n" +
            "X     Create Account status --- #{create_checking_account.status.to_s}\n" +
            "X     New Transfer status ----- #{new_transfer.status.to_s}\n" +
            "X     Get Transactions status - #{get_transactions.status.to_s}\n" +
            "X\n" +
            "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
        )
        Cucumber.wants_to_quit = true  
    end
end

After do |scenario|
    if scenario.failed?
        screenshot = Capybara.page.save_screenshot "reports/screenshots/sc.png"
        attach(screenshot, 'image/png')

        # gpt_key = Factory::Static.static_data 'gpt_key'
        # client = OpenAI::Client.new(access_token: gpt_key)

        # backtrace = scenario.exception.backtrace.join("\n")
        # failure_message = scenario.exception.message

        # prompt = "Por favor, resuma o erro em um parágrafo: #{failure_message}\n" + backtrace 

        # response = client.chat(
        #     parameters: {
        #         model: "gpt-3.5-turbo",
        #         messages: [{ role: "user", content: prompt }],
        #         temperature: 0.6
        #     }
        # )

        # gpt_response = response.dig("choices", 0, "message", "content")

        # puts gpt_response
        
        # attach(gpt_response, 'text/plain')
    end
end
