DROP PACKAGE BODY ASU.PKG_PRIVACY
/

--
-- PKG_PRIVACY  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_PRIVACY" is

 CR      VARCHAR2(2) := CHR(13) || CHR(10);

 -----------------------------------------------------------------
 FUNCTION GET_IBSMIDVALUES(pPacid       IN NUMBER,
                           pSyn         IN VARCHAR,
                           bShowrootInt IN NUMBER DEFAULT 0)
  RETURN VARCHAR2 IS


  cursor cGetData(pLastKartaID in number) is
   SELECT to_char(fd_date, 'dd.mm.yyyy')          
          FROM ASU.TIB,
               (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = pSyn) SM
         WHERE fk_smid = SM.FK_ID
           AND fk_pacid = pLastKartaID;
  
  vResult      VARCHAR2(32767);
  ntmp         NUMBER DEFAULT 0;
  nLastKartaID NUMBER;
  vTmp         VARCHAR2(1000);
  vTmp1        VARCHAR2(1000);
  bShowroot    BOOLEAN;
  nCol         NUMBER;
  /*
     курсор выбирает из смида ветки, листья которых занесены в TIB
     цикл собирает строку
  */

BEGIN
  nCol := 1;
  vResult := '  ';
  
  IF BSHOWROOTINT = 1 THEN
    BSHOWROOT := TRUE;
  ELSE
    BSHOWROOT := FALSE;
  END IF;
  SELECT MAX(vnaz.fk_id)
    INTO nLastKartaID
    FROM vnaz,
         (SELECT fk_id
            FROM tsmid
          CONNECT BY PRIOR fk_id = fk_owner
           START WITH tsmid.fc_synonim = pSyn) sm,
         asu.tib
   WHERE vnaz.fk_pacid = pPAcid
     AND vnaz.fk_id = tib.fk_pacid
     AND tib.fk_smid = sm.fk_id
     AND VNAZ.FK_NAZSOSID = ASU.GET_VIPNAZ;
  IF nLastKartaID IS NULL THEN
    nLastKartaID := pPacid;
  END IF;

  FOR c IN (SELECT fc_name, fl_showprint, fc_type, LEVEL, fk_id
              FROM asu.tsmid
             WHERE fk_id IN
                   (SELECT fk_id
                      FROM asu.tsmid
                    CONNECT BY fk_id = PRIOR fk_owner
                     START WITH fk_id IN
                                (SELECT sm.fk_id
                                   FROM (SELECT fk_id, fc_name, LEVEL
                                           FROM tsmid
                                         CONNECT BY PRIOR fk_id = fk_owner
                                          START WITH tsmid.fc_synonim = pSyn) sm,
                                        asu.tib
                                  WHERE tib.fk_pacid = nLastKartaID
                                    AND tib.fk_smid = sm.fk_id))

            CONNECT BY PRIOR fk_id = fk_owner
             START WITH fc_synonim = pSyn
             ORDER BY stat.pkg_ord_hierarchy.branch(LEVEL,
                                                    lpad(to_char(nvl(fn_order,
                                                                     rownum)),
                                                         4,
                                                         '0'),
                                                    '.')) LOOP  
    
    IF upper(c.fc_type) = 'EDIT' THEN
      BEGIN
        IF bShowroot THEN
          vresult := vResult || '<tr><td>' || c.fc_name || ': '|| '</td><td>';
        END IF;
        SELECT MAX(FC_CHAR)
          INTO vtmp
          FROM asu.tib,
               (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = pSyn) SM
         WHERE fk_smid = SM.FK_ID
           AND fk_pacid = nLastKartaID;
        vResult := vResult || ' ' || vTmp|| '</td></tr>' || CR;
      END;
   
    ELSIF upper(c.fc_type) = 'NUMBER' THEN
      BEGIN
        IF bShowroot THEN
          vresult := vResult || '<tr><td>' || c.fc_name || ': '|| '</td><td>';
        END IF;
        SELECT to_char(MAX(fn_num))
          INTO vtmp
          FROM asu.tib,
               (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = pSyn) SM
         WHERE fk_smid = SM.FK_ID
           AND fk_pacid = nLastKartaID;
        vResult := vResult || ' ' || vTmp|| '</td></tr>' || CR;
      END;
   
   ELSIF upper(c.fc_type) = 'DATA' THEN
      BEGIN
        IF bShowroot THEN
          vresult := vResult || '<tr><td>' || c.fc_name || ': '|| '</td><td>';
        END IF;
        
       /* SELECT to_char(fd_date, 'dd.mm.yyyy')
          INTO vtmp
          FROM ASU.TIB,
               (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = pSyn) SM
         WHERE fk_smid = SM.FK_ID
           AND fk_pacid = nLastKartaID;*/
           
        OPEN   cGetData(nLastKartaID);
        FETCH  cGetData INTO vtmp;
        IF cGetData%NOTFOUND 
        THEN 
           vtmp := '&nbsp'; 
        END IF;
        CLOSE  cGetData;

        
        vResult := vResult || ' ' || vTmp|| '</td></tr>' || CR;
        
      END;
    ELSE

      IF NOT bShowroot AND c.LEVEL = 1 THEN
        vtmp := '';
      ELSE
        BEGIN
          vtmp := c.fc_name ;
          IF instr(c.fc_name, '...', 1, 1) <> 0 THEN
            BEGIN
              IF nLastKartaID = pPacid THEN
                BEGIN
                  FOR cur IN (SELECT fc_char chr, fn_num num
                                FROM asu.tib
                               WHERE fk_smid = c.fk_id
                                 AND fk_pacid = nLastKartaID
                               ORDER BY fk_id) LOOP
                    vtmp := REPLACE(vtmp, '...', cur.num) || cur.chr;
                  END LOOP;
                END;
              ELSE
                FOR cur IN (SELECT fc_char chr, fn_num num
                              FROM asu.tib
                             WHERE fk_smeditid = c.fk_id
                               AND fk_pacid = nLastKartaID
                             ORDER BY fk_id) LOOP
                  vtmp1 := nvl(cur.chr, to_char(cur.num));
                  vtmp  := REPLACE(vtmp, '...', vTmp1);
                END LOOP;
              END IF;
            END;
          END IF;

          --                for cur in (select fc_char  chr from asu.tib where fk_smeditid=c.fk_id and fk_pacid=nLastKartaID )
        END;
       
        if nCol = 1 then
         begin
           vResult := vResult || '<tr>';
           nCol := 2;
         end;
        else
         begin
          nCol := 1;
         end;
        end if;
        
        IF c.fc_type = 'Группа' OR c.fl_showprint = 0 THEN
          vResult := vResult|| '</td></tr>';
        ELSE         
          vResult := vResult || '<td>' || vtmp || '</td>';
          ntmp    := c.LEVEL;
        END IF;
        
        if nCol = 1 then         
          vResult := vResult || '</tr>'; 
        end if;          
        
      END IF;

    END IF;

  END LOOP;
  RETURN ltrim(vResult, ':');

