declare 
  v_DBName  varchar2(100);
begin
  v_DBName := asu.pkg_smini.READSTRING ( 'config', 'db_name', '' );
  
--  dbms_output.put_line ( v_DBName );
  
  if upper ( v_DBName ) = 'E' then
    asu.PKG_SMINI.WRITESTRING( 'MEDICA.EXE','FUNC_USE_MEDUCHGRP_CH', '1' );
    -- по умолчанию заносим текущие значения
    update med.tkart k
       set k.uchgrid = ( select m.uchgrid 
                           from med.tmedic m 
                          where m.medicid = k.medicid  );
    commit;                          
  else    
    asu.PKG_SMINI.WRITESTRING( 'MEDICA.EXE','FUNC_USE_MEDUCHGRP_CH', '0' );  
  end if;  

  
end;  
