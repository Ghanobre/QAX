*** Settings ***
Documentation    Realizar os testes de api do treinamento

Library    RequestsLibrary
Library    Collections

*** Variables ***

&{headers}        accept=application/json
    ...           Content-Type=application/json

&{body}           nome=Fulano da Silva
    ...           email=gbhhyttnb@qa.com.br
    ...           password=teste
    ...           administrador=true

&{new_body}       nome=da silva fulano
    ...           email=novoemail222@qa.com.br
    ...           password=teste
    ...           administrador=true

*** Test Cases ***
Cadastro de usuario
    Create Session    alias=Teste1    url=https://serverest.dev/    headers=${headers}    disable_warnings=true
    ${response}    POST On Session    alias=Teste1    url=usuarios    expected_status=any    json=${body}
    ${_id}    Get From Dictionary   ${response.json()}       _id
    Set Suite Variable     ${_id_suite}    ${_id}  
    Status Should Be    201    ${response}
    Dictionary Should Contain Item    ${response.json()}       message    Cadastro realizado com sucesso

Consulta de usuário
    Create Session    alias=Teste1    url=https://serverest.dev/    headers=&{headers}   disable_warnings=true
    ${response}    GET On Session    alias=Teste1    url=usuarios/${_id_suite}    expected_status=any    # robotcode: ignore
    Status Should Be    200    ${response}
    Dictionary Should Contain Item    ${response.json()}    nome    Fulano da Silva

Alterar de usuario
    Create Session    alias=Teste1    url=https://serverest.dev/    headers=${headers}    disable_warnings=true
    ${response}    PUT On Session    alias=Teste1    url=usuarios/${_id_suite}    expected_status=any    json=${new_body}    # robotcode: ignore
    Status Should Be    200    ${response}
    Dictionary Should Contain Item    ${response.json()}       message    Registro alterado com sucesso

Exclusao de usuário
    Create Session    alias=Teste1    url=https://serverest.dev/    headers=&{headers}   disable_warnings=true
    ${response}    DELETE On Session    alias=Teste1    url=usuarios/${_id_suite}    expected_status=any    # robotcode: ignore
    Status Should Be    200    ${response}
    Dictionary Should Contain Item    ${response.json()}    message    Registro excluído com sucesso

Consulta cep
    ${headers}  Create Dictionary      accept=application/json
    ${cep}  Set Variable  50030150    
    Create Session    alias=Teste1    url=https://brasilapi.com.br/api/   headers=&{headers}   disable_warnings=true
    ${response}    Get On Session    alias=Teste1    url=cep/v1/${cep}    expected_status=any
    Log    ${response.text}
    ${city}    Get From Dictionary   ${response.json()}       city
    Log    ${city}