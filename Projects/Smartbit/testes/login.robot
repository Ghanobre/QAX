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

Login com email invalido
    [Tags]     invalid

    Go to login page
    submit login form    sac#smartbit.com    pwd123
    Notice Alrte         Oops! O email informado é inválido

Login com senha invalido
    [Tags]    invalid

    Go to login page
    submit login form    sac@smartbit.com    abc123
    toast should be    As credenciais de acesso fornecidas são inválidas. Tente novamente!


Login com usuárioi não registrado
    [Tags]    invalid

    Go to login page
    submit login form    sac@teste.com    abc123
    toast should be    As credenciais de acesso fornecidas são inválidas. Tente novamente! 