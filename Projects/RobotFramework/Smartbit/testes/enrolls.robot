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
    Go to enroll form
    Select account    Usuario de teste    07256491352
    Select plan        Plano Black
    Fill payment card    4242424242424242    Usuario de teste    11    2029    123
    Submit form
    toast should be    Matrícula cadastrada com sucesso.