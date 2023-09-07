module Sections
    class CustomerLogin < SitePrism::Section
        element :input_username, '[name="username"]'
        element :input_password, '[name="password"]'
        element :btn_login, '[value="Log In"]'
        element :link_login_recovery, '[href="lookup.htm"]'
        element :link_register, '[href="register.htm"]'
    end
end
