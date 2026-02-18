*** Settings ***
# setting we add the external library details, resources, set up and tear down command
Library     SeleniumLibrary

*** Test Cases ***
# name of the testcase
Verify login with valid credentials
        Log    Enter username
        Log    Enter password
        Log    click on login button
        Log    user is on the home page

Verify Add to cart functionality
        Log    Enter username
        Log    Enter password
        Log    click on login button
        Log    User is on the home page
        Log    User adds the product to cart
        Log    User verifies that the product with details is added to the cart

*** Keywords ***
Login
        Log    Enter username
        Log    Enter password
        Log    click on login button
        Log    user is on the home page
