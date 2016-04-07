
unit fgetperiod;

interface

uses Windows, FR_DSet, FR_DBSet, Db,
  FR_Class, frOLEExl, frXMLExl, FR_Desgn, OracleData, Oracle, Classes,
  ActnList, ImgList, Controls, DBCtrls, ComCtrls, ToolWin, StdCtrls,
  ExtCtrls, Forms, HtmlHlp, JvExMask, JvToolEdit, Mask, OracleMonitor,
  cxGraphics, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, dxSkinsCore,
  dxSkinsDefaultPainters, Menus, cxLookAndFeelPainters, cxButtons,
  cxCheckComboBox, fdmPrintSelect, frxClass, frxDBSet;

//const NullDate = -700000;

type
  TfrmGetPeriod = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ilImages: TImageList;
    alActions: TActionList;
    aSave: TAction;
    aCancel: TAction;
    os: TOracleSession;
    Panel3: TPanel;
    odsMedic: TOracleDataSet;
    dsMedic: TDataSource;
    acExcelExport: TAction;
    Panel1: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
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
    Panel4: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    dDate1: TJvDateEdit;
    dDate2: TJvDateEdit;
    Panel2: TPanel;
    Label1: TLabel;
    lcbMO_GROUP: TDBLookupComboBox;
    odsGroupMo: TOracleDataSet;
    dsGroupMo: TDataSource;
    ods: TOracleDataSet;
    lcbMedic: TcxLookupComboBox;
    oqInitMO: TOracleQuery;
    rbuMedic: TRadioButton;
    rbuUchGr: TRadioButton;
    ccbMedType: TcxCheckComboBox;
    buTypeClear: TcxButton;
    buTypeSelectAll: TcxButton;
    odsUchGr: TOracleDataSet;
    oqPKG_SMINI: TOracleQuery;
    dsfrxOstNach: TfrxDBDataset;
    frxReport: TfrxReport;
    odsOstNach: TOracleDataSet;
    odsPrih: TOracleDataSet;
    dsfrxPrih: TfrxDBDataset;
    dsfrxRashTreb: TfrxDBDataset;
    odsRashTreb: TOracleDataSet;
    dsfrxVozvrat: TfrxDBDataset;
    odsVozvrat: TOracleDataSet;
    dsfrxSpis: TfrxDBDataset;
    odsSpis: TOracleDataSet;
    odsOstKon: TOracleDataSet;
    dsfrxOstKon: TfrxDBDataset;
    odsPrihOtd: TOracleDataSet;
    dsfrxPrihOtd: TfrxDBDataset;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure frRepUserFunction(const Name: String; p1, p2, p3: Variant;
      var Val: Variant);
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
    procedure odsMedicAfterOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rbAllClick(Sender: TObject);
    procedure lcbCloseUp(Sender: TObject);
    procedure odsGroupMoAfterOpen(DataSet: TDataSet);
    procedure rbuMedicClick(Sender: TObject);
    procedure rbuUchGrClick(Sender: TObject);
    procedure odsUchGrAfterOpen(DataSet: TDataSet);
    procedure buTypeClearClick(Sender: TObject);
    procedure buTypeSelectAllClick(Sender: TObject);
    procedure frxReportGetValue(const VarName: string; var Value: Variant);
    function frxReportUserFunction(const MethodName: string;
      var Params: Variant): Variant;

  private
    { Private declarations }
    FLang: array[0..KL_NAMELENGTH] of char; //Раскладка клавиатуры

  procedure UploadToExcel(ADataSet1, ADataSet2, ADataSet3, ADataSet4: TOracleDataSet; ADate1, ADate2: TDateTime; aFileName : string);
    function READSTRING_TSMINI(aFC_SECTION, aFC_KEY,
      aFC_DEFAULT_VALUE: string): string;
    function WRITESTRING_TSMINI(aFC_SECTION, aFC_KEY,
      aFC_VALUE: string): string;

  PUBLIC
    iniFileName : string;
    { Public declarations }
  end;




var
  frmGetPeriod      : TfrmGetPeriod; 
  FK_APPSOTR_ID     : Integer;

implementation

uses Sysutils, Variants, IniFiles, ComObj, uGlobalConst,
     SMMainAPI, fCheckedListEdit, fInputEdit;

{$R *.DFM}
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

