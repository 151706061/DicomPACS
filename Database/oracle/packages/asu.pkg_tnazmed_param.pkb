DROP PACKAGE BODY ASU.PKG_TNAZMED_PARAM
/

--
-- PKG_TNAZMED_PARAM  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_TNAZMED_PARAM" is


PROCEDURE ADD_TNAZMED_PARAM(
      pfk_tnazmedid IN NUMBER,
      pfl_lgot IN NUMBER,
      pfk_duration IN NUMBER,
      pfk_percent IN NUMBER,
      pfk_paytype IN NUMBER,
      pfk_type IN NUMBER,
      pfc_vrachfio IN VARCHAR2,
      pFK_TSOTRID IN NUMBER,
      pFK_SMDIAGID IN NUMBER)
/*добавление записи в таблицу TNAZMED_PARAM.*/
IS
BEGIN
INSERT INTO TNAZMED_PARAM
  (fk_tnazmedid,
   fl_lgot,
   fk_duration,
   fk_percent,
   fk_paytype,
   fk_type,
   fc_vrachfio,
   FK_TSOTRID,
   FK_SMDIAGID)
  VALUES
  (pfk_tnazmedid,
   pfl_lgot,
   pfk_duration,
   pfk_percent,
   pfk_paytype,
   pfk_type,
   pfc_vrachfio,
   PFK_TSOTRID,
   pFK_SMDIAGID);
END;

PROCEDURE EDIT_TNAZMED_PARAM(
      pfk_tnazmedid IN NUMBER,
      pfl_lgot IN NUMBER,
      pfk_duration IN NUMBER,
      pfk_percent IN NUMBER,
      pfk_paytype IN NUMBER,
      pfk_type IN NUMBER,
      pfc_vrachfio IN VARCHAR2,
      PFK_TSOTRID IN NUMBER,
      pFK_SMDIAGID IN NUMBER)
/*редактирование записи в таблице TNAZMED_PARAM.*/
IS
BEGIN
UPDATE TNAZMED_PARAM
  SET
   fl_lgot = pfl_lgot,
   fk_duration = pfk_duration,
   fk_percent = pfk_percent,
   fk_paytype = pfk_paytype,
   fk_type = pfk_type,
   fc_vrachfio= pfc_vrachfio,
   FK_TSOTRID = PFK_TSOTRID,
   FK_SMDIAGID = pFK_SMDIAGID
  WHERE  fk_tnazmedid = pfk_tnazmedid;
END;

PROCEDURE DEL_TNAZMED_PARAM(pfk_tnazmedid IN NUMBER)
/*удаление записи в таблице TNAZMED_PARAM.*/
IS
BEGIN
  DELETE FROM TNAZMED_PARAM
    WHERE  fk_tnazmedid = pfk_tnazmedid;
END;

FUNCTION GET_FK_OTDELID(pSOTRID IN INTEGER) RETURN INTEGER
 --Возвращает FK_OTDELID для сотрудника pSOTRID
 IS
 vFK_OTDELID INTEGER :=0;
 BEGIN
  SELECT NVL(FK_OTDELID,0)
    INTO vFK_OTDELID
    FROM TSOTR S, TOTDEL O
    WHERE S.FK_ID=pSOTRID
      AND S.FK_OTDELID=O.FK_ID;


 RETURN vFK_OTDELID;

 EXCEPTION
   WHEN NO_DATA_FOUND THEN
     RETURN 0;
 END;

FUNCTION GET_TSMID_FK_ID_FOR_KOD(pFK_PACID IN INTEGER) RETURN INTEGER
 --возвращает TSMID_FK_ID который указывает на запись в TSMID содержащий код категории льготности
 --SELECT T.FK_LOINC_CODE AS FC_LOINC_CODE,T.FC_NAME AS FC_KOD_KATEGORII FROM TSMID t WHERE T.FK_ID=TSMID_FK_ID
 IS
 vTSMID_FK_ID INTEGER :=0;
 BEGIN
  SELECT NVL(TSMID.FK_ID,0)
    INTO vTSMID_FK_ID
    FROM TSMID
    WHERE TSMID.FK_ID in(SELECT TIB.FK_SMID
                         FROM TIB
                         WHERE TIB.FK_PACID in (SELECT TAM.FK_PEPLID
                                                  FROM TAMBULANCE TAM
                                                  WHERE TAM.FK_ID =pFK_PACID
                                               )
                           AND TIB.FK_SMID<>TIB.FK_SMEDITID
                    )
      AND LENGTH(TSMID.FK_LOINC_CODE)=3;

 RETURN vTSMID_FK_ID;

 EXCEPTION
   WHEN NO_DATA_FOUND THEN
     RETURN 0;
 END;

begin
null;
end PKG_TNAZMED_PARAM;
/

SHOW ERRORS;


