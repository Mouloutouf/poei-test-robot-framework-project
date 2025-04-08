*** Settings ***
Library    SeleniumLibrary

Resource    ../hooks/hooks.robot

Resource    ../pages/login_page.resource
Resource    ../pages/home_page.resource

Test Setup    Setup Browser    https://www.saucedemo.com    chrome
Test Teardown    Quit Browser

*** Test Cases ***
Connection Success
    [Tags]    POEI20252-770
    Input Text Username Field    standard_user
    Input Text Password Field    secret_sauce
    Click Login Button
    Page Should Contain    ${PRODUCTS_TEXT}

Connection Failure
    [Tags]    POEI20252-771
    Input Text Username Field    standard_user
    Input Text Password Field    not_a_password
    Click Login Button
    Page Should Contain    ${ERROR_TEXT}
