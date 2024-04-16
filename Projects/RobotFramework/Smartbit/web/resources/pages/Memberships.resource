*** Settings ***
Documentation    Ações e elementos da pagina de formulario

Library    Browser

*** Keywords ***
Create new membership
    [Arguments]    ${data}
    
    Go to memberships form    Nova matrícula
    Select account    ${data}[account][name]    ${data}[account][cpf]
    Select plan        ${data}[plan][name]
    Fill payment card    ${data}[credit_card]
    Click    css=button[form=formMembership] >> text=Cadastrar       

Go to memberships form
    [Arguments]    ${expected_text}

    Click    css=a[href="/memberships/new"]
    Wait For Elements State    css= div h1 >> text=" ${expected_text}"   visible    5
     Get Text    css=div h1    equal    ${expected_text}


Select account
    [Arguments]    ${name}    ${cpf}
    Fill Text    css=input[aria-label="select_account"]    ${name}
    Click        css=[data-testid="${cpf}"]

Select plan
    [Arguments]    ${plano}
    Fill Text    css=input[aria-label="select_plan"]   ${plano}
    Click        css=div[class$=option] >> text=${plano}

Fill payment card
    [Arguments]     ${credit_card}

    Fill Text    css=input[name=card_number]        ${credit_card}[number]
    Fill Text    css=input[name=card_holder]        ${credit_card}[holder] 
    Fill Text    css=input[name=card_month]         ${credit_card}[month]    
    Fill Text    css=input[name=card_year]          ${credit_card}[year]
    Fill Text    css=input[name=card_cvv]           ${credit_card}[cvv]

search by name
    [Arguments]    ${data}
    Fill Text    css=input[placeholder^=Busque]    ${data}[account][name]
    Wait For Elements State    css=strong >> text=Total: 1


should filter by name
    [Arguments]    ${data}
     Wait For Elements State    css=table tbody tr >> text=${data}[account][name]   visible    5

remove user by name
    [Arguments]    ${data}
    
    Click    xpath=//td[text()="${data}[account][name]"]/..//button

membership should not visible
    [Arguments]    ${data}

    Wait For Elements State    css=table tbody tr >> text=${data}[account][name]    detached    5
    


