DROP FUNCTION ASU.GET_KEM_NAPRAVLEN
/

--
-- GET_KEM_NAPRAVLEN  (Function) 
--
CREATE OR REPLACE FUNCTION ASU.get_kem_napravlen(PFK_NAZID IN NUMBER, pAMB In NUMBER)
  RETURN VARCHAR2 IS
  CURSOR C1 IS SELECT asu.GET_VRACHFCOTDEL(FK_VRACHID) FROM asu.TNAZIS WHERE FK_ID = PFK_NAZID;
  CURSOR C2 IS SELECT DECODE(FC_CHAR, NULL, ASU.GET_SMIDNAME(TIB.FK_SMID), FC_CHAR)
                 FROM asu.TIB
                WHERE FK_PACID = PFK_NAZID
                  AND FK_SMID IN (SELECT FK_ID
                                    FROM asu.TSMID
                                  START WITH FC_SYNONIM = 'KEM_NAPRAVLEN'
                                  CONNECT BY PRIOR FK_ID = FK_OWNER
                                  UNION ALL
                                  SELECT FK_ID FROM ASU.TSMID
                                  START WITH FC_SYNONIM = 'PD_NAPRAVIV_YCH'
                                  CONNECT BY PRIOR FK_ID = FK_OWNER);
  cNAME VARCHAR2(3000);
BEGIN
  IF pAMB = 0 THEN
    OPEN C1;
    FETCH C1 INTO cNAME;
    CLOSE C1;
  END IF;
  IF pAMB = 1 THEN
    OPEN C2;
    FETCH C2 INTO cNAME;
    CLOSE C2;
  END IF;

  RETURN cNAM
/

SHOW ERRORS;


