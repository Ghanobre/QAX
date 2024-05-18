*** Settings ***
Documentation        Arquivo Principal do projeto

Library    SeleniumLibrary

Resource    ./action/login_page.resource
Resource    ./action/add_task.resource
Resource    ./action/secure_area.resource

*** Keywords ***

start session
    [Arguments]    ${URL}
    Open Browser    url= ${URL}   browser=chrome

finish session
    Close Browser
    