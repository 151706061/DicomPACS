alter table med.tdocs add fn_spisanievid NUMBER(10) default 0;
COMMENT ON COLUMN Med.Tdocs.FN_spisanievid is '��� ��������: 1 - ������� (����� ���� ��������, ���������), 2 - �������� �� ��������� (ASU.TOTDEL), 3 - �������� �� �������� (). �� ����� ���� ����������� �� ����� ������� ��������� ���� motoid';
