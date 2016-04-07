DROP PACKAGE BODY ASU.XMLDOM
/

--
-- XMLDOM  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."XMLDOM" is

/**
 * Internal error
 */
INTERNAL_ERR CONSTANT NUMBER := -20000;

/**
 * Other errors
 */
FILE_ERR CONSTANT NUMBER := -20101;
CONN_ERR CONSTANT NUMBER := -20102;
NULL_ERR CONSTANT NUMBER := -20103;

/**
 * DOM Exception types
 */
DOM_INDEX_SIZE_ERR CONSTANT NATURAL := 1;
DOM_DOMSTRING_SIZE_ERR CONSTANT NATURAL := 2;
DOM_HIERARCHY_REQUEST_ERR CONSTANT NATURAL := 3;
DOM_WRONG_DOCUMENT_ERR CONSTANT NATURAL := 4;
DOM_INVALID_CHARACTER_ERR CONSTANT NATURAL := 5;
DOM_NO_DATA_ALLOWED_ERR CONSTANT NATURAL := 6;
DOM_NO_MOD_ALLOWED_ERR CONSTANT NATURAL := 7;
DOM_NOT_FOUND_ERR CONSTANT NATURAL := 8;
DOM_NOT_SUPPORTED_ERR CONSTANT NATURAL := 9;
DOM_INUSE_ATTRIBUTE_ERR CONSTANT NATURAL := 10;

/**
 * Package private methods
 */
PROCEDURE raise_app_error(ecode NUMBER, emesg VARCHAR2 := null) IS
BEGIN
   if ecode = NULL_ERR then
      raise_application_error(ecode, 'Null input is not allowed');
   else
      raise_application_error(INTERNAL_ERR,
                              'An internal error has occurred: ' || emesg);
   end if;
END raise_app_error;

PROCEDURE raise_dom_exception(err NUMBER) IS
BEGIN
   if err = DOM_INDEX_SIZE_ERR then
      raise INDEX_SIZE_ERR;
   elsif err = DOM_DOMSTRING_SIZE_ERR then
      raise DOMSTRING_SIZE_ERR;
   elsif err = DOM_HIERARCHY_REQUEST_ERR then
      raise HIERARCHY_REQUEST_ERR;
   elsif err = DOM_WRONG_DOCUMENT_ERR then
      raise WRONG_DOCUMENT_ERR;
   elsif err = DOM_INVALID_CHARACTER_ERR then
      raise INVALID_CHARACTER_ERR;
   elsif err = DOM_NO_DATA_ALLOWED_ERR then
      raise NO_DATA_ALLOWED_ERR;
   elsif err = DOM_NO_MOD_ALLOWED_ERR then
      raise NO_MODIFICATION_ALLOWED_ERR;
   elsif err = DOM_NOT_FOUND_ERR then
      raise NOT_FOUND_ERR;
   elsif err = DOM_NOT_SUPPORTED_ERR then
      raise NOT_SUPPORTED_ERR;
   elsif err = DOM_INUSE_ATTRIBUTE_ERR then
      raise INUSE_ATTRIBUTE_ERR;
   else
      raise_app_error(INTERNAL_ERR, to_char(err));
   end if;
END raise_dom_exception;

/**
 * Node interface methods
 */
FUNCTION isNull(n DOMNode) RETURN BOOLEAN IS
BEGIN
   if n.ID = -1 then
      return TRUE;
   else
      return FALSE;
   end if;
END isNull;

FUNCTION getNodeName(n DOMNode) RETURN VARCHAR2 IS
BEGIN
   if n.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   return xmlnodecover.getNodeName(n.ID);
END getNodeName;

FUNCTION getNodeValue(n DOMNode) RETURN VARCHAR2 IS
   val VARCHAR2(32000);
   err number := -1;
BEGIN
   if n.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   val := xmlnodecover.getNodeValue(n.ID, err);
   if err != -1 then
      raise_dom_exception(err);
   end if;
   return val;
END getNodeValue;

PROCEDURE setNodeValue(n DOMNode, nodeValue IN VARCHAR2) IS
   err number := -1;
BEGIN
   if n.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   xmlnodecover.setNodeValue(n.ID, nodeValue, err);
   if err != -1 then
      raise_dom_exception(err);
   end if;
END setNodeValue;

FUNCTION getNodeType(n DOMNode) RETURN NUMBER IS
BEGIN
   if n.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   return xmlnodecover.getNodeType(n.ID);
END getNodeType;

FUNCTION getParentNode(n DOMNode) RETURN DOMNode IS
   parent NUMBER;
   pnode  DOMNode;
BEGIN
   if n.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   parent := xmlnodecover.getParentNode(n.ID);
   pnode.ID := parent;
   return pnode;
END getParentNode;

FUNCTION getChildNodes(n DOMNode) RETURN DOMNodeList IS
   children NUMBER;
   cnl DOMNodeList;
BEGIN
   if n.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   children := xmlnodecover.getChildNodes(n.ID);
   cnl.ID := children;
   return cnl;
END getChildNodes;

FUNCTION getFirstChild(n DOMNode) RETURN DOMNode IS
   child NUMBER;
   cnode DOMNode;
BEGIN
   if n.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   child := xmlnodecover.getFirstChild(n.ID);
   cnode.ID := child;
   return cnode;
END getFirstChild;

FUNCTION getLastChild(n DOMNode) RETURN DOMNode IS
   child NUMBER;
   cnode DOMNode;
BEGIN
   if n.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   child := xmlnodecover.getLastChild(n.ID);
   cnode.ID := child;
   return cnode;
END getLastChild;

FUNCTION getPreviousSibling(n DOMNode) RETURN DOMNode IS
   sibling NUMBER;
   snode   DOMNode;
BEGIN
   if n.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   sibling := xmlnodecover.getPreviousSibling(n.ID);
   snode.ID := sibling;
   return snode;
END getPreviousSibling;

FUNCTION getNextSibling(n DOMNode) RETURN DOMNode IS
   sibling NUMBER;
   snode   DOMNode;
BEGIN
   if n.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   sibling := xmlnodecover.getNextSibling(n.ID);
   snode.ID := sibling;
   return snode;
END getNextSibling;

FUNCTION getAttributes(n DOMNode) RETURN DOMNamedNodeMap IS
   attrs NUMBER;
   annm  DOMNamedNodeMap;
