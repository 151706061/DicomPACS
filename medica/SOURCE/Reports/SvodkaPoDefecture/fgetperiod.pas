unit fgetperiod;

interface

uses Windows, Db, frxDesgn, OracleData, Oracle, frxClass,// frxDSet,
  frxDBSet, Classes, ActnList, ImgList, Controls, DBCtrls, ComCtrls,
  ToolWin, StdCtrls, Mask, ExtCtrls, Forms, SysUtils, frOLEExl,
  Dialogs, frXMLExl, HtmlHlp, JvExMask, JvToolEdit, frxExportXLS, frxExportXML,FR_Class, frxExportImage, frxExportPDF;

type
  TfrmGetPeriod = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;                    
    dDate1: TJvDateEdit;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ilImages: TImageList;
    alActions: TActionList;
    aSave: TAction;
    aCancel: TAction;
    frDBDSSelDoc: TfrxDBDataset;
    frSvodkaPoDefekture: TfrxReport;
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
    frPrihDoc_Old: TfrxReport;
    odsGroupMo: TOracleDataSet;
    odsGroupMoGROUPID: TFloatField;
    odsGroupMoFC_GROUP: TStringField;
    odsGroupMoFL_DEL: TFloatField;
    dsGroupMo: TDataSource;
    lcbMO_GROUP: TDBLookupComboBox;
    frxPDFExport1: TfrxPDFExport;
    frxJPEGExport1: TfrxJPEGExport;
    odsTSMINI: TOracleDataSet;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure ToolBar1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
    procedure odsGroupMoAfterOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lcbMO_GROUPCloseUp(Sender: TObject);
    procedure frSvodkaPoDefektureGetValue(const ParName: String;
      var ParValue: Variant);
    function frSvodkaPoDefektureUserFunction(const MethodName: string;
      var Params: Variant): Variant;

  PRIVATE
    { Private declarations }                   
    bUseFinsourceColumn :Boolean;
    procedure MakeExcelReport(aFileName: string);
    function GetGroupRow(aName : string) : string;
    function GetRow(aNum, aName, aEdIzm, aFinSource, aOstKol, aMinZapas: String): String;
    function GetValueFromTSMINI (const aSection, aKey, aDefaultValue : string) : string;
  PUBLIC
    { Public declarations }
  end;

var
  frmGetPeriod      : TfrmGetPeriod;

implementation

uses ffio, Variants, IniFiles, fdmPrintSelect, ComObj, uGlobalConst, SMMainAPI;
{$R *.DFM}
//==============================================================================
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
  P : TPoint;
begin
  lcbMO_GROUP.CloseUp(True);
  try
    Self.dDate1.CheckValiddate;
  except
    on EConvertError do begin
      MessageBox(Self.Handle, 'Неверно введена начальная дата периода', 'Ошибка', MB_OK + MB_ICONERROR);
      Self.dDate1.SetFocus;
      Exit;
    end;
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
//  frmfio := Tfrmfio.Create(Self);
  try
//    frmFIO.edExSign.Text := lcbMO_GROUP.Text;
//    if frmFIO.ShowModal = mrOk then
//    begin
      
      if bUseFinsourceColumn then
        odsRep.SQL.Text := StringReplace(odsRep.SQL.Text, '--USE_FINSOURCE', '', [rfReplaceAll]);
        
      odsRep.SetVariable(':dol', ' '); //frmFIO.edPosition.text);
      odsRep.SetVariable(':ras', ' '); //frmFIO.edExSign.text);
      with odsRep do begin
        SetVariable('PFD1', dDate1.date);
        if VarIsNull(lcbMO_GROUP.KeyValue) then
          SetVariable('MOGROUP_ID', -1)
        else
          SetVariable('MOGROUP_ID', lcbMO_GROUP.KeyValue);
        Close;
        Open;
      end;
      with odsRepHeader do begin
        SetVariable('PFD1', dDate1.date);
        if VarIsNull(lcbMO_GROUP.KeyValue) then
          SetVariable('MOGROUP_ID', -1)
        else
          SetVariable('MOGROUP_ID', lcbMO_GROUP.KeyValue);
        Close;
        Open;
      end;
//      frSvodkaPoDefekture.ShowReport;
      Self.Hide;
//      frSvodkaPoDefekture.PrepareReport;
      case dmPrintSelect.PrintFlag of // флаг куда печатать
//        1: ExportFRToExcel( frSvodkaPoDefekture, 'Сводка по дефектуре на '+DateToStr(odsRepHeader.FieldByName('FD_1').AsDateTime)+'.xls' );
        1: MakeExcelReport('Сводка по дефектуре на '+DateToStr( dDate1.Date )+'.xls' );
        2:
        begin
           if FileExists('frxSvodkaPoDefekture.fr3') then
              frSvodkaPoDefekture.LoadFromFile('frxSvodkaPoDefekture.fr3');
          frSvodkaPoDefekture.ShowReport;
        end;
      end;
//    end;
  finally
//    frmfio.Free;
    dmPrintSelect.PrintFlag := 0;
    Close;
  end;
