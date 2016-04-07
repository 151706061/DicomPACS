unit fdmMain;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle, ImgList, Db, OracleData, PKGTEDIZM, PKGTFARMGR, PKGTUCHGR, PKGTMEDIC,
  PKGTPOSTAV, PKGMEDSES, PKGMEDKART, PKGTMO, PkgInvopis, PkgPrihrash,
	frOLEExl, FR_Class, frXMLExl, PKGTREB, PKGTUCHGRTYPE, PkgSmini, PKGTKARTCOMPOS,
	PKGTKARTCOITEM,PKGTDOCS, uPkgProdCert, JvAppStorage,
  JvComponentBase, JvBalloonHint, FR_DSet, FR_DBSet,
  JvAppRegistryStorage, frxClass, frxDBSet, frxExportXLS,
  JvAppIniStorage, cxStyles, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, Menus, uParams,
  JvStringHolder,
  uDBTableUtils; //Add Malev A.V. 07/06/2013

//PKGSOTRRIGHT

const NullDate = -700000;
  Databaseus = 'ASU'; 

  VIDMOVE_PRIH_POST           = 1;
  VIDMOVE_NAKL_TREB           = 2;
  VIDMOVE_KARD_LIST           = 3; //1; // 3
  VIDMOVE_TO_REZERV           = 4; //2; // 4
  VIDMOVE_FROM_REZERV         = 5; //2; // 5
  VIDMOVE_RETURN              = 6; //2; // 6
  VIDMOVE_SPISANIE_RPO        = 7;
  VIDMOVE_SPISANIE            = 8; //3; // 8
  VIDMOVE_VVOD_OST            = 9;
  VIDMOVE_PRIH_RPO            = 10;
  VIDMOVE_RETURN_POSTAV       = 11;
  VIDMOVE_OTPUSK_PO_NAC_PR    = 12;
  VIDMOVE_OTPUSK_PO_CEL_PROG  = 13;
  VIDMOVE_SPISANIE_HITEC      = 14;

  VID_PRIHOD    = 1;
  VID_DVIJENIE  = 2;
  VID_RASHOD    = 3;

  SPISANIE_VID_NONE          = 0;
  SPISANIE_VID_PRICHINA      = 1;
  SPISANIE_VID_OTDELENIE     = 2;
  SPISANIE_VID_PACIENT       = 3;
  SPISANIE_VID_RETURN_POSTAV = 4;
  SPISANIE_VID_HITEC         = 5;    
  SPISANIE_VID_AMBTALON      = 6;

  cSKLAD_SYNONIM_APTEKA = 'APTEKA';
  cSKLAD_SYNONIM_IMN    = 'IMN';

  FUNC_SET_HANTI = 0;
  FUNC_SET_MID   = 1;

  //Значение FMedses_Give_Mode
  // Added by A.Nakorjakov 17.12.2007 12:15:38
  NOBODYMODE = 0; //0 - ни старшая, ни младшая медсестры не вносят запись соотвествий
  HEADNURSEMODE = 1; //1 - старшая медсестра при выдаче постовой медсестре делает соответствие
  POSTNURSEMODE = 2; //2 - старшая медсестра при выдаче постовой медсестре НЕ делает соответствие. Постовая медсестра делает соответствие при выдаче пациенту
  c_Epsilon = 0.000000001; // бесконечно малое число

  MSG_CAPTION_ERROR = 'Ошибка';
  MSG_CAPTION_ATTENTION = 'Внимание';
  MSG_CATION_QUESTION = 'Вопрос';

var
	globdata: tdatetime;
	ndata: tdatetime;
	iniFileName: String = 'medica.ini';

type    
  TarrInt = array of Integer;
  
  TdmMain = class(TDataModule)
    os: TOracleSession;
    ilMain: TImageList;
    odsEI: TOracleDataSet;
    dsEI: TDataSource;
    dsFarmGr: TDataSource;
    odsFarmGr: TOracleDataSet;
    dsUchGr: TDataSource;
    odsUchGr: TOracleDataSet;
    odsLevel: TOracleDataSet;
    dsLevel: TDataSource;
    odsPostav: TOracleDataSet;
    dsPostav: TDataSource;
    dsMedKart: TDataSource;
    odsKardoper: TOracleDataSet;
    dsKardOper: TDataSource;
    odsMO: TOracleDataSet;
    dsMO: TDataSource;
    ilMainHot: TImageList;
    dsMedicType: TDataSource;
    odsMedicType: TOracleDataSet;
    odsMedKart: TOracleDataSet;
    odsMedicPayType: TOracleDataSet;
    dsMedicPayType: TDataSource;
    odsMassUnits: TOracleDataSet;
    dsMassUnits: TDataSource;
    odsNarco: TOracleDataSet;
    dsNarco: TDataSource;
    cxStyleRepository1: TcxStyleRepository;
    cxStyleGridSelectedRow: TcxStyle;
    cxStyleGridOddRow: TcxStyle;
    cxStyleGridEvenRow: TcxStyle;
    cxStyleGridDetailOddRow: TcxStyle;
    cxStyleGridDetailEvenRow: TcxStyle;
    bhtMain: TJvBalloonHint;
    odsFunc_Set: TOracleDataSet;
    odsMedses_Give_Mode: TOracleDataSet;
    odsCheckLinkedDocs: TOracleDataSet;
    JvAppIniFileStorage: TJvAppIniFileStorage;
    oqCLOBS_Ins: TOracleQuery;
    odsAllSettings: TOracleDataSet;
    odsGetProvizorGroup: TOracleDataSet;
    oqInit_DB_Const: TOracleQuery;
    oqNAKL_PRICE_CHECK_BY_DOGOVOR: TOracleQuery;
    oqGetFieldLength: TOracleQuery;
    cxStyleFooter: TcxStyle;
    odsSklad: TOracleDataSet;
    dsSklad: TDataSource;
    oqGetFK_Sklad_ID_BY_MOID: TOracleQuery;
    odsVid_post: TOracleDataSet;
    dsVid_post: TDataSource;
    oqInsTempOst_By_Doc: TOracleQuery;
    oqDelTempOst: TOracleQuery;
    oqGetLastDocDate: TOracleQuery;
    oqUPD_TDOCS_FN_PRICE: TOracleQuery;
    oqSetTKART_FL_Brak: TOracleQuery;
    oqSetTKART_BRAK_UNIQSTR: TOracleQuery;
    odsBRAK_MED: TOracleDataSet;
    odsTFinSource: TOracleDataSet;
    oqAdditionalUpdateTable: TOracleQuery;
    dsTFinSource: TDataSource;
    odsPayCond: TOracleDataSet;
    dsPayCond: TDataSource;
    odsGROUP_LF: TOracleDataSet;
    dsGROUP_LF: TDataSource;
    oqSetLock: TOracleQuery;
    oqSetUnLock: TOracleQuery;
    odsTTemplate_dpc: TOracleDataSet;
    oqInsTTemplate_doc: TOracleQuery;
    oqInsTTemplate_dpc: TOracleQuery;
    oqOstRefreshFinish: TOracleQuery;
    oqOstRefreshInit: TOracleQuery;
    oqECP_RULE_ID: TOracleQuery;
    oqSetQUOTA_UchGr: TOracleQuery;
    odsDOCS_AUTONUM_COUNTER: TOracleDataSet;
    odsCheckAutonum: TOracleDataSet;
    oqUpdateAutoNumCounter: TOracleQuery;
    oqInsTTable_links: TOracleQuery;
    oqDelTTable_links: TOracleQuery;
    oqSaveDoc_Date_Num: TOracleQuery;
    odsSpec_MIS2: TOracleDataSet;
    odsPeople_MIS2: TOracleDataSet;
    odsCheck_EMP_right: TOracleDataSet;
    odsCheck_mis_user_right: TOracleDataSet;
    odsDBAROLE: TOracleDataSet;
    odsTProduce_type: TOracleDataSet;
    oqInsTempOst: TOracleQuery;
    oqClearTempOst: TOracleQuery;
    oqSignRPO: TOracleQuery;
    oqUnSignRPO: TOracleQuery;
    odsCheckDocNum: TOracleDataSet;
    dsProfil: TDataSource;
    odsProfil: TOracleDataSet;
    odsATC: TOracleDataSet;
    dsATC: TDataSource;
    oqTemp: TOracleQuery;
    odsUchGrListByUchgrId: TOracleDataSet;
    odsTTownById: TOracleDataSet;
    procedure DataModuleCreate(Sender: TObject);
    procedure osAfterLogOn(Sender: TOracleSession);
    procedure odsMedKartApplyRecord(Sender: TOracleDataSet; Action: Char; var Applied: Boolean; var NewRowId: string);
  private
    // MIS2
    {$IFDEF MIS2}
    FMISUSER_ID: Integer;
    FEMP_ID : integer; // теукущий emp.id
    FPEOPLE_ID :Integer;
    FPEOPLE_FULL : string;
    FPEOPLE_SHORT : string;
    // имеем role Oracle DBA - особый пользователь
    FDBA : Boolean;
    // Логин под которым зашли в БД
    FDataBaseLogin : string;
    {$ENDIF}
    //--------------------------------------------------------------------------

    FIsSotrAdmin : Boolean;
    procedure SetnCurMO(const Value: integer);
    function GetnCurMO: integer;
    function SetbNyagan: Boolean;
    
    procedure LOAD_FUNC_CHECK_BRAK(var aValue: variant);
    procedure LOAD_FUNC_DOGOVOR_NAKL_ENABLE (var aValue: variant);
    procedure LOAD_FUNC_IMP_NAKL_ENABLE(var aValue: variant);

    procedure LOAD_FUNC_CHECK_PRICES_IN_NAKL(var aValue: variant);
    procedure LOAD_FUNC_EDIT_TREB_IN_RASH(var aValue: variant);
    procedure LOAD_FUNC_FAS_EI_UHC(var aValue: variant);
    procedure LOAD_FUNC_FIN_SOURCE_IS_REQUIRE(var aValue: variant);
    procedure LOAD_FUNC_MEDIC_VISIBLE_FOR_NOT_APTEKA(var aValue: variant);
    procedure LOAD_FUNC_PRINT_VEDOM_VIBORKI(var aValue: variant);
    procedure LOAD_FUNC_RETURN(var aValue: variant);
    procedure LOAD_Func_Set(var aValue: variant);
    procedure LOAD_FUNC_SHOW_FIN_SOURCE(var aValue: variant);
    procedure LOAD_FUNC_SHOW_KONTRAKT(var aValue: variant);
    procedure LOAD_FUNC_SHOW_LAT_NAME_IN_RASH_BY_TREB(var aValue: variant);
    procedure LOAD_FUNC_SHOW_LAT_NAME_IN_TREB(var aValue: variant);
    procedure LOAD_FUNC_SHOW_MEDICEDIC_LEVEL(var aValue: variant);
    procedure LOAD_FUNC_SHOW_PAC_IN_SPIS(var aValue: variant);
    procedure LOAD_FUNC_SHOW_PAY_COND(var aValue: variant);
    procedure LOAD_FUNC_SHOW_PRODUCE_MEDIC(var aValue: variant);
    procedure LOAD_FUNC_SHOW_SCHET_FAKTURA(var aValue: variant);
    procedure LOAD_FUNC_SHOW_ZAYAV(var aValue: variant);
    procedure LOAD_FUNC_SHOW_ZAYAV_PRINT2(var aValue: variant);    
    procedure LOAD_FUNC_SPIS_HITEC(var aValue: variant);
    procedure LOAD_FUNC_SPIS_ON_PAC_BY_PROVIZOR(var aValue: variant);
    procedure LOAD_FUNC_SPIS_PAC_BY_NAZ_DATE(var aValue: variant);
    procedure LOAD_FUNC_SPIS_PRICH_BY_SMS(var aValue: variant);
//    procedure LOAD_FUNC_TREB_BY_NAZN(var aValue: variant);
    procedure LOAD_FUNC_USE_FIN_SOURCE_IN_SPIS_BY_PAC(var aValue: variant);
    procedure LOAD_FUNC_USE_SKLAD(var aValue: variant);
    procedure LOAD_FUNC_USE_GROUP_LF(var aValue: variant);
    procedure LOAD_Medses_Give_Mode(var aValue: variant);
    procedure LOAD_FUNC_SHOW_INV_NOMER(var aValue: variant);