BEGIN
   if n.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   attrs := xmlnodecover.getAttributes(n.ID);
   annm.ID := attrs;
   return annm;
END getAttributes;

FUNCTION getOwnerDocument(n DOMNode) RETURN DOMDocument IS
   doc NUMBER;
   ddoc DOMDocument;
BEGIN
   if n.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   doc := xmlnodecover.getOwnerDocument(n.ID);
   ddoc.ID := doc;
   return ddoc;
END getOwnerDocument;

FUNCTION insertBefore(n DOMNode, newChild IN DOMNode, refChild IN DOMNode)
RETURN DOMNode IS
   child NUMBER;
   cnode DOMNode;
   err number := -1;
BEGIN
   if n.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   child := xmlnodecover.insertBefore(n.ID, newChild.ID, refChild.ID, err);
   if err != -1 then
      raise_dom_exception(err);
   end if;
   cnode.ID := child;
   return cnode;
END insertBefore;

FUNCTION replaceChild(n DOMNode, newChild IN DOMNode, oldChild IN DOMNode)
RETURN DOMNode IS
   child NUMBER;
   cnode DOMNode;
   err number := -1;
BEGIN
   if n.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   child := xmlnodecover.replaceChild(n.ID, newChild.ID, oldChild.ID, err);
   if err != -1 then
      raise_dom_exception(err);
   end if;
   cnode.ID := child;
   return cnode;
END replaceChild;

FUNCTION removeChild(n DOMNode, oldChild IN DOMNode) RETURN DOMNode IS
   child NUMBER;
   cnode DOMNode;
   err number := -1;
BEGIN
   if n.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   child := xmlnodecover.removeChild(n.ID, oldChild.ID, err);
   if err != -1 then
      raise_dom_exception(err);
   end if;
   cnode.ID := child;
   return cnode;
END removeChild;

FUNCTION appendChild(n DOMNode, newChild IN DOMNode) RETURN DOMNode IS
   child NUMBER;
   cnode DOMNode;
   err number := -1;
BEGIN
   if n.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   child := xmlnodecover.appendChild(n.ID, newChild.ID, err);
   if err != -1 then
      raise_dom_exception(err);
   end if;
   cnode.ID := child;
   return cnode;
END appendChild;

FUNCTION hasChildNodes(n DOMNode) RETURN BOOLEAN IS
   hc NUMBER;
BEGIN
   if n.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   hc := xmlnodecover.hasChildNodes(n.ID);
   if hc = 1 then
      return TRUE;
   else
      return FALSE;
   end if;
END hasChildNodes;

FUNCTION cloneNode(n DOMNode, deep boolean) RETURN DOMNode IS
   clone NUMBER;
   cnode DOMNode;
   dc number;
BEGIN
   if n.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   if deep = TRUE then
      dc := 1;
   else
      dc := 0;
   end if;
   clone := xmlnodecover.cloneNode(n.ID, dc);
   cnode.ID := clone;
   return cnode;
END cloneNode;

PROCEDURE writeToFile(n DOMNode, fileName VARCHAR2) IS
   charset VARCHAR2(64);
   err VARCHAR2(512) := null;
BEGIN
   if n.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   select v$nls_parameters.value into charset from v$nls_parameters
   where v$nls_parameters.parameter='NLS_CHARACTERSET';
   xmlnodecover.writeToFile(n.ID, fileName, charset, err);
   if err is not null then
      raise_app_error(FILE_ERR, err);
   end if;
END writeToFile;

PROCEDURE writeToBuffer(n DOMNode, buffer IN OUT VARCHAR2) IS
   charset VARCHAR2(64);
   err VARCHAR2(512) := null;
BEGIN
   if n.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   select v$nls_parameters.value into charset from v$nls_parameters
   where v$nls_parameters.parameter='NLS_CHARACTERSET';
   xmlnodecover.writeToBuffer(n.ID, buffer, charset, err);
   if err is not null then
      raise_app_error(FILE_ERR, err);
   end if;
END writeToBuffer;

PROCEDURE writeToClob(n DOMNode, cl IN OUT CLOB) IS
   charset VARCHAR2(64);
   err VARCHAR2(512) := null;
BEGIN
   if n.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   select v$nls_parameters.value into charset from v$nls_parameters
   where v$nls_parameters.parameter='NLS_CHARACTERSET';
   xmlnodecover.writeToClob(n.ID, cl, charset, err);
   if err is not null then
      raise_app_error(FILE_ERR, err);
   end if;
END writeToClob;

PROCEDURE writeToFile(n DOMNode, fileName VARCHAR2, charset VARCHAR2) IS
   err VARCHAR2(512) := null;
BEGIN
   if n.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   xmlnodecover.writeToFile(n.ID, fileName, charset, err);
   if err is not null then
      raise_app_error(FILE_ERR, err);
   end if;
END writeToFile;

PROCEDURE writeToBuffer(n DOMNode, buffer IN OUT VARCHAR2,
                       charset VARCHAR2) IS
   err VARCHAR2(512) := null;
BEGIN
   if n.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   xmlnodecover.writeToBuffer(n.ID, buffer, charset, err);
   if err is not null then
      raise_app_error(FILE_ERR, err);
   end if;
END writeToBuffer;

PROCEDURE writeToClob(n DOMNode, cl IN OUT CLOB, charset VARCHAR2) IS
   err VARCHAR2(512) := null;
BEGIN
   if n.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   xmlnodecover.writeToClob(n.ID, cl, charset, err);
   if err is not null then
      raise_app_error(CONN_ERR, err);
   end if;
END writeToClob;

FUNCTION makeAttr(n DOMNode) RETURN DOMAttr IS
   a DOMAttr;
BEGIN
   if n.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   a.ID := n.ID;
   return a;
END makeAttr;

FUNCTION makeCDataSection(n DOMNode) RETURN DOMCDataSection IS
   cds DOMCDataSection;
BEGIN
   if n.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   cds.ID := n.ID;
   return cds;
END makeCDataSection;

FUNCTION makeCharacterData(n DOMNode) RETURN DOMCharacterData IS
   cd DOMCharacterData;
BEGIN
   if n.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   cd.ID := n.ID;
   return cd;
END makeCharacterData;

FUNCTION makeComment(n DOMNode) RETURN DOMComment IS
   com DOMComment;
BEGIN
   if n.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   com.ID := n.ID;
   return com;
END makeComment;

