(defrule startujemy
   ?x <- (initial-fact)
   =>
   (retract ?x)
   (assert(start))
   (printout t crlf)
   (printout t "System diagnostyki problemów z internetem" crlf)
   (printout t crlf)
   (printout t "Implementacja w jezyku Clips" crlf)
   (printout t crlf)
   (printout t "Prosze odpowiadac na pytania tylko t lub n." crlf)
   (printout t crlf))

(defrule R0
   ?x <- (start)
   =>
   (retract ?x)
   (printout t crlf)
   (printout t "Zaczynamy!" crlf)
   (printout t crlf)
   (printout t "Czy masz dostep do internetu?" crlf)
   (assert(internet(read))))

(defrule R1
   ?x <- (internet ?internet-read&t|T)
   =>
   (retract ?x)
   (printout t crlf)
   (printout t "Moim zdaniem:" crlf)
   (printout t "Wszystko jest w porzadku" crlf)
   (assert(gotowe)))

(defrule R2
   ?x <- (internet ?internet-read&n|N)
   =>
   (retract ?x)

   (printout t "Czy posiadasz router?" crlf)
   (assert(router(read))))


(defrule R4
   ?x <- (router ?router-read&t|T)
   =>
   (retract ?x)
   (printout t "Czy Twoj komputer jest polaczony z routerem kablem sieciowym?" crlf)
   (assert(kabel(read))))

(defrule R5
   ?x <- (kabel ?kabel-read&t|T)
   =>
   (retract ?x)
   (printout t "Czy kabel sieciowy jest wpięty poprawnie w port w komputerze?" crlf)
   
   (assert(kabel-poprawnie(read))))

(defrule R6
   ?x <- (router ?router-read&n|N)
   =>
   (retract ?x)
   (printout t "Czy kabel przesylowy jest wpięty do poprawnego portu?" crlf)
  (assert(kabel-przesylowy(read))))

(defrule R7
   ?x <- (kabel ?kabel-read&n|N)
   => 
   (retract ?x)
   (printout t "Czy po restarcie routera jest dostep do internetu" crlf)
   (assert(restart(read))))


(defrule R8
   ?x <- (restart ?restart-read&t|T)
   =>
   (retract ?x)
   (printout t crlf)
   (printout t "Moim zdaniem:" crlf)
   (printout t "Router sie zawiesil" crlf)
   (assert(gotowe)))

(defrule R9
   ?x <- (kabel-poprawnie ?kabel-poprawnie-read&t|T)
   =>
   (retract ?x)
   (printout t "Czy diody sie poprawnie swieca?" crlf)
   (assert(diody(read))))

(defrule R10
   ?x <- (kabel-poprawnie ?kabel-poprawnie-read&n|N)
   =>
   (retract ?x)
   (printout t crlf)
   (printout t "Moim zdaniem:" crlf)
   (printout t "Popraw wpiecie kabla" crlf)
   (assert(gotowe)))

(defrule R11
   ?x <- (restart ?restart-read&n|N)
   =>
   (retract ?x)
 
   (printout t "Czy kabel przesyłowy jest wpięty do prawidłowego portu?" crlf)
   (assert(przesylowy(read))))

(defrule R12
   ?x <- (kabel-przesylowy ?kabel-przesylowy-read&t|T)
   =>
   (retract ?x)
   (printout t "Czy kable są docisniete?" crlf)
   (assert(kable-docisk(read))))



(defrule R13
   ?x <- (kabel-przesylowy ?kabel-przesylowy-read&n|N)
   =>
   (retract ?x)
   (printout t crlf)
   (printout t "Moim zdaniem:" crlf)
   (printout t "Nalezy poprawnie wpiac kabel" crlf)
   (assert(gotowe)))

   
