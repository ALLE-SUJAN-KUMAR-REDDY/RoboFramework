# A frame or iframe is an HTML document embedded inside another HTML page.
# frames will have ids
# frames will have name
# frames  will class
# with indexes 0 or 1


*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://jqueryui.com/datepicker/

*** Test Cases ***
Verify drop downs
    Open Browser    ${url}    firefox
    Maximize Browser Window
    Set Selenium Implicit Wait    3s

    Select Frame    xpath://iframe[@class='demo-frame']
    Sleep    2s

    Click Element    xpath://input[@id='datepicker']
    Sleep    2s

    Click Element    xpath://a[contains(text(),'21')]
    Unselect Frame
    Close Browser
