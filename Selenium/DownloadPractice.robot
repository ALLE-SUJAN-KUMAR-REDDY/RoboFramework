*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem

*** Variables ***
${url}            https://www.tutorialspoint.com/selenium/practice/upload-download.php
${download_dir}   C:/Users/Sujan Kumar Reddy/Downloads
${file_name}      sampleFile.jpeg

*** Test Cases ***
Verify file download
    Open Browser    ${url}    firefox
    Maximize Browser Window

    # click on Download button
    Wait Until Element Is Visible    xpath://a[normalize-space()='Download']
    Click Element    xpath://a[normalize-space()='Download']

    # wait for file to download
    Sleep    5s

    # verify file exists in Downloads folder
    File Should Exist    ${download_dir}/${file_name}

    Close Browser