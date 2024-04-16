*** Settings ***
Documentation    Ação de elementos da pagina de matricula

Library    Browser

*** Keywords ***
Go to memberships
    [Arguments]    ${expected_tex}
    
    Click    css=a[href="/memberships"]
    Wait For Elements State    css= div h1 >> text=${expected_tex}   visible    5
    Get Text    css=div h1    equal    ${expected_tex}

User loged in
    [Arguments]    ${email}
    ${element}    Set Variable    css=.logged-user   

    Wait For Elements State    ${element}    visible    5
    Get Text    ${element}    equal    ${email}