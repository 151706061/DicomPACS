DROP PACKAGE BODY ASU.PKG_NAZN
/

--
-- PKG_NAZN  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_NAZN" 
IS

-- ��� ������ � ������������
-- Author: Ura

--------------------------------------------------------------------------------
-- ��� ������������ ������ ��������
TYPE v_Reception_table_type  IS TABLE OF INTEGER
  INDEX BY BINARY_INTEGER;
v_Reception_table v_Reception_table_type;

--------------------------------------------------------------------------------
PROCEDURE del_reception_all_child(p_FK_ID IN INTEGER)
IS
BEGIN
-- ������� ��������� ������
  DELETE FROM TRECEPTION_PVV pvv
        WHERE pvv.FK_RECEPTION =p_fk_id;

  DELETE FROM TRECEPTION_PVD pvd
        WHERE pvd.FK_RECEPTION =p_fk_id;

  DELETE FROM TRECEPTION_PVN pvn
        WHERE pvn.FK_RECEPTION =p_fk_id;

  DELETE FROM TRECEPTION_FBLOBS
        WHERE FK_RECEPTION=p_fk_id;

  DELETE FROM TRECEPT_USLUG
        WHERE FK_RECEPTION=p_fk_id;
END;
--------------------------------------------------------------------------------
-- �������� ���� ����� ��� �����������
PROCEDURE Del_AllChild(p_FK_ID in Integer)
IS
CURSOR recpt_cur IS
     SELECT nr.fk_id
       FROM TRECEPTION nr
      WHERE nr.fk_nazn = p_fk_id;
  v_Recept INTEGER;
BEGIN

-- ������� ������
  OPEN recpt_cur;
  LOOP
    FETCH recpt_cur INTO v_Recept;
    EXIT WHEN recpt_cur%NOTFOUND ; -- Typical usage (Modify to suit current needs)
    del_reception_all_child(v_Recept);
  END LOOP;
  CLOSE recpt_cur;

  DELETE FROM TRECEPTION WHERE fk_nazn = p_fk_id;

-- ���� ���� �� �������� ����� ��������
    DELETE FROM tnazn_pv_number   WHERE fk_nazn = p_fk_id;
    DELETE FROM tnazn_pv_date     WHERE fk_nazn = p_fk_id;
    DELETE FROM tnazn_pv_varchar   WHERE fk_nazn = p_fk_id;

    DELETE FROM tnazn_fblobs     WHERE fk_nazn_id = p_fk_id;
    DELETE FROM tfile_contents
          WHERE fk_id IN (SELECT nb.fk_blob_id
                            FROM tnazn_fblobs nb
                           WHERE fk_nazn_id = p_fk_id);
END; --Del_AllChild

--------------------------------------------------------------------------------
-- �������� ����������
PROCEDURE Del_Nazn(p_FK_ID in Integer)
IS
BEGIN
  Del_AllChild(p_FK_ID);
  DELETE FROM TNAZN WHERE FK_ID=p_FK_ID;
END; --Del_Nazn
--------------------------------------------------------------------------------
-- ���������� ����� ��������� ��� ����������
-- ���� ��������� �� ������, �� ���������� ���������� ����� ��������� '1' - ����������
-- Author: Ura
-- 2004.03.10 - ���������� ��� ����� � ��������� ����������
-- �� Get_RECEPTION_KratnMask
FUNCTION Get_KratnMask(p_NAZN_ID IN INTEGER) RETURN Varchar
IS
  retval varchar(6);
  vFK_SMID INTEGER;
  vFK_SMID_NAZN INTEGER;

BEGIN
  SELECT NZ.fk_smid INTO vFK_SMID_NAZN FROM TNAZN NZ WHERE NZ.fk_id=p_NAZN_ID;
  -- ������� fk_id �������� � ������
  SELECT DISTINCT(TS.fk_owner) INTO vFK_SMID
  FROM tsmid TS
  WHERE fk_loinc_code>-1
  CONNECT BY PRIOR TS.fk_id=TS.fk_owner
  START WITH TS.fk_id=vFK_SMID_NAZN;

  -- ����� �������� ���������� ������� �� ���� ������
  SELECT
    SM.fk_loinc_code INTO retval
  FROM
    TNAZN_PV_NUMBER PV
    ,TSMID SM
  WHERE
    PV.FK_NAZN=p_NAZN_ID
    AND PV.fk_smid=vFK_SMID
    AND SM.fk_id=PV.fn;

  -- ������� �� �������� ���������
  RETURN retval;

  EXCEPTION
      WHEN NO_DATA_FOUND THEN  RETURN '1';

