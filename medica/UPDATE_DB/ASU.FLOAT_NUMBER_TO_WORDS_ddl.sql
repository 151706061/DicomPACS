-- Start of DDL Script for Function ASU.FLOAT_NUMBER_TO_WORDS
-- Generated 01.04.2009 11:22:09 from ASU@ASU

CREATE OR REPLACE 
FUNCTION asu.float_number_to_words (aSource IN NUMBER,                         -- ����� �����
                               aRod IN NUMBER default 1,                  -- ��� - 1-�������, 2-�������, 0-�������
                               aWordFor1 IN VARCHAR2 default null,        -- ������� ��� ����, �������������� �� 1 (�������� '�����')
                               aWordFor234 IN VARCHAR2 default null,      -- ������� ��� ����, �������������� �� 2,3,4 (�������� '�����')
                               aWordFor567890_1x IN VARCHAR2 default null -- ������� ��� ���� ��������� �����, ������� 11, 12, � �.�. (�������� '������')
                            ) RETURN varchar2 IS
  result VARCHAR2(1000);
  i  NUMBER;
  n NUMBER;
  DrobPart VARCHAR2(500);
BEGIN
  -- ����������� ������� ����� � ������ ��������� ������
  if TRUNC(aSource) = aSource then
    result := INT_NUMBER_TO_WORDS(aSource, aRod, aWordFor1, aWordFor234, aWordFor567890_1x);
  else
    result := INT_NUMBER_TO_WORDS(TRUNC(aSource), aRod, aWordFor1, aWordFor234, aWordFor567890_1x)||' ';

    DrobPart := ltrim(to_char((aSource-TRUNC(aSource)), '.99999'));
    DrobPart := replace( DrobPart, '.00000', ''); -- ���� ��� ������� �����
    DrobPart := Rtrim(SubStr(DrobPart,2, 5),'0');
    i := LENGTH(DrobPart);
    if i > 0 then
      n := TO_NUMBER(DrobPart);
      DrobPart := INT_NUMBER_TO_WORDS(n, 2);
      case
        WHEN i = 1 THEN result := result || INT_NUMBER_TO_WORDS(n, 2, '�������', '�������', '�������');
        WHEN i = 2 THEN result := result || INT_NUMBER_TO_WORDS(n, 2, '�����', '�����', '�����' );
        WHEN i = 3 THEN result := result || INT_NUMBER_TO_WORDS(n, 2, '��������', '��������', '��������');
        WHEN i = 4 THEN result := result || INT_NUMBER_TO_WORDS(n, 2, '��������������', '��������������', '��������������');
        WHEN i = 5 THEN result := result || INT_NUMBER_TO_WORDS(n, 2, '�����������', '�����������', '�����������');
      end case;
    end if;
  end if;
  -- ���� �����
  -- ���� ������ �� �����
  if ( (substr(trim(result),1,length(aWordFor1))=aWordFor1) or 
       (substr(trim(result),1,length(aWordFor1))=aWordFor234) or
       (substr(trim(result),1,length(aWordFor1))=aWordFor567890_1x) )
     and (aWordFor234='�����')  
  then
    result:='���� '||result;
  end if;
  return result;
END FLOAT_NUMBER_TO_WORDS;
/



-- End of DDL Script for Function ASU.FLOAT_NUMBER_TO_WORDS

