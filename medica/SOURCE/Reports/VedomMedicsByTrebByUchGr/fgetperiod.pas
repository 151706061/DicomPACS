unit fgetperiod;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, Buttons, ActnList, ImgList,
  ComCtrls, ToolWin, Db, OracleData, Oracle, FR_DSet, FR_Class, FR_DBSet,
  DBCtrls, FR_Desgn, frOLEExl, frXMLExl, HtmlHlp, JvExMask, JvToolEdit,
  cxGraphics, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCheckComboBox, JvStringHolder, cxCheckBox,
  Menus, cxLookAndFeelPainters, cxButtons, OracleMonitor, frxClass,
  frxDBSet, frxCross, FR_Cross;

type
  TfrmGetPeriod = class(TForm)
    Panel1: TPanel;
    rbM1: TRadioButton;
    rbM2: TRadioButton;
    rbM3: TRadioButton;
    rbM4: TRadioButton;
    rbM5: TRadioButton;
    rbM6: TRadioButton;
    rbM7: TRadioButton;
    rbM8: TRadioButton;
    rbM9: TRadioButton;
    rbM10: TRadioButton;
    rbM11: TRadioButton;
    rbM12: TRadioButton;
    rbK1: TRadioButton;
    rbK2: TRadioButton;
    rbK3: TRadioButton;
    rbK4: TRadioButton;
    rbG1: TRadioButton;
    rbG2: TRadioButton;
    rbG3: TRadioButton;
    Panel2: TPanel;
    Label1: TLabel;
    dDate1: TJvDateEdit;
    dDate2: TJvDateEdit;
    Label2: TLabel;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ilImages: TImageList;
    alActions: TActionList;
    acApply: TAction;
    acCancel: TAction;
    Bevel1: TBevel;
    Bevel2: TBevel;
    frDBdsRep: TfrDBDataSet;
    frReport: TfrReport;
    os: TOracleSession;
    odsRep: TOracleDataSet;
    Panel3: TPanel;
    Label3: TLabel;
    frDesigner1: TfrDesigner;
    ods: TOracleDataSet;
    Panel4: TPanel;
    lbType: TLabel;
    odsUchGr: TOracleDataSet;
    dsType: TDataSource;
    oq: TOracleQuery;
    frXMLExcelExport1: TfrXMLExcelExport;
    frOLEExcelExport1: TfrOLEExcelExport;
    lcbMO_GROUP: TDBLookupComboBox;
    odsGroupMo: TOracleDataSet;
    odsGroupMoGROUPID: TFloatField;
    odsGroupMoFC_GROUP: TStringField;
    odsGroupMoFL_DEL: TFloatField;
    dsGroupMo: TDataSource;
    ccbUchGr: TcxCheckComboBox;
    buTypeClear: TcxButton;
    buTypeSelectAll: TcxButton;
    ToolButton3: TToolButton;
    frxDBdsRep: TfrxDBDataset;
    frxReport1: TfrxReport;
    odsTSMINI: TOracleDataSet;
    oqInitMO: TOracleQuery;
    frxReport2: TfrxReport;
    Panel5: TPanel;
    ToolButton4: TToolButton;
    chbTreb: TCheckBox;
    chbMoveOtd: TCheckBox;
    procedure rbAllClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acApplyExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure lcbCloseUp(Sender: TObject);
    procedure frReportGetValue(const ParName: String;
      var ParValue: Variant);
    procedure frReportUserFunction(const Name: String; p1, p2,
      p3: Variant; var Val: Variant);
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
    procedure odsGroupMoAfterOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure odsUchGrAfterOpen(DataSet: TDataSet);
    procedure buTypeClearClick(Sender: TObject);
    procedure buTypeSelectAllClick(Sender: TObject);
    procedure ccbMedTypePropertiesEditValueChanged(Sender: TObject);
    procedure frxReport1GetValue(const VarName: String;
      var Value: Variant);
    function frxReport1UserFunction(const MethodName: String;
      var Params: Variant): Variant;

  PRIVATE
    { Private declarations }
    FSelStr : string;
    function GetValueFromTSMINI(const aSection, aKey: string): string;
  PUBLIC
    { Public declarations }
    function GetPayTypes: String;
  end;

