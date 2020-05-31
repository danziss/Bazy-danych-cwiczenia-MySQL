CREATE TABLE marki_pojazdow(
    id int auto_increment not null,
    nazwa varchar(40) not null,
    kraj_pochodzenia varchar(40),
    data_dodania DATETIME,
    data_edycji DATETIME,
    PRIMARY KEY (id)
);

CREATE TABLE modele(
    id int auto_increment not null,
    id_marki int not null,
    nazwa varchar(40) not null,
    rok_produkcji YEAR not null,
    uszkodzony varchar(3) not null,
    cena int not null,
    data_dodania DATETIME,
        data_edycji DATETIME,
    PRIMARY KEY (id),
    FOREIGN KEY (id_marki) REFERENCES marki_pojazdow(id)
);

CREATE TABLE Stanowisko(
    id int auto_increment not null,
    nazwa varchar(40) not null,
    zarobki int not null,
    data_dodania DATETIME,
        data_edycji DATETIME,
    PRIMARY KEY (id)
);

CREATE TABLE Pracownicy(
    id int auto_increment not null,
    id_stanowiska int not null,
    imie varchar(40) not null,
    nazwisko varchar(40) not null,
    adres varchar(70) not null,
    nr_tel varchar(9) not null,
    data_dodania DATETIME,
        data_edycji DATETIME,
    primary key (id),
    foreign key (id_stanowiska) references Stanowisko(id)
);
create table klienci(
    id int auto_increment not null primary key ,
    imie varchar(40) not null,
    nazwisko varchar(40) not null,
    nazwa_firmy varchar(40),
    nip int,
    adres varchar(40),
    nr_tel varchar(9)
);

create table zamowienia(
    id int not null primary key ,
    id_klienta int not null,
    id_modelu int not null,
    id_pracownika int not null,
    foreign key (id_klienta) references klienci (id),
    foreign key (id_modelu) references modele(id),
    foreign key (id_pracownika) references Pracownicy (id)

);

create table faktury(
    id int auto_increment not null,
    id_klienta int not null,
    id_zamowienia int not null,
    primary key (id),
    foreign key (id_klienta) references klienci(id),
    foreign key (id_zamowienia) references zamowienia(id)
);

create table premie(
    id int auto_increment not null ,
    id_pracownika int not null,
    id_modelu int not null,
    kwota double not null ,
    data_dodania DATETIME,
        data_edycji DATETIME,
    PRIMARY KEY (id),
    foreign key (id_pracownika) references Pracownicy(id),
    foreign key (id_modelu) references modele(id)
);


insert into marki_pojazdow (nazwa, kraj_pochodzenia) VALUES ('TOYOTA', 'Japonia');
insert into marki_pojazdow (nazwa, kraj_pochodzenia) VALUES ('NISSAN', 'Japonia');
insert into marki_pojazdow (nazwa, kraj_pochodzenia) VALUES ('AUDI', 'Niemcy');
insert into marki_pojazdow (nazwa, kraj_pochodzenia) VALUES ('VOLKSVAGEN', 'Niemcy');
insert into marki_pojazdow (nazwa, kraj_pochodzenia) VALUES ('BMW', 'Japonia');
insert into marki_pojazdow (nazwa, kraj_pochodzenia) VALUES ('FERRARI', 'Włochy');
insert into marki_pojazdow (nazwa, kraj_pochodzenia) VALUES ('FIAT', 'Włochy');
insert into marki_pojazdow (nazwa, kraj_pochodzenia) VALUES ('FORD', 'USA');
insert into marki_pojazdow (nazwa, kraj_pochodzenia) VALUES ('CHEVROLET', 'USA');

insert into modele (id_marki, nazwa, rok_produkcji, uszkodzony, cena) VALUES (1, 'COROLLA', '2015', 'nie', 68999);
insert into modele (id_marki, nazwa, rok_produkcji, uszkodzony, cena) VALUES (2, 'LEAF', '2014', 'tak', 29999);
insert into modele (id_marki, nazwa, rok_produkcji, uszkodzony,  cena) VALUES (3, 'A6', 2013, 'nie', 88999);
insert into modele (id_marki, nazwa, rok_produkcji, uszkodzony, cena) VALUES (4, 'JETTA', 2018, 'nie', 123999);
insert into modele (id_marki, nazwa, rok_produkcji, uszkodzony, cena) VALUES (5, 'X6', 2019, 'tak',179999);
insert into modele (id_marki, nazwa, rok_produkcji, uszkodzony, cena) VALUES (6, 'SP2', 2018, 'tak', 890000);
insert into modele (id_marki, nazwa, rok_produkcji, uszkodzony, cena) VALUES (7, 'MUSTANG', 2016, 'nie', 125300);
insert into modele (id_marki, nazwa, rok_produkcji, uszkodzony, cena) VALUES (8, 'CAMARO', 2013, 'nie', 98999);

insert into Stanowisko (nazwa, zarobki)  values ('Sprzedawca', 4000);
insert into Stanowisko (nazwa, zarobki)  values ('Konsultant', 4500);
insert into Stanowisko (nazwa, zarobki)  values ('Sprzatajacy', 2600);
insert into Stanowisko (nazwa, zarobki)  values ('Technik', 5000);

insert into Pracownicy (id_stanowiska, imie, nazwisko, adres, nr_tel) VALUES (1, 'Magda', 'Wierak', 'Basztowa 4', '444555666');
insert into Pracownicy (id_stanowiska, imie, nazwisko, adres, nr_tel) VALUES (2, 'Juliusz', 'Ulman', 'Miodowa 45', '555444666');
insert into Pracownicy (id_stanowiska, imie, nazwisko, adres, nr_tel) VALUES (4, 'Daniel', 'Koszyk', 'Huculska 4/12', '787656048');
insert into Pracownicy (id_stanowiska, imie, nazwisko, adres, nr_tel) VALUES (3, 'Anna', 'Pajak', 'Rolna 12', '746692583');

insert into klienci (imie, nazwisko, adres, nr_tel) VALUES ('Tomasz', 'Koper', 'Wislana 14/23', '845920453');
insert into klienci (imie, nazwisko, nazwa_firmy, nip, adres, nr_tel) VALUES ('Andrzej', 'Walczak', 'TROPOX S.A.', 124, 'Turowicza 3', '993545783');
insert into klienci (imie, nazwisko, adres, nr_tel) values ('Joanna', 'Badura', 'Ulmana 53/2', '747838475');

insert into zamowienia (id_klienta, id_modelu, id_pracownika) VALUES (1, 6, 1);
insert into zamowienia (id_klienta, id_modelu, id_pracownika) VALUES (2, 8, 1);
insert into zamowienia (id_klienta, id_modelu, id_pracownika) VALUES (3, 1, 1);

insert into faktury (id_klienta, id_zamowienia) VALUES (2, 2);

insert into premie (id_pracownika, id_modelu, kwota) VALUES (1, 6, 890000);
insert into premie (id_pracownika, id_modelu, kwota) VALUES (1, 8, 98999);
insert into premie (id_pracownika, id_modelu, kwota) VALUES (1, 1, 68999);


