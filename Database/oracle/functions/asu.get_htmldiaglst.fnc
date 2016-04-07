DROP FUNCTION ASU.GET_HTMLDIAGLST
/

--
-- GET_HTMLDIAGLST  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_LOB (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--   TCLOBS (Table)
--   GET_FULLPATH (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_HTMLDIAGLST" (Pfk_groupid IN NUMBER)
  RETURN NUMBER
IS
  CURSOR cDiags
  IS
    SELECT fc_name, fk_id
      FROM tsmid
     WHERE fk_default = pFK_GROUPID
     ORDER BY fc_name;

  CURSOR cSubDiags (pFK_OWNER IN NUMBER)
  IS
    SELECT fc_name
      FROM tsmid
     WHERE fk_owner = pFK_OWNER
     ORDER BY fn_order;

  sTmp   VARCHAR2(250);
  cl     CLOB;
  res    NUMBER;
  bFound boolean;
BEGIN
  INSERT INTO tclobs (fk_id, fc_clob)
       VALUES (-1, EMPTY_CLOB ())
    RETURNING fk_id, fc_clob INTO res, cl;
  sTmp:=get_fullpath(pFK_GROUPID);
  sTmp:='<h2>'||sTmp||'</h2>';
  dbms_lob.writeappend (cl, LENGTH (sTmp), sTmp);
  sTmp :=
  '<table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolorlight="#000000" bordercolordark="#FFFFFF" bgcolor="#FFFFFF" bordercolor="#FFFFFF" align="center">'||chr(13);
  dbms_lob.writeappend (cl, LENGTH (sTmp), sTmp);

  FOR i IN cDiags
  LOOP
    sTmp := '<tr><td valign = "top">' || i.fc_name || '</td><td>'||chr(13);
    dbms_lob.writeappend (cl, LENGTH (sTmp), sTmp);
    bFound:=FALSE;
    FOR j IN cSubDiags (i.fk_id)
    LOOP
      sTmp := j.fc_name || '<br>'||chr(13);
      dbms_lob.writeappend (cl, LENGTH (sTmp), sTmp);
      bFound:=true;
    END LOOP;

    if not bFound then
      sTmp := '<br></td></tr>'||chr(13);
    else
      sTmp := '</td></tr>'||chr(13);
    end if;
    dbms_lob.writeappend (cl, LENGTH (sTmp), sTmp);
  END LOOP;

  sTmp := '</table>'||chr(13);
  dbms_lob.writeappend (cl, LENGTH (sTmp), sTmp);
  COMMIT;
  RETURN res;
END;   -- Function GET_HTMLDIAGLST
/

SHOW ERRORS;


