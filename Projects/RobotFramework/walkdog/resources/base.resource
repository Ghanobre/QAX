*** Settings ***
Documentation    Arquivo principal no projeto

Library    Browser
Library    Library/totp.py

Resource    actions/signup.resource
Resource    env.resource

*** Keywords ***
start session

    New Browser    browser=${BROWSER}    headless=False
    New Page     https://walkdog.vercel.app/

    Wait For Elements State    css=h1 >> text=Cuidado e diversão em cada passo
    ...    visible    10
    Get Text    h1    equal    Cuidado e diversão em cada passo


Finish session
    Take Screenshot    fullPage=True