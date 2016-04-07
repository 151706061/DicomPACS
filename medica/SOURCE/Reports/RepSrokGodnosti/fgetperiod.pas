unit fgetperiod;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, Buttons, ActnList,  ImgList,
  ComCtrls, ToolWin, Db, OracleData, Oracle, //frxDSet,
     fr_Class,
   frxClass, frxDBSet,
  DBCtrls, frxDesgn, HtmlHlp, JvExMask, JvToolEdit, OracleMonitor,
  fdmPrintSelect, JvMaskEdit, JvCheckedMaskEdit, JvDatePickerEdit;

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
    os: TOracleSession;
    Panel3: TPanel;
    Label3: TLabel;
    frxDesigner1: TfrxDesigner;
    ods: TOracleDataSet;
    odsM: TStringField;
    odsGroupMo: TOracleDataSet;
    odsGroupMoGROUPID: TFloatField;
    odsGroupMoFC_GROUP: TStringField;
    odsGroupMoFL_DEL: TFloatField;
    dsGroupMo: TDataSource;
    lcbMO_GROUP: TDBLookupComboBox;
    odssrok: TOracleDataSet;
    frxDBDataset3: TfrxDBDataset;
    frSrok: TfrxReport;
    oqInit_MO_GROUP: TOracleQuery;
    chbDate1: TCheckBox;
    chbDate2: TCheckBox;
    oqInitMO: TOracleQuery;
    frxDBDataset1: TfrxDBDataset;
    procedure rbAllClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acApplyExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure lcbCloseUp(Sender: TObject);
    procedure frPrihDocGetValue(const ParName: String;
      var ParValue: Variant);
    procedure frKartGetValue(const ParName: String; var ParValue: Variant);
    procedure frKartUserFunction(const Name: String; p1, p2, p3: Variant;
      var Val: Variant);
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
    procedure odsGroupMoAfterOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chbDate1Click(Sender: TObject);
    procedure chbDate2Click(Sender: TObject);
    procedure frSrokGetValue(const ParName: String; var ParValue: Variant);

  PRIVATE
    { Private declarations }
    FStrPeriod : string;
    procedure UploadToExcel(aFileName : string);
  PUBLIC
    { Public declarations }
    function GetPayTypes: String;
  end;



var
  frmGetPeriod      : TfrmGetPeriod;

implementation

uses IniFiles, Math, ComObj, Excel2000, uGlobalConst, SMMainAPI;
{$R *.DFM}

var
  sJobTitleCompiler : String;
  sFamCompiler      : String;
  sJobTitleChecker  : String;
  sFamChecker       : String;

//==============================================================================
// Возвращает имя файла (в нашем случае дллки)
function ParamStr_0: string;
var
	TheFileName : array[0..MAX_PATH] of Char;