END;--Get_KratnMask
--------------------------------------------------------------------------------
-- ���������� ��� ��������� � TSMID
FUNCTION Get_SMID_Kratn(p_SMID_ID IN INTEGER) RETURN INTEGER
AS
  vRet INTEGER;
BEGIN
  SELECT DISTINCT(TS.fk_id) INTO vRet
  FROM tsmid TS
  WHERE
    TS.fc_synonim ='KRATN'
  CONNECT BY PRIOR TS.fk_id=TS.FK_OWNER
  START WITH TS.fk_id=p_SMID_ID;

  RETURN vRet;
  -- �������� ���������������, ���� ���� ��������� ���� � � ���������� ���������
END; --Get_SMID_Kratn
--------------------------------------------------------------------------------
-- ���������� ����� ��������� ��� ������
-- ���� ��������� �� ������, �� ���������� ���������� ����� ��������� '1' - ����������
-- Author: Ura
FUNCTION Get_RECEPTION_KratnMask(p_RECEPTION_ID IN INTEGER) RETURN Varchar
IS
  retval varchar(6);
  vFK_SMID INTEGER;
  vFK_SMID_RECEPTION INTEGER;

BEGIN
  SELECT RC.fk_smid INTO vFK_SMID_RECEPTION FROM TRECEPTION RC WHERE RC.fk_id=p_RECEPTION_ID;
  -- ������� fk_id �������� � ������
  vFK_SMID:= Get_SMID_Kratn(vFK_SMID_RECEPTION);

  -- ����� �������� ���������� ������� �� ���� ������
  SELECT
    SM.fk_loinc_code INTO retval
  FROM
    TRECEPTION_PVN PV
    ,TSMID SM
  WHERE
    PV.fk_reception=p_RECEPTION_ID
    AND PV.fk_smid=vFK_SMID
    AND SM.fk_id=PV.fn;

  -- ������� �� �������� ���������
  RETURN retval;

  EXCEPTION
      WHEN NO_DATA_FOUND THEN  RETURN '1';

END;--Get_RECEPTION_KratnMask

--------------------------------------------------------------------------------
-- ���������� ���������� fk_smid ��� ����������
-- 2004.03.10 - ��� ����� ������, ������ � TSMID ������ ���� �������� ����� KOL_VO
-- �� GET_SMID_NUMBER1
FUNCTION GET_SMID_NUMBER(p_SMID_ID IN INTEGER) RETURN INTEGER
AS
  vRet INTEGER;
BEGIN
  SELECT DISTINCT(TS.fk_id) INTO vRet
  FROM tsmid TS
  WHERE fk_loinc_code='-1'
  CONNECT BY PRIOR TS.fk_id=TS.fk_owner
  START WITH TS.fk_id=p_SMID_ID;

  RETURN vRET;
  EXCEPTION
      WHEN NO_DATA_FOUND THEN  RETURN 0;

END;
--------------------------------------------------------------------------------
-- ���������� ���������� fk_smid ��� ����������
-- 2004.03.10 - ��� ����� ������, ������ � TSMID ������ ���� �������� ������� KOL_VO
-- �� GET_SMID_NUMBER1
FUNCTION GET_SMID_NUMBER1(p_SMID_ID IN INTEGER) RETURN INTEGER
AS
  vRet INTEGER;
BEGIN
  SELECT DISTINCT(TS.fk_id) INTO vRet
  FROM tsmid TS
  WHERE
    TS.fc_synonim ='KOL_VO'
  CONNECT BY PRIOR TS.fk_id=TS.fk_owner
  START WITH TS.fk_id=p_SMID_ID;

  RETURN vRET;
  EXCEPTION
      WHEN NO_DATA_FOUND THEN  RETURN 0;

END; --GET_SMID_NUMBER1

