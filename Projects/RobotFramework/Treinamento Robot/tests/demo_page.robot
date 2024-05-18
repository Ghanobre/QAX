*** Settings ***
Documentation        Teste de MFA e selectors

Resource    ../resource/base.resource

Test Setup    Start execution    ${demo_page}
Test Teardown    Finish execution

*** Test Cases ***
Selector demo page
    [Tags]    page
    Validar titulo Demo Page
    Mover Hover Dropdown
    Inserindo Texto na pagina
    Button: color
    Input Slider Control:
    Select Dropdown:
    Image in iFrame
    Check BOX
    Realizando Drag and drop