function TfrmGetPeriod.READSTRING_TSMINI(aFC_SECTION, aFC_KEY, aFC_DEFAULT_VALUE: string): string;
begin
  try
    oqPKG_SMINI.ClearVariables;
    oqPKG_SMINI.SetVariable('PSECTION', aFC_SECTION);
    oqPKG_SMINI.SetVariable('PIDENT',   aFC_KEY);
    oqPKG_SMINI.SetVariable('PDEFAULT', aFC_DEFAULT_VALUE);

    oqPKG_SMINI.Execute;
    Result := oqPKG_SMINI.GetVariable('PVALUE');
  except
    Result := aFC_DEFAULT_VALUE;
  end;
end;

function TfrmGetPeriod.WRITESTRING_TSMINI(aFC_SECTION, aFC_KEY, aFC_VALUE: string): string;
begin
  oqPKG_SMINI.ClearVariables;
  oqPKG_SMINI.SetVariable('PSECTION', aFC_SECTION);
  oqPKG_SMINI.SetVariable('PIDENT',   aFC_KEY);
  oqPKG_SMINI.SetVariable('PVALUE',   aFC_VALUE);

  oqPKG_SMINI.Execute;
end;

//==============================================================================
procedure TfrmGetPeriod.aSaveExecute(Sender: TObject);
var
  P : TPoint;
  IDn, i : integer;
  IDs : string;
begin
  //lcbMedic.PostEditValue; //  lcbMedic.CloseUp(True);
  lcbMO_GROUP.CloseUp(True);
  try
//    Self.dDate1.CheckValiddate;
  StrToDate(dDate1.Text);
  except
    on EConvertError do begin
      Application.MessageBox('Неверно введена начальная дата периода', 'Ошибка', MB_OK + MB_ICONERROR);
      Self.dDate1.SetFocus;
      Exit;
    end;
  end;
  try
//    Self.dDate2.CheckValiddate;
  StrToDate(dDate2.Text);
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

    /////////////////////////////////
    if FileExists('RepPrihRashBySumByUchGr.fr3') then            // если найден файл
      frxReport.LoadFromFile('RepPrihRashBySumByUchGr.fr3');  // загружаем его

    //Остаток на начало периода
    oqInitMO.SetVariable('PAPPSOTRID', FK_APPSOTR_ID);
    oqInitMO.SetVariable('pDate2', dDate1.Date-1);  // чтобы получить на начало dDate1.Date, т.к. в запросе TRUNC
    oqInitMO.Execute;

    odsOstNach.Close;
    odsOstNach.Open;

    //Приход
    {oqInitMO.SetVariable('PAPPSOTRID', FK_APPSOTR_ID);
    oqInitMO.SetVariable('pDate1', dDate1.Date);
    oqInitMO.SetVariable('pDate2', dDate2.Date);
    oqInitMO.Execute;  }

    odsPrih.Close;
    odsPrih.SetVariable('DATE1',dDate1.Date);
    odsPrih.SetVariable('DATE2',dDate2.Date);
    odsPrih.SetVariable('MOGROUPID',lcbMO_GROUP.KeyValue);
    odsPrih.Open;     

    odsPrihOtd.Close;
    odsPrihOtd.SetVariable('DATE1',dDate1.Date);
    odsPrihOtd.SetVariable('DATE2',dDate2.Date);
    odsPrihOtd.SetVariable('MOGROUPID',lcbMO_GROUP.KeyValue);
    odsPrihOtd.Open;


    //Отпущено по требованию
    odsRashTreb.Close;
    odsRashTreb.SetVariable('DATE1',dDate1.Date);
    odsRashTreb.SetVariable('DATE2',dDate2.Date);
    odsRashTreb.SetVariable('MOGROUPID',lcbMO_GROUP.KeyValue);
    odsRashTreb.Open;

    //Возврат
    odsVozvrat.Close;
    odsVozvrat.SetVariable('DATE1',dDate1.Date);
    odsVozvrat.SetVariable('DATE2',dDate2.Date);
    odsVozvrat.SetVariable('MOGROUPID',lcbMO_GROUP.KeyValue);
    odsVozvrat.Open;

    //Списание
    odsSpis.Close;
    odsSpis.SetVariable('DATE1',dDate1.Date);
    odsSpis.SetVariable('DATE2',dDate2.Date);
    odsSpis.SetVariable('MOGROUPID',lcbMO_GROUP.KeyValue);
    odsSpis.Open;
    
    //Остаток на конец периода
    oqInitMO.SetVariable('PAPPSOTRID', FK_APPSOTR_ID);
    oqInitMO.SetVariable('pDate2', dDate2.Date);
    oqInitMO.Execute;

    odsOstKon.Close;
    odsOstKon.Open;
    /////////////////////////////////

    Self.Hide;
    frxReport.AddFunction('function DO_SHOW_SELECT_STR(const aFC_TEXT : string) : string'); 
    frxReport.AddFunction('procedure INI_WRITE_STR(const aKey, aValue : string)');
    frxReport.AddFunction('function INI_READ_STR(const aKey, aDefault : string)');
    frxReport.PrepareReport;
    case dmPrintSelect.PrintFlag of // флаг куда печатать
      1: ExportFRToExcel( frxReport, 'МАТЕРИАЛЬНЫЙ ОТЧЁТ с '+DateToStr(dDate1.Date)+' по '+DateToStr(dDate2.Date)+'.xls' );
      2: frxReport.ShowReport;
    end;


  finally
    dmPrintSelect.PrintFlag := 0;
    Close;
  end;

