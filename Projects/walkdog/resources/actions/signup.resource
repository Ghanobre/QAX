*** Settings ***
Documentation    Ações, stepes e elementos da funcionalidade de cadastro

Library    Browser

*** Keywords ***

Goto signup page
    Click    css=a[href="/signup"]
     
    Wait For Elements State   form h1    visible    10
    Get Text    form h1    equal    Faça seu cadastro
    
Fill signup form
    [Arguments]    ${dog_walker}
    Fill Text    css=input[name=name]                ${dog_walker}[name]
    Fill Text    css=input[name=email]               ${dog_walker}[email]
    Fill Text    css=input[name=cpf]                 ${dog_walker}[cpf]
    Fill Text    css=input[name=cep]                 ${dog_walker}[cep]

    Click           css=input[type=button][value="Buscar CEP"]
    Wait For Elements State    css=input[name=addressStreet]    visible    10
    Take Screenshot    fullPage=True
    Get Property    css=input[name=addressStreet]    value    equal   ${dog_walker}[Street]
    Get Property    input[name=addressDistrict]      value    equal   ${dog_walker}[District]
    Get Property    input[name=addressCityUf]        value    equal   ${dog_walker}[CityUf]    

    Fill Text    css=input[name=addressNumber]       ${dog_walker}[Number]
    Fill Text    css=input[name=addressDetails]      ${dog_walker}[Details]

    Upload File By Selector    css=input[type=file]    ${EXECDIR}/resources/fixtures/${dog_walker}[cnh]

Aditional service
    [Arguments]    ${additional_service}
    Click    xpath=//span[text()="${additional_service}"]/..

Submit signup forme
    Click    css=button.button-register
    
Popup Should Be
    [Arguments]    ${expected_text}
    Wait For Elements State    css=.swal2-html-container    visible    10
    Get Text    css=.swal2-html-container    equal     ${expected_text}

Alert should be
    [Arguments]    ${expected_text}

    Wait For Elements State    css=.alert-error >> text=${expected_text}
