*** Settings ***
Library    SeleniumLibrary
Library    String
Suite Setup    Open Bank Application
Suite Teardown    Close All Browsers

*** Variables ***
${URL}           https://www.globalsqa.com/angularJs-protractor/BankingProject/#/account
${BROWSER}       chrome

${FIRSTNAME}     Test
${LASTNAME}      User
${POSTCODE}      500001
${CUSTOMER}      Test User
${CURRENCY}      Dollar

${DEPOSIT}       500
${WITHDRAW}      200

# ================= LOCATORS =================

# Home & Login
${HOME_BTN}            xpath=//button[text()='Home']
${MANAGER_LOGIN}      xpath=//button[text()='Bank Manager Login']
${CUSTOMER_LOGIN}     xpath=//button[text()='Customer Login']
${LOGIN_BTN}          xpath=//button[text()='Login']

# Manager
${ADD_CUSTOMER_TAB}    xpath=//button[@ng-click='addCust()']
${OPEN_ACCOUNT_TAB}    xpath=//button[@ng-click='openAccount()']

${FIRSTNAME_INPUT}    xpath=//input[@placeholder='First Name']
${LASTNAME_INPUT}     xpath=//input[@placeholder='Last Name']
${POSTCODE_INPUT}     xpath=//input[@placeholder='Post Code']
${ADD_CUSTOMER_BTN}   xpath=//button[text()='Add Customer']

${CUSTOMER_DROPDOWN}  id=userSelect
${CURRENCY_DROPDOWN}  id=currency
${PROCESS_BTN}        xpath=//button[text()='Process']

# Customer Account
${DEPOSIT_TAB}        xpath=//button[@ng-click='deposit()']
${WITHDRAW_TAB}       xpath=//button[@ng-click='withdrawl()']
${AMOUNT_INPUT}       xpath=//input[@ng-model='amount']

# Specific buttons to avoid clicking the wrong one
${DEPOSIT_SUBMIT}     xpath=//button[@type='submit' and text()='Deposit']
${WITHDRAW_SUBMIT}    xpath=//button[@type='submit' and text()='Withdraw']

${ACCOUNT_INFO}       xpath=//div[contains(text(),'Account Number')]
${SUCCESS_MSG}        xpath=//span[@ng-show='message']

*** Test Cases ***
End To End Banking Flow Validation
    Go To Home Page
    Manager Login
    Add Customer
    Open Account
    Go To Home Page
    Customer Login
    Capture Initial Balance
    Deposit Money
    Withdraw Money
    Validate Balance Delta

*** Keywords ***
Open Bank Application
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Implicit Wait    10s

Go To Home Page
    Wait Until Element Is Visible    ${HOME_BTN}    15s
    Click Button    ${HOME_BTN}

Manager Login
    Wait Until Element Is Visible    ${MANAGER_LOGIN}    10s
    Click Button    ${MANAGER_LOGIN}

Add Customer
    Wait Until Element Is Visible    ${ADD_CUSTOMER_TAB}    10s
    Click Button    ${ADD_CUSTOMER_TAB}
    Input Text    ${FIRSTNAME_INPUT}    ${FIRSTNAME}
    Input Text    ${LASTNAME_INPUT}     ${LASTNAME}
    Input Text    ${POSTCODE_INPUT}     ${POSTCODE}
    Click Button    ${ADD_CUSTOMER_BTN}
    Handle Alert    ACCEPT

Open Account
    Wait Until Element Is Visible    ${OPEN_ACCOUNT_TAB}    10s
    Click Button    ${OPEN_ACCOUNT_TAB}
    Select From List By Label    ${CUSTOMER_DROPDOWN}    ${CUSTOMER}
    Select From List By Label    ${CURRENCY_DROPDOWN}    ${CURRENCY}
    Click Button    ${PROCESS_BTN}
    Handle Alert    ACCEPT

Customer Login
    Wait Until Element Is Visible    ${CUSTOMER_LOGIN}    10s
    Click Button    ${CUSTOMER_LOGIN}
    Select From List By Label    ${CUSTOMER_DROPDOWN}    ${CUSTOMER}
    Click Button    ${LOGIN_BTN}

Capture Initial Balance
    Wait Until Element Is Visible    ${ACCOUNT_INFO}    10s
    ${text}=    Get Text    ${ACCOUNT_INFO}
    ${bal}=     Evaluate    int('${text}'.split('Balance : ')[1].split(' ,')[0])
    Set Test Variable    ${INITIAL_BALANCE}    ${bal}
    Log    Initial Balance = ${INITIAL_BALANCE}

Deposit Money
    Wait Until Element Is Visible    ${DEPOSIT_TAB}    10s
    Click Button    ${DEPOSIT_TAB}
    Input Text    ${AMOUNT_INPUT}    ${DEPOSIT}
    Click Button    ${DEPOSIT_SUBMIT}
    Wait Until Element Is Visible    ${SUCCESS_MSG}
    Element Should Contain    ${SUCCESS_MSG}    Deposit Successful

Withdraw Money
    Wait Until Element Is Visible    ${WITHDRAW_TAB}    10s
    Click Button    ${WITHDRAW_TAB}
    # Wait for the Angular UI to switch the form context from Deposit to Withdraw
    Sleep    1s
    Input Text    ${AMOUNT_INPUT}    ${WITHDRAW}
    Click Button    ${WITHDRAW_SUBMIT}
    Wait Until Element Is Visible    ${SUCCESS_MSG}
    Element Should Contain    ${SUCCESS_MSG}    Transaction successful

Validate Balance Delta
    # Wait a moment for the DOM to update the balance text
    Sleep    1s
    ${text}=    Get Text    ${ACCOUNT_INFO}
    ${final}=   Evaluate    int('${text}'.split('Balance : ')[1].split(' ,')[0])

    ${delta}=    Evaluate    ${final}-${INITIAL_BALANCE}
    ${expected_delta}=    Evaluate    ${DEPOSIT}-${WITHDRAW}

    Log    Final Balance: ${final} | Expected Delta: ${expected_delta} | Actual Delta: ${delta}
    Should Be Equal As Numbers    ${delta}    ${expected_delta}
    Log     Balance delta validated | Initial=${INITIAL_BALANCE} | Final=${final}