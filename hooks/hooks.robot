*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Setup Browser
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Quit Browser
    Close Browser
