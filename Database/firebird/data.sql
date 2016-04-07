
SET SQL DIALECT 3;

SET NAMES NONE;

CREATE DATABASE 'C:\pacs\PACSDB.GDB'
USER 'SYSDBA' PASSWORD 'masterkey'
PAGE_SIZE 1024
DEFAULT CHARACTER SET NONE;



/******************************************************************************/
/***                               Generators                               ***/
/******************************************************************************/

CREATE GENERATOR GEN_CONCLUSIONS_ID;
SET GENERATOR GEN_CONCLUSIONS_ID TO 49;

CREATE GENERATOR GEN_DEVICES_ID;
SET GENERATOR GEN_DEVICES_ID TO 99;

CREATE GENERATOR GEN_DIAGNOZ_ID;
SET GENERATOR GEN_DIAGNOZ_ID TO 121;

CREATE GENERATOR GEN_EVENTSWL_ID;
SET GENERATOR GEN_EVENTSWL_ID TO 1183;

CREATE GENERATOR GEN_EVENTS_ID;
SET GENERATOR GEN_EVENTS_ID TO 744401;

CREATE GENERATOR GEN_EVENTS_RSND_ID;
SET GENERATOR GEN_EVENTS_RSND_ID TO 214;

CREATE GENERATOR GEN_HOSPITALS_ID;
SET GENERATOR GEN_HOSPITALS_ID TO 9;

CREATE GENERATOR GEN_NUID_ID;
SET GENERATOR GEN_NUID_ID TO 984;

CREATE GENERATOR GEN_PATIENTS_ID;
SET GENERATOR GEN_PATIENTS_ID TO 4;

CREATE GENERATOR GEN_RULES_ID;
SET GENERATOR GEN_RULES_ID TO 53;

CREATE GENERATOR GEN_TEMPLATES_ID;
SET GENERATOR GEN_TEMPLATES_ID TO 12;

CREATE GENERATOR GEN_USERS_ID;
SET GENERATOR GEN_USERS_ID TO 116;

CREATE GENERATOR GEN_WORKLIST_ID;
SET GENERATOR GEN_WORKLIST_ID TO 3;

CREATE GENERATOR IBE$TODO_ITEM_ID_GEN;
SET GENERATOR IBE$TODO_ITEM_ID_GEN TO 0;



SET TERM ^ ; 



/******************************************************************************/
/***                           Stored Procedures                            ***/
/******************************************************************************/

CREATE PROCEDURE GET_STUDYUID
RETURNS (
    RNAME CHAR(50),
    PNUMBER CHAR(50))
AS
BEGIN
  SUSPEND;
END^





CREATE PROCEDURE SP_GEN_DIAGNOZ_ID
RETURNS (
    ID INTEGER)
AS
BEGIN
  SUSPEND;
END^






SET TERM ; ^



/******************************************************************************/
/***                                 Tables                                 ***/
/******************************************************************************/



CREATE TABLE APPLYTABLE (
    IDFIELD          CHAR(64) NOT NULL,
    NAMEFIELD        VARCHAR(100),
    ENAMEFIELD       VARCHAR(100),
    APPLY_TIME       TIMESTAMP,
    UIDFIELD         CHAR(70),
    BIRTHDATEFIELD   TIMESTAMP,
    SEXFIELD         CHAR(4),
    DOCTORFIELD      CHAR(16),
    DESCFIELD        CHAR(40),
    BSTATE           INTEGER,
    PROF             INTEGER,
    WARD             CHAR(16),
    MODALITY         CHAR(4),
    P_PID            CHAR(20),
    ACCESSIONNUMBER  CHAR(20),
    BODYPART         VARCHAR(30)
);

CREATE TABLE CNS_DICOMDISPLAY (
    MODALITY    CHAR(8) NOT NULL,
    W_POSITION  CHAR(4) NOT NULL,
    DISPLAY_ID  INTEGER NOT NULL,
    GROUP_ID    INTEGER NOT NULL,
    ELEMENT_ID  INTEGER NOT NULL,
    TITLE       CHAR(24),
    CALLEDAE    CHAR(1)
);

CREATE TABLE CNS_LOOKUP_TABLE (
    LUT_NAME  CHAR(20) NOT NULL,
    LUT_DATA  BLOB SUB_TYPE 0
);

CREATE TABLE CNS_MODILITY (
    PROF                       CHAR(20) NOT NULL,
    MODALITY                   CHAR(8),
    GROUPNAME                  CHAR(20),
    WORDCLASSIFY               CHAR(20),
    MWLFILTER                  CHAR(200),
    DISPLAYMODE                CHAR(20),
    DISPLAYFONT                INTEGER,
    AUTOGRID                   CHAR(1),
    DISPLAYROWS                INTEGER,
    DISPLAYCOLUMNS             INTEGER,
    DEFAULTDISPLAYINFO         CHAR(1),
    PRINTDPI                   CHAR(10),
    CANDICOMPRINT              CHAR(1),
    DEFAULTDISPLAYMODE         CHAR(10),
    FUNCTION2                  CHAR(1),
    CANDELETEIMAGE             CHAR(1),
    CAPTURE_SAVE_MODE          CHAR(4),
    CUT_SAVE_MODE              CHAR(4),
    IMAGE_SOURCE               CHAR(16),
    REPORT_SOURCE              CHAR(12),
    REPORT_SOURCE_OBJECTNAME   CHAR(40),
    REPORT_SOURCE_OBJECTNAME1  CHAR(40),
    REPORT_SOURCE_OBJECTNAME2  CHAR(40),
    REPORT_FILTER1             CHAR(200),
    REPORT_FILTER2             CHAR(200),
    REPORT_CLASSIFY            CHAR(200)
);

CREATE TABLE CNS_USERSETTING (
    USERNAME     CHAR(20) NOT NULL,
    SECTIONNAME  CHAR(20) NOT NULL,
    ITEMNAME     CHAR(24) NOT NULL,
    STRINGVALUE  CHAR(250)
);

CREATE TABLE CNS_WINDOWS_SELF (
    MODALITY        CHAR(2) NOT NULL,
    PARTNAME        CHAR(24) NOT NULL,
    WINDOW_WIDTH1   INTEGER,
    WINDOWS_LEVEL1  INTEGER,
    WINDOW_WIDTH2   INTEGER,
    WINDOWS_LEVEL2  INTEGER,
    WINDOW_WIDTH3   INTEGER,
    WINDOWS_LEVEL3  INTEGER
);

CREATE TABLE CONCLUSIONS (
    FK_ID        INTEGER NOT NULL,
    FD_DATE      TIMESTAMP,
    FK_USERID    INTEGER,
    FC_NOTES     BLOB SUB_TYPE 1 SEGMENT SIZE 80,
    FK_STUDYUID  VARCHAR(80) NOT NULL
);

