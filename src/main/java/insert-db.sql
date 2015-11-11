INSERT INTO user(userId,username,password,enabled,role) VALUES(1,'candidate@yahoo.com','candidate', true ,'ROLE_CANDIDATE');
INSERT INTO user(userId,username,password,enabled,role) VALUES(2,'employer@yahoo.com','employer', true , 'ROLE_EMPLOYER');
INSERT INTO user(userId,username,password,enabled,role) VALUES(3,'admin@yahoo.com','admin', true , 'ROLE_ADMIN');

INSERT INTO candidate(firstName,lastName,userId) VALUES('Ralen','Mandap',1);
INSERT INTO candidate(firstName,lastName,userId) VALUES('Employer','Mandap',2);
INSERT INTO candidate(firstName,lastName,userId) VALUES('Admin','Mandap',3);

INSERT INTO country(countryId,countryName) VALUES(1,'philippines');
INSERT INTO country(countryId,countryName) VALUES(2,'usa');

INSERT INTO state(stateName,countryId) VALUES('manila',1);
INSERT INTO state(stateName,countryId) VALUES('pampanga',1);

INSERT INTO state(stateName,countryId) VALUES('alabama',2);
INSERT INTO state(stateName,countryId) VALUES('los angeles',2);

INSERT INTO employer(name) VALUES('ralen')