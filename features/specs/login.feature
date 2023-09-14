#language: pt

@regression
@login
Funcionalidade: Login
    SENDO um usuário do ParaBank
    QUERO realizar login
    PARA acessar as funcionalidades da aplicação como usuário logado

    @validate_login_form
    Cenário: CT_010: Validação dos campos do login
        Dado que esteja na home page
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
        Dado que esteja na home page
        Quando realiza login válido
        Então é redirecionado para página de visão geral das contas bancárias

    @forgot_login_load
    Cenário: CT_012: Verificar carregamento da página de recuperação de login
        Dado que esteja na página de recuperação de login
        Então a página de recuperação de login é exibida corretamente

    @validate_forgot_login_form
    Esquema do Cenário: CT_013: Validação do formulário de recuperação de login
        Dado que esteja na página de recuperação de login
        Quando preenche o formulário de recuperação de login com dados '<data>'
        Então o formulário de recuperação de login exibe um label de erro '<data>'
        Exemplos:
        |data             |
        |empty            |
        |special_character|
        |only_numbers     |

    @login_recovery
    Cenário: CT_014: Realizar recuperação de login válida
        Dado que esteja na página de recuperação de login
        Quando preenche o formulário de recuperação de login com dados validos
        Então o login é recuperado com sucesso

    @invalid_login_recovery
    Cenário: CT_015: Realizar recuperação de login inválida
        Dado que esteja na página de recuperação de login
        Quando preenche o formulário de recuperação de login com dados invalidos
        Então é exibida a mensagem de login não encontrado

    @update_profile_page_load
    Cenário: CT_016: Verificar carregamento da página de atualização dos dados de contato
        Dado que esteja na home page e logado no sistema
        Quando que navega para página de atualização de dados de contato
        Então a página de atualização de dados de contato é exibida corretamente

    @validate_update_profile_form
    Cenário: CT_017: Validação formulário de atualização dos dados de contato
        Dado que esteja na home page e logado no sistema
        Quando que navega para página de atualização de dados de contato
        E preenche o formulário de atualização de dados de contato com dados '<data>'
        Então o formulário de atualização de dados de contato exibe um label de erro '<data>'
        Exemplos:
        |data             |
        |empty            |
        |special_character|
        |only_numbers     |

    @update_profile
    Cenário: CT_018: Realizar atualização dos dados de contato
        Dado que esteja na home page e logado no sistema
        Quando que navega para página de atualização de dados de contato
        E preenche o formulário de atualização de dados de contato com dados válidos
        Então os dados são atualizados com sucesso

    @logout
    Cenário: CT_019: Realizar logout
        Dado que esteja na home page e logado no sistema
        Quando realiza logout
        Então o logout é realizado com sucesso
