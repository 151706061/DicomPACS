DROP PACKAGE BODY ASU.EFFECT
/

--
-- EFFECT  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."EFFECT" 
IS
   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   |
   |     SetnFK_VRACHID
   |
   +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
  PROCEDURE setnfk_vrachid (nValue IN NUMBER)
  IS
  BEGIN
    nfk_vrachid := nValue;
  END;

   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   |
   |     SetnFK_PACID
   |
   +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
  PROCEDURE setnFK_PACID (nValue IN NUMBER)
  IS
  BEGIN
    nFK_PACID := nValue;
  END;

   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   |
   |     get_idbysyndef
   |
   +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
  FUNCTION get_idbysyndef (ssyn IN VARCHAR2, pdefault IN NUMBER)
    RETURN NUMBER   --получает имя синонима по его коду
  IS
    CURSOR c
    IS
      SELECT ts1.fk_id
        FROM tsmid ts1, tsmid ts2
       WHERE ts1.fk_default = pdefault
         AND ts2.fk_id = ts1.fk_owner
         AND ts2.fc_synonim = ssyn;

    nRes   NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO nRes;
    IF c%NOTFOUND THEN
      raise_application_error (
        -20003,
        'Был запрошен код параметра с значением по умолчанию ' || pDefault || ' синонима ' || ssyn || ', но такая запись отсутствует в таблице TSMID.'
      );
    END IF;
    CLOSE c;
    RETURN nRes;
  END;

   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   |
   |     get_default_by_syn
   |
   +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
  FUNCTION get_default_by_syn (ssyn IN VARCHAR2, pFK_NAZID IN NUMBER)
    RETURN NUMBER   -- код пациента или назначения
  IS
    nRes   NUMBER;
  BEGIN
--     raise_application_error(-20002,ssyn);
    SELECT fk_default
      INTO nRes
      FROM tib, tsmid
     WHERE fk_pacid = pFK_NAZID
       AND fk_smeditid = get_synid (ssyn)
       AND tib.fk_smid = tsmid.fk_id;
    RETURN nRes;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RETURN -1;
    WHEN OTHERS THEN
      raise_application_error (SQLCODE, SQLERRM);
      RETURN -1;
  END;

   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   |
   |     get_num_by_syn
   |
   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
  FUNCTION get_num_by_syn (ssyn IN VARCHAR2, nFK_PACID IN NUMBER   -- код пациента или назначения
  )
    RETURN NUMBER
  IS   -- возвращает из комбобоксов fk_default из последнего назначения
    nRes   NUMBER;
  BEGIN
    SELECT fn_num
      INTO nRes
      FROM tib
     WHERE fk_pacid = nFK_PACID
       AND fk_smeditid = get_synid (ssyn);
--      raise_application_error(-20002,ssyn||' '||nFK_PACID);
    RETURN nRes;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RETURN -1;
    WHEN OTHERS THEN
      raise_application_error (SQLCODE, SQLERRM);
      RETURN -1;
  END;

   /******************************************************************************************************************/

   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   |
   |     get_synnazid
   |
   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
  -- получить код назначения результатом котрого является это назначение
  FUNCTION get_synnazid (psyn IN VARCHAR2)
    RETURN NUMBER
  IS
  BEGIN
--      raise_application_error(-20002,psyn);
    IF psyn IN ('EFF_AD_DIAST_PRYB',
             'EFF_AD_DIAST_VYB',
             'EFF_AD_SIST_PRYB',
             'EFF_AD_SIST_VYB',
             'EFF_ANTROP_IDEAL_WEIGHT_PRYB',
             'EFF_ANTROP_IDEAL_WEIGHT_VYB',
             'EFF_ANTROP_WEIGHT_PRYB',
             'EFF_ANTROP_WEIGHT_VYB',
             'EFF_KUR_PRYB',
             'EFF_KUR_VYB'
            ) THEN
      RETURN -1;
    END IF;
    IF psyn IN ('EFF_BIOHIM_SAHAR_PRYB', 'EFF_BIOHIM_SAHAR_VYB') THEN
      RETURN get_synid ('BIOHIM_SAHAR');
    ELSIF psyn IN ('EFF_BIOHIM_ALFHOLESTER_PRYB', 'EFF_BIOHIM_ALFHOLESTER_VYB') THEN
      RETURN get_synid ('BIOHIM_ALFHOLESTER');
    ELSIF psyn IN ('EFF_BIOHIM_HOLESTER_PRYB', 'EFF_BIOHIM_HOLESTER_VYB') THEN
      RETURN get_synid ('BIOHIM_HOLESTER');
    ELSIF psyn IN ('EFF_BIOHIM_TRIGL_PRYB', 'EFF_BIOHIM_TRIGL_VYB') THEN
      RETURN get_synid ('BIOHIM_TRIGL');
    ELSIF psyn IN ('EFF_EKG_GIPERTROF_PRYB',
                'EFF_EKG_ISHEM_PRYB',
                'EFF_EKG_LABIL_PRYB',
                'EFF_EKG_RITM_PRYB',
                'EFF_EKG_GIPERTROF_VYB',
                'EFF_EKG_ISHEM_VYB',
                'EFF_EKG_LABIL_VYB',
                'EFF_EKG_RITM_VYB',
                'EFF_KARD_VEGET_VYB',
                'EFF_KARD_ADAPT_VYB',
                'EFF_KARD_ADAPT_PRYB',
                'EFF_KARD_VEGET_PRYB'
               ) THEN
      RETURN get_synid ('ISSLED_EKG');
    ELSIF psyn IN ('EFF_RESERV_DIH_PRYB',
                'EFF_RESERV_HRONOTROP_PRYB',
                'EFF_RESERV_IMUN_PRYB',
                'EFF_RESERV_INTROP_PRYB',
                'EFF_RESERV_DIH_VYB',
                'EFF_RESERV_HRONOTROP_VYB',
                'EFF_RESERV_IMUN_VYB',
                'EFF_RESERV_INTROP_VYB'
               ) THEN
      RETURN get_synid ('KONS_LFK');
    ELSIF psyn IN ('EFF_VEM_MOSHN_PRYB', 'EFF_VEM_REAK_PRYB', 'EFF_VEM_USE_KISL_PRYB', 'EFF_VEM_REAK_VYB', 'EFF_VEM_MOSHN_VYB', 'EFF_VEM_USE_KISL_VYB') THEN
      RETURN get_synid ('ISSLED_VEM');
