unit fKag; //

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxLabel,
  cxControls, cxContainer, cxEdit, cxGroupBox, cxGraphics, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  ExtCtrls, cxStyles, cxVGrid, cxInplaceContainer, cxCheckBox, cxCalendar,
  dxSkinsdxBarPainter, dxBar, cxClasses, ActnList, DB, OracleData, frxClass,
  cxSpinEdit, Oracle, cxButtonEdit, RVScroll, RichView, RVEdit, RVStyle,
  cxCurrencyEdit, cxTimeEdit, DateUtils;

type
  TfrmKag = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    lbPac: TcxLabel;
    cxLabel3: TcxLabel;
    lbAge: TcxLabel;
    cxLabel2: TcxLabel;
    lbOtdel: TcxLabel;
    Panel1: TPanel;
    cxLabel8: TcxLabel;
    lcbBloodType: TcxLookupComboBox;
    cxLabel9: TcxLabel;
    lcbStvol: TcxLookupComboBox;
    cxLabel10: TcxLabel;
    Panel2: TPanel;
    cxLabel11: TcxLabel;
    lcbPMJV: TcxLookupComboBox;
    cxLabel12: TcxLabel;
    lcbLocalPMJV: TcxLookupComboBox;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    lcbPMJV2: TcxLookupComboBox;
    cxLabel15: TcxLabel;
    lcbLocalPMJV2: TcxLookupComboBox;
    cxLabel16: TcxLabel;
    Panel3: TPanel;
    cxLabel17: TcxLabel;
    lcbOV: TcxLookupComboBox;
    cxLabel18: TcxLabel;
    lcbLocalOV: TcxLookupComboBox;
    cxLabel19: TcxLabel;
    cxLabel20: TcxLabel;
    lcbOV2: TcxLookupComboBox;
    cxLabel21: TcxLabel;
    lcbLocalOV2: TcxLookupComboBox;
    cxLabel22: TcxLabel;
    Panel4: TPanel;
    cxLabel23: TcxLabel;
    lcbVTK: TcxLookupComboBox;
    cxLabel24: TcxLabel;
    lcbLocalVTK: TcxLookupComboBox;
    cxLabel25: TcxLabel;
    Panel5: TPanel;
    cxLabel26: TcxLabel;
    cxLabel27: TcxLabel;
    lcbLocalDV: TcxLookupComboBox;
    cxLabel28: TcxLabel;
    cxLabel29: TcxLabel;
    lcbDV2: TcxLookupComboBox;
    cxLabel30: TcxLabel;
    lcbLocalDV2: TcxLookupComboBox;
    cxLabel31: TcxLabel;
    Panel6: TPanel;
    cxLabel32: TcxLabel;
    lcbPKA: TcxLookupComboBox;
    cxLabel33: TcxLabel;
    lcbLocalPKA: TcxLookupComboBox;
    cxLabel34: TcxLabel;
    cxLabel35: TcxLabel;
    lcbPKA2: TcxLookupComboBox;
    cxLabel36: TcxLabel;
    lcbLocalPKA2: TcxLookupComboBox;
    cxLabel37: TcxLabel;
    Panel7: TPanel;
    lcbKolla: TcxLookupComboBox;
    cxLabel39: TcxLabel;
    lcbZakl: TcxLookupComboBox;
    cxLabel40: TcxLabel;
    lcbRecom: TcxLookupComboBox;
    cxLabel38: TcxLabel;
    lbNumMK: TcxLabel;
    cxLabel41: TcxLabel;
    Panel8: TPanel;
    lcbKat1: TcxLookupComboBox;
    cxLabel42: TcxLabel;
    lcbKat2: TcxLookupComboBox;
    cxLabel43: TcxLabel;
    lcbKat3: TcxLookupComboBox;
    cxLabel44: TcxLabel;
    cxLabel46: TcxLabel;
    cxLabel47: TcxLabel;
    cbEmerald: TcxCheckBox;
    cxLabel45: TcxLabel;
    cxLabel48: TcxLabel;
    Shape1: TShape;
    cxLabel49: TcxLabel;
    Shape2: TShape;
    cxLabel50: TcxLabel;
    lcbDV: TcxLookupComboBox;
    lcbKontrast: TcxLookupComboBox;
    deDate: TcxDateEdit;
    lcbVrach: TcxLookupComboBox;
    Panel9: TPanel;
    BM: TdxBarManager;
    BMBar1: TdxBar;
    dxBarDockControl1: TdxBarDockControl;
    bbPrint: TdxBarButton;
    bbCancel: TdxBarButton;
    bbSave: TdxBarButton;
    bbPodpis: TdxBarButton;
    al: TActionList;
    aSave: TAction;
    aPodpis: TAction;
    aCancel: TAction;
    aPrint: TAction;
    dsBloodType: TDataSource;
    odsBloodType: TOracleDataSet;
    dsStvol: TDataSource;
    odsStvol: TOracleDataSet;
    dsPMJVStenoz: TDataSource;
    odsPMJVStenoz: TOracleDataSet;
    dsPMJVLocal: TDataSource;
    odsPMJVLocal: TOracleDataSet;
    frxProtocol: TfrxReport;
    ds9: TDataSource;
    ods9: TOracleDataSet;
    ds10: TDataSource;
    ods10: TOracleDataSet;
    dsSotr: TDataSource;
    odsSotr: TOracleDataSet;
    dsKat: TDataSource;
    odsKat: TOracleDataSet;
    dsKontrast: TDataSource;
    odsKontrast: TOracleDataSet;
    seKolvo: TcxSpinEdit;
    dsKollaterali: TDataSource;
    odsKollaterali: TOracleDataSet;
    dsZakl: TDataSource;
    odsZakl: TOracleDataSet;
    dsRecom: TDataSource;
    odsRecom: TOracleDataSet;
    cxLabel4: TcxLabel;
    be1: TcxButtonEdit;
    be2: TcxButtonEdit;
    be3: TcxButtonEdit;
    be4: TcxButtonEdit;
    be5: TcxButtonEdit;
    be6: TcxButtonEdit;
    be7: TcxButtonEdit;
    be8: TcxButtonEdit;
    be9: TcxButtonEdit;
    be10: TcxButtonEdit;
    ds11: TDataSource;
    ods11: TOracleDataSet;
    ds12: TDataSource;
    ods12: TOracleDataSet;
    ds13: TDataSource;
    ods13: TOracleDataSet;
    ds14: TDataSource;
    ods14: TOracleDataSet;
    ds15: TDataSource;
    ods15: TOracleDataSet;
    ds16: TDataSource;
    ods16: TOracleDataSet;
    ds17: TDataSource;
    ods17: TOracleDataSet;
    ds18: TDataSource;
    ods18: TOracleDataSet;
    ds19: TDataSource;
    ods19: TOracleDataSet;
    ds20: TDataSource;
    ods20: TOracleDataSet;
    ds21: TDataSource;
    ods21: TOracleDataSet;
    ds22: TDataSource;
    ods22: TOracleDataSet;
    ds23: TDataSource;
    ods23: TOracleDataSet;
    ds24: TDataSource;
    ods24: TOracleDataSet;
    rvs: TRVStyle;
    rve: TRichViewEdit;
    odsRVData: TOracleDataSet;
    odsRVDataFK_ID: TFloatField;
    odsRVDataFK_PACID: TFloatField;
    odsRVDataFB_BLOB: TBlobField;
    odsRVDataFN_COMPRESS: TFloatField;
    odsRVDataFB_HTML: TBlobField;
    odsRVDataFB_TEXT: TMemoField;
    lbDoza: TcxLabel;
    cxDoza: TcxCurrencyEdit;
    lbMZV: TcxLabel;
    cxLabel5: TcxLabel;
    teTime: TcxTimeEdit;
    lbVyp: TcxLabel;
    procedure aCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure frxProtocolGetValue(const VarName: string; var Value: Variant);
    procedure aSaveExecute(Sender: TObject);
    procedure lcbBloodTypePropertiesChange(Sender: TObject);
    procedure lcbStvolPropertiesChange(Sender: TObject);
    procedure lcbPMJVPropertiesChange(Sender: TObject);
    procedure lcbLocalPMJVPropertiesChange(Sender: TObject);
    procedure lcbPMJV2PropertiesChange(Sender: TObject);
    procedure lcbLocalPMJV2PropertiesChange(Sender: TObject);
    procedure lcbKollaPropertiesChange(Sender: TObject);
    procedure lcbZaklPropertiesChange(Sender: TObject);
    procedure lcbRecomPropertiesChange(Sender: TObject);
    procedure lcbKat1PropertiesChange(Sender: TObject);
    procedure lcbKat2PropertiesChange(Sender: TObject);
    procedure lcbKat3PropertiesChange(Sender: TObject);
    procedure lcbKontrastPropertiesChange(Sender: TObject);
    procedure seKolvoPropertiesChange(Sender: TObject);
    procedure aPodpisExecute(Sender: TObject);
    procedure cbEmeraldPropertiesChange(Sender: TObject);
    procedure be1PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure be1PropertiesChange(Sender: TObject);
    procedure be2PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure be2PropertiesChange(Sender: TObject);
    procedure be3PropertiesChange(Sender: TObject);
    procedure be3PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure be4PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure be5PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure be4PropertiesChange(Sender: TObject);
    procedure be5PropertiesChange(Sender: TObject);
    procedure lcbOVPropertiesChange(Sender: TObject);
    procedure lcbLocalOVPropertiesChange(Sender: TObject);
    procedure lcbOV2PropertiesChange(Sender: TObject);
    procedure lcbLocalOV2PropertiesChange(Sender: TObject);
    procedure lcbVTKPropertiesChange(Sender: TObject);
    procedure lcbLocalVTKPropertiesChange(Sender: TObject);
    procedure be6PropertiesChange(Sender: TObject);
    procedure be6PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure be7PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure be8PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure be7PropertiesChange(Sender: TObject);
    procedure be8PropertiesChange(Sender: TObject);
    procedure lcbDVPropertiesChange(Sender: TObject);
    procedure lcbLocalDVPropertiesChange(Sender: TObject);
    procedure lcbDV2PropertiesChange(Sender: TObject);
    procedure lcbLocalDV2PropertiesChange(Sender: TObject);
    procedure be9PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure be10PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure be9PropertiesChange(Sender: TObject);
    procedure be10PropertiesChange(Sender: TObject);
    procedure lcbPKAPropertiesChange(Sender: TObject);
    procedure lcbLocalPKAPropertiesChange(Sender: TObject);
    procedure lcbPKA2PropertiesChange(Sender: TObject);
    procedure lcbLocalPKA2PropertiesChange(Sender: TObject);
    procedure cxDozaPropertiesChange(Sender: TObject);
  private
    isBlood, isStvol, isPerStvol : Boolean;
    isPMJV, isLocalPMJV, isPerPMJV, isPMJV2, isLocalPMJV2, isPerPMJV2 : Boolean;
    isOB, isLocalOB, isPerOB, isOB2, isLocalOB2, isPerOB2 : Boolean;
    isVTK, isLocalVTK, isPerVTK : Boolean;
    isDV, isLocalDV, isPerDV, isDV2, isLocalDV2, isPerDV2 : Boolean;
    isPKA, isLocalPKA, isPerPKA, isPKA2, isLocalPKA2, isPerPKA2 : Boolean;

    isKolla, isZakl, isRecom : Boolean;
    isKat1, isKat2, isKat3, isEmer, isKontrast, isKolvo : Boolean;
    isDoza : Boolean;
    sText1, sPMJV, sOB, sVTK, sDV, sPKA, sRashod, sDatePrint : string;
    pNazID, pSmidID : Integer;
    procedure DoLoadTibParams(nNazID : Integer);
    procedure DoSave;
    procedure DoPodpis;
    procedure InsertText(S: string; ATag: string; RVSStyle: Integer); overload;
    { Private declarations }
  public
    procedure DoShowForm(nPacID, nNazID, nSmidID : Integer);
    procedure DoDisable(nId : Integer);
    { Public declarations }
  end;

