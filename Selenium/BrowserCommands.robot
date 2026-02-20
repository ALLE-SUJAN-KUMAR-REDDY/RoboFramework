*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}        https://the-internet.herokuapp.com/
${BROWSER}    firefox

*** Test Cases ***
Verify Browser Commands Step By Step
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    Wait Until Page Contains    Welcome to the-internet    10s
    Sleep    2s

    Click Link    link=Form Authentication
    Wait Until Page Contains    Login Page    10s
    Sleep    3s

    Go Back
    Wait Until Page Contains    Welcome to the-internet    10s
    Sleep    3s

    Go To    ${URL}/login
    Wait Until Page Contains    Login Page    10s
    Sleep    3s

    Reload Page
    Sleep    3s

    Close Browser