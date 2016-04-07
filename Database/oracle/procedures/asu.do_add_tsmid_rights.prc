DROP PROCEDURE ASU.DO_ADD_TSMID_RIGHTS
/

--
-- DO_ADD_TSMID_RIGHTS  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--   TSMID_RIGHT_SOTR (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_ADD_TSMID_RIGHTS" (pFK_SOTRID IN BINARY_INTEGER,
                                                pFK_SMIDID IN BINARY_INTEGER) IS
  --Created by TimurLan
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
      INSERT INTO TSMID_RIGHT_SOTR
        (FK_SOTRID, FK_SMID)
      VALUES
        (pFK_SOTRID, p.FK_ID);
    exception
      when others then
        if sqlcode = -6512 then
          null;
        end if;
    end;

  end loop;
  /*  for p in (SELECT FK_ID
              FROM TSMID
             WHERE TSMID.FL_SHOWANAL IN (1, 2)
               AND TSMID.FL_DEL = 0
             START WITH FK_ID = pFK_SMIDID
            CONNECT BY PRIOR FK_OWNER = FK_ID) loop
    begin
      INSERT INTO TSMID_RIGHTS
        (FK_SOTRID, FK_SMID)
      VALUES
        (pFK_SOTRID, p.FK_ID);
    exception when others then
      if sqlcode = -6512 then null; end if;
    end;
  end loop;

  for p in (SELECT FK_ID
              FROM TSMID
             WHERE TSMID.FL_SHOWANAL IN (1, 2)
               AND TSMID.FL_DEL = 0
             START WITH FK_ID = pFK_SMIDID
            CONNECT BY PRIOR FK_ID = FK_OWNER) loop
    begin
      INSERT INTO TSMID_RIGHTS
        (FK_SOTRID, FK_SMID)
      VALUES
        (pFK_SOTRID, p.FK_ID);
    exception when others then
      if sqlcode = -6512 then null; end if;
    end;
  end loop;by TimurLan*/
END;
/

SHOW ERRORS;


