*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     Collections

*** Variables ***
${url}              https://the-internet.herokuapp.com/download
${download_path}    C:/Users/Sujan Kumar Reddy/Downloads
${file_name}        some-file.txt

*** Test Cases ***
Verify file download
    Open Browser    ${url}    firefox
    Maximize Browser Window

    Wait Until Element Is Visible    xpath://a[normalize-space()='${file_name}']
    Click Element    xpath://a[normalize-space()='${file_name}']

    Sleep    5s

    ${files}=    List Files In Directory    ${download_path}
    List Should Contain Value    ${files}    ${file_name}

    Close Browser