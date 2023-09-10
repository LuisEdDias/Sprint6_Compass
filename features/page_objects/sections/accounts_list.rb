module Sections
    class AccountsList < SitePrism::Section
        element :account_number, 'a'
        element :account_balance, 'td+td'
        element :account_available, 'td+td+td'
    end
end
