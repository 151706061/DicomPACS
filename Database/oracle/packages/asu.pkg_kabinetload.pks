DROP PACKAGE ASU.PKG_KABINETLOAD
/

--
-- PKG_KABINETLOAD  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TSOTR (Synonym)
--   TOTDEL (Synonym)
--   TSMID (Table)
--   GET_ROOTID (Function)
--   GET_VRACHOTD (Function)
--   DO_VRACHFIO (Function)
--   TNAZVRACH (View)
--   TKABINET (Table)
--
CREATE OR REPLACE PACKAGE ASU."PKG_KABINETLOAD" 
IS

--
-- Purpose: Ежедневный отчет о нагрузке кабинетов за сутки
--
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  ------------------------------------------
-- Sobjanin A.A. 14.12.2000     Create
/*-------------------------------------------------------------------------------------------*\
|               Cursors
\*-------------------------------------------------------------------------------------------*/
   CURSOR cOtd
   IS
      SELECT fk_id, fc_name
      FROM   totdel;

   CURSOR cKabInOtd (
      pFK_OTDID   IN   NUMBER,
      pFK_OWNER   IN   NUMBER
   )
   IS
      SELECT   /*+rule*/
               fc_name, fk_id AS fk_kabinetid
      FROM     tkabinet
      WHERE    EXISTS ( SELECT fk_smid
                        FROM   tsmid, tnazvrach
                        WHERE  fk_smid = tsmid.fk_id
AND                            EXISTS ( SELECT     fk_id
                                        FROM       tsmid
                                        START WITH fk_owner = pFK_OWNER
                                        CONNECT BY PRIOR fk_id = fk_owner)
AND                            tkabinet.fk_id = tnazvrach.fk_kabinetid
AND                            get_rootid (tsmid.fk_id) = pFK_OWNER
AND                            get_vrachotd (fk_sotrid) = pFK_OTDID
/*ADVICE(36): Elements in the SELECT list (either columns or expressions) are not qualified by a table/view name [403] */
                                                                   )
/*ADVICE(38): Elements in the SELECT list (either columns or expressions) are not qualified by a table/view name [403] */

      ORDER BY fn_order;

   CURSOR cNazInKab (
      pFK_KABINETID   IN   NUMBER,
      pFK_OTDID       IN   NUMBER,
      pFK_OWNER       IN   NUMBER
   )
   IS
      SELECT /*+rule*/
             fc_name, fk_smid, fk_kabinetid
      FROM   tsmid, tnazvrach
      WHERE  tsmid.fk_id = tnazvrach.fk_smid
AND          get_vrachotd (fk_sotrid) = pFK_OTDID
AND          EXISTS ( SELECT     /*+rule*/
                                 fk_id
                      FROM       tsmid ts
                      WHERE      fk_id = PFK_OWNER
                      START WITH fk_id = tsmid.fk_id
                      CONNECT BY PRIOR fk_owner = fk_id)
AND          fk_kabinetid = pFK_KABINETID
/*ADVICE(60): Elements in the SELECT list (either columns or expressions) are not qualified by a table/view name [403] */
                                         ;

   CURSOR cVrachInOtd (
      pFK_OTDID   IN   NUMBER
   )
   IS
      SELECT fk_id, do_vrachfio (fk_id) AS fc_fio
      FROM   tsotr
      WHERE  fk_otdid = pFK_OTDID;

   CURSOR cKonsInVrach (
      pFK_VRACHID   IN   NUMBER,
      pFK_OWNER     IN   NUMBER
   )
   IS
      SELECT DISTINCT qKons.fk_smid, qKons.fc_naz
      FROM            tnazvrach,
                      (SELECT     fk_id AS fk_smid, fc_name AS fc_naz
                       FROM       tsmid
                       START WITH fk_owner = pFK_OWNER
                       CONNECT BY PRIOR fk_id = fk_owner) qKons
      WHERE           fk_sotrid = pFK_VRACHID
AND                   qKons.fk_smid = tnazvrach.fk_smid
      ORDER BY        fc_naz;

   FUNCTION get_loadkab (
      pFD1   IN   DATE,
      pFD2   IN   DATE
   )
      RETURN NUMBER;
   FUNCTION CountNazInKab (
      pFD             IN   DATE,
      pFK_KABINETID   IN   NUMBER,
      pFK_OTDID       IN   NUMBER,
      pFK_SMID        IN   NUMBER,
      pFN_StartVozr   IN   NUMBER,
      pFN_EndVozr     IN   NUMBER
   )
      RETURN NUMBER;

/*  FUNCTION CountKonsInVrach (pFK_VRACHID IN NUMBER)
    RETURN BOOLEAN;*/
   FUNCTION IsExistsKabInOtd (
      pFK_OTDID   IN   NUMBER,
      pFK_OWNER   IN   NUMBER
   )
      RETURN BOOLEAN;
END; -- Package Specification PKG_KABINETLOAD
/

SHOW ERRORS;


