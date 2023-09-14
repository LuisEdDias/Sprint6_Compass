module Pages
    class AdminPage < SitePrism::Page
        set_url '/admin.htm'

        element :btn_db_initialize, 'button[value="INIT"]'
        element :btn_db_clean, 'button[value="CLEAN"]'
        element :btn_jms_start, 'input[value="Startup"]'
        element :select_jdbc, 'input[value="jdbc"]'
        element :input_soap_endpoint, '#soapEndpoint'
        element :input_rest_endpoint, '#restEndpoint'
        element :input_loan_endpoint, '#endpoint'
        element :input_initial_balance, '#initialBalance'
        element :input_minimum_balance, '#minimumBalance'
        element :select_loan_provider_local, '#loanProvider [value="local"]'
        element :select_loan_processor_down_payment, '#loanProcessor [value="down"]' 
        element :input_loan_processor_threshold, '#loanProcessorThreshold'
        element :btn_submit, '.button[value="Submit"]'

        def server_config
            if btn_jms_start.visible?
                btn_jms_start.click
            end

            select_jdbc.click
            input_soap_endpoint.set ''
            input_rest_endpoint.set ''
            input_loan_endpoint.set ''
            input_initial_balance.set '5000'
            input_minimum_balance.set '100'
            select_loan_provider_local.click
            select_loan_processor_down_payment.click
            input_loan_processor_threshold.set '5'
            btn_submit.click

            if btn_db_initialize.visible?
                btn_db_initialize.click
            end
    
            if btn_db_clean.visible?
                btn_db_clean.click
            end
        end
    end
end
