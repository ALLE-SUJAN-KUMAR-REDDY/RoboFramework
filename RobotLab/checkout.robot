*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}         https://practice.automationtesting.in/
${BROWSER}     chrome

*** Test Cases ***
Complete Checkout Flow Demo
    Open Website
    Add Product To Cart
    Go To Checkout
    Fill Billing Details
    Place Order
    Verify Order Success
    [Teardown]    Close Browser

*** Keywords ***

Open Website
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --disable-notifications
    Open Browser    ${URL}    ${BROWSER}    options=${options}
    Maximize Browser Window
    Set Selenium Timeout    40s

Add Product To Cart
    Go To    https://practice.automationtesting.in/?add-to-cart=169
    Wait Until Page Contains    Basket    20s
    Go To    https://practice.automationtesting.in/basket/
    Wait Until Element Is Visible    css:.checkout-button    20s

Go To Checkout
    Go To    https://practice.automationtesting.in/checkout/
    Wait Until Element Is Visible    id=billing_first_name    20s

Fill Billing Details
    # Remove Ads
    Execute Javascript    var ads = document.querySelectorAll('iframe, .adsbygoogle, ins'); for (var i = 0; i < ads.length; i++) { ads[i].remove(); }

    Input Text    id=billing_first_name    Sujan
    Input Text    id=billing_last_name     Reddy

    # Country Selection
    Execute Javascript    document.getElementById('billing_country').style.display='block';
    Select From List By Value    id=billing_country    IN
    Wait Until Element Is Not Visible    css:.blockUI.blockOverlay    20s
    Sleep    2s

    Input Text    id=billing_address_1    123 Test Lane
    Input Text    id=billing_city         Hyderabad

    # State Selection
    Execute Javascript    document.getElementById('billing_state').style.display='block';
    Wait Until Keyword Succeeds    15s    2s    Select From List By Label    id=billing_state    Telangana

    Input Text    id=billing_postcode     500001
    Input Text    id=billing_phone        9876543210
    Input Text    id=billing_email        sujan.reddy@example.com
    Wait Until Element Is Not Visible    css:.blockUI.blockOverlay    20s

Place Order
    Scroll Element Into View    id=place_order
    # Ensure Payment Method is active
    Wait Until Element Is Visible    id=payment_method_bacs    10s
    Click Element                    id=payment_method_bacs
    Sleep    1s
    # Final Ad Clean
    Execute Javascript    var ads = document.querySelectorAll('iframe, .adsbygoogle'); for (var i = 0; i < ads.length; i++) { ads[i].remove(); }
    # Use JS Click to ensure the click is registered
    Execute Javascript    document.getElementById('place_order').click();

Verify Order Success
    # 1. Wait for the URL to change to 'order-received'
    Wait Until Location Contains    order-received    45s

    # 2. Wait for the 'Thank you' message to be visible
    Wait Until Page Contains    Thank you. Your order has been received.    20s

    # 3. Check for specific order details (using generic text check as a fallback)
    Page Should Contain    Order Details
    # Use a case-insensitive check or wait for the specific order list element
    Wait Until Element Is Visible    css:ul.order_details    20s
    Log To Console    Checkout Successful!