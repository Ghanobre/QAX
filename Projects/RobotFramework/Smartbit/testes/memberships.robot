*** Settings ***
Documentation    Suite de testes de adesões de planos

Resource    ../resources/Base.resource

Test Setup       Start sesion
Test Teardown    Take Screenshot

*** Test Cases ***
deve poder realizar uma nova adesão

    # ${account}    Create Dictionary    
    # ...    name=Luna Azevedo    
    # ...    email=evelyn63@example.com    
    # ...    cpf=85419627337

    # ${plan}    Set Variable    Plano Black

    # ${credit_card}    Create Dictionary    
    # ...    number=4242424242424242    
    # ...    holder=Luna Azevedo     
    # ...    month=11    
    # ...    year=2029    
    # ...    cvv=123

    ${data}     Get Json fixture    memberships    create
    
    Delete Acount By Email    ${data}[account][email]
    Insert Account            ${data}[account]

    Go to login page
    submit login form    sac@smartbit.com    pwd123
    User loged in        sac@smartbit.com

    Entrar e validar a tela memberships
    Go to Memberships form
    Select account    ${data}[account][name]    ${data}[account][cpf]
    Select plan        ${data}[plan]
    Fill payment card    ${data}[credit_card]          
    Submit form
    toast should be    Matrícula cadastrada com sucesso.