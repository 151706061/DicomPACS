DROP PACKAGE BODY ASU.PKG_LABORATORY
/

--
-- PKG_LABORATORY  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_LABORATORY" 
IS
/*----------------------------------------------------------------------------*/
  FUNCTION is_can_view (pfk_smid IN NUMBER, pfk_sotr IN NUMBER)
    RETURN NUMBER
  IS
    pn_return NUMBER;

/*    CURSOR c
    IS
      SELECT DECODE (COUNT (1), 0, 0, 1)
        FROM tlab_anal_dostyp tl, (SELECT     fk_id
                                         FROM tsmid
                                        WHERE fl_showanal = 2
                                   START WITH fk_id = pfk_smid
                                   CONNECT BY PRIOR fk_id = fk_owner) ts
       WHERE tl.fk_smid = ts.fk_id AND tl.fk_sotr = pfk_sotr;*/  -- Commented by Kosov 04.05.2010
  BEGIN
    /*OPEN c;

    FETCH c
     INTO pn_return;

    CLOSE c;*/  -- Commented by Kosov 04.05.2010
    pn_return := 1;  -- Added by Kosov 04.05.2010
    RETURN pn_return;
  END;

/*----------------------------------------------------------------------------*/
 /* PROCEDURE set_lab_anal_dostyp (pfk_smid IN NUMBER, pfk_sotr IN NUMBER)
  IS
  BEGIN
    IF is_can_view (pfk_smid, pfk_sotr) = 0
    THEN
      INSERT INTO tlab_anal_dostyp
        (SELECT     fk_id, pfk_sotr
               FROM tsmid
              WHERE fl_showanal = 2
         START WITH fk_id = pfk_smid
         CONNECT BY PRIOR fk_id = fk_owner);
    ELSE
      DELETE FROM tlab_anal_dostyp
            WHERE fk_sotr = pfk_sotr AND fk_smid IN (SELECT     fk_id
                                                           FROM tsmid
                                                          WHERE fl_showanal = 2
                                                     START WITH fk_id = pfk_smid
                                                     CONNECT BY PRIOR fk_id = fk_owner);
    END IF;
  END;*/  -- Commented by Kosov 04.05.2010
/*----------------------------------------------------------------------------*/
  FUNCTION IS_CAN_APPOINT
          (pfk_smid in NUMBER)
    RETURN NUMBER
    IS
    pn_return NUMBER;
    BEGIN
    select count(1)
      into pn_return
      from TLAB_REAGENT
     where fk_smid = pfk_smid;
    return pn_return;
    END;
/*----------------------------------------------------------------------------*/
  PROCEDURE SET_LAB_REAGENT
           (pfk_smid in NUMBER,
            pfc_comment in VARCHAR2,
            pfl_sign in NUMBER)
  IS
  pn_val NUMBER;
  BEGIN
  select count(1)
    into pn_val
    FROM TLAB_REAGENT
   WHERE fk_smid = pfk_smid;
  IF pn_val = 0 then
    INSERT INTO TLAB_REAGENT ( fk_smid,  fc_comment)
                      VALUES (pfk_smid, pfc_comment);
  elsif pfl_sign = 0 then
    DELETE FROM TLAB_REAGENT WHERE fk_smid = pfk_smid;
  else
    UPDATE TLAB_REAGENT
       SET fc_comment = pfc_comment
     where fk_smid = pfk_smid;
  end if;

  END;
/*----------------------------------------------------------------------------*/
  FUNCTION IS_SOTR_HAVE_DOSTYP
          (pfk_sotr in NUMBER,
           pfc_synonym in VARCHAR2)
    RETURN NUMBER
  IS
  pn_return NUMBER;
  BEGIN
    /*select count(1) into pn_return
      from tlab_vrach_dostyp
     where FC_LAB_SPR_DOSTYP = pfc_synonym
       and FK_SOTR = pfk_sotr;*/  -- Commented by Kosov 04.05.2010
    pn_return := 1;  -- Added by Kosov 04.05.2010
    return pn_return;
  END;
/*----------------------------------------------------------------------------*/
END;
/

SHOW ERRORS;


