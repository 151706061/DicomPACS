unit fgetperiod;

interface

uses Windows, Db, frxDBSet, frxClass,
fr_Class, OracleData, Oracle, Classes,
  ActnList, ImgList, Controls, ComCtrls, ToolWin, StdCtrls, Mask,
  ExtCtrls, DBCtrls, Forms, frXMLExl, frOLEExl, HtmlHlp, JvExMask, JvToolEdit, OracleMonitor,
  dxSkinsCore, dxSkinsDefaultPainters, cxControls, cxContainer, cxEdit,
  cxGroupBox, cxRadioGroup, cxLookAndFeelPainters,
    frxExportXLS, frxCross, cxGraphics, Menus, cxButtons, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCheckComboBox, frxExportXML  ;

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
    alAll: TActionList;
    aSave: TAction;
    aCancel: TAction;
    Bevel1: TBevel;
    Bevel2: TBevel;
    os: TOracleSession;
    Panel3: TPanel;
    frUDSRashDoc: TfrxUserDataset;
    frActSpis: TfrxReport;
    frDBdsActSpisRep: TfrxDBDataset;
    frUdsActSpisRep: TfrxUserDataset;
    Label3: TLabel;
    odsRep_UchGr: TOracleDataSet;
    frItogVed_UchGr: TfrxReport;
    ods1: TOracleDataSet;
    ods1M: TStringField;
    frDBdsItogVed_UchGr: TfrxDBDataset;
    odsSumm_UchGr: TOracleDataSet;
    frDBodsSumm_UchGr: TfrxDBDataset;
    frxXLSExport1: TfrxXLSExport;
    frxXMLExport1: TfrxXMLExport;
    odsGroupMo: TOracleDataSet;
    odsGroupMoGROUPID: TFloatField;
    odsGroupMoFC_GROUP: TStringField;
    odsGroupMoFL_DEL: TFloatField;
    dsGroupMo: TDataSource;
    lcbMO_GROUP: TDBLookupComboBox;
    oqInitMO: TOracleQuery;
    frItogVed_GrLF: TfrxReport;
    odsRep_GrLF: TOracleDataSet;
    odsSumm_GrLF: TOracleDataSet;
    gbDetalis: TcxGroupBox;
    rbUch: TcxRadioButton;
    rbLF: TcxRadioButton;
    frdbdsItogRep_GrLF: TfrxDBDataset;
    frdbdsSumm_GrLF: TfrxDBDataset;
    rbFinSource: TcxRadioButton;
    frxItogVed_FinSource: TfrxReport;
    odsRep_FinSource: TOracleDataSet;
    frxdsRep_FinSource: TfrxDBDataset;
    odsRep_FinSourceFK_MOGROUPID_TO: TFloatField;
    odsRep_FinSourceFN_SUM: TFloatField;
    odsRep_FinSourceFK_FINSOURCE_ID: TFloatField;
    odsRep_FinSourceFC_FINSOURCE: TStringField;
    odsRep_FinSourceFC_GROUP_TO: TStringField;
    //frxXLSExport1: TfrxXLSExport;
    frxCrossObject1: TfrxCrossObject;
    pFinSource: TPanel;
    lbType: TLabel;
    ccbFinSource: TcxCheckComboBox;
    buFinSourceClear: TcxButton;
    buFinSourceSelectAll: TcxButton;
    odsFinSource: TOracleDataSet;
    odsRep_FinSourceFC_UCHGR: TStringField;
    oqPKG_SMINI: TOracleQuery;
    procedure rbAllClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure frItogVed_UchGrGetValue(const ParName: String;
      var ParValue: Variant);
    procedure odsRep_UchGrBeforeOpen(DataSet: TDataSet);
    procedure frItogVed_UchGrUserFunction(const Name: String; p1, p2,
      p3: Variant; var Val: Variant);
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
    procedure odsGroupMoAfterOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lcbMO_GROUPCloseUp(Sender: TObject);
    procedure rbUchClick(Sender: TObject);
    procedure frxItogVed_FinSourceGetValue(const VarName: string; var Value: Variant);
    procedure odsFinSourceAfterOpen(DataSet: TDataSet);
    procedure buFinSourceSelectAllClick(Sender: TObject);
    procedure buFinSourceClearClick(Sender: TObject);
  private
    IS_DETALIS_VISIBLE:boolean;
    procedure Load_IS_DETALIS_VISIBLE;
    { Private declarations }
  public
    function READSTRING_TSMINI(aFC_SECTION, aFC_KEY, aFC_DEFAULT_VALUE: string): string;
  end;

