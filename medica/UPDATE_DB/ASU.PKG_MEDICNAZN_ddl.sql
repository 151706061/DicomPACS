-- Start of DDL Script for Package Body ASU.PKG_MEDICNAZN
-- Generated 8-���-2008 8:34:25 from ASU@ASU

CREATE OR REPLACE 
PACKAGE       asu.pkg_medicnazn IS

  -- AUTHOR  : SERGEY
  -- CREATED : 06.02.2006 17:45:06
  -- PURPOSE : ��������������� ���������� - SILL

	type ref_cursor is ref cursor;
  -- PUBLIC FUNCTION AND PROCEDURE DECLARATIONS
  FUNCTION DO_SET(
                  pOperation       IN NUMBER,   -- ��� ��������
                  ----TNazMed----
                  PFK_ID           IN NUMBER,   -- ��� ���������� (TNazMed)
                  PFK_PACID        IN NUMBER,   -- ��� ��������
                  PFK_VRACHID      IN NUMBER,   -- ��� ������������ �����
                  PFK_VVODPATHID   IN NUMBER,   -- ���� �������� (��. ����. TVvodPath)
                  PFD_BEGIN        IN DATE,     -- ���� ������ ����������
                  PFN_DURATION     IN INTEGER,  -- ������������ �����
                  PFD_CANCEL       IN DATE,     -- ���� ������ ����������
                  PFK_STATE        IN NUMBER,   -- ��������� ���������� (��. ����. TNazSos)
                  PFK_FREQUENCYID  IN NUMBER,   -- ��������� ������ (��. ����. TFrequency)
                  PFC_REMARK       IN VARCHAR2, -- ����������
                  ----TNazMedLech----
                  PFN_DOZA         IN NUMBER,   -- ���� ���������
                  PFK_MEDICID      IN NUMBER,   -- ��� ����������� (��. ����. Med.TMedic)
                  PFK_DOZUNITS     IN NUMBER,    -- ������� ��������� ���� (��. ����. Med.TMassUnits) - �� ������ ���� �� ��������� �������������� ���� � Med.TMedic
                  PFN_KOL          IN NUMBER,   -- �����������
                  PFC_REMARKL      IN VARCHAR2, -- ����������
                  PFK_TREB         IN NUMBER,   -- ����� �� ���������� (��. ���� Med.TTreb)
                  PFK_CANCELSOTRID IN NUMBER,   -- ��� ����������, ����������� ����������
                  PFC_CANCELREASON IN VARCHAR2, -- ������� ������
                  PFK_MOID         IN NUMBER,   -- ����������� ������������, ���. ����� �������� ���������� (����� � �������)
                  PFK_OSMOTRID     IN NUMBER    -- ��� ������� �����
                  ) RETURN NUMBER;

  PROCEDURE Do_Del(PFK_ID IN NUMBER); -- ��� ���������� (TNazMed)

  PROCEDURE DO_CANCEL (PFK_ID IN NUMBER,           -- ��� ���������� (TNazMed)
                       PFK_CANCELSOTRID IN NUMBER, --���������� ���������
                       PFC_REASON IN VARCHAR2      --������� ������
                       );
  FUNCTION GET_NAZ_FULLNAME( pFK_ID IN NUMBER,
                             bDayDoze IN NUMBER DEFAULT 1,
                             bCoursDoze IN NUMBER DEFAULT 0,
                             bNazMedLech IN NUMBER DEFAULT 0
  ) RETURN VARCHAR2;

  -- ������� ��� ������� ���-�� ������������ ����������� - �������� ������� �� ������ ASU.NAZMED � ASU.TNAZMEDLECH
  FUNCTION GET_SUMM_NAZNMEDLECH_KOL(fn_duration IN NUMBER, fn_freq_mnog IN NUMBER, fn_kol IN NUMBER, fn_doza IN NUMBER) RETURN NUMBER;
  FUNCTION GET_SUMM_NAZNMEDLECH_KOL_BY_ID(aNazMedLechId IN NUMBER) RETURN NUMBER;

  FUNCTION IS_NARCOTIC(pMedicID IN NUMBER) RETURN NUMBER;

  FUNCTION GET_PATHVVOD (pFK_MEDNAZID IN TNAZMED.FK_ID%TYPE) RETURN VARCHAR2;
  FUNCTION ISLGOTAMEDIC (PFK_NAZID IN NUMBER, PFL_LGOTA_RES IN NUMBER DEFAULT -1) RETURN NUMBER;
  FUNCTION GET_TNAZMEDLECHVID_DOZA(PNAZMEDLECHID IN TNAZMEDLECHVID.FK_NAZMEDLECHID%TYPE,
                                   PNAZSOTRID    IN TNAZMED.FK_VRACHID%TYPE,
                                   PDATE         IN DATE,
                                   PTIME         IN TDAYTIME.FC_TIME%TYPE,
                                   PISNAZVRACH   IN INTEGER) RETURN NUMBER;
	function is_can_delete(p_nazid integer) return integer;
	function check_for_standart(p_pacid integer) return ref_cursor;
	function recipe_add return integer;
	procedure recipe_update(
		p_recipeid integer,
		p_typeid integer,
		p_durationid integer,
		p_paytypeid integer,
		p_percentid integer,
		p_sotrid integer,
		p_serail varchar2,
		p_number integer,
		p_date date,
		p_is_lgot integer
	);
	procedure recipe_add_nazlink(p_nazid integer, p_recipeid integer);
	procedure recipe_del_nazlink(p_recipeid integer);
	function recipe_get_next_number(p_is_lgot integer) return integer;
	function recipe_get_serial(p_is_lgot integer) return varchar2;
	function recipe_find(p_serail varchar2, p_number integer) return integer;

 FUNCTION GET_COUNT_OF_NEPODPIS_RECIPE(pTKARTA_FK_ID INTEGER) RETURN INTEGER;
 /*���������� ���-�� �� ����������� �������� ��������*/

 FUNCTION EXIST_NEPODPIS_RECIPE(pTKARTA_FK_ID INTEGER) RETURN INTEGER;
 /*���������� 1 ���� ���� �� ����������� �������� �������
   ����� 0 - (���� ��� �� ����������� �������� �������)*/

 PROCEDURE RECIPE_DEL(pFK_TRECIPEID IN NUMBER);
 /*������� ������ � ��� ����� ����� �������*/

  PROCEDURE DO_CONFIRM (PFK_ID IN NUMBER,           -- ��� ���������� (TNazMed)
                       PFK_CONFIRMSOTRID IN NUMBER --��� ������������ (������� ����)
                       );
end;
/


