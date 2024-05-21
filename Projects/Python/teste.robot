*** Settings ***
Documentation    Automação lotofacil

Library    Browser
Library    ./converter.py

*** Test Cases ***
teste
    New Browser       chromium    headless=true
    New Context       viewport={'width': 1920, 'height': 1080}
    New Page          url=https://loterias.caixa.gov.br/Paginas/Lotofacil.aspx
   # ${result}         Get Text    xpath=//*[@id="wp_resultados"]/div[1]/div/h2/text()
   # ${concurso}       Get Text    css=[class="ng-binding"]
    ${log}            Get Text    xpath=//*[@id="wp_resultados"]/div[2]/div/div/div[1]/ul
    ${novo}           transformar_valor     ${log}
    ${jogo1_gus}      Resultado1    ${novo}
    ${jogo2_gus}      Resultado2    ${novo}
    ${jogo1_ana}      Resultado3    ${novo}
    ${jogo2_ana}      Resultado4    ${novo}
    #Log To Console    ${result}${concurso}
    Log To Console    ${jogo1_gus}    
    Log To Console    ${jogo2_gus}
    Log To Console    ${jogo1_ana}
    Log To Console    ${jogo2_ana} 
    