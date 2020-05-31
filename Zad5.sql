CREATE DATABASE zwierzetaSklep;
use zwierzetaSklep;

CREATE TABLE producenci
(
    id int AUTO_INCREMENT NOT NULL,
    nazwa varchar(40) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE zwierzeta
(
    id INT AUTO_INCREMENT NOT NULL,
    nazwaZwierzecia varchar(40)
);

CREATE TABLE artykuly
(   id int AUTO_INCREMENT PRIMARY KEY,
    nazwa varchar(40) NOT NULL,
    id_producenta INT NOT NULL,
    id_zwierze INT NOT NULL ,
    rodzaj varchar(5),
    waga INT DEFAULT NULL,
    iloscWmagazynie INT NOT NULL,
    cena INT NOT NULL,
    FOREIGN KEY (id_producenta) REFERENCES producenci(id),
    FOREIGN KEY (id_zwierze) REFERENCES zwierzeta(id)
);

CREATE TABLE klienci
(
    id         int AUTO_INCREMENT PRIMARY KEY,
    imie       varchar(40) NOT NULL,
    nazwisko   varchar(40) NOT NULL,
    nrTel      varchar(9)  NOT NULL,
    adres      varchar(40) NOT NULL
);


INSERT INTO producenci (nazwa) VALUE ('ACANA');
INSERT INTO producenci (nazwa) VALUE ('Orijen');
INSERT INTO producenci (nazwa) VALUE ('Purina');
INSERT INTO producenci (nazwa) VALUE ('WHISKAS');
INSERT INTO producenci (nazwa) VALUE ('Wiejska Dolina');
INSERT INTO producenci (nazwa) VALUE ('Pedigree');
INSERT INTO producenci (nazwa) VALUE ('AnimalLove');
INSERT INTO producenci (nazwa) VALUE ('BRIT');
INSERT INTO producenci (nazwa) VALUE ('TRIXIE');

INSERT INTO zwierzeta (nazwaZwierzecia) VALUE ('pies');
INSERT INTO zwierzeta (nazwaZwierzecia) VALUE ('kot');
INSERT INTO zwierzeta (nazwaZwierzecia) VALUE ('papuga');
INSERT INTO zwierzeta (nazwaZwierzecia) value ('chomik');

INSERT INTO artykuly (nazwa, id_producenta, id_zwierze, rodzaj, waga, iloscWmagazynie, cena)
    VALUES ('karma FISH PUPPY', 1, 1, 'sucha', 10, 12, 179);
INSERT INTO artykuly (nazwa, id_producenta, id_zwierze, rodzaj, waga, iloscWmagazynie, cena)
    VALUES ('karma Jagniecina szpinak', 5, 1, 'sucha', 9, 5, 220);
INSERT INTO artykuly (nazwa, id_producenta, id_zwierze, rodzaj, waga, iloscWmagazynie, cena)
    VALUES ('karma Losos wedzony', 4, 2, 'mokra', 1, 9, 25);
INSERT INTO artykuly (nazwa, id_producenta, id_zwierze, rodzaj, waga, iloscWmagazynie, cena)
    VALUES ('karma Wolowina SENIOR', 2, 1, 'sucha', 11, 9, 250);
INSERT INTO artykuly (nazwa, id_producenta, id_zwierze, rodzaj, waga, iloscWmagazynie, cena)
    VALUES ('karma Marchewka z miesem', 6, 1, 'mokra', 1, 13, 32);
INSERT INTO artykuly (nazwa, id_producenta, id_zwierze, rodzaj, waga, iloscWmagazynie, cena)
    VALUES ('karma MEAT MIX',3, 2, 'mokra', 1, 23, 115);
INSERT INTO artykuly (nazwa, id_producenta, id_zwierze, rodzaj, waga, iloscWmagazynie, cena)
    VALUES ('karma White fish', 1, 1, 'sucha', 7, 23, 145);
INSERT INTO artykuly (nazwa, id_producenta, id_zwierze, rodzaj, waga, iloscWmagazynie, cena)
    VALUES ('karma Happy Kitty',1, 2, 'sucha', 5, 4, 230);
INSERT INTO artykuly (nazwa, id_producenta, id_zwierze, rodzaj, waga, iloscWmagazynie, cena)
    VALUES ('karma Puszka Dorsz', 1, 2, 'mokra', 1, 11, 43);
INSERT INTO artykuly (nazwa, id_producenta, id_zwierze, rodzaj, waga, iloscWmagazynie, cena)
    VALUES ('karma Kurczak ze szpinakiem', 1, 1, 'sucha', 2, 16, 80);



INSERT INTO artykuly (nazwa, id_producenta, id_zwierze, iloscWmagazynie, cena)
    VALUES ('Kong czerwony', 1,1, 7, 20);
INSERT INTO artykuly (nazwa, id_producenta, id_zwierze, iloscWmagazynie, cena)
    VALUES ('Kong zolty', 1, 1, 7, 20);
INSERT INTO artykuly (nazwa, id_producenta, id_zwierze, iloscWmagazynie, cena)
    VALUES ('Kong niebieski', 1, 1, 7, 20);
INSERT INTO artykuly (nazwa, id_producenta, id_zwierze, iloscWmagazynie, cena)
    VALUES ('Kong zielony', 1, 1, 7, 20);
INSERT INTO artykuly (nazwa, id_producenta, id_zwierze, iloscWmagazynie, cena)
    VALUES ('Sznurek', 1, 1, 9, 5);
INSERT INTO artykuly (nazwa, id_producenta, id_zwierze, iloscWmagazynie, cena)
    VALUES ('Drapaczka', 4, 2, 4, 29);
INSERT INTO artykuly (nazwa, id_producenta, id_zwierze, iloscWmagazynie, cena)
    VALUES ('Kocimietka',4, 2, 15, 15);
INSERT INTO artykuly (nazwa, id_producenta, id_zwierze, iloscWmagazynie, cena)
    VALUES ('Domek dla kota', 4, 2, 2, 350);
INSERT INTO artykuly (nazwa, id_producenta, id_zwierze, iloscWmagazynie, cena)
    VALUES ('Wieszak zolty',7, 3, 5, 40);
INSERT INTO artykuly (nazwa, id_producenta, id_zwierze, iloscWmagazynie, cena)
    VALUES ('Laser', 4,2, 7, 90);
INSERT INTO artykuly (nazwa, id_producenta, id_zwierze, iloscWmagazynie, cena)
    VALUES ('Duza kula',7, 4, 4, 75);

INSERT INTO klienci (imie, nazwisko, nrTel, adres)
    VALUES ('Marcin', 'Jarzebski', '123456789', 'Klonowa 2');
INSERT INTO klienci (imie, nazwisko, nrTel, adres)
    VALUES ('Jolanta', 'Erdo', '111222333', 'Jesienna 3');
INSERT INTO klienci (imie, nazwisko, nrTel, adres)
    VALUES ('Hubert', 'Osmok', '222333111', 'Lipowa 14');
INSERT INTO klienci (imie, nazwisko, nrTel, adres)
    VALUES ('Ewa', 'Tuba', '333222111', 'Lema 12');
INSERT INTO klienci (imie, nazwisko, nrTel, adres)
    VALUES ('Jarek', 'Strzyglo', '777223333', 'Olszy 19');


-- Wyswietl wszystkie dane z tablicy
SELECT * FROM zwierzeta;
SELECT * FROM producenci;
SELECT * FROM artykuly;
SELECT * FROM klienci;

-- wszystkie co sprzedaja karme dla psow
SELECT DISTINCT producenci.nazwa
    FROM artykuly
    JOIN producenci on producenci.id = artykuly.id_producenta
    WHERE artykuly.nazwa LIKE ('karma%')  AND artykuly.id_zwierze = 1;

-- wszystkie firmy dostarczające produkty w liczbie przekraczającej 10,
SELECT DISTINCT producenci.nazwa
    FROM artykuly
    JOIN producenci on producenci.id = artykuly.id_producenta
    WHERE artykuly.iloscWmagazynie > 10;

-- wszystkie firmy dostarczające produkty w cenie między: 100 a 1000 zł,
SELECT DISTINCT producenci.nazwa
    FROM artykuly
    JOIN producenci ON producenci.id = artykuly.id_producenta
    WHERE artykuly.cena > 100 and artykuly.cena < 1000;

-- wszystkie firmy sprzedające karmę dla psów oraz karmę dla kotów,
SELECT DISTINCT producenci.nazwa
    FROM artykuly
    JOIN producenci on producenci.id = artykuly.id_producenta
    WHERE artykuly.nazwa LIKE ('karma%')  AND (artykuly.id_zwierze = 1 OR artykuly.id_zwierze = 2);

-- 10 firm dostarczających największą liczbę produktów,
SELECT DISTINCT producenci.nazwa, artykuly.iloscWmagazynie
    FROM artykuly
    JOIN producenci ON artykuly.id_producenta = producenci.id
    ORDER BY iloscWmagazynie DESC LIMIT 10;

-- 15 firm dostarczających najdroższe produkty (z pominięciem pierwszej pozycji na liście)
SELECT DISTINCT producenci.nazwa, artykuly.cena
    FROM artykuly
    JOIN producenci ON artykuly.id_producenta = producenci.id
    ORDER BY artykuly.cena DESC LIMIT 1, 16;

-- 1. Procedury wyświetlające wszystkie dane z każdej tabeli

DELIMITER //
CREATE PROCEDURE wypisz_producenci()
BEGIN
    SELECT * FROM producenci;
END //

CREATE PROCEDURE wypisz_zwierzeta()
BEGIN
    SELECT * FROM zwierzeta;
END //

CREATE PROCEDURE wypisz_artykuly()
BEGIN
    SELECT * FROM artykuly;
END //

CREATE PROCEDURE wypisz_klienci()
    BEGIN
        SELECT * FROM klienci;
    end //

DELIMITER ;

CALL wypisz_artykuly();
call wypisz_klienci();
call  wypisz_producenci();
call wypisz_zwierzeta();

-- 1. Procedury wyświetlające wszystkie dane z każdej tabeli

DELIMITER //
CREATE PROCEDURE modify_artykuly()
BEGIN
    UPDATE artykuly SET cena = 140 WHERE nazwa LIKE ('Kong%');
end //

CREATE PROCEDURE modify_klienci()
BEGIN
    UPDATE klienci SET adres = 'Stawowa 44' WHERE nrTel = '222333111';
end //

CREATE PROCEDURE modify_producent()
BEGIN
    UPDATE producenci SET nazwa = 'PURINA' WHERE nazwa = 'Purina';
end //
CREATE PROCEDURE modify_zwierzeta()
BEGIN
    UPDATE zwierzeta SET nazwaZwierzecia = 'myszoskoczek' WHERE nazwaZwierzecia = 'chomik';
end //

DELIMITER ;

CALL modify_artykuly();
CALL modify_klienci();
CALL modify_producent();
CALL modify_zwierzeta();

-- 3. Po jednej dowolnej procedurze dla każdej tabeli

DELIMITER //
CREATE PROCEDURE new_producent(IN input_nazwa varchar(40))
BEGIN
    INSERT INTO producenci (nazwa) VALUE (input_nazwa);
end //
CREATE PROCEDURE new_zwierze(IN input_nazwa varchar(40))
BEGIN
    INSERT INTO zwierzeta (nazwaZwierzecia) VALUE (input_nazwa);
end //
CREATE PROCEDURE wyswietl_drogie_artykuly()
BEGIN
    SELECT * FROM artykuly
    WHERE cena > 200;
end //
CREATE PROCEDURE klienci_z_Jesiennej()
BEGIN
    SELECT * FROM klienci
    WHERE adres LIKE ('Jesienna%');
end //

DELIMITER ;


CALL new_producent('Royal Canin');
CALL new_zwierze ('kanarek');
CALL wyswietl_drogie_artykuly();
CALL klienci_z_Jesiennej();