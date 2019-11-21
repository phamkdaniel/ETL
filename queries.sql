-- count number of statements made by candidates
SELECT CONCAT(speaker_profile.first_name, ' ', speaker_profile.last_name) AS candidate_name,
COUNT(statements.id) AS statement_count
FROM statements
JOIN speaker ON statements.speaker_id = speaker.id
JOIN speaker_type ON speaker.type_id = speaker_type.id
JOIN speaker_profile ON speaker.id = speaker_profile.speaker_id
WHERE speaker_type.type = 'Candidate'
GROUP BY candidate_name
ORDER BY statement_count DESC;


-- count number of statements made by candidates filtering out short length
SELECT CONCAT(speaker_profile.first_name, ' ', speaker_profile.last_name) AS candidate_name,
COUNT(statements.id) AS statement_count
FROM statements
JOIN speaker ON statements.speaker_id = speaker.id
JOIN speaker_type ON speaker.type_id = speaker_type.id
JOIN speaker_profile ON speaker.id = speaker_profile.speaker_id
WHERE speaker_type.type = 'Candidate'
AND LENGTH(statements.statement) > 30
GROUP BY candidate_name
ORDER BY statement_count DESC;


-- count statements candidates made referencing undocumented immigrants
SELECT CONCAT(speaker_profile.first_name, ' ', speaker_profile.last_name) AS candidate_name,
COUNT(statements.id) AS statement_count
FROM statements
JOIN speaker ON statements.speaker_id = speaker.id
JOIN speaker_type ON speaker.type_id = speaker_type.id
JOIN speaker_profile ON speaker.id = speaker_profile.speaker_id
WHERE speaker_type.type = 'Candidate'
AND statements.statement LIKE '%undocumented%' 
GROUP BY candidate_name
ORDER BY statement_count DESC;


-- count statements candidates made referencing illegal immigrants
SELECT CONCAT(speaker_profile.first_name, ' ', speaker_profile.last_name) AS candidate_name,
COUNT(statements.id) AS statement_count
FROM statements
JOIN speaker ON statements.speaker_id = speaker.id
JOIN speaker_type ON speaker.type_id = speaker_type.id
JOIN speaker_profile ON speaker.id = speaker_profile.speaker_id
WHERE speaker_type.type = 'Candidate'
AND statements.statement LIKE '%illegal immi%' 
GROUP BY candidate_name
ORDER BY statement_count DESC;


-- average statement length for each candidate
SELECT CONCAT(speaker_profile.first_name, ' ', speaker_profile.last_name) AS candidate_name,
ROUND(AVG(LENGTH(statements.statement)),0) AS avg_statement_len
FROM statements
JOIN speaker ON statements.speaker_id = speaker.id
JOIN speaker_type ON speaker.type_id = speaker_type.id
JOIN speaker_profile ON speaker.id = speaker_profile.speaker_id
WHERE speaker_type.type = 'Candidate'
GROUP BY candidate_name
ORDER BY avg_statement_len DESC;


-- average statement length based on candidate gender
SELECT speaker_profile.gender AS candidate_gender,
ROUND(AVG(LENGTH(statements.statement)),0) AS avg_statement_len
FROM statements
JOIN speaker ON statements.speaker_id = speaker.id
JOIN speaker_type ON speaker.type_id = speaker_type.id
JOIN speaker_profile ON speaker.id = speaker_profile.speaker_id
WHERE speaker_type.type = 'Candidate'
GROUP BY candidate_gender
ORDER BY avg_statement_len DESC;


-- count of statements made by candidates based on gender
SELECT speaker_profile.gender AS candidate_gender,
COUNT(statements.id) AS statement_count
FROM statements
JOIN speaker ON statements.speaker_id = speaker.id
JOIN speaker_type ON speaker.type_id = speaker_type.id
JOIN speaker_profile ON speaker.id = speaker_profile.speaker_id
WHERE speaker_type.type = 'Candidate'
GROUP BY candidate_gender
ORDER BY statement_count DESC;


-- count of statements made by non-candidates 
SELECT speaker_type.type, COUNT(statements.id) AS statement_count
FROM statements
JOIN speaker ON statements.speaker_id = speaker.id
JOIN speaker_type ON speaker.type_id = speaker_type.id
WHERE speaker_type.type = 'Proctor' OR speaker_type.type = 'Other'
GROUP BY speaker_type.type
ORDER BY statement_count DESC;


-- list of candidates with birthdates
SELECT CONCAT(speaker_profile.first_name, ' ', speaker_profile.last_name) AS candidate_name,
speaker_profile.date_of_birth
FROM speaker_profile
JOIN speaker ON speaker_profile.speaker_id = speaker.id
JOIN speaker_type ON speaker.type_id = speaker_type.id
WHERE speaker_type.type = 'Candidate'
ORDER BY speaker_profile.date_of_birth DESC;

-- count of candidates born after 1965
SELECT COUNT(speaker_profile.speaker_id)
FROM speaker_profile
JOIN speaker ON speaker_profile.speaker_id = speaker.id
JOIN speaker_type ON speaker.type_id = speaker_type.id
WHERE speaker_type.type = 'Candidate'
AND speaker_profile.date_of_birth > '1965-01-01';

-- count of candidates born before 1965
SELECT COUNT(speaker_profile.speaker_id)
FROM speaker_profile
JOIN speaker ON speaker_profile.speaker_id = speaker.id
JOIN speaker_type ON speaker.type_id = speaker_type.id
WHERE speaker_type.type = 'Candidate'
AND speaker_profile.date_of_birth < '1965-01-01';