--------------------------------------------------------------------------------
-- ���������� ���������� �������� ��� ���������� ������ �� ����������
FUNCTION GET_NAZN_PROC_NUMBER(p_NAZN_ID IN INTEGER) RETURN INTEGER
AS
  vRet INTEGER;
  vSMID_NUM INTEGER;
  vSMID_NAZN INTEGER;
BEGIN

  SELECT NZ.fk_smid  into vSMID_NAZN
    FROM TNAZN NZ
  WHERE NZ.fk_id=p_NAZN_ID;

  vSMID_NUM:=GET_SMID_NUMBER(vSMID_NAZN);
  IF vSMID_NUM=0 THEN -- �������� �� �������
    RETURN 1;
  END IF;

  SELECT PV.FN INTO vRet  -- ������� �������� �� TSMID
    FROM TNAZN_PV_NUMBER PV
   WHERE PV.FK_NAZN=p_NAZN_ID AND PV.fk_smid=vSMID_NUM;

  RETURN vRET;

  EXCEPTION
    WHEN NO_DATA_FOUND THEN  RETURN 1;


END; --GET_NAZN_PROC_NUMBER
--------------------------------------------------------------------------------
-- ���������� ���������� �������� ��� ������ ������ �� ����������
FUNCTION GET_RECEPTION_PROC_NUMBER(p_RECEPTION_ID IN INTEGER) RETURN INTEGER
AS
  vRet INTEGER;
  vSMID_NUM INTEGER;
  vSMID_RECEPTION INTEGER;
BEGIN

  SELECT R.fk_smid  into vSMID_RECEPTION
    FROM TRECEPTION R
  WHERE R.fk_id=p_RECEPTION_ID;

  vSMID_NUM:=GET_SMID_NUMBER1(vSMID_RECEPTION);
  IF vSMID_NUM=0 THEN -- �������� �� �������
    RETURN 1;
  END IF;

  SELECT PV.FN INTO vRet  -- ������� �������� �� TSMID
    FROM TRECEPTION_PVN PV
   WHERE PV.fk_reception=p_RECEPTION_ID AND PV.fk_smid=vSMID_NUM;

  RETURN vRET;

  EXCEPTION
    WHEN NO_DATA_FOUND THEN  RETURN 1;


END;

--------------------------------------------------------------------------------
-- � ����������� �� ����� � ������� ����������� ��������� ���� ��� ���������
-- ������� ��� ����������� � ������� plvdate
-- � ������� � �����
PROCEDURE Get_NextProcDate(p_MASK IN VARCHAR, p_MASK_POS IN OUT INTEGER, p_Date IN OUT DATE )
IS
BEGIN
    -- TODO:������ �������� �� �������!!!

  IF LENGTH(p_MASK)=p_MASK_POS THEN
    p_MASK_POS:=0;
  END IF;
  p_MASK_POS:=p_MASK_POS+1;
-- Zhukov �������������, ����� �� ������������ plvision  
--  p_Date:= PLVISION.plvdate.next_bizday(p_Date);
  p_Date := p_Date +1;
  WHILE SUBSTR(p_MASK,p_MASK_POS,1)<>'1' LOOP
    IF LENGTH(p_MASK)=p_MASK_POS THEN
      p_MASK_POS:=0;
    END IF;
    p_MASK_POS:=p_MASK_POS+1;
-- Zhukov �������������, ����� �� ������������ plvision  
--    p_Date:= PLVISION.plvdate.next_bizday(p_Date);
    p_Date := p_Date +1;

  END LOOP;
END;

