ALTER TABLE ASU.TDOA_MESSAGES
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TDOA_MESSAGES CASCADE CONSTRAINTS
/

--
-- TDOA_MESSAGES  (Table) 
--
CREATE TABLE ASU.TDOA_MESSAGES
(
  CONSTRAINT_NAME  VARCHAR2(30 BYTE)            NOT NULL,
  ACTIONS          VARCHAR2(3 BYTE)             NOT NULL,
  PARENT_CHILD     VARCHAR2(1 BYTE)             NOT NULL,
  ERROR_MESSAGE    VARCHAR2(2000 BYTE)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TDOA_MESSAGES IS 'TOracleSession component can translate error messages raised by primary key, unique key, foreign key and check constraints through a message table.
This message table is defined at the session level/
Author: Ura'
/

COMMENT ON COLUMN ASU.TDOA_MESSAGES.CONSTRAINT_NAME IS 'the name of the constraint that is violated.
the name of the constraint that is violated.'
/

COMMENT ON COLUMN ASU.TDOA_MESSAGES.ACTIONS IS 'ndicates if the message is to be displayed for inserts (''I''), updates (''U'') and deletes (''D''). You can combine the letters to indicate multiple actions, e.g. ''IU'' for insert and update. You can use ''*'
/

COMMENT ON COLUMN ASU.TDOA_MESSAGES.PARENT_CHILD IS 'ndicates if the message is to be displayed when the constraint is violated at the parent (''P'') or child (''C'') side. This column is only useful for foreign key constraints, use a ''*'' for all other cons'
/

COMMENT ON COLUMN ASU.TDOA_MESSAGES.ERROR_MESSAGE IS 'he actual message that is displayed.'
/


--
-- PK_TDOA_MESSAGES  (Index) 
--
--  Dependencies: 
--   TDOA_MESSAGES (Table)
--
CREATE UNIQUE INDEX ASU.PK_TDOA_MESSAGES ON ASU.TDOA_MESSAGES
(CONSTRAINT_NAME)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


-- 
-- Non Foreign Key Constraints for Table TDOA_MESSAGES 
-- 
ALTER TABLE ASU.TDOA_MESSAGES ADD (
  CONSTRAINT PK_TDOA_MESSAGES
 PRIMARY KEY
 (CONSTRAINT_NAME)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          160K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

