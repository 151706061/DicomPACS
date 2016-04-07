unit fgetperiod;

interface

uses Windows, Db, frxDesgn, OracleData, Oracle, frxClass,// frxDSet,
  frxDBSet, Classes, ActnList, ImgList, Controls, DBCtrls, ComCtrls,
  ToolWin, StdCtrls, Mask, ExtCtrls, Forms, SysUtils, frOLEExl,
  Dialogs, frXMLExl, HtmlHlp, JvExMask, JvToolEdit, cxGraphics, Menus,
  cxLookAndFeelPainters, cxButtons, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCheckComboBox, cxCheckBox, OracleMonitor,
  cxGroupBox, dxSkinsCore, dxSkinsDefaultPainters, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, frxExportXLS, frxExportXML,FR_Class, cxCustomData, cxStyles, cxTL, cxInplaceContainer, cxDBTL, cxTLData;

type
  TfrmGetPeriod = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    dDate2: TJvDateEdit;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ilImages: TImageList;
    alActions: TActionList;
    aSave: TAction;
    aCancel: TAction;
    frDBDSSelDoc: TfrxDBDataset;
    frPrihDoc: TfrxReport;
    os: TOracleSession;
    odsRep: TOracleDataSet;
    Panel3: TPanel;
    Label3: TLabel;
    frxDesigner1: TfrxDesigner;
    frDBDSRepHead: TfrxDBDataset;
    odsRepHeader: TOracleDataSet;
    acExcelExport: TAction;
    sd: TSaveDialog;
    frxXMLExport1: TfrxXMLExport;
    frxXLSExport1: TfrxXLSExport;
    odsGroupMo: TOracleDataSet;
    odsGroupMoGROUPID: TFloatField;
    odsGroupMoFC_GROUP: TStringField;
    odsGroupMoFL_DEL: TFloatField;
    dsGroupMo: TDataSource;
    oqSetGroupMO: TOracleQuery;
    oqClear: TOracleQuery;
    frPrihDoc_Old: TfrxReport;
    Panel4: TPanel;
    lbType: TLabel;
    ccbUchGr: TcxCheckComboBox;
    buUchGrClear: TcxButton;
    buUchGrSelectAll: TcxButton;
    odsUchGr: TOracleDataSet;
    oqInitMO: TOracleQuery;
    lcbMO_GROUP: TcxLookupComboBox;
    frxDBDataset1: TfrxDBDataset;
    paOKDP: TPanel;
    Label2: TLabel;
    dsOKDP: TDataSource;
    odsOKDP: TOracleDataSet;
    tlOKDP: TcxDBTreeList;
    tlOKDPFC_NAME: TcxDBTreeListColumn;
    peOKDP: TcxPopupEdit;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure ToolBar1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure frPrihDocUserFunction(const Name: String; p1, p2, p3: Variant; var Val: Variant);
    function FormHelp(Command: Word; Data: Integer; var CallHelp: Boolean): Boolean;
    procedure odsGroupMoAfterOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure frPrihDocGetValue(const ParName: String;
      var ParValue: Variant);
    procedure buUchGrClearClick(Sender: TObject);
    procedure buUchGrSelectAllClick(Sender: TObject);
    procedure odsUchGrAfterOpen(DataSet: TDataSet);
    procedure tlOKDPDblClick(Sender: TObject);
    procedure tlOKDPKeyPress(Sender: TObject; var Key: Char);

  PRIVATE
    { Private declarations }
    FIniName : string;


    function GetGroupRow(AText: String): String;
    function GetEndGroupRow(AText, aSumm: String): String;    
    function GetRow(aNum, aName, aEdIzm, aFinsource, aSerial, aGodenDo, aPrice, aKol, aSumm: String): String;
    procedure MakeExcelReport(aFileName, aGroupFieldName : string);   
    function MoneyToString(Summa: double; lRub: boolean): string;
    function FLOAT_NUMBER_TO_WORDS(aSource: Double; aRod: integer; aWordFor1, aWordFor234, aWordFor567890_1x: string): string;
  PUBLIC
    { Public declarations }   
    sDB_NAME : string;
  end;

