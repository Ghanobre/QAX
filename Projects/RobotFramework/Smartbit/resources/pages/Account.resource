*** Settings ***
Documentation    Ações e elementos da pagina de clientes

Library    Browser

*** Keywords ***

User loged in
    [Arguments]    ${email}
    ${element}    Set Variable    css=.logged-user   

    Wait For Elements State    ${element}    visible    5
    Get Text    ${element}    equal    ${email}