-- Start of DDL Script for Package Body MED.PKGMEDKART
-- Generated 30-авг-2010 16:51:26 from MED@H100609

CREATE OR REPLACE 
PACKAGE       med.pkgmedkart IS

-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  ------------------------------------------
-- Sam       18-01-2001

type kart_t is record (
	kartid         tkart.kartid%type,
	moid           tkart.moid%type,
	fl_del         tkart.fl_del%type,
	medicid        tkart.medicid%type,
	fc_name        tkart.fc_name%type,
	fc_serial      tkart.fc_serial%type,
	fd_goden       tkart.fd_goden%type,
	fn_prodcertid  tkart.fn_prodcertid%type,
	fc_certificate tkart.fc_certificate%type,
	fc_producer    tkart.fc_producer%type,
	fn_party_num   tkart.fn_party_num%type,
	fn_price       tkart.fn_price%type,
	fn_kol         tkart.fn_kol%type

);

procedure GetKart(kart in out kart_t);
procedure SetKart(kart in kart_t);

/**/
CURSOR cGetByID(pkartid IN NUMBER)
IS
	SELECT fc_name, medicid, moid, fd_goden, fc_serial, fn_prodcertid
	FROM tkart
	WHERE kartid = pkartid;

/**/
FUNCTION GetmedicByID(pkartid IN NUMBER) RETURN number;

/**/
PROCEDURE GetByID (
	pfc_name  OUT VARCHAR2,
	pmedicid  OUT NUMBER,
	pmoid     OUT NUMBER,
	fd_goden  OUT DATE,
	fc_serial OUT VARCHAR2,
	strProd   out varchar2,
	strCert   out varchar2,
	pkartid   IN  NUMBER
);

/**/

FUNCTION DoSet (
      pfc_name     IN   VARCHAR2,
      pmedicid     IN   NUMBER,
      pmoid        IN   NUMBER,
      pfd_goden    IN   DATE,
      pfc_serial   IN   VARCHAR2,
      pkartid      IN   NUMBER DEFAULT -1,
	  ProdCertID   IN   NUMBER,
      ppartynum    IN   VARCHAR2,
      pprice       IN   NUMBER,
      pkol         IN   NUMBER,
      puchgrid     in   number
) RETURN NUMBER;

/**/
PROCEDURE DoDel(pkartid IN NUMBER);

/**/
FUNCTION GetNameByID(pkartid IN NUMBER) RETURN VARCHAR2;

/**/
FUNCTION GetSerialByID(pkartid IN NUMBER) RETURN VARCHAR2;

/**/
FUNCTION GetEdIzm(pkartid IN NUMBER) RETURN NUMBER;

/**/
FUNCTION GetPrice(pkartid IN tkart.kartid%TYPE) RETURN number;

/**/
FUNCTION GetPrihKol (
	pkartid IN tkart.kartid%TYPE,
	pmoid   IN tmo.moid%TYPE,
	pfd1    IN DATE,
	pfd2    IN DATE
) RETURN NUMBER;

/**/
FUNCTION GetPrihSum (
	pkartid IN tkart.kartid%TYPE,
	pmoid   IN tmo.moid%TYPE,
	pfd1    IN DATE,
	pfd2    IN DATE
) RETURN NUMBER;

/**/
FUNCTION GetRashKol (
	pkartid IN tkart.kartid%TYPE,
	pmoid   IN tmo.moid%TYPE,
	pfd1    IN DATE,
	pfd2    IN DATE
) RETURN NUMBER;

/**/
FUNCTION GetRashSum (
	pkartid IN tkart.kartid%TYPE,
	pmoid   IN tmo.moid%TYPE,
	pfd1    IN DATE,
	pfd2    IN DATE
) RETURN NUMBER;

   FUNCTION GetOst (
      pkartid    IN   NUMBER,
      pFD_DATE   IN   DATE,
      pMOID      IN   NUMBER DEFAULT -1
   ) RETURN NUMBER;

   FUNCTION GetOstsum (
      pkartid    IN   NUMBER,
      pFD_DATE   IN   DATE,
      pMOID      IN   NUMBER
   ) RETURN NUMBER;

