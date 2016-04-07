-- Start of DDL Script for Function MED.GET_TREBSTATUS
-- Generated 22-���-2011 10:53:52 from MED@H100609

CREATE OR REPLACE 
FUNCTION     med.get_trebstatus (pTrebid IN NUMBER) RETURN NUMBER IS
/*  
-1 - �� ���������
 0 - ������������� (��� ����� � TDocs)
 1 - �������������� (���� ���� �� ���� Dpc �� ���������� ����)
 2 - ���������� (�������� ��������)
*/
  /*��������� ������ �� ���*/
  CURSOR cTreb(aFK_ID IN NUMBER) IS
    SELECT d.dpid FROM med.TTREB T, med.tdocs d WHERE t.fk_dpid = d.dpid(+) and FK_ID = AFK_ID;

  /*������� ����-���� � ���������*/
  CURSOR cDpc(aDpid IN NUMBER) IS 
    SELECT COUNT(0) FROM TDPC WHERE DPID = ADPID;
    
  CURSOR cSigned(pDpid IN NUMBER) IS 
    SELECT fl_edit FROM TDocs WHERE dpid = pDpid;
    
  vFK_DPID     NUMBER;
  vDPCCNT      NUMBER;
  vSigned      NUMBER;
BEGIN
  OPEN cTreb(pTrebid);
  FETCH cTreb INTO vFK_DPID; /*�������� ������ �� ��������� ��������*/
  CLOSE cTreb;
 
  IF VFK_DPID IS NULL THEN 
    RETURN(0); /*�������������*/
  ELSE
    OPEN cSigned(VFK_DPID);
    FETCH cSigned INTO vSigned;
    CLOSE cSigned;
    IF vSigned = 0 THEN RETURN(2); END IF; /*����������*/
    IF nvl(vSigned,1) = 1 THEN RETURN(1); END IF; /*��������������*/    

--    OPEN cDpc(vFK_DPID);
--    FETCH cDpc INTO vDPCCNT;
--    CLOSE CDPC;
--    IF vDPCCNT > 0 THEN return(1); END IF;/*��������������*/
  END IF;
  RETURN(-1); /*�� ���������*/
END GET_TREBSTATUS;
/



-- End of DDL Script for Function MED.GET_TREBSTATUS

