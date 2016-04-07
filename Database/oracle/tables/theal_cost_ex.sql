DROP TABLE ASU.THEAL_COST_EX CASCADE CONSTRAINTS
/

--
-- THEAL_COST_EX  (Table) 
--
CREATE GLOBAL TEMPORARY TABLE ASU.THEAL_COST_EX
(
  OWN2_ID           NUMBER(6),
  SMID_ID           INTEGER                     NOT NULL,
  HEAL_ID           NUMBER(6)                   NOT NULL,
  HEAL_CODE         VARCHAR2(15 BYTE),
  COST_ID           NUMBER,
  COST_DATE1        DATE,
  COST_DATE2        DATE,
  DT_ID             INTEGER,
  DT_DATE1          DATE,
  DT_DATE2          DATE,
  HEAL_TYPEDOC_SYN  VARCHAR2(50 BYTE),
  FN_COST           NUMBER,
  FL_IS_CHLD        NUMBER,
  FK_PARENT         INTEGER
)
ON COMMIT PRESERVE ROWS
NOCACHE
/

COMMENT ON TABLE ASU.THEAL_COST_EX IS '“аблица с промежуточным результатом выборки свзок услуга-цена дл€ заполнени€ vnaz_cost Author:Efimov'
/


--
-- I_HEAL_COST_EX  (Index) 
--
--  Dependencies: 
--   THEAL_COST_EX (Table)
--
CREATE INDEX ASU.I_HEAL_COST_EX ON ASU.THEAL_COST_EX
(SMID_ID)
/


--
-- I_HEAL_COST_PARENT  (Index) 
--
--  Dependencies: 
--   THEAL_COST_EX (Table)
--
CREATE INDEX ASU.I_HEAL_COST_PARENT ON ASU.THEAL_COST_EX
(FK_PARENT)
/


