CREATE DATABASE IF NOT EXISTS Pollution;
USE Pollution;

CREATE TABLE Location
	(LocationId INT AUTO_INCREMENT, 
     PollutionRadius	INT,
     Address VARCHAR(30),
     Kommune VARCHAR(30),
     zipcode INT,
     latitude FLOAT,
     longitude FLOAT,
	 PRIMARY KEY (LocationId)
	);

CREATE TABLE Users
	(LocationId 		INT, 
     UserId			INT AUTO_INCREMENT,
	 FirstName 	VARCHAR(30),
     LastName	VARCHAR(30),
     email 		VARCHAR(30),
     phoneNumber VARCHAR(30),
     dateJoined DATE,
	 PRIMARY KEY (UserId),
     FOREIGN KEY (LocationId) REFERENCES Location(LocationId) ON DELETE CASCADE
	); 
    

CREATE TABLE Staff
	(LocationId 		INT, 
     StaffId			INT AUTO_INCREMENT,
	 FirstName 	VARCHAR(30),
     LastName	VARCHAR(30),
     email 		VARCHAR(30),
     role		VARCHAR(30),
	 PRIMARY KEY (StaffId),
     FOREIGN KEY (LocationId) REFERENCES Location(LocationId) ON DELETE CASCADE
	); 
    

CREATE TABLE Sensor
	(LocationId 		INT, 
     SensorId		INT AUTO_INCREMENT,
	 DateSetUp 		DATE,
     SensorType	VARCHAR(30),
	 PRIMARY KEY (SensorId),
     FOREIGN KEY (LocationId) REFERENCES Location(LocationId) ON DELETE CASCADE
	); 
    
CREATE TABLE DataPollution
	(SensorId		INT AUTO_INCREMENT,
	 LivePollution 	VARCHAR(30),
     ForeCast		VARCHAR(30),
	 PRIMARY KEY (SensorId),
     FOREIGN KEY (SensorId) REFERENCES Sensor(SensorId)
	); 
    
CREATE TABLE Alarm
	(AlarmId INT AUTO_INCREMENT,
    AlarmText VARCHAR(45) NOT NULL,
    date_ DATE,
    SensorId INT,
    UserId INT,
    PRIMARY KEY (AlarmId),
    FOREIGN KEY (SensorId) REFERENCES Sensor(SensorId) ON DELETE CASCADE,
    FOREIGN KEY (UserId) REFERENCES Users(UserId) ON DELETE CASCADE);