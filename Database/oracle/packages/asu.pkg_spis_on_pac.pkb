DROP PACKAGE BODY ASU.PKG_SPIS_ON_PAC
/

--
-- PKG_SPIS_ON_PAC  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU.pkg_spis_on_pac
IS
   FD_CUR_SPIS DATE DEFAULT SYSDATE; -- текуща€ дата списани€ - перенесено в PKG_SPIS_ON_PAC
   FL_SHOW_VIPIS_PAC NUMBER DEFAULT 0; -- флаг отображени€ выписанных пацов

-- текуща€ дата списани€
   FUNCTION GET_CUR_SPIS_DATE RETURN  DATE DETERMINISTIC
   IS
   BEGIN
     RETURN NVL(FD_CUR_SPIS, SYSDATE);
   END;

   PROCEDURE SET_CUR_SPIS_DATE ( aSpisDate DATE DEFAULT SYSDATE )
    IS
   BEGIN
     FD_CUR_SPIS := aSpisDate;
   END;

-- флаг отображени€ выписанных пацов
   FUNCTION GET_FL_SHOW_VIPIS_PAC RETURN  number DETERMINISTIC
   IS
   BEGIN
     RETURN NVL(FL_SHOW_VIPIS_PAC, 0);
   END;

   PROCEDURE SET_FL_SHOW_VIPIS_PAC ( aFL_SHOW_VIPIS_PAC NUMBER DEFAULT 0 )
    IS
   BEGIN
     FL_SHOW_VIPIS_PAC := aFL_SHOW_VIPIS_PAC;
   END;

 -- ‘ункци€ возвращает название препарата, выданного пациенту по TNAZMED.FK_ID и дате выдачи
FUNCTION GET_SPIS_MED_BY_NAZMEDID (pnazmedid IN NUMBER, pSpisDate IN DATE) RETURN VARCHAR2 IS
 pRes VARCHAR2(4000);
 IsFirst Number;
BEGIN
 pRes := '';
 IsFirst := 1;
 FOR C IN
     (select m.fc_name ||
             '  ол-во: '||DECODE(NVL(m.fn_fpackinupack,0), 0,'', TO_CHAR(NVL(dp.FN_KOL,0)*m.fn_fpackinupack, 'fm9999999999990d999'))||' '||fei.fc_name as fc_name
      from  asu.tnazmark nmk, med.tdpc dp, med.tkart k,
            med.tmedic m, med.tei fei
      where
         nmk.fk_nazid = pnazmedid
      and dp.fk_nazmark_id = nmk.fk_id
      and dp.kartid = k.kartid
      and k.medicid = m.medicid
      and m.fk_fpackid = fei.eiid(+)
      and trunc(nmk.fd_post,'dd') = trunc(pSpisDate,'dd')) LOOP
     if (IsFirst = 1) then
        pRes := c.fc_name;
        IsFirst := 0;
     else
        pRes := pRes || CHR(13)||CHR(10)||c.fc_name;
     end if;
 END LOOP;
 RETURN pRes;
END;

 -- ‘ункци€ возвращает название препарата, выданного пациенту по TNAZMED.FK_ID и дате выдачи
FUNCTION GET_SPIS_MED_BY_NAZMARKID (pnazmarkid IN NUMBER, pSpisDate IN DATE) RETURN VARCHAR2 IS
 pRes VARCHAR2(4000);
 IsFirst Number;
BEGIN
 pRes := '';
 IsFirst := 1;
 FOR C IN
     (select m.fc_name ||
             '  ол-во: '||DECODE(NVL(m.fn_fpackinupack,0), 0,'', TO_CHAR(NVL(dp.FN_KOL,0)*m.fn_fpackinupack, 'fm9999999999990d999'))||' '||fei.fc_name as fc_name
      from  asu.tnazmark nmk, med.tdpc dp, med.tkart k,
            med.tmedic m, med.tei fei
      where
         nmk.fk_id = pnazmarkid
      and dp.fk_nazmark_id = nmk.fk_id
      and dp.kartid = k.kartid
      and k.medicid = m.medicid
      and m.fk_fpackid = fei.eiid(+)
      and trunc(nmk.fd_post,'dd') = trunc(pSpisDate,'dd')) LOOP
     if (IsFirst = 1) then
        pRes := c.fc_name;
        IsFirst := 0;
     else
        pRes := pRes || CHR(13)||CHR(10)||c.fc_name;
     end if;
 END LOOP;
 RETURN pRes;
END;

 -- ‘ункци€ возвращает название препарата, выданного пациенту по TNAZMED.FK_ID и дате выдачи
FUNCTION GET_MEDICGIVEN_BY_NAZMARKID (pnazmarkid IN NUMBER, pSpisDate IN DATE) RETURN VARCHAR2 IS
 pRes VARCHAR2(4000);
 IsFirst Number;
