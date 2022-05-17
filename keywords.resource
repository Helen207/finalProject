*** Settings ***
Library    SeleniumLibrary
Library    String
Library     Collections
Resource    locators.resource

*** Keywords ***
Open browser and accept cookies
    Open Browser    https://www.heureka.sk/     gc
    Set Window Size    1650    1000
    Sleep    5s
    Wait Until Element Is Visible    id=onesignal-slidedown-allow-button
    Click Button    id=onesignal-slidedown-allow-button

Click one of today's tip selection
    [Arguments]     ${item}
    ${locator}      Format String    ${tipy_na_grilovanie}      ${item}
    Click Element    ${locator}
    Sleep    2s


Close selection and go back to list
    Wait Until Page Contains Element    ${locator_close_side_cart}
    Click Element    ${locator_close_side_cart}
    Go Back

Navigate to product section using section name
    [Arguments]     ${product_section}
    ${locator}      Format String    ${locator_prenosne_grily}      ${product_section}
    Scroll Element Into View    ${locator}
    Click Element    ${locator}
    Wait Until Page Contains    Prenosné grily

Use the filter - second price range
    Wait Until Page Contains Element    ${filter_second_range}
    Click Element    ${filter_second_range}
    Page Should Contain    body

Select the product from the list using product name
    [Arguments]     ${item}
    ${locator}      Format String    ${product_name}   ${item}
    Wait Until Page Contains Element    ${locator}
    Sleep    2s
    Click Element    ${locator}
    Sleep    1s

Put the product into the basket with buy with heureka button
    Wait Until Page Contains Element    ${buy_with_heureka}
    Sleep    3s
    Click Element    ${buy_with_heureka}
    Sleep    1s

Continue with order - go to the basket
    Click Element    ${locator_continue_to_basket}
    Sleep    1s

Verify product count in the basket
    [Arguments]     ${product_counts}
    Wait Until Page Contains Element    ${locator_carts}
    ${rows}     Get WebElements    ${locator_carts}
    ${row_items_count}      Get Length    ${rows}
    Should Be Equal    ${row_items_count}    ${product_counts}

Should be larger than
    [Arguments]     ${value1}       ${value2}
    Run Keyword If    ${value1} <= ${value2}
    ...    Fail     The price ${value1} is under the range!

Should be smaller than
    [Arguments]     ${value1}       ${value2}
    Run Keyword If    ${value1} >= ${value2}
    ...    Fail     The price ${value1} is over the range!

Get the product's price from index and verify the price range
    [Arguments]     ${index}     ${low_range}     ${high_range}
    ${elements}    Get WebElements    xpath=//div[@class='c-product-card__price u-bold']
    ${element}    Get From List    ${elements}    ${index}
    ${full_price}      Get Text    ${element}
    ${euro}     Split String   ${full_price}       ,
    ${cents}    Split String    ${euro[1]}
    ${final_price}      Catenate    SEPARATOR=.     ${euro[0]}      ${cents[0]}
    ${converted_price}      Convert To Number    ${final_price}
    Should be larger than    ${converted_price}    ${low_range}
    Should be smaller than      ${converted_price}      ${high_range}

Delete the first product from the list
    Click Element    xpath=//*[@id="snippet--cart-content-data"]/div[3]/div/div/div[1]/a
    Sleep    1s
    Click Element    xpath=//*[@id="snippet--cart-content-data"]/div[3]/div/div/div[1]/section/div/footer/a
    Sleep    2s

Verify empty basket
    Page Should Contain    Váš košík zíva prázdnotou...
    Wait Until Page Contains Element    ${locator_basket_price}
    ${price}    Get Text    ${locator_basket_price}
    Should Be Equal    ${price}    0,00 €