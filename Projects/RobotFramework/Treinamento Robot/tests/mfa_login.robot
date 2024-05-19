*** Settings ***
Documentation        Teste de MFA e selectors

Resource    ../resource/base.resource

Test Setup    Start execution    ${mfa_login}
Test Teardown    Finish execution

*** Test Cases ***
Testar login MFA
    [Tags]    mfa
    Realizar login MFA
    validar login    
    
Execução completa
    [Tags]    execfull
    Realizar login MFA
    validar login
    Abrir demo Page
    Validar titulo Demo Page
    Mover Hover Dropdown
    Inserindo Texto na pagina
    Button: color
    Input Slider Control:
    Select Dropdown:
    Image in iFrame
    Check BOX
    Realizando Drag and drop
        
