DROP TABLE ASU.TUSLVID_DS CASCADE CONSTRAINTS
/

--
-- TUSLVID_DS  (Table) 
--
CREATE GLOBAL TEMPORARY TABLE ASU.TUSLVID_DS
(
  FK_ID  NUMBER(9)
)
ON COMMIT PRESERVE ROWS
NOCACHE
/

COMMENT ON TABLE ASU.TUSLVID_DS IS 'Временная таблица, ID всех документов обслуживания, относящихся в ДС, используется при расчёте тарифов в стационаре'
/

COMMENT ON COLUMN ASU.TUSLVID_DS.FK_ID IS 'ASU.TUSLVID.FK_ID'
/


--
-- I_USLVID_DS_ID  (Index) 
--
--  Dependencies: 
--   TUSLVID_DS (Table)
--
CREATE INDEX ASU.I_USLVID_DS_ID ON ASU.TUSLVID_DS
(FK_ID)
/


