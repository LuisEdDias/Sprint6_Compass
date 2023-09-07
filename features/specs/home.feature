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
    Cenário: CT_001: Verificar carregamento da Home Page
        Então a home page é exibida corretamente

    Esquema do Cenário: CT_002: Acesso às páginas do menu do header;
        Quando acessa um link "<link>" da seção "<section>"
        Então é redirecionado corretamente
        Exemplos:
        |link    |section|
        |home    |header |
        |about_us|header |
        |contact |header |
        
    Esquema do Cenário: CT_003: Acesso às páginas do menu Solutions;
        Quando acessa um link "<link>" da seção "<section>"
        Então é redirecionado corretamente
        Exemplos:
        |link      |section       |
        |about_us  |solutions_menu|
        |services  |solutions_menu|
        |products  |solutions_menu|
        |locations |solutions_menu|
        |admin_page|solutions_menu|

    Esquema do Cenário: CT_004: Acesso às páginas da seção de login;
        Quando acessa um link "<link>" da seção "<section>"
        Então é redirecionado corretamente
        Exemplos:
        |link          |section       |
        |login_recovery|customer_login|
        |register      |customer_login|

    Esquema do Cenário: CT_005: Acesso às páginas da seção principal;
        Quando acessa um link "<link>" da seção "<section>"
        Então é redirecionado corretamente
        Exemplos:
        |link    |section  |
        |news    |home_body|
        |services|home_body|

    Esquema do Cenário: CT_006: Acesso às páginas do menu do footer; 
        Quando acessa um link "<link>" da seção "<section>"
        Então é redirecionado corretamente
        Exemplos:
        |link      |section|
        |home      |footer |
        |about_us  |footer |
        |services  |footer |
        |products  |footer |
        |locations |footer |
        |forum     |footer |
        |site_map  |footer |
        |contact_us|footer |
        