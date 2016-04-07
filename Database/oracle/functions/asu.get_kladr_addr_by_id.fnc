DROP FUNCTION ASU.GET_KLADR_ADDR_BY_ID
/

--
-- GET_KLADR_ADDR_BY_ID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   XMLTYPE (Type)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   SYS_XMLAGG (Function)
--   SYS_XMLAGG (Synonym)
--   TKLADR (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_KLADR_ADDR_BY_ID" (pfk_id    IN TKLADR.FK_ID%TYPE,
                                                pfn_level IN TKLADR.FN_LEVEL%TYPE DEFAULT 0)
 RETURN VARCHAR2 IS
 -- Возвращает строку адреса КЛАДР
 -- Created 20080703 by Linnikov
 gRes         VARCHAR2(1000);
/* gChildrenCNT NUMBER;*/
BEGIN
/* SELECT COUNT(FK_ID) INTO gChildrenCNT FROM TKLADR WHERE FK_OWNER = pfk_id;
 IF gChildrenCNT = 0 THEN
  gChildrenCNT := 2;
 ELSE
  gChildrenCNT := 0;
 END IF;*/
 SELECT SYS_XMLAGG(XMLELEMENT(COL, FC_ADDR || ', ')) .EXTRACT('/ROWSET/COL/text()').GETSTRINGVAL() FC_ADDR
   INTO gRes
   FROM (SELECT FC_PREFIX || '. ' || FC_NAME FC_ADDR
           FROM TKLADR
          WHERE FL_DEL = 0
            AND FN_LEVEL > pfn_level
         CONNECT BY FK_ID = PRIOR FK_OWNER
          START WITH FK_ID = pfk_id
          ORDER BY FN_LEVEL);
 -- RETURN NVL(SUBSTR(gRes, 1, length(gRes) - 2), 'АДРЕС НЕ СУЩЕСТВУЕТ');
/* RETURN SUBSTR(gRes, 1, length(gRes) - gChildrenCNT);*/
 RETURN gRes;
END GET_KLADR_ADDR_BY_ID;
/

SHOW ERRORS;


