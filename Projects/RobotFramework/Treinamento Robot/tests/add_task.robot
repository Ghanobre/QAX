*** Settings ***
Library    SeleniumLibrary

Resource    ../resource/base.resource

Test Setup        Start execution    ${page}
Test Teardown     Finish execution

*** Test Cases ***
Add Tasks And Set To Complete
    Criar task
    Concluir task