(defrule R14
   ?x <- (przesylowy ?przesylowy-read&t|T)
   =>
   (retract ?x)
   (printout t "Czy kable sa docisniete?" crlf)
   (assert(docisk-kabli(read))))

   (defrule R15
   ?x <- (przesylowy ?przesylowy-read&n|N)
   =>
   (retract ?x)
 (printout t crlf)
   (printout t "Moim zdaniem:" crlf)
   (printout t "Nalezy poprawnie wpiac kabel" crlf)
   (assert(gotowe)))
   
   (defrule R16
   ?x <- (docisk-kabli ?docisk-kabli-read&t|T)
   =>
   (retract ?x)
   (printout t "Odetnij kabel sieciowy od routera oraz wepnij do karty sieciowej. Czy rejestrowales komputer u dostawcy?" crlf)
   (assert(dostawca(read))))
   
    (defrule R17
   ?x <- (docisk-kabli ?docisk-kabli-read&n|N)
   =>
   (retract ?x)
 (printout t crlf)
   (printout t "Moim zdaniem:" crlf)
   (printout t "Nalezy poprawnie wpiac kabel" crlf)
   (assert(gotowe)))
   
   (defrule R16a
   ?x <- (kable-docisk ?kable-docisk-read&t|T)
   =>
   (retract ?x)
   (printout t "Odetnij kabel sieciowy od routera oraz wepnij do karty sieciowej. Czy rejestrowales komputer u dostawcy?" crlf)
   (assert(dostawca(read))))
   
    (defrule R17a
   ?x <- (kable-docisk ?kable-docisk-read&n|N)
   =>
   (retract ?x)
 (printout t crlf)
   (printout t "Moim zdaniem:" crlf)
   (printout t "Nalezy poprawnie wpiac kabel" crlf)
   (assert(gotowe)))
   
    (defrule R18
   ?x <- (dostawca ?dostawca-read&t|T)
   =>
   (retract ?x)
   (printout t "Sprawdz aplikacje zainstalowane w komputerze. Czy masz moze wiecej niz jeden program antywirusowy?" crlf)
   (assert(antywirus(read))))
   
   (defrule R19
   ?x <- (dostawca ?dostawca-read&t|T)
   =>
   (retract ?x)
   (printout t "Czy wyswietla sie jakas strona?" crlf)
   (assert(strona(read))))
   
    (defrule R20
   ?x <- (strona ?strona-read&t|T)
   =>
   (retract ?x)
   (printout t crlf)
   (printout t "Moim zdaniem:" crlf)
   (printout t "Awaria routera" crlf)
   (assert(gotowe)))
   
   (defrule R20a
   ?x <- (strona ?strona-read&n|N)
   =>
   (retract ?x)
  (printout t crlf)
   (printout t "Moim zdaniem:" crlf)
   (printout t "Awaria sieci" crlf)
   (assert(gotowe)))
   
   (defrule R21
   ?x <- (dostawca ?dostawca-read&n|N)
   =>
   (retract ?x)
   (printout t "Czy wyswietla sie strona powitalna dostawcy" crlf)
   (assert(strona-powitalna(read))))
   
   (defrule R22 
   
   ?x <-(strona-wysw ?strona-wysw-read&t|T)
   =>
  
   (retract ?x)
 (printout t crlf)
   (printout t "Moim zdaniem:" crlf)
   (printout t "Awaria routera" crlf)
   (assert(gotowe)))
   
      (defrule R23
   
   ?x <-(strona-wysw ?strona-wysw-read&n|N)
   =>
  
   (retract ?x)
 (printout t crlf)
   (printout t "Moim zdaniem:" crlf)
   (printout t "Awaria sieci" crlf)
   (assert(gotowe)))
   
    (defrule R24
   ?x <- (kable-doscisk ?docisk-kabli-read&t|T)
   =>
   (retract ?x)
 (printout t crlf)
   (printout t "Moim zdaniem:" crlf)
   (printout t "Nalezy poprawnie docisnac kabel" crlf)
   (assert(gotowe)))
   
   (defrule R25
   ?x <- (strona-powitalna ?strona-powitalna-read&t|T)
   =>
   (retract ?x)
   (printout t "Moim zdaniem:" crlf)
   (printout t "Awaria routera" crlf)
   (assert(gotowe)))
   
     (defrule R26
   ?x <- (strona-powitalna ?strona-powitalna-read&n|N)
   =>
   (retract ?x)
   (printout t "Moim zdaniem:" crlf)
   (printout t "Awaria sieci" crlf)
   (assert(gotowe)))
   
   (defrule R27
   ?x <- (diody ?diody-read&t|T)
   =>
   (retract ?x)
   
   (printout t "Sprawdz aplikacje zainstalowane w komputerze. Czy masz moze wiecej niz jeden program antywirusowy?" crlf)
   (assert(antywirus(read))))
   
