-- Start of DDL Script for Trigger MED.TAUDIT_TDOCS
-- Generated 20-янв-2010 10:53:12 from MED@ASU

CREATE OR REPLACE TRIGGER med.taudit_tdocs
 AFTER
  INSERT OR DELETE OR UPDATE
 ON med.tdocs
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
	VID_MOVE NUMBER;
  v_add_values varchar2(1000):='';
begin
	open c;
	fetch c into ou, mc, tr, md, ci, lt;
    close c;
	
	if inserting then
		nActionNum := 1;
		strComment := 'Добавление (в TDOCS)';
		VID_MOVE := :new.FP_VIDMOVE;
	elsif updating then
		nActionNum := 2;
		strComment := 'Изменение (в TDOCS)';
		VID_MOVE := :old.FP_VIDMOVE;
    v_add_values:= 
        'DPID:'||to_char(:old.DPID)||';'|| 
        'MOOWNERID:'||to_char(:old.MOOWNERID)||';'|| 
        'FD_DATA'||to_char(:old.FD_DATA,'dd.mm.yyyy')||';'||
        'FC_DOC:'||:old.FC_DOC||';'||
        'FP_VID:'||to_char(:old.FP_VID)||';'|| 
        'MOFROMID:'||to_char(:old.MOFROMID)||';'|| 
        'MOTOID:'||to_char(:old.MOTOID)||';'|| 
        'POSTAVID:'||to_char(:old.POSTAVID)||';'|| 
        'FN_PRICE:'||to_char(:old.FN_PRICE)||';'|| 
        'FP_VIDMOVE:'||to_char(:old.FP_VIDMOVE)||';'|| 
        'FL_EDIT:'||to_char(:old.FL_EDIT)||';'|| 
        'FD_INVOICE'||to_char(:old.FD_INVOICE,'dd.mm.yyyy')||';'||
        'FL_TREB:'||to_char(:old.FL_TREB)||';'|| 
        'FN_SPISANIEVID:'||to_char(:old.FN_SPISANIEVID)||';'|| 
        'FK_MOGROUPID:'||to_char(:old.FK_MOGROUPID)||';'|| 
        'FK_MOGROUPID_TO:'||to_char(:old.FK_MOGROUPID_TO)||';'|| 
        'FK_MOGROUPID_FROM:'||to_char(:old.FK_MOGROUPID_FROM)||';'|| 
        'FK_SKLAD_ID:'||to_char(:old.FK_SKLAD_ID)||';'|| 
        'FK_VID_POST:'||to_char(:old.FK_VID_POST)||';'|| 
        'FC_KONTRAKT:'||:old.FC_KONTRAKT||';'||
        'FK_FINSOURCE_ID:'||to_char(:old.FK_FINSOURCE_ID)||';'|| 
        'FK_PAYCOND_ID:'||to_char(:old.FK_PAYCOND_ID)||';'|| 
        'FC_SCHET_FAKTURA:'||:old.FC_SCHET_FAKTURA||';'|| 
        'FC_COMMENT:'||:old.FC_COMMENT;    
	else
		nActionNum := 3;
		strComment := 'Удаление (из TDOCS)';
		VID_MOVE := :old.FP_VIDMOVE;		
    v_add_values:= 
        'DPID:'||to_char(:old.DPID)||';'|| 
        'MOOWNERID:'||to_char(:old.MOOWNERID)||';'|| 
        'FD_DATA'||to_char(:old.FD_DATA,'dd.mm.yyyy')||';'||
        'FC_DOC:'||:old.FC_DOC||';'||
        'FP_VID:'||to_char(:old.FP_VID)||';'|| 
        'MOFROMID:'||to_char(:old.MOFROMID)||';'|| 
        'MOTOID:'||to_char(:old.MOTOID)||';'|| 
        'POSTAVID:'||to_char(:old.POSTAVID)||';'|| 
        'FN_PRICE:'||to_char(:old.FN_PRICE)||';'|| 
        'FP_VIDMOVE:'||to_char(:old.FP_VIDMOVE)||';'|| 
        'FL_EDIT:'||to_char(:old.FL_EDIT)||';'|| 
        'FD_INVOICE'||to_char(:old.FD_INVOICE,'dd.mm.yyyy')||';'||
        'FL_TREB:'||to_char(:old.FL_TREB)||';'|| 
        'FN_SPISANIEVID:'||to_char(:old.FN_SPISANIEVID)||';'|| 
        'FK_MOGROUPID:'||to_char(:old.FK_MOGROUPID)||';'|| 
        'FK_MOGROUPID_TO:'||to_char(:old.FK_MOGROUPID_TO)||';'|| 
        'FK_MOGROUPID_FROM:'||to_char(:old.FK_MOGROUPID_FROM)||';'|| 
        'FK_SKLAD_ID:'||to_char(:old.FK_SKLAD_ID)||';'|| 
        'FK_VID_POST:'||to_char(:old.FK_VID_POST)||';'|| 
        'FC_KONTRAKT:'||:old.FC_KONTRAKT||';'||
        'FK_FINSOURCE_ID:'||to_char(:old.FK_FINSOURCE_ID)||';'|| 
        'FK_PAYCOND_ID:'||to_char(:old.FK_PAYCOND_ID)||';'|| 
        'FC_SCHET_FAKTURA:'||:old.FC_SCHET_FAKTURA||';'|| 
        'FC_COMMENT:'||:old.FC_COMMENT;
      for rec in (select t.fk_id from MED.TTREB t
         WHERE FK_DPID = :old.DPID)
      loop
        v_add_values:=v_add_values||';MED.TTREB.DPID='||to_char(rec.fk_id);
      end loop; 
      -- связи
      /*for rec in (select t.fk_id from MED.TKARTCOMPOS t
         WHERE FK_DOC_PRIH = :OLD.dpid)
      loop
        v_add_values:=v_add_values||';MED.TKARTCOMPOS.fk_id(FK_DOC_PRIH)='||to_char(rec.fk_id);
      end loop; 
      for rec in (select t.fk_id from MED.TKARTCOMPOS t
         WHERE FK_DOC_RASH = :OLD.dpid)
      loop
        v_add_values:=v_add_values||';MED.TKARTCOMPOS.fk_id(FK_DOC_RASH)='||to_char(rec.fk_id);
      end loop;*/ 
      -- delete from med.tdpc  dp where dp.kartid in(select dp2.kartid from med.tdpc dp2 where dp2.dpid = :OLD.dpid) 
         
	end if;
	
	insert into MED.TLOG
	(
		newdpid,
		olddpid,
		newpricedoc,
		oldpricedoc,
		newdata,
        olddata,
		sotrid,
		change_date,
		osuser,
		machine,
		terminal,
		program,
		logon_time,
		fc_comment,
		fn_prizn,
		newdoc,
		olddoc,
		FL_EDIT_OLD,
		FL_EDIT_NEW,
		FP_VIDMOVE,
		FK_MOGROUPID_TO,
		FK_MOGROUPID_FROM,
    fc_add_flds
	) 
    values
	(
		:new.dpid,
		:old.dpid,
		:new.fn_price,
		:old.fn_price,
		:new.fd_data,
   	    :old.fd_data,
		ci,
		sysdate,
		ou,
		mc,
		tr,
		md,
		lt,
		strComment,
		nActionNum,
       	:new.fc_doc,
		:old.fc_doc,
		:old.FL_EDIT,
		:new.FL_EDIT,
		VID_MOVE,
		nvl(:new.FK_MOGROUPID_TO, :old.FK_MOGROUPID_TO),
		nvl(:new.FK_MOGROUPID_FROM, :old.FK_MOGROUPID_FROM),
    substr(v_add_values,1,500)
	);
end;
/


-- End of DDL Script for Trigger MED.TAUDIT_TDOCS

