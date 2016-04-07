unit fACNK;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxGraphics, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxTextEdit, cxMaskEdit, cxCalendar, cxControls,
  cxContainer, cxEdit, cxLabel, ExtCtrls, cxLookAndFeelPainters, cxGroupBox,
  cxButtonEdit, cxSpinEdit, dxSkinscxPCPainter, cxPC, cxCurrencyEdit,
  dxSkinsdxBarPainter, dxBar, cxClasses, ActnList, DB, Oracle, OracleData,
  RVScroll, RichView, RVEdit, RVStyle, cxTimeEdit, DateUtils, frxClass;

type
  TfrmACNK = class(TForm)
    Shape1: TShape;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    deDate: TcxDateEdit;
    cxLabel3: TcxLabel;
    lcbVrach: TcxLookupComboBox;
    cxGroupBox1: TcxGroupBox;
    cxLabel4: TcxLabel;
    lbPac: TcxLabel;
    cxLabel5: TcxLabel;
    lbAge: TcxLabel;
    cxLabel6: TcxLabel;
    lbOtdel: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    lbNumMK: TcxLabel;
    cxLabel11: TcxLabel;
    Panel1: TPanel;
    cxLabel21: TcxLabel;
    cxLabel22: TcxLabel;
    cxLabel23: TcxLabel;
    cxLabel24: TcxLabel;
    cxLabel25: TcxLabel;
    lcbAccess: TcxLookupComboBox;
    lcbKontrast: TcxLookupComboBox;
    seKolvo: TcxSpinEdit;
    lcbAorta: TcxLookupComboBox;
    lcbRecom: TcxLookupComboBox;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    Panel6: TPanel;
    cxLabel26: TcxLabel;
    cxLabel33: TcxLabel;
    lcbRg17: TcxLookupComboBox;
    cxLabel34: TcxLabel;
    lcbRg18: TcxLookupComboBox;
    cxLabel35: TcxLabel;
    lcbRg19: TcxLookupComboBox;
    cxLabel36: TcxLabel;
    beRg5: TcxButtonEdit;
    cxLabel37: TcxLabel;
    lcbRg20: TcxLookupComboBox;
    cxLabel38: TcxLabel;
    lcbRg21: TcxLookupComboBox;
    Panel7: TPanel;
    cxLabel39: TcxLabel;
    cxLabel40: TcxLabel;
    lcbRg22: TcxLookupComboBox;
    cxLabel68: TcxLabel;
    lcbRg23: TcxLookupComboBox;
    cxLabel69: TcxLabel;
    lcbRg24: TcxLookupComboBox;
    cxLabel70: TcxLabel;
    beRg6: TcxButtonEdit;
    cxLabel71: TcxLabel;
    lcbRg25: TcxLookupComboBox;
    cxLabel72: TcxLabel;
    lcbRg26: TcxLookupComboBox;
    Panel8: TPanel;
    cxLabel42: TcxLabel;
    cxLabel43: TcxLabel;
    lcbRg27: TcxLookupComboBox;
    cxLabel44: TcxLabel;
    lcbRg28: TcxLookupComboBox;
    cxLabel45: TcxLabel;
    lcbRg29: TcxLookupComboBox;
    cxLabel46: TcxLabel;
    beRg7: TcxButtonEdit;
    cxLabel48: TcxLabel;
    lcbRg30: TcxLookupComboBox;
    cxLabel73: TcxLabel;
    lcbRg31: TcxLookupComboBox;
    Panel9: TPanel;
    cxLabel80: TcxLabel;
    cxLabel81: TcxLabel;
    lcbRg32: TcxLookupComboBox;
    cxLabel84: TcxLabel;
    lcbRg34: TcxLookupComboBox;
    cxLabel85: TcxLabel;
    beRg8: TcxButtonEdit;
    cxLabel86: TcxLabel;
    lcbRg35: TcxLookupComboBox;
    cxLabel87: TcxLabel;
    lcbRg36: TcxLookupComboBox;
    Panel18: TPanel;
    cxLabel123: TcxLabel;
    cxLabel124: TcxLabel;
    lcbRg37: TcxLookupComboBox;
    cxLabel126: TcxLabel;
    lcbRg39: TcxLookupComboBox;
    cxLabel127: TcxLabel;
    beRg9: TcxButtonEdit;
    cxLabel128: TcxLabel;
    lcbRg40: TcxLookupComboBox;
    cxLabel129: TcxLabel;
    lcbRg41: TcxLookupComboBox;
    Panel3: TPanel;
    cxLabel12: TcxLabel;
    lcbRgIz: TcxLookupComboBox;
    cxLabel13: TcxLabel;
    lcbRg1: TcxLookupComboBox;
    cxLabel14: TcxLabel;
    beRg1: TcxButtonEdit;
    cxLabel15: TcxLabel;
    lcbRg2: TcxLookupComboBox;
    cxLabel16: TcxLabel;
    lcbRg3: TcxLookupComboBox;
    cxLabel17: TcxLabel;
    lcbRg4: TcxLookupComboBox;
    cxLabel18: TcxLabel;
    beRg2: TcxButtonEdit;
    cxLabel19: TcxLabel;
    lcbRg5: TcxLookupComboBox;
    cxLabel20: TcxLabel;
    lcbRg6: TcxLookupComboBox;
    cxLabel41: TcxLabel;
    Panel4: TPanel;
    cxLabel82: TcxLabel;
    cxLabel47: TcxLabel;
    lcbRg7: TcxLookupComboBox;
    cxLabel49: TcxLabel;
    lcbRg8: TcxLookupComboBox;
    cxLabel75: TcxLabel;
    lcbRg9: TcxLookupComboBox;
    cxLabel76: TcxLabel;
    beRg3: TcxButtonEdit;
    cxLabel77: TcxLabel;
    lcbRg10: TcxLookupComboBox;
    cxLabel78: TcxLabel;
    lcbRg11: TcxLookupComboBox;
    Panel5: TPanel;
    cxLabel27: TcxLabel;
    cxLabel28: TcxLabel;
    lcbRg12: TcxLookupComboBox;
    cxLabel29: TcxLabel;
    lcbRg13: TcxLookupComboBox;
    cxLabel30: TcxLabel;
    lcbRg14: TcxLookupComboBox;
    cxLabel31: TcxLabel;
    beRg4: TcxButtonEdit;
    cxLabel32: TcxLabel;
    lcbRg15: TcxLookupComboBox;
    cxLabel79: TcxLabel;
    lcbRg16: TcxLookupComboBox;
    Panel2: TPanel;
    cxLabel74: TcxLabel;
    lcbRgClear: TcxLookupComboBox;
    Panel10: TPanel;
    cxLabel50: TcxLabel;
    lcbLfIz: TcxLookupComboBox;
    cxLabel51: TcxLabel;
    lcbLf1: TcxLookupComboBox;
    cxLabel52: TcxLabel;
    beLf1: TcxButtonEdit;
    cxLabel53: TcxLabel;
    lcbLf2: TcxLookupComboBox;
    cxLabel54: TcxLabel;
    lcbLf3: TcxLookupComboBox;
    cxLabel55: TcxLabel;
    lcbLf4: TcxLookupComboBox;
    cxLabel56: TcxLabel;
    beLf2: TcxButtonEdit;
    cxLabel57: TcxLabel;
    lcbLf5: TcxLookupComboBox;
    cxLabel58: TcxLabel;
    lcbLf6: TcxLookupComboBox;
    cxLabel88: TcxLabel;
    Panel15: TPanel;
    cxLabel108: TcxLabel;
    cxLabel109: TcxLabel;
    lcbLf7: TcxLookupComboBox;
    cxLabel110: TcxLabel;
    lcbLf8: TcxLookupComboBox;
    cxLabel111: TcxLabel;
    lcbLf9: TcxLookupComboBox;
    cxLabel112: TcxLabel;
    beLf3: TcxButtonEdit;
    cxLabel113: TcxLabel;
    lcbLf10: TcxLookupComboBox;
    cxLabel114: TcxLabel;
    lcbLf11: TcxLookupComboBox;
    Panel16: TPanel;
    cxLabel115: TcxLabel;
    cxLabel116: TcxLabel;
    lcbLf12: TcxLookupComboBox;
    cxLabel117: TcxLabel;
    lcbLf13: TcxLookupComboBox;
    cxLabel118: TcxLabel;
    lcbLf14: TcxLookupComboBox;
    cxLabel119: TcxLabel;
    beLf4: TcxButtonEdit;
    cxLabel120: TcxLabel;
    lcbLf15: TcxLookupComboBox;
    cxLabel121: TcxLabel;
    lcbLf16: TcxLookupComboBox;
    Panel11: TPanel;
    cxLabel59: TcxLabel;
    cxLabel60: TcxLabel;
    lcbLf17: TcxLookupComboBox;
    cxLabel61: TcxLabel;
    lcbLf18: TcxLookupComboBox;
    cxLabel62: TcxLabel;
    lcbLf19: TcxLookupComboBox;
    cxLabel63: TcxLabel;
    beLf5: TcxButtonEdit;
    cxLabel64: TcxLabel;
    lcbLf20: TcxLookupComboBox;
    cxLabel65: TcxLabel;
    lcbLf21: TcxLookupComboBox;
    Panel12: TPanel;
    cxLabel66: TcxLabel;
    cxLabel67: TcxLabel;
    lcbLf22: TcxLookupComboBox;
    cxLabel89: TcxLabel;
    lcbLf23: TcxLookupComboBox;
    cxLabel90: TcxLabel;
    lcbLf24: TcxLookupComboBox;
    cxLabel91: TcxLabel;
    beLf6: TcxButtonEdit;
    cxLabel92: TcxLabel;
    lcbLf25: TcxLookupComboBox;
    cxLabel93: TcxLabel;
    lcbLf26: TcxLookupComboBox;
    Panel13: TPanel;
    cxLabel94: TcxLabel;
    cxLabel95: TcxLabel;
    lcbLf27: TcxLookupComboBox;
    cxLabel96: TcxLabel;
    lcbLf28: TcxLookupComboBox;
    cxLabel97: TcxLabel;
    lcbLf29: TcxLookupComboBox;
    cxLabel98: TcxLabel;
    beLf7: TcxButtonEdit;
    cxLabel99: TcxLabel;
    lcbLf30: TcxLookupComboBox;
    cxLabel100: TcxLabel;
    lcbLf31: TcxLookupComboBox;
    Panel14: TPanel;
    cxLabel101: TcxLabel;
    cxLabel102: TcxLabel;
    lcbLf32: TcxLookupComboBox;
    cxLabel104: TcxLabel;
    lcbLf33: TcxLookupComboBox;
    cxLabel105: TcxLabel;
    beLf8: TcxButtonEdit;
    cxLabel106: TcxLabel;
    lcbLf34: TcxLookupComboBox;
    cxLabel107: TcxLabel;
    lcbLf35: TcxLookupComboBox;
    Panel19: TPanel;
    cxLabel130: TcxLabel;
    cxLabel131: TcxLabel;
    lcbLf36: TcxLookupComboBox;
    cxLabel133: TcxLabel;
    lcbLf37: TcxLookupComboBox;
    cxLabel134: TcxLabel;
    beLf9: TcxButtonEdit;
    cxLabel135: TcxLabel;
    lcbLf38: TcxLookupComboBox;
    cxLabel136: TcxLabel;
    lcbLf39: TcxLookupComboBox;
    Panel17: TPanel;
    cxLabel122: TcxLabel;
    lcbLfClear: TcxLookupComboBox;
    lbDoza: TcxLabel;
    cxDoza: TcxCurrencyEdit;
    lbMZV: TcxLabel;
    BM: TdxBarManager;
    BMBar1: TdxBar;
    bbPrint: TdxBarButton;
    bbCancel: TdxBarButton;
    bbSave: TdxBarButton;
    bbPodpis: TdxBarButton;
    Panel20: TPanel;
    dxBarDockControl1: TdxBarDockControl;
    al: TActionList;
    aSave: TAction;
    aPodpis: TAction;
    aCancel: TAction;
    aPrint: TAction;
    dsAccess: TDataSource;
    odsAccess: TOracleDataSet;
    dsKontrast: TDataSource;
    odsKontrast: TOracleDataSet;
    dsSotr: TDataSource;
    odsSotr: TOracleDataSet;
    dsAorta: TDataSource;
    odsAorta: TOracleDataSet;
    dsRecom: TDataSource;
    odsRecom: TOracleDataSet;
    rvs: TRVStyle;
    odsRVData: TOracleDataSet;
    odsRVDataFK_ID: TFloatField;
    odsRVDataFK_PACID: TFloatField;
    odsRVDataFB_BLOB: TBlobField;
    odsRVDataFN_COMPRESS: TFloatField;
    odsRVDataFB_HTML: TBlobField;
    odsRVDataFB_TEXT: TMemoField;
    rve: TRichViewEdit;
    cxLabel7: TcxLabel;
    teTime: TcxTimeEdit;
    dsRgClear: TDataSource;
    odsRgClear: TOracleDataSet;
    odsLfClear: TOracleDataSet;
    dsLfClear: TDataSource;
    frxProtocol: TfrxReport;
    lbVyp: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure lcbAccessPropertiesChange(Sender: TObject);
    procedure cxDozaPropertiesChange(Sender: TObject);
    procedure seKolvoPropertiesChange(Sender: TObject);
    procedure aSaveExecute(Sender: TObject);
    procedure lcbKontrastPropertiesChange(Sender: TObject);
    procedure lcbAortaPropertiesChange(Sender: TObject);
    procedure lcbRecomPropertiesChange(Sender: TObject);
    procedure aPodpisExecute(Sender: TObject);
    procedure lcbRgIzPropertiesChange(Sender: TObject);
    procedure lcbRg1PropertiesChange(Sender: TObject);
    procedure lcbRg2PropertiesChange(Sender: TObject);
    procedure lcbRg3PropertiesChange(Sender: TObject);
    procedure lcbRg4PropertiesChange(Sender: TObject);
    procedure lcbRg5PropertiesChange(Sender: TObject);
    procedure lcbRg6PropertiesChange(Sender: TObject);
    procedure beRg1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure beRg2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure lcbRg7PropertiesChange(Sender: TObject);
    procedure lcbRg8PropertiesChange(Sender: TObject);
    procedure lcbRg9PropertiesChange(Sender: TObject);
    procedure lcbRg10PropertiesChange(Sender: TObject);
    procedure lcbRg11PropertiesChange(Sender: TObject);
    procedure beRg3PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure lcbRg12PropertiesChange(Sender: TObject);
    procedure lcbRg13PropertiesChange(Sender: TObject);
    procedure lcbRg14PropertiesChange(Sender: TObject);
    procedure lcbRg15PropertiesChange(Sender: TObject);
    procedure lcbRg16PropertiesChange(Sender: TObject);
    procedure beRg4PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure lcbRg17PropertiesChange(Sender: TObject);
    procedure lcbRg18PropertiesChange(Sender: TObject);
    procedure lcbRg19PropertiesChange(Sender: TObject);
    procedure lcbRg20PropertiesChange(Sender: TObject);
    procedure lcbRg21PropertiesChange(Sender: TObject);
    procedure beRg5PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure lcbRg22PropertiesChange(Sender: TObject);
    procedure lcbRg23PropertiesChange(Sender: TObject);
    procedure lcbRg24PropertiesChange(Sender: TObject);
    procedure lcbRg25PropertiesChange(Sender: TObject);
    procedure lcbRg26PropertiesChange(Sender: TObject);
    procedure beRg6PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure lcbRg27PropertiesChange(Sender: TObject);
    procedure lcbRg28PropertiesChange(Sender: TObject);
    procedure lcbRg29PropertiesChange(Sender: TObject);
    procedure lcbRg30PropertiesChange(Sender: TObject);
    procedure lcbRg31PropertiesChange(Sender: TObject);
    procedure beRg7PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure lcbRg32PropertiesChange(Sender: TObject);
    procedure lcbRg34PropertiesChange(Sender: TObject);
    procedure lcbRg35PropertiesChange(Sender: TObject);
    procedure lcbRg36PropertiesChange(Sender: TObject);
    procedure beRg8PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure beRg9PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure lcbRg37PropertiesChange(Sender: TObject);
    procedure lcbRg39PropertiesChange(Sender: TObject);
    procedure lcbRg40PropertiesChange(Sender: TObject);
    procedure lcbRg41PropertiesChange(Sender: TObject);
    procedure beRg9PropertiesEditValueChanged(Sender: TObject);
    procedure beRg8PropertiesEditValueChanged(Sender: TObject);
    procedure beRg7PropertiesEditValueChanged(Sender: TObject);
    procedure beRg6PropertiesEditValueChanged(Sender: TObject);
    procedure beRg5PropertiesEditValueChanged(Sender: TObject);
    procedure beRg4PropertiesEditValueChanged(Sender: TObject);
    procedure beRg3PropertiesEditValueChanged(Sender: TObject);
    procedure beRg2PropertiesEditValueChanged(Sender: TObject);
    procedure beRg1PropertiesEditValueChanged(Sender: TObject);
    procedure lcbRgClearPropertiesChange(Sender: TObject);
    procedure lcbLfIzPropertiesChange(Sender: TObject);
    procedure lcbLf1PropertiesChange(Sender: TObject);
    procedure beLf1PropertiesEditValueChanged(Sender: TObject);
    procedure lcbLf2PropertiesChange(Sender: TObject);
    procedure lcbLf3PropertiesChange(Sender: TObject);
    procedure lcbLf4PropertiesChange(Sender: TObject);
    procedure beLf2PropertiesEditValueChanged(Sender: TObject);
    procedure lcbLf7PropertiesChange(Sender: TObject);
    procedure lcbLf8PropertiesChange(Sender: TObject);
    procedure lcbLf9PropertiesChange(Sender: TObject);
    procedure beLf3PropertiesEditValueChanged(Sender: TObject);
    procedure lcbLf12PropertiesChange(Sender: TObject);
    procedure lcbLf13PropertiesChange(Sender: TObject);
    procedure lcbLf14PropertiesChange(Sender: TObject);
    procedure beLf4PropertiesEditValueChanged(Sender: TObject);
    procedure lcbLf15PropertiesChange(Sender: TObject);
    procedure lcbLf16PropertiesChange(Sender: TObject);
    procedure lcbLfClearPropertiesChange(Sender: TObject);
    procedure lcbLf17PropertiesChange(Sender: TObject);
    procedure lcbLf18PropertiesChange(Sender: TObject);
    procedure lcbLf19PropertiesChange(Sender: TObject);
    procedure beLf5PropertiesEditValueChanged(Sender: TObject);
    procedure lcbLf22PropertiesChange(Sender: TObject);
    procedure lcbLf23PropertiesChange(Sender: TObject);
    procedure lcbLf24PropertiesChange(Sender: TObject);
    procedure beLf6PropertiesEditValueChanged(Sender: TObject);
    procedure lcbLf25PropertiesChange(Sender: TObject);
    procedure lcbLf26PropertiesChange(Sender: TObject);
    procedure lcbLf27PropertiesChange(Sender: TObject);
    procedure lcbLf28PropertiesChange(Sender: TObject);
    procedure lcbLf29PropertiesChange(Sender: TObject);
    procedure beLf7PropertiesEditValueChanged(Sender: TObject);
    procedure lcbLf30PropertiesChange(Sender: TObject);
    procedure lcbLf31PropertiesChange(Sender: TObject);
    procedure lcbLf32PropertiesChange(Sender: TObject);
    procedure lcbLf33PropertiesChange(Sender: TObject);
    procedure beLf8PropertiesEditValueChanged(Sender: TObject);
    procedure lcbLf34PropertiesChange(Sender: TObject);
    procedure lcbLf35PropertiesChange(Sender: TObject);
    procedure lcbLf36PropertiesChange(Sender: TObject);
    procedure lcbLf37PropertiesChange(Sender: TObject);
    procedure beLf9PropertiesEditValueChanged(Sender: TObject);
    procedure lcbLf38PropertiesChange(Sender: TObject);
    procedure lcbLf39PropertiesChange(Sender: TObject);
    procedure beLf1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure beLf2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure beLf3PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure beLf4PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure beLf5PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure beLf6PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure beLf7PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure beLf8PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure beLf9PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure lcbLf5PropertiesChange(Sender: TObject);
    procedure lcbLf6PropertiesChange(Sender: TObject);
    procedure lcbLf10PropertiesChange(Sender: TObject);
    procedure lcbLf11PropertiesChange(Sender: TObject);
    procedure lcbLf20PropertiesChange(Sender: TObject);
    procedure lcbLf21PropertiesChange(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure frxProtocolGetValue(const VarName: string; var Value: Variant);
  private
    sDatePrint : String;
    sText1, sRashod, sPrintRight, sPrintLeft : String;

    pNazID, pSmidID : Integer;
    isAccess, isKontrast, isKolvo, isAorta, isRecom, isDoza : Boolean;

    isRgPOPAIz, isRgPOPALocal, isRgPOPADo1, isRgPOPASte, isRgPOPAAne, isRgPOPALocal2, isRgPOPADo2, isRgPOPAKrovo, isRgPOPALocal3 : Boolean;
    isRgNPASte, isRgNPAAne, isRgNPALocal1, isRgNPADo1, isRgNPAKrovo, isRgNPALocal2 : Boolean;
    isRgVPASte, isRgVPAAne, isRgVPALocal1, isRgVPADo1, isRgVPAKrovo, isRgVPALocal2 : Boolean;
    isRgPOBASte, isRgPOBAAne, isRgPOBALocal1, isRgPOBADo1, isRgPOBAKrovo, isRgPOBALocal2 : Boolean;
    isRgPBASte, isRgPBAAne, isRgPBALocal1, isRgPBADo1, isRgPBAKrovo, isRgPBALocal2 : Boolean;
    isRgGBASte, isRgGBAAne, isRgGBALocal1, isRgGBADo1, isRgGBAKrovo, isRgGBALocal2 : Boolean;
    isRgPASte, isRgPALocal1, isRgPADo1, isRgPAKrovo, isRgPALocal2 : Boolean;
    isRgBASte, isRgBALocal1, isRgBADo1, isRgBAKrovo, isRgBALocal2 : Boolean;
    isRgClear : Boolean;

    isLfLOPAIz, isLfLOPALocal1, isLfLOPADo1, isLfLOPASte, isLfLOPAAne, isLfLOPALocal2, isLfLOPADo2, isLfLOPAKrovo, isLfLOPALocal3 : Boolean;
    isLfNPASte, isLfNPAAne, isLfNPALocal1, isLfNPADo1, isLfNPAKrovo, isLfNPALocal2 : Boolean;
    isLfVPASte, isLfVPAAne, isLfVPALocal1, isLfVPADo1, isLfVPAKrovo, isLfVPALocal2 : Boolean;
    isLfLOBASte, isLfLOBAAne, isLfLOBALocal1, isLfLOBADo1, isLfLOBAKrovo, isLfLOBALocal2 : Boolean;
    isLfPBASte, isLfPBAAne, isLfPBALocal1, isLfPBADo1, isLfPBAKrovo, isLfPBALocal2 : Boolean;
    isLfGBASte, isLfGBAAne, isLfGBALocal1, isLfGBADo1, isLfGBAKrovo, isLfGBALocal2 : Boolean;
    isLfPASte, isLfPALocal1, isLfPADo1, isLfPAKrovo, isLfPALocal2 : Boolean;
    isLfBASte, isLfBALocal1, isLfBADo1, isLfBAKrovo, isLfBALocal2 : Boolean;
    isLfClear : Boolean;

    procedure DoSave;
    procedure DoPodpis;
    procedure DoPodpisRgPOPA;
    procedure DoPodpisRgNPA;
    procedure DoPodpisRgVPA;
    procedure DoPodpisRgPOBA;
    procedure DoPodpisRgPBA;
    procedure DoPodpisRgGBA;
    procedure DoPodpisRgPA;
    procedure DoPodpisRgBA;

    procedure DoPodpisLfLOPA;
    procedure DoPodpisLfNPA;
    procedure DoPodpisLfVPA;
    procedure DoPodpisLfLOBA;
    procedure DoPodpisLfPBA;
    procedure DoPodpisLfGBA;
    procedure DoPodpisLfPA;
    procedure DoPodpisLfBA;

    procedure DoLoadTibParams(nNazID : Integer);
    procedure InsertText(S: string; ATag: string; RVSStyle: Integer); overload;

    procedure DoInsertRightPOPA;
    procedure DoInsertRightNPA;
    procedure DoInsertRightVPA;
    procedure DoInsertRightPOBA;
    procedure DoInsertRightPBA;
    procedure DoInsertRightGBA;
    procedure DoInsertRightPA;
    procedure DoInsertRightBA;

    procedure DoInsertLeftLOPA;
    procedure DoInsertLeftNPA;
    procedure DoInsertLeftVPA;
    procedure DoInsertLeftLOBA;
    procedure DoInsertLeftPBA;
    procedure DoInsertLeftGBA;
    procedure DoInsertLeftPA;
    procedure DoInsertLeftBA;

    procedure DoLoadRightPOPA(sSyn : string; nSmid : Integer);
    procedure DoLoadRightNPA(sSyn : string; nSmid : Integer);
    procedure DoLoadRightVPA(sSyn : string; nSmid : Integer);
    procedure DoLoadRightPOBA(sSyn : string; nSmid : Integer);
    procedure DoLoadRightPBA(sSyn : string; nSmid : Integer);
    procedure DoLoadRightGBA(sSyn : string; nSmid : Integer); 
    procedure DoLoadRightPA(sSyn : string; nSmid : Integer);
    procedure DoLoadRightBA(sSyn : string; nSmid : Integer);
    procedure DoLoadRightDo;
    procedure DoLoadLeftLOPA(sSyn : string; nSmid : Integer); 
    procedure DoLoadLeftNPA(sSyn : string; nSmid : Integer);
    procedure DoLoadLeftVPA(sSyn : string; nSmid : Integer);
    procedure DoLoadLeftLOBA(sSyn : string; nSmid : Integer);
    procedure DoLoadLeftPBA(sSyn : string; nSmid : Integer);
    procedure DoLoadLeftGBA(sSyn : string; nSmid : Integer);
    procedure DoLoadLeftPA(sSyn : string; nSmid : Integer);
    procedure DoLoadLeftBA(sSyn : string; nSmid : Integer);
    procedure DoLoadLeftDo;

    procedure DoPrintRight;
    procedure DoPrintLeft;
    { Private declarations }
  public
    procedure DoShowForm(nPacID, nNazID, nSmidID: Integer);
    procedure DoDisable(nId : Integer);
    { Public declarations }
  end;

var
  frmACNK: TfrmACNK;

implementation

uses fMain, fSetPer, uDM;

{$R *.dfm}

procedure TfrmACNK.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmACNK.aPodpisExecute(Sender: TObject);
begin
  if deDate.Text = '' then
    begin
      Application.MessageBox('Вам необходимо указать ДАТУ выполнения исследования!', 'Предупреждение !', MB_OK + MB_ICONWARNING);
      deDate.SetFocus;
      exit;
    end;
  if (lcbVrach.EditText = '') or (lcbVrach.EditValue = -1) then
    begin
      Application.MessageBox('Вам необходимо указать ВРАЧА !', 'Предупреждение !', MB_OK + MB_ICONWARNING);
      lcbVrach.SetFocus;
      exit;
    end;
  Screen.Cursor := crSQLWait;
  try
    seKolvo.PostEditValue;
    DoSave;
    DoPodpis;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmACNK.aPrintExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select to_char(sysdate, ''dd.mm.yyyy hh24:mi'') as datesys from dual ';
    ods.Open;
    sDatePrint := ods.FieldByName('datesys').AsString;
  finally
    ods.Free;
  end;
  sText1 := '';
  sRashod := '';
  sPrintRight := '';
  sPrintLeft := '';
// Первое
  if (lcbAccess.EditValue <> 0) and (lcbAccess.EditValue <> -1) and (lcbAccess.EditValue <> null) then
    sText1 := 'Доступ: '+lcbAccess.EditText+'; ';
  if (lcbAorta.EditValue <> 0) and (lcbAorta.EditValue <> -1) and (lcbAorta.EditValue <> null) then
    sText1 := sText1 + 'Аорта: '+lcbAorta.EditText+'; ';
  if sText1 = '' then
    frxProtocol.FindObject('MasterData1').Visible := False
  else
    frxProtocol.FindObject('MasterData1').Visible := True;
// Расходные материалы
  if (lcbKontrast.EditText <> '') and (lcbKontrast.EditValue <> -1) and (lcbKontrast.EditValue <> null) then
    sRashod := sRashod + 'Контраст: '+lcbKontrast.EditText+'; ';
  if (seKolvo.Value <> 0) and (seKolvo.Text <> '') then
    sRashod := sRashod + 'Кол-во: '+seKolvo.Text+'.';
  if sRashod = '' then
    frxProtocol.FindObject('MasterData10').Visible := False
  else
    frxProtocol.FindObject('MasterData10').Visible := True;
// Рекомендовано
  if (lcbRecom.EditText <> '') and (lcbRecom.EditValue <> -1) and (lcbRecom.EditValue <> null) then
    frxProtocol.FindObject('MasterData9').Visible := True
  else
    frxProtocol.FindObject('MasterData9').Visible := False;
// Доза
  if (cxDoza.Value <> 0) and (cxDoza.Text <> '') then
    frxProtocol.FindObject('MasterData11').Visible := True
  else
    frxProtocol.FindObject('MasterData11').Visible := False;
// Правая чистая
  if (lcbRgClear.EditText <> '') and (lcbRgClear.EditValue <> -1) and (lcbRgClear.EditValue <> null) then
    frxProtocol.FindObject('MasterData14').Visible := True
  else
    frxProtocol.FindObject('MasterData14').Visible := False;
// Левая чистая
  if (lcbLfClear.EditText <> '') and (lcbLfClear.EditValue <> -1) and (lcbLfClear.EditValue <> null) then
    frxProtocol.FindObject('MasterData4').Visible := True
  else
    frxProtocol.FindObject('MasterData4').Visible := False;
// ПРАВАЯ СТОРОНА
  DoPrintRight;
// ЛЕВАЯ СТОРОНА
  DoPrintLeft;

  frxProtocol.ShowReport;
end;

procedure TfrmACNK.aSaveExecute(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  try
    seKolvo.PostEditValue;
    DoSave;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmACNK.beLf1PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var oq : TOracleQuery;
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetPer, frmSetPer);
      try
        frmSetPer.Caption := 'Левая общая подвздошная артерия - до, более';
        frmSetPer.DoShowForm('ACNK_LEFT_LOPA_DO1');
        frmSetPer.ShowModal;
        if frmSetPer.ModalResult = mrOk then
          begin
            beLf1.Text := frmSetPer.odsList.FieldByName('ownname').AsString+' '+frmSetPer.odsList.FieldByName('fc_name').AsString;
            beLf1.Tag := frmSetPer.odsList.FieldByName('fk_id').AsInteger;
          end;
      finally
        frmSetPer.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                       '                    start with fc_synonim = ''ACNK_LEFT_LOPA_DO1'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        frmMain.os.Commit;
        beLf1.Properties.OnEditValueChanged := nil;
        beLf1.Text := '';
        beLf1.Tag := -1;
        beLf1.Properties.OnEditValueChanged := beLf1PropertiesEditValueChanged;
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmACNK.beLf1PropertiesEditValueChanged(Sender: TObject);
begin
  isLfLOPADo1 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.beLf2PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var oq : TOracleQuery;
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetPer, frmSetPer);
      try
        frmSetPer.Caption := 'Левая общая подвздошная артерия - до, более 2';
        frmSetPer.DoShowForm('ACNK_LEFT_LOPA_DO2');
        frmSetPer.ShowModal;
        if frmSetPer.ModalResult = mrOk then
          begin
            beLf2.Text := frmSetPer.odsList.FieldByName('ownname').AsString+' '+frmSetPer.odsList.FieldByName('fc_name').AsString;
            beLf2.Tag := frmSetPer.odsList.FieldByName('fk_id').AsInteger;
          end;
      finally
        frmSetPer.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                       '                    start with fc_synonim = ''ACNK_LEFT_LOPA_DO2'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        frmMain.os.Commit;
        beLf2.Properties.OnEditValueChanged := nil;
        beLf2.Text := '';
        beLf2.Tag := -1;
        beLf2.Properties.OnEditValueChanged := beLf2PropertiesEditValueChanged;
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmACNK.beLf2PropertiesEditValueChanged(Sender: TObject);
begin
  isLfLOPADo2 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.beLf3PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var oq : TOracleQuery;
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetPer, frmSetPer);
      try
        frmSetPer.Caption := 'Наружная подвздошная артерия - до, более';
        frmSetPer.DoShowForm('ACNK_LEFT_NPA_DO1');
        frmSetPer.ShowModal;
        if frmSetPer.ModalResult = mrOk then
          begin
            beLf3.Text := frmSetPer.odsList.FieldByName('ownname').AsString+' '+frmSetPer.odsList.FieldByName('fc_name').AsString;
            beLf3.Tag := frmSetPer.odsList.FieldByName('fk_id').AsInteger;
          end;
      finally
        frmSetPer.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                       '                    start with fc_synonim = ''ACNK_LEFT_NPA_DO1'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        frmMain.os.Commit;
        beLf3.Properties.OnEditValueChanged := nil;
        beLf3.Text := '';
        beLf3.Tag := -1;
        beLf3.Properties.OnEditValueChanged := beLf3PropertiesEditValueChanged;
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmACNK.beLf3PropertiesEditValueChanged(Sender: TObject);
begin
  isLfNPADo1 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.beLf4PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var oq : TOracleQuery;
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetPer, frmSetPer);
      try
        frmSetPer.Caption := 'Внутреняя подвздошная артерия - до, более';
        frmSetPer.DoShowForm('ACNK_LEFT_VPA_DO1');
        frmSetPer.ShowModal;
        if frmSetPer.ModalResult = mrOk then
          begin
            beLf4.Text := frmSetPer.odsList.FieldByName('ownname').AsString+' '+frmSetPer.odsList.FieldByName('fc_name').AsString;
            beLf4.Tag := frmSetPer.odsList.FieldByName('fk_id').AsInteger;
          end;
      finally
        frmSetPer.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                       '                    start with fc_synonim = ''ACNK_LEFT_VPA_DO1'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        frmMain.os.Commit;
        beLf4.Properties.OnEditValueChanged:= nil;
        beLf4.Text := '';
        beLf4.Tag := -1;
        beLf4.Properties.OnEditValueChanged := beLf4PropertiesEditValueChanged;
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmACNK.beLf4PropertiesEditValueChanged(Sender: TObject);
begin
  isLfVPADo1 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.beLf5PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var oq : TOracleQuery;
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetPer, frmSetPer);
      try
        frmSetPer.Caption := 'Левая общая бедренная артерия - до, более';
        frmSetPer.DoShowForm('ACNK_LEFT_LOBA_DO1');
        frmSetPer.ShowModal;
        if frmSetPer.ModalResult = mrOk then
          begin
            beLf5.Text := frmSetPer.odsList.FieldByName('ownname').AsString+' '+frmSetPer.odsList.FieldByName('fc_name').AsString;
            beLf5.Tag := frmSetPer.odsList.FieldByName('fk_id').AsInteger;
          end;
      finally
        frmSetPer.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                       '                    start with fc_synonim = ''ACNK_LEFT_LOBA_DO1'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        frmMain.os.Commit;
        beLf5.Properties.OnEditValueChanged := nil;
        beLf5.Text := '';
        beLf5.Tag := -1;
        beLf5.Properties.OnEditValueChanged := beLf5PropertiesEditValueChanged;
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmACNK.beLf5PropertiesEditValueChanged(Sender: TObject);
begin
  isLfLOBADo1 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.beLf6PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var oq : TOracleQuery;
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetPer, frmSetPer);
      try
        frmSetPer.Caption := 'Поверхностная бедренная артерия - до, более';
        frmSetPer.DoShowForm('ACNK_LEFT_PBA_DO1');
        frmSetPer.ShowModal;
        if frmSetPer.ModalResult = mrOk then
          begin
            beLf6.Text := frmSetPer.odsList.FieldByName('ownname').AsString+' '+frmSetPer.odsList.FieldByName('fc_name').AsString;
            beLf6.Tag := frmSetPer.odsList.FieldByName('fk_id').AsInteger;
          end;
      finally
        frmSetPer.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                       '                    start with fc_synonim = ''ACNK_LEFT_PBA_DO1'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        frmMain.os.Commit;
        beLf6.Properties.OnEditValueChanged := nil;
        beLf6.Text := '';
        beLf6.Tag := -1;
        beLf6.Properties.OnEditValueChanged:= beLf6PropertiesEditValueChanged;
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmACNK.beLf6PropertiesEditValueChanged(Sender: TObject);
begin
  isLfPBADo1 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.beLf7PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var oq : TOracleQuery;
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetPer, frmSetPer);
      try
        frmSetPer.Caption := 'Глубокая бедренная артерия - до, более';
        frmSetPer.DoShowForm('ACNK_LEFT_GBA_DO1');
        frmSetPer.ShowModal;
        if frmSetPer.ModalResult = mrOk then
          begin
            beLf7.Text := frmSetPer.odsList.FieldByName('ownname').AsString+' '+frmSetPer.odsList.FieldByName('fc_name').AsString;
            beLf7.Tag := frmSetPer.odsList.FieldByName('fk_id').AsInteger;
          end;
      finally
        frmSetPer.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                       '                    start with fc_synonim = ''ACNK_LEFT_GBA_DO1'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        frmMain.os.Commit;
        beLf7.Properties.OnEditValueChanged := nil;
        beLf7.Text := '';
        beLf7.Tag := -1;
        beLf7.Properties.OnEditValueChanged := beLf7PropertiesEditValueChanged;
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmACNK.beLf7PropertiesEditValueChanged(Sender: TObject);
begin
  isLfGBADo1 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.beLf8PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var oq : TOracleQuery;
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetPer, frmSetPer);
      try
        frmSetPer.Caption := 'Подколенная артерия - до, более';
        frmSetPer.DoShowForm('ACNK_LEFT_PA_DO1');
        frmSetPer.ShowModal;
        if frmSetPer.ModalResult = mrOk then
          begin
            beLf8.Text := frmSetPer.odsList.FieldByName('ownname').AsString+' '+frmSetPer.odsList.FieldByName('fc_name').AsString;
            beLf8.Tag := frmSetPer.odsList.FieldByName('fk_id').AsInteger;
          end;
      finally
        frmSetPer.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                       '                    start with fc_synonim = ''ACNK_LEFT_PA_DO1'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        frmMain.os.Commit;
        beLf8.Properties.OnEditValueChanged := nil;
        beLf8.Text := '';
        beLf8.Tag := -1;
        beLf8.Properties.OnEditValueChanged := beLf8PropertiesEditValueChanged;
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmACNK.beLf8PropertiesEditValueChanged(Sender: TObject);
begin
  isLfPADo1 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.beLf9PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var oq : TOracleQuery;
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetPer, frmSetPer);
      try
        frmSetPer.Caption := 'Большеберцовая артерия - до, более';
        frmSetPer.DoShowForm('ACNK_LEFT_BA_DO1');
        frmSetPer.ShowModal;
        if frmSetPer.ModalResult = mrOk then
          begin
            beLf9.Text := frmSetPer.odsList.FieldByName('ownname').AsString+' '+frmSetPer.odsList.FieldByName('fc_name').AsString;
            beLf9.Tag := frmSetPer.odsList.FieldByName('fk_id').AsInteger;
          end;
      finally
        frmSetPer.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                       '                    start with fc_synonim = ''ACNK_LEFT_BA_DO1'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        frmMain.os.Commit;
        beLf9.Properties.OnEditValueChanged := nil;
        beLf9.Text := '';
        beLf9.Tag := -1;
        beLf9.Properties.OnEditValueChanged := beLf9PropertiesEditValueChanged;
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmACNK.beLf9PropertiesEditValueChanged(Sender: TObject);
begin
  isLfBADo1 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.beRg1PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var oq : TOracleQuery;
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetPer, frmSetPer);
      try
        frmSetPer.Caption := 'Правая общая подвздошная артерия - до, более';
        frmSetPer.DoShowForm('ACNK_RIGHT_POPA_DO1');
        frmSetPer.ShowModal;
        if frmSetPer.ModalResult = mrOk then
          begin
            beRg1.Text := frmSetPer.odsList.FieldByName('ownname').AsString+' '+frmSetPer.odsList.FieldByName('fc_name').AsString;
            beRg1.Tag := frmSetPer.odsList.FieldByName('fk_id').AsInteger;
          end;
      finally
        frmSetPer.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                       '                    start with fc_synonim = ''ACNK_RIGHT_POPA_DO1'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        frmMain.os.Commit;
        beRg1.Properties.OnEditValueChanged := nil;
        beRg1.Text := '';
        beRg1.Tag := -1;
        beRg1.Properties.OnEditValueChanged := beRg1PropertiesEditValueChanged;
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmACNK.beRg1PropertiesEditValueChanged(Sender: TObject);
begin
  isRgPOPADo1 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.beRg2PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var oq : TOracleQuery;
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetPer, frmSetPer);
      try
        frmSetPer.Caption := 'Правая общая подвздошная артерия - до, более 2';
        frmSetPer.DoShowForm('ACNK_RIGHT_POPA_DO2');
        frmSetPer.ShowModal;
        if frmSetPer.ModalResult = mrOk then
          begin
            beRg2.Text := frmSetPer.odsList.FieldByName('ownname').AsString+' '+frmSetPer.odsList.FieldByName('fc_name').AsString;
            beRg2.Tag := frmSetPer.odsList.FieldByName('fk_id').AsInteger;
          end;
      finally
        frmSetPer.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                       '                    start with fc_synonim = ''ACNK_RIGHT_POPA_DO2'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        frmMain.os.Commit;
        beRg2.Properties.OnEditValueChanged := nil;
        beRg2.Text := '';
        beRg2.Tag := -1;
        beRg2.Properties.OnEditValueChanged := beRg2PropertiesEditValueChanged;
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmACNK.beRg2PropertiesEditValueChanged(Sender: TObject);
begin
  isRgPOPADo2 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.beRg3PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var oq : TOracleQuery;
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetPer, frmSetPer);
      try
        frmSetPer.Caption := 'Наружная подвздошная артерия - до, более';
        frmSetPer.DoShowForm('ACNK_RIGHT_NPA_DO1');
        frmSetPer.ShowModal;
        if frmSetPer.ModalResult = mrOk then
          begin
            beRg3.Text := frmSetPer.odsList.FieldByName('ownname').AsString+' '+frmSetPer.odsList.FieldByName('fc_name').AsString;
            beRg3.Tag := frmSetPer.odsList.FieldByName('fk_id').AsInteger;
          end;
      finally
        frmSetPer.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                       '                    start with fc_synonim = ''ACNK_RIGHT_NPA_DO1'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        frmMain.os.Commit;
        beRg3.Properties.OnEditValueChanged := nil;
        beRg3.Text := '';
        beRg3.Tag := -1;
        beRg3.Properties.OnEditValueChanged := beRg3PropertiesEditValueChanged;
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmACNK.beRg3PropertiesEditValueChanged(Sender: TObject);
begin
  isRgNPADo1 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.beRg4PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var oq : TOracleQuery;
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetPer, frmSetPer);
      try
        frmSetPer.Caption := 'Внутреняя подвздошная артерия - до, более';
        frmSetPer.DoShowForm('ACNK_RIGHT_VPA_DO1');
        frmSetPer.ShowModal;
        if frmSetPer.ModalResult = mrOk then
          begin
            beRg4.Text := frmSetPer.odsList.FieldByName('ownname').AsString+' '+frmSetPer.odsList.FieldByName('fc_name').AsString;
            beRg4.Tag := frmSetPer.odsList.FieldByName('fk_id').AsInteger;
          end;
      finally
        frmSetPer.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                       '                    start with fc_synonim = ''ACNK_RIGHT_VPA_DO1'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        frmMain.os.Commit;
        beRg4.Properties.OnEditValueChanged:= nil;
        beRg4.Text := '';
        beRg4.Tag := -1;
        beRg4.Properties.OnEditValueChanged := beRg4PropertiesEditValueChanged;
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmACNK.beRg4PropertiesEditValueChanged(Sender: TObject);
begin
  isRgVPADo1 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.beRg5PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var oq : TOracleQuery;
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetPer, frmSetPer);
      try
        frmSetPer.Caption := 'Правая общая бедренная артерия - до, более';
        frmSetPer.DoShowForm('ACNK_RIGHT_POBA_DO1');
        frmSetPer.ShowModal;
        if frmSetPer.ModalResult = mrOk then
          begin
            beRg5.Text := frmSetPer.odsList.FieldByName('ownname').AsString+' '+frmSetPer.odsList.FieldByName('fc_name').AsString;
            beRg5.Tag := frmSetPer.odsList.FieldByName('fk_id').AsInteger;
          end;
      finally
        frmSetPer.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                       '                    start with fc_synonim = ''ACNK_RIGHT_POBA_DO1'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        frmMain.os.Commit;
        beRg5.Properties.OnEditValueChanged := nil;
        beRg5.Text := '';
        beRg5.Tag := -1;
        beRg5.Properties.OnEditValueChanged := beRg5PropertiesEditValueChanged;
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmACNK.beRg5PropertiesEditValueChanged(Sender: TObject);
begin
  isRgPOBADo1 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.beRg6PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var oq : TOracleQuery;
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetPer, frmSetPer);
      try
        frmSetPer.Caption := 'Поверхностная бедренная артерия - до, более';
        frmSetPer.DoShowForm('ACNK_RIGHT_PBA_DO1');
        frmSetPer.ShowModal;
        if frmSetPer.ModalResult = mrOk then
          begin
            beRg6.Text := frmSetPer.odsList.FieldByName('ownname').AsString+' '+frmSetPer.odsList.FieldByName('fc_name').AsString;
            beRg6.Tag := frmSetPer.odsList.FieldByName('fk_id').AsInteger;
          end;
      finally
        frmSetPer.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                       '                    start with fc_synonim = ''ACNK_RIGHT_PBA_DO1'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        frmMain.os.Commit;
        beRg6.Properties.OnEditValueChanged := nil;
        beRg6.Text := '';
        beRg6.Tag := -1;
        beRg6.Properties.OnEditValueChanged:= beRg6PropertiesEditValueChanged;
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmACNK.beRg6PropertiesEditValueChanged(Sender: TObject);
begin
  isRgPBADo1 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.beRg7PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var oq : TOracleQuery;
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetPer, frmSetPer);
      try
        frmSetPer.Caption := 'Глубокая бедренная артерия - до, более';
        frmSetPer.DoShowForm('ACNK_RIGHT_GBA_DO1');
        frmSetPer.ShowModal;
        if frmSetPer.ModalResult = mrOk then
          begin
            beRg7.Text := frmSetPer.odsList.FieldByName('ownname').AsString+' '+frmSetPer.odsList.FieldByName('fc_name').AsString;
            beRg7.Tag := frmSetPer.odsList.FieldByName('fk_id').AsInteger;
          end;
      finally
        frmSetPer.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                       '                    start with fc_synonim = ''ACNK_RIGHT_GBA_DO1'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        frmMain.os.Commit;
        beRg7.Properties.OnEditValueChanged := nil;
        beRg7.Text := '';
        beRg7.Tag := -1;
        beRg7.Properties.OnEditValueChanged := beRg7PropertiesEditValueChanged;
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmACNK.beRg7PropertiesEditValueChanged(Sender: TObject);
begin
  isRgGBADo1 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.beRg8PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var oq : TOracleQuery;
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetPer, frmSetPer);
      try
        frmSetPer.Caption := 'Подколенная артерия - до, более';
        frmSetPer.DoShowForm('ACNK_RIGHT_PA_DO1');
        frmSetPer.ShowModal;
        if frmSetPer.ModalResult = mrOk then
          begin
            beRg8.Text := frmSetPer.odsList.FieldByName('ownname').AsString+' '+frmSetPer.odsList.FieldByName('fc_name').AsString;
            beRg8.Tag := frmSetPer.odsList.FieldByName('fk_id').AsInteger;
          end;
      finally
        frmSetPer.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                       '                    start with fc_synonim = ''ACNK_RIGHT_PA_DO1'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        frmMain.os.Commit;
        beRg8.Properties.OnEditValueChanged := nil;
        beRg8.Text := '';
        beRg8.Tag := -1;
        beRg8.Properties.OnEditValueChanged := beRg8PropertiesEditValueChanged;
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmACNK.beRg8PropertiesEditValueChanged(Sender: TObject);
begin
  isRgPADo1 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.beRg9PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var oq : TOracleQuery;
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetPer, frmSetPer);
      try
        frmSetPer.Caption := 'Большеберцовая артерия - до, более';
        frmSetPer.DoShowForm('ACNK_RIGHT_BA_DO1');
        frmSetPer.ShowModal;
        if frmSetPer.ModalResult = mrOk then
          begin
            beRg9.Text := frmSetPer.odsList.FieldByName('ownname').AsString+' '+frmSetPer.odsList.FieldByName('fc_name').AsString;
            beRg9.Tag := frmSetPer.odsList.FieldByName('fk_id').AsInteger;
          end;
      finally
        frmSetPer.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                       '                    start with fc_synonim = ''ACNK_RIGHT_BA_DO1'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        frmMain.os.Commit;
        beRg9.Properties.OnEditValueChanged := nil;
        beRg9.Text := '';
        beRg9.Tag := -1;
        beRg9.Properties.OnEditValueChanged := beRg9PropertiesEditValueChanged;
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmACNK.beRg9PropertiesEditValueChanged(Sender: TObject);
begin
  isRgBADo1 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.cxDozaPropertiesChange(Sender: TObject);
