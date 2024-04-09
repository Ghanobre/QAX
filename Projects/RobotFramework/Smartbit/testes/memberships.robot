*** Settings ***
Documentation    Suite de testes de adesões de planos

Resource    ../resources/Base.resource

Test Setup       Start sesion
Test Teardown    Take Screenshot

*** Test Cases ***
deve poder realizar uma nova adesão

    ${data}     Get Json fixture    memberships    create
    
    Delete Acount By Email    ${data}[account][email]
    Insert Account            ${data}[account]

    SigIn admin
    Go to memberships    Matrículas    
    Create new membership    ${data}
    toast should be    Matrícula cadastrada com sucesso.

Não deve poder realizar uma adesão duplicada
    [Tags]   dup

    ${data}     Get Json fixture    memberships    duplicate
    
    Delete Acount By Email    ${data}[account][email]
    Insert Account            ${data}[account]

    SigIn admin
    Go to memberships    Matrículas    
    Create new membership    ${data}
    Sleep    8
    Create new membership    ${data}
    toast should be    O usuário já possui matrícula.