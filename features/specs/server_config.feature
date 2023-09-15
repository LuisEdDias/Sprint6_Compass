#language: pt

@server_config
Funcionalidade: Server Config

    @config_db
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

    @config_account_to_admin_user
    Cenário: Criar segunda conta para usuário admin
        Dado que esteja na home page e logado no sistema
        E que acessa a página de abertura de conta
        Quando realiza a abertura de uma conta corrente

    @config_transactions_to_admin_user
    Cenário: Criar movimentações na conta principal do usuário admin
        Dado que esteja logado e na página de transferências
        Quando realiza uma transferência válida
    