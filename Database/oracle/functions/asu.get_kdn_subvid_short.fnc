DROP FUNCTION ASU.GET_KDN_SUBVID_SHORT
/

--
-- GET_KDN_SUBVID_SHORT  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSROKY (Table)
--   PKG_SMINI (Package)
--   GET_PACDAYSPLAN (Function)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_KDN_SUBVID_SHORT" (pFD_DATAC IN DATE,pFK_PRIZN IN NUMBER,pFK_KOD IN NUMBER)
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
                    and tkarta.FK_KOD2=pfk_prizn
                    AND TKARTA.FK_ID=FK_PACID
                    AND FK_KOD=pFK_KOD
                    AND GET_PACDAYSPLAN(TKARTA.FK_ID)<=PKG_SMINI.READSTRING('CONFIG','SHORT_SROK','5')
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
                    and tkarta.FK_KOD2=pfk_prizn
                    AND TKARTA.FK_ID=FK_PACID
                    AND FK_KOD=pFK_KOD
                    AND GET_PACDAYSPLAN(TKARTA.FK_ID)<=PKG_SMINI.READSTRING('CONFIG','SHORT_SROK','5'));
   i NUMBER;
BEGIN
  OPEN c;
  FETCH c INTO i;
  CLOSE c;
  RETURN i;
END;
/

SHOW ERRORS;


