*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url}    https://the-internet.herokuapp.com/hovers

*** Test Cases ***
Verify mouse hover
    Open Browser    ${url}    firefox
    Maximize Browser Window

    # Hover on first image
    Wait Until Element Is Visible    xpath:(//div[@class='figure']//img)[1]
    Mouse Over                       xpath:(//div[@class='figure']//img)[1]

    # Validate user text after hover
    Wait Until Element Is Visible    xpath://h5[contains(text(),'name: user1')]
    Element Should Be Visible        xpath://h5[contains(text(),'name: user1')]

    Sleep    2s
    Close Browser