var
  frmKag: TfrmKag;

implementation
uses fMain, fSetPer;
{$R *.dfm}

procedure TfrmKag.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmKag.aPodpisExecute(Sender: TObject);
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

procedure TfrmKag.aPrintExecute(Sender: TObject);
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
  sPMJV := '';
  sOB := '';
  sVTK := '';
  sDV := '';
  sPKA := '';
  sRashod := '';
// Первое
  if (lcbBloodType.EditValue <> 0) and (lcbBloodType.EditValue <> -1) and (lcbBloodType.EditValue <> null) then
    sText1 := 'Тип кровообращения: '+lcbBloodType.EditText+'; ';
  if (lcbStvol.EditValue <> 0) and (lcbStvol.EditValue <> -1) and (lcbStvol.EditValue <> null) then
    sText1 := sText1 + 'Ствол: '+lcbStvol.EditText+'; ';
  if be1.Text <> '' then
    sText1 := sText1 + '% стеноза ствола: '+be1.Text+'.';
  if sText1 = '' then
    frxProtocol.FindObject('MasterData1').Visible := False
  else
    frxProtocol.FindObject('MasterData1').Visible := True;

// ПМЖВ
  if (lcbPMJV.EditValue <> 0) and (lcbPMJV.EditValue <> -1) and (lcbPMJV.EditValue <> null) then
    sPMJV := 'Стеноз ПМЖВ: '+lcbPMJV.EditText+'; ';
  if (lcbLocalPMJV.EditValue <> 0) and (lcbLocalPMJV.EditValue <> -1) and (lcbLocalPMJV.EditValue <> null) then
    sPMJV := sPMJV + 'Локализация в ПМЖВ: '+lcbLocalPMJV.EditText+'; ';
  if be2.Text <> '' then
    sPMJV := sPMJV + '% стеноза ПМЖВ: '+be2.Text+'; ';
  if (lcbPMJV2.EditValue <> 0) and (lcbPMJV2.EditValue <> -1) and (lcbPMJV2.EditValue <> null) then
    sPMJV := sPMJV + 'Стеноз ПМЖВ2: '+lcbPMJV2.EditText+'; ';
  if (lcbLocalPMJV2.EditValue <> 0) and (lcbLocalPMJV2.EditValue <> -1) and (lcbLocalPMJV2.EditValue <> null) then
    sPMJV := sPMJV + 'Локализация в ПМЖВ2: '+lcbLocalPMJV2.EditText+'; ';
  if be3.Text <> '' then
    sPMJV := sPMJV + '% стеноза ПМЖВ2: '+be3.Text+'.';
  if sPMJV = '' then
    frxProtocol.FindObject('MasterData2').Visible := False
  else
    frxProtocol.FindObject('MasterData2').Visible := True;

// ОВ
  if (lcbOV.EditValue <> 0) and (lcbOV.EditValue <> -1) and (lcbOV.EditValue <> null) then
    sOB := 'Стеноз ОВ: '+lcbOV.EditText+'; ';
  if (lcbLocalOV.EditValue <> 0) and (lcbLocalOV.EditValue <> -1) and (lcbLocalOV.EditValue <> null) then
    sOB := sOB + 'Локализация в ОВ: '+lcbLocalOV.EditText+'; ';
  if be4.Text <> '' then
    sOB := sOB + '% стеноза ОВ: '+be4.Text+'; ';
  if (lcbOV2.EditValue <> 0) and (lcbOV2.EditValue <> -1) and (lcbOV2.EditValue <> null) then
    sOB := sOB + 'Стеноз ОВ2: '+lcbOV2.EditText+'; ';
  if (lcbLocalOV2.EditValue <> 0) and (lcbLocalOV2.EditValue <> -1) and (lcbLocalOV2.EditValue <> null) then
    sOB := sOB + 'Локализация в ОВ2: '+lcbLocalOV2.EditText+'; ';
  if be5.Text <> '' then
    sOB := sOB + '% стеноза ОВ2: '+be5.Text+'.';
  if sOB = '' then
    frxProtocol.FindObject('MasterData3').Visible := False
  else
    frxProtocol.FindObject('MasterData3').Visible := True;

// ВТК
  if (lcbVTK.EditValue <> 0) and (lcbVTK.EditValue <> -1) and (lcbVTK.EditValue <> null) then
    sVTK := 'Стеноз ВТК: '+lcbVTK.EditText+'; ';
  if (lcbLocalVTK.EditValue <> 0) and (lcbLocalVTK.EditValue <> -1) and (lcbLocalVTK.EditValue <> null) then
    sVTK := sVTK + 'Локализация в ВТК: '+lcbLocalVTK.EditText+'; ';
  if be6.Text <> '' then
    sVTK := sVTK + '% стеноза ВТК: '+be6.Text+'. ';
  if sVTK = '' then
    frxProtocol.FindObject('MasterData4').Visible := False
  else
    frxProtocol.FindObject('MasterData4').Visible := True;

// ДВ
  if (lcbDV.EditValue <> 0) and (lcbDV.EditValue <> -1) and (lcbDV.EditValue <> null) then
    sDV := 'Стеноз ДВ: '+lcbDV.EditText+'; ';
  if (lcbLocalDV.EditValue <> 0) and (lcbLocalDV.EditValue <> -1) and (lcbLocalDV.EditValue <> null) then
    sDV := sDV + 'Локализация в ДВ: '+lcbLocalDV.EditText+'; ';
  if be7.Text <> '' then
    sDV := sDV + '% стеноза ДВ: '+be7.Text+'; ';
  if (lcbDV2.EditValue <> 0) and (lcbDV2.EditValue <> -1) and (lcbDV2.EditValue <> null) then
    sDV := sDV + 'Стеноз ДВ2: '+lcbDV2.EditText+'; ';
  if (lcbLocalDV2.EditValue <> 0) and (lcbLocalDV2.EditValue <> -1) and (lcbLocalDV2.EditValue <> null) then
    sDV := sDV + 'Локализация в ДВ2: '+lcbLocalDV2.EditText+'; ';
  if be8.Text <> '' then
    sDV := sDV + '% стеноза ДВ2: '+be8.Text+'. ';
  if sDV = '' then
    frxProtocol.FindObject('MasterData5').Visible := False
  else
    frxProtocol.FindObject('MasterData5').Visible := True;

// ПКА
  if (lcbPKA.EditValue <> 0) and (lcbPKA.EditValue <> -1) and (lcbPKA.EditValue <> null) then
    sPKA := 'Стеноз ПКА: '+lcbPKA.EditText+'; ';
  if (lcbLocalPKA.EditValue <> 0) and (lcbLocalPKA.EditValue <> -1) and (lcbLocalPKA.EditValue <> null) then
    sPKA := sPKA + 'Локализация в ПКА: '+lcbLocalPKA.EditText+'; ';
  if be9.Text <> '' then
    sPKA := sPKA + '% стеноза ПКА: '+be9.Text+'; ';
  if (lcbPKA2.EditValue <> 0) and (lcbPKA2.EditValue <> -1) and (lcbPKA2.EditValue <> null) then
    sPKA := sPKA + 'Стеноз ПКА2: '+lcbPKA2.EditText+'; ';
  if (lcbLocalPKA2.EditValue <> 0) and (lcbLocalPKA2.EditValue <> -1) and (lcbLocalPKA2.EditValue <> null) then
    sPKA := sPKA + 'Локализация в ПКА2: '+lcbLocalPKA2.EditText+'; ';
  if be10.Text <> '' then
    sPKA := sPKA + '% стеноза ПКА2: '+be10.Text+'. ';
  if sPKA = '' then
    frxProtocol.FindObject('MasterData6').Visible := False
  else
    frxProtocol.FindObject('MasterData6').Visible := True;

