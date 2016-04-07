DROP PACKAGE ASU.XMLDOM
/

--
-- XMLDOM  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."XMLDOM" as

/**
 * DOM Node types
 */
ELEMENT_NODE CONSTANT NATURAL := 1;
ATTRIBUTE_NODE CONSTANT NATURAL := 2;
TEXT_NODE CONSTANT NATURAL := 3;
CDATA_SECTION_NODE CONSTANT NATURAL := 4;
ENTITY_REFERENCE_NODE CONSTANT NATURAL := 5;
ENTITY_NODE CONSTANT NATURAL := 6;
PROCESSING_INSTRUCTION_NODE CONSTANT NATURAL := 7;
COMMENT_NODE CONSTANT NATURAL := 8;
DOCUMENT_NODE CONSTANT NATURAL := 9;
DOCUMENT_TYPE_NODE CONSTANT NATURAL := 10;
DOCUMENT_FRAGMENT_NODE CONSTANT NATURAL := 11;
NOTATION_NODE CONSTANT NATURAL := 12;

/**
 * DOMException types
 */
INDEX_SIZE_ERR EXCEPTION;
DOMSTRING_SIZE_ERR EXCEPTION;
HIERARCHY_REQUEST_ERR EXCEPTION;
WRONG_DOCUMENT_ERR EXCEPTION;
INVALID_CHARACTER_ERR EXCEPTION;
NO_DATA_ALLOWED_ERR EXCEPTION;
NO_MODIFICATION_ALLOWED_ERR EXCEPTION;
NOT_FOUND_ERR EXCEPTION;
NOT_SUPPORTED_ERR EXCEPTION;
INUSE_ATTRIBUTE_ERR EXCEPTION;

/**
 * DOM interface types
 */
TYPE DOMNode IS RECORD (ID NUMBER NOT NULL := -1);
TYPE DOMNamedNodeMap IS RECORD (ID NUMBER NOT NULL := -1);
TYPE DOMNodeList IS RECORD ( ID NUMBER NOT NULL := -1 );
TYPE DOMAttr IS RECORD ( ID NUMBER NOT NULL := -1 );
TYPE DOMCDataSection IS RECORD ( ID NUMBER NOT NULL := -1 );
TYPE DOMCharacterData IS RECORD ( ID NUMBER NOT NULL := -1 );
TYPE DOMComment IS RECORD ( ID NUMBER NOT NULL := -1 );
TYPE DOMDocumentFragment IS RECORD ( ID NUMBER NOT NULL := -1 );
TYPE DOMElement IS RECORD ( ID NUMBER NOT NULL := -1 );
TYPE DOMEntity IS RECORD ( ID NUMBER NOT NULL := -1 );
TYPE DOMEntityReference IS RECORD ( ID NUMBER NOT NULL := -1 );
TYPE DOMNotation IS RECORD ( ID NUMBER NOT NULL := -1 );
TYPE DOMProcessingInstruction IS RECORD ( ID NUMBER NOT NULL := -1 );
TYPE DOMText IS RECORD ( ID NUMBER NOT NULL := -1 );
TYPE DOMImplementation IS RECORD ( ID NUMBER NOT NULL := -1 );
TYPE DOMDocumentType IS RECORD ( ID NUMBER NOT NULL := -1 );
TYPE DOMDocument IS RECORD ( ID NUMBER NOT NULL := -1 );

/**
 * Checks if the given DOMNode is null TRUE - is null, FALSE - is not null
 */
FUNCTION isNull(n DOMNode) RETURN BOOLEAN;

/**
 * DOM Node interface methods
 * These methods implement the DOM Node interface as specified in:
 * http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html#ID-1950641247
 */
