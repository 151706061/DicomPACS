DROP FUNCTION ASU.GET_PARSE_PRIEMGRAPH
/

--
-- GET_PARSE_PRIEMGRAPH  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--
CREATE OR REPLACE FUNCTION ASU.GET_PARSE_PRIEMGRAPH(aValue in varchar2) return varchar2 is
  Result varchar2(1024);

  nLen NUMBER;
  i NUMBER;
  r VARCHAR2(1024);
  nPos NUMBER;
BEGIN
  nLen := length(aValue);
  IF instr(aValue,',') > 0 THEN
    RESULT := RESULT || 'дни ';
  ELSIF instr(aValue,'-') > 0 THEN
    RESULT := RESULT || 'дни ';
  ELSE
    RESULT := RESULT || 'день ';
  END IF;

  FOR i IN 1..nLen LOOP
    IF substr(aValue,i,1) IN ('0','1','2','3','4','5','6','7','8','9') THEN
      RESULT := RESULT || substr(aValue,i,1);
    ELSIF substr(aValue,i,1) = ',' THEN
      RESULT := RESULT || '-й, ';
    ELSIF substr(aValue,i,1) = '-' THEN
      r := RESULT;
      SELECT REVERSE(r) INTO r FROM dual;
      nPos := instr(r,' ');
      r := substr(RESULT,1,Length(RESULT)-nPos+1) || 'c' || substr(RESULT,Length(RESULT)-nPos+1, Length(RESULT));
      RESULT := r;
      RESULT := RESULT || '-го по ';
    END IF;
  END LOOP;

  RESULT := RESULT || '-й ';

  return(Result);
end GET_PARSE_PRIEMGRAPH;
/

SHOW ERRORS;


