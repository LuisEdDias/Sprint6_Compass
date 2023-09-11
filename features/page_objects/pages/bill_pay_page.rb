require_relative '../sections/top_panel'
require_relative '../sections/header'
require_relative '../sections/footer'
require_relative '../sections/account_services_menu'
require_relative '../sections/bill_pay_form'

module Pages
    class BillPayPage < SitePrism::Page
        set_url '/billpay.htm'

        section :top_panel, Sections::TopPanel, '#topPanel'
        section :header, Sections::Header, '#headerPanel'
        section :footer, Sections::Footer, '#footermainPanel'
        section :account_services_menu, Sections::AccountServicesMenu, '#leftPanel'
        section :bill_pay_form, Sections::BillPayForm, '[ng-app="BillPayApp"]'

        element :payment_success_message, '#rightPanel [ng-show="showResult"]'
        
        expected_elements :header, :footer, :account_services_menu, :bill_pay_form
    end
end
