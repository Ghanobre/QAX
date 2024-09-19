*** Settings ***
Documentation    Automação lotofacil

Library    Browser
Library    ./converter.py


*** Test Cases ***
teste
    New Browser       chromium    headless=false
    New Context       viewport={'width': 1920, 'height': 1080}
    New Page          url=https://loterias.caixa.gov.br/Paginas/Lotofacil.aspx
    #Wait For Elements State    xpath=//*[@id="wp_resultados"]/div[1]/div    visible    timeout=60
    #${result}         Get Text    xpath=//*[@id="wp_resultados"]/div[1]/div
    Wait For Elements State    xpath=//*[@id="wp_resultados"]/div[1]/div/h2/span    visible    timeout=60
    Sleep    5
    ${concurso}       Get Text    xpath=//*[@id="wp_resultados"]/div[1]/div/h2/span
   
    ${log}            Get Text    xpath=//*[@id="wp_resultados"]/div[2]/div/div/div[1]/ul
    ${novo}           transformar_valor     ${log}
    ${jogo1}          jogo1         ${novo}
    ${jogo2}          jogo2         ${novo}
    ${jogo3}          jogo3         ${novo}
    Log To Console    \n
    Log To Console    ${concurso}        no_newline=false        
    Log To Console    'Resultado,'${novo}            no_newline=false
    Log To Console    ${jogo1}        no_newline=false    
    Log To Console    ${jogo2}        no_newline=false
    Log To Console    ${jogo3}        no_newline=false 
    