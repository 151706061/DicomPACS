-- Start of DDL Script for Package Body MED.PKGTDOCS
-- Generated 4-мар-2011 11:56:33 from MED@H100609

CREATE OR REPLACE 
PACKAGE     med.pkgtdocs is

  -- Author  : DELPHI5
  -- Created : 08.11.2006 13:11:26
  -- Purpose : ДЛЯ ТАБЛИЦЫ TDOCS

-- Ф-ия возвращает: значение поля fl_edit
FUNCTION GET_FL_EDIT(pDPID IN NUMBER) RETURN NUMBER;

-- функция фозвращает текст с причиной списания. В любом неверном случае вернется пустая строка.
  FUNCTION GET_SPISANIE_SIMPLE_DESCR ( pFP_VID        IN NUMBER,
                                       pFP_VIDMOVE     IN NUMBER
     ) RETURN VARCHAR2;
-- возвращает название получателя с учетом типа документа.
-- Настоятельно рекомендуется использовать ее во всех отчетах и формах,
-- поскольку это способствует централизованному управлению отображением документов.
   FUNCTION GET_DOC_DESTINATION ( pDocVid IN NUMBER, pDocVidMove  IN NUMBER, pMO_GROUP_TOID IN NUMBER,  pPostavID IN NUMBER) RETURN VARCHAR2;

-- возвращает название поставщика с учетом типа документа.
-- Настоятельно рекомендуется использовать ее во всех отчетах и формах,
-- поскольку это способствует централизованному управлению отображением документов.
  FUNCTION GET_DOC_SOURCE ( pDocVid IN NUMBER, pDocVidMove  IN NUMBER, pMO_GROUP_FROMID IN NUMBER,  pPostavID IN NUMBER  ) RETURN VARCHAR2;
  FUNCTION GET_SPISANIE_DETAIL_DESCR ( pFP_VID         IN NUMBER,
                                       pFP_VIDMOVE     IN NUMBER,
                                       pFN_SPISANIEVID IN NUMBER,
                                       pMOGROUPID_TO   IN NUMBER
     ) RETURN VARCHAR2;
  FUNCTION GET_SPISANIE_DESCR ( pFP_VID         IN NUMBER,
                                pFP_VIDMOVE     IN NUMBER,
                                pFN_SPISANIEVID IN NUMBER,
                                pMOGROUPID_TO   IN NUMBER
     ) RETURN VARCHAR2;
  PROCEDURE SET_FL_EDIT(pDPID IN NUMBER, pFL_EDIT IN NUMBER DEFAULT 0);
  procedure SaveDoc_Date_Num( aDPID IN NUMBER, aDate IN DATE, aNum VARCHAR2);
  procedure UpdateAutoNumCounter( aCounterID IN NUMBER, aNum IN NUMBER);
end PKGTDOCS;
/


CREATE OR REPLACE 
PACKAGE BODY     med.pkgtdocs is

FUNCTION GET_FL_EDIT(pDPID IN NUMBER) RETURN NUMBER
/* Ф-ия возвращает: значение поля fl_edit*/
IS
 vFL_EDIT NUMBER :=0;
BEGIN
SELECT
    FL_EDIT
  INTO
    vFL_EDIT
  FROM TDOCS
  WHERE DPID=pDPID;

RETURN vFL_EDIT;

  EXCEPTION
    WHEN NO_DATA_FOUND THEN
     RETURN 0;
END;
-- устанавливаем подпись (по умолчанию подписываем)
PROCEDURE SET_FL_EDIT(pDPID IN NUMBER, pFL_EDIT IN NUMBER DEFAULT 0) IS
BEGIN
  UPDATE MED.TDOCS D SET D.FL_EDIT = pFL_EDIT
  WHERE D.DPID=pDPID;
END;

