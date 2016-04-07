CREATE OR REPLACE FUNCTION ASU.SET_CLOB_MULTIVOX (PFK_ID IN NUMBER,
                            PFK_PACID IN NUMBER,
                            PFK_VRACHID IN NUMBER,
                            PFD_NAZ IN DATE,
                            PFC_TYPE IN VARCHAR2,
                            PFK_SMID IN NUMBER,
                            PFK_ISPOLID IN NUMBER,
                            PFK_ROOMID IN NUMBER,
                            PFC_GUID IN VARCHAR2,
                            PFK_NAZSOSID IN NUMBER,
                            STATUS IN VARCHAR2 DEFAULT 'NW')
  RETURN BLOB IS
  chrStatus VARCHAR2(2);
  clTemp BLOB;
  sTmp RAW(32767);
--  idPac NUMBER;
  Fam VARCHAR2(255);
  Im VARCHAR2(255);
  Otch VARCHAR2(255);
  DateBirth VARCHAR2(25);
  PatientSex VARCHAR2(1);
  IsAmbul VARCHAR2(1);

  FamSotr VARCHAR2(255);
  ImSotr VARCHAR2(255);
  OtchSotr VARCHAR2(255);
  OtdelName VARCHAR2(500);
  OtdelId VARCHAR2(15);
  Telefon VARCHAR2(255);

  AdmType VARCHAR2(1);

  GroupRgName VARCHAR2(255);
  idOwner NUMBER;
  Modality VARCHAR2(2);

  IdOtdel NUMBER;
  IspolOtdelName VARCHAR2(500);

  Kabinet VARCHAR2(500);
  
  TypeKart number;

  CURSOR cPac IS SELECT FC_FAM,
                        FC_IM,
                        FC_OTCH,
                        TO_CHAR(FD_ROJD, 'YYYYMMDD') AS DATE_BIRTH,
                        DECODE(FP_SEX, 0, 'F', 1, 'M', -1, 'U') AS PACIENT_SEX,
                        DECODE(ASU.IS_AMBULANCE(PFK_PACID), 1, 'O', 0, 'I') AS IsAmbul,
                        DECODE(asu.is_ambulance(pfk_pacid), 
                               1,
                               (select t2.fk_viddocid from asu.tambulance t1, asu.tdocobsl t2 where t1.fk_docobsl = t2.fk_id and t1.fk_id = pfk_pacid),
                               0,
                               (select fk_uslvidid from asu.tkarta where fk_id = pfk_pacid)) as TypeKart                        
                   FROM ASU.TPEOPLES
                  WHERE FK_ID = ASU.GET_PEPLID(PFK_PACID);
  CURSOR cSotr IS SELECT FC_FAM, FC_NAME, FC_OTCH,
                         (SELECT FC_NAME FROM ASU.TOTDEL WHERE FK_ID = TSOTR.FK_OTDELID) AS OtdelName,
                         FC_TEL,
                         FK_OTDELID
                    FROM ASU.TSOTR
                   WHERE FK_ID = PFK_VRACHID;
  CURSOR cOtdel IS SELECT TOTDEL.FK_ID, TOTDEL.FC_NAME
                     FROM ASU.TOTDEL, ASU.TSOTR
                    WHERE TOTDEL.FK_ID = TSOTR.FK_OTDELID
                      AND TSOTR.FK_ID = PFK_ISPOLID;
  CURSOR cAdmType IS SELECT DECODE(ASU.GET_SYNBYID(FK_SMID), 'REGOSPITAL_PLAN', 'R', 'REGOSPITAL_EXTR', 'E') AS AdmissionType
                       FROM ASU.TIB
                      WHERE FK_PACID = PFK_PACID
                        AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = 'PD_REGOSPITAL'));
  CURSOR cSmid IS SELECT ASU.GET_SMIDNAME(FK_OWNER) AS GroupRgName, FK_OWNER
                    FROM ASU.TSMID
                   WHERE FK_ID = PFK_SMID;
  CURSOR cRoom IS SELECT FC_NAME
                    FROM ASU.TKABINET
                   WHERE FK_ID = PFK_ROOMID;