FUNCTION makeDocumentFragment(n DOMNode) RETURN DOMDocumentFragment IS
   df DOMDocumentFragment;
BEGIN
   if n.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   df.ID := n.ID;
   return df;
END makeDocumentFragment;

FUNCTION makeDocumentType(n DOMNode) RETURN DOMDocumentType IS
   dt DOMDocumentType;
BEGIN
   if n.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   dt.ID := n.ID;
   return dt;
END makeDocumentType;

FUNCTION makeElement(n DOMNode) RETURN DOMElement IS
   elem DOMElement;
BEGIN
   if n.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   elem.ID := n.ID;
   return elem;
END makeElement;

FUNCTION makeEntity(n DOMNode) RETURN DOMEntity IS
   ent DOMEntity;
BEGIN
   if n.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   ent.ID := n.ID;
   return ent;
END makeEntity;

FUNCTION makeEntityReference(n DOMNode) RETURN DOMEntityReference IS
   eref DOMEntityReference;
BEGIN
   if n.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   eref.ID := n.ID;
   return eref;
END makeEntityReference;

FUNCTION makeNotation(n DOMNode) RETURN DOMNotation IS
   dn DOMNotation;
BEGIN
   if n.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   dn.ID := n.ID;
   return dn;
END makeNotation;

FUNCTION makeProcessingInstruction(n DOMNode)
RETURN DOMProcessingInstruction IS
   pi DOMProcessingInstruction;
BEGIN
   if n.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   pi.ID := n.ID;
   return pi;
END makeProcessingInstruction;

FUNCTION makeText(n DOMNode) RETURN DOMText IS
   t DOMText;
BEGIN
   if n.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   t.ID := n.ID;
   return t;
END makeText;

FUNCTION makeDocument(n DOMNode) RETURN DOMDocument IS
   doc DOMDocument;
BEGIN
   if n.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   doc.ID := n.ID;
   return doc;
END makeDocument;

PROCEDURE freeDocument(doc DOMDocument) is
BEGIN
   if doc.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   xmlnodecover.freeDocument(doc.ID);
END freeDocument;
/**
 * NamedNodeMap interface methods
 */
FUNCTION isNull(nnm DOMNamedNodeMap) RETURN BOOLEAN IS
BEGIN
   if nnm.ID = -1 then
      return TRUE;
   else
      return FALSE;
   end if;
END isNull;

FUNCTION getNamedItem(nnm DOMNamedNodeMap, name IN VARCHAR2) RETURN DOMNode IS
   item NUMBER;
   inode DOMNode;
BEGIN
   if nnm.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   item := xmlnnmcover.getNamedItem(nnm.ID, name);
   inode.ID := item;
   return inode;
END getNamedItem;

FUNCTION setNamedItem(nnm DOMNamedNodeMap, arg IN DOMNode) RETURN DOMNode IS
   item NUMBER;
   inode DOMNode;
   err number := -1;
BEGIN
   if nnm.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   item := xmlnnmcover.setNamedItem(nnm.ID, arg.ID, err);
   if err != -1 then
      raise_dom_exception(err);
   end if;
   inode.ID := item;
   return inode;
END setNamedItem;

FUNCTION removeNamedItem(nnm DOMNamedNodeMap, name IN VARCHAR2)
RETURN DOMNode IS
   item NUMBER;
   inode DOMNode;
   err number := -1;
BEGIN
   if nnm.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   item := xmlnnmcover.removeNamedItem(nnm.ID, name, err);
   if err != -1 then
      raise_dom_exception(err);
   end if;
   inode.ID := item;
   return inode;
END removeNamedItem;

FUNCTION item(nnm DOMNamedNodeMap, idx IN NUMBER) RETURN DOMNode IS
   item NUMBER;
   inode DOMNode;
BEGIN
   if nnm.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   item := xmlnnmcover.item(nnm.ID, idx);
   inode.ID := item;
   return inode;
END item;

FUNCTION getLength(nnm DOMNamedNodeMap) RETURN NUMBER IS
BEGIN
   if nnm.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   return xmlnnmcover.getLength(nnm.ID);
END getLength;

/**
 * NodeList interface methods
 */
FUNCTION isNull(nl DOMNodeList) RETURN BOOLEAN IS
BEGIN
   if nl.ID = -1 then
      return TRUE;
   else
      return FALSE;
   end if;
END isNull;

FUNCTION item(nl DOMNodeList, idx IN NUMBER) RETURN DOMNode IS
   item NUMBER;
   inode DOMNode;
BEGIN
   if nl.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   item := xmlnodelistcover.item(nl.ID, idx);
   inode.ID := item;
   return inode;
END item;

FUNCTION getLength(nl DOMNodeList) RETURN NUMBER IS
BEGIN
   if nl.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   return xmlnodelistcover.getLength(nl.ID);
END getLength;

/**
 * Attr interface methods
 */
FUNCTION isNull(a DOMAttr) RETURN BOOLEAN IS
BEGIN
   if a.ID = -1 then
      return TRUE;
   else
      return FALSE;
   end if;
END isNull;

FUNCTION makeNode(a DOMAttr) RETURN DOMNode IS
   anode DOMNode;
BEGIN
   if a.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   anode.ID := a.ID;
   return anode;
END makeNode;

FUNCTION getName(a DOMAttr) RETURN VARCHAR2 IS
BEGIN
   if a.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   return xmlattrcover.getName(a.ID);
END getName;

FUNCTION getSpecified(a DOMAttr) RETURN BOOLEAN IS
   spec NUMBER;
BEGIN
   if a.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   spec := xmlattrcover.getSpecified(a.ID);
   if spec = 1 then
      return TRUE;
   else
      return FALSE;
   end if;
END getSpecified;

FUNCTION getValue(a DOMAttr) RETURN VARCHAR2 IS
BEGIN
   if a.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   return xmlattrcover.getValue(a.ID);
END getValue;

PROCEDURE setValue(a DOMAttr, value IN VARCHAR2) IS
BEGIN
   if a.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   xmlattrcover.setValue(a.ID, value);
END setValue;

FUNCTION getQualifiedName(a DOMAttr) return varchar2 is
BEGIN
   if a.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   return xmlattrcover.getQualifiedName(a.ID);
END getQualifiedName;

FUNCTION getNamespace(a DOMAttr) return varchar2 is
BEGIN
   if a.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   return xmlattrcover.getNamespace(a.ID);
END getNamespace;

