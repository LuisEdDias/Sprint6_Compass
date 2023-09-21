require_relative 'register_form_label'

module Sections
    class RegisterForm < SitePrism::Section
        section :register_form_label, Sections::RegisterFormLabel, '.form2'

        element :input_first_name, '[name="customer.firstName"]'
        element :input_last_name, '[name="customer.lastName"]'
        element :input_address, '[name="customer.address.street"]'
        element :input_city, '[name="customer.address.city"]'
        element :input_state, '[name="customer.address.state"]'
        element :input_zip_code, '[name="customer.address.zipCode"]'
        element :input_phone, '[name="customer.phoneNumber"]'
        element :input_ssn, '[name="customer.ssn"]'
        element :input_username, '[name="customer.username"]'
        element :input_password, '[name="customer.password"]'
        element :input_confirm_password, '[name="repeatedPassword"]'
        element :btn_register, '.button'

        def complete_registration_form data
            if data != 'empty'
                if data == 'special_character' || data == 'only_numbers'
                    registration_form = Factory::Dynamic.public_send(data + '_form')
                    input_first_name.set registration_form[:first_name]
                    input_last_name.set registration_form[:last_name]
                    input_address.set registration_form[:address]
                    input_city.set registration_form[:city]
                    input_state.set registration_form[:state]
                    input_zip_code.set registration_form[:zip_code]
                    input_phone.set registration_form[:phone]
                    input_ssn.set registration_form[:ssn]
                    input_username.set registration_form[:username]
                    input_password.set registration_form[:password]
                    input_confirm_password.set registration_form[:password]
                else
                    registration_form = Factory::Dynamic.valid_data_form
                    input_first_name.set registration_form[:first_name]
                    input_last_name.set registration_form[:last_name]
                    input_address.set registration_form[:address]
                    input_city.set registration_form[:city]
                    input_state.set registration_form[:state]
                    input_zip_code.set registration_form[:zip_code]
                    input_phone.set registration_form[:phone]
                    input_ssn.set registration_form[:ssn]

                    case data
                    when 'username_already_exists'
                        admin_user = Factory::Static.static_data 'admin_user_data'
                        input_username.set admin_user['username']
                        input_password.set registration_form[:password]
                        input_confirm_password.set registration_form[:password]
                    when 'passwords_not_match'
                        input_username.set registration_form[:username]
                        input_password.set registration_form[:password]
                        input_confirm_password.set registration_form[:password_two]
                    when 'valid_data'
                        input_username.set registration_form[:username]
                        input_password.set registration_form[:password]
                        input_confirm_password.set registration_form[:password]
                    end
                end
            end
            
            btn_register.click
        end
    end
end