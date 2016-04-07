unit fSetPacSpis_HiTech;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxSplitter, cxControls, cxContainer, cxEdit,
  cxGroupBox, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, DB, cxDBData, cxCalendar, OracleData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, cxTextEdit, cxDBLookupComboBox, ExtCtrls, cxDropDownEdit, cxLabel,
  cxMaskEdit, cxLookupEdit, cxDBLookupEdit, Menus, StdCtrls, cxButtons, fdmMain,
  JvComponentBase, JvFormPlacement, ActnList, fMainForm, cxSpinEdit,
  cxCurrencyEdit, frxClass, frxDBSet;

type
  TfmSetPacSpis_HiTech = class(TForm)
    grbPac: TcxGroupBox;
    cxSplitter1: TcxSplitter;
    grbSpis: TcxGroupBox;
    grPacDBTableView1: TcxGridDBTableView;
    grPacLevel1: TcxGridLevel;
    grPac: TcxGrid;
    grPac_FC_FIO: TcxGridDBColumn;
    grPac_FD_ROJD: TcxGridDBColumn;
    grPac_FD_DATA1: TcxGridDBColumn;
    grPac_FC_IB: TcxGridDBColumn;
    grPac_FC_ROOM: TcxGridDBColumn;
    odsPacList: TOracleDataSet;
    dsPacList: TDataSource;
    grPacSpis: TcxGrid;
    grPacSpisDBTableView1: TcxGridDBTableView;
    grPacSpisLevel1: TcxGridLevel;
    odsPacSpis: TOracleDataSet;
    dsPacSpis: TDataSource;
    grPacSpis_fc_medic: TcxGridDBColumn;
    grPacSpis_fn_kol: TcxGridDBColumn;
    grPacSpis_fn_sum: TcxGridDBColumn;
    grPacSpis_FD_DATE_SPIS: TcxGridDBColumn;
    grPac_VID_POM_HITECH: TcxGridDBColumn;
    odsSpisanieVid: TOracleDataSet;
    dsSpisanieVid: TDataSource;
    paCur: TPanel;
    lcbCurMOGroup: TcxLookupComboBox;
    cxLabel2: TcxLabel;
    deCurDate: TcxDateEdit;
    cxLabel1: TcxLabel;
    odsMO_GROUP: TOracleDataSet;
    dsMO_GROUP: TDataSource;
    buRefresh: TcxButton;
    buPrint: TcxButton;
    JvFormStorage1: TJvFormStorage;
    ActionList1: TActionList;
    acRefresh: TAction;
    acPrintByPac: TAction;
    grPacSpis_fc_ei: TcxGridDBColumn;
    grPac_FD_DATA2: TcxGridDBColumn;
    grPac_fn_spis_sum: TcxGridDBColumn;
    frxReport1: TfrxReport;
    frxdsPacSpis: TfrxDBDataset;
    grPacSpis_fc_finsource: TcxGridDBColumn;
    buPrintByVID_POM_HITECH: TcxButton;
    frxAct_Spis_HITECH: TfrxReport;
    frxdsSpisByHitech: TfrxDBDataset;
    odsSpisByHitech: TOracleDataSet;
    acPrintByVID_POM_HITECH: TAction;
    odsPrintPacSpis: TOracleDataSet;
    procedure FormCreate(Sender: TObject);
    procedure odsPacListAfterScroll(DataSet: TDataSet);
    procedure deCurDatePropertiesChange(Sender: TObject);
    procedure lcbCurMOGroupPropertiesChange(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    procedure odsPacListApplyRecord(Sender: TOracleDataSet; Action: Char;
      var Applied: Boolean; var NewRowId: string);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure frxReport1GetValue(const VarName: string; var Value: Variant);
    function frxReport1UserFunction(const MethodName: string;
      var Params: Variant): Variant;
    procedure acPrintByPacExecute(Sender: TObject);
    procedure odsPacListBeforeEdit(DataSet: TDataSet);
    procedure grPac_VID_POM_HITECHPropertiesEditValueChanged(Sender: TObject);
    procedure odsPacListAfterOpen(DataSet: TDataSet);
    procedure acPrintByVID_POM_HITECHExecute(Sender: TObject);
  private
    { Private declarations }
//    FKom, FDolKom : array of string; // должности и фамилии членов комиссии
    FZaklKom, FSpisano,
    FPred, FKom1, FKom2, FKom3, FMO, FDolMO, FUTVERJDAYU_FIO, FUTVERJDAYU_DOLJN,
    FDolPred, FDolKom1, FDolKom2, FDolKom3, FPrikaz  : string;
    FC_DATE1, FC_DATE2 : string;
  public
    { Public declarations }
    isNeedRefresh : boolean;
  end;

var
  fmSetPacSpis_HiTech: TfmSetPacSpis_HiTech;

procedure DoShowSetVidPom_HITECH;

implementation
uses
  DateUtils, fdmPrintReports, uGlobalConst, fReportInputActSpis, fViewPeriodChange;
{$R *.dfm}

procedure DoShowSetVidPom_HITECH;
begin
  frmMain.CreateChild(TfmSetPacSpis_HiTech, fmSetPacSpis_HiTech);
//  fmSetPacSpis_HiTech.acRefresh.Execute;
  fmSetPacSpis_HiTech.Show;
end;

procedure TfmSetPacSpis_HiTech.acPrintByPacExecute(Sender: TObject);
var
  i, i2 : integer;
  Params : TArrayOfParams;
  Date1, Date2 : TDate;
begin
  Date2 := StartOfTheMonth(Today)+24;
  Date1 := IncMonth(Date2,-1)+1;
  if DoShowModalPeriodChange(Date1, Date2, Date1, Date2, 'Период') = False then Exit;

  odsPrintPacSpis.Close;
  odsPrintPacSpis.SetVariable('MO_GROUP_ID', lcbCurMOGroup.EditValue);
  odsPrintPacSpis.SetVariable('PACID', odsPacList.FieldByName('FK_PACID').AsVariant);
  odsPrintPacSpis.SetVariable('DATE1', Date1);
  odsPrintPacSpis.SetVariable('DATE2', Date2);
  odsPrintPacSpis.Open;
  FC_DATE1 := DateToStr(Date1);
  FC_DATE2 := DateToStr(Date2);    

  i2 := 0;
  SetLength( Params, 1);
  Params[i2].Name := 'Председатель';
  Params[i2].Value := IniReadString(iniFileName,'Act_Spis_HITECH', 'Predsed', '');
  Params[i2].ParamType := 1;
  inc( i2 );

  i := 3; //dmMain.ConfigParams.GetParamValue('FUNC_COUNT_SPIS_CHLEN_KOM', 3);
  SetLength( Params, Length(Params)+i);
  for i := 0 to 2 do
  begin
    Params[i2].Name := 'Член ком.'+IntToStr(i+1);
    Params[i2].Value := IniReadString(iniFileName, 'Act_Spis_HITECH', 'ChlenKom'+IntToStr(i+1), '');
    Params[i2].ParamType := 1;
    inc( i2 );
  end;

  SetLength( Params, Length(Params)+1);
  Params[i2].Name := 'Мат. отв. лицо';
  Params[i2].Value := IniReadString(iniFileName,'Act_Spis_HITECH', 'MO', '');
  Params[i2].ParamType := 1;
  inc( i2 );

  SetLength( Params, Length(Params)+1);
  Params[i2].Name := 'Утверждаю (ФИО)';
  Params[i2].Value := IniReadString(iniFileName,'Act_Spis_HITECH', 'UTVERJDAYU_FIO', '');
  Params[i2].ParamType := 1;
  inc( i2 );

  SetLength( Params, Length(Params)+1);
  Params[i2].Name := 'Должн. председателя';
  Params[i2].Value := IniReadString(iniFileName,'Act_Spis_HITECH', 'DoljnChlenPredsed', '');
  Params[i2].ParamType := 0;
  inc( i2 );
  i := 3; //dmMain.ConfigParams.GetParamValue('FUNC_COUNT_SPIS_CHLEN_KOM', 3);
  SetLength( Params, Length(Params)+i);
  for i := 0 to 2 do
  begin
    Params[i2].Name := 'Должн. члена ком.'+IntToStr(i+1);
    Params[i2].Value := IniReadString(iniFileName,'Act_Spis_HITECH', 'DoljnChlenKom'+IntToStr(i+1), '');
    Params[i2].ParamType := 0;
    inc( i2 );
  end;

  SetLength( Params, Length(Params)+1);
  Params[i2].Name := 'Должность МО';
  Params[i2].Value := IniReadString(iniFileName,'Act_Spis_HITECH', 'DoljnMO', '');
  Params[i2].ParamType := 0;
  inc( i2 );

  SetLength( Params, Length(Params)+1);
  Params[i2].Name := 'Утверждаю (Должн.)';
  Params[i2].Value := IniReadString(iniFileName,'Act_Spis_HITECH', 'UTVERJDAYU_DOLJN', '');
  Params[i2].ParamType := 0;
  inc( i2 );

  for i := 0 to Length(Params) - 1 do
    if i < 6 then Params[i].ParamType := 1 else Params[i].ParamType := 0;

  FZaklKom := EncodeHexToString(IniReadString(iniFileName, 'Act_Spis_HITECH', 'ZaklKom', ''));

  FSpisano := EncodeHexToString(IniReadString(iniFileName, 'Act_Spis_HITECH', 'Spisano', ''));
  FPrikaz := IniReadString(iniFileName, 'Act_Spis_HITECH', 'PrikazOt', '"___"  ____________  20___ г  № ___');

  if DoShowReportInputActSpis(dmMain.os, Params, FZaklKom, FSpisano, FPrikaz) <> mrOk then
  begin
    FZaklKom := '';
    FSpisano := '';
    Exit;
  end;

//      IniWriteString(iniFileName, 'KOMISSIYA', 'TEXT', EncodeStringToHex(StrList.Text));
  for i := 0 to Length(Params) - 1 do
  begin
    if Params[i].Name = 'Председатель' then FPred := Params[i].Value;

    if Params[i].Name = 'Член ком.1' then FKom1 := Params[i].Value;
    if Params[i].Name = 'Член ком.2' then FKom2 := Params[i].Value;
    if Params[i].Name = 'Член ком.3' then FKom3 := Params[i].Value;  

    if Params[i].Name = 'Мат. отв. лицо' then FMO := Params[i].Value;
    if Params[i].Name = 'Утверждаю (ФИО)' then FUTVERJDAYU_FIO := Params[i].Value;

    if Params[i].Name = 'Должн. председателя' then FDolPred := Params[i].Value;

    if Params[i].Name = 'Должн. члена ком.1' then FDolKom1 := Params[i].Value;
    if Params[i].Name = 'Должн. члена ком.2' then FDolKom2 := Params[i].Value;
    if Params[i].Name = 'Должн. члена ком.3' then FDolKom3 := Params[i].Value;

    if Params[i].Name = 'Должность МО' then FDolMO := Params[i].Value;    
    if Params[i].Name = 'Утверждаю (Должн.)' then FUTVERJDAYU_DOLJN := Params[i].Value;
  end;

  IniWriteString2('Act_Spis_HITECH', 'Predsed',          FPred   );

  IniWriteString2('Act_Spis_HITECH', 'ChlenKom1',         FKom1);
  IniWriteString2('Act_Spis_HITECH', 'ChlenKom2',         FKom2);
  IniWriteString2('Act_Spis_HITECH', 'ChlenKom3',         FKom3); 

  IniWriteString2('Act_Spis_HITECH', 'MO',                FMO   );

  IniWriteString2('Act_Spis_HITECH', 'DoljnChlenPredsed', FDolPred);
  IniWriteString2('Act_Spis_HITECH', 'DoljnChlenKom1',   FDolKom1);
  IniWriteString2('Act_Spis_HITECH', 'DoljnChlenKom2',   FDolKom2);
  IniWriteString2('Act_Spis_HITECH', 'DoljnChlenKom3',   FDolKom3);
                                                                     
  IniWriteString2('Act_Spis_HITECH', 'DoljnMO',          FDolMO   );

    IniWriteString2('Act_Spis_HITECH', 'UTVERJDAYU_FIO',          FUTVERJDAYU_FIO   );
    IniWriteString2('Act_Spis_HITECH', 'UTVERJDAYU_DOLJN',          FUTVERJDAYU_DOLJN   );

  IniWriteString2('Act_Spis_HITECH', 'ZaklKom', EncodeStringToHex(FZaklKom));
  IniWriteString2('Act_Spis_HITECH', 'Spisano', EncodeStringToHex(FSpisano));
  IniWriteString2('Act_Spis_HITECH', 'PrikazOt', FPrikaz);    

  if FileExists('frxAct_Spis_HITECH_PAC.fr3') then
    frxReport1.LoadFromFile('frxAct_Spis_HITECH_PAC.fr3');

  frxReport1.AddFunction('function MONEYSTR(Summa: double): string','ctOther');
  frxReport1.AddFunction('function IniWriteString2(Section, Ident: string; Value: string) : integer');
  frxReport1.AddFunction('function GET_NAIM_KOL(aNumber: Integer; aRod : Integer): string');

  frxReport1.ShowReport;
  SetLength(Params, 0);
  odsPrintPacSpis.Close;
  FC_DATE1 := '';
  FC_DATE2 := '';   
end;

procedure TfmSetPacSpis_HiTech.acPrintByVID_POM_HITECHExecute(Sender: TObject);
var
  i, i2 : integer;
  Params : TArrayOfParams;
  Date1, Date2 : TDate;

begin
  Date2 := StartOfTheMonth(Today)+24;
  Date1 := IncMonth(Date2,-1)+1;
  if DoShowModalPeriodChange(Date1, Date2, Date1, Date2, 'Период') = False then Exit;
  odsSpisByHitech.Close;
  odsSpisByHitech.SetVariable('MO_GROUP_ID', lcbCurMOGroup.EditValue);
  odsSpisByHitech.SetVariable('VID_POM_HITECH', grPac_VID_POM_HITECH.EditValue);
  odsSpisByHitech.SetVariable('DATE1', Date1);
  odsSpisByHitech.SetVariable('DATE2', Date2);
  odsSpisByHitech.Open;
  FC_DATE1 := DateToStr(Date1);
  FC_DATE2 := DateToStr(Date2);  

  i2 := 0;
  SetLength( Params, 1);
  Params[i2].Name := 'Председатель';
  Params[i2].Value := IniReadString(iniFileName,'Act_Spis_HITECH', 'Predsed', '');
  Params[i2].ParamType := 1;
  inc( i2 );

  i := 3; //dmMain.ConfigParams.GetParamValue('FUNC_COUNT_SPIS_CHLEN_KOM', 3);
  SetLength( Params, Length(Params)+i);
  for i := 0 to 2 do
  begin
    Params[i2].Name := 'Член ком.'+IntToStr(i+1);
    Params[i2].Value := IniReadString(iniFileName, 'Act_Spis_HITECH', 'ChlenKom'+IntToStr(i+1), '');
    Params[i2].ParamType := 1;
    inc( i2 );
  end;

  SetLength( Params, Length(Params)+1);
  Params[i2].Name := 'Мат. отв. лицо';
  Params[i2].Value := IniReadString(iniFileName,'Act_Spis_HITECH', 'MO', '');
  Params[i2].ParamType := 1;
  inc( i2 );

  SetLength( Params, Length(Params)+1);
  Params[i2].Name := 'Утверждаю (ФИО)';
  Params[i2].Value := IniReadString(iniFileName,'Act_Spis_HITECH', 'UTVERJDAYU_FIO', '');
  Params[i2].ParamType := 1;
  inc( i2 );

  SetLength( Params, Length(Params)+1);
  Params[i2].Name := 'Должн. председателя';
  Params[i2].Value := IniReadString(iniFileName,'Act_Spis_HITECH', 'DoljnChlenPredsed', '');
  Params[i2].ParamType := 0;
  inc( i2 );
  i := 3; //dmMain.ConfigParams.GetParamValue('FUNC_COUNT_SPIS_CHLEN_KOM', 3);
  SetLength( Params, Length(Params)+i);
  for i := 0 to 2 do
  begin
    Params[i2].Name := 'Должн. члена ком.'+IntToStr(i+1);
    Params[i2].Value := IniReadString(iniFileName,'Act_Spis_HITECH', 'DoljnChlenKom'+IntToStr(i+1), '');
    Params[i2].ParamType := 0;
    inc( i2 );
  end;

  SetLength( Params, Length(Params)+1);
  Params[i2].Name := 'Должность МО';
  Params[i2].Value := IniReadString(iniFileName,'Act_Spis_HITECH', 'DoljnMO', '');
  Params[i2].ParamType := 0;
  inc( i2 );

  SetLength( Params, Length(Params)+1);
  Params[i2].Name := 'Утверждаю (Должн.)';
  Params[i2].Value := IniReadString(iniFileName,'Act_Spis_HITECH', 'UTVERJDAYU_DOLJN', '');
  Params[i2].ParamType := 0;
  inc( i2 );

  for i := 0 to Length(Params) - 1 do
    if i < 6 then Params[i].ParamType := 1 else Params[i].ParamType := 0;

  FZaklKom := EncodeHexToString(IniReadString(iniFileName, 'Act_Spis_HITECH', 'ZaklKom', ''));

  FSpisano := EncodeHexToString(IniReadString(iniFileName, 'Act_Spis_HITECH', 'Spisano', ''));
  FPrikaz := IniReadString(iniFileName, 'Act_Spis_HITECH', 'PrikazOt', '"___"  ____________  20___ г  № ___');

  if DoShowReportInputActSpis(dmMain.os, Params, FZaklKom, FSpisano, FPrikaz) <> mrOk then
  begin
    FZaklKom := '';
    FSpisano := '';
    Exit;
  end;

//      IniWriteString(iniFileName, 'KOMISSIYA', 'TEXT', EncodeStringToHex(StrList.Text));
  for i := 0 to Length(Params) - 1 do
  begin
    if Params[i].Name = 'Председатель' then FPred := Params[i].Value;

    if Params[i].Name = 'Член ком.1' then FKom1 := Params[i].Value;
    if Params[i].Name = 'Член ком.2' then FKom2 := Params[i].Value;
    if Params[i].Name = 'Член ком.3' then FKom3 := Params[i].Value;

    if Params[i].Name = 'Мат. отв. лицо' then FMO := Params[i].Value;

    if Params[i].Name = 'Утверждаю (ФИО)' then FUTVERJDAYU_FIO := Params[i].Value;

    if Params[i].Name = 'Должн. председателя' then FDolPred := Params[i].Value;

    if Params[i].Name = 'Должн. члена ком.1' then FDolKom1 := Params[i].Value;
    if Params[i].Name = 'Должн. члена ком.2' then FDolKom2 := Params[i].Value;
    if Params[i].Name = 'Должн. члена ком.3' then FDolKom3 := Params[i].Value;

    if Params[i].Name = 'Должность МО' then FDolMO := Params[i].Value;
    if Params[i].Name = 'Утверждаю (Должн.)' then FUTVERJDAYU_DOLJN := Params[i].Value;
  end;

  IniWriteString2('Act_Spis_HITECH', 'Predsed',          FPred   );

  IniWriteString2('Act_Spis_HITECH', 'ChlenKom1',         FKom1);
  IniWriteString2('Act_Spis_HITECH', 'ChlenKom2',         FKom2);
  IniWriteString2('Act_Spis_HITECH', 'ChlenKom3',         FKom3);

  IniWriteString2('Act_Spis_HITECH', 'MO',                FMO   );

  IniWriteString2('Act_Spis_HITECH', 'DoljnChlenPredsed', FDolPred);
  IniWriteString2('Act_Spis_HITECH', 'DoljnChlenKom1',   FDolKom1);
  IniWriteString2('Act_Spis_HITECH', 'DoljnChlenKom2',   FDolKom2);
  IniWriteString2('Act_Spis_HITECH', 'DoljnChlenKom3',   FDolKom3);
                                                                     
  IniWriteString2('Act_Spis_HITECH', 'DoljnMO',          FDolMO   );

  IniWriteString2('Act_Spis_HITECH', 'UTVERJDAYU_FIO',          FUTVERJDAYU_FIO   );
  IniWriteString2('Act_Spis_HITECH', 'UTVERJDAYU_DOLJN',        FUTVERJDAYU_DOLJN );

  IniWriteString2('Act_Spis_HITECH', 'ZaklKom', EncodeStringToHex(FZaklKom));
  IniWriteString2('Act_Spis_HITECH', 'Spisano', EncodeStringToHex(FSpisano));
  IniWriteString2('Act_Spis_HITECH', 'PrikazOt', FPrikaz);

  if FileExists('frxAct_Spis_HITECH.fr3') then
    frxAct_Spis_HITECH.LoadFromFile('frxAct_Spis_HITECH.fr3');

  frxAct_Spis_HITECH.AddFunction('function MONEYSTR(Summa: double): string','ctOther');
  frxAct_Spis_HITECH.AddFunction('function IniWriteString2(Section, Ident: string; Value: string) : integer');
  frxAct_Spis_HITECH.AddFunction('function GET_NAIM_KOL(aNumber: Integer; aRod : Integer): string');

  frxAct_Spis_HITECH.ShowReport;
  SetLength(Params, 0);
  odsSpisByHitech.Close;
  FC_DATE1 := '';
  FC_DATE2 := '';
end;

procedure TfmSetPacSpis_HiTech.acRefreshExecute(Sender: TObject);
begin
  if isNeedRefresh then
  begin
    odsPacList.AfterScroll := nil;
    odsPacList.Close;
    deCurDate.PostEditValue;
    odsPacList.SetVariable('PDATE', deCurDate.EditValue);
    odsPacList.SetVariable('FK_VRACHID', dmMain.nSotrFK_ID);
    odsPacList.SetVariable('MO_GROUP_ID', lcbCurMOGroup.EditValue);

    odsSpisanieVid.Close;
    odsSpisanieVid.Open;

    odsPacList.Open;
    odsPacList.AfterScroll := odsPacListAfterScroll;
    odsPacListAfterScroll( odsPacList );
  end;
end;

procedure TfmSetPacSpis_HiTech.odsPacListAfterOpen(DataSet: TDataSet);
begin
  acPrintByPac.Enabled := (odsPacList.RecordCount > 0);
  acPrintByVID_POM_HITECH.Enabled := (odsPacList.RecordCount > 0);  
end;

procedure TfmSetPacSpis_HiTech.odsPacListAfterScroll(DataSet: TDataSet);
begin
  odsPacSpis.Close;
  if (odsPacList.Active)and(odsPacList.RecordCount>0) then
    odsPacSpis.SetVariable('PACID', odsPacList.FieldByName('FK_PACID').AsVariant)
  else
    odsPacSpis.SetVariable('PACID', null);
  odsPacSpis.SetVariable('MO_GROUP_ID', lcbCurMOGroup.EditValue);
  odsPacSpis.Open;
end;

procedure TfmSetPacSpis_HiTech.deCurDatePropertiesChange(Sender: TObject);
begin
  acRefresh.Execute;
end;

procedure TfmSetPacSpis_HiTech.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmMain.os.Commit;
  Action := caFree;
end;

procedure TfmSetPacSpis_HiTech.FormCreate(Sender: TObject);
begin
  odsMO_GROUP.Close;
  odsMO_GROUP.Open;

  isNeedRefresh := False;
  deCurDate.EditValue := StartOfTheMonth( IncMonth(fdmMain.ServerDate(dmMain.os), -1) );
  lcbCurMOGroup.EditValue := dmMain.FK_CurMO_GROUP;
  isNeedRefresh := True;
  acRefresh.Execute;
end;

procedure TfmSetPacSpis_HiTech.frxReport1GetValue(const VarName: string; var Value: Variant);
var
  UpperCaseVarName, sTemp : string;
begin
  UpperCaseVarName := UpperCase(VarName);
//  if UpperCaseVarName = 'VAR_FC_DATE1'   then Value := DateToStr(dDate1.Date);
//  if UpperCaseVarName = 'VAR_FC_DATE2'   then Value := DateToStr(dDate2.Date);
  if UpperCaseVarName = 'VAR_FC_PAC_FIO' then Value := odsPacList.FieldByName('FC_FIO').AsString;
  if UpperCaseVarName = 'GETZAKLKOM' then Value := FZaklKom;
  if UpperCaseVarName = 'GETSPISANO' then Value := FSpisano;

  if UpperCaseVarName = 'VAR_CLIENT_NAME' then
  begin
    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'VAR_CLIENT_NAME', '');
    if sTemp = '' then
      //Value := dmPrintReports.GetValueFromTSMINI('MANAGER_DOC', 'CLIENT_NAME_SMS')
      Value := dmPrintReports.GetValueFromTSMINI('CONFIG','S_FULLNAME')
    else
      Value := sTemp;
  end;
  if UpperCaseVarName = 'VAR_PODRAZDELENIE' then Value := lcbCurMOGroup.Text;