//    procedure LOAD_FUNC_SHOW_TEMPLATES_VID_1(var aValue: variant);
//    procedure LOAD_FUNC_SHOW_TEMPLATES_VID_2(var aValue: variant);
//    procedure LOAD_FUNC_SHOW_TEMPLATES_VID_3(var aValue: variant);
    procedure LOAD_FUNC_SHOW_TEMPLATES_VID_MOVE_8(var aValue: variant);
    procedure LOAD_FUNC_USE_CROSS_TABLE_CHECK(var aValue: variant);
    procedure LOAD_FUNC_STORE_REPORT_USE_IN_TSMINI(var aValue: variant);

    procedure LOAD_FUNC_USE_RASH_BY_TREB(var aValue: variant); // использовать расход по требованию
    procedure LOAD_FUNC_USE_MOVE_TO_MOGROUP_BY_PROVIZOR(var aValue: variant); // провизор может делать передачи в отделение
    procedure LOAD_FUNC_USE_TREB_QUOTA(var aValue: variant);
    procedure LOAD_FUNC_SHOW_QUOTA_CODE(var aValue: variant);

    procedure LOAD_FUNC_USE_ZAV_OTD_IN_ACT_SPIS(var aValue: variant);
    procedure LOAD_FUNC_USE_SMS_IN_ACT_SPIS(var aValue: variant);

    procedure LOAD_FUNC_USE_NDS(var aValue: variant);
    procedure LOAD_FUNC_USE_NACENKA(var aValue: variant);

    procedure LOAD_FUNC_USE_JNVLS(var aValue: variant);
    procedure LOAD_FUNC_USE_MIBP(var aValue: variant);

    procedure LOAD_FUNC_IS_PRINT_TREB_NAKL_ABSENT_MEDICS(var aValue: variant);
    procedure LOAD_FUNC_IS_PRINT_TREB_NAKL_VID0_MEDICS(var aValue: variant);
    procedure LOAD_FUNC_IS_PRINT_VIDANO_IN_TREB_NAKL_BY_TREBID(var aValue: variant);    

    procedure LOAD_FUNC_USE_RASH_TREB_AUTOCORRECT(var aValue: variant);
    procedure LOAD_FUNC_NO_AUTOFILTER_IN_RASH_BY_TREB(var aValue: variant);
    procedure LOAD_FUNC_ADD_MED_TO_TREB_BY_SKLAD_OST(var aValue: variant);
    procedure LOAD_FUNC_ADD_MED_TO_TREB_BY_CUR_OST(var aValue: variant);
    procedure LOAD_FUNC_TREB_KOL_ON_ADD_IN_TREBNAKL(var aValue: variant);

    procedure LOAD_FUNC_SPIS_PAC_BY_SELECTED_DATE(var aValue: variant);
    procedure LOAD_FUNC_SPIS_PAC_BY_FOUNDPAC(var aValue: variant);
    procedure LOAD_FUNC_COUNT_SPIS_CHLEN_KOM(var aValue: variant);

    procedure LOAD_FUNC_SPIS_BY_ONE_SKLAD(var aValue: variant);
    procedure LOAD_FUNC_UNSIGN_DOC_RIGHT(var aValue: variant);
    procedure LOAD_FUNC_REQUIRE_FINSOURCE_IN_TREB(var aValue: variant);
    procedure LOAD_FUNC_USE_ECP_IN_TREB(var aValue: variant);

    procedure LOAD_FUNC_VIDMOVE_3_NUMBER_AUTO_FILL_MODE(var aValue: variant);
    procedure LOAD_FUNC_VIDMOVE_2_NUMBER_AUTO_FILL_MODE(var aValue: variant);

    procedure LOAD_FUNC_USE_FIN_SOURCE_IN_SPIS_PO_PRICHINE(var aValue: variant);
    procedure LOAD_FUNC_USE_MIXED_FIN_SOURCE_IN_PRIH(var aValue: variant);
    procedure LOAD_FUNC_USE_FIN_SOURCE_IN_AUTOFILL(var aValue: variant);
    procedure LOAD_FUNC_PRINT_TREB_NAKL_V2(var aValue: variant);

    procedure LOAD_FUNC_CHANGE_DOC_DATE_RIGHT(var aValue: variant);

    procedure LOAD_FUNC_DOCS_AUTONUM(var aValue: variant);
    procedure LOAD_FUNC_SAVE_ZAKL_KOM(var aValue: variant);
    procedure LOAD_FUNC_SHOW_LIST_SIGNS_IN_PRINT_TREB(var aValue: variant);
    procedure LOAD_FUNC_SET_VID_POM_HITECH(var aValue: variant);
    procedure LOAD_FUNC_FIN_SOURCE_IN_ACT_SPIS(var aValue: variant);
    procedure LOAD_FUNC_MOGROUP_FL_POST(var aValue: variant);
    procedure LOAD_FUNC_USE_TARA_IN_RPO(var aValue: variant);
    procedure LOAD_FUNC_VID_POST_REQUARE(var aValue: variant);
    procedure LOAD_FUNC_USE_RPO_DIFF(var aValue: variant);

    procedure LOAD_FUNC_DAMAGED_TREB_NAKL(var aValue: variant);
    procedure LOAD_FUNC_SHOW_KONTRAKT_WO_LIST(var aValue: variant);
    procedure LOAD_FUNC_SHOW_SCHET_FAKTURA_WO_LIST(var aValue: variant);
    procedure LOAD_FUNC_MEDIC_COUNT_IN_TREB(var aValue: variant);
    procedure LOAD_FUNC_ONLY_SOST_MEDICS_FOR_TREB_TO_RPO(var aValue: variant);
    procedure LOAD_FUNC_USE_TREB_FOR_RPO(var aValue: variant);

    procedure LOAD_FUNC_SHOW_OST_BY_DATE_NOT_ONLY_PROVIZOR(var aValue: variant);  //Added by Neronov A.S. 01.11.2011
    procedure LOAD_FUNC_SHOW_OST_BY_GROUP_NOT_ONLY_PROVIZOR(var aValue: variant); //Added by Neronov A.S. 27.03.2012
    procedure LOAD_FUNC_USE_SYSDATE_FOR_TREB_NAKL(var aValue: variant);           //Added by Neronov A.S. 25.11.2011
    procedure LOAD_FUNC_MOVE_TO_OR_FROM_REZERV(var aValue: variant);              //Added by Neronov A.S. 14.12.2011
    procedure LOAD_FUNC_RESTRICT_REZERV(var aValue: variant);                     //Added by Neronov A.S. 14.12.2011  
    procedure LOAD_FUNC_CHECK_DOC_NUM(var aValue: variant);                       //Added by Neronov A.S. 17.12.2011
    procedure LOAD_FUNC_COLORED_KART_BY_SROKY(var aValue: variant);               //Added by Neronov A.S. 05.02.2012
    procedure LOAD_FUNC_COLORED_KART_BY_SROKY_RED_RANGE(var aValue: variant);     //Added by Neronov A.S. 31.03.2012
    procedure LOAD_FUNC_COLORED_KART_BY_SROKY_YELLOW_RANGE(var aValue: variant);  //Added by Neronov A.S. 31.03.2012
    procedure LOAD_FUNC_COLORED_KART_BY_SROKY_GREEN_RANGE(var aValue: variant);   //Added by Neronov A.S. 31.03.2012
    procedure LOAD_FUNC_SHOW_INV_OLD_VIEW(var aValue: variant);                   //Added by Neronov A.S. 26.03.2012
    procedure LOAD_FUNC_BLOCK_DOCNUM_WITH_AUTONUM(var aValue: variant);           //Added by Neronov A.S. 13.04.2012
    procedure LOAD_FUNC_UNBLOCK_DOCNUM_WITH_AUTONUM(var aValue: variant);         //Added by Neronov A.S. 13.04.2012
    procedure LOAD_FUNC_COPY_COMMENT_IN_TREB(var aValue: variant);                //Added by Neronov A.S. 19.04.2012
    procedure LOAD_FUNC_INPUT_SUM_OR_KOL(var aValue: variant);                    //Added by Neronov A.S. 19.04.2012
    procedure LOAD_FUNC_USE_RIGHT_EDIT_MEDIC(var aValue: variant);                //Added by Neronov A.S. 20.05.2012
    procedure LOAD_FUNC_CAN_EDIT_MEDIC(var aValue: variant);                      //Added by Neronov A.S. 20.05.2012
    procedure LOAD_FUNC_IGNORE_TREB_PODPIS(var aValue: variant);                  //Added by Neronov A.S. 06.08.2012
    procedure LOAD_FUNC_USE_PROFIL(var aValue: variant);                          //Added by Neronov A.S. 27.08.2012
    procedure LOAD_FUNC_USE_FINSOURCE_IN_RPO(var aValue: variant);                //Added by Neronov A.S. 18.09.2012
    procedure LOAD_FUNC_USE_ONLY_FR4(var aValue: variant);                        //Added by Neronov A.S. 05.11.2012
    procedure LOAD_FUNC_SHOW_DRUGID(var aValue: variant);                         //Added by Neronov A.S. 27.11.2012
    procedure LOAD_FUNC_USE_FORMULAR(var aValue: variant);                        //Added by Neronov A.S. 24.12.2012
    procedure LOAD_FUNC_CAN_EDIT_FORMULAR(var aValue: variant);                   //Added by Neronov A.S. 25.12.2012
    procedure LOAD_FUNC_BLOCK_SIGN_DOCMOVE_TO_APTEKA(var aValue: variant);        //Added by Neronov A.S. 25.01.2013
    procedure LOAD_APTEKA_MO_GROUP_ID(var aValue: variant);                       //Added by Neronov A.S. 25.01.2013
    procedure LOAD_FUNC_REQUARE_GODEN(var aValue: variant);                       //Added by Neronov A.S. 26.02.2013
    procedure LOAD_FUNC_REQUARE_PRODCERT(var aValue: variant);                    //Added by Neronov A.S. 26.02.2013
    procedure LOAD_FUNC_SHOW_FILTERROW(var aValue: variant);                      //Added by Neronov A.S. 26.02.2013
    procedure LOAD_FUNC_REPLACE_PRICE_AND_SUMM_IN_PARTY(var aValue: variant);     //Added by Neronov A.S. 28.02.2013
    procedure LOAD_FUNC_HIDE_NACENKA(var aValue: variant);                        //Added by Neronov A.S. 28.02.2013
    procedure LOAD_FUNC_USE_MEDICPRODCERT(var aValue: variant);                   //Added by Neronov A.S. 28.02.2013
    procedure LOAD_FUNC_USE_CLASS(var aValue: variant);                           //Added by Neronov A.S. 05.03.2013
    procedure LOAD_FUNC_USE_LAT_NAME_IN_TREB_IN_TREBLIST(var aValue: variant);    //Added by Neronov A.S. 11.03.2013
    procedure LOAD_FUNC_USE_OKDP(var aValue: variant);                            //Added by Neronov A.S. 13.03.2013
    procedure LOAD_IS_SHORT_NAKL(var aValue: variant);                            //Added by Malev A.V. 07.06.2013
    procedure LOAD_IS_USE_ATC_ROOT_FUNCT(var aValue: variant);                    //Added by Malev A.V. 20.06.2013

    procedure LOAD_FUNC_USE_RIGHT_RECALC_OST(var aValue: variant);
    procedure LOAD_FUNC_RIGHT_RECALC_OST(var aValue: variant);

    procedure LOAD_FUNC_USE_RIGHT_EDT_EI(var aValue: variant);
    procedure FUNC_RIGHT_EDT_EI(var aValue: variant);

    procedure LOAD_FUNC_USE_FORM_KOMISS(var aValue: variant);

    procedure LOAD_FUNC_USE_MEDUCHGRP_CH(var aValue: variant);                        //Added by Fomin 22.09.2013
    procedure LOAD_FUNC_NOT_NEGATIVE_OST(var aValue: variant);

//    procedure LOAD_FUNC_MAINT_PARAMS_STORE(var aValue: variant);

    procedure LOAD_FUNC_USE_NARCOTIC_ACT (var aValue: variant);
    procedure LOAD_FUNC_USE_COMPLEX_AUTOFILL(var aValue: variant);
    procedure LOAD_FUNC_PRINT_TREBNAKL_USE_PAGE_ORIENTATION (var aValue: variant);
    procedure LOAD_FUNC_CAN_EDIT_TFINSOURCE(var aValue: variant);
    procedure LOAD_FUNC_USE_DOC_CHEK_OST_BY_REG_DATA(var aValue: variant);
    procedure LOAD_FUNC_USE_VRACH_KOMISS(var aValue: variant);
    procedure LOAD_FUNC_TREB_NAZN_LIST_FROM_ANYWHERE(var aValue: variant);
    procedure LOAD_FUNC_RASH_BY_TREB_MANY_SKLAD(var aValue: variant);
    procedure LOAD_FUNC_USE_EDITED_INVENTORY(var aValue: variant);
    procedure LOAD_FUNC_CAN_SIGN_INVENTORY(var aValue: variant);


    // ---------- MIS2 ----------
    {$IFDEF MIS2}
    procedure SetPeopleVariables;
    procedure SetEMP_ID(const Value: Integer);
    procedure EncryptPassword(var AUser, APasswd: String);
    function HashPassword(APAssword: String): String;
    {$ENDIF}



    { Private declarations }
  public
    { Public declarations }

    bNyagan : Boolean; //  Нягань - не - Нягань :)

    pkgEdIzm: TPKGTEDIZM;
    PKGFARMGR: TPKGTFARMGR;
    pkgUchGR: TPKGTUCHGR;
    pkgMedic: TPKGTMEDIC;
    pkgPOSTAV: TPKGTPOSTAV;
    pkgMedSes: TPKGMEDSES;
		pkgMedKart: TPKGMEDKART;
    pkgMO: TPKGTMO;
    pkgInvOpis: TpkgInvOpis;
    pkgprihrash: Tpkgprihrash;
//    pkgSotrRight: TPKGSOTRRIGHT;
    PKGTREB: TPKGTREB;
		PKGTUCHGRTYPE : TPKGTUCHGRTYPE;
		pkgProdCert : TPkgProdcert;
		pkgSmini : TPkgSmini;
	  PKGTKARTCOMPOS:TPKGTKARTCOMPOS;
		PKGTKARTCOITEM:TPKGTKARTCOITEM;
		PKGTDOCS:TPKGTDOCS;
		fromid: double;
    nSotrID: Integer;    // на самом деле это AppSotrID
    nSotrFK_ID: Integer; // а это SotrID
    nSpecID: Integer;
    nRed: integer;
    nComment: string;
    ndata: tdatetime;
    FC_CurMO_GROUP : string; // текущая группа
    FK_CurMO_GROUP, MOID : integer;
    CurMO_SKLAD_ID : Variant;
    CurMO_SKLAD_SYNONIM : string;
    IsStacSotr : boolean;

    ZAV_APTEKA_ID : Integer;
    ZAV_APTEKA_FIO : string;
    ZAV_APTEKA_FULLFIO : string;

    sDB_NAME: string;  //DB_NAME Added by Neronov A.S. 01.12.2011
    dServerDate: TDateTime; //Added by Neronov A.S. 05.02.2012

    ConfigParams : TParams;
    LOCKID : string;

    MedKardLst_FocusedRowIndex : integer;
    isCryptoProProviderPresent : boolean;

    {$IFDEF MIS2}
    property EMP_ID:Integer  read FEMP_ID write SetEMP_ID;
    {$ENDIF}
    property nCurMO: integer read GetnCurMO write SetnCurMO;
    property IsSotrAdmin: Boolean  read FIsSotrAdmin;
    function IsAdminUser: boolean;
    function GetAPTSpec: integer;
    function GetBuhSpec: integer;
//		function MoneyToString(Summa: double; lRub: boolean): string;
		function get_countstr( aNumber : Integer): string;
    procedure ShowBalloonHint( aHintText : string; aHintHeader : string = 'ВНИМАНИЕ'; aForm : TCustomForm = nil; x : Integer = 0; y : Integer = 0);

    function IsUsedInTMedic(const aKeyName : string; const aKeyValue : integer): Boolean;
    function GetProvizorsMO_GROUPID : Integer; // ищем группы мат. отв., которые стоят у провизоров
    function GetFieldLength(aSCHEMENAME, aTABLENAME, aCOLUMNNAME : string) : Integer;
    function GetLastDocDate(aFK_MOGROUPID: integer) : TDate;

    procedure SetTempOstByDoc(PFK_MOGROUPID: integer; PDPID : integer = -1);
    procedure SetTempOst(PFK_MOGROUPID, PFK_KARTID: integer; PFN_KOL: Double);
    procedure ClearTempOst(PFK_MOGROUPID: integer);



    procedure InitAdditionalUpdateTable(aTableName : string);
    procedure AddAdditionalUpdateTable(aFieldName : string; aParamType : integer; aValue : variant);
    procedure ExecuteAdditionalUpdateTable(aKeyFieldName : string; aParamType : integer; aValue : variant);

    procedure SetTKART_FL_Brak( aKartID : Integer; aFL_Brak : Variant; aCommit : Boolean = False);
    procedure SetTKART_BRAK_UNIQSTR( aKartID : Integer; aBRAK_UNIQSTR : string; aCommit : Boolean = False);

    function IsTableRecordBuzy(const aTableName, aKeyName : string; const aKeyValue : integer; const aBuzyMessage : string = ''): Boolean;
    // управление пользовательскими блокировками
    function SetLock (const aLockName: string; var aLOCKID : string; var aLockSotr : string): integer;
    function SetUnLock(const aLOCKID : string): boolean;

    procedure SaveInterfaceParams(  );
    procedure LoadInterfaceParams(  );

    procedure InsTTable_Links(aFK_ID1, aFC_TABLE1_NAME, aFK_ID2, aFC_TABLE2_NAME, aFN_LINK_TYPE : variant);
    procedure DelTTable_Links(aFK_ID1, aFC_TABLE1_NAME, aFK_ID2, aFC_TABLE2_NAME, aFN_LINK_TYPE : variant);


    {$IFDEF MIS2}
    function DO_connect(AUser, APassword: String; var AError: string): boolean;
    function CheckRight(ARight: Integer): Boolean;
    {$ENDIF}
	end;

var
	dmMain: TdmMain;
  isShortPrint: Integer = -1000; //Add Malev A.V. 07/06/2013

function CheckCryptoProProvider : boolean;

procedure SaveToLog(const sWhere: string; const sWhat: string);

function ServerDate(os: TOracleSession): TDateTime;

function Remove1310(const sString: string): string;

function nvl(p: Variant; NewPattern: Variant):Variant;

function DO_CHECK_OBJECT_ACCESS(pOS: TOracleSession; pFK_APPSOTRID: Integer; pFC_OBJECTNAME: string): Integer;


