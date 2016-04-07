declare
  nMainID number;
  nSubMainID number;
  nCount number;
  
  cursor c(pfc_synonim in varchar2) is
    select fk_id from asu.tsmid where fc_synonim = pfc_synonim;
  
  cursor cSub(pfc_synonim in varchar2, pfk_owner in number) is 
    select fk_id from asu.tsmid where fc_synonim = pfc_synonim and fk_owner = pfk_owner; 

begin
  
  -- Справочник для Онкоучета
  open  c('ONKOUCHET');
  fetch c into nMainID;
  if (c%notfound) then
    nMainID := -1;
  end if;
  close c;
  
  if (nMainID = -1) then
    insert into asu.tsmid(fc_name, fc_synonim, fk_owner, fn_order, fl_showprint)
             values('Справочник для Онкоучета', 'ONKOUCHET', 0, 3100, 0)
             returning fk_id into nMainID;
  end if;



  if (nMainID <> -1) then
    
    ----------------------------------------------------------------------------------------------------------------------------
    
    -- Причина снятия с учета
    open  cSub('ONKOUCHET_REASON_UCHETOUT', nMainID);
    fetch cSub into nSubMainID;
    if (cSub%notfound) then
      nSubMainID := -1;
    end if;
    close cSub;
    
    if (nSubMainID = -1) then   
      insert into asu.tsmid(fc_name, fc_synonim, fk_owner, fc_type, fn_order, fl_showprint)
             values('Причина снятия с учета', 'ONKOUCHET_REASON_UCHETOUT', nMainID, 'COMBOBOX', 10, 0)
             returning fk_id into nSubMainID;
    end if;
    
    
    if (nSubMainID <> -1) then
          
    
        -- Причина снятия с учета - Причина 1
        select count(fk_id) into nCount from asu.tsmid where fc_synonim = 'ONKOUCHET_REASON_UCHETOUT_R1' and fk_owner = nSubMainID;
        
        if (nCount = 0) then
          insert into asu.tsmid(fc_name, fc_synonim, fk_owner, fn_order, fl_showprint)
                 values('Причина 1', 'ONKOUCHET_REASON_UCHETOUT_R1', nSubMainID, 10, 0);            
        end if;


        -- Причина снятия с учета - Причина 2
        select count(fk_id) into nCount from asu.tsmid where fc_synonim = 'ONKOUCHET_REASON_UCHETOUT_R2' and fk_owner = nSubMainID;
        
        if (nCount = 0) then
          insert into asu.tsmid(fc_name, fc_synonim, fk_owner, fn_order, fl_showprint)
                 values('Причина 2', 'ONKOUCHET_REASON_UCHETOUT_R2', nSubMainID, 20, 0);
        end if;
      

        -- Причина снятия с учета - Причина 3
        select count(fk_id) into nCount from asu.tsmid where fc_synonim = 'ONKOUCHET_REASON_UCHETOUT_R3' and fk_owner = nSubMainID;
        
        if (nCount = 0) then
          insert into asu.tsmid(fc_name, fc_synonim, fk_owner, fn_order, fl_showprint)
                 values('Причина 3', 'ONKOUCHET_REASON_UCHETOUT_R3', nSubMainID, 30, 0);
        end if;

    end if; -- nSubMainID <> -1
    
    
    ----------------------------------------------------------------------------------------------------------------------------
    
    -- Локализация заболевания
    open  cSub('ONKOUCHET_LOCAL', nMainID);
    fetch cSub into nSubMainID;
    if (cSub%notfound) then
      nSubMainID := -1;
    end if;
    close cSub;
    
    if (nSubMainID = -1) then   
      insert into asu.tsmid(fc_name, fc_synonim, fk_owner, fc_type, fn_order, fl_showprint)
             values('Локализация заболевания', 'ONKOUCHET_LOCAL', nMainID, 'COMBOBOX', 20, 0)
             returning fk_id into nSubMainID;
    end if;
    
    
    if (nSubMainID <> -1) then
          
        -- Локализация заболевания - Локализация 1
        select count(fk_id) into nCount from asu.tsmid where fc_synonim = 'ONKOUCHET_LOCAL_L1' and fk_owner = nSubMainID;
        
        if (nCount = 0) then
          insert into asu.tsmid(fc_name, fc_synonim, fk_owner, fn_order, fl_showprint)
                 values('Локализация 1', 'ONKOUCHET_LOCAL_L1', nSubMainID, 10, 0);
        end if;

        
        -- Локализация заболевания - Локализация 2
        select count(fk_id) into nCount from asu.tsmid where fc_synonim = 'ONKOUCHET_LOCAL_L2' and fk_owner = nSubMainID;
        
        if (nCount = 0) then
          insert into asu.tsmid(fc_name, fc_synonim, fk_owner, fn_order, fl_showprint)
                 values('Локализация 2', 'ONKOUCHET_LOCAL_L2', nSubMainID, 20, 0);
        end if;


        -- Локализация заболевания - Локализация 3
        select count(fk_id) into nCount from asu.tsmid where fc_synonim = 'ONKOUCHET_LOCAL_L3' and fk_owner = nSubMainID;
        
        if (nCount = 0) then
          insert into asu.tsmid(fc_name, fc_synonim, fk_owner, fn_order, fl_showprint)
                 values('Локализация 3', 'ONKOUCHET_LOCAL_L3', nSubMainID, 30, 0);
        end if;
        
    end if; -- nSubMainID <> -1

    ----------------------------------------------------------------------------------------------------------------------------

  end if; --nMainID <> -1  


  commit; 

end;
 
