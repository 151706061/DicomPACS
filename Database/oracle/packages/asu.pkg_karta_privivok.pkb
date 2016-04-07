DROP PACKAGE BODY ASU.PKG_KARTA_PRIVIVOK
/

--
-- PKG_KARTA_PRIVIVOK  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_KARTA_PRIVIVOK" is

   CR      VARCHAR2(2) := CHR(13) || CHR(10);

 -----------------------------------------------------------------
function get_karta_privivok(pPeopleID number) return clob is

cursor curPeople is
SELECT nvl(tk.fc_fam, ' '),
       nvl(tk.fc_im, ' '),
       nvl(tk.fc_otch, ' ')
  FROM asu.tpeoples tk
 WHERE fk_id = pPeopleID;

cursor curTuberk is
SELECT   tvac_people.fd_create, tvac_people.fc_vaccin_name,       
         TO_CHAR(tvac_people.fn_num, 'fm9990d00') fn_num,
       --  tvac_people.fn_num,
         pkg_vaccin.get_kratname (tvac_kratn.fn_kratn) AS kratnname,
         tvaccin_unit.fc_short_name AS unit_name,
         pkg_vaccin.show_age(tpeoples.fd_rojd,tvac_people.fd_create) as vozr,
         tvac_people.fc_organization,
         tvac_people.fc_vrach_fio,
         tvac_people.fc_series,
         nvl(tvac_people.fc_reaction, '&nbsp') fc_reaction 
    FROM tvaccin_prep_infection,
         tvaccin_prep,
         tvac_people,
         tvaccin_unit,
         tpeoples,
         tvac_kratn
   WHERE tvaccin_prep_infection.fk_vaccin_infection = 9                       --туберкулез
     AND tvaccin_prep_infection.fk_vaccin_prep = tvaccin_prep.fk_id
     AND tvac_people.fk_vaccin_prep = tvaccin_prep.fk_id
     AND tvac_people.fn_status = 1
     AND tvaccin_prep.fk_unit = tvaccin_unit.fk_id
     AND tvac_people.fk_people = pPeopleID
     AND tvac_people.fk_people = tpeoples.fk_id
     AND tvac_kratn.fk_vac_people = tvac_people.fk_id
     AND tvac_kratn.fk_infection = 9                                         -- туберкулез
ORDER BY tvac_people.fd_create;

cursor curPoliom is
SELECT   tvac_people.*, pkg_vaccin.get_kratname (tvac_kratn.fn_kratn) AS kratnname,
         tvaccin_unit.fc_short_name AS unit_name,
         pkg_vaccin.show_age(tpeoples.fd_rojd,tvac_people.fd_create) vozr,
         nvl(tvac_people.fc_reaction, '&nbsp') fc_reaction_nvl,
         TO_CHAR(tvac_people.fn_num, 'fm9990d00') fn_num_format
    FROM tvaccin_prep_infection,
         tvaccin_prep,
         tvac_people,
         tvaccin_unit,
         tpeoples,
         tvac_kratn
   WHERE tvaccin_prep_infection.fk_vaccin_infection = 7                       --полиомелит
     AND tvaccin_prep_infection.fk_vaccin_prep = tvaccin_prep.fk_id
     AND tvac_people.fk_vaccin_prep = tvaccin_prep.fk_id
     AND tvac_people.fn_status = 1
     AND tvaccin_prep.fk_unit = tvaccin_unit.fk_id
     AND tvac_people.fk_people = pPeopleID
     AND tvac_people.fk_people = tpeoples.fk_id
     AND tvac_kratn.fk_vac_people = tvac_people.fk_id
     AND tvac_kratn.fk_infection = 7                                         -- полиомелит
ORDER BY tvac_people.fd_create;