FUNCTION getNodeName(n DOMNode) RETURN VARCHAR2;
FUNCTION getNodeValue(n DOMNode) RETURN VARCHAR2;
PROCEDURE setNodeValue(n DOMNode, nodeValue IN VARCHAR2);
FUNCTION getNodeType(n DOMNode) RETURN NUMBER;
FUNCTION getParentNode(n DOMNode) RETURN DOMNode;
FUNCTION getChildNodes(n DOMNode) RETURN DOMNodeList;
FUNCTION getFirstChild(n DOMNode) RETURN DOMNode;
FUNCTION getLastChild(n DOMNode) RETURN DOMNode;
FUNCTION getPreviousSibling(n DOMNode) RETURN DOMNode;
FUNCTION getNextSibling(n DOMNode) RETURN DOMNode;
FUNCTION getAttributes(n DOMNode) RETURN DOMNamedNodeMap;
FUNCTION getOwnerDocument(n DOMNode) RETURN DOMDocument;
FUNCTION insertBefore(n DOMNode, newChild IN DOMNode, refChild IN DOMNode)
RETURN DOMNode;
FUNCTION replaceChild(n DOMNode, newChild IN DOMNode, oldChild IN DOMNode)
RETURN DOMNode;
FUNCTION removeChild(n DOMNode, oldChild IN DOMNode) RETURN DOMNode;
FUNCTION appendChild(n DOMNode, newChild IN DOMNode) RETURN DOMNode;
FUNCTION hasChildNodes(n DOMNode) RETURN BOOLEAN;
FUNCTION cloneNode(n DOMNode, deep boolean) RETURN DOMNode;

/**
 * Writes DOMNode to specified file using the database character set
 */
PROCEDURE writeToFile(n DOMNode, fileName VARCHAR2);

/**
 * Writes DOMNode to specified buffer using the database character set
 */
PROCEDURE writeToBuffer(n DOMNode, buffer IN OUT VARCHAR2);

/**
 * Writes DOMNode to specified clob using the database character set
 */
PROCEDURE writeToClob(n DOMNode, cl IN OUT CLOB);

/**
 * Writes DOMNode to specified file using the given character set
 */
PROCEDURE writeToFile(n DOMNode, fileName VARCHAR2, charset VARCHAR2);

/**
 * Writes DOMNode to specified buffer using the given character set
 */
PROCEDURE writeToBuffer(n DOMNode, buffer IN OUT VARCHAR2,
                        charset VARCHAR2);

/**
 * Writes DOMNode to specified clob using the given character set
 */
PROCEDURE writeToClob(n DOMNode, cl IN OUT CLOB, charset VARCHAR2);

/**
 * Casts given DOMNode to a DOMAttr
 */
FUNCTION makeAttr(n DOMNode) RETURN DOMAttr;

/**
 * Casts given DOMNode to a DOMCDataSection
 */
FUNCTION makeCDataSection(n DOMNode) RETURN DOMCDataSection;

/**
 * Casts given DOMNode to a DOMCharacterData
 */
FUNCTION makeCharacterData(n DOMNode) RETURN DOMCharacterData;

/**
 * Casts given DOMNode to a DOMComment
 */
FUNCTION makeComment(n DOMNode) RETURN DOMComment;

/**
 * Casts given DOMNode to a DOMDocumentFragment
 */
FUNCTION makeDocumentFragment(n DOMNode) RETURN DOMDocumentFragment;

/**
 * Casts given DOMNode to a DOMDocumentType
 */
FUNCTION makeDocumentType(n DOMNode) RETURN DOMDocumentType;

/**
 * Casts given DOMNode to a DOMElement
 */
FUNCTION makeElement(n DOMNode) RETURN DOMElement;

/**
 * Casts given DOMNode to a DOMEntity
 */
FUNCTION makeEntity(n DOMNode) RETURN DOMEntity;

/**
 * Casts given DOMNode to a DOMEntityReference
 */
FUNCTION makeEntityReference(n DOMNode) RETURN DOMEntityReference;

/**
 * Casts given DOMNode to a DOMNotation
 */
FUNCTION makeNotation(n DOMNode) RETURN DOMNotation;

/**
 * Casts given DOMNode to a DOMProcessingInstruction
 */
FUNCTION makeProcessingInstruction(n DOMNode) RETURN DOMProcessingInstruction;

/**
 * Casts given DOMNode to a DOMText
 */
FUNCTION makeText(n DOMNode) RETURN DOMText;

/**
 * Casts given DOMNode to a DOMDocument
 */
FUNCTION makeDocument(n DOMNode) RETURN DOMDocument;

PROCEDURE freeDocument(doc DOMDocument);

