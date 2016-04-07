alter table med.tdocs add FK_MOGROUPID NUMBER(10) default 0;
-- Foreign Key
ALTER TABLE med.tdocs
ADD CONSTRAINT FK_MOGROUPID FOREIGN KEY (FK_MOGROUPID)
REFERENCES MED.TMO_GROUP (GROUPID) ON DELETE SET NULL
DISABLE NOVALIDATE;
COMMENT ON COLUMN MED.tdocs.FK_MOGROUPID is 'Группа мат. отв., которые могут распоряжаться данным документом (приходом/расходом)';
