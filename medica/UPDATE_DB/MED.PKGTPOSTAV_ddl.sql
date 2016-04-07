-- Start of DDL Script for Package Body MED.PKGTPOSTAV
-- Generated 23.05.08 15:49:11 from MED@ASU

CREATE OR REPLACE 
PACKAGE     med.pkgtpostav
IS

/*
* Select Procedure for the table "MED.TPOSTAV"
*/
   PROCEDURE tpostav_sel (
      postavid_in       IN       med.tpostav.postavid%TYPE,
      fc_name_out       OUT      med.tpostav.fc_name%TYPE,
      fc_bossdolg_out   OUT      med.tpostav.fc_bossdolg%TYPE,
      fc_bossfio_out    OUT      med.tpostav.fc_bossfio%TYPE,
      fc_rekviziti_out  OUT       med.tpostav.fc_rekviziti%TYPE
   );


/*
* Insert Procedure for the table "MED.TPOSTAV"
*/
   FUNCTION tpostav_set (
      postavid_in      IN   med.tpostav.postavid%TYPE,
      fc_name_in       IN   med.tpostav.fc_name%TYPE,
      fc_bossdolg_in   IN   med.tpostav.fc_bossdolg%TYPE,
      fc_bossfio_in    IN   med.tpostav.fc_bossfio%TYPE,
      fc_rekviziti_in  IN   med.tpostav.fc_rekviziti%TYPE
   )
      RETURN NUMBER;


/*
* Delete Procedure for the table "MED.TPOSTAV"
*/
   PROCEDURE tpostav_del (postavid_in IN med.tpostav.postavid%TYPE);


/*
* GetNameByID
*/
   FUNCTION GetNameByID (postavid IN med.tpostav.postavid%TYPE)
      RETURN tpostav.fc_name%TYPE;

FUNCTION GET_PRODUCE_POSTAV
--получение POSTAVID ПОСТАВЩИКА, который производит медикаменты
   RETURN NUMBER;

END; /* pkgtpostav */
/


CREATE OR REPLACE 
PACKAGE BODY     med.pkgtpostav
IS

/*
* Select Procedure for the table "MED.TPOSTAV"
*/
   PROCEDURE tpostav_sel (
      postavid_in       IN       med.tpostav.postavid%TYPE,
      fc_name_out       OUT      med.tpostav.fc_name%TYPE,
      fc_bossdolg_out   OUT      med.tpostav.fc_bossdolg%TYPE,
      fc_bossfio_out    OUT      med.tpostav.fc_bossfio%TYPE,
      fc_rekviziti_out  OUT       med.tpostav.fc_rekviziti%TYPE
   )
   IS
   BEGIN
      SELECT fc_name, fc_bossdolg, fc_bossfio, fc_rekviziti
      INTO   fc_name_out, fc_bossdolg_out, fc_bossfio_out, fc_rekviziti_out
      FROM   med.tpostav
      WHERE  postavid = postavid_in;
   END;                                                                                                 /* TPOSTAV_SEL */


/*
* Insert Procedure for the table "MED.TPOSTAV"
*/
   FUNCTION tpostav_set (
      postavid_in      IN   med.tpostav.postavid%TYPE,
      fc_name_in       IN   med.tpostav.fc_name%TYPE,
      fc_bossdolg_in   IN   med.tpostav.fc_bossdolg%TYPE,
      fc_bossfio_in    IN   med.tpostav.fc_bossfio%TYPE,
      fc_rekviziti_in  IN   med.tpostav.fc_rekviziti%TYPE
   )
      RETURN NUMBER
   IS
      nRes   NUMBER;
   BEGIN
      nRes := postavid_in;

      IF postavid_in = -1 THEN
         INSERT INTO med.tpostav
                     (postavid, fc_name, fc_bossdolg, fc_bossfio, fc_rekviziti)
         VALUES      (postavid_in, fc_name_in, fc_bossdolg_in, fc_bossfio_in, fc_rekviziti_in)
         RETURNING   postavid
         INTO        nRes;
      ELSE
         UPDATE med.tpostav
         SET
                fc_name = fc_name_in,
                fc_bossdolg = fc_bossdolg_in,
                fc_bossfio = fc_bossfio_in,
                fc_rekviziti = fc_rekviziti_in
         WHERE  postavid = postavid_in;
      END IF;

      RETURN nRes;
   END;                                                                                                 /* TPOSTAV_INS */


/*
* Delete Procedure for the table "MED.TPOSTAV"
*/
   PROCEDURE tpostav_del (postavid_in IN med.tpostav.postavid%TYPE)
   IS
   BEGIN
      UPDATE tpostav
      SET    fl_del = 1
      WHERE  postavid = postavid_in;
   END;                                                                                                /*  TPOSTAV_DEL */


/*
* GetByNameID
*/
   FUNCTION GetNameByID (postavid IN med.tpostav.postavid%TYPE)
      RETURN tpostav.fc_name%TYPE
   IS
      CURSOR c (lpostavid IN med.tpostav.postavid%TYPE)
      IS
         SELECT fc_name
         FROM   tpostav
         WHERE  tpostav.postavid = lpostavid;

      res   tpostav.fc_name%TYPE;
   BEGIN
      FOR i IN c (postavid) LOOP
         res := i.fc_name;
      END LOOP;

      RETURN res;
   END GetNameByID;


FUNCTION GET_PRODUCE_POSTAV
--получение POSTAVID ПОСТАВЩИКА, который производит медикаменты
   RETURN NUMBER
IS
 PRAGMA AUTONOMOUS_TRANSACTION;
 vPOSTAVID NUMBER :=-1;

BEGIN
SELECT
    NVL(MAX(POSTAVID),-1)
  INTO
    vPOSTAVID
  FROM TPOSTAV
  WHERE FN_MOTYPE = 1;

IF vPOSTAVID=-1 THEN
--НЕ НАШЛИ ПОСТАВЩИКА, КОТОРЫЙ производит медикаменты => его надо добавить в таблицу TPOSTAV
INSERT INTO TPOSTAV
  (POSTAVID,
   FC_NAME,
   FC_BOSSDOLG,
   FC_BOSSFIO,
   FL_DEL,
   FN_MOTYPE)
  VALUES
  (null,
   'Отдел РПО',
   'Отдел РПО',
   'Отдел РПО',
   0,
   1) returning POSTAVID into vPOSTAVID;
commit;
-- убрал лишний вызов select и вынес в автономную сессию инсерт. Воронов О.А. 23.05.2008
/*SELECT
    NVL(MAX(POSTAVID),-1)
  INTO
    vPOSTAVID
  FROM TPOSTAV
  WHERE FN_MOTYPE = 1;*/
END IF;

   RETURN vPOSTAVID;
END GET_PRODUCE_POSTAV;






END PKGTPOSTAV; /* pkgtpostav */
/


-- End of DDL Script for Package Body MED.PKGTPOSTAV