var
  frmGetPeriod      : TfrmGetPeriod;

implementation

uses ffio, Variants, IniFiles, fCheckedListEdit, fdmPrintSelect, uReportParams,
     ComObj, uGlobalConst, SMMainAPI;
{$R *.DFM}
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
procedure TfrmGetPeriod.aSaveExecute(Sender: TObject);
var //frmfio: Tfrmfio;
  IDs : string;
  i : Integer;
  P : TPoint;
begin
  lcbMO_GROUP.PostEditValue;
  lcbMO_GROUP.DroppedDown := False;

  try
//    Self.dDate1.CheckValiddate;
  StrToDate(Self.dDate2.Text);
  except
    on EConvertError do begin
      Application.MessageBox('Неверно введена начальная дата периода', 'Ошибка', MB_OK + MB_ICONERROR);
      Self.dDate2.SetFocus;
      Exit;
    end;
  end;
  // исчо одна проверка на вшивость. Воронов О.А. 06.07.2007
  if VarIsNull(lcbMO_GROUP.EditValue)or(lcbMO_GROUP.EditValue <= 0) then
  begin
  if lcbMO_GROUP.Enabled then
    lcbMO_GROUP.SetFocus;

    Application.MessageBox('Не выбрана группа материально ответственных', 'Ошибка', MB_OK + MB_ICONERROR);
    Exit;
  end;
  if (ccbUchGr.Text = ccbUchGr.Properties.EmptySelectionText) then
  begin
    ccbUchGr.SetFocus;
    Application.MessageBox('Не выбраны группы учетности', 'Ошибка', MB_OK + MB_ICONERROR);
    Exit;
  end;
//  frmfio := Tfrmfio.Create(Self);
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
//    frmFIO.edExSign.Text := lcbMO_GROUP.Text;
//    if frmFIO.ShowModal = mrOk then
//    begin

    // проверка на выбор типа медикамента
    //  IDn := 0;
      IDs := '';
      for i := 0 to ccbUchGr.Properties.Items.Count - 1 do
      begin
        if ccbUchGr.States[i] = cbsChecked then
        begin
    //      Inc(IDn);
          IDs := IDs + ', '+IntToStr(ccbUchGr.Properties.Items[i].Tag);
        end;
      end;
      Delete(IDs, 1, 2); // удаляем первую запятую и пробел - они лишние

      if IDs = '' then
        odsRep.SQL.Text := StringReplace(odsRep.SQL.Text, '%UCHGR_NUMS', '-1', [rfReplaceAll, rfIgnoreCase])
      else
      begin
        odsRep.SQL.Text := StringReplace(odsRep.SQL.Text, '%UCHGR_NUMS', IDs, [rfReplaceAll, rfIgnoreCase]);
        odsRep.SetVariable('FILTERED', 1);
      end;

      if (paOKDP.Visible) and (peOKDP.Text <> '') then      
        odsRep.SetVariable('OKDP', ' AND ost.FK_OKDP in (select FK_ID from MED.TSPRAV_OKDP start with FK_ID = '+IntToStr(peOKDP.Tag)+' connect by prior FK_ID = FK_PARENTID) ')
      else
        odsRep.SetVariable('OKDP', '');

      oqSetGroupMO.SetVariable('GROUPMOID', lcbMO_GROUP.EditValue);
      oqSetGroupMO.SetVariable('PFD2', dDate2.date);
      oqSetGroupMO.Execute;
//      odsRep.SetVariable(':dol',frmFIO.edPosition.text);
//      odsRep.SetVariable(':ras',frmFIO.edExSign.text);
      odsRep.SetVariable(':dol',' ');
      odsRep.SetVariable(':ras',' ');
      with odsRep do begin
//        SetVariable('PFD2', dDate2.date);
//        if VarIsNull(lcb.KeyValue) then
//          SetVariable('MOID', -1)
//        else
//          SetVariable('MOID', lcb.KeyValue);
        Close;
        Open;
      end;
      with odsRepHeader do begin
        SetVariable('PFD2', dDate2.date);
        if VarIsNull(lcbMO_GROUP.EditValue) then
          SetVariable('GROUPMOID', -1)
        else
          SetVariable('GROUPMOID', lcbMO_GROUP.EditValue);
        Close;
        Open;
      end;

      if FileExists('VedomOstat.fr3') then frPrihDoc.LoadFromFile('VedomOstat.fr3');

      oqClear.Execute;
      Self.Hide;
