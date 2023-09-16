require 'openai'

After do |scenario|
    if scenario.failed?
        screenshot = Capybara.page.save_screenshot "reports/screenshots/sc.png"
        attach(screenshot, 'image/png')

        # gpt_key = Factory::Static.static_data('gpt_key')
        # client = OpenAI::Client.new(access_token: gpt_key)

        # backtrace = scenario.exception.backtrace.join("\n")
        # failure_message = scenario.exception.message

        # prompt = (
        #     "Por favor, analise o erro: #{failure_message}\n" + backtrace  
        # )
                

        # response = client.chat(
        #     parameters: {
        #         model: "gpt-3.5-turbo",
        #         messages: [{ role: "user", content: prompt }],
        #         temperature: 0.7
        #     }
        # )

        # gpt_response = response.dig("choices", 0, "message", "content")

        # puts gpt_response
        
        # attach(gpt_response, 'text/plain')
    end
end