begin
	FillChar(TheFileName, sizeof(TheFileName), #0);
	GetModuleFileName(hInstance, TheFileName, sizeof(TheFileName));
	Result := TheFileName;
end;

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
function TfrmGetPeriod.GetPayTypes: String;
var odsPayType : TOracleDataSet;
begin
  odsPayType := TOracleDataset.Create(nil);
  try
    odsPayType.Session := os;
    odsPayType.Sql.Text := 'SELECT * FROM TPAYTYPE P ORDER BY P.FC_NAME';
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
begin
  try
    GetSession(os, 'ASU');
    if Application.Terminated then Exit;
//    os.LogOn;
  except
    Application.MessageBox('Нет соединения с базой данных!','Ошибка',mb_ok + mb_iconerror);
    Application.Terminate;
    Abort;
  end;
  
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
  lcbMO_GROUP.KeyValue := oqInitMO.GetVariable('NMO_GROUP');
  lcbMO_GROUP.Enabled  := (oqInitMO.GetVariable('PFL_PROVIZOR') = 1);

  Self.Caption := Application.Title;

  chbDate1Click(nil);
  chbDate2Click(nil);
end;

procedure TfrmGetPeriod.acApplyExecute(Sender: TObject);
//var frmFIOTreb: TfrmFIOTreb;
var
  P : TPoint;
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

  if dmPrintSelect.PrintFlag = 0 then
  begin
    P.X := 0;
    P.Y := ToolButton1.Height;
    P := ToolButton1.ClientToScreen(P);

    if ParamCount > 3 then
    begin
      try
        P.X := StrToInt(ParamStr(2));
        P.Y := StrToInt(ParamStr(3));
      except
        dmPrintSelect.PrintFlag := 2; // если передали фигню, считаем что надо печатать в фаст репорте
      end;
    end;

    if dmPrintSelect.PrintFlag = 0 then
      dmPrintSelect.pmPrintSelect.Popup(P.X, P.Y);
    Application.ProcessMessages; // только после этого срабатывает событие TdmPrintReports.miPrintToExcelClick(Sender: TObject);
  end;                           // и проставляется флаг - далее проверки на номер флага должны быть внутри каждой функции печати

  if dmPrintSelect.PrintFlag = 0 then Exit;
  try
    FStrPeriod := '';
    if (chbDate1.Checked) and (chbDate2.Checked) then
    begin
      FStrPeriod := 'на период с '+DateToStr(dDate1.Date)+' по '+ DateToStr(dDate2.Date);
    end
    else
    begin
      if (chbDate1.Checked) then FStrPeriod := 'с '+DateToStr(dDate1.Date);
      if (chbDate2.Checked) then FStrPeriod := 'до '+DateToStr(dDate2.Date);      
    end;
    // выставляем текущую группу мат. отв.
    oqInit_MO_GROUP.SetVariable('MO_GROUP_ID',lcbMO_GROUP.KeyValue);
    oqInit_MO_GROUP.Execute;

    // собираем по датам список просроченных партий
    odssrok.SetVariable('afd_data1', dDate1.Date);
    odssrok.SetVariable('afd_data2', dDate2.Date);

    odssrok.SetVariable('ISUSEDATE1', chbDate1.Checked);
    odssrok.SetVariable('ISUSEDATE2', chbDate2.Checked);
    odssrok.close;
    odssrok.open;
    Screen.Cursor := crDefault;
    if odssrok.RecordCount > 0 then
    begin
      Self.Hide;
      case dmPrintSelect.PrintFlag of // флаг куда печатать
        1: UploadToExcel('Реестр ТМЦ с истекшим сроком годности '+FStrPeriod+' ('+lcbMO_GROUP.Text+')'+'.xls');
        2: frSrok.ShowReport;
      end;
    end
    else
    begin
      Application.MessageBox('За выбранный период нет просроченных ТМЦ', 'Внимание', MB_OK+MB_ICONINFORMATION);
      Exit;
    end;

  finally
    dmPrintSelect.PrintFlag := 0;
  end;
  Close;   
end;

procedure TfrmGetPeriod.acCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmGetPeriod.lcbCloseUp(Sender: TObject);
begin
	acApply.Enabled := (lcbMO_GROUP.Text <> '');
  lcbMO_GROUP.Hint := lcbMO_GROUP.Text;
end;

procedure TfrmGetPeriod.frPrihDocGetValue(const ParName: String;
  var ParValue: Variant);
begin
  if ParName = 'Date1' then ParValue := DateTimeToStr(dDate1.Date)
  else if ParName = 'Date2' then ParValue := DateTimeToStr(dDate2.Date)
  //заполнение переменных о составителе и о проверяющем
  else if ParName = 'JobTitleCompiler' then ParValue := sJobTitleCompiler
  else if ParName = 'FamCompiler' then ParValue := sFamCompiler
  else if ParName = 'JobTitleChecker' then ParValue := sJobTitleChecker
  else if ParName = 'FamChecker' then ParValue := sFamChecker
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
  end;
end;

procedure TfrmGetPeriod.frKartGetValue(const ParName: String;
  var ParValue: Variant);
begin
  if ParName = 'Date1' then ParValue := DateTimeToStr(dDate1.Date)
  else if ParName = 'Date2' then ParValue := DateTimeToStr(dDate2.Date);
end;

procedure TfrmGetPeriod.frKartUserFunction(const Name: String; p1, p2,
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
 { try
    // TODo Подумать насчет праметра  Command
    if Data = -1 then
      HtmlHelp(0, PChar('StMedsestra.chm'), HH_DISPLAY_TOPIC, 0)
    else
      HtmlHelp(0, PChar('StMedsestra.chm'), HH_HELP_CONTEXT, Data);
    CallHelp := False;
    Result := True;
  except
    on EConvertError do
      ShowMessage('Справка не найдена');
  end; }
end;

procedure TfrmGetPeriod.odsGroupMoAfterOpen(DataSet: TDataSet);
begin
  lcbMO_GROUP.KeyValue := StrToInt(IniReadString(Application.ExeName+'.ini','Params', 'LastMOGroupID', '-1'));
  lcbCloseUp(nil);  
end;

procedure TfrmGetPeriod.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IniWriteString(Application.ExeName+'.ini','Params', 'LastMOGroupID', IntToStr(lcbMO_GROUP.KeyValue));
  Action := caFree;
end;

procedure TfrmGetPeriod.UploadToExcel(aFileName : string);
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

  function GetRow(aNum, aSrokGodnosti, aName, aSerial, aEdIzm, aPrice, aKol, aSumm: String): String;
  begin
    Result:=
    '<tr height=32 style=''mso-height-source:userset;height:24.4pt''>'#13#10+
    '  <td height=32 class=xl38 width=32 style=''height:24.4pt;border-top:none; width:24pt''>'+aNum+'</td>'#13#10+
    '  <td class=xl38 width=72 style=''border-top:none;border-left:none;width:54pt''>'+aSrokGodnosti+'</td>'#13#10+
    '  <td class=xl33 width=178 style=''border-top:none;border-left:none;width:134pt''>'+aName+'</td>'#13#10+
    '  <td class=xl38 width=85 style=''border-top:none;border-left:none;width:64pt''>'+aSerial+'</td>'#13#10+
    '  <td class=xl38 width=65 style=''border-top:none;border-left:none;width:49pt''>'+aEdIzm+'</td>'#13#10+
    '  <td class=xl39 width=65 style=''border-top:none;border-left:none;width:49pt''>'+aPrice+'</td>'#13#10+
    '  <td class=xl43 width=63 style=''border-top:none;border-left:none;width:47pt''>'+aKol+'</td>'#13#10+
    '  <td class=xl39 width=76 style=''border-top:none;width:57pt''>'+aSumm+'</td>'#13#10+
    '</tr>'#13#10;
  end;

var
  S: String;
  N: Integer;
  sFileName1, sFileName2: String;
  Excel: Variant;
  RowCount : Integer;
  FSUMM : Double;
begin
  if not odssrok.Active then Exit;
  Screen.Cursor:=crHourGlass;

  S:='';
  N:=0;
  FSUMM := 0;

  with odssrok do
  begin
//    if Active then Close;
//    Open;
    First;
    RowCount := RecordCount;
    while not Eof do
    begin
      Inc(N);
      FSUMM := FSUMM + FieldByName('FN_SUM').AsFloat;
      S:=S+#13#10+GetRow(IntToStr(N),
                        FieldByName('FD_GODEN').AsString,
                        FieldByName('MEDIC').AsString,
                        FieldByName('FC_SERIAL').AsString,
                        FieldByName('EI').AsString,
                        FloatToStrF(FieldByName('PRICE').AsFloat,  ffNumber, 15, 2),
                        FieldByName('KOL').AsString,
                        FloatToStrF(FieldByName('FN_SUM').AsFloat, ffNumber, 15, 2));

      Next;
    end; // while not Eof do
    Close;
  end; // with odsRep do


  sFileName1 := ChangeFileExt(PrepareFilePath(aFileName), 'htm');
  sFileName2 := ChangeFileExt(sFileName1,'.xls');
  SaveResToFile( 'shablon', 'htm', sFileName1);

  with TStringList.Create do
  begin
    LoadFromFile(sFileName1);
    Text:=StringReplace(Text, '::REPLACEHERE::', S,                                      [rfIgnoreCase]);
    Text:=StringReplace(Text, '::FC_SUMM::',     FloatToStrF(FSUMM, ffCurrency, 15, 2),  [rfIgnoreCase]);
    Text:=StringReplace(Text, '::OTDELENIE::',   lcbMO_GROUP.Text,                       [rfIgnoreCase]);
    Text:=StringReplace(Text, '::DATE_STR::',    FStrPeriod,                             [rfIgnoreCase]);
//    Text:=StringReplace(Text, '::DATE1::',       DateToStr(dDate1.Date),                 [rfIgnoreCase]);
//    Text:=StringReplace(Text, '::DATE2::',       DateToStr(dDate2.Date),                 [rfIgnoreCase]);

    try
      SaveToFile(sFileName2);
    except
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
  Excel.Rows['5:'+IntToStr(RowCount+4)].EntireRow.AutoFit;
  Excel.Visible:=True;
  DeleteFile(sFileName1);

  Screen.Cursor:=crDefault;
end;

procedure TfrmGetPeriod.chbDate1Click(Sender: TObject);
begin
  // исключаем возможность полностью убрать галочки
  if (not chbDate1.Checked)and(not chbDate2.Checked) then chbDate1.Checked := True;
  dDate1.Enabled := chbDate1.Checked;
end;

procedure TfrmGetPeriod.chbDate2Click(Sender: TObject);
begin
  // исключаем возможность полностью убрать галочки
  if (not chbDate1.Checked)and(not chbDate2.Checked) then chbDate2.Checked := True;
  dDate2.Enabled := chbDate2.Checked;
end;

procedure TfrmGetPeriod.frSrokGetValue(const ParName: String;
  var ParValue: Variant);
begin
  if ParName = 'STR_PERIOD' then ParValue := FStrPeriod;
  if ParName = 'MEDOTRADE_SIGN' then ParValue := ReadMedotradeSign;  
end;

end.

