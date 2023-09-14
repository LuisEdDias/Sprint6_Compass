Dado('que acessa a página de visualização geral das contas') do
    @home.click_link 'accounts_overview', 'account_services_menu'
    @accounts_overview = Pages::AccountsOverviewPage.new
end
  
Então('a página de visualização geral das contas é exibida corretamente') do
    expect(@accounts_overview.all_there?).to be_truthy
end
  
Dado('acessa uma conta específica') do
    @accounts_overview.select_admin_account.click
    @account_datails_page = Pages::AccountDetailsPage.new
end
  
Então('são exibidas as movimentações da conta') do
    expect(@account_datails_page.all_there?).to be_truthy
end
  
Quando('filtra as movimentações por tipo {string}') do |type|
    @account_datails_page.filter_by type
end
  
Então('a lista de movimentações exibe o resultado corretamente {string}') do |type|
    result = @account_datails_page.filter_return type
    expect(result).to be_truthy
end
  
Quando('acessa uma uma movimentação') do
    @account_datails_page.transactions_list.first.click
    @transaction_page = Pages::TransactionPage.new
end
  
Então('a página de detalhes da transação é exibida corretamente') do
    expect(@transaction_page.all_there?).to be_truthy
end
