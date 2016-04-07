alter table med.ttreb add FK_MOGROUPID NUMBER(10) default 0;
-- Foreign Key
ALTER TABLE med.ttreb
ADD CONSTRAINT FK_MOGROUPID FOREIGN KEY (FK_MOGROUPID)
REFERENCES MED.TMO_GROUP (GROUPID) ON DELETE SET NULL
DISABLE NOVALIDATE;
COMMENT ON COLUMN med.ttreb.FK_MOGROUPID is 'Группа мат. отв., которые могут распоряжаться данным требованием из (TMO_GROUP)';