CREATE OR REPLACE 
PACKAGE BODY asu.pkg_medicnazn IS

  -- FUNCTION AND PROCEDURE IMPLEMENTATIONS
  FUNCTION DO_SET(
                  pOperation       IN NUMBER,   -- ��� ��������
                  ----TNazMed----
                  PFK_ID           IN NUMBER,   -- ��� ���������� (TNazMed)
                  PFK_PACID        IN NUMBER,   -- ��� ��������
                  PFK_VRACHID      IN NUMBER,   -- ��� ������������ �����
                  PFK_VVODPATHID   IN NUMBER,   -- ���� �������� (��. ����. TVvodPath)
                  PFD_BEGIN        IN DATE,     -- ���� ������ ����������
                  PFN_DURATION     IN INTEGER,  -- ������������ �����
                  PFD_CANCEL       IN DATE,     -- ���� ������ ����������
                  PFK_STATE        IN NUMBER,   -- ��������� ���������� (��. ����. TNazSos)
                  PFK_FREQUENCYID  IN NUMBER,   -- ��������� ������ (��. ����. TFrequency)
                  PFC_REMARK       IN VARCHAR2, -- ����������
                  ----TNazMedLech----
                  PFN_DOZA         IN NUMBER,   -- ���� ���������
                  PFK_MEDICID      IN NUMBER,   -- ��� ����������� (��. ����. Med.TMedic)
                  PFK_DOZUNITS     IN NUMBER,   -- ������� ��������� ���� (��. ����. Med.TMassUnits) - �� ������ ���� �� ��������� �������������� ���� � Med.TMedic
                  PFN_KOL          IN NUMBER,   -- �����������
                  PFC_REMARKL      IN VARCHAR2, -- ����������
                  PFK_TREB         IN NUMBER,   -- ����� �� ���������� (��. ���� Med.TTreb)
                  PFK_CANCELSOTRID IN NUMBER,   -- ��� ����������, ����������� ����������
                  PFC_CANCELREASON IN VARCHAR2, -- ������� ������
                  PFK_MOID         IN NUMBER,   -- ����������� ������������, ���. ����� �������� ���������� (����� � �������)
                  PFK_OSMOTRID     IN NUMBER    -- ��� ������� �����
                  ) RETURN NUMBER IS
  Res NUMBER;

  BEGIN
    /*
    case pOperation of
      0 : ���������� ������ ���. ���������� "��������"
      1 : ���������� � ��� ������������� ���. ���������� "�������� � ������"
      2 : �������������� ���. ���������� ???
    */
    IF pOperation = 0 THEN
      /*  ����� ������ � TNazMed */
      INSERT INTO tnazmed (fk_id,fk_pacid,fk_vrachid,fk_vvodpathid,fd_begin,fn_duration,
        fd_cancel,fk_cancelsotrid,fc_cancelreason,fk_state,fk_treb,fk_frequencyid,fc_remark,fk_moid,fk_osmotrid)
      VALUES (NULL, pFk_pacid, pfk_vrachid, pfk_vvodpathid, pfd_begin, pfn_duration, pfd_cancel, pfk_cancelsotrid,
      pfc_cancelreason, pfk_state, pfk_treb, pfk_frequencyid, pfc_remark, pfk_moid, pfk_osmotrid) RETURNING FK_ID INTO Res;
      /*  ����� ������ � TNazMedLech, ����������� � TNazMed.Fk_Id */
      INSERT INTO tnazmedlech (fk_id, fk_nazmedid, fn_doza, fk_medicid, fc_remark, fk_dozunits,fn_kol)
      VALUES (NULL, Res, pfn_doza, pfk_medicid, pfc_remarkl, pfk_dozunits,PFN_KOL);
    ELSIF pOperation = 1 THEN
      /*  ����� ������ � TNazMedLech, ����������� � TNazMed.Fk_Id - ������ ���� �� ������ *< */
      INSERT INTO tnazmedlech (fk_id, fk_nazmedid, fn_doza, fk_medicid, fc_remark, fk_dozunits,fn_kol)
      VALUES (NULL, PFK_ID, pfn_doza, pfk_medicid, pfc_remarkl, pfk_dozunits,PFN_KOL);
      Res := PFK_ID;
      /*  �������������� */
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
       /* ��� ���� � TNazMedLech �� */
    END IF;
    RETURN Res;
  END;

  PROCEDURE DO_DEL(PFK_ID IN NUMBER) -- ��� ���������� (TNazMed)
  IS
  BEGIN
    DELETE FROM TNAZMED WHERE FK_ID = PFK_ID; /* ������ �������� �������*/
  END;

  PROCEDURE DO_CANCEL (PFK_ID IN NUMBER,           -- ��� ���������� (TNazMed)
                       PFK_CANCELSOTRID IN NUMBER, --���������� ���������
                       PFC_REASON IN VARCHAR2      --������� ������
                       )
  IS
  BEGIN

    UPDATE TNazMed m
    SET m.fk_state = GET_NAZCANCEL, --��������� �������� (TNazSos)
        m.fd_cancel = trunc(SYSDATE),
        m.fn_duration = trunc(SYSDATE) - m.fd_begin + 1,
        m.fk_cancelsotrid = PFK_CANCELSOTRID,
        m.fc_cancelreason = PFC_REASON
    WHERE m.fk_id = PFK_ID;

/*    UPDATE tnazmedlechvid
    SET fk_state = get_NAZCANCEL --��������� �������� (TNazSos)
    WHERE FK_NAZMEDID = PFK_ID
      AND TRUNC(FD_DATE) >= TRUNC(SYSDATE);*/
  END;

  PROCEDURE DO_CONFIRM (PFK_ID IN NUMBER,           -- ��� ���������� (TNazMed)
                       PFK_CONFIRMSOTRID IN NUMBER --��� ������������ (������� ����)
                       )
  IS
  BEGIN

    UPDATE TNazMed m
    SET m.fk_state = GET_NAZ_NOTPROCESSED, --��������� "�� ���������" (TNazSos)
--        m.fd_cancel = trunc(SYSDATE), -- ���� �� ������, ������ ��� ��� ������������ � ������� "���� ������"
        m.fk_cancelsotrid = PFK_CONFIRMSOTRID,
        m.FC_REMARK = m.FC_REMARK||' (���������� '|| TO_CHAR(SYSDATE, 'DD.MM.YYYY')|| ' ������: '||ASU.DO_VRACHFIO(PFK_CONFIRMSOTRID)||')'
    WHERE m.fk_id = PFK_ID
      and m.fk_state = GET_NAZ_RECOMENDED; --��������� "�������������" (TNazSos)

/*    UPDATE tnazmedlechvid
    SET fk_state = get_NAZCANCEL --��������� �������� (TNazSos)
    WHERE FK_NAZMEDID = PFK_ID
      AND TRUNC(FD_DATE) >= TRUNC(SYSDATE);*/
  END;

	FUNCTION GET_NAZ_FULLNAME(
		pFK_ID IN NUMBER,
		bDayDoze IN NUMBER DEFAULT 1,
		bCoursDoze IN NUMBER DEFAULT 0,
		bNazMedLech IN NUMBER DEFAULT 0
	) RETURN VARCHAR2
	IS
		CURSOR cNazMed(aNazId IN NUMBER, aDayDoze IN NUMBER, aCourseDoze IN NUMBER)
		IS
			SELECT
--				INITCAP(E.FC_NAME)
--					|| DECODE(E.FC_NAME,'','','. ')
--					||
                     INITCAP(M.FC_NAME)|| ' '
