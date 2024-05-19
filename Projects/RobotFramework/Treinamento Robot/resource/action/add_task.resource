*** Settings ***

Library    SeleniumLibrary

*** Variables ***
${page}              https://todomvc.com/examples/typescript-angular/#/
${evidencia_task}    ${OUTPUT_DIR}/Screenshot/add_task/evidencia{index}.png 
@{list}    
...                  Fazer o treinamento de Robot    
...                  Criar um script    
...                  Tomar notas    
...                  Fazer os exercícios    
...                  Estudar o conteudo
${class_new-todo}    class:new-todo

*** Keywords ***
Criar task
    FOR  ${element}  IN  @{list}
        Input Text    ${class_new-todo}    ${element}
        Press Keys    ${class_new-todo}    RETURN
    END
    Capture Page Screenshot    ${evidencia_task}

Concluir task
     Element Text Should Be    class:todo-count    5 items left
    Click Element    //*[contains(text(),"${list}[0]")]/../input
    Element Text Should Be    class:todo-count    4 items left
    Click Element    //*[contains(text(),"${list}[1]")]/../input
    Element Text Should Be    class:todo-count    3 items left
    Click Element    //*[contains(text(),"${list}[2]")]/../input
    Element Text Should Be    class:todo-count    2 items left
    Click Element    //*[contains(text(),"${list}[3]")]/../input
    Element Text Should Be    class:todo-count    1 item left
    Click Element    //*[contains(text(),"${list}[4]")]/../input
    Element Text Should Be    class:todo-count    0 items left
    Capture Page Screenshot    ${evidencia_task}