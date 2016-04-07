DROP PROCEDURE ASU.DO_SET_FUSORDER
/

--
-- DO_SET_FUSORDER  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMINI (Table)
--   TFUS_ORDER (Table)
--   TIB (Table)
--   TVIDDOC (Table)
--   TAMBULANCE (Table)
--   TDO_SET_ORDER_ERROR (Table)
--   TPEOPLES (Table)
--   TPEOPLES_S (Table)
--   TSMID (Table)
--   TSOTR (Table)
--   TEXCHANGE_OWN (Table)
--   TEXCHANGE_THEIR (Table)
--   TTABLES (Table)
--   GET_DIAG_BY_TYPE (Function)
--   GET_NEVIP (Function)
--   GET_OPK_OSPK (Function)
--   TKARTA (Table)
--   VNAZ (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_SET_FUSORDER" IS
 maxsmid NUMBER;
 pGroup  NUMBER;
 pRezus  NUMBER;
 pOtdel  NUMBER;
 ppepl   NUMBER;
 pdate   DATE;
 pibid   asu.tfus_order.fk_ibid%type;
 piby    asu.tfus_order.fk_iby%type;
 pac_id  tambulance.fk_id%type;
 rPeople asu.tpeoples%rowtype;
 vtviddocFK_DOCVID varchar(32); 
 vStr varchar2(4000);
BEGIN
begin
 SELECT FC_VALUE
   INTO maxsmid
   FROM TSMINI
  WHERE FC_SECTION = 'TREBPERELIVKROVI'
    AND FC_KEY = 'MAX_IB';
 UPDATE TSMINI
    SET FC_VALUE = (SELECT TO_CHAR(MAX(FK_ID)) FROM TIB)
  WHERE FC_SECTION = 'TREBPERELIVKROVI'
    AND FC_KEY = 'MAX_IB';
 -- Материалы, которые могут быть заказаны
 FOR C1 IN (SELECT DISTINCT EO.FN_CODE FK_OUR, ET.FN_CODE FK_THEIR
              FROM EXCH43.TEXCHANGE_THEIR ET, EXCH43.TTABLES T, EXCH43.TEXCHANGE_OWN EO
             WHERE T.FK_ID = ET.FK_TABLE
               AND T.FC_NAME = 'SPK_MATERIAL'
               AND EO.FK_THEIR = ET.FK_ID) LOOP
  -- Количество заказанного материала и реципиент
  FOR C2 IN (SELECT I.FN_NUM, I.FK_PACID, I.FK_SMID, I.FK_VRACHID, I.FD_DATE
               FROM TIB I
              WHERE FK_SMID = C1.FK_OUR
                    AND I.FK_ID > maxsmid --by A.Nakorjakov
                    ) LOOP
   --  Отделение
   SELECT MAX(S.FK_OTDELID) INTO pOtdel FROM LOGIN.TSOTR S WHERE S.FK_ID = C2.FK_VRACHID;
   -- Пипл
   SELECT MAX(FK_PEPLID), MAX(N.FD_NAZ), MAX(K.FK_IBID), MAX(K.FK_IBY),MAX(K.FK_ID)
     INTO ppepl, pdate, pibid, piby,pac_id
     FROM TKARTA K, VNAZ N
    WHERE N.FK_ID = C2.FK_PACID
      AND K.FK_ID = N.FK_PACID;

   -- Группа крови реципиента
   SELECT MAX(I.FK_SMID)
     INTO pGroup
     FROM TKARTA K, TSMID S, TIB I
    WHERE K.FK_ID = pac_id
      AND I.FK_PACID = K.FK_PEPLID
      AND I.FK_SMEDITID = S.FK_ID
      AND S.FC_SYNONIM = 'LD_BLOOD_GROUP';
   -- Резус реципиента
   SELECT MAX(I.FK_SMID)
     INTO pRezus
     FROM TKARTA K, TSMID S, TIB I
    WHERE K.FK_ID = pac_id
      AND I.FK_PACID = K.FK_PEPLID
      AND I.FK_SMEDITID = S.FK_ID
      AND S.FC_SYNONIM = 'RESUC';      

   --на случай, если пипл не был реплицирован делаем вставку пипла (уникальный индекс по fk_guid не позволит добавить дубль)
   --by A.Nakorjakov
    select * 
    into rPeople
    from tpeoples p where p.fk_id = ppepl;
    begin
      select t.fk_guid
        into vtviddocFK_DOCVID
        from asu.tviddoc t
       where t.FK_ID = rPeople.FK_DOCVID;
    exception
      when others then
        vtviddocFK_DOCVID := null;
    end;
    
    insert into tpeoples_s
      (FK_ID,
       FC_FAM,
       FC_IM,
       FC_OTCH,
       FP_SEX,
       FD_ROJD,
       FC_DOCSER,
       FC_DOCNUM,
       FD_DOCDATE,
       FC_DOCVIDAN,
       FC_RABOTA,
       FC_PHONE,
       FC_FAX,
       FC_E_MAIL,
       FC_HTTP,
       FC_ROJDPLACE,
       FK_GUID,
       FK_DOCVIDg,
       fd_edittime)
    values
      (0,
       rPeople.FC_FAM,
       rPeople.FC_IM,
       rPeople.FC_OTCH,
       rPeople.FP_SEX,
       rPeople.FD_ROJD,
       rPeople.FC_DOCSER,
       rPeople.FC_DOCNUM,
       rPeople.FD_DOCDATE,
       rPeople.FC_DOCVIDAN,
       rPeople.FC_RABOTA,
       rPeople.FC_PHONE,
       rPeople.FC_FAX,
       rPeople.FC_E_MAIL,
       rPeople.FC_HTTP,
       rPeople.FC_ROJDPLACE,
       rPeople.FK_GUID,
       vtviddocFK_DOCVID,
       systimestamp);
   
   -- Insert   
   INSERT INTO TFUS_ORDER FO
    (FK_FROMLPUOTD,
     FK_TOLPUOTD,
     FK_MATERIAL,
     FK_PACID,
     FN_AMOUNT,
     FK_REZUS,
     FK_BLOODGR,
     FC_DIAG_REC,
     FD_DATE,
     FC_COMMENT,
     FK_SOS,--by A.Nakorjakov
     FK_IBID,--by A.Nakorjakov
     FK_IBY) --by A.Nakorjakov
   VALUES
    (pOtdel,
     GET_OPK_OSPK,
     C1.FK_THEIR,
     ppepl,
     C2.FN_NUM,
     pRezus,
     pGroup,
     GET_DIAG_BY_TYPE(C2.FK_PACID, 'CLINIK', 'MAIN'),
     pdate,
     'Из ОКБ ХМАО',
     asu.get_nevip,
     pibid,
     piby); --by A.Nakorjakov
  END LOOP;
 END LOOP;
 commit;
exception
  when others then
    vStr := SQLERRM;
    insert into asu.tdo_set_order_error (dt,error)
    values (sysdate,vStr);
    commit;
end;
END;
/

SHOW ERRORS;