--					|| DECODE(M.FN_MASS, 0, '', m.fn_mass || ' ' || u2.fc_shortname)
     || DECODE(L.FN_DOZA,0,'',  ' �� ' || TO_CHAR(DECODE(L.FN_DOZA,0,'',L.FN_DOZA), 'FM999G990D09', 'NLS_NUMERIC_CHARACTERS = ''. ''') || ' ' || U.FC_SHORTNAME )||' '
     || DECODE(L.FN_KOL,0,'', ' (' || TO_CHAR(DECODE(L.FN_KOL,0,'',L.FN_KOL), 'FM999G999G990D09', 'NLS_NUMERIC_CHARACTERS = ''. ''') || ' ' || U.FC_SHORTNAME || ') ')
     || DECODE(V.FC_NAME, null, '', ' ���� ��������: '||V.FC_NAME)
     || DECODE(trim(F.FC_NAME), null, '', F.FC_NAME || '. ')
     || DECODE(TRIM(N.FC_REMARK), NULL, '', ', ' || N.FC_REMARK)
     || DECODE(aDayDoze, 0, '', 1, DECODE(F.FN_MNOG * L.FN_DOZA,0,'',  ', �������� ���� ' || TO_CHAR(DECODE(F.FN_MNOG * L.FN_DOZA,0,'',F.FN_MNOG * L.FN_DOZA),'FM999G999G990D09','NLS_NUMERIC_CHARACTERS = ''. ''')||' '||U.FC_SHORTNAME||'.'))
     || DECODE(aCourseDoze, 0, '', ', �������� ���� ' || TO_CHAR(L.FN_DOZA * F.FN_MNOG * DECODE(N.FD_CANCEL,NULL,TRUNC(SYSDATE) - TRUNC(N.FD_BEGIN) + 1,TRUNC(N.FD_CANCEL) - TRUNC(N.FD_BEGIN) + 1),'FM999G999G990D09','NLS_NUMERIC_CHARACTERS = ''. ''') || ' ' || U.FC_SHORTNAME)
     || DECODE(DECODE(ASU.IS_AMBULANCE(N.FK_PACID), 1, 1, 0) * NVL(N.FN_DURATION,1),
                0,
                '',
                1,
                '',
                ', (' || N.FN_DURATION || ' ��)')
				AS FC_MEDNAZ,
      DECODE(N.fn_metodika, 1,'�� ���', 2,'�� ����� ���', 3,'����� ���', '') as fc_metodika,
      DECODE(N.fl_priem_zavtrak, 0,'', '-�������' )||DECODE(N.fl_priem_obed, 0,'', '-����' )||
      DECODE(N.fl_priem_ujin, 0,'', '-����' )||DECODE(N.fl_priem_noch, 0,'', '-����' ) as fc_priem
			FROM
				TNAZMED N, TNAZMEDLECH L, MED.TLATIN_NAMES M, /*MED.TEI E, */MED.TMASSUNITS U,
				TFREQUENCY F, /*MED.TMASSUNITS U2,*/ TVVODPATH V
			WHERE N.FK_ID = L.FK_NAZMEDID
				AND L.FK_MEDICID = M.fk_id(+)
--				AND E.EIID = M.FK_FPACKID (+)
				AND L.FK_DOZUNITS = U.FK_ID(+)
				AND N.FK_FREQUENCYID = F.FK_ID(+)
--				AND M.FK_MASSUNITS = U2.FK_ID(+)
				AND N.FK_VVODPATHID = V.FK_ID(+)
				AND N.FK_ID = aNazId
			ORDER BY M.fc_name;

    CURSOR cNazMedLech(aNazMedLechId IN NUMBER, aDayDoze IN NUMBER, aCourseDoze IN NUMBER) IS
      SELECT
--      INITCAP(E.FC_NAME)||DECODE(E.FC_NAME,'','','. ')||
      INITCAP(M.FC_NAME)||' '||
--      DECODE(M.FN_MASS,0,'',m.fn_mass||' '||u2.fc_shortname)||
      DECODE(L.FN_DOZA,0,'',  ' �� '|| TO_CHAR(DECODE(L.FN_DOZA,0,'',L.FN_DOZA),'FM999G990D099','NLS_NUMERIC_CHARACTERS = ''. ''') || ' '||U.FC_SHORTNAME ) ||' '||
--    ' �� '||TO_CHAR(L.FN_DOZA,'FM999G990D099','NLS_NUMERIC_CHARACTERS = ''. ''')||
      DECODE(L.FN_KOL,0,'', ' ('||TO_CHAR(DECODE(L.FN_KOL,0,'',L.FN_KOL),'FM999G999G990D09','NLS_NUMERIC_CHARACTERS = ''. ''')||' '|| U.FC_SHORTNAME||') ' ) ||
--    ' '||U.FC_SHORTNAME||' ('||TO_CHAR(L.FN_KOL,'FM999G999G990D09','NLS_NUMERIC_CHARACTERS = ''. ''')||' '||
      DECODE(V.FC_NAME, null, '', ' ���� ��������: '||V.FC_NAME)||      
      DECODE(trim(F.FC_NAME), null, '', F.FC_NAME || '. ')||
      DECODE(TRIM(N.FC_REMARK), NULL, '', ', ' || N.FC_REMARK)||
      DECODE(aDayDoze,0,'',1,DECODE(F.FN_MNOG * L.FN_DOZA,0,'',  ', �������� ���� '||TO_CHAR(DECODE(F.FN_MNOG * L.FN_DOZA,0,'',F.FN_MNOG * L.FN_DOZA),'FM999G999G990D09','NLS_NUMERIC_CHARACTERS = ''. ''')||' '||U.FC_SHORTNAME||'.'))||
--    DECODE(aDayDoze,0,'',1,CHR(10)||'�������� ���� '||TO_CHAR(F.FN_MNOG * L.FN_DOZA,'FM999G999G990D09','NLS_NUMERIC_CHARACTERS = ''. ''')||' '||U.FC_SHORTNAME||'.')||
      DECODE(aCourseDoze,0,'',', �������� ���� '||TO_CHAR(L.FN_DOZA * F.FN_MNOG * DECODE(N.FD_CANCEL,NULL,TRUNC(SYSDATE) - TRUNC(N.FD_BEGIN) + 1,TRUNC(N.FD_CANCEL) - TRUNC(N.FD_BEGIN) + 1),'FM999G999G990D09','NLS_NUMERIC_CHARACTERS = ''. ''')||' '||U.FC_SHORTNAME)||
      DECODE(DECODE(ASU.IS_AMBULANCE(N.FK_PACID), 1, 1, 0) * nvl(N.FN_DURATION,1),
                0,
                '',
                1,
                '',
                ', (' || N.FN_DURATION || ' ��)')
      AS FC_MEDNAZ,
      DECODE(N.fn_metodika, 1,'�� ���', 2,'�� ����� ���', 3,'����� ���', '') as fc_metodika,
      DECODE(N.fl_priem_zavtrak, 0,'', '-�������' )||DECODE(N.fl_priem_obed, 0,'', '-����' )||
      DECODE(N.fl_priem_ujin, 0,'', '-����' )||DECODE(N.fl_priem_noch, 0,'', '-����' ) as fc_priem
      FROM TNAZMED N, TNAZMEDLECH L, MED.TLATIN_NAMES M, /*MED.TEI E, */ MED.TMASSUNITS U,
      TFREQUENCY F, /*MED.TMASSUNITS U2, */TVVODPATH V
      WHERE N.FK_ID = L.FK_NAZMEDID
        AND L.FK_MEDICID = M.fk_id(+)
