Dado('que esteja na home page') do
    @home = Pages::HomePage.new
    @home.load
end

Então('a home page é exibida corretamente') do
    
end
