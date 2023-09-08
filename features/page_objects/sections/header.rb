require_relative 'solutions_menu'

module Sections
    class Header < SitePrism::Section
        section :solutions_menu, Sections::SolutionsMenu, '.leftmenu'

        element :btn_home, '.home'
        element :btn_about_us, '.aboutus'
        element :btn_contact_us, '.contact'

        def click_link_header link
                button = 'btn_' + link
                public_send(button).click
        end
    end
end
