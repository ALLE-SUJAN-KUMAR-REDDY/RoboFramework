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