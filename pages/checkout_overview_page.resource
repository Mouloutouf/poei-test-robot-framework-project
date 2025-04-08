*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${FINISH_BUTTON}    id=finish

*** Keywords ***
Click Finish Button
    Click Button    ${FINISH_BUTTON}