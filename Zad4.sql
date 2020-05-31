use zwierzetaSklep;

ALTER TABLE zabawki
ADD waga int;

SELECT * FROM karmy WHERE id = 5;
SELECT * FROM karmy WHERE dlaKogo = 'pies';
SELECT * FROM karmy WHERE dlaKogo = 'kot';
SELECT * FROM karmy WHERE producent = 'WHISKAS';
SELECT * FROM zabawki WHERE producent = 'ACANA';
SELECT * FROM zabawki WHERE nazwa like 'Kong%';
SELECT * FROM zabawki;
SELECT * FROM karmy;
SELECT * FROM klienci;