FUNCTION getLocalName(a DOMAttr) return varchar2 is
BEGIN
   if a.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   return xmlattrcover.getLocalName(a.ID);
END getLocalName;

FUNCTION getExpandedName(a DOMAttr) return varchar2 is
BEGIN
   if a.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   return xmlattrcover.getExpandedName(a.ID);
END getExpandedName;

/**
 * CDATASection interface methods
 */
FUNCTION isNull(cds DOMCDataSection) RETURN BOOLEAN IS
BEGIN
   if cds.ID = -1 then
      return TRUE;
   else
      return FALSE;
   end if;
END isNull;

FUNCTION makeNode(cds DOMCDataSection) RETURN DOMNode IS
   cdsnode DOMNode;
BEGIN
   if cds.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   cdsnode.ID := cds.ID;
   return cdsnode;
END makeNode;

/**
 * CharacterData interface methods
 */
FUNCTION isNull(cd DOMCharacterData) RETURN BOOLEAN IS
BEGIN
   if cd.ID = -1 then
      return TRUE;
   else
      return FALSE;
   end if;
END isNull;

FUNCTION makeNode(cd DOMCharacterData) RETURN DOMNode IS
   cdnode DOMNode;
BEGIN
   if cd.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   cdnode.ID := cd.ID;
   return cdnode;
END makeNode;

FUNCTION getData(cd DOMCharacterData) RETURN VARCHAR2 IS
   val VARCHAR2(32000);
   err number := -1;
BEGIN
   if cd.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   val := xmlchardatacover.getData(cd.ID, err);
   if err != -1 then
      raise_dom_exception(err);
   end if;
   return val;
END getData;

PROCEDURE setData(cd DOMCharacterData, data IN VARCHAR2) IS
   err number := -1;
BEGIN
   if cd.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   xmlchardatacover.setData(cd.ID, data, err);
   if err != -1 then
      raise_dom_exception(err);
   end if;
END setData;

FUNCTION getLength(cd DOMCharacterData) RETURN NUMBER IS
BEGIN
   if cd.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   return xmlchardatacover.getLength(cd.ID);
END getLength;

FUNCTION substringData(cd DOMCharacterData, offset IN NUMBER,
                       cnt IN NUMBER) RETURN VARCHAR2 IS
   val VARCHAR2(32000);
   err number := -1;
BEGIN
   if cd.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   val := xmlchardatacover.substringData(cd.ID, offset, cnt, err);
   if err != -1 then
      raise_dom_exception(err);
   end if;
   return val;
END substringData;

PROCEDURE appendData(cd DOMCharacterData, arg IN VARCHAR2) IS
   err number := -1;
BEGIN
   if cd.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   xmlchardatacover.appendData(cd.ID, arg, err);
   if err != -1 then
      raise_dom_exception(err);
   end if;
END appendData;

PROCEDURE insertData(cd DOMCharacterData, offset IN NUMBER,
                            arg IN VARCHAR2) IS
   err number := -1;
BEGIN
   if cd.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   xmlchardatacover.insertData(cd.ID, offset, arg, err);
   if err != -1 then
      raise_dom_exception(err);
   end if;
END insertData;

PROCEDURE deleteData(cd DOMCharacterData, offset IN NUMBER,
                            cnt IN NUMBER) IS
   err number := -1;
BEGIN
   if cd.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   xmlchardatacover.deleteData(cd.ID, offset, cnt, err);
   if err != -1 then
      raise_dom_exception(err);
   end if;
END deleteData;

PROCEDURE replaceData(cd DOMCharacterData, offset IN NUMBER,
                             cnt IN NUMBER, arg IN VARCHAR2) IS
   err number := -1;
BEGIN
   if cd.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   xmlchardatacover.replaceData(cd.ID, offset, cnt, arg, err);
   if err != -1 then
      raise_dom_exception(err);
   end if;
END replaceData;

/**
 * Comment interface methods
 */
FUNCTION isNull(com DOMComment) RETURN BOOLEAN IS
BEGIN
   if com.ID = -1 then
      return TRUE;
   else
      return FALSE;
   end if;
END isNull;

FUNCTION makeNode(com DOMComment) RETURN DOMNode IS
   comnode DOMNode;
BEGIN
   if com.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   comnode.ID := com.ID;
   return comnode;
END makeNode;

/**
 * DOMImplementation interface methods
 */
FUNCTION isNull(di DOMImplementation) RETURN BOOLEAN IS
BEGIN
   if di.ID = -1 then
      return TRUE;
   else
      return FALSE;
   end if;
END isNull;

FUNCTION hasFeature(di DOMImplementation, feature IN VARCHAR2,
                    version IN VARCHAR2) RETURN BOOLEAN IS
   hf NUMBER;
BEGIN
   if di.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   hf := xmldomimplcover.hasFeature(di.ID, feature, version);
   if hf = 1 then
     return TRUE;
   else
     return FALSE;
   end if;
END hasFeature;

/**
 * DocumentFragment interface methods
 */
FUNCTION isNull(df DOMDocumentFragment) RETURN BOOLEAN IS
BEGIN
   if df.ID = -1 then
      return TRUE;
   else
      return FALSE;
   end if;
END isNull;

FUNCTION makeNode(df DOMDocumentFragment) RETURN DOMNode IS
   dfnode DOMNode;
BEGIN
   if df.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   dfnode.ID := df.ID;
   return dfnode;
END makeNode;

/**
 * DocumentType interface methods
 */
FUNCTION isNull(dt DOMDocumentType) RETURN BOOLEAN IS
BEGIN
   if dt.ID = -1 then
      return TRUE;
   else
      return FALSE;
   end if;
END isNull;

FUNCTION makeNode(dt DOMDocumentType) RETURN DOMNode IS
   dtnode DOMNode;
BEGIN
   if dt.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   dtnode.ID := dt.ID;
   return dtnode;
END makeNode;

FUNCTION getName(dt DOMDocumentType) RETURN VARCHAR2 IS
BEGIN
   if dt.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   return xmldtdcover.getName(dt.ID);
END getName;

FUNCTION getEntities(dt DOMDocumentType) RETURN DOMNamedNodeMap IS
   entities NUMBER;
   ennm DOMNamedNodeMap;
BEGIN
   if dt.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   entities := xmldtdcover.getEntities(dt.ID);
   ennm.ID := entities;
   return ennm;
END getEntities;