-- функция фозвращает текст с причиной списания. В любом неверном случае вернется пустая строка.
   FUNCTION GET_SPISANIE_SIMPLE_DESCR ( pFP_VID         IN NUMBER,
                                        pFP_VIDMOVE     IN NUMBER
     ) RETURN VARCHAR2
   IS
   BEGIN
      IF (pFP_VID = 3)AND(pFP_VIDMOVE = 8) THEN -- обычное списание - ищем причину списания
        RETURN 'Списание';
      ELSIF (pFP_VID = 3)AND(pFP_VIDMOVE = 7) THEN -- это спиасние в РПО, так и пишем
        RETURN 'Списание на производство РПО';
      ELSIF (pFP_VID = 3)AND(pFP_VIDMOVE = 11) THEN -- это возврат поставщику
        RETURN 'Возврат поставщику';
      ELSE
        RETURN '';  -- это хз что
      END IF;

      EXCEPTION
          WHEN NO_DATA_FOUND THEN RETURN '';
          WHEN OTHERS THEN RAISE;
   END;

-- для совсемтимости со старыми отчетами
   FUNCTION GET_SPISANIE_DESCR ( pFP_VID         IN NUMBER,
                                 pFP_VIDMOVE     IN NUMBER,
                                 pFN_SPISANIEVID IN NUMBER,
                                 pMOGROUPID_TO   IN NUMBER
     ) RETURN VARCHAR2
   IS
   BEGIN
     RETURN GET_SPISANIE_SIMPLE_DESCR ( pFP_VID, pFP_VIDMOVE);
   END;

-- функция фозвращает текст с причиной списания. В любом неверном случае вернется пустая строка.
   FUNCTION GET_SPISANIE_DETAIL_DESCR ( pFP_VID         IN NUMBER,
                                        pFP_VIDMOVE     IN NUMBER,
                                        pFN_SPISANIEVID IN NUMBER,
                                        pMOGROUPID_TO   IN NUMBER
     ) RETURN VARCHAR2
   IS
      SpisanieDescr VARCHAR2(100) := '';
   BEGIN
      IF (pFP_VID = 3)AND(pFP_VIDMOVE = 8) THEN -- обычное списание - ищем причину списания
