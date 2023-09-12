#language: pt

@regression
@bill_pay
Funcionalidade: Bill Pay
    SENDO um usuário do ParaBank
    QUERO realizar acessar a funcionalidade de pagamento de contas
    PARA realizar pagamentos

    Contexto: Estar logado e na página de pagamento de contas
        Dado que esteja na home page e logado no sistema
        E que acessa a página de pagamento de contas

    @bill_pay_page_load
    Cenário: CT_026: Verificar carregamento da página de transferências
        Então a página de pagamentos é exibida corretamente

    @validate_bill_pay_form
    Esquema do Cenário: CT_027: Validação do formulário de pagamentos
        Quando realiza um pagamento com dados '<data>'
        Então deve ver uma mensagem de pagamneto não realizado '<data>'
        Exemplos:
        |data                     |
        |empty                    |
        |special_character        |
        |letters                  |
        |only_numbers             |
        |amount_negative          |
        |amount_zero              |
        |account_numbers_not_match|

    @valid_bill_payment
    Cenário: CT_028: Realizar pagamento válido 
        Quando realiza um pagamento válido
        Então deve ver uma mensagem de pagamento realizado com sucesso
        E o valor do pagamento deve ter sido debitado da conta
