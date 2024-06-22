*** Settings ***
Documentation        Realizar compra em um site de ecomerce

Library     SeleniumLibrary
Resource    ../resource/base.resource

Test Setup       Start execution
Test Teardown    Finish execution


*** Test Cases ***

realizar uma compra com sucesso
   [Tags]    sucesso    
   Selecinar um produto
   Escolher produto
   Realizar checkout
   verificar usuario
   Pagamento
   Validar pedido

realizar uma compra com impedimeto
   [Tags]    impedimento
   Selecinar um produto
   Escolher produto
   Realizar checkout
   Usario invalido
   Validar mensagem impeditiva
   