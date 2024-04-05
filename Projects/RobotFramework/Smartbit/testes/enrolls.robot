*** Settings ***
Documentation    Suite de testes de adesões de planos

Resource    ../resources/Base.resource

Test Setup       Start sesion
Test Teardown    Take Screenshot

*** Test Cases ***
deve poder realizar uma nova adesão

    Go to login page
    submit login form    sac@smartbit.com    pwd123
    User loged in        sac@smartbit.com
    Entrar e validar a tela memberships
    Sleep    10

*** Keywords ***
Entrar e validar a tela memberships
    Click    css=a[href="/memberships"]

    Wait For Elements State    css= div h1    visible    5

    Get Text    css=div h1    equal    Matrículas
    
