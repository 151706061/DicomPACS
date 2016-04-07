-- Start of DDL Script for Function MED.DECODEDOC
-- Generated 30-апр-2007 10:55:08 from MED@ASU

CREATE OR REPLACE 
FUNCTION med.decodedoc (afp_vidmove in number:=1 )
  RETURN  varchar2
   IS
BEGIN
 if afp_vidmove=1 then
  return 'Перемещение';
 end if;
 if afp_vidmove=2 then
  return 'Требование';
 end if;
 if afp_vidmove=3 then
  return 'Неотложка';
 end if;
 if afp_vidmove=4 then
  return 'списание';
 end if;
 if afp_vidmove=5 then
  return 'расход';
 end if;
 if afp_vidmove=6 then
  return 'Возврат';
 end if;
 if afp_vidmove=7 then
  return 'Производство медикаментов';
 end if;
 if afp_vidmove=8 then
  return 'Списание медикаментов';
 end if;  
 if afp_vidmove=9 then
  return 'Ввод остатков';  
 end if;
END;
-- End of DDL Script for Function MED.DECODEDOC
/



-- End of DDL Script for Function MED.DECODEDOC

