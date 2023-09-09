module Sections
    class RegisterFormLabel < SitePrism::Section
        element :label_first_name, '[id="customer.firstName.errors"]'
        element :label_last_name, '[id="customer.lastName.errors"]'
        element :label_address, '[id="customer.address.street.errors"]'
        element :label_city, '[id="customer.address.city.errors"]'
        element :label_state, '[id="customer.address.state.errors"]'
        element :label_zip_code, '[id="customer.address.zipCode.errors"]'
        element :label_ssn, '[id="customer.ssn.errors"]'
        element :label_username, '[id="customer.username.errors"]'
        element :label_password, '[id="customer.password.errors"]'
        element :label_confirm_password, '[id="repeatedPassword.errors"]'
        
        def label_error_message data
            error_message = Factory::Static.static_data 'form_validation_label'
            
            if data == 'empty'
                label_first_name.has_text?(error_message['first_name_required']) &&
                label_last_name.has_text?(error_message['last_name_required']) &&
                label_address.has_text?(error_message['address_required']) &&
                label_city.has_text?(error_message['city_required']) &&
                label_state.has_text?(error_message['state_required']) &&
                label_zip_code.has_text?(error_message['zip_code_required']) &&
                label_ssn.has_text?(error_message['ssn_required']) &&
                label_username.has_text?(error_message['username_required']) &&
                label_password.has_text?(error_message['password_required']) &&
                label_confirm_password.has_text?(error_message['confirm_password_required'])
            elsif data == 'special_character' || data == 'only_numbers'
                label_first_name.has_text?(error_message['invalid_data']) &&
                label_last_name.has_text?(error_message['invalid_data']) &&
                label_address.has_text?(error_message['invalid_data']) &&
                label_city.has_text?(error_message['invalid_data']) &&
                label_state.has_text?(error_message['invalid_data']) &&
                label_zip_code.has_text?(error_message['invalid_data']) &&
                label_ssn.has_text?(error_message['invalid_data'])
            elsif data == 'username_already_exists'
                label_username.has_text?(error_message['username_already_exists'])
            elsif data == 'passwords_not_match'
                label_confirm_password.has_text?(error_message['confirm_password_not_match'])
            end
        end
    end
end
