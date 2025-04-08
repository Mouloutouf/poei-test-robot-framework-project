*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CHECKOUT_BUTTON}    name=checkout
${CART_ITEM_TEXT}    Sauce Labs Backpack

*** Keywords ***
Click Checkout Button
    Click Button    ${CHECKOUT_BUTTON}