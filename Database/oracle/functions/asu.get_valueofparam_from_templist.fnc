DROP FUNCTION ASU.GET_VALUEOFPARAM_FROM_TEMPLIST
/

--
-- GET_VALUEOFPARAM_FROM_TEMPLIST  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TIB (Table)
--   TSMID (Table)
--   GET_SMIDNAME (Function)
--   GET_SYNID (Function)
--   TTEMPLIST (Table)
--   VNAZ (Table)
--
CREATE OR REPLACE FUNCTION ASU.get_valueofparam_from_templist (APACID   IN TTEMPLIST.FK_PACID%TYPE,
                                                            APARAMID IN TTEMPLIST.FK_SMIDID%TYPE,
                                                            ADATE    IN TTEMPLIST.FD_CHANGED%TYPE)
    RETURN VARCHAR2

  -- deemaric edit 28.04.2009
  --
  -- добавил параметр Диета (динамическую форму)

  -- Vital 02/2011 - параметры кормление и (новорожденные)
 IS
  RESULT VARCHAR2(150);
BEGIN
  if APARAMID = get_synid('PROC_DIET') then -- если Диета
    begin

      select get_smidname(fk_smid) INTO RESULT
        from tib
       where fk_pacid = (select nvl(max(fk_id), -1) as fk_id
                           from vnaz
                          where fk_pacid = APACID
                            and fk_smid = APARAMID
                            and trunc(fd_naz) = ADATE)
                            and fk_smeditid = get_synid('DIET_NUM');

    end;
  elsif APARAMID = get_synid('LECH_KORM') then -- если кормление
    begin
     select get_smidname(fk_smid) INTO RESULT
        from tib
       where fk_pacid = (select nvl(max(fk_id), -1) as fk_id
                           from vnaz
                          where fk_pacid = APACID
                            and fk_smid = APARAMID
                            and trunc(fd_naz) = ADATE);
    end;
   elsif  APARAMID in( get_synid('TL_MLADENEC_URINA_UTRO'),
                       get_synid('TL_MLADENEC_URINA_VECHER'),
                       get_synid('TL_MLADENEC_PRISTUPA_UTRO'),
                       get_synid('TL_MLADENEC_PRISTUPA_VECHER'))  then
    begin
      SELECT YN.FC_NAME INTO RESULT
        FROM TTEMPLIST T, (select FK_ID,FC_NAME FROM asu.TSMID
                          CONNECT BY PRIOR FK_ID = FK_OWNER
                          START WITH FK_OWNER =  get_synid('MLADENEC_YESNO')) YN
       WHERE FK_PACID = APACID
         AND FK_SMIDID = APARAMID
         AND FD_ZAPOLN = ADATE
         AND YN.FK_ID = T.FN_VALUE     ;
    end;
elsif  APARAMID in( get_synid('TL_MLADENEC_EYE_UTRO'),
                    get_synid('TL_MLADENEC_EYE_VECHER'))  then
    begin
      SELECT YN.FC_NAME INTO RESULT
        FROM TTEMPLIST T, (select FK_ID,FC_NAME FROM asu.TSMID
                          CONNECT BY PRIOR FK_ID = FK_OWNER
                          START WITH FK_OWNER = get_synid('MLADENEC_EYE')) YN
       WHERE FK_PACID = APACID
         AND FK_SMIDID = APARAMID
         AND FD_ZAPOLN = ADATE
         AND YN.FK_ID = T.FN_VALUE     ;
    end;
elsif  APARAMID in( get_synid('TL_MLADENEC_ROT_UTRO'),
                    get_synid('TL_MLADENEC_ROT_VECHER') )  then
    begin
      SELECT YN.FC_NAME INTO RESULT
        FROM TTEMPLIST T, (select FK_ID,FC_NAME FROM asu.TSMID
                          CONNECT BY PRIOR FK_ID = FK_OWNER
                          START WITH FK_OWNER = get_synid('MLADENEC_ROT')) YN
       WHERE FK_PACID = APACID
         AND FK_SMIDID = APARAMID
         AND FD_ZAPOLN = ADATE
         AND YN.FK_ID = T.FN_VALUE     ;
    end;
