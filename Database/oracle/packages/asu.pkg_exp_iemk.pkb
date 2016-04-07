DROP PACKAGE BODY ASU.PKG_EXP_IEMK
/

--
-- PKG_EXP_IEMK  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU.PKG_EXP_IEMK IS

CR           VARCHAR2(2)    := CHR(13)||CHR(10);
sTmp         VARCHAR2(32767);
pBeginXML_66 VARCHAR(10000) := '<?xml version="1.0" encoding="UTF-8"?>' || CR || '<te:�����_66 xmlns:oe="http://schemas.openehr.org/v1"' || CR ||
             ' xmlns:te="http://schemas.oceanehr.com/templates"' || CR || ' xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"' || CR ||
             ' xsi:schemaLocation="http://schemas.oceanehr.com/templates file:/U:/%D0%9F%D0%A0%D0%9E%D0%95%D0%9A%D0%A2%D0%AB/%D0%A0%D0%9C%D0%98%D0%A1%20%D0%A5%D0%9C%D0%90%D0%9E/XSD/xsd/OxygenProject/Form%20066.xsd" archetype_node_id="openEHR-EHR-COMPOSITION.form_66.v1" type="COMPOSITION" template_id="openEHR-ADMIN-ENTRY.t_form_66.v1">' || CR ||
             '    <te:name>' || CR || '        <te:value>����� 66</te:value>' || CR ||
             '    </te:name>' || CR || '    <te:language>' || CR || '        <te:terminology_id>' || CR ||
             '            <te:value>ISO_639-1</te:value>' || CR || '        </te:terminology_id>' || CR ||
             '        <te:code_string>en</te:code_string>' || CR || '    </te:language>' || CR ||
             '    <te:territory>' || CR || '        <te:terminology_id>' || CR ||
             '            <te:value>ISO_3166-1</te:value>' || CR || '        </te:terminology_id>' || CR ||
             '        <te:code_string>RU</te:code_string>' || CR || '    </te:territory>' || CR ||
             '    <te:category>' || CR || '        <te:value>persistent</te:value>' || CR ||
             '        <te:defining_code>' || CR || '            <te:terminology_id>' || CR ||
             '                <te:value>openehr</te:value>' || CR || '            </te:terminology_id>' || CR ||
             '            <te:code_string>431</te:code_string>' || CR || '        </te:defining_code>' || CR ||
             '    </te:category>' || CR || '    <te:composer xsi:type="oe:PARTY_IDENTIFIED">' || CR ||
             '    </te:composer>' || CR || '    <te:�����_���������� archetype_node_id="openEHR-EHR-ADMIN_ENTRY.general_information.v1" type="ADMIN_ENTRY">' || CR ||
             '        <te:name>' || CR || '            <te:value>����� ����������</te:value>' || CR ||
             '        </te:name>' || CR || '        <te:language>' || CR ||
             '            <te:terminology_id>' || CR || '                <te:value>ISO_639-1</te:value>' || CR ||
             '            </te:terminology_id>' || CR || '            <te:code_string>en</te:code_string>' || CR ||
             '        </te:language>' || CR || '        <te:encoding>' || CR ||
             '            <te:terminology_id>' || CR || '                <te:value>IANA_character-sets</te:value>' || CR ||
             '            </te:terminology_id>' || CR || '            <te:code_string>UTF-8</te:code_string>' || CR ||
             '        </te:encoding>' || CR || '        <te:subject>' || CR || '        </te:subject>';
             
             
             
pBeginXml_25 VARCHAR2(10000) := '<?xml version="1.0" encoding="UTF-8"?>' || CR ||'<te:�����_025 xmlns:oe="http://schemas.openehr.org/v1"' || CR ||
' xmlns:te="http://schemas.oceanehr.com/templates"' || CR ||' xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"' || CR ||
' xsi:schemaLocation="http://schemas.oceanehr.com/templates file:/U:/%D0%9F%D0%A0%D0%9E%D0%95%D0%9A%D0%A2%D0%AB/%D0%A0%D0%9C%D0%98%D0%A1%20%D0%A5%D0%9C%D0%90%D0%9E/XSD/xsd/OxygenProject/Form%20025.xsd" archetype_node_id="openEHR-EHR-COMPOSITION.examination_025.v1" type="COMPOSITION" template_id="Form 025">' || CR ||
'<te:name>' || CR ||'    <te:value>����� 025</te:value>' || CR ||'</te:name>' || CR ||
--'<te:uid>' || CR ||'    <oe:value>1897808</oe:value>' || CR ||'</te:uid>' || CR ||
'<te:language>' || CR ||'    <te:terminology_id>' || CR ||'        <te:value>ISO_639-1</te:value>' || CR ||
'    </te:terminology_id>' || CR ||'    <te:code_string>ru</te:code_string>' || CR ||'</te:language>' || CR ||'<te:territory>' || CR ||
'    <te:terminology_id>' || CR ||'        <te:value>ISO_3166-1</te:value>' || CR ||'    </te:terminology_id>' || CR ||
'    <te:code_string>RU</te:code_string>' || CR ||'</te:territory>' || CR ||'<te:category>' || CR ||'    <te:value>event</te:value>' || CR ||
'    <te:defining_code>' || CR ||'        <te:terminology_id>' || CR ||'            <te:value>openehr</te:value>' || CR ||'        </te:terminology_id>' || CR ||
'        <te:code_string>433</te:code_string>' || CR ||'    </te:defining_code>' || CR ||'</te:category>' || CR ||
'<te:composer xsi:type="oe:PARTY_IDENTIFIED">' || CR ||'</te:composer>';
---GET_MAPPING_IEMK_SPR
---GET_MAPPING_SPR_STR

------------------------------//////-------------------------------------
FUNCTION GET_RAZD_TYPE1(pTagName IN VARCHAR2, pName_Value VARCHAR2, pValue_Value VARCHAR2,
         pAtr_Type VARCHAR2 DEFAULT NULL, pAtr_arch_node_id VARCHAR2 DEFAULT NULL, pAtr_ValueType VARCHAR2 DEFAULT NULL)
         RETURN VARCHAR2 IS
  Str    VARCHAR2(32767);
BEGIN
  SELECT '  <te:' || pTagName || DECODE(pAtr_Type, NULL, '', ' type="' || pAtr_Type || '"')
         || DECODE(pAtr_arch_node_id, NULL, '', ' archetype_node_id="' || pAtr_arch_node_id || '"')
         || DECODE(pAtr_ValueType, NULL, '', ' valueType="' || pAtr_ValueType || '"')
         || '>'
  INTO Str
  FROM DUAL;

  Str := Str || CR || '   <te:name>' || CR ||
                      '     <te:value>' || 
                      pName_Value || 
                      '</te:value>' || CR ||
                      '   </te:name>';

  Str := Str || CR || '   <te:value>' || CR ||
                      '     <oe:value>' || 
                      pValue_Value || 
                      '</oe:value>' || CR ||
                      '   </te:value>';

  Str := Str || CR || '  </te:' || pTagName || '>'||cr;

  RETURN Str;
END;

------------------------------//////-------------------------------------
FUNCTION GET_RAZD_TYPE2(pTagName IN VARCHAR2, pName_Value VARCHAR2, pValue_Value VARCHAR2,
         pSprName_Value VARCHAR2 DEFAULT NULL, pCode_Value VARCHAR2 DEFAULT NULL,
         pAtr_Type VARCHAR2 DEFAULT NULL, pAtr_arch_node_id VARCHAR2 DEFAULT NULL, pAtr_ValueType VARCHAR2 DEFAULT NULL)
         RETURN VARCHAR2 IS
  Str    VARCHAR2(32767);
BEGIN
  SELECT '  <te:' || pTagName || DECODE(pAtr_Type, NULL, '', ' type="' || pAtr_Type || '"')
         || DECODE(pAtr_arch_node_id, NULL, '', ' archetype_node_id="' || pAtr_arch_node_id || '"')
         || DECODE(pAtr_ValueType, NULL, '', ' valueType="' || pAtr_ValueType || '"')
         || '>'
  INTO Str
  FROM DUAL;

  Str := Str || CR || '    <te:name>' || CR ||
                      '      <te:value>' ||
                      pName_Value ||
                      '</te:value>' || CR ||
                      '    </te:name>';

  Str := Str || CR || '    <te:value>' || CR ||
                      '      <oe:value>' || CR ||
                      '        '||pValue_Value || CR ||
                      '      </oe:value>' || CR ||
                      '      <oe:defining_code>' || CR ||
                      '        <oe:terminology_id>' || CR ||
                      '          <oe:value>' || 
                      pSprName_Value || 
                      '</oe:value>' || CR ||
                      '        </oe:terminology_id>' || CR ||
                      '        <oe:code_string>' || CR ||
                      pCode_Value || CR ||
                      '        </oe:code_string>' || CR ||
                      '      </oe:defining_code>' || CR ||
                      '    </te:value>';

  Str := Str || CR || '  </te:' || pTagName || '>'||cr;

  RETURN Str;
END;

------------------------------//////-------------------------------------
FUNCTION GET_RAZD_TYPE3(pTagName IN VARCHAR2, pName_Value VARCHAR2, pValue_Value VARCHAR2,
         pAtr_Type VARCHAR2 DEFAULT NULL, pAtr_arch_node_id VARCHAR2 DEFAULT NULL, pAtr_ValueType VARCHAR2 DEFAULT NULL,
         pDopValue_Type VARCHAR2 DEFAULT NULL, pAssigner VARCHAR2 DEFAULT NULL)
         RETURN VARCHAR2 IS
  Str    VARCHAR2(32767);
BEGIN
  SELECT '  <te:' || pTagName || DECODE(pAtr_Type, NULL, '', ' type="' || pAtr_Type || '"')
         || DECODE(pAtr_arch_node_id, NULL, '', ' archetype_node_id="' || pAtr_arch_node_id || '"')
         || DECODE(pAtr_ValueType, NULL, '', ' valueType="' || pAtr_ValueType || '"')
         || '>'
  INTO Str
  FROM DUAL;

  Str := Str || CR || '   <te:name>' || CR ||
                      '     <te:value>' || 
                      pName_Value || 
                      '</te:value>' || CR ||
                      '   </te:name>';

  Str := Str || CR || '   <te:value>' || CR ||
                      '     <oe:value>' || CR ||
                      '       <oe:issuer></oe:issuer>' || CR ||
                      '       <oe:assigner>' || CR ||
                      pAssigner || CR ||
                      '       </oe:assigner>' || CR ||
                      '       <oe:id>' || CR ||
                      pValue_Value || CR ||
                      '       </oe:id>' || CR ||
                      '       <oe:type>' ||
                      pDopValue_Type ||
                      '       </oe:type>' || CR ||
                      '     </oe:value>' || CR ||
                      '   </te:value>';

  Str := Str || CR || '  </te:' || pTagName || '>'||cr;

  RETURN Str;
END;

FUNCTION CREATE_CALC(pFK_PACID NUMBER, nVidOpl NUMBER)
         RETURN VARCHAR2 IS
  pragma autonomous_transaction;
BEGIN
  EXECUTE IMMEDIATE('truncate table asu.vnaz_cost_limit');

  INSERT INTO ASU.VNAZ_COST_LIMIT(fk_nazid, FD_CALC)
  SELECT fk_id, fd_run
  FROM asu.vnaz where fk_pacid = pFK_PACID and fk_nazsosid = 1;

  EXECUTE IMMEDIATE('analyze table asu.vnaz_cost_limit compute statistics for table for all indexes for all columns size 100'); -- ������� �� ������ ���� ���������, ��� ��������� ������

  EXECUTE IMMEDIATE('truncate table ASU.Vnaz_Cost_Heal_Cut');

  insert into ASU.Vnaz_Cost_Heal_Cut(TYPEDOC_SYN)
  select t.FC_SYNONIM from asu.ttypedoc t where t.FK_ID <> nVidOpl;
  asu.pkg_vnaz_cost.Calculate;
  Commit;

  RETURN '1';
END;

FUNCTION CREATE_CALC25(pFK_TALONID NUMBER)
         RETURN VARCHAR2 IS
  pragma autonomous_transaction;
BEGIN
  EXECUTE IMMEDIATE('truncate table asu.vnaz_cost_limit');

  INSERT INTO ASU.VNAZ_COST_LIMIT(fk_nazid, FD_CALC)
  SELECT fk_id, fd_run
  FROM asu.vnaz v, asu.tambtalon_naz an where v.fk_id = an.fk_nazid AND an.fk_talonid = pFK_TALONID and v.fk_nazsosid = 1;

  EXECUTE IMMEDIATE('analyze table asu.vnaz_cost_limit compute statistics for table for all indexes for all columns size 100'); -- ������� �� ������ ���� ���������, ��� ��������� ������

  EXECUTE IMMEDIATE('truncate table ASU.Vnaz_Cost_Heal_Cut');

  asu.pkg_vnaz_cost.Calculate;
  Commit;

  RETURN '1';
END;

FUNCTION DATE_TO_STR(aDate IN DATE) RETURN VARCHAR2 IS
res VARCHAR2(30);
BEGIN
  IF aDate = trunc(aDate) THEN
   res := to_char(adate, 'YYYY-MM-DD');
  ELSE
   res := to_char(adate, 'YYYY-MM-DD"T"HH:MI:SS');
  END IF;
  RETURN res;
END;

------------------------------//////-------------------------------------
FUNCTION GET_XML_F66(pFK_PACID NUMBER)
         RETURN CLOB IS
  clTmp   CLOB;
  sTmp    VARCHAR2(32767);
  sTmp2   VARCHAR(1000);
  sTmp3   VARCHAR(3100);
  nPers   NUMBER;
  pDate   DATE;
  nVidOpl NUMBER;
  numTmp  NUMBER;
  NotRec  NUMBER;
  /*sDate1 VARCHAR(32);
  sStr1  VARCHAR(256);
  sStr2  VARCHAR(256);
  sStr3  VARCHAR(256);
  sStr4  VARCHAR(256);
  sStr5  VARCHAR(256);
  sStr6  VARCHAR(256);
  sStr7  VARCHAR(256);
  sStr8  VARCHAR(256);*/
