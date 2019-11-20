# ETL

![ERD](Images/ERD.png)

Normalization of transcript csv files to be loaded into a SQL database.

## How the Project Works

Given `debate_url` to a transcript of the democratic debate, the function `scrape_prep(debate_url)` in  scrape_tools.py scrapes the url to generate the `name_map.json` file containing a list of speakers and scrapes the [2020 Democratic Debates wikipedia](https://en.wikipedia.org/wiki/2020_Democratic_Party_presidential_debates_and_forums) to generate lists of candiates and proctors.

`name_map.json` contains names as shown on rev.com where the user manually enter names for remapping.

Running the code in `profiles.ipynb` takes `candidates.txt` and `proctors.txt` and generates [candidate_profiles.json](https://github.com/phamkdaniel/ETL/blob/master/Resources/candidate_profiles.json) and  [proctor_profiles.json](https://github.com/phamkdaniel/ETL/blob/master/Resources/proctor_profiles.json) to store the respective profiles, which the user manually inputs.

Then the user runs `process_debate(debate_url, debate, night)` to create the csv files for each transcript.

The code in `transform_load.ipynb` takes the datasets and loads them into a database based on relations defined in `schema.sql`.

## File Breakdown

* profiles.ipynb - reads candidates.txt and proctors.txt to generate empty dictionaries to store profile information
* Resources - folder containing csv files of transcripts from the democratic debates, txt files containing candidates and proctors, and json files containing the profiles for candidates and proctors
* schema.sql - schema for creating tables in SQL datbase
* scrape_tools.py - functions to scrape rev.com
* rev_scrape.py - file to execute scrape
* transform_load.ipynb - takes transcript csv and profile json files and loads them into a PostgreSQL database based on tables in schema.sql

## Dependencies

* [psycopg2](https://pypi.org/project/psycopg2/)
* [sqlalchemy](https://www.sqlalchemy.org/)