CREATE TABLE DEVICES (
    FK_ID        INTEGER NOT NULL,
    FC_IP        CHAR(100),
    FN_PORT      INTEGER,
    FC_TITLE     CHAR(15),
    FC_COMMENT   VARCHAR(250),
    FN_TYPE      INTEGER,
    FN_TRANSFER  INTEGER
);

CREATE TABLE DIAGNOZ (
    FK_ID        INTEGER NOT NULL,
    FK_PARENTID  INTEGER,
    FC_NAME      VARCHAR(50),
    FN_POSN      SMALLINT
);

CREATE TABLE DICOMPRINTER (
    NAME               CHAR(20) NOT NULL,
    IPADDRESS          CHAR(15),
    PRINTPORT          INTEGER,
    CALLINGAE          CHAR(24),
    CALLEDAE           CHAR(24),
    MAGNIFICATIONTYPE  CHAR(24),
    SMOOTHINGTYPE      CHAR(24),
    POLARITYTYPE       CHAR(24),
    BORDERDENSITY      CHAR(24),
    EMPTYIMAGEDENSITY  CHAR(24),
    TRIMTYPE           CHAR(24),
    MINDENSITY         INTEGER,
    MAXDENSITY         INTEGER,
    MEDIUMTYPE         CHAR(24),
    FILMDESTINATION    CHAR(24),
    COPIES             INTEGER,
    DEFAULTFORMAT      CHAR(24),
    FILMDIRECTION      CHAR(24),
    RESOLUTION         CHAR(24),
    PRIORI             CHAR(24),
    FILMSIZE           CHAR(24)
);

CREATE TABLE EVENTS (
    FK_ID      INTEGER NOT NULL,
    FC_NAME    VARCHAR(255),
    FN_TYPE    INTEGER,
    FD_DATE    TIMESTAMP,
    FC_REMARK  VARCHAR(10000)
);

CREATE TABLE EVENTS_RSND (
    FK_ID               INTEGER NOT NULL,
    FN_TYPE             SMALLINT,
    FC_CALLINGTITLE     VARCHAR(20),
    FC_CALLEDTITLE      VARCHAR(20),
    FC_STUDYUID         VARCHAR(80),
    FC_MODALITY         VARCHAR(4),
    FD_STUDYDATE        DATE,
    FD_DATE             DATE,
    FN_AMM              INTEGER,
    FN_AMM_ERR          INTEGER,
    FC_PATIENTID        VARCHAR(20),
    FC_PATIENTNAME      VARCHAR(250),
    FC_ENAME            VARCHAR(250),
    FC_ACCESSIONNUMBER  VARCHAR(100)
);

CREATE TABLE EVENTS_RSND_ERR_LST (
    FK_ID_RSND         INTEGER,
    FC_STUDYUID        VARCHAR(80),
    FC_INSTANCEUID     VARCHAR(80),
    FC_COMM            VARCHAR(250),
    FN_TRANSFERSYNTAX  INTEGER,
    FC_CALLEDTITLE     VARCHAR(20)
);

CREATE TABLE EVENTS_WL (
    FK_ID      INTEGER NOT NULL,
    FC_NAME    VARCHAR(255),
    FN_TYPE    INTEGER,
    FD_DATE    TIMESTAMP,
    FC_REMARK  VARCHAR(10000)
);

CREATE TABLE HOSPITALS (
    P_ID                INTEGER NOT NULL,
    FC_NAME             VARCHAR(100) NOT NULL,
    FN_TYPE             SMALLINT NOT NULL,
    STUDIES_IMAGE_TYPE  CHAR(4),
    FN_PARENTID         INTEGER NOT NULL
);

CREATE TABLE IBE$TODO (
    ITEM_ID             INTEGER NOT NULL,
    OBJECT_NAME         VARCHAR(64) CHARACTER SET UNICODE_FSS,
    OBJECT_TYPE         INTEGER,
    ITEM_PRIORITY       SMALLINT DEFAULT 0 NOT NULL,
    ITEM_STATE          SMALLINT DEFAULT 0 NOT NULL,
    ITEM_CAPTION        VARCHAR(255) NOT NULL,
    ITEM_DESCRIPTION    BLOB SUB_TYPE 1 SEGMENT SIZE 80,
    RESPONSIBLE_PERSON  VARCHAR(64),
    ITEM_TIMESTAMP      TIMESTAMP NOT NULL,
    ITEM_DEADLINE       TIMESTAMP,
    ITEM_CATEGORY       VARCHAR(64),
    ITEM_OWNER          VARCHAR(64) CHARACTER SET UNICODE_FSS NOT NULL
);

CREATE TABLE IMAGE_CHANNELS (
    DESCRIPTION    CHAR(32) NOT NULL,
    CALLEDAET      CHAR(40),
    HOSTNAME       CHAR(40) NOT NULL,
    DICOMPORT      INTEGER NOT NULL,
    ICPORT         INTEGER,
    TIMEOUTSEC     INTEGER,
    DEFAULTDEVICE  CHAR(2),
    LOADIMAGEMODE  INTEGER
);

CREATE TABLE IMAGES (
    STUDYUID             CHAR(80) NOT NULL,
    SERIESUID            CHAR(80) NOT NULL,
    INSTANCEUID          CHAR(80) NOT NULL,
    IMGNO                INTEGER NOT NULL,
    IMAGETYPE            CHAR(4),
    SIZEX                INTEGER,
    SIZEY                INTEGER,
    PHOTOMETRIC          CHAR(24),
    BITS                 INTEGER,
    ABITS                INTEGER,
    BITS_PER_SAMPLE      INTEGER,
    IMAGEDATE            TIMESTAMP,
    STUDIESDATE          TIMESTAMP,
    SELECTEDINDEX        INTEGER,
    SELECTEDINDEX1       INTEGER,
    SELECTEDINDEX2       INTEGER,
    SELECTEDINDEX3       INTEGER,
    IMAGEFLAG            CHAR(80),
    P_PID                CHAR(80),
    LAST_WINDOWS_CENTER  INTEGER,
    LAST_WINDOWS_WIDTH   INTEGER,
    LAST_UPDATE_TIME     TIMESTAMP,
    ACCESSIONNUMBER      CHAR(100),
    IMAGESIZE            INTEGER
);

CREATE TABLE LAYOUT_TABLE (
    NAME        CHAR(20) NOT NULL,
    LAYOUTDATA  BLOB SUB_TYPE 0,
    MODALITY    CHAR(2)
);

