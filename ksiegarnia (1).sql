CREATE TABLE Ksiazki
(   id int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    tytul varchar(50) NOT NULL ,
    autor varchar(50),
    wydanie DATE NOT NULL,
    cena int NOT NULL,
    ilosc int NOT NULL
);
INSERT INTO Ksiazki (tytul, autor, wydanie, cena, ilosc) VALUES ('Pan Janusz', 'Juliusz Mackiewicz', '1980-06-21', 39, 113);
INSERT INTO Ksiazki (tytul, autor, wydanie, cena, ilosc) VALUES ('Jowiszanin', 'Tom Rosberg', '1999-11-13', 45, 99);
INSERT INTO Ksiazki (tytul, autor, wydanie, cena, ilosc) VALUES ('Rototo', 'Ewa Koszuk', '2005-01-04', 19, 160);
INSERT INTO Ksiazki (tytul, autor, wydanie, cena, ilosc) VALUES ('Ciemna Strona Ziemi', 'Albert Reinah', '1942-10-08', 69, 79);
INSERT INTO Ksiazki (tytul, autor, wydanie, cena, ilosc) VALUES ('Kiedyś w Szanghaju', 'Julia Anesberg', '1997-04-14', 29, 134);
INSERT INTO Ksiazki (tytul, autor, wydanie, cena, ilosc) VALUES ('Impoteris', 'Agatha Triccoli', '2011-04-09', 35, 220);
INSERT INTO Ksiazki (tytul, autor, wydanie, cena, ilosc) VALUES ('Złote lata', 'Ryszard Zawadzki', '2001-12-12', 29, 121);

CREATE TABLE Klienci
(
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    imie varchar(25) NOT NULL,
    nazwisko varchar(40) NOT NULL,
    nazwa_firmy varchar(100),
    NIP int,
    adres varchar(40) NOT NULL,
    nr_tel varchar(9) NOT NULL
);
INSERT INTO Klienci (imie, nazwisko, nr_tel, adres) VALUES ('Tomasz', 'Wajda', '123456789', 'Mleczna 12');
INSERT INTO Klienci (imie, nazwisko, nr_tel, adres) VALUES ('Jacek', 'Kaczmarczyk', '987654321', 'Ulera 44');
INSERT INTO Klienci (imie, nazwisko, nr_tel, adres) VALUES ('Bartosz', 'Mentas', '111222333', 'Lipska 155');
INSERT INTO Klienci (imie, nazwisko, nr_tel, adres) VALUES ('Urszula', 'Rak', '111222111', 'Jerzego Bora 2');
INSERT INTO Klienci (imie, nazwisko, nr_tel, adres) VALUES ('Janusz', 'Loczek', '333222111', 'Makowa 22/4');
INSERT INTO Klienci (imie, nazwisko, nr_tel, adres) VALUES ('Monika', 'Buczek', '444555666', 'Narzeda 1');
INSERT INTO Klienci (imie, nazwisko, nr_tel, adres) VALUES ('Tomasz', 'Ulist', '586869494', 'Pod Lipa 25');
INSERT INTO Klienci (imie, nazwisko, nr_tel, adres) VALUES ('Jagoda', 'Malik', '859695543', 'Morska 243');
INSERT INTO Klienci (imie, nazwisko, nazwa_firmy, NIP, adres, nr_tel) VALUES ('Stefan', 'Batory', 'Herkules', 1234, 'Halna 2', '542643754');
INSERT INTO Klienci (imie, nazwisko, nazwa_firmy, NIP, adres, nr_tel) VALUES ('Nela', 'Jaskier', 'Wyzima', 2137, 'Skelige 92', '542643999');
INSERT INTO Klienci (imie, nazwisko, nazwa_firmy, NIP, adres, nr_tel) VALUES ('Krystian', 'Jez', 'Cintra', 992, 'Turowa 66', '999643754');

CREATE TABLE stanowiska
(
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    rola varchar(40) NOT NULL,
    liczba_godzin int NOT NULL,
    pensja int NOT NULL
);
INSERT INTO stanowiska (rola, liczba_godzin, pensja) VALUES ('Sprzedawca', 160, 2900);
INSERT INTO stanowiska (rola, liczba_godzin, pensja) VALUES ('Obsluga klienta', 120, 1800);
INSERT INTO stanowiska (rola, liczba_godzin, pensja) VALUES ('Obsluga magazynu', 180, 3000);
INSERT INTO stanowiska (rola, liczba_godzin, pensja) VALUES ('Ksiegowy', 160, 4000);

CREATE TABLE pracownicy
(
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    imie varchar(25) NOT NULL,
    nazwisko varchar(40) NOT NULL,
    adres varchar(40) NOT NULL,
    nr_tel varchar(9) NOT NULL,
    id_stanowisko int NOT NULL,
    FOREIGN KEY (id_stanowisko) REFERENCES stanowiska(id)
);
INSERT INTO pracownicy (imie, nazwisko, adres, nr_tel, id_stanowisko) VALUES ('Jan', 'Nowak', 'Chlebowa 2', '123456799', 3);
INSERT INTO pracownicy (imie, nazwisko, adres, nr_tel, id_stanowisko) VALUES ('Janina', 'Nosek', 'Arki 16/5', '222456799', 4);
INSERT INTO pracownicy (imie, nazwisko, adres, nr_tel, id_stanowisko) VALUES ('Adam', 'Kisiel', 'Januszki 42', '123433799', 1);
INSERT INTO pracownicy (imie, nazwisko, adres, nr_tel, id_stanowisko) VALUES ('Agnieszka', 'Karak', 'Lipska 4/22', '123456711', 1);
INSERT INTO pracownicy (imie, nazwisko, adres, nr_tel, id_stanowisko) VALUES ('Konrad', 'Ulman', 'Krucza 112', '664656711', 2);

