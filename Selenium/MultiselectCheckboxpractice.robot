*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}      https://www.tutorialspoint.com/selenium/practice/check-box.php
${BROWSER}  firefox

*** Test Cases ***
Select Both Main Level Checkboxes Using Common XPath
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    Wait Until Element Is Visible    xpath=//input[@type='checkbox' and starts-with(@id,'c_bs_')]    10s

    ${elements}=    Get WebElements    xpath=//input[@type='checkbox' and starts-with(@id,'c_bs_')]

    FOR    ${element}    IN    @{elements}
        ${status}=    Run Keyword And Return Status    Checkbox Should Be Selected    ${element}
        IF    not ${status}
            Click Element    ${element}
        END
    END

    Sleep    2s
    Close Browser
