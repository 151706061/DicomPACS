-- Start of DDL Script for Table MED.TCALC_PRIH_RASH
-- Generated 13-���-2010 12:18:12 from MED@H100609

CREATE TABLE med.tcalc_prih_rash
    (fk_kartid                      NUMBER,
    fn_kol                         NUMBER,
    fd_date                        DATE,
    fk_mogroup                     NUMBER,
    dpid                           NUMBER,
    dpcid                          NUMBER,
    rezerv_dpcid                   NUMBER,
    fp_vid                         NUMBER,
    fp_vidmove                     NUMBER,
    prih_dpid                      NUMBER)
/

-- Comments for MED.TCALC_PRIH_RASH

COMMENT ON COLUMN med.tcalc_prih_rash.dpcid IS 'med.tdpc.dpcid - ������� �� ���������, �� �������� ���� ��������'
/
COMMENT ON COLUMN med.tcalc_prih_rash.dpid IS 'med.tdocs.dpid - �������� �� �������� ���� ��������'
/
COMMENT ON COLUMN med.tcalc_prih_rash.fd_date IS '���� ����� ���-��'
/
COMMENT ON COLUMN med.tcalc_prih_rash.fk_kartid IS 'med.tkart.kartid - ������'
/
COMMENT ON COLUMN med.tcalc_prih_rash.fk_mogroup IS 'med.tmo_group.groupid - ������ ��'
/
COMMENT ON COLUMN med.tcalc_prih_rash.fn_kol IS '���-��'
/
COMMENT ON COLUMN med.tcalc_prih_rash.fp_vid IS 'med.tdocs.fp_vid - ��� ��������'
/
COMMENT ON COLUMN med.tcalc_prih_rash.fp_vidmove IS 'med.tdocs.fp_vidmove - ��� ��������'
/
COMMENT ON COLUMN med.tcalc_prih_rash.prih_dpid IS 'med.tdocs.dpid - �������� �� �������� ��� ������'
/
COMMENT ON COLUMN med.tcalc_prih_rash.rezerv_dpcid IS 'med.tdpc.dpcid - ���� ��������� � ������, ��� ���������� �� �������'
/

COMMENT ON TABLE MED.TCALC_PRIH_RASH IS 
'������������� ������� ��� �������� ��������. Autor:Voronov'
/

ALTER TABLE MED.TCALC_PRIH_RASH 
 ADD (
  FD_INS_DATE DATE,
  FK_MOID_INS NUMBER
 )
/

COMMENT ON COLUMN MED.TCALC_PRIH_RASH.FD_INS_DATE IS '���� �������'
/
COMMENT ON COLUMN MED.TCALC_PRIH_RASH.FK_MOID_INS IS '��� �������'
/

CREATE TRIGGER MED.TCALC_PR_INS
 BEFORE 
 INSERT
 ON MED.TCALC_PRIH_RASH
 FOR EACH ROW 
begin
  :new.FD_INS_DATE := sysdate;
  :new.FK_MOID_INS := med.pkg_medses.get_curmo;
end;
/

-- End of DDL Script for Table MED.TCALC_PRIH_RASH

-- Indexes for MED.TCALC_PRIH_RASH

CREATE INDEX med.tcalc_pr_group_by ON med.tcalc_prih_rash
  (
    fk_kartid                       ASC,
    prih_dpid                       ASC,
    rezerv_dpcid                    ASC
  )
/

CREATE INDEX med.tcalc_pr_mogroup_date ON med.tcalc_prih_rash
  (
    fk_mogroup                      ASC,
    fd_date                         ASC
  )
/

CREATE INDEX med.tcalc_pr_dpid ON med.tcalc_prih_rash
  (
    dpid                            ASC
  )
/

exec dbms_stats.gather_table_stats('MED', 'tcalc_prih_rash');
/
