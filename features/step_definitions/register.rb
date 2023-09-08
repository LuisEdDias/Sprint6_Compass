Dado('que esteja na página de cadastro') do
    @register_page = Pages::RegisterPage.new
    @register_page.load
end
  
Então('a página de cadastro é exibida corretamente') do
    expect(@register_page.all_there?).to be_truthy
end

Quando('preenche o formulário de cadastro com dados {string}') do |data|
    @register_page.register_form.complete_registration_form data
end
  
Então('o formulário de cadastro exibe um label de erro {string}') do |data|
    expect(@register_page.register_form.register_form_label.label_error_message data).to be_truthy
end

Quando('realiza um cadastro com dados válidos') do
    @register_page.register_form.complete_registration_form 'valid_data'
end
  
Então('é exibida uma menssagem de sucesso') do
    success_message = Factory::Static.static_data('message')['account_register_success_message']
    expect(@register_page.account_register_success_message.has_text?(success_message)).to be_truthy
end