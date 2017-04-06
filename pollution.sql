CREATE DATABASE IF NOT EXISTS Pollution;
USE Pollution;

/******************************************************* CREATE THE TABLES AND CONSTRAINTS ********************************************/
CREATE TABLE Location
	(location_id INT AUTO_INCREMENT, 
     latitude FLOAT,
     longitude FLOAT,
	 PRIMARY KEY (Location_id)
	);

CREATE TABLE Address 
	(address_id INT(11) AUTO_INCREMENT,
    street_name VARCHAR(50),
    zip INT(4),
    PRIMARY KEY (address_id)
);

CREATE TABLE Park
	(id INT(11) NOT NULL AUTO_INCREMENT,
    `Name` VARCHAR(30) NOT NULL DEFAULT '',
    address_id INT(11),
    pollution_radius INT(11),
    location_id INT(11),
    PRIMARY KEY (id),
    FOREIGN KEY (location_id) REFERENCES Location(location_id) ON DELETE CASCADE,
    FOREIGN KEY (address_id) REFERENCES Address(address_id) ON DELETE CASCADE);

CREATE TABLE User_ (
	user_id INT(11) NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(255) DEFAULT NULL,
	last_name VARCHAR(255) DEFAULT NULL,
	email VARCHAR(255) DEFAULT NULL,
	phone_number VARCHAR(100) DEFAULT NULL,
	date_joined VARCHAR(255),
    address_id INT(11),
	PRIMARY KEY (user_id),
    FOREIGN KEY (address_id) REFERENCES Address(address_id) ON DELETE CASCADE);

CREATE TABLE Sensor
	(sensor_id INT(11) AUTO_INCREMENT,
     location_id INT(11),
	 setup_date VARCHAR(255),
     sensor_type	VARCHAR(30),
	 PRIMARY KEY (sensor_id),
     FOREIGN KEY (location_id) REFERENCES Location(location_id) ON DELETE CASCADE
	); 
/* AQHI Air quality health index: Low 1-3, Moderate 4-6, High 7-10, Very High 10> */
CREATE TABLE `Data`
	(data_id INT(11) AUTO_INCREMENT,
    pollution_type		VARCHAR(50),
	 pollution_value 	INT(4),
     sensor_id INT(11),
     forecast		VARCHAR(30) NOT NULL DEFAULT 'No forecast yet',
     date_ VARCHAR(255),
	 PRIMARY KEY (data_id),
     FOREIGN KEY (sensor_id) REFERENCES Sensor(sensor_id) ON DELETE CASCADE
	); 

CREATE TABLE Message
	(message_id INT(11) AUTO_INCREMENT,
    `text` VARCHAR(100),
    PRIMARY KEY(message_id));

CREATE TABLE Notification
	(notification_id INT(11) AUTO_INCREMENT,
    message_id INT(11),
    date_ VARCHAR(255),
    sensor_id INT(11),
    pollution_level INT(11),
    PRIMARY KEY (notification_id),
    FOREIGN KEY (sensor_id) REFERENCES Sensor(sensor_id) ON DELETE CASCADE,
    FOREIGN KEY (message_id) REFERENCES Message(message_id) ON DELETE CASCADE
    );
    
