*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://rahulshettyacademy.com/AutomationPractice/

*** Test Cases ***
Verify two alerts
    Open Browser    ${url}    firefox
    Maximize Browser Window

    # Scroll to alert section
    Scroll Element Into View    id=alertbtn
    Sleep    2s

    # -------- Simple Alert --------
    Click Element    id=alertbtn
    Sleep    1s
    Handle Alert    action=ACCEPT
    Sleep    2s

    # -------- Confirm Alert --------
    Click Element    id=confirmbtn
    Sleep    1s
    Handle Alert    action=DISMISS
    Sleep    2s

    Close Browser
