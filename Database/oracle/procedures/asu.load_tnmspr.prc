DROP PROCEDURE ASU.LOAD_TNMSPR
/

--
-- LOAD_TNMSPR  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TTNMSPR (Table)
--   TCLOBS (Table)
--
CREATE OR REPLACE PROCEDURE ASU.load_tnmspr(pid      in number,
                                            pSection in number,
                                            cl       out clob) is

  lpid number;
begin
  if pSection = 0 then
    select t.fc_class into lpid from asu.ttnmspr t where t.fk_id = pid;
  elsif pSection = 1 then
    select t.fc_anatom into lpid from asu.ttnmspr t where t.fk_id = pid;
  elsif pSection = 2 then
    select t.fc_reglimf into lpid from asu.ttnmspr t where t.fk_id = pid;
  elsif pSection = 3 then
    select t.fc_clinic into lpid from asu.ttnmspr t where t.fk_id = pid;
  elsif pSection = 4 then
    select t.fc_patanatom into lpid from asu.ttnmspr t where t.fk_id = pid;
  elsif pSection = 5 then
    select t.fc_gist into lpid from asu.ttnmspr t where t.fk_id = pid;
  elsif pSection = 6 then
    select t.fc_groupstage into lpid from asu.ttnmspr t where t.fk_id = pid;
  elsif pSection = 7 then
    select t.fc_resume into lpid from asu.ttnmspr t where t.fk_id = pid;
  end if;

  select t.fc_clob into cl from asu.tclobs t where t.fk_id = lpid;
  --update asu.tclobs t set t.fc_clob = empty_clob() where t.fk_id = lpid returning fc_clob into cl;
end;
/

SHOW ERRORS;


