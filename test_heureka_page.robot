*** Settings ***
Library     SeleniumLibrary
Library     String
Resource    keywords.resource
Resource    locators.resource
Test Setup      Open browser and accept cookies
Test Teardown   Close Browser



*** Test Cases ***
Navigate to bbq section on heureka, use the price filter and select three products

    [Tags]          e2e     basket      price_range
    Click one of today's tip selection    Tipy na grilovanie a piknik
    Page Should Contain    Tipy na grilovanie a piknik
    Navigate to product section using section name     Prenosné grily
    Use the filter - second price range
    Select the product from the list using product name    Eta Vital 1162 90000
    Put the product into the basket with buy with heureka button
    Close selection and go back to list
    Select the product from the list using product name    Tefal GC 205012
    Put the product into the basket with buy with heureka button
    Close selection and go back to list
    Select the product from the list using product name    Cattara KEG na drevené uhlie 13031
    Put the product into the basket with buy with heureka button
    Continue with order - go to the basket
    Verify product count in the basket    ${3}
    Get the product's price from index and verify the price range    0    50   90
    Get the product's price from index and verify the price range    1    50   90
    Get the product's price from index and verify the price range    2    50   90
    Delete the first product from the list
    Verify product count in the basket    ${2}
    Delete the first product from the list
    Delete the first product from the list
    Verify empty basket