--------------------------------------------------------------------------------
-- ��������� ���������� � ���������, ����������� �� ���������� ���������
-- ������ ������ ��������� ������ ���� ��� ��������� - ������ ���� ��� �����
/*PROCEDURE Create_PROC_Result(p_NAZN_ID in integer)
IS
  vSMIDROOT INTEGER;
  vSMID INTEGER;
  vNUM  INTEGER;  -- ����������
  vKRAT VARCHAR(6); -- ���������
  vKRAT_POS INTEGER;
  J INTEGER;
  vFK_VRACH INTEGER;
  vFC_COMMENT VARCHAR(250);
  vFK_KABINET_ID INTEGER;
  vFK_SOTR INTEGER;
  vFD_EXECUTION DATE;
BEGIN
  -- �������� ���

  SELECT PKG_SMID.GetRootLevelID(N.fk_smid), N.fk_smid into vSMIDROOT , vSMID
  FROM TNAZN N
  WHERE N.fk_id=p_NAZN_ID;
  -- ��������� ���������� � ���������
  IF vSMIDROOT<>Get_ProcID() THEN
    -- ��� �� ��������� � ��������� ��� ������ ���
    RETURN;
  END IF;
  commit;
  -- ������� ����������
  vNUM:=GET_NAZN_PROC_NUMBER(p_NAZN_ID);
  -- ������� �� ��������� ������������ ����������
  SELECT COUNT(*) INTO J FROM TNAZNRES NR WHERE NR.fk_nazn=p_NAZN_ID;
  if J<>1 THEN
    RAISE_APPLICATION_ERROR(-20100, 'Create_PROC_Result: ������� ��������� ������� ����������');
    RETURN;
  END IF;

  IF vNum<2 THEN
    -- ���� �� ��� ��� � ��� ��� ���������
    RETURN;
  END IF;

--������� ��������� ��������� ��� ���������� �� ������ ������ � �����������
  SELECT  FK_VRACH ,FC_COMMENT ,FK_KABINET_ID ,FK_SOTR ,FD_EXECUTION
  INTO   vFK_VRACH ,vFC_COMMENT,vFK_KABINET_ID,vFK_SOTR,vFD_EXECUTION
  FROM TNAZNRES
  WHERE FK_NAZN=p_NAZN_ID;

  vKRAT:=Get_KratnMask(p_NAZN_ID);--������� ����� ��������� ��������
  vKRAT_POS:=1;
  FOR J In 2..vNUM LOOP
    -- ��������� ���� ����
    Get_NextProcDate(vKRAT,vKRAT_POS,vFD_EXECUTION);
    -- ������ ����� � ��������!
    INSERT INTO  TNAZNRES
           (FK_VRACH , FK_STATUS , FK_NAZN , FK_KABINET_ID , FK_SOTR , FD_EXECUTION )
    VALUES (vFK_VRACH,1          ,p_NAZN_ID, vFK_KABINET_ID,vFK_SOTR,vFD_EXECUTION);
  END LOOP;

END; --Create_PROC_Result
*/
--------------------------------------------------------------------------------
-- �������� ��������� ������ �� p_SOURCE_RECEPT_ID � p_DEST_RECEPT_ID
PROCEDURE COPY_RECEPTION_PARAMS(p_SOURCE_RECEPT_ID IN INTEGER, p_DEST_RECEPT_ID IN INTEGER)
AS
BEGIN
  INSERT INTO TRECEPTION_PVN (FK_RECEPTION,FN,FK_SMID)
  SELECT p_DEST_RECEPT_ID,FN,FK_SMID
  FROM TRECEPTION_PVN PV
  WHERE PV.fk_reception=p_SOURCE_RECEPT_ID;

  INSERT INTO TRECEPTION_PVD (FK_RECEPTION,FD,FK_SMID)
  SELECT p_DEST_RECEPT_ID,FD,FK_SMID
  FROM TRECEPTION_PVD PD
  WHERE PD.fk_reception=p_SOURCE_RECEPT_ID;

  INSERT INTO TRECEPTION_PVV (FK_RECEPTION,FV,FK_SMID)
  SELECT p_DEST_RECEPT_ID,FV,FK_SMID
  FROM TRECEPTION_PVV PV
  WHERE PV.fk_reception=p_SOURCE_RECEPT_ID;


END;--COPY_RECEPTION_PARAMS

--------------------------------------------------------------------------------
-- ��������� ������ � ���������, ����������� �� ���������� �����f
PROCEDURE Create_PROC_Receptions(p_RECEPTION_ID in integer)
IS
  vSMIDROOT INTEGER;
  vSMID INTEGER;
  vNUM  INTEGER;  -- ����������
  vKRAT VARCHAR(6); -- ���������
  vKRAT_POS INTEGER;
  J INTEGER;
  vFK_VRACH INTEGER;
  vFC_COMMENT VARCHAR(250);
  vFK_KABINET_ID INTEGER;
  vFK_SOTR INTEGER;
  vFD_EXECUTION DATE;
  vNAZN_ID INTEGER;
  vNEW_RC_ID INTEGER;