-- если списание нужно детализировать, то расскоментить этот участок
        IF pFN_SPISANIEVID = 1 THEN
          SELECT MAX(SV.fc_name)
          INTO   SpisanieDescr
          FROM   MED.TSPISANIEVID SV
          WHERE (SV.fk_id = pMOGROUPID_TO) AND (SV.fl_del = 0) AND (SV.fn_doctype = pFP_VIDMOVE);
          if SpisanieDescr is not null then SpisanieDescr := ': '||SpisanieDescr; end if;
          RETURN 'по причине'||SpisanieDescr;
        ELSIF pFN_SPISANIEVID = 2 THEN
          SELECT MAX(FC_NAME) as fc_group
          INTO SpisanieDescr
          FROM ASU.TOTDEL
          where LEVEL = (SELECT MAX(LEVEL) FROM ASU.TOTDEL START WITH UPPER(FC_NAME) = 'СТАЦИОНАРНЫЕ' CONNECT BY PRIOR fk_id = FK_OWNERID) AND fk_id = pMOGROUPID_TO
          START WITH FC_NAME = 'СТАЦИОНАРНЫЕ'
          CONNECT BY PRIOR fk_id = FK_OWNERID;

          if SpisanieDescr is not null then SpisanieDescr := ': '||SpisanieDescr; end if;
          RETURN 'на отделение'||SpisanieDescr;
        ELSIF pFN_SPISANIEVID = 3 THEN
          select MAX(k.fc_fam ||
             DECODE(k.fc_im,
                    NULL,
                    '',
                    ' ' || SUBSTR(k.fc_im, 1, 1) || '.' ||
                    DECODE(k.fc_otch,
                           NULL,
                           '',
                           ' ' || SUBSTR(k.fc_otch, 1, 1) || '.')) ) as fc_group
          into SpisanieDescr
          from asu.tkarta k
          WHERE k.fk_id = pMOGROUPID_TO;
          if SpisanieDescr is not null then SpisanieDescr := ': '||SpisanieDescr; end if;
          RETURN 'на пациента'||SpisanieDescr;
        ELSIF pFN_SPISANIEVID = 6 THEN
          select MAX(a.fc_fam ||
             DECODE(a.fc_im,
                    NULL,
                    '',
                    ' ' || SUBSTR(a.fc_im, 1, 1) || '.' ||
                    DECODE(a.fc_otch,
                           NULL,
                           '',
                           ' ' || SUBSTR(a.fc_otch, 1, 1) || '.')) ) as fc_group
          into SpisanieDescr
          from asu.tambtalon t, asu.tambulance a
          WHERE t.fk_id = pMOGROUPID_TO
            AND t.fk_ambid = a.fk_id;
          if SpisanieDescr is not null then SpisanieDescr := ': '||SpisanieDescr; end if;
          RETURN 'на амб. талон'||SpisanieDescr;
        ELSE
          RETURN '';  -- это хз что
        END IF;
        RETURN 'Списание';
      ELSIF (pFP_VID = 3)AND(pFP_VIDMOVE = 7) THEN -- это спиасние в РПО, так и пишем
        RETURN 'на производство в РПО';
      ELSIF (pFP_VID = 3)AND(pFP_VIDMOVE = 14) THEN -- списнаие по высоким технологиям
          SELECT MAX(SV.fc_name)
          INTO   SpisanieDescr
          FROM   MED.TSPISANIEVID SV
          WHERE (SV.fk_id = pMOGROUPID_TO) AND (SV.fl_del = 0) AND (SV.fn_doctype = pFP_VIDMOVE);
          if SpisanieDescr is not null then SpisanieDescr := ': '||SpisanieDescr; end if;
          RETURN 'Вид помощи'||SpisanieDescr;
      ELSIF (pFP_VID = 3)AND(pFP_VIDMOVE = 11) THEN -- возврат поставщику
          SELECT fc_name INTO SpisanieDescr FROM MED.TPOSTAV WHERE POSTAVID = pMOGROUPID_TO;
          if SpisanieDescr is not null then SpisanieDescr := ': '||SpisanieDescr; end if;
          RETURN 'Возврат поставщику'||SpisanieDescr;
      ELSE
        RETURN '';  -- это хз что
      END IF;

      EXCEPTION
          WHEN NO_DATA_FOUND THEN RETURN '';
          WHEN OTHERS THEN RAISE;
   END;

-- возвращает название поставщика с учетом типа документа.
-- Настоятельно рекомендуется использовать ее во всех отчетах и формах,
-- поскольку это способствует централизованному управлению отображением документов.
   FUNCTION GET_DOC_SOURCE ( pDocVid IN NUMBER, pDocVidMove  IN NUMBER, pMO_GROUP_FROMID IN NUMBER,  pPostavID IN NUMBER  ) RETURN VARCHAR2
   IS
      FC_POSTAV VARCHAR2(100) := '';
   BEGIN
      IF (pDocVid = 1) THEN
        IF    (pDocVidMove = 1) THEN
          SELECT FC_NAME INTO FC_POSTAV FROM MED.TPOSTAV WHERE postavid = pPostavID;
        ELSIF (pDocVidMove = 9) THEN
          FC_POSTAV := 'Ввод остатков';
        ELSIF (pDocVidMove = 10) THEN
          FC_POSTAV := 'РПО';--MED.PKGTMO.getnamebyid( MED.PKG_MEDSES.GET_PRODUCE_MO );
        END IF;
      ELSIF (pDocVid in (2,3)) THEN

        IF    (pDocVidMove in (2,3,4,5,6,7,8,11,12,13,14)) THEN
          SELECT MAX(fc_group) INTO FC_POSTAV FROM MED.TMO_GROUP WHERE groupid = pMO_GROUP_FROMID;
          IF (pDocVidMove = 4) THEN FC_POSTAV := FC_POSTAV; END IF;
          IF (pDocVidMove = 5) THEN FC_POSTAV := FC_POSTAV||' (из резерва)'; END IF;
          IF (pDocVidMove = 6) THEN FC_POSTAV := FC_POSTAV||' (возврат)'; END IF;
        END IF;
      END IF;

      RETURN NVL(FC_POSTAV,'');
      EXCEPTION
          WHEN NO_DATA_FOUND THEN RETURN '';
          WHEN OTHERS THEN RAISE;
   END;

