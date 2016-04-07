DROP VIEW ASU.VPRINTDYNAMINFORM
/

/* Formatted on 06.04.2016 15:19:18 (QP5 v5.115.810.9015) */
--
-- VPRINTDYNAMINFORM  (View)
--
--  Dependencies:
--   DUAL (Synonym)
--   TSMID (Table)
--   GET_ANAMGIZNID (Function)
--   GET_DOIID (Function)
--   GET_EPIDID (Function)
--   GET_GALOBID (Function)
--

CREATE OR REPLACE FORCE VIEW ASU.VPRINTDYNAMINFORM
(
   FC_NAME
)
AS
   SELECT   '<h2>' || 'Жалобы' || '</h2>' AS fc_name FROM DUAL
   UNION ALL
       SELECT                       /*+index_asc (tsmid tsmid_by_owner_type)*/
             LPAD (' ', (LEVEL - 1) * 3) || FC_NAME
                || DECODE (fc_type,
                           'VARCHAR2', '(множественный выбор)',
                           'NUMBER', '(число)',
                           'COMBOBOX', '(выбор одного варианта)',
                           'FORM', '(окно)',
                           'DATE', '(дата)',
                           NULL, '(вариант ответа)',
                           '(поле ввода)')
                   AS fc_type
         FROM   tsmid
   START WITH   fk_owner = get_galobid
   CONNECT BY   PRIOR fk_id = fk_owner
   UNION ALL
   -------------------------
   SELECT   '<h2>' || 'Данные объективных исследований' || '</h2>' AS fc_name
     FROM   DUAL
   UNION ALL
       SELECT                       /*+index_asc (tsmid tsmid_by_owner_type)*/
             LPAD (' ', (LEVEL - 1) * 3) || FC_NAME
                || DECODE (fc_type,
                           'VARCHAR2', '(множественный выбор)',
                           'NUMBER', '(число)',
                           'COMBOBOX', '(выбор одного варианта)',
                           'FORM', '(окно)',
                           'DATE', '(дата)',
                           NULL, '(вариант ответа)',
                           '(поле ввода)')
                   AS fc_type
         FROM   tsmid
   START WITH   fk_owner = get_doiid
   CONNECT BY   PRIOR fk_id = fk_owner
   UNION ALL
   -------------------------
   SELECT   '<h2>' || 'Анамнез жизни' || '</h2>' AS fc_name FROM DUAL
   UNION ALL
       SELECT                       /*+index_asc (tsmid tsmid_by_owner_type)*/
             LPAD (' ', (LEVEL - 1) * 3) || FC_NAME
                || DECODE (fc_type,
                           'VARCHAR2', '(множественный выбор)',
                           'NUMBER', '(число)',
                           'COMBOBOX', '(выбор одного варианта)',
                           'FORM', '(окно)',
                           'DATE', '(дата)',
                           NULL, '(вариант ответа)',
                           'поле ввода')
                   AS fc_type
         FROM   tsmid
   START WITH   fk_owner = get_anamgiznid
   CONNECT BY   PRIOR fk_id = fk_owner
   UNION ALL
   -------------------------
   SELECT   '<h2>' || 'Эпиданамнез' || '</h2>' AS fc_name FROM DUAL
   UNION ALL
       SELECT                       /*+index_asc (tsmid tsmid_by_owner_type)*/
             LPAD (' ', (LEVEL - 1) * 3) || FC_NAME
                || DECODE (fc_type,
                           'VARCHAR2', '(множественный выбор)',
                           'NUMBER', '(число)',
                           'COMBOBOX', '(выбор одного варианта)',
                           'FORM', '(окно)',
                           'DATE', '(дата)',
                           NULL, '(вариант ответа)',
                           '(поле ввода)')
                   AS fc_type
         FROM   tsmid
   START WITH   fk_owner = get_epidid
   CONNECT BY   PRIOR fk_id = fk_owner
/