end;

procedure TfrmGetPeriod.buTypeClearClick(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to ccbMedType.Properties.Items.Count - 1 do
    ccbMedType.States[i] := cbsUnChecked;
end;

procedure TfrmGetPeriod.buTypeSelectAllClick(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to ccbMedType.Properties.Items.Count - 1 do
    ccbMedType.States[i] := cbsChecked;
end;

procedure TfrmGetPeriod.aCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmGetPeriod.FormCreate(Sender: TObject);
var
  d : Integer;
  UchgridStr : string;
begin

  try
//    os.LogOn;
    GetSession(os, 'ASU');
  except
    Application.MessageBox('Нет соединения с базой данных!','Ошибка',mb_ok + mb_iconerror);
    Application.Terminate;
    Abort;
  end;
  iniFileName := Application.ExeName+'.ini';

  ods.Open;
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
  oqInitMO.SetVariable('pDate2', trunc(now));
  oqInitMO.Execute;

  odsGroupMo.Open;
  lcbMO_GROUP.KeyValue := oqInitMO.GetVariable('nMO_GROUP');
  lcbMO_GROUP.Enabled :=  (oqInitMO.GetVariable('PFL_PROVIZOR') = 1);

  odsMedic.Open;
  //Запоминаем текущюю раскладку
  GetKeyboardLayoutName(FLang);
  //Загружаем русскую раскладку клавиатуры
  LoadKeyboardLayout(PChar('00000419'), KLF_ACTIVATE);
  Self.Caption := Application.Title;

  ccbMedType.PopupWindow.DoubleBuffered := True;
  odsUchGr.Open;

  if READSTRING_TSMINI( 'MEDICA.EXE','FUNC_USE_MEDUCHGRP_CH','0' )='1' then
    UchgridStr := 'nvl (k.UCHGRID, m.UCHGRID)'
  else
    UchgridStr := 'm.UCHGRID';

  odsOstNach.SQL.Text := StringReplace(odsOstNach.SQL.Text, '#uchgrid#',
      UchGrIdStr, [rfReplaceAll, rfIgnoreCase] );

  odsPrih.SQL.Text := StringReplace(odsPrih.SQL.Text, '#uchgrid#',
      UchGrIdStr, [rfReplaceAll, rfIgnoreCase] );
  odsPrihOtd.SQL.Text := StringReplace(odsPrihOtd.SQL.Text, '#uchgrid#',
      UchGrIdStr, [rfReplaceAll, rfIgnoreCase] );
  odsRashTreb.SQL.Text := StringReplace(odsRashTreb.SQL.Text, '#uchgrid#',
      UchGrIdStr, [rfReplaceAll, rfIgnoreCase] );
  odsVozvrat.SQL.Text := StringReplace(odsVozvrat.SQL.Text, '#uchgrid#',
      UchGrIdStr, [rfReplaceAll, rfIgnoreCase] );
  odsSpis.SQL.Text := StringReplace(odsSpis.SQL.Text, '#uchgrid#',
      UchGrIdStr, [rfReplaceAll, rfIgnoreCase] );
  odsOstKon.SQL.Text := StringReplace(odsOstKon.SQL.Text, '#uchgrid#',
      UchGrIdStr, [rfReplaceAll, rfIgnoreCase] );
end;

procedure TfrmGetPeriod.frRepUserFunction(const Name: String; p1, p2,
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

procedure TfrmGetPeriod.frxReportGetValue(const VarName: string; var Value: Variant);
var
  sTemp : string;
begin
  if VarName = 'Date1' then Value := DateTimeToStr(dDate1.Date);
  if VarName = 'Date2' then Value := DateTimeToStr(dDate2.Date);
  if VarName = 'MEDOTRADE_SIGN' then Value := ReadMedotradeSign;

 if VarName = 'VAR_GLAV_BUH' then
  begin
    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'GLAV_BUH', '');
    if sTemp = '' then
      Value := READSTRING_TSMINI('MANAGER_DOC', 'GLAV_BUH', '')
    else
      Value := sTemp;
  end;
  
  if VarName = 'VAR_BUHGALTER' then
  begin
    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'BUHGALTER', '');
    if sTemp = '' then
      Value := READSTRING_TSMINI('MANAGER_DOC', 'BUHGALTER', '')
    else
      Value := sTemp;
  end;

  if VarName = 'VAR_GLAV_VRACH' then
  begin
    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'GLAV_VRACH', '');
    if sTemp = '' then
      Value := READSTRING_TSMINI('MANAGER_DOC', 'GLAV_VRACH', '')
    else
      Value := sTemp;
  end;

  if VarName = 'VAR_ZAV_APTEKA' then
  begin
    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'VAR_ZAV_APTEKA', '');
    if sTemp = '' then
      Value := READSTRING_TSMINI('MANAGER_DOC', 'ZAV_APTEKA', '')
    else
      Value := sTemp;
  end;

  if VarName = 'VAR_MO' then Value := oqInitMO.GetVariable('PFC_NAME');

  if VarName = 'var_receiver' then
  begin
    Value := READSTRING_TSMINI ( 'MANAGER_DOC', 'CLIENT_NAME', '' );
  end;

