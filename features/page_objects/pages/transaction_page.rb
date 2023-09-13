require_relative '../sections/top_panel'
require_relative '../sections/header'
require_relative '../sections/footer'
require_relative '../sections/account_services_menu'

module Pages
    class TransactionPage < SitePrism::Page
        set_url '/transaction.htm'

        section :top_panel, Sections::TopPanel, '#topPanel'
        section :header, Sections::Header, '#headerPanel'
        section :footer, Sections::Footer, '#footermainPanel'
        section :account_services_menu, Sections::AccountServicesMenu, '#leftPanel'

        elements :transaction_elements, '#rightPanel table tr'

        element :transaction_details_title, '#rightPanel .title'       

        expected_elements :header, :footer, :account_services_menu, :transaction_details_title, :transaction_elements
    end
end
