DROP TABLE ASU.TNAZIDTMP CASCADE CONSTRAINTS
/

--
-- TNAZIDTMP  (Table) 
--
CREATE GLOBAL TEMPORARY TABLE ASU.TNAZIDTMP
(
  FK_ID         NUMBER(10),
  FK_NAZID      NUMBER(10),
  FK_EPIKRIZID  NUMBER(10)
)
ON COMMIT PRESERVE ROWS
NOCACHE
/

COMMENT ON TABLE ASU.TNAZIDTMP IS '“аблица идешников назначений, прив€занных к идешникам эпикризам - используетс€ дл€ хранени€ состо€ни€ при редактировании эпикризов'
/

COMMENT ON COLUMN ASU.TNAZIDTMP.FK_NAZID IS 'ID назначени€'
/

COMMENT ON COLUMN ASU.TNAZIDTMP.FK_EPIKRIZID IS 'ID эпикриза'
/


