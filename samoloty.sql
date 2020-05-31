CREATE TABLE ObslugaSamolotu
(
    id                       INT         NOT NULL AUTO_INCREMENT,
    imie                     VARCHAR(30) NOT NULL,
    nazwisko                 VARCHAR(30) NOT NULL,
    stanowisko               INT         NOT NULL,
    ilosc_przelatanych_minut FLOAT       NOT NULL,
    extra_pensja        INT,
    PRIMARY KEY (id),
    FOREIGN KEY (stanowisko) REFERENCES Stanowiska (id)
);
CREATE TABLE Lot_ObslugaSamolotu
(
    id           INT NOT NULL AUTO_INCREMENT,
    id_lotu      INT NOT NULL,
    id_ObslugaSamolotuu INT NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE Stanowiska
(
    id                INT         NOT NULL AUTO_INCREMENT,
    nazwa             VARCHAR(30) NOT NULL,
    pensja_podstawowa INT         NOT NULL,
    PRIMARY KEY (id)
);



CREATE TABLE Trasy
(
    id          INT NOT NULL AUTO_INCREMENT,
    id_wylotu   INT NOT NULL,
    id_przylotu INT NOT NULL,
    odleglosc   INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_wylotu) REFERENCES Lotniska (id),
    FOREIGN KEY (id_przylotu) REFERENCES Lotniska (id)
);

CREATE TABLE Pasazerowie
(
    pesel                    VARCHAR(30) NOT NULL,
    imie                     VARCHAR(30),
    nazwisko                 VARCHAR(30),
    ilosc_lotow              INT         NOT NULL,
    ilosc_przelatanych_minut FLOAT       NOT NULL,
    ilosc_przelatanych_km    INT         NOT NULL,
    wysokosc_rabatu          FLOAT       NOT NULL,
    PRIMARY KEY (pesel)
);

