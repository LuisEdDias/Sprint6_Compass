module Sections
    class SolutionsMenu < SitePrism::Section
        element :btn_about_us, '[href="about.htm"]'
        element :btn_services, '[href="services.htm"]'
        element :btn_products, '[href$="products.jsp"]'
        element :btn_locations, '[href$="contacts.jsp"]'
        element :btn_admin_page, '[href="admin.htm"]'
    end
end
