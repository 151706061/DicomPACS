DROP FUNCTION ASU.GET_KIOSK_KONS_UCH_BY_OTDEL
/

--
-- GET_KIOSK_KONS_UCH_BY_OTDEL  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   GET_AMBULDP_OTDEL (Function)
--   GET_UCH_PEDIATR_SMID (Function)
--   GET_UCH_VRACH (Function)
--   GET_ZHENKONSOTDELID (Function)
--   GET_AKUSHER_GIN (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_KIOSK_KONS_UCH_BY_OTDEL"(pOtdelID in number)
return number
is
 pRes number;
begin
  if pOtdelID = ASU."GET_AMBULDP_OTDEL" then
   pRes := ASU."GET_UCH_PEDIATR_SMID";
  else
   if pOtdelID = ASU."GET_ZHENKONSOTDELID" then
    pRes := ASU."GET_AKUSHER_GIN";
   else
    pRes := ASU."GET_UCH_VRACH";
   end if;
  end if;
  return pRes;
end;
/

SHOW ERRORS;


