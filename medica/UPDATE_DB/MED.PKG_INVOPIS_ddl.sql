-- Start of DDL Script for Package Body MED.PKG_INVOPIS
-- Generated 12-июл-2007 17:39:34 from MED@asu

CREATE OR REPLACE PACKAGE MED."PKG_INVOPIS" is

  -- тип инвентризации
  cInvPlanTypeId SMALLINT DEFAULT 0;
  cInvSuddenTypeId SMALLINT DEFAULT 1;
  
  cInvPlanType VARCHAR2(30) DEFAULT 'Плановая';
  cInvSuddenType VARCHAR2(30) DEFAULT 'Внезапная';  

procedure do_del(ainvlistid in number);
procedure do_insNameDoc(ainvlistid in number,
                        afcdocnum IN VARCHAR2,
                        amoinvid in number,
                        afd_data1 in date,
                        afd_data2 in date,
                        afc_pred in varchar2,
                        afc_chlen1 in varchar2,
                        afc_chlen2 in varchar2,
                        afc_chlen3 in varchar2);
function get_sumprice(afn_factsum in number,ainvopisid in number)
 return number;
 
   FUNCTION DO_SET (
      pINVLISTID    IN   NUMBER,
      pMATOTVID     IN   NUMBER, -- теперь сюда передаем ID группы МО
      pFC_DOCNUM    IN   VARCHAR2,
      pFD_DATA1     IN   DATE,
      pFD_DATA2     IN   DATE,
      pFC_PREDS     IN   VARCHAR2,
      pFC_CHLEN1    IN   VARCHAR2,
      pFC_CHLEN2    IN   VARCHAR2,
      pFC_CHLEN3    IN   VARCHAR2,
      pFN_TYPE      IN   NUMBER,
      pFD_DT_BEG    IN   DATE,
      pFD_DT_END    IN   DATE,
--      pFC_CITY          IN   VARCHAR2,
--      pFC_PEOPLES      IN   VARCHAR2,
      pFD_DAT_PRIKAZ IN   DATE ,
      pFC_NMB_PRIKAZ IN   VARCHAR2,
      pFK_FINSOURCE_ID IN NUMBER,
      pFARR_SPIRT_UCHGR IN MED.ARRAY200_OF_INT,
      pFARR_DEFICIT_UCHGR IN MED.ARRAY200_OF_INT,
      pFARR_NARC_UCHGR IN MED.ARRAY200_OF_INT,
      pFARR_ATTEND_PEOPLE IN MED.ARRAY200_OF_POST_FIO_SOTR
   )  RETURN NUMBER;

  PROCEDURE GEN(pINVLISTID in MED.TINVLIST.INVLISTID%type);
      
  FUNCTION GET_INVPLANTYPEID RETURN SMALLINT;
  FUNCTION GET_INVSUDDENTYPEID RETURN SMALLINT;
  
  FUNCTION GET_INVPLANTYPE RETURN VARCHAR2;  
  FUNCTION GET_INVSUDDENTYPE RETURN VARCHAR2;    
  
  FUNCTION GET_INVTYPENAME(pINVTYPEID IN SMALLINT) RETURN VARCHAR2;
  
  FUNCTION CREATESHABLON RETURN NUMBER;
  
  PROCEDURE DO_OPIS_CLEAR ( pINVLISTID IN MED.TINVLIST.INVLISTID%TYPE );    
  
  PROCEDURE DO_SET_SIGN ( pINVLISTID IN MED.TINVLIST.INVLISTID%TYPE );
  
  FUNCTION DO_CHECK_OK_INV( pINVLISTID IN MED.TINVLIST.INVLISTID%TYPE ) RETURN VARCHAR2;
END PKG_INVOPIS; 
 