begin
  isDoza := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.DoDisable(nId: Integer);
begin
  if nId = 3 then
    begin
      lbVyp.Visible := True;
      Panel1.Enabled := False;
      cxDoza.Enabled := False;
      deDate.Enabled := False;
      teTime.Enabled := False;
      lcbVrach.Enabled := False;

      lcbAccess.Properties.Buttons[0].Visible := False;
      lcbKontrast.Properties.Buttons[0].Visible := False;
      seKolvo.Properties.SpinButtons.Visible := False;
      lcbAorta.Properties.Buttons[0].Visible := False;
      lcbRecom.Properties.Buttons[0].Visible := False;

      deDate.Properties.Buttons[0].Visible := False;
      teTime.Properties.SpinButtons.Visible := False;
      lcbVrach.Properties.Buttons[0].Visible := False;

      // -- Правая сторона
      Panel3.Enabled := False;
      Panel4.Enabled := False;
      Panel5.Enabled := False;
      Panel2.Enabled := False;
      Panel6.Enabled := False;
      Panel7.Enabled := False;
      Panel8.Enabled := False;
      Panel9.Enabled := False;
      Panel18.Enabled := False;

      lcbRgIz.Properties.Buttons[0].Visible := False;
      lcbRg1.Properties.Buttons[0].Visible := False;
      lcbRg2.Properties.Buttons[0].Visible := False;
      lcbRg3.Properties.Buttons[0].Visible := False;
      lcbRg4.Properties.Buttons[0].Visible := False;
      lcbRg5.Properties.Buttons[0].Visible := False;
      lcbRg6.Properties.Buttons[0].Visible := False;
      lcbRg7.Properties.Buttons[0].Visible := False;
      lcbRg8.Properties.Buttons[0].Visible := False;
      lcbRg9.Properties.Buttons[0].Visible := False;
      lcbRg10.Properties.Buttons[0].Visible := False;
      lcbRg11.Properties.Buttons[0].Visible := False;
      lcbRg12.Properties.Buttons[0].Visible := False;
      lcbRg13.Properties.Buttons[0].Visible := False;
      lcbRg14.Properties.Buttons[0].Visible := False;
      lcbRg15.Properties.Buttons[0].Visible := False;
      lcbRg16.Properties.Buttons[0].Visible := False;
      lcbRg17.Properties.Buttons[0].Visible := False;
      lcbRg18.Properties.Buttons[0].Visible := False;
      lcbRg19.Properties.Buttons[0].Visible := False;
      lcbRg20.Properties.Buttons[0].Visible := False;
      lcbRg21.Properties.Buttons[0].Visible := False;
      lcbRg22.Properties.Buttons[0].Visible := False;
      lcbRg23.Properties.Buttons[0].Visible := False;
      lcbRg24.Properties.Buttons[0].Visible := False;
      lcbRg25.Properties.Buttons[0].Visible := False;
      lcbRg26.Properties.Buttons[0].Visible := False;
      lcbRg27.Properties.Buttons[0].Visible := False;
      lcbRg28.Properties.Buttons[0].Visible := False;
      lcbRg29.Properties.Buttons[0].Visible := False;
      lcbRg30.Properties.Buttons[0].Visible := False;
      lcbRg31.Properties.Buttons[0].Visible := False;
      lcbRg32.Properties.Buttons[0].Visible := False;
      lcbRg34.Properties.Buttons[0].Visible := False;
      lcbRg35.Properties.Buttons[0].Visible := False;
      lcbRg36.Properties.Buttons[0].Visible := False;
      lcbRg37.Properties.Buttons[0].Visible := False;
      lcbRg39.Properties.Buttons[0].Visible := False;
      lcbRg40.Properties.Buttons[0].Visible := False;
      lcbRg41.Properties.Buttons[0].Visible := False;
      lcbRgClear.Properties.Buttons[0].Visible := False;

      beRg1.Properties.Buttons[0].Visible := False;
      beRg1.Properties.Buttons[1].Visible := False;
      beRg2.Properties.Buttons[0].Visible := False;
      beRg2.Properties.Buttons[1].Visible := False;
      beRg3.Properties.Buttons[0].Visible := False;
      beRg3.Properties.Buttons[1].Visible := False;
      beRg4.Properties.Buttons[0].Visible := False;
      beRg4.Properties.Buttons[1].Visible := False;
      beRg5.Properties.Buttons[0].Visible := False;
      beRg5.Properties.Buttons[1].Visible := False;
      beRg6.Properties.Buttons[0].Visible := False;
      beRg6.Properties.Buttons[1].Visible := False;
      beRg7.Properties.Buttons[0].Visible := False;
      beRg7.Properties.Buttons[1].Visible := False;
      beRg8.Properties.Buttons[0].Visible := False;
      beRg8.Properties.Buttons[1].Visible := False;
      beRg9.Properties.Buttons[0].Visible := False;
      beRg9.Properties.Buttons[1].Visible := False;
      // -- Левая сторона
      Panel10.Enabled := False;
      Panel15.Enabled := False;
      Panel16.Enabled := False;
      Panel17.Enabled := False;
      Panel11.Enabled := False;
      Panel12.Enabled := False;
      Panel13.Enabled := False;
      Panel14.Enabled := False;
      Panel19.Enabled := False;

      beLf1.Properties.Buttons[0].Visible := False;
      beLf1.Properties.Buttons[1].Visible := False;
      beLf2.Properties.Buttons[0].Visible := False;
      beLf2.Properties.Buttons[1].Visible := False;
      beLf3.Properties.Buttons[0].Visible := False;
      beLf3.Properties.Buttons[1].Visible := False;
      beLf4.Properties.Buttons[0].Visible := False;
      beLf4.Properties.Buttons[1].Visible := False;
      beLf5.Properties.Buttons[0].Visible := False;
      beLf5.Properties.Buttons[1].Visible := False;
      beLf6.Properties.Buttons[0].Visible := False;
      beLf6.Properties.Buttons[1].Visible := False;
      beLf7.Properties.Buttons[0].Visible := False;
      beLf7.Properties.Buttons[1].Visible := False;
      beLf8.Properties.Buttons[0].Visible := False;
      beLf8.Properties.Buttons[1].Visible := False;
      beLf9.Properties.Buttons[0].Visible := False;
      beLf9.Properties.Buttons[1].Visible := False;

      lcbLfIz.Properties.Buttons[0].Visible := False;
      lcbLf1.Properties.Buttons[0].Visible := False;
      lcbLf2.Properties.Buttons[0].Visible := False;
      lcbLf3.Properties.Buttons[0].Visible := False;
      lcbLf4.Properties.Buttons[0].Visible := False;
      lcbLf5.Properties.Buttons[0].Visible := False;
      lcbLf6.Properties.Buttons[0].Visible := False;
      lcbLf7.Properties.Buttons[0].Visible := False;
      lcbLf8.Properties.Buttons[0].Visible := False;
      lcbLf9.Properties.Buttons[0].Visible := False;
      lcbLf10.Properties.Buttons[0].Visible := False;
      lcbLf11.Properties.Buttons[0].Visible := False;
      lcbLf12.Properties.Buttons[0].Visible := False;
      lcbLf13.Properties.Buttons[0].Visible := False;
      lcbLf14.Properties.Buttons[0].Visible := False;
      lcbLf15.Properties.Buttons[0].Visible := False;
      lcbLf16.Properties.Buttons[0].Visible := False;
      lcbLf17.Properties.Buttons[0].Visible := False;
      lcbLf18.Properties.Buttons[0].Visible := False;
      lcbLf19.Properties.Buttons[0].Visible := False;
      lcbLf20.Properties.Buttons[0].Visible := False;
      lcbLf21.Properties.Buttons[0].Visible := False;
      lcbLf22.Properties.Buttons[0].Visible := False;
      lcbLf23.Properties.Buttons[0].Visible := False;
      lcbLf24.Properties.Buttons[0].Visible := False;
      lcbLf25.Properties.Buttons[0].Visible := False;
      lcbLf26.Properties.Buttons[0].Visible := False;
      lcbLf27.Properties.Buttons[0].Visible := False;
      lcbLf28.Properties.Buttons[0].Visible := False;
      lcbLf29.Properties.Buttons[0].Visible := False;
      lcbLf30.Properties.Buttons[0].Visible := False;
      lcbLf31.Properties.Buttons[0].Visible := False;
      lcbLf32.Properties.Buttons[0].Visible := False;
      lcbLf33.Properties.Buttons[0].Visible := False;
      lcbLf34.Properties.Buttons[0].Visible := False;
      lcbLf35.Properties.Buttons[0].Visible := False;
      lcbLf36.Properties.Buttons[0].Visible := False;
      lcbLf37.Properties.Buttons[0].Visible := False;
      lcbLf38.Properties.Buttons[0].Visible := False;
      lcbLf39.Properties.Buttons[0].Visible := False;
      lcbLfClear.Properties.Buttons[0].Visible := False;

      aPodpis.Enabled := False;
      aSave.Enabled := False;
    end;
