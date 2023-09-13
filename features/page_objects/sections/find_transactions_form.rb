require 'date'
module Sections
    class FindTransactionsForm < SitePrism::Section

        elements :select_origin_account, '#accountId option'

        element :select_admin_account, '#accountId [value="13344"]'
        element :input_transaction_id, '[id$="transactionId"]'
        element :btn_find_by_id, '[ng-click*="ID"]'
        element :input_transaction_date, '[id$="onDate"]'
        element :btn_find_by_date, '[ng-click*="DATE"][ng-click*="DATE"]:not([ng-click*="DATE_RANGE"])'
        element :input_transaction_from_date, '[id$="fromDate"]'
        element :input_transaction_to_date, '[id$="toDate"]'
        element :btn_find_by_date_range, '[ng-click*="DATE_RANGE"]'
        element :input_transaction_amount, '[id$="amount"]'
        element :btn_find_by_amount, '[ng-click*="AMOUNT"]'

        def find_transactions_by_id type, valid_transaction_id
            sleep 1
            data = Factory::Dynamic.valid_data_form
            select_admin_account.click
            case type
            when 'valid'
                input_transaction_id.set valid_transaction_id
            when 'invalid'
                input_transaction_id.set data[:account_number]
            when 'letters'
                input_transaction_id.set data[:first_name]
            when 'special_character'
                input_transaction_id.set data[:password]
            end
            btn_find_by_id.click
        end

        def find_transactions_by_date type
            sleep 1
            current_date = Time.new
            data = Factory::Dynamic.valid_data_form
            select_admin_account.click
            case type
            when 'valid'
                input_transaction_date.set current_date.strftime("%m-%d-%Y")
            when 'invalid'
                input_transaction_date.set current_date.strftime("%d-%m-%Y")
            when 'letters'
                input_transaction_date.set data[:first_name]
            when 'special_character'
                input_transaction_date.set data[:password]
            end
            btn_find_by_date.click
        end

        def find_transactions_by_date_range type
            sleep 1
            current_date = Time.new
            current_month = current_date.month.to_s
            current_year = current_date.year.to_s
            data = Factory::Dynamic.valid_data_form
            select_admin_account.click
            case type
            when 'valid'
                input_transaction_from_date.set (current_month + '-01-' + current_year)
                input_transaction_to_date.set current_date.strftime("%m-%d-%Y")
            when 'invalid'
                input_transaction_from_date.set current_date.strftime("%d-%m-%Y")
                input_transaction_to_date.set current_date.strftime("%d-%m-%Y")
            when 'letters'
                input_transaction_from_date.set data[:first_name]
                input_transaction_to_date.set data[:first_name]
            when 'special_character'
                input_transaction_from_date.set data[:password]
                input_transaction_to_date.set data[:password]
            end
            btn_find_by_date_range.click
        end

        def find_transactions_by_amount type, amount
            sleep 1
            data = Factory::Dynamic.valid_data_form
            select_admin_account.click
            case type
            when 'valid'
                input_transaction_amount.set amount
            when 'invalid'
                input_transaction_amount.set '$000'
            when 'letters'
                input_transaction_amount.set data[:first_name]
            when 'special_character'
                input_transaction_amount.set data[:password]
            end
            btn_find_by_amount.click
        end
    end
end
