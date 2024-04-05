*** Settings ***
Documentation    Arquivo principal do projeto robot

Library    Browser
Library    libs/Account.py
Library    libs/DataBase.py

Resource   pages/Landing.resource
Resource   pages/Welcome.resource
Resource   pages/Login.resource
Resource   pages/Account.resource
Resource   pages/components/Toast.resource
Resource   pages/components/BoxNotices.resource


*** Keywords ***
Start sesion
    New Browser    browser=chromium    headless=False
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page       http://localhost:3000/
