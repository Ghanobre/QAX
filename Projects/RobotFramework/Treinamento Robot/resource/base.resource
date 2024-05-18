*** Settings ***
Documentation        Arquivo base com os recursos principais

Library    SeleniumLibrary

Resource    ../resource/action/add_task.resource
Resource    ../resource/action/demo_page.resource
Resource    ../resource/action/login_herokuapp.resource
Resource    ../resource/action/login_page.resource
Resource    ../resource/action/loginmfa.resource
Resource    ../resource/action/secure_area.resource

*** Variables ***
${scalar}    unico valor
@{list}    cachorro     gato     coelho    ovelha    cavalo    peixe    abelha    zebra
&{dictionary}    nome=jose    idade=21    peso=77

*** Keywords ***
Mensagem personalizada
    [Arguments]    ${mensagem}    
    Log To Console        ${mensagem}

Start execution
    [Arguments]    ${pagina}
    Open Browser    url=${pagina}    browser=chrome

Finish execution
    Close Browser
    