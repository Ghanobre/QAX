*** Settings ***
Documentation        Action com as ações do login page

Library    SeleniumLibrary

*** Keywords ***
Realizar o login com sucesso
    [Arguments]    ${input}
    
    Input Text      username    ${input}[name]
    Input Text      password    ${input}[pass]
   # Set Screenshot Directory    ./logs/screenshot
    Capture Page Screenshot    ${OUTPUTDIR}/id_image_id-1.png
    Click Button    css=.radius
    