--      else
--      return -1;

    END IF;
  END;

   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   |
   |     get_idsynnazid
   |
   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
  FUNCTION get_idsynnazid (pfk_smid IN NUMBER)
    RETURN NUMBER
  IS
  BEGIN
--      raise_application_error(-20002,get_synnazid (get_synbyid (pfk_smid)));
    RETURN get_synnazid (get_synbyid (pfk_smid));
  END;

   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   |
   |     get_ad
   |
   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
  PROCEDURE get_ad (pfk_vid IN NUMBER)
  IS
    CURSOR csist
    IS
      SELECT fn_sisto
        FROM tantrop
       WHERE fk_pacid = nFK_PACID
         AND fk_vid = pfk_vid;

    CURSOR cDIAST
    IS
      SELECT fn_diasto
        FROM tantrop
       WHERE fk_pacid = nFK_PACID
         AND fk_vid = pfk_vid;

    nRes   NUMBER;
    svid   VARCHAR2(5);
  BEGIN
    IF pfk_vid = 0 THEN
      svid := 'PRYB';
    ELSE
      svid := 'VYB';
    END IF;
    OPEN csist;
    FETCH csist INTO nRes;
    CLOSE csist;
    DELETE
      FROM tib
     WHERE fk_smeditid = get_synid ('EFF_AD_SIST_' || svid)
       AND fk_pacid = nFK_PACID;
    INSERT INTO tib (fn_num, fk_pacid, fk_smid, fk_smeditid, fk_vrachid)
         VALUES (nRes, nFK_PACID, get_synid ('EFF_AD_SIST_' || svid), get_synid ('EFF_AD_SIST_' || svid), nfk_vrachid);
    OPEN cDIAST;
    FETCH cDIAST INTO nRes;
    CLOSE cDIAST;
    DELETE
      FROM tib
     WHERE fk_smeditid = get_synid ('EFF_AD_DIAST_' || svid)
       AND fk_pacid = nFK_PACID;
    INSERT INTO tib (fn_num, fk_pacid, fk_smid, fk_smeditid, fk_vrachid)
         VALUES (nRes, nFK_PACID, get_synid ('EFF_AD_DIAST_' || svid), get_synid ('EFF_AD_DIAST_' || svid), nfk_vrachid);
  END;

   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   |
   |     get_vem
   |
   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
  PROCEDURE get_vem (pfk_vid IN NUMBER, pFK_NAZID IN NUMBER)
  IS
    svid    VARCHAR2(5);
    ntemp   NUMBER;
    ndef    NUMBER;
  BEGIN
    IF pfk_vid = 0 THEN
      svid := 'PRYB';
    ELSE
      svid := 'VYB';
    END IF;
    --moshn
    ntemp := get_num_by_syn ('VEM_MOSHN', pFK_NAZID);
    IF ntemp <> -1 THEN
      DELETE
        FROM tib
       WHERE fk_pacid = nFK_PACID
         AND fk_smeditid = get_synid ('EFF_VEM_MOSHN_' || svid);
      INSERT INTO tib (fn_num, fk_pacid, fk_smid, fk_smeditid, fk_vrachid)
           VALUES (ntemp, nFK_PACID, get_synid ('EFF_VEM_MOSHN_' || svid), get_synid ('EFF_VEM_MOSHN_' || svid), nfk_vrachid);
    END IF;
    -- use kisl
    ntemp := get_num_by_syn ('VEM_USE_KISL', pFK_NAZID);
    IF ntemp <> -1 THEN
      DELETE
        FROM tib
       WHERE fk_pacid = nFK_PACID
         AND fk_smeditid = get_synid ('EFF_VEM_USE_KISL_' || svid);
      INSERT INTO tib (fn_num, fk_pacid, fk_smid, fk_smeditid, fk_vrachid)
           VALUES (ntemp, nFK_PACID, get_synid ('EFF_VEM_USE_KISL_' || svid), get_synid ('EFF_VEM_USE_KISL_' || svid), nfk_vrachid);
    -- reak

    END IF;
    ntemp := get_idbysyndef ('EFF_VEM_REAK_' || svid, get_default_by_syn ('VEM_REAK', pFK_NAZID));
    IF ntemp <> -1 THEN
      DELETE
        FROM tib
       WHERE fk_pacid = nFK_PACID
         AND fk_smeditid = get_synid ('EFF_VEM_REAK_' || svid);
      INSERT INTO tib (fk_pacid, fk_smid, fk_smeditid, fk_vrachid)
           VALUES (nFK_PACID, ntemp, get_synid ('EFF_VEM_REAK_' || svid), nfk_vrachid);
    END IF;
  END;

   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   |
   |     get_ekg
   |
   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
  PROCEDURE get_ekg (pfk_vid IN NUMBER, pFK_NAZID IN NUMBER)
  IS
    svid    VARCHAR2(5);
    ntemp   NUMBER;
  BEGIN
    IF pfk_vid = 0 THEN
      svid := 'PRYB';
    ELSE
      svid := 'VYB';
    END IF;
    ntemp := get_idbysyndef ('EFF_EKG_LABIL_' || svid, get_default_by_syn ('EKG_LABIL', pFK_NAZID));
    IF ntemp <> -1 THEN
      INSERT INTO tib (fk_pacid, fk_smid, fk_smeditid, fk_vrachid)
           VALUES (nFK_PACID, ntemp, get_synid ('EFF_EKG_LABIL_' || svid), nfk_vrachid);
    END IF;
    ntemp := get_idbysyndef ('EFF_EKG_ISHEM_' || svid, get_default_by_syn ('EKG_ISHEM', pFK_NAZID));
    IF ntemp <> -1 THEN
      INSERT INTO tib (fk_pacid, fk_smid, fk_smeditid, fk_vrachid)
           VALUES (nFK_PACID, ntemp, get_synid ('EFF_EKG_ISHEM_' || svid), nfk_vrachid);
    END IF;
    ntemp := get_idbysyndef ('EFF_EKG_RITM_' || svid, get_default_by_syn ('EKG_RITM', pFK_NAZID));
    INSERT INTO tib (fk_pacid, fk_smid, fk_smeditid, fk_vrachid)
         VALUES (nFK_PACID, ntemp, get_synid ('EFF_EKG_RITM_' || svid), nfk_vrachid);
    ntemp := get_idbysyndef ('EFF_EKG_GIPERTROF_' || svid, get_default_by_syn ('EKG_GIPERTROF', pFK_NAZID));
    INSERT INTO tib (fk_pacid, fk_smid, fk_smeditid, fk_vrachid)
         VALUES (nFK_PACID, ntemp, get_synid ('EFF_EKG_GIPERTROF_' || svid), nfk_vrachid);
  END;

   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   |
   |     get_kard
   |
   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
  PROCEDURE get_kard (pfk_vid IN NUMBER, pFK_NAZID IN NUMBER)
  IS
    svid    VARCHAR2(5);
    ntemp   NUMBER;
  BEGIN
    IF pfk_vid = 0 THEN
      svid := 'PRYB';
    ELSE
      svid := 'VYB';
    END IF;
    ntemp := get_idbysyndef ('EFF_KARD_VEGET_' || svid, get_default_by_syn ('EKG_KARD_VEGET', pFK_NAZID));
    INSERT INTO tib (fk_pacid, fk_smid, fk_smeditid, fk_vrachid)
         VALUES (nFK_PACID, ntemp, get_synid ('EFF_KARD_VEGET_' || svid), nfk_vrachid);
    ntemp := get_idbysyndef ('EFF_KARD_ADAPT_' || svid, get_default_by_syn ('EKG_KARD_ADAPT', pFK_NAZID));
    INSERT INTO tib (fk_pacid, fk_smid, fk_smeditid, fk_vrachid)
         VALUES (nFK_PACID, ntemp, get_synid ('EFF_KARD_ADAPT_' || svid), nfk_vrachid);
  END;

   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   |
   |     GET_RESERV
   |
   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
  PROCEDURE get_reserv (pfk_vid IN NUMBER, pFK_NAZID IN NUMBER)
  IS
    svid    VARCHAR2(5);
    ntemp   NUMBER;
  BEGIN
    IF pfk_vid = 0 THEN
      svid := 'PRYB';
    ELSE
      svid := 'VYB';
    END IF;
    ntemp := get_idbysyndef ('EFF_RESERV_DIH_' || svid, get_default_by_syn ('LFK_RESERV_DIH', pFK_NAZID));
    INSERT INTO tib (fk_pacid, fk_smid, fk_smeditid, fk_vrachid)
         VALUES (nFK_PACID, ntemp, get_synid ('EFF_RESERV_DIH_' || svid), nfk_vrachid);
    ntemp := get_idbysyndef ('EFF_RESERV_HRONOTROP_' || svid, get_default_by_syn ('LFK_RESERV_HRONOTROP', pFK_NAZID));
    INSERT INTO tib (fk_pacid, fk_smid, fk_smeditid, fk_vrachid)
         VALUES (nFK_PACID, ntemp, get_synid ('EFF_RESERV_HRONOTROP_' || svid), nfk_vrachid);
    ntemp := get_idbysyndef ('EFF_RESERV_IMUN_' || svid, get_default_by_syn ('LFK_RESERV_IMUN', pFK_NAZID));
    INSERT INTO tib (fk_pacid, fk_smid, fk_smeditid, fk_vrachid)
         VALUES (nFK_PACID, ntemp, get_synid ('EFF_RESERV_IMUN_' || svid), nfk_vrachid);
    ntemp := get_idbysyndef ('EFF_RESERV_INTROP_' || svid, get_default_by_syn ('LFK_RESERV_INTROP', pFK_NAZID));
    INSERT INTO tib (fk_pacid, fk_smid, fk_smeditid, fk_vrachid)
         VALUES (nFK_PACID, ntemp, get_synid ('EFF_RESERV_INTROP_' || svid), nfk_vrachid);
  END;

   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   |
   |     GET_antrop
   |
   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
  PROCEDURE get_antrop (pfk_vid IN NUMBER)
  IS
    svid     VARCHAR2(5);
    nves     NUMBER;
    nideal   NUMBER;

    CURSOR cves
    IS
      (SELECT fn_ves, fn_ideal
         FROM tantrop
        WHERE fk_pacid = nFK_PACID
          AND fk_vid = pfk_vid );
  BEGIN
    IF pfk_vid = 0 THEN
      svid := 'PRYB';
    ELSE
      svid := 'VYB';
    END IF;
    OPEN cves;
    FETCH cves INTO nves, nideal;
    CLOSE cves;
    DELETE
      FROM tib
     WHERE fk_pacid = nFK_PACID
       AND fk_smeditid = get_synid ('EFF_ANTROP_WEIGHT_' || svid);
    INSERT INTO tib (fn_num, fk_pacid, fk_smid, fk_smeditid, fk_vrachid)
         VALUES (nves, nFK_PACID, get_synid ('EFF_ANTROP_WEIGHT_' || svid), get_synid ('EFF_ANTROP_WEIGHT_' || svid), nfk_vrachid);
    DELETE
      FROM tib
     WHERE fk_pacid = nFK_PACID
       AND fk_smeditid = get_synid ('EFF_ANTROP_IDEAL_WEIGHT_' || svid);
    INSERT INTO tib (fn_num, fk_pacid, fk_smid, fk_smeditid, fk_vrachid)
         VALUES (nideal, nFK_PACID, get_synid ('EFF_ANTROP_IDEAL_WEIGHT_' || svid), get_synid ('EFF_ANTROP_IDEAL_WEIGHT_' || svid), nfk_vrachid);
  END;

   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   |
   |     GET_KUR
   |
   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
  PROCEDURE get_kur (pfk_vid IN NUMBER)
  IS
    svid    VARCHAR2(5);
    ntemp   NUMBER;
  BEGIN
    IF pfk_vid = 0 THEN
      svid := 'PRYB';
    ELSE
      svid := 'VYB';
    END IF;
