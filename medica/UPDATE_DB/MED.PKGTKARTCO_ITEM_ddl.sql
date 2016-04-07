-- Start of DDL Script for Package Body MED.PKGTKARTCO_ITEM
-- Generated 1.10.08 18:27:27 from MED@ASU

CREATE OR REPLACE 
PACKAGE       med.pkgtkartco_item is

  -- Author  : NSV
  -- Created : 25.09.2006 15:47:17
  -- Purpose :

FUNCTION ADD_TKARTCO_ITEM(
      pfk_tkartcomposid  IN   NUMBER,
      pfn_amount         IN   NUMBER,
      pfn_amount_for1    IN   NUMBER,
      pfk_kart_item      IN   NUMBER) RETURN NUMBER;
/*добавление записи в таблицу TKARTCO_ITEM.*/

PROCEDURE EDIT_TKARTCO_ITEM(
      pfk_id        IN   NUMBER,
      pfk_kart_item IN   NUMBER,
      pfn_amount      IN   NUMBER,
      pfn_amount_for1 IN   NUMBER);
/*редактирование записи в таблице TKARTCO_ITEM.*/

PROCEDURE DEL_TKARTCO_ITEM(pfk_id IN NUMBER);
/*удаление записи в таблице TKARTCO_ITEM.*/

FUNCTION CHANGE_AMOUNT(
      pfk_id              IN NUMBER,
      pfk_tkartcomposid   IN NUMBER,
      pfn_new_main_amount IN NUMBER,
      pFN_KOLOST          OUT NUMBER, /*остаток кол-ва для данной карточки*/
      pFN_AMOUNT_NEED     OUT NUMBER) RETURN NUMBER; /* кол-во которое нам нужно*/
/*Изменим значение ингридиента TKARTCO_ITEM.pfk_id. Пересчитаем значение его поля FN_amount
 для нового значения pfn_new_main_amount (кол-во производимого медикамента).
 Если в карточке текущего ингридиента нет такого кол-ва FN_amount, то вернем 0, иначе 1 (нужное кол-во в карточке есть)
 Если нужное кол-во есть, то изменим значение поля у данной записи TKARTCO_ITEM.pfk_id
 Ф-ия возвращает: 1 - запись изменена.
                  0 - запись не изменена, т.к. нет необходимого кол-ва FN_amount*/

FUNCTION GET_OSTATOK_BY_KARTID(
      pKARTID           IN NUMBER /*КАРТОЧКА ПО КОТОРОЙ СМОТРИТСЯ ОСТАТОК*/
      ) RETURN NUMBER; /* остаток кол-ва для данной карточки*/
/*Ф-ия возвращает: 1 - ОСТАТОК КАРТОЧКИ KARTID
                  -1 - ВОЗНИКЛА ОШИБКА ИЛИ КАРТОЧКИ НЕТ*/

end PKGTKARTCO_ITEM;
/


CREATE OR REPLACE 
PACKAGE BODY     med.pkgtkartco_item is


FUNCTION ADD_TKARTCO_ITEM(
      pfk_tkartcomposid  IN   NUMBER,
      pfn_amount         IN   NUMBER,
      pfn_amount_for1    IN   NUMBER,
      pfk_kart_item      IN   NUMBER) RETURN NUMBER
/*добавление записи в таблицу TKARTCO_ITEM.
Ф-ия возвращает: 1 - запись добавлена.
                -1 - запись не добавлена, т.к. такой медикамент (fk_kart_item) уже есть, этот медикамент можно только изменить или удалить*/
IS
 vFN_RESULT number :=1;
 vNEW_ORDER NUMBER := 1;
BEGIN
   select (NVL(MAX(KI.FN_PARTY_ORDER),0)+1) as NEW_ORDER
   INTO vNEW_ORDER
   from med.TKARTCO_ITEM KI,
        (SELECT k.kartid from med.tkart K, (select k.medicid from med.tkart K where K.kartid = pfk_kart_item) MEDIC WHERE K.medicid = MEDIC.medicid) USED_PARTIES
   where KI.FK_KART_ITEM = USED_PARTIES.kartid AND
         KI.fk_tkartcomposid = pfk_tkartcomposid;

   SELECT -1
     INTO vFN_RESULT
     FROM TKARTCO_ITEM
     WHERE fk_tkartcomposid=pfk_tkartcomposid
       AND fk_kart_item=pfk_kart_item;

  IF vFN_RESULT=1 THEN
   BEGIN
     INSERT INTO TKARTCO_ITEM
        (fk_id,
         fk_tkartcomposid,
         fn_amount,
         fn_amount_for1,
         fk_kart_item,
         FN_PARTY_ORDER)
       VALUES
        (null,
         pfk_tkartcomposid,
         pfn_amount,
         pfn_amount_for1,
         pfk_kart_item,
         vNEW_ORDER) returning FK_ID into vFN_RESULT;

     RETURN vFN_RESULT;
   END;
  ELSE
   BEGIN
     RETURN -1;
   END;
  END IF;

  EXCEPTION
    WHEN NO_DATA_FOUND THEN
     INSERT INTO TKARTCO_ITEM
        (fk_id,
         fk_tkartcomposid,
         fn_amount,
         fn_amount_for1,
         fk_kart_item,
         FN_PARTY_ORDER)
       VALUES
        (null,
         pfk_tkartcomposid,
         pfn_amount,
         pfn_amount_for1,
         pfk_kart_item,
         vNEW_ORDER) returning FK_ID into vFN_RESULT;

     RETURN vFN_RESULT;
