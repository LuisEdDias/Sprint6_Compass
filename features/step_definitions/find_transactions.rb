Dado('que acessa a página de busca por transação') do
    @home.click_link 'find_transactions', 'account_services_menu'
    @find_transactions_page = Pages::FindTransactionsPage.new
end
  
Então('a página de de busca por transações é exibida corretamente') do
    expect(@find_transactions_page.all_there?).to be_truthy
end
  
Quando('busca por transação por id {string}') do |type|
    @find_transactions_page.find_transactions_form.find_transactions_by_id type
end
  
Quando('busca por transação com data específica {string}') do |type|
    @find_transactions_page.find_transactions_form.find_transactions_by_date type
end
  
Quando('busca por transação por período {string}') do |type|
    @find_transactions_page.find_transactions_form.find_transactions_by_date_range type
end
  
Quando('busca por transação por valor {string}') do |type|
    @find_transactions_page.find_transactions_form.find_transactions_by_amount type
end

Então('o resultado da busca é exibido {string}') do |type|
    result = @find_transactions_page.find_transactions_result.expect_transactions_result type
    expect(result).to be_truthy
end
  