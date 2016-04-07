-- Start of DDL Script for Package Body ASU.PKG_SIGNATURE
-- Generated 17.09.2010 17:00:33 from ASU@N100422

CREATE OR REPLACE 
PACKAGE       asu.pkg_signature IS
 -- ¬Õ»Ã¿Õ»≈!!!
 -- Ã≈Õﬂ“‹ —œ≈÷»‘» ¿÷»ﬁ ›“Œ√Œ œ¿ ≈“¿ Õ≈À‹«ﬂ
 -- Àﬁ¡Œ≈ »«Ã≈Õ≈Õ»≈ Œ—“¿ÕŒ¬»“ –¿¡Œ“” ÃŒƒ”Àﬂ ›÷œ
 -- ≈—À» Œ“ –€À Ì‡ Â‰‡ÍÚËÓ‚‡ÌËÂ - «¿ –Œ…, Õ≈ —Œ’–¿Õﬂﬂ!!!!!! Ë ÓÚÍÓÈ ‰Îˇ ÔÓÒÏÓÚ‡.
 -- Created  20090806 by Linnikov

 -----------------------------------------------------------------------------------------
 FUNCTION GET_DIAG_DATA(pfk_diag IN asu.tdiag.fk_id%TYPE) RETURN VARCHAR2;
 -----------------------------------------------------------------------------------------
 /* FUNCTION SIGN_DATA(pfk_link_id  IN NUMBER,
                     pfc_sinature IN VARCHAR2,
                     pfk_sotr_id  IN login.tsotr.fk_id%TYPE,
                     pfc_table    IN VARCHAR2) RETURN NUMBER;
 */
 -----------------------------------------------------------------------------------------
 FUNCTION SIGN_ANY_DATA(pfk_sql_ruleid  IN asu.tsign_sql_rules.fk_id%TYPE,
                        pfk_maintableid IN asu.tdigital_signature.fk_maintableid%TYPE,
                        pfk_key         IN asu.tpublic_key.fk_id%TYPE,
                        pfc_signature   IN asu.tdigital_signature.fc_signature%TYPE,
                        pfk_peopleid    IN asu.tpeoples.fk_id%TYPE) RETURN NUMBER;
 -----------------------------------------------------------------------------------------
 FUNCTION SIGN_ANY_DATA_BY_SOTR(pfk_sql_ruleid  IN asu.tsign_sql_rules.fk_id%TYPE,
                                pfk_maintableid IN asu.tdigital_signature.fk_maintableid%TYPE,
                                pfk_key         IN asu.tpublic_key.fk_id%TYPE,
                                pfc_signature   IN asu.tdigital_signature.fc_signature%TYPE,
                                pfk_sotrid      IN login.tsotr.fk_id%TYPE) RETURN NUMBER;
 -----------------------------------------------------------------------------------------
 FUNCTION GET_DATA_BY_SQL_ID(pfk_sql_ruleid  IN asu.tsign_sql_rules.fk_id%TYPE,
                             pfk_maintableid IN asu.tdigital_signature.fk_maintableid%TYPE)
  RETURN VARCHAR2;
 -----------------------------------------------------------------------------------------
 FUNCTION GET_LOB_DATA_BY_SQL_ID(pfk_sql_ruleid  IN asu.tsign_sql_rules.fk_id%TYPE,
                                 pfk_maintableid IN asu.tdigital_signature.fk_maintableid%TYPE)
  RETURN CLOB;
 -----------------------------------------------------------------------------------------
 FUNCTION GET_RULEID_BY_TABLENAME(pfc_table IN asu.tsign_sql_rules.fc_table%TYPE)
  RETURN NUMBER;
 -----------------------------------------------------------------------------------------
 FUNCTION GET_SIGNID_BY_TABLE_AND_ID(pfc_table IN asu.tsign_sql_rules.fc_table%TYPE,
                                     pfk_id    IN NUMBER)
  RETURN asu.tdigital_signature.fk_id%TYPE;
 -----------------------------------------------------------------------------------------
 FUNCTION GET_SIGNED_SOTR(pfc_table IN asu.tsign_sql_rules.fc_table%TYPE, pfk_id IN NUMBER)
  RETURN asu.tdigital_signature.FK_SOTRID%TYPE;
 -----------------------------------------------------------------------------------------
 FUNCTION GET_SIGNED_PEOPLE(pfc_table IN asu.tsign_sql_rules.fc_table%TYPE,
                            pfk_id    IN NUMBER) RETURN asu.tdigital_signature.FK_SOTRID%TYPE;

