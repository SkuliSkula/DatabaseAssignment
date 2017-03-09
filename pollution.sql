#drop table if exists Map;

#drop table if exists DataPollution;

#drop table if exists Staff;

#drop table if exists Sensor;

#drop table if exists Users;

#Drop table if exists Address;








CREATE TABLE Address
	(AddressId 		INT, 
	 Address 	VARCHAR(30),
     Kommune	VARCHAR(30),
     PostalCode	INT,
	 PRIMARY KEY (AddressId)
	); 
    
    
CREATE TABLE Users
	(AddressId 		INT, 
     UserId			INT,
	 FirstName 	VARCHAR(30),
     LastName	VARCHAR(30),
     email 		varchar(30),
	 PRIMARY KEY (UserId,AddressId),
     FOREIGN KEY (AddressId) REFERENCES Address(AddressId)
	); 
    

CREATE TABLE Staff
	(AddressId 		INT, 
     StaffId			INT,
	 FirstName 	VARCHAR(30),
     LastName	VARCHAR(30),
     email 		varchar(30),
     role		VARCHAR(30),
	 PRIMARY KEY (AddressId),
     FOREIGN KEY (AddressId) REFERENCES Address(AddressId)
	); 
    

CREATE TABLE Sensor
	(AddressId 		INT, 
     SensorId		INT,
	 DateSetUp 		DATE,
     SensorType	VARCHAR(30),
	 PRIMARY KEY (SensorId,AddressId),
     FOREIGN KEY (AddressId) REFERENCES Address(AddressId)
	); 
    
CREATE TABLE DataPollution
	(SensorId		INT,
	 LivePollution 	VARCHAR(30),
     ForeCast		VARCHAR(30),
	 PRIMARY KEY (SensorId),
     FOREIGN KEY (SensorId) REFERENCES Sensor(SensorId)
	); 
    
    
CREATE TABLE Map
	(AddressId 			INT, 
     SensorId			INT,
	 UserId 			INT,
     PollutionRadius	INT,
	 PRIMARY KEY (AddressId,SensorId,UserId),
     FOREIGN KEY (AddressId) REFERENCES Address(AddressId),
     foreign key (SensorId) references Sensor(SensorId),
     foreign key (UserId) references Users(UserId)
	); 



    