CREATE TABLE Receives
	(notification_id INT(11),
    user_id INT(11),
    PRIMARY KEY (notification_id, user_id),
    FOREIGN KEY (notification_id) REFERENCES Notification(notification_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES User_(user_id) ON DELETE CASCADE
    );

/********************************************************************************INSERT DATA INTO THE DATABASE****************************************************/
INSERT INTO Address (street_name, zip)  VALUES 
	("459-3861 Donec Av.", 2500),
    ("P.O. Box 324, 725 Nonummy. Av.", 1000),
    ("P.O. Box 597, 6747 Hendrerit. Av.", 3700),
    ("Ap #175-9934 A, Rd.", 1900),
    ("3288 Primis St.", 3000),
    ("P.O. Box 614, 3675 Euismod St.", 8700),
    ("500-5502 Sem Road", 2000),
    ("Ap #611-977 Ipsum. Rd.", 1200),
    ("Ap #566-5410 Arcu. St.", 2000),
    ("767-7131 Lectus Avenue", 1628),
    ('Øster Voldgade 4', 1700),
    ('Øster Farimagsgade 2B', 2200),
    ('Kapelvej 2', 1200),
    ('Frederiksberg Runddel', 2000),
    ('Vestre Kirkegårds Alle 15', 1600);

INSERT INTO Location(latitude, longitude) VALUES
	(55.685157583, 12.579474449),
	(55.686368, 12.570429),
    (55.6894205, 12.5529767 ),
    (55.6745665, 12.5318787 ),
    (55.6623962, 12.530983 );
    
INSERT INTO Park(name, address_id, pollution_radius, location_id) VALUES
	('King´s Garden', 11, 2, 1),
    ('Botanical Garden', 12, 3, 2),
    ('Assistens Cemetery', 13, 1, 3),
    ('Frederiksberg Garden', 14, 3, 4),
    ('Vestre Cemetery', 15, 2, 5);


    
INSERT INTO User_(first_name, last_name, email, phone_number, date_joined, address_id) VALUES 
	("Geoffrey","Osborne","posuere.cubilia.Curae@Vestibulum.edu","5205915","26-04-2012 16:40:51",1),
    ("Carlos","Duffy","In.tincidunt@odiovelest.com","0462843","29-05-2014 18:48:53",2),
    ("Lance","Weaver","quis@ametnulla.com","3848252","22-11-2012 03:11:20",3),
    ("Cooper","Hardin","lectus.pede@ametrisus.org","2545587","13-11-2015 03:29:05",4),
    ("Oren","Lester","enim.non@Nullamscelerisqueneque.co.uk","6084085","24-02-2013 19:18:34",5),
    ("Ali","Meyers","Quisque@turpisNullaaliquet.org","2087058","16-10-2011 16:36:18",6),
    ("Davis","Shields","placerat.eget.venenatis@tincidunttempusrisus.co.uk","8923281","15-02-2014 00:25:53",7),
    ("Chandler","Moses","scelerisque.scelerisque.dui@commodo.ca","8632191","08-04-2014 19:01:49",8),
    ("Dalton","Thomas","Aliquam.fringilla@NullamenimSed.net","6087038","12-04-2012 23:52:46",9),
    ("Lewis","Vang","eget@egetmagna.com","8322903","31-07-2010 00:01:20",10);

INSERT INTO Sensor(location_id, setup_date, sensor_type) VALUES
(1, '13-08-2010 18:24:18', 'Benetech'),
(1, '25-04-2010 13:24:18', 'Benetech'),
(3, '25-07-2010 16:24:18', 'Benetech'),
(4, '23-04-2010 11:24:18', 'Netatmo'),
(2, '22-06-2010 10:24:18', 'Netatmo'),
(2, '19-05-2011 08:24:18', 'CubeSensor'),
(5, '13-09-2011 09:24:18', 'CubeSensor'),
(3, '11-08-2012 15:24:18', 'Alima'),
(1, '04-06-2012 14:24:18', 'Alima'),
(4, '08-07-2013 13:24:18', 'Alima');

/* AQHI Air quality health index: Low 1-3, Moderate 4-6, High 7-10, Very High 10> */
INSERT INTO `Data`(pollution_type, pollution_value, sensor_id, date_) VALUES
("Radiation", 1, 2,"08-01-2011 03:21:39"),
("Sulfur dioxide", 2, 3, "08-01-2011 03:21:39"),
("Nitrogen oxides", 3, 4, "08-01-2011 03:21:39"),
("Particulate matter and lead", 5, 7, "08-01-2011 03:21:39"),
("", 1, 2, "08-01-2011 03:21:39"),
("", 3, 3, "08-01-2011 03:21:39"),
("", 3, 4, "08-01-2011 03:21:39"),
("", 5, 7, "08-01-2011 03:21:39"),
("",1, 2, "08-01-2011 03:21:39"),
("",2, 3, "08-01-2011 03:21:39"),
("",3, 4, "08-01-2011 03:21:39"),
("",4, 7, "08-01-2011 03:21:39"),
("",1, 2, "08-01-2011 03:21:39"),
("",5, 3, "08-01-2011 03:21:39"),
("",2, 4, "08-01-2011 03:21:39"),
("",4, 7, "08-01-2011 03:21:39");

/*Fix the empty strings in data*/
UPDATE `Data` SET pollution_type = "No pollution type found" WHERE pollution_type = "";
SELECT * FROM Data;

INSERT INTO Message(`text`) VALUES
("Leave immediately"),
("Pollution level is rising in your area"),
("High Alert in your area"); 

/* AQHI Air quality health index: Low 1-3, Moderate 4-6, High 7-10, Very High 10> */
INSERT INTO Notification(message_id, date_, sensor_id, pollution_level) VALUES
(1, "24-02-2013 19:18:34", 1, 10),
(2, "17-08-2017 10:32:00", 3, 7),
(1, "24-02-2013 19:18:34", 5, 10),
(1, "24-02-2013 19:18:34", 6, 10),
(1, "24-02-2013 19:18:34", 7, 10),
(1, "24-02-2013 19:18:34", 8, 10),
(1, "24-02-2013 19:18:34", 1, 10);

INSERT INTO Receives(notification_id, user_id) VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7);
/************************************************************************ Delete data from the database *************************************************************/

