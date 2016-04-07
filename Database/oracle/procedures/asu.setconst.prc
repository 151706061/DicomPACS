DROP PROCEDURE ASU.SETCONST
/

--
-- SETCONST  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TCONST (Table)
--
CREATE OR REPLACE PROCEDURE ASU.SetConst(aFC_FUNC Varchar2, aFN_CONST Number, aFC_NAME Varchar2 default '', aFC_COMMENT Varchar2 default '') IS
pragma autonomous_transaction;
  vFK_ID Number;
  vFC_NAME asu.TCONST.fc_name%type;
  vFC_COMMENT asu.TCONST.fc_comment%type;
begin
  execute immediate '
CREATE OR REPLACE FUNCTION ASU.' || aFC_FUNC || '
  RETURN NUMBER DETERMINISTIC
  IS -- Created by -= Exch79.exe =-
     -- ATTENTION! DO NOT MODIFY THIS FUNCTION MANUALLY!!!
BEGIN
  Return ' || to_char(aFN_CONST) || ';
END;
' ;

  execute immediate 'GRANT EXECUTE ON ASU.' || aFC_FUNC || ' TO PUBLIC';

  SELECT max(fk_id), max(FC_NAME), max(FC_COMMENT) into vFK_ID, vFC_NAME, vFC_COMMENT FROM asu.TCONST WHERE UPPER(FC_FUNC) = UPPER(aFC_FUNC);

  if vFK_ID is not null then
    if aFC_NAME is not null then
      vFC_NAME := aFC_NAME;
    end if;

    if aFC_COMMENT is not null then
      vFC_COMMENT := aFC_COMMENT;
    end if;

    UPDATE asu.TCONST SET FN_CONST = aFN_CONST, FC_NAME = vFC_NAME, FC_COMMENT = vFC_COMMENT WHERE FK_ID = vFK_ID;
    commit;
  else
    if aFC_NAME is null then
      vFC_NAME := aFC_FUNC;
    else
      vFC_NAME := aFC_NAME;
    end if;

    if aFC_COMMENT is null then
      vFC_COMMENT := aFC_FUNC;
    else
      vFC_COMMENT := aFC_COMMENT;
    end if;

    INSERT INTO asu.TCONST (FC_NAME, FC_FUNC, FN_CONST, FC_COMMENT) VALUES (vFC_NAME, Upper(aFC_FUNC), aFN_CONST, vFC_COMMENT);
    execute immediate 'CREATE PUBLIC SYNONYM ' || aFC_FUNC || ' FOR ASU.' || aFC_FUNC;
  end if;
end;
/

SHOW ERRORS;


