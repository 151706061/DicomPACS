DROP PACKAGE BODY ASU.PKG_VNAZ
/

--
-- PKG_VNAZ  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_VNAZ" 
IS
-------------------------------------------------------------------------------
   PROCEDURE do_insert_vnaz(
      psmid        IN       NUMBER,
      pdrun        IN       DATE,
      pkabinetid   IN       NUMBER,
      pvrachid     IN       NUMBER,
      pispolid     IN       NUMBER,
      ppacid       IN       NUMBER,
      pplat        IN       NUMBER,
      pfk_id       IN OUT   NUMBER,
      premark      IN       VARCHAR2
   )
   IS
   BEGIN
      IF pfk_id = 0
      THEN
         INSERT INTO vnaz
                     (
                        fk_smid,
                        fd_naz,
                        fd_run,
                        fk_roomid,
                        fk_vrachid,
                        fk_ispolid,
                        fk_nazsosid,
                        fk_pacid,
                        fl_plat,
                        fc_remark
                     )
              VALUES(
                 psmid,
                 SYSDATE,
                 pdrun,
                 pkabinetid,
                 pvrachid,
                 pispolid,
                 pkg_common.get_nevip,
                 ppacid,
                 pplat,
                 premark
              )
           RETURNING fk_id
            INTO pfk_id;
      ELSE
         UPDATE vnaz
            SET fd_run = pdrun,
                fd_naz = SYSDATE,
                fk_roomid = pkabinetid,
                fk_vrachid = pvrachid,
                fk_ispolid = pispolid,
                fl_plat = pplat,
                fc_remark = premark
          WHERE fk_id = pfk_id;
      END IF;
   END;
-------------------------------------------------------------------------------
   PROCEDURE do_delete_vnaz(pid IN NUMBER)
   IS
   BEGIN
      DELETE
        FROM vnaz
       WHERE fk_id = pid;
   END;
   PROCEDURE do_insert_tnazparam(
      pfk_id     IN OUT   NUMBER,
      pnazid     IN       NUMBER,
      pparamid   IN       NUMBER,
      pkvalue    IN       NUMBER,
      pnvalue    IN       NUMBER,
      pcvalue    IN       VARCHAR2
   )
   IS
   BEGIN
      IF pfk_id = 0
      THEN
         INSERT INTO tnazparam
                     (fk_nazid, fk_paramid, fk_valueid, fn_value, fc_value)
              VALUES(pnazid, pparamid, pkvalue, pnvalue, pcvalue);
      ELSE
         UPDATE tnazparam
            SET fk_valueid = pkvalue,
                fn_value = pnvalue,
                fc_value = pcvalue
          WHERE fk_id = pfk_id;
      END IF;
   END;
-------------------------------------------------------------------------------
   FUNCTION get_proc_param_value(pnazid IN NUMBER)
      RETURN VARCHAR2
   IS
      CURSOR c(p_id IN NUMBER)
      IS
         SELECT get_proc_param_name(fk_paramid) || ': ' ||
                   get_proc_param_name(fk_valueid) ||
                   TO_CHAR(fn_value) ||
                   fc_value AS fc_param
           FROM tnazparam
          WHERE fk_nazid = p_id;
      result   VARCHAR2(4000);
   BEGIN
      OPEN c(pnazid);
      FETCH c INTO result;
      IF c%NOTFOUND
      THEN
         CLOSE c;
         RETURN '';
      END IF;
      CLOSE c;
      result :=    ': ';
      FOR i IN c(pnazid)
      LOOP
         result :=    result || i.fc_param || '; ';
      END LOOP;
      result :=    SUBSTR(result, 1, LENGTH(result) - 2);
      result :=    result || '.';
      RETURN result;
   END get_proc_param_value;