/**/
FUNCTION GetOstMedic(pmedicid IN NUMBER, pFD_DATE IN DATE, pMOID IN NUMBER) RETURN NUMBER;

FUNCTION GET_KARTSERIALLST( PMEDICID   IN   NUMBER,
                            PFD_DATE   IN   DATE,
                            PMOID      IN   NUMBER ) RETURN VARCHAR2;

FUNCTION EXIST_KART( pMEDICID   IN   NUMBER,
                     pFC_NAME   IN   VARCHAR2,
                     pFC_SERIAL IN   VARCHAR2) RETURN INTEGER;
/*Если запись есть с такими полями, то ф-ия вернет значение kartid, иначе
 если запись не найденавернет 0*/

FUNCTION GetFC_NAME_LATByID (pkartid   IN   NUMBER )  RETURN VARCHAR2;
--ВЕРНУТЬ значение поля TMEDIC.FC_NAME_LAT

END;
/


CREATE OR REPLACE 
PACKAGE BODY       med.pkgmedkart IS

-- medicid HISTORY
-- Person      Date    Comments
-- ---------   ------  ------------------------------------------
-- Sam       18-01-2001


procedure GetKart(kart in out kart_t)
is
	cursor cCursor(nKartID in tkart.kartid%type)
	is
		select
			moid,
			fl_del,
			medicid,
			fc_name,
			fc_serial,
			fd_goden,
			fn_prodcertid,
			fc_certificate,
			fc_producer,
            fn_party_num,
            fn_price,
            fn_kol
		from tkart
		where kartid = nKartID;
begin
	open cCursor(kart.kartid);
	fetch cCursor into
		kart.moid,
		kart.fl_del,
		kart.medicid,
		kart.fc_name,
		kart.fc_serial,
		kart.fd_goden,
		kart.fn_prodcertid,
		kart.fc_certificate,
		kart.fc_producer,
        kart.fn_party_num,
        kart.fn_price,
        kart.fn_kol;
	close cCursor;
end;

/**/
procedure SetKart(kart in kart_t)
is
begin
	update tkart
	set
		moid           = kart.moid,
		fl_del         = kart.fl_del,
		medicid        = kart.medicid,
		fc_name        = kart.fc_name,
		fc_serial      = kart.fc_serial,
		fd_goden       = kart.fd_goden,
		fn_prodcertid  = kart.fn_prodcertid,
		fc_certificate = kart.fc_certificate,
		fc_producer    = kart.fc_producer,
		fn_party_num   = kart.fn_party_num,
		fn_price       = kart.fn_price,
		fn_kol         = kart.fn_kol
	where
		kartid = kart.kartid;
end;

/*
 */
PROCEDURE GetByID (
      pfc_name    OUT      VARCHAR2,
      pmedicid    OUT      NUMBER,
      pmoid       OUT      NUMBER,
      fd_goden    OUT      DATE,
      fc_serial   OUT      VARCHAR2,
	  strProd     out varchar2,
	  strCert     out varchar2,
      pkartid     IN       NUMBER
   )
   IS
   BEGIN
      FOR i IN cGetByID (pkartid) LOOP
         pFC_NAME := i.fc_name;
         pmedicid := i.medicid;
         pmoid := i.moid;
         fd_goden := i.fd_goden;
         fc_serial := i.fc_serial;
		 pkg_prodcert.GetProdCert(i.fn_prodcertid, strProd, strCert);
      END LOOP;
   END;


---------------------------------------------------------------------------------------------------------------------------------------------------------------
   FUNCTION DoSet (
      pfc_name     IN   VARCHAR2,
      pmedicid     IN   NUMBER,
      pmoid        IN   NUMBER,
      pfd_goden    IN   DATE,
      pfc_serial   IN   VARCHAR2,
      pkartid      IN   NUMBER DEFAULT -1,
	  ProdCertID   IN   NUMBER,
      ppartynum    IN   VARCHAR2,
      pprice       IN   NUMBER,
      pkol         IN   NUMBER,
      puchgrid     in   number
   )
      RETURN NUMBER
   IS
      nRes   NUMBER;
      MOGROUP_ID NUMBER; -- группа мат. отв.

      --PRAGMA AUTONOMOUS_TRANSACTION;
   BEGIN
      nRes := pkartid;
