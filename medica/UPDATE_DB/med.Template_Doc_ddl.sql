-- Start of DDL Script for Table MED.TDOC_TEMPLATE
-- Generated 22-дек-2009 9:32:12 from MED@h091003c

CREATE TABLE med.TTemplate_Doc
    (fk_id                          NUMBER,
    fp_vid                         NUMBER,
    fp_vid_move                    NUMBER,
    fc_descr                       VARCHAR2(50),
    fk_moid                        NUMBER,
    fk_mo_group_id                 NUMBER,
    fd_create                      DATE)
/


-- Comments for MED.TDOC_TEMPLATE
COMMENT ON TABLE MED.TTEMPLATE_DOC IS 
'Шаблоны документов (списания и требования). Author:Voronov'
/
COMMENT ON COLUMN med.TTemplate_Doc.fc_descr IS 'описание шаблона'
/
COMMENT ON COLUMN med.TTemplate_Doc.fd_create IS 'дата создания'
/
COMMENT ON COLUMN med.TTemplate_Doc.fk_mo_group_id IS 'для какой группы'
/
COMMENT ON COLUMN med.TTemplate_Doc.fk_moid IS 'кто создал шаблон'
/
COMMENT ON COLUMN med.TTemplate_Doc.fp_vid IS 'вид документа, к которому этот шаблон'
/
COMMENT ON COLUMN med.TTemplate_Doc.fp_vid_move IS 'подвид документа, к которому этот шаблон'
/

-- End of DDL Script for Table MED.TDOC_TEMPLATE

CREATE SEQUENCE MED.SEQ_TTEMPLATE_DOC
/

CREATE or replace TRIGGER MED.TTEMPLATE_DOC_INS
 BEFORE 
 INSERT
 ON MED.TTEMPLATE_DOC
 FOR EACH ROW 
begin
  if :NEW.FK_ID is null then
    select MED.SEQ_TTEMPLATE_DOC.NEXTVAL into :NEW.FK_ID from dual;
  end if;
end;
/

CREATE TRIGGER MED.TTEMPLATE_DOC_DEL
 BEFORE 
 DELETE
 ON MED.TTEMPLATE_DOC
 FOR EACH ROW 
begin
  delete from med.ttemplate_dpc where FK_TEMPLATE_DOC_ID = :OLD.FK_ID;
end;
/

CREATE Unique INDEX MED.TTEMPLATE_DOC_FK_ID ON MED.TTEMPLATE_DOC
   (  FK_ID ASC  ) 
 COMPUTE STATISTICS 
/

CREATE INDEX MED.TTEMPLATE_DOC_VID ON MED.TTEMPLATE_DOC
   (  FP_VID ASC ,  FP_VID_MOVE ASC  ) 
 COMPUTE STATISTICS 
/

CREATE INDEX MED.TTEMPLATE_DOC_FK_MOGROUP ON MED.TTEMPLATE_DOC
   (  FK_MO_GROUP_ID ASC ,  FK_MOID ASC  ) 
 COMPUTE STATISTICS 
/


