Linux programozási feladat.

A választott feladatomnak a lényege, hogy egy átlalam kiválasztott zene dalszövegét megjelenítse a képernyőn. A sikeres lefutáshoz két paraméterre van szükség. 
Ismerni kell a dal előadóját, illetve a zene pontos címét is. A program leginkább külföldi zenéknek a szövegét képes megjeleníteni, sajnos magyar dalszövegeket a tesztelés során nem sikerült kiíratni a képernyőre. 
A program Bash scriptben lett megírva és a JSON kezelésére a python áll rendelkezésre.

Tesztelés:
A teszteléshez a szükséges jogosultságokat meg kell adni. Ezt a CHMOD 775 paranccsal tudjuk megtenni.

1. chmod 775 zenekereso.sh
2. ./zenekereso -s eloado -d cim

Futtatási segédlet:
-s: ide tartozik a szám előadója
-d: ide tartozik a szám címe

Példa egy valós futtatásra: 

1. chmod 775 zenekereso.sh
2. ./zenekereso -s Adele -d Easy On Me