// Заключения
  if (lcbKolla.EditValue = 0) or (lcbKolla.EditValue = -1) or (lcbKolla.EditValue = null) then
    frxProtocol.FindObject('MasterData7').Visible := False
  else
    frxProtocol.FindObject('MasterData7').Visible := True;
  if (lcbZakl.EditValue = 0) or (lcbZakl.EditValue = -1) or (lcbZakl.EditValue = null) then
    frxProtocol.FindObject('MasterData8').Visible := False
  else
    frxProtocol.FindObject('MasterData8').Visible := True;
  if (lcbRecom.EditValue = 0) or (lcbRecom.EditValue = -1) or (lcbRecom.EditValue = null) then
    frxProtocol.FindObject('MasterData9').Visible := False
  else
    frxProtocol.FindObject('MasterData9').Visible := True;

// Расходные материалы
  if (lcbKat1.EditText <> '') and (lcbKat1.EditValue <> -1) and (lcbKat1.EditValue <> null) then
    sRashod := 'Катетер 1: '+lcbKat1.EditText+'; ';
  if (lcbKat2.EditText <> '') and (lcbKat2.EditValue <> -1) and (lcbKat2.EditValue <> null) then
    sRashod := sRashod + 'Катетер 2: '+lcbKat2.EditText+'; ';
  if (lcbKat3.EditText <> '') and (lcbKat3.EditValue <> -1) and (lcbKat3.EditValue <> null) then
    sRashod := sRashod + 'Катетер 3: '+lcbKat3.EditText+'; ';
  if cbEmerald.Checked then
    sRashod := sRashod + 'Проводник Emerald; ';
  if (lcbKontrast.EditText <> '') and (lcbKontrast.EditValue <> -1) and (lcbKontrast.EditValue <> null) then
    sRashod := sRashod + 'Контраст: '+lcbKontrast.EditText+'; ';
  if (seKolvo.Value <> 0) and (seKolvo.Text <> '') then
    sRashod := sRashod + 'Кол-во: '+seKolvo.Text+'.';
  if sRashod = '' then
    frxProtocol.FindObject('MasterData10').Visible := False
  else
    frxProtocol.FindObject('MasterData10').Visible := True;

// Доза
  if (cxDoza.Value <> 0) and (cxDoza.Text <> '') then
    frxProtocol.FindObject('MasterData11').Visible := True
  else
    frxProtocol.FindObject('MasterData11').Visible := False;

  frxProtocol.ShowReport;
end;

procedure TfrmKag.aSaveExecute(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  try
    seKolvo.PostEditValue;
    DoSave;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmKag.be10PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var oq : TOracleQuery;
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetPer, frmSetPer);
      try
        frmSetPer.Caption := '% стеноза ПКА2';
        frmSetPer.DoShowForm('KAG_PKA2_PERCENT_STENOZ');
        frmSetPer.ShowModal;
        if frmSetPer.ModalResult = mrOk then
          begin
            be10.Text := frmSetPer.odsList.FieldByName('ownname').AsString+' '+frmSetPer.odsList.FieldByName('fc_name').AsString;
            be10.Tag := frmSetPer.odsList.FieldByName('fk_id').AsInteger;
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
                       '                    start with fc_synonim = ''KAG_PKA2_PERCENT_STENOZ'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        frmMain.os.Commit;
        be10.Properties.OnChange := nil;
        be10.Text := '';
        be10.Tag := -1;
        be10.Properties.OnChange := be10PropertiesChange;
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmKag.be10PropertiesChange(Sender: TObject);
begin
  isPerPKA2 := True;
  aSave.Enabled := True;
end;

procedure TfrmKag.be1PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var oq : TOracleQuery;
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetPer, frmSetPer);
      try
        frmSetPer.Caption := '% стеноза ствола';
        frmSetPer.DoShowForm('KAG_PERCENT_STSTVOL');
        frmSetPer.ShowModal;
        if frmSetPer.ModalResult = mrOk then
          begin
            be1.Text := frmSetPer.odsList.FieldByName('ownname').AsString+' '+frmSetPer.odsList.FieldByName('fc_name').AsString;
            be1.Tag := frmSetPer.odsList.FieldByName('fk_id').AsInteger;
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
                       '                    start with fc_synonim = ''KAG_PERCENT_STSTVOL'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        frmMain.os.Commit;
        be1.Properties.OnChange := nil;
        be1.Text := '';
        be1.Tag := -1;
        be1.Properties.OnChange := be1PropertiesChange;
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmKag.be1PropertiesChange(Sender: TObject);
begin
  isPerStvol := True;
  aSave.Enabled := True;  
end;

procedure TfrmKag.be2PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var oq : TOracleQuery;
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetPer, frmSetPer);
      try
        frmSetPer.Caption := '% стеноза ПМЖВ';
        frmSetPer.DoShowForm('KAG_PMJV_PERCENT_STENOZ');
        frmSetPer.ShowModal;
        if frmSetPer.ModalResult = mrOk then
          begin
            be2.Text := frmSetPer.odsList.FieldByName('ownname').AsString+' '+frmSetPer.odsList.FieldByName('fc_name').AsString;
            be2.Tag := frmSetPer.odsList.FieldByName('fk_id').AsInteger;
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
                       '                    start with fc_synonim = ''KAG_PMJV_PERCENT_STENOZ'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        frmMain.os.Commit;
        be2.Properties.OnChange := nil;
        be2.Text := '';
        be2.Tag := -1;
        be2.Properties.OnChange := be2PropertiesChange;
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmKag.be2PropertiesChange(Sender: TObject);
begin
  isPerPMJV := True;
  aSave.Enabled := True;
end;

procedure TfrmKag.be3PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var oq : TOracleQuery;
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetPer, frmSetPer);
      try
        frmSetPer.Caption := '% стеноза ПМЖВ2';
        frmSetPer.DoShowForm('KAG_PMJV2_PERCENT_STENOZ');
        frmSetPer.ShowModal;
        if frmSetPer.ModalResult = mrOk then
          begin
            be3.Text := frmSetPer.odsList.FieldByName('ownname').AsString+' '+frmSetPer.odsList.FieldByName('fc_name').AsString;
            be3.Tag := frmSetPer.odsList.FieldByName('fk_id').AsInteger;
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
                       '                    start with fc_synonim = ''KAG_PMJV2_PERCENT_STENOZ'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        frmMain.os.Commit;
        be3.Properties.OnChange := nil;
        be3.Text := '';
        be3.Tag := -1;
        be3.Properties.OnChange := be3PropertiesChange;
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmKag.be3PropertiesChange(Sender: TObject);
begin
  isPerPMJV2 := True;
  aSave.Enabled := True;
end;

procedure TfrmKag.be4PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var oq : TOracleQuery;
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetPer, frmSetPer);
      try
        frmSetPer.Caption := '% стеноза ОВ';
        frmSetPer.DoShowForm('KAG_OB_PERCENT_STENOZ');
        frmSetPer.ShowModal;
        if frmSetPer.ModalResult = mrOk then
          begin
            be4.Text := frmSetPer.odsList.FieldByName('ownname').AsString+' '+frmSetPer.odsList.FieldByName('fc_name').AsString;
            be4.Tag := frmSetPer.odsList.FieldByName('fk_id').AsInteger;
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
                       '                    start with fc_synonim = ''KAG_OB_PERCENT_STENOZ'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        frmMain.os.Commit;
        be4.Properties.OnChange := nil;
        be4.Text := '';
        be4.Tag := -1;
        be4.Properties.OnChange := be4PropertiesChange;
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmKag.be4PropertiesChange(Sender: TObject);
begin
  isPerOB := True;
  aSave.Enabled := True;
end;

procedure TfrmKag.be5PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var oq : TOracleQuery;
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetPer, frmSetPer);
      try
        frmSetPer.Caption := '% стеноза ОВ2';
        frmSetPer.DoShowForm('KAG_OB2_PERCENT_STENOZ');
        frmSetPer.ShowModal;
        if frmSetPer.ModalResult = mrOk then
          begin
            be5.Text := frmSetPer.odsList.FieldByName('ownname').AsString+' '+frmSetPer.odsList.FieldByName('fc_name').AsString;
            be5.Tag := frmSetPer.odsList.FieldByName('fk_id').AsInteger;
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
                       '                    start with fc_synonim = ''KAG_OB2_PERCENT_STENOZ'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        frmMain.os.Commit;
        be5.Properties.OnChange := nil;
        be5.Text := '';
        be5.Tag := -1;
        be5.Properties.OnChange := be5PropertiesChange;
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmKag.be5PropertiesChange(Sender: TObject);
begin
  isPerOB2 := True;
  aSave.Enabled := True;
end;

procedure TfrmKag.be6PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var oq : TOracleQuery;
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetPer, frmSetPer);
      try
        frmSetPer.Caption := '% стеноза ВТК';
        frmSetPer.DoShowForm('KAG_VTK_PERCENT_STENOZ');
        frmSetPer.ShowModal;
        if frmSetPer.ModalResult = mrOk then
          begin
            be6.Text := frmSetPer.odsList.FieldByName('ownname').AsString+' '+frmSetPer.odsList.FieldByName('fc_name').AsString;
            be6.Tag := frmSetPer.odsList.FieldByName('fk_id').AsInteger;
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
                       '                    start with fc_synonim = ''KAG_VTK_PERCENT_STENOZ'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        frmMain.os.Commit;
        be6.Properties.OnChange := nil;
        be6.Text := '';
        be6.Tag := -1;
        be6.Properties.OnChange := be6PropertiesChange;
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmKag.be6PropertiesChange(Sender: TObject);
begin
  isPerVTK := True;
  aSave.Enabled := True;
end;

procedure TfrmKag.be7PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var oq : TOracleQuery;
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetPer, frmSetPer);
      try
        frmSetPer.Caption := '% стеноза ДВ';
        frmSetPer.DoShowForm('KAG_DV_PERCENT_STENOZ');
        frmSetPer.ShowModal;
        if frmSetPer.ModalResult = mrOk then
          begin
            be7.Text := frmSetPer.odsList.FieldByName('ownname').AsString+' '+frmSetPer.odsList.FieldByName('fc_name').AsString;
            be7.Tag := frmSetPer.odsList.FieldByName('fk_id').AsInteger;
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
                       '                    start with fc_synonim = ''KAG_DV_PERCENT_STENOZ'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        frmMain.os.Commit;
        be7.Properties.OnChange := nil;
        be7.Text := '';
        be7.Tag := -1;
        be7.Properties.OnChange := be7PropertiesChange;
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmKag.be7PropertiesChange(Sender: TObject);
begin
  isPerDV := True;
  aSave.Enabled := True;
