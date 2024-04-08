*** Settings ***
Documentation    Ações e elementos da pagina de formulario

Library    Browser

*** Keywords ***
Entrar e validar a tela memberships
    
    Click    css=a[href="/memberships"]
    Wait For Elements State    css= div h1 >> text=Matrículas   visible    5
    Get Text    css=div h1    equal    Matrículas

Go to enroll form
    
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
    [Arguments]     ${number}    ${holder}    ${month}    ${year}    ${cvv}

    Fill Text    css=input[name=card_number]        ${number}
    Fill Text    css=input[name=card_holder]        ${holder} 
    Fill Text    css=input[name=card_month]         ${month}    
    Fill Text    css=input[name=card_year]          ${year}
    Fill Text    css=input[name=card_cvv]           ${cvv}

Submit form

     Click    css=button[form=formMembership] >> text=Cadastrar