*** Settings ***
Documentation    estrutura de repetição

Resource    ../resource/base.resource


*** Test Cases ***
Mensasem de inicio
    Mensagem personalizada    Usando FOR IN RANGE

Imprimir a list
    FOR  ${element}  IN  @{list}
        Log To Console    ${element}   
    END


verificar a lista
    IF    $list[2]=='coelho'
        Log To Console    o valor é igual
    ELSE
        Log To Console    o valor é diferente
        
    END

Repetição com for IN RANGE
    [Documentation]     Inicio=0    Fim=Tamanho da lista    Incremento=1
    FOR    ${index}    IN RANGE    0    ${list.__len__()}    1
        Exit For Loop If    $index==2
        ${element}    Set Variable    ${list}[${index}]
        Log To Console    ${element}
    END