end;

procedure TfrmKag.be8PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var oq : TOracleQuery;
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetPer, frmSetPer);
      try
        frmSetPer.Caption := '% стеноза ДВ';
        frmSetPer.DoShowForm('KAG_DV2_PERCENT_STENOZ');
        frmSetPer.ShowModal;
        if frmSetPer.ModalResult = mrOk then
          begin
            be8.Text := frmSetPer.odsList.FieldByName('ownname').AsString+' '+frmSetPer.odsList.FieldByName('fc_name').AsString;
            be8.Tag := frmSetPer.odsList.FieldByName('fk_id').AsInteger;
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
                       '                    start with fc_synonim = ''KAG_DV2_PERCENT_STENOZ'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        frmMain.os.Commit;
        be8.Properties.OnChange := nil;
        be8.Text := '';
        be8.Tag := -1;
        be8.Properties.OnChange := be8PropertiesChange;
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmKag.be8PropertiesChange(Sender: TObject);
begin
  isPerDV2 := True;
  aSave.Enabled := True;
end;

procedure TfrmKag.be9PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var oq : TOracleQuery;
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetPer, frmSetPer);
      try
        frmSetPer.Caption := '% стеноза ПКА';
        frmSetPer.DoShowForm('KAG_PKA_PERCENT_STENOZ');
        frmSetPer.ShowModal;
        if frmSetPer.ModalResult = mrOk then
          begin
            be9.Text := frmSetPer.odsList.FieldByName('ownname').AsString+' '+frmSetPer.odsList.FieldByName('fc_name').AsString;
            be9.Tag := frmSetPer.odsList.FieldByName('fk_id').AsInteger;
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
                       '                    start with fc_synonim = ''KAG_PKA_PERCENT_STENOZ'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        frmMain.os.Commit;
        be9.Properties.OnChange := nil;
        be9.Text := '';
        be9.Tag := -1;
        be9.Properties.OnChange := be9PropertiesChange;
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmKag.be9PropertiesChange(Sender: TObject);
begin
  isPerPKA := True;
  aSave.Enabled := True;
end;

procedure TfrmKag.cbEmeraldPropertiesChange(Sender: TObject);
begin
  isEmer := True;
  aSave.Enabled := True;
end;

procedure TfrmKag.cxDozaPropertiesChange(Sender: TObject);
begin
  isDoza := True;
  aSave.Enabled := True;
end;

procedure TfrmKag.DoDisable(nId: Integer);
begin
  if nId = 3 then
    begin
      lbVyp.Visible := True;
      Panel1.Enabled := False;
      Panel2.Enabled := False;
      Panel3.Enabled := False;
      Panel4.Enabled := False;
      Panel5.Enabled := False;
      Panel6.Enabled := False;
      Panel7.Enabled := False;
      lcbKat1.Enabled := False;
      lcbKat2.Enabled := False;
      lcbKat3.Enabled := False;
      cbEmerald.Enabled := False;
      lcbKontrast.Enabled := False;
      seKolvo.Enabled := False;
      deDate.Enabled := False;
      teTime.Enabled := False;
      lcbVrach.Enabled := False;
      aSave.Enabled := False;
      aPodpis.Enabled := False;
      cxDoza.Enabled := False;

      be1.Properties.Buttons[0].Visible := False;
      be1.Properties.Buttons[1].Visible := False;
      be2.Properties.Buttons[0].Visible := False;
      be2.Properties.Buttons[1].Visible := False;
      be3.Properties.Buttons[0].Visible := False;
      be3.Properties.Buttons[1].Visible := False;
      be4.Properties.Buttons[0].Visible := False;
      be4.Properties.Buttons[1].Visible := False;
      be5.Properties.Buttons[0].Visible := False;
      be5.Properties.Buttons[1].Visible := False;
      be6.Properties.Buttons[0].Visible := False;
      be6.Properties.Buttons[1].Visible := False;
      be7.Properties.Buttons[0].Visible := False;
      be7.Properties.Buttons[1].Visible := False;
      be8.Properties.Buttons[0].Visible := False;
      be8.Properties.Buttons[1].Visible := False;
      be9.Properties.Buttons[0].Visible := False;
      be9.Properties.Buttons[1].Visible := False;
      be10.Properties.Buttons[0].Visible := False;
      be10.Properties.Buttons[1].Visible := False;

      lcbBloodType.Properties.Buttons[0].Visible := False;
      lcbStvol.Properties.Buttons[0].Visible := False;
      lcbPMJV.Properties.Buttons[0].Visible := False;
      lcbLocalPMJV.Properties.Buttons[0].Visible := False;
      lcbPMJV2.Properties.Buttons[0].Visible := False;
      lcbLocalPMJV2.Properties.Buttons[0].Visible := False;
      lcbOV.Properties.Buttons[0].Visible := False;
      lcbLocalOV.Properties.Buttons[0].Visible := False;
      lcbOV2.Properties.Buttons[0].Visible := False;
      lcbLocalOV2.Properties.Buttons[0].Visible := False;
      lcbVTK.Properties.Buttons[0].Visible := False;
      lcbLocalVTK.Properties.Buttons[0].Visible := False;
      lcbDV.Properties.Buttons[0].Visible := False;
      lcbLocalDV.Properties.Buttons[0].Visible := False;
      lcbDV2.Properties.Buttons[0].Visible := False;
      lcbLocalDV2.Properties.Buttons[0].Visible := False;
      lcbPKA.Properties.Buttons[0].Visible := False;
      lcbLocalPKA.Properties.Buttons[0].Visible := False;
      lcbPKA2.Properties.Buttons[0].Visible := False;
      lcbLocalPKA2.Properties.Buttons[0].Visible := False;

      lcbKolla.Properties.Buttons[0].Visible := False;
      lcbZakl.Properties.Buttons[0].Visible := False;
      lcbRecom.Properties.Buttons[0].Visible := False;
      lcbKat1.Properties.Buttons[0].Visible := False;
      lcbKat2.Properties.Buttons[0].Visible := False;
      lcbKat3.Properties.Buttons[0].Visible := False;
      lcbKontrast.Properties.Buttons[0].Visible := False;
      seKolvo.Properties.SpinButtons.Visible := False;
      teTime.Properties.SpinButtons.Visible := False;
      deDate.Properties.Buttons[0].Visible := False;
      lcbVrach.Properties.Buttons[0].Visible := False;
    end;
end;

procedure TfrmKag.DoLoadTibParams(nNazID: Integer);
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
// -- 1. тип кровообращения
        if ods.FieldByName('syn').AsString = 'KAG_BLOOD_TYPE' then
          begin
            lcbBloodType.Properties.OnChange := nil;
            lcbBloodType.EditValue := ods.FieldByName('fk_smid').AsInteger;
            lcbBloodType.Properties.OnChange := lcbBloodTypePropertiesChange;
          end;
// -- 2. ствол
        if ods.FieldByName('syn').AsString = 'KAG_STVOL' then
          begin
            lcbStvol.Properties.OnChange := nil;
            lcbStvol.EditValue := ods.FieldByName('fk_smid').AsInteger;
            lcbStvol.Properties.OnChange := lcbStvolPropertiesChange;
          end;
// -- 5. ПМЖВ
        if ods.FieldByName('syn').AsString = 'KAG_PMJV_STENOZ' then
          begin
            lcbPMJV.Properties.OnChange := nil;
            lcbPMJV.EditValue := ods.FieldByName('fk_smid').AsInteger;
            lcbPMJV.Properties.OnChange := lcbPMJVPropertiesChange;
          end;
// -- 6. Локализация в ПМЖВ
        if ods.FieldByName('syn').AsString = 'KAG_PMJV_LOCAL' then
          begin
            lcbLocalPMJV.Properties.OnChange := nil;
            lcbLocalPMJV.EditValue := ods.FieldByName('fk_smid').AsInteger;
            lcbLocalPMJV.Properties.OnChange := lcbLocalPMJVPropertiesChange;
          end;
// -- 9. ПМЖВ2
        if ods.FieldByName('syn').AsString = 'KAG_PMJV2_STENOZ' then
          begin
            lcbPMJV2.Properties.OnChange := nil;
            lcbPMJV2.EditValue := ods.FieldByName('fk_smid').AsInteger;
            lcbPMJV2.Properties.OnChange := lcbPMJV2PropertiesChange;
          end;
// -- 10. Локализация ПМЖВ2
        if ods.FieldByName('syn').AsString = 'KAG_PMJV2_LOCAL' then
          begin
            lcbLocalPMJV2.Properties.OnChange := nil;
            lcbLocalPMJV2.EditValue := ods.FieldByName('fk_smid').AsInteger;
            lcbLocalPMJV2.Properties.OnChange := lcbLocalPMJV2PropertiesChange;
          end;
// -- 11. ОВ
        if ods.FieldByName('syn').AsString = 'KAG_OB_STENOZ' then
          begin
            lcbOV.Properties.OnChange := nil;
            lcbOV.EditValue := ods.FieldByName('fk_smid').AsInteger;
            lcbOV.Properties.OnChange := lcbOVPropertiesChange;
          end;
// -- 12. Локализация ОВ
        if ods.FieldByName('syn').AsString = 'KAG_OB_LOCAL' then
          begin
            lcbLocalOV.Properties.OnChange := nil;
            lcbLocalOV.EditValue := ods.FieldByName('fk_smid').AsInteger;
            lcbLocalOV.Properties.OnChange := lcbLocalOVPropertiesChange;
          end;
// -- 13. ОВ2
        if ods.FieldByName('syn').AsString = 'KAG_OB2_STENOZ' then
          begin
            lcbOV2.Properties.OnChange := nil;
            lcbOV2.EditValue := ods.FieldByName('fk_smid').AsInteger;
            lcbOV2.Properties.OnChange := lcbOV2PropertiesChange;
          end;
