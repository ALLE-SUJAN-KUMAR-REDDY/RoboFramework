*** Settings ***
Library     SeleniumLibrary
Library     DataDriver       file=C:/Users/Sujan Kumar Reddy/PycharmProjects/RoboFramework/TestData/ddtLogindataCSV.csv    sheetname=ddtLogindataCSV
# test template provide a data-driven approach to testing by allowing a single keyword (the template)
#to be executed multiple times with different data sets.
Test Template       Login Test
Test Setup     Open Browser        https://opensource-demo.orangehrmlive.com/web/index.php/auth/login      firefox
Test Teardown      Close Browser
*** Test Cases ***
Login with user     ${username} and     ${password}
*** Keywords ***
Login Test
        [Arguments]     ${username}     ${password}
           # wait till the element is loaded
        Wait Until Element Is Visible    xpath://input[@name = 'username']
        # enter the text in the username field
        Input Text    xpath://input[@name = 'username']    ${username}
        # enter text into the password
        Input Text    xpath://input[@name = 'password']   ${password}
        # clikc login button
        Click Element    xpath://button[@type= 'submit']
        # validate that the user is on the home page
        Wait Until Element Is Visible    xpath://h6[@class='oxd-text oxd-text--h6 oxd-topbar-header-breadcrumb-module']
        Element Should Be Visible    xpath://h6[@class='oxd-text oxd-text--h6 oxd-topbar-header-breadcrumb-module']
        # close browser