/
CREATE OR REPLACE PACKAGE BODY MED."PKG_INVOPIS" IS
   PROCEDURE do_del (ainvlistid IN NUMBER)
   IS
   BEGIN
      DELETE FROM tinvopis WHERE invlistid = ainvlistid;
      DELETE FROM tinvlist WHERE invlistid = ainvlistid;
   END;

   FUNCTION DO_SET (
      pINVLISTID    IN   NUMBER,
      pMATOTVID     IN   NUMBER, -- теперь сюда передаем ID группы МО
      pFC_DOCNUM    IN   VARCHAR2,
      pFD_DATA1     IN   DATE,
      pFD_DATA2     IN   DATE,
      pFC_PREDS     IN   VARCHAR2,
      pFC_CHLEN1    IN   VARCHAR2,
      pFC_CHLEN2    IN   VARCHAR2,
      pFC_CHLEN3    IN   VARCHAR2,
      pFN_TYPE      IN   NUMBER,
      pFD_DT_BEG    IN   DATE,
      pFD_DT_END    IN   DATE,
--      pFC_CITY          IN   VARCHAR2,
--      pFC_PEOPLES      IN   VARCHAR2,
      pFD_DAT_PRIKAZ IN   DATE ,
      pFC_NMB_PRIKAZ IN   VARCHAR2,
      pFK_FINSOURCE_ID IN NUMBER,
      pFARR_SPIRT_UCHGR IN MED.ARRAY200_OF_INT,
      pFARR_DEFICIT_UCHGR IN MED.ARRAY200_OF_INT,
      pFARR_NARC_UCHGR IN MED.ARRAY200_OF_INT,
      pFARR_ATTEND_PEOPLE IN MED.ARRAY200_OF_POST_FIO_SOTR      
   )
      RETURN NUMBER
   IS
      id   NUMBER;
   BEGIN

      id := pINVLISTID;

      UPDATE MED.TINVLIST i
      SET    --matotvid_owner = pkg_medses.get_curmo,
             i.MATOTVID = pMATOTVID,
             i.FC_DOCNUM = pFC_DOCNUM,
             i.FD_DATA1 = pFD_DATA1,
             i.FD_DATA2 = pFD_DATA2,
             i.FC_PREDS = pFC_PREDS,
             i.FC_CHLEN1 = pFC_CHLEN1,
             i.FC_CHLEN2 = pFC_CHLEN2,
             i.FC_CHLEN3  = pFC_CHLEN3,
             i.FN_TYPE  = pFN_TYPE ,
             i.FD_DT_BEG  = pFD_DT_BEG ,
             i.FD_DT_END  = pFD_DT_END ,
--             i.FC_CITY    = pFC_CITY     ,
--             i.FC_PEOPLES = pFC_PEOPLES,
             i.FD_DAT_PRIKAZ = pFD_DAT_PRIKAZ,
             i.FC_NMB_PRIKAZ = pFC_NMB_PRIKAZ,
             i.FK_FINSOURCE_ID = pFK_FINSOURCE_ID,
/*             i.FK_FINSOURCE_ID = case
                                  when coalesce(pFK_FINSOURCE_ID, -1) > 0 then pFK_FINSOURCE_ID
                                  else null
                                 end,*/
             i.FARR_SPIRT_UCHGR = coalesce(pFARR_SPIRT_UCHGR, MED.ARRAY200_OF_INT()),
             i.FARR_DEFICIT_UCHGR = coalesce(pFARR_DEFICIT_UCHGR, MED.ARRAY200_OF_INT()),
             i.FARR_NARC_UCHGR = coalesce(pFARR_NARC_UCHGR, MED.ARRAY200_OF_INT()),
             i.FARR_ATTEND_PEOPLE = coalesce (pFARR_ATTEND_PEOPLE, MED.ARRAY200_OF_POST_FIO_SOTR())
      WHERE  i.INVLISTID = pINVLISTID
      returning i.INVLISTID into id;
