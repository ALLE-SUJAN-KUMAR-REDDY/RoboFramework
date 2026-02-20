*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url}        https://the-internet.herokuapp.com/upload
${file_path}  C:\\Users\\Sujan Kumar Reddy\\Downloads\\some-file.txt

*** Test Cases ***
Verify file upload
    Open Browser    ${url}    firefox
    Maximize Browser Window

    Wait Until Element Is Visible    xpath://input[@id='file-upload']
    Choose File    xpath://input[@id='file-upload']    ${file_path}

    Click Element    xpath://input[@id='file-submit']

    Wait Until Element Is Visible    xpath://h3[text()='File Uploaded!']
    Element Text Should Be           xpath://h3[text()='File Uploaded!']    File Uploaded!

    Close Browser