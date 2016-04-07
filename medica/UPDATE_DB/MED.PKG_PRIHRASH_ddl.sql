-- Start of DDL Script for Package MED.PKG_PRIHRASH
-- Generated 29-���-2011 10:42:27 from MED@H100609

CREATE OR REPLACE 
PACKAGE     med.pkg_prihrash is

type MyMedic is record (
  SRC_MEDIC number,
  DST_MEDIC number
);

type MyMedic_t is table of MyMedic/*
  index by binary_integer*/; 

cursor cCountData (afd_data in date)
is
  select max(fd_data) as data
  from tdocs
  where trunc(fd_data) = trunc(afd_data);

cursor cKol(data in DATE,akartid in number)
is
  select /*+ rule*/
    sum(tdpc.fn_kol) as koll                
  from  tdpc, tdocs, tkart
  where tdpc.dpid = tdocs.dpid
    and tdpc.kartid = akartid
    and fp_vid = 1
    and tkart.kartid = tdpc.kartid
    and fd_data < data
    and fl_del = 0; -- and tkart.moid=pkg_medses.get_curmo;

cursor cLast(data in DATE,akartid in number)
is
  select /*+rule*/
    tdpc.fn_summ as lastsumm,
    fd_data
  from tdocs, tdpc
  where fd_data = (
    select max(fd_data)
    from tdpc, tdocs, tkart
    where tdpc.dpid = tdocs.dpid
      and fd_data < data
      and tdpc.kartid = akartid
      and fp_vid = 1
      and tkart.kartid = tdpc.kartid
      and fl_del = 0
    ) --                   and tkart.moid=pkg_medses.get_curmo)
         and tdocs.dpid = tdpc.dpid
    and kartid = akartid
    and fp_vid = 1 ;

function getrashdata(adata in date) return date;
/*function get_trebkolmedic(amedicid in number, adpid in number, amoid in number, afp_dezh in number := 0) return number;*/
function checkmoidtreb(amoid in number, adocplanid in number, afp_dezh in number := 0) return number;
function Get_Koldpid(adpid in number, amedicid in number) return number;
function get_lastnewprice1(akartid IN NUMBER, adata in date) return number;
function get_lastnewprice_old(akartid in number, adata in date, amoid in number) return number;
function get_curdate(adpid in number) return date;
function get_moidkart(akartid in number) return number;
function get_moneystr (source IN NUMBER) return varchar2;
function getsumdoc(adpid in number,prizn in number) return number;
function getcheckcountkart(adpid in number) return number;
FUNCTION createshablon (afp_vid IN NUMBER DEFAULT 1,afp_vidmove in number default 1) return number;
function dosetnewprice_old(adpid in number,akol in number,aprice in number,akartid in number,aData in date,adpcid in number,prizn in number) return number;
function get_date(adpid in number) return date;
function get_fullnamepac(afk_pacid in number) return varchar2;
function get_newpricemedic(adpid in number,amedicid in number) return number;
function checkenter(amedicid in number, adpid in number) return number;

function checkinkart(akartid in number, adpid in number) return number;
procedure dodelnull(amoid in number, adpid in number);
/*procedure set_docid(apacid in number, adocid in NUMBER);*/
procedure dodeltrebvid(adpid in number);
procedure dodeltreb(adpid in number);
/*procedure set_begindocid(adpid in number, amoid in number,afp_dezh in number :=0);*/
procedure set_newdate(adpid in number, adata in date);
-- ������� ������� �.�. �������� ��������� �� ������� - ���������� ������� �� ��������� � dodelkart
procedure dodelrash(aDPCID in number, aKartID in number);
-- ��������� ������ ��� �������� �� �������
procedure dodelkart(akartid in number, adpcid in number);
PROCEDURE doset(
  afn_price        IN NUMBER,
  afc_comment      IN VARCHAR2,
  afc_doc          IN VARCHAR2,
  afd_Invoicedata  IN DATE,
  afd_data         IN DATE,
  amotoid          IN NUMBER,
  amo_group_toid   IN NUMBER,
  adpid            IN NUMBER,
  amofromid        IN NUMBER,
  amo_group_fromid IN NUMBER,
  prizn            IN NUMBER,
    SpisanieVid      IN NUMBER DEFAULT 0);
procedure do_delKartmedic(adpid in number, amedicid in number);
procedure dodel(adpid in number);

procedure dodel_doc_dpc_kart( adpid   IN   NUMBER  );
procedure dodelvoz(adpid in number);
function setSumDocKart(nDPID in number, nKartID in number, nNewSum in number) return number;
  FUNCTION doSetPrihRash (
      adpid     IN   NUMBER,
      akol      IN   NUMBER,
      aprice    IN   NUMBER,
      akartid   IN   NUMBER,
      adpcid    IN   NUMBER,
      prizn     IN   NUMBER,
      aReservDocID IN NUMBER DEFAULT -1
   )
      -- adpcid<=0 -insert, >0 -update prizn=1 prih; 3 rash; 2 move =0 updatenewprice
      RETURN NUMBER;

  FUNCTION Get_PrihRashPriznak (
      fn_vid           IN   NUMBER,
      fn_vidmove       IN   NUMBER,
      mo_group_id_from IN   NUMBER,
      mo_group_id_to   IN   NUMBER,
      mo_group_id_cur  IN   NUMBER
   )
      RETURN NUMBER DETERMINISTIC;
  FUNCTION Get_IsShowReserv RETURN NUMBER;
  PROCEDURE Set_IsShowReserv( aIsShowReserv IN NUMBER);

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
  aFK_NAZVRACH_ID     IN NUMBER DEFAULT NULL) RETURN NUMBER;
  FUNCTION Get_IsCorrectOst RETURN NUMBER;
  PROCEDURE Set_IsCorrectOst( aIsCorrectOst IN NUMBER);
  
  procedure DoSetUchgrInKartsByDoc ( adpid in number );
  
  /* ��������� ���� �������������� �� �������� ����������, ������ �� ��������� �������� */  
  FUNCTION DO_AUTOFILL_PLAN (        
    PFK_TREBID IN NUMBER, 
    PFK_FINSOURCE_ID IN NUMBER DEFAULT -1,
    PUSECOMPLEXAUTOFILL IN NUMBER DEFAULT 0,
    PFC_QUOTA_CODE IN VARCHAR2 DEFAULT NULL
  ) RETURN MED.O_RASH_AUTOFILLPLAN_TABLE;    
  
  /* ��������� �������������� ������� �� ���������� �� ����� �������������� */
  PROCEDURE DO_AUTOFILL ( 
    PDPID IN NUMBER, -- ��� ���������
    PAUTOFILLPLAN IN MED.O_RASH_AUTOFILLPLAN_TABLE -- ���� ����������
  );
  
END;
/
CREATE OR REPLACE 
PACKAGE BODY     med.pkg_prihrash is
   -- ������� ������� �.�. 16.01.2008
   nIsShowRezerv NUMBER := 1; -- ���������� ������: 0 - ���, 1 - ��
   nIsCorrectOst Number := 0;

PROCEDURE Set_IsShowReserv( aIsShowReserv IN NUMBER)
IS
BEGIN
  if aIsShowReserv > 1 then
    nIsShowRezerv := 1;
  else
    nIsShowRezerv := aIsShowReserv;
  end if;
END Set_IsShowReserv;

FUNCTION Get_IsShowReserv RETURN NUMBER
IS
BEGIN
  RETURN nIsShowRezerv;
END Get_IsShowReserv;

PROCEDURE Set_IsCorrectOst( aIsCorrectOst IN NUMBER)
IS
BEGIN
  if aIsCorrectOst > 1 then
    nIsCorrectOst := 1;
  else
    nIsCorrectOst := aIsCorrectOst;
  end if;
END Set_IsCorrectOst;

FUNCTION Get_IsCorrectOst RETURN NUMBER
IS
BEGIN
  RETURN nIsCorrectOst;
END Get_IsCorrectOst;

FUNCTION checkmoidtreb (
      amoid        IN   NUMBER,
      adocplanid   IN   NUMBER,
      afp_dezh     IN   NUMBER := 0
   ) -- afp_dezh=2 - ������ fp_dezh=3 - �������
RETURN NUMBER
IS
	coun NUMBER;
BEGIN
/*	IF afp_dezh = 0 THEN
		IF adocplanid <> 0 THEN
			SELECT COUNT (*)
			INTO coun
			FROM tnazmed nm, tnazmedlech nml, tkarta k
			WHERE nm.fk_id = nml.naz_id
				AND nm.fl_sam = 0
				AND nm.fk_moid = amoid
				AND k.fk_id = nm.fk_pacid
				AND fp_dezh = 0
				AND k.fl_vyb = 0
				AND docplanid = adocplanid;
		ELSE
			SELECT COUNT (*)
			INTO   coun
			FROM   tnazmed nm, tnazmedlech nml, tkarta k
			WHERE  nm.fk_id = nml.naz_id
				AND nm.fl_sam = 0
				AND nm.fk_moid = amoid
				AND k.fk_id = nm.fk_pacid
				AND fp_dezh = 0
				AND k.fl_vyb = 0
				AND docid IS NULL;
		END IF;
		RETURN coun;
	END IF;

	IF afp_dezh = 3 THEN
		IF adocplanid <> 0 THEN
			SELECT COUNT (*)
			INTO   coun
			FROM   tnazmed nm, tnazmedlech nml, tkarta k
			WHERE  nm.fk_id = nml.naz_id
				AND                nm.fl_sam = 0
				AND                nm.fk_moid = amoid
				AND                k.fk_id = nm.fk_pacid
				AND                fp_dezh = 0
				AND                k.fl_vyb = 1
				AND                docvozid = adocplanid;
		ELSE
			SELECT COUNT (*)
			INTO   coun
			FROM   tnazmed nm, tnazmedlech nml, tkarta k
			WHERE  nm.fk_id = nml.naz_id
				AND nm.fl_sam = 0
				AND nm.fk_moid = amoid
				AND k.fk_id = nm.fk_pacid
				AND fp_dezh = 0
				AND k.fl_vyb = 1
				AND docvozid IS NULL;
		END IF;
		RETURN coun;
      END IF;

      IF afp_dezh = 1 THEN
		IF adocplanid <> 0 THEN
            SELECT COUNT (*)
            INTO   coun
            FROM   tnazmed nm, tnazmedlechvid nml, tkarta k
            WHERE  nm.fk_id = nml.nazid
				AND                nm.fl_sam = 0
				AND                nm.fk_moid = amoid
				AND                k.fk_id = nm.fk_pacid
				AND                fp_dezh = 1
				AND                k.fl_vyb = 0
				AND                docid = adocplanid;
		ELSE
			SELECT COUNT (*)
			INTO   coun
			FROM   tnazmed nm, tnazmedlechvid nml, tkarta k
			WHERE  nm.fk_id = nml.nazid
				AND                nm.fl_sam = 0
				AND                nm.fk_moid = amoid
				AND                k.fk_id = nm.fk_pacid
				AND                fp_dezh = 1
				AND                k.fl_vyb = 0
				AND                docid IS NULL;
		END IF;
		RETURN coun;
	END IF;

	IF afp_dezh = 2 THEN
		IF adocplanid <> 0 THEN
			SELECT COUNT (*)
			INTO   coun
			FROM   tnazmed nm, tnazmedlechvid nml, tkarta k
			WHERE  nm.fk_id = nml.nazid
				AND nm.fl_sam = 0
				AND nm.fk_moid = amoid
				AND k.fk_id = nm.fk_pacid
				AND fp_dezh = 0
				AND k.fl_vyb = 0
				AND docid = adocplanid;
		ELSE
			SELECT COUNT (*)
			INTO   coun
			FROM   tnazmed nm, tnazmedlechvid nml, tkarta k
			WHERE  nm.fk_id = nml.nazid
				AND nm.fl_sam = 0
				AND nm.fk_moid = amoid
				AND k.fk_id = nm.fk_pacid
				AND fp_dezh = 0
				AND k.fl_vyb = 0
				AND docid IS NULL;
		END IF;
		RETURN coun;
	END IF;

*//*ADVICE(115): Last statement in function must be a RETURN [510] */
  Return 0;