/**
 * Checks if the given DOM NamedNodeMap is null
 * TRUE - is null, FALSE - is not null
 */
FUNCTION isNull(nnm DOMNamedNodeMap) RETURN BOOLEAN;

/**
 * DOM NamedNodeMap interface methods
 * These methods implement the DOM NamedNodeMap interface as specified in:
 * http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html#ID-1780488922
 */
FUNCTION getNamedItem(nnm DOMNamedNodeMap, name IN VARCHAR2) RETURN DOMNode;
FUNCTION setNamedItem(nnm DOMNamedNodeMap, arg IN DOMNode) RETURN DOMNode;
FUNCTION removeNamedItem(nnm DOMNamedNodeMap, name IN VARCHAR2) RETURN DOMNode;
FUNCTION item(nnm DOMNamedNodeMap, idx IN NUMBER) RETURN DOMNode;
FUNCTION getLength(nnm DOMNamedNodeMap) RETURN NUMBER;

/**
 * Checks if the given DOM NodeList is null
 * TRUE - is null, FALSE - is not null
 */
FUNCTION isNull(nl DOMNodeList) RETURN BOOLEAN;

/**
 * DOM NodeList interface methods
 * These methods implement the DOM NodeList interface as specified in:
 * http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html#ID-536297177
 */
FUNCTION item(nl DOMNodeList, idx IN NUMBER) RETURN DOMNode;
FUNCTION getLength(nl DOMNodeList) RETURN NUMBER;

/**
 * Checks if the given DOM Attr is null TRUE - is null, FALSE - is not null
 */
FUNCTION isNull(a DOMAttr) RETURN BOOLEAN;

/**
 * Casts given DOMAttr to a DOMNode
 */
FUNCTION makeNode(a DOMAttr) RETURN DOMNode;

/**
 * DOM Attr interface methods
 * These methods implement the DOM Attr interface as specified in:
 * http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html#ID-637646024
 */
FUNCTION getName(a DOMAttr) RETURN VARCHAR2;
FUNCTION getSpecified(a DOMAttr) RETURN BOOLEAN;
FUNCTION getValue(a DOMAttr) RETURN VARCHAR2;
PROCEDURE setValue(a DOMAttr, value IN VARCHAR2);

FUNCTION getQualifiedName(a DOMAttr) return varchar2;
FUNCTION getNamespace(a DOMAttr) return varchar2;
FUNCTION getLocalName(a DOMAttr) return varchar2;
FUNCTION getExpandedName(a DOMAttr) return varchar2;

/**
 * Checks if the given DOM CDataSection is null
 * TRUE - is null, FALSE - is not null
 */
FUNCTION isNull(cds DOMCDataSection) RETURN BOOLEAN;

/**
 * Casts given DOMCDataSection to a DOMNode
 */
FUNCTION makeNode(cds DOMCDataSection) RETURN DOMNode;

/**
 * Checks if the given DOM CharacterData is null
 * TRUE - is null, FALSE - is not null
 */
FUNCTION isNull(cd DOMCharacterData) RETURN BOOLEAN;

/**
 * Casts given DOMCharacterData to a DOMNode
 */
FUNCTION makeNode(cd DOMCharacterData) RETURN DOMNode;

/**
 * DOM CharacterData interface methods
 * These methods implement the DOM CharacterData interface as specified in:
 * http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html#ID-FF21A306
 */
FUNCTION getData(cd DOMCharacterData) RETURN VARCHAR2;
PROCEDURE setData(cd DOMCharacterData, data IN VARCHAR2);
FUNCTION getLength(cd DOMCharacterData) RETURN NUMBER;
FUNCTION substringData(cd DOMCharacterData, offset IN NUMBER,
                       cnt IN NUMBER) RETURN VARCHAR2;
PROCEDURE appendData(cd DOMCharacterData, arg IN VARCHAR2);
PROCEDURE insertData(cd DOMCharacterData, offset IN NUMBER, arg IN VARCHAR2);
PROCEDURE deleteData(cd DOMCharacterData, offset IN NUMBER, cnt IN NUMBER);
PROCEDURE replaceData(cd DOMCharacterData, offset IN NUMBER,
                      cnt IN NUMBER, arg IN VARCHAR2);

