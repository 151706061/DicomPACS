DROP TRIGGER ASU.TINSURDOCS_AFTER_INS_UPD_DEL
/

--
-- TINSURDOCS_AFTER_INS_UPD_DEL  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   TTYPEDOC (Table)
--   TINSURDOCS (Table)
--   TINSURNOTDOCS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TINSURDOCS_AFTER_INS_UPD_DEL" 
 AFTER
  INSERT OR DELETE OR UPDATE
 ON asu.tinsurdocs
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
    FOR c in (select count(0) n from asu.ttypedoc where ttypedoc.fl_notdoc = 1 and (:new.FK_TYPEDOCID=ttypedoc.FK_ID or :old.FK_TYPEDOCID=ttypedoc.FK_ID))
    LOOP
        if c.n > 0 then
            if INSERTING then
                insert into asu.tinsurnotdocs values (0, :new.fk_id, :new.FK_TYPEDOCID);
            elsif UPDATING then
                update asu.tinsurnotdocs set fk_typeDoc=:new.FK_TYPEDOCID where fk_insurID=:new.fk_id;
            elsif DELETING then
                delete from asu.tinsurnotdocs where fk_insurID=:old.fk_id;
            end if;
        end if;
    END LOOP;
END;
/
SHOW ERRORS;


