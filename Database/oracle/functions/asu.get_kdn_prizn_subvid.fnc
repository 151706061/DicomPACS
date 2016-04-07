DROP FUNCTION ASU.GET_KDN_PRIZN_SUBVID
/

--
-- GET_KDN_PRIZN_SUBVID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSROKY (Table)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_KDN_PRIZN_SUBVID" (pFD_DATAC IN DATE,pFK_PRIZN IN NUMBER,pFK_KOD2 IN NUMBER,pFK_KOD IN NUMBER)
  RETURN NUMBER IS-- Modified by TimurLan
  Cursor c IS
         select /*+ rule*/count(*) as fn_count
           from (select fk_ibid, fc_fam
                   from tsroky,TKARTA
                  where
--                        fd_data1<=pFD_DATAC
--                    and fd_data3>=pFD_DATAC
                       (
                         ((FD_DATA1 between pFD_DATAC and pFD_DATAC+1-1/(24*60*60)) and pFD_DATAC < FD_DATA3)
                       OR
                         (pFD_DATAC between FD_DATA1 and FD_DATA3)
                       OR
                         ((FD_DATA3 between pFD_DATAC and pFD_DATAC+1-1/(24*60*60)) and pFD_DATAC > FD_DATA1)
                       )
                    and fk_pryb not in (1,3,7)
                    and tkarta.fk_prizn=pfk_prizn
                    AND TKARTA.FK_ID=FK_PACID
                    AND FK_KOD2=pFK_KOD2
                    AND FK_KOD=pFK_KOD
                  UNION
                 select fk_ibid, fc_fam
                   from tsroky,TKARTA
                  where
--                        fd_data1=pFD_DATAC
--                    and fd_data3>=pFD_DATAC
                       (
                         ((FD_DATA1 between pFD_DATAC and pFD_DATAC+1-1/(24*60*60)) and pFD_DATAC < FD_DATA3)
                       OR
                         ((FD_DATA3 between pFD_DATAC and pFD_DATAC+1-1/(24*60*60)) and pFD_DATAC = FD_DATA1)
                       )
                    and fk_pryb in (5,6)
                    and tkarta.fk_prizn=pfk_prizn
                    AND TKARTA.FK_ID=FK_PACID
                    AND FK_KOD2=pFK_KOD2
                    AND FK_KOD=pFK_KOD );
   i NUMBER;
BEGIN
  OPEN c;
  FETCH c INTO i;
  CLOSE c;
  RETURN i;
END;
/

SHOW ERRORS;


