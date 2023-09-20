USE ams539;

DROP TABLE IF EXISTS members;

CREATE TABLE members(
member_id INT NOT NULL PRIMARY KEY,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(20) NOT NULL,
fk_instrument_id INT NOT NULL,
fk_leader_id INT NOT NULL,
FOREIGN KEY fk_instrument_id(fk_instrument_id)
REFERENCES instruments(instrument_id),
FOREIGN KEY fk_leader_id(fk_leader_id)
REFERENCES leaders(leader_id)
) ENGINE=InnoDB;

CREATE INDEX memberName ON members(last_name);

DROP TABLE IF EXISTS instruments;

CREATE TABLE instruments(
instrument_id INT NOT NULL PRIMARY KEY,
instrument_name VARCHAR(20) NOT NULL,
instrument_condition VARCHAR(20) NOT NULL,
fk_section_id INT NOT NULL,
FOREIGN KEY fk_section_id(fk_section_id)
REFERENCES sections(section_id)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS sections;

CREATE TABLE sections(
section_id INT NOT NULL PRIMARY KEY,
section_name VARCHAR(20) NOT NULL
) ENGINE=InnoDB;

DROP TABLE IF EXISTS tech_staff;

CREATE TABLE tech_staff(
tech_id INT NOT NULL PRIMARY KEY,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(20) NOT NULL
) ENGINE=InnoDB;

DROP TABLE IF EXISTS staff_techs_sections;

CREATE TABLE staff_techs_sections(
fk_tech_id INT NOT NULL,
fk_section_id INT NOT NULL,
FOREIGN KEY fk_tech_id(fk_tech_id)
REFERENCES tech_staff(tech_id),
FOREIGN KEY fk_section_id(fk_section_id)
REFERENCES sections(section_id)
) ENGINE=InnoDB;


DROP TABLE IF EXISTS trips;

CREATE TABLE trips(
trip_id INT NOT NULL PRIMARY KEY,
location VARCHAR(20) NOT NULL,
trip_year YEAR NOT NULL
) ENGINE=InnoDB;

DROP TABLE IF EXISTS leaders;

CREATE TABLE leaders(
leader_id INT NOT NULL PRIMARY KEY,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(20) NOT NULL,
leader_year YEAR NOT NULL
) ENGINE=InnoDB;

CREATE INDEX leaderName ON leaders(last_name);

DROP TABLE IF EXISTS support_staff;

CREATE TABLE support_staff(
support_id INT NOT NULL PRIMARY KEY,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(20) NOT NULL
) ENGINE=InnoDB;

CREATE INDEX supportName ON support_staff(last_name);

DROP TABLE IF EXISTS directors;

CREATE TABLE directors(
director_id INT NOT NULL PRIMARY KEY,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(20) NOT NULL
) ENGINE=InnoDB;

DROP TABLE IF EXISTS scholarships;

CREATE TABLE scholarships(
scholarship_id INT NOT NULL PRIMARY KEY,
amount INT NOT NULL
) ENGINE=InnoDB;

DROP TABLE IF EXISTS administrators;

CREATE TABLE administrators(
administrator_id INT NOT NULL PRIMARY KEY,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(20) NOT NULL
) ENGINE=InnoDB;

CREATE VIEW membersWithInstruments AS
SELECT last_name, first_name, instrument_name
FROM members AS m
JOIN instruments AS i ON i.instrument_id = m.fk_instrument_id
GROUP BY instrument_name
ORDER BY last_name;

CREATE VIEW techsOfSections AS
SELECT last_name, first_name, section_name
FROM tech_staff AS t
JOIN staff_techs_sections AS ts ON t.tech_id = ts.fk_tech_id
JOIN sections AS s ON ts.fk_section_id = s.section_id
GROUP BY section_name
ORDER BY last_name;

INSERT INTO leaders (leader_id, first_name, last_name, leader_year)
VALUES (1, 'Connor', 'Stewart', 2018);

INSERT INTO leaders (leader_id, first_name, last_name, leader_year)
VALUES (2, 'Michael', 'Buckstein', 2018);

INSERT INTO leaders (leader_id, first_name, last_name, leader_year)
VALUES (3, 'Tina', 'Rogers', 2018);

INSERT INTO leaders (leader_id, first_name, last_name, leader_year)
VALUES (4, 'Joe', 'Kitching', 2018);

INSERT INTO leaders (leader_id, first_name, last_name, leader_year)
VALUES (5, 'Michelle', 'Pfahles', 2018);

INSERT INTO sections (section_id, section_name)
VALUES (1, 'Drumline');

INSERT INTO sections (section_id, section_name)
VALUES (2, 'Trumpets');

INSERT INTO sections (section_id, section_name)
VALUES (3, 'Sousaphones');

INSERT INTO sections (section_id, section_name)
VALUES (4, 'Saxophones');

INSERT INTO sections (section_id, section_name)
VALUES (5, 'Melophones');

INSERT INTO instruments (instrument_id, instrument_name, instrument_condition, fk_section_id)
VALUES (1, 'Snare Drum1', 'Average', 1);

INSERT INTO instruments (instrument_id, instrument_name, instrument_condition, fk_section_id)
VALUES (2, 'Trumpet1', 'Good', 2);

INSERT INTO instruments (instrument_id, instrument_name, instrument_condition, fk_section_id)
VALUES (3, 'Sousaphone1', 'Poor', 3);

INSERT INTO instruments (instrument_id, instrument_name, instrument_condition, fk_section_id)
VALUES (4, 'Saxophone1', 'Average', 4);

INSERT INTO instruments (instrument_id, instrument_name, instrument_condition, fk_section_id)
VALUES (5, 'Melophone1', 'Good', 5);

INSERT INTO members (member_id, first_name, last_name, fk_instrument_id, fk_leader_id)
VALUES (1, 'Addison', 'Shroyer', 1, 1);

INSERT INTO members (member_id, first_name, last_name, fk_instrument_id, fk_leader_id)
VALUES (2, 'Luke', 'Barone', 2, 2);

INSERT INTO members (member_id, first_name, last_name, fk_instrument_id, fk_leader_id)
VALUES (3, 'Paige', 'Oswald', 3, 3);

INSERT INTO members (member_id, first_name, last_name, fk_instrument_id, fk_leader_id)
VALUES (4, 'Rachel', 'Hines', 4, 4);

INSERT INTO members (member_id, first_name, last_name, fk_instrument_id, fk_leader_id)
VALUES (5, 'Noah', 'Crawford', 5, 5);

INSERT INTO tech_staff (tech_id, first_name, last_name)
VALUES (1, 'Cory', 'Chamberlain');

INSERT INTO tech_staff (tech_id, first_name, last_name)
VALUES (2, 'Mel', 'Orange');

INSERT INTO tech_staff (tech_id, first_name, last_name)
VALUES (3, 'Alex', 'Faulds');

INSERT INTO tech_staff (tech_id, first_name, last_name)
VALUES (4, 'Maxwell', 'Goodman');

INSERT INTO tech_staff (tech_id, first_name, last_name)
VALUES (5, 'Gary', 'Cox');

INSERT INTO staff_techs_sections (fk_tech_id, fk_section_id)
VALUES (1, 1);

INSERT INTO staff_techs_sections (fk_tech_id, fk_section_id)
VALUES (2, 2);

INSERT INTO staff_techs_sections (fk_tech_id, fk_section_id)
VALUES (3, 3);

INSERT INTO staff_techs_sections (fk_tech_id, fk_section_id)
VALUES (4, 4);

INSERT INTO staff_techs_sections (fk_tech_id, fk_section_id)
VALUES (5, 5);

INSERT INTO trips (trip_id, location, trip_year)
VALUES (1, 'Duke', 2018);

INSERT INTO trips (trip_id, location, trip_year)
VALUES (2, 'Notre Dame', 2018);

INSERT INTO trips (trip_id, location, trip_year)
VALUES (3, 'ACC Championship', 2018);

INSERT INTO trips (trip_id, location, trip_year)
VALUES (4, 'NCAA Mens Tournament', 2019);

INSERT INTO trips (trip_id, location, trip_year)
VALUES (5, 'NCAA Womens Tournament', 2019);

INSERT INTO support_staff (support_id, first_name, last_name)
VALUES (1, 'Jean', 'Wilts');

INSERT INTO support_staff (support_id, first_name, last_name)
VALUES (2, 'Calvin', 'Harris');

INSERT INTO support_staff (support_id, first_name, last_name)
VALUES (3, 'Jefferey', 'Goods');

INSERT INTO support_staff (support_id, first_name, last_name)
VALUES (4, 'Wilbur', 'Manns');

INSERT INTO support_staff (support_id, first_name, last_name)
VALUES (5, 'Jullian', 'Wooter');

INSERT INTO directors (director_id, first_name, last_name)
VALUES (1, 'Bradley', 'Townsend');

INSERT INTO directors (director_id, first_name, last_name)
VALUES (2, 'Mathew', 'Alosi');

INSERT INTO directors (director_id, first_name, last_name)
VALUES (3, 'Mel', 'Orange');

INSERT INTO directors (director_id, first_name, last_name)
VALUES (4, 'Paul', 'Rush');

INSERT INTO directors (director_id, first_name, last_name)
VALUES (5, 'Jessica', 'Kennedy');

INSERT INTO administrators (administrator_id, first_name, last_name)
VALUES (1, 'Heather', 'Lyke');

INSERT INTO administrators (administrator_id, first_name, last_name)
VALUES (2, 'Wendy', 'Myers');

INSERT INTO administrators (administrator_id, first_name, last_name)
VALUES (3, 'Raul', 'Mendes');

INSERT INTO administrators (administrator_id, first_name, last_name)
VALUES (4, 'Roger', 'Temple');

INSERT INTO administrators (administrator_id, first_name, last_name)
VALUES (5, 'Catherine', 'Manns');

INSERT INTO scholarships (scholarship_id, amount)
VALUES (1, 50);

INSERT INTO scholarships (scholarship_id, amount)
VALUES (2, 100);

INSERT INTO scholarships (scholarship_id, amount)
VALUES (3, 150);

INSERT INTO scholarships (scholarship_id, amount)
VALUES (4, 200);

INSERT INTO scholarships (scholarship_id, amount)
VALUES (5, 250);















