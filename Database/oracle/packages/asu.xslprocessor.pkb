DROP PACKAGE BODY ASU.XSLPROCESSOR
/

--
-- XSLPROCESSOR  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."XSLPROCESSOR" is

/**
 * Internal error
 */
INTERNAL_ERR CONSTANT NUMBER := -20000;

/**
 * Other errors
 */
PROCESSOR_ERR CONSTANT NUMBER := -20100;
FILE_ERR CONSTANT NUMBER := -20101;
CONN_ERR CONSTANT NUMBER := -20102;
NULL_ERR CONSTANT NUMBER := -20103;

/**
 * Package private methods
 */
PROCEDURE raise_app_error(ecode NUMBER, emesg VARCHAR2 := null) IS
BEGIN
   if ecode = PROCESSOR_ERR then
      raise_application_error(ecode,
                              'Error occurred while processing: ' || emesg);
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

/**
 * Returns a new processor instance
 */
FUNCTION newProcessor RETURN Processor is
   proc Processor;
BEGIN
   proc.ID := xslprocessorcover.newProcessor;
   return proc;
END newProcessor;

/**
 * Transforms input XML document using given DOMDocument and stylesheet
 */
FUNCTION processXSL(p Processor, ss Stylesheet, xmldoc xmldom.DOMDocument)
return xmldom.DOMDocumentFragment is
   err VARCHAR2(512) := null;
   docfrag xmldom.DOMDocumentFragment := null;
BEGIN
   if p.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;

   if xmldoc.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;

   if ss.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;

   docfrag.ID := xslprocessorcover.processXSLFromDoc(p.ID, ss.ID, xmldoc.ID,
                                                     err);

   if err is not null then
      raise_app_error(PROCESSOR_ERR, err);
   end if;

   return docfrag;
END processXSL;

/**
 * Transforms input XML document using given DOMDocument and stylesheet
 * and writes output to a file
 */
PROCEDURE processXSL(p Processor, ss Stylesheet,
            xmldoc xmldom.DOMDocument, dir varchar2, fileName varchar2) is
   err VARCHAR2(512) := null;
BEGIN
   if p.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;

   if xmldoc.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;

   if ss.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;

   xslprocessorcover.processXSLFromDocToFile(p.ID, ss.ID, xmldoc.ID,
                                          dir, filename, err);

   if err is not null then
      raise_app_error(PROCESSOR_ERR, err);
   end if;

END processXSL;

/**
 * Transforms input XML document using given DOMDocument and stylesheet
 * and writes output to a buffer
 */
PROCEDURE processXSL(p Processor, ss Stylesheet,
                    xmldoc xmldom.DOMDocument, buffer in out varchar2) is
   err VARCHAR2(512) := null;
BEGIN
   if p.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;

   if xmldoc.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;

   if ss.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;

   xslprocessorcover.processXSLFromDocToBuffer(p.ID, ss.ID, xmldoc.ID,
                                             buffer, err);

   if err is not null then
      raise_app_error(PROCESSOR_ERR, err);
   end if;

END processXSL;

/**
 * Transforms input XML document using given DOMDocument and stylesheet
 * and writes output to a CLOB
 */
PROCEDURE processXSL(p Processor, ss Stylesheet,
                    xmldoc xmldom.DOMDocument, cl in out clob) is
   err VARCHAR2(512) := null;
BEGIN
   if p.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;

   if xmldoc.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;

   if ss.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;

   xslprocessorcover.processXSLFromDocToClob(p.ID, ss.ID, xmldoc.ID,
                                             cl, err);

   if err is not null then
      raise_app_error(PROCESSOR_ERR, err);
   end if;

END processXSL;

/**
 * Transforms input XML document fragment using given DOMDocumentFragment and
 * stylesheet
 */
FUNCTION processXSL(p Processor, ss Stylesheet,
                    xmldf xmldom.DOMDocumentFragment)
return xmldom.DOMDocumentFragment is
   err VARCHAR2(512) := null;
   docfrag xmldom.DOMDocumentFragment := null;
BEGIN
   if p.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;

   if xmldf.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;

   if ss.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;

   docfrag.ID := xslprocessorcover.processXSLFromDoc(p.ID, ss.ID, xmldf.ID,
                                                     err);

   if err is not null then
      raise_app_error(PROCESSOR_ERR, err);
   end if;

   return docfrag;
END processXSL;

/**
 * Transforms input XML document using given DOMDocumentFragment and stylesheet
 * and writes output to a file
 */
PROCEDURE processXSL(p Processor, ss Stylesheet,
         xmldf xmldom.DOMDocumentFragment, dir varchar2, fileName varchar2) is
   err VARCHAR2(512) := null;
BEGIN
   if p.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;

   if xmldf.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;

   if ss.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;

   xslprocessorcover.processXSLFromDocToFile(p.ID, ss.ID, xmldf.ID,
                                         dir, filename, err);

   if err is not null then
      raise_app_error(PROCESSOR_ERR, err);
   end if;

END processXSL;

/**
 * Transforms input XML document using given DOMDocumentFragment and stylesheet
 * and writes output to a buffer
 */
PROCEDURE processXSL(p Processor, ss Stylesheet,
                   xmldf xmldom.DOMDocumentFragment, buffer in out varchar2) is
   err VARCHAR2(512) := null;
BEGIN
   if p.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;

   if xmldf.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;

   if ss.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;

   xslprocessorcover.processXSLFromDocToBuffer(p.ID, ss.ID, xmldf.ID,
                                             buffer, err);

   if err is not null then
      raise_app_error(PROCESSOR_ERR, err);
   end if;

END processXSL;

