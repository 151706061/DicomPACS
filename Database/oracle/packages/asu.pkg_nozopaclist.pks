DROP PACKAGE ASU.PKG_NOZOPACLIST
/

--
-- PKG_NOZOPACLIST  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_NOZOPACLIST" IS

  -- Список пациентов данного врача
  FUNCTION get_pacforvrach(pVrachID IN NUMBER, pSort IN NUMBER) RETURN CLOB;
  -- Список пациентов данного врача с подписанной ИБ
  FUNCTION get_doneibforvrach(pVrachID IN NUMBER, pSort IN NUMBER) RETURN CLOB;
  -- Список пациентов данного врача выписанных регистратурой
  FUNCTION get_vipisforvrach(pVrachID IN NUMBER, pSort IN NUMBER) RETURN CLOB;

  -- Список пациентов c конкретной эффективностью лечения
  FUNCTION get_paceffectforvrach(pVrachID IN NUMBER, pEffect IN NUMBER, pSort IN NUMBER) RETURN CLOB;

  -- Список пациентов которым данный врач-специалист ставил какой-либо диагноз
  FUNCTION get_pacwithanydiagofvrach(pVrachID IN NUMBER, pSort IN NUMBER) RETURN CLOB;
  -- Список пациентов которым данный врач-специалист ставил диагноз определенного типа
  FUNCTION get_pacwithtypeddiagofvrach(pVrachID IN NUMBER, pType IN NUMBER, pSort IN NUMBER) RETURN CLOB;
  -- Список диагнозов, которые пациенту поставил врач-специалист
  FUNCTION get_pacdiagsofvrach(pVrachID IN NUMBER, pPacID IN NUMBER) RETURN CLOB;
  -- Список диагнозов определенного типа, которые пациенту поставил врач-специалист
  FUNCTION get_pacdiagsofvrachwithtype(pVrachID IN NUMBER, pPacID IN NUMBER, pType IN NUMBER) RETURN CLOB;
END;
/

SHOW ERRORS;