--        AND E.EIID = M.FK_FPACKID (+)
        AND L.FK_DOZUNITS = U.FK_ID(+)
        AND N.FK_FREQUENCYID = F.FK_ID(+)
--        AND M.FK_MASSUNITS = U2.FK_ID(+)
        AND N.FK_VVODPATHID = V.FK_ID(+)
        AND L.FK_ID = aNazMedLechId
      ORDER BY UPPER(M.FC_NAME);


/*		CURSOR cNazMed(aNazId IN NUMBER, aDayDoze IN NUMBER, aCourseDoze IN NUMBER)
		IS
			SELECT
				INITCAP(E.FC_NAME)
					|| DECODE(E.FC_NAME,'','','. ')
					|| INITCAP(M.FC_NAME)|| ' '
					|| DECODE(M.FN_MASS, 0, '', m.fn_mass || ' ' || u2.fc_shortname)
     || DECODE(L.FN_DOZA,0,'',  ' �� ' || TO_CHAR(DECODE(L.FN_DOZA,0,'',L.FN_DOZA), 'FM999G990D09', 'NLS_NUMERIC_CHARACTERS = ''. ''') || ' ' || U.FC_SHORTNAME )
--   || TO_CHAR(L.FN_DOZA, 'FM999G990D09', 'NLS_NUMERIC_CHARACTERS = ''. ''') || ' '
--			|| U.FC_SHORTNAME || ' ('
     || DECODE(L.FN_KOL,0,'', ' (' || TO_CHAR(DECODE(L.FN_KOL,0,'',L.FN_KOL), 'FM999G999G990D09', 'NLS_NUMERIC_CHARACTERS = ''. ''') || ' ' || E.FC_NAME || ') ')
--   || TO_CHAR(L.FN_KOL, 'FM999G999G990D09', 'NLS_NUMERIC_CHARACTERS = ''. ''') || ' '
--			|| E.FC_NAME || ') '
     || DECODE(trim(F.FC_NAME), null, '', F.FC_NAME || '. ')
--			|| F.FC_NAME || '. '
					|| N.FC_REMARK
					|| DECODE(aDayDoze, 0, '', 1, CHR(10) || DECODE(F.FN_MNOG * L.FN_DOZA,0,'',  '�������� ���� ' || TO_CHAR(DECODE(F.FN_MNOG * L.FN_DOZA,0,'',F.FN_MNOG * L.FN_DOZA),'FM999G999G990D09','NLS_NUMERIC_CHARACTERS = ''. ''')||' '||U.FC_SHORTNAME||'.'))
--			|| DECODE(aDayDoze, 0, '', 1, CHR(10) || '�������� ���� ' || TO_CHAR(F.FN_MNOG * L.FN_DOZA,'FM999G999G990D09','NLS_NUMERIC_CHARACTERS = ''. ''')||' '||U.FC_SHORTNAME||'.')
					|| DECODE(aCourseDoze, 0, '', CHR(10) || '�������� ���� ' || TO_CHAR(L.FN_DOZA * F.FN_MNOG * DECODE(N.FD_CANCEL,NULL,TRUNC(SYSDATE) - TRUNC(N.FD_BEGIN) + 1,TRUNC(N.FD_CANCEL) - TRUNC(N.FD_BEGIN) + 1),'FM999G999G990D09','NLS_NUMERIC_CHARACTERS = ''. ''') || ' ' || U.FC_SHORTNAME)
				AS FC_MEDNAZ
			FROM
				TNAZMED N, TNAZMEDLECH L, MED.TMEDIC M, MED.TEI E, MED.TMASSUNITS U,
				TFREQUENCY F, MED.TMASSUNITS U2, TVVODPATH V
			WHERE N.FK_ID = L.FK_NAZMEDID
				AND L.FK_MEDICID = M.MEDICID
				AND E.EIID = M.FK_FPACKID (+)
				AND L.FK_DOZUNITS = U.FK_ID(+)
				AND N.FK_FREQUENCYID = F.FK_ID(+)
				AND M.FK_MASSUNITS = U2.FK_ID(+)
				AND N.FK_VVODPATHID = V.FK_ID(+)
				AND N.FK_ID = aNazId
			ORDER BY M.FC_NAME;

/*		CURSOR cNazMed(aNazId IN NUMBER, aDayDoze IN NUMBER, aCourseDoze IN NUMBER)
		IS
			SELECT
				INITCAP(E.FC_NAME)
					|| DECODE(E.FC_NAME,'','','. ')
					|| INITCAP(M.FC_NAME)|| ' '
					|| DECODE(M.FN_MASS, 0, '', m.fn_mass || ' ' || u2.fc_shortname) || ' �� '
     || TO_CHAR(L.FN_DOZA, 'FM999G990D09', 'NLS_NUMERIC_CHARACTERS = ''. ''') || ' '
					|| U.FC_SHORTNAME || ' ('
     || TO_CHAR(L.FN_KOL, 'FM999G999G990D09', 'NLS_NUMERIC_CHARACTERS = ''. ''') || ' '
					|| E.FC_NAME || ') '
					|| F.FC_NAME || '. '
					|| N.FC_REMARK
  			|| DECODE(aDayDoze, 0, '', 1, CHR(10) || '�������� ���� ' || TO_CHAR(F.FN_MNOG * L.FN_DOZA,'FM999G999G990D09','NLS_NUMERIC_CHARACTERS = ''. ''')||' '||U.FC_SHORTNAME||'.')
					|| DECODE(aCourseDoze, 0, '', CHR(10) || '�������� ���� ' || TO_CHAR(L.FN_DOZA * F.FN_MNOG * DECODE(N.FD_CANCEL,NULL,TRUNC(SYSDATE) - TRUNC(N.FD_BEGIN) + 1,TRUNC(N.FD_CANCEL) - TRUNC(N.FD_BEGIN) + 1),'FM999G999G990D09','NLS_NUMERIC_CHARACTERS = ''. ''') || ' ' || U.FC_SHORTNAME)
				AS FC_MEDNAZ
			FROM
				TNAZMED N, TNAZMEDLECH L, MED.TMEDIC M, MED.TEI E, MED.TMASSUNITS U,
				TFREQUENCY F, MED.TMASSUNITS U2, TVVODPATH V
			WHERE N.FK_ID = L.FK_NAZMEDID
				AND L.FK_MEDICID = M.MEDICID
				AND E.EIID = M.FK_FPACKID (+)
				AND L.FK_DOZUNITS = U.FK_ID
				AND N.FK_FREQUENCYID = F.FK_ID
				AND M.FK_MASSUNITS = U2.FK_ID
				AND N.FK_VVODPATHID = V.FK_ID
				AND N.FK_ID = aNazId
			ORDER BY M.FC_NAME;
*/

