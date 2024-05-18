*** Settings ***
Documentation    Ações relacionadas ao login MFA

Library    SeleniumLibrary
Library    ../libs/totp.py
  

*** Variables ***

${mfa_login}           https://seleniumbase.io/realworld/login
${id_username}         username
${id_password}         password
${valor_user}          demo_user
${valor_pass}          secret_pass
${id_totp}             totpcode
${btn_login}           id:log-in
${title_h1}            //h1
${expected_text}       Welcome!
${link_demo_page}      xpath=//*[contains(text(),"Demo Page")]


*** Keywords ***
Realizar login MFA
    Input Text    ${id_username}    ${valor_user}   
    Input Text    ${id_password}    ${valor_pass}    
    ${totp}       get_totp          GAXG2MTEOR3DMMDG     
    Input Text    ${id_totp}          ${totp}
    Click Link    id:log-in

Validar login
    Element Text Should Be    ${title_h1}    ${expected_text}

Abrir demo Page
    Click Link    ${link_demo_page}    
    Close Window
    Switch Window
