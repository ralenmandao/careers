
	
CREATE TABLE user(
	userId INT IDENTITY,
	username VARCHAR(45) ,
	password VARCHAR(12) ,
	enabled BOOLEAN,
	role VARCHAR(12)
);

CREATE TABLE candidate(
	candidateId INT IDENTITY,
	firstName VARCHAR(45) ,
	lastName VARCHAR(45) ,
	userId INT,
	FOREIGN KEY (userId) REFERENCES user ON DELETE CASCADE
);

CREATE TABLE country(
	countryId INT IDENTITY,
	countryName VARCHAR(20)
);

CREATE TABLE state(
	stateId INT IDENTITY,
	stateName VARCHAR(20),
	countryId INT,
	FOREIGN KEY (countryId) REFERENCES country ON DELETE CASCADE
);