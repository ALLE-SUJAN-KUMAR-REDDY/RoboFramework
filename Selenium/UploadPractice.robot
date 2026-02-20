*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url}        https://www.tutorialspoint.com/selenium/practice/upload-download.php
${file_path}  ${CURDIR}\\some-file.txt

*** Test Cases ***
Verify file upload
    Open Browser    ${url}    firefox
    Maximize Browser Window

    Wait Until Element Is Visible    xpath://input[@type='file']
    Choose File    xpath://input[@type='file']    ${file_path}

    Sleep    2s
    Close Browser