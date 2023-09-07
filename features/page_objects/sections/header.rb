module Sections
    class Header < SitePrism::Section
        section :solutions_menu, '.leftmenu'

        element :btn_home, '.home'
        element :btn_about, '.aboutus'
        element :btn_contact, '.contact'
    end
end