CREATE TABLE MODILITY_SETTING (
    PROF               CHAR(20) NOT NULL,
    MODALITY           CHAR(8) NOT NULL,
    GROUPNAME          CHAR(20),
    WORDCLASSIFY       CHAR(20),
    DEFAULTPRESET      CHAR(20),
    MWLFILTER          CHAR(200),
    DISPLAYINFO        CHAR(1),
    DISPLAYMODE        CHAR(20),
    INFO_FONT          INTEGER,
    INFO_FONT_WIDTH    CHAR(20),
    IMAGE_AUTOGRID     CHAR(1),
    IMAGE_ROWS         INTEGER,
    IMAGE_COLUMNS      INTEGER,
    SERIES_AUTOGRID    CHAR(1),
    SERIES_ROWS        INTEGER,
    SERIES_COLUMNS     INTEGER,
    CANDICOMPRINT      CHAR(1),
    PRINTDPI           CHAR(10),
    FILMSIZE           CHAR(20),
    PRINT_ROWS         INTEGER,
    PRINT_COLUMNS      INTEGER,
    IMAGEPOSITIONMARK  CHAR(1),
    CANDELETEIMAGE     CHAR(1),
    CAPTURE_SAVE_MODE  CHAR(10),
    CUT_SAVE_MODE      CHAR(10),
    IMAGE_SOURCE       CHAR(16),
    DEFAULTLAYOUT      CHAR(20)
);

CREATE TABLE PARAMS (
    FC_SECTION  VARCHAR(100),
    FC_KEY      VARCHAR(100),
    FC_VALUE    VARCHAR(1000)
);

CREATE TABLE PATIENTS (
    P_ENAME      CHAR(255),
    P_SEX        CHAR(4),
    P_PID        CHAR(20) NOT NULL,
    P_DATEBORN   TIMESTAMP,
    P_FAM        CHAR(255),
    P_IM         CHAR(255),
    P_OTCH       CHAR(255),
    P_ENAME_RUS  CHAR(255)
);

CREATE TABLE REMOTE_DEVICES (
    DESCRIPTION    CHAR(32) NOT NULL,
    CALLEDAET      CHAR(40),
    HOSTNAME       CHAR(40) NOT NULL,
    DICOMPORT      INTEGER NOT NULL,
    HOSTTYPE       CHAR(32) NOT NULL,
    DEFAULTDEVICE  CHAR(2),
    LOADIMAGEMODE  INTEGER
);

CREATE TABLE RULES (
    FK_ID            INTEGER NOT NULL,
    FK_DEVICEID      INTEGER,
    FK_DEVICEID2     INTEGER,
    FC_MOD           VARCHAR(2),
    FN_COMPRESS      INTEGER,
    FN_PRC_COMPRESS  SMALLINT
);

CREATE TABLE SERIES (
    STUDYUID            CHAR(80) NOT NULL,
    SERIESUID           CHAR(80) NOT NULL,
    SERIES_IMAGETYPE    CHAR(4),
    SERIES_IMAGE_COUNT  INTEGER,
    SERIES_DESC         CHAR(80),
    ACCESSIONNUMBER     CHAR(100),
    SERIES_DATE         TIMESTAMP
);

CREATE TABLE STUDIES (
    STUDYUID                     CHAR(80) NOT NULL,
    P_ENAME                      CHAR(50),
    P_SEX                        CHAR(4),
    P_PID                        CHAR(20),
    STUDYID                      CHAR(50),
    PEER_IP                      CHAR(20),
    BSTATE                       INTEGER,
    LDATE                        TIMESTAMP NOT NULL,
    BACKUPTIME                   TIMESTAMP,
    BACKUPVAL                    CHAR(20),
    STUDY_IMAGE_COUNT            INTEGER,
    STUDIES_IMAGE_TYPE           CHAR(4),
    RPHYS                        CHAR(20),
    OPNAME                       CHAR(20),
    PERFORMPHYS                  CHAR(20),
    CALLING_AE_TITLE             CHAR(16),
    STUDYDESCRIPTION             CHAR(80),
    INSTITUTIONALDEPARTMENTNAME  CHAR(80),
    REFERRINGPHYSICIANNAME       CHAR(80),
    REPORTSTATE                  INTEGER,
    PRINTSTATE                   INTEGER,
    P_AGE                        CHAR(4),
    P_DOB                        CHAR(4),
    P_DATEBORN                   TIMESTAMP,
    P_ENAME_RUS                  CHAR(50),
    STATUS                       INTEGER,
    ACCESSIONNUMBER              CHAR(100),
    NAME_DISC                    CHAR(50),
    ACTUALITY                    SMALLINT,
    FC_AEAPPARAT                 VARCHAR(15),
    FC_MNDIAGNOS                 BLOB SUB_TYPE 1 SEGMENT SIZE 1024,
    FC_ADDDIAGNOS                BLOB SUB_TYPE 1 SEGMENT SIZE 1024,
    FK_IDOSNDIAG                 INTEGER,
    FK_IDDOPDIAG                 INTEGER,
    STUDYUID_OLD                 CHAR(80)
);

CREATE TABLE STUDYDOCS (
    STUDYUID  CHAR(80),
    FDATE     DATE,
    FCOMMENT  VARCHAR(50),
    F_FILE    BLOB SUB_TYPE 0 SEGMENT SIZE 80,
    FC_LOGIN  VARCHAR(50),
    F_ID      INTEGER NOT NULL
);

CREATE TABLE TAGS (
    FC_TITLE               CHAR(15) NOT NULL,
    FC_IMAGETYPE_1         CHAR(5),
    FC_IMAGETYPE_2         CHAR(5),
    FC_STUDYID_1           CHAR(5),
    FC_STUDYID_2           CHAR(5),
    FC_PATIENTID_1         CHAR(5),
    FC_PATIENTID_2         CHAR(5),
    FC_STUDYDESCRIPTION_1  CHAR(5),
    FC_STUDYDESCRIPTION_2  CHAR(5),
    FC_ACCESSIONNUMBER_1   CHAR(5),
    FC_ACCESSIONNUMBER_2   CHAR(5),
    FC_DA_1                CHAR(5),
    FC_DA_2                CHAR(5),
    FC_DT_1                CHAR(5),
    FC_DT_2                CHAR(5),
    FC_STUDYUID_1          CHAR(5),
    FC_STUDYUID_2          CHAR(5),
    FC_SERIESUID_1         CHAR(5),
    FC_SERIESUID_2         CHAR(5),
    FC_SERNUM_1            CHAR(5),
    FC_SERNUM_2            CHAR(5),
    FC_PHYSNAME_1          CHAR(5),
    FC_PHYSNAME_2          CHAR(5),
    FC_PNAME_1             CHAR(5),
    FC_PNAME_2             CHAR(5),
    FC_PDATEBORN_1         CHAR(5),
    FC_PDATEBORN_2         CHAR(5),
    FC_PSEX_1              CHAR(5),
    FC_PSEX_2              CHAR(5),
    FC_AID_1               CHAR(5),
    FC_AID_2               CHAR(5),
    FC_ACQNUM_1            CHAR(5),
    FC_ACQNUM_2            CHAR(5),
    FC_INSTANCEUID_1       CHAR(5),
    FC_INSTANCEUID_2       CHAR(5),
    FC_KIN_1               CHAR(5),
    FC_KIN_2               CHAR(5)
);