/**
 * Checks if the given DOM Comment is null TRUE - is null, FALSE - is not null
 */
FUNCTION isNull(com DOMComment) RETURN BOOLEAN;

/**
 * Casts given DOMComment to a DOMNode
 */
FUNCTION makeNode(com DOMComment) RETURN DOMNode;

/**
 * Checks if the given DOM Implementation is null
 * TRUE - is null, FALSE - is not null
 */
FUNCTION isNull(di DOMImplementation) RETURN BOOLEAN;

/**
 * DOM DOMImplementation interface methods
 * These methods implement the DOM DOMImplementation interface as specified in:
 * http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html#ID-102161490
 */
FUNCTION hasFeature(di DOMImplementation, feature IN VARCHAR2,
                    version IN VARCHAR2) RETURN BOOLEAN;


/**
 * Checks if the given DOM DocumentFragment is null
 * TRUE - is null, FALSE - is not null
 */
FUNCTION isNull(df DOMDocumentFragment) RETURN BOOLEAN;

/**
 * Casts given DOMDocumentFragment to a DOMNode
 */
FUNCTION makeNode(df DOMDocumentFragment) RETURN DOMNode;

/**
 * Checks if the given DOM DocumentType is null
 * TRUE - is null, FALSE - is not null
 */
FUNCTION isNull(dt DOMDocumentType) RETURN BOOLEAN;

/**
 * Casts given DOMDocumentType to a DOMNode
 */
FUNCTION makeNode(dt DOMDocumentType) RETURN DOMNode;

/**
 * DOM DocumentType interface methods
 * These methods implement the DOM DocumentType interface as specified in:
 * http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html#ID-412266927
 */
FUNCTION getName(dt DOMDocumentType) RETURN VARCHAR2;
FUNCTION getEntities(dt DOMDocumentType) RETURN DOMNamedNodeMap;
FUNCTION getNotations(dt DOMDocumentType) RETURN DOMNamedNodeMap;

FUNCTION findEntity(dt DOMDocumentType, name varchar2, par boolean)
return DOMEntity;

FUNCTION findNotation(dt DOMDocumentType, name varchar2) return DOMNotation;

FUNCTION getPublicId(dt DOMDocumentType) return varchar2;

FUNCTION getSystemId(dt DOMDocumentType) return varchar2;

PROCEDURE writeExternalDTDToFile(dt DOMDocumentType, fileName varchar2);

PROCEDURE writeExternalDTDToBuffer(dt DOMDocumentType, buffer in out varchar2);

PROCEDURE writeExternalDTDToClob(dt DOMDocumentType, cl in out clob);

PROCEDURE writeExternalDTDToFile(dt DOMDocumentType, fileName varchar2,
                                 charset varchar2);

PROCEDURE writeExternalDTDToBuffer(dt DOMDocumentType, buffer in out varchar2,
                                   charset varchar2);

PROCEDURE writeExternalDTDToClob(dt DOMDocumentType, cl in out clob,
                                 charset varchar2);

/**
 * Checks if the given DOM Element is null
 * TRUE - is null, FALSE - is not null
 */
FUNCTION isNull(elem DOMElement) RETURN BOOLEAN;

/**
 * Casts given DOMElement to a DOMNode
 */
FUNCTION makeNode(elem DOMElement) RETURN DOMNode;

/**
 * DOM Element interface methods
 * These methods implement the DOM Element interface as specified in:
 * http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html#ID-745549614
 */
FUNCTION getTagName(elem DOMElement) RETURN VARCHAR2;
FUNCTION getAttribute(elem DOMElement, name IN VARCHAR2) RETURN VARCHAR2;
PROCEDURE setAttribute(elem DOMElement, name IN VARCHAR2, value IN VARCHAR2);
PROCEDURE removeAttribute(elem DOMElement, name IN VARCHAR2);
FUNCTION getAttributeNode(elem DOMElement, name IN VARCHAR2) RETURN DOMAttr;
FUNCTION setAttributeNode(elem DOMElement, newAttr IN DOMAttr) RETURN DOMAttr;
FUNCTION removeAttributeNode(elem DOMElement, oldAttr IN DOMAttr)
RETURN DOMAttr;
FUNCTION getElementsByTagName(elem DOMElement, name IN VARCHAR2)
RETURN DOMNodeList;
PROCEDURE normalize(elem DOMElement);

