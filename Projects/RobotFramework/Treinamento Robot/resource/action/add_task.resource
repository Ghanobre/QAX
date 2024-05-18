*** Settings ***

Library    SeleniumLibrary

*** Variables ***

@{list}    
...    Fazer o treinamento de Robot    
...    Criar um script    
...    Tomar notas    
...    Fazer os exercícios    
...    Estudar o conteudo

*** Keywords ***
Criar task
    FOR  ${element}  IN  @{list}
        Input Text    class:new-todo    ${element}
        Press Keys    class:new-todo    RETURN
    END
    Set Screenshot Directory    ./logs/screenshot
    Capture Page Screenshot

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
    Set Screenshot Directory    ./logs/screenshot
    Capture Page Screenshot