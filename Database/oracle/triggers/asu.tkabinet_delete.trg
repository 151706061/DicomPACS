DROP TRIGGER ASU.TKABINET_DELETE
/

--
-- TKABINET_DELETE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   DBMS_STANDARD (Package)
--   TNAZVRACH (View)
--   TKABINET (Table)
--   VNAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU."TKABINET_DELETE" 
  BEFORE DELETE
  ON ASU.TKABINET   REFERENCING NEW AS NEW OLD AS OLD
  FOR EACH ROW
declare
cursor c1 is select '����' from dual where exists (select fk_id from tnazvrach where fk_kabinetid = :old.fk_id);
cursor c2 is select '����' from dual where exists (select fc_name from vnaz where fk_roomid = :old.fk_id);
Begin
  open c1;
  if not c1%notfound then
    raise_application_error(-20001, '� ������� ���� ���������� ���������� ������� ������ �� ���� �������! ���� ������� �� ����� ���� ������.');
    close c1;
    return;
  end if;
  open c2;
  if not c2%notfound then
    raise_application_error(-20001, '� ���� �������� ��� ����������� ����������! ���� ������� �� ����� ���� ������.');
    close c2;
    return;
  end if;
End;
/
SHOW ERRORS;


