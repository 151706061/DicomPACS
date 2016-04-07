DROP PACKAGE BODY ASU.PKG_ADMIN
/

--
-- PKG_ADMIN  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_ADMIN"
IS
   PROCEDURE do_write_spec (
      pfk_id        IN   NUMBER,
      pfk_priorid   IN   NUMBER,
      pfc_name      IN   VARCHAR2,
      pfk_appid     IN   NUMBER,
      pfk_levelid   IN   NUMBER,
      pfl_podp      IN   NUMBER,
      pfl_spr       IN   NUMBER,
      pfl_mesta     IN   NUMBER,
      pfc_url       IN   varchar2
   )
   IS
      PRAGMA AUTONOMOUS_TRANSACTION;

      CURSOR c
      IS
         SELECT fk_id
           FROM tspec
          WHERE fk_id = pfk_id;

      i   NUMBER;
   BEGIN
      OPEN c;
      FETCH c INTO i;

      IF c%NOTFOUND
      THEN
         INSERT INTO tspec
                     (fk_priorid, fk_appid, fc_name, fk_levelid,
                      fl_podp, fl_spr, fl_mesta, fc_url)
              VALUES (pfk_priorid, pfk_appid, pfc_name, pfk_levelid,
                      pfl_podp, pfl_spr, pfl_mesta, pfc_url);
      ELSE
         UPDATE tspec
            SET fk_priorid = pfk_priorid,
                fk_appid = pfk_appid,
                fc_name = pfc_name,
                fk_levelid = pfk_levelid,
                fl_podp = pfl_podp,
                fl_spr = pfl_spr,
                fl_mesta = pfl_mesta,
                fc_url=pfc_url
          WHERE fk_id = pfk_id;
      END IF;

      CLOSE c;
      COMMIT;
   END;

   PROCEDURE do_delete_spec (pfk_id IN NUMBER)
   IS
      PRAGMA AUTONOMOUS_TRANSACTION;
   BEGIN
      DELETE FROM tspec
            WHERE fk_id = pfk_id;

      COMMIT;
   END;

   PROCEDURE do_write_sotr (
      pfk_id      IN   NUMBER,
      pfc_fam     IN   VARCHAR2,
      pfc_name    IN   VARCHAR2,
      pfc_otch    IN   VARCHAR2,
      pfc_tel     IN   VARCHAR2,
      pfk_otdid   IN   NUMBER,
      pfp_vrach   IN   NUMBER
   )
   IS
      PRAGMA AUTONOMOUS_TRANSACTION;

      CURSOR c
      IS
         SELECT fk_id
           FROM tsotr
          WHERE fk_id = pfk_id;

      i   NUMBER;
   BEGIN
      OPEN c;
      FETCH c INTO i;

      IF c%NOTFOUND
      THEN
         INSERT INTO tsotr
                     (fc_fam, fc_name, fc_otch, fc_tel, fk_otdid,
                      fp_vrach)
              VALUES (pfc_fam, pfc_name, pfc_otch, pfc_tel, pfk_otdid,
                      pfp_vrach);
      ELSE
         UPDATE tsotr
            SET fc_fam = pfc_fam,
                fc_name = pfc_name,
                fc_otch = pfc_otch,
                fc_tel = pfc_tel,
                fk_otdid = pfk_otdid,
                fp_vrach = pfp_vrach
          WHERE fk_id = pfk_id;
      END IF;

      CLOSE c;
      COMMIT;
   END;

   PROCEDURE do_delete_sotr (pfk_id IN NUMBER)
   IS
      PRAGMA AUTONOMOUS_TRANSACTION;
   BEGIN
      DELETE FROM tsotr
            WHERE fk_id = pfk_id;

      COMMIT;
   END;

   PROCEDURE do_write_prior (pfk_id IN NUMBER, pfc_name IN VARCHAR2)
   IS
      PRAGMA AUTONOMOUS_TRANSACTION;

      CURSOR c
      IS
         SELECT fk_id
           FROM tprior
          WHERE fk_id = pfk_id;

      i   NUMBER;
   BEGIN
      OPEN c;
      FETCH c INTO i;

      IF c%NOTFOUND
      THEN
         INSERT INTO tprior
                     (fc_name)
              VALUES (pfc_name);
      ELSE
         UPDATE tprior
            SET fc_name = pfc_name
          WHERE fk_id = pfk_id;
      END IF;

      CLOSE c;
      COMMIT;
   END;

   PROCEDURE do_delete_prior (pfk_id IN NUMBER)
   IS
      PRAGMA AUTONOMOUS_TRANSACTION;
   BEGIN
      DELETE FROM tprior
            WHERE fk_id = pfk_id;

      COMMIT;
   END;

   PROCEDURE do_recover_pacient (pfk_id IN NUMBER)
   IS
      CURSOR cKarta IS SELECT fk_id FROM tkarta WHERE fk_id=pfk_id;
      CURSOR cAmb IS SELECT fk_id FROM tambulance WHERE fk_id=pfk_id;
      PRAGMA AUTONOMOUS_TRANSACTION;
      tmp NUMBER;
   BEGIN
      DELETE FROM tibtext
            WHERE fk_pacid = pfk_id; --???? FK_ID=pFK_ID, ????? ??? ? ?????
      OPEN ckarta;
      FETCH ckarta INTO tmp;
      IF ckarta%NOTFOUND THEN
         OPEN camb;
         FETCH camb INTO tmp;
         IF NOT (camb%NOTFOUND) THEN
             UPDATE tambulance SET fl_vyb = 0 WHERE fk_id = pfk_id;
         END IF;
      ELSE
         UPDATE tkarta SET fl_vyb = 0 WHERE fk_id = pfk_id;
      END IF;
      CLOSE ckarta;
      UPDATE tkarta
         SET fl_vyb = 0
       WHERE fk_id = pfk_id;

      COMMIT;
   END;

   PROCEDURE do_write_pass (
      pfk_id       IN   NUMBER,
      pfk_sotrid   IN   NUMBER,
      pfk_specid   IN   NUMBER,
      pfc_pass     IN   VARCHAR2
   )
   IS
      PRAGMA AUTONOMOUS_TRANSACTION;

      CURSOR c
      IS
         SELECT fk_id
           FROM tpass
          WHERE fk_id = pfk_id;

      i   NUMBER;
   BEGIN
      OPEN c;
      FETCH c INTO i;

      IF c%NOTFOUND
      THEN
         INSERT INTO tpass
                     (fk_sotrid, fk_specid, fc_pass)
              VALUES (pfk_sotrid, pfk_specid, pfc_pass);
      ELSE
         UPDATE tpass
            SET fk_sotrid = pfk_sotrid,
                fk_specid = pfk_specid,
                fc_pass = pfc_pass
          WHERE fk_id = pfk_id;
      END IF;

      CLOSE c;
      COMMIT;
   END;

   PROCEDURE do_delete_pass (pfk_id IN NUMBER)
   IS
      PRAGMA AUTONOMOUS_TRANSACTION;
   BEGIN
      DELETE FROM tpass
            WHERE fk_id = pfk_id;

      COMMIT;
   END;

   FUNCTION is_can_view (psotr IN NUMBER, pid IN NUMBER)
      RETURN NUMBER
   IS
      n_res   NUMBER := 0.0;

      CURSOR c1
      IS
         SELECT COUNT (fk_sotrid)
           FROM tsmid_rights
          WHERE fk_sotrid = psotr AND fk_smid = pid;
   BEGIN
      OPEN c1;
      FETCH c1 INTO n_res;
      CLOSE c1;
      RETURN n_res;
   END;

   PROCEDURE update_rights (psotr IN NUMBER, pid IN NUMBER)
   IS
      n_count   NUMBER := 0.0;

      CURSOR c1
      IS
         SELECT COUNT (fk_sotrid)
           FROM tsmid_rights
          WHERE fk_sotrid = psotr AND fk_smid = pid;
   BEGIN
      OPEN c1;
      FETCH c1 INTO n_count;
      CLOSE c1;

      IF n_count = 0
      THEN
         INSERT INTO tsmid_rights
                     (fk_sotrid, fk_smid)
              VALUES (psotr, pid);
      ELSE
         DELETE FROM tsmid_rights
               WHERE fk_sotrid = psotr AND fk_smid = pid;
      END IF;
   END;

