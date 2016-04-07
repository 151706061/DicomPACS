DROP FUNCTION ASU.GET_COUNT_MORNING
/

--
-- GET_COUNT_MORNING  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSROKY (Table)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_COUNT_MORNING" (pFD_DATAC IN DATE)
  RETURN NUMBER
  IS
  Cursor c IS select count(*) as fn_count from
                     (select fk_ibid, fc_fam  from tsroky , TKARTA
                        where
                        fd_data1<pFD_DATAC
                        and fd_data3>=pFD_DATAC
                        and fk_pryb<>1
                        and fk_pryb<>3
                        and fk_pryb<>7
                        AND TKARTA.FK_ID=FK_PACID
                        union
                        select /*+ rule */ fk_ibid, fc_fam  from tsroky , TKARTA
                        where
                        fd_data1=pFD_DATAC
                        and fd_data3>=pFD_DATAC
                        and (fk_pryb=5 or fk_pryb=6)
                        AND TKARTA.FK_ID=FK_PACID);
   i NUMBER;
   BEGIN
     OPEN c;
     FETCH c INTO i;
     CLOSE c;
     RETURN i;
   END;
/

SHOW ERRORS;


