require_relative 'login_recovery_form_label'

module Sections
    class LoginRecoveryForm < SitePrism::Section
        section :login_recovery_form_label, Sections::LoginRecoveryFormLabel, '.form2'

        element :input_first_name, '[name="firstName"]'
        element :input_last_name, '[name="lastName"]'
        element :input_address, '[name="address.street"]'
        element :input_city, '[name="address.city"]'
        element :input_state, '[name="address.state"]'
        element :input_zip_code, '[name="address.zipCode"]'
        element :input_ssn, '[name="ssn"]'
        element :btn_find_my_login, '.button'


        def complete_recovery_form data
            if data != 'empty'
                if data == 'special_character' || data == 'only_numbers'
                    login_recovery_form = Factory::Dynamic.public_send(data + '_form')
                    input_first_name.set login_recovery_form[:first_name]
                    input_last_name.set login_recovery_form[:last_name]
                    input_address.set login_recovery_form[:address]
                    input_city.set login_recovery_form[:city]
                    input_state.set login_recovery_form[:state]
                    input_zip_code.set login_recovery_form[:zip_code]
                    input_ssn.set login_recovery_form[:ssn]
                elsif data == 'user_not_exists'
                    login_recovery_form = Factory::Dynamic.valid_data_form
                    input_first_name.set login_recovery_form[:first_name]
                    input_last_name.set login_recovery_form[:last_name]
                    input_address.set login_recovery_form[:address]
                    input_city.set login_recovery_form[:city]
                    input_state.set login_recovery_form[:state]
                    input_zip_code.set login_recovery_form[:zip_code]
                    input_ssn.set login_recovery_form[:ssn]
                elsif data == 'valid_user_data'
                    valid_user_data = Factory::Static.static_data 'valid_user_data'
                    input_first_name.set valid_user_data['first_name']
                    input_last_name.set valid_user_data['last_name']
                    input_address.set valid_user_data['address']
                    input_city.set valid_user_data['city']
                    input_state.set valid_user_data['state']
                    input_zip_code.set valid_user_data['zip_code']
                    input_ssn.set valid_user_data['ssn']
                end
            end

            btn_find_my_login.click
        end
    end
end