CREATE TABLE TEMPLATES (
    FK_ID               INTEGER NOT NULL,
    STUDIES_IMAGE_TYPE  CHAR(4),
    FC_NOTES            BLOB SUB_TYPE 1 SEGMENT SIZE 80,
    FC_COMM             VARCHAR(100) NOT NULL,
    FN_IS_DEL           SMALLINT
);

CREATE TABLE USERS (
    FC_LOGIN            VARCHAR(50) NOT NULL,
    FC_FAM              VARCHAR(100),
    FC_IM               VARCHAR(100),
    FC_OTCH             VARCHAR(100),
    FD_ROJD             TIMESTAMP,
    FC_ADDRESS          VARCHAR(150),
    FC_TEL              VARCHAR(100),
    FN_ADM              INTEGER,
    FN_DEL              INTEGER,
    FK_ID               INTEGER NOT NULL,
    FN_ISWADO           SMALLINT,
    FN_ISQUERIES        SMALLINT,
    FN_ISCONCL          SMALLINT,
    FC_FIRMA            VARCHAR(100),
    FC_DOLJN            VARCHAR(50),
    FC_USLUGI           VARCHAR(250),
    FC_SPECIALIZATIONS  VARCHAR(250),
    FN_CR               SMALLINT,
    FN_DX               SMALLINT,
    FN_IO               SMALLINT,
    FN_MR               SMALLINT,
    FN_OT               SMALLINT,
    FN_SC               SMALLINT,
    FN_XA               SMALLINT,
    FN_CT               SMALLINT,
    FN_ES               SMALLINT,
    FN_MG               SMALLINT,
    FN_NM               SMALLINT,
    FN_PX               SMALLINT,
    FN_RG               SMALLINT,
    FN_US               SMALLINT,
    FN_XC               SMALLINT,
    FN_RF               SMALLINT
);

CREATE TABLE WINDOWS_PRESET (
    MODALITY       CHAR(2) NOT NULL,
    PARTNAME       CHAR(24) NOT NULL,
    HOTKEY         CHAR(24) NOT NULL,
    WINDOW_WIDTH   INTEGER,
    WINDOWS_LEVEL  INTEGER
);

CREATE TABLE WORKLIST (
    P_ENAME          CHAR(255),
    P_SEX            CHAR(4),
    P_PID            CHAR(20) NOT NULL,
    P_DATEBORN       TIMESTAMP,
    P_FAM            CHAR(255),
    P_IM             CHAR(255),
    P_OTCH           CHAR(255),
    P_ENAME_RUS      CHAR(255),
    P_PATIENTSEX     CHAR(3),
    ACCESSIONNUMBER  CHAR(100),
    MODALITY         CHAR(5),
    P_AETITLE        CHAR(15) NOT NULL,
    STUDYUID         CHAR(80),
    P_ST_DT          TIMESTAMP,
    STATUS           SMALLINT,
    FK_ID            INTEGER NOT NULL
);



/* Check constraints definition */

ALTER TABLE IBE$TODO ADD CHECK ((ITEM_PRIORITY >=0) AND (ITEM_PRIORITY <=5));
ALTER TABLE IBE$TODO ADD CHECK (ITEM_STATE IN (0, 1));


/******************************************************************************/
/***                              Primary Keys                              ***/
/******************************************************************************/

ALTER TABLE APPLYTABLE ADD CONSTRAINT PK_APPLYTABLE PRIMARY KEY (IDFIELD);
ALTER TABLE CNS_DICOMDISPLAY ADD PRIMARY KEY (MODALITY, W_POSITION, DISPLAY_ID);
ALTER TABLE CNS_LOOKUP_TABLE ADD PRIMARY KEY (LUT_NAME);
ALTER TABLE CNS_MODILITY ADD PRIMARY KEY (PROF);
ALTER TABLE CNS_USERSETTING ADD PRIMARY KEY (USERNAME, SECTIONNAME, ITEMNAME);
ALTER TABLE CNS_WINDOWS_SELF ADD PRIMARY KEY (MODALITY, PARTNAME);
ALTER TABLE CONCLUSIONS ADD CONSTRAINT PK_CONCLUSIONS PRIMARY KEY (FK_ID);
ALTER TABLE DEVICES ADD CONSTRAINT PK_DEVICES PRIMARY KEY (FK_ID);
ALTER TABLE DICOMPRINTER ADD PRIMARY KEY (NAME);
ALTER TABLE EVENTS ADD CONSTRAINT PK_EVENTS PRIMARY KEY (FK_ID);
ALTER TABLE EVENTS_RSND ADD CONSTRAINT PK_EVENTS_RSND PRIMARY KEY (FK_ID);
ALTER TABLE EVENTS_WL ADD CONSTRAINT PK_EVENTS_WL PRIMARY KEY (FK_ID);
ALTER TABLE IBE$TODO ADD PRIMARY KEY (ITEM_ID);
ALTER TABLE IMAGES ADD PRIMARY KEY (INSTANCEUID);
ALTER TABLE IMAGE_CHANNELS ADD PRIMARY KEY (DESCRIPTION);
ALTER TABLE LAYOUT_TABLE ADD PRIMARY KEY (NAME);
ALTER TABLE MODILITY_SETTING ADD PRIMARY KEY (PROF);
ALTER TABLE PATIENTS ADD PRIMARY KEY (P_PID);
ALTER TABLE REMOTE_DEVICES ADD PRIMARY KEY (DESCRIPTION);
ALTER TABLE RULES ADD CONSTRAINT PK_RULES PRIMARY KEY (FK_ID);
ALTER TABLE SERIES ADD PRIMARY KEY (SERIESUID);
ALTER TABLE STUDIES ADD PRIMARY KEY (STUDYUID);
ALTER TABLE STUDYDOCS ADD PRIMARY KEY (F_ID);
ALTER TABLE TAGS ADD CONSTRAINT PK_TAGS PRIMARY KEY (FC_TITLE);
ALTER TABLE TEMPLATES ADD CONSTRAINT PK_TEMPLATES PRIMARY KEY (FK_ID);
ALTER TABLE WINDOWS_PRESET ADD PRIMARY KEY (MODALITY, PARTNAME);
ALTER TABLE WORKLIST ADD PRIMARY KEY (FK_ID);


/******************************************************************************/
/***                                Indices                                 ***/
/******************************************************************************/

