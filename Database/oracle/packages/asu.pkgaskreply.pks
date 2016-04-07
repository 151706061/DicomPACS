DROP PACKAGE ASU.PKGASKREPLY
/

--
-- PKGASKREPLY  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU.PkgAskReply IS
  -- Efimov V.A. 20110812 ����� ��� ������ � �������������� ��������������

  -- �������� �������� � ��� ����������� �������, pOWNER � pOWNERFIELD - �������, ��� ����������� ������� ������ ����� ������, � ���� � ���, ��� �� ������������ ����
  FUNCTION AddToAskReplyElseLog(pREPLY      IN VARCHAR2,
                                pREPLYFIELD IN VARCHAR2,
                                pASK        IN VARCHAR2,
                                pASKFIELD   IN VARCHAR2,
                                pASKID      IN VARCHAR2,
                                pOWNER      IN VARCHAR2 default null,
                                pOWNERFIELD IN VARCHAR2 default null,
                                pOWNERID    IN VARCHAR2 default null,
                                pOWNERFILL  IN VARCHAR2 default null) RETURN VARCHAR2;

  -- �������� �������� �������-������ �� �������-������� (������ ����)
  FUNCTION GetReply(pREPLY      IN VARCHAR2,
                    pREPLYFIELD IN VARCHAR2,
                    pASK        IN VARCHAR2,
                    pASKFIELD   IN VARCHAR2,
                    pASKID      IN VARCHAR2) RETURN VARCHAR2;

  -- �������� �������� �������-������ �� �������-������� (������ ����)
  FUNCTION GetReply_ElseLog(pREPLY      IN VARCHAR2,
                            pREPLYFIELD IN VARCHAR2,
                            pASK        IN VARCHAR2,
                            pASKFIELD   IN VARCHAR2,
                            pASKID      IN VARCHAR2,
                            pOWNER      IN VARCHAR2 default null,
                            pOWNERFIELD IN VARCHAR2 default null,
                            pOWNERID    IN VARCHAR2 default null,
                            pOWNERFILL  IN VARCHAR2 default null) RETURN VARCHAR2;

  -- �������� ��������� �������������� �������� �������-������� �� �������-������ (����� ���� ������ ������)
  FUNCTION GetLastAsk(pASK        IN VARCHAR2,
                      pASKFIELD   IN VARCHAR2,
                      pREPLY      IN VARCHAR2,
                      pREPLYFIELD IN VARCHAR2,
                      pREPLYID    IN VARCHAR2) RETURN VARCHAR2;
END PkgAskReply;
/

SHOW ERRORS;