-- вытаскиваем номер группы мат. отв.
      MOGROUP_ID := MED.PKG_MEDSES.get_cur_mogroup_by_moid(pmoid);

      IF nRes = -1 THEN
         INSERT INTO tkart
                     (kartid, fc_name,  medicid,  moid,  fd_goden,  fc_serial,  fn_prodcertid, fk_mogroupid, fn_price, fn_kol, fn_party_num, uchgrid )
         VALUES      (NULL,   pfc_name, pmedicid, pmoid, pfd_goden, pfc_serial, ProdCertID,    MOGROUP_ID,   pprice,   pkol  ,   ppartynum, puchgrid  )
         RETURNING   kartid
         INTO        nRes;
      ELSE
         UPDATE tkart
         SET    fc_name       = pfc_name,
                medicid       = pmedicid,
                moid          = pmoid,
                fd_goden      = pfd_goden,
                fc_serial     = pfc_serial,
				fn_prodcertid = ProdCertID,
				fn_party_num = ppartynum,
				fk_mogroupid  = MOGROUP_ID,
				fn_price      = pprice,
                fn_kol        = pkol,
                uchgrid       = puchgrid
         WHERE  kartid        = pkartid;
      END IF;
--      COMMIT; -- комит сделаем вручную в коде, когда надо
      RETURN nRes;
   END;


---------------------------------------------------------------------------------------------------------------------------------------------------------------
   FUNCTION GetSerialByID (
      pkartid   IN   NUMBER
   )
      RETURN VARCHAR2
   IS
      sRes   tkart.fc_serial%TYPE;

      CURSOR c (
         pkartid   IN   NUMBER
      )
      IS
         SELECT fc_serial
         FROM   tkart
         WHERE  kartid = pkartid;
   BEGIN
      FOR i IN c (pkartid) LOOP
         sRes := i.fc_serial;
      END LOOP;
      RETURN sRes;
   END;


---------------------------------------------------------------------------------------------------------------------------------------------------------------
   FUNCTION GetNameByID (
      pkartid   IN   NUMBER
   )
      RETURN VARCHAR2
   IS
      sRes   tkart.fc_name%TYPE;
   BEGIN
      SELECT fc_name
      INTO   sRes
      FROM   tkart
      WHERE  kartid = pkartid;
      RETURN sRes;
   END;

   FUNCTION GetmedicByID (
      pkartid   IN   NUMBER
   )
      RETURN number
   IS
      sRes   tmedic.fc_name%TYPE;
   BEGIN
      SELECT tmedic.medicid
      INTO   sRes
      FROM   tkart,tmedic
      WHERE  kartid = pkartid
      and tkart.medicid=tmedic.medicid;
      RETURN nvl(sRes,0);
   END;

---------------------------------------------------------------------------------------------------------------------------------------------------------------
   PROCEDURE DoDel (
      pkartid   IN   NUMBER
   )
   IS
      PRAGMA AUTONOMOUS_TRANSACTION;
   BEGIN
      UPDATE tkart
      SET    fl_del = 1
      WHERE  kartid = pkartid;
      COMMIT;
   END;
---------------------------------------------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------------------------------------------------------
   FUNCTION GetOst (
      pkartid    IN   NUMBER,
      pFD_DATE   IN   DATE,
      pMOID      IN   NUMBER DEFAULT -1
   )
      RETURN NUMBER
   IS
     RES NUMBER;
     OLD_CUR_MO_GROUP NUMBER;
   BEGIN
     if pMOID > 0 then
       OLD_CUR_MO_GROUP := med.pkg_medses.get_cur_mogroup;
       med.pkg_medses.set_curmo_group( pMOID );
     end if;

     med.pkg_medses.set_data2(pFD_DATE);

     select NVL(SUM(FN_KOLOST),0) as FN_SUM_KOLOST
     into RES
     from MED.VMEDKART_KOLOST
     where KARTID = pKartID;

     med.pkg_medses.resetdateperiod;
     if pMOID > 0 then
       med.pkg_medses.set_curmo_group( OLD_CUR_MO_GROUP );
     end if;
   RETURN NVL(RES,0);
