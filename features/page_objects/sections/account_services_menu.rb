module Sections
    class AccountServicesMenu < SitePrism::Section
        element :welcome_message, '.smallText'
        element :btn_open_account, '[href$="openaccount.htm"]'
        element :btn_accounts_overview, '[href$="overview.htm"]'
        element :btn_transfer_funds, '[href$="transfer.htm"]'
        element :btn_bill_pay, '[href$="billpay.htm"]'
        element :btn_find_transactions, '[href$="findtrans.htm"]'
        element :btn_update_contact_info, '[href$="updateprofile.htm"]'
        element :btn_request_loan, '[href$="requestloan.htm"]'
        element :btn_logout, '[href$="logout.htm"]'

        def click_link_account_services_menu link
            button = 'btn_' + link
            public_send(button).click
        end
    end
end
