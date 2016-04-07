CREATE OR REPLACE FUNCTION ASU.GET_SOOTV_TYPEOPL_SMID_SYN(ASYNONIM VARCHAR2,
                                                  AISSMID  NUMBER DEFAULT 1)
  RETURN VARCHAR2 IS
  RESULT VARCHAR2(255);
BEGIN
  IF AISSMID = 1 THEN
    SELECT DECODE(ASYNONIM,
                  'TAL_OPLOMS',
                  'OMS',
                  'TAL_OPLDMS',
                  'DMS',
                  'TAL_OPLBUDZH',
                  'BUDZHET',
                  'TAL_OPLPLAT',
                  'KOMERC',
                  'TAL_OTHER',
                  'DOGOVOR',
                  '')
      INTO RESULT
      FROM DUAL;
  ELSE
    SELECT DECODE(ASYNONIM,
                  'OMS',
                  'TAL_OPLOMS',
                  'DMS',
                  'TAL_OPLDMS',
                  'BUDZHET',
                  'TAL_OPLBUDZH',
                  'KOMERC',
                  'TAL_OPLPLAT',
                  'DOGOVOR',
                  'TAL_OTHER',
                  'UDOST',
                  'TAL_OTHER',
                  '')
      INTO RESULT
      FROM DUAL;
  END IF;
  RETURN(RESULT);
END;