end;

procedure TfrmACNK.DoInsertLeftBA;
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  oq.Session := frmMain.os;
  try
// Стеноз
    if isLfBASte = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_BA_STE'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_BA_STE'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLf36.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Локализация 1
    if isLfBALocal1 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_BA_LOCAL1'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_BA_LOCAL1'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLf37.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// до, более 1
    if (isLfBADo1 = True) and (beLf9.Tag <> -1) then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''ACNK_LEFT_BA_DO1'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        oq.DeleteVariables;
        oq.SQL.Text := ' insert into asu.tib(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, beLf9.Tag);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Восстановление кровотока
    if isLfBAKrovo = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_BA_KROVO'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_BA_KROVO'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLf38.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// ЛОкализация 2
    if isLfBALocal2 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_BA_LOCAL2'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_BA_LOCAL2'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLf39.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
  finally
    oq.Free;
  end;
end;

procedure TfrmACNK.DoInsertLeftGBA;
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  oq.Session := frmMain.os;
  try
// Стеноз
    if isLfGBASte = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_GBA_STE'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_GBA_STE'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLf27.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Аневризма
    if isLfGBAAne = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_GBA_ANE'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_GBA_ANE'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLf28.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Локализация 1
    if isLfGBALocal1 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_GBA_LOCAL1'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_GBA_LOCAL1'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLf29.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// до, более 1
    if (isLfGBADo1 = True) and (beLf7.Tag <> -1) then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''ACNK_LEFT_GBA_DO1'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        oq.DeleteVariables;
        oq.SQL.Text := ' insert into asu.tib(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, beLf7.Tag);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Восстановление кровотока
    if isLfGBAKrovo = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_GBA_KROVO'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_GBA_KROVO'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLf30.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// ЛОкализация 2
    if isLfGBALocal2 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_GBA_LOCAL2'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_GBA_LOCAL2'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLf31.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
  finally
    oq.Free;
  end;
end;

procedure TfrmACNK.DoInsertLeftLOBA;
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  oq.Session := frmMain.os;
  try
// Стеноз
    if isLfLOBASte = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_LOBA_STE'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_LOBA_STE'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLf17.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Аневризма
    if isLfLOBAAne = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_LOBA_ANE'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_LOBA_ANE'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLf18.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Локализация 1
    if isLfLOBALocal1 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_LOBA_LOCAL1'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_LOBA_LOCAL1'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLf19.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// до, более 1
    if (isLfLOBADo1 = True) and (beLf5.Tag <> -1) then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''ACNK_LEFT_LOBA_DO1'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        oq.DeleteVariables;
        oq.SQL.Text := ' insert into asu.tib(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, beLf5.Tag);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Восстановление кровотока
    if isLfLOBAKrovo = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_LOBA_KROVO'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_LOBA_KROVO'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLf20.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// ЛОкализация 2
    if isLfLOBALocal2 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_LOBA_LOCAL2'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_LOBA_LOCAL2'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLf21.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
  finally
    oq.Free;
  end;
end;

procedure TfrmACNK.DoInsertLeftLOPA;
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  oq.Session := frmMain.os;
  try
// Извитость
    if isLfLOPAIz = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_LOPA_IZ'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_LOPA_IZ'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLfIz.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Локализация
    if isLfLOPALocal1 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_LOPA_LOCAL1'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_LOPA_LOCAL1'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLf1.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// до, более 1
    if (isLfLOPADo1 = True) and (beLf1.Tag <> -1) then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''ACNK_LEFT_LOPA_DO1'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        oq.DeleteVariables;
        oq.SQL.Text := ' insert into asu.tib(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, beLf1.Tag);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Стеноз
    if isLfLOPASte = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_LOPA_STE'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_LOPA_STE'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLf2.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Аневризма
    if isLfLOPAAne = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_LOPA_ANE'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_LOPA_ANE'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLf3.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Локализация 2
    if isLfLOPALocal2 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_LOPA_LOCAL2'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_LOPA_LOCAL2'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLf4.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// до, более 2
    if (isLfLOPADo2 = True) and (beLf2.Tag <> -1) then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''ACNK_LEFT_LOPA_DO2'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        oq.DeleteVariables;
        oq.SQL.Text := ' insert into asu.tib(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, beLf2.Tag);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Восстановление кровотока
    if isLfLOPAKrovo = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_LOPA_KROVO'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_LOPA_KROVO'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLf5.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// ЛОкализация 3
    if isLfLOPALocal3 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_LOPA_LOCAL3'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_LOPA_LOCAL3'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLf6.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
  finally
    oq.Free;
  end;
end;

procedure TfrmACNK.DoInsertLeftNPA;
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  oq.Session := frmMain.os;
  try
// Стеноз
    if isLfNPASte = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_NPA_STE'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_NPA_STE'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLf7.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Аневризма
    if isLfNPAAne = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_NPA_ANE'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_NPA_ANE'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLf8.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Локализация 1
    if isLfNPALocal1 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_NPA_LOCAL1'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_NPA_LOCAL1'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLf9.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// до, более 1
    if (isLfNPADo1 = True) and (beLf3.Tag <> -1) then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''ACNK_LEFT_NPA_DO1'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        oq.DeleteVariables;
        oq.SQL.Text := ' insert into asu.tib(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, beLf3.Tag);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Восстановление кровотока
    if isLfNPAKrovo = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_NPA_KROVO'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_NPA_KROVO'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLf10.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// ЛОкализация 2
    if isLfNPALocal2 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_NPA_LOCAL2'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_NPA_LOCAL2'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLf11.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
  finally
    oq.Free;
  end;
end;

procedure TfrmACNK.DoInsertLeftPA;
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  oq.Session := frmMain.os;
  try
// Стеноз
    if isLfPASte = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_PA_STE'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_PA_STE'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLf32.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Локализация 1
    if isLfPALocal1 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_PA_LOCAL1'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_PA_LOCAL1'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLf33.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// до, более 1
    if (isLfPADo1 = True) and (beLf8.Tag <> -1) then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''ACNK_LEFT_PA_DO1'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        oq.DeleteVariables;
        oq.SQL.Text := ' insert into asu.tib(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, beLf8.Tag);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Восстановление кровотока
    if isLfPAKrovo = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_PA_KROVO'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_PA_KROVO'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLf34.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// ЛОкализация 2
    if isLfPALocal2 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_PA_LOCAL2'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_PA_LOCAL2'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLf35.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
  finally
    oq.Free;
  end;
end;

procedure TfrmACNK.DoInsertLeftPBA;
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  oq.Session := frmMain.os;
  try
// Стеноз
    if isLfPBASte = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_PBA_STE'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_PBA_STE'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLf22.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Аневризма
    if isLfPBAAne = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_PBA_ANE'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_PBA_ANE'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLf23.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Локализация 1
    if isLfPBALocal1 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_PBA_LOCAL1'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_PBA_LOCAL1'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLf24.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// до, более 1
    if (isLfPBADo1 = True) and (beLf6.Tag <> -1) then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''ACNK_LEFT_PBA_DO1'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        oq.DeleteVariables;
        oq.SQL.Text := ' insert into asu.tib(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, beLf6.Tag);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Восстановление кровотока
    if isLfPBAKrovo = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_PBA_KROVO'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_PBA_KROVO'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLf25.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// ЛОкализация 2
    if isLfPBALocal2 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_PBA_LOCAL2'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_PBA_LOCAL2'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLf26.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
  finally
    oq.Free;
  end;
end;

procedure TfrmACNK.DoInsertLeftVPA;
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  oq.Session := frmMain.os;
  try
// Стеноз
    if isLfVPASte = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_VPA_STE'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_VPA_STE'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLf12.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Аневризма
    if isLfVPAAne = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_VPA_ANE'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_VPA_ANE'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLf13.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Локализация 1
    if isLfVPALocal1 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_VPA_LOCAL1'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_VPA_LOCAL1'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLf14.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// до, более 1
    if (isLfVPADo1 = True) and (beLf4.Tag <> -1) then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''ACNK_LEFT_VPA_DO1'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        oq.DeleteVariables;
        oq.SQL.Text := ' insert into asu.tib(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, beLf4.Tag);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Восстановление кровотока
    if isLfVPAKrovo = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_VPA_KROVO'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_VPA_KROVO'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLf15.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// ЛОкализация 2
    if isLfVPALocal2 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_VPA_LOCAL2'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_VPA_LOCAL2'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLf16.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
  finally
    oq.Free;
  end;
end;

procedure TfrmACNK.DoInsertRightBA;
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  oq.Session := frmMain.os;
  try
// Стеноз
    if isRgBASte = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_BA_STE'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_BA_STE'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbRg37.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Локализация 1
    if isRgBALocal1 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_BA_LOCAL1'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_BA_LOCAL1'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbRg39.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// до, более 1
    if (isRgBADo1 = True) and (beRg9.Tag <> -1) then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''ACNK_RIGHT_BA_DO1'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        oq.DeleteVariables;
        oq.SQL.Text := ' insert into asu.tib(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, beRg9.Tag);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Восстановление кровотока
    if isRgBAKrovo = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_BA_KROVO'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_BA_KROVO'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbRg40.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// ЛОкализация 2
    if isRgBALocal2 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_BA_LOCAL2'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_BA_LOCAL2'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbRg41.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
  finally
    oq.Free;
  end;
end;

procedure TfrmACNK.DoInsertRightGBA;
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  oq.Session := frmMain.os;
  try
// Стеноз
    if isRgGBASte = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_GBA_STE'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_GBA_STE'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbRg27.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Аневризма
    if isRgGBAAne = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_GBA_ANE'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_GBA_ANE'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbRg28.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Локализация 1
    if isRgGBALocal1 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_GBA_LOCAL1'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_GBA_LOCAL1'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbRg29.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// до, более 1
    if (isRgGBADo1 = True) and (beRg7.Tag <> -1) then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''ACNK_RIGHT_GBA_DO1'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        oq.DeleteVariables;
        oq.SQL.Text := ' insert into asu.tib(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, beRg7.Tag);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Восстановление кровотока
    if isRgGBAKrovo = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_GBA_KROVO'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_GBA_KROVO'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbRg30.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// ЛОкализация 2
    if isRgGBALocal2 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_GBA_LOCAL2'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_GBA_LOCAL2'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbRg31.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
  finally
    oq.Free;
  end;
end;

procedure TfrmACNK.DoInsertRightNPA;
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  oq.Session := frmMain.os;
  try
// Стеноз
    if isRgNPASte = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_NPA_STE'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_NPA_STE'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbRg7.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Аневризма
    if isRgNPAAne = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_NPA_ANE'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_NPA_ANE'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbRg8.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Локализация 1
    if isRgNPALocal1 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_NPA_LOCAL1'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_NPA_LOCAL1'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbRg9.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// до, более 1
    if (isRgNPADo1 = True) and (beRg3.Tag <> -1) then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''ACNK_RIGHT_NPA_DO1'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        oq.DeleteVariables;
        oq.SQL.Text := ' insert into asu.tib(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, beRg3.Tag);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Восстановление кровотока
    if isRgNPAKrovo = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_NPA_KROVO'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_NPA_KROVO'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbRg10.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// ЛОкализация 2
    if isRgNPALocal2 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_NPA_LOCAL2'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_NPA_LOCAL2'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbRg11.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
  finally
    oq.Free;
  end;
end;

procedure TfrmACNK.DoInsertRightPA;
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  oq.Session := frmMain.os;
  try
// Стеноз
    if isRgPASte = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_PA_STE'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_PA_STE'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbRg32.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Локализация 1
    if isRgPALocal1 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_PA_LOCAL1'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_PA_LOCAL1'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbRg34.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// до, более 1
    if (isRgPADo1 = True) and (beRg8.Tag <> -1) then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''ACNK_RIGHT_PA_DO1'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        oq.DeleteVariables;
        oq.SQL.Text := ' insert into asu.tib(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, beRg8.Tag);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Восстановление кровотока
    if isRgPAKrovo = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_PA_KROVO'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_PA_KROVO'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbRg35.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// ЛОкализация 2
    if isRgPALocal2 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_PA_LOCAL2'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_PA_LOCAL2'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbRg36.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
  finally
    oq.Free;
  end;
end;

procedure TfrmACNK.DoInsertRightPBA;
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  oq.Session := frmMain.os;
  try
// Стеноз
    if isRgPBASte = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_PBA_STE'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_PBA_STE'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbRg22.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Аневризма
    if isRgPBAAne = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_PBA_ANE'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_PBA_ANE'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbRg23.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Локализация 1
    if isRgPBALocal1 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_PBA_LOCAL1'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_PBA_LOCAL1'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbRg24.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// до, более 1
    if (isRgPBADo1 = True) and (beRg6.Tag <> -1) then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''ACNK_RIGHT_PBA_DO1'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        oq.DeleteVariables;
        oq.SQL.Text := ' insert into asu.tib(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, beRg6.Tag);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Восстановление кровотока
    if isRgPBAKrovo = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_PBA_KROVO'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_PBA_KROVO'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbRg25.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// ЛОкализация 2
    if isRgPBALocal2 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_PBA_LOCAL2'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_PBA_LOCAL2'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbRg26.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
  finally
    oq.Free;
  end;
