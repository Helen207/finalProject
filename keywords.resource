*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    locators.resource

*** Keywords ***
Open browser and accept cookies
    Open Browser    https://www.heureka.sk/     gc
    Sleep    5s
    Wait Until Element Is Visible    id=onesignal-slidedown-allow-button
    Click Button    id=onesignal-slidedown-allow-button

Close selection and go back to list
    Wait Until Page Contains Element    ${locator_close_side_cart}
    Click Element    ${locator_close_side_cart}
    Go Back

Go to Prenosne grily
    Click Element    xpath=//div[3]/div[1]/div/div/div/div[3]/div/div/div[1]/div/div/section/div/div/div[2]/ul/li[3]
    Page Should Contain    Prenosné grily

Use the filter
    Wait Until Page Contains Element    ${locator_50-90}
    Click Element    ${locator_50-90}
    Page Should Contain    body

Select the product form the list
    [Arguments]     ${item}
    Wait Until Page Contains Element    ${item}
    Sleep    2s
    Click Element    ${item}



Buy with heureka
    Wait Until Page Contains Element    xpath=//*[@id="__next"]/main/div[1]/div[2]/div[4]/div/div[2]
    Sleep    3s
    Click Element    xpath=//*[@id="__next"]/main/div[1]/div[2]/div[4]/div/div[2]
    Sleep    3s

Verify product count in the basket
    [Arguments]     ${product_counts}
    Wait Until Page Contains Element    ${locator_carts}
    ${rows}     Get WebElements    ${locator_carts}
    ${row_items_count}      Get Length    ${rows}
    Should Be Equal    ${row_items_count}    ${product_counts}

Should be larger than
    [Arguments]     ${value1}       ${value2}
    Run Keyword If    ${value1} <= ${value2}
    ...    Fail     The price is too small

Should be smaller than
    [Arguments]     ${value1}       ${value2}
    Run Keyword If    ${value1} >= ${value2}
    ...    Fail     The product is too expensive!

Get the price and verify the range
    [Arguments]     ${item}     ${low_range}     ${high_range}
    ${full_price}      Get Text    ${item}
    ${euro}     Split String   ${full_price}       ,
    Log    ${euro[0]}
    ${cents}    Split String    ${euro[1]}
    Log    ${cents[0]}
    ${final_price}      Catenate    SEPARATOR=.     ${euro[0]}      ${cents[0]}
    ${converted_price}      Convert To Number    ${final_price}
    Should be larger than    ${converted_price}    ${low_range}
    Should be smaller than      ${converted_price}      ${high_range}

Delete the product from the list
    Click Element    xpath=//*[@id="snippet--cart-content-data"]/div[3]/div/div/div[1]/a
    Sleep    1s
    Click Element    xpath=//*[@id="snippet--cart-content-data"]/div[3]/div/div/div[1]/section/div/footer/a

Verify empty basket
    Wait Until Page Contains Element    ${locator_basket_price}
    ${price}    Get Text    ${locator_basket_price}
    Should Be Equal    ${price}    0,00 €