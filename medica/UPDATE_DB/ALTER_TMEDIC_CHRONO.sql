-- 1.  подготавливаем бэкап-таблицу  бэкапим текущие данные
declare
  v_tmp_is_exists pls_integer;

begin
  begin
    select count( 1 )
      into v_tmp_is_exists
      from all_tables   
     where upper ( table_name ) = 'TMEDIC_CHRONO_TMP'
       and upper ( owner ) = 'ASU_TMP'
       and upper (tablespace_name ) = 'USR' ;
  exception
    when NO_DATA_FOUND then
      v_tmp_is_exists := 0;  
  end; 


  if ( v_tmp_is_exists > 0 ) then
     execute immediate 'drop table ASU_TMP.TMEDIC_CHRONO_TMP';
  --  dbms_output.put_line ( '1' );  
  end if;       
  --dbms_output.put_line ( '2' );  
  -- Создаем временную таблицу для бэкапа тек.данных              
  execute immediate 
  'create table ASU_TMP.TMEDIC_CHRONO_TMP
  (
    MEDICID  NUMBER(9) not null,
    DATE_BEG DATE not null,
    DATE_END DATE not null,
    UCHGRID  NUMBER(9)
  )
  tablespace USR
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    )';    
end;
/  
begin  
  insert into ASU_TMP.TMEDIC_CHRONO_TMP ( MEDICID, DATE_BEG, DATE_END, UCHGRID )
  select MEDICID, DATE_BEG, DATE_END, UCHGRID
    from MED.TMEDIC_CHRONO;
  
  commit;    
end;    
/

-- 2. Новый primary key (MEDICID, DATE_END)
 -- удаляем старые ключи
alter table MED.TMEDIC_CHRONO
    drop constraint TMEDIC_CHRONO_PK cascade
/                    
alter table MED.TMEDIC_CHRONO
  drop constraint TMEDIC_CHRONO_FK
/

-- чистим таблицу
begin
  delete 
    from med.tmedic_chrono t 
   where exists (
     select 1
       from (
       select t1.medicid, t1.date_beg, t1.date_end
        from med.tmedic_chrono t1
       inner join med.tmedic_chrono t2
         on t1.medicid = t2.medicid
         and t1.date_end = t2.date_end
      where t1.date_beg = t2.date_end  
      and t2.date_beg = t1.date_end ) x
    where x.medicid = t.medicid
      and x.date_beg = t.date_beg
      and x.date_end = t.date_end
   );
   
   commit;
      
end;
/
-- создаем первичный ключ
alter table MED.TMEDIC_CHRONO
        add constraint TMEDIC_CHRONO_PK primary key (MEDICID, DATE_END)
        using index 
        tablespace USR
        pctfree 10
        initrans 2
        maxtrans 255
        storage
        (
          initial 64K
          next 1M
          minextents 1
          maxextents unlimited
        )
/        

-- 3. Доп. ключи и поля 
alter table MED.TMEDIC_CHRONO
  add constraint TMEDIC_CHRONO_FK foreign key (MEDICID)
  references MED.TMEDIC (MEDICID )
/  
alter table MED.TMEDIC_CHRONO modify DATE_BEG null
/
alter table MED.TMEDIC_CHRONO add MOID number(9)
/
comment on column MED.TMEDIC_CHRONO.MOID is 'код МО, внесшего изменения'
/  
alter table MED.TMEDIC_CHRONO
    add constraint TMEDIC_CHRONO_TMO_FK foreign key (MOID)
    references med.tmo (MOID)
/                      
                      
      
    
        
  
  
  

