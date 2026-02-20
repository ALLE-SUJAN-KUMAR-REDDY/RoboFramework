*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://rahulshettyacademy.com/AutomationPractice/

*** Test Cases ***
Open Window Example
    Open Browser    ${url}    chrome
    Maximize Browser Window

    # Click Open Window button
    Click Element    id=openwindow

    # Wait until new window opens (works in all versions)
    Wait Until Keyword Succeeds    10s    1s    Check Window Count

    # Switch to newly opened window
    Switch Window    NEW

    # Just validate page loaded
    Wait Until Page Contains    Rahul Shetty Academy    10s

    # Switch back to main window
    Switch Window    MAIN

    Close Browser

*** Keywords ***
Check Window Count
    @{windows}=    Get Window Handles
    Length Should Be    ${windows}    2
