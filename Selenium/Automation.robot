*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser To Shop
Suite Teardown    Close Browser

*** Variables ***
${URL}        https://practice.automationtesting.in/
${BROWSER}    chrome
${DELAY}      1s

*** Test Cases ***
Place Order Successfully
    Add Product To Basket
    View Basket Page
    Proceed To Checkout
    Fill Billing Details
    Place Order
    Verify Thank You Page

*** Keywords ***
Open Browser To Shop
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Wait Until Page Contains    Shop    10s

Add Product To Basket
    Execute Javascript    document.querySelectorAll("a.button")[0].click();
    Wait Until Page Contains    View Basket    10s

View Basket Page
    Execute Javascript    document.querySelector("a.added_to_cart").click();
    Wait Until Page Contains    Basket Totals    10s

Proceed To Checkout
    Execute Javascript    document.querySelector("a.checkout-button").click();
    Wait Until Page Contains    Billing Details    10s

Fill Billing Details
    Input Text    id=billing_first_name     Sujan
    Input Text    id=billing_last_name      Reddy
    Input Text    id=billing_email          sujan@test.com
    Input Text    id=billing_phone          9876543210
    Input Text    id=billing_address_1      Hyderabad
    Input Text    id=billing_city           Hyderabad
    Input Text    id=billing_postcode       500001

    Select From List By Label    id=billing_country    India
    Select From List By Label    id=billing_state     Telangana

    Sleep    2s

Place Order
    Execute Javascript    document.getElementById("place_order").click();

Verify Thank You Page
    Wait Until Page Contains    Thank you. Your order has been received.    20s
    Page Should Contain         Thank you. Your order has been received.       Thank you. Your order has been received.