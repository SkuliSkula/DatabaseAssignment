CREATE DATABASE IF NOT EXISTS Pollution;
USE Pollution;

/******************************************************* CREATE THE TABLES AND CONSTRAINTS ********************************************/
CREATE TABLE Country
    (id INT(11) NOT NULL AUTO_INCREMENT,
    country_code VARCHAR(2) NOT NULL DEFAULT '',
    country_name VARCHAR(100) NOT NULL DEFAULT '',
    PRIMARY KEY (id))ENGINE=MYISAM DEFAULT CHARSET=UTF8;

CREATE TABLE Location
    (location_id INT AUTO_INCREMENT, 
     zipcode INT,
     country_code VARCHAR(2),
     latitude FLOAT,
     longitude FLOAT,
     PRIMARY KEY (LocationId),
     FOREIGN KEY (country_code) REFERENCES Country(id) ON DELETE CASCADE
    );

CREATE TABLE Garden
    (id INT(11) NOT NULL AUTO_INCREMENT,
    `Name` VARCHAR(30) NOT NULL DEFAULT '',
    address VARCHAR(100),
    pollution_radius INT(11),
    locationId INT(11),
    PRIMARY KEY (id),
    FOREIGN KEY (locationId) REFERENCES Location(location_id) ON DELETE CASCADE);

