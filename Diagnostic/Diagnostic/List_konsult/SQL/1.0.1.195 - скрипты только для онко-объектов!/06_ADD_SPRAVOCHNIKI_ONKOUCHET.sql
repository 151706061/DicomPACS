declare
  nMainID number;
  nSubMainID number;
  nCount number;
  
  cursor c(pfc_synonim in varchar2) is
    select fk_id from asu.tsmid where fc_synonim = pfc_synonim;
  
  cursor cSub(pfc_synonim in varchar2, pfk_owner in number) is 
    select fk_id from asu.tsmid where fc_synonim = pfc_synonim and fk_owner = pfk_owner; 

begin
  
  -- ���������� ��� ���������
  open  c('ONKOUCHET');
  fetch c into nMainID;
  if (c%notfound) then
    nMainID := -1;
  end if;
  close c;
  
  if (nMainID = -1) then
    insert into asu.tsmid(fc_name, fc_synonim, fk_owner, fn_order, fl_showprint)
             values('���������� ��� ���������', 'ONKOUCHET', 0, 3100, 0)
             returning fk_id into nMainID;
  end if;



  if (nMainID <> -1) then
    
    ----------------------------------------------------------------------------------------------------------------------------
    
    -- ������� ������ � �����
    open  cSub('ONKOUCHET_REASON_UCHETOUT', nMainID);
    fetch cSub into nSubMainID;
    if (cSub%notfound) then
      nSubMainID := -1;
    end if;
    close cSub;
    
    if (nSubMainID = -1) then   
      insert into asu.tsmid(fc_name, fc_synonim, fk_owner, fc_type, fn_order, fl_showprint)
             values('������� ������ � �����', 'ONKOUCHET_REASON_UCHETOUT', nMainID, 'COMBOBOX', 10, 0)
             returning fk_id into nSubMainID;
    end if;
    
    
    if (nSubMainID <> -1) then
          
    
        -- ������� ������ � ����� - ������� 1
        select count(fk_id) into nCount from asu.tsmid where fc_synonim = 'ONKOUCHET_REASON_UCHETOUT_R1' and fk_owner = nSubMainID;
        
        if (nCount = 0) then
          insert into asu.tsmid(fc_name, fc_synonim, fk_owner, fn_order, fl_showprint)
                 values('������� 1', 'ONKOUCHET_REASON_UCHETOUT_R1', nSubMainID, 10, 0);            
        end if;


        -- ������� ������ � ����� - ������� 2
        select count(fk_id) into nCount from asu.tsmid where fc_synonim = 'ONKOUCHET_REASON_UCHETOUT_R2' and fk_owner = nSubMainID;
        
        if (nCount = 0) then
          insert into asu.tsmid(fc_name, fc_synonim, fk_owner, fn_order, fl_showprint)
                 values('������� 2', 'ONKOUCHET_REASON_UCHETOUT_R2', nSubMainID, 20, 0);
        end if;
      

        -- ������� ������ � ����� - ������� 3
        select count(fk_id) into nCount from asu.tsmid where fc_synonim = 'ONKOUCHET_REASON_UCHETOUT_R3' and fk_owner = nSubMainID;
        
        if (nCount = 0) then
          insert into asu.tsmid(fc_name, fc_synonim, fk_owner, fn_order, fl_showprint)
                 values('������� 3', 'ONKOUCHET_REASON_UCHETOUT_R3', nSubMainID, 30, 0);
        end if;

    end if; -- nSubMainID <> -1
    
    
    ----------------------------------------------------------------------------------------------------------------------------
    
    -- ����������� �����������
    open  cSub('ONKOUCHET_LOCAL', nMainID);
    fetch cSub into nSubMainID;
    if (cSub%notfound) then
      nSubMainID := -1;
    end if;
    close cSub;
    
    if (nSubMainID = -1) then   
      insert into asu.tsmid(fc_name, fc_synonim, fk_owner, fc_type, fn_order, fl_showprint)
             values('����������� �����������', 'ONKOUCHET_LOCAL', nMainID, 'COMBOBOX', 20, 0)
             returning fk_id into nSubMainID;
    end if;
    
    
    if (nSubMainID <> -1) then
          
        -- ����������� ����������� - ����������� 1
        select count(fk_id) into nCount from asu.tsmid where fc_synonim = 'ONKOUCHET_LOCAL_L1' and fk_owner = nSubMainID;
        
        if (nCount = 0) then
          insert into asu.tsmid(fc_name, fc_synonim, fk_owner, fn_order, fl_showprint)
                 values('����������� 1', 'ONKOUCHET_LOCAL_L1', nSubMainID, 10, 0);
        end if;

        
        -- ����������� ����������� - ����������� 2
        select count(fk_id) into nCount from asu.tsmid where fc_synonim = 'ONKOUCHET_LOCAL_L2' and fk_owner = nSubMainID;
        
        if (nCount = 0) then
          insert into asu.tsmid(fc_name, fc_synonim, fk_owner, fn_order, fl_showprint)
                 values('����������� 2', 'ONKOUCHET_LOCAL_L2', nSubMainID, 20, 0);
        end if;


        -- ����������� ����������� - ����������� 3
        select count(fk_id) into nCount from asu.tsmid where fc_synonim = 'ONKOUCHET_LOCAL_L3' and fk_owner = nSubMainID;
        
        if (nCount = 0) then
          insert into asu.tsmid(fc_name, fc_synonim, fk_owner, fn_order, fl_showprint)
                 values('����������� 3', 'ONKOUCHET_LOCAL_L3', nSubMainID, 30, 0);
        end if;
        
    end if; -- nSubMainID <> -1

    ----------------------------------------------------------------------------------------------------------------------------

  end if; --nMainID <> -1  


  commit; 

end;
 