FUNCTION getNotations(dt DOMDocumentType) RETURN DOMNamedNodeMap IS
   notations NUMBER;
   nnnm DOMNamedNodeMap;
BEGIN
   if dt.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   notations := xmldtdcover.getNotations(dt.ID);
   nnnm.ID := notations;
   return nnnm;
END getNotations;

FUNCTION findEntity(dt DOMDocumentType, name varchar2, par boolean)
return DOMEntity is
   entity DOMEntity;
   param  number;
BEGIN
   if dt.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   if par = TRUE then
      param := 1;
   else
      param := 0;
   end if;
   entity.ID := xmldtdcover.findEntity(dt.ID, name, param);
   return entity;
END findEntity;

FUNCTION findNotation(dt DOMDocumentType, name varchar2) return DOMNotation is
   notation DOMNotation;
BEGIN
   if dt.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   notation.ID := xmldtdcover.findNotation(dt.ID, name);
   return notation;
END findNotation;

FUNCTION getPublicId(dt DOMDocumentType) return varchar2 is
BEGIN
   if dt.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   return xmldtdcover.getPublicId(dt.ID);
END getPublicId;

FUNCTION getSystemId(dt DOMDocumentType) return varchar2 is
BEGIN
   if dt.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   return  xmldtdcover.getSystemId(dt.ID);
END getSystemId;

PROCEDURE writeExternalDTDToFile(dt DOMDocumentType, fileName varchar2) is
   charset VARCHAR2(64);
   err VARCHAR2(512) := null;
BEGIN
   if dt.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   select v$nls_parameters.value into charset from v$nls_parameters
   where v$nls_parameters.parameter='NLS_CHARACTERSET';
   xmldtdcover.writeExternalDTDToFile(dt.ID, fileName, charset, err);
   if err is not null then
      raise_app_error(FILE_ERR, err);
   end if;
END writeExternalDTDToFile;

PROCEDURE writeExternalDTDToBuffer(dt DOMDocumentType, buffer in out varchar2)
is
   charset VARCHAR2(64);
   err VARCHAR2(512) := null;
BEGIN
   if dt.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   select v$nls_parameters.value into charset from v$nls_parameters
   where v$nls_parameters.parameter='NLS_CHARACTERSET';
   xmldtdcover.writeExternalDTDToBuffer(dt.ID, buffer, charset, err);
   if err is not null then
      raise_app_error(FILE_ERR, err);
   end if;
END writeExternalDTDToBuffer;

PROCEDURE writeExternalDTDToClob(dt DOMDocumentType, cl in out clob) is
   charset VARCHAR2(64);
   err VARCHAR2(512) := null;
BEGIN
   if dt.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   select v$nls_parameters.value into charset from v$nls_parameters
   where v$nls_parameters.parameter='NLS_CHARACTERSET';
   xmldtdcover.writeExternalDTDToClob(dt.ID, cl, charset, err);
   if err is not null then
      raise_app_error(FILE_ERR, err);
   end if;
END writeExternalDTDToClob;

PROCEDURE writeExternalDTDToFile(dt DOMDocumentType, fileName varchar2,
                                 charset varchar2) is
   err VARCHAR2(512) := null;
BEGIN
   if dt.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   xmldtdcover.writeExternalDTDToFile(dt.ID, fileName, charset, err);
   if err is not null then
      raise_app_error(FILE_ERR, err);
   end if;
END writeExternalDTDToFile;

PROCEDURE writeExternalDTDToBuffer(dt DOMDocumentType, buffer in out varchar2,
                                   charset varchar2) is
   err VARCHAR2(512) := null;
BEGIN
   if dt.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   xmldtdcover.writeExternalDTDToBuffer(dt.ID, buffer, charset, err);
   if err is not null then
      raise_app_error(FILE_ERR, err);
   end if;
END writeExternalDTDToBuffer;

PROCEDURE writeExternalDTDToClob(dt DOMDocumentType, cl in out clob,
                                 charset varchar2) is
   err VARCHAR2(512) := null;
BEGIN
   if dt.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   xmldtdcover.writeExternalDTDToClob(dt.ID, cl, charset, err);
   if err is not null then
      raise_app_error(CONN_ERR, err);
   end if;
END writeExternalDTDToClob;

/**
 * Element interface methods
 */
FUNCTION isNull(elem DOMElement) RETURN BOOLEAN IS
BEGIN
   if elem.ID = -1 then
      return TRUE;
   else
      return FALSE;
   end if;
END isNull;

FUNCTION makeNode(elem DOMElement) RETURN DOMNode IS
   elemnode DOMNode;
BEGIN
   if elem.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   elemnode.ID := elem.ID;
   return elemnode;
END makeNode;

FUNCTION getTagName(elem DOMElement) RETURN VARCHAR2 IS
BEGIN
   if elem.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   return xmlelementcover.getTagName(elem.ID);
END getTagName;

FUNCTION getAttribute(elem DOMElement, name IN VARCHAR2)
RETURN VARCHAR2 IS
BEGIN
   if elem.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   return xmlelementcover.getAttribute(elem.ID, name);
END getAttribute;

PROCEDURE setAttribute(elem DOMElement, name IN VARCHAR2,
                              value IN VARCHAR2) IS
   err number := -1;
BEGIN
   if elem.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   xmlelementcover.setAttribute(elem.ID, name, value, err);
   if err != -1 then
      raise_dom_exception(err);
   end if;
END setAttribute;

PROCEDURE removeAttribute(elem DOMElement, name IN VARCHAR2) IS
   err number := -1;
BEGIN
   if elem.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   xmlelementcover.removeAttribute(elem.ID, name, err);
   if err != -1 then
      raise_dom_exception(err);
   end if;
END removeAttribute;

FUNCTION getAttributeNode(elem DOMElement, name IN VARCHAR2)
RETURN DOMAttr IS
   attr NUMBER;
   aattr DOMAttr;
BEGIN
   if elem.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   attr := xmlelementcover.getAttributeNode(elem.ID, name);
   aattr.ID := attr;
   return aattr;
END getAttributeNode;

FUNCTION setAttributeNode(elem DOMElement, newAttr IN DOMAttr)
RETURN DOMAttr IS
   attr NUMBER;
   aattr DOMAttr;
BEGIN
   if elem.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   attr := xmlelementcover.setAttributeNode(elem.ID, newAttr.ID);
   aattr.ID := attr;
   return aattr;