end;

procedure TfrmACNK.DoInsertRightPOBA;
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  oq.Session := frmMain.os;
  try
// Стеноз
    if isRgPOBASte = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_POBA_STE'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_POBA_STE'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbRg17.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Аневризма
    if isRgPOBAAne = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_POBA_ANE'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_POBA_ANE'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbRg18.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Локализация 1
    if isRgPOBALocal1 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_POBA_LOCAL1'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_POBA_LOCAL1'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbRg19.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// до, более 1
    if (isRgPOBADo1 = True) and (beRg5.Tag <> -1) then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''ACNK_RIGHT_POBA_DO1'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        oq.DeleteVariables;
        oq.SQL.Text := ' insert into asu.tib(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, beRg5.Tag);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Восстановление кровотока
    if isRgPOBAKrovo = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_POBA_KROVO'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_POBA_KROVO'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbRg20.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// ЛОкализация 2
    if isRgPOBALocal2 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_POBA_LOCAL2'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_POBA_LOCAL2'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbRg21.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
  finally
    oq.Free;
  end;
end;

procedure TfrmACNK.DoInsertRightPOPA;
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  oq.Session := frmMain.os;
  try
// Извитость
    if isRgPOPAIz = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_POPA_IZ'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_POPA_IZ'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbRgIz.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Локализация
    if isRgPOPALocal = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_POPA_LOCAL1'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_POPA_LOCAL1'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbRg1.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// до, более 1
    if (isRgPOPADo1 = True) and (beRg1.Tag <> -1) then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''ACNK_RIGHT_POPA_DO1'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        oq.DeleteVariables;
        oq.SQL.Text := ' insert into asu.tib(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, beRg1.Tag);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Стеноз
    if isRgPOPASte = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_POPA_STE'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_POPA_STE'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbRg2.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Аневризма
    if isRgPOPAAne = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_POPA_ANE'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_POPA_ANE'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbRg3.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Локализация 2
    if isRgPOPALocal2 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_POPA_LOCAL2'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_POPA_LOCAL2'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbRg4.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// до, более 2
    if (isRgPOPADo2 = True) and (beRg2.Tag <> -1) then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''ACNK_RIGHT_POPA_DO2'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        oq.DeleteVariables;
        oq.SQL.Text := ' insert into asu.tib(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, beRg2.Tag);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Восстановление кровотока
    if isRgPOPAKrovo = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_POPA_KROVO'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_POPA_KROVO'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbRg5.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// ЛОкализация 3
    if isRgPOPALocal3 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_POPA_LOCAL3'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_POPA_LOCAL3'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbRg6.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
  finally
    oq.Free;
  end;
end;

procedure TfrmACNK.DoInsertRightVPA;
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  oq.Session := frmMain.os;
  try
// Стеноз
    if isRgVPASte = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_VPA_STE'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_VPA_STE'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbRg12.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Аневризма
    if isRgVPAAne = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_VPA_ANE'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_VPA_ANE'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbRg13.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Локализация 1
    if isRgVPALocal1 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_VPA_LOCAL1'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_VPA_LOCAL1'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbRg14.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// до, более 1
    if (isRgVPADo1 = True) and (beRg4.Tag <> -1) then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''ACNK_RIGHT_VPA_DO1'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        oq.DeleteVariables;
        oq.SQL.Text := ' insert into asu.tib(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, beRg4.Tag);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Восстановление кровотока
    if isRgVPAKrovo = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_VPA_KROVO'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_VPA_KROVO'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbRg15.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// ЛОкализация 2
    if isRgVPALocal2 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_VPA_LOCAL2'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_VPA_LOCAL2'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbRg16.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
  finally
    oq.Free;
  end;
end;

procedure TfrmACNK.DoLoadLeftBA(sSyn: string; nSmid: Integer);
begin
  if sSyn = 'ACNK_LEFT_BA_STE' then
    begin
      lcbLf36.Properties.OnChange := nil;
      lcbLf36.EditValue := nSmid;
      lcbLf36.Properties.OnChange := lcbLf36PropertiesChange;
    end;
  if sSyn = 'ACNK_LEFT_BA_LOCAL1' then
    begin
      lcbLf37.Properties.OnChange := nil;
      lcbLf37.EditValue := nSmid;
      lcbLf37.Properties.OnChange := lcbLf37PropertiesChange;
    end;
  if sSyn = 'ACNK_LEFT_BA_KROVO' then
    begin
      lcbLf38.Properties.OnChange := nil;
      lcbLf38.EditValue := nSmid;
      lcbLf38.Properties.OnChange := lcbLf38PropertiesChange;
    end;
  if sSyn = 'ACNK_LEFT_BA_LOCAL2' then
    begin
      lcbLf39.Properties.OnChange := nil;
      lcbLf39.EditValue := nSmid;
      lcbLf39.Properties.OnChange := lcbLf39PropertiesChange;
    end;
end;

procedure TfrmACNK.DoLoadLeftDo;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  ods.Session := frmMain.os;
  try
// -- ЛОПА до 1
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smeditid) ||'' ''|| asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                    '                    start with fc_synonim = ''ACNK_LEFT_LOPA_DO1'' connect by prior fk_id = fk_owner) ';
    ods.DeclareAndSet('pfk_pacid', otInteger, pNazID);
    ods.Open;
    beLf1.Properties.OnEditValueChanged := nil;
    beLf1.Text := ods.FieldByName('smname').AsString;
    beLf1.Tag := ods.FieldByName('fk_smid').AsInteger;
    beLf1.Properties.OnEditValueChanged := beLf1PropertiesEditValueChanged;
// -- ЛОПА до 2
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smeditid) ||'' ''|| asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                    '                    start with fc_synonim = ''ACNK_LEFT_LOPA_DO2'' connect by prior fk_id = fk_owner) ';
    ods.DeclareAndSet('pfk_pacid', otInteger, pNazID);
    ods.Open;
    beLf2.Properties.OnEditValueChanged := nil;
    beLf2.Text := ods.FieldByName('smname').AsString;
    beLf2.Tag := ods.FieldByName('fk_smid').AsInteger;
    beLf2.Properties.OnEditValueChanged := beLf2PropertiesEditValueChanged;
// -- НПА до
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smeditid) ||'' ''|| asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                    '                    start with fc_synonim = ''ACNK_LEFT_NPA_DO1'' connect by prior fk_id = fk_owner) ';
    ods.DeclareAndSet('pfk_pacid', otInteger, pNazID);
    ods.Open;
    beLf3.Properties.OnEditValueChanged := nil;
    beLf3.Text := ods.FieldByName('smname').AsString;
    beLf3.Tag := ods.FieldByName('fk_smid').AsInteger;
    beLf3.Properties.OnEditValueChanged := beLf3PropertiesEditValueChanged;
// -- ВПА до
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smeditid) ||'' ''|| asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                    '                    start with fc_synonim = ''ACNK_LEFT_VPA_DO1'' connect by prior fk_id = fk_owner) ';
    ods.DeclareAndSet('pfk_pacid', otInteger, pNazID);
    ods.Open;
    beLf4.Properties.OnEditValueChanged := nil;
    beLf4.Text := ods.FieldByName('smname').AsString;
    beLf4.Tag := ods.FieldByName('fk_smid').AsInteger;
    beLf4.Properties.OnEditValueChanged := beLf4PropertiesEditValueChanged;
// -- ЛОБА до
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smeditid) ||'' ''|| asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                    '                    start with fc_synonim = ''ACNK_LEFT_LOBA_DO1'' connect by prior fk_id = fk_owner) ';
    ods.DeclareAndSet('pfk_pacid', otInteger, pNazID);
    ods.Open;
    beLf5.Properties.OnEditValueChanged := nil;
    beLf5.Text := ods.FieldByName('smname').AsString;
    beLf5.Tag := ods.FieldByName('fk_smid').AsInteger;
    beLf5.Properties.OnEditValueChanged := beLf5PropertiesEditValueChanged;
// -- ПБА до
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smeditid) ||'' ''|| asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                    '                    start with fc_synonim = ''ACNK_LEFT_PBA_DO1'' connect by prior fk_id = fk_owner) ';
    ods.DeclareAndSet('pfk_pacid', otInteger, pNazID);
    ods.Open;
    beLf6.Properties.OnEditValueChanged := nil;
    beLf6.Text := ods.FieldByName('smname').AsString;
    beLf6.Tag := ods.FieldByName('fk_smid').AsInteger;
    beLf6.Properties.OnEditValueChanged := beLf6PropertiesEditValueChanged;
// -- ГБА до
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smeditid) ||'' ''|| asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                    '                    start with fc_synonim = ''ACNK_LEFT_GBA_DO1'' connect by prior fk_id = fk_owner) ';
    ods.DeclareAndSet('pfk_pacid', otInteger, pNazID);
    ods.Open;
    beLf7.Properties.OnEditValueChanged := nil;
    beLf7.Text := ods.FieldByName('smname').AsString;
    beLf7.Tag := ods.FieldByName('fk_smid').AsInteger;
    beLf7.Properties.OnEditValueChanged := beLf7PropertiesEditValueChanged;
// -- ПА до
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smeditid) ||'' ''|| asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                    '                    start with fc_synonim = ''ACNK_LEFT_PA_DO1'' connect by prior fk_id = fk_owner) ';
    ods.DeclareAndSet('pfk_pacid', otInteger, pNazID);
    ods.Open;
    beLf8.Properties.OnEditValueChanged := nil;
    beLf8.Text := ods.FieldByName('smname').AsString;
    beLf8.Tag := ods.FieldByName('fk_smid').AsInteger;
    beLf8.Properties.OnEditValueChanged := beLf8PropertiesEditValueChanged;
// -- БА до
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smeditid) ||'' ''|| asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                    '                    start with fc_synonim = ''ACNK_LEFT_BA_DO1'' connect by prior fk_id = fk_owner) ';
    ods.DeclareAndSet('pfk_pacid', otInteger, pNazID);
    ods.Open;
    beLf9.Properties.OnEditValueChanged := nil;
    beLf9.Text := ods.FieldByName('smname').AsString;
    beLf9.Tag := ods.FieldByName('fk_smid').AsInteger;
    beLf9.Properties.OnEditValueChanged := beLf9PropertiesEditValueChanged;
  finally
    ods.Free;
  end;
end;

procedure TfrmACNK.DoLoadLeftGBA(sSyn: string; nSmid: Integer);
begin
  if sSyn = 'ACNK_LEFT_GBA_STE' then
    begin
      lcbLf27.Properties.OnChange := nil;
      lcbLf27.EditValue := nSmid;
      lcbLf27.Properties.OnChange := lcbLf27PropertiesChange;
    end;
  if sSyn = 'ACNK_LEFT_GBA_ANE' then
    begin
      lcbLf28.Properties.OnChange := nil;
      lcbLf28.EditValue := nSmid;
      lcbLf28.Properties.OnChange := lcbLf28PropertiesChange;
    end;
  if sSyn = 'ACNK_LEFT_GBA_LOCAL1' then
    begin
      lcbLf29.Properties.OnChange := nil;
      lcbLf29.EditValue := nSmid;
      lcbLf29.Properties.OnChange := lcbLf29PropertiesChange;
    end;
  if sSyn = 'ACNK_LEFT_GBA_KROVO' then
    begin
      lcbLf30.Properties.OnChange := nil;
      lcbLf30.EditValue := nSmid;
      lcbLf30.Properties.OnChange := lcbLf30PropertiesChange;
    end;
  if sSyn = 'ACNK_LEFT_GBA_LOCAL2' then
    begin
      lcbLf31.Properties.OnChange := nil;
      lcbLf31.EditValue := nSmid;
      lcbLf31.Properties.OnChange := lcbLf31PropertiesChange;
    end;
end;

procedure TfrmACNK.DoLoadLeftLOBA(sSyn: string; nSmid: Integer);
begin
  if sSyn = 'ACNK_LEFT_LOBA_STE' then
    begin
      lcbLf17.Properties.OnChange := nil;
      lcbLf17.EditValue := nSmid;
      lcbLf17.Properties.OnChange := lcbLf17PropertiesChange;
    end;
  if sSyn = 'ACNK_LEFT_LOBA_ANE' then
    begin
      lcbLf18.Properties.OnChange := nil;
      lcbLf18.EditValue := nSmid;
      lcbLf18.Properties.OnChange := lcbLf18PropertiesChange;
    end;
  if sSyn = 'ACNK_LEFT_LOBA_LOCAL1' then
    begin
      lcbLf19.Properties.OnChange := nil;
      lcbLf19.EditValue := nSmid;
      lcbLf19.Properties.OnChange := lcbLf19PropertiesChange;
    end;
  if sSyn = 'ACNK_LEFT_LOBA_KROVO' then
    begin
      lcbLf20.Properties.OnChange := nil;
      lcbLf20.EditValue := nSmid;
      lcbLf20.Properties.OnChange := lcbLf20PropertiesChange;
    end;
  if sSyn = 'ACNK_LEFT_LOBA_LOCAL2' then
    begin
      lcbLf21.Properties.OnChange := nil;
      lcbLf21.EditValue := nSmid;
      lcbLf21.Properties.OnChange := lcbLf21PropertiesChange;
    end;
end;

procedure TfrmACNK.DoLoadLeftLOPA(sSyn: string; nSmid: Integer);
begin
  if sSyn = 'ACNK_LEFT_LOPA_IZ' then
    begin
      lcbLfIz.Properties.OnChange := nil;
      lcbLfIz.EditValue := nSmid;
      lcbLfIz.Properties.OnChange := lcbLfIzPropertiesChange;
    end;
  if sSyn = 'ACNK_LEFT_LOPA_LOCAL1' then
    begin
      lcbLf1.Properties.OnChange := nil;
      lcbLf1.EditValue := nSmid;
      lcbLf1.Properties.OnChange := lcbLf1PropertiesChange;
    end;
  if sSyn = 'ACNK_LEFT_LOPA_STE' then
    begin
      lcbLf2.Properties.OnChange := nil;
      lcbLf2.EditValue := nSmid;
      lcbLf2.Properties.OnChange := lcbLf2PropertiesChange;
    end;
  if sSyn = 'ACNK_LEFT_LOPA_ANE' then
    begin
      lcbLf3.Properties.OnChange := nil;
      lcbLf3.EditValue := nSmid;
      lcbLf3.Properties.OnChange := lcbLf3PropertiesChange;
    end;
  if sSyn = 'ACNK_LEFT_LOPA_LOCAL2' then
    begin
      lcbLf4.Properties.OnChange := nil;
      lcbLf4.EditValue := nSmid;
      lcbLf4.Properties.OnChange := lcbLf4PropertiesChange;
    end;
  if sSyn = 'ACNK_LEFT_LOPA_KROVO' then
    begin
      lcbLf5.Properties.OnChange := nil;
      lcbLf5.EditValue := nSmid;
      lcbLf5.Properties.OnChange := lcbLf5PropertiesChange;
    end;
  if sSyn = 'ACNK_LEFT_LOPA_LOCAL3' then
    begin
      lcbLf6.Properties.OnChange := nil;
      lcbLf6.EditValue := nSmid;
      lcbLf6.Properties.OnChange := lcbLf6PropertiesChange;
    end;
end;

procedure TfrmACNK.DoLoadLeftNPA(sSyn: string; nSmid: Integer);
begin
  if sSyn = 'ACNK_LEFT_NPA_STE' then
    begin
      lcbLf7.Properties.OnChange := nil;
      lcbLf7.EditValue := nSmid;
      lcbLf7.Properties.OnChange := lcbLf7PropertiesChange;
    end;
  if sSyn = 'ACNK_LEFT_NPA_ANE' then
    begin
      lcbLf8.Properties.OnChange := nil;
      lcbLf8.EditValue := nSmid;
      lcbLf8.Properties.OnChange := lcbLf8PropertiesChange;
    end;
  if sSyn = 'ACNK_LEFT_NPA_LOCAL1' then
    begin
      lcbLf9.Properties.OnChange := nil;
      lcbLf9.EditValue := nSmid;
      lcbLf9.Properties.OnChange := lcbLf9PropertiesChange;
    end;
  if sSyn = 'ACNK_LEFT_NPA_KROVO' then
    begin
      lcbLf10.Properties.OnChange := nil;
      lcbLf10.EditValue := nSmid;
      lcbLf10.Properties.OnChange := lcbLf10PropertiesChange;
    end;
  if sSyn = 'ACNK_LEFT_NPA_LOCAL2' then
    begin
      lcbLf11.Properties.OnChange := nil;
      lcbLf11.EditValue := nSmid;
      lcbLf11.Properties.OnChange := lcbLf11PropertiesChange;
    end;
end;

procedure TfrmACNK.DoLoadLeftPA(sSyn: string; nSmid: Integer);
begin
  if sSyn = 'ACNK_LEFT_PA_STE' then
    begin
      lcbLf32.Properties.OnChange := nil;
      lcbLf32.EditValue := nSmid;
      lcbLf32.Properties.OnChange := lcbLf32PropertiesChange;
    end;
  if sSyn = 'ACNK_LEFT_PA_LOCAL1' then
    begin
      lcbLf33.Properties.OnChange := nil;
      lcbLf33.EditValue := nSmid;
      lcbLf33.Properties.OnChange := lcbLf34PropertiesChange;
    end;
  if sSyn = 'ACNK_LEFT_PA_KROVO' then
    begin
      lcbLf34.Properties.OnChange := nil;
      lcbLf34.EditValue := nSmid;
      lcbLf34.Properties.OnChange := lcbLf34PropertiesChange;
    end;
  if sSyn = 'ACNK_LEFT_PA_LOCAL2' then
    begin
      lcbLf35.Properties.OnChange := nil;
      lcbLf35.EditValue := nSmid;
      lcbLf35.Properties.OnChange := lcbLf35PropertiesChange;
    end;
end;

procedure TfrmACNK.DoLoadLeftPBA(sSyn: string; nSmid: Integer);
begin
  if sSyn = 'ACNK_LEFT_PBA_STE' then
    begin
      lcbLf22.Properties.OnChange := nil;
      lcbLf22.EditValue := nSmid;
      lcbLf22.Properties.OnChange := lcbLf22PropertiesChange;
    end;
  if sSyn = 'ACNK_LEFT_PBA_ANE' then
    begin
      lcbLf23.Properties.OnChange := nil;
      lcbLf23.EditValue := nSmid;
      lcbLf23.Properties.OnChange := lcbLf23PropertiesChange;
    end;
  if sSyn = 'ACNK_LEFT_PBA_LOCAL1' then
    begin
      lcbLf24.Properties.OnChange := nil;
      lcbLf24.EditValue := nSmid;
      lcbLf24.Properties.OnChange := lcbLf24PropertiesChange;
    end;
  if sSyn = 'ACNK_LEFT_PBA_KROVO' then
    begin
      lcbLf25.Properties.OnChange := nil;
      lcbLf25.EditValue := nSmid;
      lcbLf25.Properties.OnChange := lcbLf25PropertiesChange;
    end;
  if sSyn = 'ACNK_LEFT_PBA_LOCAL2' then
    begin
      lcbLf26.Properties.OnChange := nil;
      lcbLf26.EditValue := nSmid;
      lcbLf26.Properties.OnChange := lcbLf26PropertiesChange;
    end;
end;

procedure TfrmACNK.DoLoadLeftVPA(sSyn: string; nSmid: Integer);
begin
  if sSyn = 'ACNK_LEFT_VPA_STE' then
    begin
      lcbLf12.Properties.OnChange := nil;
      lcbLf12.EditValue := nSmid;
      lcbLf12.Properties.OnChange := lcbLf12PropertiesChange;
    end;
  if sSyn = 'ACNK_LEFT_VPA_ANE' then
    begin
      lcbLf13.Properties.OnChange := nil;
      lcbLf13.EditValue := nSmid;
      lcbLf13.Properties.OnChange := lcbLf13PropertiesChange;
    end;
  if sSyn = 'ACNK_LEFT_VPA_LOCAL1' then
    begin
      lcbLf14.Properties.OnChange := nil;
      lcbLf14.EditValue := nSmid;
      lcbLf14.Properties.OnChange := lcbLf14PropertiesChange;
    end;
  if sSyn = 'ACNK_LEFT_VPA_KROVO' then
    begin
      lcbLf15.Properties.OnChange := nil;
      lcbLf15.EditValue := nSmid;
      lcbLf15.Properties.OnChange := lcbLf15PropertiesChange;
    end;
  if sSyn = 'ACNK_LEFT_VPA_LOCAL2' then
    begin
      lcbLf16.Properties.OnChange := nil;
      lcbLf16.EditValue := nSmid;
      lcbLf16.Properties.OnChange := lcbLf16PropertiesChange;
    end;
end;

procedure TfrmACNK.DoLoadRightBA(sSyn: string; nSmid: Integer);
begin
  if sSyn = 'ACNK_RIGHT_BA_STE' then
    begin
      lcbRg37.Properties.OnChange := nil;
      lcbRg37.EditValue := nSmid;
      lcbRg37.Properties.OnChange := lcbRg37PropertiesChange;
    end;
  if sSyn = 'ACNK_RIGHT_BA_LOCAL1' then
    begin
      lcbRg39.Properties.OnChange := nil;
      lcbRg39.EditValue := nSmid;
      lcbRg39.Properties.OnChange := lcbRg39PropertiesChange;
    end;
  if sSyn = 'ACNK_RIGHT_BA_KROVO' then
    begin
      lcbRg40.Properties.OnChange := nil;
      lcbRg40.EditValue := nSmid;
      lcbRg40.Properties.OnChange := lcbRg40PropertiesChange;
    end;
  if sSyn = 'ACNK_RIGHT_BA_LOCAL2' then
    begin
      lcbRg41.Properties.OnChange := nil;
      lcbRg41.EditValue := nSmid;
      lcbRg41.Properties.OnChange := lcbRg41PropertiesChange;
    end;
end;

procedure TfrmACNK.DoLoadRightDo;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  ods.Session := frmMain.os;
  try
// -- ПОПА до 1
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smeditid) ||'' ''|| asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                    '                    start with fc_synonim = ''ACNK_RIGHT_POPA_DO1'' connect by prior fk_id = fk_owner) ';
    ods.DeclareAndSet('pfk_pacid', otInteger, pNazID);
    ods.Open;
    beRg1.Properties.OnEditValueChanged := nil;
    beRg1.Text := ods.FieldByName('smname').AsString;
    beRg1.Tag := ods.FieldByName('fk_smid').AsInteger;
    beRg1.Properties.OnEditValueChanged := beRg1PropertiesEditValueChanged;
// -- ПОПА до 2
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smeditid) ||'' ''|| asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                    '                    start with fc_synonim = ''ACNK_RIGHT_POPA_DO2'' connect by prior fk_id = fk_owner) ';
    ods.DeclareAndSet('pfk_pacid', otInteger, pNazID);
    ods.Open;
    beRg2.Properties.OnEditValueChanged := nil;
    beRg2.Text := ods.FieldByName('smname').AsString;
    beRg2.Tag := ods.FieldByName('fk_smid').AsInteger;
    beRg2.Properties.OnEditValueChanged := beRg2PropertiesEditValueChanged;
// -- НПА до
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smeditid) ||'' ''|| asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                    '                    start with fc_synonim = ''ACNK_RIGHT_NPA_DO1'' connect by prior fk_id = fk_owner) ';
    ods.DeclareAndSet('pfk_pacid', otInteger, pNazID);
    ods.Open;
    beRg3.Properties.OnEditValueChanged := nil;
    beRg3.Text := ods.FieldByName('smname').AsString;
    beRg3.Tag := ods.FieldByName('fk_smid').AsInteger;
    beRg3.Properties.OnEditValueChanged := beRg3PropertiesEditValueChanged;
