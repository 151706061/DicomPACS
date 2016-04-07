DROP FUNCTION ASU.GET_PEPLDOC
/

--
-- GET_PEPLDOC  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TVIDDOC (Table)
--   TPEOPLES (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PEPLDOC" (pFK_PEPLID NUMBER) RETURN VARCHAR AS
  /*
   Created by Spasskiy S.N 21082008
   Возвращает строку с документом удостоверяющим личность
  */
  vTmp VARCHAR2(4000);
BEGIN
  FOR C IN (SELECT D.FC_NAME,
                   P.FC_DOCSER,
                   P.FC_DOCNUM,
                   TO_CHAR(P.FD_DOCDATE, 'DD.MM.YYYY') FD_DOCDATE,
                   p.fc_docvidan
              FROM ASU.TPEOPLES P, ASU.TVIDDOC D
             WHERE P.FK_DOCVID = D.FK_ID(+)
               AND p.fk_id = pFK_PEPLID) LOOP
    vTmp := c.fc_name;
    IF c.fc_docser IS NOT NULL THEN
      vTmp := vTmp || ' Серия: ' || c.fc_docser;
    END IF;
    IF c.fc_docnum IS NOT NULL THEN
      vTmp := vTmp || ' №: ' || c.fc_docnum;
    END IF;
    IF c.fd_docdate IS NOT NULL THEN
      vTmp := vTmp || ' Дата выдачи: ' || c.fd_docdate || ' г.';
    END IF;
    IF c.fc_docvidan IS NOT NULL THEN
      vTmp := vTmp || ' Выдан: ' || c.fc_docvidan;
    END IF;
  END LOOP;
  RETURN vtmp;
END;
/

SHOW ERRORS;