END setAttributeNode;

FUNCTION removeAttributeNode(elem DOMElement, oldAttr IN DOMAttr)
RETURN DOMAttr IS
   attr NUMBER;
   aattr DOMAttr;
BEGIN
   if elem.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   attr := xmlelementcover.removeAttributeNode(elem.ID, oldAttr.ID);
   aattr.ID := attr;
   return aattr;
END removeAttributeNode;

FUNCTION getElementsByTagName(elem DOMElement, name IN VARCHAR2)
RETURN DOMNodeList IS
   elements NUMBER;
   enl DOMNodeList;
BEGIN
   if elem.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   elements := xmlelementcover.getElementsByTagName(elem.ID, name);
   enl.ID := elements;
   return enl;
END getElementsByTagName;

PROCEDURE normalize(elem DOMElement) IS
BEGIN
   if elem.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   xmlelementcover.normalize(elem.ID);
END normalize;

FUNCTION getQualifiedName(elem DOMElement) return varchar2 is
BEGIN
   if elem.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   return xmlelementcover.getQualifiedName(elem.ID);
END getQualifiedName;

FUNCTION getNamespace(elem DOMElement) return varchar2 is
BEGIN
   if elem.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   return xmlelementcover.getNamespace(elem.ID);
END getNamespace;

FUNCTION getLocalName(elem DOMElement) return varchar2 is
BEGIN
   if elem.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   return xmlelementcover.getLocalName(elem.ID);
END getLocalName;

FUNCTION getExpandedName(elem DOMElement) return varchar2 is
BEGIN
   if elem.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   return xmlelementcover.getExpandedName(elem.ID);
END getExpandedName;

FUNCTION getChildrenByTagName(elem DOMElement, name VARCHAR2)
RETURN DOMNodeList IS
   children NUMBER;
   enl DOMNodeList;
BEGIN
   if elem.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   children := xmlelementcover.getChildrenByTagName(elem.ID, name);
   enl.ID := children;
   return enl;
END getChildrenByTagName;

FUNCTION getChildrenByTagName(elem DOMElement, name VARCHAR2, ns VARCHAR2)
RETURN DOMNodeList IS
   children NUMBER;
   enl DOMNodeList;
BEGIN
   if elem.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   children := xmlelementcover.getChildrenByTagName(elem.ID, name, ns);
   enl.ID := children;
   return enl;
END getChildrenByTagName;

FUNCTION getElementsByTagName(elem DOMElement, name VARCHAR2, ns VARCHAR2)
RETURN DOMNodeList IS
   elements NUMBER;
   enl DOMNodeList;
BEGIN
   if elem.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   elements := xmlelementcover.getElementsByTagName(elem.ID, name, ns);
   enl.ID := elements;
   return enl;
END getElementsByTagName;

FUNCTION resolveNamespacePrefix(elem DOMElement, prefix varchar2)
return varchar2 is
BEGIN
   if elem.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   return xmlelementcover.resolveNamespacePrefix(elem.ID, prefix);
END resolveNamespacePrefix;


/**
 * Entity interface methods
 */
FUNCTION isNull(ent DOMEntity) RETURN BOOLEAN IS
BEGIN
   if ent.ID = -1 then
      return TRUE;
   else
      return FALSE;
   end if;
END isNull;

FUNCTION makeNode(ent DOMEntity) RETURN DOMNode IS
   entnode DOMNode;
BEGIN
   if ent.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   entnode.ID := ent.ID;
   return entnode;
END makeNode;

FUNCTION getPublicId(ent DOMEntity) RETURN VARCHAR2 IS
BEGIN
   if ent.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   return xmlentitycover.getPublicId(ent.ID);
END getPublicId;

FUNCTION getSystemId(ent DOMEntity) RETURN VARCHAR2 IS
BEGIN
   if ent.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   return xmlentitycover.getSystemId(ent.ID);
END getSystemId;

FUNCTION getNotationName(ent DOMEntity) RETURN VARCHAR2 IS
BEGIN
   if ent.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   return xmlentitycover.getNotationName(ent.ID);
END getNotationName;

/**
 * EntityReference interface methods
 */
FUNCTION isNull(eref DOMEntityReference) RETURN BOOLEAN IS
BEGIN
   if eref.ID = -1 then
      return TRUE;
   else
      return FALSE;
   end if;
END isNull;

FUNCTION makeNode(eref DOMEntityReference) RETURN DOMNode IS
   erefnode DOMNode;
BEGIN
   if eref.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   erefnode.ID := eref.ID;
   return erefnode;
END makeNode;

/**
 * Notation interface methods
 */
FUNCTION isNull(n DOMNotation) RETURN BOOLEAN IS
BEGIN
   if n.ID = -1 then
      return TRUE;
   else
      return FALSE;
   end if;
END isNull;

FUNCTION makeNode(n DOMNotation) RETURN DOMNode IS
   nnode DOMNode;
BEGIN
   if n.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   nnode.ID := n.ID;
   return nnode;
END makeNode;

FUNCTION getPublicId(n DOMNotation) RETURN VARCHAR2 IS
BEGIN
   if n.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   return xmlnotationcover.getPublicId(n.ID);
END getPublicId;

FUNCTION getSystemId(n DOMNotation) RETURN VARCHAR2 IS
BEGIN
   if n.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   return xmlnotationcover.getSystemId(n.ID);
END getSystemId;

/**
 * ProcessingInstruction interface methods
 */
FUNCTION isNull(pi DOMProcessingInstruction) RETURN BOOLEAN IS
BEGIN
   if pi.ID = -1 then
      return TRUE;
   else
      return FALSE;
   end if;
END isNull;

FUNCTION makeNode(pi DOMProcessingInstruction) RETURN DOMNode IS
   pinode DOMNode;
BEGIN
   if pi.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   pinode.ID := pi.ID;
   return pinode;
END makeNode;

FUNCTION getData(pi DOMProcessingInstruction) RETURN VARCHAR2 IS
   val VARCHAR2(32000);
   err number := -1;
BEGIN
   if pi.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   val := xmlpicover.getData(pi.ID, err);
   if err != -1 then
      raise_dom_exception(err);
   end if;
   return val;
END getData;

FUNCTION getTarget(pi DOMProcessingInstruction) RETURN VARCHAR2 IS
BEGIN
   if pi.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   return xmlpicover.getTarget(pi.ID);
END getTarget;

