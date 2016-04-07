DROP PACKAGE ASU.GET_SMID_VALUES
/

--
-- GET_SMID_VALUES  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."GET_SMID_VALUES" IS
    FUNCTION Get_Number
        ( SMID_ID IN number, Pat_ID IN number, Type_Val IN varchar2)
        RETURN number;
    FUNCTION Get_Cbx
        ( SMID_ID IN number, Pat_ID IN number, Type_Val IN varchar2)
        RETURN number;
    FUNCTION Get_Fc_Char
        ( SMID_ID IN number, Pat_ID IN number, Type_Val IN varchar2)
        RETURN varchar2;
    FUNCTION Get_Date
        ( SMID_ID IN number, Pat_ID IN number, Type_Val IN varchar2)
        RETURN varchar2;
    FUNCTION Get_Edit
        ( SMID_ID IN number, Pat_ID IN number, Type_Val IN varchar2)
        RETURN varchar2;
    FUNCTION Get_CheckBox
        ( SMID_ID IN number, Pat_ID IN number)
        return number;
    function Get_Child_SMID
        ( SMID_ID in number)
        return number;
    function get_parent(SMID_ID in number, SMID_Own in number) return varchar2;
    function get_3pvalue(SMID_ID in number, SMID_Own in number, pat_id in number, count_id in number) return number;
    function get_ElStr(SMID_ID in number, pat_id in number) return varchar2;
    procedure SetNewTechBol(Pat_id in number, Doc_id in number);
    procedure SetCheckBox(Smid_id in number, Smid_own in number, Pat_id in number, Doc_id in number, Num_val in number, Cnt_val in number, lastFl in boolean);
    procedure SetDopVal(SMID_id in number, Pat_id in number, Doc_id in number, Str_val in varchar2);
    FUNCTION Get_Shab_Number
        ( SMID_ID IN number, Doc_ID IN number, Type_Val IN varchar2, ShabId in number)
        RETURN number;
    FUNCTION Get_Shab_Cbx
        ( SMID_ID IN number, Doc_ID IN number, Type_Val IN varchar2, ShabId in number)
        RETURN number;
    FUNCTION Get_Shab_Fc_Char
        ( SMID_ID IN number, Doc_ID IN number, Type_Val IN varchar2, ShabId in number)
        RETURN varchar2;
    FUNCTION Get_Shab_Edit
        ( SMID_ID IN number, Doc_ID IN number, Type_Val IN varchar2, ShabId in number)
        RETURN varchar2;
    function get_count(SMID_ID in number, Pat_ID in number) return number;
    function get_Shab_count(SMID_ID in number, Shab_Id in number) return number;
    PROCEDURE loadShablon(SMID_ID IN NUMBER, Shab_ID IN NUMBER, Pat_ID IN NUMBER);
    PROCEDURE saveShablon(Shab_name IN Varchar2, Doc_ID IN NUMBER, Pat_ID IN NUMBER, SMID_ID IN NUMBER);
END;
/

SHOW ERRORS;


