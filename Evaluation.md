# Hodnotenie

### Celkovo

---
- Replikovatelnost testu: 0:5    (PASS:FAIL)
---

#### Errors:

- 2x - Element 'xpath=//*[@id="__next"]/main/div[1]/div[2]/div[4]/div/div[2]' did not appear in 5 seconds.
- 2x - WebDriverException: Message: target frame detached 
- Element 'id=onesignal-slidedown-allow-button' not visible after 5 seconds.


---
  
- Z pohladu testingu:
  - z testu mam zmiesany pocit
    - na 1 stranu rozumiem co sa tam deje
    - na 2 stranu, mi vobec neni jasne, ze ake veci sa tam vyberaju a co sa snimi robi
  - ${locator_first_price}   by sa mohol zmenit za ${nazov_produktu} a bolo by to hned jasnejsie

- Z pohladu automatizacie:
  - xpathy priamo v testoch
  - ${locator_first_price} je velmi genericke, nie je jasne, o co ide
  - chyba mi tam parametrizacia, nejake presnejsie urcenie, aby som na 1 pohlad videl o co sa jedna
  - strasne moc `Sleep` v main file, treba pouzivat `Waity` a idealne ich este skovat do keywordov


- ***Overall***:
  - Test mi nepresiel ani 1x, predpokladam, ze to je hlavne kvoli xpathom,  ktore okrem ineho,
  ukazuju na produkt, ktory nema kupit na heureke

### Keywords subor

- `General`
  - `Set Window Size` - nenastavujes nijakym sposobom velkost okna. Moze to sposobovat problemy, hlavne pri tych absolutnych xpathoch, kde to nemusi sediet
  - Vela krat posuvas nejaky argument, a ten argument je xpath, alebo lokator
  - Je lepsie v pripade ako toto posuvat konkretne nazvy, cim zabranis tomu,
  ze sa ti lokator zmeni. (tj, lokator si vyskladas na zaklade nazvu)
    
- Keyword: `Go to Prenosne grily`
  - je fajn, ze si keyword pomenoval takto, avsak co ak nechcem Grilly? 
  - chcelo by to nieco generickejsie, ako `Go To Section     ${section_name}`

- Keyword: `Use the filter`
  - tu si to vyslovene pyta, nieco konkretne, nieco v zmysle  `Use The Filter    50 - 90`
    - argument, ktorym mozem zmenmit co potrebujem

- Keyword: `Select the product from the list`
  - to co hore, chyba mi tu nejaky rozumny sposob ako tomu povedat aky produkt
  - posuvas tomu sice lokator, v zmysle  ${locator_first_product} ale je to velmi abstraktne
    - aspon ten locator uz mohol byt pomenovany ako  ${gril_xy_ab}

- Keyword: `Delete product from the list`
  - zase mi tu chyba informacie o tom, ze aky produkt?
  - 1? 2? 10ty?  nahodny?

- Keyword: `Verify empty basket`
  - tu chyba validacia na hlasku, ze kosik je prazdny
  - teoreticky to ze je cena `0` nemusi znamenat, ze jep razdny, moze tam ostat daka 'bonusovy balicek' alebo hocijaka ina hlupost. 

- Keyword: `Should be larger/smaller than`
  - keyword mi pride docela zlozity, validacia na to, ci je nieco v range sa da spravit jednoducho:
    `Should Be True    ${low_limit} < ${value1} > ${upper_limit}`
    `Should Be True    50 < ${value1} > 90`
    - potom nemusis riesit sadu keywordov s failami
  - ak to chces takto, tak do Failu je dobre si napisat aj ktory produkt, inak sa ti to bude
  blbo hladat

  
### Variables subor

- variable su spravene spravne
- problem mam jedine s obsahom, ze tie xpathy su priliz `absolutne` co sa ukazalo, aj pri tom
ako som testy pustal u seba na pc

### Test Cases subor

- nazov je troska zvlastny `test.robot`
  - nic nehovoriaci, genericky nazov
- mierne mi vadia xpathy v priamo *** Test Cases ***
- druha vec je, ze je pochopitelny test, avsak naozaj by na 1 pohlad malo byt zrejme o co sa jedna
  - z toho co vidim, viem vycitat co sa deje, avsak tie lokatory su tak genericke, ze neviem povedat s akymi produktami robim


### Readme.md subor

- velmi pekne popisany postup
- kladne hodnotim aj pouzity markdown
  - super je, ze si tam dala aj linky, co kde
  - k pythonu by som este mozno napisal, aku verziu
  - k chromedriveru detto, ze to treba voci chromu
- 1 detail som si vsimol a sice to, ze prve instalujes prostredie a potom aktivujes `venv`
  - v praxi to ma byt opacne,  aktivujes `venv` a nainstalujes veci
- na druhu stranu, nepopisoval by som, ze treba `venv` atd... pretoze, je to v zasade na tom cloveku, co to po tebe bude preberat
  - ak chce, nech `venv` pouzije, ak nie, nech si to instali kde chce
  - tak isto by som nespominal `Robot framework language server`. Nie je to podmienka bezania testov. Je to skor nice to have vec.

### requirements.txt subor
 
- `pabot` nikde nespominas, nie je nutne ho instalovat
- snaz sa v requirements.txt drzat iba veci potrebne pre kod

### Git repository

- obsah adresara je dostatocny
- doporucujem, pre adresare a nazvy suborov pouzivat `lowercase` 
- tak isto je dobre pouzit .gitignore a `.idea` vyhodit z repository
  - pri vacsich projektoch, je dobre `.idea` zachovat, avsak to pocita s tym, ze vsetci maju rovnaky system, a rovnake cesty
