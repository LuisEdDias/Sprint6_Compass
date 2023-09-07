require_relative '../sections/header'

module Pages
    class HomePage < SitePrism::Page
        set_url '/'

        section :top_panel, Sections::TopPanel, '#topPanel'
        section :header, Sections::Header, '#headerPanel'
        section :footer, Sections::Footer, '#footermainPanel'
        section :customer_login, Sections::CustomerLogin, '#loginPanel'
        section :account_services_menu, Sections::AccountServicesMenu, '#leftPanel'

        elements :news_list, '.events a'
        element :btn_news_read_more, '#rightPanel [href="news.htm"]'
        element :atm_services, 'ul.services'
        element :online_services, 'ul.servicestwo'
        element :btn_services_read_more, '#rightPanel [href="services.htm"]'
    end
end
