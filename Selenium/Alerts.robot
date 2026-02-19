*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://the-internet.herokuapp.com/javascript_alerts

*** Test Cases ***
Verify drop downs
    Open Browser    ${url}    firefox
    # maximize the browser window
    Maximize Browser Window

    # wait till element is visible
    Wait Until Element Is Visible    xpath=(//button)[1]

    # Information alert - accept is for ok button
    Click Element    xpath=(//button)[1]
    Handle Alert    action=ACCEPT    timeout=3
    Sleep    5s

    # Confirmation alert - accept is for ok button, dismiss is for cancel button
    Click Element    xpath=(//button)[2]
    Handle Alert    action=DISMISS    timeout=3
    Sleep    5s

    # Prompt alert - accept is for ok button, dismiss is for cancel button
    Click Element    xpath=(//button)[3]
    Input Text Into Alert    Hello
    Sleep    5s
    Close Browser
