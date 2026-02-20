*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${url}     https://www.amazon.in
${browser}    firefox


*** Test Cases ***
Verify link texts
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Selenium Implicit Wait    5s

    @{links}=    Get WebElements    xpath://a
    FOR    ${link}    IN    @{links}
        ${text}=    Get Text    ${link}
        ${href}=    Get Element Attribute    ${link}    href
        Log To Console    Text: ${text}
        Log To Console    URL: ${href}
    END

    Close Browser