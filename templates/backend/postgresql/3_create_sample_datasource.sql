--
-- note: this script assumes pg_hba.conf is configured correctly
--

\connect hibernate<%= name %> hibuser

begin;

INSERT INTO DATASOURCE VALUES('SampleData',20,'org.postgresql.Driver',5,'pentaho_user','cGFzc3dvcmQ=','jdbc:postgresql://<%= host %>:<%= port %>/sampledata<%= name %>','select 1',1000);

commit;