var
  frmGetPeriod: TfrmGetPeriod;
                                                                                             
function ListStrToString(const aStrList : TStrings; const aSeparator : string = '|') : string;
function StringToListStr(const aStr : string; const aSeparator : string = '|') : string; // результат - строка с разделителями #13#10

implementation

uses Sysutils, IniFiles, fdmPrintSelect, ComObj, Excel2000, ShellAPI, uGlobalConst, uGlobal
     {$IFNDEF OLD_AUTH},SMMAinAPI {$ENDIF};

{$R *.DFM}

function TfrmGetPeriod.READSTRING_TSMINI(aFC_SECTION, aFC_KEY, aFC_DEFAULT_VALUE: string): string;
begin
  try
  oqPKG_SMINI.ClearVariables;
  oqPKG_SMINI.SetVariable('PSECTION', aFC_SECTION);
  oqPKG_SMINI.SetVariable('PIDENT',   aFC_KEY);
  oqPKG_SMINI.SetVariable('PDEFAULT', aFC_DEFAULT_VALUE);

  oqPKG_SMINI.Execute;
  Result := nvl(oqPKG_SMINI.GetVariable('PVALUE'), '');
  except
    Result := aFC_DEFAULT_VALUE;
  end;
end;

//==============================================================================
function ListStrToString(const aStrList : TStrings; const aSeparator : string = '|') : string;
begin
  Result := StringReplace(aStrList.Text, #13#10, aSeparator, [rfReplaceAll]);
end;
//------------------------------------------------------------------------------
function StringToListStr(const aStr : string; const aSeparator : string = '|') : string;
begin
  Result := StringReplace(aStr, aSeparator, #13#10, [rfReplaceAll] );
end;
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
//==============================================================================
procedure TfrmGetPeriod.rbAllClick(Sender: TObject);
var
  cName:string;
  dDate:tdate;
  nMon:word;
  nYear:word;
begin
  cName:=uppercase(tcomponent(Sender).getnamepath);
  dDate:=0;
  decodedate(date,nYear,nMon,nMon);
  if cName='RBM1' then begin
    dDate:=encodedate(nYear,1,1);
    nMon:=1
  end
  else if cName='RBM2' then begin
    dDate:=encodedate(nYear,2,1);
    nMon:=1
  end
  else if cName='RBM3' then begin
    dDate:=encodedate(nYear,3,1);
    nMon:=1
  end
  else if cName='RBM4' then begin
    dDate:=encodedate(nYear,4,1);
    nMon:=1
  end
  else if cName='RBM5' then begin
    dDate:=encodedate(nYear,5,1);
    nMon:=1
  end
  else if cName='RBM6' then begin
    dDate:=encodedate(nYear,6,1);
    nMon:=1
  end
  else if cName='RBM7' then begin
    dDate:=encodedate(nYear,7,1);
    nMon:=1
  end
  else if cName='RBM8' then begin
    dDate:=encodedate(nYear,8,1);
    nMon:=1
  end
  else if cName='RBM9' then begin
    dDate:=encodedate(nYear,9,1);
    nMon:=1
  end
  else if cName='RBM10' then begin
    dDate:=encodedate(nYear,10,1);
    nMon:=1
  end
  else if cName='RBM11' then begin
    dDate:=encodedate(nYear,11,1);
    nMon:=1
  end
  else if cName='RBM12' then begin
    dDate:=encodedate(nYear,12,1);
    nMon:=1
  end
  else if cName='RBK1' then begin
    dDate:=encodedate(nYear,1,1);
    nMon:=3
  end
  else if cName='RBK2' then begin
    dDate:=encodedate(nYear,4,1);
    nMon:=3
  end
  else if cName='RBK3' then begin
    dDate:=encodedate(nYear,7,1);
    nMon:=3
  end
  else if cName='RBK4' then begin
    dDate:=encodedate(nYear,10,1);
    nMon:=3
  end
  else if cName='RBG1' then begin
    dDate:=encodedate(nYear,1,1);
    nMon:=6
  end
  else if cName='RBG2' then begin
    dDate:=encodedate(nYear,7,1);
    nMon:=6
  end
  else if cName='RBG3' then begin
    dDate:=encodedate(nYear,1,1);
    nMon:=12
  end;
  Self.dDate1.date:=dDate;
  Self.dDate2.date:=incmonth(dDate,nMon)-1;
end;

procedure TfrmGetPeriod.rbUchClick(Sender: TObject);
begin
  pFinSource.Visible := rbFinSource.Checked;
  IniWriteString(Application.ExeName+'.ini','Params','Details',(sender as TcxRadioButton).name);
end;

procedure TfrmGetPeriod.FormCreate(Sender: TObject);
var d, FK_APPSOTR_ID: integer;
rb:TcxRadioButton;
s:string;
    UchGrIdStr : string;
begin
  try
//    os.LogOn;
    {$IFDEF OLD_AUTH}
      os.LogonUsername := 'ASU';
      os.LogonPassword := 'ASU';
      os.LogOn;
      if os.Connected = False then RaiseException(0,0,0,nil);
    {$ELSE}
      GetSession(os, 'ASU');
    {$ENDIF}
  except
    Application.MessageBox('Нет соединения с базой данных!','Ошибка',mb_ok + mb_iconerror);
    Application.Terminate;
    Abort;
  end;


  if TryStrToInt(ParamStr(1), FK_APPSOTR_ID) = False then
    FK_APPSOTR_ID := -1;
  oqInitMO.SetVariable('PAPPSOTRID', FK_APPSOTR_ID);
  oqInitMO.Execute;

  Load_IS_DETALIS_VISIBLE;
  try
    s:=IniReadString(Application.ExeName+'.ini','Params','Details','rbUch');
    rb:=(Self.FindComponent(s) as TcxRadioButton);
    rb.Checked:=true;
    pFinSource.Visible := rbFinSource.Checked;
  except

  end;

  odsGroupMo.Close;
  odsGroupMo.Open;
  lcbMO_GROUP.KeyValue :=  oqInitMO.GetVariable('NMO_GROUP');
  lcbMO_GROUP.Enabled  :=  (oqInitMO.GetVariable('PFL_PROVIZOR') = 1);

  odsFinSource.Open;

  ods1.open;
  d:=strtoint(ods1m.AsString);
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
  Self.Caption := Application.Title;

  if READSTRING_TSMINI('MEDICA.EXE','FUNC_USE_MEDUCHGRP_CH','0')='1' then
    UchGrIdStr := 'nvl ( K.UCHGRID, M.UCHGRID )'
  else
    UchGrIdStr := 'M.UCHGRID';

  odsRep_GrLF.SQL.Text := StringReplace(odsRep_GrLF.SQL.Text, '#uchgrid#',
      UchGrIdStr, [rfReplaceAll, rfIgnoreCase] );
  odsSumm_GrLF.SQL.Text := StringReplace(odsSumm_GrLF.SQL.Text,'#uchgrid#',
      UchGrIdStr, [rfReplaceAll, rfIgnoreCase] );

  odsRep_UchGr.SQL.Text := StringReplace(odsRep_UchGr.SQL.Text,'#uchgrid#',
      UchGrIdStr, [rfReplaceAll, rfIgnoreCase] );
  odsSumm_UchGr.SQL.Text := StringReplace(odsSumm_UchGr.SQL.Text,'#uchgrid#',
      UchGrIdStr, [rfReplaceAll, rfIgnoreCase] );

  odsRep_FinSource.SQL.Text := StringReplace(odsRep_FinSource.SQL.Text,'#uchgrid#',
      UchGrIdStr, [rfReplaceAll, rfIgnoreCase] );
end;

procedure TfrmGetPeriod.aSaveExecute(Sender: TObject);
var
  P : TPoint;
  fr:TfrxReport;   
  i  : Integer;  
  IDs : string;
//  FileName : string;
//  Excel : Variant;
begin
  try
   if (not rbUch.Checked) and (not rbLF.Checked) and (not rbFinSource.Checked) then
    begin
     MessageBox(Self.Handle,'Не выбран тип детализации по группам','Ошибка',MB_OK+MB_ICONERROR);
     exit;
    end
   else
    if rbLF.Checked then
     fr:=frItogVed_GrLF
    else
     fr:=frItogVed_UchGr;
  except

  end;

  lcbMO_GROUP.CloseUp(True);
  try
//    Self.dDate1.CheckValiddate;
    StrToDate(dDate1.Text);
  except
    on EConvertError do
    begin
      Application.MessageBox('Неверно введена начальная дата периода','Ошибка',MB_OK+MB_ICONERROR);
      Self.dDate1.SetFocus;
      Exit;
    end;
  end;
  try
//    Self.dDate2.CheckValiddate;
    StrToDate(dDate2.Text);
  except
    on EConvertError do begin
      Application.MessageBox('Неверно введена конечная дата периода','Ошибка',MB_OK+MB_ICONERROR);
      Self.dDate2.SetFocus;
      Exit;
    end;
  end;
  if Self.dDate1.date>Self.dDate2.date then begin
      Application.MessageBox('Неверно задан период','Ошибка',MB_OK+MB_ICONERROR);
    Self.dDate1.SetFocus;
    Exit;
  end;    
  if (rbFinSource.Checked) and (ccbFinSource.Text = ccbFinSource.Properties.EmptySelectionText) then
  begin
    Application.MessageBox('Не выбран ни один источник финансирования', 'Ошибка', MB_OK + MB_ICONERROR);
    ccbFinSource.SetFocus;
    Exit;
  end;
  if dmPrintSelect.PrintFlag = 0 then
  begin
    P.X := 0;
    P.Y := ToolButton1.Height;
    P := ToolButton1.ClientToScreen(P);
    dmPrintSelect.pmPrintSelect.Popup(P.X, P.Y);
    Application.ProcessMessages; // только после этого срабатывает событие TdmPrintSelect.miPrintToExcelClick(Sender: TObject);
  end;                           // и проставляется флаг - далее проверки на номер флага должны быть внутри каждой функции печати
  if dmPrintSelect.PrintFlag = 0 then Exit;
  if rbLF.Checked then
   begin
    odsRep_GrLF.close;
    odsRep_GrLF.open; {
    odsSumm_GrLF.close;
    odsSumm_GrLF.open; }
   end
  else
  if rbUch.Checked then
   begin
    odsRep_UchGr.close;
    odsRep_UchGr.open;
    odsSumm_UchGr.close;
    odsSumm_UchGr.open;
   end
  else
  if rbFinSource.Checked then
   begin                  
    IDs := '';
    for i := 0 to ccbFinSource.Properties.Items.Count - 1 do
    begin
      if ccbFinSource.States[i] = cbsChecked then
      begin
//        Inc(IDn);
        IDs := IDs + ', '+IntToStr(ccbFinSource.Properties.Items[i].Tag);
      end;
    end;
    Delete(IDs, 1, 2); // удаляем первую запятую и пробел - они лишние

    odsRep_FinSource.close;
    odsRep_FinSource.SetVariable('pIDs',IDs);
    odsRep_FinSource.open;
   end;
  
  try
//    fr.Title := Application.Title;
//    frItogVed.ShowReport;
    case dmPrintSelect.PrintFlag of // флаг куда печатать
      1:
      begin
        if rbFinSource.Checked then
        begin
          frxItogVed_FinSource.FindObject('PageFooter1').Visible := False;
          frxItogVed_FinSource.PrepareReport();
          frxXLSExport1.Report := frxItogVed_FinSource;
          frxXLSExport1.FileName := 'Ведомость расхода медикаментов по отделениям с '+DateToStr(dDate1.Date)+' по '+DateToStr(dDate2.Date)+'.xls';
          frxXLSExport1.OpenExcelAfterExport := True;
          frxXLSExport1.ShowDialog := false;
          frxItogVed_FinSource.Export(frxXLSExport1);
        end
        else
        begin
          fr.FindObject('PageFooter1').Visible := False;

          dmPrintSelect.frxXLSExport1.PageBreaks:= false;
          fr.PrepareReport;
          ExportFRToExcel(fr, 'Ведомость расхода медикаментов по отделениям с '+DateToStr(dDate1.Date)+' по '+DateToStr(dDate2.Date)+'.xls');

//        FileName := PrepareFilePath('Ведомость расхода медикаментов по отделениям с '+DateToStr(dDate1.Date)+' по '+DateToStr(dDate2.Date)+'.xls');
//        frItogVed.ExportTo( dmPrintSelect.frxXLSExport1, FileName );
//        Excel:=CreateOleObject('Excel.Application');
//        Excel.Workbooks.Open(FileName);
//        Excel.Visible:=True;
        end;
      end;
      2: begin
          if rbFinSource.Checked then
          begin
            frxItogVed_FinSource.FindObject('DBCross1').Visible := odsRep_FinSource.RecordCount > 0;
            
            frxItogVed_FinSource.ShowReport();
          end
          else
            fr.ShowReport;
      end;
    end;
  finally
    dmPrintSelect.PrintFlag := 0;
    close;
  end;
end;

procedure TfrmGetPeriod.buFinSourceClearClick(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to ccbFinSource.Properties.Items.Count - 1 do
    ccbFinSource.States[i] := cbsUnChecked;
end;

procedure TfrmGetPeriod.buFinSourceSelectAllClick(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to ccbFinSource.Properties.Items.Count - 1 do
    ccbFinSource.States[i] := cbsChecked;
end;

procedure TfrmGetPeriod.aCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmGetPeriod.frItogVed_UchGrGetValue(const ParName: String;
  var ParValue: Variant);
begin
  if ParName = 'var_date1' then ParValue := dDate1.Date
  else if ParName = 'var_date2' then ParValue := dDate2.Date
  else if ParName = 'var_mo' then ParValue := lcbMO_GROUP.Text;
  if ParName = 'MEDOTRADE_SIGN' then ParValue := ReadMedotradeSign;
end;

procedure TfrmGetPeriod.odsRep_UchGrBeforeOpen(DataSet: TDataSet);
begin
//  TOracleDataSet(Dataset).SetVariable('MOFROMID',lcb.KeyValue);
  TOracleDataSet(Dataset).SetVariable('MOGROUP_ID',lcbMO_GROUP.KeyValue);
  TOracleDataSet(Dataset).SetVariable('date1',dDate1.Date);
  TOracleDataSet(Dataset).SetVariable('date2',dDate2.Date);
end;

procedure TfrmGetPeriod.frItogVed_UchGrUserFunction(const Name: String; p1, p2,
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

procedure TfrmGetPeriod.frxItogVed_FinSourceGetValue(const VarName: string; var Value: Variant);
begin
  if UpperCase(VarName) = 'VAR_DATE1' then Value := dDate1.Date;
  if UpperCase(VarName) = 'VAR_DATE2' then Value := dDate2.Date;
  if UpperCase(VarName) = 'VAR_MO' then Value := lcbMO_GROUP.Text;
  if UpperCase(VarName) = 'MEDOTRADE_SIGN' then Value := ReadMedotradeSign;
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

procedure TfrmGetPeriod.odsFinSourceAfterOpen(DataSet: TDataSet);
var
  ChBox : TcxCheckComboBoxItem;
  StrList : TStrings;
  i : Integer;
  sID : string;
begin
  StrList := TStringList.Create;
  StrList.Text := StringToListStr(IniReadString(Application.ExeName+'.ini','Params', 'LastFinSource', '-1'));
  odsFinSource.First;  // записываем все типы медикаментов в чеклист
  ccbFinSource.Properties.Items.Clear;
  while not odsFinSource.Eof do
  begin
    ChBox := ccbFinSource.Properties.Items.Add;
    ChBox.Description := odsFinSource.FieldByName('FC_NAME').AsString;
    ChBox.Tag := odsFinSource.FieldByName('FK_ID').AsInteger; // в теге храним ID типа
    // проставляем галочку на текущем чекбоксе
    sID := IntToStr( ChBox.Tag );
    i := 0;
    while (i < StrList.Count)and(sID <> StrList.Strings[i]) do
      Inc( i );
    if (i < StrList.Count) then ccbFinSource.States[ ChBox.Index ] := cbsChecked else ccbFinSource.States[ ChBox.Index ] := cbsUnchecked;
    odsFinSource.Next;
  end;
  odsFinSource.First;
  StrList.Free;
end;

procedure TfrmGetPeriod.odsGroupMoAfterOpen(DataSet: TDataSet);
begin
  lcbMO_GROUP.KeyValue := StrToInt(IniReadString(Application.ExeName+'.ini','Params', 'LastMOGroupID', '-1'));
  lcbMO_GROUPCloseUp(nil);
end;

procedure TfrmGetPeriod.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  IDs : string;   
  i : Integer;
begin
  IniWriteString(Application.ExeName+'.ini','Params', 'LastMOGroupID', IntToStr(lcbMO_GROUP.KeyValue));
  
  IDs := '';
  for i := 0 to ccbFinSource.Properties.Items.Count - 1 do
  begin
    if ccbFinSource.States[i] = cbsChecked then
      IDs := IDs + '|'+IntToStr(ccbFinSource.Properties.Items[i].Tag);
  end;
  Delete(IDs, 1, 1);
  IniWriteString(Application.ExeName+'.ini','Params', 'LastUchGr', IDs);

  Action := caFree;
end;

procedure TfrmGetPeriod.lcbMO_GROUPCloseUp(Sender: TObject);
begin
  lcbMO_GROUP.Hint := lcbMO_GROUP.Text;
end;


procedure TfrmGetPeriod.Load_IS_DETALIS_VISIBLE;
var
oq:TOracleQuery;
begin
oq:=TOracleQuery.Create(nil);
oq.Session:=os;
oq.SQL.text:='begin'+
      '  if :pValue is null then'+
      '    if :pdefault is null then :pdefault := ''''; end if;'+

        '    :pValue := asu.PKG_SMINI.readstring(:psection,:pident,:pdefault);'+
      '  else'+
      '    asu.PKG_SMINI.WRITESTRING( :psection, :pident, :pvalue);'+
      '  end if;'+
      'end;';
oq.DeclareAndSet('PSECTION', otstring, ExtractFileName(ParamStr(0)));
oq.DeclareAndSet('PIDENT', otstring, 'IS_DETAILS_VISIBLE');
oq.DeclareAndSet('PVALUE', otstring, '');
oq.DeclareAndSet('PDEFAULT', otstring, '0');
oq.DeclareVariable('pValue', otstring);
oq.Execute;

IS_DETALIS_VISIBLE := (oq.GetVariable('PVALUE')='1');
gbDetalis.Visible:=IS_DETALIS_VISIBLE;
{if IS_DETALIS_VISIBLE then
 begin
  rbUch.Checked:=strtobool(IniReadString(ChangeFileExt(paramstr(0),'.ini'),'gbIstFinans','chbDetails','0'));
  rbLF.Checked:=strtobool(IniReadString(ChangeFileExt(paramstr(0),'.ini'),'gbIstFinans','chbUse','0'));
 end
else
 begin
  rbUch.Checked:=IS_DETALIS_VISIBLE;
  rbLF.Checked:=IS_DETALIS_VISIBLE;
 end;}
oq.free;
end;

end.
