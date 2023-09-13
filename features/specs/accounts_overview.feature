#language: pt

@regression
@accounts_overview
Funcionalidade: Accounts Overview
    SENDO um usuário do ParaBank
    QUERO realizar acessar a funcionalidade de visualização geral das contas
    PARA verificar as movimentações

    Contexto: Estar logado e na página de pagamento de visualização geral das contas
        Dado que esteja na home page e logado no sistema
        E que acessa a página de visualização geral das contas

    @accounts_overview_page_load
    Cenário: CT_032: Verificar carregamento da página de visualização geral das contas
        Então a página de visualização geral das contas é exibida corretamente
    
    @check_account_access
    Cenário: CT_033: Verificar o acesso às movimentações da conta
        E acessa uma conta específica
        Então são exibidas as movimentações da conta

    @check_activity_filter_by_type
    Esquema do Cenário: CT_034: Verificar os filtros de busca por tipo de movimentação
        E acessa uma conta específica
        Quando filtra as movimentações por tipo '<type>'
        Então a lista de movimentações exibe o resultado corretamente '<type>'
        Exemplos:
        |type  |
        |credit|
        |debit |   

    @check_activity_filter_by_type
    Cenário: CT_035: Verificar os filtros de busca de movimentação por período
        E acessa uma conta específica
        Quando filtra as movimentações por período '<type>'
        Então a lista de movimentações exibe o resultado corretamente '<type>'
        Exemplos:
        |type   |
        |valid  |
        |invalid|  

    @check_activity_details
    Cenário: CT_036: Verificar o acesso aos detalhes de uma transação
        E acessa uma conta específica
        Quando acessa uma uma movimentação
        Então a página de detalhes da transação é exibida corretamente
