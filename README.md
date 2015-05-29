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









z punktu widzenia użytkownika: wpisuje śmieci, które chce wyrzucić, podpowiadane są frazy z bazy. Może tam wpisać cokolwiek.

Jeżeli wpisze coś co istnieje już w bazie to wyświetla się opis informujący gdzie dane śmieci wyrzucić. Np. Styropian możesz wyrzucać do pojemników na odpady segregowane. Kliknij <tu>, aby wyświetlić punkty odbioru, lub wpisz swój adres po prawej stronie.

Ponieważ użytkownicy mogą wpisywać wiele rzeczy to w bazie powinno być mapowanie:
wpisana fraza -> frakcja
oraz frakcja -> opis. Tak żeby można było mapować wiele frakcji na jeden opis. W opisie powinna być placeholder na wklejenie wpisanej frazy podczas wyszukiwania. Np. "Smieci plastikowe (takie jak '<fraza'>) wyrzucisz tu.

Gdy nie ma frazy w bazie, to powina się dodac z pustym mapowaniem i wyseitlic opis "Jeszcze nie wiemy gdzie wyrzucać tego typu śmieci, ale to ustalimy i dodamy informację do serwisu. Dziękujemy za zgłoszenie".