END;

 -----------------------------------------------------------------

function get_personaldata(pPeopleID number) return clob is

    cursor curPeople is
     SELECT tk.fk_ibid || '/' || tk.fk_iby ibnum,           
            tk.fk_id,
            tk.fc_fam,
            tk.fc_im,
            tk.fc_otch,
            TO_CHAR(tk.fd_rojd, 'dd.mm.yyyy') fd_rojd,
            decode(tk.fp_sex, 1, 'Мужской', 0, 'Женский', 'Не известен') as sex,
            asu.PKG_REGIST_PACFUNC.GET_PAC_AGE_NOW(tk.fk_id) as age,
            
            asu.GET_ADDR_STR_BY_ID(ASU.PKG_REGIST_PACFUNC.GET_PAC_ADRID(tk.fk_id, asu.GET_PROPISKAID)) ||
       (select decode(Phone, null, '', ' т.: ' || Phone)
          from (select sys_xmlagg(xmlelement(col, FC_PHONE || '  ')) .extract('/ROWSET/COL/text()').getstringval() Phone
                  from (SELECT FC_PHONE
                          from asu.tpeoples
                         where fk_id = pPeopleID
                        union all
                        SELECT FC_CONTACT
                          from asu.TCONTACTS
                         where FK_PACID =pPeopleID
                         order by 1 desc))) AS fc_adr,
            
            asu.pkg_regist_pacfunc.get_pac_workplace (tk.fk_id) as workplace,
            
            (select (select t.fc_name from asu.tviddoc t where t.fk_id = p.fk_docvid)|| ' ' || p.fc_docser|| ' ' ||
       p.fc_docnum|| ' ' ||
       p.fd_docdate|| ' ' ||
       p.FC_DOCVIDAN from asu.tpeoples p where fk_id = pPeopleID) as Pasport           
       
       FROM asu.tkarta tk
      WHERE tk.fk_peplid = pPeopleID
    UNION
     SELECT tk.fk_ibid || '/' || tk.fk_iby ibnum,           
            tk.fk_id,
            tk.fc_fam,
            tk.fc_im,
            tk.fc_otch,
            TO_CHAR(tk.fd_rojd, 'dd.mm.yyyy') fd_rojd,
            decode(tk.fp_sex, 1, 'Мужской', 0, 'Женский', 'Не известен') as sex,
            asu.PKG_REGIST_PACFUNC.GET_PAC_AGE_NOW(tk.fk_id) as age,
            
            asu.GET_ADDR_STR_BY_ID(ASU.PKG_REGIST_PACFUNC.GET_PAC_ADRID(tk.fk_id, asu.GET_PROPISKAID)) ||
       (select decode(Phone, null, '', ' т.: ' || Phone)
          from (select sys_xmlagg(xmlelement(col, FC_PHONE || '  ')) .extract('/ROWSET/COL/text()').getstringval() Phone
                  from (SELECT FC_PHONE
                          from asu.tpeoples
                         where fk_id = pPeopleID
                        union all
                        SELECT FC_CONTACT
                          from asu.TCONTACTS
                         where FK_PACID =pPeopleID
                         order by 1 desc))) AS fc_adr,
            
            asu.pkg_regist_pacfunc.get_pac_workplace (tk.fk_id) as workplace,
            
              (select (select t.fc_name from asu.tviddoc t where t.fk_id = p.fk_docvid)|| ' ' || p.fc_docser|| ' ' ||
       p.fc_docnum|| ' ' ||
       p.fd_docdate|| ' ' ||
       p.FC_DOCVIDAN from asu.tpeoples p where fk_id = pPeopleID) as Pasport   
       FROM asu.tambulance tk
      WHERE tk.fk_peplid = pPeopleID;   
    
    
    vPeople curPeople%rowtype;    
    clTemp  CLOB;
    sTmp    VARCHAR2(32767);

    ---------------------------------------------------------------
    function get_double_column_header(pHeader  varchar2,
                                      pColSpan integer default 2)
      return varchar2 is
    begin
      return '<tr><td colspan = ' || to_char(pColSpan) || '>' || pHeader || '</td></tr>' || CR;
    end;
  
    --------------------------------------------------------------
    function get_double_column(pFirst varchar2, pSecond varchar2)
      return varchar2 is
    begin
      return '<tr><td>' || pFirst || '</td><td>' || pSecond || '</td></tr>' || CR;
    end;
  
