#1. Select the name and last name of the client with id 4.

SELECT imie, nazwisko 
FROM klienci 
WHERE idklienta=4

#2. Select all data about cars from the 2010 year.

SELECT * 
FROM auta 
WHERE rocznik=2010

#3. Select all data about Ford cars.

SELECT * 
FROM auta 
WHERE marka="Ford"

#4. Select all cars with id numbers including from 2 to 4.

SELECT * 
FROM auta 
ORDER BY idauta ASC 
LIMIT 3 OFFSET 1

#5. Select names and last names of clients living in Katowice city on Rolna street.

SELECT imie, nazwisko 
FROM klienci 
WHERE adres 
LIKE "%Rolna%"

#6. Select a car that has the most expensive insurance.

SELECT marka, model, ubezpieczenie 
FROM auta 
ORDER BY ubezpieczenie DESC 
LIMIT 1

#7. Select a car (idauta, marka, model) that was borrowed the earliest.

SELECT auta.idauta, auta.marka, auta.model, wypozyczenia.datawyp 
FROM auta, wypozyczenia 
WHERE auta.idauta=wypozyczenia.idauta 
ORDER BY wypozyczenia.datawyp ASC 
LIMIT 1

#8. Select names and last names of clients who have ever rented a car number 1.

SELECT klienci.imie, klienci.nazwisko 
FROM klienci, wypozyczenia 
WHERE idauta=1 AND klienci.idklienta=wypozyczenia.idklienta

#9. Select cars (marka, model) that were ever borrowed by the client with id 4.

SELECT auta.marka, auta.model 
FROM auta, wypozyczenia 
WHERE idklienta=4 AND auta.idauta=wypozyczenia.idauta

#10. Select cars (marka, model) that were ever borrowed by the client with the last name "Pastewniak".

SELECT auta.marka, auta.model 
FROM auta, wypozyczenia, klienci 
WHERE nazwisko="Pastewniak" AND auta.idauta=wypozyczenia.idauta AND klienci.idklienta=wypozyczenia.idklienta

