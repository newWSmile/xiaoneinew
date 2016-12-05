/*创建数据库.*/
DROP DATABASE IF EXISTS xiaonei;
CREATE DATABASE xiaonei DEFAULT CHARACTER SET utf8 ;

/*国家表*/
CREATE TABLE country(	
	id INT	NOT NULL PRIMARY KEY AUTO_INCREMENT,		
	NAME VARCHAR(32) NOT NULL		
)

/*省份表*/
CREATE TABLE province(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
NAME VARCHAR(32) NOT NULL,		
countryId INT,	
FOREIGN KEY (countryId) REFERENCES country(id)
) ENGINE=INNODB

/*中国省份表*/
CREATE TABLE localProvince(
lp_id INT(11) PRIMARY KEY,
lp_name VARCHAR(32) NOT NULL)


/*城市表*/
CREATE TABLE city(	
	id	INT	NOT NULL PRIMARY KEY AUTO_INCREMENT,		
	NAME	VARCHAR(32) NOT NULL,		
	proId	INT REFERENCES province(id),
	FOREIGN KEY (proId) REFERENCES province(id)		
)


/*中国城市表*/
CREATE TABLE localCity(
 lc_id INT PRIMARY KEY AUTO_INCREMENT,
 lc_name VARCHAR(32),
 lc_lpId INT
)

/*乡村表*/
CREATE TABLE town(	
	id INT	NOT NULL PRIMARY KEY AUTO_INCREMENT,	
	NAME	VARCHAR(32) NOT NULL,		
	cityId	INT,
	FOREIGN KEY (cityId) REFERENCES city(id)
)
/*技工学校*/
CREATE TABLE techSchool(	
	id INT	NOT NULL PRIMARY KEY AUTO_INCREMENT,		
	NAME	VARCHAR(64) NOT NULL,		
	cityId	INT,		
	townId	INT,
	FOREIGN KEY (cityId) REFERENCES city(id),
	FOREIGN KEY (townId) REFERENCES town(id)
)
/*初中表*/
CREATE TABLE junior(	
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,	
	NAME VARCHAR(64) NOT NULL,		
	cityId INT,		
	townId INT,
	FOREIGN KEY (cityId) REFERENCES city(id),
	FOREIGN KEY (townId) REFERENCES town(id)
)

/*小学表*/
CREATE TABLE primarySchool(	
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,		
	NAME VARCHAR(64) NOT NULL,		
	cityId INT,		
	townId INT,
	FOREIGN KEY (cityId) REFERENCES city(id),
	FOREIGN KEY (townId) REFERENCES town(id)
)

/*--高中表(公共信息部分)*/
CREATE TABLE senior(	
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,	
	NAME   VARCHAR(64) NOT NULL,		
	cityId	INT,		
	townId	INT,
	FOREIGN KEY (cityId) REFERENCES city(id),
	FOREIGN KEY (townId) REFERENCES town(id)	
)


/*--用户表*/
CREATE TABLE users(
	id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT, 
	email VARCHAR(128) UNIQUE NOT NULL,	    
	NAME VARCHAR(128) NOT NULL,		   
	pwd VARCHAR(128) NOT NULL,		    
	photo	VARCHAR(128) DEFAULT 'default.gif',	   
	sex	VARCHAR(16),			   
	homePro	INT(11),			
	homeCity INT(11),			
	birth	DATE,				
	tel	VARCHAR(32),			
	mobile	VARCHAR(32),			
	oicq	VARCHAR(32),			
	msn	VARCHAR(128),			
	website	VARCHAR(128),			
	techSch	INT(11),			
	techSchYear INT(11),			
	juniorSch INT(11),			
	juniorYear INT(11),			
	primarySch INT(11),			
	primaryYear INT(11),			
	interest VARCHAR(256),			
	music	VARCHAR(256),			
	movie	VARCHAR(256),			
	game	VARCHAR(256),			
	cartoon	VARCHAR(256),			
	sport	VARCHAR(256),			
	book	VARCHAR(256),			
	assn	VARCHAR(256),			
	visited	INT DEFAULT 0,			
	doing	VARCHAR(128),			
	online	TINYINT	DEFAULT 0,		
	registerDate DATETIME ,		
	loginDate DATETIME,
	LEVEL	TINYINT DEFAULT 1,		
	locked	TINYINT	DEFAULT 0,		
	FOREIGN KEY (homePro) REFERENCES province(id),
	FOREIGN KEY (homeCity) REFERENCES city(id),
	FOREIGN KEY (techSch) REFERENCES techschool(id),
	FOREIGN KEY (juniorSch) REFERENCES junior(id),
	FOREIGN KEY (primarySch) REFERENCES primarySchool(id)		
)

	
/*--用户高中表 userSenior ----*/						
		
