*** Settings ***
Documentation        Arquivo com as ações do teste d elogin

Library    SeleniumLibrary

*** Variables ***
${pagina}               https://the-internet.herokuapp.com/login   
${input_username}       username
${id_password}          password
${button_login}         css=[class="radius"]
${id_flash}             id:flash    
${mensagem}             You logged into a secure area!
${button_logout}        Logout
${nome}                 tomsmith
${nome_inv}             tomsmiths
${password}             SuperSecretPassword!
${password_inv}         abvcdfr
${class_flash_error}    css=[class="flash error"]
${inv_user}             Your username is invalid!
${inv_pass}             Your password is invalid! 
${evidencia_login}      ${OUTPUT_DIR}/Screenshot/login/evidencia_login{index}.png 

*** Keywords ***
Realizar o login
    Input Text                     ${input_username}    ${nome} 
    Input Text                     ${id_password}       ${password}
    Capture Page Screenshot        ${evidencia_login}
    Click Button                   ${button_login}

Validar login com sucesso 
    Element Should Contain         ${id_flash}          ${mensagem}
    Capture Page Screenshot        ${evidencia_login}
    Click Link                     ${button_logout}

login com erro no usuario
    Input Text                     ${input_username}    ${nome_inv} 
    Input Text                     ${id_password}       ${password}
    Capture Page Screenshot        ${evidencia_login}
    Click Button                   ${button_login}

login com erro na senha
    Input Text                     ${input_username}    ${nome} 
    Input Text                     ${id_password}       ${password_inv}
    Capture Page Screenshot        ${evidencia_login}
    Click Button                   ${button_login}

Mensagem impeditiva
    [Arguments]                    ${expected_text}
    Element Should Contain         ${class_flash_error}    ${expected_text}
    Capture Page Screenshot        ${evidencia_login}