/*    CURSOR cNazMedLech(aNazMedLechId IN NUMBER, aDayDoze IN NUMBER, aCourseDoze IN NUMBER) IS
      SELECT INITCAP(E.FC_NAME)||DECODE(E.FC_NAME,'','','. ')||
      INITCAP(M.FC_NAME)||' '||
      DECODE(M.FN_MASS,0,'',m.fn_mass||' '||u2.fc_shortname)||
      DECODE(L.FN_DOZA,0,'',  ' �� '|| TO_CHAR(DECODE(L.FN_DOZA,0,'',L.FN_DOZA),'FM999G990D099','NLS_NUMERIC_CHARACTERS = ''. ''') || ' '||U.FC_SHORTNAME ) ||
--    ' �� '||TO_CHAR(L.FN_DOZA,'FM999G990D099','NLS_NUMERIC_CHARACTERS = ''. ''')||
      DECODE(L.FN_KOL,0,'', ' ('||TO_CHAR(DECODE(L.FN_KOL,0,'',L.FN_KOL),'FM999G999G990D09','NLS_NUMERIC_CHARACTERS = ''. ''')||' '|| E.FC_NAME||') ' ) ||
--    ' '||U.FC_SHORTNAME||' ('||TO_CHAR(L.FN_KOL,'FM999G999G990D09','NLS_NUMERIC_CHARACTERS = ''. ''')||' '||
      DECODE(trim(F.FC_NAME), null, '', F.FC_NAME || '. ')||
      N.FC_REMARK||
      DECODE(aDayDoze,0,'',1,CHR(10)||DECODE(F.FN_MNOG * L.FN_DOZA,0,'',  '�������� ���� '||TO_CHAR(DECODE(F.FN_MNOG * L.FN_DOZA,0,'',F.FN_MNOG * L.FN_DOZA),'FM999G999G990D09','NLS_NUMERIC_CHARACTERS = ''. ''')||' '||U.FC_SHORTNAME||'.'))||
--    DECODE(aDayDoze,0,'',1,CHR(10)||'�������� ���� '||TO_CHAR(F.FN_MNOG * L.FN_DOZA,'FM999G999G990D09','NLS_NUMERIC_CHARACTERS = ''. ''')||' '||U.FC_SHORTNAME||'.')||
      DECODE(aCourseDoze,0,'',CHR(10)||'�������� ���� '||TO_CHAR(L.FN_DOZA * F.FN_MNOG * DECODE(N.FD_CANCEL,NULL,TRUNC(SYSDATE) - TRUNC(N.FD_BEGIN) + 1,TRUNC(N.FD_CANCEL) - TRUNC(N.FD_BEGIN) + 1),'FM999G999G990D09','NLS_NUMERIC_CHARACTERS = ''. ''')||' '||U.FC_SHORTNAME)
      AS FC_MEDNAZ
      FROM TNAZMED N, TNAZMEDLECH L, MED.TMEDIC M, MED.TEI E, MED.TMASSUNITS U,
      TFREQUENCY F, MED.TMASSUNITS U2, TVVODPATH V
      WHERE N.FK_ID = L.FK_NAZMEDID
        AND L.FK_MEDICID = M.MEDICID
        AND E.EIID = M.FK_FPACKID (+)
        AND L.FK_DOZUNITS = U.FK_ID(+)
        AND N.FK_FREQUENCYID = F.FK_ID(+)
        AND M.FK_MASSUNITS = U2.FK_ID(+)
        AND N.FK_VVODPATHID = V.FK_ID(+)

        AND L.FK_ID = aNazMedLechId
      ORDER BY UPPER(M.FC_NAME);

/*    CURSOR cNazMedLech(aNazMedLechId IN NUMBER, aDayDoze IN NUMBER, aCourseDoze IN NUMBER) IS
      SELECT INITCAP(E.FC_NAME)||DECODE(E.FC_NAME,'','','. ')||
      INITCAP(M.FC_NAME)||' '||
      DECODE(M.FN_MASS,0,'',m.fn_mass||' '||u2.fc_shortname)||
      ' �� '||TO_CHAR(L.FN_DOZA,'FM999G990D099','NLS_NUMERIC_CHARACTERS = ''. ''')||
      ' '||U.FC_SHORTNAME||' ('||TO_CHAR(L.FN_KOL,'FM999G999G990D09','NLS_NUMERIC_CHARACTERS = ''. ''')||' '||
      E.FC_NAME||') '||F.FC_NAME||'. '||N.FC_REMARK||
      DECODE(aDayDoze,0,'',1,CHR(10)||'�������� ���� '||TO_CHAR(F.FN_MNOG * L.FN_DOZA,'FM999G999G990D09','NLS_NUMERIC_CHARACTERS = ''. ''')||' '||U.FC_SHORTNAME||'.')||
      DECODE(aCourseDoze,0,'',CHR(10)||'�������� ���� '||TO_CHAR(L.FN_DOZA * F.FN_MNOG * DECODE(N.FD_CANCEL,NULL,TRUNC(SYSDATE) - TRUNC(N.FD_BEGIN) + 1,TRUNC(N.FD_CANCEL) - TRUNC(N.FD_BEGIN) + 1),'FM999G999G990D09','NLS_NUMERIC_CHARACTERS = ''. ''')||' '||U.FC_SHORTNAME)
      AS FC_MEDNAZ
      FROM TNAZMED N, TNAZMEDLECH L, MED.TMEDIC M, MED.TEI E, MED.TMASSUNITS U,
      TFREQUENCY F, MED.TMASSUNITS U2, TVVODPATH V
      WHERE N.FK_ID = L.FK_NAZMEDID
        AND L.FK_MEDICID = M.MEDICID
        AND E.EIID = M.FK_FPACKID (+)
        AND L.FK_DOZUNITS = U.FK_ID
        AND N.FK_FREQUENCYID = F.FK_ID
        AND M.FK_MASSUNITS = U2.FK_ID
        AND N.FK_VVODPATHID = V.FK_ID

        AND L.FK_ID = aNazMedLechId
      ORDER BY M.FC_NAME;
*/
    vcName VARCHAR2(1000);
    Res    VARCHAR2(2000);
    FIS_SHOW_METODIKA NUMBER;
    pfc_metodika VARCHAR2(50);
    pfc_priem VARCHAR2(100);


/*    iCnt   INTEGER;*/

  BEGIN
/*    iCnt := 1;*/
-- ����� ��������� ���������. � ��� �� ������ ��������� ��������� ����������. 20080110 ������� �.�.
-- ���������� ������� ��������� �������� - ���� �������� ����� ��������� ����������� �� ��. ������� �.�. 20071203
--    Res := GET_MEDNAZNAME(pFK_ID);
--    RETURN Res;
    FIS_SHOW_METODIKA := TO_NUMBER(asu.PKG_SMINI.readstring('DMEDNAZ.DLL', 'IS_SHOW_METODIKA', '0'));
    Res := '';
    IF bNazMedLech = 0 THEN
    OPEN cNazMed(pFK_ID,bDayDoze,bCoursDoze);
    LOOP
      FETCH cNazMed INTO vcName, pfc_metodika, pfc_priem;
      if FIS_SHOW_METODIKA = 1 then
        if (pfc_metodika is not null) and (pfc_priem is not null) then
          vcName := vcName || '��������: ';
        end if;
        vcName := vcName||pfc_metodika;
        if pfc_priem is not null then
          vcName := vcName||' �� '||pfc_priem;
        end if;
      end if;
      EXIT WHEN cNazMed%NOTFOUND;
      Res := Res || vcName || ';' ||chr(10);