(defrule R28
   ?x <- (diody ?diody-read&n|N)
   =>
   (retract ?x)
   
   (printout t "Czy w komputerze masz więcej niż jedno gniazdo ethernet?" crlf)
   (assert(gniazdo(read))))
   
   (defrule R29
   ?x <- (gniazdo ?gniazdo-read&t|T)
   =>
   (retract ?x)
   
   (printout t "Wepnij w inne gniazdo. Czy masz internet?" crlf)
   (assert(gniazdo2(read))))
   
    (defrule R30
   ?x <- (gniazdo2 ?gniazdo2-read&t|T)
   =>
   (retract ?x)
   
   (printout t "Moim zdaniem:" crlf)
   (printout t "Awaria jednego gniazda" crlf)
   (assert(gotowe)))
   
    (defrule R31
   ?x <- (gniazdo2 ?gniazdo2-read&n|N)
   =>
   (retract ?x)
   
  (printout t "Moim zdaniem:" crlf)
   (printout t "Awaria jedynego gniazda. Oddaj kompututer do serwisu." crlf)
   (assert(gotowe)))
   
   (defrule R32
   ?x <- (gniazdo ?gniazdo-read&n|N)
   =>
   (retract ?x)
   
   (printout t "Moim zdaniem:" crlf)
   (printout t "Awaria jedynego gniazda. Oddaj kompututer do serwisu." crlf)
   (assert(gotowe)))
   
   (defrule R33
   ?x <- (antywirus ?antywirus-read&t|T)
   =>
   (retract ?x)
   
   (printout t "Skasuj jeden program oraz zbędne aplikacje. Czy aktualizowales program antywirusowy" crlf)
   (assert(aktualizacja(read))))
   
   
   (defrule R34
   ?x <- (antywirus ?antywirus-read&n|N)
   =>
   (retract ?x)
   
 (printout t "Moim zdaniem:" crlf)
   (printout t "Skasuj zbędne aplikacje" crlf)
   (assert(gotowe)))
   
   
   (defrule R35
   ?x <- (aktualizacja ?aktualizacja-read&t|T)
   =>
   (retract ?x)
   
   (printout t "Czy uzywasz programu do sciagania plikow" crlf)
   (assert(aplikacje_sciaganie(read))))
   
   
   (defrule R36
   ?x <- (aktualizacja ?aktualizacja-read&n|N)
   =>
   (retract ?x)
   
   (printout t "Moim zdaniem:" crlf)
   (printout t "Zaktualizuj program oraz przeskanuj komputer." crlf)
   (assert(gotowe)))
   
   (defrule R37
   ?x <- (aplikacje_sciaganie ?aplikacje-sciaganie-read&t|T)
   =>
   (retract ?x)
   
   (printout t "Moim zdaniem:" crlf)
   (printout t "Skonfiguruj program tak, aby nie sciagal z predkoscia wieksza niz 1/2-3/4 naszego lacza, 
   nie wysylal szybciej niz kilka kilobajtow na sekunde oraz nie otwieral wiecej niz 200-300 polaczen. " crlf)
  (assert(gotowe)))
  
   (defrule R38
   ?x <- (aplikacje_sciaganie ?aplikacje-sciaganie-read&n|N)
   =>
   (retract ?x)
   
    (printout t "Moim zdaniem:" crlf)
   (printout t "Zaloguj się do swojego panelu klienta, aby sprawdzić wykres ruchu swojej sieci." crlf)
 (assert(gotowe)))
   
(defrule koniec
   ?x <- (gotowe)
   =>
   (retract ?x)
   (printout t "EKSPERTYZA ZAKONCZONA" crlf)
   (printout t "Czy chcesz nastepnej diagnozy?" crlf)
   (assert(nastepna(read))))

(defrule nast
   ?x <-(nastepna ?nastepna-read&t|T)
   =>
   (retract ?x)
   (assert(start)))
