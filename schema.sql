-- create table of debate nights
CREATE TABLE debates (
    id INT PRIMARY KEY,
    city VARCHAR,
    state VARCHAR,
    date VARCHAR
);

-- create table of speaker ids
CREATE TABLE speaker (
    id INT PRIMARY KEY,
    type_id INT NOT NULL
);

-- create table for statements made during debates
CREATE TABLE statements (
    id INT PRIMARY KEY,
    speaker_id INT NOT NULL,
    FOREIGN KEY (speaker_id) REFERENCES speaker(id),
    statement VARCHAR,
    time_stamp VARCHAR,
    debate_id VARCHAR,
    FOREIGN KEY (debate_id) REFERENCES debates(id)
);

-- create table of speaker profiles
CREATE TABLE speaker_profile (
    speaker_id INT NOT NULL,
    FOREIGN KEY (speaker_id) REFERENCES speaker(id),
    type_id INT NOT NULL,
    FOREIGN KEY (type_id) REFERENCES speaker(type_id),
    type VARCHAR,
    first_name VARCHAR,
    last_name VARCHAR,
    gender VARCHAR,
    date_of_birth VARCHAR,
    current_position VARCHAR,
    race_ethnicity VARCHAR,
    origin VARCHAR,
    news_organization VARCHAR,
    PRIMARY KEY (speaker_id, type_id)
);


-- insert data for debate nights
INSERT INTO debates (id, city, state, date)
VALUES 
(1, 'Miami', 'Florida', '2019-06-26'),
(2, 'Miami', 'Florida', '2019-06-27'),
(3, 'Detroit', 'Michigan', '2019-07-30'),
(4, 'Detroit', 'Michigan', '2019-07-31'),
(5, 'Houston', 'Texas', '2019-09-12'),
(6, 'Westerville', 'Ohio', '2019-10-15');

-- insert data for speaker ids
INSERT INTO speaker (id, type_id, type)
VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(41, 2),
(42, 2),
(43, 3);