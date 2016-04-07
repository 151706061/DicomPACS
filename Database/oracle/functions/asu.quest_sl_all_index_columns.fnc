DROP FUNCTION ASU.QUEST_SL_ALL_INDEX_COLUMNS
/

--
-- QUEST_SL_ALL_INDEX_COLUMNS  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   ALL_IND_COLUMNS (Synonym)
--
CREATE OR REPLACE FUNCTION ASU."QUEST_SL_ALL_INDEX_COLUMNS" 
  ( pIndex IN varchar2 DEFAULT '%',
    pOwner IN varchar2 DEFAULT '%',
    pTable IN varchar2 DEFAULT '%')
  RETURN  varchar2 IS

   CURSOR c1 IS select column_name from all_ind_columns
     where table_name like pTable and table_owner like pOwner
     and pIndex like index_name
     order by column_position;
   single_column varchar2(60);
   long_ind_column varchar2(4000);
BEGIN
    OPEN c1;
    --need a priming read to load long_ind_column
    FETCH c1 into single_column;
    IF c1%FOUND THEN
       long_ind_column :=single_column;
    END IF;

    LOOP
        FETCH c1 into single_column;
        EXIT WHEN c1%NOTFOUND;
        long_ind_column  := long_ind_column||', '||single_column;
        --long_ind_column  := CONCAT(long_ind_column ,single_column);
     END LOOP;

    RETURN long_ind_column ;
--EXCEPTION
--   WHEN exception_name THEN
--       statements ;
END QUEST_SL_ALL_INDEX_COLUMNS;
/

SHOW ERRORS;


