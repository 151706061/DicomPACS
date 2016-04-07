DROP PACKAGE BODY ASU.PKG_PARTOGRAMMA
/

--
-- PKG_PARTOGRAMMA  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_PARTOGRAMMA" is
/*TPARTOGRAMMANAMES*/
function Ins_tPartogrammaNames(ppacid in number,
                               pparttype in number,
                               pambid in number,
                               pothodvod in date,
                               penabled in number default 0) return number is
pid number;
cursor c is
 select t.fk_id from asu.tpartogrammanames t where t.fk_pacid=ppacid and t.fk_parttype=pparttype;
begin

open c;
fetch c into pid;
close c;

if pid is null then
 pid:=-1;
 insert into asu.TPARTOGRAMMANAMES(fk_pacid,fk_parttype, fk_ambid, fl_enabled, fd_othodvod)
  values(ppacid,pparttype,pambid, penabled, pothodvod) returning FK_ID into pid;
else
 Upd_TPARTOGRAMMANames(pid,ppacid,pparttype,pambid,pothodvod,penabled);
end if;


return(pid);
end;

procedure Upd_TPARTOGRAMMANAMES(pid in number,
                                ppacid in number,
                                pparttype in number,
                                pambid in number,
                                pothodvod in date,
                                penabled in number) is
begin
update asu.TPARTOGRAMMANAMES set fk_pacid    = ppacid,
                                 fk_parttype = pparttype,
                                 fk_ambid    = pambid,
                                 fl_enabled  = penabled,
                                 fd_othodvod = pothodvod
                           where fk_id = pid;
end;

procedure Del_tPartogrammaNames(pid in number) is
begin
delete from asu.tpartogrammanames where fk_id = pid;
end;
/*Tpartogrammaparams*/
function Ins_Tpartogrammaparams(ppartnames in number,
                                pdate in date,
                                pTime in number,
                                ppar1 in number,
                                ppar2 in number,
                                ppars1 in varchar2,
                                ppars2 in varchar2) return number is
pid number;
begin
pid:=-1;
insert into asu.Tpartogrammaparams(fk_partnames,fd_date,fn_time,fn_par1,fn_par2,fc_par1,fc_par2)
 values(ppartnames,pdate,pTime,ppar1,ppar2,ppars1,ppars2) returning FK_ID into pid;
return(pid);
end;

procedure Upd_Tpartogrammaparams(pid in number,
                                 ppartnames in number,
                                 pdate in date,
                                 pTime in number,
                                 ppar1 in number,
                                 ppar2 in number,
                                 ppars1 in varchar2,
                                 ppars2 in varchar2) is
begin
update asu.Tpartogrammaparams set fk_partnames    =ppartnames,
                                  fd_date =pdate,
                                  fn_time = pTime,
                                  fn_par1 =ppar1,
                                  fn_par2=ppar2,
                                  fc_par1 =ppars1,
                                  fc_par2 =ppars2
                            where fk_id = pid;
end;

procedure Del_Tpartogrammaparams(pid in number) is
begin
delete from asu.Tpartogrammaparams where fk_id = pid;
end;
/*TPARTOGRAMMATYPE*/
function Ins_TPARTOGRAMMATYPE(pname in varchar2,
                              pshort in varchar2,
                              pcolnames in varchar2,
                              pbegdiap in number,
                              penddiap in number,
                              ptype in number,
                              pstepOrd in number default 20,
                              pstepAbs in number default 35,
                              pperiod in number default 1,
                              porder in number default 1000,
                              pdel in number default 0,
                              psynonim in varchar2 default '') return number is
pid number;
begin
pid:=-1;
insert into asu.TPARTOGRAMMATYPE(fc_name,fn_begdiap,fn_enddiap,fn_type,fn_stepord,fn_stepabs,fl_del,fc_short,fn_order,fc_colnames,fc_synonim,fn_period)
 values(pname,pbegdiap,penddiap,ptype,pstepord,pstepabs,pdel,pshort,porder,pcolnames,psynonim,pperiod) returning FK_ID into pid;
return(pid);
end;

procedure Upd_TPARTOGRAMMATYPE(pid in number,
                               pname in varchar2,
                               pshort in varchar2,
                               pcolnames in varchar2,
                               pbegdiap in number,
                               penddiap in number,
                               ptype in number,
                               pstepOrd in number default 20,
                               pstepAbs in number default 35,
                               pperiod in number default 1,
                               porder in number default 1000,
                               pdel in number default 0,
                               psynonim in varchar2 default '') is
