*** Settings ***
Library     SeleniumLibrary
Library    XML

*** Variables ***
${url}      https://opensource-demo.orangehrmlive.com/web/index.php/auth/login


*** Test Cases ***
Verify login scenario with valid credentials
        Open Browser        ${url}      firefox
        # maximize the browser windows
        Maximize Browser Window
        # wait till the element is loaded
        Wait Until Element Is Visible    xpath://input[@name = 'username']
        # enter the text in the username field
        Input Text    xpath://input@name = 'username']    admin
        # enter text into the password
        Input Text    xpath://input[@name = 'password']    admin123
        # click login button
        Click Element    xpath://button@type= 'submit']
        # validate that the user is on the home page
        Wait Until Element Is Visible    xpath://h6[@class='oxd-text oxd-text--h6 oxd-topbar-header-breadcrumb-module']
        Element Should Be Visible    xpath://h6[@class='oxd-text oxd-text--h6 oxd-topbar-header-breadcrumb-module']
        # close browser
        Close Browser
        