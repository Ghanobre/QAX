*** Settings ***
Documentation        Ações referentes a pagina de ecommerce

Library    SeleniumLibrary
Library    RequestsLibrary
Library    Collections

*** Variables ***

#VARIÁVEIS com parametros globais
${evidencia_eccomerce}                    ${OUTPUT_DIR}/Screenshot/Evidencia{index:010}.png
${delay}                                  10
${qtd_itens}                              5 ITEMS

#VARIÁVEIS DE CONTROLE dos IF's
${new_account}                            NAO        #NOVO CLIENTE = SIM
${tipo_pagamento}                         cartao     # safepay ou cartao

#VARIÁVEIS API
${api_correios}                           https://brasilapi.com.br/api/
&{headers}                                accept=application/json

#DICIONÁRIOS DE MASSAS DE DAODS
&{new_user}                               name=Usuarioteste3    #Alterar a massa para não dar erro    
...                                       password=12Qazxsw    
...                                       first_name=Usuario    
...                                       last_name=teste    
...                                       phone=(81)999999999
&{address}                                country=Brazil    
...                                       zip_code=50030150
&{credit_card}                            number=4886 4886 4886    
...                                       cvv=1111    
...                                       month=01    
...                                       year=2033

#valor fixo
${usuario_cadastrado}                     Usuarioteste3


#LOCATORS
${id_layer}                               css=[id="Layer_1"]
${id_speakersImg}                         xpath=//*[@id="speakersImg"]
${id_produto}                             css=[id="23"]
${class_plus}                             css=.plus
${button_add}                             ADD TO CART
${id_menuCart}                            css=[id="menuCart"]
${id_checkOutPopUp}                       xpath=//*[@id="checkOutPopUp"]
${id_qtd_item}                            //*[@id="userCart"]/span
${button_registration}                    xpath=//*[@id="registration_btn"]
${id_usernameRegisterPage}                usernameRegisterPage
${id_emailRegisterPage}                   emailRegisterPage
${id_passwordRegisterPage}                passwordRegisterPage
${confirm_passwordRegisterPage}           css=input[name="confirm_passwordRegisterPage"]
${first_nameRegisterPage}                 css=[name="first_nameRegisterPage"]
${nameRegisterPage}                       css=[name="last_nameRegisterPage"]
${numberRegisterPage}                     css=[name="phone_numberRegisterPage"]
${select_country}                         //select 
${input_city}                             css=[name="cityRegisterPage"]
${id_addressRegisterPage}                 addressRegisterPage
${id_state}                               xpath=//*[@id="formCover"]/div[3]/div[2]/sec-view[2]/div/input
${name_postal_codeRegisterPage}           css=[name="postal_codeRegisterPage"]
${class_checkboxText}                     css=.checkboxText
${button_register}                        register_btn
${id_userCart}                            xpath=//*[@id="userCart"]/span
${btn_next}                               css=#next_btn
${id_safepay}                             css=input[name="safepay"]
${safepay_username}                       css=input[name="safepay_username"]
${safepay_password}                       css=input[name="safepay_password"]
${button_pay_now}                         pay_now_btn_SAFEPAY
${message_finish}                         css=[class="roboto-regular ng-scope"]
${expected_message}                       Thank you for buying with Advantage
${id_trackingNumberLabel}                 css=[id="trackingNumberLabel"]
${id_orderNumberLabel}                    css=[id="orderNumberLabel"]
${btn_masterCredit}                       css=[name="masterCredit"]
${id=creditCard}                          css=[id="creditCard"]
${name_cvv_number}                        css=[name="cvv_number"]
${name_mmListbox}                         css=select[name="mmListbox"]
${name_yyyyListbox}                       css=select[name="yyyyListbox"]
${name_cardholder_name}                   css=[name="cardholder_name"]
${id_pay_now_btn_ManualPayment}           css=[id="pay_now_btn_ManualPayment"]
${name_usernameInOrderPayment}            css=[name="usernameInOrderPayment"]
${name_passwordInOrderPayment}            css=[name="passwordInOrderPayment"]
${id_login_btn}                           css=[id="login_btn"]
${class_hi-use}                           css=[class="hi-user containMiniTitle ng-binding"]
${name_save_master_credit}                css=[name="save_master_credit"]
${label_mensagem}                         //label[contains(text(),'User name already exists')]
${mensagem}                               User name already exists


*** Keywords ***

Consultar cep     
    Create Session    alias=Teste1    url=${api_correios}   headers=&{headers}   disable_warnings=true
    ${response}    Get On Session    alias=Teste1    url=cep/v1/${address}[zip_code]    expected_status=any

    ${city}    Get From Dictionary        ${response.json()}   city
    Set Global Variable                   ${city_api}          ${city}
    ${street}    Get From Dictionary      ${response.json()}   street
    Set Global Variable                   ${street_api}        ${street}
    ${state}    Get From Dictionary       ${response.json()}   state
    Set Global Variable                   ${state_api}         ${state}

Selecinar um produto
    Wait Until Element Is Visible         ${id_layer}          ${delay}
    Page Should Contain Element           ${id_layer}
    Wait Until Element Is Enabled         ${id_speakersImg}    ${delay}
    Sleep    1
    Capture Page Screenshot               ${evidencia_eccomerce}
    Click Element                         ${id_speakersImg}

Escolher produto
    Wait Until Element Is Visible         ${id_produto}        ${delay}
    Click Image                           ${id_produto}
    Sleep    3
    Capture Page Screenshot               ${evidencia_eccomerce}
    FOR  ${index}  IN RANGE    1    5    1
        Wait Until Element Is Visible     ${class_plus}        ${delay}
        Click Element                     ${class_plus}    
    END
    Sleep    1
    Capture Page Screenshot               ${evidencia_eccomerce}
    Click Button                          ${button_add}