CREATE TABLE userSenior(		
	id INT	NOT NULL PRIMARY KEY AUTO_INCREMENT,		
	userId	INT,		
	seniorSchId INT,		
	seniorYear INT,		
	grade1	VARCHAR(64),	
	grade2	VARCHAR	(64),	
	grade3	VARCHAR	(64),
	FOREIGN KEY (userid) REFERENCES users(id),
	FOREIGN KEY (seniorSchId) REFERENCES senior(id)
)

	
/*--大学表(大学的公共信息部分)*/									
CREATE TABLE university(	
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,		
	NAME VARCHAR(64) NOT NULL,		
	countryId INT,		
	proId INT,
	FOREIGN KEY (countryId) REFERENCES country(id),
	FOREIGN KEY (proId) REFERENCES province(id)		
)


/*--用户大学表 userUniversity */											
CREATE TABLE userUniversity
(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  userId INT,
  universityId INT,
  uniYear INT,
  userType VARCHAR(32),
  college VARCHAR(128),
  drom VARCHAR(128),
  FOREIGN KEY(userId) REFERENCES users(id),
  FOREIGN KEY(universityId) REFERENCES university(id)
)	



/*--用户所在网络[即该同学是哪个圈的人.]*/
CREATE TABLE userNet(	
	id		INT	NOT NULL PRIMARY KEY AUTO_INCREMENT,		
	userId	INT	,		
	NAME		VARCHAR	(64)	NOT NULL,	
	isPrimary	TINYINT	DEFAULT 1,
	FOREIGN KEY (userId) REFERENCES users(id)			
)



/************************相册功能涉及到的表*****************************/

/*--相册表*/
CREATE TABLE album(
id INT PRIMARY KEY AUTO_INCREMENT,
userId INT,
NAME VARCHAR(128),
descript VARCHAR(256),
photo VARCHAR(64) DEFAULT 'main.jpg',
creTime DATETIME,
updTime DATETIME,
FOREIGN KEY (userId) REFERENCES users(id)
)

/*--照片表*/
CREATE TABLE photo(
id INT PRIMARY KEY AUTO_INCREMENT,
photo VARCHAR(64),
albumId INT,
descript VARCHAR(256) ,
rtime INT DEFAULT 0,
ADDTIME DATETIME,
FOREIGN KEY (albumId) REFERENCES album(id)
)

/*--照片评论表*/
CREATE TABLE photoComment(
id INT PRIMARY KEY AUTO_INCREMENT,
photoId INT ,
userId INT,
content VARCHAR(256),
comTime DATETIME ,
FOREIGN KEY (photoId) REFERENCES photo(id),
FOREIGN KEY (userId) REFERENCES users(id)
)
 

								
/*用户公司表 userCom */					
CREATE TABLE userCom(		
	uc_id INT(11) PRIMARY KEY AUTO_INCREMENT, /*用户公司id*/		
	uc_userId INT(11), /*用户id*/		
	uc_name VARCHAR(64), /*--公司名*/		
	uc_describe VARCHAR(256), /*公司描述*/		
	uc_trade INT(11), /*行业ID*/		
	uc_tradeInfo INT(11), /*行业具体ID*/		
	uc_job INT(11), /*职位ID*/		
	uc_jobInfo INT(11), /*职位具体ID*/		
	uc_date VARCHAR(16) /*工作时间*/		
)	


/*导入数据*/
/*导入国家信息数据*/
LOAD DATA LOCAL INFILE 'E:\\project\\proj06\\data\\country.txt' INTO TABLE country FIELDS TERMINATED BY '\t';
/*导入省份数据*/
LOAD DATA LOCAL INFILE 'E:\\project\\proj06\\data\\province.txt' INTO TABLE province FIELDS TERMINATED BY '\t';
/*导入中国省份数据*/
LOAD DATA LOCAL INFILE 'E:\\project\\proj06\\data\\localProvince.txt' INTO TABLE localProvince FIELDS TERMINATED BY '\t';
/*导入城市数据*/
LOAD DATA LOCAL INFILE 'E:\\project\\proj06\\data\\city.txt' INTO TABLE city FIELDS TERMINATED BY '\t';
/*导入乡村表数据*/
LOAD DATA LOCAL INFILE 'E:\\project\\proj06\\data\\town.txt' INTO TABLE town FIELDS TERMINATED BY '\t';
/*导入技工学校数据*/
LOAD DATA LOCAL INFILE 'E:\\project\\proj06\\data\\techSchool.txt' INTO TABLE techSchool FIELDS TERMINATED BY '\t';
/*导入初中表数据*/
LOAD DATA LOCAL INFILE 'E:\\project\\proj06\\data\\junior.txt' INTO TABLE junior FIELDS TERMINATED BY '\t';
/*导入高中数据*/
LOAD DATA LOCAL INFILE 'E:\\project\\proj06\\data\\senior.txt' INTO TABLE senior FIELDS TERMINATED BY '\t';
/*导入大学数据*/
LOAD DATA LOCAL INFILE 'E:\\project\\proj06\\data\\university.txt' INTO TABLE university FIELDS TERMINATED BY '\t';



