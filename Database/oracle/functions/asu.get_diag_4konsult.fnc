DROP FUNCTION ASU.GET_DIAG_4KONSULT
/

--
-- GET_DIAG_4KONSULT  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TDIAG (Table)
--   GET_MAINDIAG (Function)
--   GET_MKB10_FROM_TSMID (Function)
--   GET_NAPRDIAG (Function)
--   GET_SMIDNAME (Function)
--   GET_ZAKLDIAG (Function)
--
CREATE OR REPLACE FUNCTION ASU.get_diag_4konsult(pNazid in number, pType in number default 1)
  RETURN varchar2 IS

  sRes varchar2(4000);
  cursor cDiag is select fc_write, fp_type
                    from asu.tdiag
                   where fk_nazid = pNazid
                     and fl_main = asu.get_maindiag
                     and fp_type in (asu.get_naprdiag, asu.get_zakldiag);
  cursor cMkb is select fp_type, asu.get_mkb10_from_tsmid(fk_smdiagid) as mkb
                   from asu.tdiag
                  where fk_nazid = pNazid
                    and fl_main = asu.get_maindiag
                    and fp_type in (asu.get_naprdiag, asu.get_zakldiag);
  cursor cPr is select fp_type, asu.get_smidname(fl_first) as prname
                  from asu.tdiag
                 where fk_nazid = pNazid
                   and fl_main = asu.get_maindiag
                   and fp_type in (asu.get_naprdiag, asu.get_zakldiag);

BEGIN
  if pType = 1 then -- ������������ ��������
    for c in cDiag loop
      if c.fp_type = asu.get_zakldiag then
        sRes := c.fc_write;
      end if;
    end loop;
    if sRes is null then
      for c in cDiag loop
        if c.fp_type = asu.get_naprdiag then
          sRes := c.fc_write;
        end if;
      end loop;
    end if;
  end if;

  if pType = 2 then -- ��� ���-10 ��������
    for c in cMkb loop
      if c.fp_type = asu.get_zakldiag then
        sRes := c.mkb;
      end if;
    end loop;
    if sRes is null then
      for c in cMkb loop
        if c.fp_type = asu.get_naprdiag then
          sRes := c.mkb;
        end if;
      end loop;
    end if;

  end if;

  if pType = 3 then -- ������� ��������
    for c in cPr loop
      if c.fp_type = asu.get_zakldiag then
        sRes := c.prname;
      end if;
    end loop;
    if sRes is null then
      for c in cPr loop
        if c.fp_type = asu.get_naprdiag then
          sRes := c.prname;
        end if;
      end loop;
    end if;
  end if;
  return sRes; -- Created by Prihodko N. 28.10.2011 ������� ���� �������� ������ ����� �������������� � ��������������� ����� -- ������� ���������� pType = 1 - ������������ ��������, ������������� � ������ ������������; pType = 2 - ��� ���-10 ��������; pType = 3 - �������(�������)
END;
/

SHOW ERRORS;


