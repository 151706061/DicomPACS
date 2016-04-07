alter table med.tkart add FK_MOGROUPID NUMBER(10) default 0;
-- Foreign Key
ALTER TABLE med.tkart
ADD CONSTRAINT FK_MOGROUPID FOREIGN KEY (FK_MOGROUPID)
REFERENCES MED.TMO_GROUP (GROUPID) ON DELETE SET NULL
DISABLE NOVALIDATE;
COMMENT ON COLUMN med.tkart.FK_MOGROUPID is 'Группа мат. отв., которые могут распоряжаться данной партией';