CREATE INDEX CNS_DICOMDISPLAY_GROUP_ID ON CNS_DICOMDISPLAY (GROUP_ID);
CREATE INDEX CNS_MODILITY_GROUPNAME ON CNS_MODILITY (GROUPNAME);
CREATE INDEX CNS_MODILITY_MODALITY ON CNS_MODILITY (MODALITY);
CREATE INDEX CONCLUSIONS_IDX1 ON CONCLUSIONS (FK_USERID);
CREATE INDEX CONCLUSIONS_IDX2 ON CONCLUSIONS (FK_STUDYUID);
CREATE UNIQUE INDEX DIAGNOZ_IDX1 ON DIAGNOZ (FK_ID);
CREATE INDEX DIAGNOZ_IDX2 ON DIAGNOZ (FK_PARENTID);
CREATE INDEX DIAGNOZ_IDX3 ON DIAGNOZ (FC_NAME);
CREATE INDEX EVENTS_IDX1 ON EVENTS (FD_DATE);
CREATE INDEX EVENTS_RSND_ERR_LST_IDX1 ON EVENTS_RSND_ERR_LST (FK_ID_RSND, FC_STUDYUID, FC_CALLEDTITLE);
CREATE INDEX IBE$TODO_BY_OBJECTNAME ON IBE$TODO (OBJECT_NAME);
CREATE INDEX IMAGES_AN ON IMAGES (ACCESSIONNUMBER);
CREATE INDEX IMAGES_IDX1 ON IMAGES (STUDYUID);
CREATE INDEX IMAGES_IDX2 ON IMAGES (P_PID);
CREATE INDEX MODILITY_SETTING_GROUPNAME ON MODILITY_SETTING (GROUPNAME);
CREATE INDEX MODILITY_SETTING_MODALITY ON MODILITY_SETTING (MODALITY);
CREATE INDEX PARAMS_KEY ON PARAMS (FC_KEY);
CREATE INDEX PARAMS_SECTION ON PARAMS (FC_SECTION);
CREATE INDEX SERIES_AN ON SERIES (ACCESSIONNUMBER);
CREATE INDEX STUDIES_IDX1 ON STUDIES (FK_IDOSNDIAG);
CREATE INDEX STUDIES_IDX2 ON STUDIES (FK_IDDOPDIAG);
CREATE INDEX STUDIES_IDX3 ON STUDIES (STUDYUID_OLD);
CREATE INDEX STUDYDOCS_IDX1 ON STUDYDOCS (STUDYUID);
CREATE INDEX USERS_IDX1 ON USERS (FC_LOGIN, FN_DEL);
CREATE INDEX USERS_IDX2 ON USERS (FK_ID);


/******************************************************************************/
/***                                Triggers                                ***/
/******************************************************************************/


SET TERM ^ ;



/******************************************************************************/
/***                          Triggers for tables                           ***/
/******************************************************************************/



/* Trigger: CONCLUSIONS_BI0 */
CREATE TRIGGER CONCLUSIONS_BI0 FOR CONCLUSIONS
ACTIVE BEFORE INSERT POSITION 0
AS
begin
  if (new.fk_id is null) then
  begin
    new.fk_id = gen_id(GEN_conclusions_ID, 1);
  end
end
^

/* Trigger: DEVICES_BI0 */
CREATE TRIGGER DEVICES_BI0 FOR DEVICES
ACTIVE BEFORE INSERT POSITION 0
AS
begin
  if (new.fk_id is null) then
  begin
    new.fk_id = gen_id(GEN_DEVICES_ID, 1);
  end
end
^

/* Trigger: DIAGNOZ_BI */
CREATE TRIGGER DIAGNOZ_BI FOR DIAGNOZ
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.fk_id is null) then
    new.fk_id = gen_id(gen_diagnoz_id,1);
end
^

/* Trigger: EVENTS_BI0 */
CREATE TRIGGER EVENTS_BI0 FOR EVENTS
ACTIVE BEFORE INSERT POSITION 0
AS
begin
  if (new.fk_id is null) then
  begin
    new.fk_id = gen_id(GEN_EVENTS_ID, 1);
  end
end
^

/* Trigger: EVENTS_RSND_BD0 */
CREATE TRIGGER EVENTS_RSND_BD0 FOR EVENTS_RSND
ACTIVE BEFORE DELETE POSITION 0
AS
begin
  delete from EVENTS_RSND_ERR_LST where FK_ID_RSND=old.FK_ID;
end
^

/* Trigger: EVENTS_RSND_BI0 */
CREATE TRIGGER EVENTS_RSND_BI0 FOR EVENTS_RSND
ACTIVE BEFORE INSERT POSITION 0
AS
begin
  if (new.fk_id is null) then
  begin
    new.fk_id = gen_id(GEN_EVENTS_RSND_ID, 1);
  end
end
^

/* Trigger: EVENTS_WL_BI0 */
CREATE TRIGGER EVENTS_WL_BI0 FOR EVENTS_WL
ACTIVE BEFORE INSERT POSITION 0
AS
begin
  if (new.fk_id is null) then
  begin
    new.fk_id = gen_id(GEN_EVENTSWL_ID, 1);
  end
end
^

/* Trigger: HOSPITALS_BI0 */
CREATE TRIGGER HOSPITALS_BI0 FOR HOSPITALS
ACTIVE BEFORE INSERT POSITION 0
AS
begin
  if (new.P_ID is null) then
  begin
    new.P_ID = gen_id(GEN_HOSPITALS_ID, 1);
  end
end
^

/* Trigger: PATIENTS_BD0 */
CREATE TRIGGER PATIENTS_BD0 FOR PATIENTS
ACTIVE BEFORE DELETE POSITION 0
AS
begin
  delete from studies where p_pid = old.p_pid;
end
^

/* Trigger: RULES_BI0 */
CREATE TRIGGER RULES_BI0 FOR RULES
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW.FK_ID IS NULL) THEN
    NEW.FK_ID = GEN_ID(GEN_RULES_ID,1);
END
^

/* Trigger: STUDIES_BD0 */
CREATE TRIGGER STUDIES_BD0 FOR STUDIES
ACTIVE BEFORE DELETE POSITION 0
AS
begin
  DELETE FROM SERIES WHERE STUDYUID = OLD.STUDYUID;
  DELETE FROM IMAGES WHERE STUDYUID = OLD.STUDYUID;
  DELETE from studydocs WHERE STUDYUID = OLD.STUDYUID;
end
^

/* Trigger: TEMPLATES_BI0 */
CREATE TRIGGER TEMPLATES_BI0 FOR TEMPLATES
ACTIVE BEFORE INSERT POSITION 0
AS
begin
  if (new.fk_id is null) then
  begin
    new.fk_id = gen_id(GEN_TEMPLATES_ID, 1);
    new.FN_IS_DEL = 0;
  end
end
^

/* Trigger: USERS_BI0 */
CREATE TRIGGER USERS_BI0 FOR USERS
ACTIVE BEFORE INSERT POSITION 0
AS
begin
  if (new.fk_id is null) then
  begin
    new.fk_id = gen_id(GEN_USERS_ID, 1);
    new.FN_DEL = 0;
  end
