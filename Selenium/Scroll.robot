*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}        https://www.amazon.in
${BROWSER}    chrome


*** Test Cases ***
Scroll Amazon Page And Capture Links
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Implicit Wait    10s

    # Scroll down multiple times to load dynamic content
    FOR    ${i}    IN RANGE    1    8
        Execute Javascript    window.scrollBy(0, 1500)
        Sleep    2s
    END

    # Get all anchor (<a>) elements after scrolling
    @{links}=    Get WebElements    xpath://a

    FOR    ${link}    IN    @{links}
        ${text}=    Get Text    ${link}
        ${href}=    Get Element Attribute    ${link}    href

        IF    '${href}' != 'None'
            Log To Console    Text: ${text}
            Log To Console    URL: ${href}
            Log To Console    ---------------------
        END
    END

    Close Browser