module Sections
    class FindTransactionsResult < SitePrism::Section

        element :find_transactions_error, '#rightPanel p'

        elements :transactions_result_list, '#transactionTable tbody tr'

        def expect_transactions_result type
            case type
            when 'valid'
                !transactions_result_list.empty?
            when 'invalid'
                transactions_result_list.empty?
            when 'letters'
                find_transactions_error.visible?
            when 'special_character'
                find_transactions_error.visible?
            end 
        end
    end
end
