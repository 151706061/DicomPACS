DROP FUNCTION ASU.GET_COUNTPACSMID
/

--
-- GET_COUNTPACSMID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TIB (Table)
--   TSMID (Table)
--   GET_PACVRACH (Function)
--   GET_VRACHOTD (Function)
--   IS_SMIDINTIB (Function)
--   DO_VYBDATE (Function)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_COUNTPACSMID" 
  ( --pFK_PACID IN number,
    pFK_SMID  in number,
    pFK_VRACHID in number,
    pFK_OTDID  in number,
    pFL_SPEC  in number,
    pFD_DATA1 in date,
    pFD_DATA2 in date)
  RETURN  number IS
-- Purpose: Сколько раз встречается параметр из СМИД
--          у пациентов за период
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  -------------------------------------------
-- Sam         16.06.2000  Create
res number;
BEGIN
  res:=-1;
  if is_smidintib(pFK_SMID)=1 then --если данные в таблице TIB
    if pFK_VRACHID=0 and pFK_OTDID=0 then -- если данные по всему санаторию
        select count(fk_pacid)
        into res
        from tib, tkarta
        where
        exists (select fk_id
                from tsmid
                where fk_id=fk_smid
                start with fk_id=pFK_SMID
                connect by prior fk_owner=fk_id)
        and tkarta.fk_id=fk_pacid
        and do_vybdate(tkarta.fk_id) between pFD_DATA1 and pFD_DATA2;
    end if;
    if pFK_VRACHID=0 and pFK_OTDID>0 then -- если данные по отделению
      select count(fk_pacid)
      into res
      from tib, tkarta
      where
      exists (select fk_id
              from tsmid
              where fk_id=fk_smid
              start with fk_id=1230
              connect by prior fk_owner=fk_id)
      and tkarta.fk_id=fk_pacid
      and do_vybdate(tkarta.fk_id) between pFD_DATA1 and pFD_DATA2
      and get_vrachotd(get_pacvrach(tkarta.fk_id))=pFK_OTDID;
    end if;
    if pFK_VRACHID>0 and pFK_OTDID=0 and pfl_spec=0 then -- если данные по лечащему врачу
      select count(fk_pacid)
      into res
      from tib, tkarta
      where
      exists (select fk_id
              from tsmid
              where fk_id=fk_smid
              start with fk_id=1230
              connect by prior fk_owner=fk_id)
      and tkarta.fk_id=fk_pacid
      and do_vybdate(tkarta.fk_id) between pFD_DATA1 and pFD_DATA2
      and get_pacvrach(tkarta.fk_id)=pFK_VRACHID;
    end if;
    if pFK_VRACHID>0 and pFK_OTDID=0 and pfl_spec=1 then -- если данные по врачу специалисту
      select /*+rule*/count(fk_pacid)
      into res
      from tib, tkarta
      where
      exists (select fk_id
              from tsmid
              where fk_id=fk_smid
              start with fk_id=1230
              connect by prior fk_owner=fk_id)
      and tkarta.fk_id=fk_pacid
      and do_vybdate(tkarta.fk_id) between pFD_DATA1 and pFD_DATA2
      and tib.fk_vrachid=pFK_VRACHID;
    end if;
  end if;
  return res;
END; -- Function GET_COUNTPACSMID
/

SHOW ERRORS;


