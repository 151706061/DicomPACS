DROP PACKAGE BODY ASU.PKG_DOCOBSL_STANDRT
/

--
-- PKG_DOCOBSL_STANDRT  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_DOCOBSL_STANDRT" 
 /*
  created by PHP 11.12.2007
  use in DocobslStandart.dll
 */
is
  function get_standartname(pfk_standartid in number) return varchar2
    is
   v_str varchar2(300);
  begin
    select fc_name into v_str from tstandart where fk_id=pfk_standartid;
     return v_str;
     exception
       when no_data_found then
         return ' ';
  end;

  function get_docobslname(pfk_docobslid in number) return varchar2
    is
     v_str varchar(300);
   begin
     select td.fk_numib||'/'||td.fn_year||' - '||tu.fc_name||'('||to_char(tp.fd_data1,'dd.mm.yyyy')
            ||' - '||to_char(tp.fd_data2,'dd.mm.yyyy')||')' into v_str
     from tdocobsl td, tuslvid tu, tperesel tp
       where
         td.fk_id=pfk_docobslid
         and tu.fk_id=td.fk_viddocid
         and tp.fk_docobslid=td.fk_id;
     return v_str;
     exception
       when TOO_MANY_ROWS then
         return '-= Ошибка при формировании =-';
  end;

  procedure write_doc_standart(pfk_pereselid number, pfk_docid number, pfk_standartid number,
                               pfk_sotrid number, pfn_price number, pfk_pacid number, pfn_price_base number)
    is
  begin
    insert into tdocobsl_standart (fk_pereselid,fk_docobsl, fk_standartid, fn_price, fk_sotrid,
       fd_date, fk_pacid, fn_price_base) values (pfk_pereselid,pfk_docid, pfk_standartid, pfn_price, pfk_sotrid,
       sysdate, pfk_pacid, pfn_price_base);
    exception
      when others then
        raise_application_error(20001,'Ошибка при записи стандарта. Обратитесь к администратору системы.');
  end;

FUNCTION GET_TOMP_SUM_BY_ID(pSTANDARTID IN NUMBER) RETURN NUMBER IS
 nRes NUMBER;
BEGIN

SELECT SUM (thc2.fn_cost)
  INTO nres
  FROM theal_cost thc2,
       (SELECT   fk_healid, MAX (fk_id) costid
            FROM (SELECT ths.fk_healid, ths.fk_id, ths.fn_cost
                    FROM theal_cost ths, tstandart_heal tsh
                   WHERE tsh.fk_standart = pstandartid
                     AND tsh.fk_heal = ths.fk_healid
                     AND ths.fd_date1 <= SYSDATE
                     AND NVL (ths.fd_date2, SYSDATE) >= SYSDATE)
        GROUP BY fk_healid) t1
 WHERE thc2.fk_id = t1.costid;

/* select sum(ths.fn_cost) INTO nRes from theal_cost ths, tstandart_heal tsh
    where  tsh.fk_standart=pSTANDARTID
     and tsh.fk_heal=ths.fk_healid
     AND ths.FD_DATE1 <= SYSDATE
     AND NVL(ths.FD_DATE2, SYSDATE) >= SYSDATE;   */

 RETURN NVL(ROUND(nRes, 2), 0);
END;

function GET_SUM_BASE_COST_FOR_PAC(pfk_pacid in number) return number is
  CURSOR c1(pPACID number) is select fn_price_base*decode(nvl(tp.fd_data2-tp.fd_data1,0),0,1,tp.fd_data2-tp.fd_data1) psum from tdocobsl_standart tds, tperesel tp
                         where tp.fk_id=tds.fk_pereselid and tds.fk_pacid=pPacID;
  v_sum number(8,2) default 0;
begin
  for i in c1(pfk_pacid) loop
    v_sum:=v_sum+i.psum;
  end loop;
  return v_sum;
end;
end;
/

SHOW ERRORS;