--     raise_application_error(-20002,Pfd_Date);
--      RETURN NVL (GetPrihKol (pKartID, pMOID, TO_DATE ('01.01.2000', 'dd.mm.yyyy'), TRUNC (pFD_DATE )+ 1 - 1 / (24 * 60 * 60)), 0)
--             - NVL (GetRashKol (pKartID, pMOID, TO_DATE ('01.01.2000', 'dd.mm.yyyy'), TRUNC (pFD_DATE )+ 1 - 1 / (24 * 60 * 60)), 0);
   exception -- нет остатков на эту дату на текущую группу МО
     when no_data_found then return 0;
   END;
---------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------
   FUNCTION GetOstSum (
      pkartid    IN   NUMBER,
      pFD_DATE   IN   DATE,
      pMOID      IN   NUMBER
   )
      RETURN NUMBER
   IS
   BEGIN
--     raise_application_error(-20002,Pfd_Date);
      RETURN NVL (GetPrihsum (pKartID, pMOID, TO_DATE ('01.01.2000', 'dd.mm.yyyy'), TRUNC (pFD_DATE )+ 1 - 1 / (24 * 60 * 60)), 0)
             - NVL (GetRashsum (pKartID, pMOID, TO_DATE ('01.01.2000', 'dd.mm.yyyy'), TRUNC (pFD_DATE )+ 1 - 1 / (24 * 60 * 60)), 0);
   END;
---------------------------------------------------------------------------------------------------------------------------------------------------------------
   FUNCTION GetEdIzm (
      pkartid   IN   NUMBER
   )
      RETURN NUMBER
   IS
      CURSOR c
      IS
         SELECT tmedic.eiid
         FROM   tmedic, tkart
         WHERE  tmedic.medicid = tkart.medicid
AND             kartid = pkartid
/*ADVICE(190): Cursor reference to a external variable (use a parameter) [209] */
                                ;

      nRes   NUMBER;
   BEGIN
      FOR i IN c LOOP
         nRes := i.eiid;
      END LOOP;
      RETURN nRes;
   END;

   FUNCTION GetPrice (
      pkartid   IN   tkart.kartid%TYPE
   )
      RETURN NUMBER
   IS
     RES NUMBER;
   BEGIN

     select FN_PRICE
     into RES
     from MED.TKART
     where KARTID = pKartID;
     RETURN NVL( RES, 0 );
   END;
/*--------------------------------------------------------------------------------------------------------------*/
   FUNCTION GetPrihKol (
      pkartid   IN   tkart.kartid%TYPE,
      pmoid     IN   tmo.moid%TYPE,
      pfd1      IN   DATE,
      pfd2      IN   DATE
   )
      RETURN NUMBER
   IS
      CURSOR cMO (
         lpkartid   IN   tkart.kartid%TYPE,
         lpmoid     IN   tmo.moid%TYPE,
         lpfd1      IN   DATE,
         lpfd2      IN   DATE
      )
      IS
         SELECT SUM(fn_kol) AS fn_kol
         FROM tdocs, tdpc
         WHERE
/*         tdocs.motoid = lpmoid
           AND*/ tdocs.fp_vid IN (1,3)
           AND tdocs.fp_vidmove IN (1,5,6,7,8,9)
           AND tdocs.fl_edit = 0 --документы подписанны
           AND tdocs.fd_data BETWEEN TRUNC (lpfd1) AND TRUNC (lpfd2 + 1)- 1 / (24 * 60 * 60)
           AND tdpc.dpid = tdocs.dpid
           AND tdpc.kartid = lpkartid;
