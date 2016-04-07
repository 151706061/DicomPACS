DROP PROCEDURE ASU.DO_TSMID
/

--
-- DO_TSMID  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--   DS (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_TSMID" (pFK_OWNER IN NUMBER DEFAULT NULL, pFK_ID IN NUMBER DEFAULT NULL) IS --kolya


--1 ����� ����� ������� �����
 CURSOR cDed IS SELECT FK_ID, FK_OWNER, FC_NAME, FK_MKB10 FROM asu.DS WHERE NVL(FK_OWNER, 0) = NVL(pFK_OWNER, 0);

 pFK_ID1 NUMBER;

BEGIN
 FOR c IN cDed LOOP
--2 ������ � ����� ����� ������� �����
   INSERT INTO asu.TSMID(FK_OWNER, FC_NAME, FK_MKB10)
   VALUES(pFK_ID, c.FC_NAME, c.FK_MKB10)
--3 ���������� �������� ����� ������� �����
   RETURNING FK_ID INTO pFK_ID1;

   DO_TSMID(c.FK_ID, pFK_ID1);
 END LOOP;


END; -- Procedure created by Kolya 18 ��� 2005
/

SHOW ERRORS;


