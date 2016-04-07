DROP FUNCTION ASU.GET_ADRSTR_BY_TYPE_UID
/

--
-- GET_ADRSTR_BY_TYPE_UID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TADRESS (Table)
--   TKLADR (Table)
--
CREATE OR REPLACE FUNCTION ASU.get_adrstr_by_type_uid (pTYPE IN INTEGER:=61,
 pUID IN NUMBER:=0, forSort in integer :=-1,pLevel IN INTEGER := 2) return varchar2 is
-- 1.11.10 добавлен необ€зательн€й параметр (дл€ сортировки)
-- 1.06.12 добавлен необ€зательн€й параметр (дл€ обрезки адреса)
 gKladrID  ASU.TADRESS.FK_KLADR%TYPE;
 gHouse    ASU.TADRESS.FC_HOUSE%TYPE;
 gKorpus   ASU.TADRESS.FC_KORPUS%TYPE;
 gKvartira ASU.TADRESS.FC_KVARTIRA%TYPE;
 gTmpRes   VARCHAR2(1000);
 buff   VARCHAR2(500);
 gOwn INTEGER;

BEGIN
 buff:='';
 SELECT MAX(FK_KLADR), MAX(FC_HOUSE), MAX(FC_KORPUS), MAX(FC_KVARTIRA)
   INTO gKladrID, gHouse, gKorpus, gKvartira
   FROM ASU.TADRESS A
   WHERE A.FK_TYPE=pTYPE AND A.FK_PACID=pUID;

 IF NVL(gKladrID, 0) <= 0 THEN gTmpRes := 'јдрес не определЄн';
 ELSE
--   SELECT K.FC_PREFIX||'. '||K.FC_NAME, K.FK_OWNER
--     INTO gTmpRes, gOwn
--     FROM ASU.TKLADR K

  SELECT rtrim(min( reverse(sys_connect_by_path(reverse(fc_prefix||'.'||fc_name),','))) keep(dense_rank first ORDER BY fn_level),',')
  INTO buff --gTmpRes

   FROM asu.tkladr k
    WHERE fn_level >pLevel
    CONNECT BY PRIOR  fk_owner =fk_id  START WITH fk_id =gKladrID ;
/*
   SELECT K.FC_NAME2, K.FK_OWNER
     INTO gTmpRes, gOwn
     FROM ASU.VKLADR K
     WHERE K.FK_ID=gKladrID;

   IF gOwn<>ASU.Get_Curr_City_Kladr_Id() THEN
--     SELECT K.FC_PREFIX||'. '||K.FC_NAME||', ' INTO buff FROM ASU.TKLADR K WHERE K.FK_ID=gOwn;
     SELECT K.FC_NAME2||', ' INTO buff FROM ASU.VKLADR K WHERE K.FK_ID=gOwn;
   END IF;
  */
 if forSort <0 then
   begin
   gTmpRes := gTmpRes || ', д. ' || gHouse;
   IF NVL(gKorpus, '#') <> '#' THEN
     gTmpRes := gTmpRes || ', корп. '|| upper(gKorpus);
   END IF;
   IF NVL(gKvartira, '#') <> '#' THEN
     gTmpRes := gTmpRes || ', кв. ' || gKvartira;
   END IF;
   end;
   else
       begin
    gTmpRes := gTmpRes || ', д. ' || lpad(to_char(gHouse),4,'0');
   IF NVL(gKorpus, '#') <> '#' THEN
     gTmpRes := gTmpRes || ', корп. '||  lpad(to_char(UPPER(gKorpus)),4,'0');
   END IF;
   IF NVL(gKvartira, '#') <> '#' THEN
     gTmpRes := gTmpRes || ', кв. ' ||  lpad(to_char(gKvartira),4,'0');
   END IF;
    end;
 END IF;
 END IF;
 RETURN(buff || gTmpRes);

 /* Result VArchar2(1000);
  ADDR_ID NUMBER;  begin
SELECT MIN(A.FK_ID) INTO ADDR_ID FROM ASU.TADRESS A, ASU.TADRTYPE T
  WHERE T.FC_NAME=pTYPE AND A.FK_TYPE=T.FK_ID AND A.FK_PACID=pUID;
SELECT   ASU.GET_ADDR_STR_BY_ID(ADDR_ID) INTO Result FROM DUAL;
  return(Result);
*/
end GET_ADRSTR_BY_TYPE_UID;
/

SHOW ERRORS;