// -- ВПА до
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smeditid) ||'' ''|| asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                    '                    start with fc_synonim = ''ACNK_RIGHT_VPA_DO1'' connect by prior fk_id = fk_owner) ';
    ods.DeclareAndSet('pfk_pacid', otInteger, pNazID);
    ods.Open;
    beRg4.Properties.OnEditValueChanged := nil;
    beRg4.Text := ods.FieldByName('smname').AsString;
    beRg4.Tag := ods.FieldByName('fk_smid').AsInteger;
    beRg4.Properties.OnEditValueChanged := beRg4PropertiesEditValueChanged;
// -- ПОБА до
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smeditid) ||'' ''|| asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                    '                    start with fc_synonim = ''ACNK_RIGHT_POBA_DO1'' connect by prior fk_id = fk_owner) ';
    ods.DeclareAndSet('pfk_pacid', otInteger, pNazID);
    ods.Open;
    beRg5.Properties.OnEditValueChanged := nil;
    beRg5.Text := ods.FieldByName('smname').AsString;
    beRg5.Tag := ods.FieldByName('fk_smid').AsInteger;
    beRg5.Properties.OnEditValueChanged := beRg5PropertiesEditValueChanged;
// -- ПБА до
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smeditid) ||'' ''|| asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                    '                    start with fc_synonim = ''ACNK_RIGHT_PBA_DO1'' connect by prior fk_id = fk_owner) ';
    ods.DeclareAndSet('pfk_pacid', otInteger, pNazID);
    ods.Open;
    beRg6.Properties.OnEditValueChanged := nil;
    beRg6.Text := ods.FieldByName('smname').AsString;
    beRg6.Tag := ods.FieldByName('fk_smid').AsInteger;
    beRg6.Properties.OnEditValueChanged := beRg6PropertiesEditValueChanged;
// -- ГБА до
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smeditid) ||'' ''|| asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                    '                    start with fc_synonim = ''ACNK_RIGHT_GBA_DO1'' connect by prior fk_id = fk_owner) ';
    ods.DeclareAndSet('pfk_pacid', otInteger, pNazID);
    ods.Open;
    beRg7.Properties.OnEditValueChanged := nil;
    beRg7.Text := ods.FieldByName('smname').AsString;
    beRg7.Tag := ods.FieldByName('fk_smid').AsInteger;
    beRg7.Properties.OnEditValueChanged := beRg7PropertiesEditValueChanged;
// -- ПА до
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smeditid) ||'' ''|| asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                    '                    start with fc_synonim = ''ACNK_RIGHT_PA_DO1'' connect by prior fk_id = fk_owner) ';
    ods.DeclareAndSet('pfk_pacid', otInteger, pNazID);
    ods.Open;
    beRg8.Properties.OnEditValueChanged := nil;
    beRg8.Text := ods.FieldByName('smname').AsString;
    beRg8.Tag := ods.FieldByName('fk_smid').AsInteger;
    beRg8.Properties.OnEditValueChanged := beRg8PropertiesEditValueChanged;
// -- БА до
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smeditid) ||'' ''|| asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                    '                    start with fc_synonim = ''ACNK_RIGHT_BA_DO1'' connect by prior fk_id = fk_owner) ';
    ods.DeclareAndSet('pfk_pacid', otInteger, pNazID);
    ods.Open;
    beRg9.Properties.OnEditValueChanged := nil;
    beRg9.Text := ods.FieldByName('smname').AsString;
    beRg9.Tag := ods.FieldByName('fk_smid').AsInteger;
    beRg9.Properties.OnEditValueChanged := beRg9PropertiesEditValueChanged;
  finally
    ods.Free;
  end;
end;

procedure TfrmACNK.DoLoadRightGBA(sSyn: string; nSmid: Integer);
begin
  if sSyn = 'ACNK_RIGHT_GBA_STE' then
    begin
      lcbRg27.Properties.OnChange := nil;
      lcbRg27.EditValue := nSmid;
      lcbRg27.Properties.OnChange := lcbRg27PropertiesChange;
    end;
  if sSyn = 'ACNK_RIGHT_GBA_ANE' then
    begin
      lcbRg28.Properties.OnChange := nil;
      lcbRg28.EditValue := nSmid;
      lcbRg28.Properties.OnChange := lcbRg28PropertiesChange;
    end;
  if sSyn = 'ACNK_RIGHT_GBA_LOCAL1' then
    begin
      lcbRg29.Properties.OnChange := nil;
      lcbRg29.EditValue := nSmid;
      lcbRg29.Properties.OnChange := lcbRg29PropertiesChange;
    end;
  if sSyn = 'ACNK_RIGHT_GBA_KROVO' then
    begin
      lcbRg30.Properties.OnChange := nil;
      lcbRg30.EditValue := nSmid;
      lcbRg30.Properties.OnChange := lcbRg30PropertiesChange;
    end;
  if sSyn = 'ACNK_RIGHT_GBA_LOCAL2' then
    begin
      lcbRg31.Properties.OnChange := nil;
      lcbRg31.EditValue := nSmid;
      lcbRg31.Properties.OnChange := lcbRg31PropertiesChange;
    end;
end;

procedure TfrmACNK.DoLoadRightNPA(sSyn: string; nSmid: Integer);
begin
  if sSyn = 'ACNK_RIGHT_NPA_STE' then
    begin
      lcbRg7.Properties.OnChange := nil;
      lcbRg7.EditValue := nSmid;
      lcbRg7.Properties.OnChange := lcbRg7PropertiesChange;
    end;
  if sSyn = 'ACNK_RIGHT_NPA_ANE' then
    begin
      lcbRg8.Properties.OnChange := nil;
      lcbRg8.EditValue := nSmid;
      lcbRg8.Properties.OnChange := lcbRg8PropertiesChange;
    end;
  if sSyn = 'ACNK_RIGHT_NPA_LOCAL1' then
    begin
      lcbRg9.Properties.OnChange := nil;
      lcbRg9.EditValue := nSmid;
      lcbRg9.Properties.OnChange := lcbRg9PropertiesChange;
    end;
  if sSyn = 'ACNK_RIGHT_NPA_KROVO' then
    begin
      lcbRg10.Properties.OnChange := nil;
      lcbRg10.EditValue := nSmid;
      lcbRg10.Properties.OnChange := lcbRg10PropertiesChange;
    end;
  if sSyn = 'ACNK_RIGHT_NPA_LOCAL2' then
    begin
      lcbRg11.Properties.OnChange := nil;
      lcbRg11.EditValue := nSmid;
      lcbRg11.Properties.OnChange := lcbRg11PropertiesChange;
    end;
end;

procedure TfrmACNK.DoLoadRightPA(sSyn: string; nSmid: Integer);
begin
  if sSyn = 'ACNK_RIGHT_PA_STE' then
    begin
      lcbRg32.Properties.OnChange := nil;
      lcbRg32.EditValue := nSmid;
      lcbRg32.Properties.OnChange := lcbRg32PropertiesChange;
    end;
  if sSyn = 'ACNK_RIGHT_PA_LOCAL1' then
    begin
      lcbRg34.Properties.OnChange := nil;
      lcbRg34.EditValue := nSmid;
      lcbRg34.Properties.OnChange := lcbRg34PropertiesChange;
    end;
  if sSyn = 'ACNK_RIGHT_PA_KROVO' then
    begin
      lcbRg35.Properties.OnChange := nil;
      lcbRg35.EditValue := nSmid;
      lcbRg35.Properties.OnChange := lcbRg35PropertiesChange;
    end;
  if sSyn = 'ACNK_RIGHT_PA_LOCAL2' then
    begin
      lcbRg36.Properties.OnChange := nil;
      lcbRg36.EditValue := nSmid;
      lcbRg36.Properties.OnChange := lcbRg36PropertiesChange;
    end;
end;

procedure TfrmACNK.DoLoadRightPBA(sSyn: string; nSmid: Integer);
begin
  if sSyn = 'ACNK_RIGHT_PBA_STE' then
    begin
      lcbRg22.Properties.OnChange := nil;
      lcbRg22.EditValue := nSmid;
      lcbRg22.Properties.OnChange := lcbRg22PropertiesChange;
    end;
  if sSyn = 'ACNK_RIGHT_PBA_ANE' then
    begin
      lcbRg23.Properties.OnChange := nil;
      lcbRg23.EditValue := nSmid;
      lcbRg23.Properties.OnChange := lcbRg23PropertiesChange;
    end;
  if sSyn = 'ACNK_RIGHT_PBA_LOCAL1' then
    begin
      lcbRg24.Properties.OnChange := nil;
      lcbRg24.EditValue := nSmid;
      lcbRg24.Properties.OnChange := lcbRg24PropertiesChange;
    end;
  if sSyn = 'ACNK_RIGHT_PBA_KROVO' then
    begin
      lcbRg25.Properties.OnChange := nil;
      lcbRg25.EditValue := nSmid;
      lcbRg25.Properties.OnChange := lcbRg25PropertiesChange;
    end;
  if sSyn = 'ACNK_RIGHT_PBA_LOCAL2' then
    begin
      lcbRg26.Properties.OnChange := nil;
      lcbRg26.EditValue := nSmid;
      lcbRg26.Properties.OnChange := lcbRg26PropertiesChange;
    end;
end;

procedure TfrmACNK.DoLoadRightPOBA(sSyn: string; nSmid: Integer);
begin
  if sSyn = 'ACNK_RIGHT_POBA_STE' then
    begin
      lcbRg17.Properties.OnChange := nil;
      lcbRg17.EditValue := nSmid;
      lcbRg17.Properties.OnChange := lcbRg17PropertiesChange;
    end;
  if sSyn = 'ACNK_RIGHT_POBA_ANE' then
    begin
      lcbRg18.Properties.OnChange := nil;
      lcbRg18.EditValue := nSmid;
      lcbRg18.Properties.OnChange := lcbRg18PropertiesChange;
    end;
  if sSyn = 'ACNK_RIGHT_POBA_LOCAL1' then
    begin
      lcbRg19.Properties.OnChange := nil;
      lcbRg19.EditValue := nSmid;
      lcbRg19.Properties.OnChange := lcbRg19PropertiesChange;
    end;
  if sSyn = 'ACNK_RIGHT_POBA_KROVO' then
    begin
      lcbRg20.Properties.OnChange := nil;
      lcbRg20.EditValue := nSmid;
      lcbRg20.Properties.OnChange := lcbRg20PropertiesChange;
    end;
  if sSyn = 'ACNK_RIGHT_POBA_LOCAL2' then
    begin
      lcbRg21.Properties.OnChange := nil;
      lcbRg21.EditValue := nSmid;
      lcbRg21.Properties.OnChange := lcbRg21PropertiesChange;
    end;
end;

procedure TfrmACNK.DoLoadRightPOPA(sSyn: string; nSmid : Integer);
begin
  if sSyn = 'ACNK_RIGHT_POPA_IZ' then
    begin
      lcbRgIz.Properties.OnChange := nil;
      lcbRgIz.EditValue := nSmid;
      lcbRgIz.Properties.OnChange := lcbRgIzPropertiesChange;
    end;
  if sSyn = 'ACNK_RIGHT_POPA_LOCAL1' then
    begin
      lcbRg1.Properties.OnChange := nil;
      lcbRg1.EditValue := nSmid;
      lcbRg1.Properties.OnChange := lcbRg1PropertiesChange;
    end;
  if sSyn = 'ACNK_RIGHT_POPA_STE' then
    begin
      lcbRg2.Properties.OnChange := nil;
      lcbRg2.EditValue := nSmid;
      lcbRg2.Properties.OnChange := lcbRg2PropertiesChange;
    end;
  if sSyn = 'ACNK_RIGHT_POPA_ANE' then
    begin
      lcbRg3.Properties.OnChange := nil;
      lcbRg3.EditValue := nSmid;
      lcbRg3.Properties.OnChange := lcbRg3PropertiesChange;
    end;
  if sSyn = 'ACNK_RIGHT_POPA_LOCAL2' then
    begin
      lcbRg4.Properties.OnChange := nil;
      lcbRg4.EditValue := nSmid;
      lcbRg4.Properties.OnChange := lcbRg4PropertiesChange;
    end;
  if sSyn = 'ACNK_RIGHT_POPA_KROVO' then
    begin
      lcbRg5.Properties.OnChange := nil;
      lcbRg5.EditValue := nSmid;
      lcbRg5.Properties.OnChange := lcbRg5PropertiesChange;
    end;
  if sSyn = 'ACNK_RIGHT_POPA_LOCAL3' then
    begin
      lcbRg6.Properties.OnChange := nil;
      lcbRg6.EditValue := nSmid;
      lcbRg6.Properties.OnChange := lcbRg6PropertiesChange;
    end;
end;

procedure TfrmACNK.DoLoadRightVPA(sSyn: string; nSmid: Integer);
begin
  if sSyn = 'ACNK_RIGHT_VPA_STE' then
    begin
      lcbRg12.Properties.OnChange := nil;
      lcbRg12.EditValue := nSmid;
      lcbRg12.Properties.OnChange := lcbRg12PropertiesChange;
    end;
  if sSyn = 'ACNK_RIGHT_VPA_ANE' then
    begin
      lcbRg13.Properties.OnChange := nil;
      lcbRg13.EditValue := nSmid;
      lcbRg13.Properties.OnChange := lcbRg13PropertiesChange;
    end;
  if sSyn = 'ACNK_RIGHT_VPA_LOCAL1' then
    begin
      lcbRg14.Properties.OnChange := nil;
      lcbRg14.EditValue := nSmid;
      lcbRg14.Properties.OnChange := lcbRg14PropertiesChange;
    end;
  if sSyn = 'ACNK_RIGHT_VPA_KROVO' then
    begin
      lcbRg15.Properties.OnChange := nil;
      lcbRg15.EditValue := nSmid;
      lcbRg15.Properties.OnChange := lcbRg15PropertiesChange;
    end;
  if sSyn = 'ACNK_RIGHT_VPA_LOCAL2' then
    begin
      lcbRg16.Properties.OnChange := nil;
      lcbRg16.EditValue := nSmid;
      lcbRg16.Properties.OnChange := lcbRg16PropertiesChange;
    end;
end;

procedure TfrmACNK.DoLoadTibParams(nNazID: Integer);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' select fk_smid, fn_num, fk_smid, fk_smeditid, '+#13+
                    '        (select fc_synonim from asu.tsmid where fk_id = tib.fk_smid) as synsmid, '+#13+
                    '        (select fc_synonim from asu.tsmid where fk_id = tib.fk_smeditid) as syn '+#13+
                    '   from asu.tib where fk_pacid = :pfk_pacid '+#13+
                    ' order by fk_id ';
    ods.DeclareAndSet('pfk_pacid', otInteger, nNazID);
    ods.Open;
    ods.First;
    while not ods.Eof do
      begin
// -- Доступ
        if ods.FieldByName('syn').AsString = 'ACNK_ACCESS' then
          begin
            lcbAccess.Properties.OnChange := nil;
            lcbAccess.EditValue := ods.FieldByName('fk_smid').AsInteger;
            lcbAccess.Properties.OnChange := lcbAccessPropertiesChange;
          end;
// -- Контраст
        if ods.FieldByName('syn').AsString = 'RHMDL_KONTRAST' then
          begin
            lcbKontrast.Properties.OnChange := nil;
            lcbKontrast.EditValue := ods.FieldByName('fk_smid').AsInteger;
            lcbKontrast.Properties.OnChange := lcbKontrastPropertiesChange;
          end;
// -- Кол-во контраста
        if ods.FieldByName('synsmid').AsString = 'RHMDL_KOLVO_KONTRAST' then
          begin
            seKolvo.Properties.OnChange := nil;
            seKolvo.EditValue := ods.FieldByName('fn_num').AsInteger;
            seKolvo.Properties.OnChange := seKolvoPropertiesChange;
          end;
// -- Аорта
        if ods.FieldByName('syn').AsString = 'ACNK_AORTA' then
          begin
            lcbAorta.Properties.OnChange := nil;
            lcbAorta.EditValue := ods.FieldByName('fk_smid').AsInteger;
            lcbAorta.Properties.OnChange := lcbAortaPropertiesChange;
          end;
// -- Рекомендовано
        if ods.FieldByName('syn').AsString = 'ACNK_RECOM' then
          begin
            lcbRecom.Properties.OnChange := nil;
            lcbRecom.EditValue := ods.FieldByName('fk_smid').AsInteger;
            lcbRecom.Properties.OnChange := lcbRecomPropertiesChange;
          end;
// -- Доза
        if (ods.FieldByName('fk_smid').AsInteger = -1) and ((ods.FieldByName('fk_smeditid').AsInteger = -1)) then
          begin
            cxDoza.Properties.OnChange := nil;
            cxDoza.Text := FloatToStr(ods.FieldByName('fn_num').AsFloat);
            cxDoza.Properties.OnChange := cxDozaPropertiesChange;
          end;
// -- Правая чистая
        if ods.FieldByName('syn').AsString = 'ACNK_RIGHT_CLEAR' then
          begin
            lcbRgClear.Properties.OnChange := nil;
            lcbRgClear.EditValue := ods.FieldByName('fk_smid').AsInteger;
            lcbRgClear.Properties.OnChange := lcbRgClearPropertiesChange;
          end;
// -- Левая чистая
        if ods.FieldByName('syn').AsString = 'ACNK_LEFT_CLEAR' then
          begin
            lcbLfClear.Properties.OnChange := nil;
            lcbLfClear.EditValue := ods.FieldByName('fk_smid').AsInteger;
            lcbLfClear.Properties.OnChange := lcbLfClearPropertiesChange;
          end;

        DoLoadRightPOPA(ods.FieldByName('syn').AsString, ods.FieldByName('fk_smid').AsInteger); // Правая общая подвздошная артерия
        DoLoadRightNPA(ods.FieldByName('syn').AsString, ods.FieldByName('fk_smid').AsInteger); // Наружная подвздошная артерия
        DoLoadRightVPA(ods.FieldByName('syn').AsString, ods.FieldByName('fk_smid').AsInteger); // Внутреняя подвздошная артерия
        DoLoadRightPOBA(ods.FieldByName('syn').AsString, ods.FieldByName('fk_smid').AsInteger); // Правая общая бедренная артерия
        DoLoadRightPBA(ods.FieldByName('syn').AsString, ods.FieldByName('fk_smid').AsInteger); // Поверхностная бедренная артерия
        DoLoadRightGBA(ods.FieldByName('syn').AsString, ods.FieldByName('fk_smid').AsInteger); // Глубокая бедренная артерия
        DoLoadRightPA(ods.FieldByName('syn').AsString, ods.FieldByName('fk_smid').AsInteger); // Подколенная артерия
        DoLoadRightBA(ods.FieldByName('syn').AsString, ods.FieldByName('fk_smid').AsInteger); // Большеберцовая артерия
        DoLoadRightDo;
        DoLoadLeftLOPA(ods.FieldByName('syn').AsString, ods.FieldByName('fk_smid').AsInteger); // Левая общая подвздошная артерия
        DoLoadLeftNPA(ods.FieldByName('syn').AsString, ods.FieldByName('fk_smid').AsInteger); // Наружная подвздошная артерия
        DoLoadLeftVPA(ods.FieldByName('syn').AsString, ods.FieldByName('fk_smid').AsInteger); // Внутреняя подвздошная артерия
        DoLoadLeftLOBA(ods.FieldByName('syn').AsString, ods.FieldByName('fk_smid').AsInteger); // Левая общая бедренная артерия
        DoLoadLeftPBA(ods.FieldByName('syn').AsString, ods.FieldByName('fk_smid').AsInteger); // Поверхностная бедренная артерия
        DoLoadLeftGBA(ods.FieldByName('syn').AsString, ods.FieldByName('fk_smid').AsInteger); // Глубокая бедренная артерия
        DoLoadLeftPA(ods.FieldByName('syn').AsString, ods.FieldByName('fk_smid').AsInteger); // Подколенная артерия
        DoLoadLeftBA(ods.FieldByName('syn').AsString, ods.FieldByName('fk_smid').AsInteger); // Большеберцовая артерия
        DoLoadLeftDo;

        ods.Next;
      end;
  finally
    ods.Free;
  end;
end;

procedure TfrmACNK.DoPodpis;
var oq : TOracleQuery;
    ods : TOracleDataSet;
    memStream : TMemoryStream;
    sAll : String;
begin
  oq := TOracleQuery.Create(nil);
  ods := TOracleDataSet.Create(nil);
  oq.Session := frmMain.os;
  ods.Session := frmMain.os;
  memStream := TMemoryStream.Create;
  try
//-- vnaz
    oq.SQL.Text := ' update asu.vnaz '+#13+
                   '    set fk_nazsosid = asu.get_vipnaz, fd_run = :pfd_run, fk_ispolid = :pfk_ispolid '+#13+
                   '  where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfd_run', otDate, StrToDateTime(DateToStr(deDate.Date)+' '+FormatDateTime('hh:nn:ss', IncSecond(teTime.Time, 1))));
    oq.DeclareAndSet('pfk_ispolid', otInteger, lcbVrach.EditValue);
    oq.DeclareAndSet('pfk_id', otInteger, pNazID);
    oq.Execute;
//-- vres
    ods.SQL.Text := ' merge into asu.vres using dual on (fk_nazid = :pfk_nazid) '+#13+
                    ' when not matched then '+#13+
                    '   insert(fk_smid, fd_ins, fk_vrachid, fk_pacid, fk_nazid, fk_sos) '+#13+
                    '   values(:pfk_smid, :pfd_ins, :pfk_vrachid, :pfk_pacid, :pfk_nazid, asu.get_vipnaz) '+#13+
                    ' when matched then '+#13+
                    '   update set fd_ins = :pfd_ins, fk_vrachid = :pfk_vrachid, fk_smid = :pfk_smid '+#13+
                    '    where fk_nazid = :pfk_nazid ';
    ods.DeclareAndSet('pfk_smid', otInteger, pSmidID);
    ods.DeclareAndSet('pfd_ins', otDate, StrToDateTime(DateToStr(deDate.Date)+' '+FormatDateTime('hh:nn:ss', IncSecond(teTime.Time, 1))));
    ods.DeclareAndSet('pfk_vrachid', otInteger, lcbVrach.EditValue);
    ods.DeclareAndSet('pfk_pacid', otInteger, lbPac.Tag);
    ods.DeclareAndSet('pfk_nazid', otInteger, pNazID);
    ods.Open;
//-- tpodpisnaz
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' merge into asu.tpodpisnaz using dual on (fk_nazid = :pfk_nazid and fk_sotrid = :pfk_sotrid) '+#13+
                    ' when not matched then insert(fk_nazid, fk_sotrid, fk_sos, fd_date, fd_ins) '+#13+
                    '                       values(:pfk_nazid, :pfk_sotrid, asu.get_vipnaz, sysdate, :pfd_ins) '+#13+
                    ' when matched then update set fk_sos = asu.get_vipnaz, fd_ins = :pfd_ins '+#13+
                    '                    where fk_nazid = :pfk_nazid and fk_sotrid = :pfk_sotrid ';
    ods.DeclareAndSet('pfk_nazid', otInteger, pNazID);
    ods.DeclareAndSet('pfk_sotrid', otInteger, lcbVrach.EditValue);
    ods.DeclareAndSet('pfd_ins', otDate, StrToDateTime(DateToStr(deDate.Date)+' '+FormatDateTime('hh:nn:ss', IncSecond(teTime.Time, 1))));
    ods.Open;