END;

/*ADVICE(118): Function with more than one RETURN statement in the executable section [512] */


   FUNCTION Get_Koldpid (
      adpid      IN   NUMBER,
      amedicid   IN   NUMBER
   )
      RETURN NUMBER
   IS
      kol   NUMBER;
   BEGIN
      SELECT SUM (tdpc.fn_kol)
      INTO   kol
      FROM   MED.tdpc, MED.tkart
      WHERE  dpid = adpid
AND          tdpc.kartid = tkart.kartid
AND          medicid = amedicid;
      RETURN kol;
   END;

-- ���������� ������� ������� (+1) ��� �������(-1) �� ������� ������ mo_group_id_cur
   FUNCTION Get_PrihRashPriznak (
      fn_vid     IN   NUMBER,
      fn_vidmove IN   NUMBER,
      mo_group_id_from   IN   NUMBER,
      mo_group_id_to IN   NUMBER,
      mo_group_id_cur  IN   NUMBER
   )
      RETURN NUMBER DETERMINISTIC
   IS
   BEGIN
     -- ���� ���������� ��������� � ������ ������� �� nIsShowRezerv
     IF ( mo_group_id_to = mo_group_id_cur ) AND
        ((fn_vid = 1 AND fn_vidmove IN (1, 9, 10))OR  -- 1,1 - ������, 1,9 - ���� ��������, 1,10 - ������ �� ���
--         (fn_vid = 2 AND fn_vidmove = 1      ) -- 2,1 - ������� � ������
         (fn_vid = 2 AND fn_vidmove = 6      )OR    -- ������� � ������ �� ��
         -- ������/������
         (fn_vid = 2 AND fn_vidmove = 2)OR -- ������ �� ����������
         (fn_vid = 2 AND fn_vidmove = 3)OR -- ������ �� ������ ����������
         (fn_vid = 2 AND fn_vidmove = 5 and nIsShowRezerv = 1)   -- �������� �� �������
        )
       then RETURN +1;
     ELSIF ( mo_group_id_from = mo_group_id_cur ) AND -- ������ ���� ������ �� ���� ������
        ((fn_vid = 3 AND fn_vidmove = 8)OR -- �������  �� �������, �� ���� ���������, �� ��������
         (fn_vid = 3 AND fn_vidmove = 7)OR -- ������� �� �� ������������
         (fn_vid = 3 AND fn_vidmove = 11)OR -- ������� ����������
         (fn_vid = 3 AND fn_vidmove = 12)OR -- ������ �� ���. �������
         (fn_vid = 3 AND fn_vidmove = 13)OR -- ������ �� ���. ����������
         (fn_vid = 3 AND fn_vidmove = 14)OR -- ������� �� ������� ����������, ���
         -- ������/������
         (fn_vid = 2 AND fn_vidmove = 2)OR -- ������ �� ����������
         (fn_vid = 2 AND fn_vidmove = 3)OR -- ������ �� ������ ����������
         (fn_vid = 2 AND fn_vidmove = 4 AND nIsShowRezerv = 1)OR -- �������� � ������
         (fn_vid = 2 AND fn_vidmove = 6)   -- ������� � ������ �� ��
        )
       then RETURN -1;
     ELSE
       RETURN 0;
     END IF;
   END;

   PROCEDURE dodelnull (
      amoid   IN   NUMBER,
      adpid   IN   NUMBER
   )
   IS
      CURSOR c1
      IS
         SELECT tkart.kartid AS kid
         FROM   MED.tdpc, MED.tkart
         WHERE  tdpc.fn_kol = 0
           AND  tdpc.kartid = tkart.kartid
           AND  getkolnot (amoid, medicid, adpid, 1) <> 0;
/*ADVICE(152): Cursor reference to a external variable (use a parameter) [209] */

   BEGIN
      FOR c_rec IN c1 LOOP
         DELETE FROM tdpc
         WHERE       dpid = adpid
AND                  kartid = c_rec.kid;
      END LOOP;
   END;

   /*FUNCTION get_trebkolmedic (
      amedicid   IN   NUMBER,
      adpid      IN   NUMBER,
      amoid      IN   NUMBER,
      afp_dezh   IN   NUMBER := 0
   )
      RETURN NUMBER
   IS
      CURSOR cTrebKolvid
      IS
         SELECT   SUM (nml.colvo) AS fn_kol
         FROM     tnazmed nm, tnazmedlechvid nml, tkarta k
         WHERE    nm.fk_id = nml.nazid
AND               nm.fl_sam = 0
AND               nm.fp_dezh = 1
AND               nm.fk_moid = amoid
\*ADVICE(178): Cursor reference to a external variable (use a parameter) [209] *\

AND               k.fk_id = nm.fk_pacid
AND               k.fl_vyb = 0
AND               nml.docid = adpid
\*ADVICE(183): Cursor reference to a external variable (use a parameter) [209] *\

AND               nml.medicid = amedicid
\*ADVICE(186): Cursor reference to a external variable (use a parameter) [209] *\

         GROUP BY nml.medicid
         HAVING   SUM (nml.colvo) > 0;

      CURSOR cTrebKolvidrash
      IS
         SELECT   SUM (nml.colvo) AS fn_kol
         FROM     tnazmed nm, tnazmedlechvid nml, tkarta k
         WHERE    nm.fk_id = nml.nazid
AND               nm.fl_sam = 0
AND               nm.fp_dezh = 0
AND               nm.fk_moid = amoid
\*ADVICE(199): Cursor reference to a external variable (use a parameter) [209] *\

AND               k.fk_id = nm.fk_pacid
AND               k.fl_vyb = 0
AND               nml.docid = adpid
\*ADVICE(204): Cursor reference to a external variable (use a parameter) [209] *\

AND               nml.medicid = amedicid
\*ADVICE(207): Cursor reference to a external variable (use a parameter) [209] *\

         GROUP BY nml.medicid
         HAVING   SUM (nml.colvo) > 0;

      CURSOR cTrebKol
      IS
         SELECT   SUM (nm.fn_day * nm.fn_perday * nml.colvo) AS fn_kol
         FROM     tnazmed nm, tnazmedlech nml, tkarta k
         WHERE    nm.fk_id = nml.naz_id
AND               nm.fl_sam = 0
AND               nm.fp_dezh = 0
AND               nm.fk_moid = amoid
\*ADVICE(220): Cursor reference to a external variable (use a parameter) [209] *\

AND               k.fk_id = nm.fk_pacid
AND               k.fl_vyb = 0
AND               nml.docplanid = adpid
\*ADVICE(225): Cursor reference to a external variable (use a parameter) [209] *\

AND               nml.docid = adpid
\*ADVICE(228): Cursor reference to a external variable (use a parameter) [209] *\

AND               nml.medic_id = amedicid
\*ADVICE(231): Cursor reference to a external variable (use a parameter) [209] *\

         GROUP BY nml.medic_id
         HAVING   SUM (nm.fn_day * nm.fn_perday * nml.colvo) > 0;

      CURSOR cTrebKolvoz
      IS
         SELECT qNaz.fn - NVL (qVyd.fn, 0) AS fn_kol
         FROM   (SELECT   SUM (nmlv.colvo) AS fn, medicid
                 FROM     tnazmed nm, tnazmedlechvid nmlv, tnazmedlech nml, tkarta k
                 WHERE    nmlv.nazid = nm.fk_id
AND                       nm.fk_id = nml.naz_id
AND                       k.fk_id = nm.fk_pacid
AND                       k.fl_vyb = 1
AND                       nm.fp_dezh = 0
AND                       nm.fk_moid = amoid
\*ADVICE(247): Cursor reference to a external variable (use a parameter) [209] *\

AND                       nml.docid IS NOT NULL
AND                       nml.docvozid = adpid
\*ADVICE(251): Cursor reference to a external variable (use a parameter) [209] *\

                 GROUP BY medicid
\*ADVICE(254): Elements in the SELECT list (either columns or expressions) are not qualified by a table/view name [403] *\
                                 ) qVyd,
                (SELECT   SUM (nml.colvo * nm.fn_day * nm.fn_perday) AS fn, medic_id
                 FROM     tnazmed nm, tnazmedlech nml, tkarta k
                 WHERE    nm.fk_id = nml.naz_id
AND                       k.fk_id = nm.fk_pacid
AND                       k.fl_vyb = 1
AND                       nm.fp_dezh = 0
AND                       nm.fk_moid = amoid
\*ADVICE(263): Cursor reference to a external variable (use a parameter) [209] *\

AND                       nml.docid IS NOT NULL
AND                       nml.docvozid = adpid
\*ADVICE(267): Cursor reference to a external variable (use a parameter) [209] *\

                 GROUP BY medic_id
\*ADVICE(270): Elements in the SELECT list (either columns or expressions) are not qualified by a table/view name [403] *\
                                  ) qNaz
         WHERE  qNaz.medic_id = qVyd.medicid(+)
AND             qNaz.medic_id = amedicid
\*ADVICE(274): Cursor reference to a external variable (use a parameter) [209] *\
                                        ;

      koli   NUMBER;
   BEGIN
      IF afp_dezh = 0 THEN
         OPEN ctrebkol;
         FETCH ctrebkol INTO koli;
         CLOSE ctrebkol;
      END IF;
      IF afp_dezh = 3 THEN
         OPEN ctrebkolvoz;
         FETCH ctrebkolvoz INTO koli;
         CLOSE ctrebkolvoz;
      END IF;
      IF afp_dezh = 1 THEN
         OPEN ctrebkolvid;
         FETCH ctrebkolvid INTO koli;
         CLOSE ctrebkolvid;
      END IF;
      IF afp_dezh = 2 THEN
         OPEN ctrebkolvidrash;
         FETCH ctrebkolvidrash INTO koli;
         CLOSE ctrebkolvidrash;
      END IF;
      IF koli IS NULL THEN
         koli := 0;
      END IF;
      RETURN koli;
   END;*/

   PROCEDURE do_delKartmedic (
      adpid      IN   NUMBER,
      amedicid   IN   NUMBER
   )
   IS
      CURSOR cDel
      IS
         SELECT dpcid
         FROM   tdpc, tkart
         WHERE  tdpc.kartid = tkart.kartid
