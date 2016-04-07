DROP PACKAGE ASU.PKG_DOCOBSL_STANDRT
/

--
-- PKG_DOCOBSL_STANDRT  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_DOCOBSL_STANDRT" is
    function get_docobslname(pfk_docobslid in number) return varchar2;
    function get_standartname(pfk_standartid in number) return varchar2;
    procedure write_doc_standart(pfk_pereselid number, pfk_docid number, pfk_standartid number,
                               pfk_sotrid number, pfn_price number, pfk_pacid number, pfn_price_base number);
    FUNCTION GET_TOMP_SUM_BY_ID(pSTANDARTID IN NUMBER) RETURN NUMBER;
    function GET_SUM_BASE_COST_FOR_PAC(pfk_pacid in number) return number;

end;
/

SHOW ERRORS;