/*
      IF SQL%ROWCOUNT = 0 THEN
         INSERT INTO tinvlist
                     (matotvid_owner, matotvid, fc_docnum,
                      fd_data1, fd_data2, fc_preds, fc_chlen1, fc_chlen2,
                      fc_chlen3,
                      FN_TYPE, FD_DT_BEG, FD_DT_END,  FC_CITY, FC_PEOPLES,
                      FD_DAT_PRIKAZ, FC_NMB_PRIKAZ )
         VALUES      (pkg_medses.get_curmo, amatotvid, afc_docnum,
                      afd_data1, afd_data2, afc_preds, afc_chlen1, afc_chlen2,
                      afc_chlen3,
                      p_rgTypInv , p_dtBegPeriod , p_dtEndPeriod , p_ePlace, p_memPeoples,
                      p_DAT_PRIKAZ, p_NMB_PRIKAZ
                     ) RETURNING INVLISTID INTO ID;

      END IF; */
      RETURN id;
   END;

  FUNCTION get_sumprice (afn_factsum IN NUMBER, ainvopisid IN NUMBER)
    RETURN NUMBER
  IS
    price   NUMBER;
  BEGIN
    SELECT
           afn_factsum / fn_factkol
    INTO   price
    FROM   tinvopis
    WHERE  invopisid = ainvopisid;

    RETURN price;
  END;

  procedure do_insNameDoc(ainvlistid in number,
                          afcdocnum IN VARCHAR2,
                          amoinvid in number,
                          afd_data1 in date,
                          afd_data2 in date,
                          afc_pred in varchar2,
                          afc_chlen1 in varchar2,
                          afc_chlen2 in varchar2,
                          afc_chlen3 in varchar2)
  is
  begin
    update tinvlist
    SET fc_docnum = afcdocnum,
        matotvid = amoinvid,
        fd_data1 = afd_data1,
        fd_data2 = afd_data2,
        fc_preds = afc_pred,
        fc_chlen1 = afc_chlen1,
        fc_chlen2 = afc_chlen2,
        fc_chlen3 = afc_chlen3
    where invlistid = ainvlistid;
  end;
  -- формирует данные по описи 
  PROCEDURE GEN(pINVLISTID in MED.TINVLIST.INVLISTID%type)
  is
    vFD_DT_END MED.TINVLIST.FD_DT_END%type;
    vMOGROUP_ID MED.TINVLIST.MATOTVID%type;
    vFK_FINSOURCE_ID MED.TINVLIST.FK_FINSOURCE_ID%type;
  BEGIN
    begin
      select i.FD_DT_END, i.MATOTVID, coalesce(i.FK_FINSOURCE_ID,-1)
        into vFD_DT_END, vMOGROUP_ID, vFK_FINSOURCE_ID  
        from med.TINVLIST i
       where i.INVLISTID = pINVLISTID;      
    exception
      when others then
          return;      
    end;    
  
    MED.PKG_INVOPIS.DO_OPIS_CLEAR(pINVLISTID);

    insert into MED.TINVOPIS ( INVLISTID, KARTID, FC_INVNUM, FC_NAME, FC_EDIZM, FC_OKEI, FN_BUHKOL, FN_PRICE, FN_BUHPRICE )
    select pINVLISTID,
           t.KARTID,
           t.FC_SERIAL,
           m.FC_NAME||' ( п. №'||to_char(t.FN_PARTY_NUM)||')' as FC_KARTNAME,
           ei.FC_NAME  as FC_EDIZM,
           ei.FC_OKEI,
           t.FN_KOLOSTEND as FN_BUHKOL,
           t.FN_PRICE,
           t.FN_SUMOSTEND as FN_BUHSUM       
      from (SELECT K.KARTID,
                   k.MEDICID,
                   K.FN_PARTY_NUM,
                   k.FC_SERIAL,
                   K.FN_PRICE, 
                   sum( CASE WHEN TRUNC(D.FD_DATA) < TRUNC(vFD_DT_END) THEN C.FN_KOL * D.MNOJ ELSE 0 END) AS FN_KOLOSTEND,                       
                   sum (CASE WHEN TRUNC(D.FD_DATA) < TRUNC(vFD_DT_END) then C.FN_KOL * D.MNOJ * K.FN_PRICE ELSE 0 END) AS FN_SUMOSTEND
              from (SELECT TDOCS.FD_DATA, TDOCS.DPID,
                           MED.PKG_PRIHRASH.GET_PRIHRASHPRIZNAK(TDOCS.FP_VID,
                                                                TDOCS.FP_VIDMOVE,
                                                                TDOCS.FK_MOGROUPID_FROM,
                                                                TDOCS.FK_MOGROUPID_TO,
                                                                vMOGROUP_ID) AS MNOJ
                      FROM MED.TDOCS
                     WHERE TRUNC(TDOCS.FD_DATA) BETWEEN TO_DATE('01.01.2000', 'DD.MM.YYYY') AND TRUNC(vFD_DT_END)
                       AND TDOCS.FL_EDIT = 0
                       AND TDOCS.FP_VIDMOVE NOT IN (4, 5)
                       AND vMOGROUP_ID IN (TDOCS.FK_MOGROUPID_TO, TDOCS.FK_MOGROUPID_FROM)) D,
                   MED.TDPC C,
                   MED.TKART K
             WHERE D.DPID = C.DPID
               AND C.KARTID = K.KARTID
               AND K.FL_DEL = 0
               AND ( K.FK_FINSOURCE_ID = vFK_FINSOURCE_ID or vFK_FINSOURCE_ID = -1 )
             group by K.KARTID,
                   k.MEDICID,
                   K.FN_PARTY_NUM,
                   k.FC_SERIAL,
                   K.FN_PRICE ) t
     inner join med.TMEDIC m
        on t.medicid = m.medicid
      left join med.TEI ei
        on m.EIID = ei.EIID
     where t.FN_KOLOSTEND > 0
     order by upper(m.FC_NAME||' ( п. №'||to_char(t.FN_PARTY_NUM)||')');    
  END;
  
  FUNCTION GET_INVPLANTYPEID RETURN SMALLINT  IS    
  BEGIN
    RETURN cInvPlanTypeId;
  END;
  
  FUNCTION GET_INVSUDDENTYPEID RETURN SMALLINT  IS    
  BEGIN
    RETURN cInvSuddenTypeId;
  END;  
  
  FUNCTION GET_INVPLANTYPE RETURN VARCHAR2 IS    
  BEGIN
    RETURN cInvPlanType;
  END;
   
  FUNCTION GET_INVSUDDENTYPE RETURN VARCHAR2 IS  
  BEGIN
    RETURN cInvSuddenType;
  END;
    
  -- возвращает имя типа инвентаризации
  FUNCTION GET_INVTYPENAME(pINVTYPEID IN SMALLINT) RETURN VARCHAR2  IS    
    vResult varchar(30) := '';
  begin  
    if (pINVTYPEID = cInvPlanTypeId) then
      vResult := cInvPlanType;
    elsif (pINVTYPEID = cInvSuddenTypeId) then
      vResult := cInvSuddenType;
    end if;
    
    return vResult;                                   
  END; -- GET_INVTYPENAME
  
  -- Создание заготовки под инвентаризацию
  FUNCTION CREATESHABLON RETURN number is
   vNewId med.TINVLIST.INVLISTID%type;
  begin
    insert into MED.TINVLIST ( MATOTVID_OWNER, MATOTVID, FN_TYPE, FD_DATA1, FD_DT_END, FL_EDIT, FD_CREATE  )
      values ( med.pkg_medses.get_curmo, med.PKG_MEDSES.GET_CUR_MOGROUP_BY_CUR_MO, cInvPlanTypeId, trunc(sysdate), trunc(sysdate), 1, sysdate ) 
       returning INVLISTID into vNewId;
    return vNewId;
  exception
      when others then
        return -1;
  end; -- CREATESHABLON
  
  -- Удаление данных по описи инвентаризации 
  PROCEDURE DO_OPIS_CLEAR ( pINVLISTID IN MED.TINVLIST.INVLISTID%TYPE ) is    
  begin
    delete from med.TINVOPIS 
     where INVLISTID = pINVLISTID;    
  END; -- DO_OPIS_CLEAR
  
  -- Подпись инвентаризации 
  PROCEDURE DO_SET_SIGN ( pINVLISTID IN MED.TINVLIST.INVLISTID%TYPE ) is
    vFL_EDIT smallint;
  begin
    begin
      select i.FL_EDIT
        into vFL_EDIT
        from med.TINVLIST i
       where i.INVLISTID = pINVLISTID
         and i.FL_EDIT = 1; -- есть ли среди неподписанных
    exception
      when others then
        return;
    end;
    
    update med.TINVLIST i
       set i.FL_EDIT = 0,
           i.FK_SIGNED_BY_MO = med.pkg_medses.get_curmo,
           i.FD_SIGNED = sysdate
     where i.INVLISTID = pINVLISTID;    
  end; -- DO_SET_SIGN         
  
  -- Функция возвращает список незаполненых полей 
  FUNCTION DO_CHECK_OK_INV( pINVLISTID IN MED.TINVLIST.INVLISTID%TYPE ) RETURN VARCHAR2 IS
    vResMsg VARCHAR2(1000) := '';  
    vRec  MED.TINVLIST%rowtype;
    vFN_OPIS_CNT pls_integer := 0;
    n pls_integer := 0;
  begin
    begin
      select i.* 
        into vRec
        from MED.TINVLIST i
       where i.INVLISTID = pINVLISTID;    
    exception
      when NO_DATA_FOUND then
        vResMsg := 'Инвентаризация с кодом '||to_char(pINVLISTID)||' не найдена!';
        return vResMsg;
      when others then
        vResMsg := 'Unkown error!';
        return vResMsg;
    end;
    -- данные по описи в инвентаризации
    select COUNT(1)
      into vFN_OPIS_CNT
      from MED.TINVOPIS o
     where o.INVLISTID = pINVLISTID;

    if (vRec.FC_DOCNUM is null) then
      n := n + 1;
      vResMsg := vResMsg||to_char(n)||') № документа'||chr(10);
    end if;  

    if (vRec.FN_TYPE is null) then
      n := n + 1;    
      vResMsg := vResMsg||to_char(n)||') Тип инвентаризации'||chr(10);
    end if;  

    if (vRec.FD_DATA1 is null) then
      n := n + 1;    
      vResMsg := vResMsg||to_char(n)||') Дата начала инвентаризации'||chr(10);
    end if;  

    if (vRec.FD_DATA2 is null) then
      n := n + 1;    
      vResMsg := vResMsg||to_char(n)||') Дата окончания инвентаризации'||chr(10);
    end if;
    
    if (vRec.MATOTVID is null) then
      n := n + 1;    
      vResMsg := vResMsg||to_char(n)||') Мат.ответ. группа лиц'||chr(10);
    end if;  
      
    if (vRec.FD_DT_BEG is null) then
      n := n + 1;    
      vResMsg := vResMsg||to_char(n)||') Дата начала отчетного периода'||chr(10);
    end if;  

    if (vRec.FD_DT_END is null) then
      n := n + 1;    
      vResMsg := vResMsg||to_char(n)||') Дата начала отчетного периода'||chr(10);
    end if;  

    if (vRec.FC_NMB_PRIKAZ is null) then
      n := n + 1;    
      vResMsg := vResMsg||to_char(n)||') № приказа'||chr(10);
    end if;  
    
    if (vRec.FD_DAT_PRIKAZ is null) then
      n := n + 1;    
      vResMsg := vResMsg||to_char(n)||') Дата приказа'||chr(10);
    end if;  
    
    if (vRec.FC_PREDS is null) then
      n := n + 1;    
      vResMsg := vResMsg||to_char(n)||') Председатель комиссии'||chr(10);
    end if;  

    if (vRec.FC_CHLEN1 is null) and (vRec.FC_CHLEN2 is null) and (vRec.FC_CHLEN3 is null) then
      n := n + 1;    
      vResMsg := vResMsg||to_char(n)||') Члены комиссии'||chr(10);
    end if;  
    
    if (vrec.FARR_SPIRT_UCHGR is null) or ( vrec.FARR_SPIRT_UCHGR.COUNT = 0 )then
      n := n + 1;    
      vResMsg := vResMsg||to_char(n)||') Учетные группы спиртов'||chr(10);
    end if;      

    if (vrec.FARR_DEFICIT_UCHGR is null) or ( vrec.FARR_DEFICIT_UCHGR.COUNT = 0 )then
      n := n + 1;    
      vResMsg := vResMsg||to_char(n)||') Учетные группы дефицитных ЛП'||chr(10);
    end if;      
    
    if (vrec.FARR_NARC_UCHGR is null) or ( vrec.FARR_NARC_UCHGR.COUNT = 0 )then
      n := n + 1;    
      vResMsg := vResMsg||to_char(n)||') Учетные группы наркотических средств, психотропных и ядовидых веществ'||chr(10);
    end if;        
    
    if (vrec.FARR_ATTEND_PEOPLE is null) or ( vrec.FARR_ATTEND_PEOPLE.COUNT = 0 )then
      n := n + 1;    
      vResMsg := vResMsg||to_char(n)||') Список присутствующих лиц'||chr(10);
    end if;  
    
    if (vFN_OPIS_CNT = 0) then
      n := n + 1;    
      vResMsg := vResMsg||to_char(n)||') Данные по описи'||chr(10);
    end if;     

    return vResMsg;
  end; -- DO_CHECK_OK_INV   
  
END PKG_INVOPIS;
-- End of DDL Script for Package Body MED.PKG_INVOPIS
/