BEGIN
  -- �������� ���

  SELECT PKG_SMID.GetRootLevelID1(R.fk_smid), R.fk_smid, R.fk_nazn
    INTO vSMIDROOT , vSMID,vNAZN_ID
    FROM TRECEPTION R
   WHERE R.fk_id=p_RECEPTION_ID;
  -- ��������� ���������� � ���������
  IF vSMIDROOT<>PKG_CORE.get_constbyname('RAZDEL_PROC') THEN
    -- ��� �� ��������� � ��������� ��� ������ ���
    RETURN;
  END IF;
  -- ������� ����������
  vNUM:=GET_RECEPTION_PROC_NUMBER(p_RECEPTION_ID);
  -- ������� �� ��������� ������������ ����������
  SELECT COUNT(*) INTO J FROM TRECEPTION NR WHERE NR.fk_id=p_RECEPTION_ID;
  if J<>1 THEN
    RAISE_APPLICATION_ERROR(-20100, 'Create_PROC_Result: ������� ��������� ������� ������');
    RETURN;
  END IF;

  IF vNum<2 THEN
    RETURN; -- ���� �� ��� ��� � ��� ��� ���������
  END IF;
--������� ��������� ��������� ��� ���������� �� ������ ������ � �����������
  SELECT  FK_VRACH ,FK_KABINET_ID ,FK_SOTR ,FD_EXECUTION
  INTO   vFK_VRACH ,vFK_KABINET_ID,vFK_SOTR,vFD_EXECUTION
  FROM TRECEPTION
  WHERE FK_ID=p_RECEPTION_ID;

  vKRAT:=Get_RECEPTION_KratnMask(p_RECEPTION_ID);--������� ����� ��������� ������
  vKRAT_POS:=1;
  FOR J In 2..vNUM LOOP
    -- ��������� ���� ����
    Get_NextProcDate(vKRAT,vKRAT_POS,vFD_EXECUTION);
    -- ������ ����� � ��������!
    INSERT INTO  TRECEPTION
           (FK_VRACH , FK_STATUS , FK_NAZN , FK_KABINET_ID , FK_SOTR , FD_EXECUTION,FK_SMID )
    VALUES (vFK_VRACH,1          ,vNAZN_ID, vFK_KABINET_ID,vFK_SOTR,vFD_EXECUTION,vSMID)
    RETURN FK_ID INTO vNEW_RC_ID;
    -- � ��� ����� ��� ������� ������ ����������� ���������
    COPY_RECEPTION_PARAMS(p_RECEPTION_ID,vNEW_RC_ID);
  END LOOP;

END; --Create_PROC_Reseptions

--------------------------------------------------------------------------------
-- �������� ���������� ��� ����������� �������� �� ������ ������ �� �������
procedure Add_NAZN_BY_Template_Element(p_Pac_ID in Integer,p_DOC_ID IN Integer
    , p_TEMPLATES_SMID_ID IN Integer, p_Creator_ID IN INTEGER)
IS
  v_NAZN_ID Integer;
  v_SMID_ID Integer;
  v_RECEPT_ID INTEGER;
begin
  -- ������� SMID ����������
  Select TS.fk_smid_id into v_SMID_ID
  from TSMID_TEMPLATES_SMID TS
  where TS.fk_ID=p_TEMPLATES_SMID_ID;

  -- �������� ����������
  INSERT INTO  TNAZN ( FK_DOC_ID , FK_PAC_ID , FK_STATUS , FK_CREATOR , FK_SMID )
  Values  (p_DOC_ID, p_Pac_ID, 1,p_Creator_ID, v_SMID_ID)
  return FK_ID into v_NAZN_ID;

  -- ������ ��������� �� ���������� �� ��������������� ������
