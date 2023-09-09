require_relative '../sections/top_panel'
require_relative '../sections/header'
require_relative '../sections/footer'
require_relative '../sections/customer_login'
require_relative '../sections/login_recovery_form'

module Pages
    class ForgotLoginPage < SitePrism::Page
        set_url '/lookup.htm'

        section :top_panel, Sections::TopPanel, '#topPanel'
        section :header, Sections::Header, '#headerPanel'
        section :footer, Sections::Footer, '#footermainPanel'
        section :customer_login, Sections::CustomerLogin, '#loginPanel'
        section :login_recovery_form, Sections::LoginRecoveryForm, '#lookupForm'

        element :login_recovery_message, '#rightPanel p'
        element :login_recovery_success_message, '#rightPanel p+p'

        expected_elements :header, :footer, :login_recovery_form
    end
end
