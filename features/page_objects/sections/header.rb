require_relative 'solutions_menu'

module Sections
    class Header < SitePrism::Section
        section :solutions_menu, Sections::SolutionsMenu, '.leftmenu'

        element :btn_home, '.home'
        element :btn_about_us, '.aboutus'
        element :btn_contact, '.contact'
    end
end
