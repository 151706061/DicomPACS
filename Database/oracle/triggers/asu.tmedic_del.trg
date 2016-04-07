DROP TRIGGER ASU.TMEDIC_DEL
/

--
-- TMEDIC_DEL  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TMEDIC (Table)
--
CREATE OR REPLACE TRIGGER ASU."TMEDIC_DEL" 
 BEFORE 
 INSERT
 ON ASU.TMEDIC  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
   nTmp   ROWID;
BEGIN
-- Zhukov ������������ �������
/*   IF pkgtmedic.isExistsChilds(:old.fk_id) = 1 THEN
      raise_application_error (-20001, '�� �� ������ ������� ���� ����������, �.�. ���� ������ ��������� �� ����');
   END IF;
*/
  null;
END;
/
SHOW ERRORS;


