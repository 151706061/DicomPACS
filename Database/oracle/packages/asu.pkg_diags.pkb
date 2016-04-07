DROP PACKAGE BODY ASU.PKG_DIAGS
/

--
-- PKG_DIAGS  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_DIAGS"
IS
  PROCEDURE SET_SHOWIB(pFK_ID IN NUMBER) IS
  CURSOR c(pID NUMBER) IS SELECT FL_SHOWIB FROM TDIAG WHERE FK_ID=pID;
  i NUMBER;
  BEGIN
    OPEN c(pFK_ID);
    FETCH c INTO i;
    ClOSE c;
    IF i=0 THEN
      i:=1;
    ELSE
      i:=0;
    END IF;
    UPDATE TDIAG SET FL_SHOWIB=i WHERE FK_ID=pFK_ID;
  END;
/*----------------------------------------------------------------------------*/
FUNCTION GET_MKB_10(pFK_PACID IN NUMBER)
RETURN VARCHAR2 IS
NAMEMKB VARCHAR2(32000);
  CURSOR cMKB IS SELECT GET_MKB10_FROM_TSMID(FK_MKB_10) FROM TDIAG
                   WHERE FK_PACID = pFK_PACID
                     AND FP_TYPE = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'CLINIK')
                     AND FL_MAIN = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'MAIN')
                ORDER BY FD_DATE DESC;
BEGIN
  OPEN cMKB;
  FETCH cMKB INTO NAMEMKB;
  CLOSE cMKB;
  RETURN NAMEMKB;
END;

/*----------------------------------------------------------------------------*/
/*     Далее идут функции, которые возвращают различные диагнозы пациентов    */
/*----------------------------------------------------------------------------*/
/* Author: Neronov A.S.  27.06.2011                                           */
/*----------------------------------------------------------------------------*/

/*-----------------------        МКБ-10 диагноза       -----------------------*/
FUNCTION GET_MKB10_FROM_DIAG(pDiagid in number) return varchar2 is

  NAMEMKB VARCHAR2(32000);
  CURSOR cMKB IS SELECT GET_MKB10_FROM_TSMID(FK_MKB_10) FROM TDIAG
                   WHERE FK_ID = pDiagid;
BEGIN
  OPEN cMKB;
  FETCH cMKB INTO NAMEMKB;
  CLOSE cMKB;
  RETURN NAMEMKB;
END;

/*-----------------------       Основной диагноз       -----------------------*/
FUNCTION GET_DIAG_MAIN(pPacid in number, pNazid in number) return number is
  Result number;
  cursor cAmb is
  (select MAX(d.fk_id)
     from asu.tdiag d,
          asu.tambtalon t,
          asu.tambtalon_naz tn
     where d.fk_id = t.fk_diagmain
       and t.fk_id = tn.fk_talonid
       and tn.fk_nazid = pNazid);
  cursor cStac is
  (select MAX(d.fk_id)
     from asu.tdiag d
     where d.fk_pacid = pPacid
       and d.fl_main = STAT.PKG_STATUTIL.get_smidid('MAIN')
       and d.fp_type = STAT.PKG_STATUTIL.get_smidid('CLINIK'));
BEGIN
  if ASU.IS_AMBULANCE(pPacid) = 1 then
    open cAmb;
    fetch cAmb into Result;
    close cAmb;
  else
    open cStac;
    fetch cStac into Result;
    close cStac;
  end if;

  Return Result;
END;

/*-----------------------    Заключительный диагноз    -----------------------*/
FUNCTION GET_DIAG_ZAKL(pPacid in number, pNazid in number) return number is
  Result number;
  cursor cAmb is
  (select MAX(d.fk_id)
     from asu.tdiag d,
          asu.tambtalon t,
          asu.tambtalon_naz tn
     where d.fk_id = t.fk_diagmain
       and t.fk_id = tn.fk_talonid
       and tn.fk_nazid = pNazid);
  cursor cStac is
  (select MAX(d.fk_id)
     from asu.tdiag d
     where d.fk_pacid = pPacid
       and d.fl_main = STAT.PKG_STATUTIL.get_smidid('MAIN')
       and d.fp_type = STAT.PKG_STATUTIL.get_smidid('PRI_VYPISKE'));
