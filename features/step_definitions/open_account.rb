Dado('que acessa a página de abertura de conta') do
    @home.click_link 'open_account', 'account_services_menu'
    @open_account_page = Pages::OpenAccountPage.new
end

Então('a página de abertura de contas é carregada corretamente') do
    expect(@open_account_page.all_there?).to be_truthy
end

Quando('realiza a abertura de uma conta corrente') do
    @open_account_page.select_origin_account.first.select_option
    @open_account_page.select_type_account[0].select_option
    @open_account_page.btn_open_account.double_click
    @account_type = 'CHECKING'
end

Quando('realiza a abertura de uma conta poupança') do
    @open_account_page.select_origin_account.first.select_option
    @open_account_page.select_type_account[1].select_option
    @open_account_page.btn_open_account.double_click
    @account_type = 'SAVINGS'
end

Então('a conta é aberta com sucesso') do
    @open_account_page.new_account_link.click
    @account_datails_page = Pages::AccountDetailsPage.new
    expect(@account_datails_page.account_type.has_text? @account_type).to be_truthy
end
