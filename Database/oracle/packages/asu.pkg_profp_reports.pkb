DROP PACKAGE BODY ASU.PKG_PROFP_REPORTS
/

--
-- PKG_PROFP_REPORTS  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_PROFP_REPORTS" 
IS
--------------------------------------------------------------------------------
   FUNCTION get_naz_profp_list (List_ID IN NUMBER) RETURN VARCHAR2
    IS
      nazlist   VARCHAR2(2000);
      nazlist2  VARCHAR2(200);

      CURSOR naz IS
        SELECT get_fullpath_sha (vnaz.fk_smid)
        FROM tprofp_list tpl, tprofp_list_naz tpln, vnaz
        WHERE tpl.fk_id = tpln.fk_listid
          AND tpl.fk_id = List_ID
          --AND tpl.fk_ambulanceid = Pac_ID
          AND vnaz.fk_id = tpln.fk_nazid
          ORDER BY  vnaz.fk_smid;

   BEGIN
      OPEN naz;
      nazlist := '';
      LOOP
          FETCH naz INTO nazlist2;
          EXIT WHEN (naz%NOTFOUND) or Length(nazlist)>1800 ;

          if Length(nazlist2) > 0  then nazlist := nazlist||nazlist2||'; '; END IF;
      END LOOP;
      CLOSE naz;

      RETURN RTRIM(nazlist, '; ');
   END get_naz_profp_list;
--------------------------------------------------------------------------------
   function GET_SPEC_DATE(aDate in Date) return VARCHAR2
   IS
     Month VARCHAR2(15);
     Result VARCHAR2(25);
   begin
     if aDate = null then Result := '';
     else
       Month := TO_CHAR(aDate,'MM');
       if Month = '01' then Month := ' января';  end if;
       if Month = '02' then Month := ' февраля'; end if;
       if Month = '03' then Month := ' марта'; end if;
       if Month = '04' then Month := ' апреля'; end if;
       if Month = '05' then Month := ' мая'; end if;
       if Month = '06' then Month := ' июня'; end if;
       if Month = '07' then Month := ' июля'; end if;
       if Month = '08' then Month := ' августа'; end if;
       if Month = '09' then Month := ' сентября'; end if;
       if Month = '10' then Month := ' октября'; end if;
       if Month = '11' then Month := ' ноября'; end if;
       if Month = '12' then Month := ' декабря'; end if;

       Result := TO_CHAR(aDate, 'dd')||Month||TO_CHAR(aDate, ' yyyy');
     end if;
     Return Result;
   end GET_SPEC_DATE;
--------------------------------------------------------------------------------
   function GET_SPEC_ZAKL(aStr in VARCHAR2) return VARCHAR2
   is
     Result VARCHAR2(15);
   begin
     Result := '';
     if aStr = 'Годен' then Result := 'Не выявлено'; end if;
     if aStr = 'Не годен' then Result := 'Выявлено'; end if;

     return Result;
   end GET_SPEC_ZAKL;
--------------------------------------------------------------------------------
END;
/

SHOW ERRORS;