//  if UpperCaseVarName = 'VAR_CLIENT_NAME' then Value := GetValueFromTSMINI('MANAGER_DOC', 'CLIENT_NAME_SMS')

  if UpperCaseVarName = 'PRED' then Value := FPred;
  if UpperCaseVarName = 'KOM1' then Value := FKom1;
  if UpperCaseVarName = 'KOM2' then Value := FKom2;
  if UpperCaseVarName = 'KOM3' then Value := FKom3;
  if UpperCaseVarName = 'MO'   then Value := FMO;
  if UpperCaseVarName = 'DOLPRED' then Value := FDolPred;
  if UpperCaseVarName = 'DOLKOM1' then Value := FDolKom1;
  if UpperCaseVarName = 'DOLKOM2' then Value := FDolKom2;
  if UpperCaseVarName = 'DOLKOM3' then Value := FDolKom3; 
  if UpperCaseVarName = 'DOLMO'   then Value := FDolMO;
  if UpperCaseVarName = 'PRIKAZ' then Value  := FPrikaz;
  if UpperCaseVarName = 'UTVERJDAYU_FIO' then Value  := FUTVERJDAYU_FIO;
  if UpperCaseVarName = 'UTVERJDAYU_DOLJN' then Value  := FUTVERJDAYU_DOLJN;

  if UpperCaseVarName = 'VAR_VID_POM_HITECH' then
  begin
    if odsSpisanieVid.Locate('FK_ID', grPac_VID_POM_HITECH.EditValue, []) then
      Value := odsSpisanieVid.FieldByName('FC_NAME').AsString
    else
      Value := '';
  end;

  if UpperCaseVarName = 'VAR_PAC_FIO' then
    Value := grPac_FC_FIO.EditValue;

