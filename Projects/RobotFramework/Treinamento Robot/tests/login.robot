*** Settings ***
Documentation    Realizar login na pagina

Resource    ../resource/base.resource

Test Setup        Start execution    ${pagina}     
#Test Teardown     Finish execution

*** Test Cases ***
Login com sucesso
    Realizar o login
    Validar login com sucesso
    Press Keys    None    CTRL+T

# login com erro user    
#     login com erro no usuario
#     Mensagem impeditiva    ${inv_user}

# login com erro password
#     login com erro na senha
#     Mensagem impeditiva    ${inv_pass}
    

