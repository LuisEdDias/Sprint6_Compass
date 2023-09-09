module Sections
    class UpdateProfileFormLabel < SitePrism::Section
        element :label_first_name, '[ng-if*="firstName"]'
        element :label_last_name, '[ng-if*="lastName"]'
        element :label_address, '[ng-if*="address.street"]'
        element :label_city, '[ng-if*="address.city"]'
        element :label_state, '[ng-if*="address.state"]'
        element :label_zip_code, '[ng-if*="address.zipCode"]'
        
        def label_error_message data
            error_message = Factory::Static.static_data 'form_validation_label'
  
            if data == 'empty'
                label_first_name.has_text?(error_message['first_name_required']) &&
                label_last_name.has_text?(error_message['last_name_required']) &&
                label_address.has_text?(error_message['address_required']) &&
                label_city.has_text?(error_message['city_required']) &&
                label_state.has_text?(error_message['state_required']) &&
                label_zip_code.has_text?(error_message['zip_code_required'])
            elsif data == 'special_character' || data == 'only_numbers'
                label_first_name.has_text?(error_message['invalid_data']) &&
                label_last_name.has_text?(error_message['invalid_data']) &&
                label_address.has_text?(error_message['invalid_data']) &&
                label_city.has_text?(error_message['invalid_data']) &&
                label_state.has_text?(error_message['invalid_data']) &&
                label_zip_code.has_text?(error_message['invalid_data'])
            end
        end
    end
end