//----------came from --fGlobal.pas---------------------------------------------
function IniReadString(sIniFile: string; Section, Ident: string; Default: string = ''): string;
function IniReadInteger(sIniFile: string; Section, Ident: string; Default: integer = -1): integer;
procedure IniWriteInteger(sIniFile: string; Section, Ident: string; Value: Integer);
procedure IniWriteString(sIniFile: string; Section, Ident: string; Value: string);
// добавил Воронов О.А. 12.05.2007 - Достает версию билда в виде строки x.x.x.x
function CurrentFileInfo(NameApp: string): string;
function IsValidDateEditValue(aValue : string ) : Boolean; // проверка даты
function ReverseString(const AText: string): string;
procedure cxDateEdit_PropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
procedure cxDateEdit_PropertiesValidate_WithNull(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
                                                       
function GetCharFromVirtualKey(Key: Word): string;
function EncodeStringToHex(aStr: string): string;
function EncodeHexToString(aHexStr: string): string;
function GetParamString(Name: string): string;

implementation

{$R *.DFM}

uses inifiles, Variants, JvVersionInfo, DateUtils, wcrypt2
{$IFDEF MIS2}, uMD5, JTools, fLogin {$ENDIF}
 {$IFNDEF MIS2}   {$IFNDEF SAKURA} ,uGlobal {$ENDIF} {$ENDIF}
 {$IFNDEF OLD_AUTH}, SMmainAPI{$ENDIF}
 {$IFDEF SAKURA} ,uCallDllLogin {$ENDIF};
//------------------------------------------------------------------------------
function GetParamString(Name: string): string;
var i: Integer;
begin
  for i := 1 to ParamCount do
  begin
    if Pos(AnsiUpperCase(Name) + '=', AnsiUpperCase(ParamStr(i))) > 0 then
    begin
      Result := Copy(ParamStr(i), Length(Name) + 2, 255);
      Exit;
    end;
  end;
  Result := '';
end;
//------------------------------------------------------------------------------
function GetCharFromVirtualKey(Key: Word): string;
var
  keyboardState: TKeyboardState;
  asciiResult: Integer;
begin
  GetKeyboardState(keyboardState);
  SetLength(Result, 2);
  asciiResult := ToAscii(key, MapVirtualKey(key, 0), keyboardState, @Result[1], 0);
  case asciiResult of
    0: Result := '';
    1: SetLength(Result, 1);
    2:;
  else
    Result := '';
  end;
end; 
//-----------------------------------------------------------------------------

function EncodeStringToHex(aStr: string): string;
var
  i, Len : Integer;
begin
  Result := '';
  Len := Length(aStr);
  for i := 1 to Len do
    Result := Result+IntToHex(Ord(aStr[i]), 2);
end;
//------------------------------------------------------------------------------
function EncodeHexToString(aHexStr: string): string;
var
  i, Len : Integer;

  function HexToByte(aHex : string) : Byte;
  var
    res : byte;
  begin
    res := 0;
    case aHex[2] of
      '0'..'9' : res := Ord(aHex[2])-48;
      'A'..'F' : res := Ord(aHex[2])-55;
      'a'..'f' : res := Ord(aHex[2])-87;
    end;

    case aHex[1] of
      '0'..'9' : res := res+ (Ord(aHex[1])-48)*16;
      'A'..'F' : res := res+ (Ord(aHex[1])-55)*16;
      'a'..'f' : res := res+ (Ord(aHex[1])-87)*16;
    end;
    Result := res;
  end;
begin
  Result := '';
  Len := Length(aHexStr) div 2;
  for i := 1 to Len do
    Result := Result+Chr(HexToByte(aHexStr[(i*2)-1]+aHexStr[i*2]));
end;
//------------------------------------------------------------------------------
function DO_CHECK_OBJECT_ACCESS(pOS: TOracleSession; pFK_APPSOTRID: Integer; pFC_OBJECTNAME: string): Integer;
begin
 Result := IniReadInteger(iniFileName, 'DO_CHECK_OBJECT_ACCESS', pFC_OBJECTNAME+'_'+IntTOStr(pFK_APPSOTRID), 0);

{$IFNDEF MIS2}   {$IFNDEF SAKURA}
 Result :=  uGlobal.DO_CHECK_OBJECT_ACCESS(pOS, pFK_APPSOTRID, pFC_OBJECTNAME);
{$ENDIF} {$ENDIF}
end;
//------------------------------------------------------------------------------
function IsValidDateEditValue(aValue : string) : Boolean;
begin
  try
    StrToDate(aValue);
    Result := True;
  except
    Result := False;
  end;
end;
//------------------------------------------------------------------------------
function ReverseString(const AText: string): string;
var
  I: Integer;
  P: PChar;
begin
  SetLength(Result, Length(AText));
  P := PChar(Result);
  for I := Length(AText) downto 1 do
  begin
    P^ := AText[I];
    Inc(P);
  end;
end;
//------------------------------------------------------------------------------
function CurrentFileInfo(NameApp: string): string;
var
  dump: DWORD;
  size: integer;
  buffer: PChar;
  VersionPointer, TransBuffer: PChar;
  Temp: integer;
  CalcLangCharSet: string;
begin
  size := GetFileVersionInfoSize(PChar(NameApp), dump);
  buffer := StrAlloc(size+1);
  try
    GetFileVersionInfo(PChar(NameApp), 0, size, buffer);

    VerQueryValue(buffer, '\VarFileInfo\Translation', pointer(TransBuffer),
    dump);
    if dump >= 4 then
    begin
      temp:=0;
      StrLCopy(@temp, TransBuffer, 2);
      CalcLangCharSet:=IntToHex(temp, 4);
      StrLCopy(@temp, TransBuffer+2, 2);
      CalcLangCharSet := CalcLangCharSet+IntToHex(temp, 4);
    end;

    VerQueryValue(buffer, pchar('\StringFileInfo\'+CalcLangCharSet+
    '\'+'FileVersion'), pointer(VersionPointer), dump);
    if (dump > 1) then
    begin
      SetLength(Result, dump);
      StrLCopy(Pchar(Result), VersionPointer, dump);
      Result := StringReplace(Result,#0,'',[rfReplaceAll]);
    end
    else
      Result := '0.0.0.0';
  finally
    StrDispose(Buffer);
  end;
end;
//------------------------------------------------------------------------------
function nvl(p: Variant; NewPattern: Variant):Variant;
begin
  if VarIsNull(p) or VarIsEmpty(p) then Result := NewPattern
  else Result := p;
end;
//------------------------------------------------------------------------------
function IniReadString(sIniFile: string; Section, Ident: string; Default: string = ''): string;
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(sIniFile);
  Result := ini.ReadString(Section, Ident, Default);
  ini.free;
end;
//------------------------------------------------------------------------------
function IniReadInteger(sIniFile: string; Section, Ident: string; Default: integer = -1): integer;
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(sIniFile);
  Result := ini.ReadInteger(Section, Ident, Default);
  ini.free;
end;
//------------------------------------------------------------------------------
procedure IniWriteInteger(sIniFile: string; Section, Ident: string; Value: Integer);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(sIniFile);
  ini.WriteInteger(Section, Ident, Value);
  ini.free;
end;
//------------------------------------------------------------------------------
procedure IniWriteString(sIniFile: string; Section, Ident: string; Value: string);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(sIniFile);
  ini.WriteString(Section, Ident, Value);
  ini.free;
end;
//------------------------------------------------------------------------------
procedure SaveToLog(const sWhere: string; const sWhat: string);
var
  F                 : TextFile;
  S                 : string;
begin
{$I-}
  AssignFile(F, ExtractFilePath(ParamStr(0)) + ExtractFileName(ParamStr(0)) + '.log');
  Append(F);
  if IOResult <> 0 then
    ReWrite(F);
  DateTimeToString(S, '[dd/mm/yyyy hh:mm:ss] ', Now);
  S := S + Copy(sWhere, 1, 128) + ' ' + Copy(sWhat, 1, 2048);
  WriteLn(F, S);
  CloseFile(F);
{$I+}
end;
//------------------------------------------------------------------------------
function ServerDate(os: TOracleSession): TDateTime;
var oq: TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := os;
    oq.Sql.Text := 'SELECT SYSDATE FROM DUAL';
    try
      oq.Execute;
      Result := oq.FieldAsDate(0);
    except
      Result := Date;
    end;
  finally
    oq.Free;
  end;
end;
//------------------------------------------------------------------------------
function Remove1310(const sString: string): string;
begin
  Result := TRIM(StringReplace(sString, #13#10, ' ', [rfReplaceAll]));
end;
//------------------------------------------------------------------------------
{****************************************************************************************}
{                                 TdmMain.DataModuleCreate
{****************************************************************************************}

procedure TdmMain.DataModuleCreate(Sender: TObject);
var
	sDate1, sDate2: String;
	nNewChmo:integer;
//  ini : TIniFile;

	function DoCheckAccess(nSotrId : Integer; sAppName: string): Boolean;
	var
		oq: TOracleQuery;
	begin
		Result := False;
		oq := TOracleQuery.Create(nil);
		try
			oq.Session := Os;
			oq.Sql.Text := 'SELECT LOGIN.DO_CHECK_ACCESS(:p1, :p2) FROM DUAL';
			oq.DeclareAndSet('p1', otInteger, nSotrId);
			oq.DeclareAndSet('p2', otString, sAppName);
			try
				oq.Execute;
				Result := True;
				if (oq.Field(0) <= 0) and (nSotrID >= 0) then begin
					Application.MessageBox('Попытка несанкционированного доступа.', 'Завершение работы', MB_OK + MB_ICONERROR);
					Application.Terminate;
					Application.ProcessMessages;
				end;
			except
			end;
		finally
			oq.Free;
		end;
	end;

function GET_FKSOTRID(pOS: TOracleSession; pFK_APPSOTRID: Integer): Integer;
var
  oq : TOracleQuery;
begin
  {$IFDEF MIS2}
  Result := FEMP_ID;
//  oq := TOracleQuery.Create(nil);
//  try
//    oq.Session := pOS;
//		oq.SQL.Text := 'SELECT nvl(max(p.id),-1) FROM people p where p.id = :p1';
//    oq.DeclareAndSet('p1', otInteger, pFK_APPSOTRID);
//    oq.Execute;
//    try
//      Result :=oq.FieldAsInteger(0);
//    except
//      Result := -1;
//    end;
//  finally
//    oq.Free;
//  end;
  {$ELSE}
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := pOS;
		oq.SQL.Text := 'SELECT login.GET_SOTRID(:p1) FROM DUAL';
    oq.DeclareAndSet('p1', otInteger, pFK_APPSOTRID);
    oq.Execute;
    try
      Result := oq.FieldAsInteger(0);
    except
      Result := -1;
    end;
  finally
    oq.Free;
  end;
 {$ENDIF}
end;

// по ParamStr(1) определить код мат. отв. (MED.TMO.MOID)
function GET_SOTRID(pOS: TOracleSession; pFK_APPSOTRID: Integer): Integer;
begin
  {$IFDEF MIS2}
  with TOracleQuery.Create(nil) do
  try
   try
    Session := pOS;
		SQL.Text := 'SELECT NVL(MAX(T.MOID),-1) AS MOID FROM MED.TMO T WHERE T.FK_SOTRID = :p1 and NVL(T.FL_DEL,0) = 0';
    DeclareAndSet('p1', otInteger, pFK_APPSOTRID);
    Execute;
    Result := FieldAsInteger(0);
   finally
    Free;
   end;
  except
    Result := -1;
  end;
  {$ELSE}
  with TOracleQuery.Create(nil) do
  try
   try
    Session := pOS;
		SQL.Text := 'SELECT NVL(MAX(MOID),-1) AS MOID FROM'+
								' (SELECT MOID FROM MED.TMO T WHERE T.FK_SOTRID IN (SELECT login.GET_SOTRID(:p1) FROM DUAL) and NVL(T.FL_DEL,0) = 0)';
    DeclareAndSet('p1', otInteger, pFK_APPSOTRID);
    Execute;
    Result := FieldAsInteger(0);
   finally
    Free;
   end;
  except
    Result := -1;
  end;
 {$ENDIF}

end;

begin
	try
    os.LogOff;
    {$IFDEF XE}
      os.Preferences.ConvertUTF := cuUTF8ToUTF16;
      os.BytesPerCharacter := bcAutoDetect;
    {$ENDIF}

    {$IFDEF OLD_AUTH}
      {$IFDEF MIS2}
      FMISUSER_ID:= -1;
      FPEOPLE_ID := -1;
      FEMP_ID := -1;

//[Oracle]
//;----------------------------------------------Connection--------------------------
//;Database Может быть либо Easy Connect Naming либо TNSALIAS
//; Например localhost:1521/mis2 или mis2
//DataBase=MIS2
//;Используется Oracle XE
//XE=TRUE
//;----------------------------------------------NLS_LANG----------------------------
//NLS_LANG=AMERICAN_AMERICA.CL8MSWIN1251

      ini := TIniFile.Create(ExtractFilePath(Application.ExeName)+'\MIS2.ini');
      os.LogonDatabase := ini.ReadString('Oracle', 'DataBase', 'MIS2');
      ini.Free;
      if LoginToBase = False then RaiseException(0, 0,0, nil);
//      os.LogonUsername := 'MIS';
//      os.LogonPassword := '1';


      {$ELSE}
        {$IFDEF SAKURA}
          os.LogonDatabase := 'ASU';
          os.LogonUsername := 'MIS';
          os.LogonPassword := 'MIS';
          os.ExternalSVC := DoCall(Application.Handle, pChar(os.LogonDatabase),pChar(Databaseus));  //Kosov
        {$ELSE}
          os.LogonDatabase := 'ASU';
          os.LogonUsername := 'ASU';
          os.LogonPassword := 'ASU';
          os.LogOn;
        {$ENDIF}
      {$ENDIF}

    {$ELSE}
      os.LogonDatabase := 'ASU';
      if GetSession(os, 'ASU') = False then RaiseException(0, 0,0, nil);
    {$ENDIF}

	except
		MessageBox(Application.Handle, pChar('Невозможно соединиться с сервером БД!' + #10#13 +
			'Обратитесь к администратору.'),'Ошибка',mb_ok + mb_iconerror);
		Application.Terminate;
		Abort;
	end;

	try
//                ShowMessage( '"'+ParamStr(1)+'"' ); // узнаем ид юзера
		if ParamStr(1) = '-dc' then
    begin
			nSotrID := -1;
		end
		else
    begin
      {$IFDEF MIS2}
      nSotrID :=  FMISUSER_ID;
      {$ELSE}
			nSotrID := StrToInt(ParamStr(1)); // FK_ID из LOGIN.TAPPSOTR
      {$ENDIF}
      
      nSotrFK_ID := GET_FKSOTRID( os, nSotrID );

      oqInit_DB_Const.SetVariable('PSOTRID', nSotrFK_ID);

      FIsSotrAdmin := False;
      IsStacSotr   := False;
      {$IFNDEF MIS2}
      try
        oqInit_DB_Const.Execute;

        FIsSotrAdmin := (oqInit_DB_Const.GetVariable('ISSOTRADMIN') > 0);
        IsStacSotr   := (oqInit_DB_Const.GetVariable('ISSOTRSTAC')  > 0);

        ZAV_APTEKA_ID := oqInit_DB_Const.GetVariable('pZAV_APTEKA_ID');
        ZAV_APTEKA_FIO := oqInit_DB_Const.GetVariable('pZAV_APTEKA_FIO');
        ZAV_APTEKA_FULLFIO := oqInit_DB_Const.GetVariable('pZAV_APTEKA_FULLFIO');
      except
      end;
      {$ENDIF}      
		end;


//			DoCheckAccess(nSotrID, ExtractFileName(ParamStr(0)));
   {$IFDEF XE}
     bNyagan := False;
   {$ELSE}
     {$IFNDEF MIS2}
      bNyagan := SetbNyagan;
     {$ENDIF}
   {$ENDIF}

    {$IFDEF OLD_AUTH}
      {$IFDEF XE}
      {$ELSE}
//		if not bNyagan then -- так проверка задействуется и при работе на югорской базе Воронов О.А. 09.06.2008
      DoCheckAccess(nSotrID, ExtractFileName(ParamStr(0)));
      {$ENDIF}
    {$ELSE}

      if not GetCheckConnect() then  Exit;
    {$ENDIF}
	except     on E: Exception do
    begin
//    ShowMessage(E.Message);
		Application.MessageBox('Неверный параметр!','Ошибка',mb_ok + mb_iconerror);
		Application.Terminate;
		Abort;
    end;
	end;

  CurMO_SKLAD_ID := null;

  //create packeges
  pkgEdIzm := TPKGTEDIZM.Create(Self);
  pkgEdIzm.Session := os;
  pkgEdIzm.Cursor := crSQLWait;

  PKGFARMGR := TPKGTFARMGR.Create(Self);
  PKGFARMGR.Session := os;
  PKGFARMGR.Cursor := crSQLWait;

  pkgUchGR := TPKGTUCHGR.Create(self);
  pkgUchGR.Session := os;
  pkgUchGR.Cursor := crSQLWait;

  pkgMedic := TPKGTMEDIC.Create(Self);
  pkgMedic.Session := os;
  pkgMedic.Cursor := crSQLWait;

  pkgPOSTAV := TPKGTPOSTAV.Create(Self);
  pkgPOSTAV.Session := os;
  pkgPOSTAV.Cursor := crSQLWait;

  pkgMedSes := TPKGMEDSES.Create(Self);
  pkgMedSes.Session := os;
	pkgMedSes.Cursor := crSQLWait;

  PKGMEDKART := TPKGMEDKART.Create(Self);
  pkgMedKart.Session := os;
  pkgMedKart.Cursor := crSQLWait;

  pkgMO := TPKGTMO.Create(Self);
  pkgMO.Session := os;
  pkgMO.Cursor := crSQLWait;

  pkgInvOpis := TpkgInvOpis.Create(Self);
  pkgInvOpis.Session := os;
  pkgInvOpis.Cursor := crSQLWait;

  pkgprihrash := Tpkgprihrash.Create(Self);
  pkgprihrash.Session := os;
  pkgprihrash.Cursor := crSQLWait;

  pkgSmini := TPkgSmini.Create(Self);
  pkgSmini.Session := os;

//  pkgkl := TPKGkl.Create(Self);
//  pkgkl.Session := os;
//  pkgkl.Cursor := crSQLWait;

//  pkgSotrRight := TPKGSOTRRIGHT.Create(Self);
//  pkgSotrRight.Session := os;
//  pkgSotrRight.Cursor := crSQLWait;

//------------------------------------------------------------------------------
	PKGTREB := TPKGTREB.Create(Self);
	PKGTREB.Session := os;
	PKGTREB.Cursor := crSQLWait;

	PKGTUCHGRTYPE := TPKGTUCHGRTYPE.Create(Self);
	PKGTUCHGRTYPE.Session := Os;
	PKGTUCHGRTYPE.Cursor := crSQLWait;

	PKGTKARTCOMPOS := TPKGTKARTCOMPOS.Create(Self);
	PKGTKARTCOMPOS.Session := os;
	PKGTKARTCOMPOS.Cursor := crSQLWait;

	PKGTKARTCOITEM := TPKGTKARTCOITEM.Create(Self);
	PKGTKARTCOITEM.Session := os;
	PKGTKARTCOITEM.Cursor := crSQLWait;

	PKGTDOCS := TPKGTDOCS.Create(Self);
	PKGTDOCS.Session := os;
	PKGTDOCS.Cursor := crSQLWait;

  pkgProdCert := TPkgProdcert.Create(self);
	pkgProdCert.Session := os;
	pkgProdCert.Cursor := crSQLWait;

	 // Установка текущего МО
	if nSotrID=-1 then dmMain.pkgMedSes.SETCURMO(IniReadInteger(iniFileName, 'config', 'nMatOtvID', -1))
	else
		Begin
      {$IFDEF MIS2}
			nNewChmo :=GET_SOTRID(os,nSotrFK_ID);
      {$ELSE}
			nNewChmo :=GET_SOTRID(os,nSotrID);
      {$ENDIF}
			if nNewChmo <> -1 then
			begin
				dmMain.pkgMedSes.SETCURMO(nNewChmo);
				//DoSetCaption;
			end;

		end;  

// установка имени ini-файла

  SaveToLog( 'procedure TdmMain.DataModuleCreate(Sender: TObject);', 'iniFileName := ChangeFileExt(ParamStr(0),''.ini'');' );
	iniFileName := ChangeFileExt(ParamStr(0),'.ini');

  // берем настройки из базы

  {$IFDEF XE}
  {$ELSE}
  odsAllSettings.Close;
  odsAllSettings.SetVariable('FC_COMMENT', ExtractFileName(Application.ExeName)+'_'+IntToStr(dmMain.nSotrFK_ID));
  odsAllSettings.Open;
  if odsAllSettings.RecordCount=0 then
  begin
    oqCLOBS_Ins.SetVariable('FC_COMMENT', ExtractFileName(Application.ExeName)+'_'+IntToStr(dmMain.nSotrFK_ID));
    oqCLOBS_Ins.Execute;
    odsAllSettings.Close;
    odsAllSettings.Open;

    if FileExists( iniFileName ) then
    begin
      odsAllSettings.Edit;
      TBlobField(odsAllSettings.FieldByName('FC_CLOB')).LoadFromFile( iniFileName );
      odsAllSettings.Post;
      odsAllSettings.Session.Commit;
      odsAllSettings.Close;
      odsAllSettings.Open;
    end;
  end;


  DeleteFile(iniFileName);
  SaveToLog( 'procedure TdmMain.DataModuleCreate(Sender: TObject);', 'TBlobField(odsAllSettings.FieldByName(''FC_CLOB'')).SaveToFile( '+iniFileName+' );' );
  TBlobField(odsAllSettings.FieldByName('FC_CLOB')).SaveToFile( iniFileName );
  odsAllSettings.Close;
  {$ENDIF}

  SaveToLog( 'procedure TdmMain.DataModuleCreate(Sender: TObject);', 'JvAppIniFileStorage.FileName := iniFileName;' );
  JvAppIniFileStorage.AutoReload := True;
  JvAppIniFileStorage.AutoFlush := True;
  JvAppIniFileStorage.FileName := iniFileName;

//------------------------------------------------------------------------------

  nred := IniReadInteger(iniFileName, 'Uchet', 'nRed', 0); // учет красным
  // Устоновка периода отображения документов
  sDate1 := IniReadstring(iniFileName, 'Data','data1');
  if trim(sDate1) <> '' then pkgMedSes.SETDATA1( strtodate((sDate1)));
  sDate2 := IniReadstring(iniFileName, 'Data','data2');
  if trim(sDate2) <> '' then pkgMedSes.SETDATA2( strtodate((sDate2)));

  SaveToLog( 'procedure TdmMain.DataModuleCreate(Sender: TObject);', 'LoadInterfaceParams' );
  // загружаем настройки интерфейса пользователя
  LoadInterfaceParams;
  SaveToLog( 'procedure TdmMain.DataModuleCreate(Sender: TObject);', 'end;' );

  // загружаем из базы флаги работы аптеки
  ConfigParams := TParams.Create;
                                   
//  ConfigParams.AddParam('FUNC_MAINT_PARAMS_STORE',           0, LOAD_FUNC_MAINT_PARAMS_STORE, 'Место хранения основных параметров', 'Общие');
  ConfigParams.AddParam('FUNC_USE_SKLAD',                    0, LOAD_FUNC_USE_SKLAD, 'Ведение нескольких складов', 'Общие');
  ConfigParams.AddParam('Medses_Give_Mode',                  0, LOAD_Medses_Give_Mode, 'Режим работы МС - постовая или старшая при списании на пациентов', 'Общие');
  ConfigParams.AddParam('Func_Set',                          0, LOAD_Func_Set, 'Режим работы аптеки - устарело', 'Общие');
  ConfigParams.AddParam('FUNC_RETURN',                       0, LOAD_FUNC_RETURN, 'Возврат медикаментов', 'Общие');

  ConfigParams.AddParam('FUNC_USE_RASH_BY_TREB',             1, LOAD_FUNC_USE_RASH_BY_TREB, 'Использовать расходы по требованию', 'Общие');

  ConfigParams.AddParam('FUNC_SPIS_ON_PAC_BY_PROVIZOR',      0, LOAD_FUNC_SPIS_ON_PAC_BY_PROVIZOR, 'Списание на пациента провизором', 'Списание');
  ConfigParams.AddParam('FUNC_SPIS_PRICH_BY_SMS',            0, LOAD_FUNC_SPIS_PRICH_BY_SMS, 'Списание по причине для СМС', 'Списание');
  ConfigParams.AddParam('FUNC_SPIS_PAC_BY_NAZ_DATE',         0, LOAD_FUNC_SPIS_PAC_BY_NAZ_DATE, 'Фильтрация пациентов по дате', 'Списание');
  ConfigParams.AddParam('FUNC_SHOW_PAC_IN_SPIS',             0, LOAD_FUNC_SHOW_PAC_IN_SPIS, 'Отображать ФИО пациента в списании', 'Списание');

  ConfigParams.AddParam('FUNC_SHOW_FIN_SOURCE',              0, LOAD_FUNC_SHOW_FIN_SOURCE, 'Использовать ведение источника финансирования', 'Источник финансирования');
  ConfigParams.AddParam('FUNC_USE_MIXED_FIN_SOURCE_IN_PRIH', 1, LOAD_FUNC_USE_MIXED_FIN_SOURCE_IN_PRIH, 'Возможность вносить в приход смешанный источник финансирования', 'Источник финансирования');
  ConfigParams.AddParam('FUNC_USE_FIN_SOURCE_IN_SPIS_BY_PAC',0, LOAD_FUNC_USE_FIN_SOURCE_IN_SPIS_BY_PAC, 'Использовать ист. финансирования в списании на пациента', 'Источник финансирования');
  ConfigParams.AddParam('FUNC_USE_FIN_SOURCE_IN_SPIS_PO_PRICHINE',0, LOAD_FUNC_USE_FIN_SOURCE_IN_SPIS_PO_PRICHINE, 'Использовать ист. финансирования в списании по причине', 'Источник финансирования');
  ConfigParams.AddParam('FUNC_FIN_SOURCE_IS_REQUIRE',        0, LOAD_FUNC_FIN_SOURCE_IS_REQUIRE, 'Обязательное заполнение источника финансирования в приходе', 'Источник финансирования');
  ConfigParams.AddParam('FUNC_REQUIRE_FINSOURCE_IN_TREB',    0, LOAD_FUNC_REQUIRE_FINSOURCE_IN_TREB, 'Обязательное заполнение источника финансирования в требовании', 'Источник финансирования');
  ConfigParams.AddParam('FUNC_USE_FIN_SOURCE_IN_AUTOFILL',   0, LOAD_FUNC_USE_FIN_SOURCE_IN_AUTOFILL, 'Автозаполнение расхода по требованию с учётом ист. финансирования', 'Источник финансирования');

  ConfigParams.AddParam('FUNC_SPIS_PAC_BY_SELECTED_DATE',    0, LOAD_FUNC_SPIS_PAC_BY_SELECTED_DATE, 'Фильтрация пациентов по выбранной дате', 'Списание');
  ConfigParams.AddParam('FUNC_SPIS_PAC_BY_FOUNDPAC',         0, LOAD_FUNC_SPIS_PAC_BY_FOUNDPAC, 'Выбор пациента через FOUNDPAC', 'Списание');

  ConfigParams.AddParam('FUNC_SHOW_ZAYAV',                   0, LOAD_FUNC_SHOW_ZAYAV, 'Заявки на закупку медикаментов', 'Общие');
  ConfigParams.AddParam('FUNC_SHOW_ZAYAV_PRINT2',            0, LOAD_FUNC_SHOW_ZAYAV_PRINT2, 'Печать 2-х видов заявок', 'Общие');

  ConfigParams.AddParam('FUNC_SHOW_PRODUCE_MEDIC',           False, LOAD_FUNC_SHOW_PRODUCE_MEDIC, 'Производство медикаментов (РПО)', 'Общие');
//  ConfigParams.AddParam('FUNC_TREB_BY_NAZN',                 0, LOAD_FUNC_TREB_BY_NAZN, '', 'Общие');

  ConfigParams.AddParam('FUNC_SHOW_MEDICEDIC_LEVEL',         0, LOAD_FUNC_SHOW_MEDICEDIC_LEVEL, 'Уровень доступа (Югорск)', 'Медикаменты');
  ConfigParams.AddParam('FUNC_MEDIC_VISIBLE_FOR_NOT_APTEKA', 0, LOAD_FUNC_MEDIC_VISIBLE_FOR_NOT_APTEKA, 'Видимость медикамента для не аптеки (Югорск)', 'Медикаменты');

  ConfigParams.AddParam('FUNC_PRINT_VEDOM_VIBORKI',          0, LOAD_FUNC_PRINT_VEDOM_VIBORKI, 'Печать ведомость выборки', 'Расходные документы');
  ConfigParams.AddParam('FUNC_CHECK_PRICES_IN_NAKL',         0, LOAD_FUNC_CHECK_PRICES_IN_NAKL, 'Проверка цен в накладной', 'Общие');
  ConfigParams.AddParam('FUNC_FAS_EI_UHC',                   0, LOAD_FUNC_FAS_EI_UHC, 'Списании медикаментов в фасовочных единицах измерения', 'Общие');
  ConfigParams.AddParam('FUNC_SPIS_HITEC',                   0, LOAD_FUNC_SPIS_HITEC, 'Дополнительный вид расхода - Списание по высоким технологиям.', 'Общие');

  ConfigParams.AddParam('FUNC_CHECK_BRAK',                   0, LOAD_FUNC_CHECK_BRAK, 'Использование забраковки медикаментов', 'Общие');
  ConfigParams.AddParam('FUNC_SHOW_KONTRAKT',                0, LOAD_FUNC_SHOW_KONTRAKT, 'Заполнять информацию о контракте', 'Приход от поставщика');
  ConfigParams.AddParam('FUNC_SHOW_KONTRAKT_WO_LIST',        0, LOAD_FUNC_SHOW_KONTRAKT_WO_LIST, 'Заполнять информацию о контракте без списка', 'Приход от поставщика');

  ConfigParams.AddParam('FUNC_SHOW_SCHET_FAKTURA',           0, LOAD_FUNC_SHOW_SCHET_FAKTURA, 'Заполнять информацию о счете-фактуре', 'Приход от поставщика');
  ConfigParams.AddParam('FUNC_SHOW_SCHET_FAKTURA_WO_LIST',   0, LOAD_FUNC_SHOW_SCHET_FAKTURA_WO_LIST, 'Заполнять информацию о счете-фактуре без списка', 'Приход от поставщика');
  ConfigParams.AddParam('FUNC_SHOW_PAY_COND',                0, LOAD_FUNC_SHOW_PAY_COND, 'Заполнять информацию об условиях оплаты', 'Приход от поставщика');

  ConfigParams.AddParam('FUNC_USE_GROUP_LF',                 0, LOAD_FUNC_USE_GROUP_LF, 'Использовать для медикамнетов лекарственные формы', 'Объекты учета');
  ConfigParams.AddParam('FUNC_SHOW_INV_NOMER',               0, LOAD_FUNC_SHOW_INV_NOMER, 'Использовать для партий инвентарные номера', 'Партии');
  ConfigParams.AddParam('FUNC_USE_TREB_QUOTA',               0, LOAD_FUNC_USE_TREB_QUOTA, 'Ограничение в кол-ве требуемых медикаментов', 'Общие');
  ConfigParams.AddParam('FUNC_SHOW_QUOTA_CODE',              0, LOAD_FUNC_SHOW_QUOTA_CODE, 'Вести учет кодов квот (Сургут-Кардиоцентр)', 'Общие');

  ConfigParams.AddParam('FUNC_USE_NDS',                      0, LOAD_FUNC_USE_NDS    , 'Использовать в партиях НДС', 'Партии');
  ConfigParams.AddParam('FUNC_USE_NACENKA',                  0, LOAD_FUNC_USE_NACENKA, 'Использовать в партиях наценку поставщика', 'Партии');
  ConfigParams.AddParam('FUNC_USE_JNVLS',                    0, LOAD_FUNC_USE_JNVLS, 'Использовать ЖНВЛС', 'Объекты учета');

  ConfigParams.AddParam('FUNC_SHOW_LAT_NAME_IN_TREB',        0, LOAD_FUNC_SHOW_LAT_NAME_IN_TREB, 'Латинские названия в требованиях', 'Требование');
  ConfigParams.AddParam('FUNC_SHOW_LAT_NAME_IN_RASH_BY_TREB',0, LOAD_FUNC_SHOW_LAT_NAME_IN_RASH_BY_TREB, 'Печать латинских названий в расходе по требованию', 'Расход по требованию');

  ConfigParams.AddParam('FUNC_DOGOVOR_NAKL_ENABLE',          0, LOAD_FUNC_DOGOVOR_NAKL_ENABLE, '', '');
  ConfigParams.AddParam('FUNC_IMP_NAKL_ENABLE',              0, LOAD_FUNC_IMP_NAKL_ENABLE, '', '');

  ConfigParams.AddParam('FUNC_SHOW_TEMPLATES_VID_MOVE_8',    0, LOAD_FUNC_SHOW_TEMPLATES_VID_MOVE_8, '', '');
  ConfigParams.AddParam('FUNC_USE_CROSS_TABLE_CHECK',        0, LOAD_FUNC_USE_CROSS_TABLE_CHECK, '', '');
  ConfigParams.AddParam('FUNC_STORE_REPORT_USE_IN_TSMINI',   0, LOAD_FUNC_STORE_REPORT_USE_IN_TSMINI, '', '');

  ConfigParams.AddParam('FUNC_USE_MOVE_TO_MOGROUP_BY_PROVIZOR',   0, LOAD_FUNC_USE_MOVE_TO_MOGROUP_BY_PROVIZOR, '', '');

  ConfigParams.AddParam('FUNC_USE_ZAV_OTD_IN_ACT_SPIS',           0, LOAD_FUNC_USE_ZAV_OTD_IN_ACT_SPIS, 'Подпись зав. отделения в печатной форме акта списания', 'Списание');
  ConfigParams.AddParam('FUNC_USE_SMS_IN_ACT_SPIS',               0, LOAD_FUNC_USE_SMS_IN_ACT_SPIS, 'Подпись СМС в печатной форме акта списания', 'Списание');

  ConfigParams.AddParam('FUNC_ADD_MED_TO_TREB_BY_SKLAD_OST',      0, LOAD_FUNC_ADD_MED_TO_TREB_BY_SKLAD_OST, 'Добавить медикамент в требование по остаткам склада, которому адресовано требование', 'Требование');
  ConfigParams.AddParam('FUNC_ADD_MED_TO_TREB_BY_CUR_OST',        0, LOAD_FUNC_ADD_MED_TO_TREB_BY_CUR_OST,   'Добавить медикамент в требование по текущим остаткам', 'Требование');
  ConfigParams.AddParam('FUNC_MEDIC_COUNT_IN_TREB',               0, LOAD_FUNC_MEDIC_COUNT_IN_TREB, 'Ограничение кол-ва медикаментов в 1 требовании', 'Требование');

  ConfigParams.AddParam('FUNC_COUNT_SPIS_CHLEN_KOM',              3, LOAD_FUNC_COUNT_SPIS_CHLEN_KOM, 'Кол-во членов комиссии в акте списания', 'Списания');

  ConfigParams.AddParam('FUNC_EDIT_TREB_IN_RASH',                 0, LOAD_FUNC_EDIT_TREB_IN_RASH, 'Возможность редактировать требование из расхода по требованию', 'Расход по требованию');
  ConfigParams.AddParam('FUNC_USE_RASH_TREB_AUTOCORRECT',         0, LOAD_FUNC_USE_RASH_TREB_AUTOCORRECT, 'Автокорректировка в расходе по требованию', 'Расход по требованию');
  ConfigParams.AddParam('FUNC_NO_AUTOFILTER_IN_RASH_BY_TREB',     0, LOAD_FUNC_NO_AUTOFILTER_IN_RASH_BY_TREB, 'Автофильтр в расходе по требованию', 'Расход по требованию');
  ConfigParams.AddParam('FUNC_TREB_KOL_ON_ADD_IN_TREBNAKL',       1, LOAD_FUNC_TREB_KOL_ON_ADD_IN_TREBNAKL, 'Выставление затребуемого кол-ва при добавлении в расходе по требованию', 'Расход по требованию');

  ConfigParams.AddParam('FUNC_IS_PRINT_TREB_NAKL_ABSENT_MEDICS',  False, LOAD_FUNC_IS_PRINT_TREB_NAKL_ABSENT_MEDICS, 'Печатать справку об отсутствующих медикаментах', 'Расход по требованию');
  ConfigParams.AddParam('FUNC_IS_PRINT_TREB_NAKL_VID0_MEDICS',    1, LOAD_FUNC_IS_PRINT_TREB_NAKL_VID0_MEDICS, 'Отображать невыданные медикаменты в М-11', 'Расход по требованию');
  ConfigParams.AddParam('FUNC_IS_PRINT_VIDANO_IN_TREB_NAKL_BY_TREBID',    0, LOAD_FUNC_IS_PRINT_VIDANO_IN_TREB_NAKL_BY_TREBID, 'Отображать выданное кол-во медикаментов при печати из списка требований', 'Расход по требованию');


  ConfigParams.AddParam('FUNC_SPIS_BY_ONE_SKLAD',                 0, LOAD_FUNC_SPIS_BY_ONE_SKLAD, 'Списание только по одному складу', 'Списание');
  ConfigParams.AddParam('FUNC_RASH_BY_TREB_MANY_SKLAD',           0, LOAD_FUNC_RASH_BY_TREB_MANY_SKLAD, 'Расход по требованию с разных складов', 'Списание');
  ConfigParams.AddParam('FUNC_UNSIGN_DOC_RIGHT',                  False, LOAD_FUNC_UNSIGN_DOC_RIGHT, 'Право отменять у документов подпись', 'Общие');

  ConfigParams.AddParam('FUNC_USE_ECP_IN_TREB',                   0, LOAD_FUNC_USE_ECP_IN_TREB, 'Отображение ЭЦП в требованиях', 'Требование');

  ConfigParams.AddParam('FUNC_VIDMOVE_3_NUMBER_AUTO_FILL_MODE',   1, LOAD_FUNC_VIDMOVE_3_NUMBER_AUTO_FILL_MODE, 'Способ автонумерации документов о передаче в другое отделение', 'Документы');
  ConfigParams.AddParam('FUNC_VIDMOVE_2_NUMBER_AUTO_FILL_MODE',   0, LOAD_FUNC_VIDMOVE_2_NUMBER_AUTO_FILL_MODE, 'Способ автонумерации расходов по требованию', 'Документы');

  ConfigParams.AddParam('FUNC_PRINT_TREB_NAKL_V2',                False, LOAD_FUNC_PRINT_TREB_NAKL_V2, 'Печать требования-накладной V2', 'Расход по требованию');

  ConfigParams.AddParam('FUNC_CHANGE_DOC_DATE_RIGHT',             False, LOAD_FUNC_CHANGE_DOC_DATE_RIGHT, 'Право менять дату регистрации документа', 'Документы');
  ConfigParams.AddParam('FUNC_DOCS_AUTONUM'         ,             0, LOAD_FUNC_DOCS_AUTONUM, 'Режим автонумерования документов', 'Документы');
  ConfigParams.AddParam('FUNC_SAVE_ZAKL_KOM'        ,             0, LOAD_FUNC_SAVE_ZAKL_KOM, 'Сохранять заключение комиссии в акте списания', 'Списание');

  ConfigParams.AddParam('FUNC_SHOW_LIST_SIGNS_IN_PRINT_TREB',     1, LOAD_FUNC_SHOW_LIST_SIGNS_IN_PRINT_TREB, 'Показывать выбор подписей перед печатью требования', 'Требование');

  ConfigParams.AddParam('FUNC_SET_VID_POM_HITECH',                False, LOAD_FUNC_SET_VID_POM_HITECH, 'Настройка видов помощи по высоким технологиям для пациентов', 'Общие');

  ConfigParams.AddParam('FUNC_FIN_SOURCE_IN_ACT_SPIS',            0, LOAD_FUNC_FIN_SOURCE_IN_ACT_SPIS, 'Сортировка по источник финансирования в акте списания', 'Списание');
  ConfigParams.AddParam('FUNC_MOGROUP_FL_POST',                   0, LOAD_FUNC_MOGROUP_FL_POST, 'Использовать признак "Пост" для групп МО', 'Общие');

  ConfigParams.AddParam('FUNC_USE_TARA_IN_RPO',                   0, LOAD_FUNC_USE_TARA_IN_RPO, 'При производстве использовать тару (списывать)', 'РПО');
  ConfigParams.AddParam('FUNC_VID_POST_REQUARE',                  1, LOAD_FUNC_VID_POST_REQUARE, 'Вид поступления обязательно для заполнения', 'Приход');
  ConfigParams.AddParam('FUNC_USE_RPO_DIFF',                      0, LOAD_FUNC_USE_RPO_DIFF, 'Использовать разделение производства по типам', 'РПО');
  ConfigParams.AddParam('FUNC_DAMAGED_TREB_NAKL',                 False, LOAD_FUNC_DAMAGED_TREB_NAKL, 'Починка требований', 'Требование');
  ConfigParams.AddParam('FUNC_TREB_NAZN_LIST_FROM_ANYWHERE',      False, LOAD_FUNC_TREB_NAZN_LIST_FROM_ANYWHERE, 'Форма создания требований по ЛВН "Откуда" угодно', 'Требование');

  ConfigParams.AddParam('FUNC_ONLY_SOST_MEDICS_FOR_TREB_TO_RPO',  0, LOAD_FUNC_ONLY_SOST_MEDICS_FOR_TREB_TO_RPO, 'Требовать из склада РПО только составные медикаменты', 'Требование');
  ConfigParams.AddParam('FUNC_USE_TREB_FOR_RPO',                  0, LOAD_FUNC_USE_TREB_FOR_RPO, 'Требования для РПО (для автоматической обработки в РПО)', 'Требование');

  ConfigParams.AddParam('FUNC_SHOW_OST_BY_DATE_NOT_ONLY_PROVIZOR',0, LOAD_FUNC_SHOW_OST_BY_DATE_NOT_ONLY_PROVIZOR, 'Возможность смотреть остатки за выбранную дату не только для провизора', 'Общие');
  ConfigParams.AddParam('FUNC_SHOW_OST_BY_GROUP_NOT_ONLY_PROVIZOR',0, LOAD_FUNC_SHOW_OST_BY_GROUP_NOT_ONLY_PROVIZOR, 'Возможность смотреть остатки другой группы МО не только для провизора', 'Общие');
  ConfigParams.AddParam('FUNC_USE_SYSDATE_FOR_TREB_NAKL',         0, LOAD_FUNC_USE_SYSDATE_FOR_TREB_NAKL, 'Дату документа расхода по требованию использовать текущую, а не дату регистрации требования', 'Расход по требованию');

  ConfigParams.AddParam('FUNC_MOVE_TO_OR_FROM_REZERV',            False, LOAD_FUNC_MOVE_TO_OR_FROM_REZERV, 'Доступ к резерву', 'Общие');
  ConfigParams.AddParam('FUNC_RESTRICT_REZERV',                   0, LOAD_FUNC_RESTRICT_REZERV, 'Ограничить доступ к резерву', 'Общие');

  ConfigParams.AddParam('FUNC_CHECK_DOC_NUM',                     0, LOAD_FUNC_CHECK_DOC_NUM, 'Проверять номера документов на наличие такого же', 'Общие');

  ConfigParams.AddParam('FUNC_COLORED_KART_BY_SROKY',             1, LOAD_FUNC_COLORED_KART_BY_SROKY, 'Раскрашивать грид в соответствии со сроками годности', 'Общие');
  ConfigParams.AddParam('FUNC_COLORED_KART_BY_SROKY_RED_RANGE',   1, LOAD_FUNC_COLORED_KART_BY_SROKY_RED_RANGE, 'Верхняя граница красных сроков годности', 'Общие');
  ConfigParams.AddParam('FUNC_COLORED_KART_BY_SROKY_YELLOW_RANGE',7, LOAD_FUNC_COLORED_KART_BY_SROKY_YELLOW_RANGE, 'Верхняя граница желтых сроков годности', 'Общие');
  ConfigParams.AddParam('FUNC_COLORED_KART_BY_SROKY_GREEN_RANGE', 31,LOAD_FUNC_COLORED_KART_BY_SROKY_GREEN_RANGE, 'Верхняя граница зеленых сроков годности', 'Общие');

  ConfigParams.AddParam('FUNC_SHOW_INV_OLD_VIEW',                 0, LOAD_FUNC_SHOW_INV_OLD_VIEW, 'Показывать в главном меню Инвентаризационную опись со старым внешним видом', 'Общие');
  ConfigParams.AddParam( 'FUNC_USE_EDITED_INVENTORY', 0, LOAD_FUNC_USE_EDITED_INVENTORY, 'Использовать редактируемую инвентаризацию', 'Общие' );

  ConfigParams.AddParam('FUNC_USE_MIBP',                          0, LOAD_FUNC_USE_MIBP, 'Использовать МИБП', 'Объекты учета');

  ConfigParams.AddParam('FUNC_BLOCK_DOCNUM_WITH_AUTONUM',         0, LOAD_FUNC_BLOCK_DOCNUM_WITH_AUTONUM, 'Блокировать ввод номера документов при включенной автонумерацией', 'Документы');
  ConfigParams.AddParam('FUNC_UNBLOCK_DOCNUM_WITH_AUTONUM',       False, LOAD_FUNC_UNBLOCK_DOCNUM_WITH_AUTONUM, 'Право на разблокировку ввода номера документов при включенной автонумерацией', 'Документы');

  ConfigParams.AddParam('FUNC_COPY_COMMENT_IN_TREB',              0, LOAD_FUNC_COPY_COMMENT_IN_TREB, 'Копировать комментарии медсестры из требования в расход по требованию', 'Требование');
  ConfigParams.AddParam('FUNC_INPUT_SUM_OR_KOL',                  0, LOAD_FUNC_INPUT_SUM_OR_KOL, 'Возможность указания не только кол-ва партий объекта учета, но и суммы с автоматическим расчетом кол-ва', 'Списание');

  ConfigParams.AddParam('FUNC_USE_RIGHT_EDIT_MEDIC',              0, LOAD_FUNC_USE_RIGHT_EDIT_MEDIC, 'Использовать право на редактирование объектов учета', 'Ассортимент');
  ConfigParams.AddParam('FUNC_CAN_EDIT_MEDIC',                    False , LOAD_FUNC_CAN_EDIT_MEDIC, 'Право на редактирование объектов учета', 'Ассортимент');

  ConfigParams.AddParam('FUNC_IGNORE_TREB_PODPIS',                1, LOAD_FUNC_IGNORE_TREB_PODPIS, 'Игнорировать условие подписанных требований', 'Требование');

  ConfigParams.AddParam('FUNC_USE_PROFIL',                        0, LOAD_FUNC_USE_PROFIL, 'Использовать профили', 'Общие');

  ConfigParams.AddParam('FUNC_USE_FINSOURCE_IN_RPO',              0, LOAD_FUNC_USE_FINSOURCE_IN_RPO, 'Использовать ист. фин. при производстве', 'РПО');

  ConfigParams.AddParam('FUNC_USE_ONLY_FR4',                      0, LOAD_FUNC_USE_ONLY_FR4, 'Использовать только FastReport 4', 'Общие');

  ConfigParams.AddParam('FUNC_SHOW_DRUGID',                       0, LOAD_FUNC_SHOW_DRUGID, 'Использовать для партий DrugID для проекта "Мониторинг цен"', 'Партии');

  ConfigParams.AddParam('FUNC_USE_FORMULAR',                      0, LOAD_FUNC_USE_FORMULAR, 'Использовать Формуляр (стационарный перечень)', 'Объекты учета');
  ConfigParams.AddParam('FUNC_CAN_EDIT_FORMULAR',                 False, LOAD_FUNC_CAN_EDIT_FORMULAR, 'Право ставить/убирать галочку Формуляр', 'Объекты учета');

  ConfigParams.AddParam('FUNC_USE_MEDUCHGRP_CH',                  0, LOAD_FUNC_USE_MEDUCHGRP_CH, 'Сохранять изменения учетной группы медикамента и учитывать при формировании отчетов', 'Объекты учета');


  ConfigParams.AddParam('FUNC_BLOCK_SIGN_DOCMOVE_TO_APTEKA',      0, LOAD_FUNC_BLOCK_SIGN_DOCMOVE_TO_APTEKA, 'Запрещать отделениям подписывать документы возврата в Аптеку', 'Документы');
  ConfigParams.AddParam('APTEKA_MO_GROUP_ID',                    -1, LOAD_APTEKA_MO_GROUP_ID, 'ID группы Аптека', 'Общие');
  ConfigParams.AddParam('FUNC_REQUARE_GODEN',                     0, LOAD_FUNC_REQUARE_GODEN, 'Срок годности по-умолчанию нужно заполнять', 'Партии');
  ConfigParams.AddParam('FUNC_REQUARE_PRODCERT',                  0, LOAD_FUNC_REQUARE_PRODCERT, 'Производителя по-умолчанию нужно заполнять', 'Партии');
  ConfigParams.AddParam('FUNC_SHOW_FILTERROW',                    0, LOAD_FUNC_SHOW_FILTERROW, 'Отображать FilterRow на гридах', 'Объекты учета');   
  ConfigParams.AddParam('FUNC_REPLACE_PRICE_AND_SUMM_IN_PARTY',   0, LOAD_FUNC_REPLACE_PRICE_AND_SUMM_IN_PARTY, 'Поменять местами Цену и Сумму в окне редиктирования партии ОУ', 'Партии');
  ConfigParams.AddParam('FUNC_HIDE_NACENKA',                      0, LOAD_FUNC_HIDE_NACENKA, 'Не показывать Наценку', 'Партии');
  ConfigParams.AddParam('FUNC_USE_MEDICPRODCERT',                 0, LOAD_FUNC_USE_MEDICPRODCERT, 'Указывать производителя и сертификат при редактировании ОУ', 'Объекты учета');
  ConfigParams.AddParam('FUNC_USE_CLASS',                         0, LOAD_FUNC_USE_CLASS, 'Использовать классификацию мед. изделий с подсветкой', 'Объекты учета');
  ConfigParams.AddParam('FUNC_USE_LAT_NAME_IN_TREB_IN_TREBLIST',  0, LOAD_FUNC_USE_LAT_NAME_IN_TREB_IN_TREBLIST, 'В списке требований при печати требования-накладной названия медикаментов выводятся на латинице.', 'Требование');
  ConfigParams.AddParam('FUNC_USE_OKDP',                          0, LOAD_FUNC_USE_OKDP, 'Использовать классификацию ОКДП', 'Объекты учета');

  // Кнопка пересчета остатков
  ConfigParams.AddParam('FUNC_USE_RIGHT_RECALC_OST',              0, LOAD_FUNC_USE_RIGHT_RECALC_OST, 'Кнопка пересчета остатков доступна по правам доступа (=1)', 'Общие');
  ConfigParams.AddParam('FUNC_RIGHT_RECALC_OST',                  False, LOAD_FUNC_RIGHT_RECALC_OST, 'Доступность пересчета остатков ', 'Общие');

  ConfigParams.AddParam('FUNC_NOT_NEGATIVE_OST',                  0, LOAD_FUNC_NOT_NEGATIVE_OST, 'Не давать делать проводки которые приводят к отрицательным остаткам (=1)', 'Общие');

  // Кнопка добавления единиц измерения
  ConfigParams.AddParam('FUNC_USE_RIGHT_EDT_EI',                  0, LOAD_FUNC_USE_RIGHT_EDT_EI, 'Кнопка  добавления единиц измерения доступна по правам доступа (=1)', 'Общие');
  ConfigParams.AddParam('FUNC_RIGHT_EDT_EI',                      False, FUNC_RIGHT_EDT_EI, 'Доступность добавления единиц измерения', 'Общие');

  // Формулярная комиссия
  ConfigParams.AddParam('FUNC_USE_FORM_KOMISS',              0, LOAD_FUNC_USE_FORM_KOMISS, 'Столбец Формулярная комиссия', 'Объекты учета');

  //Add Malev A.V. 07/06/2013
  ConfigParams.AddParam('IS_SHORT_NAKL',                          0, LOAD_IS_SHORT_NAKL, 'Накладная: краткий вид', 'Общие');
  //--Add Malev A.V. 07/06/2013

  //Add Malev A.V. 20/06/2013
  ConfigParams.AddParam('IS_USE_ATC_ROOT_FUNCT',                  False, LOAD_IS_USE_ATC_ROOT_FUNCT, 'Использовать в запросе остатков ф-цию MED.GET_FK_ATC_ROOT или нет', 'Общие');
  //--Add Malev A.V. 20/06/2013

  ConfigParams.AddParam('FUNC_USE_NARCOTIC_ACT',                  0, LOAD_FUNC_USE_NARCOTIC_ACT, 'Печать акта НС и ПВ', 'Общие');
  ConfigParams.AddParam('FUNC_USE_COMPLEX_AUTOFILL',              0, LOAD_FUNC_USE_COMPLEX_AUTOFILL, 'Комлексный подбор медикаментов при автозаполнении в расходе по требованию', 'Общие');

  ConfigParams.AddParam('FUNC_PRINT_TREBNAKL_USE_PAGE_ORIENTATION', 0, LOAD_FUNC_PRINT_TREBNAKL_USE_PAGE_ORIENTATION,
    'При печати требования-накладной давать выбирать оринетацию страниц', 'Печать');

  ConfigParams.AddParam('FUNC_CAN_EDIT_TFINSOURCE',           False, LOAD_FUNC_CAN_EDIT_TFINSOURCE,
    'Изменение спраочника источников финансирования', 'Источник финансирования');

  ConfigParams.AddParam('FUNC_USE_DOC_CHEK_OST_BY_REG_DATA',      0, LOAD_FUNC_USE_DOC_CHEK_OST_BY_REG_DATA,
    'Проверка на остатки на дату регистрации расхода при уверждении', 'Документы');

  ConfigParams.AddParam('FUNC_USE_VRACH_KOMISS', 0, LOAD_FUNC_USE_VRACH_KOMISS, 'Использовать флаг ВК (врачебная комиссия)', 'Объекты учета');
  ConfigParams.AddParam('FUNC_CAN_SIGN_INVENTORY', False, LOAD_FUNC_CAN_SIGN_INVENTORY, 'Доступ на подпись инвентаризации', 'Общие');

  ConfigParams.LoadAllParams;


  // open datasets
  odsEI.Open;
  odsUchGr.Open;
  odsMassUnits.Open;
  odsVid_post.Open;
  odsPostav.Open;
  odsMO.Open;

  odsFarmGr.Open;

  odsATC.Open;

  if (dmMain.ConfigParams.GetParamValue('FUNC_USE_RPO_DIFF', 0) = 1)and(dmMain.ConfigParams.GetParamValue('FUNC_SHOW_PRODUCE_MEDIC', False) = True) then
  begin
    odsTProduce_type.Close;
    odsTProduce_type.Open;
  end;

  if (dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 0)or(((dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1))and(dmMain.CurMO_SKLAD_SYNONIM = cSKLAD_SYNONIM_APTEKA)) then
  begin
    odsNarco.Open;
  end;
  if (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_MEDICEDIC_LEVEL', 0) = 1) then
  begin
    odsLevel.Open;
  end;
  if (dmMain.ConfigParams.GetParamValue('FUNC_USE_GROUP_LF', 0) = 1) then
  begin
    odsGROUP_LF.Open;
  end;

  if (dmMain.ConfigParams.GetParamValue('FUNC_USE_ECP_IN_TREB', 0) = 1) then
  begin
    oqECP_RULE_ID.Execute;
    isCryptoProProviderPresent := CheckCryptoProProvider();
  end;

  MedKardLst_FocusedRowIndex := -1;

  sDB_NAME := pkgSmini.Readstring('CONFIG','DB_NAME','');

  dServerDate := ServerDate(dmMain.os);
end;

function CheckCryptoProProvider : boolean;
var i: DWORD;
    dwProvType, cbName: DWORD;
    provName: array[0..200] of char;
begin
  Result := False;
  i:= 0;
  while (CryptEnumProviders(i, nil, 0, @dwProvType, nil, @cbName)) do {проверяем наличие еще одного}
  begin
    if CryptEnumProviders(i, nil, 0,	@dwProvType, @provName, @cbName) then {получаем имя CSP}
    begin
      if (provName = 'Crypto-Pro GOST R 34.10-2001 Cryptographic Service Provider')and(dwProvType = 75) then
      begin
        Result := True;
        Exit;
      end;
//      'Криптопровайдер: '+provName
//      FileMemo.Lines.Add('Тип: '+IntToStr(dwProvType));

//      CryptReleaseContext(hProv, 0);
    end;
    inc(i);
  end;
end;

// ----------------- MIS2 -----------------
//------------------------------------------------------------------------------
// Возвращает True если право ARight есть у пользователя
// иначе False
{$IFDEF MIS2}
procedure TdmMain.SetEMP_ID(const Value: Integer);
begin
  FEMP_ID := Value;
  JvAppIniFileStorage.Flush;
  IniWriteInteger( iniFileName, 'MIS2', 'LAST_EMP_ID', FEMP_ID );
end;

function TdmMain.CheckRight(ARight: Integer): Boolean;
begin
  if FDBA then
  begin
    Result := True;
    Exit;
  end;
  if ARight=-1 then
  begin
    result := True;
    Exit;
  end;

  if FEMP_ID >0 then
  begin
    // Если есть специализация, то проверяем право по специализации
    // TODO не закрывать датасет
    odsCheck_EMP_right.SetVariable('P_EMP_ID',FEMP_ID);
    odsCheck_EMP_right.SetVariable('P_RIGHT_ID',ARight);
    odsCheck_EMP_right.Open;
    Result := odsCheck_EMP_right.Fields[0].AsInteger = 1;
    odsCheck_EMP_right.Close;
    Exit;
  end;

  odsCheck_mis_user_right.SetVariable('P_USER_ID', FMISUSER_ID);
  odsCheck_mis_user_right.SetVariable('P_RIGHT_ID',ARight);
  odsCheck_mis_user_right.Open;
  Result := odsCheck_mis_user_right.Fields[0].AsInteger = 1;
  odsCheck_mis_user_right.Close;
end;

procedure TdmMain.SetPeopleVariables;
var
  I : Integer;
begin
  odsDBAROLE.Close;
  odsDBAROLE.Open;
  FDBA := odsDBAROLE.FieldByName('CNT').AsInteger >0 ;

  if FDBA then
  begin
    // для DBA отдельные параметры
    FPEOPLE_FULL := os.LogonUsername;
    FPEOPLE_SHORT := os.LogonUsername;
    exit;
  end;

  // устанавливаем текущего  FMISUSER_ID  FPEOPLE_ID
  odsPeople_MIS2.Close;
  odsPeople_MIS2.Open;
  if odsPeople_MIS2.RecordCount > 0 then
  begin
    FPEOPLE_FULL := odsPeople_MIS2.FieldByName('SURNAME').AsString + ' ' +
      odsPeople_MIS2.FieldByName('NAME').AsString  + ' ' +
      odsPeople_MIS2.FieldByName('PATRON').AsString ;
    FPEOPLE_SHORT := odsPeople_MIS2.FieldByName('SURNAME').AsString + ' ' +
      Copy(odsPeople_MIS2.FieldByName('NAME').AsString,1,1)  + '. ' +
      Copy(odsPeople_MIS2.FieldByName('PATRON').AsString,1,1)+'.'  ;
    FMISUSER_ID:= odsPeople_MIS2.FieldByName('MIS_USER_ID').AsInteger ;
    FPEOPLE_ID := odsPeople_MIS2.FieldByName('ID').AsInteger ;;
  end;

  // устанавливаем специализацию
  odsSpec_MIS2.Close;
  odsSpec_MIS2.SetVariable('p_MIS_USER_ID', FMISUSER_ID);
  odsSpec_MIS2.Open;

  I:=  IniReadInteger(iniFileName, 'MIS2', 'LAST_EMP_ID', -1);
  odsSpec_MIS2.Locate('ID',I,[]);
  if odsSpec_MIS2.RecordCount > 0 then  EMP_ID := odsSpec_MIS2.FieldByName('ID').AsInteger;
end;

//------------------------------------------------------------------------------
// Преобразовывает имя пользователя и пароль по определенным правилам
//Note: Softmaster и MISADMIN не шифруются
procedure TdmMain.EncryptPassword(var AUser, APasswd: String);
begin
// TO сделать проверку на права  изменять пароль у других пользователй
  AUser := AnsiUpperCase(Copy(AUser,1,30));
  if (AUser <> 'SOFTMASTER') and (AUser <> 'MISADMIN') then
    AUser := '"Z'+AnsiUpperCase(Copy(AUser,1,30)) +'"';


  if (AUser <> 'SOFTMASTER') and (AUser <> 'MISADMIN') then
    APasswd := HashPassword(APasswd);
end;

// хешируюет строку по такуому же алгоритму как и пароль
function TdmMain.HashPassword(APAssword:String): String;
begin
  Result := Copy(uMD5.MD5DigestToStr(MD5String(APassword)),1,30);
end;

function TdmMain.DO_connect(AUser, APassword: String; var AError : string): boolean;
var
  CMDValue : String;
  UserNameStr : string;
  UserPasswdStr  : string;
begin
  if GetCmdSwitchValue('DataBase=', ['/'], CMDValue, True) then
    os.LogonDatabase := CMDValue;

  UserNameStr := AUser;
  UserPasswdStr := APassword;
  EncryptPassword(UserNameStr,UserPasswdStr);

  os.LogonUsername := UserNameStr;
  os.LogonPassword := UserPasswdStr;
//  os.LogonUsername := 'SYSTEM';
//  os.LogonPassword := 'SYS123';
//   ASU.PKG_SMINI.readstring ---- ????????

//  uLog.SaveToLog(sLogMainApp,Self.ClassName,5, 2,oss.LogonUsername+'@'+ oss.LogonDatabase);

  try
    os.Connected := True;
//    FSecurString := oss.LogonPassword ;
    os.LogonPassword := '----';
    os.DBMS_Application_Info.Set_Module(Self.ClassName,'');
    FDataBaseLogin := AUser;
  except
  // Стандартную конструкцию  on E:EOracleError do S :=E.Message;
  // нельзя использовать если логон происходит до Application.run
  // причины остались до конца неразгаданными
    on E: EOracleError do
    begin
//      AError := dmCore.GetTranslationOraError(E.Message);
      AError := E.Message;
//      AError := AError + #13+#10;
//      AError := AError + #13+#10 + 'Дополнительная инфорация:';
//      AError := AError + #13+#10 + 'OracleHomeDir: '+OracleHomeDir;
//      AError := AError + #13+#10 + 'OCI DLL: '+OCIDLL;
      AError := AError + #13+#10 + 'LogonDatabase: '+os.LogonDatabase;

      //AError := oss.ErrorMessage(oss.ReturnCode);
//      uLog.SaveToLog(sLogMainApp,Self.ClassName,5, 1, AError);
    end;
  end;

  result := os.Connected;
  if not Result  then exit;
  SetPeopleVariables;
end;
{$ENDIF}
// ----------------- MIS2 -----------------
{****************************************************************************************}
{                                 TdmMain.SetnCurMO
{****************************************************************************************}

procedure TdmMain.SetnCurMO(const Value: integer);
begin
  pkgMedSes.SETCURMO(Value);
end;

{****************************************************************************************}
{                                 TdmMain.GetnCurMO
{****************************************************************************************}

function TdmMain.GetnCurMO: integer;
begin
  Result := round(pkgMedSes.GETCURMO);
end;

{****************************************************************************************}
{                                 TdmMain.IsAdminUser
{****************************************************************************************}

function TdmMain.IsAdminUser: boolean;
var
  q: TOracleDataSet;
begin
  q := TOracleDataSet.Create(self);
  q.Session := os;
  q.Cursor := crSQLWait;
  q.SQL.Text :=
    'select granted_role from user_role_privs where granted_role=''MEDADMIN''';
  q.Open;
  if q.RecordCount <> 0 then begin
      result := true;
    end
  else begin
      result := false;
    end;
  q.free;
end;

function TdmMain.GetAPTSpec: integer;
var
  q: TOracleDataSet;
begin
  q := TOracleDataSet.Create(self);
  q.Session := os;
  q.SQL.Text := 'select get_aptspec as fk_spec from dual';
  q.Close;
  q.Open;
  result := q.FieldByName('FK_SPEC').AsInteger;
  q.free;
end;

function TdmMain.GetBuhSpec: integer;
var
  q: TOracleDataSet;
begin
  q := TOracleDataSet.Create(self);
  q.Session := os;
  q.SQL.Text := 'select get_buhspec as fk_spec from dual';
  q.Close;
  q.Open;
  result := q.FieldByName('FK_SPEC').AsInteger;
  q.free;
end;

procedure TdmMain.odsMedKartApplyRecord(Sender: TOracleDataSet; Action: Char; var Applied: Boolean; var NewRowId: string);
begin
  Applied := true;
end;

procedure TdmMain.osAfterLogOn(Sender: TOracleSession);
var Ver: TJvVersionInfo;
begin
   //вставка лога
   Sender.DBMS_Application_Info.Set_Client_Info(ParamStr(1));
   //Sender.DBMS_Application_Info.Set_Module(Application.Title + ' - ' + Self.caption, Sender.Owner.Name);
   ver := TJvVersionInfo.Create(AppFileName);
   Sender.DBMS_Application_Info.Set_Module(ExtractFileName(AppFileName) + ' (' + Ver.FileVersion + ')', Ver.Comments );
   ver.Free;

//  nSotrID := StrToInt(ParamStr(1));
//  nSpecID := StrToInt(ParamStr(2));
//   вставка лога
//   Sender.DBMS_Application_Info.Set_Client_Info(ParamStr(1));
//   Sender.DBMS_Application_Info.Set_Module(Application.Title + ' - ' + Self.caption, Sender.Owner.Name);
//   Sender.DBMS_Application_Info.Set_Module(ExtractFileName(Application.ExeName) + ' - ' + CurrentFileInfo(Application.ExeName),'');
end;

function TdmMain.SetbNyagan: Boolean;
var oq : TOracleQuery;
begin
// sysdate = 18.04.2006
//#todo3 убрать эту процедуру и все что связанно в будущем
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := Os;
    oq.Sql.Text := 'SELECT NULL FROM LOGIN.TAPPSOTR';
    try
      oq.Execute;
      Result := False;
    except
      Result := True;
    end;
  finally
    oq.Free;
  end;
end;

function TdmMain.SetLock(const aLockName: string; var aLOCKID : string; var aLockSotr : string): integer;
begin
  oqSetLock.SetVariable('pFC_LOCKNAME', aLockName);
  oqSetLock.SetVariable('PLOCKSOTR', aLockSotr);
  oqSetLock.Execute;

  Result := oqSetLock.GetVariable('PLOCKRESULT');
  if oqSetLock.GetVariable('PLOCKRESULT') = 0 then
    aLOCKID := oqSetLock.GetVariable('PLOCKID')
  else
  begin
    aLOCKID := '';
    aLockSotr := oqSetLock.GetVariable('PLOCKSOTR');
  end;
end;

function TdmMain.SetUnLock(const aLOCKID : string): boolean;
begin
  oqSetUnLock.SetVariable('PLOCKID', aLOCKID);
  oqSetUnLock.Execute;

  Result := (oqSetUnLock.GetVariable('PUNLOCKRESULT') = 0);
end;

function TdmMain.get_countstr(aNumber: Integer): string;
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := Os;
    oq.DeclareVariable('Number', otInteger);
    oq.DeclareVariable('ResStr', otString);
    oq.SetVariable('Number', aNumber);
    oq.Sql.Text := 'begin SELECT ASU.get_countstr( :Number ) into :ResStr FROM DUAL; end;';
    try
      oq.Execute;
      Result := oq.GetVariable('ResStr');
    except
      Result := '';
    end;
  finally
    oq.Free;
  end;
// AS FС_KOL,
end;

procedure TdmMain.ShowBalloonHint(aHintText, aHintHeader: string;  aForm: TCustomForm; x : Integer; y : Integer);
var
  xy : TPoint;
  HintDelay : Integer;
begin
//  if aForm = nil then aForm := Self;
  if (x = 0) and (y = 0) then
  begin
    xy.x := 13;//aForm.Width  - 20;
    xy.y := 0;//aForm.Height - 50;
  end
  else
  begin
    xy.x := x;
    xy.y := y;
  end;

  HintDelay := (Length(aHintText) + Length(aHintHeader))*150;
  if HintDelay < 5000 then HintDelay := 5000;

  if aForm = nil then
    bhtMain.ActivateHintPos(Application.MainForm, xy, aHintHeader, aHintText, HintDelay )
  else
    bhtMain.ActivateHintPos(aForm, xy, aHintHeader, aHintText, HintDelay);
end;

function TdmMain.IsTableRecordBuzy(const aTableName, aKeyName : string; const aKeyValue : integer; const aBuzyMessage : string = ''): Boolean;
var
  oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(self);
  oq.Session := dmMain.os;
  oq.Cursor := crSQLWait;
  oq.SQL.Text := 'select '+aKeyName+' from '+aTableName+' where '+aKeyName+' = :pFK_ID for update nowait';
  oq.DeclareVariable('pFK_ID', otInteger);

  oq.SetVariable('pFK_ID', aKeyValue);
  Result := False;
  try
    oq.Execute;
  except
    on E: EOracleError do
    begin
      if pos('ORA-00054', E.Message) > 0 then
      begin
        if aBuzyMessage <> '' then
          Application.MessageBox(PChar(aBuzyMessage), 'Ошибка', MB_OK + MB_ICONERROR);
        Result := True;
      end
      else
          Application.MessageBox(pChar(E.Message), 'Ошибка', MB_OK + MB_ICONERROR);
    end;
  end;
end;

function TdmMain.IsUsedInTMedic(const aKeyName: string; const aKeyValue: integer): Boolean;
var
  oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(self);
  oq.Session := dmMain.os;
//  oq.Cursor := crSQLWait;
  oq.SQL.Text := 'begin select count(1) into :pCount from MED.TMEDIC where '+aKeyName+' = :pFK_ID; end;';
  oq.DeclareVariable('pFK_ID', otInteger);
  oq.DeclareVariable('pCount', otInteger);

  oq.SetVariable('pFK_ID', aKeyValue);
  try
    oq.Execute;
    Result := oq.GetVariable('pCount') > 0;
  finally
    oq.Free;
  end;  
end;

procedure TdmMain.LoadInterfaceParams();
begin
  cxStyleGridEvenRow.Color       := IniReadInteger( iniFileName, 'InterfaceParams', 'MasterTableColorBgndEven', clWhite);
  cxStyleGridOddRow.Color        := IniReadInteger( iniFileName, 'InterfaceParams', 'MasterTableColorBgndOdd' , clWhite);
  cxStyleGridDetailEvenRow.Color := IniReadInteger( iniFileName, 'InterfaceParams', 'DetailTableColorBgndEven', clWhite);
  cxStyleGridDetailOddRow.Color  := IniReadInteger( iniFileName, 'InterfaceParams', 'DetailTableColorBgndOdd' , clWhite);
end;

procedure TdmMain.SaveInterfaceParams();
begin
  IniWriteInteger( iniFileName, 'InterfaceParams', 'MasterTableColorBgndEven', cxStyleGridEvenRow.Color      );
  IniWriteInteger( iniFileName, 'InterfaceParams', 'MasterTableColorBgndOdd' , cxStyleGridOddRow.Color       );
  IniWriteInteger( iniFileName, 'InterfaceParams', 'DetailTableColorBgndEven', cxStyleGridDetailEvenRow.Color);
  IniWriteInteger( iniFileName, 'InterfaceParams', 'DetailTableColorBgndOdd' , cxStyleGridDetailOddRow.Color );
end;

procedure cxDateEdit_PropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  // проверка на валидность
  if not ( IsValidDateEditValue( TcxDateEdit(Sender).Text) ) then
  begin
//    TcxDateEdit(Sender).EditValue := ServerDate(dmMain.os);
    TcxDateEdit(Sender).Undo;
    DisplayValue := TcxDateEdit(Sender).Text;
    TcxDateEdit(Sender).SetFocus;
    Error := True;
  end;
end;

procedure cxDateEdit_PropertiesValidate_WithNull(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  // проверка на валидность, допускается значение NULL
  if not ( (VarIsNull(TcxDateEdit(Sender).EditValue))or
           (VarIsClear(TcxDateEdit(Sender).EditValue))or
           (IsValidDateEditValue( TcxDateEdit(Sender).Text)) ) then
  begin
//    TcxDateEdit(Sender).EditValue := ServerDate(dmMain.os);
    TcxDateEdit(Sender).Undo;
    DisplayValue := TcxDateEdit(Sender).Text;
    TcxDateEdit(Sender).SetFocus;
    Error := True;
  end;
end;

function TdmMain.GetProvizorsMO_GROUPID: Integer;
begin
  odsGetProvizorGroup.Open;
  if odsGetProvizorGroup.RecordCount = 1 then
    Result := odsGetProvizorGroup.FieldByName('FK_CURMOGROUPID').AsInteger
  else
    Result := -1;
  odsGetProvizorGroup.Close;
end;

function TdmMain.GetFieldLength(aSCHEMENAME, aTABLENAME, aCOLUMNNAME : string): Integer;
begin
  try
    oqGetFieldLength.SetVariable('pSCHEMENAME', aSCHEMENAME);
    oqGetFieldLength.SetVariable('pTABLENAME', aTABLENAME);
    oqGetFieldLength.SetVariable('pCOLUMNNAME', aCOLUMNNAME);
    oqGetFieldLength.Execute;
    Result := oqGetFieldLength.GetVariable('PLENGTH');
  except
    Result := 0;
  end;
end;

procedure TdmMain.SetTempOst(PFK_MOGROUPID, PFK_KARTID: integer; PFN_KOL : Double);
begin
  oqInsTempOst.SetVariable('PFK_MOGROUPID', PFK_MOGROUPID);
  oqInsTempOst.SetVariable('PFK_KARTID', PFK_KARTID);
  oqInsTempOst.SetVariable('PFN_KOL', PFN_KOL);
  oqInsTempOst.Execute;
end;

procedure TdmMain.SetTempOstByDoc(PFK_MOGROUPID, PDPID: integer);
begin
  oqInsTempOst_By_Doc.SetVariable('PFK_MOGROUPID', PFK_MOGROUPID);
  oqInsTempOst_By_Doc.SetVariable('PDPID', PDPID);
  oqInsTempOst_By_Doc.Execute;
end;

procedure TdmMain.ClearTempOst(PFK_MOGROUPID: integer);
begin
  oqClearTempOst.SetVariable('PFK_MOGROUPID', PFK_MOGROUPID);
  oqClearTempOst.Execute;
end;

function TdmMain.GetLastDocDate(aFK_MOGROUPID: integer): TDate;
begin
  oqGetLastDocDate.SetVariable('pFK_MOGROUPID', aFK_MOGROUPID);
  oqGetLastDocDate.Execute;
  Result := fdmMain.nvl(oqGetLastDocDate.GetVariable('PFD_DATE'), ServerDate(os));
end;

procedure TdmMain.SetTKART_BRAK_UNIQSTR(aKartID: Integer; aBRAK_UNIQSTR: string; aCommit : Boolean = False);
begin
  oqSetTKART_BRAK_UNIQSTR.SetVariable('pKartID', aKartID);
  oqSetTKART_BRAK_UNIQSTR.SetVariable('PBRAK_UNIQSTR', aBRAK_UNIQSTR);
  oqSetTKART_BRAK_UNIQSTR.Execute;
  if aCommit then oqSetTKART_BRAK_UNIQSTR.Session.Commit;
end;

procedure TdmMain.SetTKART_FL_Brak(aKartID: Integer; aFL_Brak: Variant; aCommit : Boolean = False);
begin
  oqSetTKART_FL_Brak.SetVariable('pKartID', aKartID);
  oqSetTKART_FL_Brak.SetVariable('PFL_BRAK', aFL_Brak);
  oqSetTKART_FL_Brak.Execute;
  if aCommit then oqSetTKART_FL_Brak.Session.Commit;
end;

procedure TdmMain.InitAdditionalUpdateTable(aTableName: string);
begin
  oqAdditionalUpdateTable.DeleteVariables;
  oqAdditionalUpdateTable.SQL.Text := 'UPDATE '+aTableName+' SET ';
end;

procedure TdmMain.InsTTable_Links(aFK_ID1, aFC_TABLE1_NAME, aFK_ID2, aFC_TABLE2_NAME, aFN_LINK_TYPE: variant);
begin
  oqInsTTable_links.SetVariable('FK_ID1', aFK_ID1);
  oqInsTTable_links.SetVariable('FC_TABLE1_NAME', aFC_TABLE1_NAME);
  oqInsTTable_links.SetVariable('FK_ID2', aFK_ID2);
  oqInsTTable_links.SetVariable('FC_TABLE2_NAME', aFC_TABLE2_NAME);
  oqInsTTable_links.SetVariable('FN_LINK_TYPE', aFN_LINK_TYPE);
  oqInsTTable_links.Execute;  
end;

procedure TdmMain.DelTTable_Links(aFK_ID1, aFC_TABLE1_NAME, aFK_ID2, aFC_TABLE2_NAME, aFN_LINK_TYPE: variant);
begin
  oqDelTTable_links.SetVariable('FK_ID1', aFK_ID1);
  oqDelTTable_links.SetVariable('FC_TABLE1_NAME', aFC_TABLE1_NAME);
  oqDelTTable_links.SetVariable('FK_ID2', aFK_ID2);
  oqDelTTable_links.SetVariable('FC_TABLE2_NAME', aFC_TABLE2_NAME);
  oqDelTTable_links.SetVariable('FN_LINK_TYPE', aFN_LINK_TYPE);
  oqDelTTable_links.Execute;
end;

procedure TdmMain.AddAdditionalUpdateTable(aFieldName: string; aParamType: integer; aValue: variant);
begin
  oqAdditionalUpdateTable.SQL.Add(',  '+aFieldName+' = :p'+aFieldName);
  oqAdditionalUpdateTable.DeclareAndSet('p'+aFieldName, aParamType, aValue);
end;

procedure TdmMain.ExecuteAdditionalUpdateTable(aKeyFieldName: string; aParamType: integer; aValue: variant);
begin
  if oqAdditionalUpdateTable.VariableCount < 1 then Exit;
  oqAdditionalUpdateTable.SQL.Text := StringReplace(oqAdditionalUpdateTable.SQL.Text, ',', '', []);
  oqAdditionalUpdateTable.SQL.Add('WHERE '+aKeyFieldName+' = :p'+aKeyFieldName);
  oqAdditionalUpdateTable.DeclareAndSet('p'+aKeyFieldName, aParamType, aValue);
  oqAdditionalUpdateTable.Execute;
end;


procedure TdmMain.LOAD_FUNC_SHOW_MEDICEDIC_LEVEL(var aValue : variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_SHOW_MEDICEDIC_LEVEL', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_SHOW_ZAYAV(var aValue : variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_SHOW_ZAYAV', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_SHOW_ZAYAV_PRINT2(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_SHOW_ZAYAV_PRINT2', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_SHOW_PRODUCE_MEDIC(var aValue : variant);
begin
//  try
//    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_SHOW_PRODUCE_MEDIC', '1'));
//  except
//    aValue := 0;
//  end;
  {$IFDEF MIS2}
    aValue := False;
  {$ELSE}
  try
    aValue := (DO_CHECK_OBJECT_ACCESS(dmMain.os, dmMain.nSotrID, 'FUNC_SHOW_PRODUCE_MEDIC') > 0);
  except
    aValue := False;
  end;
  {$ENDIF}
end;

procedure TdmMain.LOAD_FUNC_SHOW_QUOTA_CODE(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_SHOW_QUOTA_CODE', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_SPIS_ON_PAC_BY_PROVIZOR(var aValue : variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_SPIS_ON_PAC_BY_PROVIZOR', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_SPIS_PAC_BY_NAZ_DATE(var aValue : variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_SPIS_PAC_BY_NAZ_DATE', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_SPIS_PAC_BY_SELECTED_DATE(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_SPIS_PAC_BY_SELECTED_DATE', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_SPIS_PAC_BY_FOUNDPAC(var aValue: variant);
begin
//  try
//    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_SPIS_PAC_BY_FOUNDPAC', '0'));
//  except
//    aValue := 0;
//  end;
  {$IFDEF MIS2}
    aValue := False;
  {$ELSE}
  try
    aValue := (DO_CHECK_OBJECT_ACCESS(dmMain.os, dmMain.nSotrID, 'FUNC_SPIS_PAC_BY_FOUNDPAC') > 0);
  except
    aValue := False;
  end;
  {$ENDIF}
end;

procedure TdmMain.LOAD_FUNC_SPIS_PRICH_BY_SMS(var aValue : variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_SPIS_PRICH_BY_SMS', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_STORE_REPORT_USE_IN_TSMINI(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_STORE_REPORT_USE_IN_TSMINI', '0'));
  except
    aValue := 0;
  end;
end;

//procedure TdmMain.LOAD_FUNC_TREB_BY_NAZN(var aValue : variant);
//begin
//  try
//    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_TREB_BY_NAZN', '0'));
//  except
//    aValue := 0;
//  end;
//end;

procedure TdmMain.LOAD_FUNC_TREB_KOL_ON_ADD_IN_TREBNAKL(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_TREB_KOL_ON_ADD_IN_TREBNAKL', '1'));
  except
    aValue := 1;
  end;
end;

procedure TdmMain.LOAD_FUNC_TREB_NAZN_LIST_FROM_ANYWHERE(var aValue: variant);
begin
  try
    aValue := (DO_CHECK_OBJECT_ACCESS(dmMain.os, dmMain.nSotrID, 'FUNC_TREB_NAZN_LIST_FROM_ANYWHERE') > 0);
  except
    aValue := False;
  end;
end;

procedure TdmMain.LOAD_Func_Set(var aValue : variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_SET', IntToStr(FUNC_SET_HANTI)));
  except
    aValue := FUNC_SET_HANTI;
  end;
end;

procedure TdmMain.LOAD_Medses_Give_Mode(var aValue : variant);
begin
  {
  // Added by A.Nakorjakov 17.12.2007 12:17:50
  Start
  }
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'MEDSES_GIVE_MODE', IntToStr(NOBODYMODE)));
  except
    aValue := NOBODYMODE;
  end;
  {
  // Added by A.Nakorjakov 17.12.2007 12:17:50
  Finished
  }
end;

//procedure TdmMain.LOAD_FUNC_MAINT_PARAMS_STORE(var aValue: variant);
//begin
//{$IFDEF MIS2}
//  aValue := 1;
//{$ELSE}
//  aValue := 0;
//{$ENDIF}
//end;

procedure TdmMain.LOAD_FUNC_MEDIC_VISIBLE_FOR_NOT_APTEKA(var aValue : variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_MEDIC_VISIBLE_FOR_NOT_APTEKA', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_MOGROUP_FL_POST(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_MOGROUP_FL_POST', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_REQUIRE_FINSOURCE_IN_TREB(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_REQUIRE_FINSOURCE_IN_TREB', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_RETURN(var aValue : variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_RETURN', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_SAVE_ZAKL_KOM(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_SAVE_ZAKL_KOM', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_PRINT_VEDOM_VIBORKI(var aValue : variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_PRINT_VEDOM_VIBORKI', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_CHECK_PRICES_IN_NAKL(var aValue : variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_CHECK_PRICES_IN_NAKL', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_COUNT_SPIS_CHLEN_KOM(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_COUNT_SPIS_CHLEN_KOM', '3'));
  except
    aValue := 3;
  end;
end;

procedure TdmMain.LOAD_FUNC_DAMAGED_TREB_NAKL(var aValue: variant);
begin
  {$IFDEF MIS2}
    aValue := False;
  {$ELSE}
  try
    aValue := (DO_CHECK_OBJECT_ACCESS(dmMain.os, dmMain.nSotrID, 'FUNC_DAMAGED_TREB_NAKL') > 0);
  except
    aValue := False;
  end;
  {$ENDIF}
end;


//Added by Neronov A.S. 20.05.2012
procedure TdmMain.LOAD_FUNC_CAN_EDIT_MEDIC(var aValue: variant);
begin
  try
    aValue := (DO_CHECK_OBJECT_ACCESS(dmMain.os, dmMain.nSotrID, 'FUNC_CAN_EDIT_MEDIC') > 0);
  except
    aValue := False;
  end;
end;

procedure TdmMain.LOAD_FUNC_CAN_EDIT_TFINSOURCE(var aValue: variant);
begin
  try
    aValue := (DO_CHECK_OBJECT_ACCESS(dmMain.os, dmMain.nSotrID, 'FUNC_CAN_EDIT_TFINSOURCE') > 0);
  except
    aValue := False;
  end;
end;

procedure TdmMain.LOAD_FUNC_CAN_SIGN_INVENTORY(var aValue: variant);
begin
  try
    aValue := (DO_CHECK_OBJECT_ACCESS(dmMain.os, dmMain.nSotrID, 'FUNC_CAN_SIGN_INVENTORY') > 0);
  except
    aValue := False;
  end;
end;

//Added by Neronov A.S. 14.12.2011
procedure TdmMain.LOAD_FUNC_MOVE_TO_OR_FROM_REZERV(var aValue: variant);
begin
  try
    aValue := (DO_CHECK_OBJECT_ACCESS(dmMain.os, dmMain.nSotrID, 'FUNC_MOVE_TO_OR_FROM_REZERV') > 0);
  except
    aValue := False;
  end;
end;

//Added by Neronov A.S. 14.12.2011
procedure TdmMain.LOAD_FUNC_RESTRICT_REZERV(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_RESTRICT_REZERV', '0'));
  except
    aValue := 0;
  end;
end;

//Added by Neronov A.S. 17.12.2011
procedure TdmMain.LOAD_FUNC_CHECK_DOC_NUM(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_CHECK_DOC_NUM', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_COLORED_KART_BY_SROKY(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_COLORED_KART_BY_SROKY', '1'));
  except
    aValue := 1;
  end;
end;

procedure TdmMain.LOAD_FUNC_COLORED_KART_BY_SROKY_RED_RANGE(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_COLORED_KART_BY_SROKY_RED_RANGE', '1'));
  except
    aValue := 1;
  end;
end;  

procedure TdmMain.LOAD_FUNC_COLORED_KART_BY_SROKY_YELLOW_RANGE(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_COLORED_KART_BY_SROKY_YELLOW_RANGE', '7'));
  except
    aValue := 7;
  end;
end;   

procedure TdmMain.LOAD_FUNC_USE_COMPLEX_AUTOFILL(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_USE_COMPLEX_AUTOFILL', '0'));
  except
    aValue := 0;
  end;   
end;

procedure TdmMain.LOAD_FUNC_COLORED_KART_BY_SROKY_GREEN_RANGE(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_COLORED_KART_BY_SROKY_GREEN_RANGE', '31'));
  except
    aValue := 31;
  end;
end;

procedure TdmMain.LOAD_FUNC_SHOW_INV_OLD_VIEW(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_SHOW_INV_OLD_VIEW', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_DOCS_AUTONUM(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_DOCS_AUTONUM', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_DOGOVOR_NAKL_ENABLE(var aValue: variant);
begin
  {$IFDEF MIS2}
    aValue := False;
  {$ELSE}
  try
    aValue := (DO_CHECK_OBJECT_ACCESS(dmMain.os, dmMain.nSotrID, 'FUNC_DOGOVOR_NAKL_ENABLE') > 0);// Added by Voronov 30.09.2009
  except
    aValue := False;
  end;
  {$ENDIF}
end;

procedure TdmMain.LOAD_FUNC_PRINT_TREBNAKL_USE_PAGE_ORIENTATION(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_PRINT_TREBNAKL_USE_PAGE_ORIENTATION', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_PRINT_TREB_NAKL_V2(var aValue: variant);
begin
  {$IFDEF MIS2}
    aValue := False;
  {$ELSE}
  try
    aValue := (DO_CHECK_OBJECT_ACCESS(dmMain.os, dmMain.nSotrID, 'FUNC_PRINT_TREB_NAKL_V2') > 0);
  except
    aValue := False;
  end;
  {$ENDIF}
end;


procedure TdmMain.LOAD_FUNC_FAS_EI_UHC(var aValue : variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_FAS_EI_UHC', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_SPIS_BY_ONE_SKLAD(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_SPIS_BY_ONE_SKLAD', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_SPIS_HITEC(var aValue : variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_SPIS_HITEC', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_EDIT_TREB_IN_RASH(var aValue : variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_EDIT_TREB_IN_RASH', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_USE_SKLAD(var aValue : variant);
var
  oq : TOracleQuery;
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_USE_SKLAD', '0'));
    oq := TOracleQuery.Create(nil);
    oq.Session := os;
    oq.SQL.Text := 'begin MED.pkg_medses.set_IsUseSklad('+IntToStr(aValue)+');  end;';
    oq.Execute;
    oq.Free;
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_USE_SMS_IN_ACT_SPIS(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_USE_SMS_IN_ACT_SPIS', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_USE_TARA_IN_RPO(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_USE_TARA_IN_RPO', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_USE_TREB_QUOTA(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_USE_TREB_QUOTA', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_USE_VRACH_KOMISS(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_USE_VRACH_KOMISS', '0'));
  except
    aValue := 0;
  end;       
end;

procedure TdmMain.LOAD_FUNC_USE_ZAV_OTD_IN_ACT_SPIS(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_USE_ZAV_OTD_IN_ACT_SPIS', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_VIDMOVE_2_NUMBER_AUTO_FILL_MODE(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_VIDMOVE_2_NUMBER_AUTO_FILL_MODE', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_VIDMOVE_3_NUMBER_AUTO_FILL_MODE(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_VIDMOVE_3_NUMBER_AUTO_FILL_MODE', '1'));
  except
    aValue := 1;
  end;
end;

procedure TdmMain.LOAD_FUNC_VID_POST_REQUARE(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_VID_POST_REQUARE', '1'));
  except
    aValue := 1;
  end;
end;

procedure TdmMain.LOAD_FUNC_ADD_MED_TO_TREB_BY_SKLAD_OST(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_ADD_MED_TO_TREB_BY_SKLAD_OST', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_ADD_MED_TO_TREB_BY_CUR_OST(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_ADD_MED_TO_TREB_BY_CUR_OST', '1'));
  except
    aValue := 1;
  end;
end;

procedure TdmMain.LOAD_FUNC_MEDIC_COUNT_IN_TREB(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_MEDIC_COUNT_IN_TREB', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_USE_TREB_FOR_RPO(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_USE_TREB_FOR_RPO', '0'));
  except
    aValue := 0;
  end;
end;

//Added by Neronov A.S. 01.11.2011
procedure TdmMain.LOAD_FUNC_SHOW_OST_BY_DATE_NOT_ONLY_PROVIZOR(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_SHOW_OST_BY_DATE_NOT_ONLY_PROVIZOR', '0'));
  except
    aValue := 0;
  end;
end;

//Added by Neronov A.S. 27.03.2012
procedure TdmMain.LOAD_FUNC_SHOW_OST_BY_GROUP_NOT_ONLY_PROVIZOR(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_SHOW_OST_BY_GROUP_NOT_ONLY_PROVIZOR', '0'));
  except
    aValue := 0;
  end;
end;

//Added by Neronov A.S. 25.11.2011
procedure TdmMain.LOAD_FUNC_USE_SYSDATE_FOR_TREB_NAKL(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_USE_SYSDATE_FOR_TREB_NAKL', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_NO_AUTOFILTER_IN_RASH_BY_TREB(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_NO_AUTOFILTER_IN_RASH_BY_TREB', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_CHANGE_DOC_DATE_RIGHT(var aValue: variant);
begin
  {$IFDEF MIS2}
    aValue := False;
  {$ELSE}
  try
    aValue := (DO_CHECK_OBJECT_ACCESS(dmMain.os, dmMain.nSotrID, 'FUNC_CHANGE_DOC_DATE_RIGHT') > 0);
  except
    aValue := False;
  end;
  {$ENDIF}
end;

procedure TdmMain.LOAD_FUNC_CHECK_BRAK(var aValue : variant);
begin
  {$IFDEF MIS2}
    aValue := False;
  {$ELSE}
  try
    aValue := (DO_CHECK_OBJECT_ACCESS(dmMain.os, dmMain.nSotrID, 'FUNC_CHECK_BRAK_ENABLE') > 0);// Added by Voronov 15.02.2009
  except
    aValue := False;
  end;
  {$ENDIF}
end;

procedure TdmMain.LOAD_FUNC_SHOW_KONTRAKT(var aValue : variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_SHOW_KONTRAKT', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_SHOW_KONTRAKT_WO_LIST(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_SHOW_KONTRAKT_WO_LIST', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_SHOW_SCHET_FAKTURA(var aValue : variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_SHOW_SCHET_FAKTURA', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_SHOW_SCHET_FAKTURA_WO_LIST(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_SHOW_SCHET_FAKTURA_WO_LIST', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_SHOW_TEMPLATES_VID_MOVE_8(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_SHOW_TEMPLATES_VID_MOVE_8', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_SET_VID_POM_HITECH(var aValue: variant);
begin
  {$IFDEF MIS2}
    aValue := False;
  {$ELSE}
  try
    aValue := (DO_CHECK_OBJECT_ACCESS(dmMain.os, dmMain.nSotrID, 'FUNC_SET_VID_POM_HITECH') > 0);
  except
    aValue := False;
  end;
  {$ENDIF}
end;

procedure TdmMain.LOAD_FUNC_SHOW_FIN_SOURCE(var aValue : variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_SHOW_FIN_SOURCE', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_SHOW_INV_NOMER(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_SHOW_INV_NOMER', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_SHOW_PAY_COND(var aValue : variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_SHOW_PAY_COND', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_USE_FIN_SOURCE_IN_SPIS_BY_PAC(var aValue : variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_USE_FIN_SOURCE_IN_SPIS_BY_PAC', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_USE_FIN_SOURCE_IN_SPIS_PO_PRICHINE( var aValue: variant );
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_USE_FIN_SOURCE_IN_SPIS_PO_PRICHINE', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_USE_GROUP_LF(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_USE_GROUP_LF', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_USE_JNVLS(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_USE_JNVLS', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_USE_MIBP(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_USE_MIBP', '0'));
  except
    aValue := 0;
  end;
end;     

procedure TdmMain.LOAD_FUNC_USE_MEDUCHGRP_CH(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_USE_MEDUCHGRP_CH', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_USE_FORMULAR(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_USE_FORMULAR', '0'));
  except
    aValue := 0;
  end;
end;

//Added by Neronov A.S. 25.01.2013
procedure TdmMain.LOAD_FUNC_BLOCK_SIGN_DOCMOVE_TO_APTEKA(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_BLOCK_SIGN_DOCMOVE_TO_APTEKA', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_APTEKA_MO_GROUP_ID(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('DMEDNAZ.DLL', 'APTEKA_MO_GROUP_ID', '-1'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_CAN_EDIT_FORMULAR(var aValue: variant);
begin
  try
    aValue := (DO_CHECK_OBJECT_ACCESS(dmMain.os, dmMain.nSotrID, 'FUNC_CAN_EDIT_FORMULAR') > 0);
  except
    aValue := False;
  end;
end;

//Added by Neronov A.S. 27.08.2012
procedure TdmMain.LOAD_FUNC_USE_PROFIL(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_USE_PROFIL', '0'));
  except
    aValue := 0;
  end;
end;

//Added by Neronov A.S. 18.09.2012
procedure TdmMain.LOAD_FUNC_USE_FINSOURCE_IN_RPO(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_USE_FINSOURCE_IN_RPO', '0'));
  except
    aValue := 0;
  end;
end;

//Added by Neronov A.S. 05.11.2012
procedure TdmMain.LOAD_FUNC_USE_ONLY_FR4(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_USE_ONLY_FR4', '0'));
  except
    aValue := 0;
  end;
end;

//Added by Neronov A.S. 27.11.2012
procedure TdmMain.LOAD_FUNC_SHOW_DRUGID(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_SHOW_DRUGID', '0'));
  except
    aValue := 0;
  end;
end;

//Added by Neronov A.S. 06.08.2012
procedure TdmMain.LOAD_FUNC_IGNORE_TREB_PODPIS(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_IGNORE_TREB_PODPIS', '1'));
  except
    aValue := 1;
  end;
end;

//Added by Neronov A.S. 20.05.2012
procedure TdmMain.LOAD_FUNC_USE_RIGHT_EDIT_MEDIC(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_USE_RIGHT_EDIT_MEDIC', '0'));
  except
    aValue := 0;
  end;
end;

//Added by Neronov A.S. 19.04.2012
procedure TdmMain.LOAD_FUNC_COPY_COMMENT_IN_TREB(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_COPY_COMMENT_IN_TREB', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_INPUT_SUM_OR_KOL(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_INPUT_SUM_OR_KOL', '0'));
  except
    aValue := 0;
  end;
end;

//Added by Neronov A.S. 13.04.2012
procedure TdmMain.LOAD_FUNC_BLOCK_DOCNUM_WITH_AUTONUM(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_BLOCK_DOCNUM_WITH_AUTONUM', '0'));
  except
    aValue := 0;
  end;
end;

//Added by Neronov A.S. 13.04.2012
procedure TdmMain.LOAD_FUNC_UNBLOCK_DOCNUM_WITH_AUTONUM(var aValue: variant);
begin
  {$IFDEF MIS2}
    aValue := False;
  {$ELSE}
  try
    aValue := (DO_CHECK_OBJECT_ACCESS(dmMain.os, dmMain.nSotrID, 'FUNC_UNBLOCK_DOCNUM_WITH_AUTONUM') > 0);
  except
    aValue := False;
  end;
  {$ENDIF}
end;

procedure TdmMain.LOAD_FUNC_SHOW_PAC_IN_SPIS(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_SHOW_PAC_IN_SPIS', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_FIN_SOURCE_IN_ACT_SPIS(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_FIN_SOURCE_IN_ACT_SPIS', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_FIN_SOURCE_IS_REQUIRE(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_FIN_SOURCE_IS_REQUIRE', '1'));
  except
    aValue := 1;
  end;
end;

procedure TdmMain.LOAD_FUNC_IMP_NAKL_ENABLE(var aValue: variant);
begin
  {$IFDEF MIS2}
    aValue := False;
  {$ELSE}
  try
    aValue := (DO_CHECK_OBJECT_ACCESS(dmMain.os, dmMain.nSotrID, 'FUNC_IMP_NAKL_ENABLE') > 0);// Added by Voronov 30.09.2009
  except
    aValue := False;
  end;
  {$ENDIF}
end;

procedure TdmMain.LOAD_FUNC_IS_PRINT_TREB_NAKL_ABSENT_MEDICS(
  var aValue: variant);
begin
  {$IFDEF MIS2}
    aValue := False;
  {$ELSE}
  try
    aValue := (DO_CHECK_OBJECT_ACCESS(dmMain.os, dmMain.nSotrID, 'FUNC_IS_PRINT_TREB_NAKL_ABSENT_MEDICS') > 0);
  except
    aValue := False;
  end;
  {$ENDIF}
end;

procedure TdmMain.LOAD_FUNC_IS_PRINT_TREB_NAKL_VID0_MEDICS(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_IS_PRINT_TREB_NAKL_VID0_MEDICS', '1'));
  except
    aValue := 1;
  end;
end;

procedure TdmMain.LOAD_FUNC_IS_PRINT_VIDANO_IN_TREB_NAKL_BY_TREBID( var aValue: variant );
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_IS_PRINT_VIDANO_IN_TREB_NAKL_BY_TREBID', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_SHOW_LAT_NAME_IN_RASH_BY_TREB(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_SHOW_LAT_NAME_IN_RASH_BY_TREB', '1'));
  except
    aValue := 1;
  end;
end;

procedure TdmMain.LOAD_FUNC_SHOW_LAT_NAME_IN_TREB(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_SHOW_LAT_NAME_IN_TREB', '1'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_SHOW_LIST_SIGNS_IN_PRINT_TREB(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_SHOW_LIST_SIGNS_IN_PRINT_TREB', '1'));
  except
    aValue := 1;
  end;
end;

procedure TdmMain.LOAD_FUNC_UNSIGN_DOC_RIGHT(var aValue: variant);
begin
  {$IFDEF MIS2}
    aValue := False;
  {$ELSE}
  try
    aValue := (DO_CHECK_OBJECT_ACCESS(dmMain.os, dmMain.nSotrID, 'FUNC_UNSIGN_DOC_RIGHT') > 0);
  except
    aValue := False;
  end;
  {$ENDIF}
end;

procedure TdmMain.LOAD_FUNC_USE_CROSS_TABLE_CHECK(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_USE_CROSS_TABLE_CHECK', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_USE_DOC_CHEK_OST_BY_REG_DATA(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_USE_DOC_CHEK_OST_BY_REG_DATA', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_USE_ECP_IN_TREB(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_USE_ECP_IN_TREB', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_USE_EDITED_INVENTORY(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_USE_EDITED_INVENTORY', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_USE_MIXED_FIN_SOURCE_IN_PRIH(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_USE_MIXED_FIN_SOURCE_IN_PRIH', '1'));
  except
    aValue := 1;
  end;
end;

procedure TdmMain.LOAD_FUNC_USE_MOVE_TO_MOGROUP_BY_PROVIZOR(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_USE_MOVE_TO_MOGROUP_BY_PROVIZOR', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_USE_NACENKA(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_USE_NACENKA', '1'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_USE_NDS(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_USE_NDS', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_USE_RASH_BY_TREB(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_USE_RASH_BY_TREB', '1'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_USE_RASH_TREB_AUTOCORRECT(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_USE_RASH_TREB_AUTOCORRECT', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_NOT_NEGATIVE_OST(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_NOT_NEGATIVE_OST', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_USE_RPO_DIFF(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_USE_RPO_DIFF', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_ONLY_SOST_MEDICS_FOR_TREB_TO_RPO(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_ONLY_SOST_MEDICS_FOR_TREB_TO_RPO', '0'));
  except
    aValue := 0;
  end;
end;


procedure TdmMain.LOAD_FUNC_USE_FIN_SOURCE_IN_AUTOFILL(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_USE_FIN_SOURCE_IN_AUTOFILL', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_REQUARE_GODEN (var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_REQUARE_GODEN', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_REQUARE_PRODCERT (var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_REQUARE_PRODCERT', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_SHOW_FILTERROW (var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_SHOW_FILTERROW', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_RASH_BY_TREB_MANY_SKLAD(var aValue: variant);
begin
  try
    aValue := (DO_CHECK_OBJECT_ACCESS(dmMain.os, dmMain.nSotrID, 'FUNC_RASH_BY_TREB_MANY_SKLAD') > 0);
  except
    aValue := False;
  end;
end;

procedure TdmMain.LOAD_FUNC_REPLACE_PRICE_AND_SUMM_IN_PARTY (var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_REPLACE_PRICE_AND_SUMM_IN_PARTY', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_HIDE_NACENKA (var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_HIDE_NACENKA', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_USE_MEDICPRODCERT (var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_USE_MEDICPRODCERT', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_USE_CLASS (var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_USE_CLASS', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_USE_LAT_NAME_IN_TREB_IN_TREBLIST (var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_USE_LAT_NAME_IN_TREB_IN_TREBLIST', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_USE_OKDP (var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_USE_OKDP', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_USE_FORM_KOMISS(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_USE_FORM_KOMISS', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_USE_RIGHT_EDT_EI(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_USE_RIGHT_EDT_EI', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.LOAD_FUNC_USE_RIGHT_RECALC_OST(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_USE_RIGHT_RECALC_OST', '0'));
  except
    aValue := 0;
  end;
end;

procedure TdmMain.FUNC_RIGHT_EDT_EI(var aValue: variant);
begin
  {$IFDEF MIS2}
    aValue := False;
  {$ELSE}
  try
    aValue := (DO_CHECK_OBJECT_ACCESS(dmMain.os, dmMain.nSotrID, 'FUNC_RIGHT_EDT_EI') > 0);
  except
    aValue := False;
  end;
  {$ENDIF}
end;

procedure TdmMain.LOAD_FUNC_RIGHT_RECALC_OST(var aValue: variant);
begin
  {$IFDEF MIS2}
    aValue := False;
  {$ELSE}
  try
    aValue := (DO_CHECK_OBJECT_ACCESS(dmMain.os, dmMain.nSotrID, 'FUNC_RIGHT_RECALC_OST') > 0);
  except
    aValue := False;
  end;
  {$ENDIF}
end;

//Add Malev A.V. 07/06/2013
procedure TdmMain.LOAD_IS_SHORT_NAKL(var aValue: variant);
begin
  aValue := uDBTableUtils.TDBUtils.GetFunctionDef('MEDICA_IS_SHORT_NAKL', dmMain.os, 0);
end;
//--Add Malev A.V. 07/06/2013

//Add Malev A.V. 20/06/2013
procedure TdmMain.LOAD_IS_USE_ATC_ROOT_FUNCT(var aValue: variant);
begin
  aValue := (uDBTableUtils.TDBUtils.GetFunctionDef('MEDICA_ATC_ROOT_FUNCT', dmMain.os, 0) = 1);
end;
//--Add Malev A.V. 20/06/2013

procedure TdmMain.LOAD_FUNC_USE_NARCOTIC_ACT(var aValue: variant);
begin
  try
    aValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_USE_NARCOTIC_ACT', '0'));
  except
    aValue := 0;
  end;
end;

end.