end
^

/* Trigger: WORKLIST_BI0 */
CREATE TRIGGER WORKLIST_BI0 FOR WORKLIST
ACTIVE BEFORE INSERT POSITION 0
AS
begin
  if (new.fk_id is null) then
  begin
    new.fk_id = gen_id(GEN_WORKLIST_ID, 1);
  end
end
^

SET TERM ; ^



/******************************************************************************/
/***                           Stored Procedures                            ***/
/******************************************************************************/


SET TERM ^ ;

ALTER PROCEDURE GET_STUDYUID
RETURNS (
    RNAME CHAR(50),
    PNUMBER CHAR(50))
AS
declare c cursor for (select accessionnumber, studyuid from studies);
BEGIN
  OPEN C;
--  FETCH C INTO :pnumber, :RNAME;
  WHILE (ROW_COUNT < 100) DO
  BEGIN
    FETCH C INTO :pnumber, :RNAME;
    update series set accessionnumber = :pnumber where studyuid = :rname;
    SUSPEND;
  END
  CLOSE C;
END^


ALTER PROCEDURE SP_GEN_DIAGNOZ_ID
RETURNS (
    ID INTEGER)
AS
begin
  id = gen_id(gen_diagnoz_id, 1);
  suspend;
end^



SET TERM ; ^


/******************************************************************************/
/***                              Descriptions                              ***/
/******************************************************************************/

DESCRIBE TABLE EVENTS
'������� ������� PACS-�������';

DESCRIBE TABLE EVENTS_WL
'������� ������� WL-������� Created by Prihodko N. 16.05.2012';

DESCRIBE TABLE RULES
'������� ������ ���������';

DESCRIBE TABLE USERS
'������� �������������';



/******************************************************************************/
/***                          Fields descriptions                           ***/
/******************************************************************************/

DESCRIBE FIELD IDFIELD TABLE APPLYTABLE
'���������� id ������';

DESCRIBE FIELD NAMEFIELD TABLE APPLYTABLE
'��� (eng)';

DESCRIBE FIELD ENAMEFIELD TABLE APPLYTABLE
'��� (rus)';

DESCRIBE FIELD APPLY_TIME TABLE APPLYTABLE
'����,����� ������������';

DESCRIBE FIELD UIDFIELD TABLE APPLYTABLE
'UID';

DESCRIBE FIELD BIRTHDATEFIELD TABLE APPLYTABLE
'���� ��������';

DESCRIBE FIELD SEXFIELD TABLE APPLYTABLE
'���';

DESCRIBE FIELD DOCTORFIELD TABLE APPLYTABLE
'����';

DESCRIBE FIELD DESCFIELD TABLE APPLYTABLE
'��������';

DESCRIBE FIELD BSTATE TABLE APPLYTABLE
'������ ������������ :
1 - � ��������
2 - ���������';

DESCRIBE FIELD MODALITY TABLE APPLYTABLE
'MODALITY';

DESCRIBE FIELD P_PID TABLE APPLYTABLE
'PatientID';

DESCRIBE FIELD ACCESSIONNUMBER TABLE APPLYTABLE
'ACCESSIONNUMBER';

DESCRIBE FIELD BODYPART TABLE APPLYTABLE
'����� ����';

DESCRIBE FIELD FK_ID TABLE CONCLUSIONS
'PK - ��������� ����';

DESCRIBE FIELD FD_DATE TABLE CONCLUSIONS
'���� ����������';

DESCRIBE FIELD FK_USERID TABLE CONCLUSIONS
'������ �� ���� USERS.FK_ID';

DESCRIBE FIELD FC_NOTES TABLE CONCLUSIONS
'����� ����������';

DESCRIBE FIELD FK_STUDYUID TABLE CONCLUSIONS
'studyuid - ������ �� ������� study ���� studyUID';

DESCRIBE FIELD FN_TYPE TABLE DEVICES
'��� ���������� (1-������, 2-������� �������, 3-�������)';

DESCRIBE FIELD FN_TRANSFER TABLE DEVICES
'TRANSFER SYNTAX ������������� ��- ��������� ��� �������� ������� � PACS';

DESCRIBE FIELD FK_ID TABLE EVENTS
'���������� ID';

DESCRIBE FIELD FC_NAME TABLE EVENTS
'�������';

DESCRIBE FIELD FN_TYPE TABLE EVENTS
'��� �������
1 - ������ �������
2 - ��������� �������
3 - ������
4 - ������� �� �������
5 - ���������� ��������� �������';

DESCRIBE FIELD FD_DATE TABLE EVENTS
'���� �������';

DESCRIBE FIELD FC_REMARK TABLE EVENTS
'�������';

DESCRIBE FIELD FK_ID TABLE EVENTS_RSND
'PK';

DESCRIBE FIELD FN_TYPE TABLE EVENTS_RSND
'0 - �������� ���������  1 - ������';

DESCRIBE FIELD FC_CALLINGTITLE TABLE EVENTS_RSND
'AETITLE ����������� �������';

DESCRIBE FIELD FC_CALLEDTITLE TABLE EVENTS_RSND
'AETITLE ���� �� ����������';

DESCRIBE FIELD FC_STUDYUID TABLE EVENTS_RSND
'STUDYUID - UID ������������';

DESCRIBE FIELD FC_MODALITY TABLE EVENTS_RSND
'����������� ������������';

DESCRIBE FIELD FD_STUDYDATE TABLE EVENTS_RSND
'���� ������������';

DESCRIBE FIELD FD_DATE TABLE EVENTS_RSND
'���� ���������';

DESCRIBE FIELD FN_AMM TABLE EVENTS_RSND
'����� ������� � ������������';

DESCRIBE FIELD FN_AMM_ERR TABLE EVENTS_RSND
'����� ������� � �������� ��� ��������';

DESCRIBE FIELD FC_PATIENTID TABLE EVENTS_RSND
'id ��������';

DESCRIBE FIELD FC_PATIENTNAME TABLE EVENTS_RSND
'��� ��������';

DESCRIBE FIELD FC_ENAME TABLE EVENTS_RSND
'��� �������� ���';

DESCRIBE FIELD FC_ACCESSIONNUMBER TABLE EVENTS_RSND
'ACCESSIONNUMBER';

DESCRIBE FIELD FK_ID_RSND TABLE EVENTS_RSND_ERR_LST
'������ �� FK_id EVENTS_RSND';

DESCRIBE FIELD FC_STUDYUID TABLE EVENTS_RSND_ERR_LST
'STUDYUID
';

DESCRIBE FIELD FC_INSTANCEUID TABLE EVENTS_RSND_ERR_LST
'INSTANCEUID';

DESCRIBE FIELD FC_COMM TABLE EVENTS_RSND_ERR_LST
'����� ������
';