end;

function TfrmGetPeriod.frxReportUserFunction(const MethodName: string;
  var Params: Variant): Variant;
var s: String;
begin
  if UpperCase(MethodName) = 'DO_SHOW_SELECT_STR' then
  begin
    s := Params[0];
    DoShowInputEdit(s,'Ввод значения');
    Result := s;
  end;
  if UpperCase(MethodName) = 'INI_WRITE_STR' then
  begin
    IniWriteString(Self.iniFileName,'REP_STRS',Params[0],Params[1]);
  end;
  if UpperCase(MethodName) = 'INI_READ_STR' then
  begin
    Result := IniReadString(Self.iniFileName,'REP_STRS',Params[0],Params[1]);
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
  end;
end;

procedure TfrmGetPeriod.odsMedicAfterOpen(DataSet: TDataSet);
begin
  lcbMedic.EditValue := StrToInt(IniReadString(iniFileName,'Params', 'lcbMedic', '-1'));
  lcbCloseUp(nil);
end;

procedure TfrmGetPeriod.odsUchGrAfterOpen(DataSet: TDataSet);
var
  ChBox : TcxCheckComboBoxItem;
  StrList : TStrings;
  i : Integer;
  sID : string;
begin
  StrList := TStringList.Create;
  StrList.Text := StringToListStr(IniReadString(iniFileName,'Params', 'LastTypeID', '-1'));
  odsUchGr.First;  // запоминаем все типы медикаментов
  ccbMedType.Properties.Items.Clear;
  while not odsUchGr.Eof do
  begin
    ChBox := ccbMedType.Properties.Items.Add;
    ChBox.Description := odsUchGr.FieldByName('FC_UCHGR').AsString;
    ChBox.Tag := odsUchGr.FieldByName('UCHGRID').AsInteger; // в теге храним ID типа
    // проставляем галочку на текущем чекбоксе
    sID := IntToStr( ChBox.Tag );
    i := 0;
    while (i < StrList.Count)and(sID <> StrList.Strings[i]) do
      Inc( i );
    if (i < StrList.Count) then ccbMedType.States[ ChBox.Index ] := cbsChecked else ccbMedType.States[ ChBox.Index ] := cbsUnchecked;
    odsUchGr.Next;
  end;
  odsUchGr.First;
  StrList.Free;

  lcbCloseUp(nil);
end;

procedure TfrmGetPeriod.odsGroupMoAfterOpen( DataSet: TDataSet );
begin
  lcbMO_GROUP.KeyValue := StrToInt(IniReadString(iniFileName,'Params', 'lcbMO_GROUP', '-1'));
  lcbCloseUp(nil);  
