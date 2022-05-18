# Hodnotenie

### Celkovo

---
- [x] Replikovatelnost testu: 0:5    (PASS:FAIL)
- [N] Replikovatelnost testu: 3:2    (PASS:FAIL)
---

#### Errors:

- [x] 2x - Element 'xpath=//*[@id="__next"]/main/div[1]/div[2]/div[4]/div/div[2]' did not appear in 5 seconds.
- [x] 2x - WebDriverException: Message: target frame detached 
- [x] Element 'id=onesignal-slidedown-allow-button' not visible after 5 seconds.
- [N] ElementClickInterceptedException: Message: element click intercepted: Element <a class="c-product-card__close c-modal__toggle js-modal__toggle e-action" target="_blank">...</a> is not clickable at point (1408, 249). Other element would receive the click: <div class="c-loading js-loading--1652854603288 null c-loading--overlay c-loading--centered">...</div>
- [N] WebDriverException: Message: target frame detached


---
  
- Z pohladu testingu:
  - [x] z testu mam zmiesany pocit
    - na 1 stranu rozumiem co sa tam deje
    - na 2 stranu, mi vobec neni jasne, ze ake veci sa tam vyberaju a co sa snimi robi
  - [x] ${locator_first_price}   by sa mohol zmenit za ${nazov_produktu} a bolo by to hned jasnejsie

- Z pohladu automatizacie:
  - [x] xpathy priamo v testoch
  - [x] ${locator_first_price} je velmi genericke, nie je jasne, o co ide
  - [x] chyba mi tam parametrizacia, nejake presnejsie urcenie, aby som na 1 pohlad videl o co sa jedna
  - [x] strasne moc `Sleep` v main file, treba pouzivat `Waity` a idealne ich este skovat do keywordov
  - [N] jedine co mi malicko bije oci su kw na riadkoch 29,30,31 
    - namiesto indexu by som dal nazov a range je velmi tricky z toho dovodu, ze vyberas na riadku 18 2nd price range, a to nemusi sediet k 50-90
    - k tomu mas ale comment nizsie


- ***Overall***:
  - Test mi nepresiel ani 1x, predpokladam, ze to je hlavne kvoli xpathom,  ktore okrem ineho,
  ukazuju na produkt, ktory nema kupit na heureke

### Keywords subor

- `General`
  - [x] `Set Window Size` - nenastavujes nijakym sposobom velkost okna. Moze to sposobovat problemy, hlavne pri tych absolutnych xpathoch, kde to nemusi sediet
  - [x] Vela krat posuvas nejaky argument, a ten argument je xpath, alebo lokator
  - [x] Je lepsie v pripade ako toto posuvat konkretne nazvy, cim zabranis tomu,
  ze sa ti lokator zmeni. (tj, lokator si vyskladas na zaklade nazvu)
    
- [x] Keyword: `Go to Prenosne grily`
  - je fajn, ze si keyword pomenoval takto, avsak co ak nechcem Grilly? 
  - chcelo by to nieco generickejsie, ako `Go To Section     ${section_name}`

- [x] Keyword: `Use the filter`
  - tu si to vyslovene pyta, nieco konkretne, nieco v zmysle  `Use The Filter    50 - 90`
    - argument, ktorym mozem zmenmit co potrebujem

- [N] Keyword: `Use the filter - second price range`
  - toto je troska moc genericke, skor by som tam dal nejaky text, ktory by ukazal na konkretny range
  - hlavny dovod je aj ten, ze riadok 74 kw, definujes range cien, ale teoreticky ti to nemusi sediet
  - 2nd price range kludne moze byt 10-15, ono sa to meni na zaklade toho co ti vylistuje
    - dalsie mozne riesenie, je si range vytiahnut v ramci tohto kw a nasledne ho pri `Get the product's price from index and verify the price range` pouzit ako vstupy (ten dynamicky vytiahnuty range)

- [x] Keyword: `Select the product from the list`
  - to co hore, chyba mi tu nejaky rozumny sposob ako tomu povedat aky produkt
  - posuvas tomu sice lokator, v zmysle  ${locator_first_product} ale je to velmi abstraktne
    - aspon ten locator uz mohol byt pomenovany ako  ${gril_xy_ab}

