*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn

Suite Setup    Setup Variables
Test Teardown    Close Browser

*** Variables ***
${URL}        https://automationexercise.com
${PASSWORD}   Test@123
${SEARCH}     Top

*** Keywords ***
Setup Variables
    ${rand}=    Evaluate    random.randint(1000,9999)    random
    Set Suite Variable    ${EMAIL}    sujan_${rand}@mail.com

Open Firefox
    Open Browser    ${URL}    firefox
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//body    20s

Open Chrome
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//body    20s

Click Signup Login
    Wait Until Element Is Visible    xpath=//a[contains(text(),'Signup')]    20s
    Click Element    xpath=//a[contains(text(),'Signup')]

Login User
    [Arguments]    ${email}    ${password}
    Wait Until Element Is Visible    xpath=//input[@data-qa='login-email']    20s
    Input Text    xpath=//input[@data-qa='login-email']    ${email}
    Input Text    xpath=//input[@data-qa='login-password']    ${password}
    Click Button  xpath=//button[contains(text(),'Login')]

Logout User
    ${clicked}=    Run Keyword And Return Status
    ...    Click Element    xpath=//a[contains(text(),'Logout')]
    Run Keyword If    '${clicked}'=='False'
    ...    Click Element    xpath=//a[contains(@href,'logout')]

Create Account
    Wait Until Element Is Visible    id=password    20s
    Input Text    id=password    ${PASSWORD}
    Input Text    id=first_name    Sujan
    Input Text    id=last_name     Kumar
    Input Text    id=address1      Robot Street
    Input Text    id=state         Karnataka
    Input Text    id=city          Bangalore
    Input Text    id=zipcode       560001
    Input Text    id=mobile_number 9876543210
    Click Button  xpath=//button[contains(text(),'Create')]

Go To Products
    Click Element    xpath=//a[@href='/products']
    Wait Until Element Is Visible    xpath=//div[contains(@class,'product-image-wrapper')]    20s

*** Test Cases ***

TC_01 Register User
    Open Firefox
    Click Signup Login
    Input Text    name=name    Sujan
    Input Text    xpath=//input[@data-qa='signup-email']    ${EMAIL}
    Click Button  xpath=//button[contains(text(),'Signup')]
    Create Account
    Wait Until Element Is Visible    xpath=//a[contains(text(),'Products')]    25s

TC_02 Login User With Correct Credentials
    Open Firefox
    Click Signup Login
    Login User    ${EMAIL}    ${PASSWORD}
    Wait Until Element Is Visible    xpath=//a[contains(text(),'Products')]    25s

TC_03 Login User With Incorrect Credentials
    Open Firefox
    Click Signup Login
    Login User    wrong@mail.com    wrong123
    Page Should Contain    incorrect

TC_04 Logout User
    Open Firefox
    Click Signup Login
    Login User    ${EMAIL}    ${PASSWORD}
    Logout User
    Page Should Contain    Signup

TC_05 Register User With Existing Email
    Open Firefox
    Click Signup Login
    Input Text    name=name    Sujan
    Input Text    xpath=//input[@data-qa='signup-email']    ${EMAIL}
    Click Button  xpath=//button[contains(text(),'Signup')]
    Page Should Contain    exist

TC_06 Contact Us Form
    Open Firefox
    Click Element    xpath=//a[@href='/contact_us']
    Wait Until Element Is Visible    name=name    20s
    Input Text    name=name    Sujan
    Input Text    name=email    test@mail.com
    Input Text    name=subject    Automation
    Input Text    id=message    Testing contact form
    Click Button  xpath=//input[@name='submit']
    Handle Alert  ACCEPT

TC_07 Verify Test Cases Page
    Open Firefox
    Click Element    xpath=//a[@href='/test_cases']
    Page Should Contain    Test Cases

TC_08 Verify All Products Page
    Open Firefox
    Go To Products

TC_09 Search Product
    Open Chrome
    Go To Products
    Wait Until Element Is Visible    id=search_product    20s
    Input Text    id=search_product    ${SEARCH}
    Click Button  id=submit_search
    Page Should Contain    SEARCHED

TC_10 Verify Subscription
    Open Chrome
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Wait Until Element Is Visible    id=susbscribe_email    20s
    Input Text    id=susbscribe_email    test@mail.com
    Click Button  id=subscribe