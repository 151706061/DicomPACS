DROP PACKAGE ASU.PKG_NAZN
/

--
-- PKG_NAZN  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_NAZN" 
  IS
--

  PROCEDURE Del_Nazn(p_FK_ID in Integer);
--  PROCEDURE Create_PROC_Result(p_NAZN_ID in integer);
  procedure Add_NAZN_BY_Template(p_Pac_ID in Integer,p_DOC_ID IN Integer
    , p_Templ_ID IN Integer, p_Creator_ID IN INTEGER);

  PROCEDURE Create_PROC_Receptions(p_RECEPTION_ID in integer);
  -- Если кратность не задана, то возвращает нормальную маску кратности '1' - ежедневное
  -- Author: Ura
  FUNCTION Get_RECEPTION_KratnMask(p_RECEPTION_ID IN INTEGER) RETURN Varchar;
  PRAGMA RESTRICT_REFERENCES(Get_RECEPTION_KratnMask,WNDS,WNPS);

  FUNCTION Get_RECEPTION_Description(p_SMID_ID IN INTEGER, p_RECEPTION_ID IN INTEGER ) RETURN VARCHAR;
  PRAGMA RESTRICT_REFERENCES(Get_RECEPTION_Description,WNDS,WNPS);
  -- Возвращает описание назначения по первому приему
  FUNCTION GET_NAZN_DESCR_BY_RECEPT(p_NAZN_ID IN INTEGER,p_SMID_ID IN INTEGER) RETURN VARCHAR;
  PRAGMA RESTRICT_REFERENCES(GET_NAZN_DESCR_BY_RECEPT,WNDS,WNPS);

  PROCEDURE CALC_STATUS_ON_NAZN;
  PROCEDURE add_recept_to_list(p_recept INTEGER);
  PROCEDURE init_Recept_Table;
END; -- Package spec
/

SHOW ERRORS;


