DROP FUNCTION ASU.GET_COST_AFTER_PAY
/

--
-- GET_COST_AFTER_PAY  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TBALANCEMOVE (Table)
--   TBILL (Table)
--   TBILL_USLUG (Table)
--   VNAZ (Table)
--   TPLAT_USLUG (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_COST_AFTER_PAY" (pVnazId in number) return number is

  -- цена услуги после оплаты (возможно ввели сумму отличную от вбитой в базе)

  nRes  number;


  cursor curCost is
   SELECT --ROUND(BM.FN_SUM, 2) FN_SUM--,
      -- get_fullestpath(v.fk_smid) as sNameProc,
      -- get_sotrname(v.fk_ispolid) as sIspol,
      -- ROUND(BU.FN_SUM, 2) FN_SUM
       ROUND(SUM(NVL(BU.FN_SUM, 0)), 2) FN_SUM
  FROM TBILL B, TBALANCEMOVE BM, TBILL_USLUG BU, tplat_uslug PU, vnaz v
 WHERE B.FK_ID = BM.FK_BILL
   and bu.fk_bill = b.fk_id
   and PU.FK_ID = bu.fk_plat_uslug
   and v.fk_id = pu.fk_naz
   AND BM.FK_TO = -1
   and v.fk_id = pVnazId;


begin
  nRes := 0;

  open  curCost;
  fetch curCost into nRes;
  close curCost;

  return nRes;
end Get_Cost_after_Pay;
/

SHOW ERRORS;