DESCRIBE FIELD FN_TRANSFERSYNTAX TABLE EVENTS_RSND_ERR_LST
'TRANSFERSYNTAX
.  .
������� � dcm_uid.pas � dicomVCL

PrivateTransferSyntax = 8192;
  ImplicitVRLittleEndian = 8193;
  ExplicitVRLittleEndian = 8194;
  ExplicitVRBigEndian = 8195;
  RLELossless = 8198;
  //JPEG_1 = 8196;
  JPEGBaseline = 8196;
  //JPEG_14_SelectionValue1 = 8197;
  JPEGLossless = 8197;
  JPEGExtendedProcess_2_4 = 8199;
  JPEG_3_5 = 8200;
  JPEG_6_8 = 8201;
  JPEG_7_9 = 8202;
  JPEG_10_12 = 8203;
  JPEG_11_13 = 8204;
  JPEGLossless14 = 8205;
  JPEGLossless15 = 8206;
  JPEG_16_18 = 8207;
  JPEG_17_19 = 8208;
  JPEG_20_22 = 8209;
  JPEG_21_23 = 8210;
  JPEG_24_26 = 8211;
  JPEG_25_27 = 8212;
  JPEG_28 = 8213;
  JPEG_29 = 8214;
  {$IFDEF ECLZLIBTransferSyntax}
  zlibFastestTransferSyntax = 8215;
  ppmFastestTransferSyntax = 8216;
  bzipFastestTransferSyntax = 8217;

  zlibMaxTransferSyntax = 8222;
  ppmMaxTransferSyntax = 8223;
  bzipMaxTransferSyntax = 8224;

  zlibNormalTransferSyntax = 8225;
  ppmNormalTransferSyntax = 8226;
  bzipNormalTransferSyntax = 8227;
  {$ENDIF}
  JPEGLossless80 = 8218;
  JPEGNearLossless81 = 8219;
  JPEG2000Irreversible = 8220; //.90 lossless
  JPEG2000Reversible = 8221; //.91 losy';

DESCRIBE FIELD FK_ID TABLE EVENTS_WL
'UID';

DESCRIBE FIELD FC_NAME TABLE EVENTS_WL
'�������';

DESCRIBE FIELD FN_TYPE TABLE EVENTS_WL
'��� ������� (1-DicomAssociation, 2-DicomFind)';

DESCRIBE FIELD FD_DATE TABLE EVENTS_WL
'���� �������';

DESCRIBE FIELD FC_REMARK TABLE EVENTS_WL
'�����������';

DESCRIBE FIELD P_ID TABLE HOSPITALS
'PK';

DESCRIBE FIELD FC_NAME TABLE HOSPITALS
'������������';

DESCRIBE FIELD FN_TYPE TABLE HOSPITALS
'1-������,
2-������,
3-�����,
4-�����,
5-���.�����,
6-���,
7-���������,
8-DICOM';

DESCRIBE FIELD STUDIES_IMAGE_TYPE TABLE HOSPITALS
'����������� - ��� DICOM ���������';

DESCRIBE FIELD FN_PARENTID TABLE HOSPITALS
'id ��������
';

DESCRIBE FIELD ACCESSIONNUMBER TABLE IMAGES
'Accession Number (����� ���������)';

DESCRIBE FIELD FC_SECTION TABLE PARAMS
'��� ������';

DESCRIBE FIELD FC_KEY TABLE PARAMS
'��� �����';

DESCRIBE FIELD FC_VALUE TABLE PARAMS
'��������';

DESCRIBE FIELD P_ENAME TABLE PATIENTS
'��� ��������';

DESCRIBE FIELD P_SEX TABLE PATIENTS
'��� ��������';

DESCRIBE FIELD P_PID TABLE PATIENTS
'����� ��������=����� ����������� �����';

DESCRIBE FIELD P_DATEBORN TABLE PATIENTS
'���� �������� ��������';

DESCRIBE FIELD P_FAM TABLE PATIENTS
'������� ��������';

DESCRIBE FIELD P_IM TABLE PATIENTS
'��� ��������';

DESCRIBE FIELD P_OTCH TABLE PATIENTS
'�������� ��������';

DESCRIBE FIELD FK_ID TABLE RULES
'UID';

DESCRIBE FIELD FK_DEVICEID TABLE RULES
'DEVICES.FK_ID - ���� ���������� ������';

DESCRIBE FIELD FK_DEVICEID2 TABLE RULES
'DEVICES.FK_ID - ������ ������ ������';

DESCRIBE FIELD FC_MOD TABLE RULES
'�����������';

DESCRIBE FIELD FN_COMPRESS TABLE RULES
'transfer syntax ��� ������ ������ ��� ��������
.   .
������� � dcm_uid.pas � dicomVCL
.   .
PrivateTransferSyntax = 8192;
  ImplicitVRLittleEndian = 8193;
  ExplicitVRLittleEndian = 8194;
  ExplicitVRBigEndian = 8195;
  RLELossless = 8198;
  //JPEG_1 = 8196;
  JPEGBaseline = 8196;
  //JPEG_14_SelectionValue1 = 8197;
  JPEGLossless = 8197;
  JPEGExtendedProcess_2_4 = 8199;
  JPEG_3_5 = 8200;
  JPEG_6_8 = 8201;
  JPEG_7_9 = 8202;
  JPEG_10_12 = 8203;
  JPEG_11_13 = 8204;
  JPEGLossless14 = 8205;
  JPEGLossless15 = 8206;
  JPEG_16_18 = 8207;
  JPEG_17_19 = 8208;
  JPEG_20_22 = 8209;
  JPEG_21_23 = 8210;
  JPEG_24_26 = 8211;
  JPEG_25_27 = 8212;
  JPEG_28 = 8213;
  JPEG_29 = 8214;
  {$IFDEF ECLZLIBTransferSyntax}
  zlibFastestTransferSyntax = 8215;
  ppmFastestTransferSyntax = 8216;
  bzipFastestTransferSyntax = 8217;

  zlibMaxTransferSyntax = 8222;
  ppmMaxTransferSyntax = 8223;
  bzipMaxTransferSyntax = 8224;

  zlibNormalTransferSyntax = 8225;
  ppmNormalTransferSyntax = 8226;
  bzipNormalTransferSyntax = 8227;
  {$ENDIF}
  JPEGLossless80 = 8218;
  JPEGNearLossless81 = 8219;
  JPEG2000Irreversible = 8220; //.90 lossless
  JPEG2000Reversible = 8221; //.91 losy';

DESCRIBE FIELD FN_PRC_COMPRESS TABLE RULES
'% ������
';

DESCRIBE FIELD ACCESSIONNUMBER TABLE SERIES
'AccessionNumber (����� ���������)';

DESCRIBE FIELD LDATE TABLE STUDIES
'StudyDate (���� ������������)';