END;
/


CREATE OR REPLACE 
PACKAGE BODY       asu.pkg_signature IS
 -- ¬Õ»Ã¿Õ»≈!!!
 -- Ã≈Õﬂ“‹ “≈ÀŒ ›“Œ√Œ œ¿ ≈“¿ Õ≈À‹«ﬂ
 -- Àﬁ¡Œ≈ »«Ã≈Õ≈Õ»≈ Œ—“¿ÕŒ¬»“ –¿¡Œ“” ÃŒƒ”Àﬂ ›÷œ
 -- ≈—À» Œ“ –€À ›“Œ“ œ¿ ≈“ Õ¿ –≈ƒ¿ “»–Œ¬¿Õ»≈ - «¿ –Œ… Ë ÓÚÍÓÈ ‰Îˇ ÔÓÒÏÓÚ‡.
 -- Created  20090806 by Linnikov

 -----------------------------------------------------------------------------------------
 FUNCTION GET_DIAG_DATA(pfk_diag IN asu.tdiag.fk_id%TYPE) RETURN VARCHAR2 IS
  lTmp VARCHAR2(4000);
 BEGIN
  SELECT fk_id || '&' || fk_pacid || '&' || fk_smdiagid || '&' || fp_type || '&' || fl_first || '&' ||
         fc_write || '&' || to_char(fd_date, 'DD.MM.YYYY') || '&' || fk_vrachid || '&' ||
         fl_main || '&' || fl_showib || '&' || fk_nazid || '&' || fk_mkb_10 || '&' ||
         fn_podt
    INTO lTmp
    FROM asu.tdiag
   WHERE fk_id = pfk_diag;
  RETURN(lTmp);
 END;
 -----------------------------------------------------------------------------------------
 /* FUNCTION SIGN_DATA(pfk_link_id  IN NUMBER,
                    pfc_sinature IN VARCHAR2,
                    pfk_sotr_id  IN login.tsotr.fk_id%TYPE,
                    pfc_table    IN VARCHAR2) RETURN NUMBER IS
  lTmp NUMBER;
 BEGIN
  INSERT INTO asu.TSIGN_MEDDATA p
   (FK_LINK_ID, FD_DATE, FC_SIGNATURE, FK_SOTR_ID, FC_TABLE)
  VALUES
   (pfk_link_id, SYSDATE, pfc_sinature, pfk_sotr_id, pfc_table)
  RETURNING fk_id INTO lTmp;
  RETURN(lTmp);
 END;
 */
 -----------------------------------------------------------------------------------------
 FUNCTION SIGN_ANY_DATA(pfk_sql_ruleid  IN asu.tsign_sql_rules.fk_id%TYPE,
                        pfk_maintableid IN asu.tdigital_signature.fk_maintableid%TYPE,
                        pfk_key         IN asu.tpublic_key.fk_id%TYPE,
                        pfc_signature   IN asu.tdigital_signature.fc_signature%TYPE,
                        pfk_peopleid    IN asu.tpeoples.fk_id%TYPE) RETURN NUMBER IS
  lTmp NUMBER;
 BEGIN
  INSERT INTO asu.tdigital_signature s
   (FK_SQL_RULEID, FK_MAINTABLEID, FD_DATE, FK_KEYID, FC_SIGNATURE, FK_PEOPLEID)
  VALUES
   (pfk_sql_ruleid, pfk_maintableid, SYSDATE, pfk_key, pfc_signature, pfk_peopleid)
  RETURNING fk_id INTO lTmp;
  RETURN(lTmp);
 END;
 -----------------------------------------------------------------------------------------
 FUNCTION SIGN_ANY_DATA_BY_SOTR(pfk_sql_ruleid  IN asu.tsign_sql_rules.fk_id%TYPE,
                                pfk_maintableid IN asu.tdigital_signature.fk_maintableid%TYPE,
                                pfk_key         IN asu.tpublic_key.fk_id%TYPE,
                                pfc_signature   IN asu.tdigital_signature.fc_signature%TYPE,
                                pfk_sotrid      IN login.tsotr.fk_id%TYPE) RETURN NUMBER IS
  lPeopleID ASU.TPEOPLES.FK_ID%TYPE;
  lTmp      NUMBER;
 BEGIN
  SELECT MAX(fk_peplid) INTO lPeopleID FROM login.tsotr WHERE fk_id = pfk_sotrid;
  INSERT INTO asu.tdigital_signature s
   (FK_SQL_RULEID, FK_MAINTABLEID, FD_DATE, FK_KEYID, FC_SIGNATURE, FK_PEOPLEID, FK_SOTRID)
  VALUES
   (pfk_sql_ruleid, pfk_maintableid, SYSDATE, pfk_key, pfc_signature, lPeopleID, pfk_sotrid)
  RETURNING fk_id INTO lTmp;
  RETURN(lTmp);
 END;
 -----------------------------------------------------------------------------------------
 FUNCTION GET_DATA_BY_SQL_ID(pfk_sql_ruleid  IN asu.tsign_sql_rules.fk_id%TYPE,
                             pfk_maintableid IN asu.tdigital_signature.fk_maintableid%TYPE)
  RETURN VARCHAR2 IS
  vResult VARCHAR2(4000);
  vSql    asu.tsign_sql_rules.fc_sql%TYPE;
 BEGIN
  SELECT fc_sql INTO vSql FROM asu.tsign_sql_rules WHERE fk_id = pfk_sql_ruleid;

  vSql := REPLACE(vSql, ':pfk_id', pfk_maintableid);
  EXECUTE IMMEDIATE vSql
  INTO vResult;
  --  USING pfk_maintableid;

  RETURN(vResult);
 END;
 -----------------------------------------------------------------------------------------
 FUNCTION GET_LOB_DATA_BY_SQL_ID(pfk_sql_ruleid  IN asu.tsign_sql_rules.fk_id%TYPE,
                                 pfk_maintableid IN asu.tdigital_signature.fk_maintableid%TYPE)
  RETURN CLOB IS
  vResult CLOB;
  vSql    asu.tsign_sql_rules.fc_sql%TYPE;
 BEGIN
  SELECT fc_sql INTO vSql FROM asu.tsign_sql_rules WHERE fk_id = pfk_sql_ruleid;

  vSql := REPLACE(vSql, ':pfk_id', pfk_maintableid);
  EXECUTE IMMEDIATE vSql
  INTO vResult;
  --  USING pfk_maintableid;

  RETURN(vResult);
 END;
 -----------------------------------------------------------------------------------------
 FUNCTION GET_RULEID_BY_TABLENAME(pfc_table IN asu.tsign_sql_rules.fc_table%TYPE)
  RETURN NUMBER IS
  nRes NUMBER;
 BEGIN
  SELECT MAX(fk_id)
    INTO nRes
    FROM asu.tsign_sql_rules
   WHERE upper(fc_table) = upper(pfc_table);
  RETURN nRes;
 END;
 -----------------------------------------------------------------------------------------
 FUNCTION GET_SIGNID_BY_TABLE_AND_ID(pfc_table IN asu.tsign_sql_rules.fc_table%TYPE,
                                     pfk_id    IN NUMBER)
  RETURN asu.tdigital_signature.fk_id%TYPE IS
  nRes asu.tdigital_signature.fk_id%TYPE;
 BEGIN
  SELECT MAX(fk_id)
    INTO nRes
    FROM asu.tdigital_signature
   WHERE fk_sql_ruleid = GET_RULEID_BY_TABLENAME(pfc_table)
     AND fk_maintableid = pfk_id;
  RETURN nRes;
 END;
 -----------------------------------------------------------------------------------------
 FUNCTION GET_SIGNED_SOTR(pfc_table IN asu.tsign_sql_rules.fc_table%TYPE, pfk_id IN NUMBER)
  RETURN asu.tdigital_signature.fk_sotrid%TYPE IS
  nRes asu.tdigital_signature.fk_sotrid%TYPE;
 BEGIN
  SELECT MAX(fk_sotrid)
    INTO nRes
    FROM asu.tdigital_signature
   WHERE fk_id = GET_SIGNID_BY_TABLE_AND_ID(pfc_table, pfk_id);
  RETURN nRes;
 END;
 -----------------------------------------------------------------------------------------
 FUNCTION GET_SIGNED_PEOPLE(pfc_table IN asu.tsign_sql_rules.fc_table%TYPE,
                            pfk_id    IN NUMBER) RETURN asu.tdigital_signature.fk_sotrid%TYPE IS
  nRes asu.tdigital_signature.fk_sotrid%TYPE;
 BEGIN
  SELECT MAX(fk_peopleid)
    INTO nRes
    FROM asu.tdigital_signature
   WHERE fk_id = GET_SIGNID_BY_TABLE_AND_ID(pfc_table, pfk_id);
  RETURN nRes;
 END;
 -----------------------------------------------------------------------------------------
END;
/


-- End of DDL Script for Package Body ASU.PKG_SIGNATURE

