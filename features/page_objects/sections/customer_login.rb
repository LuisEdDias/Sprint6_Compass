module Sections
    class CustomerLogin < SitePrism::Section
        element :input_username, '[name="username"]'
        element :input_password, '[name="password"]'
        element :btn_login, '[value="Log In"]'
        element :btn_login_recovery, '[href="lookup.htm"]'
        element :btn_register, '[href="register.htm"]'

        def click_link_customer_login link
            button = 'btn_' + link
            public_send(button).click
        end

        def login username, password
            case username
            when 'valid'
                admin_username = Factory::Static.static_data('admin_user_data')['username']
                input_username.set admin_username
            when 'invalid'
                invalid_username = Factory::Dynamic.valid_data_form[:username]
                input_username.set invalid_username
            end

            case password
            when 'valid'
                admin_password = Factory::Static.static_data('admin_user_data')['password']
                input_password.set admin_password
            when 'invalid'
                invalid_password = Factory::Dynamic.valid_data_form[:password]
                input_password.set invalid_password
            end

            btn_login.click
        end
    end
end
