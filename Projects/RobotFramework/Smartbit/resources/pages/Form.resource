*** Settings ***
Documentation    Ações e elementos da pagina de formulario

Library    Browser

*** Keywords ***
Entrar e validar a tela memberships
    
    Click    css=a[href="/memberships"]
    Wait For Elements State    css= div h1 >> text=Matrículas   visible    5
    Get Text    css=div h1    equal    Matrículas

Go to memberships form
    
    Click    css=a[href="/memberships/new"]
    Wait For Elements State    css= div h1 >> text="Nova matrícula"   visible    5

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

Submit form

     Click    css=button[form=formMembership] >> text=Cadastrar