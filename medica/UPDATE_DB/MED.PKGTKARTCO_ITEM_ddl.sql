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
/*���������� ������ � ������� TKARTCO_ITEM.*/

PROCEDURE EDIT_TKARTCO_ITEM(
      pfk_id        IN   NUMBER,
      pfk_kart_item IN   NUMBER,
      pfn_amount      IN   NUMBER,
      pfn_amount_for1 IN   NUMBER);
/*�������������� ������ � ������� TKARTCO_ITEM.*/

PROCEDURE DEL_TKARTCO_ITEM(pfk_id IN NUMBER);
/*�������� ������ � ������� TKARTCO_ITEM.*/

FUNCTION CHANGE_AMOUNT(
      pfk_id              IN NUMBER,
      pfk_tkartcomposid   IN NUMBER,
      pfn_new_main_amount IN NUMBER,
      pFN_KOLOST          OUT NUMBER, /*������� ���-�� ��� ������ ��������*/
      pFN_AMOUNT_NEED     OUT NUMBER) RETURN NUMBER; /* ���-�� ������� ��� �����*/
/*������� �������� ����������� TKARTCO_ITEM.pfk_id. ����������� �������� ��� ���� FN_amount
 ��� ������ �������� pfn_new_main_amount (���-�� ������������� �����������).
 ���� � �������� �������� ����������� ��� ������ ���-�� FN_amount, �� ������ 0, ����� 1 (������ ���-�� � �������� ����)
 ���� ������ ���-�� ����, �� ������� �������� ���� � ������ ������ TKARTCO_ITEM.pfk_id
 �-�� ����������: 1 - ������ ��������.
                  0 - ������ �� ��������, �.�. ��� ������������ ���-�� FN_amount*/

FUNCTION GET_OSTATOK_BY_KARTID(
      pKARTID           IN NUMBER /*�������� �� ������� ��������� �������*/
      ) RETURN NUMBER; /* ������� ���-�� ��� ������ ��������*/
/*�-�� ����������: 1 - ������� �������� KARTID
                  -1 - �������� ������ ��� �������� ���*/

end PKGTKARTCO_ITEM;
/


CREATE OR REPLACE 
PACKAGE BODY     med.pkgtkartco_item is


FUNCTION ADD_TKARTCO_ITEM(
      pfk_tkartcomposid  IN   NUMBER,
      pfn_amount         IN   NUMBER,
      pfn_amount_for1    IN   NUMBER,
      pfk_kart_item      IN   NUMBER) RETURN NUMBER
/*���������� ������ � ������� TKARTCO_ITEM.
�-�� ����������: 1 - ������ ���������.
                -1 - ������ �� ���������, �.�. ����� ���������� (fk_kart_item) ��� ����, ���� ���������� ����� ������ �������� ��� �������*/
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
/*�������������� ������ � ������� TKARTCO_ITEM.*/
IS
BEGIN
  UPDATE TKARTCO_ITEM
    SET fk_kart_item = pfk_kart_item,
        fn_amount = pfn_amount,
        fn_amount_for1 = pfn_amount_for1
    WHERE  fk_id = pfk_id;
END;

PROCEDURE DEL_TKARTCO_ITEM(pfk_id IN NUMBER)
/*�������� ������ � ������� TKARTCO_ITEM.*/
IS
BEGIN
  DELETE FROM TKARTCO_ITEM
    WHERE  fk_id = pfk_id;
END;

FUNCTION CHANGE_AMOUNT(
      pfk_id              IN NUMBER,
      pfk_tkartcomposid   IN NUMBER,
      pfn_new_main_amount IN NUMBER,
      pFN_KOLOST          OUT NUMBER, /*������� ���-�� ��� ������ ��������*/
      pFN_AMOUNT_NEED     OUT NUMBER) RETURN NUMBER  /*���-�� ������� ��� �����*/
/*������� �������� ���� FN_Amount � ������ ����������� TKARTCO_ITEM.pfk_id. ����������� �������� ��� ���� FN_amount
 ��� ������ �������� pfn_new_main_amount (���-�� ������������� �����������).
 ���� � �������� �������� ����������� ��� ������ ���-�� FN_amount, �� ������ 0, ����� 1 (������ ���-�� � �������� ����)
 ���� ������ ���-�� ����, �� ������� �������� ���� � ������ ������ TKARTCO_ITEM.pfk_id
 �-�� ����������: 1 - ������ ��������.
                  0 - ������ �� ��������, �.�. ��� ������������ ���-�� FN_amount*/
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

/*������� �������� ������� �� ������ ��������*/
SELECT
    NVL(FN_FPACKINUPACK,0),
    FN_KOLOST
  INTO
    vFN_FPACKINUPACK,
    vFN_KOLOST
  FROM VMEDKART_KOLOST
  WHERE KARTID = vFK_KART_ITEM;

/*IF vFN_FPACKINUPACK<>0 THEN vFN_KOLOST:=vFN_KOLOST*vFN_FPACKINUPACK;  �������� �� ����, ���� �� �������� � ����������� ��������
END IF;*/

pFN_KOLOST:=vFN_KOLOST;
pFN_AMOUNT_NEED:=vFN_AMOUNT_FOR1*pfn_new_main_amount;

IF (vFN_AMOUNT_FOR1*pfn_new_main_amount)<=vFN_KOLOST THEN
 BEGIN  /*��� ������, �� ������� ���� ������ ��� ���-�� ������������*/
  UPDATE TKARTCO_ITEM
    SET FN_AMOUNT = FN_AMOUNT_FOR1 * pfn_new_main_amount
    WHERE FK_ID=pfk_id;

  RETURN 1;
 END;
ELSE  /*�� ������� ��� ������� ��� ���-��*/
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
      pKARTID           IN NUMBER /*�������� �� ������� ��������� �������*/
      ) RETURN NUMBER  /*������� ���-�� ��� ������ ��������*/
/*�-�� ����������: 1 - ������� �������� KARTID
                  -1 - �������� ������ ��� �������� ���*/
IS
 vFN_FPACKINUPACK NUMBER :=1;
 vFN_KOLOST NUMBER :=1;
BEGIN
/*������� �������� ������� �� ������ ��������*/
SELECT
    NVL(FN_FPACKINUPACK,0),
    NVL(FN_KOLOST,-1)
  INTO
    vFN_FPACKINUPACK,
    vFN_KOLOST
  FROM VMEDKART_KOLOST
  WHERE KARTID = pKARTID;

/*IF vFN_FPACKINUPACK<>0 THEN vFN_KOLOST:=vFN_KOLOST*vFN_FPACKINUPACK;  �������� �� ����, ���� �� �������� � ����������� ��������
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

