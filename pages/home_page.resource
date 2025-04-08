*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${ADD_TO_CART_BUTTON}    name=add-to-cart-sauce-labs-backpack
${CART_LINK}    class=shopping_cart_link
${PRODUCTS_TEXT}    Products

*** Keywords ***
Click Add To Cart Button
    Click Button    ${ADD_TO_CART_BUTTON}

Click Cart Button
    Click Element    ${CART_LINK}