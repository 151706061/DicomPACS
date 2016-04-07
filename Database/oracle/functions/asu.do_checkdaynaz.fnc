DROP FUNCTION ASU.DO_CHECKDAYNAZ
/

--
-- DO_CHECKDAYNAZ  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TGRAPH (Table)
--   TPACLST (Table)
--   TRASPIS (Table)
--   TSMID (Table)
--   GET_NAZCOUNT (Function)
--   TNAZVRACH (View)
--
CREATE OR REPLACE FUNCTION ASU."DO_CHECKDAYNAZ" (nPACID in Number, nSMID in Number, nFK_GRAPHID in number) return NUMBER as
  nPeople NUMBER:=0.0;
  nTime NUMBER:=0.0;
  dDate DATE;
  nNazcount NUMBER:=0.0;
  nMin NUMBER:=0.0;
  nHour NUMBER:=0.0;
  TMPnHour NUMBER:=0.0;
  TMPnMin NUMBER:=0.0;
  nlHour NUMBER:=0.0;
  nlMin NUMBER:=0.0;
  nlTime NUMBER:=0.0;
  nlSMID NUMBER:=0.0;
  CURSOR cGraph is select TO_NUMBER(ft_hour), TO_NUMBER(ft_min), fd_date, get_nazcount(nFK_GRAPHID) from tgraph
                   where tgraph.fk_id=nFK_GRAPHID;
  CURSOR cSMID is select TO_NUMBER(fc_time), fn_people from tsmid where fk_id=nSMID;
  CURSOR cDATA is select  TO_NUMBER(tgraph.ft_hour), TO_NUMBER(tgraph.ft_min), tnazvrach.fk_smid
                  from tgraph, tpaclst, traspis, tnazvrach
                  where tgraph.fk_id=tpaclst.fk_graphid and
                        tgraph.fk_raspid=traspis.fk_graphid and
                        traspis.fk_nazvrachid=tnazvrach.fk_id and
                        tpaclst.fk_pacid=nPACID and
                        tgraph.fd_date=dDate;
begin
  OPEN cGraph;
    fetch cGraph into nHour, nMin, dDate, nNazcount;
  CLOSE cGraph;
  OPEN cSMID;
    fetch cSMID into nTime, nPeople;
  CLOSE cSMID;
  if nNazcount=nPeople then
    return 1;
  end if;
  OPEN cDATA;
    LOOP
      fetch cDATA into TMPnHour, TMPnMin, nlSMID;
      exit when cDATA%NOTFOUND;
      if (TMPnHour=nHour) and (TMPnMin=nMin) then
        return 1;
      end if;
      nlHour:=TMPnHour;
      select TO_NUMBER(fc_time) into nlTime from tsmid where fk_id=nlSMID;
      nlMin:=TMPnMin+nlTime;
      LOOP
        exit when nlMin<60;
        nlHour:=nlHour+1;
        nlMin:=nlMin-60;
      END LOOP;
      if (nlHour=nHour) and (nlMin=nMin) then
        return 1;
      else
        return 0;
      end if;
    END LOOP;
    return 0;
  CLOSE cDATA;
  -- return 0 if Ok
end;
/

SHOW ERRORS;


