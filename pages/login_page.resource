*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${USERNAME_FIELD}    name=user-name
${PASSWORD_FIELD}    name=password
${LOGIN_BUTTON}    name=login-button
${ERROR_TEXT}    Epic sadface

*** Keywords ***
Input Text Username Field
    [Arguments]    ${username}
    Input Text    ${USERNAME_FIELD}    ${username}

Input Text Password Field
    [Arguments]    ${password}
    Input Text    ${PASSWORD_FIELD}    ${password}

Click Login Button
    Click Button    ${LOGIN_BUTTON}

Connect
    Input Text Username Field    standard_user
    Input Text Password Field    secret_sauce
    Click Login Button