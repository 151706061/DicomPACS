DROP PACKAGE ASU.PKG_MEDNAZ
/

--
-- PKG_MEDNAZ  (Package) 
--
CREATE OR REPLACE PACKAGE ASU."PKG_MEDNAZ" 
IS

--
-- To modify this template, edit file PKGSPEC.TXT in TEMPLATE
-- directory of SQL Navigator
--
-- Purpose: Briefly explain the functionality of the package
--
-- MODIFICATION HISTORY
-- Mikita      13.03.2002    Create
-- ---------   ------  ------------------------------------------
   -- Enter package declarations as shown below
      --Вставляет новую запись в назначения медикаментов, и возвращает код новой записи

/*  URA 
		 procedure rek_mednaz(pnazid IN number);
		 procedure nevip_mednaz(pnazid IN number);
   FUNCTION get_newnazid (psotrid IN NUMBER, ppacid IN NUMBER)
      RETURN NUMBER;
   --Изменяет данные новой записи на индивидуальное назначение
   PROCEDURE add_sam_naz (
      pnazid   IN   NUMBER,
      com      IN   VARCHAR2,
      pmedic   IN   VARCHAR2,
      days     IN   NUMBER,
      perday   IN   NUMBER
   );
   --Добавление медикамента к назначению
   PROCEDURE add_medic_to_naz (
      pnazid     IN   NUMBER,
      pmedicid   IN   NUMBER,
      colvo      IN   NUMBER, vrachid in number
   );
   --Изменяет данные новой записи на медикаментозное лечение.
   PROCEDURE add_naz (
      pnazid   IN   NUMBER,
      com      IN   VARCHAR2,
      days     IN   NUMBER,
      perday   IN   NUMBER
   );
   PROCEDURE add_naz (
      pnazid   IN   NUMBER,
      com      IN   VARCHAR2,
      days     IN   NUMBER,
      perday   IN   NUMBER,
      mo       IN   NUMBER,
      ptype    IN   NUMBER,
      ddate    in   date
   );
   --Удаление медикаментозного назначения или отмена назначения
   PROCEDURE del_medicnaz (
      pnazid    IN   NUMBER,
      psotrid   IN   NUMBER,
      com       IN   VARCHAR DEFAULT ''
   );
   --Удаление медикамента из назначения
   PROCEDURE del_medic_from_naz (pnazid IN NUMBER, pmedic IN NUMBER);
   --Удаление медикамента из назначения
   PROCEDURE del_medic_from_naz (pid IN NUMBER);
   --Изменение медикамента в назначении
   PROCEDURE upd_medic_in_naz (pid NUMBER, medicid IN NUMBER, pcolvo IN NUMBER);
   --Изменение индивидуального назначения
   PROCEDURE upd_sam_naz (
      pid      IN   NUMBER,
      medic    IN   VARCHAR2,
      days     IN   NUMBER,
      perday   IN   NUMBER,
      com      IN   VARCHAR2
   );
   --Изменение назначения
   PROCEDURE upd_med_naz (
      pid      IN   NUMBER,
      days     IN   NUMBER,
      perday   IN   NUMBER,
      com      IN   VARCHAR2
   );
   PROCEDURE upd_med_naz (
      pid      IN   NUMBER,
      days     IN   NUMBER,
      perday   IN   NUMBER,
      com      IN   VARCHAR2,
			mo			 IN number,
			sotr IN number,
            ptype in number
   );

	 --Учет медикаментов при проведении процедур
	 PROCEDURE calculation_proc_medics(presid IN number);
  PROCEDURE discard_proc_medics(presid IN number);
  PROCEDURE do_vid_medic(pnazid IN number, pIspol IN number);
  PROCEDURE do_vid_medic(pnazid IN number, pIspol in number, DAYS IN OUT NUMBER);
  PROCEDURE add_naz_dezh (
      pnazid   IN   NUMBER,
      com      IN   VARCHAR2,
      days     IN   NUMBER,
      perday   IN   NUMBER,
      mo       IN   NUMBER,
      ptype    IN   NUMBER,
      ddate    in   date
   );
  FUNCTION get_medicost(pmedicid IN number, pmoid IN number) RETURN NUMBER;
  FUNCTION GET_MEDICLIST(NAZID IN NUMBER) RETURN VARCHAR2;
  procedure cancel_mednaz(pnazid IN number, psotrid in number, pcom in varchar2 default '');
 ura */ 
END; -- Package spec
/

SHOW ERRORS;


