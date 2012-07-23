-- This script populates the repository with sample data related 
-- information including users and data sources

USE hibernate<%= name %>;

--  Create HSQLDB Sample Data Source

INSERT INTO DATASOURCE VALUES('SampleData',20,'com.mysql.jdbc.Driver',5,'pentaho_user','cGFzc3dvcmQ=','jdbc:mysql://<%= host %>:<%= port %>/sampledata<%= name %>','select 1',1000);

commit;
