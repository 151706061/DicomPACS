DROP FUNCTION ASU.GET_LOCAL_DIAG_BY_SMID
/

--
-- GET_LOCAL_DIAG_BY_SMID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU.GET_LOCAL_DIAG_BY_SMID(AID in number) return varchar2 is

  sResult varchar2(200);

  cursor c(pID in number) is
    select max(fc_remark)
      from (select fc_remark,
                   row_number() over(order by level) AS rn
              from asu.tsmid s
             where s.fc_remark is not null
             start with s.fk_id = pID
           connect by fk_id = prior fk_owner
           )
     where rn = 1;

begin
  sResult := null;

  open  c(AID);
  fetch c into sResult;
  close c;

  return nvl(sResult, ' ');
end;
/

SHOW ERRORS;


