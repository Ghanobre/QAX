*** Settings ***
Documentation        Arquivo principal do projeto

Library    SeleniumLibrary
Resource    ../resource/action/ecommerce.resource

*** Variables ***

${page}    https://www.advantageonlineshopping.com/#/   


*** Keywords ***

Start execution
    ${prefs}    Create Dictionary   credentials_enable_service=${false}

    Open Browser    url=${page}   browser=chrome    options=add_argument("--disable-notifications")
    Maximize Browser Window

Finish execution
    Close Browser