#language: pt

@regression
@home
Funcionalidade: Home Page
    SENDO um usuário do ParaBank
    QUERO navegar na home Page
    PARA acessar as funcionalidades da aplicação

    Contexto: Estar na home page
        Dado que esteja na home page
    
    @home_page_load
    Cenário: Carregamento da página
        Então a home page é exibida corretamente
