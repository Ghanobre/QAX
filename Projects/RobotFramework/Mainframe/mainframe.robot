*** Settings ***
Library    Mainframe3270

*** Variables ***


*** Test Cases ***
Example
    Open Connection    host=127.0.0.1    port=23
    Change Wait Time    0.4 seconds
    Change Wait Time After Write    0.4 seconds
    Set Screenshot Folder    C:\\Temp\\IMG
    ${value}    Read    3    10    17
    Page Should Contain String    ENTER APPLICATION
    Wait Field Detected
    Write Bare    applicationname
    Send Enter
    Take Screenshot        
    Close Connection