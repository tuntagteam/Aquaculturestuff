CREATE DATABASE IF NOT EXISTS aquaculturedb 
character set utf8 collate utf8_general_ci;

ALTER database aquaculturedb
character set utf8 collate utf8_general_ci;

USE aquaculturedb;

CREATE TABLE IF NOT EXISTS tbgeographies(
		geographid 		int(11) 	auto_increment NOT NULL,
		geographthname 		varchar(50) 	character set utf8
							collate utf8_general_ci NOT NULL,
		geographenname 		varchar(50) 	character set utf8 
							collate utf8_general_ci NULL,
		geographrecord 		timestamp 	default current_timestamp NOT NULL,
		geographupdate 		datetime 	default current_timestamp 
							ON UPDATE current_timestamp NULL,
		PRIMARY KEY (geographid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS tbprovince(
		provinceid 		int(11)		auto_increment NOT NULL PRIMARY KEY,
		provincecode 		char(2) 	character set utf8
							collate utf8_general_ci NOT NULL,
		provincethname 		varchar(100) 	character set utf8 
							collate utf8_general_ci NOT NULL,
		provinceenname 		varchar(100) 	character set utf8 
							collate utf8_general_ci NULL,
		geographid 		int		NOT NULL,
        	provincerecord		timestamp	DEFAULT current_timestamp NOT NULL,
        	provinceupdate		datetime	DEFAULT current_timestamp
							ON UPDATE current_timestamp NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER table tbprovince
ADD constraint FK_Province_Geographic 		foreign key (geographid)
	REFERENCES tbgeographies (geographid) 	ON UPDATE CASCADE;
    
CREATE TABLE IF NOT EXISTS tbdistrict(
		districtid		int(11)		auto_increment NOT NULL PRIMARY KEY,
        	districtcode		varchar(4)	character set utf8
							collate utf8_general_ci NOT NULL,
		districtthname		varchar(100)	character set utf8
							collate utf8_general_ci	NOT NULL,
		districtenname 		varchar(100) 	character set utf8 
							collate utf8_general_ci NULL,
		provinceid		int(11)		NOT NULL,
        	districtrecord		timestamp	DEFAULT current_timestamp NOT NULL,
        	districtupdate		datetime	DEFAULT current_timestamp
							ON UPDATE current_timestamp NULL,
		districtstatus	char(1)			character set utf8
							collate utf8_general_ci NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER table tbdistrict
ADD constraint FK_District_Province			foreign key (provinceid)
	REFERENCES	tbprovince	(provinceid)	ON UPDATE CASCADE;
    
CREATE TABLE IF NOT EXISTS tbsubdistrict(
		subdistrictid		varchar(6)		character set utf8
								collate utf8_general_ci	NOT NULL primary key,
		subdistrictzipcode	int(11)			NOT NULL,
        	subdistrictthname	varchar(100)		character set utf8
								collate utf8_general_ci NOT NULL,
		subdistrictenname	varchar(100)		character set utf8
								collate utf8_general_ci NULL,
		districtid		int(11)			NOT NULL,
       		subdistrictrecord	timestamp		DEFAULT current_timestamp NOT NULL,
        	subdistrictupdate	datetime		DEFAULT current_timestamp
								ON UPDATE current_timestamp NULL,
		subdistrictstatus	char(1)			character set utf8
								collate utf8_general_ci NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER table tbsubdistrict
ADD constraint FK_Subdistrict_District			foreign key (districtid)
	REFERENCES	tbdistrict	(districtid)		ON UPDATE CASCADE;
    
CREATE TABLE IF NOT EXISTS tbposition(
		posid		int(11)			auto_increment NOT NULL PRIMARY KEY,
        	posthname	varchar(30)		character set utf8
							collate utf8_general_ci NOT NULL,
		posenname	varchar(30)		character set utf8
							collate utf8_general_ci NULL,
		posrecord	timestamp		DEFAULT current_timestamp NOT NULL,
        	posupdate	datetime		DEFAULT current_timestamp
							ON UPDATE current_timestamp NULL,
		posstatus	char(1)			character set utf8
							collate utf8_general_ci NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER table tbposition;

CREATE TABLE IF NOT EXISTS tbuser(
		userid		int(11)			auto_increment NOT NULL PRIMARY KEY,
        	useremail	varchar(255)		character set utf8
							collate utf8_general_ci NOT NULL,
		username	varchar(50)		character set utf8
							collate utf8_general_ci NOT NULL,
		userpwd		varchar(255)		character set utf8
							collate utf8_general_ci NOT NULL,
		userrecord	timestamp		DEFAULT current_timestamp NOT NULL,
        	userupdate	datetime		DEFAULT current_timestamp
							ON UPDATE current_timestamp NULL,
		userstatus	char(1)			character set utf8
							collate utf8_general_ci NOT NULL,
		UNIQUE (useremail , username)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER table tbuser;

CREATE TABLE IF NOT EXISTS tbproflevel(
		proflevelid		int(11)			auto_increment NOT NULL PRIMARY KEY,
        	proflevelthname		varchar(30)		character set utf8
								collate utf8_general_ci NOT NULL,
		proflevelenname		varchar(30)		character set utf8
								collate utf8_general_ci NULL,
		profleveldesc		varchar(100)		character set utf8
								collate utf8_general_ci NOT NULL,
		proflevelrecord		timestamp		DEFAULT current_timestamp NOT NULL,
        	proflevelupdate		datetime		DEFAULT current_timestamp
								ON UPDATE current_timestamp NULL,
		proflevelstatus		char(1)			character set utf8
								collate utf8_general_ci NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER table tbproflevel;

CREATE TABLE IF NOT EXISTS tbprefixname(
		prefid			int(11)			auto_increment NOT NULL PRIMARY KEY,
        	prefthname		varchar(50)		character set utf8
								collate utf8_general_ci NOT NULL,
		prefabthname		varchar(25)		character set utf8
								collate utf8_general_ci NOT NULL,
		prefenname		varchar(50)		character set utf8
								collate utf8_general_ci NULL,
		prefabenname		varchar(25)		character set utf8
								collate utf8_general_ci NULL,
        	prefrecord		timestamp		DEFAULT current_timestamp NOT NULL,
        	prefupdate		datetime		DEFAULT current_timestamp
								ON UPDATE current_timestamp NULL,
		prefstatus		char(1)			character set utf8
								collate utf8_general_ci NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER table tbprefixname;

CREATE TABLE IF NOT EXISTS tbprofile(
		profileid		int(11)			auto_increment NOT NULL PRIMARY KEY,
       		prefid			int(11)			NOT NULL,
        	profilethfname		varchar(50)		character set utf8
								collate utf8_general_ci NOT NULL,
		profilethlname		varchar(50)		character set utf8
								collate utf8_general_ci NOT NULL,
		profileaddr		varchar(50)		character set utf8
								collate utf8_general_ci NOT NULL,
		profilemoo		varchar(50)		character set utf8
								collate utf8_general_ci	NOT NULL,
		subdistrictid		varchar(6)		NOT NULL,
        	profilezipcode		int(11)			NOT NULL,
        	userid			int(11)			NOT NULL,
        	proflevelid		int(11)			NOT NULL,
        	profilepicture		varchar(255)		character set utf8
								collate utf8_general_ci	NOT NULL,
		profiletel		varchar(50)		character set utf8
								collate utf8_general_ci	NOT NULL,
		profilemobile		varchar(50)		character set utf8
								collate utf8_general_ci	NOT NULL,
		profilefbid		varchar(255)		character set utf8
								collate utf8_general_ci	NOT NULL,
		profilelineid		varchar(255)		character set utf8
								collate utf8_general_ci	NOT NULL,
		profiledesc		varchar(255)		character set utf8
								collate utf8_general_ci	NOT NULL,
		profilerecord		timestamp		DEFAULT current_timestamp NOT NULL,
        	profileupdate		datetime		DEFAULT current_timestamp
								ON UPDATE current_timestamp NULL,
		profilestatus		char(1)			character set utf8
								collate utf8_general_ci NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER table tbprofile
ADD 	constraint FK_Profile_Profilelevel		foreign key (proflevelid)
	REFERENCES tbproflevel (proflevelid)		ON UPDATE CASCADE;
        
 ALTER table tbprofile       
ADD	constraint FK_Profile_User			foreign key (userid)
	REFERENCES tbuser (userid)			ON UPDATE CASCADE;
        
ALTER table tbprofile
ADD 	constraint FK_Profile_Subdistrict		foreign key (subdistrictid)
	REFERENCES tbsubdistrict (subdistrictid)	ON UPDATE CASCADE;
        
ALTER table tbprofile
ADD	constraint FK_Profile_Prefixname		foreign key (prefid)
	REFERENCES tbprefixname	(prefid)		ON UPDATE CASCADE;



