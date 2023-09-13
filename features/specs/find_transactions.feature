#language: pt

@regression
@find_transactions
Funcionalidade: Find Transactions
    SENDO um usuário do ParaBank
    QUERO realizar acessar a funcionalidade de busca de transações
    PARA encontrar uma transação específica

    Contexto: Estar logado e na página de busca por transação
        Dado que esteja na home page e logado no sistema
        E que acessa a página de busca por transação

    @find_transactions_page_load
    Cenário: CT_036: Verificar carregamento da página de busca por transações
        Então a página de de busca por transações é exibida corretamente

    @find_transactions_by_id
    Esquema do Cenário: CT_037: Realizar busca por número da transação 
        Quando busca por transação por id '<type>'
        Então o resultado da busca é exibido '<type>'
        Exemplos:
        |type             |
        |valid            |
        |invalid          |
        |letters          |
        |special_character|

    @find_transactions_by_date
    Esquema do Cenário: CT_038: Realizar busca por data específica
        Quando busca por transação com data específica '<type>'
        Então o resultado da busca é exibido '<type>'
        Exemplos:
        |type             |
        |valid            |
        |invalid          |
        |letters          |
        |special_character|

    @find_transactions_by_date_range
    Esquema do Cenário: CT_039: Realizar busca por período
        Quando busca por transação por período '<type>'
        Então o resultado da busca é exibido '<type>'
        Exemplos:
        |type             |
        |valid            |
        |invalid          |
        |letters          |
        |special_character|

    @find_transactions_by_amount
    Esquema do Cenário: CT_040: Realizar busca por valor
        Quando busca por transação por valor '<type>'
        Então o resultado da busca é exibido '<type>'
        Exemplos:
        |type             |
        |valid            |
        |invalid          |
        |letters          |
        |special_character|