BEGIN
  chrStatus := STATUS;
  OPEN cPac;
  FETCH cPac INTO Fam, Im, Otch, DateBirth, PatientSex, IsAmbul, TypeKart;
  CLOSE cPac;
  OPEN cSotr;
  FETCH cSotr INTO FamSotr, ImSotr, OtchSotr, OtdelName, Telefon, OtdelId;
  CLOSE cSotr;
  OPEN cOtdel;
  FETCH cOtdel INTO IdOtdel, IspolOtdelName;
  CLOSE cOtdel;
  OPEN cAdmType;
  FETCH cAdmType INTO AdmType;
  CLOSE cAdmType;
  OPEN cSmid;
  FETCH cSmid INTO GroupRgName, idOwner;
  CLOSE cSmid;
  OPEN cRoom;
  FETCH cRoom INTO Kabinet;
  CLOSE cRoom;
  --
  Modality := asu.get_tnazis_mod(PFK_SMID);
  if (Modality is NULL) THEN
    IF idOwner = ASU.GET_XRAY_KT THEN
      Modality := 'CT';
    END IF;
    IF idOwner = ASU.GET_XRAY_MRT THEN
      Modality := 'MR';
    END IF;
    IF idOwner = ASU.GET_XRAY_MAMMOGRAFIA THEN
      Modality := 'MG';
    END IF;
    IF idOwner = ASU.GET_XRAY_OSTEO THEN
      Modality := 'CR';       
    END IF;
    IF (idOwner = ASU.GET_XRAY_GRAF) OR (idOwner = ASU.GET_XRAY_SCOP) OR (idOwner = ASU.GET_XRAY_FLU) THEN
      Modality := 'CR';
    END IF;
    IF idOwner = ASU.GET_ENDOSCOP_ISSL THEN
      Modality := 'ES';
    END IF;
  END IF;
  IF PFK_NAZSOSID = ASU.GET_NAZCANCEL THEN
    chrStatus := 'CA';
  END IF;
  DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
  sTmp := UTL_I18N.string_to_raw('<?xml version="1.0" encoding="windows-1251"?>'||chr(13)||
          '<!--Структура сообщения ORM01-заказ-->'||chr(13)||
          '<ORM_O01 xmlns="urn:hl7-org:v2xml">'||chr(13)||
          '<MSH>'||chr(13)||
          '<MSH.1>|</MSH.1>'||chr(13)||
          '<MSH.2>^`&amp;</MSH.2>'||chr(13)||
          '<MSH.3><HD.1>MIS</HD.1><!--Sending application [O]--></MSH.3>'||chr(13)||
          '<MSH.5><HD.1>RIS</HD.1><!--Receiving application [O]--></MSH.5>'||chr(13)||
          '<MSH.7><TS.1>'||TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')||'</TS.1><!--Время сообщения YYYYMMDDHHMMSS--></MSH.7>'||chr(13)||
          '<MSH.8></MSH.8>'||chr(13)||
          '<MSH.9><MSG.1>ORM</MSG.1><MSG.2>O01</MSG.2><!--Тип сообщения--></MSH.9>'||chr(13)||
          '<MSH.10>'||PFC_GUID||'<!--Уникальный идентификатор сообщения--></MSH.10>'||chr(13)||
          '<MSH.11><PT.1>P</PT.1><!--Processing ID--></MSH.11>'||chr(13)||
          '<MSH.12><VID.1>2.3.1</VID.1><!--Version ID--></MSH.12>'||chr(13)||
          '<MSH.13></MSH.13>'||chr(13)||
          '<MSH.14></MSH.14>'||chr(13)||
          '<MSH.15>NE<!--Accept aknowlegment type [O]--></MSH.15>'||chr(13)||
          '<MSH.16>NE<!--Application aknowlegment type [O]--></MSH.16>'||chr(13)||
          '</MSH>'||chr(13)||
          '<ORM_O01.PATIENT>'||chr(13)||
          '<PID>'||chr(13)||
          '<PID.1>1</PID.1>'||chr(13)||
          '<PID.2><CX.1>'||ASU.GET_IB(PFK_PACID)||'</CX.1><!--Карта пациента-->'||chr(13)||
--          '<CX.5>'||IsAmbul||'<!--Тип карты (идентификатор типа): I для стационарной, O для амбулаторной--></CX.5>'||chr(13)||
          '<CX.5>'||to_char(TypeKart)||'<!--Тип карты (идентификатор)--></CX.5>'||chr(13)||
          '</PID.2>'||chr(13)||
          '<PID.3><CX.1>'||TO_CHAR(PFK_PACID)||'<!--Идентификатор пациента--></CX.1>'||chr(13)||
          '<CX.5>PI</CX.5>'||chr(13)||
          '</PID.3>'||chr(13)||
          '<PID.5><XPN.1><FN.1>'||Fam||'</FN.1></XPN.1><XPN.2>'||Im||'</XPN.2><XPN.3>'||Otch||'</XPN.3></PID.5><!--ФИО пациента-->'||chr(13)||
          '<PID.7><TS.1>'||DateBirth||'</TS.1><!--Дата рождения пациента YYYYMMDD--></PID.7>'||chr(13)||
          '<PID.8>'||PatientSex||'</PID.8><!--Пол пациента: M, F, U-->'||chr(13)||
          '</PID>'||chr(13)||
          '<ORM_O01.PATIENT_VISIT>'||chr(13)||
          '<PV1>'||chr(13)||
          '<PV1.1>1</PV1.1><!--Номер сегмента-->'||chr(13)||
          '<PV1.2>'||IsAmbul||'</PV1.2><!--Класс пациента-->'||chr(13)||
          '<PV1.4>'||AdmType||'</PV1.4><!--Admission Type Should be A for accident, E for emergency, L for labor and delivery and R for routine-->'||chr(13)||
          '<PV1.8>'||chr(13)||
          '<XCN.1>'||TO_CHAR(PFK_VRACHID)||'</XCN.1><!--Код направившего врача-->'||chr(13)||
          '<XCN.2><FN.1>'||FamSotr||'</FN.1></XCN.2><XCN.3>'||ImSotr||'</XCN.3><XCN.4>'||OtchSotr||'</XCN.4>'||chr(13)||
          '</PV1.8>'||chr(13)||
          '<PV1.20><FC.1></FC.1></PV1.20><!--Тип оплаты-->'||chr(13)||
          '</PV1>'||chr(13)||
          '</ORM_O01.PATIENT_VISIT>'||chr(13)||
          '</ORM_O01.PATIENT>'||chr(13)||
          '<ORM_O01.ORCOBRRQDRQ1ODSODTRXONTEDG1OBXNTECTIBLG>'||chr(13)||
          '<ORC>'||chr(13)||
          '<ORC.1>'||chrStatus||'</ORC.1><!--Order control: NW - new order, XO - change order, CA - canceled; SC - status changed-->'||chr(13)||
          '<ORC.2><EI.1>'||TO_CHAR(PFK_ID)||'</EI.1><EI.2>MIS</EI.2><!--Номер у заказчика (уникальный номер исследования в МИС)--></ORC.2>'||chr(13)||
          '<ORC.6>N</ORC.6>'||chr(13)||
          '<!--Response flag. N - Only the MSA segment is returned-->'||chr(13)||
          '<ORC.12><!--ФИО сотрудника, сделавшего заказ (используем того же, что и в PV1.8)-->'||chr(13)||
          '<XCN.1>'||TO_CHAR(PFK_VRACHID)||'</XCN.1><!--Код сотрудника, сделавшего заказ-->'||chr(13)||
          '<XCN.2><FN.1>'||FamSotr||'</FN.1></XCN.2><XCN.3>'||ImSotr||'</XCN.3><XCN.4>'||OtchSotr||'</XCN.4>'||chr(13)||
          '</ORC.12>'||chr(13)||
          '<ORC.13><!--Направившее отделение-->'||chr(13)||
          '<PL.4>'||chr(13)||
          '<HD.1>'||OtdelId||'</HD.1><HD.2>'||OtdelName||'</HD.2>'||chr(13)||
          '</PL.4>'||chr(13)||
          '</ORC.13>'||chr(13)||
          '<ORC.14><XTN.1>'||Telefon||'</XTN.1><!--Телефон для обратной связи с направившим врачом--></ORC.14>'||chr(13)||
          '</ORC>'||chr(13)||
          '<ORM_O01.OBRRQDRQ1ODSODTRXONTEDG1OBXNTE>'||chr(13)||
          '<ORM_O01.OBRRQDRQ1ODSODTRXO>'||chr(13)||
          '<OBR>'||chr(13)||
          '<OBR.1>1</OBR.1><!--Номер сегмента-->'||chr(13)||
          '<OBR.4><CE.1>'||TO_CHAR(PFK_SMID)||'</CE.1><!--Код исследования по справочникам МИС "ОКБ"-->'||chr(13)||
          '<CE.2>'||ASU.GET_NAME_RGISSL(PFK_SMID)||'</CE.2><!--Название исследования/услуги-->'||chr(13)||
          '<CE.4>'||Modality||'</CE.4><!--В поле альтернативного кода исследования передаем модальность-->'||chr(13)||
          '<CE.5>'||GroupRgName||'</CE.5><!--В поле альтернативного названия исследования передаем тип/категорию исследования-->'||chr(13)||
          '</OBR.4>'||chr(13)||
          '<OBR.18>'||PFC_TYPE||'<!--Номер протокола исследования--></OBR.18>'||chr(13)||
          '<OBR.27>'||chr(13)||
          '<TQ.4><TS.1>'||TO_CHAR(PFD_NAZ, 'YYYYMMDDHH24MISS')||'</TS.1><!--Время назначения--></TQ.4>'||chr(13)||
          '<TQ.6>R</TQ.6><!--Приоритет R - routine, S - HIGH, A - MED-->'||chr(13)||
          '</OBR.27>'||chr(13)||
          '<OBR.34><!--Место проведения исследования-->'||chr(13)||
          '<NDL.5>'||Kabinet||'</NDL.5><!--Комната-->'||chr(13)||
          '<NDL.7><HD.1>'||IdOtdel||'</HD.1><HD.2>'||IspolOtdelName||'</HD.2></NDL.7>'||chr(13)||
          '<NDL.10>1</NDL.10><!--Корпус-->'||chr(13)||
          '<NDL.11>1</NDL.11><!--Этаж-->'||chr(13)||
          '</OBR.34>'||chr(13)||
          '</OBR>'||chr(13)||
          '</ORM_O01.OBRRQDRQ1ODSODTRXO>'||chr(13)||
          '</ORM_O01.OBRRQDRQ1ODSODTRXONTEDG1OBXNTE>'||chr(13)||
          '</ORM_O01.ORCOBRRQDRQ1ODSODTRXONTEDG1OBXNTECTIBLG>'||chr(13)||
          '</ORM_O01>', NULL);
  DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sTmp)/2, sTmp);
    RETURN clTemp;
END;
/
