DROP FUNCTION ASU.GET_KDN
/

--
-- GET_KDN  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSROKY (Table)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_KDN" (pFD_DATAC IN DATE) RETURN NUMBER
  IS
  Cursor c IS
         select /*+ rule*/count(*) as fn_count
          from (select fk_ibid, fc_fam
                  from tsroky,TKARTA
                 where
--                      TRUNC(fd_data1) <= pFD_DATAC
--                      and TRUNC(fd_data3) >= pFD_DATAC
-- Modified by TimurLan ...& Replaced (4 optimization) with:
                       (
                         ((FD_DATA1 between pFD_DATAC and pFD_DATAC+1-1/(24*60*60)) and pFD_DATAC < FD_DATA3)
                       OR
                         (pFD_DATAC between FD_DATA1 and FD_DATA3)
                       OR
                         ((FD_DATA3 between pFD_DATAC and pFD_DATAC+1-1/(24*60*60)) and pFD_DATAC > FD_DATA1)
                       )
                   and fk_pryb not in (1,3,7)
                   AND TKARTA.FK_ID=FK_PACID
                 UNION
                select fk_ibid, fc_fam
                  from tsroky,TKARTA
                 where
--                                  TRUNC(fd_data1) = pFD_DATAC
--                                  and TRUNC(fd_data3) >= pFD_DATAC
                       (
                         ((FD_DATA1 between pFD_DATAC and pFD_DATAC+1-1/(24*60*60)) and pFD_DATAC < FD_DATA3)
                       OR
                         ((FD_DATA3 between pFD_DATAC and pFD_DATAC+1-1/(24*60*60)) and pFD_DATAC = FD_DATA1)
                       )
                   and fk_pryb in (5,6)
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


