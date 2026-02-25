# selecting  by visible text
# selecting by index
# selecting the value 
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://rahulshettyacademy.com/AutomationPractice/

*** Test Cases ***
Verify drop downs
    Open Browser    ${url}    firefox
    # maximize the browser window
    Maximize Browser Window

    # wait till dropdown is visible
    Wait Until Element Is Visible    id=dropdown-class-example

    # get all selected labels
    @{labels}=    Get Selected List Labels    id=dropdown-class-example
    Log    ${labels}

    # select by label - visible text
    Select From List By Label    id=dropdown-class-example    Option3
    Sleep    2s

    # select by index
    Select From List By Index    id=dropdown-class-example    2
    Sleep    2s

    # select by value
    Select From List By Value    id=dropdown-class-example    option1
    Sleep    2s

    Close Browser
