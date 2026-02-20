*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url}    https://the-internet.herokuapp.com/drag_and_drop

*** Test Cases ***
Verify drag and drop
    Open Browser    ${url}    firefox
    Maximize Browser Window

    Wait Until Element Is Visible    id:column-a
    Sleep    2s

    Drag And Drop    id:column-a    id:column-b
    Sleep    2s

    Close Browser