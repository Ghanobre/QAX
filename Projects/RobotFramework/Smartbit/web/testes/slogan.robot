*** Settings ***
Documentation    Teste para verificar o slogan da smartbit

Library    Browser

*** Test Cases ***
Deve exibir o slogan na landing poage
    
    New Browser    browser=chromium    headless=False
    New Page    http://localhost:3000/
    Get Text    css=.headline h2    equal    Sua Jornada Fitness Começa aqui!