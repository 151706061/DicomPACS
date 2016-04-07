------------------------------------------
-- Export file for user MED             --
-- Created by 5 on 30.01.2012, 12:01:14 --
------------------------------------------

spool MED.log

prompt
prompt Creating package PKG_PRODCERT
prompt =============================
prompt
CREATE OR REPLACE PACKAGE MED."PKG_PRODCERT" is

function Find(strVal in varchar2) return integer;
procedure Add(strVal in varchar2, nID in out integer, bForeighn IN NUMBER DEFAULT 0);
procedure Edit(nID in integer, strVal in varchar2, bForeighn IN NUMBER DEFAULT 0);
procedure Remove(nID in integer);
procedure GetProdCert(nID in integer, strProd out varchar2, strCert out varchar2);

end;
/

prompt
prompt Creating package body PKG_PRODCERT
prompt ==================================
prompt
CREATE OR REPLACE PACKAGE BODY MED."PKG_PRODCERT" is

function Find(strVal in varchar2) return integer
is
begin
	null;
end;

/**/
procedure Add(strVal in varchar2, nID in out integer, bForeighn IN NUMBER DEFAULT 0)
is
	cursor cCheckParent(nID in integer)
	is
		select 1
		from tprodcert
		where fk_id = nID;

	n pls_integer;
	eNoParentFound exception;
    PRAGMA AUTONOMOUS_TRANSACTION;
begin
	if nID <> 0 then
		open cCheckParent(nID);
		fetch cCheckParent into n;
		if cCheckParent%notfound then
			raise eNoParentFound;
		end if;
		close cCheckParent;
	end if;

	insert into tprodcert(fk_id, fn_parent, fc_value, fl_foreighn)
		values(seq_tprodcert.nextval, nID, strVal, bForeighn)
		returning fk_id into nID;

	commit;
end;

/**/
procedure Edit(nID in integer, strVal in varchar2, bForeighn IN NUMBER DEFAULT 0)
is
    PRAGMA AUTONOMOUS_TRANSACTION;
begin

	update tprodcert set fc_value = strVal, fl_foreighn = bForeighn
		where fk_id = nID;

	commit;
end;

/**/
procedure Remove(nID in integer)
is
	cursor cCursor(nID in integer)
	is
		select fn_parent
		from tprodcert
		where fk_id = nID;

	c cCursor%rowtype;
    PRAGMA AUTONOMOUS_TRANSACTION;
begin
	open cCursor(nID);
	fetch cCursor into c;
	if cCursor%found then
		if c.fn_parent = 0 then
			delete from tprodcert
				where fn_parent = nID;
		end if;
		delete from med.tprodcert
			where fk_id = nID;
	end if;
	commit;
end;

/**/
procedure GetProdCert(nID in integer, strProd out varchar2, strCert out varchar2)
is
	cursor cCursor(nID in integer)
	is
		select fn_parent, fc_value
		from tprodcert
		where fk_id = nID;

	c cCursor%rowtype;
begin
	strProd := '';
	strCert := '';
	open cCursor(nID);
	fetch cCursor into c;
	if cCursor%found then
		if c.fn_parent = 0 then
			strProd := c.fc_value;
		else
			strCert := c.fc_value;
			close cCursor;
			open cCursor(c.fn_parent);
			fetch cCursor into c;
			strProd := c.fc_value;
		end if;
	end if;
	close cCursor;
end;

end pkg_prodcert;
/


spool off
