-- Start of DDL Script for Table MED.TMEDICS_BY_UCHRG_MOGROUP
-- Generated 05.12.2008 10:08:39 from MED@ASU

CREATE TABLE med.tmedics_by_uchrg_mogroup
    (fk_uchgr_id                    NUMBER NOT NULL,
    fk_mogroup_id                  NUMBER NOT NULL,
    fl_accept                      NUMBER(1,0) DEFAULT 0)
  PCTFREE     10
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  usr
  STORAGE   (
    INITIAL     65536
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
  NOCACHE
  MONITORING
/

-- Indexes for MED.TMEDICS_BY_UCHRG_MOGROUP

CREATE INDEX med.tmedics_by_uchgr ON med.tmedics_by_uchrg_mogroup
  (
    fk_uchgr_id                     ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  usr
  STORAGE   (
    INITIAL     65536
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
NOLOGGING
/

CREATE INDEX med.tmedics_by_mogroup ON med.tmedics_by_uchrg_mogroup
  (
    fk_mogroup_id                   ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  usr
  STORAGE   (
    INITIAL     65536
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
NOLOGGING
/

CREATE INDEX med.tmedics_by_ug_mg_fl_accept ON med.tmedics_by_uchrg_mogroup
  (
    fl_accept                       ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  usr
  STORAGE   (
    INITIAL     65536
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
NOLOGGING
/



-- Comments for MED.TMEDICS_BY_UCHRG_MOGROUP

COMMENT ON TABLE med.tmedics_by_uchrg_mogroup IS 'связь учетной группы и группы мо для определения разрешенных для выбора медикаментов Воронов О.А. (05.12.2008)'
/
COMMENT ON COLUMN med.tmedics_by_uchrg_mogroup.fk_mogroup_id IS 'med.TMO_GROUP.GROUPID'
/
COMMENT ON COLUMN med.tmedics_by_uchrg_mogroup.fk_uchgr_id IS 'med.TUCHGR.UCHGRID'
/
COMMENT ON COLUMN med.tmedics_by_uchrg_mogroup.fl_accept IS 'признак разрешения отображать медикамент учетной группы для указанной группы мо'
/

-- End of DDL Script for Table MED.TMEDICS_BY_UCHRG_MOGROUP


  truncate table MED.TMEDICS_BY_UCHRG_MOGROUP
  /
  insert into MED.TMEDICS_BY_UCHRG_MOGROUP (FK_MOGROUP_ID, FK_UCHGR_ID)
  select mg.GROUPID, ug.UCHGRID from med.tmo_group mg, med.tuchgr ug ORDER BY mg.GROUPID
  /
  
  commit
  /
