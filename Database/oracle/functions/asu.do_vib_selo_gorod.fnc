DROP FUNCTION ASU.DO_VIB_SELO_GOROD
/

--
-- DO_VIB_SELO_GOROD  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TIB (Table)
--   TADRESS (Table)
--   TSMID (Table)
--   GET_PROPISKAID (Function)
--   IS_SELO (Function)
--   PKG_STATUTIL (Package)
--
CREATE OR REPLACE FUNCTION ASU."DO_VIB_SELO_GOROD" (pPacid  IN NUMBER,
                                             pSotrID in Number)
  RETURN NUMBER IS
  -- Created by Kosov Eugene 13.01.2008
  -- ��������� � ���� ��������� �������: � ������ ��� ����
  rez NUMBER;

  cursor curSelo is select fk_smid
           from tib
          where fk_pacid = pPacid
            and fk_smid in (stat.pkg_statutil.get_smidid('LIVEIN_SELO'),
                stat.pkg_statutil.get_smidid('LIVEIN_CITY'));

  cursor curAdres is select max(fk_id) as adres
                       from tadress
                      where fk_pacid = pPacid
                        and fk_type = GET_PROPISKAID;

  cursor curAdresDop is select max(fk_id) as adres
                          from tadress
                         where fk_pacid = pPacid;

  pSelo     number;
  pRezSelo  number;
  pRezSelo2 number;
  pAdres    number;
  pRoditel  number;
  pSynonim  Varchar2(100);

BEGIN
  rez := 0;

  open curSelo;
   fetch curSelo into pSelo;
  close curSelo;

  open curAdres;
   fetch curAdres into pAdres;
  close curAdres;

  if NVL(pAdres, 0) = 0 then      ----���� ��� ��������� ������, ����� ���������� ����� ������ �� ��������
    open curAdresDop;
     fetch curAdresDop into pAdres;
    close curAdresDop;
  end if;

  pRezSelo := is_selo(NVL(pAdres, 0));

  if pRezSelo = 0 then
    pSynonim := 'LIVEIN_CITY';
  else
    pSynonim := 'LIVEIN_SELO';
  end if;

  pRezSelo2 := stat.pkg_statutil.GET_SMIDID(pSynonim);    -----��������� �������� ���� ��� ������ �� tsmid

  ----����������� ����/����� ��� ��� ?
  if NVL(pSelo, 0) = 0 then     -- �� �����������
    select fk_owner into pRoditel from tsmid where fk_id = pRezSelo2;

    insert into tib
      (fk_pacid, fk_smid, fk_smeditid, fk_vrachid)
    values
      (pPacid, pRezSelo2, pRoditel, pSotrID); /* returning FK_ID into :pID */
    rez := 1;
  else
    if pSelo <> pRezSelo2 then   -- �����������, �� ����������
      update tib
         set fk_smid = pRezSelo2
       where fk_pacid = pPacid
         and fk_smid = pSelo;
      rez := 1;
    end if;
  end if;
  commit;
  return rez; ---���� ������ �� ���������� �� �� ������ ������ ���� 0

end do_vib_selo_gorod;
/

SHOW ERRORS;