AND             medicid = amedicid
/*ADVICE(316): Cursor reference to a external variable (use a parameter) [209] */

AND             dpid = adpid
/*ADVICE(319): Cursor reference to a external variable (use a parameter) [209] */

/*ADVICE(321): Elements in the SELECT list (either columns or expressions) are not qualified by a table/view name [403] */
                            ;
   BEGIN
      FOR c_rec IN cdel LOOP
         DELETE FROM tdpc
         WHERE       dpcid = c_rec.dpcid;
      END LOOP;
   END;

   FUNCTION checkenter (
      amedicid   IN   NUMBER,
      adpid      IN   NUMBER
   )
      RETURN NUMBER
   IS
      CURSOR cotp
      IS
         SELECT SUM (tdpc.fn_kol)
         FROM   MED.tdpc, MED.tkart, MED.tmedic
         WHERE  tdpc.dpid = adpid
/*ADVICE(341): Cursor reference to a external variable (use a parameter) [209] */

AND             tdpc.kartid = tkart.kartid
AND             tkart.medicid = tmedic.medicid
AND             tmedic.medicid = amedicid
/*ADVICE(346): Cursor reference to a external variable (use a parameter) [209] */
                                         ;

      summ   NUMBER;
   BEGIN
      OPEN cotp;
      FETCH cotp INTO summ;
      CLOSE cotp;
      IF summ IS NULL THEN
         RETURN 0;
      END IF;
      RETURN summ;
   END;
/*ADVICE(359): Function with more than one RETURN statement in the executable section [512] */


   PROCEDURE set_newdate (
      adpid   IN   NUMBER,
      adata   IN   DATE
   )
   IS
      ddata   DATE;
   BEGIN
      OPEN ccountdata (adata);
      FETCH ccountdata INTO ddata;
      CLOSE ccountdata;
      IF ddata IS NULL THEN
         UPDATE tdocs
         SET    fd_data = adata
         WHERE  dpid = adpid;
      ELSE
         ddata := ddata + 1 / (24 * 60 * 60);
         UPDATE tdocs
         SET    fd_data = ddata
         WHERE  dpid = adpid;
      END IF;
   END;

/*
 * ������ ���� ������� �����������
 */
/*function get_lastnewprice(aKartID in number, aData in date, aMOID in number) return number
IS
  --������ ��������� � ������ ���
  --������ ������� ���
	cursor cKolp (adata in date) is
		SELECT nvl(sum(fn_kol), 0) as fn_kol
		FROM tdocs, tdpc
		where tdocs.fd_data between to_date('01.01.2000', 'dd.mm.yyyy') and adata
			and tdpc.dpid = tdocs.dpid
			and tdocs.fp_vid in (1,3)
      AND tdocs.fp_vidmove IN (1,5,6,7,8)
      AND tdocs.fl_edit = 0
			and tdocs.motoid = amoid
			and tdpc.kartid = akartid;

	cursor cKolr (adata in date) is
		select nvl(sum(fn_kol), 0) as fn_kol
		from tdocs, tdpc
		where tdocs.fd_data between to_date('01.01.2000', 'dd.mm.yyyy') and  adata
			and tdpc.dpid = tdocs.dpid
			and tdocs.mofromid = amoid
      AND tdocs.fp_vid = 3
      AND tdocs.fp_vidmove IN (4,5,6,7,8)
      AND tdocs.fl_edit = 0
			and tdpc.kartid = akartid;

	cursor cDatep is
		select max(fd_data)
		from tdocs, tdpc
			WHERE tdocs.fp_vid in (1,3)
      AND tdocs.fp_vidmove IN (1,5,6,7,8)
      AND tdocs.fl_edit = 0
			and tdocs.motoid = amoid
			and fd_data < adata
			and tdpc.dpid = tdocs.dpid
			and kartid = akartid;

	cursor cDater is
		select max(fd_data)
		from tdocs, tdpc
    WHERE  tdocs.fp_vid = 3
      AND tdocs.fp_vidmove IN (4,5,6,7,8)
      AND tdocs.fl_edit = 0
			and tdocs.mofromid = amoid
			and fd_data < adata
			and tdpc.dpid = tdocs.dpid
			and kartid = akartid;

	cursor cSummp(adata in date) is
		select nvl(sum(fn_summ), 0) as fn_kol
		from tdocs, tdpc
		where tdocs.fd_data between to_date('01.01.2000', 'dd.mm.yyyy') and adata
			and tdpc.dpid = tdocs.dpid
			and tdocs.fp_vid in (1,3)
      AND tdocs.fp_vidmove IN (1,5,6,7,8)
      AND tdocs.fl_edit = 0
			and tdocs.motoid = amoid
			and tdpc.kartid = akartid;

	cursor cSummr(adata in date) is
		select nvl(sum(fn_summ), 0) as fn_kol
		from tdocs, tdpc
		where tdocs.fd_data between to_date('01.01.2000', 'dd.mm.yyyy') and adata
			and tdpc.dpid = tdocs.dpid
      AND tdocs.fp_vid = 3
      AND tdocs.fp_vidmove IN (4,5,6,7,8)
      AND tdocs.fl_edit = 0
			and tdocs.mofromid = amoid
			and tdpc.kartid = akartid;

	summp number;
	summr number;
	kolp number;
	kolr number;
	d date;
	dr date;
	nRet number;
begin
	open cdatep;
	fetch cdatep into d;
	close cdatep;

	open cdater;
	fetch cdater into dr;
	close cdater;

	open csummp(adata);
	fetch csummp into summp;
	close csummp;

	open ckolp(adata);
	fetch ckolp into kolp;
	close ckolp;

	if d < dr then
		d := dr + 1 / (24 * 60 * 60);
	end if;

	open csummr(d);
	fetch csummr into summr;
	close csummr;

	open ckolr(d);
	fetch ckolr into kolr;
	close ckolr;

	if(nvl(kolp, 0) - nvl(kolr, 0)) = 0 then
		return 0;
	end if;

	nRet := (nvl(summp, 0) - nvl(summr, 0)) / (nvl(kolp, 0) - nvl(kolr, 0));
	return nRet;
end;*/

/*
 *
 */
function get_lastnewprice1(akartid IN NUMBER, adata in date) RETURN NUMBER
IS
      CURSOR cKolp (adata in date)
      IS
         SELECT nvl(SUM (fn_kol),0) AS fn_kol
         FROM   tdocs, tdpc
         WHERE  tdocs.fd_data BETWEEN TO_DATE ('01.01.2002', 'dd.mm.yyyy') AND adata
AND             tdpc.dpid = tdocs.dpid
AND             tdocs.fp_vid = 1
AND             tdpc.kartid = akartid;
      CURSOR cKolr (adata in date)
      IS
         SELECT nvl(SUM (fn_kol),0) AS fn_kol
         FROM   tdocs, tdpc
         WHERE  tdocs.fd_data BETWEEN TO_DATE ('01.01.2002', 'dd.mm.yyyy') AND adata-1/(24*60*60)
AND             tdpc.dpid = tdocs.dpid
AND             tdocs.fp_vid = 3
AND             tdpc.kartid = akartid;
     cursor cDate
     is
     select max(fd_data) from tdocs
     where fp_vid=1 and fd_data<adata;

      CURSOR cSummp (adata in date)
      IS
--������� ������� �.�. 14.05.2007
--         SELECT nvl(SUM (fn_summ),0) AS fn_kol
  		select nvl(sum(tdpc.fn_kol*tdpc.fn_newprice), 0) as fn_kol
         FROM   tdocs, tdpc
         WHERE  tdocs.fd_data BETWEEN TO_DATE ('01.01.2002', 'dd.mm.yyyy') AND adata
AND             tdpc.dpid = tdocs.dpid
AND             tdocs.fp_vid = 1
and             motoid is not null
AND             tdpc.kartid = akartid;
      CURSOR cSummr (adata in date)
      IS
--������� ������� �.�. 14.05.2007
--         SELECT nvl(SUM (fn_summ),0) AS fn_kol
  		select nvl(sum(tdpc.fn_kol*tdpc.fn_newprice), 0) as fn_kol
         FROM   tdocs, tdpc
         WHERE  tdocs.fd_data BETWEEN TO_DATE ('01.01.2002', 'dd.mm.yyyy') AND adata-1/(24*60*60)
AND             tdpc.dpid = tdocs.dpid
AND             tdocs.fp_vid = 3
and             mofromid is not null
AND             tdpc.kartid = akartid;

summp number;
summr number;
kolp number;
kolr number;
--res number;
d date;
begin
open cdate;
fetch cdate into d;
close cdate;
open csummp(adata);
fetch csummp into summp;
close csummp;

open ckolp(adata);
fetch ckolp into kolp;
close ckolp;

open csummr(d);
fetch csummr into summr;
close csummr;

open ckolr(d);
fetch ckolr into kolr;
close ckolr;
if nvl(kolp-kolr,0)=0 then return 0;
end if;
return (nvl(summp-summr,0))/(kolp-kolr);

/*      RETURN NUMBER
   IS
      CURSOR cSumm
      IS
         SELECT fn_newprice
         FROM   tdpc, tdocs
         WHERE  kartid = akartid
AND             tdocs.dpid = tdpc.dpid
AND             fd_data = (SELECT MAX (fd_data)
                           FROM   tdpc, tdocs
                           WHERE  kartid = akartid
AND                               tdocs.dpid = tdpc.dpid)
                                                         ;


--                 AND (   tdocs.moownerid = pkg_medses.get_curmo));
--                      OR tdocs.motoid = pkg_medses.get_curmo));

      nsumm   NUMBER;
   BEGIN
      OPEN csumm;
      FETCH csumm INTO nsumm;
      CLOSE cSumm;
      IF nsumm IS NULL THEN
         nsumm := 0;
      END IF;
      RETURN nsumm;*/
   END;
   FUNCTION get_curdate (
      adpid   IN   NUMBER
   )
      RETURN DATE
   IS
      DATA   DATE;
   BEGIN
      SELECT fd_data
      INTO   DATA
      FROM   tdocs
      WHERE  dpid = adpid;
      RETURN DATA;
   END;

   FUNCTION get_moidkart (
      akartid   IN   NUMBER
   )
      RETURN NUMBER
   IS
      id   NUMBER;
   BEGIN
      SELECT moid
      INTO   id
      FROM   tkart
      WHERE  kartid = akartid;
      RETURN id;
   END;


   FUNCTION get_moneystr (
      SOURCE   IN   NUMBER
   )
      RETURN VARCHAR2
   IS
      result   VARCHAR2 (300);

