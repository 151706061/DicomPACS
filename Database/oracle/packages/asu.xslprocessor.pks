DROP PACKAGE ASU.XSLPROCESSOR
/

--
-- XSLPROCESSOR  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--   XMLDOM (Package)
--
CREATE OR REPLACE PACKAGE ASU."XSLPROCESSOR" as

/**
 * Processor interface type
 */
TYPE Processor IS RECORD ( ID NUMBER NOT NULL := -1);

/**
 * Stylesheet interface type
 */
TYPE Stylesheet IS RECORD ( ID NUMBER NOT NULL := -1);

/**
 * Returns a new processor instance
 */
FUNCTION newProcessor RETURN Processor;

/**
 * Free XSL Processor
 */
PROCEDURE freeProcessor(p Processor);

/**
 * Transforms input XML document using given DOMDocument and stylesheet
 */
FUNCTION processXSL(p Processor, ss Stylesheet,
                    xmldoc xmldom.DOMDocument)
return xmldom.DOMDocumentFragment;

/**
 * Transforms input XML document using given DOMDocument and stylesheet
 * and writes output to a file
 */
PROCEDURE processXSL(p Processor, ss Stylesheet,
                   xmldoc xmldom.DOMDocument, dir varchar2, fileName varchar2);

/**
 * Transforms input XML document using given DOMDocument and stylesheet
 * and writes output to a buffer
 */
PROCEDURE processXSL(p Processor, ss Stylesheet,
                    xmldoc xmldom.DOMDocument, buffer in out varchar2);

/**
 * Transforms input XML document using given DOMDocument and stylesheet
 * and writes output to a CLOB
 */
PROCEDURE processXSL(p Processor, ss Stylesheet,
                    xmldoc xmldom.DOMDocument, cl in out clob);

/**
 * Transforms input XML document fragment using given DOMDocumentFragment and
 * stylesheet
 */
FUNCTION processXSL(p Processor, ss Stylesheet,
                   xmldf xmldom.DOMDocumentFragment)
return xmldom.DOMDocumentFragment;

/**
 * Transforms input XML document fragment using given DOMDocumentFragment
 * and stylesheet and writes output to a file
 */
PROCEDURE processXSL(p Processor, ss Stylesheet,
            xmldf xmldom.DOMDocumentFragment, dir varchar2, fileName varchar2);

/**
 * Transforms input XML document fragment using given DOMDocumentFragment
 * and stylesheet and writes output to a buffer
 */
PROCEDURE processXSL(p Processor, ss Stylesheet,
                    xmldf xmldom.DOMDocumentFragment, buffer in out varchar2);

/**
 * Transforms input XML document fragment using given DOMDocumentFragment
 * and stylesheet and writes output to a CLOB
 */
PROCEDURE processXSL(p Processor, ss Stylesheet,
                    xmldf xmldom.DOMDocumentFragment, cl in out clob);

/**
 * Sets errors to be sent to the specified file
 */
PROCEDURE setErrorLog(p Processor, fileName VARCHAR2);

/**
 * Sets warnings TRUE - on, FALSE - off
 */
PROCEDURE showWarnings(p Processor, yes BOOLEAN);

/**
 * Create a new stylesheet using the given DOMDocument and reference URL
 */
FUNCTION newStylesheet(xmldoc xmldom.DOMDocument, ref varchar2)
return Stylesheet;

/**
 * Create a new stylesheet using the given input and reference URLs
 */
FUNCTION newStylesheet(inp varchar2, ref varchar2) return Stylesheet;

PROCEDURE freeStylesheet(p Stylesheet);

/**
 * Sets the value of a top-level stylesheet parameter.
 * The parameter value is expected to be a valid XPath expression (note
 * that string literal values would therefore have to be explicitly quoted).
 */
PROCEDURE setParam(ss Stylesheet, name VARCHAR2, value VARCHAR2);

/**
 * Remove a top-level stylesheet parameter.
 */
PROCEDURE removeParam(ss Stylesheet, name VARCHAR2);

/**
 * Resets the top-level stylesheet parameters.
 */
PROCEDURE resetParams(ss Stylesheet);

/**
 * Transforms a node in the tree using the given stylesheet
 */
FUNCTION transformNode(n xmldom.DOMNode, ss Stylesheet)
return xmldom.DOMDocumentFragment;

/**
 * Selects nodes from the tree which match the given pattern
 */
FUNCTION selectNodes(n xmldom.DOMNode, pattern varchar2)
return xmldom.DOMNodeList;

/**
 * Selects the first node from the tree that matches the given pattern
 */
FUNCTION selectSingleNode(n xmldom.DOMNode, pattern varchar2)
return xmldom.DOMNode;

/**
 * Retrieves the value of the first node from the tree that matches the given
 * pattern
 */
FUNCTION valueOf(n xmldom.DOMNode, pattern varchar2)
return VARCHAR2;

end xslprocessor;
/

SHOW ERRORS;


