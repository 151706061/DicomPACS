DROP FUNCTION ASU.GET_INSURDOC_ONPAC
/

--
-- GET_INSURDOC_ONPAC  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TPAC_INSURANCE (Table)
--   TTYPEDOC (Table)
--   TINSURDOCS (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_INSURDOC_ONPAC" 
  ( pPacID NUMBER)
  RETURN  VARCHAR2 IS

-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  -------------------------------------------
-- Nefedov S.M. 25.10.2006
    CURSOR cGetInsurInfo IS
        select tinsurdocs.fk_id,
        ttypedoc.fc_name||'  "'||
        tinsurdocs.fc_ser||'  '||tinsurdocs.fc_num||'"' sDocInfo

        from TPAC_INSURANCE, tinsurdocs, ttypedoc
        where FK_PACID = pPacID
        and tinsurdocs.fk_id=TPAC_INSURANCE.fk_insurdocid
        and ttypedoc.fk_id=tinsurdocs.fk_typedocid
        order by TPAC_INSURANCE.fk_id desc;
    sReturn VARCHAR2(100);
    nDocID NUMBER;
    FUNCTION Get_DateInsur (nDocID NUMBER) RETURN VARCHAR2 IS
    CURSOR cGetDate IS
        SELECT tinsurdocs.fd_prolong, tinsurdocs.fd_end from tinsurdocs where fk_id=nDocID;
        dDate1 DATE;
        dDate2 DATE;
    BEGIN
        OPEN cGetDate;
        FETCH cGetDate INTO dDate1, dDate2;
        CLOSE cGetDate;
        if dDate1 > dDate2 then
            RETURN to_char(dDate1,'dd.mm.yyyy');
        else
            RETURN to_char(dDate2,'dd.mm.yyyy');
        END IF;
    END;
BEGIN
    sReturn:='';
    OPEN cGetInsurInfo;
    FETCH cGetInsurInfo INTO nDocID, sReturn;
    CLOSE cGetInsurInfo;
    if length(Get_DateInsur(nDocID)) > 0 then
        sReturn:=sReturn||' Действ. до: '||Get_DateInsur(nDocID);
    end if;
    RETURN sReturn;
END;
/

SHOW ERRORS;


