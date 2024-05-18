*** Settings ***
Library    SeleniumLibrary
Library    ../resource/libs/totp.py

*** Test Cases ***
Login with MFA
    Open Browser  https://seleniumbase.io/realworld/login   browser=Chrome
    #Maximize Browser Window
    Set Window Size    width=1900    height=1200
    Input Text                       id=username    demo_user
    Input Text                       id=password    secret_pass
    ${totp}    Get Totp              GAXG2MTEOR3DMMDG
    Input Text                       id=totpcode     ${totp}
    Click Link                       log-in
    ${mensagem}    Get Text          //h1    
    Should Contain    ${mensagem}    Welcome!
    Click Link                       xpath://*[contains(text(),"Demo Page")]
    Close Window
    Switch Window
    #Titulo Demo Page
    Element Text Should Be           //h1    Demo Page
    #Titulo SeleniumBase 
    Element Text Should Be           //h2    SeleniumBase
    #Titulo Automation Practice
    Element Text Should Be           //h3    Automation Practice
    #Hover Dropdown
    Mouse Over                       myDropdown
    Click Element                    xpath=//*[@id="dropOption1"]
    Element Text Should Be           //h3    Link One Selected
    Sleep    0.5    
    Mouse Over                       myDropdown
    Click Element                    xpath=//*[@id="dropOption2"]
    Element Text Should Be           //h3    Link Two Selected
    Sleep    0.5    
    Mouse Over                       myDropdown
    Click Element                    xpath=//*[@id="dropOption3"]
    Element Text Should Be           //h3    Link Three Selected
    Sleep    0.5
    #Text Input Field:
    Input Text                       myTextInput    Passei por aqui
    #Textarea:   
    Input Text                       css=[class$=area1]    usando o ultimo valor do atributo
    #Pre-Filled Text Field:   
    Input Text                       preText2    Sobrescrevendo
    #Button Color   
    Click Button                     myButton
    #Placeholder Text Field:   
    Input Text                      placeholderText    INserido qualquer valor
    #falta o Read-Only Text Field:

    #HTML SVG with rect:
    Click Element                   svgRect
    #Paragraph with Text:      
    Element Text Should Be          css=[id="pText"]    This Text is Purple
    #Input Slider Control:
    Execute Javascript              document.getElementById("mySlider").value = "100";
    Mouse Over                      mySlider   
    #Progress Bar: (50%)
  
    Element Text Should Be          //*[@id="progressLabel"]    Progress Bar: (100%)

    #Select Dropdown:
    Select From List By Label       css=#mySelect    Set to 75%
    #HTML Meter: (75%)
    Page Should Contain Element     css=meter[value="0.75"]
    #Image in iFrame:
    Select Frame                    //iframe[@id="myFrame1"]
    Page Should Contain Image       //img
    Unselect Frame
    #Text in iFrame:
    Select Frame                    //iframe[@id="myFrame2"]
    Element Text Should Be          //h4    iFrame Text
    Unselect Frame
    #RadioButton
    Click Element                   radioButton2
    #CheckBox   
    Click Element                   checkBox1
    Click Element                   checkBox2
    Click Element                   checkBox3
    Click Element                   checkBox4
    #CheckBox in iFrame:   
    Select Frame                    //iframe[@id="myFrame3"]
    Click Element                   css=.fBox
    Unselect Frame   
    #Drag and Drop A:   
    Drag And Drop                   css=img#logo     css=div#drop2
    Page Should Contain Image       //div/img

    Close Window