- [x] Keyword: `Delete product from the list`
  - zase mi tu chyba informacie o tom, ze aky produkt?
  - 1? 2? 10ty?  nahodny?

- [N] Keyword: `Delete the first product from the list`
  - spravil by som ho stylom ako mas select, tj, pouzi nazov, a budes 100% vediet o ktory produkt sa jedna

- [x] Keyword: `Verify empty basket`
  - tu chyba validacia na hlasku, ze kosik je prazdny
  - teoreticky to ze je cena `0` nemusi znamenat, ze je prazdny, moze tam ostat daka 'bonusovy balicek' alebo hocijaka ina hlupost. 

- [ ] Keyword: `Should be larger/smaller than`
  - keyword mi pride docela zlozity, validacia na to, ci je nieco v range sa da spravit jednoducho:
    `Should Be True    ${low_limit} < ${value1} < ${upper_limit}`
    `Should Be True    50 < ${value1} < 90`
    - potom nemusis riesit sadu keywordov s failami
  - ak to chces takto, tak do Failu je dobre si napisat aj ktory produkt, inak sa ti to bude blbo hladat
  - [N] do failu si zapisujes cenu a nie nazov produktu 

  
### Variables subor

- [x] variable su spravene spravne
- [x] problem mam jedine s obsahom, ze tie xpathy su priliz `absolutne` co sa ukazalo, aj pri tom ako som testy pustal u seba na pc
- [N] aktualne vyzeraju tie xpathy o dost krajsie

### Test Cases subor

- [x] nazov je troska zvlastny `test.robot`
  - nic nehovoriaci, genericky nazov
- [x] mierne mi vadia xpathy v priamo *** Test Cases ***
- [x] druha vec je, ze je pochopitelny test, avsak naozaj by na 1 pohlad malo byt zrejme o co sa jedna
  - z toho co vidim, viem vycitat co sa deje, avsak tie lokatory su tak genericke, ze neviem povedat s akymi produktami robim
- [N] tentokrat je to velmi dobre, zrozumitelne a jasne


### Readme.md subor

- [x] velmi pekne popisany postup
- [x] kladne hodnotim aj pouzity markdown
  - super je, ze si tam dala aj linky, co kde
  - k pythonu by som este mozno napisal, aku verziu
  - k chromedriveru detto, ze to treba voci chromu
  - [N] tuto by som verziu nepisal, moze to byt zradne, kedze chrome vychadza novy kazdu chvilu

- [x] 1 detail som si vsimol a sice to, ze prve instalujes prostredie a potom aktivujes `venv`
  - [x] v praxi to ma byt opacne,  aktivujes `venv` a nainstalujes veci
- [x] na druhu stranu, nepopisoval by som, ze treba `venv` atd... pretoze, je to v zasade na tom cloveku, co to po tebe bude preberat
  - [ ] ak chce, nech `venv` pouzije, ak nie, nech si to instali kde chce
  - [ ] tak isto by som nespominal `Robot framework language server`. Nie je to podmienka bezania testov. Je to skor nice to have vec.
  - [N] tu ti chyba, ako sa vola ten plugin a ze ho treba nainstalovat
  - [N] za mna, by som ho naozaj nespominal, alebo len bokom, bez nastavovaciek a ostatnych veci... to uz nech riesi ten, co si ho zapne 

### requirements.txt subor
 
- [x] `pabot` nikde nespominas, nie je nutne ho instalovat
- [x] snaz sa v requirements.txt drzat iba veci potrebne pre kod

### Git repository

- [x] obsah adresara je dostatocny
- [x] doporucujem, pre adresare a nazvy suborov pouzivat `lowercase` 
- [x] tak isto je dobre pouzit .gitignore a `.idea` vyhodit z repository
  - pri vacsich projektoch, je dobre `.idea` zachovat, avsak to pocita s tym, ze vsetci maju rovnaky system, a rovnake cesty
