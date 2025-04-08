*** Settings ***
Library    SeleniumLibrary

Resource    ../hooks/hooks.robot

Resource    ../pages/login_page.resource
Resource    ../pages/home_page.resource
Resource    ../pages/cart_page.resource
Resource    ../pages/checkout_info_page.resource
Resource    ../pages/checkout_overview_page.resource
Resource    ../pages/checkout_complete_page.resource

Test Setup    Setup Browser    https://www.saucedemo.com    chrome
Test Teardown    Quit Browser

*** Test Cases ***
Add Product To Cart
    [Tags]    POEI20252-772
    Connect
    Click Add To Cart Button
    Click Cart Button
    Page Should Contain    ${CART_ITEM_TEXT}

Purchase Product
    [Tags]    POEI20252-773
    Connect
    Click Add To Cart Button
    Click Cart Button
    Click Checkout Button
    Input First Name Field    Max
    Input Last Name Field    One
    Input Zip Code Field    33000
    Click Continue Button
    Click Finish Button
    Page Should Contain    ${CONFIRMATION_TEXT}
