DROP FUNCTION ASU.ISDIAGMODERNIZACIAFULLMKB10
/

--
-- ISDIAGMODERNIZACIAFULLMKB10  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TICD10 (Table)
--   TICD10_MODERN (Table)
--   GET_FULLMKB10 (Function)
--
CREATE OR REPLACE FUNCTION ASU.IsDiagModernizaciaFULLMKB10(pFC_KOD in varchar2, pFD_DATE in date default sysdate) return number is
 pres number;
 cursor c  is
  select nvl(Max(fk_add_last), 0) -- 0 - нет модурнизации, 1 - есть
    from (select LAST_VALUE(tl.fk_add_last) OVER(ORDER BY fd_date ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fk_add_last
            from (SELECT t.fd_date,
                         LAST_VALUE(t.fk_add) OVER(PARTITION BY t.fk_icd10 ORDER BY fd_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) fk_add_last
                    FROM asu.TICD10_MODERN t
                   inner join asu.ticd10 i on i.fk_id = t.fk_icd10
                   WHERE SUBSTR(ASU.GET_FULLMKB10(i.fc_kod),1,20) = pFC_KOD) tl
           where trunc(tl.fd_date) <= trunc(pFD_DATE));
Begin
 OPEN C;
 FETCH C INTO pres;
 CLOSE C;

 RETURN pres;
end;
/

SHOW ERRORS;


