#language: pt

@regression
@request_loan
Funcionalidade: Request Loan
    SENDO um usuário do ParaBank
    QUERO realizar acessar a funcionalidade de empréstimos
    PARA realizar um empréstimo

    Contexto: Estar logado e na página de empréstimos
        Dado que esteja na home page e logado no sistema
        E que acessa a página de empréstimos

    @request_loan_page_load
    Cenário: CT_029: Verificar carregamento da página de empréstimos
        Então a página de empréstimos é exibida corretamente

    @validate_request_loan_form
    Esquema do Cenário: CT_030: Validação do formulário de empréstimos
        Quando realiza um empréstimo com dados '<data>'
        Então deve ver uma mensagem de empréstimo não realizado
        Exemplos:
        |data             |
        |negative         |
        |empty            |
        |special_character|
        |letters          |
        |zero             |

    @valid_request_loan
    Cenário: CT_031: Realizar empréstimo válido
        Quando realiza um empréstimo com dados válidos
        Então deve ver uma mensagem de empréstimo realizado com sucesso
        E as contas de origem e empréstimo estão com o saldo correto
