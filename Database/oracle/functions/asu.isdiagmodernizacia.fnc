DROP FUNCTION ASU.ISDIAGMODERNIZACIA
/

--
-- ISDIAGMODERNIZACIA  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TICD10 (Table)
--   TICD10_MODERN (Table)
--
CREATE OR REPLACE FUNCTION ASU.IsDiagModernizacia(pFC_KOD in varchar2, pFD_DATE in date default sysdate, pDayCount in Number default -1) return number is
 pres number;
 cursor c  is
  select nvl(Max(fk_add_last), 0) -- 0 - нет модурнизации, 1 - есть
    from (SELECT t.fd_date,
                 LAST_VALUE(t.fk_add) OVER(ORDER BY t.fd_date, t.fk_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fk_add_last,
                 LAST_VALUE(t.fn_mindaycount) OVER(ORDER BY t.fd_date, t.fk_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fn_mindaycount_last,
                 LAST_VALUE(t.fn_maxdaycount) OVER(ORDER BY t.fd_date, t.fk_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fn_maxdaycount_last -- Efimov V.ј. добавлен верхний порог http://192.168.1.9/redmine/issues/17810
            FROM asu.TICD10_MODERN t
           inner join asu.ticd10 i on i.fk_id = t.fk_icd10
           WHERE i.fc_kod = pFC_KOD
             and trunc(t.fd_date) <= trunc(pFD_DATE))
   where (pDayCount = -1 or (fn_mindaycount_last <= pDayCount and pDayCount <= decode(fn_maxdaycount_last, -1, 1000000, fn_maxdaycount_last)))
     and rownum = 1;
Begin
 OPEN C;
 FETCH C INTO pres;
 CLOSE C;

 RETURN pres;
end;
/

SHOW ERRORS;