END;

PROCEDURE EDIT_TKARTCO_ITEM(
      pfk_id          IN   NUMBER,
      pfk_kart_item   IN   NUMBER,
      pfn_amount      IN   NUMBER,
      pfn_amount_for1 IN   NUMBER
      )
/*редактирование записи в таблице TKARTCO_ITEM.*/
IS
BEGIN
  UPDATE TKARTCO_ITEM
    SET fk_kart_item = pfk_kart_item,
        fn_amount = pfn_amount,
        fn_amount_for1 = pfn_amount_for1
    WHERE  fk_id = pfk_id;
END;

PROCEDURE DEL_TKARTCO_ITEM(pfk_id IN NUMBER)
/*удаление записи в таблице TKARTCO_ITEM.*/
IS
BEGIN
  DELETE FROM TKARTCO_ITEM
    WHERE  fk_id = pfk_id;
END;

FUNCTION CHANGE_AMOUNT(
      pfk_id              IN NUMBER,
      pfk_tkartcomposid   IN NUMBER,
      pfn_new_main_amount IN NUMBER,
      pFN_KOLOST          OUT NUMBER, /*остаток кол-ва для данной карточки*/
      pFN_AMOUNT_NEED     OUT NUMBER) RETURN NUMBER  /*кол-во которое нам нужно*/
/*Изменим значение поля FN_Amount у записи ингридиента TKARTCO_ITEM.pfk_id. Пересчитаем значение его поля FN_amount
 для нового значения pfn_new_main_amount (кол-во производимого медикамента).
 Если в карточке текущего ингридиента нет такого кол-ва FN_amount, то вернем 0, иначе 1 (нужное кол-во в карточке есть)
 Если нужное кол-во есть, то изменим значение поля у данной записи TKARTCO_ITEM.pfk_id
 Ф-ия возвращает: 1 - запись изменена.
                  0 - запись не изменена, т.к. нет необходимого кол-ва FN_amount*/
IS
 vFN_FPACKINUPACK NUMBER :=1;
 vFN_KOLOST NUMBER :=1;
 vFN_AMOUNT_FOR1 NUMBER :=0;
 vFK_KART_ITEM NUMBER :=0;
BEGIN
pFN_KOLOST :=0;
pFN_AMOUNT_NEED := 0;
SELECT
    FK_KART_ITEM,
    FN_AMOUNT_FOR1
  INTO
    vFK_KART_ITEM,
    vFN_AMOUNT_FOR1
  FROM TKARTCO_ITEM
  WHERE FK_ID=pfk_id;

/*получим значение остатка по данной карточке*/
SELECT
    NVL(FN_FPACKINUPACK,0),
    FN_KOLOST
  INTO
    vFN_FPACKINUPACK,
    vFN_KOLOST
  FROM VMEDKART_KOLOST
  WHERE KARTID = vFK_KART_ITEM;

/*IF vFN_FPACKINUPACK<>0 THEN vFN_KOLOST:=vFN_KOLOST*vFN_FPACKINUPACK;  умнодать не надо, если мы измеряем в упаковочных единицах
END IF;*/

pFN_KOLOST:=vFN_KOLOST;
pFN_AMOUNT_NEED:=vFN_AMOUNT_FOR1*pfn_new_main_amount;

IF (vFN_AMOUNT_FOR1*pfn_new_main_amount)<=vFN_KOLOST THEN
 BEGIN  /*все хорошо, на остатке есть нужное нам кол-во медикаментов*/
  UPDATE TKARTCO_ITEM
    SET FN_AMOUNT = FN_AMOUNT_FOR1 * pfn_new_main_amount
    WHERE FK_ID=pfk_id;

  RETURN 1;
 END;
ELSE  /*на остатке нет нужного нам кол-ва*/
 BEGIN
  RETURN 0;
 END;
END IF;

RETURN vFN_KOLOST;

  EXCEPTION
    WHEN NO_DATA_FOUND THEN
     RETURN 0;
END;

FUNCTION GET_OSTATOK_BY_KARTID(
      pKARTID           IN NUMBER /*КАРТОЧКА ПО КОТОРОЙ СМОТРИТСЯ ОСТАТОК*/
      ) RETURN NUMBER  /*остаток кол-ва для данной карточки*/
/*Ф-ия возвращает: 1 - ОСТАТОК КАРТОЧКИ KARTID
                  -1 - ВОЗНИКЛА ОШИБКА ИЛИ КАРТОЧКИ НЕТ*/
IS
 vFN_FPACKINUPACK NUMBER :=1;
 vFN_KOLOST NUMBER :=1;
BEGIN
/*получим значение остатка по данной карточке*/
SELECT
    NVL(FN_FPACKINUPACK,0),
    NVL(FN_KOLOST,-1)
  INTO
    vFN_FPACKINUPACK,
    vFN_KOLOST
  FROM VMEDKART_KOLOST
  WHERE KARTID = pKARTID;

/*IF vFN_FPACKINUPACK<>0 THEN vFN_KOLOST:=vFN_KOLOST*vFN_FPACKINUPACK;  умнодать не надо, если мы измеряем в упаковочных единицах
END IF;*/

RETURN vFN_KOLOST;

  EXCEPTION
    WHEN NO_DATA_FOUND THEN
     RETURN -1;
END;

begin
NULL;
end PKGTKARTCO_ITEM;
/


-- End of DDL Script for Package Body MED.PKGTKARTCO_ITEM