/*DELETE FROM Sensor
WHERE sensor_type = 'Netatmo';*/

delimiter $$
CREATE FUNCTION DELETE_SENSOR_BY_ID (id INT(11))
RETURNS INT(11)
	BEGIN
		DELETE FROM sensor
        WHERE sensor_id = id;
        RETURN id;
	END;
$$
delimiter ;

SELECT DELETE_SENSOR_BY_ID(1);

/************************************************************************ Simple select queries to show data in the database***************************************/

SELECT * FROM Data;
SELECT * FROM User_;
SELECT * FROM Sensor;
SELECT * FROM Park;
/***************************************************************************************** Advanced SQL **********************************************************************************************************/

/* Create a trigger to insert into receives when a notification is sent*/

/* First create a function that returns a random integer that will represent the user_id, the maximum value will be the number of users in the user_ table*/

delimiter $$
CREATE FUNCTION GET_USER_ID()
RETURNS INT
BEGIN
	DECLARE user_id, max_, min_ INT;
    SET min_ = 1;
    SET max_ := (SELECT DISTINCT(LAST_INSERT_ID()) FROM user_);
    SET user_id = (SELECT ROUND((RAND() * (max_-min_))+min_));
    RETURN user_id;
END; 
$$
delimiter;


/*The trigger*/
delimiter $$
CREATE TRIGGER UPDATE_RECEIVES
AFTER INSERT ON Notification
FOR EACH ROW
BEGIN
	DECLARE user_id INTEGER;
    SET user_id = GET_USER_ID();
	INSERT Receives VALUES (New.notification_id, user_id);
END;
$$
delimiter ;

/* Create a view to get all sensors that have logged a value above a specific level*/
/* AQHI Air quality health index: Low 1-3, Moderate 4-6, High 7-10, Very High 10> */

CREATE VIEW SENSOR_VALUE_MODERATE AS 
	SELECT d.pollution_type, d.pollution_value, s.sensor_type 
    FROM data d NATURAL JOIN sensor s
    WHERE pollution_value > 3 AND pollution_value < 7;
    
SELECT * FROM sensor_value_moderate;

/* Create a view to show the user his notifications*/
CREATE VIEW MY_NOTIFICATIONS AS
	SELECT m.text AS Message, n.date_ AS Date, n.pollution_level AS Pollution
	FROM notification n NATURAL JOIN message m WHERE n.message_id = m.message_id;

/*Another way to do this is to create a procedure that gets a notification for a specific user*/
delimiter $$
CREATE PROCEDURE NOTIFICATIONS_BY_USER_ID(id INT(11))
BEGIN 
	SELECT n.date_ AS Date, n.pollution_level, m.text AS Message 
    FROM notification n, receives r, message m 
    WHERE r.user_id = id AND r.notification_id = n.notification_id AND n.message_id = m.message_id;
END;
$$ 
delimiter ;
CALL NOTIFICATIONS_BY_USER_ID(1);

/*Create a trigger to validate data for Park*/	
delimiter $$
CREATE TRIGGER VALIDATE_POLLUTION_RADIUS
	BEFORE INSERT ON Park
    FOR EACH ROW
    BEGIN
		IF new.pollution_radius <= 0 
        THEN SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Invalid pollution radius. Radius needs to be greater than 0'; 
        END IF;
	END;
$$
delimiter ;

/*INSERT INTO Park(name, address_id, pollution_radius, location_id) VALUES
	('King´s Garden', 11, -2, 1);*/

/*Create an event that reads data from the data table to display for instance on an big screen for monitoring. Updates every minute*/
CREATE EVENT DISPLAY_DATA
	ON SCHEDULE
		EVERY 1 MINUTE
        STARTS '2018-04-04 00:00:00' ON COMPLETION PRESERVE ENABLE
        DO
        SELECT pollution_type, pollution_value, sensor_type, latitude, longitude 
        FROM `Data`, sensor, location 
        WHERE data.sensor_id = sensor.sensor_id 
        AND sensor.sensor_id = location.location_id;


/*Create a procedure with a transaction do ensure data integrity when sending a notification*/
delimiter $$
CREATE PROCEDURE STORE_NOTIFICATION (message_id INT(11), IN date_ VARCHAR(30), IN sensor_id INT(11), IN pollution_level INT(11))
BEGIN

DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
    -- Error
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error storing the notification';
    ROLLBACK;
END;
DECLARE EXIT HANDLER FOR SQLWARNING
	BEGIN
    -- Warning
    ROLLBACK;
END;
START TRANSACTION;

INSERT INTO notification (message_id, date_, sensor_id, pollution_level) VALUES 
	(message_id, date_, sensor_id, pollution_level);

COMMIT;
END;
$$ 
delimiter ;