/**
 * Transforms input XML document using given DOMDocumentFragment and stylesheet
 * and writes output to a CLOB
 */
PROCEDURE processXSL(p Processor, ss Stylesheet,
                    xmldf xmldom.DOMDocumentFragment, cl in out clob) is
   err VARCHAR2(512) := null;
BEGIN
   if p.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;

   if xmldf.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;

   if ss.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;

   xslprocessorcover.processXSLFromDocToClob(p.ID, ss.ID, xmldf.ID,
                                             cl, err);

   if err is not null then
      raise_app_error(PROCESSOR_ERR, err);
   end if;

END processXSL;

/**
 * Sets errors to be sent to the specified file
 */
PROCEDURE setErrorLog(p Processor, fileName VARCHAR2) IS
BEGIN
   if p.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   xslprocessorcover.setErrorLog(p.ID, fileName);
END setErrorLog;

/**
 * Sets warnings TRUE - on, FALSE - off
 */
PROCEDURE showWarnings(p Processor, yes BOOLEAN) IS
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
   xslprocessorcover.showWarnings(p.ID, warn);
END showWarnings;

/**
 * Free the processor
 */
PROCEDURE freeProcessor(p Processor) IS
BEGIN
   if p.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   xslprocessorcover.freeProcessor(p.ID);
END freeProcessor;

PROCEDURE freeStylesheet(p Stylesheet) IS
BEGIN
   if p.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   xslstylesheetcover.freeStylesheet(p.ID);
END freeStylesheet;

/**
 * Create a new stylesheet using the given DOMDocument and reference URL
 */
FUNCTION newStylesheet(xmldoc xmldom.DOMDocument, ref varchar2)
return Stylesheet is
   err VARCHAR2(512) := null;
   ss  Stylesheet;
BEGIN
   if xmldoc.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   ss.ID := xslstylesheetcover.newStylesheetFromDoc(xmldoc.ID, ref, err);
   if err is not null then
      raise_app_error(PROCESSOR_ERR, err);
   end if;
   return ss;
END newStylesheet;

/**
 * Create a new stylesheet using the given input and reference URLs
 */
FUNCTION newStylesheet(inp varchar2, ref varchar2) return Stylesheet is
   err VARCHAR2(512) := null;
   ss  Stylesheet;
BEGIN
   ss.ID := xslstylesheetcover.newStylesheetFromURL(inp, ref, err);
   if err is not null then
      raise_app_error(PROCESSOR_ERR, err);
   end if;
   return ss;
END newStylesheet;

/**
 * Sets the value of a top-level stylesheet parameter.
 * The parameter value is expected to be a valid XPath expression (note
 * that string literal values would therefore have to be explicitly quoted).
 */
PROCEDURE setParam(ss Stylesheet, name VARCHAR2, value VARCHAR2) is
   err VARCHAR2(512) := null;
BEGIN
   if ss.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   xslstylesheetcover.setParam(ss.ID, name, value, err);
   if err is not null then
      raise_app_error(PROCESSOR_ERR, err);
   end if;
END setParam;

/**
 * Remove the top-level stylesheet parameter.
 */
PROCEDURE removeParam(ss Stylesheet, name VARCHAR2) is
   err VARCHAR2(512) := null;
BEGIN
   if ss.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   xslstylesheetcover.removeParam(ss.ID, name, err);
   if err is not null then
      raise_app_error(PROCESSOR_ERR, err);
   end if;
END removeParam;

/**
 * Resets the top-level stylesheet parameters.
 */
PROCEDURE resetParams(ss Stylesheet) is
   err VARCHAR2(512) := null;
BEGIN
   if ss.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   xslstylesheetcover.resetParams(ss.ID, err);
   if err is not null then
      raise_app_error(PROCESSOR_ERR, err);
   end if;
END resetParams;

/**
 * Transforms a node using the given stylesheet
 */
FUNCTION transformNode(n xmldom.DOMNode, ss Stylesheet)
return xmldom.DOMDocumentFragment is
   err VARCHAR2(512) := null;
   df  xmldom.DOMDocumentFragment;
BEGIN
   if n.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   if ss.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   df.ID := xmlnodecover.transformNode(n.ID, ss.ID, err);
   if err is not null then
      raise_app_error(PROCESSOR_ERR, err);
   end if;
   return df;
END transformNode;

/**
 * Selects nodes from the tree which match the given pattern
 */
FUNCTION selectNodes(n xmldom.DOMNode, pattern varchar2)
return xmldom.DOMNodeList is
   err VARCHAR2(512) := null;
   nl  xmldom.DOMNodeList;
BEGIN
   if n.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   nl.ID := xmlnodecover.selectNodes(n.ID, pattern, err);
   if err is not null then
      raise_app_error(PROCESSOR_ERR, err);
   end if;
   return nl;
END selectNodes;

/**
 * Selects the first node from the tree that matches the given pattern
 */
FUNCTION selectSingleNode(n xmldom.DOMNode, pattern varchar2)
return xmldom.DOMNode is
   err VARCHAR2(512) := null;
   res xmldom.DOMNode;
BEGIN
   if n.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   res.ID := xmlnodecover.selectSingleNode(n.ID, pattern, err);
   if err is not null then
      raise_app_error(PROCESSOR_ERR, err);
   end if;
   return res;
END selectSingleNode;

/**
 * Selects the value of the first node from the tree that matches the given
 * pattern
 */
FUNCTION valueOf(n xmldom.DOMNode, pattern varchar2)
return VARCHAR2 is
   err VARCHAR2(512) := null;
BEGIN
   if n.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   return xmlnodecover.valueOf(n.ID, pattern, err);
END valueOf;

end;
/

SHOW ERRORS;


