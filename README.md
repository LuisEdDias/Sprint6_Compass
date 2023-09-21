<div align="center"><img src="https://media.licdn.com/dms/image/C4D16AQElB0y1d5svPg/profile-displaybackgroundimage-shrink_200_800/0/1658867832742?e=2147483647&v=beta&t=i56I1rSG-TTCSP6hZbam6Wo9gwZINgRKqeXGKuCwP0w" tittle="compass.uol"></div>

# Automação de testes Web - Estágio QA Compass.UOL

Este é um projeto de automação do site ParaBank desenvolvido durante a Sprint 6 do programa de bolsas da empresa Compass.UOL. 

A proposta foi elaborar um plano de testes do site, utilizá-lo como base para criar cenários de testes utilizando a linguagem Gherkin e automatizá-los utilizando a linguagem de programação Ruby juntamente com alguns recursos como Cucumber, Capybara, SitePrism e Selenium. Foram utilizados também massa de dados estática, dinâmica (Faker) e geração de reports automatizados com o Cucumber. Para configuração do ambiente necessário para realização dos testes automatizados são realizadas solicitações para API
do ParaBank

Além disso, como adicional de inovação foi implementada uma solução utilizando a API do Chat GPT. 

Caso um cenário de teste falhe durante a execução um prompt é gerado utilizando o backtrace e a mensagem de erro da falha e enviado no corpo da requisição para API do Chat GPT, solicitando uma possível explicação sobre o erro. Então, a mensagem de resposta é capturada, impressa no terminal e anexada no relatório.

Embora da forma que foi implementada a solução não tenha valor real de utilização, sua elaboração foi importante em relação ao aprendizado adquirido, servindo de base para utilização de inteligência artificial em projetos futuros já que essa tecnologia é cada vez mais relevante.

## Mapa do site ParaBank

Você pode encontrar o arquivo do mapa [clicando aqui](/mapa-mental)

![ParaBank Map](/mapa-mental/ParaBank.png)

## Preparando o ambiente para execução dos testes

