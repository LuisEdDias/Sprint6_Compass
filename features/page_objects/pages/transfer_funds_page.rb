require_relative '../sections/top_panel'
require_relative '../sections/header'
require_relative '../sections/footer'
require_relative '../sections/account_services_menu'

module Pages
    class TransferFundsPage < SitePrism::Page
        set_url '/transfer.htm'

        section :top_panel, Sections::TopPanel, '#topPanel'
        section :header, Sections::Header, '#headerPanel'
        section :footer, Sections::Footer, '#footermainPanel'
        section :account_services_menu, Sections::AccountServicesMenu, '#leftPanel'
        
        elements :select_origin_account, '#fromAccountId option'
        elements :select_target_account, '#toAccountId option'

        element :input_transfer_amount, '#amount'
        element :transfer_amount_label, '[id="amount.errors"]'
        element :btn_transfer, '#rightPanel .button'
        element :transfer_success_message, '#rightPanel h1'
        
        expected_elements :header, :footer, :account_services_menu, :select_origin_account, :select_target_account, :input_transfer_amount
        
        def transfer_funds data
            SELENIUM_WAIT.until { !page.has_css? 'option[label="undefined"]' }
            case data
            when 'amount_empty'
                select_origin_account.first.select_option
                select_target_account.last.select_option
            when 'amount_special_character'
                transfer_amount = Factory::Dynamic.special_character_form
                input_transfer_amount.set transfer_amount[:transfer_amount]
                select_origin_account.first.select_option
                select_target_account.last.select_option
            when 'amount_letters'
                transfer_amount = Factory::Dynamic.valid_data_form
                input_transfer_amount.set transfer_amount[:first_name]
                select_origin_account.first.select_option
                select_target_account.last.select_option
            when 'amount_negative'
                transfer_amount = Factory::Dynamic.valid_data_form
                input_transfer_amount.set (0 - transfer_amount[:transfer_amount])
                select_origin_account.first.select_option
                select_target_account.last.select_option
            when 'amount_zero'
                input_transfer_amount.set 0
                select_origin_account.first.select_option
                select_target_account.last.select_option
            when 'account_same_origin_destination'
                transfer_amount = Factory::Dynamic.valid_data_form
                input_transfer_amount.set transfer_amount[:transfer_amount]
                select_origin_account.first.select_option
                select_target_account.first.select_option
            else
                input_transfer_amount.set data
                select_origin_account.last.select_option
                select_target_account.first.select_option
            end
            
            btn_transfer.click
        end

        def transfer_funds_error data
            label_error = Factory::Static.static_data 'form_validation_label'
            if data == 'amount_empty'
                transfer_amount_label.has_text? label_error['empty_amount']
            elsif data == 'amount_special_character' || data == 'amount_letters' || data == 'amount_negative' || data == 'amount_zero'
                transfer_amount_label.has_text? label_error['invalid_amount']
            elsif data == 'account_same_origin_destination'
                transfer_amount_label.has_text? label_error['invalid_account']
            end
        end
    end
end
