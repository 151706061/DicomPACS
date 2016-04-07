CREATE OR REPLACE FUNCTION get_doobsledovan(pFK_PEPLID IN NUMBER)
  RETURN VARCHAR2 IS
  pNazID NUMBER;
  pFD_RUN VARCHAR2(20);
  nCnt NUMBER;
  cursor cDoob is select fk_id, to_char(fd_run, 'dd.mm.yyyy hh24:mi') as fd_run_str
                    from asu.tnazis
                   where tnazis.fk_pacid in (select fk_id from asu.tambulance where fk_peplid = pfk_peplid
                                              union
                                             select fk_id from asu.tkarta where fk_peplid = pfk_peplid)
                     and (tnazis.fk_nazsosid = asu.get_vipnaz or tnazis.fk_nazsosid = asu.get_pass_registrator)
                     and tnazis.fk_smid in (select fk_id from asu.tsmid
                                             where fl_showanal = 1
                                            start with fk_id = asu.get_xray_flu
                                            connect by prior fk_id = fk_owner)                  
                  order by fd_run desc;
  cursor cNaz(pfk_nazid number) is select count(*) from asu.tnazid_doobsl where fk_nazid = pfk_nazid;                 
BEGIN 
  open cDoob;
  fetch cDoob into pNazID, pFD_RUN;
  open cNaz(pNazID);
  fetch cNaz into nCnt;
  close cNaz; 
  close cDoob;
  if nCnt > 0 THEN
    RETURN 'Дообследование('||pFD_RUN||')'; 
  else
    RETURN null;   
  end if;  
END;
 