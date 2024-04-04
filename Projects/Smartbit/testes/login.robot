*** Settings ***
Documentation    Deve realizar o login na aplicação

Library    Browser
Resource    ../resources/Base.resource

Test Setup       Start sesion
Test Teardown    Take Screenshot

*** Test Cases ***
Deve logar com o gestor da academia
    [Tags]    smoke

    Go to login page
    submit login form    sac@smartbit.com    pwd123
    User loged in        sac@smartbit.com

Login com senha invalido
    [Tags]    invpass

    Go to login page
    submit login form        sac@smartbit.com    abc123
    toast should be          As credenciais de acesso fornecidas são inválidas. Tente novamente!


Login com usuárioi não registrado
    [Tags]    invuser

    Go to login page
    submit login form    sac@teste.com    abc123
    toast should be    As credenciais de acesso fornecidas são inválidas. Tente novamente!


temtativa de login com dados incorretos
    [Tags]     notice
    [Template]    Login whit verify notices

    ${EMPTY}    ${EMPTY}    Os campos email e senha são obrigatórios.
    ${EMPTY}    pwd123      Os campos email e senha são obrigatórios.
    sac@smartbit.com    ${EMPTY}    Os campos email e senha são obrigatórios.
    sac#smartbit.com    pwd123    Oops! O email informado é inválido   

*** Keywords ***

Login whit verify notices
    
    [Arguments]    ${email}    ${password}    ${output_message}

    Go to login page
    submit login form    ${email}    ${password}
    Notice should be    ${output_message}