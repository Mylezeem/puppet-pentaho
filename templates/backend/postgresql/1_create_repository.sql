--
-- note: this script assumes pg_hba.conf is configured correctly
--

-- \connect postgres postgres

drop database if exists hibernate<%= name %>;
drop user if exists hibuser;

CREATE USER hibuser PASSWORD 'password';

CREATE DATABASE hibernate<%= name %> WITH OWNER = hibuser ENCODING = 'UTF8' TABLESPACE = pg_default;

GRANT ALL PRIVILEGES ON DATABASE hibernate<%= name %> to hibuser;

\connect hibernate<%= name %> hibuser

begin;

DROP TABLE IF EXISTS DATASOURCE;

CREATE TABLE DATASOURCE(NAME VARCHAR(50) NOT NULL PRIMARY KEY,MAXACTCONN INTEGER NOT NULL,DRIVERCLASS VARCHAR(50) NOT NULL,IDLECONN INTEGER NOT NULL,USERNAME VARCHAR(50) NULL,PASSWORD VARCHAR(150) NULL,URL VARCHAR(512) NOT NULL,QUERY VARCHAR(100) NULL,WAIT INTEGER NOT NULL);

-- Create AUTHORITIES table
DROP TABLE IF EXISTS AUTHORITIES;
CREATE TABLE AUTHORITIES(
  AUTHORITY VARCHAR(50) NOT NULL PRIMARY KEY,
  DESCRIPTION VARCHAR(100) NOT NULL
);

-- Create USERS table
DROP TABLE IF EXISTS USERS;
CREATE TABLE USERS(
  USERNAME VARCHAR(50) NOT NULL PRIMARY KEY,
  PASSWORD VARCHAR(50) NOT NULL,
  ENABLED BOOL NOT NULL,
  DESCRIPTION VARCHAR(100) NULL
);

-- Create GRANTED_AUTHORITIES table
DROP TABLE IF EXISTS GRANTED_AUTHORITIES;
CREATE TABLE GRANTED_AUTHORITIES(
  USERNAME VARCHAR(50) NOT NULL ,
  AUTHORITY VARCHAR(50) NOT NULL 
);

commit;
