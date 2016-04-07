DROP FUNCTION ASU.GET_XML_FROM_FOMS
/

--
-- GET_XML_FROM_FOMS  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   UTL_HTTP (Synonym)
--   UTL_URL (Synonym)
--   DBMS_LOB (Synonym)
--   DBMS_OUTPUT (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   PKG_OFOMS_INFO (Package)
--   PKG_SMINI (Package)
--
CREATE OR REPLACE FUNCTION ASU.GET_XML_FROM_FOMS(pFIOGR IN VARCHAR2 /*, pErr_Code OUT NUMBER*/) RETURN CLOB IS
   clTemp CLOB;
   req   UTL_HTTP.REQ;
   resp  UTL_HTTP.RESP;
   value VARCHAR2(2000);
   foms_url VARCHAR2(256);
   strLogin VARCHAR2(256);
   strPass VARCHAR2(256);
   sendText VARCHAR2(512);
   pErr_Code NUMBER;
   err_num       NUMBER;
   err_msg       CHAR(400);
BEGIN
   pErr_Code := 0;

   DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.CALL);

   foms_url := asu.pkg_smini.READSTRING('CONFIG', 'HTTP_URL_INSURANCE', '');
   strLogin := ASU.PKG_OFOMS_INFO.GetLOG;
   strPass := ASU.PKG_OFOMS_INFO.GetPAS;

   DBMS_OUTPUT.put_line(foms_url);

   sendText := 'username=' || strLogin || '&password=' || strPass || '&s=' ||  utl_url.escape(pFIOGR, FALSE,  'UTF-8') || '&rtype=xml' ;
   DBMS_OUTPUT.put_line(sendText);
   req := UTL_HTTP.BEGIN_REQUEST(foms_url, 'POST');
   DBMS_OUTPUT.put_line(foms_url);
   --UTL_HTTP.SET_BODY_CHARSET('UTF-8');
   UTL_HTTP.SET_HEADER(req, 'Host', 'portal.tfoms');
   UTL_HTTP.SET_HEADER(req, 'User-Agent', 'Mozilla/4.0');
   UTL_HTTP.SET_HEADER(req, 'Content-Type', 'application/x-www-form-urlencoded');
   utl_http.set_header(req, 'content-length', length(sendText));

   UTL_HTTP.write_line(req, sendText);
   resp := UTL_HTTP.GET_RESPONSE(req);
   LOOP
        UTL_HTTP.READ_Text(resp, value);
        DBMS_LOB.writeappend(clTemp, LENGTH(value), value);
   END LOOP;
   UTL_HTTP.END_RESPONSE(resp);
   UTL_HTTP.end_request(req);

   RETURN clTemp;

EXCEPTION
  WHEN utl_http.end_of_body THEN
    utl_http.end_response(resp);
    pErr_Code := -1;

    err_num := SQLCODE;
    err_msg := SUBSTR(SQLERRM, 1, 100);
    DBMS_OUTPUT.put_line(err_num);
    DBMS_OUTPUT.put_line(err_msg);
    Return clTemp;

  WHEN OTHERS THEN
    pErr_Code := 1;

    err_num := SQLCODE;
    err_msg := SUBSTR(SQLERRM, 1, 100);
    DBMS_OUTPUT.put_line(err_num);
    DBMS_OUTPUT.put_line(err_msg);
    Return clTemp;
END;
/

SHOW ERRORS;


