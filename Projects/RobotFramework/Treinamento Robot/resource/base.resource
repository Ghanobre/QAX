*** Settings ***
Documentation        Arquivo base com os recursos principais

Library    SeleniumLibrary

Resource    ../resource/action/add_task.resource
Resource    ../resource/action/demo_page.resource
Resource    ../resource/action/login.resource
Resource    ../resource/action/loginmfa.resource

*** Keywords ***
Mensagem personalizada
    [Arguments]           ${mensagem}    
    Log To Console        ${mensagem}

Start execution
    [Arguments]           ${pagina}
    Open Browser          url=${pagina}    browser=chrome
    Maximize Browser Window
    

Finish execution
    Close Browser
    