var
  frmGetPeriod      : TfrmGetPeriod;
  iniFileName : string;

implementation

uses Variants, IniFiles, fCheckedListEdit, uGlobalConst, SMMainAPI,
  fdmPrintSelect;
{$R *.DFM}

//var
//  sJobTitleCompiler : String;
//  sFamCompiler      : String;
//  sJobTitleChecker  : String;
//  sFamChecker       : String;

//==============================================================================
function IniReadString(sIniFile: string; Section, Ident: string; Default: string = ''): string;
var
	ini: TIniFile;
begin
	ini := TIniFile.Create(sIniFile);
	Result := ini.ReadString(Section, Ident, Default);
	ini.free;
end;

procedure IniWriteString(sIniFile: string; Section, Ident: string; val: string = '');
var
	ini: TIniFile;
begin
	ini := TIniFile.Create(sIniFile);
	ini.WriteString(Section, Ident, val);
	ini.free;
end;

function IniWriteString2(Section, Ident: string; Value: string) : integer;
begin
  IniWriteString(iniFileName, Section, Ident, Value);
  Result := 0;
end;
//==============================================================================
function TfrmGetPeriod.GetValueFromTSMINI(const aSection, aKey: string): string;
begin
  odsTSMINI.Close;
  odsTSMINI.SetVariable('ASECTION', aSection);
  odsTSMINI.SetVariable('AKEY', aKey);
  try
    odsTSMINI.Open;

    if odsTSMINI.RecordCount > 0 then
      Result := odsTSMINI.FieldByName('FC_VALUE').AsString
    else
      Result := '';
    odsTSMINI.Close;
  except
    Result := '';
  end;
end;
//==============================================================================
function TfrmGetPeriod.GetPayTypes: String;
var odsPayType : TOracleDataSet;
begin
  odsPayType := TOracleDataset.Create(nil);
  try
    odsPayType.Session := os;
    odsPayType.Sql.Text := 'SELECT * FROM MED.TPAYTYPE P ORDER BY P.FC_NAME';
    odsPayType.Open;
    While not odsPayType.Eof do
    begin
      Result := Result + odsPayType.FieldByName('FC_NAME').AsString + ',';
      odsPayType.Next;
    end;
    System.Delete(Result,Length(Result),1);
  finally
    odsPayType.Free;
  end;
end;

procedure TfrmGetPeriod.rbAllClick(Sender: TObject);
var
  cName             : string;
  dDate             : tdate;
  nMon              : word;
  nYear             : word;
begin
  cName:=uppercase(tcomponent(Sender).getnamepath);
  dDate:=0;
  decodedate(date, nYear, nMon, nMon);
  if cName = 'RBM1' then begin
    dDate:=encodedate(nYear, 1, 1);
    nMon:=1
  end
  else
    if cName = 'RBM2' then begin
      dDate:=encodedate(nYear, 2, 1);
      nMon:=1
    end
    else
      if cName = 'RBM3' then begin
        dDate:=encodedate(nYear, 3, 1);
        nMon:=1
      end
      else
        if cName = 'RBM4' then begin
          dDate:=encodedate(nYear, 4, 1);
          nMon:=1
        end
        else
          if cName = 'RBM5' then begin
            dDate:=encodedate(nYear, 5, 1);
            nMon:=1
          end
          else
            if cName = 'RBM6' then begin
              dDate:=encodedate(nYear, 6, 1);
              nMon:=1
            end
            else
              if cName = 'RBM7' then begin
                dDate:=encodedate(nYear, 7, 1);
                nMon:=1
              end
              else
                if cName = 'RBM8' then begin
                  dDate:=encodedate(nYear, 8, 1);
                  nMon:=1
                end
                else
                  if cName = 'RBM9' then begin
                    dDate:=encodedate(nYear, 9, 1);
                    nMon:=1
                  end
                  else
                    if cName = 'RBM10' then begin
                      dDate:=encodedate(nYear, 10, 1);
                      nMon:=1
                    end
                    else
                      if cName = 'RBM11' then begin
                        dDate:=encodedate(nYear, 11, 1);
                        nMon:=1
                      end
                      else
                        if cName = 'RBM12' then begin
                          dDate:=encodedate(nYear, 12, 1);
                          nMon:=1
                        end
                        else
                          if cName = 'RBK1' then begin
                            dDate:=encodedate(nYear, 1, 1);
                            nMon:=3
                          end
                          else
                            if cName = 'RBK2' then begin
                              dDate:=encodedate(nYear, 4, 1);
                              nMon:=3
                            end
                            else
                              if cName = 'RBK3' then begin
                                dDate:=encodedate(nYear, 7, 1);
                                nMon:=3
                              end
                              else
                                if cName = 'RBK4' then begin
                                  dDate:=encodedate(nYear, 10, 1);
                                  nMon:=3
                                end
                                else
                                  if cName = 'RBG1' then begin
                                    dDate:=encodedate(nYear, 1, 1);
                                    nMon:=6
                                  end
                                  else
                                    if cName = 'RBG2' then begin
                                      dDate:=encodedate(nYear, 7, 1);
                                      nMon:=6
                                    end
                                    else
                                      if cName = 'RBG3' then begin
                                        dDate:=encodedate(nYear, 1, 1);
                                        nMon:=12
                                      end;
  Self.dDate1.date:=dDate;
  Self.dDate2.date:=incmonth(dDate, nMon) - 1;
