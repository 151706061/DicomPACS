CREATE OR REPLACE PACKAGE BODY MED.PKG_MEDICNAZN IS

  -- FUNCTION AND PROCEDURE IMPLEMENTATIONS
  FUNCTION DO_SET(
                  pOperation       IN NUMBER,   -- Тип операции
                  ----TNazMed----
                  PFK_ID           IN NUMBER,   -- Код назначения (TNazMed)
                  PFK_PACID        IN NUMBER,   -- Код пациента
                  PFK_VRACHID      IN NUMBER,   -- Код назначившего врача
                  PFK_VVODPATHID   IN NUMBER,   -- Путь введения (см. табл. TVvodPath)
                  PFD_BEGIN        IN DATE,     -- Дата начала назначения
                  PFN_DURATION     IN INTEGER,  -- Длительность курса
                  PFD_CANCEL       IN DATE,     -- Дата отмены назначения
                  PFK_STATE        IN NUMBER,   -- Состояние назначения (см. табл. TNazSos)
                  PFK_FREQUENCYID  IN NUMBER,   -- Кратность приема (см. табл. TFrequency)
                  PFC_REMARK       IN VARCHAR2, -- Примечание
                  ----TNazMedLech----
                  PFN_DOZA         IN NUMBER,   -- Доза препарата
                  PFK_MEDICID      IN NUMBER,   -- Код медикамента (см. табл. Med.TMedic)
                  PFK_DOZUNITS     IN NUMBER,   -- Единицы измерения дозы (см. табл. Med.TMassUnits) - на случай если не заполнено соответсвующее поле в Med.TMedic
                  PFN_KOL          IN NUMBER,   -- Колличество
                  PFC_REMARKL      IN VARCHAR2, -- Примечание
                  PFK_TREB         IN NUMBER,   -- Сылка на требования (см. табл Med.TTreb)
                  PFK_CANCELSOTRID IN NUMBER,   -- Код сотрудника, отменившего назначение
                  PFC_CANCELREASON IN VARCHAR2, -- Причина отмены
                  PFK_MOID         IN NUMBER,   -- Материально ответсвенный, кот. будет собирать требования (связь с аптекой)
                  PFK_OSMOTRID     IN NUMBER    -- Код осмотра врача
                  ) RETURN NUMBER IS
  Res NUMBER;

  BEGIN
    /*
    case pOperation of
      0 : Добавление нового мед. назначения "Добавить"
      1 : Добавление к уже существуещему мед. назначению "Добавить в группу"
      2 : Редактирование мед. назначения ???
    */
    IF pOperation = 0 THEN
      /*  новая запись в TNazMed */
      INSERT INTO tnazmed (fk_id,fk_pacid,fk_vrachid,fk_vvodpathid,fd_begin,fn_duration,
        fd_cancel,fk_cancelsotrid,fc_cancelreason,fk_state,fk_treb,fk_frequencyid,fc_remark,fk_moid,fk_osmotrid)
      VALUES (NULL, pFk_pacid, pfk_vrachid, pfk_vvodpathid, pfd_begin, pfn_duration, pfd_cancel, pfk_cancelsotrid,
      pfc_cancelreason, pfk_state, pfk_treb, pfk_frequencyid, pfc_remark, pfk_moid, pfk_osmotrid) RETURNING FK_ID INTO Res;
      /*  новая запись в TNazMedLech, прикрепляем к TNazMed.Fk_Id */
      INSERT INTO tnazmedlech (fk_id, fk_nazmedid, fn_doza, fk_medicid, fc_remark, fk_dozunits,fn_kol)
      VALUES (NULL, Res, pfn_doza, pfk_medicid, pfc_remarkl, pfk_dozunits,PFN_KOL);
    ELSIF pOperation = 1 THEN
      /*  новая запись в TNazMedLech, прикрепляем к TNazMed.Fk_Id - связка один ко многим *< */
      INSERT INTO tnazmedlech (fk_id, fk_nazmedid, fn_doza, fk_medicid, fc_remark, fk_dozunits,fn_kol)
      VALUES (NULL, PFK_ID, pfn_doza, pfk_medicid, pfc_remarkl, pfk_dozunits,PFN_KOL);
      Res := PFK_ID;
      /*  родактирование */
    ELSIF pOperation = 2 THEN
      UPDATE tnazmed
         SET fk_pacid = pfk_pacid,
             fk_vrachid = pfk_vrachid,
             fk_vvodpathid = pfk_vvodpathid,
             fd_begin = pfd_begin,
             fn_duration = pfn_duration,
             fd_cancel = pfd_cancel,
             fk_cancelsotrid = pfk_cancelsotrid,
             fc_cancelreason = pfc_cancelreason,
             fk_state = pfk_state,
             fk_treb = pfk_treb,
             fk_frequencyid = pfk_frequencyid,
             fc_remark = pfc_remark,
             fk_moid = pfk_moid,
             fk_osmotrid = pfk_osmotrid
       WHERE fk_id = pfk_id;

       UPDATE Tnazmedlech
       SET fn_doza = pFn_doza,
           fk_medicid = pFk_medicid,
           fk_dozunits = pFk_dozunits,
           fn_kol = pFn_kol
       WHERE fk_id = pFK_ID;

       RES := PFK_ID;
       /* как быть с TNazMedLech ХЗ */
    END IF;
    RETURN Res;
  END;

  PROCEDURE DO_DEL(PFK_ID IN NUMBER) -- Код назначения (TNazMed)
  IS
  BEGIN
    DELETE FROM TNAZMED WHERE FK_ID = PFK_ID; /* дальше почистит триггер*/
  END;

  PROCEDURE DO_CANCEL (PFK_ID IN NUMBER,           -- Код назначения (TNazMed)
                       PFK_CANCELSOTRID IN NUMBER, --Отменивший сотрудник
                       PFC_REASON IN VARCHAR2      --Причина отмены
                       )
  IS
  BEGIN

    UPDATE TNazMed m
    SET m.fk_state = ASU.GET_NAZCANCEL, --состояние Отменено (TNazSos)
        m.fd_cancel = trunc(SYSDATE),
        m.fn_duration = trunc(SYSDATE) - m.fd_begin + 1,
        m.fk_cancelsotrid = PFK_CANCELSOTRID,
        m.fc_cancelreason = PFC_REASON
    WHERE m.fk_id = PFK_ID;

