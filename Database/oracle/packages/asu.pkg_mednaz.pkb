DROP PACKAGE BODY ASU.PKG_MEDNAZ
/

--
-- PKG_MEDNAZ  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_MEDNAZ" IS

--
-- To modify this template, edit file PKGBODY.TXT in TEMPLATE
-- directory of SQL Navigator
--
-- Purpose: Briefly explain the functionality of the package body
--
-- MODIFICATION HISTORY
-- Mikita      13.03.2002    Create "get_newnazID"
-- ---------   ------  ------------------------------------------
   -- Enter procedure, function bodies as shown below
   -- Ura закоментарил инвалидный объект 
   
/*  URA  
   FUNCTION get_newnazid (psotrid IN NUMBER, ppacid IN NUMBER)
      RETURN NUMBER
   IS
      nres   NUMBER;
   BEGIN
      INSERT INTO tnazmed
                  (fk_pacid, fk_vrachid)
           VALUES (ppacid, psotrid)
        RETURNING fk_id
             INTO nres;
      RETURN nres;
   END;

   PROCEDURE add_sam_naz (
      pnazid   IN   NUMBER,
      com      IN   VARCHAR2,
      pmedic   IN   VARCHAR2,
      days     IN   NUMBER,
      perday   IN   NUMBER
   )
   IS
   BEGIN
      UPDATE tnazmed
         SET  fc_comment = com, 
             fl_sam = 1, 
             fc_sam = pmedic,
             fn_uchkol = days * perday,
             fn_day = days,
             fn_perday = perday
       WHERE fk_id = pnazid;
       
      Null;
   END;
   PROCEDURE add_medic_to_naz (
      pnazid     IN   NUMBER,
      pmedicid   IN   NUMBER,
      colvo      IN   NUMBER,
      vrachid in number
   )
   IS
   BEGIN
      INSERT INTO tnazmedlech
                  (medic_id, colvo, naz_id,fk_vrach)
           VALUES (pmedicid, colvo, pnazid,vrachid);
   END;
   PROCEDURE add_naz (
      pnazid   IN   NUMBER,
      com      IN   VARCHAR2,
      days     IN   NUMBER,
      perday   IN   NUMBER
   )
   IS
   BEGIN
      UPDATE tnazmed
         SET fn_uchkol = days * perday,
             fc_comment = com,
             fp_status = pkg_common.get_nevip,
             fn_day = days,
             fn_perday = perday,
             fl_sam = 0
       WHERE fk_id = pnazid;
       FOR i IN 1 .. perday LOOP
         INSERT INTO tnazmedraspis
                     (fk_nazmedid)
              VALUES (pnazid);
       END LOOP i;
   END;
   PROCEDURE add_naz (
      pnazid   IN   NUMBER,
      com      IN   VARCHAR2,
      days     IN   NUMBER,
      perday   IN   NUMBER,
      mo       IN   NUMBER,
      ptype    IN   NUMBER,
      ddate    in   date
   )
   IS
   BEGIN
      UPDATE tnazmed
         SET fn_uchkol = days * perday,
             fc_comment = com,
             fp_status = pkg_common.get_nevip,
             fn_day = days,
             fn_perday = perday,
             fl_sam = 0,
             fk_moid = mo,
             fk_type = ptype
 --            fd_date = ddate
       WHERE fk_id = pnazid;
       FOR i IN 1 .. perday LOOP
         INSERT INTO tnazmedraspis
                     (fk_nazmedid)
              VALUES (pnazid);
       END LOOP i;
   END;

   PROCEDURE del_medicnaz (
      pnazid    IN   NUMBER,
      psotrid   IN   NUMBER,
      com       IN   VARCHAR DEFAULT ''
   )
   IS
      CURSOR cmednaz (pid NUMBER)
      IS
         SELECT fp_status, fl_sam
           FROM tnazmed
          WHERE fk_id = pid;
      status   NUMBER;
      bsam     NUMBER;
   BEGIN
     OPEN cmednaz (pnazid);
       FETCH cmednaz INTO status, bsam;
     CLOSE cmednaz;
     IF bsam = 1 THEN
       DELETE tnazmed WHERE fk_id = pnazid;
       RETURN;
     END IF;
     IF (status = get_nevip) or (status = get_recomend) THEN
       DELETE tnazmed WHERE fk_id = pnazid;
       DELETE tnazmedlech WHERE naz_id = pnazid;
     ELSE
       IF status=get_vipnaz THEN
    		 RETURN;
       END IF;
      END IF;
   END;
   PROCEDURE del_medic_from_naz (pnazid IN NUMBER, pmedic IN NUMBER)
   IS
   BEGIN
      DELETE FROM tnazmedlech
            WHERE naz_id = pnazid AND medic_id = pmedic;
   END;
   PROCEDURE del_medic_from_naz (pid IN NUMBER)
   IS
   BEGIN
      DELETE FROM tnazmedlech
            WHERE id = pid;
   END;
   PROCEDURE upd_medic_in_naz (pid NUMBER, medicid IN NUMBER, pcolvo IN NUMBER)
   IS
   BEGIN
      UPDATE tnazmedlech
         SET medic_id = medicid,
             colvo = pcolvo
       WHERE id = pid;
   END;
   PROCEDURE upd_sam_naz (
      pid      IN   NUMBER,
      medic    IN   VARCHAR2,
      days     IN   NUMBER,
      perday   IN   NUMBER,
      com      IN   VARCHAR2
   )
   IS
   BEGIN
      UPDATE tnazmed
         SET fc_sam = medic,
             fn_day = days,
             fn_perday = perday,
             fn_uchkol = days * perday,
             fc_comment = com
       WHERE fk_id = pid;
   END;
   PROCEDURE upd_med_naz (
      pid      IN   NUMBER,
      days     IN   NUMBER,
      perday   IN   NUMBER,
      com      IN   VARCHAR2
   )
   IS
   BEGIN
      UPDATE tnazmed
         SET fn_day = days,
             fn_perday = perday,
             fc_comment = com,
             fn_uchkol = days * perday
       WHERE fk_id = pid;
       DELETE
         FROM tnazmedraspis
         WHERE fk_nazmedid = pid;
       FOR i IN 1 .. perday LOOP
          INSERT INTO tnazmedraspis
                      (fk_nazmedid)
               VALUES (pid);
        END LOOP i;
   END;

   PROCEDURE upd_med_naz (
      pid      IN   NUMBER,
      days     IN   NUMBER,
      perday   IN   NUMBER,
      com      IN   VARCHAR2,
      mo	   IN number,
      sotr     IN number,
      ptype    IN NUMBER
   )
   IS
   BEGIN
      UPDATE tnazmed
         SET fn_day = days,
             fn_perday = perday,
             fc_comment = com,
             fn_uchkol = days * perday,
			 FK_MOID = mo,
			 FK_VRACHID = sotr,
             fk_type = ptype
       WHERE fk_id = pid;
       DELETE
         FROM tnazmedraspis
         WHERE fk_nazmedid = pid;
       FOR i IN 1 .. perday LOOP
          INSERT INTO tnazmedraspis
                      (fk_nazmedid)
               VALUES (pid);
        END LOOP i;
   END;

	 PROCEDURE calculation_proc_medics(presid IN number)
	 IS
	   recept NUMBER:=0.0;
		 nazid  NUMBER:=0.0;
		 smid   NUMBER:=0.0;

		 CURSOR recept_smid(pid IN number) IS
		   SELECT FK_RECEPTID
			   FROM treceptnaz
				WHERE fk_smid=(SELECT fk_smid
				                 FROM vres
												WHERE fk_id=pid);
	   CURSOR recept_con(pid IN number) IS
		   SELECT FK_MEDICID, FN_KOL
			   FROM tnazreceptcon
				WHERE FK_RECEPTID =pid;
     CURSOR common(pid IN number) IS
		   SELECT fk_nazid, fk_smid
			   FROM vres
				WHERE fk_id=pid;

		 CURSOR naz_param_recept(pid IN number) IS
       SELECT fk_receptid
			   FROM treceptnaz
				WHERE fk_paramid IN (SELECT fk_valueid
				                       FROM tnazparam
												  		WHERE fk_nazid=pid
															  AND NOT fk_valueid IS NULL);
	 BEGIN
	   OPEN common(presid);
		 FETCH common INTO nazid, smid;
		 CLOSE common;

	   --Открыть курсор с кодом рецепта из смид
	   OPEN recept_smid(presid);
		 FETCH recept_smid INTO recept;
		 --Если рецепт не привязан к смид
		 IF recept_smid%NOTFOUND THEN
		   CLOSE recept_smid;
			 --Открываем курсор c параметрами назначения
			 OPEN naz_param_recept(nazid);
			 LOOP
			   FETCH naz_param_recept INTO recept;
			   EXIT WHEN naz_param_recept%NOTFOUND; --Если данных нет, выходим
    		 FOR i IN recept_con(recept) LOOP
    		   INSERT INTO tlechcont(FK_RESID, FK_NAZID, FK_MEDICID, FN_COLVO, FK_SMID)
		    	      VALUES (presid, nazid, i.fk_medicid, i.fn_kol, smid);
    		 END LOOP;
			 END LOOP;
			 CLOSE naz_param_recept;
			 RETURN;
		 END IF;
		 --Закрываем курсор
     CLOSE recept_smid;
		 --Если рецепт привязан к смид, делаем вставку использованых медикаментов
		 FOR i IN recept_con(recept) LOOP
		   INSERT INTO tlechcont(FK_RESID, FK_NAZID, FK_MEDICID, FN_COLVO, FK_SMID)
			      VALUES (presid, nazid, i.fk_medicid, i.fn_kol, smid);
		 END LOOP;
	 END;

	 PROCEDURE discard_proc_medics(presid IN number)
	 IS
	 BEGIN
	   DELETE FROM tlechcont WHERE fk_resid=presid;
	 END;

	 PROCEDURE do_vid_medic(pnazid IN number, pIspol IN number)
	 IS
	   ppacid number:=0.0;
       pmoid number:=0.0;
	   CURSOR medlech(pid IN number) IS
		   SELECT ID, medic_id, COLVO
			   FROM tnazmedlech
				WHERE naz_id=pid;
  	 CURSOR mednaz(pid IN number) IS
		   SELECT fk_pacid, fk_moid
			   FROM tnazmed
				WHERE fk_id=pid;
       iq number:=0.0;
	 BEGIN
	   OPEN mednaz(pnazid);
		 FETCH mednaz INTO ppacid, pmoid;
		 IF mednaz%NOTFOUND THEN
		   CLOSE mednaz;
		   RETURN;
		 END IF;
		 CLOSE mednaz;
         select seq_group.nextval into iq from dual;
		 FOR i IN medlech(pnazid) LOOP
		   INSERT INTO tnazmedlechvid(PACID, NAZID, NAZLECHID, MEDICID, COLVO, MOID, fk_groupid, fk_ispol)
			      VALUES (ppacid, pnazid, i.ID, i.medic_id, i.COLVO, pmoid, iq, pIspol);
		 END LOOP;
		 UPDATE tnazmed SET FN_VIDANO=FN_VIDANO+1 WHERE fk_id=pnazid;
	 END;

	 PROCEDURE do_vid_medic(pnazid IN number, pIspol in number, DAYS IN OUT NUMBER)
	 IS
	   ppacid number:=0.0;
		 pmoid number:=0.0;
		 nvid NUMBER:=0.0;
		 DONE number:=0.0;
		 MUST number:=0.0;
         iq number:=0.0;
         pDate DATE;
         pPerDay NUMBER;
         pDAYSEND NUMBER;
         pDAYS NUMBER;
         pFull BOOLEAN:=FALSE;
	   CURSOR medlech(pid IN number) IS
		   SELECT ID, medic_id, COLVO
			   FROM tnazmedlech
				WHERE naz_id=pid;
  	 CURSOR mednaz(pid IN number) IS
		   SELECT fk_pacid, fk_moid, fd_date, fn_perday, fn_day
			   FROM tnazmed
				WHERE fk_id=pid;
	 BEGIN
	   OPEN mednaz(pnazid);
		 FETCH mednaz INTO ppacid, pmoid, pDate, pPerDay, pDAYS;
		 IF mednaz%NOTFOUND THEN
		   CLOSE mednaz;
		   RETURN;
		 END IF;
		 CLOSE mednaz;
 URA */