PROCEDURE setData(pi DOMProcessingInstruction, data IN VARCHAR2) IS
   err number := -1;
BEGIN
   if pi.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   xmlpicover.setData(pi.ID, data, err);
   if err != -1 then
      raise_dom_exception(err);
   end if;
END setData;

/**
 * Text interface methods
 */
FUNCTION isNull(t DOMText) RETURN BOOLEAN IS
BEGIN
   if t.ID = -1 then
      return TRUE;
   else
      return FALSE;
   end if;
END isNull;

FUNCTION makeNode(t DOMText) RETURN DOMNode IS
   tnode DOMNode;
BEGIN
   if t.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   tnode.ID := t.ID;
   return tnode;
END makeNode;

FUNCTION splitText(t DOMText, offset IN NUMBER) RETURN DOMText IS
   text NUMBER;
   ttext DOMText;
   err number := -1;
BEGIN
   if t.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   text := xmltextcover.splitText(t.ID, offset, err);
   if err != -1 then
      raise_dom_exception(err);
   end if;
   ttext.ID := text;
   return ttext;
END splitText;

/**
 * Document interface methods
 */
FUNCTION isNull(doc DOMDocument) RETURN BOOLEAN IS
BEGIN
   if doc.ID = -1 then
      return TRUE;
   else
      return FALSE;
   end if;
END isNull;

FUNCTION makeNode(doc DOMDocument) RETURN DOMNode IS
   docnode DOMNode;
BEGIN
   if doc.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   docnode.ID := doc.ID;
   return docnode;
END makeNode;

FUNCTION newDOMDocument RETURN DOMDocument IS
   doc DOMDocument;
BEGIN
   doc.ID := xmldocumentcover.newDocument;
   return doc;
END newDOMDocument;

FUNCTION getDoctype(doc DOMDocument) RETURN DOMDocumentType IS
   dtd NUMBER;
   ddt DOMDocumentType;
BEGIN
   if doc.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   dtd := xmldocumentcover.getDoctype(doc.ID);
   ddt.ID := dtd;
   return ddt;
END getDoctype;

FUNCTION getImplementation(doc DOMDocument) RETURN DOMImplementation IS
   impl NUMBER;
   idi DOMImplementation;
BEGIN
   if doc.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   impl := xmldocumentcover.getImplementation(doc.ID);
   idi.ID := impl;
   return idi;
END getImplementation;

FUNCTION getDocumentElement(doc DOMDocument) RETURN DOMElement IS
   docelem NUMBER;
   delem DOMElement;
BEGIN
   if doc.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   dbms_output.put_line('The id is' || doc.id);
   docelem := xmldocumentcover.getDocumentElement(doc.ID);
   dbms_output.put_line('The id is' || docelem);
   delem.ID := docelem;
   return delem;
END getDocumentElement;

FUNCTION createElement(doc DOMDocument, tagName IN VARCHAR2)
RETURN DOMElement IS
   elem NUMBER;
   eelem DOMElement;
BEGIN
   if doc.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   elem := xmldocumentcover.createElement(doc.ID, tagName);
   eelem.ID := elem;
   return eelem;
END createElement;

FUNCTION createDocumentFragment(doc DOMDocument)
RETURN DOMDocumentFragment IS
   df NUMBER;
   ddf DOMDocumentFragment;
BEGIN
   if doc.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   df := xmldocumentcover.createDocumentFragment(doc.ID);
   ddf.ID := df;
   return ddf;
END createDocumentFragment;

FUNCTION createTextNode(doc DOMDocument, data IN VARCHAR2)
RETURN DOMText IS
   text NUMBER;
   ttext DOMText;
BEGIN
   if doc.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   text := xmldocumentcover.createTextNode(doc.ID, data);
   ttext.ID := text;
   return ttext;
END createTextNode;

FUNCTION createComment(doc DOMDocument, data IN VARCHAR2)
RETURN DOMComment IS
   com NUMBER;
   ccom DOMComment;
BEGIN
   if doc.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   com := xmldocumentcover.createComment(doc.ID, data);
   ccom.ID := com;
   return ccom;
END createComment;

FUNCTION createCDATASection(doc DOMDocument, data IN VARCHAR2)
RETURN DOMCDATASection IS
   cds NUMBER;
   ccds DOMCDATASection;
BEGIN
   if doc.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   cds := xmldocumentcover.createCDATASection(doc.ID, data);
   ccds.ID := cds;
   return ccds;
END createCDATASection;

FUNCTION createProcessingInstruction(doc DOMDocument, target IN VARCHAR2,
                                     data IN VARCHAR2)
RETURN DOMProcessingInstruction IS
   pi NUMBER;
   ppi DOMProcessingInstruction;
BEGIN
   if doc.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   pi := xmldocumentcover.createProcessingInstruction(doc.ID, target, data);
   ppi.ID := pi;
   return ppi;
END createProcessingInstruction;

FUNCTION createAttribute(doc DOMDocument, name IN VARCHAR2)
RETURN DOMAttr IS
   attr NUMBER;
   aattr DOMAttr;
BEGIN
   if doc.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   attr := xmldocumentcover.createAttribute(doc.ID, name);
   aattr.ID := attr;
   return aattr;
END createAttribute;

FUNCTION createEntityReference(doc DOMDocument, name IN VARCHAR2)
RETURN DOMEntityReference IS
   eref NUMBER;
   eeref DOMEntityReference;
BEGIN
   if doc.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   eref := xmldocumentcover.createEntityReference(doc.ID, name);
   eeref.ID := eref;
   return eeref;
END createEntityReference;

FUNCTION getElementsByTagName(doc DOMDocument, tagname IN VARCHAR2)
RETURN DOMNodeList IS
   elems NUMBER;
   enl DOMNodeList;
BEGIN
   if doc.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   elems := xmldocumentcover.getElementsByTagName(doc.ID, tagname);
   enl.ID := elems;
   return enl;
END getElementsByTagName;

FUNCTION getVersion(doc DOMDocument) RETURN VARCHAR2 IS
BEGIN
   if doc.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   return xmldocumentcover.getVersion(doc.ID);
END getVersion;

PROCEDURE setVersion(doc DOMDocument, version VARCHAR2) IS
BEGIN
   if doc.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   xmldocumentcover.setVersion(doc.ID, version);
END setVersion;

