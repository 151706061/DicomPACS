DROP PROCEDURE ASU.DO_ADD_TSMID_RIGHTS_GROUP
/

--
-- DO_ADD_TSMID_RIGHTS_GROUP  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--   TSMID_RIGHTS_GROUP (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_ADD_TSMID_RIGHTS_GROUP" (pFK_GROUPID IN BINARY_INTEGER,
                                                pFK_SMIDID IN BINARY_INTEGER) IS
BEGIN
  for p in (SELECT DISTINCT FK_ID
              FROM TSMID
             WHERE FL_DEL = 0
             START WITH FK_ID IN
                        (SELECT FK_ID
                           FROM TSMID
                          WHERE FL_SHOWANAL IN (1, 2)
                          START WITH FK_ID = pFK_SMIDID
                         CONNECT BY PRIOR FK_ID = FK_OWNER)
            CONNECT BY PRIOR FK_OWNER = FK_ID) loop
    begin
      INSERT INTO TSMID_RIGHTS_GROUP
        (FK_GROUPID, FK_SMID)
      VALUES
        (pFK_GROUPID, p.FK_ID);
    exception
      when others then
        if sqlcode = -6512 then
          null;
        end if;
    end;

  end loop;
END;
/

SHOW ERRORS;


