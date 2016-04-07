CREATE OR REPLACE PACKAGE MED.pkgtkartcompos is

  -- Author  : NSV
  -- Created : 25.09.2006 15:47:17
  -- Purpose :


FUNCTION GET_NEXT_NUMBER
--�������� ��������� ���������� ����� ��� �������� ������������� �����������.
--� ����� ������ - ��� ���-�� MAX(TKARTCOMPOS.FN_NUMBER) + 1
   RETURN INTEGER;

FUNCTION CREATE_BLANK_TKARTCOMPOS
/*�������� ������ ������ � ������� TKARTCOMPOS, � ������� ����� �������� ������ ����������� �������� ���������������� ���������.*/
   RETURN NUMBER;

PROCEDURE EDIT_TKARTCOMPOS(
          pfk_id       IN NUMBER,
          pfk_medicid  IN NUMBER,
          pfc_serial   IN VARCHAR2,
          pfd_data     IN DATE,
          pfn_amount   IN NUMBER,
          pfn_number   IN NUMBER,
          pfd_goden_do IN DATE          
          );
/*����������� ������ � id   pfk_id � ������� TKARTCOMPOS*/

PROCEDURE DEL_TKARTCOMPOS(pfk_id IN NUMBER);
/*������� ������ � id  pfk_id � ������� TKARTCOMPOS*/

PROCEDURE GET_BY_FK_ID (
             pFK_ID IN NUMBER,
             pfk_medicid OUT NUMBER,
             pfc_TMEDIC_NAME OUT VARCHAR2,
             pfc_serial OUT VARCHAR2,
             pfd_data OUT DATE,
             pfn_amount OUT NUMBER,
             pFC_UEDIZM OUT VARCHAR2,
             PFC_FEDIZM OUT VARCHAR2,
             pfn_number OUT NUMBER);
/*��������� ���������� �������� ���� ����� ������ �������*/

FUNCTION GET_REST_COUNT_OF_ITEM(
    pTKARTCOMPOS_FK_ID IN NUMBER,
    pTMEDICOMPLEX_FK_MEDIC IN NUMBER,
    pTMEDICOMPLEX_FK_MEDICITEM IN NUMBER,
    pTKARTCO_ITEM_KARTID IN NUMBER, --��������� �������� �����������
    pFN_Main_Amount IN NUMBER, -- ���-�� ������������� �����������, ��������� �� ����� �������� ������������� �����������
    pFN_Item_Amount IN NUMBER -- ���-�� ����������� (pTKARTCO_ITEM_KARTID) ��� ������������� �����������
) RETURN NUMBER;
/*���� �� �������� �������� ��� �� �����������, ������� ������ � ������ ������������ �� (TMEDICOMPLEX) ��� ������� ������������� �����������
 , �� pTMEDICOMPLEX_FK_MEDICITEM<>-1, ����� pTMEDICOMPLEX_FK_MEDICITEM==-1

�-�� ����������: ���-�� ������������, ������� ���� �������(��������
         � ������ ������������� �����������) ��� ��������� �������� ������������� ����������� TKARTCOMPOS_FK_ID ��� ���������� TMEDICOMPLEX_FK_MEDICITEM � odsObazat_Ingridienti
     -987654 - ���� �������� ������*/
PROCEDURE TKARTCOMPOS_PODPISAT(pfk_id IN NUMBER);
/*�������� ������ � id   pfk_id � ������� TKARTCOMPOS*/


  PROCEDURE TKARTCOMPOS_OTPISAT(pfk_id IN NUMBER)
/*������� ������ � id   pfk_id � ������� TKARTCOMPOS*/;
end PKGTKARTCOMPOS;

/
CREATE OR REPLACE PACKAGE BODY MED.pkgtkartcompos is

FUNCTION GET_NEXT_NUMBER
   RETURN INTEGER IS
--�������� ��������� ���������� ����� ��� �������� ������������� �����������.
--� ����� ������ - ��� ���-�� MAX(TKARTCOMPOS.FN_NUMBER) + 1

 vFN_NEXT_NUMBER INTEGER :=1;
 vCurYear integer;
BEGIN
  vCurYear := EXTRACT(YEAR FROM sysdate);
 
 SELECT NVL(MAX(FN_NUMBER),0)
   INTO vFN_NEXT_NUMBER
   FROM TKARTCOMPOS WHERE FK_ID = (SELECT MAX(FK_ID) FROM MED.TKARTCOMPOS WHERE FK_MEDICID > 0 and EXTRACT(YEAR from FD_DATA ) = vCurYear );

 RETURN (vFN_NEXT_NUMBER+1);

 EXCEPTION
   WHEN NO_DATA_FOUND THEN
     RETURN 1;
END;

FUNCTION CREATE_BLANK_TKARTCOMPOS
/*�������� ������ ������ � ������� TKARTCOMPOS, � ������� ����� �������� ������ ����������� �������� ���������������� ���������.*/
  RETURN NUMBER
  IS

  id NUMBER;
  adata DATE;