/*   function is_vrachview(pSotr in number) return number
   is
     cursor c is select count from tsmid_rights
                 where  fk_sotrid=pSotr;
   begin
     open c;
     fetch c into nRes;
     close c;
     return nRes;
   end;*/
procedure DoSetUserPas(p_fc_login IN VARCHAR2, pnewhash IN VARCHAR2, pIsAdmin IN NUMBER := -1) is
  user_not_exist  EXCEPTION;
  PRAGMA EXCEPTION_INIT(user_not_exist, -01918);
begin
begin
    EXECUTE IMMEDIATE 'alter user ' || '"' || p_fc_login || '"' || ' identified by "'|| pnewhash || '"';
     exception
       When user_not_exist then
        DOCreateOraUser(p_fc_login, pnewhash, pIsAdmin);
     end;

     begin
       if pIsAdmin = 0 then
           EXECUTE IMMEDIATE 'REVOKE DBA FROM "' || p_fc_login || '"';
           EXECUTE IMMEDIATE 'ALTER USER "' || p_fc_login || '" DEFAULT ROLE ALL';
       else if pIsAdmin = 1 then
           EXECUTE IMMEDIATE 'GRANT DBA TO "' || p_fc_login || '"';
           EXECUTE IMMEDIATE 'ALTER USER "' || p_fc_login || '" DEFAULT ROLE ALL';
       end if;
       end if;
     exception

       When Others then

        null;
     end;
