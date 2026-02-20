*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${URL}    https://www.tutorialspoint.com/selenium/practice/droppable.php

*** Test Cases ***
Verify drag and drop in TutorialsPoint
    Open Browser    ${URL}    firefox
    Maximize Browser Window

    Wait Until Element Is Visible    id:draggable
    Wait Until Element Is Visible    id:droppable

    Drag And Drop    id:draggable    id:droppable

    # validation after drop
    Element Text Should Be    id:droppable    Dropped!

    Sleep    2s
    Close Browser