-- возвращает название получателя с учетом типа документа.
-- Настоятельно рекомендуется использовать ее во всех отчетах и формах,
-- поскольку это способствует централизованному управлению отображением документов.
   FUNCTION GET_DOC_DESTINATION ( pDocVid IN NUMBER, pDocVidMove  IN NUMBER, pMO_GROUP_TOID IN NUMBER,  pPostavID IN NUMBER) RETURN VARCHAR2
   IS
      FC_DEST VARCHAR2(100) := '';
   BEGIN
      IF (pDocVid in (1,2)) THEN
        IF    (pDocVidMove in (2,3,4,5,6, 1,9,10)) THEN
--          IF pDocVidMove = 4 THEN FC_DEST := 'Резерв';
--          ELSE
            SELECT fc_group INTO FC_DEST FROM MED.TMO_GROUP WHERE groupid = pMO_GROUP_TOID;
            IF (pDocVidMove = 4) THEN FC_DEST := FC_DEST||' (в резерв)'; END IF;   -- в резерв
            IF (pDocVidMove = 5) THEN FC_DEST := FC_DEST; END IF;
            IF (pDocVidMove = 6) THEN FC_DEST := FC_DEST||' (возврат)'; END IF;
--          END IF;
        END IF;
      ELSIF (pDocVid = 3) THEN
        IF    (pDocVidMove = 7) THEN
          FC_DEST := 'Списание на производство в РПО';
        ELSIF (pDocVidMove = 8) THEN
          FC_DEST := 'Списание';
        ELSIF (pDocVidMove = 11) THEN
          SELECT fc_name INTO FC_DEST FROM MED.TPOSTAV WHERE POSTAVID = pPostavID;
          FC_DEST := FC_DEST||' (возврат)';
        ELSIF (pDocVidMove = 14) THEN
          select fc_name INTO FC_DEST from MED.TSPISANIEVID WHERE (FN_DOCTYPE = 14) AND FK_ID = pMO_GROUP_TOID;
          FC_DEST := FC_DEST||' (высокие технологии)';
        END IF;
      END IF;

      RETURN NVL(FC_DEST,'');
      EXCEPTION
          WHEN NO_DATA_FOUND THEN RETURN '';
          WHEN OTHERS THEN RAISE;
   END;
   
   
   procedure SaveDoc_Date_Num( aDPID IN NUMBER, aDate IN DATE, aNum VARCHAR2)
   is
--      PRAGMA AUTONOMOUS_TRANSACTION; -- с прагмой в делфях рвется соединение с ораклом  
   begin
     update med.tdocs d 
     set d.FD_DATA = aDate,
         d.FC_DOC = aNum
     where d.DPID = aDPID;    
     commit;
   end;
   
   procedure UpdateAutoNumCounter( aCounterID IN NUMBER, aNum IN NUMBER)
   is
      PRAGMA AUTONOMOUS_TRANSACTION;   
   begin
     update  med.tdocs_autonum_counter c
     set c.FN_CURNUM = aNum
     where c.FK_ID = aCounterID;
     commit;
   end;   

begin
NULL;
end PKGTDOCS;
/


-- End of DDL Script for Package Body MED.PKGTDOCS

