declare
  nMainID number;
  nSubMainID number;
  nCount number;
  
  cursor c(pfc_synonim in varchar2) is
    select fk_id from asu.tsmid where fc_synonim = pfc_synonim;
  
  cursor cSub(pfc_synonim in varchar2, pfk_owner in number) is 
    select fk_id from asu.tsmid where fc_synonim = pfc_synonim and fk_owner = pfk_owner; 

begin
  
  -- Диагностика - Настройка - Права пользователей
  open  c('DIAGNOSTIC_RIGHTS');
  fetch c into nMainID;
  if (c%notfound) then
    nMainID := -1;
  end if;
  close c;
  
  if (nMainID <> -1) then
    
    ----------------------------------------------------------------------------------------------------------------------------
    
    -- Диагностика - Настройка - Права пользователей - Право "На онкоучет"
    open  cSub('DIAGNOSTIC_RIGHTS_ONKO', nMainID);
    fetch cSub into nSubMainID;
    if (cSub%notfound) then
      nSubMainID := -1;
    end if;
    close cSub;
    
    if (nSubMainID = -1) then   
      insert into asu.tsmid(fc_name, fc_synonim, fk_owner, fn_order)
             values('Право "На онкоучет"', 'DIAGNOSTIC_RIGHTS_ONKO', nMainID, 10);
    end if;
    
    ----------------------------------------------------------------------------------------------------------------------------

  end if; --nMainID <> -1  


  commit; 

end;
 
