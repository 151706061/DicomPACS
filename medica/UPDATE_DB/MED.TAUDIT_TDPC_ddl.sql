-- Start of DDL Script for Trigger MED.TAUDIT_TDPC
-- Generated 20-янв-2010 10:43:42 from MED@ASU

CREATE OR REPLACE TRIGGER med.taudit_tdpc
 AFTER
  INSERT OR DELETE OR UPDATE
 ON med.tdpc
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
declare
	cursor c is
		select OSUSER, MACHINE, TERMINAL, MODULE, TO_NUMBER(CLIENT_INFO), LOGON_TIME
		from v$session
		where audsid = userenv('sessionid');
		
	ou varchar2(100);
	mc varchar2(100);
	tr varchar2(100);
	md varchar2(100);
	ci number;
	lt date;
	strComment varchar2(100);
	nActionNum number;
  v_add_values varchar2(1000):='';
begin
	open c;
	fetch c into ou, mc, tr, md, ci, lt;
	close c;

	if inserting then
		nActionNum := 1;
		strComment := 'Добавление (в TDPC)';
	elsif updating then
		nActionNum := 2;
		strComment := 'Изменение (в TDPC)';
	else
		nActionNum := 3;
		strComment := 'Удаление (из TDPC)';
    v_add_values:= 'DPCID:'||to_char(:old.DPCID)||';'||  
            'DPID:'||to_char(:old.DPID)||';'|| 
            'KARTID:'||to_char(:old.KARTID)||';'|| 
            'FN_KOL:'||to_char(:old.FN_KOL)||';'|| 
            'FN_NEWPRICE:'||to_char(:old.FN_NEWPRICE)||';'|| 
            'FN_PRICE:'||to_char(:old.FN_PRICE)||';'|| 
            'FN_SUMM:'||to_char(:old.FN_SUMM)||';'|| 
            'FN_SEL:'||to_char(:old.FN_SEL)||';'|| 
            'FN_TREBKOL:'||to_char(:old.FN_TREBKOL)||';'|| 
            'FK_REZERV_DOCID:'||to_char(:old.FK_REZERV_DOCID)||';'|| 
            'FD_DATE_SPIS:'||to_char(:old.FD_DATE_SPIS,'dd.mm.yyyy')||';'||
            'FK_NAZMEDLECH_ID:'||to_char(:old.FK_NAZMEDLECH_ID)||';'|| 
            'FK_RESLECH_ID:'||to_char(:old.FK_RESLECH_ID)||';'|| 
            'FN_FAS:'||to_char(:old.FN_FAS)||';'|| 
            'FK_NAZMEDLECHVID:'||to_char(:old.FK_NAZMEDLECHVID)||';'|| 
            'FK_TREBDPC:'||to_char(:old.FK_TREBDPC)||';'|| 
            'FK_NAZMEDID:'||to_char(:old.FK_NAZMEDID)||';'|| 
            'FK_CREATE_MO_ID:'||to_char(:old.FK_CREATE_MO_ID)||';'|| 
            'FD_CREATE:'||to_char(:old.FD_CREATE,'dd.mm.yyyy')||';'||
            'FK_EDIT_MO_ID:'||to_char(:old.FK_EDIT_MO_ID)||';'|| 
            'FD_EDIT:'||to_char(:old.FD_EDIT,'dd.mm.yyyy')||';'||
            'FK_NAZVRACHID:'||to_char(:old.FK_NAZVRACHID)||';'|| 
            'FK_NAZMARK_ID:'||to_char(:old.FK_NAZMARK_ID)||';'|| 
            'FC_RETURN_POST:'||:old.FC_RETURN_POST ; --||';'||
--            'FN_KOL_OLD:'||to_char(:old.FN_KOL_OLD)||';'|| 
 --           'FN_TREBKOL_OLD:'||to_char(:old.FN_TREBKOL_OLD); 
   /* for rec in (select tt.fk_id from  MED.TTREB_DPC tt
       WHERE FK_DPCID = :OLD.DPCID)
    loop
      v_add_values:=v_add_values||';MED.TTREB_DPC.fk_id='||to_char(rec.fk_id);
    end loop;  */ 
	end if;
	
    insert into TLOG
	(
		newdpid,
		olddpid,
		newkartid,
		oldkartid,
		newkol,
		oldkol,
		newsumm,
		oldsumm,
		sotrid,
		change_date,
		osuser,
		machine,
		terminal,
		program,
		logon_time,
		fc_comment,
		fn_prizn,
		DPCID,
    fc_add_flds
	) 
	values
	(
		:new.dpid,
		:old.dpid,
		:new.kartid,
		:old.kartid,
		:new.fn_kol,
		:old.fn_kol,
		:new.fn_summ,
		:old.fn_summ,
		ci,
		sysdate,
		ou,
		mc,
		tr,
		md,
		lt,
		strComment,
		nActionNum,
		nvl(:old.dpcid,:new.dpcid),
    substr(v_add_values,1,500)
	);
end;
/


-- End of DDL Script for Trigger MED.TAUDIT_TDPC

