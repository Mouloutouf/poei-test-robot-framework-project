*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${FIRST_NAME_FIELD}    id=first-name
${LAST_NAME_FIELD}    id=last-name
${ZIP_CODE_FIELD}    id=postal-code
${CONTINUE_BUTTON}    id=continue

*** Keywords ***
Input First Name Field
    [Arguments]    ${firstName}
    Input Text    ${FIRST_NAME_FIELD}    ${firstName}

Input Last Name Field
    [Arguments]    ${lastName}
    Input Text    ${LAST_NAME_FIELD}    ${lastName}

Input Zip Code Field
    [Arguments]    ${zipCode}
    Input Text    ${ZIP_CODE_FIELD}    ${zipCode}

Click Continue Button
    Click Button    ${CONTINUE_BUTTON}