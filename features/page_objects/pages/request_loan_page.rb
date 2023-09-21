require_relative '../sections/header'
require_relative '../sections/footer'
require_relative '../sections/account_services_menu'

module Pages
    class RequestLoanPage < SitePrism::Page
        set_url '/requestloan.htm'

        section :header, Sections::Header, '#headerPanel'
        section :footer, Sections::Footer, '#footermainPanel'
        section :account_services_menu, Sections::AccountServicesMenu, '#leftPanel'

        element :select_admin_account_down_payment, '#fromAccountId [value="13344"]'
        element :input_loan_amount, '#amount'
        element :input_down_payment, '#downPayment'
        element :btn_apply_now, '#rightPanel .button'
        element :request_loan_error_message, '#rightPanel .error'
        element :request_loan_status, '#loanStatus'
        element :btn_new_account, '#newAccountId'

        expected_elements :header, :footer, :account_services_menu, :input_loan_amount, :input_down_payment

        def request_loan_submit data
            if data != 'empty'
                case data
                when 'special_character'
                    loan_data = Factory::Dynamic.special_character_form
                    input_loan_amount.set loan_data[:transfer_amount]
                    input_down_payment.set loan_data[:transfer_amount]
                when 'letters'
                    loan_data = Factory::Dynamic.valid_data_form
                    input_loan_amount.set loan_data[:first_name]
                    input_down_payment.set loan_data[:first_name]
                when 'negative'
                    loan_data = Factory::Static.static_data('valid_loan_data')
                    input_loan_amount.set (0 - loan_data['loan_amount'].to_i)
                    input_down_payment.set (0 - loan_data['down_payment'].to_i)
                when 'zero'
                    input_loan_amount.set 0
                    input_down_payment.set 0
                when 'valid_data'
                    loan_data = Factory::Static.static_data 'valid_loan_data'
                    input_loan_amount.set loan_data['loan_amount']
                    input_down_payment.set loan_data['down_payment']
                end
            end

            select_admin_account_down_payment.click
            btn_apply_now.click
        end
    end
end
