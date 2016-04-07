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
-- ������� ���������� "�����(���)"(o_sArea_peop) ������� � �������� �������� �������.
-- %param p_People - ��� ��������,� �������� ���� ������ ��� �������.
-- %param p_TypeID - ��� ������� (�������/��������). ��������� �� ASU.TSMID.FK_ID.
-- ���� �� �������� ��� �������, �� ������������ ������ ��������.

  cursor cArea is select
                         Decode(S.Fc_Synonim,
                                'PEDIATR_AREA',
                                Dn.Fc_Name || '(�������)',
                                'THERAPIST_AREA',
                                Dn.Fc_Name || '(��������)',
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