end;

procedure TfrmGetPeriod.aCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmGetPeriod.ToolBar1DblClick(Sender: TObject);
begin
  //frSvodkaPoDefekture.DesignReport;
end;

procedure TfrmGetPeriod.FormCreate(Sender: TObject);
var
  UchGrIdStr : string;
begin
  try
//    os.LogOn;
    GetSession(os, 'ASU');
  except
    Application.MessageBox('Нет соединения с базой данных!','Ошибка',mb_ok + mb_iconerror);
    Application.Terminate;
    Abort;
  end;

  bUseFinsourceColumn := GetValueFromTSMINI ( 'SVODKAPODEFECTURE.EXE', 'USE_FINSOURCE_COLUMN', '0' ) = '1';

  if GetValueFromTSMINI ( 'MEDICA.EXE', 'FUNC_USE_MEDUCHGRP_CH', '0' ) = '1' then
    UchGrIdStr := 'nvl (K.UCHGRID, M.UCHGRID)'
  else
    UchGrIdStr := 'M.UCHGRID';

  odsRep.SQL.Text := StringReplace(odsRep.SQL.Text,'#uchgrid#',
      UchGrIdStr, [rfReplaceAll, rfIgnoreCase] );

  dDate1.Date:=NOW;
  odsGroupMo.Open;
  Self.Caption := Application.Title;
end;

function TfrmGetPeriod.FormHelp(Command: Word; Data: Integer;
  var CallHelp: Boolean): Boolean;
begin
	Result := False;
	try
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
	end;
end;

procedure TfrmGetPeriod.odsGroupMoAfterOpen(DataSet: TDataSet);
begin
  lcbMO_GROUP.KeyValue := StrToInt(IniReadString(Application.ExeName+'.ini','Params', 'LastMOGroupID', '-1'));
  lcbMO_GROUPCloseUp(nil);
end;

procedure TfrmGetPeriod.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IniWriteString(Application.ExeName+'.ini','Params', 'LastMOGroupID', IntToStr(lcbMO_GROUP.KeyValue));
  Action := caFree;
end;

procedure TfrmGetPeriod.MakeExcelReport(aFileName: string);
var
  S, sGroup: String;
  N: Integer;
  sFileName1, sFileName2: String;
  Excel: Variant;
//  FN_SUMM, FN_GROUP_SUMM : Double;
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
    while not Eof do
    begin
      if FieldByName('FC_UCHGR').AsString<>sGroup then
      begin
        sGroup := FieldByName('FC_UCHGR').AsString;
        S:=S+#13#10+GetGroupRow(sGroup);
        Inc(RowCount);
        N:=0;
      end;

      Inc(N);  // GetRow(aNum, aName, aEdIzm, aOstKol, aMinZapas: String): String;
      if bUseFinsourceColumn then
      begin
        S:=S+#13#10+GetRow(IntToStr(N),
                           FieldByName('MEDIC_NAME').AsString,
                           FieldByName('FC_EDIZM').AsString,
                           FieldByName('FC_FINSOURCE').AsString,
                           FieldByName('FN_OST').AsString,
                           FieldByName('FN_COLVOMINZAPAS').AsString);
      end
      else
      begin
        S:=S+#13#10+GetRow(IntToStr(N),
                           FieldByName('MEDIC_NAME').AsString,
                           FieldByName('FC_EDIZM').AsString,
                           '',
                           FieldByName('FN_OST').AsString,
                           FieldByName('FN_COLVOMINZAPAS').AsString);
      end;
      Next;
    end; // while not Eof do
    Close;
  end; // with odsRep do

  if bUseFinsourceColumn and FileExists('SvodkaPoDefectureExlShablon.htm') then
  begin               
    sFileName1 := ChangeFileExt(fdmPrintSelect.PrepareFilePath(aFileName), 'htm');
    CopyFile(PAnsiChar('SvodkaPoDefectureExlShablon.htm'), PAnsiChar(sFileName1), false);
    sFileName2 := ChangeFileExt(sFileName1,'.xls');
  end
  else
  begin
    sFileName1 := ChangeFileExt(fdmPrintSelect.PrepareFilePath(aFileName), 'htm');
    sFileName2 := ChangeFileExt(sFileName1,'.xls');
    SaveResToFile( 'SvodkaPoDefectureExlShablon', 'htm', sFileName1);
  end;

  with TStringList.Create do
  begin
    LoadFromFile(sFileName1);
    Text:=StringReplace(Text, '::REPLACEHERE::', S,                                                  [rfIgnoreCase]);
    Text:=StringReplace(Text, '::Otdelenie::',   odsGroupMo.FieldByName('FC_GROUP').AsString,        [rfIgnoreCase]);
    Text:=StringReplace(Text, '::DATE1::',       DateTimeToStr(dDate1.Date),                         [rfIgnoreCase]);

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
  Excel.Rows['5:'+IntToStr(RowCount+5)].EntireRow.AutoFit;
  Excel.ActiveSheet.PageSetup.PrintTitleRows:='$4:$4';  
  Excel.ActiveSheet.PageSetup.Zoom:=89;
  Excel.Visible:=True;
  DeleteFile(sFileName1);

  Screen.Cursor:=crDefault;
