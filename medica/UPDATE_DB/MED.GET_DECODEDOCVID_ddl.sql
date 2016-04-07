-- Start of DDL Script for Function MED.GET_DECODEDOCVID
-- Generated 23.01.2008 18:14:34 from MED@ASU

CREATE OR REPLACE 
FUNCTION med.get_decodedocvid (lfp_vid IN NUMBER,lfp_vidmove IN NUMBER := -1)
   RETURN VARCHAR2
IS
   res   VARCHAR2 (255);
BEGIN
   IF lfp_vid = 1 THEN
      res := '������';
   ELSIF lfp_vid = 2 THEN
      res := '������ �� ����������';
--      res := '�����������';
   ELSIF lfp_vid = 3 THEN
      res := '������';
--      res := '��������';
   ELSIF lfp_vid = 4 THEN
      res := '� ������';
   ELSIF lfp_vid = 5 THEN
      res := '�� �������';
   ELSIF lfp_vid = 6 THEN
      res := '�������';
   ELSIF lfp_vid = 7 THEN
      res := '������������ ������������';
   ELSIF lfp_vid = 8 THEN
      res := '�������� ������������';
   ELSIF lfp_vid = 9 THEN
      res := '���� ��������';
   END IF;

   RETURN res;
END GET_DECODEDOCVID;
/



-- End of DDL Script for Function MED.GET_DECODEDOCVID

