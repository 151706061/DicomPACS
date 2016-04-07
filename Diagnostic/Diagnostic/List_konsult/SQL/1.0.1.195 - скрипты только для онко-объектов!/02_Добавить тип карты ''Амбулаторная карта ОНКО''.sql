declare
  nMainID number;
  nSubMainID number;
  nCount number;
  
  cursor c is
    select fk_id from asu.tuslvid where fk_id = ASU.GET_AMBKART_GROUP;
  
  cursor cSub(pfc_name in varchar2, pfk_owner in number) is 
    select fk_id from asu.tuslvid where fc_name = pfc_name and fk_ownerid = pfk_owner; 

begin
  
  -- Амбулаторные карты
  open  c;
  fetch c into nMainID;
  if (c%notfound) then
    nMainID := -1;
  end if;
  close c;
  
  if (nMainID <> -1) then
    
    ----------------------------------------------------------------------------------------------------------------------------
    
    -- Амбулаторные карты - Амбулаторная карта ОНКО
    open  cSub('Амбулаторная карта ОНКО', nMainID);
    fetch cSub into nSubMainID;
    if (cSub%notfound) then
      nSubMainID := -1;
    end if;
    close cSub;
    
    if (nSubMainID = -1) then   
      insert into asu.tuslvid(fc_name, fl_ib, fl_default, fk_ownerid)
             values('Амбулаторная карта ОНКО', 89, 0, nMainID);
    end if;
    
    ----------------------------------------------------------------------------------------------------------------------------

  end if; --nMainID <> -1  


  commit; 

end;
 