end;

procedure TfrmGetPeriod.FormCreate(Sender: TObject);
var d, FK_APPSOTR_ID: integer;
  UchgrIdStr : string;
begin
  try
//    os.LogOn;
    GetSession(os, 'ASU');
  except
    Application.MessageBox('Нет соединения с базой данных!','Ошибка',mb_ok + mb_iconerror);
    Application.Terminate;
    Abort;
  end;

  iniFileName := ChangeFileExt(Application.ExeName,'.ini');
  ods.open;
  d:=strtoint(ods.FieldByName('M').AsString);
  case d of
    1: rbm1.Checked:=true;
    2: rbm2.Checked:=true;
    3: rbm3.Checked:=true;
    4: rbm4.Checked:=true;
    5: rbm5.Checked:=true;
    6: rbm6.Checked:=true;
    7: rbm7.Checked:=true;
    8: rbm8.Checked:=true;
    9: rbm9.Checked:=true;
    10: rbm10.Checked:=true;
    11: rbm11.Checked:=true;
    12: rbm12.Checked:=true;
  else
     rbm1.Checked:=true;
  end;

  if TryStrToInt(ParamStr(1), FK_APPSOTR_ID) = False then
    FK_APPSOTR_ID := -1;
  oqInitMO.SetVariable('PAPPSOTRID', FK_APPSOTR_ID);
  oqInitMO.Execute;

  odsGroupMo.Open;
  lcbMO_GROUP.KeyValue := oqInitMO.GetVariable('nMO_GROUP');  

  odsUchGr.Open;
  Self.Caption := Application.Title;

  if GetValueFromTSMINI( 'MEDICA.EXE','FUNC_USE_MEDUCHGRP_CH') = '1' then
    UchgrIdStr := 'nvl ( k.uchgrid, M.uchgrid )'
  else
    UchgrIdStr := 'M.uchgrid';

  odsRep.SQL.Text := StringReplace(odsRep.SQL.Text, '#uchgrid#',
      UchGrIdStr, [rfReplaceAll, rfIgnoreCase] );
end;

procedure TfrmGetPeriod.acApplyExecute(Sender: TObject);
//var frmFIOTreb: TfrmFIOTreb;
var
//  IDn,
  P : TPoint;
  i  : Integer;
  IDs : string;
begin
  try
//    Self.dDate1.CheckValiddate;
  StrToDate( dDate1.Text );
  except
    on EConvertError do begin
      Application.MessageBox('Неверно введена начальная дата периода', 'Ошибка', MB_OK + MB_ICONERROR);
      Self.dDate1.SetFocus;
      Exit;
    end;
  end;
  try
