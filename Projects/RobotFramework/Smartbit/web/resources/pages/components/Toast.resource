*** Settings ***
Documentation    Ações e elementos do compontente toast

Library    Browser

*** Keywords ***
toast should be

    [Arguments]   ${expected_text}

    ${element}    Set Variable    css=.Toastify__toast-body

    Wait For Elements State    ${element}    visible    5
    Get Text    ${element}    equal   ${expected_text}

    Take Screenshot    selector=${element}