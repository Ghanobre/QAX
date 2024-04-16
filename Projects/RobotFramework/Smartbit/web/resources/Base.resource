*** Settings ***
Documentation    Arquivo principal do projeto robot

Library    JSONLibrary
Library    Browser
Library    libs/Account.py
Library    libs/DataBase.py

Resource   pages/Landing.resource
Resource   pages/Welcome.resource
Resource   pages/Login.resource
Resource   pages/Account.resource
Resource   pages/components/Toast.resource
Resource   pages/components/Modal.resource
Resource   pages/components/BoxNotices.resource
Resource   pages/components/Navbar.resource
Resource   pages/Memberships.resource

*** Variables ***
    
${ADMIN_EMAIL}    sac@smartbit.com
${ADMIN_PASS}     pwd123


*** Keywords ***
Start sesion
    New Browser    browser=chromium    headless=False
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page       http://localhost:3000/
    Get Text    css=.headline h2    equal    Sua Jornada Fitness Começa aqui!


Get Json fixture
    [Arguments]    ${file_name}    ${scenario}
    ${data}     Load Json From File    ${EXECDIR}/resources/fixtures/${file_name}.json

    RETURN    ${data}[${scenario}]

SigIn admin

    Go to login page
    submit login form    ${ADMIN_EMAIL}    ${ADMIN_PASS}
    User loged in        ${ADMIN_EMAIL}    



