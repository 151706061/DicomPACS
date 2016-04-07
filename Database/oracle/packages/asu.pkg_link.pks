DROP PACKAGE ASU.PKG_LINK
/

--
-- PKG_LINK  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_LINK" is

  -- Author  : TIMURLAN
  -- Created : 08.01.2004 15:51:35
  -- Purpose : for distributed MedIS-T connections

  -- Public type declarations
  --type <TypeName> is <Datatype>;

  -- Public constant declarations
  --<ConstantName> constant <Datatype> := <Value>;

  -- Public variable declarations
  --<VariableName> <Datatype>;

  -- Public function and procedure declarations
  --function <FunctionName>(<Parameter> <Datatype>) return <Datatype>;

  procedure TO_EXP(pFD_CRATE    IN DATE,
                   pSchemaName  IN VARCHAR2,
                   pCommandName IN VARCHAR2,
                   pKeyValue    IN NUMBER,
                   pValue       IN NUMBER);
  procedure TO_EXP(pFD_CRATE    IN DATE,
                   pSchemaName  IN VARCHAR2,
                   pCommandName IN VARCHAR2,
                   pKeyValue    IN NUMBER,
                   pValue       IN DATE);
  procedure TO_EXP(pFD_CRATE    IN DATE,
                   pSchemaName  IN VARCHAR2,
                   pCommandName IN VARCHAR2,
                   pKeyValue    IN NUMBER,
                   pValue       IN VARCHAR2);
  procedure TO_EXP(pFD_CRATE    IN DATE,
                   pSchemaName  IN VARCHAR2,
                   pCommandName IN VARCHAR2,
                   pKeyValue    IN NUMBER,
                   pValue       IN CLOB);
  procedure TO_EXP(pFD_CRATE    IN DATE,
                   pSchemaName  IN VARCHAR2,
                   pCommandName IN VARCHAR2,
                   pKeyValue    IN NUMBER,
                   pValue       IN BLOB);

  function SHELL(CMD IN VARCHAR2) return PLS_INTEGER;

  function IS_EXP(pSchemaName IN VARCHAR2,pTableName IN VARCHAR2) return BINARY_INTEGER;

  procedure ENABLE_EXP(pSchemaName IN VARCHAR2);

  procedure DISABLE_EXP(pSchemaName IN VARCHAR2);

  procedure ENABLE_TAB_EXP(pSchemaName IN VARCHAR2,pTableName IN VARCHAR2);

  procedure DISABLE_TAB_EXP(pSchemaName IN VARCHAR2,pTableName IN VARCHAR2);

  procedure DO_IMP(pTableName IN VARCHAR2);

  procedure ALTER_SEQUENSES(pSchemaName IN VARCHAR2,pDelta IN NUMBER);

end PKG_LINK;
/

SHOW ERRORS;


