module Sections
    class TopPanel < SitePrism::Section
        element :logo, '.logo'
        element :logo_admin, '.admin'
    end

    def click_link_top_panel link
        public_send(link).click
    end
end
