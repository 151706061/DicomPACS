DROP PACKAGE ASU.PKG_HTML
/

--
-- PKG_HTML  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_HTML" is
  -- Author  : TIMURLAN
  -- Created : 28.02.2002 10:21:44
  -- Purpose : 4 HTML-reports standartization

  -- Public type declarations
--  type <TypeName> is <Datatype>;

  -- Public constant declarations
--  <ConstantName> constant <Datatype> := <Value>;
  -- Public variable declarations
--  <VariableName> <Datatype>;
  -- Public function and procedure declarations
--  function <FunctionName>(<Parameter> <Datatype>) return <Datatype>;
  function GET_HEAD (pTYPE in VARCHAR2,
                     pTITLE in VARCHAR2,
                     pP_MLEFT in VARCHAR2,
                     pP_FSIZE in VARCHAR2,
                     pP_FFAMILY in VARCHAR2,
                     pLI_MLEFT in VARCHAR2,
                     pLI_FSIZE in VARCHAR2,
                     pLI_FFAMILY in VARCHAR2,
                     pDIV_MLEFT in VARCHAR2,
                     pDIV_FSIZE in VARCHAR2,
                     pDIV_FFAMILY in VARCHAR2,
                     pPAGE_WIDTH in VARCHAR2,
                     pPAGE_HEIGHT in VARCHAR2,
                     pPAGE_ORIENTATION in VARCHAR2,
                     pPAGE_MTOP in VARCHAR2,
                     pPAGE_MRIGHT in VARCHAR2,
                     pPAGE_MDOWN in VARCHAR2,
                     pPAGE_MLEFT in VARCHAR2,
                     pTABLE_WIDTH in VARCHAR2,
                     pTABLE_BORDER in VARCHAR2,
                     pTABLE_MSBORDER in VARCHAR2,
                     pTD_TEXTALIGN in VARCHAR2,
                     pTD_VERTICALALIGN in VARCHAR2,
                     pTD_BORDER in VARCHAR2,
                     pTD_MSBORDER in VARCHAR2,
                     pTD_PTOP in VARCHAR2,
                     pTD_PRIGHT in VARCHAR2,
                     pTD_PDOWN in VARCHAR2,
                     pTD_PLEFT in VARCHAR2
                     ) return VARCHAR2;
end PKG_HTML;
/

SHOW ERRORS;


