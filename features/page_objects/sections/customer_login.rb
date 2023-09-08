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
    end
end
