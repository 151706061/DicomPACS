DROP PACKAGE BODY ASU.PKG_FAMILY
/

--
-- PKG_FAMILY  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_FAMILY" 
IS
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  ------------------------------------------      
-- Nefedov S.M. 04.10.2006  Created package

   -- Возвращает родителя ---------------------------------------
   FUNCTION Get_MainPeoplID
     ( pPeoplID IN NUMBER) RETURN NUMBER IS
     CURSOR cGetFGroup IS
     SELECT FK_ID, FK_PEOPLID, FK_LEVEL, FN_FAMILYGROUP FROM tpac_family WHERE FK_PeoplID=pPeoplID;
     CURSOR cGet (nGroup IN NUMBER, nLevel IN NUMBER) IS
     select FK_PEOPLID from tpac_family where fn_FamilyGroup = nGroup and FK_LEVEL < nLevel ORDER BY FK_LEVEL DESC;
     nFGrup NUMBER;
     nResult NUMBER;
     BEGIN
        nResult:=0;
        FOR c IN cGetFGroup LOOP
            OPEN cGet (c.FN_FAMILYGROUP, c.FK_LEVEL);
            FETCH cGet INTO nResult;
            CLOSE cGet;
        END LOOP;
        RETURN nResult;
     END;

   -- Возвращает ребенка ----------------------------------------
   FUNCTION Get_ChildPeopleID
     ( pPeoplID IN NUMBER) RETURN NUMBER IS
     CURSOR cGetFGroup IS
     SELECT FK_ID, FK_PEOPLID, FK_LEVEL, FN_FAMILYGROUP FROM tpac_family WHERE FK_PeoplID=pPeoplID;
     CURSOR cGet (nGroup IN NUMBER, nLevel IN NUMBER) IS
     select FK_PEOPLID from tpac_family where fn_FamilyGroup = nGroup and FK_LEVEL > nLevel ORDER BY FK_LEVEL;
     nFGrup NUMBER;
     nResult NUMBER;
     BEGIN
        nResult:=0;
        FOR c IN cGetFGroup LOOP
            OPEN cGet (c.FN_FAMILYGROUP, c.FK_LEVEL);
            FETCH cGet INTO nResult;
            CLOSE cGet;
        END LOOP;
        RETURN nResult;
     END;

    -- Возвращает 1 если ребенок --------------------------------
    FUNCTION IS_Child
     ( pPeoplID IN NUMBER) RETURN NUMBER IS
     CURSOR cGetDateRojd IS
     SELECT FD_ROJD FROM TPEOPLES WHERE FK_ID=pPeoplID;
     dDate DATE;
     nVozr NUMBER;
     BEGIN
        OPEN cGetDateRojd;
        FETCH cGetDateRojd INTO dDate;
        CLOSE cGetDateRojd;

        --nVozr:= (SYSDATE-TO_DATE(dDate))/365;
        nVozr:= MONTHS_BETWEEN(SYSDATE,dDate)/12;
        IF nVozr <= asu.CHILD_AGE THEN
            RETURN 1;
        ELSE
            RETURN 0;
        END IF;
     END;
     
    -- Возвращает 1 если мама ------------------------------------
    FUNCTION IS_Mother
     ( pPeoplID IN NUMBER) RETURN NUMBER IS
     CURSOR cGetSex IS
     SELECT FP_SEX FROM TPEOPLES WHERE FK_ID=pPeoplID;
     nSex NUMBER;
     BEGIN
        OPEN cGetSex;
        FETCH cGetSex INTO nSex;
        CLOSE cGetSex;
        -- Если есть ребёнок
        IF IS_Child(Get_ChildPeopleID(pPeoplID)) = 1 THEN
            RETURN 1;
        ELSE
            RETURN 0;
        END IF;
     END;
     
    -- Возвращает возраст пипла (лет) -----------------------------
    FUNCTION Get_Age
     ( pPeoplID IN NUMBER) RETURN NUMBER IS
     CURSOR cGetDateRojd IS
     SELECT FD_ROJD FROM TPEOPLES WHERE FK_ID=pPeoplID;
     dDate DATE;
     nVozr NUMBER;
     BEGIN
        OPEN cGetDateRojd;
        FETCH cGetDateRojd INTO dDate;
        CLOSE cGetDateRojd;
        nVozr:= TRUNC(MONTHS_BETWEEN(SYSDATE,dDate)/12);
        RETURN nVozr;
     END;
     
    -- Возвращает фамилию семьи -----------------------------------
     FUNCTION Get_FamilyName
     ( pGroupFamily IN NUMBER) RETURN VARCHAR2 IS
     CURSOR cGetFamily IS
     SELECT DECODE( UPPER(SUBSTR(tpeoples.fc_fam,LENGTH(tpeoples.fc_fam),1))
        , 'А', UPPER(SUBSTR(tpeoples.fc_fam,1,LENGTH(tpeoples.fc_fam)-1))||'Ы'
        , 'О', UPPER(SUBSTR(tpeoples.fc_fam,1,LENGTH(tpeoples.fc_fam)))||'ВЫ'
        , UPPER(tpeoples.fc_fam)||'Ы') sName
        from tpac_family, tpeoples
        where FN_FAMILYGROUP = pGroupFamily and FK_LEVEL =
        (select min(FK_LEVEL) from tpac_family
        where FN_FAMILYGROUP = pGroupFamily)
        and tpac_family.fk_peoplid=tpeoples.fk_id
        order by tpeoples.fp_sex desc;
        sName VARCHAR2 (200);
     BEGIN
        sName:='';
        OPEN cGetFamily;
        FETCH cGetFamily INTO sName;
        CLOSE cGetFamily;
        RETURN sName;
     END;
     
    -- Возвращает код семьи ---------------------------------------
     FUNCTION Get_FamilyID
     ( pPeoplID IN NUMBER) RETURN NUMBER IS
     CURSOR cGetFamilyID IS
     SELECT FN_FAMILYGROUP from tpac_family WHERE fk_peoplid = pPeoplID;
     nID NUMBER;
     BEGIN
        nID:=0;
        OPEN cGetFamilyID;
        FETCH cGetFamilyID INTO nID;
        CLOSE cGetFamilyID;
        RETURN nID;
     END;
     
    -- Возвращает уровень в семье ------------------------------------
     FUNCTION Get_LevelPeoplID
     ( pPeoplID IN NUMBER) RETURN NUMBER IS
     CURSOR cGetLevel IS
     SELECT FK_LEVEL from tpac_family WHERE fk_peoplid = pPeoplID;
     nLevel NUMBER;
     BEGIN
        nLevel:=0;
        OPEN cGetLevel;
        FETCH cGetLevel INTO nLevel;
        CLOSE cGetLevel;
        RETURN nLevel;
     END;
END;
/

SHOW ERRORS;