/*           AND ((tdocs.fp_vid = 1 ) --приход на мо (напр. зав. аптекой)
                OR (tdocs.fp_vid = 3 AND tdocs.fp_vidmove = 6) --возврат на мо (напр. зав. аптекой)
                OR (tdocs.fp_vid = 3 AND tdocs.fp_vidmove = 5)) --расход на мо(считается приходом для МО)
*/            --на МО

      CURSOR cSan (
         lpkartid   IN   tkart.kartid%TYPE,
         lpfd1      IN   DATE,
         lpfd2      IN   DATE
      )
      IS
         SELECT SUM(fn_kol) AS fn_kol
         FROM tdocs, tdpc
         WHERE tdocs.fp_vid IN (1,3)
           AND tdocs.fp_vidmove IN (1,6)
--           AND tdocs.fl_edit = 0 --документы подписанны
           AND tdocs.fd_data BETWEEN TRUNC (lpfd1) AND TRUNC (lpfd2 + 1)- 1 / (24 * 60 * 60)
           AND tdpc.dpid = tdocs.dpid
           AND tdpc.kartid = lpkartid;
      nRes   NUMBER := 0;
   BEGIN
      IF pMOID = -1 THEN
         FOR i IN cSan (pkartid, pfd1, pfd2) LOOP
            nRes := i.fn_kol;
         END LOOP;
      ELSE
         FOR i IN cMO (pkartid, pmoid, pfd1, pfd2) LOOP
            nRes := i.fn_kol;
         END LOOP;
      END IF;
      RETURN NVL (nRes, 0);
   END GetPrihKol;


/*--------------------------------------------------------------------------------------------------------------*/
   FUNCTION GetPrihSum (
      pkartid   IN   tkart.kartid%TYPE,
      pmoid     IN   tmo.moid%TYPE,
      pfd1      IN   DATE,
      pfd2      IN   DATE
   )
      RETURN NUMBER
   IS
      CURSOR cMO (
         lpkartid   IN   tkart.kartid%TYPE,
         lpmoid     IN   tmo.moid%TYPE,
         lpfd1      IN   DATE,
         lpfd2      IN   DATE
      )
      IS
         SELECT SUM(fn_summ) AS fn_kol
         FROM tdocs, tdpc
         WHERE tdocs.fp_vid IN (1,3)
           AND tdocs.fp_vidmove IN (1,5,6,7,8)
           AND tdocs.fl_edit = 0 --документы подписанны
           AND tdocs.fd_data BETWEEN TRUNC (lpfd1) AND TRUNC (lpfd2 + 1)- 1 / (24 * 60 * 60)
           AND tdpc.dpid = tdocs.dpid
           AND tdocs.motoid = lpmoid
           AND tdpc.kartid = lpkartid;
      CURSOR cSan (
         lpkartid   IN   tkart.kartid%TYPE,
         lpfd1      IN   DATE,
         lpfd2      IN   DATE
      )
      IS
         SELECT SUM(fn_summ) AS fn_kol
         FROM tdocs, tdpc
         WHERE tdocs.fp_vid IN (1,3)
           AND tdocs.fp_vidmove IN (1,6)
--           AND tdocs.fl_edit = 0 --документы подписанны
           AND tdocs.fd_data BETWEEN TRUNC (lpfd1) AND TRUNC (lpfd2 + 1)- 1 / (24 * 60 * 60)
           AND tdpc.kartid = lpkartid
           AND tdpc.dpid = tdocs.dpid;
      nRes   NUMBER := 0;
   BEGIN
      IF pMOID = -1 THEN
         FOR i IN cSan (pkartid, pfd1, pfd2) LOOP
            nRes := i.fn_kol;
         END LOOP;
      ELSE
         FOR i IN cMO (pkartid, pmoid, pfd1, pfd2) LOOP
            nRes := i.fn_kol;
         END LOOP;
      END IF;
      RETURN NVL (nRes, 0);
   END GetPrihSum;


