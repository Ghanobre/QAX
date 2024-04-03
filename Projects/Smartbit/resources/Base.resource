*** Settings ***
Documentation    Arquivo principal do projeto robot

Library    Browser
Library    libs/Account.py
Resource   pages/Landing.resource
Resource   pages/Welcome.resource
Resource   pages/Login.resource

*** Keywords ***
Start sesion
    New Browser    browser=chromium    headless=True
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page    http://localhost:3000/
