DROP PROCEDURE ASU.DO_ADD_NAZAUTODONE
/

--
-- DO_ADD_NAZAUTODONE  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZAUTODONE (Table)
--   TSMID (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_ADD_NAZAUTODONE" (pFK_SMIDID IN BINARY_INTEGER) IS
BEGIN
  for p in (SELECT DISTINCT FK_ID
              FROM TSMID
             WHERE FL_DEL = 0
             START WITH FK_ID IN
                        (SELECT FK_ID
                           FROM TSMID
                          WHERE FL_SHOWANAL = 1
                          START WITH FK_ID = pFK_SMIDID
                         CONNECT BY PRIOR FK_ID = FK_OWNER)
            CONNECT BY PRIOR FK_OWNER = FK_ID) loop
    begin
      INSERT INTO TNAZAUTODONE
        (FK_SMID)
      VALUES
        (p.FK_ID);
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


