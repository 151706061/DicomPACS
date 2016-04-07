DROP FUNCTION ASU.GET_AREA
/

--
-- GET_AREA  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TDISTRICT_NAME (Table)
--   TDISTRICT_PACIENT (Table)
--   TSMID (Table)
--   GET_SYNID (Function)
--
CREATE OR REPLACE FUNCTION ASU.Get_AREA(p_People in number, p_TypeID in Number) return varchar2 is
  o_sArea_peop varchar2(4000);

-- Added by Kosov 19.08.2010
-- Функция возвращает "номер(тип)"(o_sArea_peop) участка к которуму приписан пациент.
-- %param p_People - код пациента,у которого надо узнать его участок.
-- %param p_TypeID - тип участка (Детский/Взрослый). Ссылается на ASU.TSMID.FK_ID.
-- Если на пациента нет участка, то возвращается пустое значение.

  cursor cArea is select
                         Decode(S.Fc_Synonim,
                                'PEDIATR_AREA',
                                Dn.Fc_Name || '(Детский)',
                                'THERAPIST_AREA',
                                Dn.Fc_Name || '(Взрослый)',
                                Dn.Fc_Name) FC_AREA
                    from Tdistrict_Name dn,
                         TDISTRICT_PACIENT Dp,
                         Tsmid s
                   where Dn.Fk_Typeid = S.Fk_Id
                     and DP.FK_AREALID = DN.FK_ID
                     And S.Fk_Owner = Get_Synid('AREA_TYPE')
                     and dp.FK_PEPLID = p_People
                     and dn.fk_typeid = p_TypeID;

BEGIN
  Open cArea;
    Fetch cArea into o_sArea_peop;
  Close cArea;

  return(o_sArea_peop);
end Get_AREA;
/

SHOW ERRORS;