-- average statement length of candidates born before 1965, grouped by gender
SELECT speaker_profile.gender AS candidate_gender,
ROUND(AVG(LENGTH(statements.statement)),0) AS avg_statement_len
FROM statements
JOIN speaker ON statements.speaker_id = speaker.id
JOIN speaker_type ON speaker.type_id = speaker_type.id
JOIN speaker_profile ON speaker.id = speaker_profile.speaker_id
WHERE speaker_type.type = 'Candidate'
AND speaker_profile.date_of_birth < '1965-01-01' 
AND LENGTH(statements.statement) > 30
GROUP BY candidate_gender
ORDER BY avg_statement_len DESC;


-- average statement length of candidates after before 1965, grouped by gender
SELECT speaker_profile.gender AS candidate_gender,
ROUND(AVG(LENGTH(statements.statement)),0) AS avg_statement_len
FROM statements
JOIN speaker ON statements.speaker_id = speaker.id
JOIN speaker_type ON speaker.type_id = speaker_type.id
JOIN speaker_profile ON speaker.id = speaker_profile.speaker_id
WHERE speaker_type.type = 'Candidate'
AND speaker_profile.date_of_birth > '1965-01-01' 
AND LENGTH(statements.statement) > 30
GROUP BY candidate_gender
ORDER BY avg_statement_len DESC;


-- count of statements made by candidates surrouding wealth
SELECT CONCAT(speaker_profile.first_name, ' ', speaker_profile.last_name) AS candidate_name,
COUNT(statements.id) AS statement_count
FROM statements
JOIN speaker ON statements.speaker_id = speaker.id
JOIN speaker_type ON speaker.type_id = speaker_type.id
JOIN speaker_profile ON speaker.id = speaker_profile.speaker_id
WHERE speaker_type.type = 'Candidate'
AND statements.statement LIKE '%billionaire%'
OR statements.statement LIKE '%wall street%'
OR statements.statement LIKE '%wealth tax%'
OR statements.statement LIKE '%corporat%'
GROUP BY candidate_name
ORDER BY statement_count DESC;


-- count of statements made by candidates surrounding healthcare
SELECT CONCAT(speaker_profile.first_name, ' ', speaker_profile.last_name) AS candidate_name,
COUNT(statements.id) AS statement_count
FROM statements
JOIN speaker ON statements.speaker_id = speaker.id
JOIN speaker_type ON speaker.type_id = speaker_type.id
JOIN speaker_profile ON speaker.id = speaker_profile.speaker_id
WHERE speaker_type.type = 'Candidate'
AND statements.statement LIKE '%healthcare%'
OR statements.statement LIKE '%medic%'
OR statements.statement LIKE '%pharm%'
GROUP BY candidate_name
ORDER BY statement_count DESC;


-- count of statements made by candidates surround gun control
SELECT CONCAT(speaker_profile.first_name, ' ', speaker_profile.last_name) AS candidate_name,
COUNT(statements.id) AS statement_count
FROM statements
JOIN speaker ON statements.speaker_id = speaker.id
JOIN speaker_type ON speaker.type_id = speaker_type.id
JOIN speaker_profile ON speaker.id = speaker_profile.speaker_id
WHERE speaker_type.type = 'Candidate'
AND statements.statement LIKE '%gun%'
OR statements.statement LIKE '%shooting%'
OR statements.statement LIKE '%background check%'
GROUP BY candidate_name
ORDER BY statement_count DESC;


-- count of statements made by candidates referencing Donald Trump
SELECT CONCAT(speaker_profile.first_name, ' ', speaker_profile.last_name) AS candidate_name,
COUNT(statements.id) AS statement_count
FROM statements
JOIN speaker ON statements.speaker_id = speaker.id
JOIN speaker_type ON speaker.type_id = speaker_type.id
JOIN speaker_profile ON speaker.id = speaker_profile.speaker_id
WHERE speaker_type.type = 'Candidate'
AND statements.statement LIKE '%Trump%'
GROUP BY candidate_name
ORDER BY statement_count DESC;


-- statements made by news organizations referencing Donald Trump
SELECT speaker_profile.news_organization, COUNT(statements.id) AS statement_count
FROM statements
JOIN speaker ON statements.speaker_id = speaker.id
JOIN speaker_type ON speaker.type_id = speaker_type.id
JOIN speaker_profile.news_organization ON speaker.id = speaker_profile.speaker_id
WHERE speaker_type.type = 'Proctor'
AND statements.statement LIKE '%Trump%'
GROUP BY news_organization
ORDER BY statement_count DESC;


-- list of news organizations
SELECT DISTINCT news_organization
FROM speaker_profile
WHERE news_organization IS NOT NULL;


-- list of current positions of candidates
SELECT DISTINCT current_position
FROM speaker_profile
WHERE current_position IS NOT NULL;


-- list of candidates who made it through to 2 most recent debates
SELECT CONCAT(speaker_profile.first_name, ' ', speaker_profile.last_name) AS candidate_name
FROM statements
JOIN speaker ON statements.speaker_id = speaker.id
JOIN speaker_type ON speaker.type_id = speaker_type.id
JOIN speaker_profile ON speaker.id = speaker_profile.speaker_id
WHERE speaker_type.type = 'Candidate'
AND speaker.id IN (
    SELECT speaker_id FROM statements WHERE debate_id IN (5,6))
ORDER BY candidate_name;


-- list of candidate profile details
SELECT CONCAT(speaker_profile.first_name, ' ',speaker_profile.last_name) AS candidate_name,
gender, date_of_birth, race_ethnicity, current_position, origin
FROM speaker_profile
JOIN speaker ON speaker_profile.speaker_id = speaker.id
JOIN speaker_type ON speaker.type_id = speaker_type.id
WHERE speaker_type.type = 'Candidate'
ORDER BY date_of_birth;