/*      Res := Res || to_char(iCnt)||'. '|| vcName || ';' ||chr(10);*/
/*      iCnt := iCnt + 1;*/
    END LOOP;
    CLOSE cNazMed;
    Res := Substr(Res,0,length(Res) - 2);
    ELSIF bNazMedLech = 1 THEN
      OPEN cNazMedLech(pFK_ID,bDayDoze,bCoursDoze);
      FETCH cNazMedLech INTO Res, pfc_metodika, pfc_priem;
      pfc_priem := substr(pfc_priem, 2, 150);
      if FIS_SHOW_METODIKA = 1 then
        if (pfc_metodika is not null) and (pfc_priem is not null) then
          Res := Res || '��������: ';
        end if;
        Res := Res||pfc_metodika;
        if pfc_priem is not null then
          Res := Res||' �� '||pfc_priem;
        end if;
      end if;
      CLOSE cNazMedLech;
    END IF;
-- ����� ��������� ���������. � ��� �� ������ ��������� ��������� ����������. 20080110 ������� �.�.
-- START Addition by Linnikov 20071109 (����������� �������� �� ��������� ������������)
--    IF Res IS NULL THEN
--     Res := GET_MEDNAZNAME(pFK_ID);
--    END IF;
-- FINISH Addition by Linnikov 20071109
    RETURN Res;
  END;

  -- ������� ��� ������� ���-�� ������������ ����������� - �������� ������� �� ������ ASU.NAZMED � ASU.TNAZMEDLECH
  FUNCTION GET_SUMM_NAZNMEDLECH_KOL(fn_duration IN NUMBER, fn_freq_mnog IN NUMBER, fn_kol IN NUMBER, fn_doza IN NUMBER) RETURN NUMBER IS
  BEGIN
    IF NVL(fn_kol,0) = 0 then
      return (fn_duration*fn_freq_mnog*fn_doza);
    ELSE
      return (fn_duration*fn_freq_mnog*fn_kol);
    END IF;
  END;

  FUNCTION GET_SUMM_NAZNMEDLECH_KOL_BY_ID(aNazMedLechId IN NUMBER) RETURN NUMBER IS
    iRes NUMBER;
  BEGIN
    SELECT /*nml.fk_id, nml.fk_nazmedid, nml.fn_doza, nml.fk_medicid,
       nml.fn_kol,
       f.fc_name, f.fn_mnog,
       nm.fn_duration,*/
       ASU.PKG_MEDICNAZN.GET_SUMM_NAZNMEDLECH_KOL(nm.fn_duration, f.fn_mnog, nml.fn_kol, nml.fn_doza) as FN_SUMMARY_KOL into iRes
    FROM asu.tnazmedlech nml, asu.tnazmed nm, asu.TFREQUENCY f
    where nml.fk_id = aNazMedLechId
      and nml.fk_nazmedid = nm.fk_id
      and nm.fk_frequencyid = f.fk_id(+);

    return iRes;
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
      SELECT fc_name FROM TNazMed, Tvvodpath
      WHERE TNazMed.fk_id = aFk_mednazid
        AND TNazMed.fk_vvodpathid = Tvvodpath.fk_id;
    Res VARCHAR2(100);
  BEGIN
    OPEN cVvodPath(pFk_mednazid);
    FETCH cVvodPath INTO Res;
    CLOSE cVvodPath;
    RETURN Res;
  END;

  FUNCTION ISLGOTAMEDIC (PFK_NAZID IN NUMBER, PFL_LGOTA_RES IN NUMBER DEFAULT -1) RETURN NUMBER IS
    CURSOR CM (AFK_NAZID IN NUMBER) IS
      SELECT M.FL_LGOTA FROM TNAZMEDLECH L, MED.TMEDIC M
      WHERE L.FK_MEDICID = M.MEDICID
        AND L.FK_NAZMEDID = AFK_NAZID;
    RES NUMBER;
  BEGIN
    -- �������. � �������� PFL_LGOTA_RES �������� ��,
    -- ��� ����� ��������, � ������� ���������� ��� ��������.
    -- � �������� ���������� �������� ������ ��������
    -- ������� �.�. 11.03.2008 - ��� ������ �� �������������� �������� ��������
    if PFL_LGOTA_RES >=0 then
      RETURN PFL_LGOTA_RES;
    end if;

    RES := 0;
    OPEN CM(PFK_NAZID);
    FETCH CM INTO RES;
    CLOSE CM;
    RETURN RES;
  END;


FUNCTION GET_TNAZMEDLECHVID_DOZA(PNAZMEDLECHID IN TNAZMEDLECHVID.FK_NAZMEDLECHID%TYPE,
                                 PNAZSOTRID    IN TNAZMED.FK_VRACHID%TYPE,
                                 PDATE         IN DATE,
                                 PTIME         IN TDAYTIME.FC_TIME%TYPE,
                                 PISNAZVRACH   IN INTEGER)
  RETURN NUMBER IS
  RESULT NUMBER;
BEGIN
  /*CREATED BY ZAG*/
  --PISNAZVRACH = 1(���� ��������� ����������), = 0(����� �-�)
  --�-� �� ������ ��������� �� TRUNC(PDATETIME) > ����_������_����������
  /*���� SELECT �� ������ ������, �� ���� �-� �������� ���� ��������� ���������� � ����� ���������� �����������-�������� ��������-��-���������,
  �� ����� �������� �� ���������*/
  IF PISNAZVRACH = 1 THEN --�������� ���Ѩ���� ������-��������� ����������
    BEGIN
      SELECT FN_DOZA INTO RESULT
        FROM TNAZMEDLECHVID
       WHERE FK_NAZMEDLECHID = PNAZMEDLECHID
         AND FD_DATETIME = PDATE+(TO_DATE(PTIME,'HH24:MI')-TRUNC(TO_DATE(PTIME,'HH24:MI')))
         AND FK_SOTRID = PNAZSOTRID
         AND ROWNUM < 2;
      RETURN(RESULT);
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        BEGIN
          SELECT TNAZMEDLECH.FN_DOZA INTO RESULT
            FROM TNAZMED, TNAZMEDLECH, TFREQUENCY, TDAYTIME, TFREQUENCYDAYTIME
           WHERE TNAZMEDLECH.FK_ID = PNAZMEDLECHID
             AND TNAZMED.FK_VRACHID = PNAZSOTRID --�.�. ������ ����
             AND TNAZMEDLECH.FK_NAZMEDID = TNAZMED.FK_ID
             AND TNAZMED.FK_FREQUENCYID = TFREQUENCY.FK_ID
             AND TDAYTIME.FC_TIME = PTIME
             AND TFREQUENCYDAYTIME.FK_FREQUENCYID = TFREQUENCY.FK_ID
             AND TFREQUENCYDAYTIME.FK_DAYTIMEID = TDAYTIME.FK_ID;
          RETURN(RESULT);
        EXCEPTION
          WHEN NO_DATA_FOUND THEN
            RETURN(NULL);
        END;
    END;
  ELSE  --�������� ���Ѩ���� �������������� ����������
    BEGIN
      SELECT FN_DOZA INTO RESULT
        FROM TNAZMEDLECHVID
       WHERE FK_NAZMEDLECHID = PNAZMEDLECHID
         AND FD_DATETIME = PDATE+(TO_DATE(PTIME,'HH24:MI')-TRUNC(TO_DATE(PTIME,'HH24:MI')))
         AND FK_SOTRID <> PNAZSOTRID
         AND ROWNUM < 2;
      RETURN(RESULT);
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        RETURN(NULL);
    END;
  END IF;