FUNCTION getCharset(doc DOMDocument) RETURN VARCHAR2 IS
BEGIN
   if doc.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   return xmldocumentcover.getCharset(doc.ID);
END getCharset;

PROCEDURE setCharset(doc DOMDocument, charset VARCHAR2) IS
BEGIN
   if doc.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   xmldocumentcover.setCharset(doc.ID, charset);
END setCharset;

FUNCTION getStandalone(doc DOMDocument) RETURN VARCHAR2 IS
BEGIN
   if doc.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   return xmldocumentcover.getStandalone(doc.ID);
END getStandalone;

PROCEDURE setStandalone(doc DOMDocument, value VARCHAR2) IS
BEGIN
   if doc.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   xmldocumentcover.setStandalone(doc.ID, value);
END setStandalone;

PROCEDURE writeToFile(doc DOMDocument, fileName VARCHAR2) IS
   charset VARCHAR2(64);
   err VARCHAR2(512) := null;
BEGIN
   if doc.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   select v$nls_parameters.value into charset from v$nls_parameters
   where v$nls_parameters.parameter='NLS_CHARACTERSET';
   xmldocumentcover.writeToFile(doc.ID, fileName, charset, err);
   if err is not null then
      raise_app_error(FILE_ERR, err);
   end if;
END writeToFile;

PROCEDURE writeToBuffer(doc DOMDocument, buffer IN OUT VARCHAR2) IS
   charset VARCHAR2(64);
   err VARCHAR2(512) := null;
BEGIN
   if doc.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   select v$nls_parameters.value into charset from v$nls_parameters
   where v$nls_parameters.parameter='NLS_CHARACTERSET';
   xmldocumentcover.writeToBuffer(doc.ID, buffer, charset, err);
   if err is not null then
      raise_app_error(FILE_ERR, err);
   end if;
END writeToBuffer;

PROCEDURE writeToClob(doc DOMDocument, cl IN OUT CLOB) IS
   charset VARCHAR2(64);
   err VARCHAR2(512) := null;
BEGIN
   if doc.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   select v$nls_parameters.value into charset from v$nls_parameters
   where v$nls_parameters.parameter='NLS_CHARACTERSET';
   xmldocumentcover.writeToClob(doc.ID, cl, charset, err);
   if err is not null then
      raise_app_error(FILE_ERR, err);
   end if;
END writeToClob;

PROCEDURE writeToFile(doc DOMDocument, fileName VARCHAR2, charset VARCHAR2) IS
   err VARCHAR2(512) := null;
BEGIN
   if doc.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   xmldocumentcover.writeToFile(doc.ID, fileName, charset, err);
   if err is not null then
      raise_app_error(FILE_ERR, err);
   end if;
END writeToFile;

PROCEDURE writeToBuffer(doc DOMDocument, buffer IN OUT VARCHAR2,
                       charset VARCHAR2) IS
   err VARCHAR2(512) := null;
BEGIN
   if doc.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   xmldocumentcover.writeToBuffer(doc.ID, buffer, charset, err);
   if err is not null then
      raise_app_error(FILE_ERR, err);
   end if;
END writeToBuffer;

PROCEDURE writeToClob(doc DOMDocument, cl IN OUT CLOB, charset VARCHAR2) IS
   err VARCHAR2(512) := null;
BEGIN
   if doc.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   xmldocumentcover.writeToClob(doc.ID, cl, charset, err);
   if err is not null then
      raise_app_error(CONN_ERR, err);
   end if;
END writeToClob;

PROCEDURE writeExternalDTDToFile(doc DOMDocument, fileName varchar2) is
   charset VARCHAR2(64);
   err VARCHAR2(512) := null;
BEGIN
   if doc.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   select v$nls_parameters.value into charset from v$nls_parameters
   where v$nls_parameters.parameter='NLS_CHARACTERSET';
   xmldocumentcover.writeExternalDTDToFile(doc.ID, fileName, charset, err);
   if err is not null then
      raise_app_error(FILE_ERR, err);
   end if;
END writeExternalDTDToFile;

PROCEDURE writeExternalDTDToBuffer(doc DOMDocument, buffer in out varchar2)
is
   charset VARCHAR2(64);
   err VARCHAR2(512) := null;
BEGIN
   if doc.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   select v$nls_parameters.value into charset from v$nls_parameters
   where v$nls_parameters.parameter='NLS_CHARACTERSET';
   xmldocumentcover.writeExternalDTDToBuffer(doc.ID, buffer, charset, err);
   if err is not null then
      raise_app_error(FILE_ERR, err);
   end if;
END writeExternalDTDToBuffer;

PROCEDURE writeExternalDTDToClob(doc DOMDocument, cl in out clob) is
   charset VARCHAR2(64);
   err VARCHAR2(512) := null;
BEGIN
   if doc.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   select v$nls_parameters.value into charset from v$nls_parameters
   where v$nls_parameters.parameter='NLS_CHARACTERSET';
   xmldocumentcover.writeExternalDTDToClob(doc.ID, cl, charset, err);
   if err is not null then
      raise_app_error(FILE_ERR, err);
   end if;
END writeExternalDTDToClob;

PROCEDURE writeExternalDTDToFile(doc DOMDocument, fileName varchar2,
                                 charset varchar2) is
   err VARCHAR2(512) := null;
BEGIN
   if doc.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   xmldocumentcover.writeExternalDTDToFile(doc.ID, fileName, charset, err);
   if err is not null then
      raise_app_error(FILE_ERR, err);
   end if;
END writeExternalDTDToFile;

PROCEDURE writeExternalDTDToBuffer(doc DOMDocument, buffer in out varchar2,
                                   charset varchar2) is
   err VARCHAR2(512) := null;
BEGIN
   if doc.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   xmldocumentcover.writeExternalDTDToBuffer(doc.ID, buffer, charset, err);
   if err is not null then
      raise_app_error(FILE_ERR, err);
   end if;
END writeExternalDTDToBuffer;

PROCEDURE writeExternalDTDToClob(doc DOMDocument, cl in out clob,
                                 charset varchar2) is
   err VARCHAR2(512) := null;
BEGIN
   if doc.ID = -1 then
      raise_app_error(NULL_ERR);
   end if;
   xmldocumentcover.writeExternalDTDToClob(doc.ID, cl, charset, err);
   if err is not null then
      raise_app_error(CONN_ERR, err);
   end if;
END writeExternalDTDToClob;

end;
/

SHOW ERRORS;


