-- Start of DDL Script for Package Body NEOTLOZH.PKG_NEOTLOZH
-- Generated 12-èþë-2007 16:57:28 from NEOTLOZH@asu

CREATE OR REPLACE 
PACKAGE neotlozh.pkg_neotlozh is
  -- Author  : MIKITA
  -- Created : 08.04.2001 09:49:50
  -- Purpose :

  -- Public type declarations
--  type <TypeName> is <Datatype>;

  -- Public constant declarations
--  <ConstantName> constant <Datatype> := <Value>;
  -- Public variable declarations
--  <VariableName> <Datatype>;
  -- Public function and procedure declarations
  procedure addmedic(aGROUP_MO in number, pmedicid in number, pcolvo in number);
  procedure updmedic(pid in number, pmedicid in number, pcolvo in number);
  procedure delmedic(pid in number);

/*commented by Sill 21.02.06 */
/*  FUNCTION get_medic_rashod(medicid IN number, moid IN number) RETURN NUMBER;*/
end PKG_NEOTLOZH;
/


CREATE OR REPLACE 
PACKAGE BODY          neotlozh.pkg_neotlozh is
  procedure addmedic(aGROUP_MO in number, pmedicid in number, pcolvo in number)
  is
    med NUMBER;
  begin
    select NVL(MAX(mz.medicid),0)
    into med
    from (SELECT mz.medicid from tminzapas mz where mz.medicid = pmedicid and mz.moid = aGROUP_MO) mz;
    
    if med = 0 then
      insert into tminzapas(medicid, moid, colvo) values (pmedicid, aGROUP_MO, pcolvo);
    end if;  
  end;

  procedure updmedic(pid in number, pmedicid in number, pcolvo in number)
  is
  begin
    update tminzapas set  medicid=pmedicid, colvo=pcolvo where id=pid;
  end;

  procedure delmedic(pid in number)
  is
  begin
    delete from tminzapas where id=pid;
  end;

/*commented by Sill 21.02.06 */

	/*FUNCTION get_medic_rashod(medicid IN number, moid IN number) RETURN NUMBER
	IS
	  nRES number:=0.0;
	  CURSOR cOST(pID IN number, pmoid IN number) IS
      SELECT NVL(SUM(a2.colvo), 0)*NVL(SUM(a1.FN_VIDANO),0)
        FROM asu.tnazmed a1, asu.tnazmedlech a2
       WHERE a1.fk_id=a2.naz_id
         AND a1.fp_dezh=1
         AND a2.DOCID IS NULL
         AND a2.DOCPLANID IS NULL
         AND a2.MEDIC_ID=pID
         AND a1.FK_MOID=pmoid;
	BEGIN
	  OPEN cOST(medicid, moid);
		FETCH cOST INTO nRES;
		CLOSE cOST;
		RETURN nRES;
	END;*/
end PKG_NEOTLOZH;
/


-- End of DDL Script for Package Body NEOTLOZH.PKG_NEOTLOZH