CREATE TABLE `User` (
  `id` MEDIUMINT(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(255) DEFAULT NULL,
  `last_name` VARCHAR(255) DEFAULT NULL,
  `email` VARCHAR(255) DEFAULT NULL,
  `phone_number` VARCHAR(100) DEFAULT NULL,
  `date_joined` VARCHAR(255),
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;
    
CREATE TABLE `Staff` (
  `id` MEDIUMINT(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(255) DEFAULT NULL,
  `last_name` VARCHAR(255) DEFAULT NULL,
  `email` VARCHAR(255) DEFAULT NULL,
  `role` TEXT DEFAULT NULL,
  `hiring_date` VARCHAR(255),
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;
    
CREATE TABLE Sensor
    (sensor_id INT(11) AUTO_INCREMENT,
     location_id INT(11),
     setup DATE,
     sensor_type    VARCHAR(30),
     PRIMARY KEY (sensor_id),
     FOREIGN KEY (location_id) REFERENCES Location(location_id) ON DELETE CASCADE
    ); 
/* AQHI Air quality health index: Low 1-3, Moderate 4-6, High 7-10, Very High 10> */
CREATE TABLE DataPollution
    (sensor_id      INT(11) AUTO_INCREMENT,
     pollution_value    INT(4),
     forecast       VARCHAR(30) NOT NULL DEFAULT 'No forecast yet',
     date_ VARCHAR(255),
     PRIMARY KEY (sensor_id),
     FOREIGN KEY (sensor_id) REFERENCES Sensor(sensor_id)
    ); 

CREATE TABLE AlarmText
    (text_id INT(11) AUTO_INCREMENT,
    `text` VARCHAR(100))
    AUTO_INCREMENT = 1;
    
CREATE TABLE Alarm
    (alarm_id INT(11) AUTO_INCREMENT,
    alarm_text_id INT(11),
    date_ VARCHAR(255),
    sensor_id INT(11),
    user_id INT(11),
    PRIMARY KEY (alarm_id),
    FOREIGN KEY (sensor_id) REFERENCES Sensor(sensor_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE)
    AUTO_INCREMENT = 1;
    
    
/********************************************************************************INSERT DATA INTO THE DATABASE****************************************************/

INSERT Country VALUES
    ('DK', 'Denmark'),
    ('GB', 'United Kingdom'),
    ('DE', 'Germany'),
    ('IS', 'Iceland'),
    ('NL','Netherlands');

INSERT Garden VALUES
    ('King´s Garden', 'Øster Voldgade 4', 2, 1),
    ('Botanical Garden', 'Øster Farimagsgade 2B', 3, 2),
    ('Assistens Cemetery', 'Kapelvej 2', 1, 3),
    ('Frederiksberg Garden', 'Frederiksberg Runddel', 3, 4),
    ('Vestre Cemetery', 'Vestre Kirkegårds Alle 15', 2, 5);

INSERT Location VALUES
    (1350,'DK', 55.685157583, 12.579474449),
    (1353,'DK', 55.686368, 12.570429),
    (2200,'DK', 55.6894205, 12.5529767 ),
    (1350,'DK', 55.6745665, 12.5318787 ),
    (1350,'DK', 55.6623962, 12.530983 );
    
INSERT `User` VALUES 
    ("Geoffrey","Osborne","posuere.cubilia.Curae@Vestibulum.edu","5205915","26-04-2012 16:40:51"),
    ("Carlos","Duffy","In.tincidunt@odiovelest.com","0462843","29-05-2014 18:48:53"),
    ("Lance","Weaver","quis@ametnulla.com","3848252","22-11-2012 03:11:20"),
    ("Cooper","Hardin","lectus.pede@ametrisus.org","2545587","13-11-2015 03:29:05"),
    ("Oren","Lester","enim.non@Nullamscelerisqueneque.co.uk","6084085","24-02-2013 19:18:34"),
    ("Ali","Meyers","Quisque@turpisNullaaliquet.org","2087058","16-10-2011 16:36:18"),
    ("Davis","Shields","placerat.eget.venenatis@tincidunttempusrisus.co.uk","8923281","15-02-2014 00:25:53"),
    ("Chandler","Moses","scelerisque.scelerisque.dui@commodo.ca","8632191","08-04-2014 19:01:49"),
    ("Dalton","Thomas","Aliquam.fringilla@NullamenimSed.net","6087038","12-04-2012 23:52:46"),
    ("Lewis","Vang","eget@egetmagna.com","8322903","31-07-2010 00:01:20");

INSERT INTO `Staff` VALUES 
    ("Rudyard","Porter","elementum.lorem@vel.edu","Owner","07-02-2014 11:25:50"),
    ("Logan","Campos","felis@risusquisdiam.edu","Programmer","06-11-2012 23:23:32"),
    ("Wyatt","Riley","egestas.Aliquam.nec@Nullam.net","Technician","14-10-2010 18:53:23"),
    ("Basil","Cohen","enim.Mauris.quis@egestasAliquam.edu","Booker","27-09-2013 12:32:42"),
    ("Stuart","Alexander","ante.blandit@suscipitest.edu","Salesman","24-03-2015 04:14:20"),
    ("Dustin","Dennis","nulla@odioPhasellus.co.uk","Sys Admin","13-07-2012 16:48:50"),
    ("Edward","Cunningham","viverra.Donec@luctus.co.uk","Coordinator","08-01-2011 03:21:39"),
    ("Chase","Mercado","nec@ametultricies.co.uk","Programmer","25-01-2015 10:24:18"),
    ("Quinlan","Dyer","nascetur@magna.edu","Salesman","20-08-2011 10:14:27"),
    ("Xenos","Carter","Curabitur.egestas@PhasellusornareFusce.edu","Technician","13-09-2015 22:38:13");

INSERT Sensor VALUES
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
INSERT DataPollution VALUES
(1, 2,"08-01-2011 03:21:39"),
(2, 3, "08-01-2011 03:21:39"),
(3, 4, "08-01-2011 03:21:39"),
(5, 7, "08-01-2011 03:21:39"),
(1, 2, "08-01-2011 03:21:39"),
(3, 3, "08-01-2011 03:21:39"),
(3, 4, "08-01-2011 03:21:39"),
(5, 7, "08-01-2011 03:21:39"),
(1, 2, "08-01-2011 03:21:39"),
(2, 3, "08-01-2011 03:21:39"),
(3, 4, "08-01-2011 03:21:39"),
(4, 7, "08-01-2011 03:21:39"),
(1, 2, "08-01-2011 03:21:39"),
(5, 3, "08-01-2011 03:21:39"),
(2, 4, "08-01-2011 03:21:39"),
(4, 7, "08-01-2011 03:21:39");

INSERT Alarm VALUES
('Evacuade'),
('CS-103','1','Fall','2009',NULL,NULL, NULL);