--      raise_application_error(-20002,get_default_by_syn ('AGIZN_KUR', nFK_PACID));
    ntemp := get_idbysyndef ('EFF_KUR_' || svid, get_default_by_syn ('AGIZN_KUR', nFK_PACID));
    INSERT INTO tib (fk_pacid, fk_smid, fk_smeditid, fk_vrachid)
         VALUES (nFK_PACID, ntemp, get_synid ('EFF_KUR_' || svid), nfk_vrachid);
  END;

   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   |
   |     get_biohim
   |
   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
  PROCEDURE get_biohim (sSyn IN VARCHAR2, sSynEffect IN VARCHAR2, pFK_NAZID IN NUMBER)
  IS
    nTemp   NUMBER;
  BEGIN
    SELECT fn_res
      INTO nTemp
      FROM tresan
     WHERE fk_nazid = pFK_NAZID
       AND fk_smid = get_synid (sSyn);
    IF nTemp <> -1 THEN
      DELETE
        FROM tib
       WHERE fk_pacid = nFK_PACID
         AND fk_smeditid = get_synid (sSynEffect);
      INSERT INTO tib (fk_pacid, fn_num, fk_smid, fk_smeditid, fk_vrachid)
           VALUES (nFK_PACID, nTemp, get_synid (sSynEffect), get_synid (sSynEffect), nFK_VRACHID);
    END IF;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RETURN;
    WHEN OTHERS THEN
      raise_application_error (SQLCODE, SQLERRM);
  END;

   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   |
   |     get_resbysyn
   |
   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
  PROCEDURE get_resbysyn (ssyn IN VARCHAR2, pFK_NAZID IN NUMBER)
  IS
  BEGIN
    IF ssyn IN ('EFF_AD_DIAST_PRYB', 'EFF_AD_SIST_PRYB') THEN
      get_ad (0);
    ELSIF ssyn IN ('EFF_AD_DIAST_VYB', 'EFF_AD_SIST_VYB') THEN
      get_ad (1);
    ELSIF ssyn IN ('EFF_ANTROP_IDEAL_WEIGHT_PRYB', 'EFF_ANTROP_WEIGHT_PRYB') THEN
      get_antrop (0);
    ELSIF ssyn IN ('EFF_ANTROP_IDEAL_WEIGHT_VYB', 'EFF_ANTROP_WEIGHT_VYB') THEN
      get_antrop (1);
    ELSIF ssyn IN ('EFF_BIOHIM_SAHAR_PRYB', 'EFF_BIOHIM_SAHAR_VYB') THEN
      get_biohim ('BIOHIM_SAHAR', sSyn, pFK_NAZID);
    ELSIF ssyn IN ('EFF_BIOHIM_ALFHOLESTER_PRYB', 'EFF_BIOHIM_ALFHOLESTER_VYB') THEN
      get_biohim ('BIOHIM_ALFHOLESTER', sSyn, pFK_NAZID);
    ELSIF ssyn IN ('EFF_BIOHIM_HOLESTER_PRYB', 'EFF_BIOHIM_HOLESTER_VYB') THEN
      get_biohim ('BIOHIM_HOLESTER', sSyn, pFK_NAZID);
    ELSIF ssyn IN ('EFF_BIOHIM_TRIGL_PRYB', 'EFF_BIOHIM_TRIGL_VYB') THEN
      get_biohim ('BIOHIM_TRIGL', sSyn, pFK_NAZID);
    ELSIF ssyn IN ('EFF_EKG_GIPERTROF_PRYB', 'EFF_EKG_ISHEM_PRYB', 'EFF_EKG_LABIL_PRYB', 'EFF_EKG_RITM_PRYB') THEN
      get_ekg (0, pFK_NAZID);
    ELSIF ssyn IN ('EFF_EKG_GIPERTROF_VYB', 'EFF_EKG_ISHEM_VYB', 'EFF_EKG_LABIL_VYB', 'EFF_EKG_RITM_VYB') THEN
      get_ekg (1, pFK_NAZID);
    ELSIF ssyn IN ('EFF_KARD_ADAPT_PRYB', 'EFF_KARD_VEGET_PRYB') THEN
      get_kard (0, pFK_NAZID);
    ELSIF ssyn IN ('EFF_KARD_VEGET_VYB', 'EFF_KARD_ADAPT_VYB') THEN
      get_kard (1, pFK_NAZID);
    ELSIF ssyn IN ('EFF_KUR_PRYB') THEN
      get_kur (0);
    ELSIF ssyn IN ('EFF_KUR_VYB') THEN
      get_kur (1);
    ELSIF ssyn IN ('EFF_RESERV_DIH_PRYB', 'EFF_RESERV_HRONOTROP_PRYB', 'EFF_RESERV_IMUN_PRYB', 'EFF_RESERV_INTROP_PRYB') THEN
      get_reserv (0, pFK_NAZID);
    ELSIF ssyn IN ('EFF_RESERV_DIH_VYB', 'EFF_RESERV_HRONOTROP_VYB', 'EFF_RESERV_IMUN_VYB', 'EFF_RESERV_INTROP_VYB') THEN
      get_reserv (1, pFK_NAZID);
    ELSIF ssyn IN ('EFF_VEM_MOSHN_PRYB', 'EFF_VEM_REAK_PRYB', 'EFF_VEM_USE_KISL_PRYB') THEN
      get_vem (0, pFK_NAZID);
    ELSIF ssyn IN ('EFF_VEM_REAK_VYB', 'EFF_VEM_MOSHN_VYB', 'EFF_VEM_USE_KISL_VYB') THEN
      get_vem (1, pFK_NAZID);
    END IF;
  END;

   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   |
   |     get_resbysynid
   |
   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
  PROCEDURE get_resbysynid (nsynid IN NUMBER, pFK_NAZID IN NUMBER)
  IS
  BEGIN
    get_resbysyn (get_synbyid (nsynid), pFK_NAZID);
  END;

   /******************************************************************************************************************/
   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   |
   |     test_ad_sist
   |
   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
  PROCEDURE test_ad_sist (pfk_vid IN INTEGER)
  IS
    ngr    INTEGER;
    nage   INTEGER;
    ad     INTEGER;
  BEGIN
    ngr := 0;
    nage := TRUNC (get_pacageonvyb (nFK_PACID));
    IF pfk_vid = 1 THEN
      ad := get_num_by_syn ('EFF_AD_SIST_VYB', nFK_PACID);
    ELSE
      ad := get_num_by_syn ('EFF_AD_SIST_PRYB', nFK_PACID);
    END IF;