/*  INSERT INTO  TNAZN_PV_NUMBER( FK_NAZN , FN , FK_SMID )
    SELECT v_NAZN_ID,FN, FK_SMID
      FROM  TSMID_TEMPL_PV_NUM PV
     WHERE  PV.fk_smid_templ_smid=p_TEMPLATES_SMID_ID;

  INSERT INTO  TNAZN_PV_DATE( FK_NAZN , FD , FK_SMID )
    SELECT v_NAZN_ID,FD, FK_SMID
      FROM TSMID_TEMPL_PV_DATE PV
     WHERE  PV.fk_smid_templ_smid=p_TEMPLATES_SMID_ID;

  INSERT INTO  TNAZN_PV_VARCHAR( FK_NAZN , FV , FK_SMID )
    SELECT v_NAZN_ID,FV, FK_SMID
      FROM TSMID_TEMPL_PV_VAR PV
     WHERE  PV.fk_smid_templ_smid=p_TEMPLATES_SMID_ID;
*/
  -- ������ ���������� !!!
--  INSERT INTO  TNAZNRES
--         ( FK_STATUS , FK_NAZN ,  FK_SOTR )
--  VALUES (1          ,v_NAZN_ID, p_Creator_ID);

  -- ������
  INSERT INTO TRECEPTION
    (FK_STATUS,FK_NAZN,FK_SOTR,FK_SMID)
  VALUES (1          ,v_NAZN_ID, p_Creator_ID,v_SMID_ID)
  RETURN FK_ID INTO v_RECEPT_ID;
-- ��������� �������

  INSERT INTO  TRECEPTION_PVN( fk_reception, FN , FK_SMID )
    SELECT v_RECEPT_ID,FN, FK_SMID
      FROM  TSMID_TEMPL_PV_NUM PV
     WHERE  PV.fk_smid_templ_smid=p_TEMPLATES_SMID_ID;

  INSERT INTO  TRECEPTION_PVD( fk_reception , FD , FK_SMID )
    SELECT v_RECEPT_ID,FD, FK_SMID
      FROM TSMID_TEMPL_PV_DATE PV
     WHERE  PV.fk_smid_templ_smid=p_TEMPLATES_SMID_ID;

  INSERT INTO  TRECEPTION_PVV( fk_reception , FV , FK_SMID )
    SELECT v_RECEPT_ID,FV, FK_SMID
      FROM TSMID_TEMPL_PV_VAR PV
     WHERE  PV.fk_smid_templ_smid=p_TEMPLATES_SMID_ID;



--  Create_PROC_Result(v_NAZN_ID);
  Create_PROC_Receptions(v_RECEPT_ID);
end; -- Add_NAZN_BY_Template_Element

--------------------------------------------------------------------------------
-- �������� �������� �� ������ ������� ����������
PROCEDURE Add_NAZN_BY_Template(p_Pac_ID in Integer,p_DOC_ID IN Integer
    , p_Templ_ID IN Integer, p_Creator_ID IN INTEGER)
IS
BEGIN
  FOR NAZN_EL IN (
    SELECT FK_ID FROM TSMID_TEMPLATES_SMID WHERE FK_SMID_TEMPLATE_ID=p_Templ_ID
  ) LOOP
    Add_NAZN_BY_Template_Element(p_Pac_ID,p_DOC_ID,NAZN_EL.FK_ID,p_Creator_ID);
  END LOOP;

END; -- Add_NAZN_BY_Template
--------------------------------------------------------------------------------
-- ���������� �������� ��������� ������
-- ���� �������� ���������� �� ���������� ������ ������
--  ! �� ����� �������� �� ���������� �������
FUNCTION Get_RECEPTION_PARAM_DESC(p_SMID_ID IN INTEGER,p_RECEPTION_ID IN INTEGER
  ,p_Type IN VARCHAR )RETURN VARCHAR
IS
  vRET varchar(2000);
  v_RET_tmp varchar(2000);
  v_Razdel varchar(2);
  CURSOR varcharValues(pc_SMID_ID IN INTEGER,pc_RECEPTION_ID IN INTEGER)
    IS
      SELECT FV
        FROM TRECEPTION_PVV PV
       WHERE PV.fk_smid=p_SMID_ID AND PV.fk_reception=p_RECEPTION_ID;
