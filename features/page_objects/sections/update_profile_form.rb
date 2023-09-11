require_relative 'update_profile_form_label'

module Sections
    class UpdateProfileForm < SitePrism::Section
        section :update_profile_form_label, Sections::UpdateProfileFormLabel, '.form2'
        
        element :input_first_name, '[name="customer.firstName"]'
        element :input_last_name, '[name="customer.lastName"]'
        element :input_address, '[name="customer.address.street"]'
        element :input_city, '[name="customer.address.city"]'
        element :input_state, '[name="customer.address.state"]'
        element :input_zip_code, '[name="customer.address.zipCode"]'
        element :input_phone, '[name="customer.phoneNumber"]'

        element :btn_update_profile, '.button'

        def complete_update_profile_form data
            SELENIUM_WAIT.until { !input_first_name.value.empty? }
            if data == 'empty'
                input_first_name.set ''
                input_last_name.set ''
                input_address.set ''
                input_city.set ''
                input_state.set ''
                input_zip_code.set ''
                input_phone.set ''
            elsif data == 'special_character' || data == 'only_numbers'
                registration_form = Factory::Dynamic.public_send(data + '_form')
                input_first_name.set registration_form[:first_name]
                input_last_name.set registration_form[:last_name]
                input_address.set registration_form[:address]
                input_city.set registration_form[:city]
                input_state.set registration_form[:state]
                input_zip_code.set registration_form[:zip_code]
                input_phone.set registration_form[:phone]
            elsif data == 'valid_data'
                registration_form = Factory::Dynamic.valid_data_form
                input_first_name.set registration_form[:first_name]
                input_last_name.set registration_form[:last_name]
                input_address.set registration_form[:address]
                input_city.set registration_form[:city]
                input_state.set registration_form[:state]
                input_zip_code.set registration_form[:zip_code]
                input_phone.set registration_form[:phone]
            end
            
            btn_update_profile.click
        end
    end
end
