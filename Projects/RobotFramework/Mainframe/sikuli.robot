*** Settings ***
Library    SikuliLibrary


*** Test Cases ***
Abrir e Automatizar Mainframe
    Iniciar sessao
    Navegar sistema
    Encerrar sessao
    Finalizar teste


*** Keywords ***
Carrega os elementos do app
    Add Image Path    ${EXECDIR}\\Projects\\RobotFramework\\Mainframe\\Elements

Iniciar sessao
    Carrega os elementos do app
    Click    sessao.png

Navegar sistema
    Set Wait Scan Rate    10
    Capture Screen
    Sleep    15
    Paste Text    image=user.png    text=GHANOBRE
    Press Special Key    TAB
    Paste Text    image=pass.png    text=ghanobre1284
    Capture Screen
    Press Special Key    ENTER
    Paste Text    image=comand.png    text=1
    Capture Screen
    Capture Screen
    Press Special Key    ENTER
    Paste Text    image=comand.png    text=1
    Capture Screen
    Press Special Key    ENTER
    Paste Text    image=comand.png    text=1
    Capture Screen
    Press Special Key    ENTER
    Capture Screen
    Press Special Key    F3
    Capture Screen
    Press Special Key    F3
    Capture Screen
    Paste Text    image=comand.png    text=2
    Capture Screen
    Press Special Key    ENTER
    Capture Screen
    Paste Text    image=comand.png    text=2
    Capture Screen
    Press Special Key    ENTER
    Capture Screen
    Paste Text    image=comand.png    text=5
    Capture Screen
    Press Special Key    ENTER
    Capture Screen
    Paste Text    image=comand.png    text=5
    Capture Screen
    Press Special Key    ENTER
    Capture Screen
    Paste Text    image=comand.png    text=3
    Capture Screen
    Press Special Key    ENTER
    Capture Screen
    Press Special Key    F3
    Capture Screen
    Press Special Key    F3
    Capture Screen
    Press Special Key    F3
    Capture Screen
    Press Special Key    F3
    Capture Screen
    Press Special Key    F3
    Capture Screen


Encerrar sessao
    Stop Remote Server

Finalizar teste
    Capture Screen
    Close Application    wc3270.exe  