begin
  
    DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
    sTmp := '<html><body>';
    DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
  
    --------------------------Данные о ФИО, дате рождения, пол
    open  curPeople;
    fetch curPeople into vPeople;
    close curPeople;
    
    sTmp := '<table>';
    DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
  
    sTmp := get_double_column('Фамилия', vPeople.fc_fam);
    DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
  
    sTmp := get_double_column('Имя', vPeople.fc_im);
    DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
  
    sTmp := get_double_column('Отчество', vPeople.fc_otch);
    DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
  
    sTmp := get_double_column('Дата рождения', vPeople.Fd_Rojd);
    DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
  
    sTmp := get_double_column('Пол', vPeople.Sex);
    DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
    
    sTmp := get_double_column('Возраст (полных лет)', vPeople.Age);
    DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
    
    sTmp := get_double_column('Документ, удостоверяющий личность', vPeople.Pasport);
    DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp); 
    
    sTmp := get_double_column('Место жительства', vPeople.Fc_Adr);
    DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
    
    sTmp := get_double_column('Место работы', vPeople.Workplace);
    DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);   
    
    sTmp := get_double_column('&nbsp', '&nbsp');
    DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp); 
    
    
    -- Данные из ОСС, ветка Пациент, рег. карта, личные данные
    sTmp := GET_IBSMIDVALUES(pPeopleID, 'PAC_INFO');
    DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
    
    sTmp := get_double_column('&nbsp', '&nbsp');
    DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
    
    sTmp := get_double_column('&nbsp', '&nbsp');
    DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
    
    sTmp := '</table>' || CR;
    DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);    
  
    return clTemp;
end;

end PKG_PRIVACY;
/

SHOW ERRORS;


