# *** Settings ***
# Documentation    Ciar uma instancia no postegre

# Library    Browser

# *** Test Cases ***

# criar instancia no banco
    
#     New Browser    browser=chromium    headless=False
#     New Context    viewport={'width': 1920, 'height': 1080}
#     New Page       http://localhost:15432/
#     Fill Text      css=input[name=email]    admin@smartbit.com
#     Fill Text      css=input[name=password]    QAx@123
#     Click          css=button[value=Login]

#     Click        css=span[class=file-name]    right
#     Click        css=div[data-label=Register]
#     Click        css=li[data-label="Server..."]
#     Fill Text    css=input[aria-describedby="hc56"]    smartbit
#     Click        css=button[data-test=Connection]
#     Fill Text    css=input[name=host]    smartbit-db-1
#     Fill Text    css=input[name=username]    postgres
#     Scroll To    vertical=bottom
#     Fill Text    css=input[name="password"]    QAx@123
#     Click        css=button[data-label=Save]



#     Sleep    15