end;

procedure TfrmGetPeriod.FormClose(Sender: TObject; var Action: TCloseAction);
var
  IDs : string;
  i : Integer;
begin
  IDs := '';
  for i := 0 to ccbMedType.Properties.Items.Count - 1 do
  begin
    if ccbMedType.States[i] = cbsChecked then
      IDs := IDs + '|'+IntToStr(ccbMedType.Properties.Items[i].Tag);
  end;
  Delete(IDs, 1, 1);
  IniWriteString(iniFileName,'Params', 'LastTypeID', IDs);

  IniWriteString(iniFileName,'Params', 'lcbMedic', IntToStr(lcbMedic.EditValue));
  IniWriteString(iniFileName,'Params', 'lcbMO_GROUP', IntToStr(lcbMO_GROUP.KeyValue));
  LoadKeyboardLayout(FLang, KLF_ACTIVATE);
  Action := caFree;
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

procedure TfrmGetPeriod.rbuMedicClick(Sender: TObject);
begin
  ccbMedType.Hide;
  buTypeClear.Hide;
  buTypeSelectAll.Hide;

  lcbMedic.Show;
end;

procedure TfrmGetPeriod.rbuUchGrClick(Sender: TObject);
begin
  ccbMedType.Show;
  buTypeClear.Show;
  buTypeSelectAll.Show;

  lcbMedic.Hide;
end;

procedure TfrmGetPeriod.lcbCloseUp(Sender: TObject);
begin
  aSave.Enabled := (lcbMO_GROUP.KeyValue >= 0);//and(lcbMedic.EditValue >= 0);
  lcbMO_GROUP.Hint := lcbMO_GROUP.Text;
end;

