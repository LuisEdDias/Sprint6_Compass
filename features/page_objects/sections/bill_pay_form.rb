require_relative 'bill_pay_form_label'

module Sections
    class BillPayForm < SitePrism::Section
        section :bill_pay_form_label, Sections::BillPayFormLabel, '.form2'

        element :select_origin_account, '[name="fromAccountId"] [value="13344"]'
        element :input_payee_name, '[name="payee.name"]'
        element :input_address, '[name="payee.address.street"]'
        element :input_city, '[name="payee.address.city"]'
        element :input_state, '[name="payee.address.state"]'
        element :input_zip_code, '[name="payee.address.zipCode"]'
        element :input_phone, '[name="payee.phoneNumber"]'
        element :input_account, '[name="payee.accountNumber"]'
        element :input_account_confirm, '[name="verifyAccount"]'
        element :input_amount, '[name="amount"]'
        element :btn_send, '.button'

        def complete_bill_pay_form data
            if data != 'empty'
                if data == 'special_character' || data == 'only_numbers'
                    bill_pay_data = Factory::Dynamic.public_send(data + '_form')
                    input_payee_name.set bill_pay_data[:name]
                    input_address.set bill_pay_data[:address]
                    input_city.set bill_pay_data[:city]
                    input_state.set bill_pay_data[:state]
                    input_zip_code.set bill_pay_data[:zip_code]
                    input_phone.set bill_pay_data[:phone]
                    input_account.set bill_pay_data[:account_number]
                    input_account_confirm.set bill_pay_data[:account_number]
                    input_amount.set bill_pay_data[:transfer_amount]
                elsif data == 'letters'
                    bill_pay_data = Factory::Dynamic.valid_data_form
                    input_payee_name.set bill_pay_data[:first_name]
                    input_address.set bill_pay_data[:first_name]
                    input_city.set bill_pay_data[:first_name]
                    input_state.set bill_pay_data[:first_name]
                    input_zip_code.set bill_pay_data[:first_name]
                    input_phone.set bill_pay_data[:first_name]
                    input_account.set bill_pay_data[:first_name]
                    input_account_confirm.set bill_pay_data[:first_name]
                    input_amount.set bill_pay_data[:first_name]
                else
                    bill_pay_data = Factory::Dynamic.valid_data_form
                    input_payee_name.set bill_pay_data[:name]
                    input_address.set bill_pay_data[:address]
                    input_city.set bill_pay_data[:city]
                    input_state.set bill_pay_data[:state]
                    input_zip_code.set bill_pay_data[:zip_code]
                    input_phone.set bill_pay_data[:phone]
                    input_account.set bill_pay_data[:account_number]

                    case data
                    when 'amount_negative'
                        input_account_confirm.set bill_pay_data[:account_number]
                        input_amount.set (0 - bill_pay_data[:transfer_amount])
                    when 'amount_zero'
                        input_account_confirm.set bill_pay_data[:account_number]
                        input_amount.set 0
                    when 'account_numbers_not_match'
                        input_account_confirm.set bill_pay_data[:account_number_two]
                        input_amount.set bill_pay_data[:transfer_amount]
                    else
                        input_account_confirm.set bill_pay_data[:account_number]
                        input_amount.set data
                    end
                end
            end

            select_origin_account.select_option
            btn_send.click
        end
    end
end
