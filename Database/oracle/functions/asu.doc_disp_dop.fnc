DROP FUNCTION ASU.DOC_DISP_DOP
/

--
-- DOC_DISP_DOP  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."DOC_DISP_DOP" return number is
BEGIN
  --������ �� ����� -1, �������� ����� �� ��� ����
  return 781/*-1*/;
end DOC_DISP_DOP;
/

SHOW ERRORS;


GRANT EXECUTE ON ASU.DOC_DISP_DOP TO PUBLIC
/