// -- 14. Локализация ОВ2
        if ods.FieldByName('syn').AsString = 'KAG_OB2_LOCAL' then
          begin
            lcbLocalOV2.Properties.OnChange := nil;
            lcbLocalOV2.EditValue := ods.FieldByName('fk_smid').AsInteger;
            lcbLocalOV2.Properties.OnChange := lcbLocalOV2PropertiesChange;
          end;
// -- 15. ВТК
        if ods.FieldByName('syn').AsString = 'KAG_VTK_STENOZ' then
          begin
            lcbVTK.Properties.OnChange := nil;
            lcbVTK.EditValue := ods.FieldByName('fk_smid').AsInteger;
            lcbVTK.Properties.OnChange := lcbVTKPropertiesChange;
          end;
// -- 16. Локализация ВТК
        if ods.FieldByName('syn').AsString = 'KAG_VTK_LOCAL' then
          begin
            lcbLocalVTK.Properties.OnChange := nil;
            lcbLocalVTK.EditValue := ods.FieldByName('fk_smid').AsInteger;
            lcbLocalVTK.Properties.OnChange := lcbLocalVTKPropertiesChange;
          end;
// -- 17. ДВ
        if ods.FieldByName('syn').AsString = 'KAG_DV_STENOZ' then
          begin
            lcbDV.Properties.OnChange := nil;
            lcbDV.EditValue := ods.FieldByName('fk_smid').AsInteger;
            lcbDV.Properties.OnChange := lcbDVPropertiesChange;
          end;
// -- 18. Локализация ДВ
        if ods.FieldByName('syn').AsString = 'KAG_DV_LOCAL' then
          begin
            lcbLocalDV.Properties.OnChange := nil;
            lcbLocalDV.EditValue := ods.FieldByName('fk_smid').AsInteger;
            lcbLocalDV.Properties.OnChange := lcbLocalDVPropertiesChange;
          end;
// -- 19. ДВ2
        if ods.FieldByName('syn').AsString = 'KAG_DV2_STENOZ' then
          begin
            lcbDV2.Properties.OnChange := nil;
            lcbDV2.EditValue := ods.FieldByName('fk_smid').AsInteger;
            lcbDV2.Properties.OnChange := lcbDV2PropertiesChange;
          end;
// -- 20. Локализация ДВ2
        if ods.FieldByName('syn').AsString = 'KAG_DV2_LOCAL' then
          begin
            lcbLocalDV2.Properties.OnChange := nil;
            lcbLocalDV2.EditValue := ods.FieldByName('fk_smid').AsInteger;
            lcbLocalDV2.Properties.OnChange := lcbLocalDV2PropertiesChange;
          end;
// -- 21. ПКА
        if ods.FieldByName('syn').AsString = 'KAG_PKA_STENOZ' then
          begin
            lcbPKA.Properties.OnChange := nil;
            lcbPKA.EditValue := ods.FieldByName('fk_smid').AsInteger;
            lcbPKA.Properties.OnChange := lcbPKAPropertiesChange;
          end;
// -- 22. Локализация ПКА
        if ods.FieldByName('syn').AsString = 'KAG_PKA_LOCAL' then
          begin
            lcbLocalPKA.Properties.OnChange := nil;
            lcbLocalPKA.EditValue := ods.FieldByName('fk_smid').AsInteger;
            lcbLocalPKA.Properties.OnChange := lcbLocalPKAPropertiesChange;
          end;
// -- 23. ПКА2
        if ods.FieldByName('syn').AsString = 'KAG_PKA2_STENOZ' then
          begin
            lcbPKA2.Properties.OnChange := nil;
            lcbPKA2.EditValue := ods.FieldByName('fk_smid').AsInteger;
            lcbPKA2.Properties.OnChange := lcbPKA2PropertiesChange;
          end;
// -- 24. Локализация ПКА2
        if ods.FieldByName('syn').AsString = 'KAG_PKA2_LOCAL' then
          begin
            lcbLocalPKA2.Properties.OnChange := nil;
            lcbLocalPKA2.EditValue := ods.FieldByName('fk_smid').AsInteger;
            lcbLocalPKA2.Properties.OnChange := lcbLocalPKA2PropertiesChange;
          end;
// -- Коллатерали
        if ods.FieldByName('syn').AsString = 'KAG_KOLLATERALI' then
          begin
            lcbKolla.Properties.OnChange := nil;
            lcbKolla.EditValue := ods.FieldByName('fk_smid').AsInteger;
            lcbKolla.Properties.OnChange := lcbKollaPropertiesChange;
          end;
// -- Заключение
        if ods.FieldByName('syn').AsString = 'KAG_ZAKL' then
          begin
            lcbZakl.Properties.OnChange := nil;
            lcbZakl.EditValue := ods.FieldByName('fk_smid').AsInteger;
            lcbZakl.Properties.OnChange := lcbZaklPropertiesChange;
          end;
// -- Рекомендации
        if ods.FieldByName('syn').AsString = 'KAG_RECOMEND' then
          begin
            lcbRecom.Properties.OnChange := nil;
            lcbRecom.EditValue := ods.FieldByName('fk_smid').AsInteger;
            lcbRecom.Properties.OnChange := lcbRecomPropertiesChange;
          end;
// -- Катетер 1
        if ods.FieldByName('syn').AsString = 'KAG_KATETER1' then
          begin
            lcbKat1.Properties.OnChange := nil;
            lcbKat1.EditValue := ods.FieldByName('fk_smid').AsInteger;
            lcbKat1.Properties.OnChange := lcbKat1PropertiesChange;
          end;
// -- Катетер 2
        if ods.FieldByName('syn').AsString = 'KAG_KATETER2' then
          begin
            lcbKat2.Properties.OnChange := nil;
            lcbKat2.EditValue := ods.FieldByName('fk_smid').AsInteger;
            lcbKat2.Properties.OnChange := lcbKat2PropertiesChange;
          end;
// -- Катетер 3
        if ods.FieldByName('syn').AsString = 'KAG_KATETER3' then
          begin
            lcbKat3.Properties.OnChange := nil;
            lcbKat3.EditValue := ods.FieldByName('fk_smid').AsInteger;
            lcbKat3.Properties.OnChange := lcbKat3PropertiesChange;
          end;
// -- Проводник Emerald
        if ods.FieldByName('synsmid').AsString = 'KAG_PROVODNIK_EMERALD' then
          begin
            cbEmerald.Properties.OnChange := nil;
            if ods.FieldByName('fn_num').AsInteger = -1 then
              cbEmerald.Checked := True
            else
              cbEmerald.Checked := False;
            cbEmerald.Properties.OnChange := cbEmeraldPropertiesChange;
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
// -- Доза
        if (ods.FieldByName('fk_smid').AsInteger = -1) and ((ods.FieldByName('fk_smeditid').AsInteger = -1)) then
          begin
            cxDoza.Properties.OnChange := nil;
            cxDoza.Text := FloatToStr(ods.FieldByName('fn_num').AsFloat);
            cxDoza.Properties.OnChange := cxDozaPropertiesChange;
          end;
        ods.Next;
      end;

// -- %-ты стеноза
// -- % стеноза ствола
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smeditid) ||'' ''|| asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                    '                    start with fc_synonim = ''KAG_PERCENT_STSTVOL'' connect by prior fk_id = fk_owner) ';
    ods.DeclareAndSet('pfk_pacid', otInteger, pNazID);
    ods.Open;
    be1.Properties.OnChange := nil;
    be1.Text := ods.FieldByName('smname').AsString;
    be1.Tag := ods.FieldByName('fk_smid').AsInteger;
    be1.Properties.OnChange := be1PropertiesChange;
// -- % стеноза ПМЖВ
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smeditid) ||'' ''|| asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                    '                    start with fc_synonim = ''KAG_PMJV_PERCENT_STENOZ'' connect by prior fk_id = fk_owner) ';
    ods.DeclareAndSet('pfk_pacid', otInteger, pNazID);
    ods.Open;
    be2.Properties.OnChange := nil;
    be2.Text := ods.FieldByName('smname').AsString;
    be2.Tag := ods.FieldByName('fk_smid').AsInteger;
    be2.Properties.OnChange := be2PropertiesChange;
// -- % стеноза ПМЖВ 2
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smeditid) ||'' ''|| asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                    '                    start with fc_synonim = ''KAG_PMJV2_PERCENT_STENOZ'' connect by prior fk_id = fk_owner) ';
    ods.DeclareAndSet('pfk_pacid', otInteger, pNazID);
    ods.Open;
    be3.Properties.OnChange := nil;
    be3.Text := ods.FieldByName('smname').AsString;
    be3.Tag := ods.FieldByName('fk_smid').AsInteger;
    be3.Properties.OnChange := be3PropertiesChange;
// -- % стеноза ОВ
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smeditid) ||'' ''|| asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                    '                    start with fc_synonim = ''KAG_OB_PERCENT_STENOZ'' connect by prior fk_id = fk_owner) ';
    ods.DeclareAndSet('pfk_pacid', otInteger, pNazID);
    ods.Open;
    be4.Properties.OnChange := nil;
    be4.Text := ods.FieldByName('smname').AsString;
    be4.Tag := ods.FieldByName('fk_smid').AsInteger;
    be4.Properties.OnChange := be4PropertiesChange;
// -- % стеноза ОВ2
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smeditid) ||'' ''|| asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                    '                    start with fc_synonim = ''KAG_OB2_PERCENT_STENOZ'' connect by prior fk_id = fk_owner) ';
    ods.DeclareAndSet('pfk_pacid', otInteger, pNazID);
    ods.Open;
    be5.Properties.OnChange := nil;
    be5.Text := ods.FieldByName('smname').AsString;
    be5.Tag := ods.FieldByName('fk_smid').AsInteger;
    be5.Properties.OnChange := be5PropertiesChange;
// -- % стеноза ВТК
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smeditid) ||'' ''|| asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                    '                    start with fc_synonim = ''KAG_VTK_PERCENT_STENOZ'' connect by prior fk_id = fk_owner) ';
    ods.DeclareAndSet('pfk_pacid', otInteger, pNazID);
    ods.Open;
    be6.Properties.OnChange := nil;
    be6.Text := ods.FieldByName('smname').AsString;
    be6.Tag := ods.FieldByName('fk_smid').AsInteger;
    be6.Properties.OnChange := be6PropertiesChange;
