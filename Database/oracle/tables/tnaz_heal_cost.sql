DROP TABLE ASU.TNAZ_HEAL_COST CASCADE CONSTRAINTS
/

--
-- TNAZ_HEAL_COST  (Table) 
--
CREATE GLOBAL TEMPORARY TABLE ASU.TNAZ_HEAL_COST
(
  FD_CALC            DATE,
  DATE_B_U           DATE,
  DATE_E_U           DATE,
  DATE_B_U_TIME      DATE,
  DATE_E_U_TIME      DATE,
  NAZ_ID             NUMBER(15),
  FK_SMID            NUMBER(15),
  NAZHEAL_HEALID     NUMBER(15),
  ID_ILL_U           NUMBER,
  FK_ISPOLID         NUMBER(15),
  FK_VRACHID         NUMBER(15),
  FK_SOTRID          NUMBER,
  TALON_TYPEDOC_SYN  VARCHAR2(50 BYTE),
  OWN                NUMBER,
  FK_TALONID         NUMBER(15)                 NOT NULL,
  IS_REFUSE          NUMBER,
  FK_PACID           NUMBER(15),
  FK_PEPLID          NUMBER(15),
  FK_INSURDOCS       NUMBER,
  FK_IC_ID           NUMBER(15),
  OWN2_ID            NUMBER(6),
  SMID_ID            INTEGER,
  HEAL_ID            NUMBER(6),
  HEAL_CODE          VARCHAR2(15 BYTE),
  COST_ID            NUMBER,
  COST_DATE1         DATE,
  COST_DATE2         DATE,
  DT_ID              INTEGER,
  DT_DATE1           DATE,
  DT_DATE2           DATE,
  HEAL_TYPEDOC_SYN   VARCHAR2(50 BYTE),
  FN_COST            NUMBER,
  FL_IS_CHLD         NUMBER,
  FC_NAZNAME         VARCHAR2(150 BYTE)
)
ON COMMIT PRESERVE ROWS
NOCACHE
/

COMMENT ON TABLE ASU.TNAZ_HEAL_COST IS '“аблица с промежуточным результатом выборки св€зок назначение-услуга дл€ заполнени€ vnaz_cost Author:Efimov'
/

COMMENT ON COLUMN ASU.TNAZ_HEAL_COST.FC_NAZNAME IS 'Ќазвание назначени€'
/


--
-- I_TNAZ_HEAL_COST_COST  (Index) 
--
--  Dependencies: 
--   TNAZ_HEAL_COST (Table)
--
CREATE INDEX ASU.I_TNAZ_HEAL_COST_COST ON ASU.TNAZ_HEAL_COST
(FN_COST)
/


--
-- I_TNAZ_HEAL_COST_HC  (Index) 
--
--  Dependencies: 
--   TNAZ_HEAL_COST (Table)
--
CREATE INDEX ASU.I_TNAZ_HEAL_COST_HC ON ASU.TNAZ_HEAL_COST
(HEAL_CODE)
/


--
-- I_TNAZ_HEAL_COST_NAZ_ID  (Index) 
--
--  Dependencies: 
--   TNAZ_HEAL_COST (Table)
--
CREATE INDEX ASU.I_TNAZ_HEAL_COST_NAZ_ID ON ASU.TNAZ_HEAL_COST
(NAZ_ID)
/


--
-- I_TNAZ_HEAL_COST_OWN2  (Index) 
--
--  Dependencies: 
--   TNAZ_HEAL_COST (Table)
--
CREATE INDEX ASU.I_TNAZ_HEAL_COST_OWN2 ON ASU.TNAZ_HEAL_COST
(OWN2_ID)
/


--
-- I_TNAZ_HEAL_COST_SMID  (Index) 
--
--  Dependencies: 
--   TNAZ_HEAL_COST (Table)
--
CREATE INDEX ASU.I_TNAZ_HEAL_COST_SMID ON ASU.TNAZ_HEAL_COST
(FK_SMID)
/


