DROP TRIGGER ASU.TEFFEKT_BEFORE_UPDATE_INSERT
/

--
-- TEFFEKT_BEFORE_UPDATE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TEFFECT (Table)
--
CREATE OR REPLACE TRIGGER ASU."TEFFEKT_BEFORE_UPDATE_INSERT" 
BEFORE  INSERT  OR UPDATE  ON ASU.TEFFECT REFERENCING
 NEW AS NEW
 OLD AS OLD
FOR EACH ROW
declare
  nSum integer;
  nCount integer;
Begin
    nCount:=0;
    nSum:=0;
    if :new.FN_AD_SIST is null then :new.FN_AD_SIST:=-1; end if;
    if :new.FN_AD_DIST is null then :new.fn_ad_dist:=-1; end if;
    if :new.FN_BIOHIM  is null then :new.fn_biohim:=-1;  end if;
    if :new.FN_VEM     is null then :new.fn_vem:=-1;     end if;
    if :new.FN_EKG     is null then :new.fn_ekg:=-1;     end if;
    if :new.FN_KARD    is null then :new.fn_kard:=-1;    end if;
    if :new.FN_RESERV  is null then :new.fn_reserv:=-1;  end if;
    if :new.FN_ANTROP  is null then :new.fn_antrop:=-1;  end if;
    if :new.FN_KUR     is null then :new.fn_kur:=-1;     end if;

    if :new.FN_AD_SIST>0    then
      nSum:=nSum+:new.FN_AD_SIST;
      nCount:=nCount+1;
    elsif :old.FN_AD_SIST>0 then
      nSum:=nSum+:old.FN_AD_SIST;
      nCount:=nCount+1;
    end if;
    if :new.FN_AD_DIST>0 then
      nSum:=nSum+:new.fn_ad_dist;
      nCount:=nCount+1;
    elsif :old.FN_ad_dist>0 then
      nSum:=nSum+:old.FN_ad_dist;
      nCount:=nCount+1;
    end if;
    if :new.FN_BIOHIM>0  then
      nSum:=nSum+:new.fn_biohim;
      nCount:=nCount+1;
    elsif :old.FN_biohim>0 then
      nSum:=nSum+:old.FN_biohim;
      nCount:=nCount+1;
    end if;
    if :new.FN_VEM>0     then
      nSum:=nSum+:new.fn_vem;
      nCount:=nCount+1;
    elsif :old.FN_vem>0 then
      nSum:=nSum+:old.FN_vem;
      nCount:=nCount+1;
    end if;
    if :new.FN_EKG>0     then
      nSum:=nSum+:new.fn_ekg;
      nCount:=nCount+1;
    elsif :old.FN_ekg>0 then
      nSum:=nSum+:old.FN_ekg;
      nCount:=nCount+1;
    end if;
    if :new.FN_KARD>0    then
      nSum:=nSum+:new.fn_kard;
      nCount:=nCount+1;
    elsif :old.FN_kard>0 then
      nSum:=nSum+:old.FN_kard;
      nCount:=nCount+1;
    end if;
    if :new.FN_RESERV>0  then
      nSum:=nSum+:new.fn_reserv;
      nCount:=nCount+1;
    elsif :old.FN_reserv>0 then
      nSum:=nSum+:old.FN_reserv;
      nCount:=nCount+1;
    end if;
    if :new.FN_ANTROP>0  then
      nSum:=nSum+:new.fn_antrop;
      nCount:=nCount+1;
    elsif :old.FN_antrop>0 then
      nSum:=nSum+:old.FN_antrop;
      nCount:=nCount+1;
    end if;
    if :new.FN_KUR>0     then
      nSum:=nSum+:new.fn_kur;
      nCount:=nCount+1;
    elsif :old.FN_kur>0 then
      nSum:=nSum+:old.FN_kur;
      nCount:=nCount+1;
    end if;

    -- result
    if nCount>0 then
      :new.fn_avgres:=nSum/nCount;
    else
      :new.fn_avgres:=0;
    end if;
End;
/
SHOW ERRORS;