1. Certifique-se de ter o Ruby instalado em seu sistema. Se não tiver, você pode baixá-lo e instalá-lo a partir do site oficial: [Ruby Lang](https://www.ruby-lang.org/). Os testes foram desenvolvidos na versão 2.6.3, caso você utilize outra versão poderão ocorrer erros inesperados.

2. Crie uma pasta onde você colocará os arquivos e abra um terminal do Git Bash a partir dela. Para isso você também precisa ter o [Git](https://git-scm.com/) instalado em seu computador.

3. Digite estes comandos no terminal para clonar os arquivos:
   ```
   git clone https://github.com/LuisDiasCompass/Sprint6_LuisDias_Compass.git

   ```

   Você também pode baixar o [arquivo zip](https://github.com/LuisDiasCompass/Sprint6_LuisDias_Compass/archive/refs/heads/main.zip) e descompactar na sua pasta.

4. Abra o terminal de comando do seu computador na pasta "Sprint6_LuisDias_Compass" e digite o comando abaixo para instalar as gems necessárias:

   ```
   bundle install

   ```

5. Pelo menos um dos navegadores abaixo precisa estar diponível, com webdriver compatível:

* Google Chrome, assim como o ChromeDriver da versão compatível com seu navegador que pode ser baixada [neste link](https://chromedriver.chromium.org/downloads) 
* Microsoft Edge, assim como o Microsoft Edge Webdriver da versão compatível com seu navegador que pode ser baixada [neste link](https://developer.microsoft.com/pt-br/microsoft-edge/tools/webdriver/)
* Mozilla Firefox, assim como o Geckoriver da versão compatível com seu navegador que pode ser baixada [neste link](https://github.com/mozilla/geckodriver/releases)

## Execução
### Observações

* Se você quiser utilizar a funiconalidade implementada com o Chat GPT precisará de uma conta com créditos válidos.
<div align="center"><h1>A API DO CHAT GPT É PAGA!</h1><p>Se mesmo assim você quiser utilizá-la poderá criar uma conta no <a href='https://openai.com/'>site da OpenAI</a></div>

* Após estar com sua API Key deverá adicioná-la no arquivo prd.yml que está no caminho '/features/support/factory/static/prd.yml'.

* Dentro do arquivo encontre:
```
gpt_key: YOUR KEY
```
* Substitua 'YOUR KEY' por sua API Key.

* Depois disso basta descomentar o código entre as linhas 63 e 83 do arquivo hooks.rb no caminho '/features/support/hooks.rb'.

## Há algumas formas de executar os testes:

### Todos de uma vez

* Você pode executar todos os testes de uma única vez com o comando a seguir:

   ```
   # Substitua 'NAVEGADOR' por 'chrome' para executar no Google Chrome, 
   # 'edge' para Microsoft Edge ou 'firefox' para Mozilla Firefox

   cucumber -p default -p NAVEGADOR 

   ```
* Também é possível executar os testes sem abrir a interface gráfica do navegador adicionando o argumento headless:

   ```
   cucumber -p default -p headless -p NAVEGADOR

   ```

### Por funcionalidade

* Pode-se executar testes em cada funcionalidade separadamente adicionando a tag referente a ela:

   ```
   cucumber -p default -p NAVEGADOR -t@home

   ```
* As funcionalidades com testes são:

<div>
    <table border="1" align="center">
        <thead>
            <tr><th>TAG</th><th>FUNCIONALIDADE</th></tr>
        </thead>
        <tbody>
            <tr><td>@home</td><td>Home Page</td></tr>
            <tr><td>@register</td><td>Register</td></tr>
            <tr><td>@login</td><td>Login</td></tr>
            <tr><td>@open_account</td><td>Open New Account</td></tr>
            <tr><td>@transfer</td><td>Transfer Funds</td></tr>
            <tr><td>@bill_pay</td><td>Bill Pay</td></tr>
            <tr><td>@request_loan</td><td>Request Loan</td></tr>
            <tr><td>@accounts_overview</td><td>Accounts Overview</td></tr>
            <tr><td>@find_transactions</td><td>Find Transactions</td></tr>
        </tbody>
    </table>
</div>

### Por cenário

* Também é possível executar cada cenário de teste exclusivamente conforme a tabela abaixo:

<div>
    <table border="1" align="center">
        <thead>
            <tr><th colspan="2" style="text-align:center">HOME PAGE</th></tr>
            <tr><th style="text-align:center" width="270">TAG</th><th style="text-align:center" width="500">CENÁRIO</th></tr>
        </thead>
        <tbody>
            <tr><td>@home_page_load</td><td>CT_001: Verificar carregamento da Home Page</td></tr>
            <tr><td>@header_menu</td><td>CT_002: Acesso às páginas do menu do header</td></tr>
            <tr><td>@solutions_menu</td><td>CT_003: Acesso às páginas do menu Solutions</td></tr>
            <tr><td>@customer_login_links</td><td>CT_004: Acesso às páginas da seção de login</td></tr>
            <tr><td>@home_body_links</td><td>CT_005: Acesso às páginas da seção principal</td></tr>
            <tr><td>@footer_menu</td><td>CT_006: Acesso às páginas do menu do footer</td></tr>
        </tbody>
    </table>
</div>

<div>
    <table border="1" align="center">
        <thead>
            <tr><th colspan="2" style="text-align:center">REGISTER</th></tr>
            <tr><th style="text-align:center" width="270">TAG</th><th style="text-align:center" width="500">CENÁRIO</th></tr>
        </thead>
        <tbody>
            <tr><td>@register_page_load</td><td>CT_007: Verificar carregamento da página de cadastro</td></tr>
            <tr><td>@validate_registration_form</td><td>CT_008: Validação do formulário de cadastro</td></tr>
            <tr><td>@valid_registration</td><td>CT_009: Realizar cadastro válido</td></tr>
        </tbody>
    </table>
</div>

<div>
    <table border="1" align="center">
        <thead>
            <tr><th colspan="2" style="text-align:center">LOGIN</th></tr>
            <tr><th style="text-align:center" width="270">TAG</th><th style="text-align:center" width="500">CENÁRIO</th></tr>
        </thead>
        <tbody>
            <tr><td>@validate_login_form</td><td>CT_010: Validação dos campos do login</td></tr>
            <tr><td>@valid_login</td><td>CT_011: Realizar login válido</td></tr>
            <tr><td>@forgot_login_load</td><td>CT_012: Verificar carregamento da página de recuperação de login</td></tr>
            <tr><td>@validate_forgot_login_form</td><td>CT_013: Validação do formulário de recuperação de login</td></tr>
            <tr><td>@login_recovery</td><td>CT_014: Realizar recuperação de login válida</td></tr>
            <tr><td>@invalid_login_recovery</td><td>CT_015: Realizar recuperação de login inválida</td></tr>
            <tr><td>@update_profile_page_load</td><td>CT_016: Verificar carregamento da página de atualização dos dados de contato</td></tr>
            <tr><td>@validate_update_profile_form</td><td>CT_017: Validação formulário de atualização dos dados de contato</td></tr>
            <tr><td>@update_profile</td><td>CT_018: Realizar atualização dos dados de contato</td></tr>
            <tr><td>@logout</td><td>CT_019: Realizar logout</td></tr>
        </tbody>
    </table>
</div>

<div>
    <table border="1" align="center">
        <thead>
            <tr><th colspan="2" style="text-align:center">OPEN NEW ACCOUNT</th></tr>
            <tr><th style="text-align:center" width="270">TAG</th><th style="text-align:center" width="500">CENÁRIO</th></tr>
        </thead>
        <tbody>
            <tr><td>@open_account_page_load</td><td>CT_020: Verificar carregamento da página de abertura de conta</td></tr>
            <tr><td>@open_checking_account</td><td>CT_021: Realizar criação de conta corrente</td></tr>
            <tr><td>@open_savings_account</td><td>CT_022: Realizar criação de conta poupança</td></tr>
        </tbody>
    </table>
</div>

<div>
    <table border="1" align="center">
        <thead>
            <tr><th colspan="2" style="text-align:center">TRANSFER FUNDS</th></tr>
            <tr><th style="text-align:center" width="270">TAG</th><th style="text-align:center" width="500">CENÁRIO</th></tr>
        </thead>
        <tbody>
            <tr><td>@transfer_page_load</td><td>CT_023: Verificar carregamento da página de transferências</td></tr>
            <tr><td>@validate_transfer_form</td><td>CT_024: Validação do formulário de transferências</td></tr>
            <tr><td>@transfer_funds</td><td>CT_025: Realizar transferência válida</td></tr>
        </tbody>
    </table>
</div>

<div>
    <table border="1" align="center">
        <thead>
            <tr><th colspan="2" style="text-align:center">BILL PAY</th></tr>
            <tr><th style="text-align:center" width="270">TAG</th><th style="text-align:center" width="500">CENÁRIO</th></tr>
        </thead>
        <tbody>
            <tr><td>@bill_pay_page_load</td><td>CT_026: Verificar carregamento da página de transferências</td></tr>
            <tr><td>@validate_bill_pay_form</td><td>CT_027: Validação do formulário de pagamentos</td></tr>
            <tr><td>@valid_bill_payment</td><td>CT_028: Realizar pagamento válido</td></tr>
        </tbody>
    </table>
</div>

<div>
    <table border="1" align="center">
        <thead>
            <tr><th colspan="2" style="text-align:center">REQUEST LOAN</th></tr>
            <tr><th style="text-align:center" width="270">TAG</th><th style="text-align:center" width="500">CENÁRIO</th></tr>
        </thead>
        <tbody>
            <tr><td>@request_loan_page_load</td><td>CT_029: Verificar carregamento da página de empréstimos</td></tr>
            <tr><td>@validate_request_loan_form</td><td>CT_030: Validação do formulário de empréstimos</td></tr>
            <tr><td>@valid_request_loan</td><td>CT_031: Realizar empréstimo válido</td></tr>
        </tbody>
    </table>
</div

<div>
    <table border="1" align="center">
        <thead>
            <tr><th colspan="2" style="text-align:center">ACCOUNTS OVERVIEW</th></tr>
            <tr><th style="text-align:center" width="270">TAG</th><th style="text-align:center" width="500">CENÁRIO</th></tr>
        </thead>
        <tbody>
            <tr><td>@accounts_overview_page_load</td><td>CT_032: Verificar carregamento da página de visualização geral das contas</td></tr>
            <tr><td>@check_account_access</td><td>CT_033: Verificar o acesso às movimentações da conta</td></tr>
            <tr><td>@check_activity_filter</td><td>CT_034: Verificar os filtros de busca por movimentação</td></tr>
            <tr><td>@check_activity_details</td><td>CT_035: Verificar o acesso aos detalhes de uma transação</td></tr>
        </tbody>
    </table>
</div>

<div>
    <table border="1" align="center">
        <thead>
            <tr><th colspan="2" style="text-align:center">FIND TRANSACTIONS</th></tr>
            <tr><th style="text-align:center" width="270">TAG</th><th style="text-align:center" width="500">CENÁRIO</th></tr>
        </thead>
        <tbody>
            <tr><td>@find_transactions_page_load</td><td>CT_036: Verificar carregamento da página de busca por transações</td></tr>
            <tr><td>@find_transactions_by_id</td><td>CT_037: Realizar busca por número da transação</td></tr>
            <tr><td>@find_transactions_by_date</td><td>CT_038: Realizar busca por data específica</td></tr>
            <tr><td>@find_transactions_by_date_range</td><td>CT_039: Realizar busca por período</td></tr>
            <tr><td>@find_transactions_by_amount</td><td>CT_040: Realizar busca por valor</td></tr>
        </tbody>
    </table>
</div>

## Relatório de execução
 * Após a execução dos testes o relatório se encontrará na pasta 'reports' com o nome de 'report.html'.
 * Você pode ver um relatório de execução dos testes na pasta. [Click aqui](/reports), baixe o arquivo 'report.htm' e abra no seu navegador.

## Referências
   
### Documentação Cucumber
   * https://cucumber.io/docs/cucumber/

### Documentação Selenium
   * https://www.selenium.dev/pt-br/documentation/webdriver/

### Documentação Capybara
   * https://rubydoc.info/github/teamcapybara/capybara/master

### Documentação SitePrism
   * https://github.com/site-prism/site_prism

### Documentação Faker 
   * https://github.com/faker-ruby/faker

### Documentação API Chat GPT 
   * https://platform.openai.com/docs/introduction/key-concepts

### Documentação Ruby OpenAI 
   * https://github.com/alexrudall/ruby-openai

### Documentação Gem HTTP
   * https://github.com/httprb/http

## Conteúdo do Repositório

Este repositório contém códigos, exercícios e informações relacionados ao meu estágio no Studio Quality & Test Automation da Compass.UOL. Fique à vontade para utilizar e me enviar mensagem para dúvidas, feedbacks ou sugestões.

## Contato
### Luís Eduardo Dias, [Enviar e-mail](mailto:luis.dias.pb@compasso.com.br).