--      raise_application_error(-20002,ad);
    IF nage <= 60 THEN
      IF     (ad >= 110)
         AND (ad <= 139) THEN
        ngr := 1;
      ELSIF     (ad >= 140)
            AND (ad <= 159) THEN
        ngr := 2;
      ELSIF     (ad >= 160)
            AND (ad <= 179) THEN
        ngr := 3;
      ELSIF (ad >= 180) THEN
        ngr := 4;
      END IF;
    END IF;
    IF nage >= 61 THEN
      IF     (ad >= 120)
         AND (ad <= 149) THEN
        ngr := 1;
      ELSIF     (ad >= 150)
            AND (ad <= 169) THEN
        ngr := 2;
      ELSIF     (ad >= 170)
            AND (ad <= 189) THEN
        ngr := 3;
      ELSIF (ad >= 190) THEN
        ngr := 4;
      END IF;
    END IF;
    UPDATE teffect
       SET fn_ad_sist = ngr
     WHERE fk_pacid = nFK_PACID
       AND fp_vid = pfk_vid;
  END;

   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   |
   |   test_ad_diast
   |
   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
  PROCEDURE test_ad_diast (pfk_vid IN INTEGER)
  IS
    ngr    INTEGER;
    nage   INTEGER;
    ad     INTEGER;
  BEGIN
    ngr := 0;
    nage := TRUNC (get_pacageonvyb (nFK_PACID));
    IF pfk_vid = 1 THEN
      ad := get_num_by_syn ('EFF_AD_DIAST_VYB', nFK_PACID);
    ELSE
      ad := get_num_by_syn ('EFF_AD_DIAST_PRYB', nFK_PACID);
    END IF;
    IF nage <= 60 THEN
      IF     (ad >= 70)
         AND (ad <= 84) THEN
        ngr := 1;
      ELSIF     (ad >= 85)
            AND (ad <= 94) THEN
        ngr := 2;
      ELSIF     (ad >= 95)
            AND (ad <= 104) THEN
        ngr := 3;
      ELSIF (ad >= 105) THEN
        ngr := 4;
      END IF;
    END IF;
    IF nage >= 61 THEN
      IF     (ad >= 75)
         AND (ad <= 89) THEN
        ngr := 1;
      ELSIF     (ad >= 90)
            AND (ad <= 99) THEN
        ngr := 2;
      ELSIF     (ad >= 100)
            AND (ad <= 108) THEN
        ngr := 3;
      ELSIF (ad >= 109) THEN
        ngr := 4;
      END IF;
    END IF;
    UPDATE teffect
       SET fn_ad_DIST = ngr
     WHERE fk_pacid = nFK_PACID
       AND fp_vid = pfk_vid;
  END;

   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   |
   |   test_biohim
   |
   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
  PROCEDURE test_biohim (pfk_vid IN INTEGER)   -- 0 - прибытие, 1 - выписка
  IS
    nValcount   INTEGER    := 0;   -- кол-во не нулевых значений
    nVal        NUMBER     := 0;   -- переменная для значение
    nValsum     NUMBER;   -- сумма значений для подсчета среднего арифметического
    sVid        VARCHAR(4);

    FUNCTION test_sugar (nVal IN NUMBER)
      RETURN NUMBER
    IS
    BEGIN
      IF nVal <= 6.1 THEN
        RETURN 1;
      ELSIF nVal <= 7.17 THEN
        RETURN 2;
      ELSIF nVal <= 8.22 THEN
        RETURN 3;
      ELSE
        RETURN 4;
      END IF;
    END;

    FUNCTION test_holesterin (nVal IN NUMBER)
      RETURN NUMBER
    IS
    BEGIN
      IF nVal <= 5.69 THEN
        RETURN 1;
      ELSIF nVal <= 6.73 THEN
        RETURN 2;
      ELSIF nVal <= 7.77 THEN
        RETURN 3;
      ELSE
        RETURN 4;
      END IF;
    END;

    FUNCTION test_alpha_holesterin (nVal IN NUMBER)
      RETURN NUMBER
    IS
    BEGIN
      IF nVal <= -1.85 THEN
        RETURN 1;
      ELSIF nVal <= -0.9 THEN
        RETURN 2;
      ELSIF nVal <= -0.51 THEN
        RETURN 3;
      ELSE
        RETURN 4;
      END IF;
    END;

    FUNCTION test_trigl (nVal IN NUMBER)
      RETURN NUMBER
    IS
    BEGIN
      IF nVal <= 1.70 THEN
        RETURN 1;
      ELSIF nVal <= 2.27 THEN
        RETURN 2;
      ELSIF nVal <= 2.84 THEN
        RETURN 3;
      ELSE
        RETURN 4;
      END IF;
    END;
  BEGIN
    IF pFK_VID = 0 THEN
      sVid := 'PRYB';
    ELSE
      sVid := 'VYB';
    END IF;
    nValCount := 0;
    nValSum := 0;
    -- сахар
    nVal := test_sugar (get_num_by_syn ('EFF_BIOHIM_SAHAR_' || sVid, nFK_PACID));
    IF nVal <> -1 THEN
      nValCount := nValCount + 1;
      nValSum := nValSum + nVal;
    END IF;
    -- ХОЛЕСТЕРИН
    nVal := test_holesterin (get_num_by_syn ('EFF_BIOHIM_HOLESTER_' || sVid, nFK_PACID));
    IF nVal <> -1 THEN
      nValCount := nValCount + 1;
      nValSum := nValSum + nVal;
    END IF;
    --альфа холестерин
    nVal := test_alpha_holesterin (get_num_by_syn ('EFF_BIOHIM_ALFHOLESTER_' || sVid, nFK_PACID));
    IF nVal <> -1 THEN
      nValCount := nValCount + 1;
      nValSum := nValSum + nVal;
    END IF;
    --триглецериды
    nVal := test_trigl (get_num_by_syn ('EFF_BIOHIM_TRIGL_' || sVid, nFK_PACID));
    IF nVal <> -1 THEN
      nValCount := nValCount + 1;
      nValSum := nValSum + nVal;
    END IF;
    IF nValCount > 0 THEN