// -- % стеноза ДВ
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smeditid) ||'' ''|| asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                    '                    start with fc_synonim = ''KAG_DV_PERCENT_STENOZ'' connect by prior fk_id = fk_owner) ';
    ods.DeclareAndSet('pfk_pacid', otInteger, pNazID);
    ods.Open;
    be7.Properties.OnChange := nil;
    be7.Text := ods.FieldByName('smname').AsString;
    be7.Tag := ods.FieldByName('fk_smid').AsInteger;
    be7.Properties.OnChange := be7PropertiesChange;
// -- % стеноза ДВ2
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smeditid) ||'' ''|| asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                    '                    start with fc_synonim = ''KAG_DV2_PERCENT_STENOZ'' connect by prior fk_id = fk_owner) ';
    ods.DeclareAndSet('pfk_pacid', otInteger, pNazID);
    ods.Open;
    be8.Properties.OnChange := nil;
    be8.Text := ods.FieldByName('smname').AsString;
    be8.Tag := ods.FieldByName('fk_smid').AsInteger;
    be8.Properties.OnChange := be8PropertiesChange;
// -- % стеноза ПКА
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smeditid) ||'' ''|| asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                    '                    start with fc_synonim = ''KAG_PKA_PERCENT_STENOZ'' connect by prior fk_id = fk_owner) ';
    ods.DeclareAndSet('pfk_pacid', otInteger, pNazID);
    ods.Open;
    be9.Properties.OnChange := nil;
    be9.Text := ods.FieldByName('smname').AsString;
    be9.Tag := ods.FieldByName('fk_smid').AsInteger;
    be9.Properties.OnChange := be9PropertiesChange;
// -- % стеноза ПКА2
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smeditid) ||'' ''|| asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                    '                    start with fc_synonim = ''KAG_PKA2_PERCENT_STENOZ'' connect by prior fk_id = fk_owner) ';
    ods.DeclareAndSet('pfk_pacid', otInteger, pNazID);
    ods.Open;
    be10.Properties.OnChange := nil;
    be10.Text := ods.FieldByName('smname').AsString;
    be10.Tag := ods.FieldByName('fk_smid').AsInteger;
    be10.Properties.OnChange := be10PropertiesChange;
  finally
    ods.Free;
  end;
end;