/**********************************************/
/* ������� ����� �������� � ������ � �������� */
/**********************************************/
   BEGIN
      -- k - �������
      result := LTRIM (TO_CHAR (SOURCE, '9,9,,9,,,,,,9,9,,9,,,,,9,9,,9,,,,9,9,,9,,,.99')) || 'k';
      -- t - ������; m - �������; M - ���������;
      result := REPLACE (result, ',,,,,,', 'eM');
      result := REPLACE (result, ',,,,,', 'em');
      result := REPLACE (result, ',,,,', 'et');
      -- e - �������; d - �������; c - �����;
      result := REPLACE (result, ',,,', 'e');
      result := REPLACE (result, ',,', 'd');
      result := REPLACE (result, ',', 'c');
      --
      result := REPLACE (result, '0c0d0et', ''
/*ADVICE(786): In Oracle 8 strings of zero length assigned to CHAR variables will blank-pad these rather than making them
              NULL [111] */
                                              );
      result := REPLACE (result, '0c0d0em', ''
/*ADVICE(790): In Oracle 8 strings of zero length assigned to CHAR variables will blank-pad these rather than making them
              NULL [111] */
                                              );
      result := REPLACE (result, '0c0d0eM', ''
/*ADVICE(794): In Oracle 8 strings of zero length assigned to CHAR variables will blank-pad these rather than making them
              NULL [111] */
                                              );
      --
      result := REPLACE (result, '0c', ''
/*ADVICE(799): In Oracle 8 strings of zero length assigned to CHAR variables will blank-pad these rather than making them
              NULL [111] */
                                         );
      result := REPLACE (result, '1c', '��� ');
      result := REPLACE (result, '2c', '������ ');
      result := REPLACE (result, '3c', '������ ');
      result := REPLACE (result, '4c', '��������� ');
      result := REPLACE (result, '5c', '������� ');
      result := REPLACE (result, '6c', '�������� ');
      result := REPLACE (result, '7c', '������� ');
      result := REPLACE (result, '8c', '��������� ');
      result := REPLACE (result, '9c', '��������� ');
      --
      result := REPLACE (result, '1d0e', '������ ');
      result := REPLACE (result, '1d1e', '����������� ');
      result := REPLACE (result, '1d2e', '���������� ');
      result := REPLACE (result, '1d3e', '���������� ');
      result := REPLACE (result, '1d4e', '������������ ');
      result := REPLACE (result, '1d5e', '���������� ');
      result := REPLACE (result, '1d6e', '����������� ');
      result := REPLACE (result, '1d7e', '����������� ');
      result := REPLACE (result, '1d8e', '������������ ');
      result := REPLACE (result, '1d9e', '������������ ');
      --
      result := REPLACE (result, '0d', ''
/*ADVICE(824): In Oracle 8 strings of zero length assigned to CHAR variables will blank-pad these rather than making them
              NULL [111] */
                                         );
      result := REPLACE (result, '2d', '�������� ');
      result := REPLACE (result, '3d', '�������� ');
      result := REPLACE (result, '4d', '����� ');
      result := REPLACE (result, '5d', '��������� ');
      result := REPLACE (result, '6d', '���������� ');
      result := REPLACE (result, '7d', '��������� ');
      result := REPLACE (result, '8d', '����������� ');
      result := REPLACE (result, '9d', '��������� ');
      --
      result := REPLACE (result, '0e', ''
/*ADVICE(837): In Oracle 8 strings of zero length assigned to CHAR variables will blank-pad these rather than making them
              NULL [111] */
                                         );
      result := REPLACE (result, '5e', '���� ');
      result := REPLACE (result, '6e', '����� ');
      result := REPLACE (result, '7e', '���� ');
      result := REPLACE (result, '8e', '������ ');
      result := REPLACE (result, '9e', '������ ');
      --
      result := REPLACE (result, '1e.', '���� ����� ');
      result := REPLACE (result, '2e.', '��� ����� ');
      result := REPLACE (result, '3e.', '��� ����� ');
      result := REPLACE (result, '4e.', '������ ����� ');
      result := REPLACE (result, '1et', '���� ������ ');
      result := REPLACE (result, '2et', '��� ������ ');
      result := REPLACE (result, '3et', '��� ������ ');
      result := REPLACE (result, '4et', '������ ������ ');
      result := REPLACE (result, '1em', '���� ������� ');
      result := REPLACE (result, '2em', '��� �������� ');
      result := REPLACE (result, '3em', '��� �������� ');
      result := REPLACE (result, '4em', '������ �������� ');
      result := REPLACE (result, '1eM', '���� ������� ');
      result := REPLACE (result, '2eM', '��� �������� ');
      result := REPLACE (result, '3eM', '��� �������� ');
      result := REPLACE (result, '4eM', '������ �������� ');
      --
      result := REPLACE (result, '11k', '11 ������');
      result := REPLACE (result, '12k', '12 ������');
      result := REPLACE (result, '13k', '13 ������');
      result := REPLACE (result, '14k', '14 ������');
      result := REPLACE (result, '1k', '1 �������');
      result := REPLACE (result, '2k', '2 �������');
      result := REPLACE (result, '3k', '3 �������');
      result := REPLACE (result, '4k', '4 �������');
      --
      IF NOT (SUBSTR (result, 1, 1) = '.') THEN
         result := REPLACE (result, '.', ' ����e� ');
      ELSE
         result := REPLACE (result, '.', '���� ����e� ');
      END IF;
      result := REPLACE (result, 't', '����� ');
      result := REPLACE (result, 'm', '��������� ');
      result := REPLACE (result, 'M', '��������� ');
      result := REPLACE (result, 'k', ' ���ee�');
      --
      RETURN (result);
   END;


/*
 */
function setSumDocKart(nDPID in number, nKartID in number, nNewSum in number) return number
is
	nOldSum number;
begin
	update tdpc
	set fn_summ = nNewSum
	where dpid = nDPID
		and kartid = nKartID
	returning fn_summ into nOldSum;
	return nOldSum;
end;

/*
 *
 */
FUNCTION getsumdoc (adpid IN NUMBER, prizn IN NUMBER) RETURN NUMBER
IS
	summ   NUMBER;
BEGIN
--	SELECT SUM (fn_summ)
-- ������ ������� 07.06.2007 ������� �.�.
/*	SELECT SUM (tdpc.fn_kol*tdpc.fn_newprice)
	INTO   summ
	FROM   tdpc, tkart
	WHERE  dpid = adpid
		AND tkart.kartid = tdpc.kartid
		AND fl_del = 0;
	RETURN NVL (summ, 0);*/

	SELECT SUM (tdpc.fn_kol*tkart.FN_PRICE)
	INTO   summ
	FROM   tdpc, tkart
	WHERE  dpid = adpid
		AND tkart.kartid = tdpc.kartid
		AND fl_del = 0;
	RETURN NVL (summ, 0);
END;

/*
 *
 */
FUNCTION getcheckcountkart (
      adpid   IN   NUMBER
)
      RETURN NUMBER
   IS
      coun   NUMBER;
   BEGIN
      SELECT COUNT (*)
      INTO   coun
      FROM   MED.tdpc, MED.tkart
      WHERE  dpid = adpid
AND          tkart.kartid = tdpc.kartid
AND          fl_del = 0
AND          (   fn_summ <= 0
              OR tdpc.fn_kol <= 0
             );
      RETURN coun;
   END;


  procedure dodelrash(aDPCID in number, aKartID in number)
  IS
  BEGIN
      DELETE FROM tdpc
      WHERE       kartid = akartid AND
                  dpcid = adpcid;
  END;

   PROCEDURE dodelkart (
      akartid   IN   NUMBER,
      adpcid    IN   NUMBER
   )
   IS
   BEGIN
      DELETE FROM tdpc
      WHERE       kartid = akartid
AND               dpcid = adpcid;

      UPDATE tkart set fl_del = 1 where kartid = akartid;
--      DELETE FROM tkart  WHERE kartid = akartid;
   END;

   FUNCTION get_date (
      adpid   IN   NUMBER
   )
      RETURN DATE
   IS
      DATA   DATE;
   BEGIN
      SELECT fd_data
      INTO   DATA
      FROM   tdocs
      WHERE  dpid = adpid;
      RETURN TO_DATE (SYSDATE, 'dd.mm.yyyy');
   END;

   FUNCTION createshablon (
      afp_vid       IN   NUMBER DEFAULT 1,
      afp_vidmove   IN   NUMBER DEFAULT 1
   )
      RETURN NUMBER
   IS
      id      NUMBER;
      adata   DATE;
      mo_group NUMBER;
   BEGIN
      OPEN ccountdata (SYSDATE);
      FETCH ccountdata INTO adata;
      CLOSE ccountdata;
      IF adata IS NULL THEN
         adata := trunc (SYSDATE);
      ELSE
         adata := adata + 1 / (24 * 60 * 60);
      END IF;

      -- ����� � �������� ������������ ��� ������� ������
--      select MAX(TMO.fk_curmogroupid) into mo_group from MED.TMO where TMO.moid = pkg_medses.get_curmo;
      mo_group := MED.PKG_MEDSES.get_cur_mogroup_by_cur_mo;

      INSERT INTO tdocs
                  (moownerid,             fp_vid, fd_data, fp_vidmove,  fk_mogroupid )
      VALUES      (pkg_medses.get_curmo,  afp_vid, adata,  afp_vidmove, mo_group     )
      RETURNING   dpid
      INTO        id;
      RETURN id;
   END;

PROCEDURE doset(
	afn_price        IN NUMBER,
	afc_comment      IN VARCHAR2,
	afc_doc          IN VARCHAR2,
	afd_Invoicedata  IN DATE,
	afd_data         IN DATE,
	amotoid          IN NUMBER,
	amo_group_toid   IN NUMBER,
	adpid            IN NUMBER,
	amofromid        IN NUMBER,
	amo_group_fromid IN NUMBER,
	prizn            IN NUMBER,
    SpisanieVid      IN NUMBER DEFAULT 0)
IS
BEGIN
	-- ������
	IF prizn = 1 THEN
		UPDATE tdocs
		SET fn_price = afn_price,
			fc_comment = afc_comment,
			fc_doc = afc_doc,
--			fd_data = trunc(afd_data),
			fd_data = afd_data, /* + (SYSDATE - trunc(SYSDATE)),*/
			motoid = amotoid,
			fk_mogroupid_to = amo_group_toid,
			postavid = amofromid,
--      fl_edit = 1,
--      fd_invoice = trunc(afd_Invoicedata)
      fd_invoice = afd_Invoicedata,
            fn_spisanievid = SpisanieVid
		WHERE dpid = adpid;
	END IF;
	IF prizn = 2 THEN -- �����������
		UPDATE tdocs
		SET fn_price = afn_price,
			fc_comment = afc_comment,
			fc_doc = afc_doc,
			motoid = amotoid,
			mofromid = amofromid,
            fk_mogroupid_to = amo_group_toid,
            fk_mogroupid_from = amo_group_fromid,
            fd_invoice = afd_Invoicedata,
			fd_data = afd_data,
            fn_spisanievid = SpisanieVid
		WHERE dpid = adpid;
	END IF;
	-- ������
	IF prizn = 3 THEN
		UPDATE tdocs
		SET fn_price = afn_price,
			fc_comment = afc_comment,
			fc_doc = afc_doc,
