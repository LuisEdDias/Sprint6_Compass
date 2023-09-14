Dado('que esteja na página de administração') do
    @admin_page = Pages::AdminPage.new
    @admin_page.load
end
  
Quando('realiza a configuração do bando de dados') do
    @admin_page.server_config
end
