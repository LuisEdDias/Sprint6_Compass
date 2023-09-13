require_relative '../sections/top_panel'
require_relative '../sections/header'
require_relative '../sections/footer'
require_relative '../sections/account_services_menu'
require 'date'

module Pages
    class AccountDetailsPage < SitePrism::Page
        set_url '/activity.htm{?id*}'

        section :top_panel, Sections::TopPanel, '#topPanel'
        section :header, Sections::Header, '#headerPanel'
        section :footer, Sections::Footer, '#footermainPanel'
        section :account_services_menu, Sections::AccountServicesMenu, '#leftPanel'

        elements :select_filter_by_month, '#month option'
        elements :select_filter_by_transaction_type, '#transactionType option'
        elements :transactions_list, '#transactionTable a'
        elements :credit_transactions, '#transactionTable [ng-if*="Credit"]'
        elements :debit_transactions, '#transactionTable [ng-if*="Debit"]'
        elements :amount_transactions, '#transactionTable td+td.ng-binding'

        element :transactions_table, '#transactionTable'
        element :transactions_not_found, '#rightPanel p'
        element :account_type, '#accountType'
        element :account_number, '#accountId'
        element :account_balance, '#balance'
        element :btn_go, '.form_activity .button'

        expected_elements :header, :footer, :account_services_menu, :account_type, :account_number, :account_balance

        def filter_by type
            current_date = Time.new
            current_month = current_date.month
            case type
            when 'credit'
                select_filter_by_transaction_type[1].click
            when 'debit'
                select_filter_by_transaction_type[2].click
            when 'valid'
                select_filter_by_month[current_month].click
            when 'invalid'
                if current_month == 1
                    select_filter_by_month[current_month + 1].click
                else
                    select_filter_by_month[current_month - 1].click
                end
            end
            btn_go.click
        end

        def filter_return type
            sleep 1
            case type
            when 'credit'
                credit_transactions.all? { |item| item.has_text?(/\S/) }
            when 'debit'
                debit_transactions.all? { |item| item.has_text?(/\S/) }
            when 'valid'
                transactions_table.visible?
            when 'invalid'
                message = Factory::Static.static_data('message')['no_transactions_found']
                transactions_not_found.has_text?(message)
            end
        end
    end
end