//  if UpperCaseVarName = 'FC_NAIM_KOL' then Value := FFC_NAIM_KOL;
  if UpperCaseVarName = 'MEDOTRADE_SIGN' then Value := ReadMedotradeSign;

  if UpperCaseVarName = 'VAR_FC_DATE1' then Value := FC_DATE1;
  if UpperCaseVarName = 'VAR_FC_DATE2' then Value := FC_DATE2;
end;

function TfmSetPacSpis_HiTech.frxReport1UserFunction(const MethodName: string;
  var Params: Variant): Variant;
begin
	if UpperCase(MethodName) = 'MONEYSTR' then
	begin
		Result := fdmPrintReports.MoneyToString(Params[0], TRUE);
  end;
  if UpperCase(MethodName) = 'INIREADSTRING2' then
  begin
    Result := IniReadString2( Params[0], Params[1], Params[2] );
  end;

  if UpperCase(MethodName) = 'GETZAKLKOM' then
  begin
//    Val := GetMemoText('', self,False, 'Введите заключение комиссии', True);
    Result := FZaklKom;
  end;
  if UpperCase(MethodName) = 'GETSPISANO' then
  begin
//    Val := GetMemoText('', self,False, 'Введите описание списанных единиц', True);
    Result := FSpisano;
  end;

	if UpperCase(MethodName) = 'GET_NAIM_KOL' then
	begin
		Result := GET_NAIM_KOL(Params[0], Params[1] ); // если в отчете вызывается сама функция, то заключать строку в апостофы не надо
  end;
