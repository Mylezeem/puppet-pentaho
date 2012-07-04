CREATE DATABASE IF NOT EXISTS `hibernate<%= name %>` DEFAULT CHARACTER SET latin1;

USE hibernate<%= name %>;

GRANT ALL ON hibernate<%= name %>.* TO 'hibuser'@'localhost' identified by 'password'; 

DROP TABLE IF EXISTS DATASOURCE;

--  Create Users Table
CREATE TABLE DATASOURCE(NAME VARCHAR(50) NOT NULL PRIMARY KEY,MAXACTCONN INTEGER NOT NULL,DRIVERCLASS VARCHAR(50) NOT NULL,IDLECONN INTEGER NOT NULL,USERNAME VARCHAR(50) NULL,PASSWORD VARCHAR(150) NULL,URL VARCHAR(512) NOT NULL,QUERY VARCHAR(100) NULL,WAIT INTEGER NOT NULL);
--  Create Granted Authorities Table
CREATE TABLE IF NOT EXISTS `GRANTED_AUTHORITIES` (
`USERNAME` varchar(50) collate latin1_general_ci NOT NULL,
`AUTHORITY` varchar(50) collate latin1_general_ci NOT NULL,
KEY `FK_GRANTED_AUTHORITIES_USERS` (`USERNAME`),
KEY `FK_GRANTED_AUTHORITIES_AUTHORITIES` (`AUTHORITY`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
--  Create Authorities Table
CREATE TABLE IF NOT EXISTS `AUTHORITIES` (
`AUTHORITY` varchar(50) collate latin1_general_ci NOT NULL,
`DESCRIPTION` varchar(100) collate latin1_general_ci default NULL,
PRIMARY KEY (`AUTHORITY`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
--  Create Users Table
CREATE TABLE IF NOT EXISTS `USERS` (
`USERNAME` varchar(50) collate latin1_general_ci NOT NULL,
`PASSWORD` varchar(50) collate latin1_general_ci NOT NULL,
`ENABLED` tinyint(1) NOT NULL,
`DESCRIPTION` varchar(100) collate latin1_general_ci default NULL,
PRIMARY KEY (`USERNAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
commit;
