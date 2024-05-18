*** Settings ***
Documentation    Usando variáveis

*** Variables ***

${scalar}    unico valor
@{list}    valor1    valor2    valor3    valor4    valor5
&{dictionary}    name=user    password=pwd


*** Test Cases ***
Usando tipos de variaveis
    Log To Console    ${scalar}
    Log To Console    ${list}[0]
    Log To Console    ${dictionary}[name]
    ${teste1}    Create List    primeiro    segundo    terceiro
    ${testdic}    Create Dictionary    nome=Jose    idade=21    peso=75
    Log To Console    ${testdic}[nome] ${testdic}[idade] ${testdic}[peso]
    ${lista}    Create List    ana    jose    arthur
    Log To Console    ${lista}[0]    

Variavel scalar
    ${varlocal}    Set Variable    Apenas local
    Log    ${varlocal}
    Set Suite Variable    ${varsuit}    em toda suit de teste      
    Set Global Variable    ${varglobal}    em todas as suites

verificando as variaveis
    Log To Console    ${varsuit}    # robotcode: ignore
    Log To Console     ${varglobal}    # robotcode: ignore