end;

procedure TfmSetPacSpis_HiTech.grPac_VID_POM_HITECHPropertiesEditValueChanged(
  Sender: TObject);
begin
  odsPacList.AfterScroll := odsPacListAfterScroll;
end;

procedure TfmSetPacSpis_HiTech.lcbCurMOGroupPropertiesChange(Sender: TObject);
begin
  acRefresh.Execute;
end;


procedure TfmSetPacSpis_HiTech.odsPacListApplyRecord(Sender: TOracleDataSet;
  Action: Char; var Applied: Boolean; var NewRowId: string);
begin
  case Action of
    'U' :
    begin
      dmMain.DelTTable_Links( sender.FieldByName('FK_PACID').AsVariant, 'ASU.TKARTA', sender.FieldByName('FK_VID_POM_HITECH').OldValue, 'MED.TSPISANIEVID', null );
      if VarIsNull(grPac_VID_POM_HITECH.EditValue)=False then
        dmMain.InsTTable_Links( sender.FieldByName('FK_PACID').AsVariant, 'ASU.TKARTA', grPac_VID_POM_HITECH.EditValue, 'MED.TSPISANIEVID', null );
    end;

  end;
  Applied := True;  
end;

procedure TfmSetPacSpis_HiTech.odsPacListBeforeEdit(DataSet: TDataSet);
begin
  odsPacList.AfterScroll := nil;
end;

end.
