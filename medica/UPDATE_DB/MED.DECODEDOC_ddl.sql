-- Start of DDL Script for Function MED.DECODEDOC
-- Generated 30-���-2007 10:55:08 from MED@ASU

CREATE OR REPLACE 
FUNCTION med.decodedoc (afp_vidmove in number:=1 )
  RETURN  varchar2
   IS
BEGIN
 if afp_vidmove=1 then
  return '�����������';
 end if;
 if afp_vidmove=2 then
  return '����������';
 end if;
 if afp_vidmove=3 then
  return '���������';
 end if;
 if afp_vidmove=4 then
  return '��������';
 end if;
 if afp_vidmove=5 then
  return '������';
 end if;
 if afp_vidmove=6 then
  return '�������';
 end if;
 if afp_vidmove=7 then
  return '������������ ������������';
 end if;
 if afp_vidmove=8 then
  return '�������� ������������';
 end if;  
 if afp_vidmove=9 then
  return '���� ��������';  
 end if;
END;
-- End of DDL Script for Function MED.DECODEDOC
/



-- End of DDL Script for Function MED.DECODEDOC

