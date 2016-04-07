-- Add/modify columns 
alter table ASU.TNAZMARK add FC_REMARK VARCHAR2(300);
-- Add comments to the columns 
comment on column ASU.TNAZMARK.FC_REMARK
  is 'Примечание';