//      frPrihDoc.PrepareReport;
      case dmPrintSelect.PrintFlag of // флаг куда печатать
        1: begin
             if sDB_NAME = 'UG' then
             begin
               frPrihDoc.PrepareReport;
               ExportFRToExcel(frPrihDoc, 'ОТЧЕТ ПО ОСТАТКАМ МЕДИКАМЕНТОВ НА '+DateToStr(odsRepHeader.FieldByName('FD_1').AsDateTime)+'.xls');
             end
             else
               MakeExcelReport('ОТЧЕТ ПО ОСТАТКАМ МЕДИКАМЕНТОВ НА '+DateToStr(odsRepHeader.FieldByName('FD_1').AsDateTime)+'.xls', 'FC_UCHGR' );
           end;
        //ExportFRToExcel( frPrihDoc, 'ОТЧЕТ ПО ОСТАТКАМ МЕДИКАМЕНТОВ НА '+DateToStr(odsRepHeader.FieldByName('FD_1').AsDateTime)+'.xls' );
        2: frPrihDoc.ShowReport;
      end;
//    end;
  finally
    dmPrintSelect.PrintFlag := 0;  
//    frmfio.Free;
    Close;
  end;
end;

procedure TfrmGetPeriod.aCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmGetPeriod.ToolBar1DblClick(Sender: TObject);
begin
  frPrihDoc.DesignReport;
end;

procedure TfrmGetPeriod.FormCreate(Sender: TObject);
var
  FK_APPSOTR_ID : integer;
begin
  try
//    os.LogOn;
    GetSession(os, 'ASU');
  except
    Application.MessageBox('Нет соединения с базой данных!','Ошибка',mb_ok + mb_iconerror);
    Application.Terminate;
    Abort;
  end;
  FIniName := ChangeFileExt(Application.ExeName,'.ini');
  dDate2.Date:=NOW;
  if TryStrToInt(ParamStr(1), FK_APPSOTR_ID) = False then
    FK_APPSOTR_ID := -1;
  oqInitMO.SetVariable('PAPPSOTRID', FK_APPSOTR_ID);
  oqInitMO.Execute;
  
  sDB_NAME := oqInitMO.GetVariable('nDB_NAME');

  if(oqInitMO.GetVariable('FUNC_USE_OKDP') = '1') then
  begin
    paOKDP.Visible := true;
    odsOKDP.Open;
  end;

  odsGroupMo.Open;
  lcbMO_GROUP.EditValue := oqInitMO.GetVariable('nMO_GROUP');
  {$IFDEF MIS2}
  {$ELSE}
  lcbMO_GROUP.Enabled  := (oqInitMO.GetVariable('PFL_PROVIZOR') = 1);
  {$ENDIF}
  odsUchGr.Open;
  Self.Caption := Application.Title;
end;  

