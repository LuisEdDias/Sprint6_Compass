require_relative '../sections/header'
require_relative '../sections/footer'
require_relative '../sections/customer_login'
require_relative '../sections/register_form'

module Pages
    class RegisterPage < SitePrism::Page
        set_url '/register.htm'

        section :header, Sections::Header, '#headerPanel'
        section :footer, Sections::Footer, '#footermainPanel'
        section :customer_login, Sections::CustomerLogin, '#loginPanel'
        section :register_form, Sections::RegisterForm, '#customerForm'

        element :account_register_success_message, '#rightPanel p'

        expected_elements :header, :footer, :register_form
    end
end
