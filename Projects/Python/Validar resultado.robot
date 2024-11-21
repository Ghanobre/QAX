*** Settings ***
Documentation    Automação lotofacil

Library    Browser
Library    ./conferir_jogos.py
Library    JSONLibrary 

*** Test Cases ***
Validar resultado
    Set Browser Timeout    timeout=60
    ${json}    Load Json From File    ${EXECDIR}${/}Projects${/}Python${/}fixtures${/}jogos.json
    ${array1}    Get Value From Json    json_object=${json}    json_path=$.Jogo1[*]
    ${array2}    Get Value From Json    json_object=${json}    json_path=$.Jogo2[*]
    ${array3}    Get Value From Json    json_object=${json}    json_path=$.Jogo3[*]

    New Browser       chromium    headless=false
    New Context       viewport={'width': 1920, 'height': 1080}
    New Page          url=https://loterias.caixa.gov.br/Paginas/Lotofacil.aspx
    Wait For Elements State    xpath=//*[@id="wp_resultados"]/div[1]/div/h2/span    visible    timeout=60
    Sleep    5
    ${concurso}       Get Text    xpath=//*[@id="wp_resultados"]/div[1]/div/h2/span
   
    ${log}            Get Text    xpath=//*[@id="wp_resultados"]/div[2]/div/div/div[1]/ul
    ${novo}           transformar_valor     ${log}
    ${jogo1}          jogo1         ${novo}    ${array1}
    ${jogo2}          jogo2         ${novo}    ${array2}
    ${jogo3}          jogo3         ${novo}    ${array3}
    Log To Console    \n
    Log To Console    ${concurso}        no_newline=false        
    Log To Console    'Resultado,'${novo}            no_newline=false
    Log To Console    ${jogo1}        no_newline=false    
    Log To Console    ${jogo2}        no_newline=false
    Log To Console    ${jogo3}        no_newline=false 
    