function TfrmGetPeriod.MoneyToString(Summa: double; lRub: boolean): string;
const
    TysStr: array[1..4] of string = ('', 'две', 'три', 'четыре');
    Ed2_4Str: array[2..4] of string = ('два', 'три', 'четыре');
    Ed5_19Str: array[5..19] of string = ('пять', 'шесть', 'семь', 'восемь', 'девять',
        'десять', 'одиннадцать', 'двенадцать', 'тpинадцать',
        'четыpнадцать', 'пятнадцать', 'шестнадцать', 'семнадцать',
        'восемнадцать', 'девятнадцать');
    DesStr: array[2..9] of string = ('двадцать', 'тpидцать', 'соpок', 'пятьдесят', 'шестьдесят',
        'семьдесят', 'восемьдесят', 'девяносто');
    SotStr: array[1..9] of string = ('сто', 'двести', 'тpиста', 'четыpеста', 'пятьсот', 'шестьсот',
        'семьсот', 'восемьсот', 'девятьсот');

    function MakeStr(C: Char; N: Integer): string;
    begin
      if N < 1 then Result := ''
      else begin
    {$IFNDEF WIN32}
				if N > 255 then N := 255;
    {$ENDIF WIN32}
        SetLength(Result, N);
        FillChar(Result[1], Length(Result), C);
      end;
    end;

    function AddChar(C: Char; const S: string; N: Integer): string;
    begin
      if Length(S) < N then
        Result := MakeStr(C, N - Length(S)) + S
      else Result := S;
    end;

    function KopToStr(Kop: integer): string;
    var
        sRet: string;
    begin
        sRet := '';
        sRet := AddChar('0', IntToStr(Kop), 2);
        case Kop of
            1, 21, 31, 41, 51, 61, 71, 81, 91: sRet := sRet + ' копейка';
            0, 5..20, 25..30, 35..40, 45..50, 55..60, 65..70, 75..80, 85..90, 95..99: sRet := sRet + ' копеек';
            2..4, 22..24, 32..34, 42..44, 52..54, 62..64, 72..74, 82..84, 92..94: sRet := sRet + ' копейки';
        end;
        KopToStr := sRet;
    end;

var
    ResStr, ST: string;
    Rub: integer;
		Kop: integer;
    Desed, Des: integer;
    Mil, Tys, Sot: integer;
begin
    ResStr := '';
    if Summa > 999999999.99 then
        exit;

    Rub := Trunc(Summa);
    Mil := Trunc(Rub / 1000000);
    Tys := Trunc(Rub / 1000) - Mil * 1000;
    Kop := round((Summa - Rub) * 100);

   // миллионы
    if Mil > 0 then begin
        Sot := trunc(Mil / 100);
        if Sot > 0 then
            ResStr := ResStr + SotStr[Sot] + ' ';
        Desed := Mil - 100 * Sot;
//        Des := 0; - убрал вылазит хинт Воронов О.А.
        while true do
            case DESED of
                0: begin
                        ResStr := ResStr + 'миллионов ';
                        Break;
                    end;
                1: begin
                        ResStr := ResStr + 'один миллион ';
                        Break;
                    end;
                2..4: begin
												ResStr := ResStr + ED2_4STR[DESED] + ' миллиона ';
                        Break;
                    end;
                5..19: begin
                        ResStr := ResStr + ED5_19STR[DESED] + ' миллионов ';
                        Break;
                    end;
            else begin
                    Des := Trunc(DESED / 10);
                    ResStr := ResStr + DESSTR[DES] + ' ';
                    DESED := DESED - 10 * DES;
                end;
            end;
    end;
   //тысячи
    if Tys > 0 then begin
        Rub := Rub - Tys * 1000 - Mil * 1000000;
        SOT := Trunc(Tys / 100);
        if SOT > 0 then
            ResStr := ResStr + SOTSTR[SOT] + ' ';
        DESED := TYS - 100 * SOT;
//        Des := 0; - убрал вылазит хинт Воронов О.А.
        while true do
            case DESED of
                0: begin
                        ResStr := ResStr + 'тысяч ';
                        Break;
                    end;
                1: begin
                        ResStr := ResStr + 'одна тысяча ';
                        Break;
										end;
                2..4: begin
                        ResStr := ResStr + TYSSTR[DESED] + ' тысячи ';
                        Break;
                    end;
                5..19: begin
                        ResStr := ResStr + ED5_19STR[DESED] + ' тысяч ';
                        Break;
                    end;
            else begin
                    Des := Trunc(DESED / 10);
                    ResStr := ResStr + DESSTR[DES] + ' ';
                    DESED := DESED - 10 * DES;
                end;
            end;
    end;
   //сотни
    SOT := Trunc(RUB / 100);
    if (SOT > 0) and (SOT < 10) then
        ResStr := ResStr + SOTSTR[SOT] + ' ';
    DESED := RUB - 100 * SOT;
