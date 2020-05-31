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

/*Dla każdej tabeli należy utworzyć minimum 3 wyzwalacze (po jednym dla poleceń INSERT, UPDATE oraz DELETE).*/

DELIMITER //;

create trigger dodaj_marke
    after insert on marki_pojazdow
    for each row
    begin
        set NEW.data_dodania = now();
    end;
delimiter // ;

create trigger edytuj_marke
    after update on marki_pojazdow
    for each row
    begin
        set NEW.data_edycji = now();
    end; //
delimiter //;

create trigger usun_marke
    after delete on marki_pojazdow
    for each row
    begin
        set data_edycji = now();
    end;
delimiter //;


create trigger dodaj_model
    after insert on modele
    for each row
    begin
        set NEW.data_dodania = now();
    end;
    delimiter // ;

create trigger edytuj_model
    after update on modele
    for each row
    begin
        set NEW.data_edycji = now();
    end; //
delimiter //;

create trigger usun_model
    after delete on modele
    for each row
    begin
        set data_edycji = now();
    end;
delimiter //;

create trigger dodaj_pracownika
    after insert on Pracownicy
    for each row
    begin
        set NEW.data_dodania = now();
    end;
    delimiter // ;


create trigger edytuj_pracownika
    after update on Pracownicy
    for each row
    begin
        set data_edycji = now();
    end; //
delimiter //;

create trigger usun_pracownika
    after delete on Pracownicy
    for each row
    begin
        set data_edycji = now();
    end;
delimiter //;

create trigger dodaj_stanowisko
    after insert on Stanowisko
    for each row
    begin
        set data_dodania = now();
    end;
    delimiter // ;

create trigger edytuj_stanowisko
    after update on Stanowisko
    for each row
    begin
        set data_edycji = now();
    end;
delimiter //;

create trigger usun_stanowisko
    after delete on Stanowisko
    for each row
    begin
        set data_edycji = now();
    end;
delimiter //;


create trigger premia_pracownika
    after insert on premie
    for each row
    begin
        set kwota = 0.02*kwota;
end;
delimiter // ;

create trigger edytuj_premie
    after update on premie
    for each row
    begin
        set data_edycji = now();
    end; //
delimiter //;

create trigger usun_premie
    after delete on premie
    for each row
    begin
        set data_edycji = now();
    end;
delimiter //;


insert into marki_pojazdow (nazwa, kraj_pochodzenia) VALUES ('TOYOTA', 'Japonia');
insert into marki_pojazdow (nazwa, kraj_pochodzenia) VALUES ('NISSAN', 'Japonia');
insert into marki_pojazdow (nazwa, kraj_pochodzenia) VALUES ('AUDI', 'Niemcy');
insert into marki_pojazdow (nazwa, kraj_pochodzenia) VALUES ('VOLKSVAGEN', 'Niemcy');
insert into marki_pojazdow (nazwa, kraj_pochodzenia) VALUES ('BMW', 'Japonia');
insert into marki_pojazdow (nazwa, kraj_pochodzenia) VALUES ('FERRARI', 'Włochy');
insert into marki_pojazdow (nazwa, kraj_pochodzenia) VALUES ('FIAT', 'Włochy');
insert into marki_pojazdow (nazwa, kraj_pochodzenia) VALUES ('FORD', 'USA');
insert into marki_pojazdow (nazwa, kraj_pochodzenia) VALUES ('CHEVROLET', 'USA');

insert into modele (id_marki, nazwa, rok_produkcji, cena) VALUES (1, 'COROLLA', '2015', 68999);
insert into modele (id_marki, nazwa, rok_produkcji, cena) VALUES (2, 'LEAF', '2014', 54999);
insert into modele (id_marki, nazwa, rok_produkcji, cena) VALUES (3, 'A6', 2013, 88999);
insert into modele (id_marki, nazwa, rok_produkcji, cena) VALUES (4, 'JETTA', 2018, 123999);
insert into modele (id_marki, nazwa, rok_produkcji, cena) VALUES (5, 'X6', 2019, 299999);
insert into modele (id_marki, nazwa, rok_produkcji, cena) VALUES (6, 'SP2', 2018, 1490000);
insert into modele (id_marki, nazwa, rok_produkcji, cena) VALUES (7, 'MUSTANG', 2016, 125300);
insert into modele (id_marki, nazwa, rok_produkcji, cena) VALUES (8, 'CAMARO', 2013, 98999);

insert into Stanowisko (nazwa, zarobki)  values ('Sprzedawca', 4000);
insert into Stanowisko (nazwa, zarobki)  values ('Konsultant', 4500);
insert into Stanowisko (nazwa, zarobki)  values ('Sprzatajacy', 2600);
insert into Stanowisko (nazwa, zarobki)  values ('Technik', 5000);

insert into Pracownicy (id_stanowiska, imie, nazwisko, adres, nr_tel) VALUES (1, 'Magda', 'Wierak', 'Basztowa 4', '444555666');
insert into Pracownicy (id_stanowiska, imie, nazwisko, adres, nr_tel) VALUES (2, 'Juliusz', 'Ulman', 'Miodowa 45', '555444666');
insert into Pracownicy (id_stanowiska, imie, nazwisko, adres, nr_tel) VALUES (4, 'Daniel', 'Koszyk', 'Huculska 4/12', '787656048');
insert into Pracownicy (id_stanowiska, imie, nazwisko, adres, nr_tel) VALUES (3, 'Anna', 'Pajak', 'Rolna 12', '746692583');



insert into premie (id_pracownika, id_modelu, kwota) VALUES (1, 6, 1490000);
insert into premie (id_pracownika, id_modelu, kwota) VALUES (1, 8, 98999);
insert into premie (id_pracownika, id_modelu, kwota) VALUES (1, 1, 68999);


