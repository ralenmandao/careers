
CREATE TABLE country(
	countryId INT IDENTITY,
	countryName VARCHAR(20)
);

CREATE TABLE state(
	stateId INT IDENTITY,
	stateName VARCHAR(20),
	countryId INT,
	FOREIGN KEY (countryId) REFERENCES country ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE location(
	locationId INT IDENTITY,
	countryId INT,
	stateId INT,
	FOREIGN KEY (countryId) REFERENCES country ON DELETE SET NULL ON UPDATE CASCADE,
	FOREIGN KEY (stateId) REFERENCES state ON DELETE SET NULL ON UPDATE CASCADE
);
	

CREATE TABLE user(
	userId INT IDENTITY,
	username VARCHAR(45) ,
	password VARCHAR(12) ,
	enabled BOOLEAN,
	role VARCHAR(20)
);

CREATE TABLE candidate(
	candidateId INT IDENTITY,
	firstName VARCHAR(45) ,
	lastName VARCHAR(45) ,
	userId INT,
	birthdate DATE,
	locationId INT,
	FOREIGN KEY (userId) REFERENCES user ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (locationId) REFERENCES location ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE employer(
	employerId INT IDENTITY,
	name VARCHAR(45)
)

CREATE TABLE employee(
	employeeId INT IDENTITY,
	name VARCHAR(45),
	employerId INT,
	FOREIGN KEY (employerId) REFERENCES employer ON UPDATE CASCADE ON DELETE SET NULL
)