//    Des := 0; - убрал вылазит хинт Воронов О.А.
    if Summa < 1 then
        ResStr := 'ноль';
    while true do
        case DESED of
            0: Break;
            1: begin
                    ResStr := ResStr + 'один';
                    Break;
                end;
						2..4: begin
                    ResStr := ResStr + ED2_4STR[DESED];
                    Break;
                end;
            5..19: begin
                    ResStr := ResStr + ED5_19STR[DESED];
                    Break;
                end;
        else begin
                Des := Trunc(DESED / 10);
                ResStr := ResStr + DESSTR[DES] + ' ';
                DESED := DESED - 10 * DES;
            end;
        end;
    case DESED of
        0, 5..19: ST := ' pублей ';
        1: ST := ' pубль ';
        2..4: ST := ' pубля ';
    end;
    if lRub then begin
        ResStr := ResStr + ST;
        ResStr := ResStr + KopToStr(Kop);
    end;
    ResStr := AnsiUpperCase(ResStr[1]) + copy(ResStr, 2, Length(ResStr) - 1);
    Result := ResStr;
end;

function TfrmGetPeriod.FLOAT_NUMBER_TO_WORDS(aSource: Double; aRod: integer;
  aWordFor1, aWordFor234, aWordFor567890_1x: string): string;
var
  oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(Self);
  oq.Session := os;
  oq.DeclareAndSet('aSource', otFloat, aSource);
  oq.DeclareAndSet('aRod', otInteger, aRod);
  oq.DeclareAndSet('aWordFor1', otString, aWordFor1);
  oq.DeclareAndSet('aWordFor234', otString, aWordFor234);
  oq.DeclareAndSet('aWordFor567890_1x', otString, aWordFor567890_1x);
  oq.DeclareAndSet('aRes', otString, '');
  oq.SQL.Text := 'begin'#13#10' :aRes := ASU.FLOAT_NUMBER_TO_WORDS(:aSource, :aRod, :aWordFor1, :aWordFor234, :aWordFor567890_1x);'#13#10'end;';
  oq.Execute;
  Result := oq.GetVariable('aRes')
end;


procedure TfrmGetPeriod.frPrihDocUserFunction(const Name: String; p1, p2,
  p3: Variant; var Val: Variant);
var
	d : string;
begin
	if name = 'MYSTRTOFLOAT' then
	begin
		d := frParser.Calc(p1);
		val:=StringReplace(d,',', '.',[rfReplaceAll]);
	end;   
	if UpperCase(name) = 'MONEYSTR' then
	begin
    d := frParser.Calc(p1);
		val := MoneyToString(StrToFloat(d), TRUE);
  end;  
	if UpperCase(name) = 'FLOATSTR' then
	begin
    d := frParser.Calc(p1);
		val := FLOAT_NUMBER_TO_WORDS(StrToFloat(d), 0, 'целое', 'целых', 'целых');
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
  lcbMO_GROUP.EditValue := StrToInt(IniReadString( FIniName,'Params', 'LastMOGroupID', '-1'));
end;

procedure TfrmGetPeriod.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  IDs : string;
  i : Integer;
begin
  IDs := '';
  for i := 0 to ccbUchGr.Properties.Items.Count - 1 do
  begin
    if ccbUchGr.States[i] = cbsChecked then
      IDs := IDs + '|'+IntToStr(ccbUchGr.Properties.Items[i].Tag);
  end;
  Delete(IDs, 1, 1);
  IniWriteString(FIniName,'Params', 'LastUchGr', IDs);
  
  IniWriteString(FIniName,'Params', 'LastMOGroupID', IntToStr(lcbMO_GROUP.EditValue));
  Action := caFree;
end;

procedure TfrmGetPeriod.frPrihDocGetValue(const ParName: String;  var ParValue: Variant);
begin
  if ParName = 'var_receiver' then
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
  end; // if ParName = 'var_receiver' then

  if ParName = 'MEDOTRADE_SIGN' then ParValue := ReadMedotradeSign;  
end;

