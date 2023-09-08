Dado('que esteja na home page') do
    @home = Pages::HomePage.new
    @home.load
end

Então('a home page é exibida corretamente') do
    expect(@home.all_there?).to be_truthy
end
 
Quando('acessa um link {string} da seção {string}') do |link, section|
    access_link = Factory::Static.static_data_two_args(section, link)['link']
    @url = Factory::Static.static_data_two_args(section, link)['url']
    @home.public_send(section).public_send(access_link).click
end
  
Então('é redirecionado corretamente') do
    expect(page.current_url).to include @url
end
  
Quando('acessa um link {string} do menu Solutions') do |arg|
    link = Factory::Static.static_data_two_args('solutions_menu', arg)['link']
    @url = Factory::Static.static_data_two_args('solutions_menu', arg)['url']
    @home.header.solutions_menu.public_send(link).click
end

Quando('acessa um link {string} da home page') do |arg|
    link = Factory::Static.static_data_two_args('home_body', arg)['link']
    @url = Factory::Static.static_data_two_args('home_body', arg)['url']
    @home.public_send(link).click
end
