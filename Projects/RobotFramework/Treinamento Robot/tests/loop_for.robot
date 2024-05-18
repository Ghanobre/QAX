*** Settings ***
Documentation    Estrutura de repetição

Library    Collections
Resource    ./variavel.robot


*** Test Cases ***
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