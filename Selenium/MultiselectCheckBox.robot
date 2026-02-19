*** Settings ***
Library     SeleniumLibrary
Library    XML


*** Variables ***
${url}      https://rahulshettyacademy.com/AutomationPractice/


*** Test Cases ***
Verify radio buttons
        Open Browser        ${url}      firefox
        # maximize the browser windows
        Maximize Browser Window
        # identify the common elements attribute - //input[@type = 'checkbox']
        ${elements} =       Get Element    xpath://input[@type = 'checkbox']
        FOR    ${element}    IN    @{elements}
           Click Element    ${element}
           Sleep    2s
        END
        # close Browser
        Close Browser