--  		fd_data = trunc(afd_data),
			fd_data = afd_data, /* + (SYSDATE - trunc(SYSDATE)),*/
			motoid = amotoid,
			mofromid = amofromid,
            fk_mogroupid_to = amo_group_toid,
            fk_mogroupid_from = amo_group_fromid,
            fd_invoice = afd_Invoicedata,
            fn_spisanievid = SpisanieVid
--      fd_invoice = trunc(afd_Invoicedata)
		WHERE dpid = adpid;
	END IF;
	IF prizn = 4 THEN -- ������ �� ����������
		UPDATE tdocs
		SET fn_price = afn_price,
			fc_comment = afc_comment,
			fc_doc = afc_doc,
			motoid = amotoid,
			mofromid = amofromid,
            fk_mogroupid_to = amo_group_toid,
            fk_mogroupid_from = amo_group_fromid,
      fd_invoice = afd_Invoicedata,
			fd_data = afd_data,
            fn_spisanievid = SpisanieVid
		WHERE dpid = adpid;
    UPDATE Ttreb
    SET fc_treb = afc_doc
    WHERE fk_dpid = adpid;
	END IF;
	-- ������� ���������
	IF prizn = 5 THEN
		UPDATE tdocs
		SET fn_price = afn_price,
			fc_comment = afc_comment,
			fc_doc = afc_doc,
			fd_data = afd_data,
			mofromid = amofromid,
            fk_mogroupid_from = amo_group_fromid,
			postavid = amotoid, -- ID ����������, �������� ������������
			fk_mogroupid_to = amo_group_toid, -- ID ������� ��������
            fd_invoice = afd_Invoicedata,
            fn_spisanievid = SpisanieVid
		WHERE dpid = adpid;
	END IF;

END;

   PROCEDURE dodeltreb (
      adpid   IN   NUMBER
   )
   IS
   BEGIN
      /*UPDATE tnazmedlech
      SET    docid = NULL,
             docplanid = NULL
      WHERE  docplanid = adpid;*/
      NULL;
   END;

   PROCEDURE dodelvoz (
      adpid   IN   NUMBER
   )
   IS
   BEGIN
      /*UPDATE tnazmedlech
      SET    docvozid = NULL
      WHERE  docvozid = adpid;*/
      NULL;
   END;

   FUNCTION get_newpricemedic (
      adpid      IN   NUMBER,
      amedicid   IN   NUMBER
   )
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT   SUM (fn_summ/tdpc.fn_kol)
      INTO     res
      FROM     MED.tdpc, MED.tkart
      WHERE    tdpc.dpid = adpid
AND            tkart.medicid = amedicid
AND            tkart.kartid = tdpc.kartid
      ORDER BY medicid;
      IF res IS NULL THEN
         res := 0;
      END IF;
      RETURN res;
   END;

   FUNCTION get_fullnamepac (
      afk_pacid   IN   NUMBER
   )
      RETURN VARCHAR2
   IS
      res   VARCHAR2 (100);
   BEGIN
      SELECT fc_fam || ' ' || fc_im || ' ' || fc_otch
      INTO   res
      FROM   tkarta
      WHERE  fk_id = afk_pacid;
      RETURN res;
   END;

   PROCEDURE dodeltrebvid (
      adpid   IN   NUMBER
   )
   IS
   BEGIN
      /*UPDATE tnazmedlechvid
      SET    docid = NULL
      WHERE  docid = adpid;
      UPDATE tnazmedlechvid
      SET    docidneotl = NULL
      WHERE  docidneotl = adpid;*/
      NULL;
   END;

-- ������� ������� �.�.
-- �������� ���� ���������� � ������� - ��������, �������� ������ � ���� ������.
   procedure dodel_doc_dpc_kart( adpid   IN   NUMBER )
   IS
   BEGIN
-- ������� ������
--      delete from TKart where TKart.kartid in (select tdpc.kartid from tdpc where tdpc.dpid in (select Tdocs.dpid from TDocs where Tdocs.dpid = adpid));
      UPDATE tkart set fl_del = 1 where TKart.kartid in (select tdpc.kartid from tdpc where tdpc.dpid in (select Tdocs.dpid from TDocs where Tdocs.dpid = adpid));
-- ������� ��� ��������
      delete from tdpc where tdpc.dpid in (select Tdocs.dpid from TDocs where Tdocs.dpid = adpid);
-- ������� ��������
      DELETE FROM tdocs
      WHERE       dpid = adpid;
   END;

   PROCEDURE dodel (
      adpid   IN   NUMBER
   )
   IS
   BEGIN
      delete from med.tdocs D where D.dpid in (select tdpc.FK_REZERV_DOCID from med.tdpc where (tdpc.DPID = adpid) AND (tdpc.FK_REZERV_DOCID > 0));
      DELETE FROM tdocs
      WHERE       dpid = adpid;
   END;


   FUNCTION doSetPrihRash (
      adpid     IN   NUMBER,
      akol      IN   NUMBER,
      aprice    IN   NUMBER,
      akartid   IN   NUMBER,
      adpcid    IN   NUMBER,
      prizn     IN   NUMBER,
      aReservDocID IN NUMBER DEFAULT -1
   )
      -- adpcid<=0 -insert, >0 -update prizn=1 prih; 3 rash; 2 move =0 updatenewprice
      RETURN NUMBER
   IS
      id             NUMBER;
      FN_PRICE       NUMBER;
   BEGIN
      id := -1;
--      FN_PRICE := MED.PKGMEDKART.getprice(akartid);
      IF adpcid <= 0 THEN
         IF prizn = 1 THEN
            INSERT INTO tdpc
                        (dpid, kartid, fn_kol, fn_summ )
            VALUES      (adpid, akartid, akol, akol*aprice )
            RETURNING   dpcid
            INTO        id;
         END IF;
         IF prizn = 2 THEN
            INSERT INTO tdpc
                        (dpid, kartid, fn_kol, fn_summ, FK_REZERV_DOCID     )
            VALUES      (adpid, akartid, akol, akol*aprice, aReservDocID ) RETURNING DPCID INTO id;
         END IF;
         IF prizn = 3 THEN
            INSERT INTO tdpc
                        (dpid, kartid, fn_kol, fn_summ     )
            VALUES      (adpid, akartid, akol, akol*aprice ) RETURNING DPCID INTO id;
         END IF;
         IF prizn = 4 THEN
            INSERT INTO tdpc
                        (dpid, kartid, fn_trebkol, fn_summ )
            VALUES      (adpid, akartid, akol, akol*aprice ) RETURNING DPCID INTO id;
         END IF;

      ELSE
         IF prizn <> 0 THEN

            UPDATE tdpc
            SET    fn_kol = akol,
                   fn_summ = akol*aprice,
                   kartid = akartid
            WHERE  dpcid = adpcid;
         IF prizn = 1 THEN
            UPDATE tdpc
            SET    fn_kol = akol,
                   fn_summ = akol*aprice,
                   kartid = akartid
            WHERE  dpcid = adpcid;
         end if;
            id := adpcid;
            IF prizn = 2 THEN
               UPDATE tdpc
               SET    fn_kol = akol,
                      fn_summ = akol*aprice,
                      kartid = akartid
               WHERE  dpcid = adpcid;
            END IF;
            IF prizn = 3 THEN
               UPDATE tdpc
               SET    fn_kol = akol,
                      fn_summ = akol*aprice,
                      kartid = akartid
               WHERE  dpcid = adpcid;
            END IF;
         ELSE
            id := adpcid;
         END IF;
      END IF;
      RETURN id;
   END;

   FUNCTION dosetnewprice_old (
      adpid     IN   NUMBER,
      akol      IN   NUMBER,
      aprice    IN   NUMBER,
      akartid   IN   NUMBER,
      aData     IN   DATE,
      adpcid    IN   NUMBER,
      prizn     IN   NUMBER
   )
      -- adpcid<=0 -insert, >0 -update prizn=1 prih; 3 rash; 2 move =0 updatenewprice
      RETURN NUMBER
   IS
      newprice       NUMBER (15, 4);
      kolall         NUMBER;
      lastnewprice   NUMBER;
      lastdata       DATE;
      id             NUMBER;
      data1          VARCHAR2 (100);
      DATA           DATE;
   BEGIN
      data1 := TO_CHAR (aDATa, 'dd.mm.yyyy hh24:mi:ss');
      DATA := adata;
      data1 := TO_CHAR (DATA, 'dd.mm.yyyy hh24:mi:ss');
      IF adpcid <= 0 THEN
         DATA := TRUNC (DATA) + 1 - 1 / (24 * 60 * 60);
      ELSE
         DATA := adata;
      END IF;
      IF prizn = 0 THEN
         DATA := adata - 1 / (24 * 60 * 60);
      END IF;
      OPEN cKol (DATA, akartid);
      FETCH cKol INTO kolall;
      CLOSE cKol;
      OPEN clast (DATA, akartid);
      FETCH cLast INTO lastnewprice, lastdata;
      CLOSE cLast;
--      newprice := (kolall * lastnewprice + akol * aprice) / (kolall + akol);
      newprice := aprice/akol; -- ������� ������� �.�. ������� ��������� ���������� ������� ����
      if (pkgmedkart.getost(akartid,DATA,-1) + akol)=0 then newprice:=0;
--      else
--      newprice := (pkgmedkart.getostsum(akartid,DATA,-1) + akol * aprice) / (pkgmedkart.getost(akartid,DATA,-1) + akol);
      end if;
      IF newprice IS NULL THEN
         newprice := aprice;
      END IF;
      IF adpcid <= 0 THEN
         IF prizn = 1 THEN
            INSERT INTO tdpc
                        (dpid, kartid, fn_kol, fn_summ, fn_newprice )
            VALUES      (adpid, akartid, akol, aprice,  newprice    )
            RETURNING   dpcid
            INTO        id;
--      newprice := get_lastnewprice(akartid,DATA+2);
--      update tdpc set fn_newprice=newprice where dpcid=id;
         END IF;
         IF prizn = 2 THEN
            INSERT INTO tdpc
                        (dpid, kartid, fn_kol, fn_summ, fn_newprice)
            VALUES      (adpid, akartid, akol, aprice, newprice) RETURNING DPCID INTO id;
         END IF;
         IF prizn = 3 THEN
            INSERT INTO tdpc
                        (dpid, kartid, fn_kol, fn_summ, fn_newprice)
            VALUES      (adpid, akartid, akol, aprice, newprice) RETURNING DPCID INTO id;
         END IF;
         IF prizn = 4 THEN
            INSERT INTO tdpc
                        (dpid, kartid, fn_trebkol, fn_summ, fn_newprice)
            VALUES      (adpid, akartid, akol, aprice, newprice);
         END IF;

      ELSE
         IF prizn <> 0 THEN

            UPDATE tdpc
            SET    fn_kol = akol,
                   fn_summ = aprice,
                   fn_newprice = newprice,
                   kartid = akartid
            WHERE  dpcid = adpcid;
         IF prizn = 1 THEN