FUNCTION getQualifiedName(elem DOMElement) return varchar2;
FUNCTION getNamespace(elem DOMElement) return varchar2;
FUNCTION getLocalName(elem DOMElement) return varchar2;
FUNCTION getExpandedName(elem DOMElement) return varchar2;
FUNCTION getChildrenByTagName(elem DOMElement, name varchar2)
return DOMNodeList;
FUNCTION getChildrenByTagName(elem DOMElement, name varchar2, ns varchar2)
return DOMNodeList;
FUNCTION getElementsByTagName(elem DOMElement, name varchar2, ns varchar2)
return DOMNodeList;
FUNCTION resolveNamespacePrefix(elem DOMElement, prefix varchar2)
return varchar2;

/**
 * Checks if the given DOM Entity is null
 * TRUE - is null, FALSE - is not null
 */
FUNCTION isNull(ent DOMEntity) RETURN BOOLEAN;

/**
 * Casts given DOMEntity to a DOMNode
 */
FUNCTION makeNode(ent DOMEntity) RETURN DOMNode;

/**
 * DOM Entity interface methods
 * These methods implement the DOM Entity interface as specified in:
 * http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html#ID-527DCFF2
 */
FUNCTION getPublicId(ent DOMEntity) RETURN VARCHAR2;
FUNCTION getSystemId(ent DOMEntity) RETURN VARCHAR2;
FUNCTION getNotationName(ent DOMEntity) RETURN VARCHAR2;

/**
 * Checks if the given DOM EntityReference is null
 * TRUE - is null, FALSE - is not null
 */
FUNCTION isNull(eref DOMEntityReference) RETURN BOOLEAN;

/**
 * Casts given DOMEntityReference to a DOMNode
 */
FUNCTION makeNode(eref DOMEntityReference) RETURN DOMNode;

/**
 * Checks if the given DOM Notation is null
 * TRUE - is null, FALSE - is not null
 */
FUNCTION isNull(n DOMNotation) RETURN BOOLEAN;

/**
 * Casts given DOMNotation to a DOMNode
 */
FUNCTION makeNode(n DOMNotation) RETURN DOMNode;

/**
 * DOM Notation interface methods
 * These methods implement the DOM Notation interface as specified in:
 * http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html#ID-5431D1B9
 */
FUNCTION getPublicId(n DOMNotation) RETURN VARCHAR2;
FUNCTION getSystemId(n DOMNotation) RETURN VARCHAR2;

/**
 * Checks if the given DOM ProcessingInstruction is null
 * TRUE - is null, FALSE - is not null
 */
FUNCTION isNull(pi DOMProcessingInstruction) RETURN BOOLEAN;

/**
 * Casts given DOMProcessingInstruction to a DOMNode
 */
FUNCTION makeNode(pi DOMProcessingInstruction) RETURN DOMNode;

/**
 * DOM ProcessingInstruction interface methods
 * These methods implement the DOM ProcessingInstruction interface as
 * specified in:
 * http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html#ID-1004215813
 */
FUNCTION getData(pi DOMProcessingInstruction) RETURN VARCHAR2;
FUNCTION getTarget(pi DOMProcessingInstruction) RETURN VARCHAR2;
PROCEDURE setData(pi DOMProcessingInstruction, data IN VARCHAR2);

/**
 * Checks if the given DOM Text is null
 * TRUE - is null, FALSE - is not null
 */
FUNCTION isNull(t DOMText) RETURN BOOLEAN;

/**
 * Casts given DOMText to a DOMNode
 */
FUNCTION makeNode(t DOMText) RETURN DOMNode;

/**
 * DOM Text interface methods
 * These methods implement the DOM Text interface as specified in:
 * http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html#ID-1312295772
 */
FUNCTION splitText(t DOMText, offset IN NUMBER) RETURN DOMText;

/**
 * Checks if the given DOM Document is null
 * TRUE - is null, FALSE - is not null
 */
FUNCTION isNull(doc DOMDocument) RETURN BOOLEAN;

/**
 * Casts given DOMDocument to a DOMNode
 */
