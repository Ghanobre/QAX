*** Settings ***
Documentation    Cenarios de teste de pre cadastro dna Webapp

Resource    ../resources/Base.resource

Test Setup       Start sesion
Test Teardown    Take Screenshot

*** Test Cases ***
Deve iniciar o cadastro do cliente aleatório
    [Tags]    smokea

    ${account}     Get Fake Account

    Submit signup form    ${account}
    Verify welcome message

Deve iniciar o cadastro do cliente fixo
    [Tags]    smokef
    
    ${account}    Create Dictionary    
    ...    name=Usuario de tetse    
    ...    email=teste@tetse.com    
    ...    cpf=07256491352

    Delete Acount By Email    ${account}[email]
    Submit signup form    ${account}
    Verify welcome message

Campo nome deve ser obrigatorio
    [Tags]    required

    ${account}    Create Dictionary    name=${EMPTY}    email=tetse@teste.com    cpf=31479026506

    Submit signup form    ${account}
    Notice should be   Por favor informe o seu nome completo    

Campo email deve ser obrigatorio
    [Tags]    required
    
    ${account}    Create Dictionary    name=New User    email=${EMPTY}     cpf=31479026506
    Submit signup form    ${account}

    Click    css=button >> text=Cadastrar
    Notice should be   Por favor, informe o seu melhor e-mail

Campo cpf deve ser obrigatorio
    [Tags]    required
    
    ${account}    Create Dictionary    name=New User    email=tetse@teste.com    cpf=${EMPTY}

    Submit signup form    ${account}
    Notice should be   Por favor, informe o seu CPF
    
Email no formato incorreto
    [Tags]    inv
    
    ${account}    Create Dictionary    name=New User    email=tetse#teste.com    cpf=31479026506

    Submit signup form    ${account}
    Notice should be   Oops! O email informado é inválido

CPF no formato incorreto
    [Tags]    inv
    
    ${account}    Create Dictionary    name=New User    email=tetse@teste.com    cpf=314790265qa

    Submit signup form    ${account}
    Notice should be    Oops! O CPF informado é inválido

# tentativa de pre cadastro
#     [Template]    Attemp signup
#     New User    tetse@teste.com    314790265qa    Oops! O CPF informado é inválido
#     New User    tetse#teste.com    31479026506    Oops! O email informado é inválido
#     New User    tetse@teste.com    ${EMPTY}       Por favor, informe o seu CPF
#     New User    ${EMPTY}           31479026506    Por favor, informe o seu melhor e-mail
#     ${EMPTY}    tetse@teste.com    31479026506    Por favor informe o seu nome completo

# *** Keywords ***

# Attemp signup
#     [Arguments]   ${name}    ${email}    ${cpf}    ${output_message} 

#     ${account}    Create Dictionary    name=${name}    email=${email}    cpf=${cpf}

#     Submit signup form    ${account}
#     Notice should be      ${output_message}  
