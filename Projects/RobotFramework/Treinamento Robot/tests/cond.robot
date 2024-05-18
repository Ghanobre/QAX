*** Settings ***
Documentation    Usando estrutura condicional

Resource    ./variavel.robot

*** Test Cases ***
verificando se é igual
    IF  $list[0]=='valor 1' 
        Log To Console    o valor é igual
        ELSE
        Log To Console    "O valor é diferente"
    
    END
    