-- ������� ������� �.�.
           newprice:= aprice/akol; --get_lastnewprice(akartid,(adata+1/(24*60*60)),1);
            UPDATE tdpc
            SET    fn_kol = akol,
                   fn_summ = aprice,
                   fn_newprice = newprice,
                   kartid = akartid
            WHERE  dpcid = adpcid;
         end if;
            id := adpcid;
            IF prizn = 2 THEN
               UPDATE tdpc
               SET    fn_kol = akol,
                      fn_summ = aprice,
                      fn_newprice = newprice,
                      kartid = akartid
               WHERE  dpcid = adpcid;
            END IF;
            IF prizn = 3 THEN
               UPDATE tdpc
               SET    fn_kol = akol,
                      fn_summ = aprice,
                      fn_newprice = newprice,
                      kartid = akartid
               WHERE  dpcid = adpcid;
            END IF;
         ELSE
 /*           UPDATE tdpc
            SET    fn_newprice = newprice
            WHERE  dpcid = adpcid;*/
            id := adpcid;
         END IF;
      END IF;
      RETURN id;
   END;

function getrashdata(adata in date) return date
is
	cursor c
	is
		select max(fd_data)
		from tdocs
		where trunc(fd_data) = trunc(adata);

	d date;
begin
    open c;
    fetch c into d;
    close c;
    return (d + 3 / (24 * 60 * 60));
end;

FUNCTION checkinkart (
      akartid   IN   NUMBER,
      adpid     IN   NUMBER
   )
      RETURN NUMBER
   IS
      CURSOR cRes
      IS
         SELECT kartid
         FROM   tdpc
         WHERE  dpid = adpid
/*ADVICE(1234): Cursor reference to a external variable (use a parameter) [209] */

AND             kartid = akartid
/*ADVICE(1237): Cursor reference to a external variable (use a parameter) [209] */
                                ;

      res   NUMBER;
   BEGIN
      OPEN cres;
      FETCH cres INTO res;
      CLOSE cres;
      IF res IS NULL THEN
         RETURN 0;
      ELSE
         RETURN res;
      END IF;
/*ADVICE(1250): Last statement in function must be a RETURN [510] */

   END;
/*ADVICE(1253): Function with more than one RETURN statement in the executable section [512] */


   /*PROCEDURE set_docid (
      apacid   IN   NUMBER,
      adocid   IN   NUMBER
   )
   IS

\*    CURSOR cPacid
    IS
      SELECT id
        FROM tnazmedlech, tnazmed
       WHERE tnazmedlech.naz_id = tnazmed.fk_id
         AND tnazmed.fk_pacid = aPacid;
  BEGIN
    IF adocid = 0 THEN
      FOR c_rec IN cPacid LOOP
        UPDATE tnazmedlech
           SET docid = NULL
         WHERE id = c_rec.id;
      END LOOP;
    ELSE
      FOR c_rec IN cPacid LOOP
        UPDATE tnazmedlech
           SET docid = adocid
         WHERE id = c_rec.id;
      END LOOP;
    END IF; *\
      CURSOR cPacid
\*ADVICE(1283): Unreferenced local procedure or function [557] *\

      IS
         SELECT naz_id
         FROM   tnazmedlech, tnazmed
         WHERE  tnazmedlech.naz_id = tnazmed.fk_id
AND             tnazmed.fk_pacid = aPacid
\*ADVICE(1290): Cursor reference to a external variable (use a parameter) [209] *\

\*ADVICE(1292): Elements in the SELECT list (either columns or expressions) are not qualified by a table/view name [403] *\
                                         ;
   BEGIN
      IF adocid = 0 THEN

--      FOR c_rec IN cPacid LOOP
         UPDATE tnazmedlech
         SET    docid = NULL
         WHERE  id = aPacid; --c_rec.fk_id;

--      END LOOP;
      ELSE

--      FOR c_rec IN cPacid LOOP
         UPDATE tnazmedlech
         SET    docid = adocid
         WHERE  id = aPacid; --c_rec.fk_id;

--      END LOOP;
      END IF;
   END;*/

   /*PROCEDURE set_begindocid (
      adpid      IN   NUMBER,
      amoid      IN   NUMBER,
      afp_dezh   IN   NUMBER := 0
   )
   IS
      CURSOR cNazId
      IS
         SELECT naz_id
         FROM   tnazmed nm, tnazmedlech nml, tkarta k
         WHERE  nm.fk_id = nml.naz_id
AND             nm.fl_sam = 0
AND             fp_status <> 23
 AND             nm.fk_moid = amoid

AND             k.fk_id = nm.fk_pacid
and fp_tek_coc<>3
AND             fp_dezh = 0
AND             k.fl_vyb = 0
AND             docid IS NULL

         UNION ALL
         SELECT naz_id
         FROM   tnazmed nm, tnazmedlech nml, tambulance k
         WHERE  nm.fk_id = nml.naz_id
AND             nm.fl_sam = 0
AND             nm.fk_moid = amoid
\*ADVICE(1342): Cursor reference to a external variable (use a parameter) [209] *\

AND             k.fk_id = nm.fk_pacid
AND             fp_status <> 23
AND             fp_dezh = 0
AND             k.fl_vyb = 0
AND             docid IS NULL
\*ADVICE(1349): Elements in the SELECT list (either columns or expressions) are not qualified by a table/view name [403] *\
                             ;

      CURSOR cNazIdvoz
      IS
         SELECT naz_id
         FROM   tnazmed nm, tnazmedlech nml, tkarta k
         WHERE  nm.fk_id = nml.naz_id
AND             nm.fl_sam = 0
AND             nm.fk_moid = amoid
\*ADVICE(1359): Cursor reference to a external variable (use a parameter) [209] *\

AND             k.fk_id = nm.fk_pacid
AND             fp_dezh = 0
AND             k.fl_vyb = 1
AND             docvozid IS NULL
\*ADVICE(1365): Elements in the SELECT list (either columns or expressions) are not qualified by a table/view name [403] *\
                                ;

      CURSOR cNazIdVid
      IS
         SELECT id
         FROM   tnazmed nm, tnazmedlech nml, tkarta k
         WHERE  nm.fk_id = nml.naz_id
AND             nm.fl_sam = 0
AND             nm.fk_moid = amoid
\*ADVICE(1375): Cursor reference to a external variable (use a parameter) [209] *\

AND             k.fk_id = nm.fk_pacid
AND             fp_dezh = 1
AND             k.fl_vyb = 0
AND             docvozid IS NULL
\*ADVICE(1381): Elements in the SELECT list (either columns or expressions) are not qualified by a table/view name [403] *\

         UNION ALL
         SELECT id
         FROM   tnazmed nm, tnazmedlech nml, tambulance k
         WHERE  nm.fk_id = nml.naz_id
AND             nm.fl_sam = 0
AND             nm.fk_moid = amoid
\*ADVICE(1389): Cursor reference to a external variable (use a parameter) [209] *\

AND             k.fk_id = nm.fk_pacid
AND             fp_dezh = 1
AND             k.fl_vyb = 0
AND             docvozid IS NULL
\*ADVICE(1395): Elements in the SELECT list (either columns or expressions) are not qualified by a table/view name [403] *\
                                  ;

      CURSOR d
      IS
         SELECT fd_data
         FROM   tdocs
         WHERE  dpid = adpid
\*ADVICE(1403): Cursor reference to a external variable (use a parameter) [209] *\
                            ;


\*    CURSOR cNazIdVidrash(data in date)
    IS
update \*+rule tnazmedlechvid set docid=6122
\*where id in (
select \*+rule*\
\*ADVICE(1412): Nested comments [570] *\
                 --id \*from tnazmedlechvid
\*ADVICE(1414): Nested comments [570] *\

\*where fd_vid<=data
and moid=amoid
and docid is null
)
\*      SELECT nazid
        FROM tnazmed nm, tnazmedlechvid nml, tkarta k
       WHERE nm.fk_id = nml.nazid
         AND nm.fl_sam = 0
         AND nm.fk_moid = amoid
         AND k.fk_id = nm.fk_pacid
         AND fp_dezh = 0
         AND k.fl_vyb = 0
         AND docid IS NULL
         union all
      SELECT nazid
        FROM tnazmed nm, tnazmedlechvid nml, tambulance k
       WHERE nm.fk_id = nml.nazid
         AND nm.fl_sam = 0
         AND nm.fk_moid = amoid
         AND k.fk_id = nm.fk_pacid
         AND fp_dezh = 0
         AND k.fl_vyb = 0
         AND docid IS NULL;*\
\*ADVICE(1439): Nested comments [570] *\

      dat   DATE;
   BEGIN
      OPEN d;
      FETCH d INTO dat;
      CLOSE d;
      IF afp_dezh = 0 THEN
         FOR c_recnazid IN cnazid LOOP
            UPDATE tnazmedlech
            SET    docid = adpid,
                   docplanid = adpid
            WHERE  naz_id = c_recnazid.naz_id
            and docid is null;
         END LOOP;
      END IF;
      IF afp_dezh = 1 THEN
         FOR c_recnazid IN cnazidvid LOOP
            UPDATE tnazmedlech
            SET    docvozid = adpid
            WHERE  id = c_recnazid.id;
         END LOOP;
      END IF;
      IF afp_dezh = 2 THEN
         UPDATE \*+rule*\
                tnazmedlechvid
         SET    docid = adpid
         WHERE  id IN (SELECT \*+rule*\
                              id
                       FROM   tnazmedlechvid
                       WHERE  fd_vid <= TRUNC (dat + 1) - 1 / (24 * 60 * 60)
AND                           moid = amoid
AND                           docid IS NULL);
      END IF;
      IF afp_dezh = 3 THEN
         FOR c_recnazid IN cnazidvoz LOOP
            UPDATE tnazmedlech
            SET    docvozid = adpid
            WHERE  naz_id = c_recnazid.naz_id;
         END LOOP;
      END IF;
   END;*/

  function get_lastnewprice_old(aKartID in number, aData in date, aMOID in number) return number
  IS
    --������ ��������� � ������ ���
    --������ ������� ���
  	cursor cDatep(pdata IN DATE) is
  		select max(fd_data)
  		from tdocs, tdpc
  			WHERE tdocs.fp_vid in (1,3)
        AND tdocs.fp_vidmove IN (1,5,6,7,8,9)
        AND tdocs.fl_edit = 0
  			and tdocs.motoid = amoid
  			and fd_data < pdata
  			and tdpc.dpid = tdocs.dpid
  			and kartid = akartid;

  	cursor cDater(pdata IN DATE) is
  		select max(fd_data)
  		from tdocs, tdpc
      WHERE  tdocs.fp_vid = 3
        AND tdocs.fp_vidmove IN (4,5,6,7,8)
        AND tdocs.fl_edit = 0
  			and tdocs.mofromid = amoid
  			and fd_data < pdata
  			and tdpc.dpid = tdocs.dpid
  			and kartid = akartid;

  	cursor cKolp (adata in date) is
  		SELECT nvl(sum(fn_kol), 0) as fn_kol
  		FROM tdocs, tdpc
  		where tdocs.fd_data between to_date('01.01.2000', 'dd.mm.yyyy') and adata
  			and tdpc.dpid = tdocs.dpid
  			and tdocs.fp_vid in (1,3)
        AND tdocs.fp_vidmove IN (1,5,6,7,8,9)
        AND tdocs.fl_edit = 0
  			and tdocs.motoid = amoid
  			and tdpc.kartid = akartid;

  	cursor cSummp(adata in date) is
