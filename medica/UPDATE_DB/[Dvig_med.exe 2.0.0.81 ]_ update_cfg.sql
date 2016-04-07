declare
  v_DB_NAME varchar2 (50);
  
begin
  
  SELECT ASU.PKG_SMINI.READSTRING('CONFIG', 'DB_NAME', 'H') 
    into v_DB_NAME 
  FROM DUAL;
  
--  dbms_output.put_line ( v_DB_NAME  );
  
  if lower ( v_DB_NAME ) = lower ( 'SO' ) then -- ������ �� ������ ���
     ASU.pkg_smini.WRITESTRING( 'MANAGER_DOC', 'ZAM_GL_VRA4', '���������� �. �.'  );
       
     ASU.pkg_smini.WRITESTRING( 'MANAGER_DOC', 'CHIEF_SIGN_TEXT', '������� ����������� �������� �����' );       
     
  else
     ASU.pkg_smini.WRITESTRING( 'MANAGER_DOC', 'CHIEF_SIGN_TEXT', '������� ������������ ����������' );    
     
  end if;    
  commit;
  
end;  



