#language: pt

@regression
@open_account
Funcionalidade: Open New Account
    SENDO um usuário do ParaBank
    QUERO realizar a abertura de uma conta
    PARA fazer operações bancárias

    Contexto: Estar logado no sistema e estar na página de abertura de conta
        Dado que esteja na home page e logado no sistema
        E que acessa a página de abertura de conta
    
    @open_account_page_load
    Cenário: CT_020: Verificar carregamento da página de abertura de conta
        Então a página de abertura de contas é carregada corretamente

    @open_checking_account
    Cenário: CT_021: Realizar criação de conta corrente
        Quando realiza a abertura de uma conta corrente
        Então a conta é aberta com sucesso

    @open_savings_account
    Cenário:CT_022: Realizar criação de conta poupança
        Quando realiza a abertura de uma conta poupança
        Então a conta é aberta com sucesso
