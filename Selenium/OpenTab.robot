*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://rahulshettyacademy.com/AutomationPractice/

*** Test Cases ***
Open Tab Example
    Open Browser    ${url}    chrome
    Maximize Browser Window

    # Click Open Tab button
    Click Element    id=opentab

    # Wait until new tab opens
    Wait Until Keyword Succeeds    10s    1s    Check Tab Count

    # Switch to new tab
    Switch Window    NEW

    # Validate page
    Wait Until Page Contains    Rahul Shetty Academy    10s

    # Switch back to main tab
    Switch Window    MAIN

    Close Browser

*** Keywords ***
Check Tab Count
    @{windows}=    Get Window Handles
    Length Should Be    ${windows}    2