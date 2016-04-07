
-- Start of DDL Script for Constraint MED.FK_TMEDICTYPE
-- Generated 14.03.08 10:54:29 from ASU@ASU

ALTER TABLE med.tmedic
MODIFY CONSTRAINT fk_tmedictype DISABLE NOVALIDATE
/

ALTER TABLE med.tmedic MODIFY CONSTRAINT FK_MEDIC_FARMGR DISABLE NOVALIDATE
/
-- End of DDL script for Foreign Key(s)
quit
/
