*** Settings ***
Documentation    Action com as ações do login page

Library    SeleniumLibrary

*** Keywords ***
Validar login com secesso
    Click Link    xpath=//*[@id="content"]/div/a
    Close Browser

validar mensagem
    [Arguments]    ${expected_mensagem}
    Element Should Contain    css=#flash    ${expected_mensagem}        
    Set Screenshot Directory    ./logs/screenshot
    Capture Page Screenshot