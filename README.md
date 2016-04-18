Wyrzuc.to
=========

Wyrzuc.to to aplikacja informująca mieszkańców Gdańska o tym gdzie, kiedy powinni wyrzucać śmieci. Aplikacja jest tworzona w porozumieniu z miastem Gdańsk w ramach stażu organizowanego przez Fundację ePaństwo.

## Serwer stage
[ ![Codeship Status for wyrzucto/wyrzuc.to](https://codeship.com/projects/ac77bd70-82c9-0132-c330-4e1ff6946f22/status?branch=master)](https://codeship.com/projects/57950)

## Analiza

[Analiza dla Miasta Gdańsk](https://github.com/psielach/wyrzuc.to/wiki/Analiza%20Gda%C5%84sk)

## Funkcjonalności
Podstawowe funkcje na których na początku się skupimy:
- [Lokalizacja punktów odbioru różnego rodzaju śmieci (np. niebezpieczne, wielkogabarytowe, baterie, AGD itp.) ](https://github.com/psielach/wyrzuc.to/milestones/Lokalizacja%20punkt%C3%B3w%20odbioru%20r%C3%B3%C5%BCnego%20rodzaju%20%C5%9Bmieci)
- [Informacja o terminach odbioru śmieci (np. szkło, plastik)](https://github.com/psielach/wyrzuc.to/milestones/Informacja%20o%20terminach%20odbioru%20%C5%9Bmieci)
- [Poradnik gdzie wyrzucić dany typ śmieci](https://github.com/psielach/wyrzuc.to/milestones/Gdzie%20wyrzuci%C4%87...%20%3F%20)

We wstępnym badaniu zostały wytypowane [następujące funkcjonalności](https://github.com/psielach/wyrzuc.to/labels/feature-request), jako kandydaci do wdrożenia w przyszłości.

## Podobne aplikacje
W Polsce:
- Wywozik Rybnik - [Android](https://play.google.com/store/apps/details?id=pl.goste.app.rybnik&hl=pl) [iPhone](https://itunes.apple.com/pl/app/wywozik-rybnik/id901811083?mt=8)
- Wywozik Orzesze - [Android](https://play.google.com/store/apps/developer?id=Goste&hl=pl)
- Kiedy Wywóz (wiele miast, brak aktualizacji) - [Android](https://play.google.com/store/apps/details?id=pk.sophscope.odpady&hl=pl)

Na świecie:
- [Gominashi JP](http://5374.jp/en/)
- [Recollect](https://recollect.net/)

## Jakość kodu

Żeby sprawdzić czy wszystko jest w porządku podczas pracy nad projektem korzystamy z [PolishGeeks Dev Tools](https://github.com/polishgeeks/polishgeeks-dev-tools) gema który łączy wiele statycznych analizerów kodu

uruchamiamy go z konsoli:

```bash
bundle exec rake polishgeeks:dev-tools:check
```

Dopiero po sprawdzeniu możemy wysłać commit.
