*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Swag Labs
Suite Teardown    Close Browser

*** Variables ***
${URL}          https://www.saucedemo.com/
${BROWSER}      firefox
${USERNAME}     standard_user
${PASSWORD}     secret_sauce
${FIRSTNAME}    Sujan
${LASTNAME}     Reddy
${ZIP}          500001

*** Keywords ***
Open Swag Labs
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    1.0s

Login To Swag Labs
    Input Text    id=user-name    ${USERNAME}
    Input Text    id=password     ${PASSWORD}
    Click Button  id=login-button
    Wait Until Page Contains    Products

Add Items To Cart
    Click Button    id=add-to-cart-sauce-labs-backpack
    Click Button    id=add-to-cart-sauce-labs-bolt-t-shirt

Go To Cart
    Click Element   class=shopping_cart_link
    Wait Until Page Contains    Your Cart

Checkout From Cart
    Click Button    id=checkout
    Wait Until Page Contains    Checkout: Your Information

Fill Checkout Information
    Input Text    id=first-name    ${FIRSTNAME}
    Input Text    id=last-name     ${LASTNAME}
    Input Text    id=postal-code   ${ZIP}
    Click Button  id=continue
    Wait Until Page Contains    Checkout: Overview

Finish Checkout
    Click Button    id=finish
    Wait Until Page Contains    Checkout: Complete!

Verify Order Success
    Page Should Contain    Thank you for your order!

*** Test Cases ***
Swag Labs Complete Checkout Flow
    Login To Swag Labs
    Add Items To Cart
    Go To Cart
    Checkout From Cart
    Fill Checkout Information
    Finish Checkout
    Verify Order Success
