*** Settings ***
Documentation    Suit de testes de cadasdro de dog walker

Resource    ../resources/base.resource

Test Setup       start session
Test Teardown    Finish session

*** Test Cases ***
Deve poder cadastrar um novo dog walke
    [Tags]    smoke

    ${dog_walker}    Create Dictionary    
    ...    name=New User    
    ...    email=teste@tetse.com    
    ...    cpf=00000014141
    ...    cep=04534011    
    ...    Street=Rua Joaquim Floriano    
    ...    District=Itaim Bibi    
    ...    CityUf=São Paulo/SP    
    ...    Number=1000    
    ...    Details=Apto 28   
    ...    cnh=toretto.jpg
    
    Goto signup page
    Fill signup form    ${dog_walker}
    Submit signup forme
    Popup Should Be    Recebemos o seu cadastro e em breve retornaremos o contato.

Não deve cadastrar se os campos obrigatório não forem preenchidos
    [Tags]    required
    
    Goto signup page
    Submit signup forme
    
    Alert should be    Informe o seu nome completo
    Alert should be    Informe o seu melhor email
    Alert should be    Informe o seu CPF
    Alert should be    Informe o seu CEP
    Alert should be    Informe um número maior que zero
    Alert should be    Adcione um documento com foto (RG ou CHN)

Nao Deve cadastrar se o cpf for incorreto
    [Tags]    cpf_inv
    
    ${dog_walker}    Create Dictionary    
    ...    name=New User    
    ...    email=teste@tetse.com    
    ...    cpf=00000014141aa
    ...    cep=04534011    
    ...    Street=Rua Joaquim Floriano    
    ...    District=Itaim Bibi    
    ...    CityUf=São Paulo/SP    
    ...    Number=1000    
    ...    Details=Apto 28   
    ...    cnh=toretto.jpg
    
    Goto signup page
    Fill signup form    ${dog_walker}
    Submit signup forme
    Alert should be    CPF inválido

Deve poder cadastrar um novo dog walke que sabe cuidar e adestrar
    [Tags]    aservice

    ${dog_walker}    Create Dictionary    
    ...    name=Dominic Toretto    
    ...    email=dominic@tetse.com    
    ...    cpf=00000014141
    ...    cep=04534011    
    ...    Street=Rua Joaquim Floriano    
    ...    District=Itaim Bibi    
    ...    CityUf=São Paulo/SP    
    ...    Number=1000    
    ...    Details=Apto 28   
    ...    cnh=toretto.jpg
        
    Goto signup page
    Fill signup form    ${dog_walker}
    Aditional service    Cuidar
    Submit signup forme
    Popup Should Be    Recebemos o seu cadastro e em breve retornaremos o contato.

Deve poder cadastrar um novo dog walke que sabe adestrar e adestrar
    [Tags]    aservice

    ${dog_walker}    Create Dictionary    
    ...    name=Toretto Dominic    
    ...    email=toreto@tetse.com    
    ...    cpf=00000014141
    ...    cep=04534011    
    ...    Street=Rua Joaquim Floriano    
    ...    District=Itaim Bibi    
    ...    CityUf=São Paulo/SP    
    ...    Number=1000    
    ...    Details=Apto 28   
    ...    cnh=toretto.jpg
        
    Goto signup page
    Fill signup form    ${dog_walker}
    Aditional service    Adestrar
    Submit signup forme
    Popup Should Be    Recebemos o seu cadastro e em breve retornaremos o contato.
  