procedure TfrmGetPeriod.buUchGrClearClick(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to ccbUchGr.Properties.Items.Count - 1 do
    ccbUchGr.States[i] := cbsUnChecked;
end;

procedure TfrmGetPeriod.buUchGrSelectAllClick(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to ccbUchGr.Properties.Items.Count - 1 do
    ccbUchGr.States[i] := cbsChecked;
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
  StrList.Text := StringToListStr(IniReadString(FIniName,'Params', 'LastUchGr', '-1'));
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

//  lcbCloseUp(nil);
end;

procedure TfrmGetPeriod.tlOKDPDblClick(Sender: TObject);
begin
  peOKDP.Text := odsOKDP.FieldByName('FC_NAME').AsString;
  peOKDP.Tag := odsOKDP.FieldByName('FK_ID').AsInteger;
  peOKDP.PopupWindow.CloseUp;
end;

procedure TfrmGetPeriod.tlOKDPKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = CHR(VK_RETURN) then
  begin
    peOKDP.Text := odsOKDP.FieldByName('FC_NAME').AsString;
    peOKDP.Tag := odsOKDP.FieldByName('FK_ID').AsInteger;
    peOKDP.PopupWindow.CloseUp;
  end;
end;

function TfrmGetPeriod.GetGroupRow(AText: String): String;
begin
  Result :=
  '<tr class=xl2816380 height=17 style=''mso-height-source:userset;height:12.75pt''>'#13#10+
  '  <td height=17 class=xl3316380 style=''height:12.75pt;border-top:none''>&nbsp;</td>'#13#10+
  '  <td colspan=8 class=xl4516380 width=702 style=''border-right:.5pt solid black;border-left:none;width:529pt''>'+AText+'</td>'#13#10+
  '</tr>'#13#10;
end;

function TfrmGetPeriod.GetRow(aNum, aName, aEdIzm, aFinsource, aSerial, aGodenDo, aPrice, aKol, aSumm: String): String;
begin
  Result :=
  '<tr class=xl2816380 height=17 style=''mso-height-source:userset;height:12.75pt''>'#13#10+
  '  <td height=17 class=xl4116380 width=33 style=''height:12.75pt;border-top:none;width:25pt'' >'+aNum+'</td>'#13#10+
  '  <td class=xl4116380 width=270 style=''border-top:none;border-left:none;width:203pt''>'+aName+'</td>'#13#10+
  '  <td class=xl2416380 width=38 style=''border-top:none;border-left:none;width:29pt''>'+aEdIzm+'</td>'#13#10 +    
  '  <td class=xl2416380 width=45 style=''border-top:none;border-left:none;width:38pt''>'+aFinsource+'</td>'#13#10 +
  '  <td class=xl4116380 style=''border-top:none;border-left:none'' >'+aSerial+'</td>'#13#10+
  '  <td class=xl2616380 style=''border-top:none;border-left:none'' >'+aGodenDo+'</td>'#13#10+
  '  <td class=xl3816380 style=''border-top:none;border-left:none'' >'+aPrice+'</td>'#13#10+
  '  <td class=xl3816380 style=''border-top:none;border-left:none'' >'+aKol+'</td>'#13#10+
  '  <td class=xl3816380 style=''border-top:none;border-left:none'' >'+aSumm+'</td>'#13#10+
  '</tr>'#13#10;
end;

function TfrmGetPeriod.GetEndGroupRow(AText, aSumm: String): String;
begin
  Result :=
  '<tr height=17 style=''mso-height-source:userset;height:12.75pt''>'#13#10+
  '  <td height=17 colspan = 8 class=xl3416380 style=''height:12.75pt;border-top:none''>'+AText+'</td>'#13#10+
//  '  <td class=xl3416380 style=''border-top:none;border-left:none''>&nbsp;</td>'#13#10+
//  '  <td class=xl3416380 style=''border-top:none;border-left:none''>&nbsp;</td>'#13#10+
//  '  <td class=xl3516380 style=''border-top:none;border-left:none''>&nbsp;</td>'#13#10+
//  '  <td class=xl3416380 style=''border-top:none;border-left:none''>&nbsp;</td>'#13#10+
//  '  <td class=xl3416380 style=''border-top:none;border-left:none''>&nbsp;</td>'#13#10+
//  '  <td class=xl3616380 style=''border-top:none;border-left:none''>&nbsp;</td>'#13#10+
  '  <td class=xl3716380 align=right style=''border-top:none;border-left:none''>'+aSumm+'</td>'#13#10+
  '</tr>';
end;

procedure TfrmGetPeriod.MakeExcelReport(aFileName, aGroupFieldName: string);
var
  S, sGroup: String;
  N: Integer;
  sFileName1, sFileName2: String;
  Excel: Variant;
  FN_SUMM, FN_GROUP_SUMM : Double;
  RowCount : integer;
begin
  Screen.Cursor:=crHourGlass;

  S:='';
  sGroup:='';
  N:=0;

  with odsRep do
  begin
//    if Active then Close;
//    Open;
    First;
    RowCount := RecordCount;
    FN_SUMM := 0;
    FN_GROUP_SUMM := 0;
    sGroup:=FieldByName(aGroupFieldName).AsString;
    S:=S+#13#10+GetGroupRow(sGroup);    
    while not Eof do
    begin
      if FieldByName(aGroupFieldName).AsString<>sGroup then
      begin
        S:=S+#13#10+GetEndGroupRow( 'Итого по группе учетности: "'+sGroup+'"', FloatToStrF(FN_GROUP_SUMM,ffNumber, 15, 2));
        FN_GROUP_SUMM := 0;
        sGroup := FieldByName(aGroupFieldName).AsString;
        Inc(RowCount,2); // не забудь приплюсовать футер группы 
        S:=S+#13#10+GetGroupRow(sGroup);
        N:=0;
      end;

      Inc(N);
      S:=S+#13#10+GetRow(IntToStr(N),
                         FieldByName('FC_NAME').AsString,
                         FieldByName('FC_EDIZM').AsString,  
                         FieldByName('FC_FINSOURCE').AsString,
                         FieldByName('FC_SERIAL').AsString,
                         FieldByName('FD_GODEN').AsString,
                         FloatToStrF(FieldByName('FN_PRICE').AsFloat,ffNumber, 15, 2),
                         FieldByName('FC_OST').AsString,
                         FloatToStrF(FieldByName('FN_OSTSUM').AsFloat, ffNumber, 15, 2));
      FN_SUMM := FN_SUMM + FieldByName('FN_OSTSUM').AsFloat;
      FN_GROUP_SUMM := FN_GROUP_SUMM + FieldByName('FN_OSTSUM').AsFloat;
      Next;
    end; // while not Eof do
    if RecordCount > 0 then S:=S+#13#10+GetEndGroupRow( 'Итого по группе учетности: "'+sGroup+'"', FloatToStrF(FN_GROUP_SUMM, ffNumber, 15, 2) );
    Close;
  end; // with odsRep do

  sFileName1 := ChangeFileExt(fdmPrintSelect.PrepareFilePath(aFileName), 'htm');
  sFileName2 := ChangeFileExt(sFileName1,'.xls');
  SaveResToFile( 'VedomOstatExlShablon', 'htm', sFileName1);

  with TStringList.Create do
  begin
    LoadFromFile(sFileName1);
    Text:=StringReplace(Text, '::REPLACEHERE::', S,                                                  [rfIgnoreCase]);
    Text:=StringReplace(Text, '::FN_SUMM::',     FloatToStrF(FN_SUMM, ffCurrency, 15, 2),            [rfIgnoreCase]);
    Text:=StringReplace(Text, '::Otdelenie::',   odsGroupMo.FieldByName('FC_GROUP').AsString,        [rfIgnoreCase]);
    Text:=StringReplace(Text, '::UCHREJDENIE::', GetTSMINIValue( os, 'MANAGER_DOC', 'CLIENT_NAME' ), [rfIgnoreCase]);
    Text:=StringReplace(Text, '::DATE1::',       DateTimeToStr(dDate2.Date),                         [rfIgnoreCase]);

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
  Excel.Rows['13:'+IntToStr(RowCount+13)].EntireRow.AutoFit;

  Excel.ActiveSheet.PageSetup.PrintTitleRows:='$12:$12';
  Excel.ActiveSheet.PageSetup.Zoom := 85;

  Excel.Visible:=True;
  DeleteFile(sFileName1);

  Screen.Cursor:=crDefault;
end;



end.

