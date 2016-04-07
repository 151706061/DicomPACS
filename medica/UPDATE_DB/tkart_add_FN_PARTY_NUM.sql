alter table med.tkart add FN_PARTY_NUM NUMBER(10) default -1;
COMMENT ON COLUMN med.tkart.FN_PARTY_NUM is 'номер партии - для каждого препарата своя нумерация';