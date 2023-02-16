-- Part 1 SQL UPDATES 
USE assign2db;
SELECT * FROM hospital; 
UPDATE hospital SET headdoc = "GD56", headdocstartdate = "2010-12-19" WHERE hoscode = "BBC";
UPDATE hospital SET headdoc = "SE66", headdocstartdate = "2004-05-30" WHERE hoscode = "ABC";
UPDATE hospital SET headdoc = "YT67", headdocstartdate = "2001-06-01" WHERE hoscode = "DDE";
SELECT * FROM hospital;

-- PART 2 SQL INSERTS
INSERT INTO doctor VALUES ('LP12','John', 'Wick','1982-09-09', '1930-06-11','ABC','Urologist');
INSERT INTO patient VALUES ('111111111','Johny','Sins','1990-05-12');
INSERT INTO looksafter VALUES ('LP12','111111111');
INSERT INTO hospital VALUES ('BCD','University', 'Toronto', 'ON', 2000, 'LP12', '2022-10-24');
SELECT * FROM doctor;
SELECT * FROM patient;
SELECT * FROM looksafter;
SELECT * FROM hospital;

-- Part 3 SQL QUERIES
-- Query 1
SELECT lastname FROM patient;
-- Query 2
SELECT DISTINCT lastname FROM patient;
-- Query 3
SELECT * FROM doctor ORDER BY lastname;
-- Query 4
SELECT hoscode, hosname FROM hospital WHERE numofbed>1500;
-- Query 5
SELECT firstname, lastname FROM doctor WHERE hosworksat='BBC';
-- Query 6
SELECT firstname, lastname FROM patient WHERE lastname LIKE 'G%';
-- Query 7
SELECT p.firstname, p.lastname FROM patient p, looksafter l, doctor d WHERE l.licensenum=d.licensenum AND p.ohipnum=l.ohipnum AND d.lastname='Webster';
-- Query 8
SELECT h.hosname, h.city, d.lastname FROM hospital h, doctor d WHERE h.headdoc=d.licensenum;
-- Query 9
SELECT SUM(numofbed) FROM hospital;
-- Query 10
SELECT p.firstname, p.lastname, d.firstname, d.lastname FROM patient p, looksafter l, doctor d, hospital h WHERE l.licensenum=d.licensenum AND p.ohipnum=l.ohipnum AND h.headdoc=d.licensenum AND l.licensenum=h.headdoc;
-- Query 11
Select d.firstname, d.lastname, h.prov FROM doctor d, hospital h WHERE d.speciality='Surgeon' AND h.hoscode=d.hosworksat AND h.hosname='Victoria'; 
-- Query 12
SELECT d.firstname FROM doctor d, looksafter l WHERE d.licensenum not in(SELECT l.licensenum FROM looksafter l, doctor d WHERE l.licensenum=d.licensenum);
-- Query 13
SELECT d.lastname, d.firstname, l.licensenum, count(*), h.hosname,
-- Query 14
-- Query 15-my Query- Display patients first name and the first name of the doctor treating him, also the speciality of the doctor. 
SELECT p.firstname, d.firstname, d.speciality FROM patient p, looksafter l, doctor d, hospital h WHERE l.licensenum=d.licensenum AND p.ohipnum=l.ohipnum AND h.headdoc=d.licensenum AND l.licensenum=h.headdoc;

-- Part 4 SQL VIEWS/DELETES
CREATE VIEW view AS SELECT d.firstname as dfirst, d.lastname as dlast, d.birthdate as dbirth, p.firstname as pfirst, p.lastname as plast, p.birthdate as pbirth FROM doctor d, patient p, looksafter l WHERE l.licensenum=d.licensenum AND p.ohipnum=l.ohipnum;  
SELECT * FROM view;
SELECT dlast, dbirth, plast, pbirth FROM view where dbirth<pbirth;
SELECT * FROM patient;
SELECT * FROM looksafter;
DELETE FROM patient WHERE firstname='Johny' AND lastname='Sins';
SELECT * FROM patient;
SELECT * FROM looksafter;
SELECT * FROM doctor;
DELETE FROM doctor where firstname='Bernie';
SELECT * FROM doctor;
DELETE FROM doctor where firstname='John' AND lastname='Wick';
-- The reason I was unable to delete the doctor that I added was because we added a constraint in the document where hosworksat at references hoscode. It does not allow to delete it at one place cause its being referenced elsewhere in the data.



