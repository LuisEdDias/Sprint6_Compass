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
    Cenário: CT_008: Validar formulário de cadastro
        Então a página de cadastro é exibida corretamente

    @valid_registration
    Cenário: CT_009: Realizar cadastro válido
        Então a página de cadastro é exibida corretamente

    @invalid_registration
    Cenário: CT_010: Realizar cadastro inválido
        Então a página de cadastro é exibida corretamente

    @register_already_registered_username
    Cenário: CT_011: Realizar cadastro com username já cadastrado
        Então a página de cadastro é exibida corretamente
