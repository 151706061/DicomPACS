CREATE OR REPLACE FUNCTION NAZ_FLUORO_IS_NORM(FK_PACID IN NUMBER) RETURN NUMBER IS
  RESULT NUMBER;
  pNazid NUMBER;
  cnt NUMBER;
  CURSOR C IS
    SELECT MAX(fk_id) keep(dense_rank LAST ORDER BY fd_run) AS fk_id
      FROM ASU.TNAZIS N
     WHERE N.FK_PACID = fk_pacid
       AND N.FK_SMID IN (SELECT FK_ID
                           FROM ASU.TSMID
                          WHERE FL_SHOWANAL = 1
                            AND FL_DEL = 0
                          START WITH FC_SYNONIM = 'ISSLED_FLUROGR'
                         CONNECT BY PRIOR FK_ID = FK_OWNER)
       AND N.FK_NAZSOSID IN
           (ASU.GET_LABVIP, ASU.GET_VIPNAZ, ASU.GET_PASS_REGISTRATOR);
  CURSOR cIsNorm IS     
           SELECT count(1)
              FROM ASU.TIB I
             WHERE i.fk_pacid = pNazid 
               AND I.FK_SMID IN
                   (SELECT FK_ID
                      FROM ASU.TSMID
                     WHERE FC_SYNONIM IN
                           ('XRAY_VRACH_RESUME', 'OTMETKI_FLU_RESUME2')
                       AND UPPER(FC_CHAR) LIKE '%ÂÀÐÈÀÍÒ%ÍÎÐÌÛ%');
BEGIN
  OPEN c;
  FETCH c INTO pNazid;
  IF c%NOTFOUND THEN pNazid := 0; END IF;
  CLOSE c;

  RESULT := pNazid;

  IF pNazid > 0 THEN
   OPEN cIsNorm;
   FETCH cIsNorm INTO cnt;
   IF cIsNorm%NOTFOUND THEN cnt := 0; END IF;
   CLOSE cIsNorm;

   RESULT := cnt;
  END IF;

  RETURN(RESULT);
END;