BEGIN
  v_Razdel:='';
  IF p_Type='NUMBER' THEN
    SELECT TO_CHAR(FN) INTO vRET
      FROM TRECEPTION_PVN PV
     WHERE PV.fk_smid=p_SMID_ID AND PV.fk_reception=p_RECEPTION_ID;
  ELSIF (p_Type='EDIT' OR p_Type='MEMO') THEN
    SELECT FV INTO vRET
      FROM TRECEPTION_PVV PV
     WHERE PV.fk_smid=p_SMID_ID AND PV.fk_reception=p_RECEPTION_ID;
  ELSIF p_Type='COMBOBOX' THEN
    SELECT SM.fc_name INTO vRET
      FROM TRECEPTION_PVN PV
           ,TSMID SM
     WHERE PV.fk_smid=p_SMID_ID
       AND PV.fk_reception=p_RECEPTION_ID
       AND SM.fk_id=FN;

  ELSIF p_Type='VARCHAR' THEN
    -- ����� ... ���

    OPEN varcharValues(p_SMID_ID,p_RECEPTION_ID);
    LOOP
      FETCH varcharValues INTO v_RET_tmp;
      EXIT WHEN varcharValues%NOTFOUND;
      vRET:=vRET||v_Razdel||v_RET_tmp;
      v_Razdel:=', ';
    END LOOP;--varcharValues
    CLOSE varcharValues;
    IF vRET<>'' THEN
      vRET:='('||vRET||')';
    END IF;

  END IF;  --VARCHAR

  RETURN vRET;
  EXCEPTION
      WHEN OTHERS THEN  RETURN NULL;
END; --Get_RECEPTION_PARAM_DESC
--------------------------------------------------------------------------------
FUNCTION Get_RECEPTION_Description(p_SMID_ID IN INTEGER, p_RECEPTION_ID IN INTEGER ) RETURN VARCHAR
IS
  CURSOR smidform(pSMID NUMBER)  -- ������ ������� ����
      IS
         SELECT fk_id
           FROM tsmid
          WHERE (fk_id = pSMID or fk_owner=pSMID)
            AND (fp_inout=0 or  fp_inout is null)
            AND (fc_type='FORM' or fc_type='TABLE' or fc_type='FOLDER')
          ORDER BY fn_order;

  CURSOR formControls(pSMID NUMBER)  -- ������ ��������� �� �����
      IS
    SELECT fk_id, fc_name,fc_type
      FROM tsmid
     WHERE fk_owner=pSMID
     ORDER BY fn_order;

  ret_str varchar2(4000);
  v_Name Varchar2(4000);
  v_type varchar2(50);
  v_SMIDFORM INTEGER;
  v_ID_CONTROL INTEGER;
  v_CONTROL_NAME varchar(100);
  v_RazdelChar varchar(2);
  v_ControlType varchar(20);
  v_ControlValue VARCHAR(4000);
BEGIN
  v_RazdelChar:=' '; -- �����������
  -- ! GetFullPath �������� ��� ����� ���� ��� ������ � TSMID ����� �������� � ������ ������
  SELECT Get_FullPath(p_SMID_ID) INTO ret_str FROM DUAL;
  ret_str:=ret_str||':';
  -- �������� �������� �� ���� ������� ���� ����
  OPEN smidform(p_SMID_ID);
  LOOP
    FETCH smidform INTO v_SMIDFORM;
    EXIT WHEN smidform%NOTFOUND;
    -- �� ���� ���������� � �����
    OPEN formControls(v_SMIDFORM);
    LOOP
      FETCH formControls INTO v_ID_CONTROL,v_CONTROL_NAME,v_ControlType;
      EXIT WHEN formControls%NOTFOUND;
      -- ������� �������� ��������� ��� ����������� ������
      --- �����
      v_ControlValue:=Get_RECEPTION_PARAM_DESC(v_ID_CONTROL , p_RECEPTION_ID,v_ControlType);
      if v_ControlValue IS NOT NULL THEN
        ret_str:=ret_str||v_RazdelChar||v_CONTROL_NAME||':'||v_ControlValue;
        v_RazdelChar:=', ';
      END IF;
    END LOOP; --formControls
    CLOSE formControls;

  END LOOP; --smidform

  CLOSE smidform;

  RETURN ret_str;
