DROP FUNCTION ASU.SET_NEWIBNUM
/

--
-- SET_NEWIBNUM  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_LOCK (Synonym)
--   DBMS_STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   DBMS_UTILITY (Synonym)
--   TSMINI (Table)
--   TDOCOBSL (Table)
--   GET_YEARWORK (Function)
--   TUSLVID (Table)
--
CREATE OR REPLACE FUNCTION ASU."SET_NEWIBNUM" 
  ( pFK_USLVIDID IN NUMBER,
    sNumIB OUT Varchar2)
  RETURN  NUMBER IS
  PRAGMA AUTONOMOUS_TRANSACTION;
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  -------------------------------------------
-- Nefedov S.M. 16.08.2006
-- Nefedov S.M. 22.01.2007 use GET_YearWork function
-- Nefedov S.M. 26.01.2007 added check sFlg from TSMINI
-- Nefedov S.M. 26.02.2007 added SLEEP mode
-- Nefedov S.M. 28.02.2007 optimaze select MAX()
-- Nefedov S.M. 27.12.2007 replace pFK_USLVIDID into nVidIB in TUSLVID logic
-- Nefedov S.M. 13.04.2009 replace flag in TSMINI on lock dbms_utilits
-- Nefedov S.M. 25.08.2009 replace string ' = null' on 'is null'
    CURSOR cVid IS select fl_ib from tuslvid where fk_id = pFK_USLVIDID;
    --CURSOR c IS select fc_value from TSMINI where fc_section = 'SetNewIBNum' and fc_key = 'MaxIB';
    CURSOR c1 (sYear in VARCHAR2, pFl_Ib in NUMBER) IS select to_number(fc_value) from TSMINI where fc_section = 'LastIBNum_'||sYear and fc_key = 'TypeIB_'||pFl_Ib;
    nDocObslID NUMBER;
    nTemp NUMBER;
    sYears VARCHAR2 (4);
    nMaxNumIB NUMBER;
    nVidIB NUMBER:=-1;
    nCountCikle NUMBER:=0;
    v_lock_name     varchar2(20) := 'MDOC_NUM';
    v_lock_id       number;
BEGIN
    -- ¬ыберем вид документа объединенный группой FL_IB
    OPEN cVid;
    FETCH cVid INTO nVidIB;
    CLOSE cVid;
    sYears:=TO_CHAR(GET_YEARWORK);
    nMaxNumIB:=-1;
    LOOP
        --создаем указатель на блокировку
        v_lock_id := dbms_utility.get_hash_value(v_lock_name, 0, 1024);
        --проверка на наличие блокировки
        if (dbms_lock.request(id                => v_lock_id,
                            lockmode          => dbms_lock.x_mode,
                            timeout           => 0,
                            release_on_commit => TRUE) = 0) then
            --UPDATE TSMINI SET fc_value = '1' where fc_section = 'SetNewIBNum' and fc_key = 'MaxIB';
            --COMMIT;
            --блокировки нет
            -- ¬ыберем последний номер док-та
            OPEN c1 (sYears, nVidIB);
            FETCH c1 INTO nMaxNumIB;
            CLOSE c1;
            --raise_application_error(-20001,to_char(nMaxNumIB)||' - nMaxNumIB');
            if nMaxNumIB = -1 or nMaxNumIB is null then
                SELECT MAX(fk_numib)INTO nTemp FROM TDOCOBSL WHERE
        			TO_CHAR(FN_YEAR)=sYears
        			and fk_viddocid in (select fk_id from tuslvid where fl_ib in (select fl_ib from tuslvid where fk_id = pFK_USLVIDID));                
           		IF nTemp is NULL then
        			nTemp:=0;
        		end IF;        			
                insert into TSMINI (fc_value, fc_section, fc_key) values (to_char(nTemp),'LastIBNum_'||sYears,'TypeIB_'||nVidIB);  
                nMaxNumIB:=nTemp+1; 
                --raise_application_error(-20001,to_char(nMaxNumIB)||' - nMaxNumIB');  
            else   			
                nMaxNumIB:=nMaxNumIB+1;
            end if;
            
        	sNumIB:=nMaxNumIB;
            -- ¬ставим уникальный номер документа обслуживани€ дл€ нового пациента
            insert into TDocObsl (fk_viddocid,fk_numib,fn_year) values (pFK_USLVIDID,nMaxNumIB,sYears)
        		RETURNING FK_ID INTO nDocObslID;
       		UPDATE TSMINI SET fc_value = to_char(nMaxNumIB) where fc_section = 'LastIBNum_'||sYears and fc_key = 'TypeIB_'||nVidIB;
      		--UPDATE TSMINI SET fc_value = '0' where fc_section = 'SetNewIBNum' and fc_key = 'MaxIB';
      		EXIT;
  		else
        --CLOSE c;
            dbms_lock.sleep(3);
            nCountCikle:=nCountCikle+1;
            if nCountCikle > 100 then
                raise_application_error(-20001,'ѕроизошло длительное ожидание вставки меддокумента. –екомендуетс€ перезапустить приложение.');
            end if;
  		end if;        
    END LOOP;

    COMMIT;
	RETURN NVL(nDocObslID,0);
END;
/

SHOW ERRORS;


