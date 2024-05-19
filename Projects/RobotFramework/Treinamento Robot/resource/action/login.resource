*** Settings ***
Documentation        Arquivo com as ações do teste d elogin

Library    SeleniumLibrary

*** Variables ***
${pagina}             https://the-internet.herokuapp.com/login   
${input_username}     username
${id_password}        password
${button_login}       css=[class="radius"]
${id_flash}           id:flash    
${mensagem}           You logged into a secure area!
${button_logout}      Logout
${nome}               tomsmith
${password}           SuperSecretPassword!
${path}               /screenshot/Evidencia_login_{index}.png

*** Keywords ***
Realizar o login
    Input Text     ${input_username}    ${nome} 
    Input Text     ${id_password}       ${password}
    Capture Page Screenshot   ${OUTPUTDIR}/${path}
    Click Button   ${button_login}

Validar login com sucesso
    [Arguments]    ${mensagem}    
    Element Should Contain    ${id_flash}     ${mensagem}
    Capture Page Screenshot   ${OUTPUTDIR}/${path}
    Click Link    ${button_logout}