end;

procedure DOCreateOraUser(p_fc_login IN VARCHAR2, pnewhash IN VARCHAR2, pIsAdmin IN NUMBER := -1) is
  user_exist  EXCEPTION;
  PRAGMA EXCEPTION_INIT(user_exist, -01920);

begin
begin
     EXECUTE IMMEDIATE 'create user "' || p_fc_login || '" identified by "' || pnewhash || '" ' ||
                   'default tablespace USR temporary tablespace TEMP ' ||
                   'profile DEFAULT';
     EXECUTE IMMEDIATE 'GRANT MIS_USER to "' || p_fc_login || '"';
       EXECUTE IMMEDIATE 'ALTER USER "' ||p_fc_login || '" PROFILE MED_PROF';
     exception
       When user_exist then
        DoSetUserPas(p_fc_login, pnewhash, pIsAdmin);
     end;
     begin
       if pIsAdmin = 0 then
           EXECUTE IMMEDIATE 'REVOKE DBA FROM "' || p_fc_login || '"';
           EXECUTE IMMEDIATE 'ALTER USER "' || p_fc_login || '" DEFAULT ROLE ALL';
       else if pIsAdmin = 1 then
           EXECUTE IMMEDIATE 'GRANT DBA TO "' || p_fc_login || '"';
           EXECUTE IMMEDIATE 'ALTER USER "' || p_fc_login || '" DEFAULT ROLE ALL';
       end if;
       end if;
     exception
       When user_exist then
        DoSetUserPas(p_fc_login, pnewhash, pIsAdmin);
       when others then
        null;
     end;
end;

procedure DoDeleteUser(p_fc_login IN VARCHAR2) is
begin
  begin
    EXECUTE IMMEDIATE 'drop user "' || p_fc_login || '" cascade';
  exception
    When Others then
      null;
  end;
end;

END;
/

SHOW ERRORS;


