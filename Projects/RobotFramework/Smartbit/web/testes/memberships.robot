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
    
    Insert Membership    ${data}
    SigIn admin
    Go to memberships    Matrículas 
    Create new membership    ${data}
    toast should be    O usuário já possui matrícula.

Deve buscar por nome
    [Tags]    search
    
    ${data}     Get Json fixture    memberships    search

    Insert Membership    ${data}

    SigIn admin
    Go to memberships    Matrículas
    
    search by name    ${data}    
    should filter by name    ${data}

Deve excluir uma matricula
    [Tags]    remove
    
    ${data}     Get Json fixture    memberships    remove

    Insert Membership    ${data}

    SigIn admin
    Go to memberships    Matrículas
    remove user by name    ${data}
    confirme removal
    membership should not visible     ${data}
    