//    Self.dDate2.CheckValiddate;
  StrToDate( dDate2.Text );
  except
    on EConvertError do begin
      Application.MessageBox('Неверно введена конечная дата периода', 'Ошибка', MB_OK + MB_ICONERROR);
      Self.dDate2.SetFocus;
      Exit;
    end;
  end;
  if Self.dDate1.date > Self.dDate2.date then begin
     Application.MessageBox('Неверно задан период', 'Ошибка', MB_OK + MB_ICONERROR);
    Self.dDate1.SetFocus;
    Exit;
  end;
  if ccbUchGr.Text = ccbUchGr.Properties.EmptySelectionText then begin
     Application.MessageBox('Не выбраны группы учетности', 'Ошибка', MB_OK + MB_ICONERROR);
    ccbUchGr.SetFocus;
    Exit;
  end;

  if dmPrintSelect.PrintFlag = 0 then
  begin
    P.X := 0;
    P.Y := ToolButton1.Height;
    P := ToolButton1.ClientToScreen(P);
    dmPrintSelect.pmPrintSelect.Popup(P.X, P.Y);
    Application.ProcessMessages; // только после этого срабатывает событие TdmPrintReports.miPrintToExcelClick(Sender: TObject);
  end;                           // и проставляется флаг - далее проверки на номер флага должны быть внутри каждой функции печати

  if dmPrintSelect.PrintFlag = 0 then Exit;

  try
    dDate1.Date := trunc(dDate1.Date);
    dDate2.Date := trunc(dDate2.Date);

// проверка на выбор учетной группы медикамента
//    IDn := 0;
    for i := 0 to ccbUchGr.Properties.Items.Count - 1 do
    begin
      if ccbUchGr.States[i] = cbsChecked then
      begin
//        Inc(IDn);
        IDs := IDs + ', '+IntToStr(ccbUchGr.Properties.Items[i].Tag);
      end;
    end;
    Delete(IDs, 1, 2); // удаляем первую запятую и пробел - они лишние

    if IDs = '' then
    begin
      odsRep.SQL.Text := StringReplace(odsRep.SQL.Text, '%UchGr', 'UG.uchgrid',[rfReplaceAll]);
    end
    else
    begin
      odsRep.SQL.Text := StringReplace(odsRep.SQL.Text, '%UchGr', IDs,[rfReplaceAll]);
    end;

    odsRep.Close;
    odsRep.SetVariable('Date1', dDate1.date);
    odsRep.SetVariable('Date2', dDate2.date);
    odsRep.SetVariable('MO_GROUP_ID', lcbMO_GROUP.KeyValue);

    IDs := '';
    if chbTreb.Checked then
      IDs := IDs+',2';
    if chbMoveOtd.Checked then
      IDs := IDs+',3';
    Delete(IDs,1,1);
    if IDs = '' then IDs := '2';

    odsRep.SetVariable('FP_VIDMOVE', IDs);
    odsRep.Open;

    if FileExists('VedomMedicsByTrebByUchGr.fr3') then
      frxReport1.LoadFromFile('VedomMedicsByTrebByUchGr.fr3');

    frxReport1.AddFunction('function IniWriteString2(Section, Ident: string; Value: string) : integer');

    Self.Hide;
    case dmPrintSelect.PrintFlag of // флаг куда печатать
      1: begin
           // Неронов А.С. 14.03.2011
           frxReport1.FindObject('PageFooter1').Visible := FAlse;
           TfrxHeader(frxReport1.FindObject('MasterHeader1')).ReprintOnNewPage := False;
           TfrxGroupHeader(frxReport1.FindObject('GroupHeader1')).ReprintOnNewPage := False;
           TfrxGroupHeader(frxReport1.FindObject('Band1')).ReprintOnNewPage := False;
           dmPrintSelect.frxXLSExport1.PageBreaks:=false;
           dmPrintSelect.frxXLSExport1.ExportEMF := false;
           dmPrintSelect.frxXLSExport1.ExportPictures := false;
           dmPrintSelect.frxXLSExport1.FastExport := true;
           frxReport1.PrepareReport;
           ExportFRToExcel( frxReport1, 'МАТЕРИАЛЬНЫЙ ОТЧЁТ с '+DateToStr(dDate1.Date)+' по '+DateToStr(dDate2.Date)+'.xls' );
         end;
      2: begin
           frxReport1.PrepareReport;
           frxReport1.ShowReport;
         end;
    end;

  finally
    dmPrintSelect.PrintFlag := 0;
    Close;
  end;