BEGIN
 pRes := '';
 IsFirst := 1;
 FOR C IN
     (select m.fc_name ||
             '  ол-во: '||DECODE(NVL(m.fn_fpackinupack,0), 0,'', TO_CHAR(NVL(mg.FN_KOL,0)*m.fn_fpackinupack, 'fm9999999999990d999'))||' '||fei.fc_name fc_name
      from  asu.tmedicgiven mg,
            med.tmedic m, med.tei fei
      where mg.fk_nazmark = pnazmarkid
            and mg.fk_medicgiven = m.medicid
            and m.fk_fpackid = fei.eiid(+)
            and trunc(mg.fd_given,'dd') = trunc(pSpisDate,'dd')) LOOP
     if (IsFirst = 1) then
        pRes := pRes || c.fc_name;
        IsFirst := 0;
     else
        pRes := pRes || CHR(13)||CHR(10)||c.fc_name;
     end if;
 END LOOP;
 RETURN pRes;
END;

PROCEDURE CANCEL_SPIS_BY_NAZMARKID (pfk_nazmark_id IN NUMBER, pFK_SOTR_ID IN NUMBER) IS
  pDPID NUMBER;
  pKartID NUMBER;
  pDPC_COUNT NUMBER;
  pMOID NUMBER;
BEGIN
  select MAX(dpid), MAX(kartid) into pDPID, pKartID  from MED.TDPC WHERE fk_nazmark_id = pfk_nazmark_id;
  delete from MED.TDPC WHERE fk_nazmark_id = pfk_nazmark_id;
  ASU.PKG_LOG.Do_log('MED.TDPC', 'fk_nazmark_id', 'DELETE', TO_CHAR(pfk_nazmark_id), 'kartid='||TO_CHAR(pKartID), pFK_SOTR_ID);

  delete from asu.tmedicgiven where fk_nazmark = pfk_nazmark_id;
  ASU.PKG_LOG.Do_log('asu.tmedicgiven', 'fk_nazmark', 'DELETE', TO_CHAR(pfk_nazmark_id), '', pFK_SOTR_ID);

  delete from asu.tnazmark where FK_ID = pfk_nazmark_id;
  ASU.PKG_LOG.Do_log('asu.tnazmark', 'FK_ID', 'DELETE', TO_CHAR(pfk_nazmark_id), '', pFK_SOTR_ID);

  select COUNT(dp.dpcid) into pDPC_COUNT from med.tdpc dp where dp.DPID = pDPID;
  if pDPC_COUNT = 0 then
    delete from med.tdocs d where d.DPID = pDPID;
    ASU.PKG_LOG.Do_log('med.tdocs', 'DPID', 'DELETE', TO_CHAR(pDPID), '', pFK_SOTR_ID);
  end if;
end;

  FUNCTION DoAutoSpisOnPac(
	aPacID            IN NUMBER,
	aNazMedLechID     IN NUMBER,
	aKartID           IN NUMBER,
	aFN_KOL           IN NUMBER,
	aDATE_SPIS        IN DATE,
  aFK_nazmedlechvid   IN NUMBER,
  aFK_RESLECH_ID      IN NUMBER DEFAULT NULL,
  aFC_COMMENT         IN VARCHAR2 DEFAULT NULL,
  aFC_PAC_FIO         IN VARCHAR2 DEFAULT NULL,
  aNazMedID           IN NUMBER DEFAULT NULL,
  aFK_NAZMARK_ID      IN NUMBER DEFAULT NULL,
  aFK_NAZVRACH_ID     IN NUMBER DEFAULT NULL)  RETURN NUMBER
IS
  FK_DOC_ID NUMBER;
  FK_CURMO_ID NUMBER;
  FK_CURMO_GROUP NUMBER;
  RES_FK_DPCID NUMBER;

  FD_DOC_DATE DATE;
  FC_CURMONTH_NUM VARCHAR2(2);
  FC_CURMONTH_NAME VARCHAR2(15);

  FN_SPISANIE_VID NUMBER;
  FC_AMBFIO VARCHAR2(200);
  sFC_COMMENT VARCHAR2(500);