-------------------------------------------------------------------------------
   PROCEDURE do_write_tlechshablon(
      pfk_id     IN OUT   NUMBER,
      pparamid   IN       NUMBER,
      pvrachid   IN       NUMBER,
      pname      IN       VARCHAR2,
      pcvalue    IN       VARCHAR2,
      pdefault   IN       NUMBER
   )
   IS
   BEGIN
      IF pfk_id = -1
      THEN
         INSERT INTO tlechshablon
                     (fk_lechparam, fk_vrachid, fc_name, fc_value)
              VALUES(pparamid, pvrachid, pname, pcvalue)
           RETURNING fk_id
            INTO pfk_id;
      ELSE
         UPDATE tlechshablon
            SET fk_lechparam = pparamid,
                fk_vrachid = pvrachid,
                fc_name = pname,
                fc_value = pcvalue
          WHERE fk_id = pfk_id;
      END IF;
      IF pdefault = 1
      THEN
         UPDATE tlechparam
            SET fk_default = pfk_id
          WHERE fk_id = pparamid;
      ELSE
         UPDATE tlechparam
            SET fk_default = 0
          WHERE fk_id = pparamid;
      END IF;
   END do_write_tlechshablon;
-------------------------------------------------------------------------------
   FUNCTION get_proc_param_name(pid IN NUMBER)
      RETURN VARCHAR2
   IS
      CURSOR c(p_id IN NUMBER)
      IS
         SELECT fc_name
           FROM tlechparam
          WHERE fk_id = p_id;
      result   VARCHAR2(100);
   BEGIN
      OPEN c(pid);
      FETCH c INTO result;
      CLOSE c;
      RETURN result;
   END get_proc_param_name;
-------------------------------------------------------------------------------
   PROCEDURE do_insert_shablon(
      pknameid   IN   NUMBER,
      pparamid   IN   NUMBER,
      pkvalue    IN   NUMBER,
      pnvalue    IN   NUMBER,
      pcvalue    IN   VARCHAR2
   )
   IS
   BEGIN
      INSERT INTO tlechshablon
                  (
                     fk_shablonname,
                     fk_lechparam,
                     fk_valueid,
                     fn_value,
                     fc_value
                  )
           VALUES(pknameid, pparamid, pkvalue, pnvalue, pcvalue);
   END;
-------------------------------------------------------------------------------
   PROCEDURE do_insert_shablonname(
      pid        IN OUT   NUMBER,
      psmid      IN       NUMBER,
      pcname     IN       VARCHAR2,
      pvrachid   IN       NUMBER
   )
   IS
   BEGIN
      INSERT INTO tlechshablonname
                  (fk_smid, fc_name, fk_vrachid)
           VALUES(psmid, pcname, pvrachid)
        RETURNING fk_id
         INTO pid;
   END;
   FUNCTION get_proc_vip_count(pid IN NUMBER)
      RETURN NUMBER
   IS
      CURSOR c(p_id IN NUMBER)
      IS
         SELECT COUNT(fk_id)
           FROM vres
          WHERE fk_nazid = p_id
            AND fk_sos = get_vipnaz;
      result   NUMBER;
   BEGIN
      OPEN c(pid);
      FETCH c INTO result;
      CLOSE c;
      RETURN result;
   END get_proc_vip_count;
   FUNCTION get_proc_full_count(pid IN NUMBER)
      RETURN NUMBER
   IS
      CURSOR c(p_id IN NUMBER)
      IS
         SELECT COUNT(fk_id)
           FROM vres
          WHERE fk_nazid = p_id;
      result   NUMBER;
   BEGIN
      OPEN c(pid);
      FETCH c INTO result;
      CLOSE c;
      RETURN result;
   END get_proc_full_count;
   FUNCTION get_target(premark IN VARCHAR2)
      RETURN VARCHAR2
   IS
      str   VARCHAR2(102) := '';
   BEGIN
      IF NOT (premark IS NULL)
      THEN
         str :=    '(' || premark || ')';
      END IF;
      RETURN str;
   END;
END;
/

SHOW ERRORS;


