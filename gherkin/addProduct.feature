Feature: Add a product to cart

  Background:
    Given The user is on the home page

  @Feature
  Scenario: Add product successful
    When The user clicks on the add to cart button on the "sauce-labs-backpack" item in the home page
    And The user clicks on the cart icon
    Then The user is redirected to the cart page and the item is present and visible in the cart