begin
update asu.TPARTOGRAMMATYPE set fc_name = pname,
                                fc_short = pshort,
                                fc_colnames = pcolnames,
                                fc_synonim = psynonim,
                                fn_begdiap = pbegdiap,
                                fn_enddiap = penddiap,
                                fn_type = ptype,
                                fn_stepord = pstepOrd,
                                fn_stepabs = pstepAbs,
                                fn_order = porder,
                                fn_period = pperiod,
                                fl_del = pdel
                          where fk_id = pid;
end;

procedure Del_TPARTOGRAMMATYPE(pid in number) is
begin
delete from asu.TPARTOGRAMMATYPE where fk_id = pid;
end;

/*TPARTOGRAMMACONSTS*/
function Ins_TPARTOGRAMMAConsts(ptype in number,pname in varchar2,pfullname in varchar2,porder in number) return number is
pid number;
begin
pid:=-1;
insert into asu.TPARTOGRAMMACONSTS(fk_type,fc_name,fc_fullname,fn_order)
 values(ptype,pname,pfullname,porder) returning FK_ID into pid;
return(pid);
end;

procedure Upd_TPARTOGRAMMACONSTS(pid in number,ptype in number,pname in varchar2,pfullname in varchar2,porder in number) is
begin
update asu.TPARTOGRAMMACONSTS set fc_name = pname,
                                fk_type = ptype,
                                fc_fullname = pfullname,
                                fn_order = porder
                          where fk_id = pid;
end;

procedure Del_TPARTOGRAMMACONSTS(pid in number) is
begin
delete from asu.TPARTOGRAMMACONSTS where fk_id = pid;
end;
/*other*/
procedure CheckDiap1(nid number) is
nType number;

nBegDiap number;
nEndDiap number;
nBegTime number;
nEndTime number;

nBegTime2 number;
nEndTime2 number;

nBegDiap1 number;
nEndDiap1 number;
nBegDiap2 number;
nEndDiap2 number;
nBegDiap3 number;
nEndDiap3 number;

cursor cNames is
 select t.fn_begdiap,t.fn_enddiap,n.fn_begtime,n.fn_endtime,t.fn_type
  from asu.tpartogrammanames n,asu.tpartogrammatype t
 where n.fk_id = nid
   and n.fk_parttype=t.fk_id;

cursor cTime is
 select min(p.fn_time),max(p.fn_time) from asu.tpartogrammaparams p where p.fk_partnames=nId;

cursor cTimeBeg is
 select * from (
 select p.fn_time-8-p.fn_par1+3--p.fn_time-n.fn_begtime+p.fn_par1-3
  from asu.tpartogrammaparams p,asu.tpartogrammanames n,asu.tpartogrammatype t
 where p.fk_partnames = n.fk_id
   and t.fk_id = n.fk_parttype
   and t.fn_type = 5
   and p.fn_par1 >= 3
   and n.fk_id=nid
  order by p.fn_par1,p.fn_time) where rownum=1;

cursor cDiap02 is
 select max(p.fn_par1),min(p.fn_par1)
   from asu.tpartogrammaparams p where p.fk_partnames=nId;

cursor cDiap4 is
 select max(p.fn_par1),max(p.fn_par2),max(p.fc_par1),min(p.fn_par1),min(p.fn_par2),min(p.fc_par1)
   from asu.tpartogrammaparams p where p.fk_partnames=nId;

cursor cDiap5 is
 select max(p.fn_par1),max(p.fn_par2),min(p.fn_par1),min(p.fn_par2)
   from asu.tpartogrammaparams p where p.fk_partnames=nId;

begin
open cNames;
fetch cNames into nBegDiap,nEndDiap,nBegTime,nEndTime,nType;
close cNames;

open cTime;
fetch cTime into nBegTime2,nEndTime2;
close cTime;

if nBegTime2 is null then nBegTime2:=0; end if;
if nEndTime2 is null then nEndTime2:=0; end if;

if nType=5000 then
 nBegTime:=nBegTime;
else
 if nBegTime<>nBegTime2-1 then nBegTime:=nBegTime2-1; end if;
end if;
if nEndTime<=nEndTime2 then nEndTime:=nEndTime2+1; end if;
if nEndTime-nBegTime<24 then nEndTime:=nBegTime+24; end if;

