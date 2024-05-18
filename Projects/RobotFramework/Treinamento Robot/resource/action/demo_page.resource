*** Settings ***
Documentation    Açôes relacionadas a demo page

Library    SeleniumLibrary

*** Variables ***

${demo_page}               https://seleniumbase.io/demo_page
${h1}                      //h1
${text_h1}                 Demo Page
${h2}                      //h2
${text_h2}                 SeleniumBase
${h3}                      //h3
${text_h3}                 Automation Practice
${id_myDropdown}           myDropdown
${list_h3_1}               Link One Selected    
${list_h3_2}               Link Two Selected    
${list_h3_3}               Link Three Selected
${link_dropdown_1}         xpath=//*[@id="dropOption1"]
${link_dropdown_2}         xpath=//*[@id="dropOption2"]
${link_dropdown_3}         xpath=//*[@id="dropOption3"]
${id_myTextInput}          myTextInput
${text_myTextInput}        Usando o locator        
${id_myTextarea}           css=#myTextarea
${text_myTextarea}         Selector CSS
${id_myTextInput2}         myTextInput2
${text_myTextInput2}       usando o mesmo selector
${id_placeholderText}      xpath=//input[@id='placeholderText']
${text_placeholderText}    Usando o fullpath
${id_myButton}             xpath=//*[@id="myButton"]
${id_svgRect}              svgRect
${id_pText}                css=[id="pText"]
${text_pText}              This Text is Purple
${id_mySlider}             document.getElementById("mySlider").value= "100"
${mySlider}                mySlider
${id_progressLabel}        xpath=//*[@id="progressLabel"]
${text_progressLabel}      Progress Bar: (100%)
${id_mySelect}             mySelect
${text_mySelect}           Set to 75%
${id_meter}                css=meter[value="0.75"]
${id_myFrame1}             xpath=//*[@id="myFrame1"]
${tag_img}                 //img
${id_myFrame2}             //iframe[@id="myFrame2"]
${h4}                      //h4
${text_h4}                 iFrame Text
${id_radioButton2}         css=[id="radioButton2"]
${id_myFrame3}             //iframe[@id="myFrame3"]
${id_checkBox6}            css=#checkBox6
${id_checkBox1}            css=#checkBox1
${id_checkBox2}            css=#checkBox2
${id_checkBox3}            css=#checkBox3
${id_checkBox4}            css=#checkBox4
${id_checkBox5}            css=#checkBox5
${img_logo}                css=img#logo
${div_drop2}               css=div#drop2              

*** Keywords ***

Validar titulo Demo Page
    Element Text Should Be           ${h1}                    ${text_h1}
    Element Text Should Be           ${h2}                    ${text_h2}
    Element Text Should Be           ${h3}                    ${text_h3}

Mover Hover Dropdown      
    Mouse Over                       ${id_myDropdown}      
    Click Link                       ${link_dropdown_1}          
    Element Text Should Be           ${h3}                    ${list_h3_1}
    Mouse Over                       ${id_myDropdown}      
    Click Link                       ${link_dropdown_2}          
    Element Text Should Be           ${h3}                    ${list_h3_2}    
    Mouse Over                       ${id_myDropdown}      
    Click Link                       ${link_dropdown_3}      
    Element Text Should Be           ${h3}                    ${list_h3_3}
    
Inserindo Texto na pagina       
    Input Text                       ${id_myTextInput}        ${text_myTextInput}    
    Input Text                       ${id_myTextarea}         ${text_myTextarea}    
    Input Text                       ${id_myTextInput2}       ${id_myTextInput2}   
    Input Text                       ${id_placeholderText}    ${text_placeholderText}        

Button: color
    Click Button                     ${id_myButton}    
    Click Element                    ${id_svgRect}    
    Element Text Should Be           ${id_pText}              ${text_pText}     

Input Slider Control:
    Execute Javascript               ${id_mySlider}    
    Mouse Over                       ${mySlider}
    Element Text Should Be           ${id_progressLabel}      ${text_progressLabel}        

Select Dropdown:
    Select From List By Label        ${id_mySelect}           ${text_mySelect}        
    Page Should Contain Element      ${id_meter}

Image in iFrame
    Select Frame                     ${id_myFrame1}    
    Page Should Contain Image        ${tag_img}    
    Unselect Frame
    
    Select Frame                     ${id_myFrame2}                
    Element Text Should Be           ${h4}                    ${text_h4}    
    Unselect Frame                  
    Click Element                    ${id_radioButton2}    

    Select Frame                     ${id_myFrame3}    
    Click Element                    ${id_checkBox6}              
    Unselect Frame
    
Check BOX
    Click Element                    ${id_checkBox1}
    Click Element                    ${id_checkBox2}
    Click Element                    ${id_checkBox3}
    Click Element                    ${id_checkBox4}
    Click Element                    ${id_checkBox5}

    
Realizando Drag and drop
    Drag And Drop                    ${img_logo}              ${div_drop2}