CREATE TABLE Loty
(
    id                INT         NOT NULL AUTO_INCREMENT,
    numer_lotu        INT         NOT NULL,
    pesel_pasazera    VARCHAR(11) NOT NULL,
    imie_pasazera     VARCHAR(30) NOT NULL,
    nazwisko_pasazera VARCHAR(30) NOT NULL,
    id_samolotu       INT         NOT NULL,
    data_wylotu       DATE        NOT NULL,
    id_trasy          INT         NOT NULL,
    czas_lotu_minuty  FLOAT       NOT NULL,
    klasa             INT         NOT NULL,
    cena_biletu       FLOAT       NOT NULL,
    koszt_lotu        FLOAT       NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (pesel_pasazera) REFERENCES Pasazerowie (pesel),
    FOREIGN KEY (id_samolotu) REFERENCES Samoloty (id),
    FOREIGN KEY (id_trasy) REFERENCES Trasy (id)
);
CREATE TABLE Samoloty
(
    id                     INT         NOT NULL AUTO_INCREMENT,
    nazwa                  VARCHAR(30) NOT NULL,
    jak_szybko INT         NOT NULL,
    przebieg_w_godzinach   INT         NOT NULL,
    ilosc_miejsc_biznes    INT         NOT NULL,
    ilosc_miejsc_normal    INT         NOT NULL,
    spalanie_na_km         FLOAT       NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO Stanowiska(nazwa, pensja_podstawowa)
VALUES ('Pilot', 8000);
INSERT INTO Stanowiska(nazwa, pensja_podstawowa)
VALUES ('Steward', 3500);


INSERT INTO ObslugaSamolotu(imie, nazwisko, stanowisko, ilosc_przelatanych_minut, extra_pensja)
VALUES ('Janusz', 'Kowalik', 1, 0.0, 100);
INSERT INTO ObslugaSamolotu(imie, nazwisko, stanowisko, ilosc_przelatanych_minut, extra_pensja)
VALUES ('Jan', 'Kowalski', 1, 0.0, 0);
INSERT INTO ObslugaSamolotu(imie, nazwisko, stanowisko, ilosc_przelatanych_minut, extra_pensja)
VALUES ('Maciej', 'Malik', 1, 0.0, 0);
INSERT INTO ObslugaSamolotu(imie, nazwisko, stanowisko, ilosc_przelatanych_minut, extra_pensja)
VALUES ('Mariusz', 'Olik', 2, 0.0, 50);
INSERT INTO ObslugaSamolotu(imie, nazwisko, stanowisko, ilosc_przelatanych_minut, extra_pensja)
VALUES ('Jacek', 'Stek', 2, 0.0, 150);
INSERT INTO ObslugaSamolotu(imie, nazwisko, stanowisko, ilosc_przelatanych_minut, extra_pensja)
VALUES ('Waclaw', 'Beres', 2, 0.0, 0);


INSERT INTO Samoloty(nazwa, jak_szybko, przebieg_w_godzinach, ilosc_miejsc_biznes,
                     ilosc_miejsc_normal, spalanie_na_km)
VALUES ('Boeing 747-100', 893, 123, 12, 440, 0.7);
INSERT INTO Samoloty(nazwa, jak_szybko, przebieg_w_godzinach, ilosc_miejsc_biznes,
                     ilosc_miejsc_normal, spalanie_na_km)
VALUES ('Boeing 747-400', 913, 160, 16, 444, 0.8);
INSERT INTO Samoloty(nazwa, jak_szybko, przebieg_w_godzinach, ilosc_miejsc_biznes,
                     ilosc_miejsc_normal, spalanie_na_km)
VALUES ('Boeing 737-100', 760, 1049, 124, 2, 1.3);
INSERT INTO Samoloty(nazwa, jak_szybko, przebieg_w_godzinach, ilosc_miejsc_biznes,
                     ilosc_miejsc_normal, spalanie_na_km)
VALUES ('Boeing 737-300', 780, 1049, 149, 2, 0.77);
INSERT INTO Samoloty(nazwa, jak_szybko, przebieg_w_godzinach, ilosc_miejsc_biznes,
                     ilosc_miejsc_normal, spalanie_na_km)
VALUES ('Boeing 777', 905, 229, 10, 400, 0.6);
INSERT INTO Samoloty(nazwa, jak_szybko, przebieg_w_godzinach, ilosc_miejsc_biznes,
                     ilosc_miejsc_normal, spalanie_na_km)
VALUES ('Aurbus A300', 897, 309, 10, 398, 1.0);
INSERT INTO Samoloty(nazwa, jak_szybko, przebieg_w_godzinach, ilosc_miejsc_biznes,
                     ilosc_miejsc_normal, spalanie_na_km)
VALUES ('McDonnell Douglas DC-10', 908, 899, 4, 270, 1.1);
INSERT INTO Samoloty(nazwa, jak_szybko, przebieg_w_godzinach, ilosc_miejsc_biznes,
                     ilosc_miejsc_normal, spalanie_na_km)
VALUES ('Boeing 737-200', 760, 1049, 136, 2, 0.97);


CREATE TABLE Lotniska
(
    id    INT NOT NULL AUTO_INCREMENT,
    nazwa VARCHAR(30),
    PRIMARY KEY (id)
);


INSERT INTO Lotniska(nazwa)
VALUES ('Krakow');
INSERT INTO Lotniska(nazwa)
VALUES ('Jasionka');
INSERT INTO Lotniska(nazwa)
VALUES ('Warszawa');
INSERT INTO Lotniska(nazwa)
VALUES ('Gdansk');
INSERT INTO Lotniska(nazwa)
VALUES ('Los Angeles');

INSERT INTO Trasy(id_wylotu, id_przylotu, odleglosc)
VALUES (1, 2, 150);
INSERT INTO Trasy(id_wylotu, id_przylotu, odleglosc)
VALUES (2, 1, 150);
INSERT INTO Trasy(id_wylotu, id_przylotu, odleglosc)
VALUES (1, 3, 200);
INSERT INTO Trasy(id_wylotu, id_przylotu, odleglosc)
VALUES (3, 1, 200);
INSERT INTO Trasy(id_wylotu, id_przylotu, odleglosc)
VALUES (1, 4, 700);
INSERT INTO Trasy(id_wylotu, id_przylotu, odleglosc)
VALUES (4, 1, 700);
INSERT INTO Trasy(id_wylotu, id_przylotu, odleglosc)
VALUES (2, 3, 250);
INSERT INTO Trasy(id_wylotu, id_przylotu, odleglosc)
VALUES (3, 2, 250);
INSERT INTO Trasy(id_wylotu, id_przylotu, odleglosc)
VALUES (2, 4, 760);
INSERT INTO Trasy(id_wylotu, id_przylotu, odleglosc)
VALUES (4, 2, 760);
INSERT INTO Trasy(id_wylotu, id_przylotu, odleglosc)
VALUES (3, 4, 500);
INSERT INTO Trasy(id_wylotu, id_przylotu, odleglosc)
VALUES (4, 3, 500);
INSERT INTO Trasy(id_wylotu, id_przylotu, odleglosc)
VALUES (2, 5, 9500);
INSERT INTO Trasy(id_wylotu, id_przylotu, odleglosc)
VALUES (5, 2, 9500);



DELIMITER //
CREATE PROCEDURE DodajLot(IN numer_lotu_in INT, pesel_pasazera_in VARCHAR(11), imie_pasazera_in VARCHAR(30),
                          nazwisko_pasazera_in VARCHAR(30), id_samolotu_in INT, data_wylotu_in DATE,
                          id_trasy_in INT,
                          klasa_in INT)
BEGIN
    SET @cena_paliwa = 5.1;
    SET @mnoznik_ceny_klasa_1 = 2;
    SET @mnoznik_ceny_klasa_2 = 1.3;
    IF (SELECT pesel FROM Pasazerowie WHERE pesel = pesel_pasazera_in) IS NULL THEN
        INSERT INTO Pasazerowie(pesel, imie, nazwisko, ilosc_lotow, ilosc_przelatanych_minut, ilosc_przelatanych_km,
                                wysokosc_rabatu)
        VALUES (pesel_pasazera_in, imie_pasazera_in, nazwisko_pasazera_in, 0, 0.0, 0, 0.0);
    END IF;

    SET @koszt = (SELECT spalanie_na_km FROM Samoloty WHERE id = id_samolotu_in) *
                 (SELECT odleglosc FROM Trasy WHERE id = id_trasy_in);

    IF klasa_in = 1 THEN
        SET @cena = (SELECT spalanie_na_km FROM Samoloty WHERE id = id_samolotu_in) *
                    (SELECT odleglosc FROM Trasy WHERE id = id_trasy_in) * @mnoznik_ceny_klasa_1 *
                    (1 - (SELECT wysokosc_rabatu FROM Pasazerowie WHERE pesel = pesel_pasazera_in));

    END IF;
    IF klasa_in = 2 THEN
        SET @cena = (SELECT spalanie_na_km FROM Samoloty WHERE id = id_samolotu_in) *
                    (SELECT odleglosc FROM Trasy WHERE id = id_trasy_in) * @mnoznik_ceny_klasa_2 *
                    (1 - (SELECT wysokosc_rabatu FROM Pasazerowie WHERE pesel = pesel_pasazera_in));
    END IF;


    SET @czas = 60 * (SELECT odleglosc FROM Trasy WHERE id = id_trasy_in) /
                (SELECT jak_szybko FROM Samoloty WHERE id = id_samolotu_in);


    INSERT INTO Loty(numer_lotu, pesel_pasazera, imie_pasazera, nazwisko_pasazera, id_samolotu, data_wylotu,
                     id_trasy,
                     czas_lotu_minuty, klasa, cena_biletu, koszt_lotu)
    VALUES (numer_lotu_in, pesel_pasazera_in, imie_pasazera_in, nazwisko_pasazera_in, id_samolotu_in,
            data_wylotu_in,
            id_trasy_in, @czas, klasa_in, @cena, @koszt);

    UPDATE Pasazerowie
    SET wysokosc_rabatu          = 0,
        ilosc_przelatanych_minut = ilosc_przelatanych_minut + @czas,
        ilosc_przelatanych_km    = ilosc_przelatanych_km + (SELECT odleglosc FROM Trasy WHERE id = id_trasy_in),
        ilosc_lotow              = ilosc_lotow + 1
    WHERE pesel = pesel_pasazera_in;

END;
//
DELIMITER ;

CALL DodajLot(1, '27384017263', 'Maksymilian', 'Awokado', 1, '2019-08-19', 1,
              1);
CALL DodajLot(2, '27398617263', 'Ryszard', 'Snak', 2, '2019-11-19', 3,
              2);
CALL DodajLot(2, '01384017000', 'Jakub', 'Uwal', 2, '2019-11-19', 3,
              2);
CALL DodajLot(3, '66666617263', 'Igor', 'Nosek', 3, '2019-11-27', 13,
              1);
CALL DodajLot(4, '66666617263', 'Igor', 'Nosek', 3, '2019-12-06', 14,
              1);

DELIMITER //
CREATE PROCEDURE przydzielObslugaSamolotu(numer_lotu_in INT, id_pilota_in INT, id_ObslugaSamolotuu1_in INT, id_ObslugaSamolotuu2_in INT)
BEGIN
    SET @czas = (SELECT czas_lotu_minuty FROM Loty WHERE numer_lotu = numer_lotu_in LIMIT 1);

    INSERT INTO Lot_ObslugaSamolotu(id_lotu, id_ObslugaSamolotuu) VALUES (numer_lotu_in, id_pilota_in);
    INSERT INTO Lot_ObslugaSamolotu(id_lotu, id_ObslugaSamolotuu) VALUES (numer_lotu_in, id_ObslugaSamolotuu1_in);
    INSERT INTO Lot_ObslugaSamolotu(id_lotu, id_ObslugaSamolotuu) VALUES (numer_lotu_in, id_ObslugaSamolotuu2_in);

    UPDATE ObslugaSamolotu
    SET ilosc_przelatanych_minut = ilosc_przelatanych_minut + @czas
    WHERE id = id_pilota_in
       OR id = id_ObslugaSamolotuu1_in
       OR id = id_ObslugaSamolotuu2_in;

END;
//
DELIMITER ;

CALL przydzielObslugaSamolotu(1, 1, 4, 5);
CALL przydzielObslugaSamolotu(2, 2, 4, 6);
CALL przydzielObslugaSamolotu(3, 1, 5, 6);
CALL przydzielObslugaSamolotu(4, 2, 4, 5);



DELIMITER //
CREATE PROCEDURE rabat_dla_stalych_klientow()
BEGIN
    DECLARE n INT DEFAULT 0;
    DECLARE i INT DEFAULT 0;
    SET n = (SELECT COUNT(*) FROM Loty WHERE data_wylotu > (CURRENT_DATE - data_wylotu));
    SET i = 0;
    WHILE i < n
        DO
            UPDATE Pasazerowie
            SET wysokosc_rabatu = 0.1
            WHERE pesel = (SELECT pesel_pasazera FROM Loty ORDER BY data_wylotu DESC LIMIT i,1)
              AND ilosc_przelatanych_km > 10000;
            SET i = i + 1;
        END WHILE;
END;
//
DELIMITER ;

CALL rabat_dla_stalych_klientow();


DELIMITER //
CREATE PROCEDURE koszt_zysk(IN numer_lotu_in INT)
BEGIN
    SELECT SUM(koszt_lotu) AS Koszt, SUM(cena_biletu) AS Zysk
    FROM Loty
    WHERE numer_lotu = numer_lotu_in;
END;
//
DELIMITER ;

CALL koszt_zysk(2);

DELIMITER //
CREATE PROCEDURE biznes_amount(IN ilosc_ostatnich_lotow INT)
BEGIN
    SELECT COUNT(*)
    FROM Loty
    WHERE klasa = 1
    ORDER BY data_wylotu DESC
    LIMIT ilosc_ostatnich_lotow;
END;
//
DELIMITER ;

CALL biznes_amount(5);

DELIMITER //
CREATE PROCEDURE premia_pilot()

BEGIN
    DECLARE n INT DEFAULT 0;
    DECLARE i INT DEFAULT 0;
    SET n = (SELECT COUNT(*) FROM ObslugaSamolotu WHERE ilosc_przelatanych_minut > 60 * 1000);
    SET i = 0;
    WHILE i < n
        DO
            UPDATE ObslugaSamolotu
            SET extra_pensja = extra_pensja + (SELECT pensja_podstawowa
                                                         FROM ObslugaSamolotu
                                                                  INNER JOIN Stanowiska S on ObslugaSamolotu.stanowisko = S.id) *
                                                        0.01
            WHERE ObslugaSamolotu.id = (SELECT id FROM ObslugaSamolotu LIMIT i,1);
            SET i = i + 1;
        END WHILE;
END;
//
DELIMITER ;

CALL premia_pilot();

DELIMITER  //
CREATE FUNCTION przydzielanie_pilota()
    RETURNS INT
BEGIN
    RETURN (SELECT id FROM ObslugaSamolotu WHERE stanowisko = 1 ORDER BY ilosc_przelatanych_minut LIMIT 1);
END;
//
DELIMITER ;

SELECT przydzielanie_pilota() AS PilotID;

DELIMITER //
CREATE FUNCTION lot_zysk(numer_lotu_in INT)
    RETURNS FLOAT
BEGIN
    RETURN (SELECT SUM(cena_biletu) AS Zysk
            FROM Loty
            WHERE numer_lotu = numer_lotu_in);
END;
//
DELIMITER ;

SELECT lot_zysk(2) AS Zysk;
