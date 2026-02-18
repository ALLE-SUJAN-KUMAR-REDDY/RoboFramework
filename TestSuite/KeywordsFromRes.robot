*** Settings ***
Resource    ../Resources/Resource.robot
Library     SeleniumLibrary


*** Test Cases ***
Verify login with valid credentials
    Login

Verify Add to cart functionality
    Login
    Log    User selects the product
    Log    User adds the product to the cart
    Log    User verifies that the product with details is added to the cart
