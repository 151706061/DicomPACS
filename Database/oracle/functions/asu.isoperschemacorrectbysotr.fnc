DROP FUNCTION ASU.ISOPERSCHEMACORRECTBYSOTR
/

--
-- ISOPERSCHEMACORRECTBYSOTR  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSOTR (Synonym)
--   TOPERSCHEMAANAEST (Table)
--   TOPERSCHEMAOPERBLOCK (Table)
--   TOPERSCHEMASURGEON (Table)
--   TNAZOPER_NAZ (Table)
--
CREATE OR REPLACE FUNCTION ASU."ISOPERSCHEMACORRECTBYSOTR" (pFK_NAZID in number, pOperScemain number ) RETURN  NUMBER IS
nCount number;
BEGIN
   select count(1) into nCount from ASU.Tnazoper_Naz where ASU.Tnazoper_Naz.FK_NAZID = pFK_NAZID;
   if nCount = 0 then
     nCount := 1;
    else
     select count(1) into nCount from ASU.Tnazoper_Naz,ASU.TSotr where ASU.Tnazoper_Naz.FK_NAZID = pFK_NAZID
      and
     ASU.Tsotr.FK_ID = ASU.Tnazoper_Naz.FK_SOTRID
     and
      not exists
      (select 1 from (
        select FK_OTDELID from ASU.Toperschemasurgeon where ASU.Toperschemasurgeon.FK_OPERSCHEMAID = pOperScemain
         union
        select FK_OTDELID from ASU.Toperschemaanaest where ASU.Toperschemaanaest.FK_OPERSCHEMAID = pOperScemain
         union
        select FK_OTDELID from ASU.ToperschemaOperBlock where ASU.ToperschemaOperBlock.FK_OPERSCHEMAID = pOperScemain ) T
        where T.FK_OTDELID = ASU.tSotr.FK_OTDELID
      );

     if nCount>0 then
      nCount := 0;
     else
      nCount := 1;
     end if;
   end if;

return nCount;
END;
/

SHOW ERRORS;


