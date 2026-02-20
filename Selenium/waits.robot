*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://www.amazon.in/

*** Test Cases ***
Wait Examples
    Open Browser    ${url}    chrome
    Maximize Browser Window

    # ✅ Implicit Wait (Global)
    Set Selenium Implicit Wait    10s

    # ✅ Explicit Wait – element visible
    Wait Until Element Is Visible    xpath=//input[@id='twotabsearchtextbox']    15s

    # ✅ Explicit Wait – page contains text
    Wait Until Page Contains    Best Sellers    15s

    # ✅ Explicit Wait – element enabled
    Wait Until Element Is Enabled    xpath=//input[@id='twotabsearchtextbox']    10s

    # ✅ Static Wait (not recommended, but useful for demo)
    Sleep    3s

    Close Browser