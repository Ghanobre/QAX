*** Settings ***
Documentation    Deve realizar o login na aplicação

Library    Browser
Resource    ../resources/Base.resource

Test Setup       Start sesion
Test Teardown    Take Screenshot

*** Test Cases ***
Deve logar com o gestor da academia
    
    Go to login page
    submit login form    sac@smartbit.com    pwd123
    User loged in        sac@smartbit.com 