procedure TfrmKag.DoPodpis;
var oq : TOracleQuery;
    ods : TOracleDataSet;
    memStream : TMemoryStream;
    sPMJV, sOB, sVTK, sDV, sPKA : String;
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
    if (lcbBloodType.EditValue <> 0) and (lcbBloodType.EditValue <> -1) and (lcbBloodType.EditValue <> null) then
      begin
        InsertText('Тип кровообращения: '+lcbBloodType.EditText, '-1;-1;-1', 0);
        rve.InsertText(#13+#10);
      end;
    if (lcbStvol.EditValue <> 0) and (lcbStvol.EditValue <> -1) and (lcbStvol.EditValue <> null) then
      begin
        InsertText('Ствол: '+lcbStvol.EditText, '-1;-1;-1', 0);
        rve.InsertText(#13+#10);
      end;
    if be1.Text <> '' then
      begin
        InsertText('Процент стеноза ствола: '+be1.Text, '-1;-1;-1', 0);
        rve.InsertText(#13+#10);
      end;
// -- ПМЖВ
    if (lcbPMJV.EditValue <> 0) and (lcbPMJV.EditValue <> -1) and (lcbPMJV.EditValue <> null) then
      sPMJV := 'Стеноз ПМЖВ: '+lcbPMJV.EditText+'; ';
    if (lcbLocalPMJV.EditValue <> 0) and (lcbLocalPMJV.EditValue <> -1) and (lcbLocalPMJV.EditValue <> null) then
      sPMJV := sPMJV + 'Локализация в ПМЖВ: '+lcbLocalPMJV.EditText+'; ';
    if be2.Text <> '' then
      sPMJV := sPMJV + '% стеноза ПМЖВ: '+be2.Text+'; ';
    if (lcbPMJV2.EditValue <> 0) and (lcbPMJV2.EditValue <> -1) and (lcbPMJV2.EditValue <> null) then
      sPMJV := sPMJV + 'Стеноз ПМЖВ2: '+lcbPMJV2.EditText+'; ';
    if (lcbLocalPMJV2.EditValue <> 0) and (lcbLocalPMJV2.EditValue <> -1) and (lcbLocalPMJV2.EditValue <> null) then
      sPMJV := sPMJV + 'Локализация в ПМЖВ2: '+lcbLocalPMJV2.EditText+'; ';
    if be3.Text <> '' then
      sPMJV := sPMJV + '% стеноза ПМЖВ2: '+be3.Text+'.';
    if sPMJV <> '' then
      begin
        InsertText('Стеноз ПМЖВ', '-1;-1;-1', 1);
        rve.InsertText(#13+#10);
        InsertText(sPMJV, '-1;-1;-1', 0);
        rve.InsertText(#13+#10);
      end;
// -- ОВ
  if (lcbOV.EditValue <> 0) and (lcbOV.EditValue <> -1) and (lcbOV.EditValue <> null) then
    sOB := 'Стеноз ОВ: '+lcbOV.EditText+'; ';
  if (lcbLocalOV.EditValue <> 0) and (lcbLocalOV.EditValue <> -1) and (lcbLocalOV.EditValue <> null) then
    sOB := sOB + 'Локализация в ОВ: '+lcbLocalOV.EditText+'; ';
  if be4.Text <> '' then
    sOB := sOB + '% стеноза ОВ: '+be4.Text+'; ';
  if (lcbOV2.EditValue <> 0) and (lcbOV2.EditValue <> -1) and (lcbOV2.EditValue <> null) then
    sOB := sOB + 'Стеноз ОВ2: '+lcbOV2.EditText+'; ';
  if (lcbLocalOV2.EditValue <> 0) and (lcbLocalOV2.EditValue <> -1) and (lcbLocalOV2.EditValue <> null) then
    sOB := sOB + 'Локализация в ОВ2: '+lcbLocalOV2.EditText+'; ';
  if be5.Text <> '' then
    sOB := sOB + '% стеноза ОВ2: '+be5.Text+'.';
  if sOB <> '' then
    begin
      InsertText('Стеноз ОВ', '-1;-1;-1', 1);
      rve.InsertText(#13+#10);
      InsertText(sOB, '-1;-1;-1', 0);
      rve.InsertText(#13+#10);
    end;
// -- ВТК
  if (lcbVTK.EditValue <> 0) and (lcbVTK.EditValue <> -1) and (lcbVTK.EditValue <> null) then
    sVTK := 'Стеноз ВТК: '+lcbVTK.EditText+'; ';
  if (lcbLocalVTK.EditValue <> 0) and (lcbLocalVTK.EditValue <> -1) and (lcbLocalVTK.EditValue <> null) then
    sVTK := sVTK + 'Локализация в ВТК: '+lcbLocalVTK.EditText+'; ';
  if be6.Text <> '' then
    sVTK := sVTK + '% стеноза ВТК: '+be6.Text+'. ';
  if sVTK <> '' then
    begin
      InsertText('Стеноз ВТК', '-1;-1;-1', 1);
      rve.InsertText(#13+#10);
      InsertText(sVTK, '-1;-1;-1', 0);
      rve.InsertText(#13+#10);
    end;
// -- ДВ
  if (lcbDV.EditValue <> 0) and (lcbDV.EditValue <> -1) and (lcbDV.EditValue <> null) then
    sDV := 'Стеноз ДВ: '+lcbDV.EditText+'; ';
  if (lcbLocalDV.EditValue <> 0) and (lcbLocalDV.EditValue <> -1) and (lcbLocalDV.EditValue <> null) then
    sDV := sDV + 'Локализация в ДВ: '+lcbLocalDV.EditText+'; ';
  if be7.Text <> '' then
    sDV := sDV + '% стеноза ДВ: '+be7.Text+'; ';
  if (lcbDV2.EditValue <> 0) and (lcbDV2.EditValue <> -1) and (lcbDV2.EditValue <> null) then
    sDV := sDV + 'Стеноз ДВ2: '+lcbDV2.EditText+'; ';
  if (lcbLocalDV2.EditValue <> 0) and (lcbLocalDV2.EditValue <> -1) and (lcbLocalDV2.EditValue <> null) then
    sDV := sDV + 'Локализация в ДВ2: '+lcbLocalDV2.EditText+'; ';
  if be8.Text <> '' then
    sDV := sDV + '% стеноза ДВ2: '+be8.Text+'. ';
  if sDV <> '' then
    begin
      InsertText('Стеноз ДВ', '-1;-1;-1', 1);
      rve.InsertText(#13+#10);
      InsertText(sDV, '-1;-1;-1', 0);
      rve.InsertText(#13+#10);
    end;
// -- ПКА
  if (lcbPKA.EditValue <> 0) and (lcbPKA.EditValue <> -1) and (lcbPKA.EditValue <> null) then
    sPKA := 'Стеноз ПКА: '+lcbPKA.EditText+'; ';
  if (lcbLocalPKA.EditValue <> 0) and (lcbLocalPKA.EditValue <> -1) and (lcbLocalPKA.EditValue <> null) then
    sPKA := sPKA + 'Локализация в ПКА: '+lcbLocalPKA.EditText+'; ';
  if be9.Text <> '' then
    sPKA := sPKA + '% стеноза ПКА: '+be9.Text+'; ';
  if (lcbPKA2.EditValue <> 0) and (lcbPKA2.EditValue <> -1) and (lcbPKA2.EditValue <> null) then
    sPKA := sPKA + 'Стеноз ПКА2: '+lcbPKA2.EditText+'; ';
  if (lcbLocalPKA2.EditValue <> 0) and (lcbLocalPKA2.EditValue <> -1) and (lcbLocalPKA2.EditValue <> null) then
    sPKA := sPKA + 'Локализация в ПКА2: '+lcbLocalPKA2.EditText+'; ';
  if be10.Text <> '' then
    sPKA := sPKA + '% стеноза ПКА2: '+be10.Text+'. ';
  if sPKA <> '' then
    begin
      InsertText('Стеноз ПКА', '-1;-1;-1', 1);
      rve.InsertText(#13+#10);
      InsertText(sPKA, '-1;-1;-1', 0);
      rve.InsertText(#13+#10);
    end;
// -- Заключения
  if (lcbKolla.EditValue <> 0) and (lcbKolla.EditValue <> -1) and (lcbKolla.EditValue <> null) then
    begin
      InsertText('Коллатерали: ', '-1;-1;-1', 1);
      InsertText(lcbKolla.EditText, '-1;-1;-1', 0);
      rve.InsertText(#13+#10);
    end;
  if (lcbZakl.EditValue <> 0) and (lcbZakl.EditValue <> -1) and (lcbZakl.EditValue <> null) then
    begin
      InsertText('Заключение: ', '-1;-1;-1', 1);
      InsertText(lcbZakl.EditText, '-1;-1;-1', 0);
      rve.InsertText(#13+#10);
    end;
  if (lcbRecom.EditValue <> 0) and (lcbRecom.EditValue <> -1) and (lcbRecom.EditValue <> null) then
    begin
      InsertText('Рекомендации: ', '-1;-1;-1', 1);
      InsertText(lcbRecom.EditText, '-1;-1;-1', 0);
      rve.InsertText(#13+#10);
    end;
// -- Расходка
  if (lcbKat1.EditText <> '') and (lcbKat1.EditValue <> -1) and (lcbKat1.EditValue <> null) then
    sRashod := 'Катетер 1: '+lcbKat1.EditText+'; ';
  if (lcbKat2.EditText <> '') and (lcbKat2.EditValue <> -1) and (lcbKat2.EditValue <> null) then
    sRashod := sRashod + 'Катетер 2: '+lcbKat2.EditText+'; ';
  if (lcbKat3.EditText <> '') and (lcbKat3.EditValue <> -1) and (lcbKat3.EditValue <> null) then
    sRashod := sRashod + 'Катетер 3: '+lcbKat3.EditText+'; ';
  if cbEmerald.Checked then
    sRashod := sRashod + 'Проводник Emerald; ';
  if (lcbKontrast.EditText <> '') and (lcbKontrast.EditValue <> -1) and (lcbKontrast.EditValue <> null) then
    sRashod := sRashod + 'Контраст: '+lcbKontrast.EditText+'; ';
  if (seKolvo.Value <> 0) and (seKolvo.Text <> '') then
    sRashod := sRashod + 'Кол-во: '+seKolvo.Text+'.';
  if sRashod <> '' then
    begin
      InsertText('Расходные материалы', '-1;-1;-1', 1);
      rve.InsertText(#13+#10);
      InsertText(sRashod, '-1;-1;-1', 0);
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

procedure TfrmKag.DoSave;
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  oq.Session := frmMain.os;
  try
// 1. тип кровообращения
    if isBlood = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_BLOOD_TYPE'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_BLOOD_TYPE'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbBloodType.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// 2. ствол
    if isStvol = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_STVOL'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_STVOL'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbStvol.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// 3. % стеноза ствола
    if (isPerStvol = True) and (be1.Tag <> -1) then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''KAG_PERCENT_STSTVOL'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        oq.DeleteVariables;
        oq.SQL.Text := ' insert into asu.tib(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, be1.Tag);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// 4. ПМЖВ
    if isPMJV = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_PMJV_STENOZ'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_PMJV_STENOZ'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbPMJV.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// 5. Локализация в ПМЖВ
    if isLocalPMJV = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_PMJV_LOCAL'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_PMJV_LOCAL'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLocalPMJV.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// 6. % стеноза ПМЖВ
    if (isPerPMJV = True) and (be2.Tag <> -1) then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''KAG_PMJV_PERCENT_STENOZ'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        oq.DeleteVariables;
        oq.SQL.Text := ' insert into asu.tib(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, be2.Tag);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// 7. ПМЖВ2
    if isPMJV2 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_PMJV2_STENOZ'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_PMJV2_STENOZ'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbPMJV2.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// 8. Локализация в ПМЖВ2
    if isLocalPMJV2 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_PMJV2_LOCAL'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_PMJV2_LOCAL'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLocalPMJV2.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// 9. % стеноза ПМЖВ2
    if (isPerPMJV2 = True) and (be3.Tag <> -1) then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''KAG_PMJV2_PERCENT_STENOZ'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        oq.DeleteVariables;
        oq.SQL.Text := ' insert into asu.tib(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, be3.Tag);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// 10 Стеноз ОВ
    if isOB = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_OB_STENOZ'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_OB_STENOZ'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbOV.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// 11 Локализация ОВ
    if isLocalOB = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_OB_LOCAL'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_OB_LOCAL'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLocalOV.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// 12 % стеноза ОВ
    if (isPerOB = True) and (be4.Tag <> -1) then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''KAG_OB_PERCENT_STENOZ'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        oq.DeleteVariables;
        oq.SQL.Text := ' insert into asu.tib(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, be4.Tag);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// 13 стеноз ОВ2
    if isOB2 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_OB2_STENOZ'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_OB2_STENOZ'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbOV2.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// 14 локализация в ОВ2
    if isLocalOB2 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_OB2_LOCAL'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_OB2_LOCAL'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLocalOV2.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// 15 % стеноза ОВ2
    if (isPerOB2 = True) and (be5.Tag <> -1) then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''KAG_OB2_PERCENT_STENOZ'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        oq.DeleteVariables;
        oq.SQL.Text := ' insert into asu.tib(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, be5.Tag);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// 16 стеноз ВТК
    if isVTK = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_VTK_STENOZ'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_VTK_STENOZ'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbVTK.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// 17 локализация в ВТК
    if isLocalVTK = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_VTK_LOCAL'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_VTK_LOCAL'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLocalVTK.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// 18 % стеноза ВТК
    if (isPerVTK = True) and (be6.Tag <> -1) then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''KAG_VTK_PERCENT_STENOZ'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        oq.DeleteVariables;
        oq.SQL.Text := ' insert into asu.tib(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, be6.Tag);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// 19 Стеноз ДВ
    if isDV = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_DV_STENOZ'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_DV_STENOZ'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbDV.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// 20 Локализация в ДВ
    if isLocalDV = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_DV_LOCAL'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_DV_LOCAL'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLocalDV.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// 21 % стеноза ДВ
    if (isPerDV = True) and (be7.Tag <> -1) then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''KAG_DV_PERCENT_STENOZ'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        oq.DeleteVariables;
        oq.SQL.Text := ' insert into asu.tib(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, be7.Tag);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// 22 Стеноз ДВ2
    if isDV2 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_DV2_STENOZ'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_DV2_STENOZ'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbDV2.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// 23 Локализация в ДВ2
    if isLocalDV2 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_DV2_LOCAL'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_DV2_LOCAL'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLocalDV2.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// 24 % стеноза ДВ2
    if (isPerDV2 = True) and (be8.Tag <> -1) then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''KAG_DV2_PERCENT_STENOZ'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        oq.DeleteVariables;
        oq.SQL.Text := ' insert into asu.tib(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, be8.Tag);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// 25 Стеноз ПКА
    if isPKA = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_PKA_STENOZ'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_PKA_STENOZ'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbPKA.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// 26 Локализация в ПКА
    if isLocalPKA = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_PKA_LOCAL'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_PKA_LOCAL'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLocalPKA.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// 27 % стеноза ПКА
    if (isPerPKA = True) and (be9.Tag <> -1) then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''KAG_PKA_PERCENT_STENOZ'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        oq.DeleteVariables;
        oq.SQL.Text := ' insert into asu.tib(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, be9.Tag);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// 28 Стеноз ПКА2
    if isPKA2 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_PKA2_STENOZ'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_PKA2_STENOZ'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbPKA2.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// 29 Локализация в ПКА2
    if isLocalPKA2 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_PKA2_LOCAL'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_PKA2_LOCAL'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbLocalPKA2.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// 30 % стеноза ПКА2
    if (isPerPKA2 = True) and (be10.Tag <> -1) then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid '+#13+
                       '    and fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''KAG_PKA2_PERCENT_STENOZ'' connect by prior fk_id = fk_owner) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.Execute;
        oq.DeleteVariables;
        oq.SQL.Text := ' insert into asu.tib(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, be10.Tag);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Коллатерали
    if isKolla = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_KOLLATERALI'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_KOLLATERALI'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbKolla.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Заключение
    if isZakl = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_ZAKL'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_ZAKL'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbZakl.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Рекомендации
    if isRecom = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_RECOMEND'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_RECOMEND'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbRecom.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Катетер 1
    if isKat1 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_KATETER1'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_id from asu.tsmid where fc_synonim = ''KAG_KATETER1''), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_KATETER1'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbKat1.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Катетер 2
    if isKat2 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_KATETER2'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_id from asu.tsmid where fc_synonim = ''KAG_KATETER2''), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_KATETER2'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbKat2.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// Катетер 3
    if isKat3 = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_KATETER3'')) '+#13+
                       ' when not matched then insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_id from asu.tsmid where fc_synonim = ''KAG_KATETER3''), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_KATETER3'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
        oq.DeclareAndSet('pfk_smid', otInteger, lcbKat3.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.Execute;
      end;
// проводник Emerald
    if isEmer = True then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into asu.tib '+#13+
                       '   using dual on (fk_pacid = :pfk_pacid and fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_PROVODNIK_EMERALD'')) '+#13+
                       ' when not matched then insert(fn_num, fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfn_num, :pfk_pacid, (select fk_id from asu.tsmid where fc_synonim = ''KAG_PROVODNIK_EMERALD''), (select fk_owner from asu.tsmid where fc_synonim = ''KAG_PROVODNIK_EMERALD''), :pfk_vrachid, sysdate)'+#13+
                       ' when matched then '+#13+
                       '   update set fn_num = :pfn_num, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                       '    where fk_pacid = :pfk_pacid and fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''KAG_PROVODNIK_EMERALD'') ';
        oq.DeclareAndSet('pfn_num', otInteger, cbEmerald.EditValue);
        oq.DeclareAndSet('pfk_pacid', otInteger, pNazID);
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

    frmMain.os.Commit;
    isBlood := False;
    isStvol := False;
    isPerStvol := False;
//-- пмжв
    isPMJV := False;
    isLocalPMJV := False;
    isPerPMJV := False;
    isPMJV2 := False;
    isLocalPMJV2 := False;
    isPerPMJV2 := False;
//-- OB
    isOB := False;
    isLocalOB := False;
    isPerOB := False;
    isOB2 := False;
    isLocalOB2 := False;
    isPerOB2 := False;
//-- ВТК
    isVTK := False;
    isLocalVTK := False;
    isPerVTK := False;
//-- ДВ
    isDV := False;
    isLocalDV := False;
    isPerDV := False;
    isDV2 := False;
    isLocalDV2 := False;
    isPerDV2 := False;
//-- ПКА
    isPKA := False;
    isLocalPKA := False;
    isPerPKA := False;
    isPKA2 := False;
    isLocalPKA2 := False;
    isPerPKA2 := False;
//-- заключения
    isKolla := False;
    isZakl := False;
    isRecom := False;
    isKat1 := False;
    isKat2 := False;
    isKat3 := False;
    isEmer := False;
    isKontrast := False;
    isKolvo := False;
    aSave.Enabled := False;
  finally
    oq.Free;
  end;
end;

procedure TfrmKag.DoShowForm(nPacID, nNazID, nSmidID: Integer);
var ods : TOracleDataSet;
begin
  lbPac.Tag := nPacID;
  pNazID := nNazID;
  pSmidID := nSmidID;
  ods := TOracleDataSet.Create(nil);
  ods.Session := frmMain.os;
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
    ods.Free;
  end;
end;

procedure TfrmKag.FormCreate(Sender: TObject);
begin
//-- >> "Заряжаем" датасеты
// -- ALL
  if odsBloodType.Active = False then
    odsBloodType.Active := True;
  if odsStvol.Active = False then
    odsStvol.Active := True;
// -- ПМЖВ
  if odsPMJVStenoz.Active = False then
    odsPMJVStenoz.Active := True;
  if odsPMJVLocal.Active = False then
    odsPMJVLocal.Active := True;
  if ods9.Active = False then
    ods9.Active := True;
  if ods10.Active = False then
    ods10.Active := True;
// -- ОВ
  if ods11.Active = False then
    ods11.Active := True;
  if ods12.Active = False then
    ods12.Active := True;
  if ods13.Active = False then
    ods13.Active := True;
  if ods14.Active = False then
    ods14.Active := True;
// -- ВТК
  if ods15.Active = False then
    ods15.Active := True;
  if ods16.Active = False then
    ods16.Active := True;
// -- ДВ
  if ods17.Active = False then
    ods17.Active := True;
  if ods18.Active = False then
    ods18.Active := True;
  if ods19.Active = False then
    ods19.Active := True;
  if ods20.Active = False then
    ods20.Active := True;
// -- ПКА
  if ods21.Active = False then
    ods21.Active := True;
  if ods22.Active = False then
    ods22.Active := True;
  if ods23.Active = False then
    ods23.Active := True;
  if ods24.Active = False then
    ods24.Active := True;
// -- Заключения
  if odsKollaterali.Active = False then
    odsKollaterali.Active := True;
  if odsZakl.Active = False then
    odsZakl.Active := True;
  if odsRecom.Active = False then
    odsRecom.Active := True;
//-- Расходные материалы
  if odsKat.Active = False then
    odsKat.Active := True;
  if odsKontrast.Active = False then
    odsKontrast.Active := True;
// -- Подписи
  if odsSotr.Active = False then
    odsSotr.Active := True;
  if odsRVData.Active = False then
    odsRVData.Active := True;    
end;

procedure TfrmKag.frxProtocolGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'PACFIO' then Value := lbPac.Caption;
  if VarName = 'NUMMK' then Value := lbNumMK.Caption;
  if VarName = 'AGE' then Value := lbAge.Caption;
  if VarName = 'OTDEL' then Value := lbOtdel.Caption;
  if VarName = 'TEXT1' then Value := sText1;
  if VarName = 'PMJV' then Value := sPMJV;
  if VarName = 'OV' then Value := sOB;
  if VarName = 'VTK' then Value := sVTK;
  if VarName = 'DV' then Value := sDV;
  if VarName = 'PKA' then Value := sPKA;
  if VarName = 'KOLLA' then Value := lcbKolla.EditText;
  if VarName = 'ZAKL' then Value := lcbZakl.EditText;
  if VarName = 'RECOM' then Value := lcbRecom.EditText;
  if VarName = 'RASHODKA' then Value := sRashod;
  if VarName = 'DATERUN' then Value := deDate.Text+' '+teTime.Text;
  if VarName = 'SOTR' then Value := lcbVrach.EditText;
  if VarName = 'DOZA' then Value := cxDoza.Text;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;
  if VarName = 'DATEPRINT' then Value := sDatePrint;
end;

procedure TfrmKag.InsertText(S, ATag: string; RVSStyle: Integer);
var PTag : PChar;
begin
  PTag := StrNew(PChar(ATag));
  rve.CurTextStyleNo := RVSStyle;
  // Added by Spasskiy 18.11.2008 16:15:41 stringreplace
  rve.InsertStringTag(StringReplace(s, #13#10,' ', [rfReplaceAll]), Integer(PTag));
end;

procedure TfrmKag.lcbBloodTypePropertiesChange(Sender: TObject);
begin
  isBlood := True;
  aSave.Enabled := True;
end;

procedure TfrmKag.lcbDV2PropertiesChange(Sender: TObject);
begin
  isDV2 := True;
  aSave.Enabled := True;
end;

procedure TfrmKag.lcbDVPropertiesChange(Sender: TObject);
begin
  isDV := True;
  aSave.Enabled := True;
end;

procedure TfrmKag.lcbKat1PropertiesChange(Sender: TObject);
begin
  isKat1 := True;
  aSave.Enabled := True;
end;

procedure TfrmKag.lcbKat2PropertiesChange(Sender: TObject);
begin
  isKat2 := True;
  aSave.Enabled := True;
end;

procedure TfrmKag.lcbKat3PropertiesChange(Sender: TObject);
begin
  isKat3 := True;
  aSave.Enabled := True;
end;

procedure TfrmKag.lcbKollaPropertiesChange(Sender: TObject);
begin
  isKolla := True;
  aSave.Enabled := True;
end;

procedure TfrmKag.lcbKontrastPropertiesChange(Sender: TObject);
begin
  isKontrast := True;
  aSave.Enabled := True;
end;

procedure TfrmKag.lcbLocalDV2PropertiesChange(Sender: TObject);
begin
  isLocalDV2 := True;
  aSave.Enabled := True;
end;

procedure TfrmKag.lcbLocalDVPropertiesChange(Sender: TObject);
begin
  isLocalDV := True;
  aSave.Enabled := True;
end;

procedure TfrmKag.lcbLocalOV2PropertiesChange(Sender: TObject);
begin
  isLocalOB2 := True;
  aSave.Enabled := True;
end;

procedure TfrmKag.lcbLocalOVPropertiesChange(Sender: TObject);
begin
  isLocalOB := True;
  aSave.Enabled := True;
end;

procedure TfrmKag.lcbLocalPKA2PropertiesChange(Sender: TObject);
begin
  isLocalPKA2 := True;
  aSave.Enabled := True;
end;

procedure TfrmKag.lcbLocalPKAPropertiesChange(Sender: TObject);
begin
  isLocalPKA := True;
  aSave.Enabled := True;
end;

procedure TfrmKag.lcbLocalPMJV2PropertiesChange(Sender: TObject);
begin
  isLocalPMJV2 := True;
  aSave.Enabled := True;
end;

procedure TfrmKag.lcbLocalPMJVPropertiesChange(Sender: TObject);
begin
  isLocalPMJV := True;
  aSave.Enabled := True;
end;

procedure TfrmKag.lcbLocalVTKPropertiesChange(Sender: TObject);
begin
  isLocalVTK := True;
  aSave.Enabled := True;
end;

procedure TfrmKag.lcbOV2PropertiesChange(Sender: TObject);
begin
  isOB2 := True;
  aSave.Enabled := True;
end;

procedure TfrmKag.lcbOVPropertiesChange(Sender: TObject);
begin
  isOB := True;
  aSave.Enabled := True;
end;

procedure TfrmKag.lcbStvolPropertiesChange(Sender: TObject);
begin
  isStvol := True;
  aSave.Enabled := True;
end;

procedure TfrmKag.lcbVTKPropertiesChange(Sender: TObject);
begin
  isVTK := True;
  aSave.Enabled := True;
end;

procedure TfrmKag.lcbZaklPropertiesChange(Sender: TObject);
begin
  isZakl := True;
  aSave.Enabled := True;
end;

procedure TfrmKag.seKolvoPropertiesChange(Sender: TObject);
begin
  isKolvo := True;
  aSave.Enabled := True;
end;

procedure TfrmKag.lcbPKA2PropertiesChange(Sender: TObject);
begin
  isPKA2 := True;
  aSave.Enabled := True;
end;

procedure TfrmKag.lcbPKAPropertiesChange(Sender: TObject);
begin
  isPKA := True;
  aSave.Enabled := True;
end;

procedure TfrmKag.lcbPMJV2PropertiesChange(Sender: TObject);
begin
  isPMJV2 := True;
  aSave.Enabled := True;
end;

procedure TfrmKag.lcbPMJVPropertiesChange(Sender: TObject);
begin
  isPMJV := True;
  aSave.Enabled := True;
end;

procedure TfrmKag.lcbRecomPropertiesChange(Sender: TObject);
begin
  isRecom := True;
  aSave.Enabled := True;
end;

end.
