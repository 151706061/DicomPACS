DROP PROCEDURE ASU.CREATE_KLADR_UPDATE_JOB
/

--
-- CREATE_KLADR_UPDATE_JOB  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   DBMS_JOB (Synonym)
--
CREATE OR REPLACE PROCEDURE ASU.create_kladr_update_job IS
 i NUMBER;
BEGIN
 dbms_job.submit(job  => i,
                 what =>
                  /*'begin
                                    insert into asu.tst_job3(a) values(1);
                                    end;'*/ 'BEGIN
 EXECUTE IMMEDIATE ''ALTER TRIGGER asu.tadress_before_update disable'';
 FOR c IN (SELECT * FROM asu.TKLADR_ADDR_UPDATE WHERE FK_NEW_KLADR IS NOT NULL) LOOP
  UPDATE asu.tadress SET fk_kladr = c.FK_NEW_KLADR WHERE fk_id = c.FK_ADDRID;
  UPDATE ASU.TKLADR_ADDR_UPDATE SET FB_DONE = 1 WHERE FK_ADDRID = c.FK_ADDRID;
  COMMIT;
 END LOOP;
 EXECUTE IMMEDIATE ''ALTER TRIGGER asu.tadress_before_update enable'';
END;');
 COMMIT;
END CREATE_KLADR_UPDATE_JOB;
/

SHOW ERRORS;