//-- trichviewdata
    rve.Clear;
    rve.Format;
    InsertText('Пациент: '+lbPac.Caption, '-1;-1;-1', 0);
    rve.InsertText(#13+#10);
    InsertText('№ МК: '+lbNumMK.Caption, '-1;-1;-1', 0);
    rve.InsertText(#13+#10);
//-- Общее
    if (lcbAccess.EditValue <> 0) and (lcbAccess.EditValue <> -1) and (lcbAccess.EditValue <> null) then
      begin
        InsertText('Доступ: '+lcbAccess.EditText, '-1;-1;-1', 0);
        rve.InsertText(#13+#10);
      end;
    if (lcbAorta.EditValue <> 0) and (lcbAorta.EditValue <> -1) and (lcbAorta.EditValue <> null) then
      begin
        InsertText('Аорта: '+lcbAorta.EditText, '-1;-1;-1', 0);
        rve.InsertText(#13+#10);
      end;
    if (lcbKontrast.EditText <> '') and (lcbKontrast.EditValue <> -1) and (lcbKontrast.EditValue <> null) then
      sAll := sAll + 'Контраст: '+lcbKontrast.EditText+'; ';
    if (seKolvo.Value <> 0) and (seKolvo.Text <> '') then
      sAll := sAll + 'Кол-во: '+seKolvo.Text+'.';
    if sAll <> '' then
      begin
        InsertText('Расходные материалы', '-1;-1;-1', 1);
        rve.InsertText(#13+#10);
        InsertText(sAll, '-1;-1;-1', 0);
        rve.InsertText(#13+#10);
      end;
    if (lcbRecom.EditValue <> 0) and (lcbRecom.EditValue <> -1) and (lcbRecom.EditValue <> null) then
      begin
        InsertText('Рекомендации: ', '-1;-1;-1', 1);
        InsertText(lcbRecom.EditText, '-1;-1;-1', 0);
        rve.InsertText(#13+#10);
      end;
//-- Правая сторона
    DoPodpisRgPOPA; //-- Правая общая подвздошная артерия
    DoPodpisRgNPA; //-- Наружная подвздошная артерия
    DoPodpisRgVPA; //-- Внутренняя подвздошная артерия
    DoPodpisRgPOBA; //-- Правая общая бедренная артерия
    DoPodpisRgPBA; //-- Поверхностная бедренная артерия
    DoPodpisRgGBA; //-- Глубокая бедренная артерия
    DoPodpisRgPA; //-- Подколенная артерия
    DoPodpisRgBA; //-- Большеберцовая артерия
//-- Правая чистая
    if (lcbRgClear.EditValue <> 0) and (lcbRgClear.EditValue <> -1) and (lcbRgClear.EditValue <> null) then
      begin
        InsertText('Правая чистая: ', '-1;-1;-1', 1);
        InsertText(lcbRgClear.EditText, '-1;-1;-1', 0);
        rve.InsertText(#13+#10);
      end;
//-- Левая сторона
    DoPodpisLfLOPA; //-- Левая общая подвздошная артерия
    DoPodpisLfNPA; //-- Наружная подвздошная артерия
    DoPodpisLfVPA; //-- Внутренняя подвздошная артерия
    DoPodpisLfLOBA; //-- Левая общая бедренная артерия
    DoPodpisLfPBA; //-- Поверхностная бедренная артерия
    DoPodpisLfGBA; //-- Глубокая бедренная артерия
    DoPodpisLfPA; //-- Подколенная артерия
    DoPodpisLfBA; //-- Большеберцовая артерия
//-- Левая чистая
    if (lcbLfClear.EditValue <> 0) and (lcbLfClear.EditValue <> -1) and (lcbLfClear.EditValue <> null) then
      begin
        InsertText('Левая чистая: ', '-1;-1;-1', 1);
        InsertText(lcbLfClear.EditText, '-1;-1;-1', 0);
        rve.InsertText(#13+#10);
      end;
// -- Доза
  if (cxDoza.Value <> 0) and (cxDoza.Text <> '') then
    begin
      InsertText('Доза: ', '-1;-1;-1', 1);
      InsertText(cxDoza.Text, '-1;-1;-1', 0);
      InsertText(' мЗв', '-1;-1;-1', 0);
    end;

    odsRVData.Close;
    odsRVData.SetVariable('FK_PACID', pNazID);
    odsRVData.Open;

    if odsRVData.RecordCount=0 then
      odsRVData.Insert
    else
      odsRVData.Edit;
    rve.SetSelectionBounds(0, rve.GetOffsBeforeItem(0), rve.ItemCount - 1, rve.GetOffsAfterItem(rve.ItemCount - 1));
    Application.ProcessMessages;

    rve.SaveRVFToStream(memStream, False);
//сохраняем в BLOB
    memStream.Position := 0;
	  TBlobField(odsRVData.FieldByName('FB_BLOB')).LoadFromStream(memStream);
	  memStream.Clear;

//сохраняем в HTML
	  rve.AddText(#13, 0);
    rve.SaveHTMLToStream(memStream,'','',IntToStr(pNAZID)+'_',[rvsoOverrideImages,rvsoMiddleOnly,rvsoUseCheckpointsNames]);
    memStream.Position := 0;
	  TBlobField(odsRVData.FieldByName('FB_HTML')).LoadFromStream(memStream);
	  memStream.Clear;

//сохраняем в обычный текст
    rve.SaveTextToStream('',memStream,0,False,True);
	  memStream.Position := 0;
    TBlobField(odsRVData.FieldByName('FB_TEXT')).LoadFromStream(memStream);
    odsRVData.FieldByName('FN_COMPRESS').AsInteger := 1;
    odsRVData.FieldByName('FK_PACID').AsInteger := pNAZID;
    odsRVData.Post;
    frmMain.os.Commit;
  finally
    memStream.Free;
    oq.Free;
    ods.Free;
  end;
end;

procedure TfrmACNK.DoPodpisLfBA;
var sBA : String;
begin
  if (lcbLf36.EditValue <> 0) and (lcbLf36.EditValue <> -1) and (lcbLf36.EditValue <> null) then
    sBA := 'Стеноз: '+lcbLf36.EditText+'; ';
  if (lcbLf37.EditValue <> 0) and (lcbLf37.EditValue <> -1) and (lcbLf37.EditValue <> null) then
    sBA := sBA + 'Локализация: '+lcbLf37.EditText+'; ';
  if beRg9.Text <> '' then
    sBA := sBA + 'До, более: '+beRg9.Text+'.';
  if (lcbLf38.EditValue <> 0) and (lcbLf38.EditValue <> -1) and (lcbLf38.EditValue <> null) then
    sBA := sBA + 'Восстановление кровотока: '+lcbLf38.EditText+'; ';
  if (lcbLf39.EditValue <> 0) and (lcbLf39.EditValue <> -1) and (lcbLf39.EditValue <> null) then
    sBA := sBA + 'Локализация: '+lcbLf39.EditText+'; ';
  if sBA <> '' then
    begin
      InsertText('Большеберцовая артерия', '-1;-1;-1', 1);
      rve.InsertText(#13+#10);
      InsertText(sBA, '-1;-1;-1', 0);
      rve.InsertText(#13+#10);
    end;
end;

procedure TfrmACNK.DoPodpisLfGBA;
var sGBA : String;
begin
  if (lcbLf27.EditValue <> 0) and (lcbLf27.EditValue <> -1) and (lcbLf27.EditValue <> null) then
    sGBA := 'Стеноз: '+lcbLf27.EditText+'; ';
  if (lcbLf28.EditValue <> 0) and (lcbLf28.EditValue <> -1) and (lcbLf28.EditValue <> null) then
    sGBA := sGBA + 'Аневризма: '+lcbLf28.EditText+'; ';
  if (lcbLf29.EditValue <> 0) and (lcbLf29.EditValue <> -1) and (lcbLf29.EditValue <> null) then
    sGBA := sGBA + 'Локализация: '+lcbLf29.EditText+'; ';
  if beLf7.Text <> '' then
    sGBA := sGBA + 'До, более: '+beLf7.Text+'.';
  if (lcbLf30.EditValue <> 0) and (lcbLf30.EditValue <> -1) and (lcbLf30.EditValue <> null) then
    sGBA := sGBA + 'Восстановление кровотока: '+lcbLf30.EditText+'; ';
  if (lcbLf31.EditValue <> 0) and (lcbLf31.EditValue <> -1) and (lcbLf31.EditValue <> null) then
    sGBA := sGBA + 'Локализация: '+lcbLf31.EditText+'; ';
  if sGBA <> '' then
    begin
      InsertText('Глубокая бедренная артерия', '-1;-1;-1', 1);
      rve.InsertText(#13+#10);
      InsertText(sGBA, '-1;-1;-1', 0);
      rve.InsertText(#13+#10);
    end;
end;

procedure TfrmACNK.DoPodpisLfNPA;
var sNPA : String;
begin
  if (lcbLf7.EditValue <> 0) and (lcbLf7.EditValue <> -1) and (lcbLf7.EditValue <> null) then
    sNPA := 'Стеноз: '+lcbLf7.EditText+'; ';
  if (lcbLf8.EditValue <> 0) and (lcbLf8.EditValue <> -1) and (lcbLf8.EditValue <> null) then
    sNPA := sNPA + 'Аневризма: '+lcbLf8.EditText+'; ';
  if (lcbLf9.EditValue <> 0) and (lcbLf9.EditValue <> -1) and (lcbLf9.EditValue <> null) then
    sNPA := sNPA + 'Локализация: '+lcbLf9.EditText+'; ';
  if beLf3.Text <> '' then
    sNPA := sNPA + 'До, более: '+beLf3.Text+'.';
  if (lcbLf10.EditValue <> 0) and (lcbLf10.EditValue <> -1) and (lcbLf10.EditValue <> null) then
    sNPA := sNPA + 'Восстановление кровотока: '+lcbLf10.EditText+'; ';
  if (lcbLf11.EditValue <> 0) and (lcbLf11.EditValue <> -1) and (lcbLf11.EditValue <> null) then
    sNPA := sNPA + 'Локализация: '+lcbLf11.EditText+'; ';
  if sNPA <> '' then
    begin
      InsertText('Наружная подвздошная артерия', '-1;-1;-1', 1);
      rve.InsertText(#13+#10);
      InsertText(sNPA, '-1;-1;-1', 0);
      rve.InsertText(#13+#10);
    end;
end;

procedure TfrmACNK.DoPodpisLfPA;
var sPA : String;
begin
  if (lcbLf32.EditValue <> 0) and (lcbLf32.EditValue <> -1) and (lcbLf32.EditValue <> null) then
    sPA := 'Стеноз: '+lcbLf32.EditText+'; ';
  if (lcbLf33.EditValue <> 0) and (lcbLf33.EditValue <> -1) and (lcbLf33.EditValue <> null) then
    sPA := sPA + 'Локализация: '+lcbLf33.EditText+'; ';
  if beLf8.Text <> '' then
    sPA := sPA + 'До, более: '+beLf8.Text+'.';
  if (lcbRg34.EditValue <> 0) and (lcbRg34.EditValue <> -1) and (lcbRg34.EditValue <> null) then
    sPA := sPA + 'Восстановление кровотока: '+lcbRg34.EditText+'; ';
  if (lcbLf35.EditValue <> 0) and (lcbLf35.EditValue <> -1) and (lcbLf35.EditValue <> null) then
    sPA := sPA + 'Локализация: '+lcbLf35.EditText+'; ';
  if sPA <> '' then
    begin
      InsertText('Подколенная артерия', '-1;-1;-1', 1);
      rve.InsertText(#13+#10);
      InsertText(sPA, '-1;-1;-1', 0);
      rve.InsertText(#13+#10);
    end;
end;

procedure TfrmACNK.DoPodpisLfPBA;
var sPBA : String;
begin
  if (lcbLf22.EditValue <> 0) and (lcbLf22.EditValue <> -1) and (lcbLf22.EditValue <> null) then
    sPBA := 'Стеноз: '+lcbLf22.EditText+'; ';
  if (lcbLf23.EditValue <> 0) and (lcbLf23.EditValue <> -1) and (lcbLf23.EditValue <> null) then
    sPBA := sPBA + 'Аневризма: '+lcbLf23.EditText+'; ';
  if (lcbLf24.EditValue <> 0) and (lcbLf24.EditValue <> -1) and (lcbLf24.EditValue <> null) then
    sPBA := sPBA + 'Локализация: '+lcbLf24.EditText+'; ';
  if beLf6.Text <> '' then
    sPBA := sPBA + 'До, более: '+beLf6.Text+'.';
  if (lcbLf25.EditValue <> 0) and (lcbLf25.EditValue <> -1) and (lcbLf25.EditValue <> null) then
    sPBA := sPBA + 'Восстановление кровотока: '+lcbLf25.EditText+'; ';
  if (lcbLf26.EditValue <> 0) and (lcbLf26.EditValue <> -1) and (lcbLf26.EditValue <> null) then
    sPBA := sPBA + 'Локализация: '+lcbLf26.EditText+'; ';
  if sPBA <> '' then
    begin
      InsertText('Поверхностная бедренная артерия', '-1;-1;-1', 1);
      rve.InsertText(#13+#10);
      InsertText(sPBA, '-1;-1;-1', 0);
      rve.InsertText(#13+#10);
    end;
end;

procedure TfrmACNK.DoPodpisLfLOBA;
var sLOBA : String;
begin
  if (lcbLf17.EditValue <> 0) and (lcbLf17.EditValue <> -1) and (lcbLf17.EditValue <> null) then
    sLOBA := 'Стеноз: '+lcbLf17.EditText+'; ';
  if (lcbLf18.EditValue <> 0) and (lcbLf18.EditValue <> -1) and (lcbLf18.EditValue <> null) then
    sLOBA := sLOBA + 'Аневризма: '+lcbLf18.EditText+'; ';
  if (lcbLf19.EditValue <> 0) and (lcbLf19.EditValue <> -1) and (lcbLf19.EditValue <> null) then
    sLOBA := sLOBA + 'Локализация: '+lcbLf19.EditText+'; ';
  if beLf5.Text <> '' then
    sLOBA := sLOBA + 'До, более: '+beLf5.Text+'.';
  if (lcbLf20.EditValue <> 0) and (lcbLf20.EditValue <> -1) and (lcbLf20.EditValue <> null) then
    sLOBA := sLOBA + 'Восстановление кровотока: '+lcbLf20.EditText+'; ';
  if (lcbLf21.EditValue <> 0) and (lcbLf21.EditValue <> -1) and (lcbLf21.EditValue <> null) then
    sLOBA := sLOBA + 'Локализация: '+lcbLf21.EditText+'; ';
  if sLOBA <> '' then
    begin
      InsertText('Левая общая бедренная артерия', '-1;-1;-1', 1);
      rve.InsertText(#13+#10);
      InsertText(sLOBA, '-1;-1;-1', 0);
      rve.InsertText(#13+#10);
    end;
end;

procedure TfrmACNK.DoPodpisLfLOPA;
var sLOPA : String;
begin
  if (lcbLfIz.EditValue <> 0) and (lcbLfIz.EditValue <> -1) and (lcbLfIz.EditValue <> null) then
    sLOPA := 'Извитость: '+lcbLfIz.EditText+'; ';
  if (lcbLf1.EditValue <> 0) and (lcbLf1.EditValue <> -1) and (lcbLf1.EditValue <> null) then
    sLOPA := sLOPA + 'Локализация: '+lcbLf1.EditText+'; ';
  if beLf1.Text <> '' then
    sLOPA := sLOPA + 'До, более: '+beLf1.Text+'; ';
  if (lcbLf2.EditValue <> 0) and (lcbLf2.EditValue <> -1) and (lcbLf2.EditValue <> null) then
    sLOPA := sLOPA + 'Стеноз: '+lcbLf2.EditText+'; ';
  if (lcbLf3.EditValue <> 0) and (lcbLf3.EditValue <> -1) and (lcbLf3.EditValue <> null) then
    sLOPA := sLOPA + 'Аневризма: '+lcbLf3.EditText+'; ';
  if (lcbLf4.EditValue <> 0) and (lcbLf4.EditValue <> -1) and (lcbLf4.EditValue <> null) then
    sLOPA := sLOPA + 'Локализация: '+lcbLf4.EditText+'; ';
  if beLf2.Text <> '' then
    sLOPA := sLOPA + 'До, более: '+beLf2.Text+'.';
  if (lcbLf5.EditValue <> 0) and (lcbLf5.EditValue <> -1) and (lcbLf5.EditValue <> null) then
    sLOPA := sLOPA + 'Восстановление кровотока: '+lcbLf5.EditText+'; ';
  if (lcbLf6.EditValue <> 0) and (lcbLf6.EditValue <> -1) and (lcbLf6.EditValue <> null) then
    sLOPA := sLOPA + 'Локализация: '+lcbLf6.EditText+'; ';
  if sLOPA <> '' then
    begin
      InsertText('Левая общая подвздошная артерия', '-1;-1;-1', 1);
      rve.InsertText(#13+#10);
      InsertText(sLOPA, '-1;-1;-1', 0);
      rve.InsertText(#13+#10);
    end;
end;

procedure TfrmACNK.DoPodpisLfVPA;
var sVPA : String;
begin
  if (lcbLf12.EditValue <> 0) and (lcbLf12.EditValue <> -1) and (lcbLf12.EditValue <> null) then
    sVPA := 'Стеноз: '+lcbLf12.EditText+'; ';
  if (lcbLf13.EditValue <> 0) and (lcbLf13.EditValue <> -1) and (lcbLf13.EditValue <> null) then
    sVPA := sVPA + 'Аневризма: '+lcbLf13.EditText+'; ';
  if (lcbLf14.EditValue <> 0) and (lcbLf14.EditValue <> -1) and (lcbLf14.EditValue <> null) then
    sVPA := sVPA + 'Локализация: '+lcbLf14.EditText+'; ';
  if beLf4.Text <> '' then
    sVPA := sVPA + 'До, более: '+beLf4.Text+'.';
  if (lcbLf15.EditValue <> 0) and (lcbLf15.EditValue <> -1) and (lcbLf15.EditValue <> null) then
    sVPA := sVPA + 'Восстановление кровотока: '+lcbLf15.EditText+'; ';
  if (lcbLf16.EditValue <> 0) and (lcbLf16.EditValue <> -1) and (lcbLf16.EditValue <> null) then
    sVPA := sVPA + 'Локализация: '+lcbLf16.EditText+'; ';
  if sVPA <> '' then
    begin
      InsertText('Внутренняя подвздошная артерия', '-1;-1;-1', 1);
      rve.InsertText(#13+#10);
      InsertText(sVPA, '-1;-1;-1', 0);
      rve.InsertText(#13+#10);
    end;
end;

procedure TfrmACNK.DoPodpisRgBA;
var sBA : String;
begin
  if (lcbRg37.EditValue <> 0) and (lcbRg37.EditValue <> -1) and (lcbRg37.EditValue <> null) then
    sBA := 'Стеноз: '+lcbRg37.EditText+'; ';
  if (lcbRg39.EditValue <> 0) and (lcbRg39.EditValue <> -1) and (lcbRg39.EditValue <> null) then
    sBA := sBA + 'Локализация: '+lcbRg39.EditText+'; ';
  if beRg9.Text <> '' then
    sBA := sBA + 'До, более: '+beRg9.Text+'.';
  if (lcbRg40.EditValue <> 0) and (lcbRg40.EditValue <> -1) and (lcbRg40.EditValue <> null) then
    sBA := sBA + 'Восстановление кровотока: '+lcbRg40.EditText+'; ';
  if (lcbRg41.EditValue <> 0) and (lcbRg41.EditValue <> -1) and (lcbRg41.EditValue <> null) then
    sBA := sBA + 'Локализация: '+lcbRg41.EditText+'; ';
  if sBA <> '' then
    begin
      InsertText('Большеберцовая артерия', '-1;-1;-1', 1);
      rve.InsertText(#13+#10);
      InsertText(sBA, '-1;-1;-1', 0);
      rve.InsertText(#13+#10);
    end;
end;

procedure TfrmACNK.DoPodpisRgGBA;
var sGBA : String;
begin
  if (lcbRg27.EditValue <> 0) and (lcbRg27.EditValue <> -1) and (lcbRg27.EditValue <> null) then
    sGBA := 'Стеноз: '+lcbRg27.EditText+'; ';
  if (lcbRg28.EditValue <> 0) and (lcbRg28.EditValue <> -1) and (lcbRg28.EditValue <> null) then
    sGBA := sGBA + 'Аневризма: '+lcbRg28.EditText+'; ';
  if (lcbRg29.EditValue <> 0) and (lcbRg29.EditValue <> -1) and (lcbRg29.EditValue <> null) then
    sGBA := sGBA + 'Локализация: '+lcbRg29.EditText+'; ';
  if beRg7.Text <> '' then
    sGBA := sGBA + 'До, более: '+beRg7.Text+'.';
  if (lcbRg30.EditValue <> 0) and (lcbRg30.EditValue <> -1) and (lcbRg30.EditValue <> null) then
    sGBA := sGBA + 'Восстановление кровотока: '+lcbRg30.EditText+'; ';
  if (lcbRg31.EditValue <> 0) and (lcbRg31.EditValue <> -1) and (lcbRg31.EditValue <> null) then
    sGBA := sGBA + 'Локализация: '+lcbRg31.EditText+'; ';
  if sGBA <> '' then
    begin
      InsertText('Глубокая бедренная артерия', '-1;-1;-1', 1);
      rve.InsertText(#13+#10);
      InsertText(sGBA, '-1;-1;-1', 0);
      rve.InsertText(#13+#10);
    end;
end;

procedure TfrmACNK.DoPodpisRgNPA;
var sNPA : String;
begin
  if (lcbRg7.EditValue <> 0) and (lcbRg7.EditValue <> -1) and (lcbRg7.EditValue <> null) then
    sNPA := 'Стеноз: '+lcbRg7.EditText+'; ';
  if (lcbRg8.EditValue <> 0) and (lcbRg8.EditValue <> -1) and (lcbRg8.EditValue <> null) then
    sNPA := sNPA + 'Аневризма: '+lcbRg8.EditText+'; ';
  if (lcbRg9.EditValue <> 0) and (lcbRg9.EditValue <> -1) and (lcbRg9.EditValue <> null) then
    sNPA := sNPA + 'Локализация: '+lcbRg9.EditText+'; ';
  if beRg3.Text <> '' then
    sNPA := sNPA + 'До, более: '+beRg3.Text+'.';
  if (lcbRg10.EditValue <> 0) and (lcbRg10.EditValue <> -1) and (lcbRg10.EditValue <> null) then
    sNPA := sNPA + 'Восстановление кровотока: '+lcbRg10.EditText+'; ';
  if (lcbRg11.EditValue <> 0) and (lcbRg11.EditValue <> -1) and (lcbRg11.EditValue <> null) then
    sNPA := sNPA + 'Локализация: '+lcbRg11.EditText+'; ';
  if sNPA <> '' then
    begin
      InsertText('Наружная подвздошная артерия', '-1;-1;-1', 1);
      rve.InsertText(#13+#10);
      InsertText(sNPA, '-1;-1;-1', 0);
      rve.InsertText(#13+#10);
    end;
end;

procedure TfrmACNK.DoPodpisRgPA;
var sPA : String;
begin
  if (lcbRg32.EditValue <> 0) and (lcbRg32.EditValue <> -1) and (lcbRg32.EditValue <> null) then
    sPA := 'Стеноз: '+lcbRg32.EditText+'; ';
  if (lcbRg34.EditValue <> 0) and (lcbRg34.EditValue <> -1) and (lcbRg34.EditValue <> null) then
    sPA := sPA + 'Локализация: '+lcbRg34.EditText+'; ';
  if beRg8.Text <> '' then
    sPA := sPA + 'До, более: '+beRg8.Text+'.';
  if (lcbRg35.EditValue <> 0) and (lcbRg35.EditValue <> -1) and (lcbRg35.EditValue <> null) then
    sPA := sPA + 'Восстановление кровотока: '+lcbRg35.EditText+'; ';
  if (lcbRg36.EditValue <> 0) and (lcbRg36.EditValue <> -1) and (lcbRg36.EditValue <> null) then
    sPA := sPA + 'Локализация: '+lcbRg36.EditText+'; ';
  if sPA <> '' then
    begin
      InsertText('Подколенная артерия', '-1;-1;-1', 1);
      rve.InsertText(#13+#10);
      InsertText(sPA, '-1;-1;-1', 0);
      rve.InsertText(#13+#10);
    end;
end;

procedure TfrmACNK.DoPodpisRgPBA;
var sPBA : String;
begin
  if (lcbRg22.EditValue <> 0) and (lcbRg22.EditValue <> -1) and (lcbRg22.EditValue <> null) then
    sPBA := 'Стеноз: '+lcbRg22.EditText+'; ';
  if (lcbRg23.EditValue <> 0) and (lcbRg23.EditValue <> -1) and (lcbRg23.EditValue <> null) then
    sPBA := sPBA + 'Аневризма: '+lcbRg23.EditText+'; ';
  if (lcbRg24.EditValue <> 0) and (lcbRg24.EditValue <> -1) and (lcbRg24.EditValue <> null) then
    sPBA := sPBA + 'Локализация: '+lcbRg24.EditText+'; ';
  if beRg6.Text <> '' then
    sPBA := sPBA + 'До, более: '+beRg6.Text+'.';
  if (lcbRg25.EditValue <> 0) and (lcbRg25.EditValue <> -1) and (lcbRg25.EditValue <> null) then
    sPBA := sPBA + 'Восстановление кровотока: '+lcbRg25.EditText+'; ';
  if (lcbRg26.EditValue <> 0) and (lcbRg26.EditValue <> -1) and (lcbRg26.EditValue <> null) then
    sPBA := sPBA + 'Локализация: '+lcbRg26.EditText+'; ';
  if sPBA <> '' then
    begin
      InsertText('Поверхностная бедренная артерия', '-1;-1;-1', 1);
      rve.InsertText(#13+#10);
      InsertText(sPBA, '-1;-1;-1', 0);
      rve.InsertText(#13+#10);
    end;
end;

procedure TfrmACNK.DoPodpisRgPOBA;
var sPOBA : String;
begin
  if (lcbRg17.EditValue <> 0) and (lcbRg17.EditValue <> -1) and (lcbRg17.EditValue <> null) then
    sPOBA := 'Стеноз: '+lcbRg17.EditText+'; ';
  if (lcbRg18.EditValue <> 0) and (lcbRg18.EditValue <> -1) and (lcbRg18.EditValue <> null) then
    sPOBA := sPOBA + 'Аневризма: '+lcbRg18.EditText+'; ';
  if (lcbRg19.EditValue <> 0) and (lcbRg19.EditValue <> -1) and (lcbRg19.EditValue <> null) then
    sPOBA := sPOBA + 'Локализация: '+lcbRg19.EditText+'; ';
  if beRg5.Text <> '' then
    sPOBA := sPOBA + 'До, более: '+beRg5.Text+'.';
  if (lcbRg20.EditValue <> 0) and (lcbRg20.EditValue <> -1) and (lcbRg20.EditValue <> null) then
    sPOBA := sPOBA + 'Восстановление кровотока: '+lcbRg20.EditText+'; ';
  if (lcbRg21.EditValue <> 0) and (lcbRg21.EditValue <> -1) and (lcbRg21.EditValue <> null) then
    sPOBA := sPOBA + 'Локализация: '+lcbRg21.EditText+'; ';
  if sPOBA <> '' then
    begin
      InsertText('Правая общая бедренная артерия', '-1;-1;-1', 1);
      rve.InsertText(#13+#10);
      InsertText(sPOBA, '-1;-1;-1', 0);
      rve.InsertText(#13+#10);
    end;
end;

procedure TfrmACNK.DoPodpisRgPOPA;
var sPOPA : String;
begin
  if (lcbRgIz.EditValue <> 0) and (lcbRgIz.EditValue <> -1) and (lcbRgIz.EditValue <> null) then
    sPOPA := 'Извитость: '+lcbRgIz.EditText+'; ';
  if (lcbRg1.EditValue <> 0) and (lcbRg1.EditValue <> -1) and (lcbRg1.EditValue <> null) then
    sPOPA := sPOPA + 'Локализация: '+lcbRg1.EditText+'; ';
  if beRg1.Text <> '' then
    sPOPA := sPOPA + 'До, более: '+beRg1.Text+'; ';
  if (lcbRg2.EditValue <> 0) and (lcbRg2.EditValue <> -1) and (lcbRg2.EditValue <> null) then
    sPOPA := sPOPA + 'Стеноз: '+lcbRg2.EditText+'; ';
  if (lcbRg3.EditValue <> 0) and (lcbRg3.EditValue <> -1) and (lcbRg3.EditValue <> null) then
    sPOPA := sPOPA + 'Аневризма: '+lcbRg3.EditText+'; ';
  if (lcbRg4.EditValue <> 0) and (lcbRg4.EditValue <> -1) and (lcbRg4.EditValue <> null) then
    sPOPA := sPOPA + 'Локализация: '+lcbRg4.EditText+'; ';
  if beRg2.Text <> '' then
    sPOPA := sPOPA + 'До, более: '+beRg2.Text+'.';
  if (lcbRg5.EditValue <> 0) and (lcbRg5.EditValue <> -1) and (lcbRg5.EditValue <> null) then
    sPOPA := sPOPA + 'Восстановление кровотока: '+lcbRg5.EditText+'; ';
  if (lcbRg6.EditValue <> 0) and (lcbRg6.EditValue <> -1) and (lcbRg6.EditValue <> null) then
    sPOPA := sPOPA + 'Локализация: '+lcbRg6.EditText+'; ';
  if sPOPA <> '' then
    begin
      InsertText('Правая общая подвздошная артерия', '-1;-1;-1', 1);
      rve.InsertText(#13+#10);
      InsertText(sPOPA, '-1;-1;-1', 0);
      rve.InsertText(#13+#10);
    end;
end;

procedure TfrmACNK.DoPodpisRgVPA;
var sVPA : String;
begin
  if (lcbRg12.EditValue <> 0) and (lcbRg12.EditValue <> -1) and (lcbRg12.EditValue <> null) then
    sVPA := 'Стеноз: '+lcbRg12.EditText+'; ';
  if (lcbRg13.EditValue <> 0) and (lcbRg13.EditValue <> -1) and (lcbRg13.EditValue <> null) then
    sVPA := sVPA + 'Аневризма: '+lcbRg13.EditText+'; ';
  if (lcbRg14.EditValue <> 0) and (lcbRg14.EditValue <> -1) and (lcbRg14.EditValue <> null) then
    sVPA := sVPA + 'Локализация: '+lcbRg14.EditText+'; ';
  if beRg4.Text <> '' then
    sVPA := sVPA + 'До, более: '+beRg4.Text+'.';
  if (lcbRg15.EditValue <> 0) and (lcbRg15.EditValue <> -1) and (lcbRg15.EditValue <> null) then
    sVPA := sVPA + 'Восстановление кровотока: '+lcbRg15.EditText+'; ';
  if (lcbRg16.EditValue <> 0) and (lcbRg16.EditValue <> -1) and (lcbRg16.EditValue <> null) then
    sVPA := sVPA + 'Локализация: '+lcbRg16.EditText+'; ';
  if sVPA <> '' then
    begin
      InsertText('Внутренняя подвздошная артерия', '-1;-1;-1', 1);
      rve.InsertText(#13+#10);
      InsertText(sVPA, '-1;-1;-1', 0);
      rve.InsertText(#13+#10);
    end;
end;

procedure TfrmACNK.DoPrintLeft;
begin
// ПОПА
  if (lcbLfIz.EditText <> '') and (lcbLfIz.EditValue <> -1) and (lcbLfIz.EditValue <> null) then
    sPrintLeft := 'Извитость: '+lcbLfIz.EditText+'; ';
  if (lcbLf1.EditText <> '') and (lcbLf1.EditValue <> -1) and (lcbLf1.EditValue <> null) then
    sPrintLeft := sPrintLeft+'Локализация: '+lcbLf1.EditText+'; ';
  if beLf1.Text <> '' then
    sPrintLeft := sPrintLeft + 'До, более: '+beLf1.Text+'; ';
  if (lcbLf2.EditText <> '') and (lcbLf2.EditValue <> -1) and (lcbLf2.EditValue <> null) then
    sPrintLeft := sPrintLeft+'Стеноз: '+lcbLf2.EditText+'; ';
  if (lcbLf3.EditText <> '') and (lcbLf3.EditValue <> -1) and (lcbLf3.EditValue <> null) then
    sPrintLeft := sPrintLeft+'Аневризма: '+lcbLf3.EditText+'; ';
  if (lcbLf4.EditText <> '') and (lcbLf4.EditValue <> -1) and (lcbLf4.EditValue <> null) then
    sPrintLeft := sPrintLeft+'Локализация: '+lcbLf4.EditText+'; ';
  if beLf2.Text <> '' then
    sPrintLeft := sPrintLeft + 'До, более: '+beLf2.Text+'; ';
  if (lcbLf5.EditText <> '') and (lcbLf5.EditValue <> -1) and (lcbLf5.EditValue <> null) then
    sPrintLeft := sPrintLeft+'Восстановление кровотока: '+lcbLf5.EditText+'; ';
  if (lcbLf6.EditText <> '') and (lcbLf6.EditValue <> -1) and (lcbLf6.EditValue <> null) then
    sPrintLeft := sPrintLeft+'Локализация: '+lcbLf6.EditText+'; ';
// НПА
  if (lcbLf7.EditText <> '') and (lcbLf7.EditValue <> -1) and (lcbLf7.EditValue <> null) then
    sPrintLeft := sPrintLeft+'Стеноз: '+lcbLf7.EditText+'; ';
  if (lcbLf8.EditText <> '') and (lcbLf8.EditValue <> -1) and (lcbLf8.EditValue <> null) then
    sPrintLeft := sPrintLeft+'Аневризма: '+lcbLf8.EditText+'; ';
  if (lcbLf9.EditText <> '') and (lcbLf9.EditValue <> -1) and (lcbLf9.EditValue <> null) then
    sPrintLeft := sPrintLeft+'Локализация: '+lcbLf9.EditText+'; ';
  if beLf3.Text <> '' then
    sPrintLeft := sPrintLeft + 'До, более: '+beLf3.Text+'; ';
  if (lcbLf10.EditText <> '') and (lcbLf10.EditValue <> -1) and (lcbLf10.EditValue <> null) then
    sPrintLeft := sPrintLeft+'Восстановление кровотока: '+lcbLf10.EditText+'; ';
  if (lcbLf11.EditText <> '') and (lcbLf11.EditValue <> -1) and (lcbLf11.EditValue <> null) then
    sPrintLeft := sPrintLeft+'Локализация: '+lcbLf11.EditText+'; ';
// ВПА
  if (lcbLf12.EditText <> '') and (lcbLf12.EditValue <> -1) and (lcbLf12.EditValue <> null) then
    sPrintLeft := sPrintLeft+'Стеноз: '+lcbLf12.EditText+'; ';
  if (lcbLf13.EditText <> '') and (lcbLf13.EditValue <> -1) and (lcbLf13.EditValue <> null) then
    sPrintLeft := sPrintLeft+'Аневризма: '+lcbLf13.EditText+'; ';
  if (lcbLf14.EditText <> '') and (lcbLf14.EditValue <> -1) and (lcbLf14.EditValue <> null) then
    sPrintLeft := sPrintLeft+'Локализация: '+lcbLf14.EditText+'; ';
  if beLf4.Text <> '' then
    sPrintLeft := sPrintLeft + 'До, более: '+beLf4.Text+'; ';
  if (lcbLf15.EditText <> '') and (lcbLf15.EditValue <> -1) and (lcbLf15.EditValue <> null) then
    sPrintLeft := sPrintLeft+'Восстановление кровотока: '+lcbLf15.EditText+'; ';
  if (lcbLf16.EditText <> '') and (lcbLf16.EditValue <> -1) and (lcbLf16.EditValue <> null) then
    sPrintLeft := sPrintLeft+'Локализация: '+lcbLf16.EditText+'; ';
// ПОБА
  if (lcbLf17.EditText <> '') and (lcbLf17.EditValue <> -1) and (lcbLf17.EditValue <> null) then
    sPrintLeft := sPrintLeft+'Стеноз: '+lcbLf17.EditText+'; ';
  if (lcbLf18.EditText <> '') and (lcbLf18.EditValue <> -1) and (lcbLf18.EditValue <> null) then
    sPrintLeft := sPrintLeft+'Аневризма: '+lcbLf18.EditText+'; ';
  if (lcbLf19.EditText <> '') and (lcbLf19.EditValue <> -1) and (lcbLf19.EditValue <> null) then
    sPrintLeft := sPrintLeft+'Локализация: '+lcbLf19.EditText+'; ';
  if beLf5.Text <> '' then
    sPrintLeft := sPrintLeft + 'До, более: '+beLf5.Text+'; ';
  if (lcbLf20.EditText <> '') and (lcbLf20.EditValue <> -1) and (lcbLf20.EditValue <> null) then
    sPrintLeft := sPrintLeft+'Восстановление кровотока: '+lcbLf20.EditText+'; ';
  if (lcbLf21.EditText <> '') and (lcbLf21.EditValue <> -1) and (lcbLf21.EditValue <> null) then
    sPrintLeft := sPrintLeft+'Локализация: '+lcbLf21.EditText+'; ';
// ПБА
  if (lcbLf22.EditText <> '') and (lcbLf22.EditValue <> -1) and (lcbLf22.EditValue <> null) then
    sPrintLeft := sPrintLeft+'Стеноз: '+lcbLf22.EditText+'; ';
  if (lcbLf23.EditText <> '') and (lcbLf23.EditValue <> -1) and (lcbLf23.EditValue <> null) then
    sPrintLeft := sPrintLeft+'Аневризма: '+lcbLf23.EditText+'; ';
  if (lcbLf24.EditText <> '') and (lcbLf24.EditValue <> -1) and (lcbLf24.EditValue <> null) then
    sPrintLeft := sPrintLeft+'Локализация: '+lcbLf24.EditText+'; ';
  if beLf6.Text <> '' then
    sPrintLeft := sPrintLeft + 'До, более: '+beLf6.Text+'; ';
  if (lcbLf25.EditText <> '') and (lcbLf25.EditValue <> -1) and (lcbLf25.EditValue <> null) then
    sPrintLeft := sPrintLeft+'Восстановление кровотока: '+lcbLf25.EditText+'; ';
  if (lcbLf26.EditText <> '') and (lcbLf26.EditValue <> -1) and (lcbLf26.EditValue <> null) then
    sPrintLeft := sPrintLeft+'Локализация: '+lcbLf26.EditText+'; ';
// ГБА
  if (lcbLf27.EditText <> '') and (lcbLf27.EditValue <> -1) and (lcbLf27.EditValue <> null) then
    sPrintLeft := sPrintLeft+'Стеноз: '+lcbLf27.EditText+'; ';
  if (lcbLf28.EditText <> '') and (lcbLf28.EditValue <> -1) and (lcbLf28.EditValue <> null) then
    sPrintLeft := sPrintLeft+'Аневризма: '+lcbLf28.EditText+'; ';
  if (lcbLf29.EditText <> '') and (lcbLf29.EditValue <> -1) and (lcbLf29.EditValue <> null) then
    sPrintLeft := sPrintLeft+'Локализация: '+lcbLf29.EditText+'; ';
  if beLf7.Text <> '' then
    sPrintLeft := sPrintLeft + 'До, более: '+beLf7.Text+'; ';
  if (lcbLf30.EditText <> '') and (lcbLf30.EditValue <> -1) and (lcbLf30.EditValue <> null) then
    sPrintLeft := sPrintLeft+'Восстановление кровотока: '+lcbLf30.EditText+'; ';
  if (lcbLf31.EditText <> '') and (lcbLf31.EditValue <> -1) and (lcbLf31.EditValue <> null) then
    sPrintLeft := sPrintLeft+'Локализация: '+lcbLf31.EditText+'; ';
// ПА
  if (lcbLf32.EditText <> '') and (lcbLf32.EditValue <> -1) and (lcbLf32.EditValue <> null) then
    sPrintLeft := sPrintLeft+'Стеноз: '+lcbLf32.EditText+'; ';
  if (lcbLf33.EditText <> '') and (lcbLf33.EditValue <> -1) and (lcbLf33.EditValue <> null) then
    sPrintLeft := sPrintLeft+'Локализация: '+lcbLf33.EditText+'; ';
  if beLf8.Text <> '' then
    sPrintLeft := sPrintLeft + 'До, более: '+beLf8.Text+'; ';
  if (lcbLf34.EditText <> '') and (lcbLf34.EditValue <> -1) and (lcbLf34.EditValue <> null) then
    sPrintLeft := sPrintLeft+'Восстановление кровотока: '+lcbLf34.EditText+'; ';
  if (lcbLf35.EditText <> '') and (lcbLf35.EditValue <> -1) and (lcbLf35.EditValue <> null) then
    sPrintLeft := sPrintLeft+'Локализация: '+lcbLf35.EditText+'; ';
// БА
  if (lcbLf36.EditText <> '') and (lcbLf36.EditValue <> -1) and (lcbLf36.EditValue <> null) then
    sPrintLeft := sPrintLeft+'Стеноз: '+lcbLf36.EditText+'; ';
  if (lcbLf37.EditText <> '') and (lcbLf37.EditValue <> -1) and (lcbLf37.EditValue <> null) then
    sPrintLeft := sPrintLeft+'Локализация: '+lcbLf39.EditText+'; ';
  if beLf9.Text <> '' then
    sPrintLeft := sPrintLeft + 'До, более: '+beLf9.Text+'; ';
  if (lcbLf38.EditText <> '') and (lcbLf38.EditValue <> -1) and (lcbLf38.EditValue <> null) then
    sPrintLeft := sPrintLeft+'Восстановление кровотока: '+lcbLf38.EditText+'; ';
  if (lcbLf39.EditText <> '') and (lcbLf39.EditValue <> -1) and (lcbLf39.EditValue <> null) then
    sPrintLeft := sPrintLeft+'Локализация: '+lcbLf39.EditText+'; ';
  if sPrintLeft = '' then
    frxProtocol.FindObject('MasterData3').Visible := False
  else
    frxProtocol.FindObject('MasterData3').Visible := True;
end;

procedure TfrmACNK.DoPrintRight;
begin
// ПОПА
  if (lcbRgIz.EditText <> '') and (lcbRgIz.EditValue <> -1) and (lcbRgIz.EditValue <> null) then
    sPrintRight := 'Извитость: '+lcbRgIz.EditText+'; ';
  if (lcbRg1.EditText <> '') and (lcbRg1.EditValue <> -1) and (lcbRg1.EditValue <> null) then
    sPrintRight := sPrintRight+'Локализация: '+lcbRg1.EditText+'; ';
  if beRg1.Text <> '' then
    sPrintRight := sPrintRight + 'До, более: '+beRg1.Text+'; ';
  if (lcbRg2.EditText <> '') and (lcbRg2.EditValue <> -1) and (lcbRg2.EditValue <> null) then
    sPrintRight := sPrintRight+'Стеноз: '+lcbRg2.EditText+'; ';
  if (lcbRg3.EditText <> '') and (lcbRg3.EditValue <> -1) and (lcbRg3.EditValue <> null) then
    sPrintRight := sPrintRight+'Аневризма: '+lcbRg3.EditText+'; ';
  if (lcbRg4.EditText <> '') and (lcbRg4.EditValue <> -1) and (lcbRg4.EditValue <> null) then
    sPrintRight := sPrintRight+'Локализация: '+lcbRg4.EditText+'; ';
  if beRg2.Text <> '' then
    sPrintRight := sPrintRight + 'До, более: '+beRg2.Text+'; ';
  if (lcbRg5.EditText <> '') and (lcbRg5.EditValue <> -1) and (lcbRg5.EditValue <> null) then
    sPrintRight := sPrintRight+'Восстановление кровотока: '+lcbRg5.EditText+'; ';
  if (lcbRg6.EditText <> '') and (lcbRg6.EditValue <> -1) and (lcbRg6.EditValue <> null) then
    sPrintRight := sPrintRight+'Локализация: '+lcbRg6.EditText+'; ';
// НПА
  if (lcbRg7.EditText <> '') and (lcbRg7.EditValue <> -1) and (lcbRg7.EditValue <> null) then
    sPrintRight := sPrintRight+'Стеноз: '+lcbRg7.EditText+'; ';
  if (lcbRg8.EditText <> '') and (lcbRg8.EditValue <> -1) and (lcbRg8.EditValue <> null) then
    sPrintRight := sPrintRight+'Аневризма: '+lcbRg8.EditText+'; ';
  if (lcbRg9.EditText <> '') and (lcbRg9.EditValue <> -1) and (lcbRg9.EditValue <> null) then
    sPrintRight := sPrintRight+'Локализация: '+lcbRg9.EditText+'; ';
  if beRg3.Text <> '' then
    sPrintRight := sPrintRight + 'До, более: '+beRg3.Text+'; ';
  if (lcbRg10.EditText <> '') and (lcbRg10.EditValue <> -1) and (lcbRg10.EditValue <> null) then
    sPrintRight := sPrintRight+'Восстановление кровотока: '+lcbRg10.EditText+'; ';
  if (lcbRg11.EditText <> '') and (lcbRg11.EditValue <> -1) and (lcbRg11.EditValue <> null) then
    sPrintRight := sPrintRight+'Локализация: '+lcbRg11.EditText+'; ';
// ВПА
  if (lcbRg12.EditText <> '') and (lcbRg12.EditValue <> -1) and (lcbRg12.EditValue <> null) then
    sPrintRight := sPrintRight+'Стеноз: '+lcbRg12.EditText+'; ';
  if (lcbRg13.EditText <> '') and (lcbRg13.EditValue <> -1) and (lcbRg13.EditValue <> null) then
    sPrintRight := sPrintRight+'Аневризма: '+lcbRg13.EditText+'; ';
  if (lcbRg14.EditText <> '') and (lcbRg14.EditValue <> -1) and (lcbRg14.EditValue <> null) then
    sPrintRight := sPrintRight+'Локализация: '+lcbRg14.EditText+'; ';
  if beRg4.Text <> '' then
    sPrintRight := sPrintRight + 'До, более: '+beRg4.Text+'; ';
  if (lcbRg15.EditText <> '') and (lcbRg15.EditValue <> -1) and (lcbRg15.EditValue <> null) then
    sPrintRight := sPrintRight+'Восстановление кровотока: '+lcbRg15.EditText+'; ';
  if (lcbRg16.EditText <> '') and (lcbRg16.EditValue <> -1) and (lcbRg16.EditValue <> null) then
    sPrintRight := sPrintRight+'Локализация: '+lcbRg16.EditText+'; ';
// ПОБА
  if (lcbRg17.EditText <> '') and (lcbRg17.EditValue <> -1) and (lcbRg17.EditValue <> null) then
    sPrintRight := sPrintRight+'Стеноз: '+lcbRg17.EditText+'; ';
  if (lcbRg18.EditText <> '') and (lcbRg18.EditValue <> -1) and (lcbRg18.EditValue <> null) then
    sPrintRight := sPrintRight+'Аневризма: '+lcbRg18.EditText+'; ';
  if (lcbRg19.EditText <> '') and (lcbRg19.EditValue <> -1) and (lcbRg19.EditValue <> null) then
    sPrintRight := sPrintRight+'Локализация: '+lcbRg19.EditText+'; ';
  if beRg5.Text <> '' then
    sPrintRight := sPrintRight + 'До, более: '+beRg5.Text+'; ';
  if (lcbRg20.EditText <> '') and (lcbRg20.EditValue <> -1) and (lcbRg20.EditValue <> null) then
    sPrintRight := sPrintRight+'Восстановление кровотока: '+lcbRg20.EditText+'; ';
  if (lcbRg21.EditText <> '') and (lcbRg21.EditValue <> -1) and (lcbRg21.EditValue <> null) then
    sPrintRight := sPrintRight+'Локализация: '+lcbRg21.EditText+'; ';
// ПБА
  if (lcbRg22.EditText <> '') and (lcbRg22.EditValue <> -1) and (lcbRg22.EditValue <> null) then
    sPrintRight := sPrintRight+'Стеноз: '+lcbRg22.EditText+'; ';
  if (lcbRg23.EditText <> '') and (lcbRg23.EditValue <> -1) and (lcbRg23.EditValue <> null) then
    sPrintRight := sPrintRight+'Аневризма: '+lcbRg23.EditText+'; ';
  if (lcbRg24.EditText <> '') and (lcbRg24.EditValue <> -1) and (lcbRg24.EditValue <> null) then
    sPrintRight := sPrintRight+'Локализация: '+lcbRg24.EditText+'; ';
  if beRg6.Text <> '' then
    sPrintRight := sPrintRight + 'До, более: '+beRg6.Text+'; ';
  if (lcbRg25.EditText <> '') and (lcbRg25.EditValue <> -1) and (lcbRg25.EditValue <> null) then
    sPrintRight := sPrintRight+'Восстановление кровотока: '+lcbRg25.EditText+'; ';
  if (lcbRg26.EditText <> '') and (lcbRg26.EditValue <> -1) and (lcbRg26.EditValue <> null) then
    sPrintRight := sPrintRight+'Локализация: '+lcbRg26.EditText+'; ';
// ГБА
  if (lcbRg27.EditText <> '') and (lcbRg27.EditValue <> -1) and (lcbRg27.EditValue <> null) then
    sPrintRight := sPrintRight+'Стеноз: '+lcbRg27.EditText+'; ';
  if (lcbRg28.EditText <> '') and (lcbRg28.EditValue <> -1) and (lcbRg28.EditValue <> null) then
    sPrintRight := sPrintRight+'Аневризма: '+lcbRg28.EditText+'; ';
  if (lcbRg29.EditText <> '') and (lcbRg29.EditValue <> -1) and (lcbRg29.EditValue <> null) then
    sPrintRight := sPrintRight+'Локализация: '+lcbRg29.EditText+'; ';
  if beRg7.Text <> '' then
    sPrintRight := sPrintRight + 'До, более: '+beRg7.Text+'; ';
  if (lcbRg30.EditText <> '') and (lcbRg30.EditValue <> -1) and (lcbRg30.EditValue <> null) then
    sPrintRight := sPrintRight+'Восстановление кровотока: '+lcbRg30.EditText+'; ';
  if (lcbRg31.EditText <> '') and (lcbRg31.EditValue <> -1) and (lcbRg31.EditValue <> null) then
    sPrintRight := sPrintRight+'Локализация: '+lcbRg31.EditText+'; ';
// ПА
  if (lcbRg32.EditText <> '') and (lcbRg32.EditValue <> -1) and (lcbRg32.EditValue <> null) then
    sPrintRight := sPrintRight+'Стеноз: '+lcbRg32.EditText+'; ';
  if (lcbRg34.EditText <> '') and (lcbRg34.EditValue <> -1) and (lcbRg34.EditValue <> null) then
    sPrintRight := sPrintRight+'Локализация: '+lcbRg34.EditText+'; ';
  if beRg8.Text <> '' then
    sPrintRight := sPrintRight + 'До, более: '+beRg8.Text+'; ';
  if (lcbRg35.EditText <> '') and (lcbRg35.EditValue <> -1) and (lcbRg35.EditValue <> null) then
    sPrintRight := sPrintRight+'Восстановление кровотока: '+lcbRg35.EditText+'; ';
  if (lcbRg36.EditText <> '') and (lcbRg36.EditValue <> -1) and (lcbRg36.EditValue <> null) then
    sPrintRight := sPrintRight+'Локализация: '+lcbRg36.EditText+'; ';
// БА
  if (lcbRg37.EditText <> '') and (lcbRg37.EditValue <> -1) and (lcbRg37.EditValue <> null) then
    sPrintRight := sPrintRight+'Стеноз: '+lcbRg37.EditText+'; ';
  if (lcbRg39.EditText <> '') and (lcbRg39.EditValue <> -1) and (lcbRg39.EditValue <> null) then
    sPrintRight := sPrintRight+'Локализация: '+lcbRg39.EditText+'; ';
  if beRg9.Text <> '' then
    sPrintRight := sPrintRight + 'До, более: '+beRg9.Text+'; ';
  if (lcbRg40.EditText <> '') and (lcbRg40.EditValue <> -1) and (lcbRg40.EditValue <> null) then
    sPrintRight := sPrintRight+'Восстановление кровотока: '+lcbRg40.EditText+'; ';
  if (lcbRg41.EditText <> '') and (lcbRg41.EditValue <> -1) and (lcbRg41.EditValue <> null) then
    sPrintRight := sPrintRight+'Локализация: '+lcbRg41.EditText+'; ';
  if sPrintRight = '' then
    frxProtocol.FindObject('MasterData2').Visible := False
  else
    frxProtocol.FindObject('MasterData2').Visible := True;
end;

procedure TfrmACNK.DoSave;
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  oq.Session := frmMain.os;
  try
// Доступ
    if isAccess = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_ACCESS'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_ACCESS'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbAccess.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Контраст
    if isKontrast = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''RHMDL_KONTRAST'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''RHMDL_KONTRAST'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbKontrast.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Кол-во контраста
    if isKolvo = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''RHMDL_KOLVO_KONTRAST'')) '+#13+
                       ' when not matched then insert(fn_num, fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfn_num, :pfk_pacid, (select fk_id from asu.tsmid where fc_synonim = ''RHMDL_KOLVO_KONTRAST''), (select fk_owner from asu.tsmid where fc_synonim = ''RHMDL_KOLVO_KONTRAST''), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fn_num = :pfn_num, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '    where fk_pacid = :pfk_pacid and fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''RHMDL_KOLVO_KONTRAST'') ';
        oq.DeclareAndSet('pfn_num', otInteger, seKolvo.EditValue);
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Аорта
    if isAorta = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_AORTA'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_AORTA'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbAorta.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Рекомендации
    if isRecom = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RECOM'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RECOM'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbRecom.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Доза
    if (cxDoza.Value <> 0) and (cxDoza.Text <> '') then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '  using dual on (fk_pacid = :pfk_pacid and fk_smid = :pfk_smid and fk_smeditid = :pfk_smeditid) '+#13+
                       ' when matched then update set fn_num = :pfn_num, fk_vrachid = :pfk_vrachid '+#13+
                       '                    where fk_pacid = :pfk_pacid and fk_smid = :pfk_smid and fk_smeditid = :pfk_smeditid '+#13+
                       ' when not matched then insert(fk_pacid, fn_num, fk_smid, fk_smeditid, fk_vrachid) '+#13+
                       '                       values(:pfk_pacid, :pfn_num, :pfk_smid, :pfk_smeditid, :pfk_vrachid) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfn_num', otFloat, StrToFloat(cxDoza.Text));
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.DeclareAndSet('pfk_smid', otInteger, -1);
        oq.DeclareAndSet('pfk_smeditid', otInteger, -1);
        oq.Execute;
      end;
// Правая чистая
    if isRgClear = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_CLEAR'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_RIGHT_CLEAR'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbRgClear.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Левая чистая
    if isLfClear = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_CLEAR'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ACNK_LEFT_CLEAR'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLfClear.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;

    DoInsertRightPOPA;
    DoInsertRightNPA;
    DoInsertRightVPA;
    DoInsertRightPOBA;
    DoInsertRightPBA;
    DoInsertRightGBA;
    DoInsertRightPA;
    DoInsertRightBA;

    DoInsertLeftLOPA;
    DoInsertLeftNPA;
    DoInsertLeftVPA;
    DoInsertLeftLOBA;
    DoInsertLeftPBA;
    DoInsertLeftGBA;
    DoInsertLeftPA;
    DoInsertLeftBA;

    frmMain.os.Commit;
//-- общее
    isAccess := False;
    isKontrast := False;
    isKolvo := False;
    isAorta := False;
    isRecom := False;
    isDoza := False;
// ПОПА
    isRgPOPAIz := False;
    isRgPOPALocal := False;
    isRgPOPADo1 := False;
    isRgPOPASte := False;
    isRgPOPAAne := False;
    isRgPOPALocal2 := False;
    isRgPOPADo2 := False;
    isRgPOPAKrovo := False;
    isRgPOPALocal3 := False;
// НПА
    isRgNPASte := False;
    isRgNPAAne := False;
    isRgNPALocal1 := False;
    isRgNPADo1 := False;
    isRgNPAKrovo := False;
    isRgNPALocal2 := False;
// ВПА
    isRgVPASte := False;
    isRgVPAAne := False;
    isRgVPALocal1 := False;
    isRgVPADo1 := False;
    isRgVPAKrovo := False;
    isRgVPALocal2 := False;
// ПОБА
    isRgPOBASte := False;
    isRgPOBAAne := False;
    isRgPOBALocal1 := False;
    isRgPOBADo1 := False;
    isRgPOBAKrovo := False;
    isRgPOBALocal2 := False;
// ПБА
    isRgPBASte := False;
    isRgPBAAne := False;
    isRgPBALocal1 := False;
    isRgPBADo1 := False;
    isRgPBAKrovo := False;
    isRgPBALocal2 := False;
// ГБА
    isRgGBASte := False;
    isRgGBAAne := False;
    isRgGBALocal1 := False;
    isRgGBADo1 := False;
    isRgGBAKrovo := False;
    isRgGBALocal2 := False;
// ПА
    isRgPASte := False;
    isRgPALocal1 := False;
    isRgPADo1 := False;
    isRgPAKrovo := False;
    isRgPALocal2 := False;
// БА
    isRgBASte := False;
    isRgBALocal1 := False;
    isRgBADo1 := False;
    isRgBAKrovo := False;
    isRgBALocal2 := False;

    isRgClear := False;

// ЛОПА
    isLfLOPAIz := False;
    isLfLOPALocal1 := False;
    isLfLOPADo1 := False;
    isLfLOPASte := False;
    isLfLOPAAne := False;
    isLfLOPALocal2 := False;
    isLfLOPADo2 := False;
    isLfLOPAKrovo := False;
    isLfLOPALocal3 := False;
// НПА
    isLfNPASte := False;
    isLfNPAAne := False;
    isLfNPALocal1 := False;
    isLfNPADo1 := False;
    isLfNPAKrovo := False;
    isLfNPALocal2 := False;
// ВПА
    isLfVPASte := False;
    isLfVPAAne := False;
    isLfVPALocal1 := False;
    isLfVPADo1 := False;
    isLfVPAKrovo := False;
    isLfVPALocal2 := False;
// ПОБА
    isLfLOBASte := False;
    isLfLOBAAne := False;
    isLfLOBALocal1 := False;
    isLfLOBADo1 := False;
    isLfLOBAKrovo := False;
    isLfLOBALocal2 := False;
// ПБА
    isLfPBASte := False;
    isLfPBAAne := False;
    isLfPBALocal1 := False;
    isLfPBADo1 := False;
    isLfPBAKrovo := False;
    isLfPBALocal2 := False;
// ГБА
    isLfGBASte := False;
    isLfGBAAne := False;
    isLfGBALocal1 := False;
    isLfGBADo1 := False;
    isLfGBAKrovo := False;
    isLfGBALocal2 := False;
// ПА
    isLfPASte := False;
    isLfPALocal1 := False;
    isLfPADo1 := False;
    isLfPAKrovo := False;
    isLfPALocal2 := False;
// БА
    isLfBASte := False;
    isLfBALocal1 := False;
    isLfBADo1 := False;
    isLfBAKrovo := False;
    isLfBALocal2 := False;

    isLfClear := False;

    aSave.Enabled := False;
  finally
    oq.Free;
  end;
end;

procedure TfrmACNK.DoShowForm(nPacID, nNazID, nSmidID: Integer);
var ods : TOracleDataSet;
begin
  lbPac.Tag := nPacID;
  pNazID := nNazID;
  pSmidID := nSmidID;
  ods := TOracleDataSet.Create(nil);
  ods.Session := frmMain.os;
  Screen.Cursor := crSQLWait;
  try
//-->> информация о пациенте
// -- Номер МК
    ods.SQL.Text := ' select asu.get_ib(:pfk_pacid) as nummk from dual ';
    ods.DeclareAndSet('pfk_pacid', otInteger, nPacID);
    ods.Open;
    lbNumMK.Caption := ods.FieldByName('nummk').AsString;
// -- возраст
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select asu.pkg_regist_pacfunc.get_pac_age_now(:pfk_pacid) as age from dual ';
    ods.DeclareAndSet('pfk_pacid', otInteger, nPacID);
    ods.Open;
    lbAge.Caption := ods.FieldByName('age').AsString;
// -- Отделение
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select decode(asu.is_ambulance(:pfk_pacid), '+#13+
                    '               0, '+#13+
                    '               ASU.PKG_REGIST_PACFUNC.GET_PAC_FCOTDEL(:pfk_pacid), '+#13+
                    '               1, '+#13+
                    '               (select max(totdel.fc_name) from asu.totdel, asu.tambtalon, asu.tambtalon_naz '+#13+
                    '                 where totdel.fk_id = tambtalon.fk_otdelid '+#13+
                    '                   and tambtalon.fk_id = tambtalon_naz.fk_talonid '+#13+
                    '                   and tambtalon_naz.fk_nazid = :pfk_nazid)) as otdel '+#13+
                    '   from dual ';
    ods.DeclareAndSet('pfk_pacid', otInteger, nPacID);
    ods.DeclareAndSet('pfk_nazid', otInteger, nNazID);
    ods.Open;
    lbOtdel.Caption := ods.FieldByName('otdel').AsString;

//-- исследование
    DoLoadTibParams(nNazID);

//-- подписи
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select fd_run, sysdate, fk_ispolid, fk_nazsosid from asu.vnaz where fk_id = :pfk_id '; // !!! 2-ой запрос из VNAZ
    ods.DeclareAndSet('pfk_id', otInteger, nNazID);
    ods.Open;
    if ods.FieldByName('fk_nazsosid').AsInteger = frmMain.get_vipnaz then
      begin
        deDate.Date := ods.FieldByName('fd_run').AsDateTime;
        teTime.Time := ods.FieldByName('fd_run').AsDateTime;
        lcbVrach.EditValue := ods.FieldByName('fk_ispolid').AsInteger;
      end else
      begin
        deDate.Date := ods.FieldByName('sysdate').AsDateTime;
        teTime.Time := ods.FieldByName('sysdate').AsDateTime;
        lcbVrach.EditValue := frmMain.pSotrID;
      end;
  finally
    Screen.Cursor := crDefault;
    ods.Free;
  end;
end;

procedure TfrmACNK.FormCreate(Sender: TObject);
begin
  if odsAccess.Active = False then
    odsAccess.Active := True;
  if odsKontrast.Active = False then
    odsKontrast.Active := True;
  if odsAorta.Active = False then
    odsAorta.Active := True;
  if odsRecom.Active = False then
    odsRecom.Active := True;
  if odsRgClear.Active = False then
    odsRgClear.Active := True;
  if odsLfClear.Active = False then
    odsLfClear.Active := True;

// -- Подписи
  if odsSotr.Active = False then
    odsSotr.Active := True;
  if odsRVData.Active = False then
    odsRVData.Active := True;
end;

procedure TfrmACNK.frxProtocolGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'PACFIO' then Value := lbPac.Caption;
  if VarName = 'NUMMK' then Value := lbNumMK.Caption;
  if VarName = 'AGE' then Value := lbAge.Caption;
  if VarName = 'OTDEL' then Value := lbOtdel.Caption;
  if VarName = 'DATERUN' then Value := deDate.Text+' '+teTime.Text;
  if VarName = 'SOTR' then Value := lcbVrach.EditText;
  if VarName = 'DOZA' then Value := cxDoza.Text;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;
  if VarName = 'DATEPRINT' then Value := sDatePrint;
  if VarName = 'RGCLEAR' then Value := lcbRgClear.EditText;
  if VarName = 'LFCLEAR' then Value := lcbLfClear.EditText;

  if VarName = 'TEXT1' then Value := sText1;
  if VarName = 'RASHOD' then Value := sRashod;
  if VarName = 'RECOM' then Value := lcbRecom.EditText;
  if VarName = 'RIGHT' then Value := sPrintRight;
  if VarName = 'LEFT' then Value := sPrintLeft;
end;

procedure TfrmACNK.InsertText(S, ATag: string; RVSStyle: Integer);
var PTag : PChar;
begin
  PTag := StrNew(PChar(ATag));
  rve.CurTextStyleNo := RVSStyle;
  // Added by Spasskiy 18.11.2008 16:15:41 stringreplace
  rve.InsertStringTag(StringReplace(s, #13#10,' ', [rfReplaceAll]), Integer(PTag));
end;

procedure TfrmACNK.lcbAccessPropertiesChange(Sender: TObject);
begin
  isAccess := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbAortaPropertiesChange(Sender: TObject);
begin
  isAorta := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbKontrastPropertiesChange(Sender: TObject);
begin
  isKontrast := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbLf10PropertiesChange(Sender: TObject);
begin
  isLfNPAKrovo := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbLf11PropertiesChange(Sender: TObject);
begin
  isLfNPALocal2 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbLf12PropertiesChange(Sender: TObject);
begin
  isLfVPASte := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbLf13PropertiesChange(Sender: TObject);
begin
  isLfVPAAne := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbLf14PropertiesChange(Sender: TObject);
begin
  isLfVPALocal1 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbLf15PropertiesChange(Sender: TObject);
begin
  isLfVPAKrovo := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbLf16PropertiesChange(Sender: TObject);
begin
  isLfVPALocal2 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbLf17PropertiesChange(Sender: TObject);
begin
  isLfLOBASte := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbLf18PropertiesChange(Sender: TObject);
begin
  isLfLOBAAne := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbLf19PropertiesChange(Sender: TObject);
begin
  isLfLOBALocal1 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbLf1PropertiesChange(Sender: TObject);
begin
  isLfLOPALocal1 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbLf20PropertiesChange(Sender: TObject);
begin
  isLfLOBAKrovo := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbLf21PropertiesChange(Sender: TObject);
begin
  isLfLOBALocal2 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbLf22PropertiesChange(Sender: TObject);
begin
  isLfPBASte := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbLf23PropertiesChange(Sender: TObject);
begin
  isLfPBAAne := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbLf24PropertiesChange(Sender: TObject);
begin
  isLfPBALocal1 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbLf25PropertiesChange(Sender: TObject);
begin
  isLfPBAKrovo := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbLf26PropertiesChange(Sender: TObject);
begin
  isLfPBALocal2 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbLf27PropertiesChange(Sender: TObject);
begin
  isLfGBASte := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbLf28PropertiesChange(Sender: TObject);
begin
  isLfGBAAne := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbLf29PropertiesChange(Sender: TObject);
begin
  isLfGBALocal1 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbLf2PropertiesChange(Sender: TObject);
begin
  isLfLOPASte := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbLf30PropertiesChange(Sender: TObject);
begin
  isLfGBAKrovo := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbLf31PropertiesChange(Sender: TObject);
begin
  isLfGBALocal2 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbLf32PropertiesChange(Sender: TObject);
begin
  isLfPASte := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbLf33PropertiesChange(Sender: TObject);
begin
  isLfPALocal1 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbLf34PropertiesChange(Sender: TObject);
begin
  isLfPAKrovo := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbLf35PropertiesChange(Sender: TObject);
begin
  isLfPALocal2 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbLf36PropertiesChange(Sender: TObject);
begin
  isLfBASte := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbLf37PropertiesChange(Sender: TObject);
begin
  isLfBALocal1 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbLf38PropertiesChange(Sender: TObject);
begin
  isLfBAKrovo := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbLf39PropertiesChange(Sender: TObject);
begin
  isLfBALocal2 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbLf3PropertiesChange(Sender: TObject);
begin
  isLfLOPAAne := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbLf4PropertiesChange(Sender: TObject);
begin
  isLfLOPALocal2 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbLf5PropertiesChange(Sender: TObject);
begin
  isLfLOPAKrovo := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbLf6PropertiesChange(Sender: TObject);
begin
  isLfLOPALocal3 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbLf7PropertiesChange(Sender: TObject);
begin
  isLfNPASte := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbLf8PropertiesChange(Sender: TObject);
begin
  isLfNPAAne := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbLf9PropertiesChange(Sender: TObject);
begin
  isLfNPALocal1 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbLfClearPropertiesChange(Sender: TObject);
begin
  isLfClear := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbLfIzPropertiesChange(Sender: TObject);
begin
  isLfLOPAIz := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbRecomPropertiesChange(Sender: TObject);
begin
  isRecom := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbRg10PropertiesChange(Sender: TObject);
begin
  isRgNPAKrovo := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbRg11PropertiesChange(Sender: TObject);
begin
  isRgNPALocal2 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbRg12PropertiesChange(Sender: TObject);
begin
  isRgVPASte := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbRg13PropertiesChange(Sender: TObject);
begin
  isRgVPAAne := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbRg14PropertiesChange(Sender: TObject);
begin
  isRgVPALocal1 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbRg15PropertiesChange(Sender: TObject);
begin
  isRgVPAKrovo := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbRg16PropertiesChange(Sender: TObject);
begin
  isRgVPALocal2 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbRg17PropertiesChange(Sender: TObject);
begin
  isRgPOBASte := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbRg18PropertiesChange(Sender: TObject);
begin
  isRgPOBAAne := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbRg19PropertiesChange(Sender: TObject);
begin
  isRgPOBALocal1 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbRg1PropertiesChange(Sender: TObject);
begin
  isRgPOPALocal := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbRg20PropertiesChange(Sender: TObject);
begin
  isRgPOBAKrovo := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbRg21PropertiesChange(Sender: TObject);
begin
  isRgPOBALocal2 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbRg22PropertiesChange(Sender: TObject);
begin
  isRgPBASte := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbRg23PropertiesChange(Sender: TObject);
begin
  isRgPBAAne := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbRg24PropertiesChange(Sender: TObject);
begin
  isRgPBALocal1 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbRg25PropertiesChange(Sender: TObject);
begin
  isRgPBAKrovo := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbRg26PropertiesChange(Sender: TObject);
begin
  isRgPBALocal2 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbRg27PropertiesChange(Sender: TObject);
begin
  isRgGBASte := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbRg28PropertiesChange(Sender: TObject);
begin
  isRgGBAAne := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbRg29PropertiesChange(Sender: TObject);
begin
  isRgGBALocal1 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbRg2PropertiesChange(Sender: TObject);
begin
  isRgPOPASte := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbRg30PropertiesChange(Sender: TObject);
begin
  isRgGBAKrovo := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbRg31PropertiesChange(Sender: TObject);
begin
  isRgGBALocal2 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbRg32PropertiesChange(Sender: TObject);
begin
  isRgPASte := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbRg34PropertiesChange(Sender: TObject);
begin
  isRgPALocal1 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbRg35PropertiesChange(Sender: TObject);
begin
  isRgPAKrovo := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbRg36PropertiesChange(Sender: TObject);
begin
  isRgPALocal2 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbRg37PropertiesChange(Sender: TObject);
begin
  isRgBASte := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbRg39PropertiesChange(Sender: TObject);
begin
  isRgBALocal1 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbRg3PropertiesChange(Sender: TObject);
begin
  isRgPOPAAne := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbRg40PropertiesChange(Sender: TObject);
begin
  isRgBAKrovo := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbRg41PropertiesChange(Sender: TObject);
begin
  isRgBALocal2 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbRg4PropertiesChange(Sender: TObject);
begin
  isRgPOPALocal2 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbRg5PropertiesChange(Sender: TObject);
begin
  isRgPOPAKrovo := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbRg6PropertiesChange(Sender: TObject);
begin
  isRgPOPALocal3 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbRg7PropertiesChange(Sender: TObject);
begin
  isRgNPASte := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbRg8PropertiesChange(Sender: TObject);
begin
  isRgNPAAne := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbRg9PropertiesChange(Sender: TObject);
begin
  isRgNPALocal1 := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbRgClearPropertiesChange(Sender: TObject);
begin
  isRgClear := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.lcbRgIzPropertiesChange(Sender: TObject);
begin
  isRgPOPAIz := True;
  aSave.Enabled := True;
end;

procedure TfrmACNK.seKolvoPropertiesChange(Sender: TObject);
begin
  isKolvo := True;
  aSave.Enabled := True;
end;

end.
