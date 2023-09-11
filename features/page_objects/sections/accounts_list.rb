module Sections
    class AccountsList < SitePrism::Section
        element :account_number, 'a'
        elements :account, 'td+td'

        def account_balance
            account[0].text
        end

        def account_available_amount
            account[1].text
        end
    end
end
