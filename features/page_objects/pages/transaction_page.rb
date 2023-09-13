require_relative '../sections/top_panel'
require_relative '../sections/header'
require_relative '../sections/footer'
require_relative '../sections/account_services_menu'

module Pages
    class TransactionPage < SitePrism::Page
        set_url '/transaction.htm{?id*}'

        section :top_panel, Sections::TopPanel, '#topPanel'
        section :header, Sections::Header, '#headerPanel'
        section :footer, Sections::Footer, '#footermainPanel'
        section :account_services_menu, Sections::AccountServicesMenu, '#leftPanel'

        elements :transaction_elements, '#rightPanel table tr td+td'

        element :transaction_details_title, '#rightPanel .title'       

        expected_elements :header, :footer, :account_services_menu, :transaction_details_title, :transaction_elements

        def return_transaction_id
            transaction_elements[0].text
        end

        def return_transaction_date
            transaction_elements[1].text
        end

        def return_transaction_description
            transaction_elements[2].text
        end

        def return_transaction_type
            transaction_elements[3].text
        end

        def return_transaction_amount
            transaction_elements[4].text
        end
    end
end
