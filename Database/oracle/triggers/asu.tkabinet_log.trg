DROP TRIGGER ASU.TKABINET_LOG
/

--
-- TKABINET_LOG  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   PKG_LOG (Package)
--   TKABINET (Table)
--
CREATE OR REPLACE TRIGGER ASU."TKABINET_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TKABINET  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  nTemp NUMBER;
BEGIN
  if DELETING then
    PKG_LOG.Do_log('TKABINET', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_id), null, :old.fk_id);
    PKG_LOG.Do_log('TKABINET', 'FC_NAME', 'DELETE', PKG_LOG.GET_VALUE(:old.fc_name), null, :old.fk_id);
  end if;
  null;
END TKABINET_LOG;
/
SHOW ERRORS;