--������� ������� �.�. 14.05.2007
--  		select nvl(sum(fn_summ), 0) as fn_kol
  		select nvl(sum(tdpc.fn_kol*tdpc.fn_newprice), 0) as fn_kol
  		from tdocs, tdpc
  		where tdocs.fd_data between to_date('01.01.2000', 'dd.mm.yyyy') and adata
  			and tdpc.dpid = tdocs.dpid
  			and tdocs.fp_vid in (1,3)
        AND tdocs.fp_vidmove IN (1,5,6,7,8,9)
        AND tdocs.fl_edit = 0
  			and tdocs.motoid = amoid
  			and tdpc.kartid = akartid;

  	cursor cKolr (adata in date) is
  		select nvl(sum(fn_kol), 0) as fn_kol
  		from tdocs, tdpc
  		where tdocs.fd_data between to_date('01.01.2000', 'dd.mm.yyyy') and  adata
  			and tdpc.dpid = tdocs.dpid
  			and tdocs.mofromid = amoid
        AND tdocs.fp_vid = 3
        AND tdocs.fp_vidmove IN (4,5,6,7,8)
        AND tdocs.fl_edit = 0
  			and tdpc.kartid = akartid;

  	cursor cSummr(adata in date) is
--������� ������� �.�. 14.05.2007
--  		select nvl(sum(fn_summ), 0) as fn_kol
  		select nvl(sum(tdpc.fn_kol*tdpc.fn_newprice), 0) as fn_kol
  		from tdocs, tdpc
  		where tdocs.fd_data between to_date('01.01.2000', 'dd.mm.yyyy') and adata
  			and tdpc.dpid = tdocs.dpid
        AND tdocs.fp_vid = 3
        AND tdocs.fp_vidmove IN (4,5,6,7,8)
        AND tdocs.fl_edit = 0
  			and tdocs.mofromid = amoid
  			and tdpc.kartid = akartid;

  	summp number;
  	summr number;
  	kolp number;
  	kolr number;
  	dP date;
  	dR date;
  	nRet number;
  begin
  	open cdatep(aData);
  	fetch cdatep into dP;
  	close cdatep;

  	open cdater(aData);
  	fetch cdater into dr;
  	close cdater;

/*  	if dP < dR THEN
  		dP := dR + 1 / (24 * 60 * 60);
  	end if;*/

  	open csummp(dP);
  	fetch csummp into summp;
  	close csummp;

  	open ckolp(dP);
  	fetch ckolp into kolp;
  	close ckolp;

  	open csummr(dR);
  	fetch csummr into summr;
  	close csummr;

  	open ckolr(dR);
  	fetch ckolr into kolr;
  	close ckolr;

  	if(nvl(kolp, 0) - nvl(kolr, 0)) = 0 then
  		return 0;
  	end if;

  	nRet := (nvl(summp, 0) - nvl(summr, 0)) / (nvl(kolp, 0) - nvl(kolr, 0));
  	return nRet;
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

  FC_CURMONTH_NUM := TO_CHAR(aDATE_SPIS,'MM'); -- ����� �������� ������
  
  -- ���� � �������� aPacID ������ ������������ �����, �� SPISANIEVID = 6, ����� �������, ��� aPacID - ��� TKARTA.FK_ID (SPISANIEVID = 3)
  SELECT nvl(MAX(6),3) INTO FN_SPISANIE_VID FROM ASU.TAMBTALON WHERE FK_ID = aPacID;
  
  -- ���� �������� �� ��������
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
   and TO_CHAR(d.FD_DATA,'MM') = FC_CURMONTH_NUM; -- ���� ��� ���������� �������� �� �������   
   
     IF FC_CURMONTH_NUM = '01' THEN FC_CURMONTH_NAME := '������'; 
  ELSIF FC_CURMONTH_NUM = '02' THEN FC_CURMONTH_NAME := '�������'; 
  ELSIF FC_CURMONTH_NUM = '03' THEN FC_CURMONTH_NAME := '����'; 
  ELSIF FC_CURMONTH_NUM = '04' THEN FC_CURMONTH_NAME := '������'; 
  ELSIF FC_CURMONTH_NUM = '05' THEN FC_CURMONTH_NAME := '���'; 
  ELSIF FC_CURMONTH_NUM = '06' THEN FC_CURMONTH_NAME := '����'; 
  ELSIF FC_CURMONTH_NUM = '07' THEN FC_CURMONTH_NAME := '����'; 
  ELSIF FC_CURMONTH_NUM = '08' THEN FC_CURMONTH_NAME := '������'; 
  ELSIF FC_CURMONTH_NUM = '09' THEN FC_CURMONTH_NAME := '��������'; 
  ELSIF FC_CURMONTH_NUM = '10' THEN FC_CURMONTH_NAME := '�������'; 
  ELSIF FC_CURMONTH_NUM = '11' THEN FC_CURMONTH_NAME := '������'; 
  ELSIF FC_CURMONTH_NUM = '12' THEN FC_CURMONTH_NAME := '�������';
  end if;

  -- ��������� ��������� ��������
  if NVL(FK_DOC_ID, -1) > 0 then
     update med.tdocs set fd_invoice = sysdate,
                          fl_edit = 1
       where dpid = FK_DOC_ID;
  else
    IF FN_SPISANIE_VID = 3 THEN
      IF aFC_PAC_FIO IS NULL THEN
        sFC_COMMENT :=  '�������� �� �������� '||asu.get_pacfio( aPacID )||' '||FC_CURMONTH_NAME||' '||aFC_COMMENT;
      ELSE
        sFC_COMMENT :=  '�������� �� �������� '||aFC_PAC_FIO||' '||FC_CURMONTH_NAME||' '||aFC_COMMENT;
      END IF;
    ELSIF FN_SPISANIE_VID = 6 THEN
      SELECT asu.get_pacfio(t.fk_ambid) INTO FC_AMBFIO FROM asu.tambtalon t WHERE t.fk_id = aPacID;
      IF aFC_PAC_FIO IS NULL THEN
        sFC_COMMENT :=  '�������� �� ���. ����� '||FC_AMBFIO||' '||FC_CURMONTH_NAME||' '||aFC_COMMENT;
      ELSE
        sFC_COMMENT :=  '�������� �� ���. ����� '||aFC_PAC_FIO||' '||FC_CURMONTH_NAME||' '||aFC_COMMENT;
      END IF;
    END IF;

    insert into med.tdocs
             (fp_vid, fp_vidmove, fn_spisanievid,  fd_data,    fd_invoice, MOOWNERID,   mofromid,    fk_mogroupid_from, FK_MOGROUPID,   fk_mogroupid_to, fl_edit, FC_COMMENT)
      values (3,      8,          FN_SPISANIE_VID, aDATE_SPIS, aDATE_SPIS, FK_CURMO_ID, FK_CURMO_ID, FK_CURMO_GROUP,    FK_CURMO_GROUP, aPacID,          0,       sFC_COMMENT)
      returning dpid into FK_DOC_ID;

      update med.tdocs set FC_DOC = TO_CHAR(FK_DOC_ID) where dpid = FK_DOC_ID;
  end if;
  -- �������� � ������ ����������
  insert into med.tdpc (dpid,      kartid,  fn_kol,  FD_DATE_SPIS, FK_NAZMEDLECH_ID, FK_NAZMEDLECHVID,  FK_RESLECH_ID , FK_NAZMEDID, FK_NAZMARK_ID,  FK_NAZVRACHID  )
                values (FK_DOC_ID, aKartID, aFN_KOL, aDATE_SPIS,   aNazMedLechID,    aFK_nazmedlechvid, aFK_RESLECH_ID, aNazMedID  , aFK_NAZMARK_ID, aFK_NAZVRACH_ID) returning DPCID INTO RES_FK_DPCID;

  -- ��������� ��������� ���������
  update med.tdocs set fn_price = med.pkg_prihrash.getsumdoc(FK_DOC_ID,0) where dpid = FK_DOC_ID;
  
  -- ���� ������������� ���� fl_edit, ���� ������������� �������
  update med.tdocs
     set fl_edit = 0
   where dpid = FK_DOC_ID;      

  RETURN RES_FK_DPCID;
