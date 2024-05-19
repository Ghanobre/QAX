*** Settings ***
Documentation    Realizar login na pagina

Resource    ../resource/base.resource

Test Setup        Start execution    ${pagina}     
Test Teardown     Finish execution

*** Test Cases ***
Login com sucesso
    Realizar o login
    Validar login com sucesso    ${mensagem}    

