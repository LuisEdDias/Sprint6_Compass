require_relative '../sections/top_panel'
require_relative '../sections/header'
require_relative '../sections/footer'
require_relative '../sections/customer_login'
require_relative '../sections/login_recovery_form'

module Pages
    class ForgotLoginPage < SitePrism::Page
        set_url '/lookup.htm'

        section :top_panel, Sections::TopPanel, '#topPanel'
        section :header, Sections::Header, '#headerPanel'
        section :footer, Sections::Footer, '#footermainPanel'
        section :customer_login, Sections::CustomerLogin, '#loginPanel'
        section :login_recovery_form, Sections::LoginRecoveryForm, '#lookupForm'

        element :login_recovery_message,         '#rightPanel p'
        element :login_recovery_success_message, '#rightPanel p+p'

        expected_elements :header, :footer, :login_recovery_form

        def error_message data
            if data == 'empty'
                error_message = Factory::Static.static_data 'form_validation_label'
                login_recovery_form.label_first_name.has_text?(error_message['first_name_required']) &&
                login_recovery_form.label_last_name.has_text?(error_message['last_name_required']) &&
                login_recovery_form.label_address.has_text?(error_message['address_required']) &&
                login_recovery_form.label_city.has_text?(error_message['city_required']) &&
                login_recovery_form.label_state.has_text?(error_message['state_required']) &&
                login_recovery_form.label_zip_code.has_text?(error_message['zip_code_required']) &&
                login_recovery_form.label_ssn.has_text?(error_message['ssn_required'])
            elsif data == 'special_character' || data == 'only_numbers'
                error_message = Factory::Static.static_data 'message'
                login_recovery_message.has_text?(error_message['login_recovery_not_found'])
            end
        end
    end
end
