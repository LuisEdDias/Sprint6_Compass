Dado('que esteja na home page') do
    @home = Pages::HomePage.new
    @home.load
end

Então('a home page é exibida corretamente') do
    expect(@home.all_there?).to be_truthy
end
 
Quando('acessa um link {string} da seção {string}') do |link, section|
    @url = Factory::Static.static_data('link_url')[link]
    @home.click_link link, section
end
  
Então('é redirecionado corretamente') do
    expect(page.current_url).to include @url
end
  