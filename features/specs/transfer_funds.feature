#language: pt

@regression
@transfer
Funcionalidade: Transfer Funds
    SENDO um usuário do ParaBank
    QUERO realizar acessar a funcionalidade de transferência
    PARA realizar transferências entre contas

    Contexto: Estar logado, na página de transferências e que existam mais de uma conta
        Dado que esteja logado, na página de transferências e que existam mais de uma conta

    @transfer_page_load
    Cenário: CT_023: Verificar carregamento da página de transferências
        Então a página de transferências é carregada corretamente

    @validate_transfer_form
    Esquema do Cenário: CT_024: Validação do formulário de transferências
        Quando realiza uma transferência com dados '<data>'
        Então deve ver uma mensagem de transferência não realizada '<data>'
        Exemplos:
        |data                           |
        |amount_empty                   |
        |amount_special_character       |
        |amount_letters                 |
        |amount_negative                |
        |account_same_origin_destination|

    @transfer_funds
    Cenário: CT_025: Realizar transferência válida
        Quando realiza uma transferência válida
        Então deve ver uma mensagem de transferência transferência realizada com sucesso
        E as contas de origem e destino estão com os valores corretos