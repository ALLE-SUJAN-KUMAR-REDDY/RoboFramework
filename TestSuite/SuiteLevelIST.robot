*** Settings ***
# setting we add the external library details, resources, set up and tear down commands
# Test Setup - These run before Each test case.
# Test Teardown - These run after Each test case

Resource    ../Resources/Resource.robot
Library     SeleniumLibrary
Suite Setup         Log    Open DB
Test Teardown       Log    Close DB

*** Test Cases ***
# name of the testcase
Verify login with valid credentials
    Login

Verify Add to cart functionality
    Login
    Log    User selects the product
    Log    User adds the product to the cart
    Log    User verifies that the product with details is added to the cart
