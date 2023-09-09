require_relative '../sections/top_panel'
require_relative '../sections/header'
require_relative '../sections/footer'
require_relative '../sections/update_profile_form'

module Pages
    class UpdateProfilePage < SitePrism::Page
        set_url '/updateprofile.htm'

        section :top_panel, Sections::TopPanel, '#topPanel'
        section :header, Sections::Header, '#headerPanel'
        section :footer, Sections::Footer, '#footermainPanel'
        section :update_profile_form, Sections::UpdateProfileForm, '[name="contact"]'

        element :update_profile_message, '#rightPanel p'

        expected_elements :header, :footer, :update_profile_form
    end
end