/*--------------------------------------------------------------------------------------------------------------*/
   FUNCTION GetRashKol (
      pkartid   IN   tkart.kartid%TYPE,
      pmoid     IN   tmo.moid%TYPE,
      pfd1      IN   DATE,
      pfd2      IN   DATE
   )
      RETURN NUMBER
   IS
      CURSOR cMO (
         lpkartid   IN   tkart.kartid%TYPE,
         lpmoid     IN   tmo.moid%TYPE,
         lpfd1      IN   DATE,
         lpfd2      IN   DATE
      )
      IS
         SELECT SUM(fn_kol) AS fn_kol
         FROM tdocs, tdpc
         WHERE tdocs.fp_vid = 3
           AND tdocs.fp_vidmove IN (4,5,6,7,8)
           AND tdocs.fd_data BETWEEN TRUNC (lpfd1) AND TRUNC (lpfd2 + 1)- 1 / (24 * 60 * 60)
           AND tdocs.fl_edit = 0
           AND tdpc.kartid = lpkartid
--           AND tdocs.mofromid = lpmoid
           AND tdpc.dpid = tdocs.dpid;
/*           AND (tdocs.fp_vid = 3 AND tdocs.fp_vidmove = 5)--расход МО (Выдача)
           OR (tdocs.fp_vid = 3 AND tdocs.fp_vidmove = 6) -- возврат МО
           OR (tdocs.fp_vid = 3 AND tdocs.fp_vidmove = 4); --списание МО
*/      CURSOR cSan (
         lpkartid   IN   tkart.kartid%TYPE,
         lpfd1      IN   DATE,
         lpfd2      IN   DATE
      )
      IS
         SELECT SUM(fn_kol) AS fn_kol
         FROM tdocs, tdpc
         WHERE tdocs.fp_vid = 3
           AND tdocs.fp_vidmove IN (4,5,7,8)
           AND tdocs.fl_edit = 0
           AND tdocs.fd_data BETWEEN TRUNC (lpfd1) AND TRUNC (lpfd2 + 1)- 1 / (24 * 60 * 60)
           AND tdpc.kartid = lpkartid
           AND tdpc.dpid = tdocs.dpid;
      nRes   NUMBER := 0;
   BEGIN
      IF pMOID = -1 THEN
         FOR i IN cSan (pkartid, pfd1, pfd2) LOOP
            nRes := i.fn_kol;
         END LOOP;
      ELSE
         FOR i IN cMO (pkartid, pmoid, pfd1, pfd2) LOOP
            nRes := i.fn_kol;
         END LOOP;
      END IF;
      RETURN NVL (nRes, 0);
   END GetRashKol;


/*--------------------------------------------------------------------------------------------------------------*/
   FUNCTION GetRashSum (
      pkartid   IN   tkart.kartid%TYPE,
      pmoid     IN   tmo.moid%TYPE,
      pfd1      IN   DATE,
      pfd2      IN   DATE
   )
      RETURN NUMBER
   IS
      CURSOR cMO (
         lpkartid   IN   tkart.kartid%TYPE,
         lpmoid     IN   tmo.moid%TYPE,
         lpfd1      IN   DATE,
         lpfd2      IN   DATE
      )
      IS
         SELECT SUM(fn_summ) AS fn_kol
         FROM tdocs, tdpc
         WHERE tdocs.fp_vid = 3
           AND tdocs.fp_vidmove IN (4,5,6,7,8)
           AND tdocs.fl_edit = 0
           AND tdocs.fd_data BETWEEN TRUNC (lpfd1) AND TRUNC (lpfd2 + 1)- 1 / (24 * 60 * 60)
           AND tdocs.mofromid = lpmoid
           AND tdpc.kartid = lpkartid
           AND tdpc.dpid = tdocs.dpid;
      CURSOR cSan (
         lpkartid   IN   tkart.kartid%TYPE,
         lpfd1      IN   DATE,
         lpfd2      IN   DATE
      )
      IS
         SELECT SUM(fn_summ) AS fn_kol
         FROM tdocs, tdpc
         WHERE tdocs.fp_vid = 3
           AND tdocs.fp_vidmove IN (4,5,7,8)
           AND tdocs.fl_edit = 0
           AND tdocs.fd_data BETWEEN TRUNC (lpfd1) AND TRUNC (lpfd2 + 1)- 1 / (24 * 60 * 60)
           AND tdpc.kartid = lpkartid
           AND tdpc.dpid = tdocs.dpid;
      nRes   NUMBER := 0;
   BEGIN
      IF pMOID = -1 THEN
         FOR i IN cSan (pkartid, pfd1, pfd2) LOOP
            nRes := i.fn_kol;
         END LOOP;
      ELSE
         FOR i IN cMO (pkartid, pmoid, pfd1, pfd2) LOOP
            nRes := i.fn_kol;
         END LOOP;
      END IF;
      RETURN NVL (nRes, 0);
   END GetRashSum;

   FUNCTION GetOstMedic (
      pmedicid   IN   NUMBER,
      pFD_DATE   IN   DATE,
      pMOID      IN   NUMBER
   )
      RETURN NUMBER
   IS
      CURSOR c (
         amedicid   IN   NUMBER,
         aFD_DATE   IN   DATE,
         aMOID      IN   NUMBER
      )
      IS
         SELECT SUM (PKGMEDKART.getost (kartid, afd_date, amoid)) AS fn_ost
         FROM   tkart
         WHERE  tkart.medicid = amedicid
           AND tkart.fl_del = 0;

      nRes   NUMBER := 0;
   BEGIN
      FOR i IN c (pmedicid, pFD_DATE, pMOID) LOOP
         nRes := i.fn_ost;
      END LOOP;
      RETURN nRes;
   END GetOstMedic;


