-- Start of DDL Script for Table MED.TINV_OPIS_GROUP
-- Generated 30-ноя-2009 11:44:37 from MED@ASU

CREATE TABLE med.tinv_opis_group
    (line1                          NUMBER,
    line2                          NUMBER,
    kol_by_page                    NUMBER,
    summ_by_page                   NUMBER)
/

-- Comments for MED.TINV_OPIS_GROUP

COMMENT ON TABLE MED.TINV_OPIS_GROUP IS 'Таблица для формирования группировки описи для описных листо инвентаризации Author:Voronov'
/
COMMENT ON COLUMN med.tinv_opis_group.kol_by_page IS 'кол-во на странице'
/
COMMENT ON COLUMN med.tinv_opis_group.line1 IS 'первая строка на странице'
/
COMMENT ON COLUMN med.tinv_opis_group.line2 IS 'последняя строка на странице'
/
COMMENT ON COLUMN med.tinv_opis_group.summ_by_page IS 'сумма на странице'
/

-- End of DDL Script for Table MED.TINV_OPIS_GROUP

