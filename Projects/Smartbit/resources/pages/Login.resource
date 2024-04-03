*** Settings ***
Documentation    Ações e elementos da pagina de login

Library    Browser

*** Keywords ***
Go to login page
    Go To    http://localhost:3000/login

submit login form
    [Arguments]    ${email}    ${password}
    
    Fill Text    css=input[id=email]        ${email}
    Fill Text    css=input[id=password]    ${password}

    Click    css=button >> text=Entrar

Notice Alrte

    [Arguments]   ${expected_text}

    ${element}    Set Variable    css=form .notice

    Wait For Elements State    ${element}    visible    5
    Get Text    ${element}    equal   ${expected_text}

toast should be

    [Arguments]   ${expected_text}

    ${element}    Set Variable    css=.Toastify__toast-body

    Wait For Elements State    ${element}    visible    5
    Get Text    ${element}    equal   ${expected_text}