Realizar checkout
    Mouse Over                            ${id_menuCart}
    Sleep    1
    Capture Page Screenshot               ${evidencia_eccomerce}
    Wait Until Element Is Visible         ${id_checkOutPopUp}    ${delay}
    Click Button                          ${id_checkOutPopUp}
    Wait Until Element Is Visible         ${id_qtd_item}         ${delay}
    Element Text Should Be                ${id_qtd_item}         ${qtd_itens}
    Wait Until Element Is Not Visible     ${id_checkOutPopUp}    ${delay}
    Sleep    1
    Capture Page Screenshot               ${evidencia_eccomerce}

verificar usuario
    IF  $new_account == "SIM"
        Click Button                      ${button_registration}
        Account details
        Personal details
        Consultar cep
        Endereço
        Confirmar cadastro
        ELSE
        logar usuario  
    END

Account details
    Wait Until Element Is Visible         ${id_usernameRegisterPage}         ${delay}
    Input Text                            ${id_usernameRegisterPage}         ${new_user}[name]
    Input Text                            ${id_emailRegisterPage}            ${new_user}[name]@teste.com
    Input Text                            ${id_passwordRegisterPage}         ${new_user}[password]
    Input Text                            ${confirm_passwordRegisterPage}    ${new_user}[password]    
   
Personal details   
    Input Text                            ${first_nameRegisterPage}          ${new_user}[first_name]
    Input Text                            ${nameRegisterPage}                ${new_user}[last_name]
    Input Text                            ${numberRegisterPage}              ${new_user}[phone]
    Sleep    1     
    Capture Page Screenshot               ${evidencia_eccomerce}

Endereço   
    Select From List By Label             ${select_country}                  ${address}[country]
    Input Text                            ${input_city}                      ${city_api}     # robotcode: ignore
    Input Text                            ${id_addressRegisterPage}          ${street_api}   # robotcode: ignore
    Input Text                            ${id_state}                        ${state_api}    # robotcode: ignore
    Input Text                            ${name_postal_codeRegisterPage}    ${address}[zip_code]
    Sleep    1    
    Capture Page Screenshot               ${evidencia_eccomerce}

Confirmar cadastro   
    Click Element                         ${class_checkboxText}
    Sleep    1    
    Capture Page Screenshot               ${evidencia_eccomerce}              
    Click Button                          ${button_register}                
    Wait Until Element Is Visible         ${id_userCart}                      ${delay}
    Element Text Should Be                ${id_userCart}                      ${qtd_itens}
    Wait Until Element Is Visible         ${btn_next}                         ${delay}
    Sleep    1   
    Capture Page Screenshot               ${evidencia_eccomerce}
    Click Button                          ${btn_next}

Usario invalido
    Click Button                      ${button_registration}
    Account details
    Personal details
    Consultar cep
    Endereço 

Validar mensagem impeditiva
    Click Element                         ${class_checkboxText}
    Sleep    1    
    Capture Page Screenshot               ${evidencia_eccomerce}              
    Click Button                          ${button_register}            
    Wait Until Element Is Visible         ${label_mensagem}                   ${delay}       
    Element Should Contain                ${label_mensagem}                         ${mensagem}
    

logar usuario  
    Input Text                            ${name_usernameInOrderPayment}      ${usuario_cadastrado}
    Input Text                            ${name_passwordInOrderPayment}      ${new_user}[password]
    Sleep    1  
    Capture Page Screenshot               ${evidencia_eccomerce}
    Click Button                          ${id_login_btn}
    Wait Until Element Is Visible         ${class_hi-use}                     ${delay}
    Element Text Should Be                ${class_hi-use}                     ${usuario_cadastrado}
    Element Text Should Be                ${id_userCart}                      ${qtd_itens}
    Wait Until Element Is Visible         ${btn_next}                         ${delay}
    Sleep    1   
    Capture Page Screenshot               ${evidencia_eccomerce}   
    Click Button                          ${btn_next}


Pagamento
    IF  $tipo_pagamento == "safepay"
        Click Element                      ${id_safepay}
        Input Text                         ${safepay_username}                ${new_user}[name]     
        Input Text                         ${safepay_password}                ${new_user}[password]     
        Sleep    1       
        Capture Page Screenshot            ${evidencia_eccomerce}       
        Click Button                       ${button_pay_now}       
        ELSE       
        Click Element                      ${btn_masterCredit}                   
        Wait Until Element Is Visible      ${id=creditCard}                   ${delay}
        Input Text                         ${id=creditCard}                   ${credit_card}[number]
        Input Text                         ${name_cvv_number}                 ${credit_card}[cvv]
        Select From List By Label          ${name_mmListbox}                  ${credit_card}[month]
        Select From List By Label          ${name_yyyyListbox}                ${credit_card}[year]
        Input Text                         ${name_cardholder_name}            ${usuario_cadastrado}
        Sleep    1
        Capture Page Screenshot            ${evidencia_eccomerce}
        Click Button                       ${id_pay_now_btn_ManualPayment}    
    END
    

Validar pedido
    Wait Until Element Is Visible          ${message_finish}                   ${delay}
    Sleep    1       
    Capture Page Screenshot                ${evidencia_eccomerce}       
    Element Text Should Be                 ${message_finish}                   ${expected_message}
    ${tracking_number}    Get Text         ${id_trackingNumberLabel}           
    ${order_number}    Get Text            ${id_orderNumberLabel}           
    ${list}    Create List                 ${tracking_number}                  ${order_number}    
    Log                                    ${list}