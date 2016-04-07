DROP TABLE ASU.TLAB_PCR_LOT CASCADE CONSTRAINTS
/

--
-- TLAB_PCR_LOT  (Table) 
--
CREATE TABLE ASU.TLAB_PCR_LOT
(
  FK_ID          NUMBER,
  FK_SMID        NUMBER,
  FC_NAME        VARCHAR2(100 BYTE),
  FN_HEIGHT      NUMBER,
  FN_WIDTH       NUMBER,
  FL_DIR_HEIGHT  NUMBER(1),
  FL_DIR_WIDTH   NUMBER(1),
  FL_SOS         NUMBER,
  FL_DEL         NUMBER(1),
  FL_FIRST       NUMBER(1)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TLAB_PCR_LOT IS 'ПЦР лаборатория. Справочник штативов.'
/

COMMENT ON COLUMN ASU.TLAB_PCR_LOT.FK_ID IS 'ID'
/

COMMENT ON COLUMN ASU.TLAB_PCR_LOT.FK_SMID IS 'TSMID.FK_ID тип исходного материала'
/

COMMENT ON COLUMN ASU.TLAB_PCR_LOT.FC_NAME IS 'Наименование штатива'
/

COMMENT ON COLUMN ASU.TLAB_PCR_LOT.FN_HEIGHT IS 'Высота штатива'
/

COMMENT ON COLUMN ASU.TLAB_PCR_LOT.FN_WIDTH IS 'Ширина штатива'
/

COMMENT ON COLUMN ASU.TLAB_PCR_LOT.FL_DIR_HEIGHT IS 'Направление нумерации (0 - сверху вниз/1 - снизу вверх)'
/

COMMENT ON COLUMN ASU.TLAB_PCR_LOT.FL_DIR_WIDTH IS 'Направление нумерации (0 - слево направо/1 справо налево)'
/

COMMENT ON COLUMN ASU.TLAB_PCR_LOT.FL_SOS IS 'Состояние штитива (0 - Активен/1 - Не активен)'
/

COMMENT ON COLUMN ASU.TLAB_PCR_LOT.FL_DEL IS 'Признак удаления (0 - нормальная запись/1 - удален)'
/

COMMENT ON COLUMN ASU.TLAB_PCR_LOT.FL_FIRST IS '0 - сначала по горизонали заполнение/ 1 - сначала по вертикали'
/


