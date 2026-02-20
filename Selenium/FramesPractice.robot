*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.tutorialspoint.com/selenium/practice/frames.php

*** Test Cases ***
Identify Frames And Print Text
    Open Browser    ${URL}    firefox
    Maximize Browser Window
    Set Selenium Implicit Wait    5s

    # -------- IFRAME 1 --------
    Select Frame    xpath=(//iframe)[1]
    ${text1}=    Get Text    xpath=//body
    Log To Console    ===== IFRAME 1 TEXT =====
    Log To Console    ${text1}

    Unselect Frame
    Sleep    2s

    # -------- IFRAME 2 --------
    Select Frame    xpath=(//iframe)[2]
    ${text2}=    Get Text    xpath=//body
    Log To Console    ===== IFRAME 2 TEXT =====
    Log To Console    ${text2}

    Unselect Frame
    Sleep    2s

    Close Browser