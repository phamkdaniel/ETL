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
    type_id INT NOT NULL,
    type VARCHAR
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

-- create table of candidate profiles
CREATE TABLE candidate_profile (
    speaker_id INT NOT NULL,
    FOREIGN KEY (speaker_id) REFERENCES speaker(id),
    type_id INT NOT NULL,
    FOREIGN KEY (type_id) REFERENCES speaker(type_id),
    first_name VARCHAR,
    last_name VARCHAR,
    gender VARCHAR,
    date_of_birth VARCHAR,
    current_position VARCHAR,
    race_ethnicity VARCHAR,
    origin VARCHAR,
    PRIMARY KEY (speaker_id, type_id)
);

-- create table of proctor profiles
CREATE TABLE proctor_profile (
    speaker_id INT NOT NULL,
    FOREIGN KEY (speaker_id) REFERENCES speaker(id),
    type_id INT NOT NULL,
    FOREIGN KEY (type_id) REFERENCES speaker(type_id),
    first_name VARCHAR,
    last_name VARCHAR,
    gender VARCHAR,
    news_organization VARCHAR
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
(1, 1, 'Candidate'),
(2, 1, 'Candidate'),
(3, 1, 'Candidate'),
(4, 1, 'Candidate'),
(5, 1, 'Candidate'),
(6, 1, 'Candidate'),
(7, 1, 'Candidate'),
(8, 1, 'Candidate'),
(9, 1, 'Candidate'),
(10, 1, 'Candidate'),
(11, 1, 'Candidate'),
(12, 1, 'Candidate'),
(13, 1, 'Candidate'),
(14, 1, 'Candidate'),
(15, 1, 'Candidate'),
(16, 1, 'Candidate'),
(17, 1, 'Candidate'),
(18, 1, 'Candidate'),
(19, 1, 'Candidate'),
(20, 1, 'Candidate'),
(21, 1, 'Candidate'),
(22, 1, 'Candidate'),
(23, 1, 'Candidate'),
(24, 1, 'Candidate'),
(25, 1, 'Candidate'),
(26, 2, 'Proctor'),
(27, 2, 'Proctor'),
(28, 2, 'Proctor'),
(29, 2, 'Proctor'),
(30, 2, 'Proctor'),
(31, 2, 'Proctor'),
(32, 2, 'Proctor'),
(33, 2, 'Proctor'),
(34, 2, 'Proctor'),
(35, 2, 'Proctor'),
(36, 2, 'Proctor'),
(37, 2, 'Proctor'),
(38, 2, 'Proctor'),
(39, 2, 'Proctor'),
(40, 2, 'Proctor'),
(41, 2, 'Proctor'),
(42, 2, 'Proctor'),
(43, 3, 'Other');