DESCRIBE FIELD STATUS TABLE STUDIES
'Study Status
0 - server
1 - archive
2 - localbase';

DESCRIBE FIELD ACCESSIONNUMBER TABLE STUDIES
'Protocol Number (����� ���������)';

DESCRIBE FIELD NAME_DISC TABLE STUDIES
'Name of Disc';

DESCRIBE FIELD ACTUALITY TABLE STUDIES
'������������ ������������ (��� ������������)
�������� :
0-�� �����������
1-��������
2-�������
3-����������
4-�����������
';

DESCRIBE FIELD FC_AEAPPARAT TABLE STUDIES
'AEtitle �������� � �������� ������ ������������';

DESCRIBE FIELD FC_MNDIAGNOS TABLE STUDIES
'�������� �������';

DESCRIBE FIELD FC_ADDDIAGNOS TABLE STUDIES
'�������������� �������';

DESCRIBE FIELD STUDYUID TABLE STUDYDOCS
'studyuid - ������ �� ������������';

DESCRIBE FIELD FDATE TABLE STUDYDOCS
'���� ���������� ������';

DESCRIBE FIELD FCOMMENT TABLE STUDYDOCS
'�������� �����';

DESCRIBE FIELD F_FILE TABLE STUDYDOCS
'����';

DESCRIBE FIELD FC_LOGIN TABLE STUDYDOCS
'����� ������������';

DESCRIBE FIELD F_ID TABLE STUDYDOCS
'PK
';

DESCRIBE FIELD FC_TITLE TABLE TAGS
'AETITLE';

DESCRIBE FIELD FC_IMAGETYPE_1 TABLE TAGS
'����������� (CS Modality)';

DESCRIBE FIELD FC_STUDYID_1 TABLE TAGS
'ID ������������ (StudyID)';

DESCRIBE FIELD FC_PATIENTID_1 TABLE TAGS
'ID �������� (PatientID)';

DESCRIBE FIELD FC_STUDYDESCRIPTION_1 TABLE TAGS
'�����������-�������� � ������������ (Study Description)';

DESCRIBE FIELD FC_ACCESSIONNUMBER_1 TABLE TAGS
'����� ��������� ������������';

DESCRIBE FIELD FC_DA_1 TABLE TAGS
'���� ������������ (Study Date)';

DESCRIBE FIELD FC_DT_1 TABLE TAGS
'����� ������������ (Study Time)';

DESCRIBE FIELD FC_STUDYUID_1 TABLE TAGS
'Study Instance UID';

DESCRIBE FIELD FC_SERIESUID_1 TABLE TAGS
'Series Instanse UID';

DESCRIBE FIELD FC_SERNUM_1 TABLE TAGS
'Series Number';

DESCRIBE FIELD FK_ID TABLE TEMPLATES
'PK - ��������� ����';

DESCRIBE FIELD STUDIES_IMAGE_TYPE TABLE TEMPLATES
'�����������';

DESCRIBE FIELD FC_NOTES TABLE TEMPLATES
'����� �������';

DESCRIBE FIELD FC_COMM TABLE TEMPLATES
'�����������';

DESCRIBE FIELD FN_IS_DEL TABLE TEMPLATES
'(=1) - ������� ��������� ������
';

DESCRIBE FIELD FC_LOGIN TABLE USERS
'����� ������������';

DESCRIBE FIELD FC_FAM TABLE USERS
'������� ������������';

DESCRIBE FIELD FC_IM TABLE USERS
'��� ������������';

DESCRIBE FIELD FC_OTCH TABLE USERS
'�������� ������������ ';

DESCRIBE FIELD FD_ROJD TABLE USERS
'���� �������� ������������';

DESCRIBE FIELD FC_ADDRESS TABLE USERS
'����� ������������';

DESCRIBE FIELD FC_TEL TABLE USERS
'������� ������������';

DESCRIBE FIELD FN_ADM TABLE USERS
'������� �������� �� ������� ������ ������������ (0 - ���, 1 - ��)';

DESCRIBE FIELD FN_DEL TABLE USERS
'������� �������� (0 - �� ������, 1 - ������)';

DESCRIBE FIELD FK_ID TABLE USERS
'���������� �������������';

DESCRIBE FIELD FN_ISWADO TABLE USERS
'(=1) ������� ��� ������������ ������� ��� ���
';

DESCRIBE FIELD FN_ISQUERIES TABLE USERS
'����� ����������� ������� ������������ �� ����������
';

DESCRIBE FIELD FN_ISCONCL TABLE USERS
'����� ������ ���������� (=1)
������ �������� ���������� (=2)';

DESCRIBE FIELD FC_FIRMA TABLE USERS
'�����������';

DESCRIBE FIELD FC_DOLJN TABLE USERS
'���������
';

DESCRIBE FIELD FC_USLUGI TABLE USERS
'������ ��������������� �����';

DESCRIBE FIELD FC_SPECIALIZATIONS TABLE USERS
'������ �������������';

DESCRIBE FIELD FN_CR TABLE USERS
'������ �� ���� ����������� ��� ��������� ������������';

DESCRIBE FIELD FN_DX TABLE USERS
'������ �� ���� ����������� ��� ��������� ������������';

DESCRIBE FIELD FN_IO TABLE USERS
'������ �� ���� ����������� ��� ��������� ������������';

DESCRIBE FIELD FN_MR TABLE USERS
'������ �� ���� ����������� ��� ��������� ������������';

DESCRIBE FIELD FN_OT TABLE USERS
'������ �� ���� ����������� ��� ��������� ������������';

DESCRIBE FIELD FN_SC TABLE USERS
'������ �� ���� ����������� ��� ��������� ������������';

DESCRIBE FIELD FN_XA TABLE USERS
'������ �� ���� ����������� ��� ��������� ������������';

DESCRIBE FIELD FN_CT TABLE USERS
'������ �� ���� ����������� ��� ��������� ������������';

DESCRIBE FIELD FN_ES TABLE USERS
'������ �� ���� ����������� ��� ��������� ������������';

DESCRIBE FIELD FN_MG TABLE USERS
'������ �� ���� ����������� ��� ��������� ������������';

DESCRIBE FIELD FN_NM TABLE USERS
'������ �� ���� ����������� ��� ��������� ������������';

DESCRIBE FIELD FN_PX TABLE USERS
'������ �� ���� ����������� ��� ��������� ������������';

DESCRIBE FIELD FN_RG TABLE USERS
'������ �� ���� ����������� ��� ��������� ������������';

DESCRIBE FIELD FN_US TABLE USERS
'������ �� ���� ����������� ��� ��������� ������������';

DESCRIBE FIELD FN_XC TABLE USERS
'������ �� ���� ����������� ��� ��������� ������������';

DESCRIBE FIELD FN_RF TABLE USERS
'������ �� ���� ����������� ��� ��������� ������������';

