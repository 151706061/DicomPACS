-- Start of DDL Script for Function MED.GET_DOCS_AUTONUM_TYPE_TEXT
-- Generated 9-янв-2011 9:53:13 from MED@H100609

CREATE OR REPLACE 
FUNCTION     med.get_docs_autonum_type_text
  ( afn_type_autonum IN NUMBER)
  RETURN  VARCHAR2 IS
BEGIN 
  case 
    WHEN afn_type_autonum = 0 THEN return 'Без автонумерации';
    WHEN afn_type_autonum = 1 THEN return 'По коду документа';
    WHEN afn_type_autonum = 2 THEN return 'Сплошная автонумерация';
    WHEN afn_type_autonum = 3 THEN return 'Сплошная автонумерация по отделению';
    else
      return '';
  end case; 
END;
/



-- End of DDL Script for Function MED.GET_DOCS_AUTONUM_TYPE_TEXT

