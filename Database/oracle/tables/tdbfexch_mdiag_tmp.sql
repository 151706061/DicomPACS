DROP TABLE ASU.TDBFEXCH_MDIAG_TMP CASCADE CONSTRAINTS
/

--
-- TDBFEXCH_MDIAG_TMP  (Table) 
--
CREATE GLOBAL TEMPORARY TABLE ASU.TDBFEXCH_MDIAG_TMP
(
  FC_KOD  VARCHAR2(10 BYTE)                     NOT NULL
)
ON COMMIT PRESERVE ROWS
NOCACHE
/

COMMENT ON TABLE ASU.TDBFEXCH_MDIAG_TMP IS 'Коды диагнозов, которые будут отнесены к выгрузке, в процессе текущей всгрузки Author:Efimov'
/

COMMENT ON COLUMN ASU.TDBFEXCH_MDIAG_TMP.FC_KOD IS 'Код диагноза, который будет отнесён к модернизации в процессе текущей выгрузки'
/


--
-- I_DBFEXCH_MDIAG_TMP_KOD  (Index) 
--
--  Dependencies: 
--   TDBFEXCH_MDIAG_TMP (Table)
--
CREATE UNIQUE INDEX ASU.I_DBFEXCH_MDIAG_TMP_KOD ON ASU.TDBFEXCH_MDIAG_TMP
(FC_KOD)
/