end;

function TfrmGetPeriod.GetRow(aNum, aName, aEdIzm, aFinSource, aOstKol, aMinZapas: String): String;
begin
  if bUseFinsourceColumn then
  begin
    Result :=
      '<tr height=18 style=''mso-height-source:userset;height:13.7pt''>'#13#10+
      '  <td height=18 class=xl3431597 width=45 style=''height:13.7pt;border-top:none; width:34pt''>'+aNum+'</td>'#13#10+
      '  <td class=xl3331597 width=348 style=''border-top:none;border-left:none; width:261pt''>'+aName+'</td>'#13#10+
      '  <td class=xl3431597 width=66 style=''border-top:none;border-left:none; width:50pt''>'+aEdIzm+'</td>'#13#10+   
      '  <td class=xl3431597 width=66 style=''border-top:none;border-left:none; width:50pt''>'+aFinSource+'</td>'#13#10+
      '  <td class=xl3431597 width=72 style=''border-top:none;border-left:none; width:54pt''>'+aOstKol+'</td>'#13#10+
      '  <td class=xl3431597 width=107 style=''border-top:none;border-left:none; width:80pt''>'+aMinZapas+'</td>'#13#10+
      '</tr>'#13#10;
  end
  else
  begin
    Result :=
      '<tr height=18 style=''mso-height-source:userset;height:13.7pt''>'#13#10+
      '  <td height=18 class=xl3431597 width=45 style=''height:13.7pt;border-top:none; width:34pt''>'+aNum+'</td>'#13#10+
      '  <td class=xl3331597 width=348 style=''border-top:none;border-left:none; width:261pt''>'+aName+'</td>'#13#10+
      '  <td class=xl3431597 width=66 style=''border-top:none;border-left:none; width:50pt''>'+aEdIzm+'</td>'#13#10+
      '  <td class=xl3431597 width=72 style=''border-top:none;border-left:none; width:54pt''>'+aOstKol+'</td>'#13#10+
      '  <td class=xl3431597 width=107 style=''border-top:none;border-left:none; width:80pt''>'+aMinZapas+'</td>'#13#10+
      '</tr>'#13#10;
  end;
end;

procedure TfrmGetPeriod.lcbMO_GROUPCloseUp(Sender: TObject);
begin
  lcbMO_GROUP.Hint := lcbMO_GROUP.Text;
end;

function TfrmGetPeriod.GetGroupRow(aName : string): string;
begin        
  if bUseFinsourceColumn then
  begin
    Result :=
    '<tr height=18 style=''mso-height-source:userset;height:13.7pt''>'#13#10+
    '  <td height=18 class=xl3631597 width=45 style=''height:13.7pt;border-top:none; width:34pt''>&nbsp;</td>'#13#10+
    '  <td colspan=5 class=xl3731597 width=593 style=''border-right:.5pt solid black; border-left:none;width:445pt''><span style=''mso-spacerun:yes''>'+
    '  </span>'+aName+'</td>'#13#10+
    '</tr>'#13#10;
  end
  else
  begin
    Result :=
    '<tr height=18 style=''mso-height-source:userset;height:13.7pt''>'#13#10+
    '  <td height=18 class=xl3631597 width=45 style=''height:13.7pt;border-top:none; width:34pt''>&nbsp;</td>'#13#10+
    '  <td colspan=4 class=xl3731597 width=593 style=''border-right:.5pt solid black; border-left:none;width:445pt''><span style=''mso-spacerun:yes''>'+
    '  </span>'+aName+'</td>'#13#10+
    '</tr>'#13#10;
  end;
end;

procedure TfrmGetPeriod.frSvodkaPoDefektureGetValue(const ParName: String;
  var ParValue: Variant);
begin
  if ParName = 'MEDOTRADE_SIGN' then ParValue := ReadMedotradeSign;
end;

function TfrmGetPeriod.frSvodkaPoDefektureUserFunction(const MethodName: string;
  var Params: Variant): Variant;
var
	d : string;
begin
	if UpperCase(MethodName) = 'MYSTRTOFLOAT' then
	begin
		d := frParser.Calc(Params[0]);
		Result:=StringReplace(d,',', '.',[rfReplaceAll]);
	end;
end;

function TfrmGetPeriod.GetValueFromTSMINI(const aSection, aKey, aDefaultValue: string): string;
begin
  odsTSMINI.Close;
  odsTSMINI.SetVariable('ASECTION', aSection);
  odsTSMINI.SetVariable('AKEY', aKey);
  try
    odsTSMINI.Open;

    if odsTSMINI.RecordCount > 0 then
      Result := odsTSMINI.FieldByName('FC_VALUE').AsString
    else
      Result := aDefaultValue;

    odsTSMINI.Close;
  except
    Result := aDefaultValue;
  end;
end;


end.

