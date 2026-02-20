*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url}    https://www.amazon.in/

*** Test Cases ***
Verify radio buttons
    Open Browser    ${url}    firefox
    Maximize Browser Window

    Sleep    3s

    # Right click on Sell
    Wait Until Element Is Visible    xpath://a[normalize-space()='Sell']
    Open Context Menu                link=Sell
    Sleep    2s

    # Double click on Mobiles
    Double Click Element             xpath://a[normalize-space()='Mobiles']
    Sleep    2s

    Close Browser