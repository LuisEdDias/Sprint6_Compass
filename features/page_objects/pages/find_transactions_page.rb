require_relative '../sections/top_panel'
require_relative '../sections/header'
require_relative '../sections/footer'
require_relative '../sections/account_services_menu'
require_relative '../sections/find_transactions_form'
require_relative '../sections/find_transactions_result'

module Pages
    class FindTransactionsPage < SitePrism::Page
        set_url '/findtrans.htm'

        section :top_panel, Sections::TopPanel, '#topPanel'
        section :header, Sections::Header, '#headerPanel'
        section :footer, Sections::Footer, '#footermainPanel'
        section :account_services_menu, Sections::AccountServicesMenu, '#leftPanel'
        section :find_transactions_form, Sections::FindTransactionsForm, '#rightPanel form'
        section :find_transactions_result, Sections::FindTransactionsResult, '#rightPanel'

        expected_elements :header, :footer, :account_services_menu, :find_transactions_form
    end
end