FUNCTION makeNode(doc DOMDocument) RETURN DOMNode;

/**
 * Returns a new DOM Document instance
 */
FUNCTION newDOMDocument RETURN DOMDocument;

/**
 * DOM Document interface methods
 * These methods implement the DOM Document interface as specified in:
 * http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html#i-Document
 */
FUNCTION getDoctype(doc DOMDocument) RETURN DOMDocumentType;
FUNCTION getImplementation(doc DOMDocument) RETURN DOMImplementation;
FUNCTION getDocumentElement(doc DOMDocument) RETURN DOMElement;
FUNCTION createElement(doc DOMDocument, tagName IN VARCHAR2) RETURN DOMElement;
FUNCTION createDocumentFragment(doc DOMDocument) RETURN DOMDocumentFragment;
FUNCTION createTextNode(doc DOMDocument, data IN VARCHAR2) RETURN DOMText;
FUNCTION createComment(doc DOMDocument, data IN VARCHAR2) RETURN DOMComment;
FUNCTION createCDATASection(doc DOMDocument, data IN VARCHAR2)
RETURN DOMCDATASection;
FUNCTION createProcessingInstruction(doc DOMDocument, target IN VARCHAR2,
                                     data IN VARCHAR2)
RETURN DOMProcessingInstruction;
FUNCTION createAttribute(doc DOMDocument, name IN VARCHAR2) RETURN DOMAttr;
FUNCTION createEntityReference(doc DOMDocument, name IN VARCHAR2)
RETURN DOMEntityReference;
FUNCTION getElementsByTagName(doc DOMDocument, tagname IN VARCHAR2)
RETURN DOMNodeList;

/**
 * Gets version information for the XML document
 */
FUNCTION getVersion(doc DOMDocument) RETURN VARCHAR2;

/**
 * Sets version information for the XML document
 */
PROCEDURE setVersion(doc DOMDocument, version VARCHAR2);

/**
 * Gets character set of the XML document
 */
FUNCTION getCharset(doc DOMDocument) RETURN VARCHAR2;

/**
 * Sets character set of the XML document
 */
PROCEDURE setCharset(doc DOMDocument, charset VARCHAR2);

/**
 * Gets standalone information for the XML document
 */
FUNCTION getStandalone(doc DOMDocument) RETURN VARCHAR2;

/**
 * Sets standalone information for the XML document
 */
PROCEDURE setStandalone(doc DOMDocument, value VARCHAR2);

/**
 * Writes XML document to specified file using the database character set
 */
PROCEDURE writeToFile(doc DOMDocument, fileName VARCHAR2);

/**
 * Writes XML document to specified buffer using the database character set
 */
PROCEDURE writeToBuffer(doc DOMDocument, buffer IN OUT VARCHAR2);

/**
 * Writes XML document to specified clob using the database character set
 */
PROCEDURE writeToClob(doc DOMDocument, cl IN OUT CLOB);

/**
 * Writes XML document to specified file using the given character set
 */
PROCEDURE writeToFile(doc DOMDocument, fileName VARCHAR2, charset VARCHAR2);

/**
 * Writes XML document to specified buffer using the given character set
 */
PROCEDURE writeToBuffer(doc DOMDocument, buffer IN OUT VARCHAR2,
                        charset VARCHAR2);

/**
 * Writes XML document to specified clob using the given character set
 */
PROCEDURE writeToClob(doc DOMDocument, cl IN OUT CLOB, charset VARCHAR2);

PROCEDURE writeExternalDTDToFile(doc DOMDocument, fileName varchar2);

PROCEDURE writeExternalDTDToBuffer(doc DOMDocument, buffer in out varchar2);

PROCEDURE writeExternalDTDToClob(doc DOMDocument, cl in out clob);

PROCEDURE writeExternalDTDToFile(doc DOMDocument, fileName varchar2,
                                 charset varchar2);

PROCEDURE writeExternalDTDToBuffer(doc DOMDocument, buffer in out varchar2,
                                   charset varchar2);

PROCEDURE writeExternalDTDToClob(doc DOMDocument, cl in out clob,
                                 charset varchar2);

end xmldom;
/

SHOW ERRORS;


