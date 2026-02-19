*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}     chrome
${RADIO_URL}   https://www.tutorialspoint.com/selenium/practice/radio-button.php
${CHECK_URL}   https://www.tutorialspoint.com/selenium/practice/check-box.php

*** Test Cases ***
Select Impressive Radio Button And Both Check Boxes
    Open Browser    ${RADIO_URL}    ${BROWSER}
    Maximize Browser Window

    # --- RADIO BUTTON ---
    Wait Until Element Is Visible    xpath=//label[contains(text(),'Impressive')]    10s
    Click Element    xpath=//label[contains(text(),'Impressive')]

    Sleep    2s

    # --- CHECK BOX PAGE ---
    Go To    ${CHECK_URL}

    Wait Until Element Is Visible    xpath=//input[@id='c_bs_1']    10s

    # Click Main Level 1
    Click Element    xpath=//input[@id='c_bs_1']

    # Click Main Level 2
    Click Element    xpath=//input[@id='c_bs_2']

    Sleep    2s
    Close Browser