if nType in (0,2) then
open cDiap02;
fetch cDiap02 into nBegDiap1,nEndDiap1;
close cDiap02;
if nBegDiap<nBegDiap1 then nBegDiap:=nBegDiap1; end if;
if nEndDiap>nEndDiap1 then nEndDiap:=nEndDiap1; end if;
end if;
if nType in (4) then
open cDiap4;
fetch cDiap4 into nBegDiap1,nEndDiap1,nBegDiap2,nEndDiap2,nBegDiap3,nEndDiap3;
close cDiap4;
if nBegDiap<nBegDiap1 then nBegDiap:=nBegDiap1; end if;
if nEndDiap>nEndDiap1 then nEndDiap:=nEndDiap1; end if;
if nBegDiap<nBegDiap2 then nBegDiap:=nBegDiap2; end if;
if nEndDiap>nEndDiap2 then nEndDiap:=nEndDiap2; end if;
if nBegDiap<nBegDiap3 then nBegDiap:=nBegDiap3; end if;
if nEndDiap>nEndDiap3 then nEndDiap:=nEndDiap3; end if;
end if;
if nType in (5) then
open cDiap5;
fetch cDiap5 into nBegDiap1,nEndDiap1,nBegDiap2,nEndDiap2;
close cDiap5;
if nBegDiap<nBegDiap1 then nBegDiap:=nBegDiap1; end if;
if nEndDiap>nEndDiap1 then nEndDiap:=nEndDiap1; end if;
if nBegDiap<nBegDiap2 then nBegDiap:=nBegDiap2; end if;
if nEndDiap>nEndDiap2 then nEndDiap:=nEndDiap2; end if;
/*
open cTimeBeg;
fetch cTimeBeg into nBegTime;
close cTimeBeg;*/
end if;

update asu.tpartogrammanames n set n.fn_begtime=nBegTime,
                                   n.fn_endtime=nendTime,
                                   n.fn_begdiap=nBegDiap,
                                   n.fn_enddiap=nEndDiap
                             where n.fk_id=nid;

correcttime(nid);
end;

procedure CheckDiap(nid number) is
pacid number;
mintime number;

cursor cPacid is
 select n.fk_pacid from asu.tpartogrammanames n where n.fk_id = nid;

cursor cMinTime is
 select min(p.fn_time / (60 / t.fn_stepabs))
  from asu.tpartogrammaparams p,
       asu.tpartogrammanames  n,
       asu.tpartogrammatype   t
 where p.fk_partnames = n.fk_id
   and n.fk_pacid = pacid
   and t.fk_id=n.fk_parttype;

cursor cType is
 select n.fk_id,t.fn_stepabs from asu.tpartogrammatype t,asu.tpartogrammanames n where n.fk_parttype=t.fk_id and n.fk_pacid=pacid order by t.fn_order;
begin

open cPacid;
fetch cPacid into pacid;
close cPacid;
open cMinTime;
fetch cMinTime into mintime;
close cMinTime;

for i in cType loop
update asu.tpartogrammanames n set n.fn_begtime = trunc((60/i.fn_stepabs)*(mintime-1)) where n.fk_id=i.fk_id;
end loop;

end;

procedure CorrectTime(nid in number) is
nMin number;
nInt number;
nColInt number;--количество интервалов в сутках
nMnoj number;
nType number;

cursor cMin is
 select min(fn_time) from asu.tpartogrammaparams where fk_partnames=nid;

cursor cInt is
 select t.fn_stepabs,t.fn_type from asu.tpartogrammatype t,asu.tpartogrammanames n where n.fk_parttype=t.fk_id and n.fk_id=nid;
begin

open cMin;
fetch cMin into nMin;
close cMin;

if nMin is null then nMin:=0; end if;

open cInt;
fetch cInt into nInt,nType;
close cint;

nColInt:=60/nInt*24;
nMnoj:=trunc(nMin/nColInt);

if nType <> 5 then
 if nMnoj>0 then
  update asu.tpartogrammaparams p set p.fn_time=p.fn_time-nColInt*nMnoj where p.fk_partnames=nid;
 else
  if nMin=1 then
   update asu.tpartogrammaparams p set p.fn_time=p.fn_time+nColInt where p.fk_partnames=nid;
  end if;
 end if;
end if;

end;

function SetSeparator(str in varchar2) return varchar2 is
leng number;
centr number;
nNext number;
posNext number;
res varchar2(200);
begin
nNext:=1;
posNext:=0;

leng:=length(str);
centr:=trunc(leng/2);

loop
nNext:=nNext+1;
posNext:=instr(str,' ',1,nNext);
if posnext>centr then
 exit;
end if;
end loop;

res:=substr(str,1,posnext-1)||'__'||substr(str,posnext+1,leng);
return(res);
end;

function GetWidthToOtst return number is
col number;
nam varchar2(200);
s varchar2(50);
sMocha varchar2(20);
res number;
cursor c is
 select p.fc_name nam,abs(p.fn_begdiap-p.fn_enddiap)/decode(p.fn_type,1,1,6,1,p.fn_stepord)+1 col,p.fk_id typ from asu.tpartogrammatype p;
begin
nam:='';
col:=0;

for i in c loop



if i.typ=7 then

exit;
end if;

end loop;
return(res);
end;

end;
/

SHOW ERRORS;


