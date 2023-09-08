module Sections
    class Footer < SitePrism::Section
        element :btn_home, '[href$="index.htm"]'
        element :btn_about_us, '[href="about.htm"]'
        element :btn_services, '[href="services.htm"]'
        element :btn_products, '[href$="products.jsp"]'
        element :btn_locations, '[href$="contacts.jsp"]'
        element :btn_forum, '[href*="forum"]'
        element :btn_site_map, '[href$="sitemap.htm"]'
        element :btn_contact_us, '[href="contact.htm"]'

        def click_link_footer link
            button = 'btn_' + link
            public_send(button).click
        end
    end
end
