*** Settings ***
Library           SeleniumLibrary
Test Setup        Open OrangeHRM Browser
Test Teardown     Close Browser

*** Variables ***
${URL}                https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${BROWSER}            chrome

${VALID_USERNAME}     Admin
${VALID_PASSWORD}     admin123
${INVALID_PASSWORD}   wrongpass

# Login Locators
${USERNAME_FIELD}     name=username
${PASSWORD_FIELD}     name=password
${LOGIN_BUTTON}       xpath=//button[@type='submit']
${LOGIN_ERROR}        xpath=//p[contains(@class,'alert-content-text')]

# Dashboard Locators
${DASHBOARD_HEADER}   xpath=//h6[text()='Dashboard']

# Personal Details Locators
${MY_INFO_MENU}       xpath=//span[text()='My Info']
${FIRST_NAME_FIELD}   name=firstName
# Refined locator to target the specific save button in the Personal Details section
${SAVE_BUTTON}        xpath=//h6[text()='Personal Details']/parent::div//button[@type='submit']

# Loader Locator
${FORM_LOADER}        xpath=//div[contains(@class,'oxd-form-loader')]

*** Test Cases ***

TC_01 Verify Successful Employee Login
    Given user enters valid username
    When user enters valid password
    And user clicks login button
    Then user should be logged in successfully

TC_02 Verify Error Message On Invalid Login
    Given user enters valid username
    When user enters invalid password
    And user clicks login button
    Then correct error message should be displayed

TC_03 Verify First Name Modification In Personal Details
    Given user logs into OrangeHRM
    When user navigates to personal details page
    And user updates first name safely
    Then first name should be updated successfully

*** Keywords ***

Open OrangeHRM Browser
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${USERNAME_FIELD}    20s

Given user enters valid username
    Input Text    ${USERNAME_FIELD}    ${VALID_USERNAME}

When user enters valid password
    Input Text    ${PASSWORD_FIELD}    ${VALID_PASSWORD}

When user enters invalid password
    Input Text    ${PASSWORD_FIELD}    ${INVALID_PASSWORD}

And user clicks login button
    Click Button    ${LOGIN_BUTTON}

Then user should be logged in successfully
    Wait Until Element Is Visible    ${DASHBOARD_HEADER}    20s

Then correct error message should be displayed
    Wait Until Element Is Visible    ${LOGIN_ERROR}    10s
    ${msg}=    Get Text    ${LOGIN_ERROR}
    Should Be Equal    ${msg}    Invalid credentials

Given user logs into OrangeHRM
    Input Text    ${USERNAME_FIELD}    ${VALID_USERNAME}
    Input Text    ${PASSWORD_FIELD}    ${VALID_PASSWORD}
    Click Button    ${LOGIN_BUTTON}
    Wait Until Element Is Visible    ${DASHBOARD_HEADER}    20s

When user navigates to personal details page
    Click Element    ${MY_INFO_MENU}
    Wait Until Element Is Not Visible    ${FORM_LOADER}    20s
    Wait Until Element Is Visible        ${FIRST_NAME_FIELD}    20s

And user updates first name safely
    Wait Until Element Is Not Visible    ${FORM_LOADER}    15s

    # Clean clear and input
    Press Keys    ${FIRST_NAME_FIELD}    CTRL+A+BACKSPACE
    Input Text    ${FIRST_NAME_FIELD}    SujanTest

    # Ensure button is clickable
    Wait Until Element Is Enabled    ${SAVE_BUTTON}    10s
    Click Button    ${SAVE_BUTTON}

    # Wait for the post-save loading state to finish
    Sleep    2s    # Short sleep to allow the app to process the save request
    Wait Until Element Is Not Visible    ${FORM_LOADER}    15s

Then first name should be updated successfully
    # Final verification of the value in the field
    Wait Until Element Is Visible    ${FIRST_NAME_FIELD}    10s
    ${updated_name}=    Get Value    ${FIRST_NAME_FIELD}
    Should Be Equal    ${updated_name}    SujanTest