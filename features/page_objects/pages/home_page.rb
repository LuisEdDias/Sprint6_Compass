require_relative '../sections/top_panel'
require_relative '../sections/header'
require_relative '../sections/footer'
require_relative '../sections/customer_login'
require_relative '../sections/account_services_menu'

module Pages
    class HomePage < SitePrism::Page
        set_url '/'

        section :top_panel, Sections::TopPanel, '#topPanel'
        section :header, Sections::Header, '#headerPanel'
        section :footer, Sections::Footer, '#footermainPanel'
        section :customer_login, Sections::CustomerLogin, '#loginPanel'
        section :account_services_menu, Sections::AccountServicesMenu, '#leftPanel'

        elements :news_list, '.events a'
        
        element :news, '#rightPanel [href="news.htm"]'
        element :atm_services, 'ul.services'
        element :online_services, 'ul.servicestwo'
        element :services, '#rightPanel [href="services.htm"]'
        element :login_error_message, '#rightPanel p'

        expected_elements :header, :footer, :news_list, :atm_services, :online_services

        def click_link link, section
            case section
            when 'home_page'
                public_send(link).click
            when 'header'
                header.click_link_header link
            when 'solutions_menu'
                header.solutions_menu.click_link_solutions_menu link
            when 'customer_login'
                customer_login.click_link_customer_login link
            when 'account_services_menu'
                account_services_menu.click_link_account_services_menu link
            when 'footer'
                footer.click_link_footer link
            end
        end
    end
end
