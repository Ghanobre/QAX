*** Settings ***
Library    Mainframe3270

*** Variables ***


*** Test Cases ***
Example
    Open Connection    host=185.113.5.134    port=23   
    Change Wait Time    wait_time=5.0
    Write Bare    GHANOBRE
    Execute Command    tab
    Write Bare    ghanobre1284
    Send Enter
    Write Bare In Position    1    ypos=020    xpos=007
    Send Enter
    Write Bare In Position    1    ypos=020    xpos=007
    Send Enter
    Write Bare In Position    1    ypos=020    xpos=007
    Send Enter
    # Send Enter
    # Page Should Contain String    CPF1296 - Sign-on information required.
    # Close Connection