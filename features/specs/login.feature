#language: pt

@regression
@login
Funcionalidade: Login
    SENDO um usuário do ParaBank
    QUERO realizar login
    PARA acessar as funcionalidades da aplicação como usuário logado

    Contexto: Estar na home page
        Dado que esteja na home page

    @validate_login_form
    Cenário: CT_010: Validação dos campos do login
        Quando realiza login com usuário '<user>' e senha '<password>'
        Então é exibida uma mensagem '<message>' para login inválido
        Exemplos:
        |user   |password|message                          |
        |valid  |invalid |login_username_password_incorrect|
        |valid  |empty   |login_username_password_empty    |
        |invalid|invalid |login_username_password_incorrect|
        |empty  |invalid |login_username_password_empty    |
        |empty  |empty   |login_username_password_empty    |

    @valid_login
    Cenário: CT_011: Realizar login válido
        Quando realiza login válido
        Então é redirecionado para página de visão geral das contas bancárias

    @redirect_forgot_login
    Cenário: CT_012: Verificar carregamento da página de recuperação de senha

    @validate_forgot_login_form
    Cenário: CT_013: Validação do formulário de recuperação de senha

    @login_recovery
    Cenário: CT_014: Realizar recuperação de senha

    @invalid_login_recovery
    Cenário: CT_015: Realizar recuperação de senha inválida

    @validate_contact_data_update_form
    Cenário: CT_016: Validação formulário de atualização dos dados de contato

    @contact_data_update
    Cenário: CT_017: Realizar atualização dos dados de contato

    @logout
    Cenário: CT_018: Realizar logout
