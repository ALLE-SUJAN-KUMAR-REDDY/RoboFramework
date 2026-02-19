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
        # wait till the element is loaded
        Sleep    3s
        # wait till the element is loaded
        Wait Until Element Is Visible    xpath://input[@value = 'radio1']
        # click login button
        Click Element    xpath://input[@value = 'radio1']
        # click on check box 3
        Click Element    id=checkBoxOption3
        # close Browser
        Close Browser




