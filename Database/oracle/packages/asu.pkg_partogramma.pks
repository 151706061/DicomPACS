DROP PACKAGE ASU.PKG_PARTOGRAMMA
/

--
-- PKG_PARTOGRAMMA  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_PARTOGRAMMA" is

  -- Author  : TOXA
  -- Created : 09.09.2009 9:09:09
  -- Purpose : הכÿ נאבמעû ןאנעמדנאללû
/*tPartogrammaNames*/
function Ins_tPartogrammaNames(ppacid in number,
                               pparttype in number,
                               pambid in number,
                               pothodvod in date,
                                penabled in number default 0) return number;
procedure Upd_TPARTOGRAMMANAMES(pid in number,
                                ppacid in number,
                                pparttype in number,
                                pambid in number,
                               pothodvod in date,
                                penabled in number);
procedure Del_tPartogrammaNames(pid in number);
/*Tpartogrammaparams*/
function Ins_Tpartogrammaparams(ppartnames in number,
                                pdate in date,
                                pTime in number,
                                ppar1 in number,
                                ppar2 in number,
                                ppars1 in varchar2,
                                ppars2 in varchar2) return number;
procedure Upd_Tpartogrammaparams(pid in number,
                                 ppartnames in number,
                                 pdate in date,
                                 pTime in number,
                                 ppar1 in number,
                                 ppar2 in number,
                                 ppars1 in varchar2,
                                 ppars2 in varchar2);
procedure Del_Tpartogrammaparams(pid in number);
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
                              psynonim in varchar2 default '') return number;
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
                               psynonim in varchar2 default '');
procedure Del_TPARTOGRAMMATYPE(pid in number);
/*TPARTOGRAMMACONSTS*/
function Ins_TPARTOGRAMMAConsts(ptype in number,pname in varchar2,pfullname in varchar2,porder in number) return number;
procedure Upd_TPARTOGRAMMACONSTS(pid in number,ptype in number,pname in varchar2,pfullname in varchar2,porder in number);
procedure Del_TPARTOGRAMMACONSTS(pid in number);

procedure CheckDiap(nid number);

procedure CorrectTime(nid in number);

function SetSeparator(str in varchar2) return varchar2;

end;
/

SHOW ERRORS;