BEGIN
  FK_CURMO_ID    := med.pkg_medses.get_curmo;
  FK_CURMO_GROUP := med.pkg_medses.get_cur_mogroup_by_cur_mo;

  FC_CURMONTH_NUM := TO_CHAR(aDATE_SPIS,'MM'); -- номер текущего мес€ца

  -- ≈сли в качестве aPacID указан амбулаторный талон, то SPISANIEVID = 6, иначе считаем, что aPacID - это TKARTA.FK_ID (SPISANIEVID = 3)
  SELECT nvl(MAX(6),3) INTO FN_SPISANIE_VID FROM ASU.TAMBTALON WHERE FK_ID = aPacID;

  -- ищем документ по пациенту
  select
    MAX(DPID)
  into
    FK_DOC_ID
  from
  med.tdocs d
  where
       d.fp_vid = 3 and d.fp_vidmove = 8
   and d.fk_mogroupid_to = aPacID
   and d.fn_spisanievid = FN_SPISANIE_VID
   and d.fk_mogroupid_from = FK_CURMO_GROUP
   and TO_CHAR(d.FD_DATA,'MM') = FC_CURMONTH_NUM; -- фича дл€ разделени€ списаний по мес€цам

     IF FC_CURMONTH_NUM = '01' THEN FC_CURMONTH_NAME := 'яЌ¬ј–№';
  ELSIF FC_CURMONTH_NUM = '02' THEN FC_CURMONTH_NAME := '‘≈¬–јЋ№';
  ELSIF FC_CURMONTH_NUM = '03' THEN FC_CURMONTH_NAME := 'ћј–“';
  ELSIF FC_CURMONTH_NUM = '04' THEN FC_CURMONTH_NAME := 'јѕ–≈Ћ№';
  ELSIF FC_CURMONTH_NUM = '05' THEN FC_CURMONTH_NAME := 'ћј…';
  ELSIF FC_CURMONTH_NUM = '06' THEN FC_CURMONTH_NAME := '»ёЌ№';
  ELSIF FC_CURMONTH_NUM = '07' THEN FC_CURMONTH_NAME := '»ёЋ№';
  ELSIF FC_CURMONTH_NUM = '08' THEN FC_CURMONTH_NAME := 'ј¬√”—“';
  ELSIF FC_CURMONTH_NUM = '09' THEN FC_CURMONTH_NAME := '—≈Ќ“яЅ–№';
  ELSIF FC_CURMONTH_NUM = '10' THEN FC_CURMONTH_NAME := 'ќ “яЅ–№';
  ELSIF FC_CURMONTH_NUM = '11' THEN FC_CURMONTH_NAME := 'ЌќяЅ–№';
  ELSIF FC_CURMONTH_NUM = '12' THEN FC_CURMONTH_NAME := 'ƒ≈ јЅ–№';
  end if;

  -- обновл€ем расходный документ
  if NVL(FK_DOC_ID, -1) > 0 then
     update med.tdocs set fd_invoice = sysdate,
                          fl_edit = 0
       where dpid = FK_DOC_ID;
  else
    IF FN_SPISANIE_VID = 3 THEN
      IF aFC_PAC_FIO IS NULL THEN
        sFC_COMMENT :=  '—писание на пациента '||asu.get_pacfio( aPacID )||' '||FC_CURMONTH_NAME||' '||aFC_COMMENT;
      ELSE
        sFC_COMMENT :=  '—писание на пациента '||aFC_PAC_FIO||' '||FC_CURMONTH_NAME||' '||aFC_COMMENT;
      END IF;
    ELSIF FN_SPISANIE_VID = 6 THEN
      SELECT asu.get_pacfio(t.fk_ambid) INTO FC_AMBFIO FROM asu.tambtalon t WHERE t.fk_id = aPacID;
      IF aFC_PAC_FIO IS NULL THEN
        sFC_COMMENT :=  '—писание на амб. талон '||FC_AMBFIO||' '||FC_CURMONTH_NAME||' '||aFC_COMMENT;
      ELSE
        sFC_COMMENT :=  '—писание на амб. талон '||aFC_PAC_FIO||' '||FC_CURMONTH_NAME||' '||aFC_COMMENT;
      END IF;
    END IF;

    insert into med.tdocs
             (fp_vid, fp_vidmove, fn_spisanievid, fd_data,    fd_invoice, MOOWNERID,   mofromid,    fk_mogroupid_from, FK_MOGROUPID,  fk_mogroupid_to, fl_edit, FC_COMMENT)
      values (3,      8,          FN_SPISANIE_VID,              aDATE_SPIS, aDATE_SPIS,    FK_CURMO_ID, FK_CURMO_ID, FK_CURMO_GROUP,    FK_CURMO_GROUP, aPacID         , 0,      sFC_COMMENT)
      returning dpid into FK_DOC_ID;

      update med.tdocs set FC_DOC = TO_CHAR(FK_DOC_ID) where dpid = FK_DOC_ID;
  end if;
  -- добавлем в расход медикамент
  -- ¬оронов ќ.ј. 18.08.2009 добавил автора списани€
  insert into med.tdpc (dpid,      kartid,  fn_kol,  FD_DATE_SPIS, FK_NAZMEDLECH_ID, FK_NAZMEDLECHVID,  FK_RESLECH_ID , FK_NAZMEDID, FK_NAZMARK_ID,  FK_NAZVRACHID  , FK_CREATE_MO_ID, FD_CREATE)
                values (FK_DOC_ID, aKartID, aFN_KOL, aDATE_SPIS,   aNazMedLechID,    aFK_nazmedlechvid, aFK_RESLECH_ID, aNazMedID  , aFK_NAZMARK_ID, aFK_NAZVRACH_ID, FK_CURMO_ID    , sysdate) returning DPCID INTO RES_FK_DPCID;

  -- обновл€ем стоимость документа
  update med.tdocs set fn_price = med.pkg_prihrash.getsumdoc(FK_DOC_ID,0) where dpid = FK_DOC_ID;

  RETURN RES_FK_DPCID;
END;


END;
/

SHOW ERRORS;


