*** Settings ***
Documentation    Automação lotofacil

Library    Browser
Library    ./converter.py

*** Variables ***
@{array1}     2    3    4    6    7    10    11    14    15    17    18    19    21    22    25
@{array2}     1    4    5    6    8    9    11    12    13    16    19    20    23    24    25
@{array3}     1    3    5    8    9    10    12    13    15    16    18    20    21    23    24
@{array4}     2    4    5    6    8    9    11    12    15    16    18    20    22    23    25

*** Test Cases ***
teste
    New Browser    chromium    headless=False
    New Page    url=https://loterias.caixa.gov.br/Paginas/Lotofacil.aspx
    ${log}    Get Text    //*[@id="wp_resultados"]/div[2]/div/div/div[1]/ul
    ${novo}    Transformar Valor     ${log}
    log     ${log}
    Log    ${novo}
    FOR  ${element}  IN  ${array1}
        IF  $element == ${novo}
            Log To Console    ${element}  
        END
    END
    