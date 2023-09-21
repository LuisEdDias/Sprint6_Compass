require_relative '../sections/top_panel'
require_relative '../sections/header'
require_relative '../sections/footer'
require_relative '../sections/account_services_menu'

module Pages
    class OpenAccountPage < SitePrism::Page
        set_url '/openaccount.htm'

        section :top_panel, Sections::TopPanel, '#topPanel'
        section :header, Sections::Header, '#headerPanel'
        section :footer, Sections::Footer, '#footermainPanel'
        section :account_services_menu, Sections::AccountServicesMenu, '#leftPanel'

        elements :select_origin_account, '#fromAccountId option'
        elements :select_type_account, '#type option'

        element :select_type_acc, '#type'
        element :btn_open_account, '#rightPanel .button'
        element :open_account_success_message, '#rightPanel p'
        element :new_account_link, '#newAccountId'

        expected_elements :header, :footer, :account_services_menu, :set_checking_account, :set_savings_account, :btn_open_account
    end
end
