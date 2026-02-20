*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url}        https://the-internet.herokuapp.com/upload
${page_shot}  ${CURDIR}\\page.png
${elem_shot}  ${CURDIR}\\upload_element.png

*** Test Cases ***
Verify screenshot functionality
    Open Browser    ${url}    firefox
    Maximize Browser Window

    Wait Until Element Is Visible    id:file-upload

    # capture full page screenshot
    Capture Page Screenshot          ${page_shot}

    # capture element screenshot
    Capture Element Screenshot       id:file-upload    ${elem_shot}

    Sleep    2s
    Close Browser