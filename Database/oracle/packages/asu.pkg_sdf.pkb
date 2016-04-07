DROP PACKAGE BODY ASU.PKG_SDF
/

--
-- PKG_SDF  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_SDF" IS
  /*Created by A.Nakorjakov 090408*/

  function Get_FormDefaultTemplateID(pSDF_ElementID Number) return Number is
    nRes Number;
  begin
    select nvl(max(fk_id), -1)
      into nRes
      from asu.t_sdf_template
     where fk_sdf_element = pSDF_ElementID
       and fl_del = 0;
    return nRes;
  end;

  function get_string(pString VARCHAR2) return VARCHAR2 is
    --created by A.Nakorjakov 070708
    s_ret VARCHAR2(4000);
  begin
    if pString is null then
      s_ret := 'NULL';
    else
      s_ret := pString;
      s_ret := replace(s_ret, '''', '''''');
      s_ret := '''' || s_ret || '''';
    end if;
    return s_ret;
  end;

  function GenerateScript(SDF_FormID NUMBER) RETURN CLOB IS
    --created by A.Nakorjakov 070708
    TYPE t_row IS REF CURSOR;
    TYPE t_smid_info IS record (fc_name asu.tsmid.fc_name%TYPE,fc_type asu.tsmid.fc_type%TYPE);
    clTemp CLOB;
    c_row  t_row;
    c_smid t_row;
    sdf_row    T_SDF_ELEMENT%ROWTYPE;
    smid_row   t_smid_info;
    s          VARCHAR2(32000);
    sLineBreak VARCHAR2(10) := CHR(13) || CHR(10);
    cnt        NUMBER;
    smid_syn   TSMID.Fc_Synonim%TYPE;
  begin
    DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.SESSION);
    cnt := DBMS_LOB.getlength(clTemp);
    if cnt > 0 then
      DBMS_LOB.ERASE(clTemp, cnt, 1);
    end if;
    s := 'DECLARE' || sLineBreak ||
         '  v_root_elementid NUMBER;' ||sLineBreak ||
         '  v_rootsmid NUMBER;' || sLineBreak ||
         '  v_smid NUMBER;' || sLineBreak ||
         '  v_cnt NUMBER;' || sLineBreak ||
         '  v_elementid NUMBER;' || sLineBreak ||
         'BEGIN' || sLineBreak;
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(s), s);
    open c_row for
      select * from T_SDF_ELEMENT where fk_id = SDF_FormID;
    loop
      fetch c_row
        into sdf_row;
      exit when c_row%NOTFOUND;

      open c_smid for
        select fc_name, fc_type
          from asu.tsmid
         where fk_id = sdf_row.fk_smid;
      loop
        fetch c_smid
          into smid_row;
        exit when c_smid%NOTFOUND;
        s :=   ' select count(1),max(s.fk_id), max(s.fk_smid)'||sLineBreak||
               ' into v_cnt,v_root_elementid,v_rootsmid'||sLineBreak||
               ' from T_SDF_ELEMENT s where s.fk_globalid = '||SDF_ROW.FK_GLOBALID||';'||sLineBreak;
        s := s||'  if v_cnt = 0 then  '||sLineBreak;
        s := s||'INSERT INTO TSMID
               (FK_OWNER,FC_NAME,FC_TYPE)
              VALUES
               (stat.pkg_statutil.get_smidid(''DYNAMIC_FORMS''),' ||
             GET_STRING(SDF_ROW.FC_NAME) || ',' ||
             GET_STRING(SDF_ROW.FC_TYPE) || ')' ||
             sLineBreak || ' RETURNING FK_ID INTO v_rootsmid;' ||
             sLineBreak;
        DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(s), s);
      end loop;
      close c_smid;

      SELECT MAX(FC_SYNONIM)
        INTO smid_syn
        FROM ASU.TSMID
       WHERE FK_ID = SDF_ROW.FK_QUERRY_SMID;
      if (smid_syn is null) and (SDF_ROW.FK_QUERRY_SMID is not null) then
        RAISE_APPLICATION_ERROR(-20001,
                                'Synonim is null.  TSMID.FK_ID = ' ||
                                SDF_ROW.FK_QUERRY_SMID);
      end if;
      s := 'INSERT INTO T_SDF_ELEMENT
            (FK_ID,FK_SMID,
             FC_QUERRYSQL,
             FC_SAVESQL,
             FC_LISTSQL,
             FC_SYNONYM,
             FC_NAME,
             FC_TYPE,
             FC_PARMANAGER_SYN,
             FC_ENTITYTYPE,
             FL_ISAUTOSAVE,
             FL_DEL,
             FL_REQUIRED,
             FC_PARELEMENT_SYN,
             FL_READONLY,
             FC_DETAILSQL,
             FK_GLOBALID';

      if smid_syn is not null then
        s := s || ',
             FK_QUERRY_SMID';
      end if;

      s := s || ')
          VALUES
            (' || NVL(TO_CHAR(SDF_ROW.FK_ID), 'NULL') ||
           ',v_rootsmid,' ||
           GET_STRING(SDF_ROW.FC_QUERRYSQL) || ',' ||
           GET_STRING(SDF_ROW.FC_SAVESQL) || ',' ||
           GET_STRING(SDF_ROW.FC_LISTSQL) || ',' ||
           GET_STRING(SDF_ROW.FC_SYNONYM) || ',' ||
           GET_STRING(SDF_ROW.FC_NAME) || ',' ||
           GET_STRING(SDF_ROW.FC_TYPE) || ',' ||
           GET_STRING(SDF_ROW.FC_PARMANAGER_SYN) || ',' ||
           GET_STRING(SDF_ROW.FC_ENTITYTYPE) || ',' ||
           NVL(TO_CHAR(SDF_ROW.FL_ISAUTOSAVE), 'NULL') || ',' ||
           NVL(TO_CHAR(SDF_ROW.FL_DEL), 'NULL') || ',' ||
           NVL(TO_CHAR(SDF_ROW.FL_REQUIRED), 'NULL') || ',' ||
           GET_STRING(SDF_ROW.FC_PARELEMENT_SYN) || ',' ||
           NVL(TO_CHAR(SDF_ROW.FL_READONLY), 'NULL') || ',' ||
           GET_STRING(SDF_ROW.FC_DETAILSQL) || ',' ||
           SDF_ROW.FK_GLOBALID;

      if smid_syn is not null then
        s := s || ',stat.pkg_statutil.GET_SMIDID(''' || smid_syn || ''')';
      end if;
      s := s || ') ' || sLineBreak ||
           ' RETURNING FK_ID INTO v_root_elementid;' || sLineBreak;
      DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(s), s);
      s := 'else '||sLineBreak||
           '  UPDATE TSMID SET '||sLineBreak||
           '   FC_NAME = '||GET_STRING(SDF_ROW.FC_NAME) || ',' ||sLineBreak||
           '   FC_TYPE = '||GET_STRING(SDF_ROW.FC_TYPE) ||sLineBreak||
           ' WHERE FK_ID = v_rootsmid;' ||sLineBreak||
           ' UPDATE T_SDF_ELEMENT SET ' ||sLineBreak||
           '   FC_QUERRYSQL     = '||GET_STRING(SDF_ROW.FC_QUERRYSQL) || ',' ||sLineBreak||
           '   FC_SAVESQL       = '||GET_STRING(SDF_ROW.FC_SAVESQL) || ',' ||sLineBreak||
           '   FC_LISTSQL       = '||GET_STRING(SDF_ROW.FC_LISTSQL) || ',' ||sLineBreak||
           '   FC_SYNONYM       = '||GET_STRING(SDF_ROW.FC_SYNONYM) || ',' ||sLineBreak||
           '   FC_NAME          = '||GET_STRING(SDF_ROW.FC_NAME) || ',' ||sLineBreak||
           '   FC_TYPE          = '||GET_STRING(SDF_ROW.FC_TYPE) || ',' ||sLineBreak||
           '   FC_PARMANAGER_SYN= '||GET_STRING(SDF_ROW.FC_PARMANAGER_SYN) || ',' ||sLineBreak||
           '   FC_ENTITYTYPE    = '||GET_STRING(SDF_ROW.FC_ENTITYTYPE) || ',' ||sLineBreak||
           '   FL_ISAUTOSAVE    = '||NVL(TO_CHAR(SDF_ROW.FL_ISAUTOSAVE), 'NULL') || ',' ||sLineBreak||
           '   FL_DEL           = '||NVL(TO_CHAR(SDF_ROW.FL_DEL), 'NULL') || ',' ||sLineBreak||
           '   FL_REQUIRED      = '||NVL(TO_CHAR(SDF_ROW.FL_REQUIRED), 'NULL') || ',' ||sLineBreak||
           '   FC_PARELEMENT_SYN= '||GET_STRING(SDF_ROW.FC_PARELEMENT_SYN) || ',' ||sLineBreak||
           '   FL_READONLY      = '||NVL(TO_CHAR(SDF_ROW.FL_READONLY), 'NULL') || ',' ||sLineBreak||
           '   FC_DETAILSQL     = '||GET_STRING(SDF_ROW.FC_DETAILSQL)||sLineBreak;
      if smid_syn is not null then
        s := s || ',
               FK_QUERRY_SMID    = stat.pkg_statutil.GET_SMIDID(''' || smid_syn || ''')'||sLineBreak;
       end if;
       s:=s||' WHERE FK_GLOBALID = '||SDF_ROW.FK_GLOBALID||';'||sLineBreak;
       s:=s||' end if; '||sLineBreak;
      DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(s), s);
    end loop;
    close c_row;

    open c_row for
      select * from T_SDF_ELEMENT where fk_owner = SDF_FormID;
    loop
      fetch c_row
        into SDF_ROW;
      exit when c_row%NOTFOUND;

      open c_smid for
        select fc_name, fc_type
          from asu.tsmid
         where fk_id = sdf_row.fk_smid;
      loop
        fetch c_smid
          into smid_row;
        exit when c_smid%NOTFOUND;

        s :=   ' select count(1),max(s.fk_id), max(s.fk_smid)'||sLineBreak||
               ' into v_cnt,v_elementid,v_smid'||sLineBreak||
               ' from T_SDF_ELEMENT s where s.fk_globalid = '||SDF_ROW.FK_GLOBALID||';'||sLineBreak;
        s := s||'  if v_cnt = 0 then  '||sLineBreak;
        s := s||'INSERT INTO TSMID
               (FK_OWNER,FC_NAME,FC_TYPE)
              VALUES
               (v_rootsmid,' ||
             GET_STRING(SDF_ROW.FC_NAME) || ',' ||
             GET_STRING(SDF_ROW.FC_TYPE) || ')' ||
             sLineBreak || ' RETURNING FK_ID INTO v_smid;' || sLineBreak;
        DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(s), s);
      end loop;
      close c_smid;

      SELECT MAX(FC_SYNONIM)
        INTO smid_syn
        FROM ASU.TSMID
       WHERE FK_ID = SDF_ROW.FK_QUERRY_SMID;
      if (smid_syn is null) and (SDF_ROW.FK_QUERRY_SMID is not null) then
        RAISE_APPLICATION_ERROR(-20001,
                                'Synonim is null.  TSMID.FK_ID = ' ||
                                SDF_ROW.FK_QUERRY_SMID);
      end if;

      s := 'INSERT INTO T_SDF_ELEMENT
            (FK_ID,
             FK_SMID,
             FC_QUERRYSQL,
             FC_SAVESQL,
             FC_LISTSQL,
             FC_SYNONYM,
             FC_NAME,
             FC_TYPE,
             FC_PARMANAGER_SYN,
             FC_ENTITYTYPE,
             FL_ISAUTOSAVE,
             FK_OWNER,
             FL_DEL,
             FL_REQUIRED,
             FC_PARELEMENT_SYN,
             FL_READONLY,
             FC_DETAILSQL,
             FK_GLOBALID';

      if smid_syn is not null then
        s := s || ',
             FK_QUERRY_SMID';
      end if;

      s := s || ')
          VALUES
            (' || NVL(TO_CHAR(SDF_ROW.FK_ID), 'NULL') ||
           ',v_smid,' || GET_STRING(SDF_ROW.FC_QUERRYSQL) || ',' ||
           GET_STRING(SDF_ROW.FC_SAVESQL) || ',' ||
           GET_STRING(SDF_ROW.FC_LISTSQL) || ',' ||
           GET_STRING(SDF_ROW.FC_SYNONYM) || ',' ||
           GET_STRING(SDF_ROW.FC_NAME) || ',' ||
           GET_STRING(SDF_ROW.FC_TYPE) || ',' ||
           GET_STRING(SDF_ROW.FC_PARMANAGER_SYN) || ',' ||
           GET_STRING(SDF_ROW.FC_ENTITYTYPE) || ',' ||
           NVL(TO_CHAR(SDF_ROW.FL_ISAUTOSAVE), 'NULL') ||
           ',v_root_elementid,' || NVL(TO_CHAR(SDF_ROW.FL_DEL), 'NULL') || ',' ||
           NVL(TO_CHAR(SDF_ROW.FL_REQUIRED), 'NULL') || ',' ||
           GET_STRING(SDF_ROW.FC_PARELEMENT_SYN) || ',' ||
           NVL(TO_CHAR(SDF_ROW.FL_READONLY), 'NULL') || ',' ||
           GET_STRING(SDF_ROW.FC_DETAILSQL) || ',' ||
           SDF_ROW.FK_GLOBALID;

      if smid_syn is not null then
        s := s || ',stat.pkg_statutil.GET_SMIDID(''' || smid_syn || ''')';
      end if;
      s := s || '); ' || sLineBreak;

      DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(s), s);
      s := 'else '||sLineBreak||
           '  UPDATE TSMID SET '||sLineBreak||
           '   FC_NAME = '||GET_STRING(SDF_ROW.FC_NAME) || ',' ||sLineBreak||
           '   FC_TYPE = '||GET_STRING(SDF_ROW.FC_TYPE) ||sLineBreak||
           ' WHERE FK_ID = v_smid;' ||sLineBreak||
           ' UPDATE T_SDF_ELEMENT SET ' ||sLineBreak||
           '   FC_QUERRYSQL     = '||GET_STRING(SDF_ROW.FC_QUERRYSQL) || ',' ||sLineBreak||
           '   FC_SAVESQL       = '||GET_STRING(SDF_ROW.FC_SAVESQL) || ',' ||sLineBreak||
           '   FC_LISTSQL       = '||GET_STRING(SDF_ROW.FC_LISTSQL) || ',' ||sLineBreak||
           '   FC_SYNONYM       = '||GET_STRING(SDF_ROW.FC_SYNONYM) || ',' ||sLineBreak||
           '   FC_NAME          = '||GET_STRING(SDF_ROW.FC_NAME) || ',' ||sLineBreak||
           '   FC_TYPE          = '||GET_STRING(SDF_ROW.FC_TYPE) || ',' ||sLineBreak||
           '   FC_PARMANAGER_SYN= '||GET_STRING(SDF_ROW.FC_PARMANAGER_SYN) || ',' ||sLineBreak||
           '   FC_ENTITYTYPE    = '||GET_STRING(SDF_ROW.FC_ENTITYTYPE) || ',' ||sLineBreak||
           '   FL_ISAUTOSAVE    = '||NVL(TO_CHAR(SDF_ROW.FL_ISAUTOSAVE), 'NULL') || ',' ||sLineBreak||
           '   FL_DEL           = '||NVL(TO_CHAR(SDF_ROW.FL_DEL), 'NULL') || ',' ||sLineBreak||
           '   FL_REQUIRED      = '||NVL(TO_CHAR(SDF_ROW.FL_REQUIRED), 'NULL') || ',' ||sLineBreak||
           '   FC_PARELEMENT_SYN= '||GET_STRING(SDF_ROW.FC_PARELEMENT_SYN) || ',' ||sLineBreak||
           '   FL_READONLY      = '||NVL(TO_CHAR(SDF_ROW.FL_READONLY), 'NULL') || ',' ||sLineBreak||
           '   FC_DETAILSQL     = '||GET_STRING(SDF_ROW.FC_DETAILSQL)||sLineBreak;
      if smid_syn is not null then
        s := s || ',
               FK_QUERRY_SMID    = stat.pkg_statutil.GET_SMIDID(''' || smid_syn || ''')'||sLineBreak;
       end if;
       s:=s||' WHERE FK_GLOBALID = '||SDF_ROW.FK_GLOBALID||';'||sLineBreak;
       s:=s||' end if; '||sLineBreak;
      DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(s), s);
    end loop;
    close c_row;
    s := '  :ElementID := v_root_elementid;'||sLineBreak;
    s := s||'end;';
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(s), s);
    return clTemp;
  end;

  function InsertElement(pSmidOwnerID NUMBER, pElementOwnerID NUMBER, pType VARCHAR2) return NUMBER
  is  --created by A.Nakorjakov 080708
    v_smid_id NUMBER;
    v_element_id NUMBER;
    v_global_id NUMBER;
    v_cnt NUMBER;
  begin
    if pSmidOwnerID>0 then
       insert into tsmid (fk_owner) values (pSmidOwnerID) returning fk_id into v_smid_id;
    else
       insert into tsmid (fk_owner) values (stat.pkg_statutil.get_smidid('DYNAMIC_FORMS')) returning fk_id into v_smid_id;
    end if;
    v_cnt := 1;
    while v_cnt > 0 loop
       select to_number(to_char(systimestamp,'yyyymmddhh24missff')) into v_global_id from dual;
       select count(1) into v_cnt from t_sdf_element t where t.fk_globalid = v_global_id;
    end loop;
    insert into t_sdf_element (fk_smid,fk_owner,fc_type,fk_globalid) values
       (v_smid_id,pElementOwnerID,pType,v_global_id) returning fk_id into v_element_id;
    return v_element_id;
  end;
END;
/

SHOW ERRORS;


