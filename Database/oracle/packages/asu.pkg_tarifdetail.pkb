DROP PACKAGE BODY ASU.PKG_TARIFDETAIL
/

--
-- PKG_TARIFDETAIL  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU.PKG_TARIFDETAIL IS
  -----------------------------------------------------
  function Add(aUse       in Number,
               aComment   in Varchar2,
               aPEOPLEID  in Number,
               apacid     in Number,
               atalonid   in Number,
               anazid     in Number,
               anazhealid in Number,
               apereselid in Number,
               aOwner     in Varchar2 default '') RETURN NUMBER IS
    pragma autonomous_transaction;
  begin
    if aUse = 0 then
      return(0);
    else
      insert into asu.TarifDetail
        (FK_PEOPLEID,
         fk_pacid,
         fk_talonid,
         fk_nazid,
         fk_nazhealid,
         fk_pereselid,
         fc_comment,
         FC_OWNER,
         FD_DATE)
      values
        (aPEOPLEID,
         apacid,
         atalonid,
         anazid,
         anazhealid,
         apereselid,
         aComment,
         aOwner,
         sysdate);

      commit;

      return(1);
    end if;
  end;

  -----------------------------------------------------
  function AddPEOPLE(aUse in Number, aComment in Varchar2, aPEOPLEID in Number, aOwner in Varchar2 default '')
    RETURN NUMBER is
  begin
    Return(Add(aUse, aComment, aPEOPLEID, -1, -1, -1, -1, -1, aOwner));
  end;

  -----------------------------------------------------
  function AddPac(aUse in Number, aComment in Varchar2, apacid in Number, aOwner in Varchar2 default '')
    RETURN NUMBER is
  begin
    Return(Add(aUse, aComment, -1, apacid, -1, -1, -1, -1, aOwner));
  end;

  -----------------------------------------------------
  function AddTalon(aUse     in Number,
                    aComment in Varchar2,
                    atalonid in Number,
                    aOwner in Varchar2 default '') RETURN NUMBER is
  begin
    Return(Add(aUse, aComment, -1, -1, atalonid, -1, -1, -1, aOwner));
  end;

  -----------------------------------------------------
  function AddNaz(aUse in Number, aComment in Varchar2, anazid in Number, aOwner in Varchar2 default '')
    RETURN NUMBER is
  begin
    Return(Add(aUse, aComment, -1, -1, -1, anazid, -1, -1, aOwner));
  end;

  -----------------------------------------------------
  function AddNazHeal(aUse       in Number,
                      aComment   in Varchar2,
                      anazhealid in Number,
                      aOwner in Varchar2 default '') RETURN NUMBER is
  begin
    Return(Add(aUse, aComment, -1, -1, -1, -1, anazhealid, -1, aOwner));
  end;

  -----------------------------------------------------
  function AddPeresel(aUse       in Number,
                      aComment   in Varchar2,
                      apereselid in Number,
                      aOwner in Varchar2 default '') RETURN NUMBER is
  begin
    Return(Add(aUse, aComment, -1, -1, -1, -1, -1, apereselid, aOwner));
  end;

  -----------------------------------------------------
  procedure FillMissing(aOwner in varchar2) is
    pragma autonomous_transaction;
  begin
    -- востановление нозначения по связке назначение-услуга (fk_nazhealid)
    for c in (select d.fk_id, nh.fk_nazid fk_naz
                from asu.TarifDetail d
               inner join asu.tnazheal nh
                  on nh.fk_id = d.fk_nazhealid
               where d.fk_nazhealid > -1
                 and d.fk_nazid = -1
                 and d.fc_owner = aOwner) loop
      update asu.TarifDetail d
         set d.fk_nazid = c.fk_naz
       where d.fk_id = c.fk_id;
    end loop;

    -- востановление талона по назначению
    for c in (select d.fk_id, an.fk_talonid
                from asu.TarifDetail d
               inner join asu.tambtalon_naz an
                  on an.fk_nazid = d.fk_nazid
               where d.fk_nazid > -1
                 and d.fk_talonid = -1
                 and d.fc_owner = aOwner) loop
      update asu.TarifDetail d
         set d.fk_talonid = c.fk_talonid
       where d.fk_id = c.fk_id;
    end loop;

    -- востановление карты по талону
    for c in (select d.fk_id, ta.fk_ambid fk_pacid
                from asu.TarifDetail d
               inner join asu.tambtalon ta
                  on ta.fk_id = d.fk_talonid
               where d.fk_talonid > -1
                 and d.fk_pacid = -1
                 and d.fc_owner = aOwner) loop
      update asu.TarifDetail d
         set d.fk_pacid = c.fk_pacid
       where d.fk_id = c.fk_id;
    end loop;

    -- востановление карты по переводу
    for c in (select d.fk_id, p.fk_pacid
                from asu.TarifDetail d
               inner join asu.tperesel p
                  on p.fk_id = d.fk_pereselid
               where d.fk_pereselid > -1
                 and d.fk_pacid = -1
                 and d.fc_owner = aOwner) loop
      update asu.TarifDetail d
         set d.fk_pacid = c.fk_pacid
       where d.fk_id = c.fk_id;
    end loop;

    -- востановление карты по назначению
    for c in (select d.fk_id, v.fk_pacid
                from asu.TarifDetail d
               inner join asu.vnaz v
                  on v.fk_id = d.fk_nazid
               where d.fk_nazid > -1
                 and d.fk_pacid = -1
                 and d.fc_owner = aOwner) loop
      update asu.TarifDetail d
         set d.fk_pacid = c.fk_pacid
       where d.fk_id = c.fk_id;
    end loop;

    -- востановление человека по карте
    for c in (select d.fk_id, kt.fk_peplid
                from asu.TarifDetail d
               inner join asu.tkarta kt
                  on kt.fk_id = d.fk_pacid
               where d.fk_pacid > -1
                 and d.fk_peopleid = -1
                 and d.fc_owner = aOwner
              union all
              select d.fk_id, am.fk_peplid
                from asu.TarifDetail d
               inner join asu.tambulance am
                  on am.fk_id = d.fk_pacid
               where d.fk_pacid > -1
                 and d.fk_peopleid = -1
                 and d.fc_owner = aOwner) loop
      update asu.TarifDetail d
         set d.FK_PEOPLEID = c.fk_peplid
       where d.fk_id = c.fk_id;
    end loop;

    commit;
  end;

  PROCEDURE ReplaceOwner(aOldOwner in varchar2, aNewOwner in varchar2) IS
    pragma autonomous_transaction;
  begin
    update asu.Tarifdetail td set td.fc_owner = aNewOwner where td.fc_owner = aOldOwner;

    commit;
  end;

  procedure DeleteByOwner(aOwner in Varchar2) is
    pragma autonomous_transaction;
  begin
    delete from asu.tarifdetail t where t.fc_owner = aOwner;

    commit;
  end;

  PROCEDURE ReplaceOwnerByPacient(aOldOwner in varchar2, aNewOwner in varchar2, aPeopleID in Number) IS
    pragma autonomous_transaction;
  begin
    update asu.Tarifdetail td set td.fc_owner = aNewOwner where td.fc_owner = aOldOwner and td.fk_peopleid = aPeopleID;

    commit;
  end;

END;
/

SHOW ERRORS;


