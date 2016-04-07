CREATE OR REPLACE FUNCTION MED."CREATE_DATE" (p_year in number, p_month in number, p_day in number )
RETURN date
IS
v_yr varchar2(50);  
v_mn varchar2(50);  
v_dt varchar2(50);  
begin
  v_yr := to_char(p_year,'9999');
  v_mn := trim(to_char(p_month,'99'));
  if length(v_mn)=1 then
    v_mn:='0'||v_mn;
  end if;
  v_dt := trim(to_char(p_day,'99'));
  if length(v_dt)=1 then
    v_dt:='0'||v_dt;
  end if;  
  return to_date(v_dt||'.'||v_mn||'.'||v_yr,'dd.mm.yyyy');
end;
/
