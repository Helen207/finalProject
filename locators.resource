*** Variables ***

${tipy_na_grilovanie}     xpath=//div[@class='c-inspiration-wrapper']//*[text()='{}']
${locator_prenosne_grily}   xpath=//div[@class='c-product__container']//*[contains(text(), '{}')]

${filter_second_range}      xpath=//*[@id='cena']//div[@class='c-form-cell c-form-cell--inline']/label[@for='price-2']

${product_name}    xpath=//section[@class='c-product']//a[@class='c-product__link' and text()='{}']

${buy_with_heureka}     xpath=//div[@class='c-top-offer__buy']
${locator_continue_to_basket}    xpath=//div[@class='c-cart-confirm__row c-cart-confirm__buttons']//*[text()='Prejsť do košíku']

${locator_close_side_cart}      xpath=//div[@class='c-new-offscreen']/button[@class='c-new-offscreen__close e-action']

${locator_carts}      xpath=//*[@id="snippet--cart-content-data"]//div[contains(@class, 'step1__product-card')]

${locator_price}      xpath=//div[@data-item-id='7786771']//div[@class='c-product-card__price u-bold']

${locator_basket_price}   xpath=//*[@id="rootHead"]/ul/li[3]/a/span[2]