/*    UPDATE ASU.tnazmedlechvid
    SET fk_state = ASU.get_NAZCANCEL --состояние Отменено (TNazSos)
    WHERE FK_NAZMEDID = PFK_ID
      AND TRUNC(FD_DATE) >= TRUNC(SYSDATE);*/

  END;

  FUNCTION GET_NAZ_FULLNAME(pFK_ID IN NUMBER) RETURN VARCHAR2 IS

  CURSOR cNameS(aNazId IN NUMBER) IS
    SELECT
    INITCAP(E.FC_NAME)||'. '||INITCAP(M.FC_NAME)||' '||
    M.FN_MASS||' '||U2.FC_SHORTNAME||
    ' ii '||TO_CHAR(L.FN_DOZA,'FM999G990D099','NLS_NUMERIC_CHARACTERS = ''. ''')||
    ' '||U.FC_SHORTNAME||' ('||TO_CHAR(L.FN_KOL,'FM999G999G990D099999','NLS_NUMERIC_CHARACTERS = ''. ''')||' '||
    E.FC_NAME||') '||F.FC_NAME||'. '||V.FC_NAME||'. '||N.FC_REMARK||'.'||
    CHR(10)||'Суточная доза '||TO_CHAR(F.FN_MNOG * L.FN_DOZA,'FM999G999G990D099999','NLS_NUMERIC_CHARACTERS = ''. ''')||' '||U.FC_SHORTNAME||'.'||
    CHR(10)||'Курсовая доза '||TO_CHAR(L.FN_DOZA * F.FN_MNOG * N.FN_DURATION,'FM999G999G990D099999','NLS_NUMERIC_CHARACTERS = ''. ''')||' '||U.FC_SHORTNAME||'.'
    AS FC_MEDNAZ
    FROM TNAZMED N, TNAZMEDLECH L, MED.TMEDIC M, MED.TEI E, MED.TMASSUNITS U,
    ASU.TFREQUENCY F, ASU.TVVODPATH V, MED.TMASSUNITS U2
    WHERE N.FK_ID = L.FK_NAZMEDID
      AND L.FK_MEDICID = M.MEDICID
      AND M.EIID = E.EIID(+)
      AND L.FK_DOZUNITS = U.FK_ID(+)
      AND N.FK_FREQUENCYID = F.FK_ID
      AND N.FK_VVODPATHID = V.FK_ID
      AND M.FK_MASSUNITS = U2.FK_ID (+)

      AND N.FK_ID = aNazId
    ORDER BY M.FC_NAME;

    vcName VARCHAR2(1000);
    Res    VARCHAR2(2000);
    iCnt   INTEGER;

  BEGIN
    iCnt := 1;
    OPEN cNameS(pFK_ID);
    LOOP
      FETCH cNameS INTO vcName;
      EXIT WHEN cNameS%NOTFOUND;
      Res := Res || to_char(iCnt)||'. '|| vcName || ';' ||chr(10);
      iCnt := iCnt + 1;
    END LOOP;
    Res := Substr(Res,0,length(Res) - 2);
    RETURN Res;
  END;

  FUNCTION IS_NARCOTIC(pMedicID IN NUMBER) RETURN NUMBER IS

    CURSOR cStrong(aMedicId IN NUMBER) IS
      SELECT COUNT(0) FROM MED.TMEDIC_TSPECIALMEDIC
      WHERE MEDICID = AMEDICID
        AND ROWNUM < 2;

    iRes NUMBER;

  BEGIN
    OPEN cStrong(pMedicId);
    FETCH cStrong INTO iRes;
    CLOSE cStrong;
    RETURN (iRes);
  END;

  FUNCTION GET_PATHVVOD (PFK_MEDNAZID IN TNAZMED.FK_ID%TYPE) RETURN VARCHAR2 IS
    CURSOR cVvodPath(aFk_mednazid IN NUMBER) IS
      SELECT fc_name FROM TNazMed, ASU.Tvvodpath
      WHERE TNazMed.fk_id = aFk_mednazid
        AND TNazMed.fk_vvodpathid = Tvvodpath.fk_id;
    Res VARCHAR2(100);
  BEGIN
    OPEN cVvodPath(pFk_mednazid);
    FETCH cVvodPath INTO Res;
    CLOSE cVvodPath;
    RETURN Res;
  END;

END PKG_MEDICNAZN;
/
