require_relative '../sections/top_panel'
require_relative '../sections/header'
require_relative '../sections/footer'
require_relative '../sections/account_services_menu'
require_relative '../sections/accounts_list'

module Pages
    class AccountsOverviewPage < SitePrism::Page
        set_url '/overview.htm'

        sections :accounts_list, Sections::AccountsList, '#accountTable tbody tr.ng-scope'

        section :top_panel, Sections::TopPanel, '#topPanel'
        section :header, Sections::Header, '#headerPanel'
        section :footer, Sections::Footer, '#footermainPanel'
        section :account_services_menu, Sections::AccountServicesMenu, '#leftPanel'

        element :account_total_balance, '#accountTable tbody tr b.ng-binding'

        expected_elements :header, :footer, :account_services_menu, :account_list
    end
end
