*** Settings ***
Documentation        Realizar compra em um site de ecomerce

Library     SeleniumLibrary
Resource    ../resource/base.resource

Test Setup       Start execution
Test Teardown    Finish execution


*** Test Cases ***
realizar uma compra com sucesso
   Selecinar um produto
   Escolher produto
   Realizar checkout
   verificar usuario
   Pagamento
   Validar pedido