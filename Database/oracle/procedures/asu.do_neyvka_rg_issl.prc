DROP PROCEDURE ASU.DO_NEYVKA_RG_ISSL
/

--
-- DO_NEYVKA_RG_ISSL  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZIS (Table)
--   TIB (Table)
--   TSMID (Table)
--   VRES (Table)
--   GET_NEVIP (Function)
--   GET_NEYAV (Function)
--   GET_RG_ISSL (Function)
--   DO_LOG_NEYVKA_RG_ISSL (Procedure)
--
CREATE OR REPLACE PROCEDURE ASU."DO_NEYVKA_RG_ISSL" IS
  CURSOR cIssl IS SELECT FK_ID, FK_SMID, FK_PACID
                    FROM TNAZIS ISL
                   WHERE ISL.FK_NAZSOSID = GET_NEVIP
                     AND ISL.FK_SMID IN (SELECT FK_ID
                                           FROM TSMID
                                          WHERE FL_SHOWANAL = 1 AND FL_DEL = 0 
                                         CONNECT BY PRIOR FK_ID = FK_OWNER
                                         START WITH FK_ID = ASU.GET_RG_ISSL)
                     AND TRUNC(SYSDATE) - FD_NAZ > 3
                  ORDER BY FD_NAZ;
  CURSOR cIDOtmena IS SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM='XRAY_OTMENA_NEYVKA';
  CURSOR cOwnerOtmena IS SELECT MAX(FK_OWNER) FROM TSMID WHERE FC_SYNONIM='XRAY_OTMENA_NEYVKA';
  
  IDOtmena NUMBER;
  OwnerOtmena NUMBER;              
-- Ставит статус неявка для рентген исследований, которые были невыполнены в течении трех дней
-- Author: Prihodko                  
BEGIN
  ASU.DO_LOG_NEYVKA_RG_ISSL('Начало выполнения процедуры');
  OPEN cIDOtmena;
  ASU.DO_LOG_NEYVKA_RG_ISSL('Открыли курсор cIDOtmena');
  FETCH cIDOtmena INTO IDOtmena;
  ASU.DO_LOG_NEYVKA_RG_ISSL('Зафетчили данные в переменную IDOtmena');
  CLOSE cIDOtmena;
  ASU.DO_LOG_NEYVKA_RG_ISSL('Закрыли курсор cIDOtmena');
  OPEN cOwnerOtmena;
  ASU.DO_LOG_NEYVKA_RG_ISSL('Открыли курсор cOwnerOtmena');
  FETCH cOwnerOtmena INTO OwnerOtmena;
  ASU.DO_LOG_NEYVKA_RG_ISSL('Зафетчили данные в переменную OwnerOtmena');
  CLOSE cOwnerOtmena;
  ASU.DO_LOG_NEYVKA_RG_ISSL('Закрыли курсор cOwnerOtmena');
  FOR n IN cIssl LOOP
    ASU.DO_LOG_NEYVKA_RG_ISSL('Вошли в курсор cIssl');
    UPDATE TNAZIS SET FK_NAZSOSID = ASU.GET_NEYAV WHERE FK_ID = n.FK_ID;
    ASU.DO_LOG_NEYVKA_RG_ISSL('update tnazis'||to_char(n.FK_ID));
    INSERT INTO VRES(FK_SMID, FD_INS, FC_RES, FC_TYPE, FK_VRACHID, FK_PACID, FK_NAZID, FK_SOS) 
    VALUES(n.FK_SMID, SYSDATE, 'Неявка', 'TEXT', 0, n.FK_PACID, n.FK_ID, ASU.GET_NEYAV);
    ASU.DO_LOG_NEYVKA_RG_ISSL('insert vres'||to_char(n.FK_ID));
    INSERT INTO TIB(FC_CHAR, FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID, FD_DATE) 
    VALUES('Неявка', n.FK_ID, IDOtmena, OwnerOtmena, 0, SYSDATE);
    ASU.DO_LOG_NEYVKA_RG_ISSL('insert tib'||to_char(n.FK_ID));
  END LOOP;
  ASU.DO_LOG_NEYVKA_RG_ISSL('Конец выполнения процедуры');  
END; -- Procedure
/

SHOW ERRORS;