procedure TfrmGetPeriod.UploadToExcel(ADataSet1, ADataSet2, ADataSet3, ADataSet4: TOracleDataSet; ADate1, ADate2: TDateTime; aFileName : string);

 procedure SaveResToFile(AResName, AType, AFileName: String);
 var
  ResHandle: THandle;
  MemHandle: THandle;
  ResPtr   : Pointer;
  ResSize  : Integer;
  Stream   : TMemoryStream;
 begin
  ResHandle:=FindResource(hInstance, PChar(AResName), PChar(AType));
  MemHandle:=LoadResource(hInstance, ResHandle);
  ResPtr:=LockResource(MemHandle);
  ResSize:=SizeOfResource(hInstance, ResHandle);
  Stream:=TMemoryStream.Create;
  Stream.SetSize(ResSize);
  Stream.Write(ResPtr^, ResSize);
  Stream.SaveToFile(AFileName);
  FreeResource(MemHandle);
  Stream.Free;
 end;

 function GetOneRow1(A0, A1, A2, A3, A4, A5, A6: String): String;
 begin
  Result:=
  '<tr height=17 style=''height:12.75pt''>'+
  ' <td class=xl3227546 style=''border-top:none''>'+A0+' </td>'+
  ' <td class=xl3227546 style=''border-top:none;border-left:none''>'+A1+' </td>'+
  ' <td class=xl2227546 style=''border-top:none;border-left:none''>'+A2+' </td>'+
  ' <td class=xl2227546 style=''border-top:none;border-left:none''>'+A3+' </td>'+
  ' <td class=xl2327546 style=''border-top:none;border-left:none''>'+A4+' </td>'+
  ' <td class=xl2227546 style=''border-top:none;border-left:none''>'+A5+' </td>'+
  ' <td class=xl2327546 style=''border-top:none;border-left:none''>'+A6+' </td>'+
  '</tr>';
 end;

 function GetOneRow2(A0, A1, A2, A3, A4, A5, A6: String): String;
 begin
  Result:=
  '<tr height=17 style=''mso-height-source:userset;height:12.75pt''>'+
  ' <td class=xl3627546 width=43 style=''border-top:none;width:32pt''>'+A0+' </td>'+
  ' <td class=xl3627546 width=231 style=''border-top:none;border-left:none;width:154pt''>'+A1+' </td>'+
  ' <td class=xl3727546 width=75 style=''border-top:none;border-left:none;width:56pt''>'+A2+' </td>'+
  ' <td class=xl3727546 width=75 style=''border-top:none;border-left:none;width:56pt''>'+A3+' </td>'+
  ' <td class=xl3727546 width=96 style=''border-top:none;border-left:none;width:64pt''>'+A4+' </td>'+
  ' <td class=xl2227546 width=75 style=''border-top:none;border-left:none;width:56pt''>'+A5+' </td>'+
  ' <td class=xl2327546 width=96 style=''border-top:none;border-left:none;width:64pt''>'+A6+' </td>'+
  '</tr>';
 end;

 function GetSumRow2(A1, A2: String): String;
 begin
  Result:=
  '<tr height=17 style=''height:12.75pt''>'+
  ' <td class=xl3827546 style=''border-top:none''>&nbsp;</td>'+
  ' <td class=xl4827546 style=''border-top:none''>&nbsp;</td>'+
  ' <td class=xl4827546 style=''border-top:none''>&nbsp;</td>'+
  ' <td class=xl4827546 style=''border-top:none''>&nbsp;</td>'+
  ' <td class=xl4927546 style=''border-top:none''>Итого:</td>'+
  ' <td class=xl3127546 style=''border-top:none;border-left:none''>'+A1+' </td>'+
  ' <td class=xl2327546 style=''border-top:none''>'+A2+' </td>'+
  '</tr>';
 end;

 function GetOneRow3(A0, A1, A2, A3, A4, A5, A6: String): String;
 begin
  Result:=
  '<tr height=17 style=''mso-height-source:userset;height:12.75pt''>'+
  ' <td class=xl3227546 style=''border-top:none''>'+A0+' </td>'+
  ' <td class=xl3227546 style=''border-top:none;border-left:none''>'+A1+' </td>'+
  ' <td colspan=2 class=xl2227546 style=''border-top:none;border-left:none''>'+A2+' </td>'+
  ' <td class=xl5027546 style=''border-right:.5pt solid black; border-left:none''>'+A3+' </td>'+
  ' <td class=xl2227546 style=''border-top:none;border-left:none''>'+A5+' </td>'+
  ' <td class=xl2327546 style=''border-top:none;border-left:none''>'+A6+' </td>'+
  '<td width=150 class=xl2427546  style=''font-size:8.0pt; font-weight:400; font-style:normal; font-family:"Arial Cyr"; color:white;''>'+A2+'</td>'+
  '</tr>';
 end;

 function GetSumRow3(A1, A2: String): String;
 begin
  Result:=
  '<tr height=17 style=''height:12.75pt''>'+
  ' <td class=xl3827546 style=''border-top:none''>&nbsp;</td>'+
  ' <td class=xl4827546 style=''border-top:none''>&nbsp;</td>'+
  ' <td class=xl4827546 style=''border-top:none''>&nbsp;</td>'+
  ' <td class=xl4827546 style=''border-top:none''>&nbsp;</td>'+
  ' <td class=xl4927546 style=''border-top:none''>Итого:</td>'+
  ' <td class=xl2227546 style=''border-top:none;border-left:none''>'+A1+' </td>'+
  ' <td class=xl3027546 style=''border-top:none''>'+A2+' </td>'+
  '</tr>';
 end;

 function GetOneRow4(A0, A1, A2, A3, A4, A5, A6: String): String;
 begin
  Result:=
  '<tr height=17 style=''mso-height-source:userset;height:12.75pt''>'+
  ' <td class=xl3227546 style=''border-top:none''>'+A0+' </td>'+
  ' <td class=xl3227546 style=''border-top:none;border-left:none''>'+A1+' </td>'+
  ' <td colspan=2 class=xl2227546 style=''border-top:none;border-left:none''>'+A2+' </td>'+
  ' <td class=xl5027546 style=''border-right:.5pt solid black;'+
  ' border-left:none''>'+A3+' </td>'+
  ' <td class=xl2227546 style=''border-top:none;border-left:none''>'+A5+' </td>'+
  ' <td class=xl2327546 style=''border-top:none;border-left:none''>'+A6+' </td>'+
  '<td width=150 class=xl2427546  style=''font-size:8.0pt; font-weight:400; font-style:normal; font-family:"Arial Cyr"; color:white;''>'+A2+'</td>'+
  '</tr>';
 end;

 function GetSumRow4(A1, A2: String): String;
 begin
  Result:=
  '<tr height=17 style=''height:12.75pt''>'+
  ' <td class=xl3827546 style=''border-top:none''>&nbsp;</td>'+
  ' <td class=xl4827546 style=''border-top:none''>&nbsp;</td>'+
  ' <td class=xl4827546 style=''border-top:none''>&nbsp;</td>'+
  ' <td class=xl4827546 style=''border-top:none''>&nbsp;</td>'+
  ' <td class=xl4927546 style=''border-top:none''>Итого:</td>'+
  ' <td class=xl2227546 style=''border-top:none;border-left:none''>'+A1+' </td>'+
  ' <td class=xl3027546 style=''border-top:none''>'+A2+' </td>'+
  '</tr>';
 end;