END;

    procedure DoSetUchgrInKartsByDoc ( adpid in number )
    is
      pragma autonomous_transaction;
    begin      
      if ( ASU.PKG_SMINI.READSTRING('MEDICA.EXE', 'FUNC_USE_MEDUCHGRP_CH', '0') = '1' ) then
        -- ������������� ��.������ ������������ �� ���� ��������� �������
        update med.tkart k
           set k.uchgrid = 
                ( select med.pkgtmedic.gt_uch_group ( k.medicid, m.uchgrid, d.fd_data )
                    from ( select min ( dpc1.dpid ) as dpid,
                                  dpc1.kartid
                             from med.tdpc dpc1,                    
                                  med.tdocs d1
                            where dpc1.dpid = d1.dpid
                              and d1.fp_vid = 1
                            group by dpc1.kartid ) t,
                         med.tdocs d,
                         med.tmedic m                 
                   where t.kartid = k.kartid
                     and t.dpid = d.dpid
                     and m.medicid= k.medicid
                )
         where exists ( select 1 
                          from med.tdpc dpc
                         where dpc.dpid = adpid
                           and dpc.Kartid = k.kartid );      
      else
        update med.tkart k
           set k.uchgrid = null
         where k.uchgrid is not null 
           and exists ( select 1 
                          from med.tdpc dpc
                         where dpc.dpid = adpid
                           and dpc.Kartid = k.kartid );            
      end if;                           
    
      commit;
    end;         
    
  /* ��������� ���� �������������� �� �������� ����������, ������ �� ��������� �������� */ 
  FUNCTION DO_AUTOFILL_PLAN (        
--    PDPID IN NUMBER, 
    PFK_TREBID IN NUMBER,
    PFK_FINSOURCE_ID IN NUMBER DEFAULT -1,
    PUSECOMPLEXAUTOFILL IN NUMBER DEFAULT 0,
    PFC_QUOTA_CODE IN VARCHAR2 DEFAULT NULL/*,
    PAUTOFILLPLAN OUT MED.O_RASH_AUTOFILLPLAN_TABLE  */
  ) RETURN MED.O_RASH_AUTOFILLPLAN_TABLE
  is       
    vAutoFillPlan_Tbl MED.O_RASH_AUTOFILLPLAN_TABLE := MED.O_RASH_AUTOFILLPLAN_TABLE();     
      
    cursor curZatreb is
    select dpc.FK_ID as FK_TREB_DPCID,
           dpc.FK_MEDICID,
           dpc.FN_KOL          
      from med.TTREB_DPC dpc
     where dpc.FK_TREBID = pFK_TREBID
     order by dpc.FK_MEDICID;    
   
    type Zatreb_Tbl is table of curZatreb%rowtype
      index by binary_integer;    
    
    vZatreb_Tbl Zatreb_Tbl;    
        
    cursor curOst is    -- ������� 
    select ost.*
      from ( select s.Medicid  -- ����������� �� ( ��� pUseComplexAutoFill = 0 - ��� �� ��, ��� pUseComplexAutoFill = 1 - �� �� ������������ �������  )
               from ( select dp.fk_medicid  as MEDICID                    
                         from med.ttreb_dpc dp 
                        where dp.FK_TREBID = pFK_TREBID ) tm                                          
          inner join ( select m.MEDICID, 
                              trim(upper(m.FC_INTERNATIONAL_NAME)) as FC_INTERNATIONAL_NAME,
                              m.FK_FPACKID,
                              trim(upper(ei.FC_NAME)) FC_FPACK,
                              m.FN_MASS,
                              m.FK_MASSUNITS,
                              trim(upper(mu.FC_SHORTNAME)) FC_MASSUNITS
                         from med.tmedic m                 
                         left join med.TEI ei
                           on m.FK_FPACKID = ei.EIID
                         left join med.TMASSUNITS mu
                           on m.FK_MASSUNITS = mu.FK_ID ) m              
             on tm.MEDICID = m.MEDICID                       
          inner join ( select m.MEDICID, 
                              trim(upper(m.FC_INTERNATIONAL_NAME)) as FC_INTERNATIONAL_NAME,
                              m.FK_FPACKID,
                              trim(upper(ei.FC_NAME)) FC_FPACK,
                              m.FN_MASS,
                              m.FK_MASSUNITS,
                              trim(upper(mu.FC_SHORTNAME)) FC_MASSUNITS
                         from med.tmedic m                 
                         left join med.TEI ei
                           on m.FK_FPACKID = ei.EIID
                         left join med.TMASSUNITS mu
                           on m.FK_MASSUNITS = mu.FK_ID ) s
             on ( m.MEDICID = s.MEDICID ) -- ��� ���� � ��� �� ����������
             or ( pUseComplexAutoFill = 1 and  -- ����������� ������
                   -- �� ���
                  m.FC_INTERNATIONAL_NAME = s.FC_INTERNATIONAL_NAME  
                   -- �� ���.��. ���.
                  and ( m.FK_FPACKID = s.FK_FPACKID or  -- �� ����
                        m.FC_FPACK = s.FC_FPACK ) -- �� ������������ /* �������, �.�. � ����������� ��������� ��. ��� � ����� ���������, �� � ������� ������ */
                   -- �� ����� ��
                  and m.FN_MASS = s.FN_MASS
                   -- �� ��. ��� ��
                  and ( m.FK_MASSUNITS = s.FK_MASSUNITS or  -- �� ����
                        m.FC_MASSUNITS = s.FC_MASSUNITS ) -- �� ������������ /* �������, �.�. � ����������� ��������� ��. ��� � ����� ���������, �� � ������� ������ */
                    ) 
              group by s.Medicid ) m              
     inner join med.VMEDKART_KOLOST ost
        on  m.MEDICID = ost.MEDICID
     where ost.FN_KOLOST > 0
       and ost.FN_OST_TYPE = 0  -- ������ �� ������
       and coalesce(ost.FL_BRAK,0) = 0 -- ������ �� ����   
       and trunc (coalesce( ost.FD_GODEN, sysdate )) >= trunc(sysdate)
       and ((ost.FK_FINSOURCE_ID = pFK_FINSOURCE_ID) or ( pFK_FINSOURCE_ID = -1))
       and (SUBSTR(coalesce(ost.FC_QUOTA_CODE,'00000000'),1,2) in ('00', SUBSTR(coalesce( pFC_QUOTA_CODE, ost.FC_QUOTA_CODE,'00000000'),1,2)))
     order by ost.FD_GODEN asc, ost.FN_PARTY_NUM asc ;  -- ������ �� ����������� ����� ��������         
       
    type OstTbl is table of curOst%rowtype; 
    vOstTbl OstTbl;    

  begin    
    open curZatreb; 
      fetch curZatreb bulk collect into vZatreb_Tbl;
    close curZatreb;                                                              

    if (vZatreb_Tbl.count = 0 ) then
      return vAutoFillPlan_Tbl;
    end if;
    
    open curOst; 
    fetch curOst bulk collect into vOstTbl;
    close curOst; 
    
    if (vOstTbl.count > 0) then -- ���-�� �� �������� ����  
    for i in vZatreb_Tbl.First..vZatreb_Tbl.last 
    loop   
      for j in vOstTbl.First..vOstTbl.Last
      loop        
        if (vOstTbl(j).FN_KOLOST > 0) and (vZatreb_Tbl(i).FN_KOL > 0) and
           (med.PKGTMEDIC.ISMEDICSEQUAL( vOstTbl(j).MEDICID, vZatreb_Tbl(i).FK_MEDICID, pUseComplexAutoFill ) = 1)  then 
        begin -- ����� �������� ����������                                                      
          
          vAutoFillPlan_Tbl.Extend;                                       
          vAutoFillPlan_Tbl( vAutoFillPlan_Tbl.Last ) := MED.O_RASH_AUTOFILLPLAN( vZatreb_Tbl(i).FK_TREB_DPCID, vOstTbl(j).KARTID, null );
          
          if (vZatreb_Tbl(i).FN_KOL - vOstTbl(j).FN_KOLOST) > 0 then -- �� ������� �� ������ ������, ��� ���������          
            vAutoFillPlan_Tbl( vAutoFillPlan_Tbl.Last ).FN_KOL := vOstTbl(j).FN_KOLOST;
            vZatreb_Tbl(i).FN_KOL := vZatreb_Tbl(i).FN_KOL - vAutoFillPlan_Tbl( vAutoFillPlan_Tbl.Last ).FN_KOL; 
            vOstTbl(j).FN_KOLOST := 0;
          else -- �� ������� �� ������ ����������                                                                                      
            vAutoFillPlan_Tbl( vAutoFillPlan_Tbl.Last ).FN_KOL := vZatreb_Tbl(i).FN_KOL;
            vZatreb_Tbl(i).FN_KOL := 0;
            vOstTbl(j).FN_KOLOST := vOstTbl(j).FN_KOLOST - vAutoFillPlan_Tbl( vAutoFillPlan_Tbl.Last ).FN_KOL;                            
          end if;                                                                
          exit when (vZatreb_Tbl(i).FN_KOL <= 0 );
        end;
        end if;          
      end loop;              
    end loop;    
    end if; 
    --    pAUTOFILLPLAN := vAutoFillPlan_Tbl; -- ���� ��������������         
    return vAutoFillPlan_Tbl;                                       
  end;    
  
  /* ��������� �������������� ������� �� ���������� �� ����� �������������� */
  PROCEDURE DO_AUTOFILL ( PDPID IN NUMBER, PAUTOFILLPLAN MED.O_RASH_AUTOFILLPLAN_TABLE ) IS
        
    cursor curAutoFill is
    select k.KARTID,
           k.MEDICID, -- ����������� ��
           k.FN_PRICE,
           sum (t.FN_KOL) FN_KOL         
      from table ( pAutoFillPlan ) t         
     inner join med.TKART k
        on t.FK_KARTID = k.KARTID 
     group by k.KARTID, k.MEDICID, k.FN_PRICE ;  
     
    type ZatrebID_tbl is table of pls_integer
      index by binary_integer;
      
    vZatrebID_tbl ZatrebID_tbl;     

    vDPCID pls_integer := 0;
    vFK_TREB_DPCID pls_integer := 0;
    vFN_KOL med.TTREB_DPC.FN_KOL%type := 0;  
    vFK_TREBID pls_integer := 0;
    
    -- ���������, �������� �� ������� ���������� ��������������
    function IsTrebDpcInitial ( pId in PLS_INTEGER ) return boolean is      
      result boolean;
    begin
      result := false;
      for i in vZatrebID_tbl.first..vZatrebID_tbl.last        
      loop
        result := (vZatrebID_tbl(i) = pId);
        exit when (result);
      end loop;      
      return result;      
    end;  
  begin
    if pAutoFillPlan is null then
--      DBMS_OUTPUT.put_line ( '�� ����� ���� ����������' );      
      return;
    end if;        
    -- �������� �� ����������
    select coalesce ( min (tr.FK_ID), 0 )
      into vFK_TREBID
      from med.TTREB tr
     where tr.FK_DPID = pDPID;
    
    if vFK_TREBID = 0 then
--      DBMS_OUTPUT.put_line ( '�� ������� ����������!' );
      return;
    end if;    
    -- ��������� �������� �������� ������� ����������
    select t.FK_ID
     bulk collect into vZatrebID_tbl
      from med.TTREB_DPC t   
     where t.FK_TREBID = vFK_TREBID;    

    for rec in curAutoFill
    loop    
      vDPCID := med.PKG_PRIHRASH.doSetPrihRash ( pDPID, rec.FN_KOL, rec.FN_PRICE, rec.KARTID, 0, 3 ); -- ��������� ������� �������
        
      -- ���� ����� ��� ���������( � �.�. � �����������) ������� ����������
      begin
        select t.FK_ID, t.FN_KOL
          into vFK_TREB_DPCID, vFN_KOL
          from med.TTREB_DPC t
         where t.FK_ID = ( select coalesce(  min ( dpc.FK_ID ), -1 )
                             from med.TTREB_DPC dpc
                            where dpc.FK_TREBID = vFK_TREBID
                              and dpc.FK_MEDICID = rec.MEDICID );
      exception
        when others then          
          vFK_TREB_DPCID := -1; -- ����� ������� ������� ����������
          vFN_KOL := 0; 
      end;      
      
      -- ���� ��� �������� ������� ����������, �� �� ���������� ������������� ���-��
      if IsTrebDpcInitial(vFK_TREB_DPCID) then    
        vFK_TREB_DPCID := med.PKG_TREB.DO_SET_TREB_DPC ( vFK_TREB_DPCID, vFK_TREBID, rec.MEDICID, vFN_KOL );        
      else        
        vFK_TREB_DPCID := med.PKG_TREB.DO_SET_TREB_DPC ( vFK_TREB_DPCID, vFK_TREBID, rec.MEDICID, rec.FN_KOL + vFN_KOL );  
      end if;            

      -- ����� ������� ���������� �  ������� �������
      update med.TDPC t
         set t.FK_TREBDPC = vFK_TREB_DPCID
       where t.DPCID = vDPCID;      
    end loop;            
  end;  
   
END;
-- End of DDL Script for Package MED.PKG_PRIHRASH
/
