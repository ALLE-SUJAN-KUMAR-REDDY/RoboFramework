*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://the-internet.herokuapp.com/download

*** Test Cases ***
Download file and print link
    Open Browser    ${url}    firefox
    Maximize Browser Window

    # Choose the file name you want to download
    ${file_name}=    Set Variable    demo-file.txt

    # Get the download link (href attribute)
    ${download_link}=    Get Element Attribute    xpath=//a[text()='${file_name}']    href
    Log    Download link is: ${download_link}

    # Click the link to download
    Click Element    xpath=//a[text()='${file_name}']

    Sleep    5s
    Close Browser