var
 S1, S2, S3, S4: String;
 N, {nCount,} RecCount1, RecCount2, RecCount3, RecCount4: Integer;
 sFileName1, sFileName2: String;
 Excel: Variant;
 nS1, nS2: Currency;
 nI1, nI2: Currency;
begin
 Screen.Cursor:=crHourGlass;

 S1:=''; S2:=''; S3:=''; S4:='';
 N:=0;
// nS1:=0; nS2:=0;
 nI1:=0; nI2:=0;
// nCount:=0;

 with ADataSet1 do begin
  if Active then Close;
  Open; First;
  RecCount1 := ADataSet1.RecordCount;
  while not Eof do begin
   Inc(N);
   S1:=S1+#13#10+GetOneRow1(IntToStr(N),
                            FieldByName('fc_name').AsString,
                            FieldByName('fc_edizm').AsString,
                            FieldByName('fn_kolostbegin').AsString,
                            FloatToStrF(FieldByName('fn_sumostbegin').AsCurrency, ffNumber, 15, 2),
                            FieldByName('fn_kolostend').AsString,
                            FloatToStrF(FieldByName('fn_sumostend').AsCurrency, ffNumber, 15, 2));
//   Inc(nCount);
   Next;
  end;
  Close;
 end;

 N:=0;
 nS1:=0; nS2:=0;
 with ADataSet2 do begin
  if Active then Close;
  Open; First;
  RecCount2 := ADataSet2.RecordCount;
  while not Eof do begin
   Inc(N);
   S2:=S2+#13#10+GetOneRow2(IntToStr(N),
                            FieldByName('fc_name').AsString,
                            FieldByName('fd_data').AsString,
                            FieldByName('fc_serial').AsString,
                            FieldByName('fd_goden').AsString,
                            FieldByName('fn_kol').AsString,
                            FloatToStrF(FieldByName('fn_summa').AsCurrency, ffNumber, 15, 2));
//   Inc(nCount);
   nS1:=nS1+FieldByName('fn_kol').AsCurrency;
   nS2:=nS2+FieldByName('fn_summa').AsCurrency;
   nI1:=nI1+FieldByName('fn_summa').AsCurrency;
   Next;
  end;
  Close;
  S2:=S2+#13#10+GetSumRow2(FloatToStrF(nS1, ffNumber, 15, 2), FloatToStrF(nS2, ffNumber, 15, 2));
//  Inc(nCount);
 end;

 N:=0;
 nS1:=0; nS2:=0;
 with ADataSet3 do begin
  if Active then Close;
  Open; First;
  RecCount3 := ADataSet3.RecordCount;
  while not Eof do begin
   Inc(N);
   S3:=S3+#13#10+GetOneRow3(IntToStr(N),
                            FieldByName('FC_MOGRTO_NAME').AsString,
                            FieldByName('fc_docmix').AsString,
                            FieldByName('fd_date_otp').AsString,
                            '',
                            FieldByName('fn_kol').AsString,
                            FloatToStrF(FieldByName('fn_summ').AsCurrency, ffNumber, 15, 2));
//   Inc(nCount);
   nS1:=nS1+FieldByName('fn_kol').AsCurrency;
   nS2:=nS2+FieldByName('fn_summ').AsCurrency;
   nI2:=nI2+FieldByName('fn_summ').AsCurrency;
   Next;
  end;
  Close;
  S3:=S3+#13#10+GetSumRow3(FloatToStrF(nS1, ffNumber, 15, 2), FloatToStrF(nS2, ffNumber, 15, 2));
//  Inc(nCount);
 end;

 N:=0;
 nS1:=0; nS2:=0;
 with ADataSet4 do begin
  if Active then Close;
  Open; First;
  RecCount4 := ADataSet4.RecordCount;  
  while not Eof do begin
   Inc(N);
   S4:=S4+#13#10+GetOneRow4(IntToStr(N),
                            FieldByName('FC_SpisanieDescr').AsString,
                            FieldByName('fc_docmix').AsString,
                            FieldByName('fd_date_otp').AsString,
                            '',
                            FieldByName('fn_kol').AsString,
                            FloatToStrF(FieldByName('fn_summ').AsCurrency, ffNumber, 15, 2));
