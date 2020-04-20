:- include(isimler_ddi).
:- include(fiiller_ddi).

:- op(800, fx, if).
:- op(700, xfx, then).
:- op(300, xfy, or).
:- op(200, xfy, and).


:- dynamic mekan/1.
:- dynamic eylem/1.
:- dynamic ozne/1.
:- dynamic nesne/1.
:- dynamic zaman/1.
:- dynamic ozne1/1.

cumle(O,N,Z,M,E):-
assert(ozne(O)),
assert(ozne1(O)),
assert(nesne(N)),
assert(zaman(Z)),
assert(mekan(M)),
assert(eylem(E)).


ileri:-
yeni_ozne_ekle(O),
write('Yeni ozne:'),write(O),nl,
assert(ozne(O)),fail.

ileri:-
yeni_ozne_ekle2(O),
write('Yeni ozne:'),write(O),nl,
assert(ozne(O)),fail.

ileri:-
yeni_ozne_ekle3(O),
write('Yeni ozne:'),write(O),nl,
assert(ozne(O)),fail.

ileri:-
yeni_mekan_ekle(M),
write('Yeni mekan:'),write(M),nl,
assert(mekan(M)),fail.

ileri:-
yeni_mekan_ekle2(M),
write('Yeni mekan:'),write(M),nl,
assert(mekan(M)),fail.

ileri:-
yeni_eylem_ekle(E),
write('Yeni eylem:'),write(E),nl,
assert(eylem(E)),fail.


/* Kişi bir yerde bulunmuşsa
 o yer de başka yerde bulunuyorsa
 kişi orada bulunuyor olabilir */ 
yeni_mekan_ekle(M):-
mekan(A),
iliski(A,'nerede bulunur? ',M),
not(mekan(M)),
ozne1(U),
open('X.txt',append,OS),
write(OS,U), write(OS," "),write(OS,M),write(OS," icindedir "),
write(OS,"("),write(OS,A),write(OS," "),write(OS,M),write(OS," icinde "),
write(OS," bulunur"),write(OS,")"),
nl(OS),close(OS).

/* Kişi bir eylem yapıyorsa ve o eylem
 bir yerde yapılıyorsa kişi orada olabilir. */
yeni_mekan_ekle2(M):-
eylem(E),
iliski(E,'nerede yapılır?',M),
not(mekan(M)),
ozne1(U),
open('X.txt',append,OS),
write(OS,U), write(OS," "),write(OS,M),write(OS," icindedir "),
write(OS,"("),write(OS,E),write(OS," "),write(OS,M),write(OS," icinde "),
write(OS," yapilir"),write(OS,")"),
nl(OS),close(OS).

/* Kişi bir iş yapmışsa o işi yapan kişi olabilir. */
yeni_ozne_ekle(O):-
eylem(E),
iliski(E,'kim/ne yapar?',O),
not(ozne(O)),
ozne1(U),
open('X.txt',append,OS),
write(OS,U),write(OS," "),write(OS,O),write(OS," "),
write(OS,"("),write(OS,E),write(OS," eylemini "),
write(OS,O),write(OS," yapar"),write(OS,")"),
nl(OS),close(OS).

/* Kişi bir yerde bulunmuşsa o yerde bulunan bir şey olabilir */ 
yeni_ozne_ekle2(O):-
mekan(M),
iliski(O,'nerede bulunur? ',M),
not(ozne(O)),
ozne1(U),
open('X.txt',append,OS),
write(OS,U), write(OS," "),write(OS,O),write(OS," "),
write(OS,"("),write(OS,M),write(OS," icinde "),
write(OS,O),write(OS," bulunur"),write(OS,")"),
nl(OS),close(OS).

/* Kişi bir eylemi yapmışsa
 ve o eylem bir şey olunca yapılıyorsa 
 kişi o şey olabilir.	*/
yeni_ozne_ekle3(O):-
eylem(E),
iliski(E,'ne olunca yapılır?',O),
not(ozne(O)),
ozne1(U),
open('X.txt',append,OS),
write(OS,U),write(OS," "),write(OS,O),write(OS," "),
write(OS,"("),write(OS,E),write(OS," eylemini yaparsa"),
write(OS,O),write(OS," olmuştur"),write(OS,")"),
nl(OS),close(OS).

/* Kişi bir eylem yapmışsa ve eylemi yapınca
başka bir şey oluyorsa kişi o eylemi de yapıyor olabilir. */
yeni_eylem_ekle(E):-
eylem(A),
iliski(A,'yapınca ne olur?',E),
not(eylem(E)),
ozne1(U),
open('X.txt',append,OS),
write(OS,U), write(OS," "),write(OS,E),write(OS," yapar "),
write(OS,"("),write(OS,A),write(OS," yapınca "),write(OS,E),
write(OS," yapılır."),write(OS,")"),
nl(OS),close(OS).
















