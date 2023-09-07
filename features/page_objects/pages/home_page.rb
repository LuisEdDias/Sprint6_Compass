require_relative '../sections/header'

module Pages
    class HomePage < SitePrism::Page
        set_url '/'

        section :header, Sections::Header, 'header'
    end
end