BEGIN
  if ASU.IS_AMBULANCE(pPacid) = 1 then
    open cAmb;
    fetch cAmb into Result;
    close cAmb;
  else
    open cStac;
    fetch cStac into Result;
    close cStac;
  end if;

  Return Result;
END;

/*-----------------------   Предварительный диагноз    -----------------------*/
FUNCTION GET_DIAG_PRED(pPacid in number, pNazid in number) return number is
  Result number;
  cursor cAmb is
  (select MAX(d.fk_id)
     from asu.tdiag d,
          asu.tambtalon t,
          asu.tambtalon_naz tn
     where d.fk_id = t.fk_diagmainpred
       and t.fk_id = tn.fk_talonid
       and tn.fk_nazid = pNazid);
  cursor cStac is
  (select MAX(d.fk_id)
     from asu.tdiag d
     where d.fk_pacid = pPacid
       and d.fp_type = STAT.PKG_STATUTIL.get_smidid('NA_OSMOTRE'));
BEGIN
  if ASU.IS_AMBULANCE(pPacid) = 1 then
    open cAmb;
    fetch cAmb into Result;
    close cAmb;
  else
    open cStac;
    fetch cStac into Result;
    close cStac;
  end if;

  Return Result;
END;

/*-----------------------    Сопутствующий диагноз     -----------------------*/
FUNCTION GET_DIAG_SOPUT(pPacid in number, pNazid in number) return number is
  Result number;
  cursor cAmb is
  (select MAX(d.fk_id)
     from asu.tdiag d,
          asu.tambtalon_naz tn,
          asu.tambtalon_diags td
     where d.fk_id = td.fk_diagid
       and td.fk_talonid = tn.fk_talonid
       and tn.fk_nazid = pNazid
       and nvl(td.fl_del,0) = 0
       and d.fl_main = STAT.PKG_STATUTIL.get_smidid('SOPUT'));
  cursor cStac is
  (select MAX(d.fk_id)
     from asu.tdiag d
     where d.fk_pacid = pPacid
       and d.fp_type = STAT.PKG_STATUTIL.get_smidid('SOPUT'));
BEGIN
  if ASU.IS_AMBULANCE(pPacid) = 1 then
    open cAmb;
    fetch cAmb into Result;
    close cAmb;
  else
    open cStac;
    fetch cStac into Result;
    close cStac;
  end if;

  Return Result;
END;

/*-----------------------   Диагноз направившего учр.  -----------------------*/
FUNCTION GET_DIAG_NAPR(pPacid in number, pNazid in number) return number is
  Result number;
  cursor cAmb is
  (select MAX(d.fk_id)
     from asu.tdiag d,
          asu.tambtalon_naz tn,
          asu.tambtalon_naz tn2
     where d.fk_nazid = tn.fk_nazid
       and tn.fk_talonid = tn2.fk_talonid
       and tn2.fk_nazid = pNazid
       and d.fl_main = stat.pkg_statutil.get_smidid('MAIN')
       and d.fp_type = stat.pkg_statutil.get_smidid('S_MESTA_OTBORA'));
  cursor cStac is
  (select MAX(d.fk_id)
     from asu.tdiag d
     where d.fk_pacid = pPacid
       and d.fl_main = stat.pkg_statutil.get_smidid('MAIN')
       and d.fp_type = stat.pkg_statutil.get_smidid('S_MESTA_OTBORA'));
BEGIN
  if ASU.IS_AMBULANCE(pPacid) = 1 then
    open cAmb;
    fetch cAmb into Result;
    close cAmb;
  else
    open cStac;
    fetch cStac into Result;
    close cStac;
  end if;

  Return Result;
END;

END; -- Package Body PKG_DIAGS
/

SHOW ERRORS;


