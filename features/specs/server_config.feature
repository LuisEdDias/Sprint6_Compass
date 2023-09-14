#language: pt

@server_config
Funcionalidade: Server Config

    Cenário: Configurar banco de dados
        Dado que esteja na página de administração
        Quando realiza a configuração do bando de dados

    @config_user
    Esquema do Cenário: Registrar usuário válido
        Dado que esteja na página de cadastro
        Quando preenche o formulário de cadastro com dados '<data>'
        Exemplos:
        |data           |
        |valid_user_data|

    

    