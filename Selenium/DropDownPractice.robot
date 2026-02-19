*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://www.tutorialspoint.com/selenium/practice/selenium_automation_practice.php

*** Test Cases ***
Verify State And City drop downs
    Open Browser    ${url}    firefox
    # maximize the browser window
    Maximize Browser Window

    # wait till state dropdown is visible
    Wait Until Element Is Visible    id=state

    # select state by label
    Select From List By Label    id=state    Uttar Pradesh
    Sleep    2s

    # wait till city dropdown is visible
    Wait Until Element Is Visible    id=city

    # select city by label
    Select From List By Label    id=city    Lucknow
    Sleep    2s

    Close Browser
