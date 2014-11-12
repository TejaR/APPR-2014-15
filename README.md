# Analiza podatkov s programom R, 2014/15

## Gradnja stanovanj v Sloveniji

Avtor: Teja Rupnik

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2014/15.

## Tematika

V projektu, bom analizirala podatke o dokončanih stanovanjih pridobljenih z novogradnjo, povečavo in spremembo namembnosti, po investitorjih in po regijah v Sloveniji.

Podatke za moj projekt sam dobila na spletni strani Statističnega urada Republike Slovenije.
(http://pxweb.stat.si/pxweb/Dialog/varval.asp?ma=1906902S&ti=&path=../Database/Ekonomsko/19_gradbenistvo/05_19069_graditev_stan/&lang=2)

Moj cilj projekta je, da analiziram katere regije imajo največ dokončanih stanovanj, kateri investitorji so največ investirali v izgradnjo stanovanje in primerjati kako so stanovanja nastala.

## Program

Glavni program se nahaja v datoteki `projekt.r`. Ko ga poženemo, se izvedejo
programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`. Podatkovni
viri so v mapi `podatki/`. Slike, ki jih program naredi, se shranijo v mapo
`slike/`. Zemljevidi v obliki SHP, ki jih program pobere, se shranijo v mapo
`zemljevid/`.

## Poročilo

Poročilo se nahaja v mapi `porocilo/`. Za izdelavo poročila v obliki PDF je
potrebno datoteko `porocilo/porocilo.tex` prevesti z LaTeXom. Pred tem je
potrebno pognati program, saj so v poročilu vključene slike iz mape `slike/`.