BEGIN
  DBMS_LOB.CREATETEMPORARY(clTmp, TRUE, DBMS_LOB.call);
  DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(pBeginXML_66), pBeginXML_66);
  DBMS_LOB.WRITEAPPEND(clTmp, LENGTH('<te:data archetype_node_id="at0001" type="ITEM_TREE">'),
                       '<te:data archetype_node_id="at0001" type="ITEM_TREE">');
                       
  NotRec := 0;

  FOR C IN (SELECT to_char(FROM_TZ(CAST(ASU.PKG_REGIST_PACFUNC.GET_PAC_OUTCOME(T.FK_ID) as TIMESTAMP),DBTIMEZONE), 'YYYY-MM-DD"T"HH24:MI:SS.FF1TZH:TZM') 
                   /*TO_CHAR(ASU.PKG_REGIST_PACFUNC.GET_PAC_OUTCOME(T.FK_ID), 'YYYY-MM-DD') || 'T'
                   || TO_CHAR(ASU.PKG_REGIST_PACFUNC.GET_PAC_OUTCOME(T.FK_ID), 'HH24:MI:SS')*/ as DATE_OUT, --���� �������
                   ASU.PKG_REGIST_PACFUNC.GET_PAC_VRACHID(T.FK_ID) as VRACHID, --����������
                   ASU.PKG_REGIST_PACFUNC.GET_PAC_VRACHFULLFIO(T.FK_ID) as SPEC_FIO, --����������
                   ASU.GET_MAPPING_SPR_STR('HST0067', 'TSOTR', ASU.PKG_REGIST_PACFUNC.GET_PAC_VRACHID(T.FK_ID)) as SPEC_NAME, --�������������
                   ASU.GET_MAPPING_IEMK_SPR('HST0067', 'TSOTR', ASU.PKG_REGIST_PACFUNC.GET_PAC_VRACHID(T.FK_ID)) as SPEC_CODE, --�������������
                   ASU.GET_MAPPING_SPR_STR('HST0008', 'TUSLVID', T.FK_USLVIDID) as STAC_TYPE, --��� ����������
                   TO_CHAR(ASU.GET_MAPPING_IEMK_SPR('HST0008', 'TUSLVID', T.FK_USLVIDID)) as STAC_TYPE_ID, --��� ����������
                   ASU.GET_MAPPING_IEMK_SPR('HST0022', 'TTYPEDOC', td.FK_TYPEDOCID) as VOPL_CODE, -- ��� ������ (���)
                   ASU.GET_MAPPING_SPR_STR('HST0022', 'TTYPEDOC', td.FK_TYPEDOCID) as VOPL_NAME, -- ��� ������ (�����)
                   td.FC_NUM, td.FC_SER,
                   ASU.GET_MAPPING_SPR_STR('HST0065', 'TSMID', td.FK_TYPEOMS) as TYPE_POLIS, --��� ������
                   ASU.GET_MAPPING_SPR_STR('Z00013', 'TCOMPANY', td.FK_COMPANYID) as NAME_COMPANY, --��������� ��������
                   TO_CHAR(ASU.GET_MAPPING_IEMK_SPR('Z00013', 'TCOMPANY', td.FK_COMPANYID)) as CODE_COMPANY, -- ��� ��������� ��������
                   ASU.GET_MAPPING_SPR_STR('HST0061', 'TSMID', (SELECT MAX(fk_smid)
                                           FROM ASU.TIB WHERE FK_PACID = pFK_PACID AND FK_SMEDITID = STAT.PKG_STATUTIL.GET_SMIDID('TYPE_V_MU'))) AS VID_MED_HELP, --��� ����������� ������
                   TO_CHAR(ASU.GET_MAPPING_IEMK_SPR('HST0061', 'TSMID', (SELECT MAX(fk_smid)
                                           FROM ASU.TIB WHERE FK_PACID = pFK_PACID AND FK_SMEDITID = STAT.PKG_STATUTIL.GET_SMIDID('TYPE_V_MU')))) AS VID_MED_HELP_ID, --��� ����������� ������ ID
                   TO_CHAR(T.FK_ID) as TK_FK_ID, --ID ������ �����������
                   to_char(FROM_TZ(CAST(ASU.PKG_REGIST_PACFUNC.GET_PAC_INCOME(T.FK_ID) as TIMESTAMP),DBTIMEZONE), 'YYYY-MM-DD"T"HH24:MI:SS.FF1TZH:TZM')
                   /*TO_CHAR(ASU.PKG_REGIST_PACFUNC.GET_PAC_INCOME(T.FK_ID), 'YYYY-MM-DD') || 'T'
                   || TO_CHAR(ASU.PKG_REGIST_PACFUNC.GET_PAC_INCOME(T.FK_ID), 'HH24:MI:SS')*/ as DATE_IN, --���� �������� ������
                   to_char(FROM_TZ(CAST(ASU.PKG_REGIST_PACFUNC.GET_PAC_PUTINCOME(T.FK_ID) as TIMESTAMP),DBTIMEZONE), 'YYYY-MM-DD"T"HH24:MI:SS.FF1TZH:TZM')
                   /*TO_CHAR(ASU.PKG_REGIST_PACFUNC.GET_PAC_PUTINCOME(T.FK_ID), 'YYYY-MM-DD') || 'T'
                   || TO_CHAR(ASU.PKG_REGIST_PACFUNC.GET_PAC_PUTINCOME(T.FK_ID), 'HH24:MI:SS')*/ as DATE_PUT_IN, --���� � ����� ����������� � ����.
                   TO_CHAR(T.FK_IBID) || '/' || TO_CHAR(T.FK_IBY) as NUM_IB, --����� ������� �������
                   (SELECT MAX(totdel.fc_name) FROM asu.totdel, asu.tperesel, asu.troom
                          WHERE totdel.fk_id = troom.fk_otdelid AND troom.fk_id = tperesel.fk_palataid
                                AND tperesel.fk_id = (SELECT MIN(fk_id) FROM asu.tperesel WHERE fk_pacid = pFK_PACID
                                    AND stat.PKG_STATUTIL.IS_PALATA_PRIEM (fk_palataid) = 0)) as OTDEL_NAME, --��������� ����������
                   ASU.GET_MAPPING_SPR_STR('HST0030', 'TSMID', (SELECT MAX(sm.fk_id)
                          FROM (SELECT fk_id
                                FROM asu.tsmid
                                WHERE (tsmid.fl_del <> 1 or tsmid.fl_del is null)
                                CONNECT BY PRIOR fk_id = fk_owner START WITH fc_synonim = 'PD_REGOSPITAL')sm, asu.tib
                          WHERE sm.fk_id = tib.fk_smid AND tib.fk_pacid = pFK_PACID)) as DOST_EXTR, --��������� � ��������������
                  ASU.GET_MAPPING_SPR_STR('HST0039', 'TSMID', (SELECT MAX(ti.fk_smid) FROM asu.tib ti
                                          WHERE ti.fk_smeditid = asu.GET_SMID_PD_NAPRAVIV_YCH AND ti.fk_pacid = pFK_PACID)) as OTHER_LPU, --������ ���
                  TO_CHAR(ASU.GET_MAPPING_IEMK_SPR('HST0039', 'TSMID', (SELECT MAX(ti.fk_smid) FROM asu.tib ti
                                          WHERE ti.fk_smeditid = asu.GET_SMID_PD_NAPRAVIV_YCH AND ti.fk_pacid = pFK_PACID))) as OTHER_LPU_ID, --������ ���
                  ASU.GET_MAPPING_SPR_STR('IEMK_KEM_NAPR', 'TSMID', (SELECT MAX(ti.fk_smid) FROM asu.tib ti
                                          WHERE ti.fk_smeditid = STAT.PKG_STATUTIL.GET_SMIDID('PD_INKEM') AND ti.fk_pacid = pFK_PACID)) as KEM_NAPR, --��� ���������
                  TO_CHAR(ASU.GET_MAPPING_IEMK_SPR('IEMK_KEM_NAPR', 'TSMID', (SELECT MAX(ti.fk_smid) FROM asu.tib ti
                                          WHERE ti.fk_smeditid = STAT.PKG_STATUTIL.GET_SMIDID('PD_INKEM') AND ti.fk_pacid = pFK_PACID))) as KEM_NAPR_ID, --��� ���������
                 (SELECT MAX(ts.FK_MKB10)
                     FROM ASU.TDIAG td, ASU.TSMID ts
                          WHERE td.fk_smdiagid = ts.fk_id
                                AND td.fk_id = (SELECT MAX(TDIAG.FK_ID)
                                FROM ASU.TSMID, ASU.TDIAG
                                WHERE (tsmid.fl_del <> 1 or tsmid.fl_del is null) and TDIAG.FK_PACID = pFK_PACID
                                AND TDIAG.FK_SMDIAGID = TSMID.FK_ID
                                AND TDIAG.FP_TYPE = STAT.PKG_STATUTIL.GET_SMIDID('S_MESTA_OTBORA'))) as DIAG_NAPR, --������� ������������ ����������
                 (SELECT MAX(ts.FK_MKB10 || ' ' || COALESCE(td.FC_WRITE, ts.FC_NAME))
                     FROM ASU.TDIAG td, ASU.TSMID ts
                          WHERE td.fk_smdiagid = ts.fk_id
                                AND td.fk_id = (SELECT MAX(TDIAG.FK_ID)
                                FROM ASU.TSMID, ASU.TDIAG
                                WHERE (tsmid.fl_del <> 1 or tsmid.fl_del is null) and TDIAG.FK_PACID = pFK_PACID
                                AND TDIAG.FK_SMDIAGID = TSMID.FK_ID
                                AND TDIAG.FP_TYPE = STAT.PKG_STATUTIL.GET_SMIDID('S_MESTA_OTBORA'))) as DIAG_NAPR_NAME, --������� ������������ ����������
                 to_char(FROM_TZ(CAST((SELECT MAX(FD_RUN) FROM ASU.VNAZ WHERE FK_ID = (SELECT MAX(FK_ID)
                                 FROM ASU.VNAZ
                                 WHERE FK_PACID = pFK_PACID AND FK_SMID = STAT.PKG_STATUTIL.GET_SMIDID('KONS_PRIEM_VRACH_OSM'))) as TIMESTAMP),DBTIMEZONE), 'YYYY-MM-DD"T"HH24:MI:SS.FF1TZH:TZM')
                 /*TO_CHAR((SELECT MAX(FD_RUN) FROM ASU.VNAZ WHERE FK_ID = (SELECT MAX(FK_ID)
                                 FROM ASU.VNAZ
                                 WHERE FK_PACID = pFK_PACID AND FK_SMID = STAT.PKG_STATUTIL.GET_SMIDID('KONS_PRIEM_VRACH_OSM'))), 'YYYY-MM-DD') || 'T'
                 || TO_CHAR((SELECT MAX(FD_RUN) FROM ASU.VNAZ WHERE FK_ID = (SELECT MAX(FK_ID)
                                 FROM ASU.VNAZ
                                 WHERE FK_PACID = pFK_PACID AND FK_SMID = STAT.PKG_STATUTIL.GET_SMIDID('KONS_PRIEM_VRACH_OSM'))), 'HH24:MI:SS')*/ as DATE_NAZ_PR_O, -- ���� ���������� ������� (������ � �������� ���������)
                 (SELECT ASU.PKG_REGIST_PEPLFUNC.GET_PEPL_FULLFIO(s.FK_PEPLID) FROM ASU.VNAZ v LEFT JOIN ASU.TSOTR s
                        ON v.FK_VRACHID = s.FK_ID
                        WHERE v.FK_ID = (SELECT MAX(FK_ID)
                        FROM ASU.VNAZ
                        WHERE FK_PACID = pFK_PACID AND FK_SMID = STAT.PKG_STATUTIL.GET_SMIDID('KONS_PRIEM_VRACH_OSM'))) as VRACH_NAZ_PR_O, -- ���� ��������� ��������� (������ � �������� ���������
                 (SELECT MAX(ts.FK_MKB10)
                     FROM ASU.TDIAG td, ASU.TSMID ts
                          WHERE td.fk_smdiagid = ts.fk_id
                                AND td.fk_id = (SELECT MAX(TDIAG.FK_ID)
                                FROM ASU.TSMID, ASU.TDIAG
                                WHERE (tsmid.fl_del <> 1 or tsmid.fl_del is null) and TDIAG.FK_PACID = pFK_PACID
                                AND TDIAG.FK_SMDIAGID = TSMID.FK_ID
                                AND TDIAG.FP_TYPE = STAT.PKG_STATUTIL.GET_SMIDID('PRI_POSTYPLENII'))) as DIAG_PRIEM, --������� ����� ��������� ���������
                 ASU.GET_MAPPING_SPR_STR('HST0031', 'TSMID',  (SELECT MAX(sm.FK_ID)
                                                    FROM (SELECT fk_id
                                                         FROM asu.tsmid
                                                         WHERE (fl_del <> 1 or fl_del is null)
                                                         CONNECT BY PRIOR fk_id = fk_owner
                                                         START WITH fc_synonim = 'PD_DOST') sm, ASU.TIB
                                                    WHERE sm.fk_id = tib.fk_smid AND tib.fk_pacid = pFK_PACID)) as KEM_DOST, --��� ���������
                TO_CHAR(ASU.GET_MAPPING_IEMK_SPR('HST0039', 'TSMID', (SELECT MAX(ti.fk_smid) FROM asu.tib ti
                                          WHERE ti.fk_smeditid = STAT.PKG_STATUTIL.GET_SMIDID('PD_DOST') AND ti.fk_pacid = pFK_PACID))) as KEM_DOST_ID, --��� ���������
                ASU.GET_MAPPING_SPR_STR('HST0025', 'TSMID', (SELECT MAX(sm.fk_id)
                          FROM (SELECT fk_id
                                FROM asu.tsmid
                                WHERE (tsmid.fl_del <> 1 or tsmid.fl_del is null)
                                CONNECT BY PRIOR fk_id = fk_owner START WITH fc_synonim = 'PD_VTRANSPORT')sm, asu.tib
                          WHERE sm.fk_id = tib.fk_smid AND tib.fk_pacid = pFK_PACID)) as VID_TRANSPORT, --��� ���������������
                TO_CHAR(ASU.GET_MAPPING_IEMK_SPR('HST0025', 'TSMID', (SELECT MAX(ti.fk_smid) FROM asu.tib ti
                                          WHERE ti.fk_smeditid = STAT.PKG_STATUTIL.GET_SMIDID('PD_VTRANSPORT') AND ti.fk_pacid = pFK_PACID))) as VID_TRANSPORT_ID, --��� ���������������
                ASU.GET_MAPPING_SPR_STR('C42007', 'TSMID', (SELECT NVL(MAX(FK_SMID), -1)
                                                   FROM ASU.TIB IB
                                                   WHERE IB.FK_ID IN (SELECT MAX(FK_ID)
                                                         FROM (SELECT I.FK_ID AS FK_ID
                                                              FROM ASU.TIB I
                                                              WHERE FK_PACID = pFK_PACID
                                                                    AND FK_SMEDITID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = 'STAC_LECH_IN_CUR_YEAR')
                                                              UNION ALL
                                                              SELECT b.fk_id AS FK_ID
                                                              FROM ASU.VNAZ n, ASU.TIB b
                                                              WHERE b.fk_pacid = n.FK_ID
                                                                    AND n.FK_PACID = pFK_PACID
                                                                    AND n.FK_NAZSOSID = ASU.GET_VIPNAZ
                                                                    AND b.FK_SMEDITID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = 'STAC_LECH_IN_CUR_YEAR'))))) as DOST_IN_YEAR, --���������������� �� ������ ������� ����������� � ������� ����
                TO_CHAR(ASU.GET_MAPPING_IEMK_SPR('C42007', 'TSMID', (SELECT NVL(MAX(FK_SMID), -1)
                                                   FROM ASU.TIB IB
                                                   WHERE IB.FK_ID IN (SELECT MAX(FK_ID)
                                                         FROM (SELECT I.FK_ID AS FK_ID
                                                              FROM ASU.TIB I
                                                              WHERE FK_PACID = pFK_PACID
                                                                    AND FK_SMEDITID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = 'STAC_LECH_IN_CUR_YEAR')
                                                              UNION ALL
                                                              SELECT b.fk_id AS FK_ID
                                                              FROM ASU.VNAZ n, ASU.TIB b
                                                              WHERE b.fk_pacid = n.FK_ID
                                                                    AND n.FK_PACID = pFK_PACID
                                                                    AND n.FK_NAZSOSID = ASU.GET_VIPNAZ
                                                                    AND b.FK_SMEDITID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = 'STAC_LECH_IN_CUR_YEAR')))))) as DOST_IN_YEAR_ID, --���������������� �� ������ ������� ����������� � ������� ����
                TO_CHAR(ASU.GET_MAPPING_IEMK_SPR('HST0030', 'TSMID', (SELECT MAX(ti.fk_smid) FROM asu.tib ti
                                          WHERE ti.fk_smeditid = STAT.PKG_STATUTIL.GET_SMIDID('PD_DOST_PIAN') AND ti.fk_pacid = pFK_PACID))) as GOSP_POKAZ_ID, --���������
                ASU.GET_MAPPING_SPR_STR('HST0030', 'TSMID', (SELECT MAX(ti.fk_smid) FROM asu.tib ti
                                          WHERE ti.fk_smeditid = STAT.PKG_STATUTIL.GET_SMIDID('PD_DOST_PIAN') AND ti.fk_pacid = pFK_PACID)) as GOSP_POKAZ, --���������
                TO_CHAR(ASU.GET_MAPPING_IEMK_SPR('HST0037', 'TSMID', (SELECT MAX(ti.fk_smid) FROM asu.tib ti
                                          WHERE ti.fk_smeditid = STAT.PKG_STATUTIL.GET_SMIDID('PD_DOST_PIAN') AND ti.fk_pacid = pFK_PACID))) as PIAN_ID,
                ASU.GET_MAPPING_SPR_STR('HST0037', 'TSMID', (SELECT MAX(ti.fk_smid) FROM asu.tib ti
                                          WHERE ti.fk_smeditid = STAT.PKG_STATUTIL.GET_SMIDID('PD_DOST_PIAN') AND ti.fk_pacid = pFK_PACID)) as PIAN,
                TO_CHAR(ASU.GET_MAPPING_IEMK_SPR('HST0036', 'TSMID', (SELECT MAX(ti.fk_smid) FROM asu.tib ti
                                          WHERE ti.fk_smeditid = STAT.PKG_STATUTIL.GET_SMIDID('PD_NACHTRAVM') AND ti.fk_pacid = pFK_PACID))) as DOST_OT_NACH_ID, --��������� � ��������� �� ������ ����������� (��������� ������)
                ASU.GET_MAPPING_SPR_STR('HST0036', 'TSMID', (SELECT MAX(ti.fk_smid) FROM asu.tib ti
                                          WHERE ti.fk_smeditid = STAT.PKG_STATUTIL.GET_SMIDID('PD_NACHTRAVM') AND ti.fk_pacid = pFK_PACID)) as DOST_OT_NACH, --��������� � ��������� �� ������ ����������� (��������� ������)
                TO_CHAR(ASU.GET_MAPPING_IEMK_SPR('HST0016', 'TSMID', (SELECT MAX(ti.fk_smid) FROM asu.tib ti
                                          WHERE ti.fk_smeditid = STAT.PKG_STATUTIL.GET_SMIDID('PD_TRAVM') AND ti.fk_pacid = pFK_PACID))) as TRAVMA_ID, --������
                ASU.GET_MAPPING_SPR_STR('HST0016', 'TSMID', (SELECT MAX(ti.fk_smid) FROM asu.tib ti
                                          WHERE ti.fk_smeditid = STAT.PKG_STATUTIL.GET_SMIDID('PD_TRAVM') AND ti.fk_pacid = pFK_PACID)) as TRAVMA --������
            --INTO sDate1, sStr1, sStr2, sStr3, sStr4, sStr5, sStr6, sStr7, sStr8
            FROM ASU.TKARTA T LEFT JOIN (SELECT MAX(FK_INSURDOCID) as FK_MInsDoc, FK_PACID FROM ASU.TPAC_INSURANCE GROUP BY FK_PACID) ti
                 ON T.FK_ID = ti.FK_PACID LEFT JOIN ASU.TINSURDOCS td
                 ON ti.FK_MInsDoc = td.FK_ID
            WHERE T.FK_ID = pFK_PACID) LOOP
            
            NotRec := 1;

            sTmp := GET_RAZD_TYPE1('����_�������', '���� �������', C.DATE_OUT, 'ELEMENT', 'at0032', 'DV_DATE_TIME');
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            sTmp := GET_RAZD_TYPE3('����������', '����������', C.VRACHID, 'ELEMENT', 'at0003', 'DV_IDENTIFIER');
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            sTmp := GET_RAZD_TYPE2('�������������', '�������������', C.SPEC_NAME, 'Speciality', C.SPEC_CODE, 'ELEMENT', 'at0004', 'DV_CODED_TEXT');
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            /*sTmp := GET_RAZD_TYPE2('���������', '���������', C.SPEC_NAME, 'Speciality', C.SPEC_CODE, 'ELEMENT', 'at0004', 'DV_CODED_TEXT');
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            sTmp := GET_RAZD_TYPE1('���_����������', '��� ����������', C.STAC_TYPE, 'ELEMENT', 'at0025', 'DV_TEXT');
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);*/

            sTmp := '<te:����������_��_������ archetype_node_id="openEHR-EHR-CLUSTER.medical_insurance.v1" type="CLUSTER">'
            || CR ||'<te:name>' || CR || '<te:value>���������� �� ������</te:value>' || CR || '</te:name>';
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            sTmp := GET_RAZD_TYPE2('���_������', '��� ������', C.VOPL_NAME, 'PaymentType', C.VOPL_CODE, 'ELEMENT', 'at0001', 'DV_CODED_TEXT');
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            IF C.FC_NUM <> ''
            THEN
               sTmp := GET_RAZD_TYPE1('�����_������', '����� ������', C.FC_NUM, 'ELEMENT', 'at0003', 'DV_TEXT');
               DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
            END IF;

            IF C.FC_SER <> ''
            THEN
               sTmp := GET_RAZD_TYPE1('�����_������', '����� ������', C.FC_SER, 'ELEMENT', 'at0004', 'DV_TEXT');
               DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
            END IF;

            sTmp := GET_RAZD_TYPE1('���_������', '��� ������', C.TYPE_POLIS, 'ELEMENT', 'at0005', 'DV_TEXT');
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            sTmp := GET_RAZD_TYPE1('���������_��������', '��������� ��������', C.NAME_COMPANY, 'ELEMENT', 'at0002', 'DV_TEXT');
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            /*sTmp := GET_RAZD_TYPE1('���_���������_��������', '��� ��������� ��������', C.CODE_COMPANY, 'ELEMENT', 'at0002', 'DV_TEXT');
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);*/

            sTmp := '</te:����������_��_������>';
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            sTmp := GET_RAZD_TYPE2('���_�����������_������', '��� ����������� ������', C.VID_MED_HELP, 'CureType', C.VID_MED_HELP_ID, 'ELEMENT', 'at0069', 'DV_CODED_TEXT');
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            /*sTmp := GET_RAZD_TYPE2('���_���������', '��� ���������', '��������� �� ������ �����������', 'NsiOmsOutpatientVisit', '1', 'ELEMENT', 'at0070', 'DV_CODED_TEXT');
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);*/

            sTmp := GET_RAZD_TYPE2('�������_��������_�����������_������', '������� �������� ����������� ������', '���������', 'NsiDepartmentType', '1', 'ELEMENT', 'at0071', 'DV_CODED_TEXT');
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            sTmp := GET_RAZD_TYPE2('���_������', '��� ������', C.VID_MED_HELP, 'NsiTypeCare', C.VID_MED_HELP_ID, 'ELEMENT', 'at0072', 'DV_CODED_TEXT');
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            sTmp := '</te:data>' || CR || '</te:�����_����������>';
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            sTmp := '<te:����������_�_�������������� archetype_node_id="openEHR-EHR-ADMIN_ENTRY.begin_day_hospital.v1" type="ADMIN_ENTRY">' || CR ||
                    '<te:name>' || CR ||
                    '<te:value>���������� � ��������������</te:value>' || CR ||
                    '</te:name>' || CR ||
                    '<te:language>' || CR ||
                    '<te:terminology_id>' || CR ||
                    '<te:value>ISO_639-1</te:value>' || CR ||
                    '</te:terminology_id>' || CR ||
                    '<te:code_string>en</te:code_string>' || CR ||
                    '</te:language>' || CR ||
                    '<te:encoding>' || CR ||
                    '<te:terminology_id>' || CR ||
                    '<te:value>IANA_character-sets</te:value>' || CR ||
                    '</te:terminology_id>' || CR ||
                    '<te:code_string>UTF-8</te:code_string>' || CR ||
                    '</te:encoding>' || CR ||
                    '<te:subject>' || CR ||
                    '</te:subject>' || CR ||
                    '<te:data archetype_node_id="at0001" type="ITEM_TREE">';
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            /*sTmp := GET_RAZD_TYPE3('ID_������_�����������', 'ID ������ �����������', C.TK_FK_ID, 'ELEMENT', 'at0007', 'DV_IDENTIFIER');
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);*/

            sTmp := GET_RAZD_TYPE2('���_����������', '��� ����������', C.STAC_TYPE, 'HospitalType', C.STAC_TYPE_ID, 'ELEMENT', 'at0420', 'DV_CODED_TEXT');
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            sTmp := GET_RAZD_TYPE1('����_�_�����_�����������', '���� � ����� �����������', C.DATE_IN, 'ELEMENT', 'at0190', 'DV_DATE_TIME');
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            sTmp := GET_RAZD_TYPE1('�����_�������_�������', '����� ������� �������', C.NUM_IB, 'ELEMENT', 'at0193', 'DV_TEXT');
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            sTmp := '<te:���_��������� archetype_node_id="at0141" type="CLUSTER">' || CR ||
                    '<te:name>' || CR ||
                    '<te:value>��� ���������</te:value>' || CR ||
                    '</te:name>';
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            IF C.KEM_NAPR <> ''
            THEN
               sTmp := GET_RAZD_TYPE2('�������_���������', '������� ���������', C.KEM_NAPR, 'local', 'at0' || C.KEM_NAPR_ID, 'ELEMENT', 'at0147', 'DV_CODED_TEXT');
               DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
            END IF;

            IF C.OTHER_LPU <> ''
            THEN
               sTmp := GET_RAZD_TYPE2('������_���', '������ ���', C.OTHER_LPU , '', C.OTHER_LPU_ID, 'ELEMENT', 'at0174', 'DV_CODED_TEXT');
               DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
            END IF;

            sTmp := CR || '</te:���_���������>';
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            IF C.DIAG_NAPR <> ''
            THEN
              BEGIN
                /*sTmp := '<te:�����������_��_�������������� archetype_node_id="at0010" type="CLUSTER">' || CR ||
                    '<te:name>' || CR ||
                    '<te:value>����������� �� ��������������</te:value>' || CR ||
                    '</te:name>' || CR ||
                    '<te:value></te:value>';
                DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);*/

                sTmp := '<te:�������_������������_���������� archetype_node_id="openEHR-EHR-CLUSTER.app_diagnosed_disease.v1" type="CLUSTER">' || CR ||
                    '<te:name>' || CR ||
                    '<te:value>������� ������������ ����������</te:value>' || CR ||
                    '</te:name>';
                DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

                sTmp := GET_RAZD_TYPE2('���_��_���', '��� �� ���', C.DIAG_NAPR_NAME, 'Disease', C.DIAG_NAPR, 'ELEMENT', 'at0001', 'DV_CODED_TEXT');
                DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

                sTmp := '</te:�������_������������_����������>';
                DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

                /*sTmp := '</te:�����������_��_��������������>';
                DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);*/
              END;
            END IF;

            IF (C.KEM_DOST <> '') OR (C.VID_TRANSPORT <> '')
            THEN
              BEGIN
                sTmp := '<te:���_��������� archetype_node_id="at0142" type="CLUSTER">' || CR ||
                    '<te:name>' || CR ||
                    '<te:value>��� ���������</te:value>' || CR ||
                    '</te:name>';
                DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

                IF C.KEM_DOST <> ''
                THEN
                   sTmp := GET_RAZD_TYPE2('���_���������', '��� ���������', C.KEM_DOST, 'WhoDelivered', C.KEM_DOST_ID, 'ELEMENT', 'at0034', 'DV_CODED_TEXT');
                   DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
                END IF;

                IF C.VID_TRANSPORT <> ''
                THEN
                   sTmp := GET_RAZD_TYPE2('���_���������������', '��� ���������������', C.VID_TRANSPORT, 'TransportationType', C.VID_TRANSPORT_ID, 'ELEMENT', 'at0184', 'DV_CODED_TEXT');
                   DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
                END IF;

                sTmp := '</te:���_���������>';
                DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
              END;
            END IF;

            IF C.PIAN_ID <> ''
            THEN
               sTmp := GET_RAZD_TYPE2('���������_�_���������_���������', '��������� � ��������� ���������', C.PIAN, 'DrunkenState', 'ELEMENT', C.PIAN_ID, 'at0039', 'DV_CODED_TEXT');
               DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
            END IF;

            IF (C.DOST_IN_YEAR_ID <> '') OR (C.GOSP_POKAZ_ID <> '')
            THEN
              BEGIN
                sTmp := '<te:����������������_��_������_�������_�����������_�_�������_���� archetype_node_id="at0042" type="CLUSTER">' || CR ||
                    '<te:name>' || CR ||
                    '<te:value>���������������� �� ������ ������� ����������� � ������� ����</te:value>' || CR ||
                    '</te:name>';
                DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

                IF C.GOSP_POKAZ_ID <> ''
                THEN
                   sTmp := GET_RAZD_TYPE2('���������', '���������', C.GOSP_POKAZ, 'Statement', C.GOSP_POKAZ_ID, 'ELEMENT', 'at0043', 'DV_CODED_TEXT');
                   DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
                END IF;

                IF C.DOST_IN_YEAR_ID <> ''
                THEN
                   sTmp := GET_RAZD_TYPE2('���������', '���������', C.DOST_IN_YEAR, 'NsiDeseaseNumber', C.DOST_IN_YEAR_ID, 'ELEMENT', 'at0044', 'DV_CODED_TEXT');
                   DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
                END IF;

                sTmp := '</te:����������������_��_������_�������_�����������_�_�������_����>';
                DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
              END;
            END IF;

            IF C.DOST_OT_NACH_ID <> ''
            THEN
               sTmp := GET_RAZD_TYPE2('���������_�_���������_��_������_�����������__openBrkt_���������_������_closeBrkt_',
                                      '��������� � ��������� �� ������ ����������� (��������� ������)',
                                      C.DOST_OT_NACH, 'AffordedAfter', C.DOST_OT_NACH_ID, 'ELEMENT', 'at0049', 'DV_CODED_TEXT');
               DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
            END IF;

            IF C.TRAVMA <> ''
            THEN
               sTmp := GET_RAZD_TYPE2('������', '������', C.TRAVMA, 'Trauma', C.TRAVMA_ID, 'ELEMENT', 'at0053', 'DV_CODED_TEXT');
               DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
            END IF;

            /*sTmp := GET_RAZD_TYPE1('����_��������_������', '���� �������� ������', C.DATE_OUT, 'ELEMENT', 'at0004', 'DV_DATE');
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);*/

            sTmp := '</te:data>' || CR || '</te:����������_�_��������������>';
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

           /* sTmp := '<te:�����������_�_��������� archetype_node_id="openEHR-EHR-ADMIN_ENTRY.begin_day_hospital.v1" type="ADMIN_ENTRY">' || CR ||
                    '<te:name>' || CR ||
                    '<te:value>����������� � ���������</te:value>' || CR ||
                    '</te:name>' || CR ||
                    '<te:language>' || CR ||
                    '<te:terminology_id>' || CR ||
                    '<te:value>ISO_639-1</te:value>' || CR ||
                    '</te:terminology_id>' || CR ||
                    '<te:code_string>en</te:code_string>' || CR ||
                    '</te:language>' || CR ||
                    '<te:encoding>' || CR ||
                    '<te:terminology_id>' || CR ||
                    '<te:value>IANA_character-sets</te:value>' || CR ||
                    '</te:terminology_id>' || CR ||
                    '<te:code_string>UTF-8</te:code_string>' || CR ||
                    '</te:encoding>' || CR ||
                    '<te:subject>' || CR ||
                    '</te:subject>' || CR ||
                    '<te:data archetype_node_id="at0001" type="ITEM_TREE">';
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            sTmp := GET_RAZD_TYPE1('����_�_�����_�����������', '���� � ����� �����������', C.DATE_PUT_IN, 'ELEMENT', 'at0190', 'DV_DATE_TIME');
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            sTmp := GET_RAZD_TYPE1('�����_�������_�������', '����� ������� �������', C.NUM_IB, 'ELEMENT', 'at0193', 'DV_TEXT');
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            sTmp := GET_RAZD_TYPE1('���������_����������', '��������� ����������', C.OTDEL_NAME, 'ELEMENT', 'at0169', 'DV_TEXT');
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            sTmp := GET_RAZD_TYPE1('���������_�_��������������', '��������� � ��������������', C.DOST_EXTR, 'ELEMENT', 'at0214', 'DV_TEXT');
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            sTmp := '<te:����������_�_����������� archetype_node_id="at0141" type="CLUSTER">' || CR ||
                    '<te:name>' || CR ||
                    '<te:value>���������� � �����������</te:value>' || CR ||
                    '</te:name>';
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            sTmp := GET_RAZD_TYPE3('�����������_����', '����������� ����', '', 'ELEMENT', 'at0189', 'DV_IDENTIFIER');
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            sTmp := GET_RAZD_TYPE1('������_���', '������ ���', C.OTHER_LPU , 'ELEMENT', 'at0174', 'DV_TEXT');
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            sTmp := '<te:�������_������������_���������� archetype_node_id="openEHR-EHR-CLUSTER.app_diagnosed_disease.v1" type="CLUSTER">' || CR ||
                    '<te:name>' || CR ||
                    '<te:value>������� ������������ ����������</te:value>' || CR ||
                    '</te:name>';
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            sTmp := GET_RAZD_TYPE1('���_��_���', '��� �� ���', C.DIAG_NAPR, 'ELEMENT', 'at0001', 'DV_TEXT');
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            sTmp := '</te:�������_������������_����������>';
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            sTmp := '</te:����������_�_�����������>';
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            sTmp := '<te:������_�_��������_��������� archetype_node_id="openEHR-EHR-CLUSTER.receiving_room_examination.v1" type="CLUSTER">' || CR ||
                    '<te:name>' || CR ||
                    '<te:value>������ � �������� ���������</te:value>' || CR ||
                    '</te:name>';
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            sTmp := GET_RAZD_TYPE1('����_����������_�������', '���� ���������� �������', NULLIF(C.DATE_NAZ_PR_O, 'T'), 'ELEMENT', 'at0002', 'DV_DATE_TIME');
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            sTmp := GET_RAZD_TYPE3('����_���������_���������', '���� ��������� ���������', C.VRACH_NAZ_PR_O, 'ELEMENT', 'at0003', 'DV_IDENTIFIER');
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            sTmp := '<te:�������_�����_���������_��������� archetype_node_id="openEHR-EHR-CLUSTER.app_diagnosed_disease.v1" type="CLUSTER">' || CR ||
                    '<te:name>' || CR ||
                    '<te:value>������� ����� ��������� ���������</te:value>' || CR ||
                    '</te:name>';
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            sTmp := GET_RAZD_TYPE1('���_��_���', '��� �� ���', C.DIAG_PRIEM, 'ELEMENT', 'at0001', 'DV_TEXT');
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            sTmp := '</te:�������_�����_���������_���������>';
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            sTmp := '</te:������_�_��������_���������>';
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            sTmp := '<te:���_��������� archetype_node_id="at0142" type="CLUSTER">' || CR ||
                    '<te:name>' || CR ||
                    '<te:value>��� ���������</te:value>' || CR ||
                    '</te:name>';
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            sTmp := GET_RAZD_TYPE1('���_���������', '��� ���������', C.KEM_DOST, 'ELEMENT', 'at0034', 'DV_TEXT');
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            sTmp := GET_RAZD_TYPE1('���_���������������', '��� ���������������', C.VID_TRANSPORT, 'ELEMENT', 'at0184', 'DV_TEXT');
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            sTmp := '</te:���_���������>';
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

             sTmp := '<te:����������������_��_������_�������_�����������_�_�������_���� archetype_node_id="at0042" type="CLUSTER">' || CR ||
                    '<te:name>' || CR ||
                    '<te:value>���������������� �� ������ ������� ����������� � ������� ����</te:value>' || CR ||
                    '</te:name>';
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            sTmp := GET_RAZD_TYPE1('���������', '���������', C.DOST_IN_YEAR, 'ELEMENT', 'at0044', 'DV_TEXT');
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            sTmp := GET_RAZD_TYPE1('���������', '���������', C.GOSP_POKAZ, 'ELEMENT', 'at0043', 'DV_TEXT');
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            sTmp := '</te:����������������_��_������_�������_�����������_�_�������_����>';
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            sTmp := '</te:data>' || CR || '</te:�����������_�_���������>';
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);*/
  END LOOP;
  
  IF NotRec = 0
  THEN 
     sTmp := CR || '</te:data>' || CR || '</te:�����_����������>';
     DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
   END IF;

  sTmp := '<te:������� archetype_node_id="openEHR-EHR-ADMIN_ENTRY.end_day_hospital.v1" type="ADMIN_ENTRY">' || CR ||
          '<te:name>' || CR ||
          '<te:value>�������</te:value>' || CR ||
          '</te:name>' || CR ||
          '<te:language>' || CR ||
          '<te:terminology_id>' || CR ||
          '<te:value>ISO_639-1</te:value>' || CR ||
          '</te:terminology_id>' || CR ||
          '<te:code_string>en</te:code_string>' || CR ||
          '</te:language>' || CR ||
          '<te:encoding>' || CR ||
          '<te:terminology_id>' || CR ||
          '<te:value>IANA_character-sets</te:value>' || CR ||
          '</te:terminology_id>' || CR ||
          '<te:code_string>UTF-8</te:code_string>' || CR ||
          '</te:encoding>' || CR ||
          '<te:subject>' || CR ||
          '</te:subject>' || CR ||
          '<te:data archetype_node_id="at0001" type="ITEM_TREE">';
  DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

  FOR C IN (SELECT T.FK_ID,
              COALESCE(STAT.PKG_STATKART.GET_PAC_ISHGOSP(pFK_PACID), -1) as GOSP_ISHOD, --����� ��������������
              STAT.PKG_STATKART.GET_PAC_RESGOSP(pFK_PACID) as GOSP_RES, --��������� ��������������
              PKG_REGIST_PACFUNC.GET_PAC_DAYS(FK_PACID) FN_KDN --�����-��� �� ����e
            FROM ASU.TKARTA T LEFT JOIN (SELECT MAX(FK_INSURDOCID) as FK_MInsDoc, FK_PACID FROM ASU.TPAC_INSURANCE GROUP BY FK_PACID) ti
                 ON T.FK_ID = ti.FK_PACID LEFT JOIN ASU.TINSURDOCS td
                 ON ti.FK_MInsDoc = td.FK_ID
            WHERE T.FK_ID = pFK_PACID) LOOP

            sTmp := GET_RAZD_TYPE1('�����_-_���_��_�����', '�����-��� �� �����',
                                    '<te:magnitude>' || CR || TO_CHAR(C.FN_KDN) || CR || '</te:magnitude>' || CR || '<units />',
                                    'ELEMENT', 'at0183', 'DV_COUNT');
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            sTmp := GET_RAZD_TYPE2('�����_��������������', '����� ��������������', ASU.GET_MAPPING_SPR_STR('HST0041', 'TSMID', C.GOSP_ISHOD),
                                   'GeneralOutcome', ASU.GET_MAPPING_IEMK_SPR('HST0041', 'TSMID', C.GOSP_ISHOD), 'ELEMENT', 'at0076', 'DV_CODED_TEXT');
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

            sTmp := GET_RAZD_TYPE2('���������_��������������', '��������� ��������������', ASU.GET_MAPPING_SPR_STR('HST0040', 'TSMID', C.GOSP_RES),
                                   'GeneralResult', ASU.GET_MAPPING_IEMK_SPR('HST0040', 'TSMID', C.GOSP_RES), 'ELEMENT', 'at0081', 'DV_CODED_TEXT');
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
  END LOOP;

  SELECT (SELECT MAX(p.fk_id) FROM asu.tperesel p, asu.tkarta k WHERE p.fk_pacid = pFK_PACID AND k.fk_id = p.fk_pacid AND k.fp_tek_coc IN (-2, 2, 3)),
         (SELECT MAX(FD_DATA1)FROM  asu.TSROKY, (SELECT MAX (FK_ID) FK_MAXID FROM asu.TSROKY WHERE FK_PACID = pFK_PACID) WHERE FK_ID = FK_MAXID AND (FK_PRYB = 3 OR FK_PRYB = 7)),
         (SELECT MAX(FK_ID)FROM asu.ttypedoc WHERE fk_id = (SELECT MIN(tinsurdocs.fk_typedocid) FROM asu.tinsurdocs, asu.tpac_insurance
               WHERE tinsurdocs.fk_id = tpac_insurance.fk_insurdocid AND tpac_insurance.fk_pacid = pFK_PACID))
  INTO nPers, pDate, nVidOpl
  FROM DUAL;

  FOR C IN (SELECT p.FK_ID, p.OTD_NAME, a.FK_VRACHID, NULL as COD_VRACH,
            to_char(FROM_TZ(CAST(p.fd_data1 as TIMESTAMP),DBTIMEZONE), 'YYYY-MM-DD"T"HH24:MI:SS.FF1TZH:TZM')
            /*TO_CHAR(p.fd_data1, 'YYYY-MM-DD') || 'T' || TO_CHAR(p.fd_data1, 'HH24:MI:SS')*/ as DATE_IN,
            to_char(FROM_TZ(CAST(p.fd_data2 as TIMESTAMP),DBTIMEZONE), 'YYYY-MM-DD"T"HH24:MI:SS.FF1TZH:TZM')
            /*TO_CHAR(p.fd_data2, 'YYYY-MM-DD') || 'T' || TO_CHAR(p.fd_data2, 'HH24:MI:SS')*/ as DATE_OUT,
            a.FK_MKB10, a.DIAG_NAME,
            p.fk_koykavidid,
            --ASU.GET_MAPPING_SPR_STR('HST0022', 'TTYPEDOC', nVidOpl) as VID_OPL,
            p.FK_OTDELID,
            COALESCE((SELECT MAX(ib.FK_VRACHID) FROM ASU.TIB ib WHERE ib.FK_PACID = pFK_PACID AND ib.fn_num = p.FK_ID), asu.GET_PACVRACH(pFK_PACID), p.ROOM_VRACH) as Vrach_ID
           FROM (SELECT v.fk_id, v.fd_data1, v.fd_data2, asu.GET_PALATA_FCVID(v.fk_koykavidid) sVid, totd.FC_NAME as OTD_NAME,
                        v.fk_palataid, r.FK_OTDELID, r.fk_vrachid as ROOM_VRACH, v.fk_koykavidid
                FROM asu.tperesel v INNER JOIN asu.troom r
                ON v.FK_PALATAID = r.FK_ID /*AND r.FK_OTDELID IN (119063, 21282, 135015, 362, 415223)*/ LEFT JOIN ASU.TOTDEL totd
                ON r.FK_OTDELID = totd.FK_ID
                WHERE v.fk_pacid = pFK_PACID AND STAT.PKG_STATUTIL.IS_PALATA_PRIEM(v.fk_palataid) = 0) p LEFT JOIN
                (SELECT ts.fk_mkb10, td.fd_date, td.fk_vrachid, ts.FK_MKB10 || ' ' || COALESCE(td.FC_WRITE, ts.FC_NAME) as DIAG_NAME
                FROM asu.tdiag td INNER JOIN asu.tsmid ts
                ON td.fk_smdiagid = ts.fk_id
           WHERE td.fk_pacid = pFK_PACID
                 AND td.fl_showib = 1
                 AND td.fl_main = STAT.PKG_STATUTIL.get_smidid('MAIN')
                 AND td.fp_type = STAT.PKG_STATUTIL.get_smidid('CLINIK')) a
           ON a.fd_date >= p.fd_data1 AND (a.fd_date < p.fd_data2 or DECODE(p.fk_id, nPers, null, 2, null, p.fd_data2) is null)
           ORDER BY p.fd_data1, a.fd_date DESC) LOOP

           sTmp := '<te:��������_��������_��_���������� archetype_node_id="openEHR-EHR-CLUSTER.movement_of_departments.v1" type="CLUSTER">' || CR ||
                    '<te:name>' || CR ||
                    '<te:value>�������� �������� �� ����������</te:value>' || CR ||
                    '</te:name>';
           DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

           sTmp := GET_RAZD_TYPE3('���������', '���������', C.FK_OTDELID, 'ELEMENT', 'at0007', 'DV_IDENTIFIER', '���������', C.OTD_NAME);
           DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

           sTmp := GET_RAZD_TYPE3('���_�����', '��� �����', C.Vrach_ID, 'ELEMENT', 'at0008', 'DV_IDENTIFIER', '����', ASU.DO_VRACHFIO(C.Vrach_ID));
           DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

           sTmp := GET_RAZD_TYPE2('�������������', '�������������', ASU.GET_MAPPING_SPR_STR('HST0067', 'TSOTR', C.Vrach_ID),
                                   'Speciality', ASU.GET_MAPPING_IEMK_SPR('HST0067', 'TSOTR', C.Vrach_ID), 'ELEMENT', 'at0009', 'DV_CODED_TEXT');
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

           /*sTmp := GET_RAZD_TYPE3('ID_������������_���������', 'ID ������������ ���������', C.FK_VRACHID, 'ELEMENT', 'at0008', 'DV_IDENTIFIER');
           DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

           sTmp := GET_RAZD_TYPE1('���_�����', '��� �����', C.COD_VRACH, 'ELEMENT', 'at0023', 'DV_TEXT');
           DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);*/

           sTmp := GET_RAZD_TYPE1('����_��������������', '���� ��������������', C.DATE_IN, 'ELEMENT', 'at0010', 'DV_DATE_TIME');
           DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

           sTmp := GET_RAZD_TYPE1('����_�������', '���� �������', C.DATE_OUT, 'ELEMENT', 'at0011', 'DV_DATE_TIME');
           DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

           sTmp := GET_RAZD_TYPE2('���_��_���', '��� �� ���', C.DIAG_NAME, 'Disease', C.FK_MKB10, 'ELEMENT', 'at0012', 'DV_CODED_TEXT');
           DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

           /*sTmp := GET_RAZD_TYPE1('���_��_���', '��� �� ���', C.FK_MKB10, 'ELEMENT', 'at0012', 'DV_TEXT');
           DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);*/

           sTmp := GET_RAZD_TYPE2('�������_�����', '������� �����', ASU.GET_MAPPING_SPR_STR('HST0060', 'TTIPROOM', C.fk_koykavidid),
                                   'BedProfile', ASU.GET_MAPPING_IEMK_SPR('HST0060', 'TTIPROOM', C.fk_koykavidid), 'ELEMENT', 'at0022', 'DV_CODED_TEXT');
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

           /*sTmp := GET_RAZD_TYPE1('�������_����', '������� ����', C.KOIKA_PROFIL, 'ELEMENT', 'at0022', 'DV_TEXT');
           DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);*/

           sTmp := GET_RAZD_TYPE2('���_������', '��� ������', ASU.GET_MAPPING_SPR_STR('HST0022', 'TTYPEDOC', nVidOpl),
                                   'PaymentType', ASU.GET_MAPPING_IEMK_SPR('HST0022', 'TTYPEDOC', nVidOpl), 'ELEMENT', 'at0024', 'DV_CODED_TEXT');
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

           /*sTmp := GET_RAZD_TYPE1('���_������', '��� ������', C.VID_OPL, 'ELEMENT', 'at0025', 'DV_TEXT');
           DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);*/

           sTmp := '</te:��������_��������_��_����������>';
           DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
  END LOOP;

  FOR C IN (SELECT A.FK_ID,
       (SELECT TO_CHAR(I.FD_DATE, 'YYYY-MM-DD')
        FROM ASU.TIB I
        WHERE I.FK_SMID IN (SELECT ts.fk_id FROM asu.tsmid ts WHERE (COALESCE(fl_del, 0) <> 1) AND ts.fc_synonim IN ('PROTHOPER_START'))
           AND I.FK_PACID = A.FK_ID) FD_BEG, --���� ����������
       -- Efimov V. 20100527 ��� ������������ ������ ��������� �������� �������� ���������� �� ������ ���
       NVL(decode(ASU.PKG_SMINI.READSTRING('CONFIG', 'DB_NAME', 'H'),
                  'SK',
                  nvl(A.fc_NAME,
                      (SELECT SYS_XMLAGG(XMLELEMENT(COL, ts.fc_name || ', ')) .EXTRACT('/ROWSET/COL/text()').GETSTRINGVAL() as FC_NAME
                         FROM ASU.TIB tI
                         left join asu.tsmid ts on ts.fk_id = ti.fk_smid
                        WHERE tI.FK_SMEDITID IN (Select ts.fk_id from asu.tsmid ts where (fl_del <> 1 or fl_del is null) connect by prior ts.fk_id = ts.fk_owner start with ts.fc_synonim in ('PROC_OPER_NAZ_OPER'))
                          AND tI.FK_PACID = A.FK_ID)),
                  decode(A.COMBO_NAME, null,
                         (SELECT MAX(I.FC_CHAR) FC_NAME
                            FROM ASU.TIB I
                           WHERE I.FK_SMID IN (Select ts.fk_id from asu.tsmid ts where (fl_del <> 1 or fl_del is null) and ts.fc_synonim in ('PROTHOPER_NAME', 'RENTGENXIR_NAME', 'PROTHOPER_DOPNAME', 'PROT_HOPERDOPNAME2'))
                             AND I.FK_PACID = A.FK_ID),
                         A.COMBO_NAME)),
           '�������� �� �������') FC_NAME,
        (SELECT I.FC_CHAR FC_KOD
          FROM ASU.TIB I
         WHERE I.FK_SMID IN (Select ts.fk_id from asu.tsmid ts where (fl_del <> 1 or fl_del is null) and ts.fc_synonim in ('OPER_KOD'))
           AND I.FK_PACID = A.FK_ID) FC_KOD,
           (SELECT MAX(I.FK_SMID)
          FROM ASU.TIB I
         WHERE I.FK_SMID IN (SELECT fk_id
                               FROM ASU.tsmid s
                              WHERE (fl_del <> 1 or fl_del is null)
                                and NOT EXISTS (SELECT fk_id
                                       FROM ASU.tsmid s1
                                      WHERE (s1.fl_del <> 1 or s1.fl_del is null)
                                        and s.fk_id = s1.fk_id
                                        AND s.fc_synonim = 'PROTHOPER_OBEZBOL')
                             CONNECT BY PRIOR fk_id = fk_owner
                              START WITH fc_synonim = 'PROTHOPER_OBEZBOL')
           AND I.FK_PACID = A.FK_ID) ANAST, --���������
       A.IS_COMBO_NAME
       /*(SELECT MAX(ASU.GET_OPEROSLOG(I.FK_PACID)) FC_OSLOZH
          FROM ASU.TIB I
         WHERE I.FK_SMEDITID IN (Select ts.fk_id from asu.tsmid ts where (fl_del <> 1 or fl_del is null) and ts.fc_synonim in ('OSLOG_OPER'))
           AND I.FK_PACID = A.FK_ID) FC_OSLOZH,*/
        FROM (SELECT N.FK_ID,
               N.FK_PACID,
               N.FK_VRACHID,
               ASU.GET_SOTRNAME(N.FK_VRACHID) FC_VRACH,
               tpn.FK_ID FK_PODPISID,
               ASU.GET_SOTRNAME(tpn.fk_sotrid) FC_PODPISVRACH,
               ts.fc_name,
               decode((select max(ts.fc_type) fc_type from asu.tsmid ts where ts.fc_synonim = 'PROTHOPER_NAME'), 'COMBOBOX', 1, 0) IS_COMBO_NAME,
               decode(N.COMBO_NAME, null,
                      (Select max(ts.fc_name) from asu.tsmid ts
                        where ts.fc_name = (SELECT MAX(I.FC_CHAR) FC_NAME
                                            FROM ASU.TIB I
                                           WHERE I.FK_SMID IN (Select ts.fk_id from asu.tsmid ts
                                                                where (fl_del <> 1 or fl_del is null)
                                                                  and ts.fc_synonim in ('PROTHOPER_NAME', 'RENTGENXIR_NAME', 'PROTHOPER_DOPNAME', 'PROT_HOPERDOPNAME2'))
                                             AND I.FK_PACID = N.FK_ID)),
                      N.COMBO_NAME) COMBO_NAME
          FROM (select VN.FK_ID, VN.FK_PACID, VN.FK_VRACHID, VN.FK_SMID, VN.FD_RUN, VN.FK_NAZSOSID,
                       (Select max(ts.fc_name) from asu.tsmid ts
                         where ts.fk_id = (SELECT MAX(I.FK_SMID) Fk_id FROM ASU.TIB I
                                            WHERE I.FK_SMEDITID IN (Select ts.fk_id from asu.tsmid ts where (fl_del <> 1 or fl_del is null) and ts.fc_synonim = 'PROTHOPER_NAME')
                                              and exists (select tsm.fk_id from asu.tsmid tsm where tsm.fk_id = FK_SMID and tsm.fk_owner = I.FK_SMEDITID)
                                              AND I.FK_PACID = VN.FK_ID)) COMBO_NAME
                  from ASU.VNAZ vn) N
          left join ASU.TPODPISNAZ tpn on tpn.fk_nazid = N.FK_ID
         inner join (Select ts.fk_id, '' fc_name
                      from asu.tsmid ts
                     where (fl_del <> 1 or fl_del is null)
                       and ts.fc_synonim in ('KONS_PROTHOPER', 'RENTGENXIR_OPER', 'ABORT', 'UROLOG_OPER')
                    union all
                    SELECT FK_ID, fc_name
                      FROM ASU.TSMID
                     WHERE ASU.PKG_SMINI.READSTRING('CONFIG', 'DB_NAME', 'H') = 'SK'
                    CONNECT BY PRIOR fk_id = fk_owner
                     START WITH FC_SYNONIM = 'RENTGENXIR_ISSLED') ts on ts.fk_id = n.fk_smid
         WHERE N.FK_PACID = pFK_PACID
           AND N.FK_NAZSOSID = ASU.GET_VIPNAZ
         ORDER BY N.FD_RUN) A) LOOP
         
         IF C.FD_BEG <> '' 
         THEN BEGIN

           sTmp := '<te:�������� archetype_node_id="openEHR-EHR-CLUSTER.operation.v1" type="CLUSTER">' || CR ||
                    '<te:name>' || CR ||
                    '<te:value>��������</te:value>' || CR ||
                    '</te:name>';
           DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

           sTmp := GET_RAZD_TYPE1('����_����������', '���� ����������', C.FD_BEG, 'ELEMENT', 'at0001', 'DV_DATE');
           DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

           sTmp := GET_RAZD_TYPE2('��������', '��������', C.FC_NAME,
                                   'NsiMedicalService', C.FC_KOD, 'ELEMENT', 'at0005', 'DV_CODED_TEXT');
           DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

           FOR C2 IN (SELECT FK_SMID
                      FROM ASU.TIB
                      WHERE FK_SMEDITID = (SELECT MAX(FK_ID) FROM ASU.TSMID WHERE FC_SYNONIM = 'OSLOG_OPER')
                          AND ROWNUM <= 2
                          AND FK_PACID = pFK_PACID) LOOP

               sTmp := GET_RAZD_TYPE2('����������', '����������', ASU.GET_MAPPING_SPR_STR('HST0029', 'TSMID', C2.FK_SMID),
                                   'ComplicationsAtSurgery', ASU.GET_MAPPING_IEMK_SPR('HST0029', 'TSMID', C2.FK_SMID), 'ELEMENT', 'at0006', 'DV_CODED_TEXT');
               DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
           END LOOP;

           sTmp := GET_RAZD_TYPE2('���������', '���������', ASU.GET_MAPPING_SPR_STR('HST0027', 'TSMID', C.ANAST),
                                   'Anesthesia', ASU.GET_MAPPING_IEMK_SPR('HST0027', 'TSMID', C.ANAST), 'ELEMENT', 'at0007', 'DV_CODED_TEXT');
           DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

           /* sTmp := '<te:�������������_������������������_���������� archetype_node_id="at0010" type="CLUSTER">' || CR ||
                    '<te:name>' || CR ||
                    '<te:value>������������� ������������������ ����������</te:value>' || CR ||
                    '</te:name>';
           DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

           sTmp := GET_RAZD_TYPE2('����������', '����������', ASU.GET_MAPPING_SPR_STR('HST0027', 'TSMID', C.ANAST),
                                   'Anesthesia', ASU.GET_MAPPING_IEMK_SPR('HST0027', 'TSMID', C.ANAST), 'ELEMENT', 'at0016', 'DV_CODED_TEXT');
           DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

           sTmp := '</te:�������������_������������������_����������>';
           DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);*/

           sTmp := GET_RAZD_TYPE2('���_������', '��� ������', ASU.GET_MAPPING_SPR_STR('HST0022', 'TTYPEDOC', nVidOpl),
                                   'PaymentType', ASU.GET_MAPPING_IEMK_SPR('HST0022', 'TTYPEDOC', nVidOpl), 'ELEMENT', 'at0014', 'DV_CODED_TEXT');
            DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

           sTmp := '</te:��������>';
           DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
       END;
     END IF;
  END LOOP;

  /*sTmp := '<te:���������� archetype_node_id="at0097" type="CLUSTER">' || CR ||
          '<te:name>' || CR ||
          '<te:value>����������</te:value>' || CR ||
          '</te:name>';
  DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

  sTmp := '</te:����������>';
  DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);*/

  sTmp := '<te:�������_����������__openBrkt_���_�������_closeBrkt_ archetype_node_id="at0111" type="CLUSTER">' || CR ||
          '<te:name>' || CR ||
          '<te:value>������� ���������� (��� �������)</te:value>' || CR ||
          '</te:name>';
  DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

  FOR C IN (SELECT -- �������������� ����������� �������
           (SELECT MAX(tdiag.FK_ID)
            FROM asu.tdiag, asu.tsmid
            WHERE (COALESCE(fl_del, 0) <> 1) and tsmid.fk_id = tdiag.fk_smdiagid AND tdiag.fk_pacid = pFK_PACID
              AND tdiag.fl_main = STAT.PKG_STATUTIL.get_smidid('MAIN') AND tdiag.fp_type = STAT.PKG_STATUTIL.get_smidid('PRI_VYPISKE')) DS_ZAKL,
           -- ���������� ��������� ������������ �������� 1
           (SELECT MAX(FK_ID) FK_ID
            FROM (SELECT ROWNUM RN, Q.*
                 FROM (SELECT TDIAG.*
                      FROM ASU.TDIAG, ASU.TSMID
                      WHERE (COALESCE(tsmid.fl_del, 0) <> 1) and TSMID.FK_ID = TDIAG.FK_SMDIAGID AND TDIAG.FK_PACID = pFK_PACID
                        AND TDIAG.FL_MAIN = STAT.PKG_STATUTIL.GET_SMIDID('OSLOG_MAIN') AND TDIAG.FP_TYPE = STAT.PKG_STATUTIL.GET_SMIDID('CLINIK')
                        ORDER BY TDIAG.FK_ID) Q) WHERE RN = 1) OOKD1,
           -- ���������� ��������� ������������ �������� 2
           (SELECT MAX(FK_ID) FK_ID
           FROM (SELECT ROWNUM RN, Q.*
             FROM (SELECT TDIAG.*
                  FROM ASU.TDIAG, ASU.TSMID
                  WHERE (COALESCE(tsmid.fl_del, 0) <> 1) and TSMID.FK_ID = TDIAG.FK_SMDIAGID AND TDIAG.FK_PACID = pFK_PACID
                        AND TDIAG.FL_MAIN = STAT.PKG_STATUTIL.GET_SMIDID('OSLOG_MAIN') AND TDIAG.FP_TYPE = STAT.PKG_STATUTIL.GET_SMIDID('CLINIK')
                  ORDER BY TDIAG.FK_ID) Q) WHERE RN = 2) OOKD2,
          -- ���������� ��������� ������������ �������� 3
          (SELECT MAX(FK_ID) FK_ID
          FROM (SELECT ROWNUM RN, Q.*
             FROM (SELECT TDIAG.*
                  FROM ASU.TDIAG, ASU.TSMID
                  WHERE (COALESCE(tsmid.fl_del, 0) <> 1) and TSMID.FK_ID = TDIAG.FK_SMDIAGID AND TDIAG.FK_PACID = pFK_PACID
                        AND TDIAG.FL_MAIN = STAT.PKG_STATUTIL.GET_SMIDID('OSLOG_MAIN') AND TDIAG.FP_TYPE = STAT.PKG_STATUTIL.GET_SMIDID('CLINIK')
                  ORDER BY TDIAG.FK_ID) Q) WHERE RN = 3) OOKD3,
          -- ������������� ����������� ������� 1
          (SELECT MAX(FK_ID)
          FROM (SELECT ROWNUM RN, Q.*
             FROM (SELECT TDIAG.*
                  FROM ASU.TDIAG, ASU.TSMID
                  WHERE (COALESCE(tsmid.fl_del, 0) <> 1) and TSMID.FK_ID = TDIAG.FK_SMDIAGID AND TDIAG.FK_PACID = pFK_PACID
                        AND TDIAG.FL_MAIN = STAT.PKG_STATUTIL.GET_SMIDID('SOPUT') AND (TDIAG.FP_TYPE = STAT.PKG_STATUTIL.GET_SMIDID('CLINIK')
                        OR TDIAG.FP_TYPE = STAT.PKG_STATUTIL.GET_SMIDID('PRI_VYPISKE')) ORDER BY TDIAG.FK_ID) Q) WHERE RN = 1) SKD1,
          -- ������������� ����������� ������� 2
          (SELECT MAX(FK_ID)
          FROM (SELECT ROWNUM RN, Q.*
             FROM (SELECT TDIAG.*
                  FROM ASU.TDIAG, ASU.TSMID
                  WHERE (COALESCE(tsmid.fl_del, 0) <> 1) and TSMID.FK_ID = TDIAG.FK_SMDIAGID AND TDIAG.FK_PACID = pFK_PACID
                        AND TDIAG.FL_MAIN = STAT.PKG_STATUTIL.GET_SMIDID('SOPUT') AND (TDIAG.FP_TYPE = STAT.PKG_STATUTIL.GET_SMIDID('CLINIK')
                        OR TDIAG.FP_TYPE = STAT.PKG_STATUTIL.GET_SMIDID('PRI_VYPISKE')) ORDER BY TDIAG.FK_ID) Q) WHERE RN = 2) SKD2,
          -- ������������� ����������� ������� 3
          (SELECT MAX(FK_ID)
          FROM (SELECT ROWNUM RN, Q.*
             FROM (SELECT TDIAG.*
                  FROM ASU.TDIAG, ASU.TSMID
                  WHERE (COALESCE(tsmid.fl_del, 0) <> 1) and TSMID.FK_ID = TDIAG.FK_SMDIAGID AND TDIAG.FK_PACID = pFK_PACID
                        AND TDIAG.FL_MAIN = STAT.PKG_STATUTIL.GET_SMIDID('SOPUT') AND (TDIAG.FP_TYPE = STAT.PKG_STATUTIL.GET_SMIDID('CLINIK')
                        OR TDIAG.FP_TYPE = STAT.PKG_STATUTIL.GET_SMIDID('PRI_VYPISKE')) ORDER BY TDIAG.FK_ID) Q) WHERE RN = 3) SKD3
         FROM DUAL) LOOP

         --sTmp := '<te:��������_����������� archetype_node_id="openEHR-EHR-CLUSTER.app_diagnosed_disease.v1" type="CLUSTER">' || CR ||
          sTmp := '<te:��������_�����������>' || CR ||
          '<te:name>' || CR ||
          '<te:value>�������� �����������</te:value>' || CR ||
          '</te:name>';
         DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

         IF NVL(C.DS_ZAKL, 0) <> 0
         THEN
            SELECT TS.FK_MKB10, ts.FK_MKB10 || ' ' || COALESCE(td.FC_WRITE, ts.FC_NAME), td.FL_FIRST
            INTO sTmp2, sTmp3, numTmp
            FROM ASU.TDIAG td, ASU.TSMID ts
            WHERE td.FK_ID = C.DS_ZAKL AND td.FK_SMDIAGID = ts.FK_ID;
         END IF;

         IF sTmp2 = NULL
         THEN
            sTmp2 := '-';
         END IF;

         IF sTmp2 = NULL
         THEN
            sTmp2 := '-';
         END IF;

         IF numTmp = NULL
         THEN
            numTmp := -1;
         END IF;

         sTmp := GET_RAZD_TYPE2('���_��_���', '��� �� ���', NVL(sTmp3, '-'), 'Disease', NVL(sTmp2, '-'), 'ELEMENT', 'at0001', 'DV_CODED_TEXT');
         DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

         sTmp := GET_RAZD_TYPE2('��������_�����������', '�������� �����������', ASU.GET_MAPPING_SPR_STR('HST0015', 'TSMID', numTmp),
                                   'DiseaseCharacter', TO_CHAR(ASU.GET_MAPPING_IEMK_SPR('HST0015', 'TSMID', numTmp)), 'ELEMENT', 'at0003', 'DV_CODED_TEXT');
         DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

         sTmp := '</te:��������_�����������>';
         DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

         IF NVL(C.OOKD1, 0) <> 0
         THEN
           BEGIN
             --sTmp := '<te:���������� archetype_node_id="openEHR-EHR-CLUSTER.app_diagnosed_disease.v1" type="CLUSTER">' || CR ||
             sTmp := '<te:����������>' || CR ||
                  '<te:name>' || CR ||
                  '<te:value>����������</te:value>' || CR ||
                  '</te:name>';
             DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

             SELECT TS.FK_MKB10, ts.FK_MKB10 || ' ' || COALESCE(td.FC_WRITE, ts.FC_NAME), td.FL_FIRST
             INTO sTmp2, sTmp3, numTmp
             FROM ASU.TDIAG td, ASU.TSMID ts
             WHERE td.FK_ID = C.OOKD1 AND td.FK_SMDIAGID = ts.FK_ID;

             sTmp := GET_RAZD_TYPE2('���_��_���', '��� �� ���', sTmp3, 'Disease', sTmp2, 'ELEMENT', 'at0001', 'DV_CODED_TEXT');
             DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

             sTmp := GET_RAZD_TYPE2('��������_�����������', '�������� �����������', ASU.GET_MAPPING_SPR_STR('HST0015', 'TSMID', numTmp),
                                   'DiseaseCharacter', ASU.GET_MAPPING_IEMK_SPR('HST0015', 'TSMID', numTmp), 'ELEMENT', 'at0003', 'DV_CODED_TEXT');
             DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

             sTmp := '</te:����������>';
             DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
           END;
         END IF;

         IF NVL(C.OOKD2, 0) <> 0
         THEN
           BEGIN
             --sTmp := '<te:���������� archetype_node_id="openEHR-EHR-CLUSTER.app_diagnosed_disease.v1" type="CLUSTER">' || CR ||
             sTmp := '<te:����������>' || CR ||
                  '<te:name>' || CR ||
                  '<te:value>����������</te:value>' || CR ||
                  '</te:name>';
             DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

             SELECT TS.FK_MKB10, ts.FK_MKB10 || ' ' || COALESCE(td.FC_WRITE, ts.FC_NAME), td.FL_FIRST
             INTO sTmp2, sTmp3, numTmp
             FROM ASU.TDIAG td, ASU.TSMID ts
             WHERE td.FK_ID = C.OOKD2 AND td.FK_SMDIAGID = ts.FK_ID;

             sTmp := GET_RAZD_TYPE2('���_��_���', '��� �� ���', sTmp3, 'Disease', sTmp2, 'ELEMENT', 'at0001', 'DV_CODED_TEXT');
             DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

             sTmp := GET_RAZD_TYPE2('��������_�����������', '�������� �����������', ASU.GET_MAPPING_SPR_STR('HST0015', 'TSMID', numTmp),
                                   'DiseaseCharacter', ASU.GET_MAPPING_IEMK_SPR('HST0015', 'TSMID', numTmp), 'ELEMENT', 'at0003', 'DV_CODED_TEXT');
             DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

             sTmp := '</te:����������>';
             DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
           END;
         END IF;

         IF NVL(C.OOKD3, 0) <> 0
         THEN
           BEGIN
             --sTmp := '<te:���������� archetype_node_id="openEHR-EHR-CLUSTER.app_diagnosed_disease.v1" type="CLUSTER">' || CR ||
             sTmp := '<te:����������>' || CR ||
                  '<te:name>' || CR ||
                  '<te:value>����������</te:value>' || CR ||
                  '</te:name>';
             DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

             SELECT TS.FK_MKB10, ts.FK_MKB10 || ' ' || COALESCE(td.FC_WRITE, ts.FC_NAME), td.FL_FIRST
             INTO sTmp2, sTmp3, numTmp
             FROM ASU.TDIAG td, ASU.TSMID ts
             WHERE td.FK_ID = C.OOKD3 AND td.FK_SMDIAGID = ts.FK_ID;

             sTmp := GET_RAZD_TYPE2('���_��_���', '��� �� ���', sTmp3, 'Disease', sTmp2, 'ELEMENT', 'at0001', 'DV_CODED_TEXT');
             DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

             sTmp := GET_RAZD_TYPE2('��������_�����������', '�������� �����������', ASU.GET_MAPPING_SPR_STR('HST0015', 'TSMID', numTmp),
                                   'DiseaseCharacter', ASU.GET_MAPPING_IEMK_SPR('HST0015', 'TSMID', numTmp), 'ELEMENT', 'at0003', 'DV_CODED_TEXT');
             DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

             sTmp := '</te:����������>';
             DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
           END;
         END IF;

         IF NVL(C.SKD1, 0) <> 0
         THEN
           BEGIN
             --sTmp := '<te:�������������_����������� archetype_node_id="openEHR-EHR-CLUSTER.app_diagnosed_disease.v1" type="CLUSTER">' || CR ||
             sTmp := '<te:�������������_�����������>' || CR ||
                  '<te:name>' || CR ||
                  '<te:value>������������� �����������</te:value>' || CR ||
                  '</te:name>';
             DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

             SELECT TS.FK_MKB10, ts.FK_MKB10 || ' ' || COALESCE(td.FC_WRITE, ts.FC_NAME), td.FL_FIRST
             INTO sTmp2, sTmp3, numTmp
             FROM ASU.TDIAG td, ASU.TSMID ts
             WHERE td.FK_ID = C.SKD1 AND td.FK_SMDIAGID = ts.FK_ID;

             sTmp := GET_RAZD_TYPE2('���_��_���', '��� �� ���', sTmp3, 'Disease', sTmp2, 'ELEMENT', 'at0001', 'DV_CODED_TEXT');
             DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

             sTmp := GET_RAZD_TYPE2('��������_�����������', '�������� �����������', ASU.GET_MAPPING_SPR_STR('HST0015', 'TSMID', numTmp),
                                   'DiseaseCharacter', ASU.GET_MAPPING_IEMK_SPR('HST0015', 'TSMID', numTmp), 'ELEMENT', 'at0003', 'DV_CODED_TEXT');
             DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

             sTmp := '</te:�������������_�����������>';
             DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
           END;
         END IF;

         IF NVL(C.SKD2, 0) <> 0
         THEN
           BEGIN
             --sTmp := '<te:�������������_����������� archetype_node_id="openEHR-EHR-CLUSTER.app_diagnosed_disease.v1" type="CLUSTER">' || CR ||
             sTmp := '<te:�������������_�����������>' || CR ||
                  '<te:name>' || CR ||
                  '<te:value>������������� �����������</te:value>' || CR ||
                  '</te:name>';
             DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

             SELECT TS.FK_MKB10, ts.FK_MKB10 || ' ' || COALESCE(td.FC_WRITE, ts.FC_NAME), td.FL_FIRST
             INTO sTmp2, sTmp3, numTmp
             FROM ASU.TDIAG td, ASU.TSMID ts
             WHERE td.FK_ID = C.SKD2 AND td.FK_SMDIAGID = ts.FK_ID;

             sTmp := GET_RAZD_TYPE2('���_��_���', '��� �� ���', sTmp3, 'Disease', sTmp2, 'ELEMENT', 'at0001', 'DV_CODED_TEXT');
             DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

             sTmp := GET_RAZD_TYPE2('��������_�����������', '�������� �����������', ASU.GET_MAPPING_SPR_STR('HST0015', 'TSMID', numTmp),
                                   'DiseaseCharacter', ASU.GET_MAPPING_IEMK_SPR('HST0015', 'TSMID', numTmp), 'ELEMENT', 'at0003', 'DV_CODED_TEXT');
             DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

             sTmp := '</te:�������������_�����������>';
             DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
           END;
         END IF;

         IF NVL(C.SKD3, 0) <> 0
         THEN
           BEGIN
             --sTmp := '<te:�������������_����������� archetype_node_id="openEHR-EHR-CLUSTER.app_diagnosed_disease.v1" type="CLUSTER">' || CR ||
             sTmp := '<te:�������������_�����������>' || CR ||
                  '<te:name>' || CR ||
                  '<te:value>������������� �����������</te:value>' || CR ||
                  '</te:name>';
             DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

             SELECT TS.FK_MKB10, ts.FK_MKB10 || ' ' || COALESCE(td.FC_WRITE, ts.FC_NAME), td.FL_FIRST
             INTO sTmp2, sTmp3, numTmp
             FROM ASU.TDIAG td, ASU.TSMID ts
             WHERE td.FK_ID = C.SKD3  AND td.FK_SMDIAGID = ts.FK_ID;

             sTmp := GET_RAZD_TYPE2('���_��_���', '��� �� ���', sTmp3, 'Disease', sTmp2, 'ELEMENT', 'at0001', 'DV_CODED_TEXT');
             DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

             sTmp := GET_RAZD_TYPE2('��������_�����������', '�������� �����������', ASU.GET_MAPPING_SPR_STR('HST0015', 'TSMID', numTmp),
                                   'DiseaseCharacter', ASU.GET_MAPPING_IEMK_SPR('HST0015', 'TSMID', numTmp), 'ELEMENT', 'at0003', 'DV_CODED_TEXT');
             DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

             sTmp := '</te:�������������_�����������>';
             DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
           END;
         END IF;
  END LOOP;

  sTmp := '</te:�������_����������__openBrkt_���_�������_closeBrkt_>';
  DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

  FOR C IN (SELECT -- ������� ������
                   (SELECT MAX(FC_CHAR)
                   FROM ASU.TIB
                   WHERE FK_PACID = pFK_PACID AND FK_SMID = (SELECT MAX(FK_ID) FROM ASU.TSMID WHERE (COALESCE(fl_del, 0) <> 1) and FC_SYNONIM = 'DIE_PRICH')) PRICH_SMERTI,
                   -- ��� ������� ������
                   (SELECT MAX(FC_CHAR)
                   FROM ASU.TIB
                   WHERE FK_PACID = pFK_PACID AND FK_SMID = (SELECT MAX(FK_ID) FROM ASU.TSMID WHERE (COALESCE(fl_del, 0) <> 1) and FC_SYNONIM = 'DIE_MKB')) PRICH_SMERTI_KOD
           FROM DUAL) LOOP

           IF C.PRICH_SMERTI_KOD <> ''
           THEN
             BEGIN
               sTmp := '<te:�������_������ archetype_node_id="at0144" type="CLUSTER">' || CR ||
                  '<te:name>' || CR ||
                  '<te:value>������� ������</te:value>' || CR ||
                  '</te:name>';
               DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

               sTmp := GET_RAZD_TYPE2('���_��_���', '��� �� ���', C.PRICH_SMERTI_KOD || ' ' || C.PRICH_SMERTI, 'Disease',
                    C.PRICH_SMERTI_KOD, 'ELEMENT', 'at0145', 'DV_CODED_TEXT');
               DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

               sTmp := '</te:�������_������>';
               DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
             END;
           END IF;
  END LOOP;

  /*EXECUTE IMMEDIATE('begin truncate table asu.vnaz_cost_limit; commit; end;');

  INSERT INTO ASU.VNAZ_COST_LIMIT(fk_nazid, FD_CALC)
  SELECT fk_id, fd_run
  FROM asu.vnaz where fk_pacid = pFK_PACID and fk_nazsosid = 1;

  EXECUTE IMMEDIATE('analyze table asu.vnaz_cost_limit compute statistics for table for all indexes for all columns size 100'); -- ������� �� ������ ���� ���������, ��� ��������� ������

  EXECUTE IMMEDIATE('truncate table ASU.Vnaz_Cost_Heal_Cut');

  insert into ASU.Vnaz_Cost_Heal_Cut(TYPEDOC_SYN)
  select t.FC_SYNONIM from asu.ttypedoc t where t.FK_ID <> nVidOpl;

  asu.pkg_vnaz_cost.Calculate;

  commit;*/

  sTmp := CREATE_CALC(pFK_PACID, nVidOpl);

  FOR C IN (SELECT vc.fk_healid, vc.heal_code, th.fc_name,
            SUM(vc.heal_count) as SHEAL_COUNT
            FROM ASU.VNAZ_COST vc LEFT JOIN ASU.THEAL th
            ON vc.Fk_Healid = th.fk_id
            WHERE vc.fk_healid IS NOT NULL
            GROUP BY vc.fk_healid, vc.heal_code, th.fc_name) LOOP

         sTmp := '<te:���������_������ archetype_node_id="openEHR-EHR-CLUSTER.rendered_service_hmao.v1" type="CLUSTER">' || CR ||
                  '<te:name>' || CR ||
                  '<te:value>��������� ������</te:value>' || CR ||
                  '</te:name>';
         DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

         sTmp := GET_RAZD_TYPE2('���_�����������_������', '��� ����������� ������', C.FC_NAME, 'NsiServiceType',
                    C.HEAL_CODE, 'ELEMENT', 'at0001', 'DV_CODED_TEXT');
         DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

         sTmp := GET_RAZD_TYPE2('�������_�����_�����������_������', '������� ����� ����������� ������', '', 'NsiAccountingUnitOfCare',
                    '', 'ELEMENT', 'at0002', 'DV_CODED_TEXT');
         DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

         sTmp := GET_RAZD_TYPE1('����������_�����', '���������� �����',
                                    '<te:magnitude>' || CR || TO_CHAR(C.SHEAL_COUNT) || CR || '</te:magnitude>',
                                    'ELEMENT', 'at0003', 'DV_COUNT');
         DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

         sTmp := '</te:���������_������>';
         DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
  END LOOP;

  sTmp := CR || '</te:data>' || CR || '</te:�������>';
  DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

  sTmp := CR || '</te:�����_66>';
  DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

  RETURN clTmp;
