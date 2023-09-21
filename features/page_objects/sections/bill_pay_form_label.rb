module Sections
    class BillPayFormLabel < SitePrism::Section
        element :label_payee_name_empty, '[ng-show$="name"]'
        element :label_address_empty, '[ng-show$="address"]'
        element :label_city_empty, '[ng-show$="city"]'   
        element :label_state_empty, '[ng-show$="state"]' 
        element :label_zip_code_empty, '[ng-show$="zipCode"]'
        element :label_phone_empty, '[ng-show$="phoneNumber"]'
        element :label_account_empty, '[ng-show*="account"][ng-show*="empty"]'
        element :label_account_invalid, '[ng-show*="account"][ng-show*="invalid"]'
        element :label_account_confirme_empty, '[ng-show*="verifyAccount"][ng-show*="empty"]'
        element :label_account_confirme_invalid, '[ng-show*="verifyAccount"][ng-show*="invalid"]'
        element :label_account_confirme_not_match, '[ng-show*="verifyAccount"][ng-show*="mismatch"]'
        element :label_amount_empty, '[ng-show*="amount"][ng-show*="empty"]'
        element :label_amount_invalid, '[ng-show*="amount"][ng-show*="invalid"]'

        element :label_payee_name_invalid, 'SEM VALIDAÇÃO'
        element :label_address_invalid, 'SEM VALIDAÇÃO'
        element :label_city_invalid, 'SEM VALIDAÇÃO'
        element :label_state_invalid, 'SEM VALIDAÇÃO'
        element :label_zip_code_invalid, 'SEM VALIDAÇÃO'
        element :label_phone_invalid, 'SEM VALIDAÇÃO'

        def label_error_message data
            case data
            when 'empty'
                label_payee_name_empty.visible? &&
                label_address_empty.visible? &&
                label_city_empty.visible? &&
                label_state_empty.visible? &&
                label_zip_code_empty.visible? &&
                label_phone_empty.visible? &&
                label_account_empty.visible? &&
                label_account_confirme_empty.visible? &&
                label_amount_empty.visible?
            when 'special_character' 
                # SEM VALIDAÇÃO
                
                #label_payee_name_invalid.visible? &&
                #label_address_invalid.visible? &&
                #label_city_invalid.visible? &&
                #label_state_invalid.visible? &&
                #label_zip_code_invalid.visible? &&
                #label_phone_invalid.visible? &&
                label_account_invalid.visible? &&
                label_account_confirme_invalid.visible? &&
                label_amount_invalid.visible?
            when 'letters'
                # SEM VALIDAÇÃO

                #label_zip_code_invalid.visible? &&
                #label_phone_invalid.visible? &&
                label_account_invalid.visible? &&
                label_account_confirme_invalid.visible? &&
                label_amount_invalid.visible?
            when 'only_numbers'
                # SEM VALIDAÇÃO

                #label_payee_name_invalid.visible? &&
                #label_address_invalid.visible? &&
                #label_city_invalid.visible? &&
                #label_state_invalid.visible?
                false
            when 'amount_negative'
                label_amount_invalid.visible?
            when 'amount_zero'
                label_amount_invalid.visible?
            when 'account_numbers_not_match'
                label_account_confirme_not_match.visible?
            end
        end
    end
end