FUNCTION GET_KARTSERIALLST( PMEDICID   IN   NUMBER,
                            PFD_DATE   IN   DATE,
                            PMOID      IN   NUMBER ) RETURN VARCHAR2 IS
  RES VARCHAR2(4000);
BEGIN
  FOR REC IN (SELECT T.FC_SERIAL FROM TKART T
              WHERE T.MEDICID = PMEDICID
                AND T.FC_SERIAL IS NOT NULL
                AND t.fl_del = 0
                AND GetOst(T.KARTID,pFD_DATE,pMOID) > 0) LOOP
    RES := RES || REC.FC_SERIAL || ',';
  END LOOP;
  RES := SUBSTR(RES,0,LENGTH(RES)-1);
  RETURN(RES);
END GET_KARTSERIALLST;

FUNCTION EXIST_KART( pMEDICID   IN   NUMBER,
                     pFC_NAME   IN   VARCHAR2,
                     pFC_SERIAL IN   VARCHAR2) RETURN INTEGER IS
/*Если запись есть с такими полями, то ф-ия вернет значение kartid, иначе
 если запись не найденавернет 0*/

 vKARTID NUMBER :=0;

BEGIN
IF pFC_SERIAL<>'' THEN
  SELECT NVL(MAX(KARTID),0) AS KARTID
    INTO
     vKARTID
    FROM TKART
    WHERE MEDICID=pMEDICID
      AND FC_NAME=pFC_NAME
      AND FC_SERIAL=pFC_SERIAL;
ELSE
  SELECT NVL(MAX(KARTID),0) AS KARTID
    INTO
     vKARTID
    FROM TKART
    WHERE MEDICID=pMEDICID
      AND FC_NAME=pFC_NAME;
END IF;
RETURN vKARTID;
END EXIST_KART;


FUNCTION GetFC_NAME_LATByID (pkartid   IN   NUMBER )  RETURN VARCHAR2
--ВЕРНУТЬ значение поля TMEDIC.FC_NAME_LAT
IS
  sRes   tMEDIC.Fc_Name_Lat%TYPE;
BEGIN
SELECT NVL(M.FC_NAME_LAT,'') AS FC_NAME_LAT
  INTO   sRes
  FROM   TMEDIC M ,TKART K
  WHERE  kartid = pkartid
    AND M.MEDICID = K.MEDICID;

RETURN sRes;

	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			RETURN '';
END;

END PKGMEDKART; -- tkart Body PKGMEDKART
/


-- End of DDL Script for Package Body MED.PKGMEDKART