CREATE TABLE zamowienie
(
    id int NOT NULL AUTO_INCREMENT,
    id_ksiazki int NOT NULL,
    ilosc int NOT NULL,
    wartosc int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_ksiazki) REFERENCES Ksiazki(id)
);


CREATE TABLE faktury
(
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_klienta int NOT NULL,
    data_wystawienia DATE NOT NULL,
    wartosc_zamowienia int NOT NULL,
    FOREIGN KEY (id_klienta) REFERENCES Klienci(id)
);

CREATE TABLE zamowienia_na_fakturze
(
    id_faktury int NOT NULL,
    id_zamowienia int NOT NULL,
    FOREIGN KEY (id_faktury) REFERENCES faktury(id),
    FOREIGN KEY (id_zamowienia) REFERENCES zamowienie(id)
);

INSERT INTO zamowienie (id_ksiazki, ilosc, wartosc) VALUES (1, 4, 156);
INSERT INTO zamowienie (id_ksiazki, ilosc, wartosc) VALUES (3, 10, 190);
INSERT INTO faktury (id_klienta, data_wystawienia, wartosc_zamowienia) VALUES (9, '2019-12-10', 346);
INSERT INTO zamowienia_na_fakturze (id_faktury, id_zamowienia) VALUES (1, 1);
INSERT INTO zamowienia_na_fakturze (id_faktury, id_zamowienia) VALUES (1, 2);

INSERT INTO zamowienie (id_ksiazki, ilosc, wartosc) VALUES (2, 1, 45);
INSERT INTO zamowienie (id_ksiazki, ilosc, wartosc) VALUES (4, 1, 69);
INSERT INTO faktury (id_klienta, data_wystawienia, wartosc_zamowienia) VALUES (1, '2019-12-14', 114);
INSERT INTO zamowienia_na_fakturze (id_faktury, id_zamowienia) VALUES (2, 3);
INSERT INTO zamowienia_na_fakturze (id_faktury, id_zamowienia) VALUES (2, 4);

INSERT INTO zamowienie (id_ksiazki, ilosc, wartosc) VALUES (5, 1, 29);
INSERT INTO faktury (id_klienta, data_wystawienia, wartosc_zamowienia) VALUES (2, '2019-12-11', 29);
INSERT INTO zamowienia_na_fakturze (ID_FAKTURY, ID_ZAMOWIENIA) VALUES (3, 5);

INSERT INTO zamowienie (id_ksiazki, ilosc, wartosc) VALUES (6, 100, 3500);
INSERT INTO zamowienie (id_ksiazki, ilosc, wartosc) VALUES (7, 40, 1160);
INSERT INTO zamowienie (ID_KSIAZKI, ILOSC, WARTOSC) VALUES (1, 20, 780);
INSERT INTO zamowienie (id_ksiazki, ilosc, wartosc) VALUES (2, 10, 450);
INSERT INTO faktury (id_klienta, data_wystawienia, wartosc_zamowienia) VALUES (10, '2019-12-18', 5890);
INSERT INTO zamowienia_na_fakturze (id_faktury, id_zamowienia) VALUES (4, 6);
INSERT INTO zamowienia_na_fakturze (id_faktury, id_zamowienia) VALUES (4, 7);
INSERT INTO zamowienia_na_fakturze (id_faktury, id_zamowienia) VALUES (4, 8);
INSERT INTO zamowienia_na_fakturze (id_faktury, id_zamowienia) VALUES (4, 9);

INSERT INTO zamowienie (ID_KSIAZKI, ILOSC, WARTOSC) VALUES (4, 3, 276);
INSERT INTO faktury (id_klienta, data_wystawienia, wartosc_zamowienia) VALUES (4, '2019-12-27', 276);
INSERT INTO zamowienia_na_fakturze (id_faktury, id_zamowienia) VALUES (5, 10);


START TRANSACTION;
UPDATE Klienci
SET adres = 'Mleczna 21'
WHERE id = 1;
INSERT INTO Ksiazki (tytul, autor, wydanie, cena, ilosc)
    VALUES ('Mahakam', 'Tyreneusz Woźny', '2001-03-22', 39, 230);
COMMIT;




START TRANSACTION;

UPDATE Klienci
SET nazwa_firmy = 'Ubuntu', NIP = 689
WHERE id = 4;

INSERT INTO zamowienie (id_ksiazki, ilosc, wartosc) VALUES (8, 10, 390);
INSERT INTO zamowienie (id_ksiazki, ilosc, wartosc) VALUES (3, 20, 380);
INSERT INTO zamowienie (id_ksiazki, ilosc, wartosc) VALUES (5, 8, 232);

UPDATE faktury
SET wartosc_zamowienia = 1278
WHERE id = 5;

INSERT INTO zamowienia_na_fakturze (id_faktury, id_zamowienia) VALUES (5, 11);
INSERT INTO zamowienia_na_fakturze (id_faktury, id_zamowienia) VALUES (5, 12);
INSERT INTO zamowienia_na_fakturze (id_faktury, id_zamowienia) VALUES (5, 13);

COMMIT;



START TRANSACTION;

UPDATE faktury
SET id_klienta = 6
WHERE id = 5;

INSERT INTO pracownicy (imie, nazwisko, adres, nr_tel, id_stanowisko)
    VALUES ('Zdzislaw', 'Stonoga', 'Malinowa 44', '124356789', 2);

ROLLBACK;










