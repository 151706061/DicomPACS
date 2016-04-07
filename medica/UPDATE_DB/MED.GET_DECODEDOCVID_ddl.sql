-- Start of DDL Script for Function MED.GET_DECODEDOCVID
-- Generated 23.01.2008 18:14:34 from MED@ASU

CREATE OR REPLACE 
FUNCTION med.get_decodedocvid (lfp_vid IN NUMBER,lfp_vidmove IN NUMBER := -1)
   RETURN VARCHAR2
IS
   res   VARCHAR2 (255);
BEGIN
   IF lfp_vid = 1 THEN
      res := 'Приход';
   ELSIF lfp_vid = 2 THEN
      res := 'Расход по требованию';
--      res := 'Перемещение';
   ELSIF lfp_vid = 3 THEN
      res := 'Расход';
--      res := 'Списание';
   ELSIF lfp_vid = 4 THEN
      res := 'В резерв';
   ELSIF lfp_vid = 5 THEN
      res := 'Из резерва';
   ELSIF lfp_vid = 6 THEN
      res := 'Возврат';
   ELSIF lfp_vid = 7 THEN
      res := 'Производство медикаментов';
   ELSIF lfp_vid = 8 THEN
      res := 'Списание медикаментов';
   ELSIF lfp_vid = 9 THEN
      res := 'Ввод остатков';
   END IF;

   RETURN res;
END GET_DECODEDOCVID;
/



-- End of DDL Script for Function MED.GET_DECODEDOCVID