end;

procedure TfrmGetPeriod.acCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmGetPeriod.lcbCloseUp(Sender: TObject);
begin
  acApply.Enabled := (lcbMO_GROUP.Text <> '') and (ccbUchGr.Text <> 'Не выбрано');//(lcbType.Text <> '');
  lcbMO_GROUP.Hint := lcbMO_GROUP.Text;
end;

procedure TfrmGetPeriod.frReportGetValue(const ParName: String;
  var ParValue: Variant);
begin
  if ParName = 'Date1' then ParValue := DateTimeToStr(dDate1.Date)

  else if ParName = 'Date2' then ParValue := DateTimeToStr(dDate2.Date)
  //заполнение переменных о составителе и о проверяющем
//  else if ParName = 'JobTitleCompiler' then ParValue := sJobTitleCompiler
//  else if ParName = 'FamCompiler' then ParValue := sFamCompiler
//  else if ParName = 'JobTitleChecker' then ParValue := sJobTitleChecker
//  else if ParName = 'FamChecker' then ParValue := sFamChecker
  else if ParName = 'var_paytypes' then
  begin
    ParValue := GetPayTypes;
  end
  else if ParName = 'var_receiver' then
  begin
    with TOracleQuery.Create(nil) do
    try
      Session := Os;
      Sql.Text := 'SELECT FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''MANAGER_DOC'' AND FC_KEY = ''CLIENT_NAME''';
      try
        Execute;
        ParValue := Field(0);
      except
        ParValue := '';
      end;
    finally
      Free;
    end;
  end
  else if ParName = 'var_podpisano' then
    ParValue := FSelStr;
end;

procedure TfrmGetPeriod.frReportUserFunction(const Name: String; p1, p2,
  p3: Variant; var Val: Variant);
var
	d : string;
begin
	if name = 'MYSTRTOFLOAT' then
	begin
		d := frParser.Calc(p1);
		val:=StringReplace(d,',', '.',[rfReplaceAll]);
	end;
end;

function TfrmGetPeriod.FormHelp(Command: Word; Data: Integer;
  var CallHelp: Boolean): Boolean;
begin
Result := False;
  try
    // TODo Подумать насчет праметра  Command
		if Data = -1 then
			HtmlHelp(0, 'StMedsestra.chm', HH_DISPLAY_TOPIC, 0)
    else
      HtmlHelp(0, 'StMedsestra.chm', HH_HELP_CONTEXT, Data);
    CallHelp := False;
    Result := True;
  except
    on EConvertError do
      ShowMessage('Справка не найдена');
  end;
end;

procedure TfrmGetPeriod.odsGroupMoAfterOpen(DataSet: TDataSet);
begin
  lcbMO_GROUP.KeyValue := StrToInt(IniReadString(iniFileName,'Params', 'LastMOGroupID', '-1'));
  lcbCloseUp(nil);
end;

procedure TfrmGetPeriod.odsUchGrAfterOpen(DataSet: TDataSet);
var
  ChBox : TcxCheckComboBoxItem;
  StrList : TStrings;
  i : Integer;
  sID : string;
begin
//  lcbType.KeyValue := StrToInt(IniReadString(ChangeFileExt(Application.ExeName,'.ini'),'Params', 'LastTypeID', '-1'));
  StrList := TStringList.Create;
  StrList.Text := StringToListStr(IniReadString(iniFileName,'Params', 'ccbUchGr', '-1'));
  odsUchGr.First;  // записываем все типы медикаментов в чеклист
  ccbUchGr.Properties.Items.Clear;
  while not odsUchGr.Eof do
  begin
    ChBox := ccbUchGr.Properties.Items.Add;
    ChBox.Description := odsUchGr.FieldByName('FC_UCHGR').AsString;
    ChBox.Tag := odsUchGr.FieldByName('UCHGRID').AsInteger; // в теге храним ID типа
    // проставляем галочку на текущем чекбоксе
    sID := IntToStr( ChBox.Tag );
    i := 0;
    while (i < StrList.Count)and(sID <> StrList.Strings[i]) do
      Inc( i );
    if (i < StrList.Count) then ccbUchGr.States[ ChBox.Index ] := cbsChecked else ccbUchGr.States[ ChBox.Index ] := cbsUnchecked;
    odsUchGr.Next;
  end;
  odsUchGr.First;
  StrList.Free;

  lcbCloseUp(nil);