elsif  APARAMID in( get_synid('TL_MLADENEC_SKIN_UTRO'),
                    get_synid('TL_MLADENEC_SKIN_VECHER'))  then
    begin
      SELECT YN.FC_NAME INTO RESULT
        FROM TTEMPLIST T, (select FK_ID,FC_NAME FROM asu.TSMID
                          CONNECT BY PRIOR FK_ID = FK_OWNER
                          START WITH FK_OWNER = get_synid('MLADENEC_SKIN')) YN
       WHERE FK_PACID = APACID
         AND FK_SMIDID = APARAMID
         AND FD_ZAPOLN = ADATE
         AND YN.FK_ID = T.FN_VALUE     ;
    end;
elsif  APARAMID in( get_synid('TL_MLADENEC_SOSREF_UTRO'),
                    get_synid('TL_MLADENEC_SOSREF_VECHER'))  then
    begin
      SELECT YN.FC_NAME INTO RESULT
        FROM TTEMPLIST T, (select FK_ID,FC_NAME FROM asu.TSMID
                          CONNECT BY PRIOR FK_ID = FK_OWNER
                          START WITH FK_OWNER = get_synid('MLADENEC_REFLEX')) YN
       WHERE FK_PACID = APACID
         AND FK_SMIDID = APARAMID
         AND FD_ZAPOLN = ADATE
         AND YN.FK_ID = T.FN_VALUE     ;
    end;
elsif  APARAMID in( get_synid('TL_MLADENEC_STUL_UTRO'),
                    get_synid('TL_MLADENEC_STUL_VECHER'),
                    get_synid('TL_MLADENEC_STUL_VID')
                   )  then
    begin
      SELECT YN.FC_NAME INTO RESULT
        FROM TTEMPLIST T, (select FK_ID,FC_NAME FROM asu.TSMID
                          CONNECT BY PRIOR FK_ID = FK_OWNER
                          START WITH FK_OWNER =get_synid('MLADENEC_STUL')) YN
       WHERE FK_PACID = APACID
         AND FK_SMIDID = APARAMID
         AND FD_ZAPOLN = ADATE
         AND YN.FK_ID = T.FN_VALUE     ;
    end;
elsif  APARAMID in( get_synid('TL_MLADENEC_PUP_UTRO'),
                     get_synid('TL_MLADENEC_PUP_VECHER')
                   )  then
    begin
      SELECT YN.FC_NAME INTO RESULT
        FROM TTEMPLIST T, (select FK_ID,FC_NAME FROM asu.TSMID
                          CONNECT BY PRIOR FK_ID = FK_OWNER
                          START WITH FK_OWNER = get_synid('MLADENEC_PUP')) YN
       WHERE FK_PACID = APACID
         AND FK_SMIDID = APARAMID
         AND FD_ZAPOLN = ADATE
         AND YN.FK_ID = T.FN_VALUE     ;
    end;
elsif  APARAMID in( get_synid('TL_MLADENEC_DROP_PUP')) then
    begin
      SELECT SUBSTR(lpad(TO_CHAR(FN_VALUE),4,'0'),1,2)||':'||SUBSTR(lpad(TO_CHAR(FN_VALUE),4,'0'),3,4) INTO RESULT
        FROM TTEMPLIST
       WHERE FK_PACID = APACID
         AND FK_SMIDID = APARAMID
         AND FD_ZAPOLN = ADATE;
    end;
else

    begin
      SELECT TO_CHAR(FN_VALUE) INTO RESULT
        FROM TTEMPLIST
       WHERE FK_PACID = APACID
         AND FK_SMIDID = APARAMID
         AND FD_ZAPOLN = ADATE;
    end;

  end if;
  RETURN(RESULT);

EXCEPTION
  WHEN OTHERS THEN
    RETURN(NULL);
END GET_VALUEOFPARAM_FROM_TEMPLIST;
/

SHOW ERRORS;