END; --Get_RECEPTION_Description
--------------------------------------------------------------------------------
-- ���������� �������� ���������� �� ������� ������
FUNCTION GET_NAZN_DESCR_BY_RECEPT(p_NAZN_ID IN INTEGER,p_SMID_ID IN INTEGER) RETURN VARCHAR
IS
  vRECEPT INTEGER;
  vRET VARCHAR(4000);
BEGIN
  SELECT MIN(fk_id) INTO vRECEPT
    FROM TRECEPTION R
   WHERE R.fk_nazn=p_NAZN_ID and R.fk_smid=p_SMID_ID;
  vRET:=Get_RECEPTION_Description(p_SMID_ID,vRECEPT);
  RETURN vRET;


END;  --GET_NAZN_DESCR_BY_RECEPT
--------------------------------------------------------------------------------
-- ������������� ������� ��� ������������� ������ ����������� ��������
PROCEDURE init_Recept_Table
AS
BEGIN
  v_Reception_table.delete;
END;--init_Recept_Table
--------------------------------------------------------------------------------
--��������� ����� ������ ��������
PROCEDURE add_recept_to_list(p_recept INTEGER)
AS
BEGIN
  v_Reception_table(NVL(v_Reception_table.LAST,0)+1):=p_recept;
END;--add_recept_to_list
--------------------------------------------------------------------------------
-- ���������� ������� � ���������� � ����������� �� �������� �������, �������� � ����������
-- REMARK:
--   ����� ���������������, ������ ������� ������������ ����������
PROCEDURE CALC_STATUS_ON_NAZN
IS
  v_Recep INTEGER;
  v_CountAllRECEPT INTEGER;
  v_fk_nazn INTEGER;
  v_Status INTEGER;
  v_CountEqStatusRECEPT INTEGER;
  v_CountStatus1 INTEGER; --���
  v_CountStatus2 INTEGER; --�����
  v_CountStatus3 INTEGER;
  v_CountStatus4 INTEGER;
  v_CountStatus5 INTEGER;

BEGIN
  v_Recep:=v_Reception_table.FIRST;
  LOOP
    EXIT WHEN v_Recep IS NULL;

    SELECT R.fk_nazn,R.fk_status INTO v_fk_nazn,v_Status
      FROM TRECEPTION R
     WHERE R.fk_id=v_Reception_table(v_Recep);

    -- ���������� ������� � ����������
    SELECT COUNT(*) INTO v_CountAllRECEPT
    FROM TRECEPTION R
     WHERE  R.fk_nazn=v_fk_nazn;

    -- ���������� ������� � ���������� � ����� �� ��������
    SELECT COUNT(*) INTO v_CountEqStatusRECEPT
      FROM TRECEPTION R
     WHERE  R.fk_nazn=v_fk_nazn
       AND R.fk_status=v_Status;

    IF v_CountAllRECEPT=v_CountEqStatusRECEPT THEN
      UPDATE TNAZN
         SET fk_status=v_Status
       WHERE fk_id=v_fk_nazn;
    ELSE
      -- ������� �������
      SELECT COUNT(*) INTO v_CountStatus1
        FROM TRECEPTION R
       WHERE  R.fk_nazn=v_fk_nazn
         AND R.fk_status=1;

      SELECT COUNT(*) INTO v_CountStatus2
        FROM TRECEPTION R
       WHERE  R.fk_nazn=v_fk_nazn
         AND R.fk_status=2;

      SELECT COUNT(*) INTO v_CountStatus4
        FROM TRECEPTION R
       WHERE  R.fk_nazn=v_fk_nazn
         AND R.fk_status=4;

      SELECT COUNT(*) INTO v_CountStatus5
        FROM TRECEPTION R
       WHERE  R.fk_nazn=v_fk_nazn
         AND R.fk_status=5;

      IF v_CountStatus1>0  THEN
        -- ���� ����������� �������
        UPDATE TNAZN
           SET fk_status=4  -- �����������
         WHERE fk_id=v_fk_nazn;
      ELSE
        UPDATE TNAZN
           SET fk_status=2  -- ��������
         WHERE fk_id=v_fk_nazn;
      END IF;
    END IF;

    v_Recep:=v_Reception_table.NEXT(v_Recep);
  END LOOP;
  RETURN;
END;

END;
/

SHOW ERRORS;