//   Inc(nCount);
   nS1:=nS1+FieldByName('fn_kol').AsCurrency;
   nS2:=nS2+FieldByName('fn_summ').AsCurrency;
   Next;
  end;
  Close;
  S4:=S4+#13#10+GetSumRow4(FloatToStrF(nS1, ffNumber, 15, 2), FloatToStrF(nS2, ffNumber, 15, 2));
//  Inc(nCount);
 end;

 // sFileName1:=IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))+'shablon.htm';
// sFileName2:=IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))+'done.htm';
  sFileName1 := ChangeFileExt(PrepareFilePath(aFileName), '.htm');
  sFileName2 := ChangeFileExt(sFileName1,'.xls');
  SaveResToFile('shablon', 'HTML', sFileName1);

 with TStringList.Create do begin
  LoadFromFile(sFileName1);
  Text:=StringReplace(Text, '::REPLACEHERE1::', S1, [rfIgnoreCase]);
  Text:=StringReplace(Text, '::REPLACEHERE2::', S2, [rfIgnoreCase]);
  Text:=StringReplace(Text, '::REPLACEHERE3::', S3, [rfIgnoreCase]);
  Text:=StringReplace(Text, '::REPLACEHERE4::', S4, [rfIgnoreCase]);
  Text:=StringReplace(Text, '::PDATE1::', DateToStr(ADate1), [rfIgnoreCase]);
  Text:=StringReplace(Text, '::PDATE2::', DateToStr(ADate2), [rfIgnoreCase]);
  Text:=StringReplace(Text, '::T2_2_2T::', FloatToStrF(nI1, ffNumber, 15, 2), [rfIgnoreCase]);
  Text:=StringReplace(Text, '::T3_2_2T::', FloatToStrF(nI2, ffNumber, 15, 2), [rfIgnoreCase]);
  Text:=StringReplace(Text, '::OTDEL::', lcbMO_GROUP.Text, [rfIgnoreCase]);
  try
    SaveToFile(sFileName2);
  except
    ;
  end;
  Free;
 end;

 Excel:=CreateOleObject('Excel.Application');
 Excel.Workbooks.Open(sFileName2);
 Excel.ActiveSheet.PageSetup.LeftMargin := 57;
 Excel.ActiveSheet.PageSetup.RightMargin := 27;
 Excel.ActiveSheet.PageSetup.TopMargin := 27;
 Excel.ActiveSheet.PageSetup.BottomMargin := 27;
 Excel.ActiveSheet.PageSetup.FooterMargin := Excel.ActiveSheet.PageSetup.BottomMargin - 7;
 Excel.ActiveSheet.PageSetup.LeftFooter := '&"Arial,обычный"&7' + ReadMedotradeSign;
 //Excel.Columns['3:4'].EntireColumn.AutoFit;
  // выставляем перенос слов для столбца серийный номер
 Excel.Columns['H:H'].Select;
 Excel.Selection.WrapText := True;

 Excel.Columns['C:D'].Select;
 Excel.Selection.WrapText := True;

 Excel.Range['H1'].Select;
 Excel.Selection.ColumnWidth := 23;
 Excel.Range['A1:A1'].Select;

 n := 8;
 Excel.Rows[(IntToStr(n))+':'+IntToStr(n+RecCount1)].EntireRow.AutoFit;
 n := n-1+RecCount1 + 3;
 Excel.Rows[(IntToStr(n))+':'+IntToStr(n+RecCount2)].EntireRow.AutoFit;
 n := n-1+RecCount2 + 4;
 Excel.Rows[(IntToStr(n))+':'+IntToStr(n+RecCount3)].EntireRow.AutoFit;
 n := n-1+RecCount3 + 4;
 Excel.Rows[(IntToStr(n))+':'+IntToStr(n+RecCount4)].EntireRow.AutoFit;

// Excel.ActiveSheet.PageSetup.PrintTitleRows:='$9:$10';
// Excel.ActiveSheet.PageSetup.Orientation:=xlLandscape;
 Excel.ActiveSheet.PageSetup.Zoom := 82;

 Excel.Visible:=True;
 DeleteFile(sFileName1);

 Screen.Cursor:=crDefault;
end;

end.


