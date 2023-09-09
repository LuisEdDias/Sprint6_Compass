Quando('realiza login com usuário {string} e senha {string}') do |login, password|
    @home.customer_login.login login, password
end
  
Então('é exibida uma mensagem {string} para login inválido') do |message|
    login_message = Factory::Static.static_data('message')[message]
    expect(@home.login_error_message.has_text?(login_message)).to be_truthy
end

Quando('realiza login válido') do
    login = 'valid'
    password = 'valid'
    @home.customer_login.login login, password
end
  
Então('é redirecionado para página de visão geral das contas bancárias') do
    admin_name = Factory::Static.static_data('admin_user_data')['name']
    expect(@home.account_services_menu.welcome_message.has_text?(admin_name)).to be_truthy
    accounts_overview_url = Factory::Static.static_data('link_url')['accounts_overview']
    expect(page.current_url).to include accounts_overview_url
end
