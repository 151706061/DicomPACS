ALTER TABLE MED.TLOG ADD ( FL_EDIT_OLD NUMBER (1) )
/
COMMENT ON COLUMN MED.TLOG.FL_EDIT_OLD IS 'бывший статус документа (0 - пописан, 1 - не подписан)'
/

ALTER TABLE MED.TLOG ADD ( FL_EDIT_NEW NUMBER (1) )
/
COMMENT ON COLUMN MED.TLOG.FL_EDIT_NEW IS 'новый статус документа (0 - пописан, 1 - не подписан)'
/

COMMENT ON COLUMN MED.TLOG.SOTRID IS 'ссылка на LOGIN.TAppSotr'
/

CREATE OR REPLACE TRIGGER MED.TAUDIT_TDOCS
 AFTER 
 INSERT OR DELETE OR UPDATE
 ON MED.TDOCS
 REFERENCING OLD AS OLD NEW AS NEW
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
begin
	open c;
	fetch c into ou, mc, tr, md, ci, lt;
    close c;
	
	if inserting then
		nActionNum := 1;
		strComment := 'Добавление (из TAUDIT_TDOCS)';
	elsif updating then
		nActionNum := 2;
		strComment := 'Изменение (из TAUDIT_TDOCS)';
	else
		nActionNum := 3;
		strComment := 'Удаление (из TAUDIT_TDOCS)';
	end if;
	
	insert into TLOG
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
		FL_EDIT_NEW
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
		:new.FL_EDIT
	);
end;
/


CREATE OR REPLACE TRIGGER MED.TAUDIT_TDPC
 AFTER 
 INSERT OR DELETE OR UPDATE
 ON MED.TDPC
 REFERENCING OLD AS OLD NEW AS NEW
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
begin
	open c;
	fetch c into ou, mc, tr, md, ci, lt;
	close c;
	
	if inserting then
		nActionNum := 1;
		strComment := 'Добавление (из TAUDIT_TDPC)';
	elsif updating then
		nActionNum := 2;
		strComment := 'Изменение (из TAUDIT_TDPC)';
	else
		nActionNum := 3;
		strComment := 'Удаление (из TAUDIT_TDPC)';
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
		fn_prizn
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
		nActionNum
	);
end;
/

alter TRIGGER MED.TAUDIT_TDOCS Enable
/

alter TRIGGER MED.TAUDIT_TDPC Enable
/

quit
/
