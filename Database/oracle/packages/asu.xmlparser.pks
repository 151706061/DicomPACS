DROP PACKAGE ASU.XMLPARSER
/

--
-- XMLPARSER  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--   XMLDOM (Package)
--
CREATE OR REPLACE PACKAGE ASU."XMLPARSER" as

/**
 * Parser interface type
 */
TYPE Parser IS RECORD ( ID NUMBER(12) NOT NULL := -1 );

/**
 * Parses xml stored in the given url/file and returns the built DOM Document
 */
FUNCTION parse(url VARCHAR2) RETURN xmldom.DOMDocument;

/**
 * Returns a new parser instance
 */
FUNCTION newParser RETURN Parser;

PROCEDURE freeParser(p Parser);

/**
 * Parses xml stored in the given url/file
 */
PROCEDURE parse(p Parser, url VARCHAR2);

/**
 * Parses xml stored in the given buffer
 */
PROCEDURE parseBuffer(p Parser, doc VARCHAR2);

/**
 * Parses xml stored in the given clob
 */
PROCEDURE parseClob(p Parser, doc CLOB);

/**
 * Parses the given dtd
 */
PROCEDURE parseDTD(p Parser, url VARCHAR2, root VARCHAR2);

/**
 * Parses the given dtd
 */
PROCEDURE parseDTDBuffer(p Parser, dtd VARCHAR2, root VARCHAR2);

/**
 * Parses the given dtd
 */
PROCEDURE parseDTDClob(p Parser, dtd CLOB, root VARCHAR2);

/**
 * Sets base directory used to resolve relative urls
 */
PROCEDURE setBaseDir(p Parser, dir VARCHAR2);

/**
 * Sets warnings TRUE - on, FALSE - off
 */
PROCEDURE showWarnings(p Parser, yes BOOLEAN);

/**
 * Sets errors to be sent to the specified file
 */
PROCEDURE setErrorLog(p Parser, fileName VARCHAR2);

/**
 * Sets whitespace preserving mode TRUE - on, FALSE - off
 */
PROCEDURE setPreserveWhitespace(p Parser, yes BOOLEAN);

/**
 * Sets validation mode TRUE - validating, FALSE - non validation
 */
PROCEDURE setValidationMode(p Parser, yes BOOLEAN);

/**
 * Gets validation mode
 */
FUNCTION getValidationMode(p Parser) RETURN BOOLEAN;

/**
 * Sets DTD for validation purposes - MUST be before an xml document is parsed
 */
PROCEDURE setDoctype(p Parser, dtd xmldom.DOMDocumentType);

/**
 * Gets DTD parsed - MUST be called only after a dtd is parsed
 */
FUNCTION getDoctype(p Parser) RETURN xmldom.DOMDocumentType;

/**
 * Gets DOM Document built by the parser - MUST be called only after a
 * document is parsed
 */
FUNCTION getDocument(p Parser) RETURN xmldom.DOMDocument;

end xmlparser;
/

SHOW ERRORS;


