DROP PACKAGE ASU.PKG_PEOPLE_DOPSTATUS
/

--
-- PKG_PEOPLE_DOPSTATUS  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU.PKG_PEOPLE_DOPSTATUS is

  -- Author  : Ищуков С.С.
  -- Created : 07.05.2015 10:57:51
  -- Purpose : Функции для работы с доп. статусами пациентов (прикрепление к ЛПУ, согласие на передачу мед. информации)

  function GET_PEOPLE_ATTACH_STATUS (aPEPLID in number) return varchar2;
  function GET_PEOPLE_ATTACH_DATE (aPEPLID in number) return date;
  function GET_PEOPLE_POLICY (aPEPLID in number) return varchar2;
  function GET_PEOPLE_POLICY_ENP (aPEPLID in number) return varchar2;
  function GET_LAST_SOTR_BIND (aID in number) return varchar2;
  function GET_LAST_DATE_BIND (aID in number) return date;
  function GET_LAST_SOTR_PRINT (aID in number) return varchar2;
  function GET_LAST_DATE_PRINT (aID in number) return date;
  function GET_PEOPLE_SOGLASIE_STATUS (aPEPLID in number) return number;
  function GET_PEOPLE_SOGLASIE_DATE (aPEPLID in number) return date;
  function GET_SOTR_BY_INN (aINN in varchar2) return varchar2;
  function BIND_PEOPLE (aPEPLID in number, aSOTRID in number, aDATE in date) return number;
  function PRINT_BIND (aPEPLID in number, aSOTRID in number) return number;
  function SOGLASIE_PEOPLE(aPEPLID in number, aSOTRID in number, aDATE in date) return number;
  function PRINT_SOGLASIE (aPEPLID in number, aSOTRID in number) return number;
  function BIND_PEOPLE_LOADER (aPEPLID in number, aSTATUS in number, aDATE in date, aDOCTOR in varchar2, aSOTRID in number) return number;
  function BIND_PEOPLE_SERVICE (aID in number, aSTATUS in number, aMSG in varchar2, aDOCTOR in varchar2) return number;
  function REBIND_PEOPLE (aID in number, aUSERID in number) return number;
  function QUEUE_BIND_PEOPLE (aPEPLID in number, aDOCTOR in varchar2) return number;
  function MARK_BAD_PEOPLE (aID number, aMark number) return number;


end PKG_PEOPLE_DOPSTATUS;
/

SHOW ERRORS;