END;

	/*
	 * ���������, ����� �� ������� ������ ����������.
	 *
	 * @param p_nazid
	 *  ������������� ����������.
	 * @return
	 *  0 - ���������� ����������� ������, ���������� �� ���� ����������, ����-��
	 *  ������� ���������� ������. 1 - ������� ���������� �����.
	 */
	function is_can_delete(p_nazid integer) return integer
	is
		n integer;
	begin
		select count(1) into n
		from
			tnazmed_trecipe nmr,
			trecipe r
		where r.fk_id = nmr.fk_recipe
			and nmr.fk_nazid = p_nazid
			and r.fl_edit = 1;

		if n > 0 then
			return 0;
		end if;
		return 1;
	end;

	/*
	 * ������: ���� ���� �������� ����������� ������� �� ������������ ������ ������������
	 * ����������� - �� ����������
	 */
	function check_for_standart(p_pacid integer) return ref_cursor
	is
		cv ref_cursor;
	begin
		open cv for
			'select
				farmgrid,
				fc_farmgr
			from (
				select
					tpharmgroup.fc_farmgr,
					tpharmgroup.farmgrid,
					dense_rank() over (order by tdiag.fk_id desc) as rank
				from
					tdiag,
					tsmid,
					ticd10,
					tstandart_icd10,
					tstandart_pharmgr,
					med.tfarmgr tpharmgroup
				where tdiag.fk_pacid = :p_pacid
					and tdiag.fk_smdiagid = tsmid.fk_id
					and tdiag.fp_type = (select fk_id from tsmid where fc_synonim = ''CLINIK'') /* ����������� - ������� */
					and tdiag.fl_main = (select fk_id from tsmid where fc_synonim = ''MAIN'') /* �������� - ������� */
					and ticd10.fc_kod = tsmid.fk_mkb10
					and ticd10.fk_id = tstandart_icd10.fk_icd10
					and tstandart_pharmgr.fk_standart = tstandart_icd10.fk_standart
					and tpharmgroup.fk_frmgr_rls = tstandart_pharmgr.fk_pharmgroup
			)
			/* ��������� ������� - ��������, ����������� */
			where rank = 1' using p_pacid;
		return cv;
	end;

	/*
	 * ��������� ����� ������.
	 *
	 * @return
	 *  ������������� ������ �������.
	 */
	function recipe_add return integer
	is
		n integer;
	begin
		insert into trecipe(fk_id) values(null)
		returning fk_id into n;

		return n;
	end;

	/*
	 * ��������� ���������� ��� ���������� �������.
	 *
	 * @param p_recipeid
	 *  ������������� �������.
	 * @param p_typeid
	 *  ��� ���� ������� (TRECIPETYPE)
	 * @param p_durationid
	 *  ��� ����� �������� (TRECIPEDURATION)
	 * @param p_paytypeid
	 *  ��� ��������� �������������� (TRECIPEPAYTYPE)
	 * @param p_percentid
	 *  ��� �������� ������ (TRECIPEPERCENT)
	 * @param p_sotrid
	 *  ��� ����������, ������� ������� ������.
	 * @param p_serail
	 *  ����� �������
	 * @param p_number
	 *  ����� �������
	 * @param p_date
	 *  ���� �������� �������
	 * @param p_is_lgot
	 *  ������� ��������� �������. 0 - �������, 1 - ��������.
	 */
	procedure recipe_update(
		p_recipeid integer,
		p_typeid integer,
		p_durationid integer,
		p_paytypeid integer,
		p_percentid integer,
		p_sotrid integer,
		p_serail varchar2,
		p_number integer,
		p_date date,
		p_is_lgot integer
	) is
		procedure set_num(n integer, l integer)
		is
			pragma autonomous_transaction;
		begin
			if l = 0 then
				pkg_smini.WRITESTRING('CONFIG', 'S_RECIPE_NUMBER_LAST', to_char(n));
			elsif l = 3 then
				pkg_smini.WRITESTRING('CONFIG', 'S_RECIPE_NUMBER_L_LAST', to_char(n));
			elsif l = 2 then
				pkg_smini.WRITESTRING('CONFIG', 'S_RECIPE_NUMBER_LR_LAST', to_char(n));
			end if;
			commit;
		end;
	begin
		update trecipe
		set
			fk_type = decode(p_is_lgot, 0, p_typeid, 1, null),
			fd_date = trunc(p_date),
			fk_duration = p_durationid,
			fk_paytype = decode(p_is_lgot, 0, null, 3, p_paytypeid, 2, p_paytypeid),
			fk_percent = decode(p_is_lgot, 0, null, 3, p_percentid, 2, p_percentid),
			fn_num = p_number,
			fc_serial = trim(p_serail),
			fl_lgot = p_is_lgot,
			fk_sotrid = p_sotrid
		where fk_id = p_recipeid;
		set_num(p_number, p_is_lgot);
	end;

	/*
	 * ������� ����� ����� ������� � �����������, ���� ����
	 * ����� ��� �� ����������.
	 *
	 * @param p_nazid
	 *  ��� ���������� �� TNAZMED
	 * @param p_recipeid
	 *  ��� ������� (TRECIPE)
	 */
	procedure recipe_add_nazlink(p_nazid integer, p_recipeid integer)
	is
		n integer;
	begin
		select count(1) into n
		from tnazmed_trecipe t
		where t.fk_nazid = p_nazid
			and t.fk_recipe = p_recipeid;

		if n = 0 then
			insert into tnazmed_trecipe(fk_nazid, fk_recipe)
			values(p_nazid, p_recipeid);
		end if;
	end;

	/*
	 * ������� ����� � ����������� ��� ���������� �������.
	 *
	 * @param p_recipeid
	 *  ��� ������� (TRECIPE)
	 */
	procedure recipe_del_nazlink(p_recipeid integer)
	is
	begin
		delete from tnazmed_trecipe where fk_recipe = p_recipeid;
	end;

	/*
	 * ���������� ����� ���������� �������.
	 *
	 * @param p_is_lgot
	 *  ������� ��������� �������.
	 * @return
	 *  ����� ���������� �������.
	 */
	function recipe_get_next_number(p_is_lgot integer) return integer
	is
		n integer;
	begin
		if p_is_lgot = 0 then
			select to_number(t.fc_value) into n
			from tsmini t
			where t.fc_section = 'CONFIG'
				and t.fc_key = 'S_RECIPE_NUMBER_LAST';
		elsif p_is_lgot = 3 then
			select to_number(t.fc_value) into n
			from tsmini t
			where t.fc_section = 'CONFIG'
				and t.fc_key = 'S_RECIPE_NUMBER_L_LAST';
		elsif p_is_lgot = 2 then
			select to_number(t.fc_value) into n
			from tsmini t
			where t.fc_section = 'CONFIG'
				and t.fc_key = 'S_RECIPE_NUMBER_LR_LAST';
		else
			return -1;
		end if;
		return n + 1;
	end;

	/*
	 * ���������� ����� ��� �������
	 *
	 * @param p_is_lgot
	 *  ������� ��������� �������.
	 * @return
	 *  ����� �������.
	 */
	function recipe_get_serial(p_is_lgot integer) return varchar2
	is
	begin
		if p_is_lgot = 0 then
			return pkg_smini.READSTRING('CONFIG', 'S_RECIPE_SERIAL', 'N/A');
		elsif p_is_lgot = 3 then
			return pkg_smini.READSTRING('CONFIG', 'S_RECIPE_SERIAL_L', 'N/A');
		elsif p_is_lgot = 2 then
			return pkg_smini.READSTRING('CONFIG', 'S_RECIPE_SERIAL_LR', 'N/A');
		end if;
		return 'N/A';
	end;

	/*
	 * ���������� ������������� ������� � ���������� ������ � �������.
	 *
	 * @param p_serail
	 *  ������� ��������� �������.
	 * @param p_number
	 *  ������� ��������� �������.
	 * @return
	 *  ������������� ������� �� TRECIPE.
	 */
	function recipe_find(p_serail varchar2, p_number integer) return integer
	is
		n integer;
	begin
		select fk_id into n
		from trecipe
		where upper(fc_serial) = upper(trim(p_serail))
			and fn_num = p_number;

		return n;
	exception
		when no_data_found then
			return -1;
	end;

 FUNCTION GET_COUNT_OF_NEPODPIS_RECIPE(pTKARTA_FK_ID INTEGER) RETURN INTEGER
 --���������� ���-�� �� ����������� �������� ��������
 IS
 vFN_COUNT INTEGER :=0;
 BEGIN
  SELECT (COUNT_OF_NAZMED-COUNT_OF_PODPISAN_NAZMED) AS COUNT_OF_NEPODPISAN
    INTO vFN_COUNT
    FROM
    (SELECT NVL(COUNT(FK_PACID),0) AS COUNT_OF_NAZMED -- ���-�� �������� ���. ����������
        FROM TNAZMED,
             TVVODPATH,
             TNAZMEDLECH L,
             MED.TMEDIC M,
             TNAZMED_TRECIPE MR,
             TRECIPE R
        WHERE FK_PACID = pTKARTA_FK_ID
           AND TVVODPATH.FL_PROCCAB = 0--"��������������� ����������"
           AND TVVODPATH.FK_ID = TNAZMED.FK_VVODPATHID
           AND TNAZMED.FK_STATE <> ASU.GET_VIPNAZ
           AND TNAZMED.FK_ID = L.FK_NAZMEDID
           AND L.FK_MEDICID = M.MEDICID
           AND M.FL_LGOTA=1
           AND TNAZMED.FK_ID = MR.FK_NAZID
           AND R.FK_ID = MR.FK_RECIPE
  ),
  (SELECT NVL(COUNT(FK_PACID),0) AS COUNT_OF_PODPISAN_NAZMED -- ���-�� ����������� �������� ���. ����������
                                     FROM TNAZMED,
                                      TVVODPATH,
                                      TNAZMEDLECH L,
                                      MED.TMEDIC M,
                                      TNAZMED_TRECIPE MR,
                                      TRECIPE R
                                     WHERE FK_PACID = pTKARTA_FK_ID
                                       AND TVVODPATH.FL_PROCCAB = 0--"��������������� ����������"
                                       AND TVVODPATH.FK_ID = TNAZMED.FK_VVODPATHID
                                       AND TNAZMED.FK_STATE <> ASU.GET_VIPNAZ
                                       AND TNAZMED.FK_ID = L.FK_NAZMEDID
                                       AND L.FK_MEDICID = M.MEDICID
                                       AND M.FL_LGOTA=1
                                       AND TNAZMED.FK_ID = MR.FK_NAZID
                                       AND R.FK_ID = MR.FK_RECIPE
                                       AND R.FL_EDIT = 1 -- ��������
--                                       AND R.FL_LGOT <>0 -- ��������
  );


 RETURN vFN_COUNT;

 EXCEPTION
   WHEN NO_DATA_FOUND THEN
     RETURN 0;
 END;


 FUNCTION EXIST_NEPODPIS_RECIPE(pTKARTA_FK_ID INTEGER) RETURN INTEGER
 /*���������� 1 ���� ���� �� ����������� �������� �������
   ����� 0 - (���� ��� �� ����������� �������� �������)*/
 IS
 vFN_COUNT INTEGER :=0;
 BEGIN
  SELECT NVL(COUNT(1),0) -- ���-�� �� ����������� �������� ���. ����������
    INTO vFN_COUNT
    FROM TNAZMED,
      TVVODPATH,
      TNAZMEDLECH L,
      MED.TMEDIC M,
      TNAZMED_TRECIPE MR,
      TRECIPE R
    WHERE FK_PACID = pTKARTA_FK_ID
      AND TVVODPATH.FL_PROCCAB = 0--"��������������� ����������"
      AND TVVODPATH.FK_ID = TNAZMED.FK_VVODPATHID
      AND TNAZMED.FK_STATE <> ASU.GET_VIPNAZ
      AND TNAZMED.FK_ID = L.FK_NAZMEDID
      AND L.FK_MEDICID = M.MEDICID
      AND M.FL_LGOTA=1
      AND TNAZMED.FK_ID = MR.FK_NAZID
      AND R.FK_ID = MR.FK_RECIPE
      AND R.FL_EDIT = 0; -- �� ��������
--    AND R.FL_LGOT <>0 -- ��������

 IF vFN_COUNT<>0 THEN RETURN vFN_COUNT;
 ELSE                 RETURN 0;
 END IF;

 EXCEPTION
   WHEN NO_DATA_FOUND THEN
     RETURN 0;
 END;

 PROCEDURE RECIPE_DEL(pFK_TRECIPEID IN NUMBER)
 /*������� ������ � ��� ����� ����� �������*/
 IS
 BEGIN
		DELETE FROM TNAZMED_TRECIPE T WHERE T.FK_RECIPE = pFK_TRECIPEID;
  DELETE FROM TRECIPE T WHERE T.FK_ID = pFK_TRECIPEID;
 END;


END PKG_MEDICNAZN;
/


-- End of DDL Script for Package Body ASU.PKG_MEDICNAZN

