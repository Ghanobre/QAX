*** Settings ***
Library    SeleniumLibrary

Resource    ../resource/base.resource

Test Teardown    finish session
  

*** Test Cases ***

Login with correct Username and Password
    [Tags]    teste1
    Open Browser    url=https://the-internet.herokuapp.com/login    browser=chrome
    Input Text    id:username    tomsmith
    Input Text    password    SuperSecretPassword!
    Capture Page Screenshot
    Click Button     class:radius
    Element Should Contain    id=flash    You logged into a secure area!
    Capture Page Screenshot    ${OUTPUTDIR}./screenshot/id_image_id-1.png 
    Click Link    Logout
    Close Browser

Add Tasks And Set To Complete
    [Tags]    teste2
    Set Screenshot Directory    ${path}
    Open Browser    url=https://todomvc.com/examples/typescript-angular/#/    browser=chrome
    Input Text    class:new-todo    Complete Robot Framework Training
    Press Keys    class:new-todo    RETURN
    Input Text    class:new-todo    Write Automated Tests
    Press Keys    class:new-todo    RETURN
    Input Text    class:new-todo    Take a nap
    Press Keys    class:new-todo    RETURN
    Capture Page Screenshot
    Element Text Should Be    class:todo-count    3 items left
    Click Element    xpath: //*[contains(text(), "Complete Robot Framework Training")]/../input
    Capture Page Screenshot
    Element Text Should Be    class:todo-count    2 items left
    Click Element    xpath: //*[contains(text(), "Write Automated Tests")]/../input
    Capture Page Screenshot
    Element Text Should Be    class:todo-count    1 item left
    Click Element    xpath: //*[contains(text(), "Take a nap")]/../input
    Capture Page Screenshot
    Element Text Should Be    class:todo-count    0 items left