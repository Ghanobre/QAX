*** Settings ***
Documentation    Primeiro script usando Selenium

Resource    ../resource/base.resource

Test Setup    Start execution     https://the-internet.herokuapp.com/login
Test Teardown    Finish execution  


*** Test Cases ***
Login com sucesso
    ${input}    Create Dictionary    name=tomsmith    pass=SuperSecretPassword!
    Realizar o login com sucesso    ${input}
    validar mensagem    You logged into a secure area!       
    Validar login com secesso

Login com falha
    ${input}    Create Dictionary    name=tomsmith    pass=${EMPTY}
    Realizar o login com sucesso    ${input}
    validar mensagem    Your password is invalid!    
    