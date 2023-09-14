module Sections
    class LoginRecoveryFormLabel < SitePrism::Section
        element :label_first_name, '[id="firstName.errors"]'
        element :label_last_name, '[id="lastName.errors"]'
        element :label_address, '[id="address.street.errors"]'
        element :label_city, '[id="address.city.errors"]'
        element :label_state, '[id="address.state.errors"]'
        element :label_zip_code, '[id="address.zipCode.errors"]'
        element :label_ssn, '[id="ssn.errors"]'
        element :user_not_found_message, '#rightPanel p'
        
        def label_error_message data
            if data == 'empty'
                error_message = Factory::Static.static_data 'form_validation_label'
                label_first_name.has_text?(error_message['first_name_required']) &&
                label_last_name.has_text?(error_message['last_name_required']) &&
                label_address.has_text?(error_message['address_required']) &&
                label_city.has_text?(error_message['city_required']) &&
                label_state.has_text?(error_message['state_required']) &&
                label_zip_code.has_text?(error_message['zip_code_required']) &&
                label_ssn.has_text?(error_message['ssn_required'])
            elsif data == 'special_character' || data == 'only_numbers'
                error_message = Factory::Static.static_data 'message'
                user_not_found_message.has_text?(error_message['login_recovery_not_found'])
            end
        end
    end
end