cursor curDif is
SELECT tvac_people.*, pkg_vaccin.getkratnnamebyvaccin (tvac_people.fk_id) AS kratnname,
       tvaccin_unit.fc_short_name AS unit_name,
       pkg_vaccin.show_age(tpeoples.fd_rojd,tvac_people.fd_create) vozr,
       nvl(tvac_people.fc_reaction, '&nbsp') fc_reaction_nvl,
       TO_CHAR(tvac_people.fn_num, 'fm9990d00') fn_num_format
  FROM tvaccin_prep, tvac_people, tvaccin_unit, tpeoples
 WHERE tvaccin_prep.fk_id IN (
                             SELECT tvaccin_prep_infection.fk_vaccin_prep
                               FROM tvaccin_prep_infection
                              WHERE tvaccin_prep_infection.fk_vaccin_infection IN
                                                                                (2, 3, 8))
   AND tvac_people.fk_vaccin_prep = tvaccin_prep.fk_id
   AND tvac_people.fn_status = 1
   AND tvaccin_prep.fk_unit = tvaccin_unit.fk_id
   AND tvac_people.fk_people = pPeopleID
   AND tvac_people.fk_people = tpeoples.fk_id
order by tvac_people.fd_create;

cursor curParotit is
SELECT   tvac_people.*, pkg_vaccin.get_kratname (tvac_kratn.fn_kratn) AS kratnname,
         tvaccin_unit.fc_short_name AS unit_name,
         pkg_vaccin.show_age(tpeoples.fd_rojd,tvac_people.fd_create) vozr,
         nvl(tvac_people.fc_reaction, '&nbsp') fc_reaction_nvl,
         TO_CHAR(tvac_people.fn_num, 'fm9990d00') fn_num_format         
    FROM tvaccin_prep_infection,
         tvaccin_prep,
         tvac_people,
         tvaccin_unit,
         tpeoples,
         tvac_kratn
   WHERE tvaccin_prep_infection.fk_vaccin_infection = 6                         -- паротит
     AND tvaccin_prep_infection.fk_vaccin_prep = tvaccin_prep.fk_id
     AND tvac_people.fk_vaccin_prep = tvaccin_prep.fk_id
     AND tvac_people.fn_status = 1
     AND tvaccin_prep.fk_unit = tvaccin_unit.fk_id
     AND tvac_people.fk_people = pPeopleID
     AND tvac_people.fk_people = tpeoples.fk_id
     AND tvac_kratn.fk_vac_people = tvac_people.fk_id
     AND tvac_kratn.fk_infection = 6                                            -- паротит
ORDER BY tvac_people.fd_create;

cursor curKor is
SELECT   tvac_people.*, pkg_vaccin.get_kratname (tvac_kratn.fn_kratn) AS kratnname,
         tvaccin_unit.fc_short_name AS unit_name,
         pkg_vaccin.show_age(tpeoples.fd_rojd,tvac_people.fd_create) vozr,
         nvl(tvac_people.fc_reaction, '&nbsp') fc_reaction_nvl,
         TO_CHAR(tvac_people.fn_num, 'fm9990d00') fn_num_format
    FROM tvaccin_prep_infection,
         tvaccin_prep,
         tvac_people,
         tvaccin_unit,
         tpeoples,
         tvac_kratn
   WHERE tvaccin_prep_infection.fk_vaccin_infection = 4                            -- корь
     AND tvaccin_prep_infection.fk_vaccin_prep = tvaccin_prep.fk_id
     AND tvac_people.fk_vaccin_prep = tvaccin_prep.fk_id
     AND tvac_people.fn_status = 1
     AND tvaccin_prep.fk_unit = tvaccin_unit.fk_id
     AND tvac_people.fk_people = pPeopleID
     AND tvac_people.fk_people = tpeoples.fk_id
     AND tvac_kratn.fk_vac_people = tvac_people.fk_id
     AND tvac_kratn.fk_infection = 4                                               -- корь
ORDER BY tvac_people.fd_create;

