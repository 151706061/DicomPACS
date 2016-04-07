DROP PACKAGE BODY ASU.XMLPARSER
/

--
-- XMLPARSER  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."XMLPARSER" is

/**
 * Internal error
 */
INTERNAL_ERR CONSTANT NUMBER := -20000;

/**
 * Other errors
 */
PARSE_ERR CONSTANT NUMBER := -20100;
FILE_ERR CONSTANT NUMBER := -20101;
CONN_ERR CONSTANT NUMBER := -20102;
NULL_ERR CONSTANT NUMBER := -20103;

/**
 * Package private methods
 */
PROCEDURE raise_app_error(ecode NUMBER, emesg VARCHAR2 := null) IS
BEGIN
   if ecode = PARSE_ERR then
      raise_application_error(ecode,
                              'Error occurred while parsing: ' || emesg);
   elsif ecode = FILE_ERR then
      raise_application_error(ecode,
                              'Error occurred while accessing a file or URL: '
                              || emesg);
   elsif ecode = CONN_ERR then
      raise_application_error(ecode,
                              'Error occurred while making connection: '
                              || emesg);
   elsif ecode = NULL_ERR then
      raise_application_error(ecode, 'Null input is not allowed');
   else
      raise_application_error(INTERNAL_ERR,
                              'An internal error has occurred: ' || emesg);
   end if;
END raise_app_error;

FUNCTION parse(url VARCHAR2) RETURN xmldom.DOMDocument IS
   prs NUMBER;
   doc xmldom.DOMDocument;
   err VARCHAR2(512) := null;
BEGIN
   prs := xmlparsercover.newParser;
   xmlparsercover.parse(prs, url, err);
   if err is not null then
      raise_app_error(PARSE_ERR, err);
   end if;
   doc.ID := xmlparsercover.getDocument(prs);
   return doc;
END parse;

FUNCTION newParser RETURN Parser IS
   prs Parser;
BEGIN
   prs.ID := xmlparsercover.newParser;
   return prs;
END newParser;

PROCEDURE parse(p Parser, url VARCHAR2) IS
   err VARCHAR2(512) := null;
BEGIN
   if p.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   xmlparsercover.parse(p.ID, url, err);
   if err is not null then
      raise_app_error(PARSE_ERR, err);
   end if;
END parse;

PROCEDURE parseBuffer(p Parser, doc VARCHAR2) IS
   err VARCHAR2(512) := null;
BEGIN
   if p.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   xmlparsercover.parseBuffer(p.ID, doc, err);
   if err is not null then
      raise_app_error(PARSE_ERR, err);
   end if;
END parseBuffer;

PROCEDURE parseClob(p Parser, doc CLOB) IS
   err VARCHAR2(512) := null;
BEGIN
   if p.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   xmlparsercover.parseClob(p.ID, doc, err);
   if err is not null then
      raise_app_error(PARSE_ERR, err);
   end if;
END parseClob;

PROCEDURE parseDTD(p Parser, url VARCHAR2, root VARCHAR2) IS
   err VARCHAR2(512) := null;
BEGIN
   if p.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   xmlparsercover.parseDTD(p.ID, url, root, err);
   if err is not null then
      raise_app_error(PARSE_ERR, err);
   end if;
END parseDTD;

PROCEDURE parseDTDBuffer(p Parser, dtd VARCHAR2, root VARCHAR2) IS
   err VARCHAR2(512) := null;
BEGIN
   if p.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   xmlparsercover.parseDTDBuffer(p.ID, dtd, root, err);
   if err is not null then
      raise_app_error(PARSE_ERR, err);
   end if;
END parseDTDBuffer;

PROCEDURE parseDTDClob(p Parser, dtd CLOB, root VARCHAR2) IS
   err VARCHAR2(512) := null;
BEGIN
   if p.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   xmlparsercover.parseDTDClob(p.ID, dtd, root, err);
   if err is not null then
      raise_app_error(PARSE_ERR, err);
   end if;
END parseDTDClob;

PROCEDURE setBaseDir(p Parser, dir VARCHAR2) IS
   err VARCHAR2(512) := null;
   len number;
   lastchr varchar2(1);
BEGIN
   if p.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   len := length(dir);
   lastchr := substr(dir, len, 1);
   if lastchr != '/' then
      xmlparsercover.setBaseURL(p.ID, dir || '/', err);
   else
      xmlparsercover.setBaseURL(p.ID, dir, err);
   end if;
   if err is not null then
      raise_app_error(FILE_ERR, err);
   end if;
END setBaseDir;

/**
 * Sets warnings TRUE - on, FALSE - off
 */
PROCEDURE showWarnings(p Parser, yes BOOLEAN) IS
   warn NUMBER;
BEGIN
   if p.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   if yes = TRUE then
      warn := 1;
   else
      warn := 0;
   end if;
   xmlparsercover.showWarnings(p.ID, warn);
END showWarnings;

PROCEDURE freeParser(p Parser) IS
BEGIN
   if p.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   xmlparsercover.freeParser(p.ID);
END freeParser;

PROCEDURE setErrorLog(p Parser, fileName VARCHAR2) IS
BEGIN
   if p.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   xmlparsercover.setErrorLog(p.ID, fileName);
END setErrorLog;

PROCEDURE setValidationMode(p Parser, yes BOOLEAN) IS
   valid NUMBER;
BEGIN
   if p.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   if yes = TRUE then
      valid := 1;
   else
      valid := 0;
   end if;
   xmlparsercover.setValidationMode(p.ID, valid);
END setValidationMode;

PROCEDURE setPreserveWhitespace(p Parser, yes BOOLEAN) IS
   valid NUMBER;
BEGIN
   if p.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   if yes = TRUE then
      valid := 1;
   else
      valid := 0;
   end if;
   xmlparsercover.setPreserveWhitespace(p.ID, valid);
END setPreserveWhitespace;

FUNCTION getValidationMode(p Parser) RETURN BOOLEAN IS
   valid NUMBER;
BEGIN
   if p.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   valid := xmlparsercover.getValidationMode(p.ID);
   if valid = 1 then
      return TRUE;
   else
      return FALSE;
   end if;
END getValidationMode;

/**
 * Sets DTD for validation purposes - MUST be before an xml document is parsed
 */
PROCEDURE setDoctype(p Parser, dtd xmldom.DOMDocumentType) is
BEGIN
   if p.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   if dtd.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   xmlparsercover.setDoctype(p.ID, dtd.ID);
END setDoctype;

/**
 * Gets DTD parsed - MUST be called only after a dtd is parsed
 */
FUNCTION getDoctype(p Parser) RETURN xmldom.DOMDocumentType is
   err VARCHAR2(512) := null;
   dtd xmldom.DOMDocumentType;
BEGIN
   if p.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   dtd.ID := xmlparsercover.getDoctype(p.ID);
   return dtd;
END getDoctype;

FUNCTION getDocument(p Parser) RETURN xmldom.DOMDocument IS
   doc xmldom.DOMDocument;
BEGIN
   if p.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   doc.ID := xmlparsercover.getDocument(p.ID);
   return doc;
END getDocument;

end;
/

SHOW ERRORS;


