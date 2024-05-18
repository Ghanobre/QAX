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
Repetição com for IN RANGE 1
    [Documentation]    Inicio=0    Fim=5    Incremento=1
    FOR    ${index}    IN RANGE    0    5    1
           ${element}    Set Variable    ${list}[${index}]
           Log To Console    ${element}
    END

Repetição com for IN RANGE 2
    [Documentation]    Inicio=0    Fim=Tamanho da lista    Incremento=1
    FOR    ${index}    IN RANGE    0    ${list.__len__()}    1
           ${element}    Set Variable    ${list}[${index}]
           Log To Console    ${element}
    END

Repetição com for IN RANGE 3
    [Documentation]    Inicio=0    Fim=Tamanho da lista-2    Incremento=1
    FOR    ${index}    IN RANGE    0    (${list.__len__()}-2)    1
           ${element}    Set Variable    ${list}[${index}]
           Log To Console    ${element}
    END

Repetição com for IN RANGE 4
    [Documentation]    Inicio=0    Fim=Tamanho da lista    Incremento=1
    FOR    ${index}    IN RANGE    0    ${list.__len__()}    1
        IF  $index == 3
        Exit For Loop
        END
        ${element}    Set Variable    ${list}[${index}]
        Log To Console    ${element}
    END

Repetição com for IN RANGE 5
    [Documentation]    Inicio=0    Fim=Tamanho da lista    Incremento=1
    FOR    ${index}    IN RANGE    0    ${list.__len__()}    1
        Exit For Loop If    $index==2
        ${element}    Set Variable    ${list}[${index}]
        Log To Console    ${element}
    END