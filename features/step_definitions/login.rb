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
    expect(@home.account_services_menu.welcome_message.has_text?('Welcome')).to be_truthy
    accounts_overview_url = Factory::Static.static_data('link_url')['accounts_overview']
    expect(page.current_url).to include accounts_overview_url
end

Dado('que esteja na página de recuperação de login') do
    @forgot_login_page = Pages::ForgotLoginPage.new
    @forgot_login_page.load
end
  
Então('a página de recuperação de login é exibida corretamente') do
    expect(@forgot_login_page.all_there?).to be_truthy
end

Quando('preenche o formulário de recuperação de login com dados {string}') do |data|
    @forgot_login_page.login_recovery_form.complete_recovery_form data
end
  
Então('o formulário de recuperação de login exibe um label de erro {string}') do |data|
    expect(@forgot_login_page.login_recovery_form.login_recovery_form_label.label_error_message data).to be_truthy
end

Quando('preenche o formulário de recuperação de login com dados validos') do
    @forgot_login_page.login_recovery_form.complete_recovery_form 'valid_user_data'
end
  
Então('o login é recuperado com sucesso') do
    login = Factory::Static.static_data('valid_user_data')
    expect(@forgot_login_page.login_recovery_success_message.has_text?(login['username'])).to be_truthy
    expect(@forgot_login_page.login_recovery_success_message.has_text?(login['password'])).to be_truthy
end

Quando('preenche o formulário de recuperação de login com dados invalidos') do
    @forgot_login_page.login_recovery_form.complete_recovery_form 'user_not_exists'
end
  
Então('é exibida a mensagem de login não encontrado') do
    recovery_message = Factory::Static.static_data('message')['login_recovery_not_found']
    expect(@forgot_login_page.login_recovery_message.has_text?(recovery_message)).to be_truthy
end

Dado('que esteja na home page e logado no sistema') do
    steps %{
        Dado que esteja na home page
        Quando realiza login válido
    }
end

Quando('que navega para página de atualização de dados de contato') do
    @home.click_link 'update_contact_info', 'account_services_menu'
    @update_profile_page = Pages::UpdateProfilePage.new
end
  
Então('a página de atualização de dados de contato é exibida corretamente') do
    expect(@update_profile_page.all_there?).to be_truthy
end

Quando('preenche o formulário de atualização de dados de contato com dados {string}') do |data|
    @update_profile_page.update_profile_form.complete_update_profile_form data
end
  
Então('o formulário de atualização de dados de contato exibe um label de erro {string}') do |data|
    expect(@update_profile_page.update_profile_form.update_profile_form_label.label_error_message data).to be_truthy
end

Quando('preenche o formulário de atualização de dados de contato com dados válidos') do
    @update_profile_page.update_profile_form.complete_update_profile_form 'valid_data'
end
  
Então('os dados são atualizados com sucesso') do
    update_profile_message = Factory::Static.static_data('message')['update_profile_success_message']
    expect(@update_profile_page.update_profile_message.has_text?(update_profile_message)).to be_truthy
end
  
Quando('realiza logout') do
    @home.click_link 'logout', 'account_services_menu'
end
  
Então('o logout é realizado com sucesso') do
    expect(@home.account_services_menu.all_there?).to be_falsey
end