/*         pDAYSEND:=((pDate+pDAYS)-SYSDATE)*pPerDay;
         IF DAYS>pDAYSEND THEN
           DAYS:=pDAYSEND;
           pFull:=true;
         END IF;*/
/* URA          
		 FOR nvid IN 1..DAYS LOOP
           select seq_group.nextval into iq from dual;
  		   FOR i IN medlech(pnazid) LOOP
	  	     INSERT INTO tnazmedlechvid(PACID, NAZID, NAZLECHID, MEDICID, COLVO, MOID, fk_groupid, fk_ispol)
		  	      VALUES (ppacid, pnazid, i.ID, i.medic_id, i.COLVO, pmoid, iq, pIspol);
  		   END LOOP;
  		   UPDATE tnazmed SET FN_VIDANO=FN_VIDANO+1 WHERE fk_id=pnazid;
		   SELECT FN_VIDANO, FN_UCHKOL INTO DONE, MUST FROM tnazmed WHERE fk_id=pnazid;
		   IF DONE=MUST THEN
			   EXIT;
		   END IF;
		 END LOOP;
 URA */
 /*         IF pFull THEN
           update tnazmed set fp_status=get_vipnaz;
         END IF;*/
/* URA	 END;

	 PROCEDURE add_naz_dezh (
      pnazid   IN   NUMBER,
      com      IN   VARCHAR2,
      days     IN   NUMBER,
      perday   IN   NUMBER,
      mo       IN   NUMBER,
      ptype    IN   NUMBER,
      ddate    in   date
   )
	 IS
	 BEGIN
      UPDATE tnazmed
         SET fn_uchkol = days * perday,
             fc_comment = com,
             fp_status = pkg_common.get_nevip,
             fn_day = days,
             fn_perday = perday,
             fl_sam = 0,
             fk_moid = mo,
             FP_DEZH = 1,
             fk_type = ptype
   --         fd_date = ddate
       WHERE fk_id = pnazid;
       FOR i IN 1 .. perday LOOP
         INSERT INTO tnazmedraspis
                     (fk_nazmedid)
              VALUES (pnazid);
       END LOOP i;
	 END;

	 FUNCTION get_medicost(pmedicid IN number, pmoid IN number) RETURN NUMBER
	 IS
	   nSUM NUMBER:=0.0;
	   CURSOR cMedic_OST(pmo IN number, pmed IN number) IS
		   SELECT NVL(SUM(med.pkgmedkart.getost(kartid, SYSDATE, pmo)), 0)
         FROM med.vallmedkart
			  WHERE medicid=pmed;
	 BEGIN
		 OPEN cMedic_OST(pmedicid, pmoid);
		 FETCH cMedic_OST INTO nSUM;
		 CLOSE cMedic_OST;
		 RETURN nSUM;
	 END;

     FUNCTION GET_MEDICLIST(NAZID IN NUMBER) RETURN VARCHAR2
     IS
       CURSOR medics(pid In NUMBER) IS SELECT med.pkgtmedic.getnamebyid(medic_id) as medic from tnazmedlech where naz_id=pid;
       res varchar2(10000):='';
     BEGIN
       FOR i in medics(NAZID) LOOP
         res:=res||i.medic||', ';
       END LOOP;
       res:=SUBSTR(res, 0, LENGTH(res)-2);
       RETURN res;
     END;

		 procedure cancel_mednaz(pnazid IN number, psotrid in number, pcom in varchar2 default '') is
		 begin
       UPDATE tnazmed
          SET fp_status = get_nazcancel,
              FD_OTMENA = SYSDATE,
              FK_OTMENASOTRID = psotrid,
							FC_WHYOTMENA = pcom
        WHERE fk_id = pnazid;
		 end;
		 procedure rek_mednaz(pnazid IN number) is
		 begin
       UPDATE tnazmed
          SET fp_status = get_recomend
        WHERE fk_id = pnazid;
		 end;
		 procedure nevip_mednaz(pnazid IN number) is
		 begin
       UPDATE tnazmed
          SET fp_status = get_nevip
           WHERE fk_id = pnazid;
		 end;
     
		 procedure GET_TNAZMEDLECHVID_DOZA is
		 begin
       NULL;
		 end; 
 URA */    
-- Enter further code below as specified in the Package spec.
END;
/

SHOW ERRORS;


