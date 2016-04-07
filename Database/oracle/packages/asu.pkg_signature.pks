DROP PACKAGE ASU.PKG_SIGNATURE
/

--
-- PKG_SIGNATURE  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TDIAG (Table)
--   TPEOPLES (Table)
--   TSIGN_SQL_RULES (Table)
--   TSOTR (Table)
--   TDIGITAL_SIGNATURE (Table)
--   TPUBLIC_KEY (Table)
--
CREATE OR REPLACE PACKAGE ASU.pkg_signature IS
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

SHOW ERRORS;


