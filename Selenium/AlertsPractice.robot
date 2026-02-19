*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://www.tutorialspoint.com/selenium/practice/alerts.php

*** Test Cases ***
Verify alerts
    Open Browser    ${url}    firefox
    Maximize Browser Window

    # -------- Simple Alert --------
    Click Element    xpath=//button[text()='Alert']
    Sleep    2s
    Handle Alert    action=ACCEPT
    Sleep    2s

    # -------- Alert after 5 seconds --------
    Click Element    xpath=(//button[text()='Click Me'])[1]
    Sleep    6s
    Handle Alert    action=ACCEPT
    Sleep    2s

    # -------- Confirmation Alert --------
    Click Element    xpath=(//button[text()='Click Me'])[2]
    Sleep    2s
    Handle Alert    action=DISMISS
    Sleep    2s

    # -------- Prompt Alert --------
    Click Element    xpath=(//button[text()='Click Me'])[3]
    Sleep    2s
    Input Text Into Alert    Sujan
    Handle Alert    action=ACCEPT
    Sleep    2s

    Close Browser
