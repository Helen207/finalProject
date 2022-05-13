*** Settings ***
Library     SeleniumLibrary
Library     String
Resource    keywords.resource
Resource    locators.resource
Test Setup      Open browser and accept cookies
Test Teardown   Close Browser



*** Test Cases ***
Heureka
    [Tags]          e2e     basket      price_range
    Click Element    xpath=//div[3]/div/section[1]/div/a[1]
    Page Should Contain    Tipy na grilovanie a piknik
    Go to Prenosne grily
    Use the filter
    Select the product form the list    ${locator_first_product}
    Buy with heureka
    Close selection and go back to list
    Select the product form the list    ${locator_second_product}
    Buy with heureka
    Close selection and go back to list
    Select the product form the list    ${locator_third_product}
    Buy with heureka
    Click Element    ${locator_continue_to_basket}
    Sleep    1s
    Verify product count in the basket    ${3}
    Get the price and verify the range    ${locator_first_price}    50   90
    Get the price and verify the range    ${locator_second_price}     50   90
    Get the price and verify the range    ${locator_third_price}    50  90
    Sleep    5s
    Delete the product from the list
    Sleep    2s
    Verify product count in the basket    ${2}
    Delete the product from the list
    Sleep    2s
    Delete the product from the list
    Sleep    2s
    Page Should Contain    Váš košík zíva prázdnotou...
    Verify empty basket