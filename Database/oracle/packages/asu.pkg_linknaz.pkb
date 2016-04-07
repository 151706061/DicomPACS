DROP PACKAGE BODY ASU.PKG_LINKNAZ
/

--
-- PKG_LINKNAZ  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_LINKNAZ" 
IS
   function InsertRoot(pSmidID Number) return Number
   is --добавить корень связнанного назначения
   begin
     return InsertLinkNaz(null,pSmidID);
   end;

   function InsertLinkNaz(pLinkNazOwner Number,pSmidID Number) return Number
   is --добавить связанное назначение
     v_id Number;
   begin
     insert into asu.tlinknaz (fk_smid,fk_owner) values (pSmidID,pLinkNazOwner) returning fk_id into v_id;
     for p in (SELECT FK_ID FK_SMID FROM TSMID WHERE FL_SHOWANAL <> 5 AND FC_TYPE <> 'COLUMNS' AND FL_DEL = 0 START WITH FK_OWNER = pSmidID CONNECT BY PRIOR FK_ID = FK_OWNER) loop
        INSERT INTO TEXPAN (FK_NAZID, FK_SMID) VALUES (v_id, p.FK_SMID);
     end loop;-- << by TimurLan 05/10/06

     return v_id;
   end;

   procedure DeleteLinkNaz(pLinkNazID Number)
   is --удалить связанное назначение
      v_linknaz_owner Number;
   begin
     select max(fk_owner) into v_linknaz_owner from asu.tlinknaz where fk_id = pLinkNazID;
     update asu.tlinknaz ln set ln.fk_owner = v_linknaz_owner where ln.fk_owner = pLinkNazID;
     delete from asu.tlinknaz where fk_id = pLinkNazID;
   end;

   function GetLinkNazOwner(pLinkNazID Number) return Number
   is --родитель связанного назначения
     v_res Number;
   begin
     select max(fk_owner) into v_res from asu.tlinknaz where fk_id = pLinkNazID;
     return v_res;
   end;

   function GetNazSmidOwner(pLinkNazID Number) return Number
   is --смид родителя связанного назначения
   begin
     return GetLinkNazSmid(GetLinkNazOwner(pLinkNazID));
   end;

   function GetLinkNazChild(pLinkNazID Number) return Number
   is --подчиненный связанного назначения
     v_res Number;
   begin
     select max(fk_id) into v_res from asu.tlinknaz where fk_owner = pLinkNazID;
     return v_res;
   end;

   function GetNazSmidChild(pLinkNazID Number) return Number
   is --смид подчиненного связанного назначения
   begin
     return GetLinkNazSmid(GetLinkNazChild(pLinkNazID));
   end;

   function GetLinkNazSmid(pLinkNazID Number) return Number
   is --смид связанного назначения
     v_smid Number;
   begin
     select max(fk_smid) into v_smid from asu.tlinknaz ln
        where ln.fk_id = pLinkNazID;
     return v_smid;
   end;

   procedure MoveLinkNaz(pLinkNazID Number,pIsUp Number)
   is --переместить связаное назначение по иерархии
      --pIsUp = 1 - переместить вверх
      --pIsUp = 0 - переместить вниз
     v_linknaz_owner_owner Number;
     v_linknaz_child_child Number;
     v_linknaz_owner Number;
     v_linknaz_child Number;
   begin
     v_linknaz_owner  := GetLinkNazOwner(pLinkNazID);
     v_linknaz_child := GetLinkNazChild(pLinkNazID);

     if pIsUp = 1 then
        v_linknaz_owner_owner := GetLinkNazOwner(v_linknaz_owner);
        update asu.tlinknaz ln set ln.fk_owner = pLinkNazID where fk_id = v_linknaz_owner;
        update asu.tlinknaz ln set ln.fk_owner = v_linknaz_owner_owner where fk_id = pLinkNazID;
        update asu.tlinknaz ln set ln.fk_owner = v_linknaz_owner where fk_id = v_linknaz_child;
     else
        v_linknaz_child_child := GetLinkNazChild(v_linknaz_child);
        update asu.tlinknaz ln set ln.fk_owner = v_linknaz_child where fk_id = pLinkNazID;
        update asu.tlinknaz ln set ln.fk_owner = v_linknaz_owner where fk_id = v_linknaz_child;
        update asu.tlinknaz ln set ln.fk_owner = pLinkNazID where fk_id = v_linknaz_child_child;
     end if;
   end;
END;
/

SHOW ERRORS;


