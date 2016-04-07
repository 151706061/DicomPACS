DROP PACKAGE ASU.PKG_EXCH_SAMOZAPIS
/

--
-- PKG_EXCH_SAMOZAPIS  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--   WEB_BUFFER_TRANSFER (Table)
--
CREATE OR REPLACE PACKAGE ASU.PKG_EXCH_SAMOZAPIS IS

  -- Author  : SPASSKIY
  -- Created : 01.09.2010 14:07:50
  -- Purpose :
  IS_REPL BOOLEAN := FALSE;
  --сопоставление точек расписания
  PROCEDURE MATCH_SCHEDULE_GRAPH(PSCHEDULE IN VARCHAR2, PGRAPH NUMBER);

  --сопоставление пациентов
  PROCEDURE MATCH_PEOPLE_AMBULANCE(PPEOPLE_OID   VARCHAR2,
                                   PAMBULANCE_ID NUMBER);

  --Сопоставление ЛПУ и отделений
  PROCEDURE MATCH_LPU_OTDEL(PLPU_OID VARCHAR2, POTDEL_ID NUMBER);

  --Возвращает ЛПУ, с которым сопоставлено отделение, либо первого родителя, у которого есть сопоставление
  FUNCTION GET_WEB_LPU_BY_OTDEL(POTDEL NUMBER) RETURN VARCHAR2;

  --Возвращает ЛПУ, с которым сопоставлено отделение, в котором рабоает сотрудник
  FUNCTION GET_WEB_LPU_BY_SOTR(PSOTR NUMBER) RETURN VARCHAR2;

  --логирование изменений
  PROCEDURE DO_LOG(PTABLE_NAME      ASU.WEB_BUFFER_TRANSFER.TABLE_NAME%TYPE,
                   pKEY_FIELD_VALUE ASU.WEB_BUFFER_TRANSFER.KEY_FIELD_VALUE%TYPE,
                   pACTION          ASU.WEB_BUFFER_TRANSFER.ACTION%TYPE);
   
  --логирование изменений с дополнительной информацией                
  PROCEDURE DO_LOG(PTABLE_NAME      ASU.WEB_BUFFER_TRANSFER.TABLE_NAME%TYPE,
                   pKEY_FIELD_VALUE ASU.WEB_BUFFER_TRANSFER.KEY_FIELD_VALUE%TYPE,
                   pACTION          ASU.WEB_BUFFER_TRANSFER.ACTION%TYPE,
                   pFC_INFO         ASU.WEB_BUFFER_TRANSFER.FC_INFO%TYPE);

  --логирование изменений с датой актуальности используется в триггере TGRAPH$WEB_REPLICATION 
  PROCEDURE DO_LOG(PTABLE_NAME      ASU.WEB_BUFFER_TRANSFER.TABLE_NAME%TYPE,
                   pKEY_FIELD_VALUE ASU.WEB_BUFFER_TRANSFER.KEY_FIELD_VALUE%TYPE,
                   pACTION          ASU.WEB_BUFFER_TRANSFER.ACTION%TYPE,
                   pFC_INFO         ASU.WEB_BUFFER_TRANSFER.FC_INFO%TYPE,
                   pACTUAL_DATE     ASU.WEB_BUFFER_TRANSFER.ACTUAL_DATE%TYPE);

  --установка признака доступности сервиса
  PROCEDURE SET_SERVICE_REACHABLE(PSTATE NUMBER);

  --чтение признака доступности сервиса
  FUNCTION IS_SERVICE_REACHABLE RETURN NUMBER;

END PKG_EXCH_SAMOZAPIS;
/

SHOW ERRORS;


