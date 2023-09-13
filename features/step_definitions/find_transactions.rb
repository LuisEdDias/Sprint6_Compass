Dado('que acessa a página de busca por transação') do
    @home.click_link 'find_transactions', 'account_services_menu'
    @find_transactions_page = Pages::FindTransactionsPage.new
    @admin_account_id = Factory::Static.static_data('admin_user_data')['account_id']
    @account_datails_page = Pages::AccountDetailsPage.new
end
  
Então('a página de de busca por transações é exibida corretamente') do
    expect(@find_transactions_page.all_there?).to be_truthy
end
  
Quando('busca por transação por id {string}') do |type|
    @account_datails_page.load(id: @admin_account_id)
    @account_datails_page.transactions_list.first.click
    @transaction_page = Pages::TransactionPage.new
    valid_transaction_id = @transaction_page.return_transaction_id
    @find_transactions_page.load
    @find_transactions_page.find_transactions_form.find_transactions_by_id type, valid_transaction_id
end
  
Quando('busca por transação com data específica {string}') do |type|
    @find_transactions_page.find_transactions_form.find_transactions_by_date type
end
  
Quando('busca por transação por período {string}') do |type|
    @find_transactions_page.find_transactions_form.find_transactions_by_date_range type
end
  
Quando('busca por transação por valor {string}') do |type|
    @account_datails_page.load(id: @admin_account_id)
    valid_transaction_amount = @account_datails_page.amount_transactions.first.text.gsub('$', '')
    @find_transactions_page.load
    @find_transactions_page.find_transactions_form.find_transactions_by_amount type, valid_transaction_amount
end

Então('o resultado da busca é exibido {string}') do |type|
    result = @find_transactions_page.find_transactions_result.expect_transactions_result type
    expect(result).to be_truthy
end
  