end;

procedure TfrmGetPeriod.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  IDs : string;
  i : Integer;
begin
  IniWriteString(iniFileName,'Params', 'LastMOGroupID', IntToStr(lcbMO_GROUP.KeyValue));

  IDs := '';
  for i := 0 to ccbUchGr.Properties.Items.Count - 1 do
  begin
    if ccbUchGr.States[i] = cbsChecked then
      IDs := IDs + '|'+IntToStr(ccbUchGr.Properties.Items[i].Tag);
  end;
  Delete(IDs, 1, 1);
  IniWriteString(iniFileName,'Params', 'ccbUchGr', IDs);
  //  IniWriteString(ChangeFileExt(Application.ExeName,'.ini'),'Params', 'LastTypeID',    IntToStr(lcbType.KeyValue));
  
  Action := caFree;
end;

procedure TfrmGetPeriod.buTypeClearClick(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to ccbUchGr.Properties.Items.Count - 1 do
    ccbUchGr.States[i] := cbsUnChecked;
end;

procedure TfrmGetPeriod.buTypeSelectAllClick(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to ccbUchGr.Properties.Items.Count - 1 do
    ccbUchGr.States[i] := cbsChecked;
end;

procedure TfrmGetPeriod.ccbMedTypePropertiesEditValueChanged( Sender: TObject );
begin
  lcbCloseUp( nil );
  ccbUchGr.Hint := ccbUchGr.Text; 
end;

procedure TfrmGetPeriod.frxReport1GetValue(const VarName: String; var Value: Variant);
var
  UpperCaseVarName, sTemp : string;

begin
  UpperCaseVarName := UpperCase(VarName);
  if UpperCaseVarName = 'FD_DATE1' then Value := dDate1.Date
  else
  if UpperCaseVarName = 'FD_DATE2' then Value := dDate2.Date
  else
  if UpperCaseVarName = 'FC_OTD_NAME' then Value := lcbMO_GROUP.Text;
  if UpperCaseVarName = 'VAR_ZAV_APTEKA' then
  begin
    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'VAR_ZAV_APTEKA', '');
    if sTemp = '' then
      Value := GetValueFromTSMINI('MANAGER_DOC', 'ZAV_APTEKA')
    else
      Value := sTemp;
  end;
  if UpperCaseVarName = 'VAR_ZAV_APTEKA_DOLJNOST' then
  begin
    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'VAR_ZAV_APTEKA_DOLJNOST', '');
    if sTemp = '' then
      Value := GetValueFromTSMINI('MANAGER_DOC', 'VAR_ZAV_APTEKA_DOLJNOST')
    else
      Value := sTemp;
  end;
  if UpperCaseVarName = 'VAR_DOLJNOST2' then
  begin
    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'VAR_DOLJNOST2', '');
    if sTemp = '' then
      Value := GetValueFromTSMINI('MANAGER_DOC', 'VAR_DOLJNOST2')
    else
      Value := sTemp;
  end;
  if UpperCaseVarName = 'VAR_FIO2' then
  begin
    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'VAR_FIO2', '');
    if sTemp = '' then
      Value := GetValueFromTSMINI('MANAGER_DOC', 'VAR_FIO2')
    else
      Value := sTemp;
  end;

  if UpperCaseVarName = 'MEDOTRADE_SIGN' then Value := ReadMedotradeSign;
end;

function TfrmGetPeriod.frxReport1UserFunction(const MethodName: String;
  var Params: Variant): Variant;
begin
  if UpperCase(MethodName) = 'INIWRITESTRING2' then
  begin
    Result := IniWriteString2( Params[0], Params[1], Params[2] );
  end;
end;

end.