--        raise_application_error(-20002,nValSum||' '||nValCount);
      UPDATE teffect
         SET fn_biohim = nValSum / nValCount
       WHERE fk_pacid = nFK_PACID
         AND fp_vid = pfk_vid;
    END IF;
  END;

   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   |
   |    TEST_VEM
   |
   +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
  PROCEDURE test_vem (pfk_vid IN INTEGER)
  IS
    nValcount   INTEGER     := 0;   -- кол-во не нулевых значений
    nVal        NUMBER      := 0;   -- переменная для значение
    nValsum     NUMBER;   -- сумма значений для подсчета среднего арифметического
    svid        VARCHAR2(5);

    FUNCTION test_pick_nagr (nVal IN NUMBER)
      RETURN NUMBER
    IS
      ngr    INTEGER;
      nv     INTEGER;
      nage   NUMBER;
    BEGIN
      ngr := 0;
      nv := nVal * 6.12;
      nage := get_pacageonvyb (nFK_PACID);
      IF get_sex (nFK_PACID) = 1 THEN   -- для мужчин
        IF nage < 40 THEN
          IF nv < 450 THEN
            ngr := 4;
          ELSIF nv < 750 THEN
            ngr := 3;
          ELSIF nv < 1000 THEN
            ngr := 2;
          ELSIF nv >= 1000 THEN
            ngr := 1;
          END IF;
        END IF;
        IF nage BETWEEN 41 AND 50 THEN
          IF nv < 300 THEN
            ngr := 4;
          ELSIF nv < 600 THEN
            ngr := 3;
          ELSIF nv < 900 THEN
            ngr := 2;
          ELSIF nv >= 900 THEN
            ngr := 1;
          END IF;
        END IF;
        IF nage >= 50 THEN
          IF nv < 150 THEN
            ngr := 4;
          ELSIF nv < 450 THEN
            ngr := 3;
          ELSIF nv < 750 THEN
            ngr := 2;
          ELSIF nv >= 750 THEN
            ngr := 1;
          END IF;
        END IF;
      END IF;
      IF get_sex (nFK_PACID) = 0 THEN
        IF nage < 40 THEN
          IF nv < 450 THEN
            ngr := 4;
          ELSIF nv < 600 THEN
            ngr := 3;
          ELSIF nv < 900 THEN
            ngr := 2;
          ELSIF nv >= 900 THEN
            ngr := 1;
          END IF;
        END IF;
        IF nage BETWEEN 41 AND 50 THEN
          IF nv < 300 THEN
            ngr := 4;
          ELSIF nv < 450 THEN
            ngr := 3;
          ELSIF nv < 750 THEN
            ngr := 2;
          ELSIF nv >= 750 THEN
            ngr := 1;
          END IF;
        END IF;
        IF nage >= 50 THEN
          IF nv < 150 THEN
            ngr := 4;
          ELSIF nv < 300 THEN
            ngr := 3;
          ELSIF nv < 600 THEN
            ngr := 2;
          ELSIF nv >= 600 THEN
            ngr := 1;
          END IF;
        END IF;
      END IF;
      RETURN ngr;
    END;

    FUNCTION test_use_kisl (nVal IN NUMBER)
      RETURN NUMBER
    IS
      ngr   INTEGER;
    BEGIN
      ngr := 0;
      IF get_sex (nFK_PACID) = 1 THEN   -- для мужчин
        IF nVal < 14 THEN
          ngr := 4;
        ELSIF nVal < 21.5 THEN
          ngr := 3;
        ELSIF nVal < 30 THEN
          ngr := 2;
        ELSIF nVal >= 30 THEN
          ngr := 1;
        END IF;
      END IF;
      IF get_sex (nFK_PACID) = 0 THEN   --для женщин
        IF nVal < 14 THEN
          ngr := 4;
        ELSIF nVal < 21.5 THEN
          ngr := 3;
        ELSIF nVal < 26 THEN
          ngr := 2;
        ELSIF nVal >= 26 THEN
          ngr := 1;
        END IF;
      END IF;
      RETURN ngr;
    END;
  BEGIN
    IF pfk_vid = 0 THEN
      svid := 'PRYB';
    ELSE
      svid := 'VYB';
    END IF;
    -- тест мощности пороговой нагрузки
    nValCount := 0;
    nValSum := 0;
    nVal := get_num_by_syn ('EFF_VEM_MOSHN_' || svid, nFK_PACID);
    IF     nVal <> 0
       AND nVal IS NOT NULL THEN
      nValcount := nValcount + 1;
      nValsum := nValsum + test_pick_nagr (nVal);
    END IF;
    -- тест потребления кислорода
    nVal := get_num_by_syn ('EFF_VEM_USE_KISL_' || svid, nFK_PACID);
    IF     nVal <> 0
       AND nVal IS NOT NULL THEN
      nValcount := nValcount + 1;
      nValsum := nValsum + test_use_kisl (nVal);
    END IF;
    -- тест реакции на физ нагрузку
    nVal := get_default_by_syn ('EFF_VEM_REAK_' || svid, nFK_PACID);
    IF     nVal <> 0
       AND nVal IS NOT NULL THEN
      nValcount := nValcount + 1;
      nValsum := nValsum + nVal;
    END IF;
    IF nValcount <> 0 THEN
      UPDATE teffect
         SET fn_vem = nValsum / nValcount
       WHERE fk_pacid = nFK_PACID
         AND fp_vid = pfk_vid;
    END IF;
  END;   -- велоэргометрия

   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   |
   |   test_ekg
   |
   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
  PROCEDURE test_ekg (pfk_vid IN INTEGER)   -- электрокардиограмма
  IS
    nVal        INTEGER     := 0;
    nValcount   INTEGER     := 0;
    nValsum     INTEGER     := 0;
    svid        VARCHAR2(5);
  BEGIN
    nValcount := 0;
    nValsum := 0;
    IF pfk_vid = 0 THEN
      svid := 'PRYB';
    ELSE
      svid := 'VYB';
    END IF;
    -- лабильность ЭКГ
    nVal := get_default_by_syn ('EFF_EKG_LABIL_' || svid, nFK_PACID);
    IF nVal IS NOT NULL THEN
      nValsum := nValsum + nVal;
      nValcount := nValcount + 1;
    END IF;
    -- нарушение ритма роводимости ЭКГ
    nVal := get_default_by_syn ('EFF_EKG_RITM_' || svid, nFK_PACID);
    IF nVal IS NOT NULL THEN
      nValsum := nValsum + nVal;
      nValcount := nValcount + 1;
    END IF;
    -- признаки гипертрофии ЭКГ
    nVal := get_default_by_syn ('EFF_EKG_GIPERTROF_' || svid, nFK_PACID);
    IF nVal IS NOT NULL THEN
      nValsum := nValsum + nVal;
      nValcount := nValcount + 1;
    END IF;
    IF nValcount <> 0 THEN
      UPDATE teffect
         SET fn_ekg = nValsum / nValcount
       WHERE fk_pacid = nFK_PACID
         AND fp_vid = pfk_vid;
    END IF;
  END;

   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   |
   |     test_kard
   |
   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
  PROCEDURE test_kard (pfk_vid IN NUMBER)   -- данные интервала кардиометрии
  IS
    nValadapt   INTEGER;
    nValveget   INTEGER;
    nage        INTEGER;
    nRes        INTEGER;
    svid        VARCHAR2(5);
  BEGIN
    IF pfk_vid = 0 THEN
      svid := 'PRYB';
    ELSE
      svid := 'VYB';
    END IF;
    -- вегетативный статус
    nValveget := get_default_by_syn ('EFF_KARD_VEGET_' || svid, nFK_PACID);
    -- состяние процессов адаптации
    nValadapt := get_default_by_syn ('EFF_KARD_VEGET_' || svid, nFK_PACID);
    -- расчет результата
    IF nValveget IS NOT NULL THEN
      nage := TRUNC (get_pacageonvyb (nFK_PACID));
      IF     nage > 40
         AND nValveget = 2 THEN
        nValveget := 3;
      END IF;
      IF nValadapt IS NULL THEN
        nRes := nValveget;
      END IF;
    ELSIF nValadapt IS NOT NULL THEN
      nRes := nValadapt;
    END IF;
    IF     nValveget IS NOT NULL
       AND nValadapt IS NOT NULL THEN
      nRes := (nValveget + nValadapt) / 2;
    END IF;
    IF     nValveget IS NULL
       AND nValadapt IS NULL THEN
      nRes := -1;
    END IF;
    UPDATE teffect
       SET fn_kard = nRes
     WHERE fk_pacid = nFK_PACID
       AND fp_vid = pfk_vid;
  END;

   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   |
   |   test_res
   |
   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
  PROCEDURE test_res (pfk_vid IN NUMBER)   -- резервы организма
  IS
    nVal        NUMBER      := 0;
    nValsum     NUMBER      := 0;
    nValcount   NUMBER      := 0;
    sVid        VARCHAR2(5);
  BEGIN
    IF pfk_vid = 0 THEN
      sVid := 'PRYB';
    ELSE
      sVid := 'VYB';
    END IF;
    nVal := get_default_by_syn ('EFF_RESERV_DIH_' || sVid, nFK_PACID);
    IF nVal IS NOT NULL THEN
      nValsum := nValsum + nVal;
      nValcount := nValcount + 1;
    END IF;
    nVal := get_default_by_syn ('EFF_RESERV_HRONOTROP_' || sVid, nFK_PACID);
    IF nVal IS NOT NULL THEN
      nValsum := nValsum + nVal;
      nValcount := nValcount + 1;
    END IF;
    nVal := get_default_by_syn ('EFF_RESERV_IMUN_' || sVid, nFK_PACID);
    IF nVal IS NOT NULL THEN
      nValsum := nValsum + nVal;
      nValcount := nValcount + 1;
    END IF;
    nVal := get_default_by_syn ('EFF_RESERV_INTROP_' || sVid, nFK_PACID);
    IF nVal IS NOT NULL THEN
      nValsum := nValsum + nVal;
      nValcount := nValcount + 1;
    END IF;
    IF nValcount <> 0 THEN
      UPDATE teffect
         SET fn_reserv = nValsum / nValcount
       WHERE fk_pacid = nFK_PACID
         AND fp_vid = pfk_vid;
    END IF;
  END;

   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   |
   |   test_weight
   |
   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
  PROCEDURE test_weight (pfk_vid IN NUMBER)   -- антропометрические данные
  IS
    nweight        NUMBER;
    nweightideal   NUMBER;
    nc             NUMBER;
    ngr            NUMBER;
  BEGIN
    IF pfk_vid = 0 THEN
      nweight := get_num_by_syn ('EFF_ANTROP_WEIGHT_PRYB', nFK_PACID);
      nweightideal := get_num_by_syn ('EFF_ANTROP_IDEAL_WEIGHT_PRYB', nFK_PACID);
    ELSE
      nweight := get_num_by_syn ('EFF_ANTROP_WEIGHT_VYB', nFK_PACID);
      nweightideal := get_num_by_syn ('EFF_ANTROP_IDEAL_WEIGHT_VYB', nFK_PACID);
    END IF;
    IF nweightideal <> 0 THEN
      nc := ROUND (nweight / nweightideal * 100);
    ELSE
      UPDATE teffect
         SET fn_antrop = -1
       WHERE fk_pacid = nFK_PACID
         AND fp_vid = pfk_vid;
      RETURN;
    END IF;
    ngr := -1;
    IF nc < 15 THEN
      ngr := 1;
    ELSIF nc < 30 THEN
      ngr := 2;
    ELSIF nc < 50 THEN
      ngr := 3;
    ELSIF nc >= 50 THEN
      ngr := 4;
    END IF;
    UPDATE teffect
       SET fn_antrop = ngr
     WHERE fk_pacid = nFK_PACID
       AND fp_vid = pfk_vid;
  END;

   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   |
   |   test_kur
   |
   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
  PROCEDURE test_kur (pfk_vid IN NUMBER)   -- курение
  IS
    nRes   NUMBER;
  BEGIN
    IF pfk_vid = 0 THEN
      nRes := get_default_by_syn ('EFF_KUR_PRYB', nFK_PACID);
    ELSE
      nRes := get_default_by_syn ('EFF_KUR_VYB', nFK_PACID);
    END IF;
    IF nRes IS NULL THEN
      nRes := -1;
    END IF;
    UPDATE teffect
       SET fn_kur = nRes
     WHERE fk_pacid = nFK_PACID
       AND fp_vid = pfk_vid;
  END;

   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   |
   |   TEST_FIS_AKT
   |
   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
  PROCEDURE test_fis_akt (pfk_vid IN NUMBER)   -- курение
  IS
  BEGIN
    NULL;
  END;

 /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 |
 |      proceed
 |
 /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
  PROCEDURE proceed (pfk_vid IN NUMBER)
  IS
  BEGIN
    DELETE
      FROM teffect
     WHERE fk_pacid = nFK_PACID
       AND fp_vid = pfk_vid;
    INSERT INTO teffect (fk_pacid, fp_vid)
         VALUES (nFK_PACID, pfk_vid);
    test_ad_sist (pfk_vid);
    test_ad_diast (pfk_vid);
    test_biohim (pfk_vid);
    test_vem (pfk_vid);
    test_ekg (pfk_vid);
    test_kard (pfk_vid);
    test_res (pfk_vid);
    test_weight (pfk_vid);
    test_kur (pfk_vid);
/*     test_fis_akt (pfk_vid);*/

  END;

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
|
|      proceed_all
|
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
  PROCEDURE proceed_all (pFK_PACID IN NUMBER, pFK_VRACHID IN NUMBER)
  IS
  BEGIN
    nFK_PACID := pFK_PACID;
    nFK_VRACHID := pFK_VRACHID;
    proceed (0);
    proceed (1);
  END;
END;   -- Package Body EFFEFCT
/

SHOW ERRORS;


