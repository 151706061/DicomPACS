DROP FUNCTION ASU.GET_IMUNNO_CLASS
/

--
-- GET_IMUNNO_CLASS  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU.GET_IMUNNO_CLASS(pFN_VALUE in number)
return varchar2
is
begin
if pFN_VALUE is NULL then
  RETURN '';
else
  if pFN_VALUE >= 0.0 and pFN_VALUE < 0.35 then
   RETURN '����� 0';
  else
   if pFN_VALUE >= 0.35 and pFN_VALUE < 0.70 then
    RETURN '����� 1';
   else
    if pFN_VALUE >= 0.70 and pFN_VALUE < 3.5 then
     RETURN '����� 2';
    else
     if pFN_VALUE >= 3.5 and pFN_VALUE < 17.5 then
      RETURN '����� 3';
     else
       if pFN_VALUE >= 17.5 and pFN_VALUE < 52.5 then
        RETURN '����� 4';
       else
        if pFN_VALUE >= 52.5 and pFN_VALUE < 100 then
         RETURN '����� 5';
        else
         RETURN '����� 6';
       end if;
      end if;
     end if;
    end if;
   end if;
  end if;
 end if;

end;
/

SHOW ERRORS;


