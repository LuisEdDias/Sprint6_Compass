Dado('que esteja logado e na página de transferências') do
    steps %{
        Dado que esteja na home page e logado no sistema
    }
    @home.click_link 'transfer_funds', 'account_services_menu'
    @transfer_page = Pages::TransferFundsPage.new
end
  
Então('a página de transferências é carregada corretamente') do
    expect(@transfer_page.all_there?).to be_truthy
end

Quando('realiza uma transferência com dados {string}') do |data|
    @transfer_page.transfer_funds data
end
  
Então('deve ver uma mensagem de transferência não realizada {string}') do |data|
    expect(@transfer_page.transfer_funds_error data).to be_truthy
end

Quando('realiza uma transferência válida') do
    @accounts_overview = Pages::AccountsOverviewPage.new
    @accounts_overview.load
    origin_balance = @accounts_overview.accounts_list.last.account_balance.gsub('$', '').to_f
    target_balance = @accounts_overview.accounts_list.first.account_balance.gsub('$', '').to_f
    @transfer_page.load
    transfer_amount = Factory::Dynamic.valid_data_form[:transfer_amount]
    @transfer_page.transfer_funds transfer_amount
    @expect_origin_balance = origin_balance - transfer_amount
    @expect_traget_balance = target_balance + transfer_amount  
end
  
Então('deve ver uma mensagem de transferência realizada com sucesso') do
    transfer_success_message = Factory::Static.static_data('message')['transfer_success_message']
    expect(@transfer_page.transfer_success_message.has_text?(transfer_success_message)).to be_truthy
end
  
Então('as contas de origem e destino estão com os valores corretos') do
    @accounts_overview.load
    new_origin_balance = @accounts_overview.accounts_list.last.account_balance.gsub('$', '').to_f
    new_target_balance = @accounts_overview.accounts_list.first.account_balance.gsub('$', '').to_f
    expect(new_origin_balance).to eq (@expect_origin_balance.round(2))
    expect(new_target_balance).to eq (@expect_traget_balance.round(2))
end
