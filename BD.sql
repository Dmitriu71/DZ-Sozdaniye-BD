CREATE TABLE IF NOT EXISTS Genre(
	id SERIAL PRIMARY KEY,
	Genre_name VARCHAR(50) NOT NULL UNIQUE);
	
CREATE TABLE IF NOT EXISTS Executor(
	id SERIAL PRIMARY KEY,
	Executor_name VARCHAR(50) NOT NULL UNIQUE);
	
CREATE TABLE IF NOT EXISTS Genre_executor(
	Genre_id INTEGER REFERENCES Genre(id),
	Executor_id INTEGER REFERENCES Executor(id),
	CONSTRAINT Genre_executor_fk PRIMARY KEY (Genre_id, Executor_id));
	
CREATE TABLE IF NOT EXISTS Album(
	id SERIAL PRIMARY KEY,
	Album_name VARCHAR(50) NOT NULL,
	Album_data INTEGER NOT NULL);
	
CREATE TABLE IF NOT EXISTS Album_executor(
	Executor_id INTEGER REFERENCES Executor(id),
	Album_id INTEGER REFERENCES Album(id),
	CONSTRAINT Album_executor_fk PRIMARY KEY (Executor_id, Album_id));
	
CREATE TABLE IF NOT EXISTS Track(
	id SERIAL PRIMARY KEY,
	Track_name VARCHAR(50) NOT NULL,
	Track_duration INTEGER NOT NULL,
	Album_id INTEGER NOT NULL REFERENCES Album(id));
	
CREATE TABLE IF NOT EXISTS Collection(
	id SERIAL PRIMARY KEY,
	Collection_name VARCHAR(50) NOT NULL,
	Collection_data INTEGER NOT NULL);
	
CREATE TABLE IF NOT EXISTS Track_Collection(
	Track_id INTEGER REFERENCES Track(id),
	Collection_id INTEGER REFERENCES Collection(id),
	CONSTRAINT Track_Collection_fk PRIMARY KEY (Track_id, Collection_id));