BEGIN
  adata := trunc (SYSDATE);

  INSERT INTO TKARTCOMPOS
      (fk_id,
       fk_medicid,
       fc_serial,
       fd_data,
       fn_amount,
       fn_number)
    VALUES
      (NULL,
       0,
       0,
       adata,
       0,
       0)
    RETURNING fk_id
    INTO      id;

  RETURN id;
END;


PROCEDURE EDIT_TKARTCOMPOS(
          pfk_id       IN NUMBER,
          pfk_medicid  IN NUMBER,
          pfc_serial   IN VARCHAR2,
          pfd_data     IN DATE,
          pfn_amount   IN NUMBER,
          pfn_number   IN NUMBER,
          pfd_goden_do IN DATE
          )
/*����������� ������ � id   pfk_id � ������� TKARTCOMPOS*/
IS
BEGIN
  UPDATE TKARTCOMPOS
    SET
      fk_medicid = pfk_medicid,
      fc_serial = pfc_serial,
      fd_data = TRUNC(pfd_data),
      fn_amount = pfn_amount,
      fn_number = pfn_number,
      fd_goden_do = pfd_goden_do
    WHERE fk_id = pfk_id;
END;

PROCEDURE DEL_TKARTCOMPOS(pfk_id IN NUMBER)
/*������� ������ � id  pfk_id � ������� TKARTCOMPOS*/
IS
BEGIN
  DELETE FROM TKARTCOMPOS
    WHERE fk_id = pfk_id;

  COMMIT;
END;

PROCEDURE GET_BY_FK_ID (
             pFK_ID IN NUMBER,
             pfk_medicid OUT NUMBER,
             pfc_TMEDIC_NAME OUT VARCHAR2,
             pfc_serial OUT VARCHAR2,
             pfd_data OUT DATE,
             pfn_amount OUT NUMBER,
             pFC_UEDIZM OUT VARCHAR2,
             PFC_FEDIZM OUT VARCHAR2,
             pfn_number OUT NUMBER
)
/*��������� ���������� �������� ���� ����� ������ �������*/
IS
BEGIN
  pfk_medicid := 0;
  pfc_TMEDIC_NAME:='';
  pfc_serial :='';
  pfd_data :=sysdate;
  pfn_amount:=0;
  pFC_UEDIZM :='';
  PFC_FEDIZM :='';
  pfn_number :=0;

  SELECT
     KS.FK_MEDICID,
     M.FC_NAME AS TMEDIC_NAME,
     KS.FC_SERIAL,
     KS.FD_DATA,
     KS.FN_AMOUNT,
     TEI.FC_NAME AS FC_UEDIZM,
     T2.FC_NAME AS FC_FEDIZM,
     NVL(KS.FN_NUMBER,1)
    INTO
     pfk_medicid,
     pfc_TMEDIC_NAME,
     pfc_serial,
     pfd_data,
     pfn_amount,
     pFC_UEDIZM,
     PFC_FEDIZM,
     pfn_number
    FROM TKARTCOMPOS KS,
      TMEDIC M,
      TEI,
      TEI T2
    WHERE KS.fk_id=pfk_id
      AND KS.FK_MEDICID = M.MEDICID
      AND M.EIID = TEI.EIID (+)
      AND M.FK_FPACKID = T2.EIID (+);

	 EXCEPTION
		 WHEN NO_DATA_FOUND THEN
			 NULL;
END;

FUNCTION GET_REST_COUNT_OF_ITEM(
    pTKARTCOMPOS_FK_ID IN NUMBER,
    pTMEDICOMPLEX_FK_MEDIC IN NUMBER,
    pTMEDICOMPLEX_FK_MEDICITEM IN NUMBER,
    pTKARTCO_ITEM_KARTID IN NUMBER, --��������� �������� �����������
    pFN_Main_Amount IN NUMBER, -- ���-�� ������������� �����������, ��������� �� ����� �������� ������������� �����������
    pFN_Item_Amount IN NUMBER -- ���-�� ����������� (pTKARTCO_ITEM_KARTID) ��� ������������� �����������

) RETURN NUMBER
/*���� �� �������� �������� ��� �� �����������, ������� ������ � ������ ������������ �� (TMEDICOMPLEX) ��� ������� ������������� �����������
 , �� pTMEDICOMPLEX_FK_MEDICITEM<>-1, ����� pTMEDICOMPLEX_FK_MEDICITEM==-1

�-�� ����������: ���-�� ������������, ������� ���� �������(��������
         � ������ ������������� �����������) ��� ��������� �������� ������������� ����������� TKARTCOMPOS_FK_ID ��� ���������� TMEDICOMPLEX_FK_MEDICITEM � odsObazat_Ingridienti
     -987654 - ���� �������� ������*/
IS

  pFN_AMOUNT_Theoretical NUMBER :=0; -- ����������� ���-�� ����������� ��� ������� ��
  pFN_AMOUNT_Choosen NUMBER :=0;     -- ��������� ���-�� ��� ���������� �����������, ��� ������� ��, � ������ �������� ������������� �����������
  vFN_Main_Amount NUMBER :=1.0; -- ���-�� ������������� �����������, ��������� �� ����� �������� ������������� �����������
  vFN_Item_Amount NUMBER :=1.0;-- ���-�� ����������� (pTKARTCO_ITEM_KARTID) ��� ������������� �����������
BEGIN
IF pTMEDICOMPLEX_FK_MEDICITEM<>-1 THEN
 BEGIN --��� �������� ������������� ��
  -- ������� ������������� ���-�� ����������� pTMEDICOMPLEX_FK_MEDICITEM, ��� ������� � �� ���������� �������
  IF pFN_Main_Amount>0 THEN
    SELECT
        MC.FN_AMOUNT * pFN_Main_Amount
      INTO
        pFN_AMOUNT_Theoretical
      FROM
        TMEDIC M,
        TMEDICOMPLEX MC
      WHERE  MC.FK_MEDIC = pTMEDICOMPLEX_FK_MEDIC
        AND MC.FK_MEDICITEM = M.MEDICID
        AND MC.FK_MEDICITEM = pTMEDICOMPLEX_FK_MEDICITEM
        AND M.FL_VISIBLE = 1;
  ELSE
    SELECT
        MC.FN_AMOUNT
      INTO
        pFN_AMOUNT_Theoretical
      FROM
        TMEDIC M,
        TMEDICOMPLEX MC
      WHERE  MC.FK_MEDIC = pTMEDICOMPLEX_FK_MEDIC
        AND MC.FK_MEDICITEM = M.MEDICID
        AND MC.FK_MEDICITEM = pTMEDICOMPLEX_FK_MEDICITEM
        AND M.FL_VISIBLE = 1;
  END IF;

  --������� ���-�� ����� ����������� pTMEDICOMPLEX_FK_MEDICITEM, ������� ��� ������� �� �������� ��� ������� ������������� ����������� pTKARTCOMPOS_FK_ID
  SELECT
      NVL(SUM(K_ITEM.FN_AMOUNT),0)
    INTO
      pFN_AMOUNT_Choosen
    FROM
      TMEDIC M,
      TKART K,
      TKARTCO_ITEM K_ITEM
    WHERE K_ITEM.FK_TKARTCOMPOSID = pTKARTCOMPOS_FK_ID
      AND K_ITEM.FK_KART_ITEM = K.KARTID
      AND K.MEDICID = M.MEDICID
      AND M.MEDICID = pTMEDICOMPLEX_FK_MEDICITEM;

  RETURN (pFN_AMOUNT_Theoretical-pFN_AMOUNT_Choosen);
 END;
ELSE
 BEGIN --��� �������� �� ������������� ��
  IF pFN_Item_Amount>0.0 THEN vFN_Item_Amount:=pFN_Item_Amount;
  END IF;
  IF pFN_Main_Amount>0.0 THEN vFN_Main_Amount:=pFN_Main_Amount;
  END IF;

  pFN_AMOUNT_Theoretical:=vFN_Main_Amount * vFN_Item_Amount;

  /*--������� ���-�� ����� ����������� pTMEDICOMPLEX_FK_MEDICITEM, ������� ��� ������� �� �������� ��� ������� ������������� ����������� pTKARTCOMPOS_FK_ID
  SELECT
      NVL(SUM(K_ITEM.FN_AMOUNT),0)
    INTO
      pFN_AMOUNT_Choosen
    FROM
      TMEDIC M,
      TKART K,
      TKARTCO_ITEM K_ITEM
    WHERE K_ITEM.FK_TKARTCOMPOSID = pTKARTCOMPOS_FK_ID
      AND K_ITEM.FK_KART_ITEM = K.KARTID
      AND K.MEDICID = M.MEDICID
      AND M.MEDICID = (SELECT -- ��������� id �� ������ �������� pTKARTCO_ITEM_KARTID
                           M.MEDICID
                         FROM
                           TMEDIC M,
                           TKART K,
                           TKARTCO_ITEM K_ITEM
                         WHERE K_ITEM.FK_TKARTCOMPOSID = pTKARTCOMPOS_FK_ID
                           AND K_ITEM.FK_KART_ITEM = K.KARTID
                           AND K.MEDICID = M.MEDICID
                           AND K.KARTID = pTKARTCO_ITEM_KARTID
                      );
  RETURN (pFN_AMOUNT_Theoretical-pFN_AMOUNT_Choosen);
                      */

  RETURN (pFN_AMOUNT_Theoretical);
 END;
END IF;


	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			RETURN -987654;
END;

PROCEDURE TKARTCOMPOS_PODPISAT(pfk_id IN NUMBER)
/*�������� ������ � id   pfk_id � ������� TKARTCOMPOS*/
IS
BEGIN
  UPDATE TKARTCOMPOS
    SET  fl_edit = 0
    WHERE fk_id = pfk_id;
END;

PROCEDURE TKARTCOMPOS_OTPISAT(pfk_id IN NUMBER)
/*������� ������ � id   pfk_id � ������� TKARTCOMPOS*/
IS
BEGIN
  UPDATE TKARTCOMPOS
    SET  fl_edit = 1
    WHERE fk_id = pfk_id;
END;

begin
NULL;
end PKGTKARTCOMPOS;
/