END;

FUNCTION GET_XML_F25(pFK_TALONID NUMBER) RETURN CLOB IS
  clTmp   CLOB;
  sTmp    VARCHAR2(32767);
  sTmp2   VARCHAR(1000);
  sTmp3   VARCHAR(3100);
  nPers   NUMBER;
  pDate   DATE;
  nVidOpl NUMBER;
  numTmp  NUMBER;
  nPeplid NUMBER;
  numres  NUMBER;
  CURSOR cTalon IS
   SELECT A.FK_ID,
       t.fk_id talonid,
       a.fk_peplid,
       A.FK_IBID,
       A.FK_IBY,
       to_char(FROM_TZ(CAST(T.FD_OPENED as TIMESTAMP),DBTIMEZONE), 'YYYY-MM-DD"T"HH24:MI:SS.FF1TZH:TZM') 
       /*to_char(T.FD_OPENED, 'YYYY-MM-DD"T"HH:MI:SS')*/ FD_OPENED,
       to_char(FROM_TZ(CAST(T.FD_CLOSED as TIMESTAMP),DBTIMEZONE), 'YYYY-MM-DD"T"HH24:MI:SS.FF1TZH:TZM')
       /*to_char(T.FD_CLOSED, 'YYYY-MM-DD"T"HH:MI:SS')*/ FD_CLOSED,
       T.FK_SOTRID,
       ASU.PKG_REGIST_PACFUNC.GET_PAC_VRACHFULLFIO(t.fk_sotrid) sotrname,
       ASU.GET_MAPPING_IEMK_SPR('HST0067', 'TSOTR', ASU.PKG_REGIST_PACFUNC.GET_PAC_VRACHID((SELECT S.FK_SPRAVID FROM LOGIN.TSOTR S WHERE S.FK_ID = T.FK_SOTRID))) spravid,
       (SELECT S.FK_OTDELID FROM LOGIN.TSOTR S WHERE S.FK_ID = T.FK_SOTRID) otdelid,
       t.fk_rezhimid typepriem,
       t.fk_servplace mestopriema,
       asu.get_smidname(t.fk_servplace) smestopriema,
       t.fk_reason celposesch,
       asu.get_smidname(t.fk_reason) scelposesch,
       t.fk_lpuid,
       t.fk_result,
       asu.get_smidname(t.fk_result) sresult,
       t.fk_dopishodid,
       asu.get_smidname(t.fk_dopishodid) sdopishodid
  FROM ASU.TAMBULANCE A, ASU.TAMBTALON T
 WHERE A.FK_ID = T.FK_AMBID
   AND t.FK_ID = pFK_TALONID;
  CURSOR cInsur IS
   SELECT I.FK_ID,
          I.FC_SER,
          I.FC_NUM,
          I.FK_TYPEOMS,
          I.FK_COMPANYID,
          I.FK_DOGOVORID,
          I.FK_TYPEDOCID
     FROM ASU.TINSURDOCS I
    WHERE I.FK_PEPLID = nPeplid
    ORDER BY I.FD_END DESC, I.FD_BEGIN DESC;
  CURSOR cDiag(pSyn VARCHAR2) IS
   SELECT D.FK_SMDIAGID,
          ASU.GET_MKB10_BY_ID(D.FK_SMDIAGID) MKBX,
          D.FP_TYPE,
          ASU.GET_SMIDNAME(D.FP_TYPE) STYPE,
          D.FL_FIRST,
          ASU.GET_SMIDNAME(D.FL_FIRST) SFIRST,
          to_char(FROM_TZ(CAST(d.fd_date as TIMESTAMP),DBTIMEZONE), 'YYYY-MM-DD"T"HH24:MI:SS.FF1TZH:TZM') 
          /*to_char(d.fd_date,'YYYY-MM-DD"T"HH24:MI:SS')*/ fd_date,
          d.fk_vrachid,
          asu.get_sotrname(d.fk_vrachid) svrach
     FROM ASU.TDIAG D, ASU.TAMBTALON_DIAGS AD
    WHERE D.FK_ID = AD.FK_DIAGID
      AND AD.FK_TALONID = pFK_TALONID
         AND d.fl_main IN (SELECT fk_id FROM asu.tsmid s WHERE s.fc_synonim = pSyn)
    ORDER BY D.FD_DATE;
  CURSOR cNaz IS
    SELECT VC.FK_HEALID,
           VC.HEAL_CODE,
           TH.FC_NAME,
           SUM(VC.HEAL_COUNT) AS SHEAL_COUNT
      FROM ASU.VNAZ_COST VC
      LEFT JOIN ASU.THEAL TH
        ON VC.FK_HEALID = TH.FK_ID
     WHERE VC.FK_HEALID IS NOT NULL
     GROUP BY VC.FK_HEALID, VC.HEAL_CODE, TH.FC_NAME;
