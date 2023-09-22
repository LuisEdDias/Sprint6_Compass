#language: pt

@regression
@register
Funcionalidade: Register
    SENDO um usuário do ParaBank
    QUERO realizar um cadastro
    PARA me autenticar na aplicação

    Contexto: Estar na página de cadastro
        Dado que esteja na página de cadastro
    
    @register_page_load
    Cenário: CT_007: Verificar carregamento da página de cadastro
        Então a página de cadastro é exibida corretamente

    @validate_registration_form
    Esquema do Cenário: CT_008: Validação do formulário de cadastro
        Quando preenche o formulário de cadastro com dados '<data>'
        Então o formulário de cadastro exibe um label de erro '<data>'
        Exemplos:
        |data                   |
        # |special_character      |
        # |only_numbers           |
        |empty                  |
        |username_already_exists|
        |passwords_not_match    |

    @valid_registration
    Cenário: CT_009: Realizar cadastro válido
        Quando realiza um cadastro com dados válidos
        Então é exibida uma menssagem de sucesso
