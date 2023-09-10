require_relative '../sections/top_panel'
require_relative '../sections/header'
require_relative '../sections/footer'
require_relative '../sections/account_services_menu'

module Pages
    class AccountDetailsPage < SitePrism::Page
        set_url '/activity.htm'

        section :top_panel, Sections::TopPanel, '#topPanel'
        section :header, Sections::Header, '#headerPanel'
        section :footer, Sections::Footer, '#footermainPanel'
        section :account_services_menu, Sections::AccountServicesMenu, '#leftPanel'

        elements :select_filter_by_month, '#month'
        elements :select_filter_by_transaction_type, '#transactionType option'
        elements :transactions_list, '#transactionTable a'

        element :account_type, '#accountType'
        element :account_number, '#accountId'
        element :account_balance, '#balance'
        element :btn_go, '.form_activity .button'

        expected_elements :header, :footer, :account_services_menu, :account_type, :account_number, :account_balance
    end
end