BEGIN
  DBMS_LOB.CREATETEMPORARY(clTmp, TRUE, DBMS_LOB.call);
  DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(pBeginXML_25), pBeginXML_25);
  numres := 0;
  
  FOR c IN cTalon LOOP
   nPeplid := c.fk_peplid;
   stmp := '<te:context other_context_node_id="at0001" other_context_type="ITEM_TREE">'||cr||
           ' <te:start_time>'||cr||
           '     <oe:value>'||c.fd_opened||'</oe:value>'||cr||
           ' </te:start_time>'||cr||
           ' <te:end_time>'||cr||
           '     <oe:value>'||c.fd_closed||'</oe:value>'||cr||
           ' </te:end_time>'||cr||
           ' <te:setting>'||cr||
           '     <oe:value></oe:value>'||cr||
           '     <oe:defining_code>'||cr||
           '         <oe:terminology_id>'||cr||
           '             <oe:value></oe:value>'||cr||
           '         </oe:terminology_id>'||cr||
           '         <oe:code_string></oe:code_string>'||cr||
           '     </oe:defining_code>'||cr||
           ' </te:setting>'||cr||
           '</te:context>'||cr;
   DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
   stmp := '<te:�����_���������� archetype_node_id="openEHR-EHR-ADMIN_ENTRY.general_information.v1" type="ADMIN_ENTRY">'||cr;
   DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
   sTmp := '    <te:name>'||cr||
           '        <te:value>����� ����������</te:value>'||cr||
           '    </te:name>'||cr||
           '    <te:language>'||cr||
           '        <te:terminology_id>'||cr||
           '            <te:value>ISO_639-1</te:value>'||cr||
           '        </te:terminology_id>'||cr||
           '        <te:code_string>ru</te:code_string>'||cr||
           '    </te:language>'||cr||
           '    <te:encoding>'||cr||
           '        <te:terminology_id>'||cr||
           '            <te:value>IANA_character-sets</te:value>'||cr||
           '        </te:terminology_id>'||cr||
           '        <te:code_string>UTF-8</te:code_string>'||cr||
           '    </te:encoding>'||cr||
           '    <te:subject>'||cr||
           '    </te:subject>'||cr;
   DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
   stmp := '    <te:data archetype_node_id="at0001" type="ITEM_TREE">'||cr;
   DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
   stmp := GET_RAZD_TYPE1('����_�_�����_������','���� � ����� ������',c.fd_opened,'ELEMENT', 'at0032', 'DV_DATE_TIME');
   DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
   stmp := '      <te:����������_�_�����������_��������� archetype_node_id="at0071" type="CLUSTER">'||cr||
           '        <te:name>'||cr||'          <te:value>���������� � ����������� ���������</te:value>'||cr||
           '        </te:name>'||cr;
   DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
   stmp := GET_RAZD_TYPE3('ID_������������_���������','ID ������������ ���������',c.fk_sotrid,'ELEMENT', 'at0003', 'DV_IDENTIFIER');
   DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
   stmp := GET_RAZD_TYPE1('���_������������_���������','��� ������������ ���������',c.fk_sotrid,'ELEMENT', 'at0070', 'DV_TEXT');
   DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
   stmp := GET_RAZD_TYPE1('���_�������������_������������_���������','��� ������������� ������������ ���������',c.spravid,'ELEMENT', 'at0004', 'DV_TEXT');
   DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
   stmp := '</te:����������_�_�����������_���������>'||cr;
   DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
   stmp := GET_RAZD_TYPE2('�����_������������','����� ������������',c.mestopriema,ASU.GET_MAPPING_IEMK_SPR('HST0021', 'TSMID', C.mestopriema),c.mestopriema,'ELEMENT', 'at0007', 'DV_CODED_TEXT');
   DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
   stmp := '<te:����������_��_������ archetype_node_id="openEHR-EHR-CLUSTER.medical_insurance.v1" type="CLUSTER">'||cr||
           '            <te:name>'||cr||'                <te:value>���������� �� ������</te:value>'||cr||'            </te:name>'||cr;
   DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
   FOR c1 IN cInsur LOOP
    stmp := GET_RAZD_TYPE1('�����_������','����� ������',c1.fc_num,'ELEMENT','at0003','DV_TEXT');
    DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
    stmp := GET_RAZD_TYPE1('�����_������','����� ������',c1.fc_ser,'ELEMENT','at0004','DV_TEXT');
    DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
    stmp := GET_RAZD_TYPE1('���_���������_��������','��� ��������� ��������',c1.fk_companyid,'ELEMENT','at0002','DV_TEXT');
    DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
    EXIT;
   END LOOP;
   stmp := '</te:����������_��_������>'||cr;
   DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
   stmp := GET_RAZD_TYPE2('����_���������','���� ���������',c.celposesch,ASU.GET_MAPPING_IEMK_SPR('HST0004', 'TSMID', C.celposesch),c.scelposesch,'ELEMENT', 'at0008', 'DV_CODED_TEXT');
   DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
   stmp := '    </te:data>'||cr||'</te:�����_����������>'||cr;
           /*||'<te:������_����������� archetype_node_id="openEHR-EHR-ADMIN_ENTRY.encounter.v1" type="ADMIN_ENTRY">'||cr||
           '    <te:name>'||cr||'        <te:value>������ �����������</te:value>'||cr||'    </te:name>'||cr||
           '    <te:language>'||cr||'        <te:terminology_id>'||cr||'            <te:value>ISO_639-1</te:value>'||cr||
           '        </te:terminology_id>'||cr||'        <te:code_string>ru</te:code_string>'||cr||'    </te:language>'||cr||
           '    <te:encoding>'||cr||'        <te:terminology_id>'||cr||'            <te:value>IANA_character-sets</te:value>'||cr||
           '        </te:terminology_id>'||cr||'        <te:code_string>UTF-8</te:code_string>'||cr||'    </te:encoding>'||cr||
           '    <te:subject>'||cr||'    </te:subject>'||cr||'    <te:data archetype_node_id="at0001" type="ITEM_TREE">'||cr;
   DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
   stmp := GET_RAZD_TYPE3('ID_������_�����������','ID ������ �����������',c.talonid,'ELEMENT','at0007','DV_IDENTIFIER');
   DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
   stmp := GET_RAZD_TYPE1('����_��������_������','���� �������� ������',c.fd_opened,'ELEMENT','at0006','DV_DATE_TIME');
   DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
   stmp := GET_RAZD_TYPE1('����_��������_������_','���� �������� ������',c.fd_closed,'ELEMENT','at0004','DV_DATE_TIME');*/
   DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
   
   stmp := --'    </te:data>'||cr||'</te:������_�����������>'||cr||
           '<te:����������_������� archetype_node_id="openEHR-EHR-EVALUATION.app_conclusion.v1" type="EVALUATION">'||cr||
           '    <te:name>'||cr||'        <te:value>���������� �������</te:value>'||cr||'    </te:name>'||cr||
           '    <te:language>'||cr||'        <te:terminology_id>'||cr||'            <te:value>ISO_639-1</te:value>'||cr||
           '        </te:terminology_id>'||cr||'        <te:code_string>ru</te:code_string>'||cr||'    </te:language>'||cr||
           '    <te:encoding>'||cr||'        <te:terminology_id>'||cr||'            <te:value>IANA_character-sets</te:value>'||cr||
           '        </te:terminology_id>'||cr||'        <te:code_string>UTF-8</te:code_string>'||cr||'    </te:encoding>'||cr||
           '    <te:subject>'||cr||'    </te:subject>'||cr||'    <te:data archetype_node_id="at0001" type="ITEM_TREE">'||cr||
           '        <te:��������_������� archetype_node_id="openEHR-EHR-CLUSTER.app_diagnosed_disease.v1" type="CLUSTER">'||cr||
           '            <te:name>'||cr||'                <te:value>�������� �������</te:value>'||cr||'            </te:name>'||cr;
   DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
   FOR c2 IN cDiag('MAIN') LOOP
    stmp := GET_RAZD_TYPE2('���_��_���','��� �� ���',c2.mkbx,'M00001','������������� ������������� �������� � ���������, ��������� �� ��������� 10 ����������',
                           'ELEMENT','at0001','DV_CODED_TEXT');
    DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
    stmp := GET_RAZD_TYPE2('��������_�����������','�������� �����������','','','','ELEMENT','at0003','DV_CODED_TEXT');
    DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
    stmp := GET_RAZD_TYPE2('������','������','','','','ELEMENT','at0007','DV_CODED_TEXT');
    DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
