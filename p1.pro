%poprawne odpowiedzi na pytania

odp(junior,tak).
odp(junior,nie).
odp(mlody_30,tak).
odp(mlody_30,nie).
odp(mlody_40,tak).
odp(mlody_40,nie).
odp(senior,tak).
odp(senior,nie).
odp(waga,tak).
odp(waga,nie).
odp(sylwetka,tak).
odp(sylwetka,nie).
odp(kondycja,tak).
odp(kondycja,nie).
odp(sila,tak).
odp(sila,nie).
odp(stres,tak).
odp(stres,nie).
odp(koncentracja,tak).
odp(koncentracja,nie).
odp(wytrzymalosc,tak).
odp(wytrzymalosc,nie).
odp(towarzystwo,tak).
odp(towarzystwo,nie).
odp(zdecydowanie,tak).
odp(zdecydowanie,nie).
odp(opanowanie,tak).
odp(opanowanie,nie).
odp(zwinnosc,tak).
odp(zwinnosc,nie).
odp(szybkosc,tak).
odp(szybkosc,nie).


% reguly z wnioskami koncowymi
%
aktywnosc(kolarstwo) :-
	cecha(senior,nie),
	cecha(sylwetka,tak),
	cecha(kondycja,tak),
	cecha(wytrzymalosc,tak),
	cecha(szybkosc,tak),
	cecha(zwinnosc,tak).

aktywnosc(kolarstwo_gorskie) :-
	cecha(senior,nie),
	cecha(sylwetka,tak),
	cecha(kondycja,tak),
	cecha(sila,tak),
	cecha(wytrzymalosc,tak),
	cecha(koncentracja,tak),
	cecha(zwinnosc,tak),
	cecha(zdecydowanie,tak).
aktywnosc(kulturystyka) :-
	cecha(senior,nie),
	cecha(sylwetka,tak),
	cecha(sila,tak),
	cecha(wytrzymalosc,tak).
aktywnosc(bieganie) :-
	cecha(waga,tak),
	cecha(wytrzymalosc,tak),
	cecha(kondycja,tak),
	cecha(szybkosc,tak),
	cecha(zwinnosc,tak),
	cecha(stres,tak).
aktywnosc(golf) :-
	cecha(junior,nie),
	cecha(koncentracja,tak),
	cecha(opanowanie,tak),
	cecha(waga,nie),
	cecha(kondycja,nie),
	cecha(szybkosc,nie),
	cecha(zwinnosc,nie).
aktywnosc(kajaki) :-
	cecha(senior,nie),
	cecha(kondycja,tak),
	cecha(wytrzymalosc,tak),
	cecha(zwinnosc,tak),
	cecha(towarzystwo,tak).
aktywnosc(bieg_na_orientacje) :-
	cecha(senior,nie),
	cecha(waga,tak),
	cecha(wytrzymalosc,tak),
	cecha(zwinnosc,tak),
	cecha(towarzystwo,tak).
aktywnosc(narciarstwo) :-
	cecha(senior,nie),
	cecha(koncentracja,tak),
	cecha(szybkosc,tak),
	cecha(zwinnosc,tak),
	cecha(opanowanie,tak).
aktywnosc(snowboard) :-
	cecha(senior,nie),
	cecha(koncentracja,tak),
	cecha(szybkosc,tak),
	cecha(zwinnosc,tak),
	cecha(opanowanie,tak).
aktywnosc(spacer) :-
	cecha(kondycja,nie),
	cecha(waga,nie),
	cecha(opanowanie,nie),
	cecha(zdecydowanie,nie).
aktywnosc(nordic_walking) :-
	cecha(junior,nie),
	cecha(kondycja,tak).
aktywnosc(tenis) :-
	cecha(senior,nie),
	cecha(kondycja,tak),
	cecha(koncentracja,tak),
	cecha(szybkosc,tak),
	cecha(zwinnosc,tak).

cecha(X,Z) :- not(znane(X,_)),nl,pytaj(X),czytaj_odp(X),znane(X,Z).
cecha(X,Z) :- znane(X,Z).

% pytania

pytaj(junior) :-
        write('Czy masz mniej niz 20 lat? (tak./nie.)'),!.
pytaj(mlody_30) :-
	write('Czy masz mniej niz 30 lat? (tak./nie.)'),!.
pytaj(mlody_40) :-
	write('Czy masz mniej niz 40 lat? (tak./nie.)'),!.
pytaj(senior) :-
	write('Czy masz wiecej niz 40 lat? (tak./nie.)'),!.
pytaj(waga) :-
	write('Czy chcesz schudnac? (tak./nie.)'),!.
pytaj(sylwetka) :-
	write('Czy chcesz popracowac nad swoja sylwetka? (tak/nie)'),!.
pytaj(kondycja) :-
	write('Czy chcesz zwiekszyc swoja kondycje fizyczna? (tak./nie.)'),!.
pytaj(sila) :-
	write('Czy chcesz zwiekszyc swoja sile? (tak./nie.)'),!.
pytaj(wytrzymalosc) :-
	write('Czy chcesz poprawic swoja wytrzymalosc? (tak./nie.)'),!.
pytaj(koncentracja) :-
	write('Czy chcesz poprawic swoja koncentracje? (tak./nie.)'),!.
pytaj(szybkosc) :-
	write('Czy chcesz zwiekszyc swoja szybkosc? (tak./nie.)'),!.
pytaj(zwinnosc) :-
	write('Czy chcesz popracowac nad swoja zwinnoscia? (tak./nie.)'),!.
pytaj(opanowanie) :-
	write('Czy chcesz zwiekszych swoje opanowanie? (tak./nie.)'),!.
pytaj(towarzystwo) :-
	write('Czy lubsz spedzac czas z innymi ludzmi lub w towarzystwie znajomych? (tak./nie.)'),!.
pytaj(stres) :-
	write('Czy masz problem ze stresem w pracy/szkole? (tak./nie.)'),!.
pytaj(zdecydowanie) :-
	write('Czy chcesz byc bardziej zdecydowany? (tak./nie.)'),!.

pytaj(X) :- write('Czy '),write(X),write('? (tak/nie) ').


czytaj_odp(X) :- read(A),odp(X,A),assert(znane(X,A)),!.
czytaj_odp(X) :- czytaj_odp(X).

wyczysc_znane :- retractall(znane(_X,_Z)).

%tutaj warto wykorzystac liste, bo mozna uprawiac wiecej niz jeden sport

sport(silownia) :- write('Powinienes zaczac chodzic na silownie'),!.
sport(X) :- write('Powinienes uprawiac: '),write(X).


wykonaj :-
unknown(_,fail),aktywnosc(X),!,nl,sport(X),nl,nl,wyczysc_znane.
wykonaj :- aktywnosc(X),!,nl,sport(X),nl,nl,wyczysc_znane.

wykonaj :- nl,write('Nie jestem w stanie przypisac Ci aktywnosci fizycznej...'),wyczysc_znane.