cursor curOder is
SELECT   tvac_people.*, pkg_vaccin.get_kratname (tvac_kratn.fn_kratn) AS kratnname,
         tvaccin_unit.fc_short_name AS unit_name,
         pkg_vaccin.show_age(tpeoples.fd_rojd,tvac_people.fd_create) vozr,
         nvl(tvac_people.fc_reaction, '&nbsp') fc_reaction_nvl,
         TO_CHAR(tvac_people.fn_num, 'fm9990d00') fn_num_format
    FROM tvaccin_prep_infection,
         tvaccin_prep,
         tvac_people,
         tvaccin_unit,
         tpeoples,
         tvac_kratn
   WHERE tvaccin_prep_infection.fk_vaccin_infection NOT IN
                                              (2, 3, 4, 6, 7, 8, 9, 15) -- другие инфекции
     AND tvaccin_prep_infection.fk_vaccin_prep = tvaccin_prep.fk_id
     AND tvac_people.fk_vaccin_prep = tvaccin_prep.fk_id
     AND tvac_people.fn_status = 1
     AND tvaccin_prep.fk_unit = tvaccin_unit.fk_id
     AND tvac_people.fk_people = pPeopleID
     AND tvac_people.fk_people = tpeoples.fk_id
     AND tvac_kratn.fk_vac_people = tvac_people.fk_id
     AND tvac_kratn.fk_infection NOT IN (2, 3, 4, 6, 7, 8, 9, 15)
ORDER BY tvac_people.fd_create;

cursor curMantu is
SELECT   nvl(to_char(tvac_peoples_test.fd_create,'dd.mm.yyyy'), '&nbsp') fd_create, 
         nvl(to_char(tvac_peoples_test.fd_reg, 'dd.mm.yyyy'), '&nbsp') fd_reg, tvac_test_result.fc_name,
         tvac_peoples_test.fc_lpy, tvac_peoples_test.fc_vrach, nvl(tvac_peoples_test.fc_reaction, '&nbsp') fc_reaction        
    FROM tvac_peoples_test, tvac_test_result
   WHERE tvac_peoples_test.fk_people = pPeopleID
     AND tvac_peoples_test.fk_vac_test_res = tvac_test_result.fk_id
     AND tvac_peoples_test.fk_vac_test = 1                                                   --Манту
ORDER BY tvac_peoples_test.fd_create;


    clTemp  CLOB;
    sTmp    VARCHAR2(32767);
    sFam    VARCHAR2(100);
    sIm     VARCHAR2(100);
    sOtch   VARCHAR2(100);

