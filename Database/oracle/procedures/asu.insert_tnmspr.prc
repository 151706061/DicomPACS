DROP PROCEDURE ASU.INSERT_TNMSPR
/

--
-- INSERT_TNMSPR  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TTNMSPR (Table)
--   TCLOBS (Table)
--
CREATE OR REPLACE PROCEDURE ASU.INSERT_TNMSPR(pid in number, pSprID in number, pSection in number, cl in out clob) is
  lpid number;
  ClobID number;
begin
    if pid = 0 then
      insert into asu.tclobs(fc_clob) values(empty_clob()) returning fk_id, fc_clob into ClobID, cl;

      if pSection = 0 then
        update asu.ttnmspr t set t.fc_class = ClobID where t.fk_id = pSprID;
      elsif pSection = 1 then
        update asu.ttnmspr t set t.fc_anatom = ClobID where t.fk_id = pSprID;
      elsif pSection = 2 then
        update asu.ttnmspr t set t.fc_reglimf = ClobID where t.fk_id = pSprID;
      elsif pSection = 3 then
        update asu.ttnmspr t set t.fc_clinic = ClobID where t.fk_id = pSprID;
      elsif pSection = 4 then
        update asu.ttnmspr t set t.fc_patanatom = ClobID where t.fk_id = pSprID;
      elsif pSection = 5 then
        update asu.ttnmspr t set t.fc_gist = ClobID where t.fk_id = pSprID;
      elsif pSection = 6 then
        update asu.ttnmspr t set t.fc_groupstage = ClobID where t.fk_id = pSprID;
      elsif pSection = 7 then
        update asu.ttnmspr t set t.fc_resume = ClobID where t.fk_id = pSprID;
      end if;
    else
      if pSection = 0 then
        select t.fc_class into lpid from asu.ttnmspr t where t.fk_id = pSprID;
      elsif pSection = 1 then
        select t.fc_anatom into lpid from asu.ttnmspr t where t.fk_id = pSprID;
      elsif pSection = 2 then
        select t.fc_reglimf into lpid from asu.ttnmspr t where t.fk_id = pSprID;
      elsif pSection = 3 then
        select t.fc_clinic into lpid from asu.ttnmspr t where t.fk_id = pSprID;
      elsif pSection = 4 then
        select t.fc_patanatom into lpid from asu.ttnmspr t where t.fk_id = pSprID;
      elsif pSection = 5 then
        select t.fc_gist into lpid from asu.ttnmspr t where t.fk_id = pSprID;
      elsif pSection = 6 then
        select t.fc_groupstage into lpid from asu.ttnmspr t where t.fk_id = pSprID;
      elsif pSection = 7 then
        select t.fc_resume into lpid from asu.ttnmspr t where t.fk_id = pSprID;
      end if;

      --select t.fc_clob into cl from asu.tclobs t where t.fk_id = lpid;
      update asu.tclobs t set t.fc_clob = empty_clob() where t.fk_id = lpid returning fc_clob into cl;
    end if;
end;
/

SHOW ERRORS;