/*    stmp := '            <te:����������_�_������������_����� archetype_node_id="openEHR-EHR-CLUSTER.app_dispensary_observation.v1" type="CLUSTER">'||cr||
            '                <te:name>'||cr||'                    <te:value>���������� � ������������ �����</te:value>'||cr||'                </te:name>'||cr;
    DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
    stmp := GET_RAZD_TYPE1('������������_����','������������ ����','','ELEMENT','at00046','DV_TEXT');
    DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);    */
    EXIT;
   END LOOP;
   stmp := /*'            </te:����������_�_������������_�����>'||cr||*/'        </te:��������_�������>'||cr;
   DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
   FOR c2 IN cDiag('SOPUT') LOOP
    stmp := '        <te:�������������_������� archetype_node_id="openEHR-EHR-CLUSTER.app_diagnosed_disease.v1" type="CLUSTER">'||cr||
            '            <te:name>'||cr||'                <te:value>������������� �������</te:value>'||cr||'            </te:name>'||cr;
    DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
    stmp := GET_RAZD_TYPE2('���_��_���','��� �� ���',c2.mkbx,'M00001','������������� ������������� �������� � ���������, ��������� �� ��������� 10 ����������',
                           'ELEMENT','at0001','DV_CODED_TEXT');
    DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
    stmp := GET_RAZD_TYPE2('��������_�����������','�������� �����������','','','','ELEMENT','at0003','DV_CODED_TEXT');
    DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
    stmp := GET_RAZD_TYPE2('������','������','','','','ELEMENT','at0007','DV_CODED_TEXT');
    DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
    --DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
