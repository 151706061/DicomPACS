DROP VIEW ASU.VRECEPTFARMGR
/

/* Formatted on 06.04.2016 15:19:20 (QP5 v5.115.810.9015) */
--
-- VRECEPTFARMGR  (View)
--
--  Dependencies:
--   TFARMGR (Table)
--   TRECEPT (Table)
--   TRECEPTCON (Table)
--   TMEDIC (Table)
--

CREATE OR REPLACE FORCE VIEW ASU.VRECEPTFARMGR
(
   FK_RECEPTID,
   FC_RECEPTNAME,
   FC_COMMENT,
   FK_FARMGRID
)
AS
   SELECT   r.fk_id AS fk_receptid,
            r.fc_name AS fc_receptname,
            R.FC_COMMENT,
            fg.fk_id AS fk_farmgrid
     FROM   trecept r,
            treceptcon rc,
            tfarmgr fg,
            tmedic m
    WHERE       r.fk_id = rc.fk_receptid
            AND rc.fk_medicid = m.fk_id
            AND m.fk_farmgrid = fg.fk_id
/


