Dado('que acessa a página de empréstimos') do
    @home.click_link 'request_loan', 'account_services_menu'
    @request_loan_page = Pages::RequestLoanPage.new
end
  
Então('a página de empréstimos é exibida corretamente') do
    expect(@request_loan_page.all_there?).to be_truthy
end
  
Quando('realiza um empréstimo com dados {string}') do |data|
    @request_loan_page.request_loan_submit data
end

Então('deve ver uma mensagem de empréstimo não realizado') do
    error_message = Factory::Static.static_data('message')
    expect(@request_loan_page.request_loan_error_message.has_text?(error_message['unknown_error'])).to be_truthy
end

Quando('realiza um empréstimo com dados válidos') do
    @accounts_overview = Pages::AccountsOverviewPage.new
    @accounts_overview.load
    origin_balance = @accounts_overview.accounts_list.first.account_balance.gsub('$', '').to_f
    @request_loan_page.load
    @request_loan_page.request_loan_submit 'valid_data'
    @loan_data = Factory::Static.static_data('valid_loan_data')
    @expect_origin_balance = origin_balance - @loan_data['down_payment'].to_f
end
  
Então('deve ver uma mensagem de empréstimo realizado com sucesso') do
    expect(@request_loan_page.request_loan_status.has_text?('Approved')).to be_truthy
end

Então('as contas de origem e empréstimo estão com o saldo correto') do
    @accounts_overview.load
    new_origin_balance = @accounts_overview.accounts_list.first.account_balance.gsub('$', '').to_f
    account_loan_balance = @accounts_overview.accounts_list.last.account_balance.gsub('$', '').to_f
    expect(new_origin_balance).to eq (@expect_origin_balance.round(2))
    expect(account_loan_balance).to eq (@loan_data['loan_amount'].to_f.round(2))
end
