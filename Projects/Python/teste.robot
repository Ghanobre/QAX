*** Settings ***
Documentation    Automação lotofacil

Library    Browser
Library    ./converter.py


*** Test Cases ***
teste
    New Browser    chromium    headless=False
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page    url=https://loterias.caixa.gov.br/Paginas/Lotofacil.aspx 
    ${log}    Get Text    //*[@id="wp_resultados"]/div[2]/div/div/div[1]/ul
    Take Screenshot
    ${novo}    transformar_valor     ${log}
    log     ${log}
    Log    ${novo}
    # FOR  ${element}  IN  ${array1}
    #     IF  $element == ${novo}
    #         Log To Console    ${element}  
    #     END
    # END
    