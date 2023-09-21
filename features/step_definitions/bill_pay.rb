Dado('que acessa a página de pagamento de contas') do
    @bill_pay_page = Pages::BillPayPage.new
    @bill_pay_page.load
end
  
Então('a página de pagamentos é exibida corretamente') do
    expect(@bill_pay_page.all_there?).to be_truthy
end
  
Quando('realiza um pagamento com dados {string}') do |data|
    @bill_pay_page.bill_pay_form.complete_bill_pay_form data
end
  
Então('deve ver uma mensagem de pagamneto não realizado {string}') do |data|
    @bill_pay_page.bill_pay_form.bill_pay_form_label.label_error_message data
end
  
Quando('realiza um pagamento válido') do
    @accounts_overview = Pages::AccountsOverviewPage.new
    @accounts_overview.load
    origin_balance = @accounts_overview.accounts_list.first.account_balance.gsub('$', '').to_f
    @bill_pay_page.load
    payment_amount = Factory::Dynamic.valid_data_form[:transfer_amount]
    @bill_pay_page.bill_pay_form.complete_bill_pay_form payment_amount
    @expect_origin_balance = origin_balance - payment_amount
end
  
Então('deve ver uma mensagem de pagamento realizado com sucesso') do
    expect(@bill_pay_page.payment_success_message.visible?).to be_truthy
end

Então('o valor do pagamento deve ter sido debitado da conta') do
    @accounts_overview.load
    new_origin_balance = @accounts_overview.accounts_list.first.account_balance.gsub('$', '').to_f
    expect(new_origin_balance).to eq (@expect_origin_balance.round 2)
end
