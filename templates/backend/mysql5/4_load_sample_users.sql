-- This script populates the repository with sample users with their respective roles

USE hibernate<%= name %>;

--  Create default users

INSERT INTO USERS VALUES('joe','cGFzc3dvcmQ=',TRUE,'');
INSERT INTO USERS VALUES('pat','cGFzc3dvcmQ=',TRUE,'');
INSERT INTO USERS VALUES('suzy','cGFzc3dvcmQ=',TRUE,'');
INSERT INTO USERS VALUES('tiffany','cGFzc3dvcmQ=',TRUE,'');

--  Create default roles
INSERT INTO AUTHORITIES VALUES('Admin','Super User');
INSERT INTO AUTHORITIES VALUES('Anonymous','User has not logged in');
INSERT INTO AUTHORITIES VALUES('Authenticated','User has logged in');
INSERT INTO AUTHORITIES VALUES('ceo','Chief Executive Officer');
INSERT INTO AUTHORITIES VALUES('cto','Chief Technology Officer');
INSERT INTO AUTHORITIES VALUES('dev','Developer');
INSERT INTO AUTHORITIES VALUES('devmgr','Development Manager');
INSERT INTO AUTHORITIES VALUES('is','Information Services');

INSERT INTO GRANTED_AUTHORITIES VALUES('joe','Admin');
INSERT INTO GRANTED_AUTHORITIES VALUES('joe','ceo');
INSERT INTO GRANTED_AUTHORITIES VALUES('joe','Authenticated');
INSERT INTO GRANTED_AUTHORITIES VALUES('suzy','cto');
INSERT INTO GRANTED_AUTHORITIES VALUES('suzy','is');
INSERT INTO GRANTED_AUTHORITIES VALUES('suzy','Authenticated');
INSERT INTO GRANTED_AUTHORITIES VALUES('pat','dev');
INSERT INTO GRANTED_AUTHORITIES VALUES('pat','Authenticated');
INSERT INTO GRANTED_AUTHORITIES VALUES('tiffany','dev');
INSERT INTO GRANTED_AUTHORITIES VALUES('tiffany','devmgr');
INSERT INTO GRANTED_AUTHORITIES VALUES('tiffany','Authenticated');

commit;