--    stmp := GET_RAZD_TYPE1('������������_����','������������ ����','','ELEMENT','at00046','DV_CODED_TEXT');
--    DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
    stmp := '            </te:�������������_�������>'||cr;
    DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
   END LOOP;
   stmp := '        <te:���������_��������� archetype_node_id="openEHR-EHR-CLUSTER.app_treatment_result.v1" type="CLUSTER">'||cr||
           '            <te:name>'||cr||'                <te:value>��������� ���������</te:value>'||cr||'            </te:name>'||cr;
   DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
   stmp := GET_RAZD_TYPE1('���������_���������','��������� ���������',c.sresult,'ELEMENT','at0001','DV_TEXT');
   DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
   stmp := GET_RAZD_TYPE1('�����_�����������','����� �����������',c.sdopishodid,'ELEMENT','at0016','DV_TEXT');
   DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
   stmp := '        </te:���������_���������>'||cr;
   DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
   
   numres := 1;
   
   EXIT;
  END LOOP;

  stmp := CREATE_CALC25(pFK_TALONID);

  FOR C IN cNaz LOOP
    sTmp := '<te:���������_������ archetype_node_id="openEHR-EHR-CLUSTER.rendered_service_hmao.v1" type="CLUSTER">' || CR ||
            '<te:name>' || CR ||
            '<te:value>��������� ������</te:value>' || CR ||
            '</te:name>';
    DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

    sTmp := GET_RAZD_TYPE2('���_�����������_������', '��� ����������� ������', C.FC_NAME, 'NsiServiceType',
              C.HEAL_CODE, 'ELEMENT', 'at0001', 'DV_CODED_TEXT');
    DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

    sTmp := GET_RAZD_TYPE2('�������_�����_�����������_������', '������� ����� ����������� ������', '', 'NsiAccountingUnitOfCare',
              '', 'ELEMENT', 'at0002', 'DV_CODED_TEXT');
    DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

    sTmp := GET_RAZD_TYPE1('����������_�����', '���������� �����',
                              '<te:magnitude>' || CR || TO_CHAR(C.SHEAL_COUNT) || CR || '</te:magnitude>',
                              'ELEMENT', 'at0003', 'DV_COUNT');
    DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);

    sTmp := '</te:���������_������>';
    DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
  END LOOP;
  
  IF NUMRES <> 0
  THEN
     stmp := '    </te:data>'||cr||'</te:����������_�������>';
     DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
  END IF;
  
  stmp := cr||'</te:�����_025>';
     DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(sTmp), sTmp);
  
  RETURN clTmp;
END;

END;
/

SHOW ERRORS;