begin
    execute_immediate('ALTER SESSION SET NLS_TERRITORY=''RUSSIA''');

    DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
    sTmp := '<html><body>';
    DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
    
    open  curPeople;
    fetch curPeople into sFam, sIm, sOtch;
    close curPeople;      
    
    sTmp := '<p><h3 align="center">  Карта профилактических прививок </h3></p><br>';
    DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);     
    
    sTmp := '<br><b>Фамилия, имя, отчество: '|| sFam || ' ' || sIm || ' ' || sOtch || '</b><br>';
    DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);   


     -- Туберкулез
     
     sTmp := '<br><b><CENTER>Прививки против туберкулеза</CENTER></b><br>';
     DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);

     sTmp := '<table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">';
     DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);

      sTmp := 
       '<tr>' ||
          '<td align="center">Typ</td>'||
          '<td align="center">Возраст</td>'||
          '<td align="center">Дата</td>'||
          '<td align="center">Доза</td>'||
          '<td align="center">Серия</td>'||
          '<td align="center">Наименование препарата</td>'||
          '<td align="center">Реакция</td>'||          
       '</tr>';
       
       DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
     
     for c in curTuberk loop
     
     sTmp := 
       '<tr>' ||
          '<td align="center">'|| c.kratnname  ||'</td>'||
          '<td align="center">'|| c.VOZR  ||'</td>'||
          '<td align="center">'|| c.FD_CREATE  ||'</td>'||
          '<td align="center">'|| c.FN_NUM || ' ' || c.UNIT_NAME ||'</td>'||
          '<td align="center">'|| c.FC_SERIES  ||'</td>'||
          '<td align="center">'|| c.FC_VACCIN_NAME  ||'</td>'||
          '<td align="center">'|| c.FC_REACTION  ||'</td>'||         
       '</tr>';
       
       DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
       
    end loop;
    
    sTmp :=  '</table>';
    DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);

 
    -- Прививки против полиомелита
    
     sTmp := '<br><b><CENTER>Прививки против полиомелита</CENTER></b><br>';
     DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);

     sTmp := '<table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">';
     DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);

      sTmp := 
       '<tr>' ||
          '<td align="center">Typ</td>'||
          '<td align="center">Возраст</td>'||
          '<td align="center">Дата</td>'||
          '<td align="center">Доза</td>'||
          '<td align="center">Серия</td>'||
          '<td align="center">Наименование препарата</td>'||
          '<td align="center">Реакция</td>'||          
       '</tr>';
       
       DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
     
     for c in curPoliom loop
     
     sTmp := 
       '<tr>' ||
          '<td align="center">'|| c.kratnname  ||'</td>'||
          '<td align="center">'|| c.VOZR  ||'</td>'||
          '<td align="center">'|| c.FD_CREATE  ||'</td>'||
          '<td align="center">'|| c.fn_num_format || ' ' || c.UNIT_NAME ||'</td>'||
          '<td align="center">'|| c.FC_SERIES  ||'</td>'||
          '<td align="center">'|| c.FC_VACCIN_NAME  ||'</td>'||
          '<td align="center">'|| c.fc_reaction_nvl  ||'</td>'||         
       '</tr>';
       
       DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
       
    end loop;
    
    sTmp :=  '</table>';
    DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
    
    -- Прививки против дифтерии, коклюша, столбняка
     sTmp := '<br><b><CENTER>Прививки против дифтерии, коклюша, столбняка</CENTER></b><br>';
     DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);

     sTmp := '<table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">';
     DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);

      sTmp := 
       '<tr>' ||
          '<td align="center">Typ</td>'||
          '<td align="center">Возраст</td>'||
          '<td align="center">Дата</td>'||
          '<td align="center">Доза</td>'||
          '<td align="center">Серия</td>'||
          '<td align="center">Наименование препарата</td>'||
          '<td align="center">Реакция</td>'||          
       '</tr>';
       
       DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
     
     for c in curDif loop
     
     sTmp := 
       '<tr>' ||
          '<td align="center">'|| c.kratnname  ||'</td>'||
          '<td align="center">'|| c.VOZR  ||'</td>'||
          '<td align="center">'|| c.FD_CREATE  ||'</td>'||
          '<td align="center">'|| c.fn_num_format || ' ' || c.UNIT_NAME ||'</td>'||
          '<td align="center">'|| c.FC_SERIES  ||'</td>'||
          '<td align="center">'|| c.FC_VACCIN_NAME  ||'</td>'||
          '<td align="center">'|| c.fc_reaction_nvl  ||'</td>'||         
       '</tr>';
       
       DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
       
    end loop;
    
    sTmp :=  '</table>';
    DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
    
    -- Прививки против паротита
     sTmp := '<br><b><CENTER>Прививки против паротита</CENTER></b><br>';
     DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);

     sTmp := '<table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">';
     DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);

      sTmp := 
       '<tr>' ||
          '<td align="center">Typ</td>'||
          '<td align="center">Возраст</td>'||
          '<td align="center">Дата</td>'||
          '<td align="center">Доза</td>'||
          '<td align="center">Серия</td>'||
          '<td align="center">Наименование препарата</td>'||
          '<td align="center">Реакция</td>'||          
       '</tr>';
       
       DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
     
     for c in curParotit loop
     
     sTmp := 
       '<tr>' ||
          '<td align="center">'|| c.kratnname  ||'</td>'||
          '<td align="center">'|| c.VOZR  ||'</td>'||
          '<td align="center">'|| c.FD_CREATE  ||'</td>'||
          '<td align="center">'|| c.fn_num_format || ' ' || c.UNIT_NAME ||'</td>'||
          '<td align="center">'|| c.FC_SERIES  ||'</td>'||
          '<td align="center">'|| c.FC_VACCIN_NAME  ||'</td>'||
          '<td align="center">'|| c.fc_reaction_nvl  ||'</td>'||         
       '</tr>';
       
       DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
       
    end loop;
    
    sTmp :=  '</table>';
    DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
    
    --Прививки против кори

     sTmp := '<br><b><CENTER>Прививки против кори</CENTER></b><br>';
     DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);

     sTmp := '<table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">';
     DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);

      sTmp := 
       '<tr>' ||
          '<td align="center">Typ</td>'||
          '<td align="center">Возраст</td>'||
          '<td align="center">Дата</td>'||
          '<td align="center">Доза</td>'||
          '<td align="center">Серия</td>'||
          '<td align="center">Наименование препарата</td>'||
          '<td align="center">Реакция</td>'||          
       '</tr>';
       
       DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
     
     for c in curKor loop
     
     sTmp := 
       '<tr>' ||
          '<td align="center">'|| c.kratnname  ||'</td>'||
          '<td align="center">'|| c.VOZR  ||'</td>'||
          '<td align="center">'|| c.FD_CREATE  ||'</td>'||
          '<td align="center">'|| c.fn_num_format || ' ' || c.UNIT_NAME ||'</td>'||
          '<td align="center">'|| c.FC_SERIES  ||'</td>'||
          '<td align="center">'|| c.FC_VACCIN_NAME  ||'</td>'||
          '<td align="center">'|| c.fc_reaction_nvl  ||'</td>'||         
       '</tr>';
       
       DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
       
    end loop;
    
    sTmp :=  '</table>';
    DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
    
    --Прививки против других инфекций

     sTmp := '<br><b><CENTER>Прививки против других инфекций</CENTER></b><br>';
     DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);

     sTmp := '<table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">';
     DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);

      sTmp := 
       '<tr>' ||
          '<td align="center">Typ</td>'||
          '<td align="center">Возраст</td>'||
          '<td align="center">Дата</td>'||
          '<td align="center">Доза</td>'||
          '<td align="center">Серия</td>'||
          '<td align="center">Наименование препарата</td>'||
          '<td align="center">Реакция</td>'||          
       '</tr>';
       
       DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
     
     for c in curOder loop
     
     sTmp := 
       '<tr>' ||
          '<td align="center">'|| c.kratnname  ||'</td>'||
          '<td align="center">'|| c.VOZR  ||'</td>'||
          '<td align="center">'|| c.FD_CREATE  ||'</td>'||
          '<td align="center">'|| c.fn_num_format || ' ' || c.UNIT_NAME ||'</td>'||
          '<td align="center">'|| c.FC_SERIES  ||'</td>'||
          '<td align="center">'|| c.FC_VACCIN_NAME  ||'</td>'||
          '<td align="center">'|| c.fc_reaction_nvl  ||'</td>'||         
       '</tr>';
       
       DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
       
    end loop;
    
    sTmp :=  '</table>';
    DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
    
    --Реакция манту

     sTmp := '<br><b><CENTER>Реакция манту</CENTER></b><br>';
     DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);

     sTmp := '<table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">';
     DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);

      sTmp := 
       '<tr>' ||
          '<td align="center">Дата проведения</td>'||
          '<td align="center">Дата учета</td>'||
          '<td align="center">Результат</td>'||                   
       '</tr>';
       
       DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
     
     for c in curMantu loop
     
     sTmp := 
       '<tr>' ||
          '<td align="center">'|| c.FD_CREATE  ||'</td>'||
          '<td align="center">'|| c.FD_REG  ||'</td>'||
          '<td align="center">'|| c.FC_NAME  || ' ' || c.FC_REACTION ||'</td>'||                  
       '</tr>';
       
       DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
       
    end loop;    
    
    
    sTmp :=  '</table>';
    DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);

    sTmp := '</body></html>' || CR;
    DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);

    return clTemp;
end;
end pkg_karta_privivok;
/

SHOW ERRORS;


