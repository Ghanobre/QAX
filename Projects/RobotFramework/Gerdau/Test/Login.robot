*** Settings ***
Documentation        Deve realizar o login na aplicação

Library    Browser

*** Test Cases ***
Abrir pagina de login
    New Browser    chromium    headless=False
    Open Browser    url=



*** Keywords ***
