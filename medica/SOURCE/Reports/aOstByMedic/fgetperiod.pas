
unit fgetperiod;

interface

uses Windows,
//frxDSet,
 frxDBSet, Db,
  frxClass,
  fr_Class,

  frOLEExl, frXMLExl, frxDesgn, OracleData, Oracle, Classes,
  ActnList, ImgList, Controls, DBCtrls, ComCtrls, ToolWin, StdCtrls,
  ExtCtrls, Forms, HtmlHlp, JvExMask, JvToolEdit, Mask, cxGraphics,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, OracleMonitor, frxExportXLS, frxExportXML;

const NullDate = -700000;

type
  TfrmGetPeriod = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ilImages: TImageList;
    alActions: TActionList;
    aSave: TAction;
    aCancel: TAction;
    os: TOracleSession;
    odsRep: TOracleDataSet;
    Panel3: TPanel;
    odsMedic: TOracleDataSet;
    dsMedic: TDataSource;
    Label3: TLabel;
    frxDesigner: TfrxDesigner;
    acExcelExport: TAction;
    frxXMLExport1: TfrxXMLExport;
    frxXLSExport1: TfrxXLSExport;
    frRep: TfrxReport;
    dDate1: TJvDateEdit;
    frOdsRep: TfrxDBDataset;
    frRep_Old: TfrxReport;
    lcb: TcxLookupComboBox;
    oqFUNC_SET: TOracleQuery;
    oqInitMO: TOracleQuery;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure ToolBar1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure frRepGetValue(const ParName: String; var ParValue: Variant);
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
    procedure odsMedicAfterOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lcbPropertiesCloseUp(Sender: TObject);
    function frRepUserFunction(const MethodName: string; var Params: Variant): Variant;

  private
    { Private declarations }
    FLang: array[0..KL_NAMELENGTH] of char; //Раскладка клавиатуры
  PUBLIC
    { Public declarations }
  end;

var
  frmGetPeriod      : TfrmGetPeriod;

implementation

uses Sysutils, Variants, IniFiles, fdmPrintSelect, uGlobalConst, SMMainAPI;

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
//==============================================================================
procedure TfrmGetPeriod.aSaveExecute(Sender: TObject);
var
  P : TPoint;
begin
  Lcb.PostEditValue;
  try
    StrToDate( dDate1.Text );
//  if dDate1.Date = NullDate then
//  begin
  except on EConvertError do
    begin
      Application.MessageBox('Неверно указана дата!', 'Ошибка', MB_OK + MB_ICONERROR);
      Self.dDate1.SetFocus;
      Exit;
    end;
  end;
  if VarIsNull(lcb.EditValue) then
  begin
    Application.MessageBox('Не выбран медикамент!', 'Ошибка', MB_OK + MB_ICONERROR);
    lcb.SetFocus;
    Exit;
  end;

//  if FileExists('aOstByMedic.frf') then            // если найден файл
//    frRep.LoadFromFile('aOstByMedic.frf');  // загружаем его

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
    odsMedic.Locate('MEDICID', lcb.EditValue,[]);
    dDate1.Date := trunc(dDate1.Date);
    odsRep.SetVariable('DATE2',dDate1.Date);
    odsRep.SetVariable('MEDICID',lcb.EditValue);
    odsRep.Open;
//    frRep.Title := Application.Title;

    self.Hide;
    case dmPrintSelect.PrintFlag of // флаг куда печатать
      1:
      begin
        dmPrintSelect.frxXLSExport1.PageBreaks := False;
        frRep.FindObject('PageFooter1').Visible := False;
        frRep.PrepareReport;
        ExportFRToExcel( frRep, 'Вед-ть выборки ост. '+odsMedic.FieldByName('FC_MEDIC').AsString+'  в отд-ях на '+DateToStr(dDate1.Date)+'.xls' );
      end;

      2: frRep.ShowReport;
    end;

  finally
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
  frRep.DesignReport;
end;

procedure TfrmGetPeriod.FormCreate(Sender: TObject);
var
  FK_APPSOTR_ID : Integer;
begin
  try
//    os.LogOn;
    GetSession(os, 'ASU');
  except
    Application.MessageBox('Нет соединения с базой данных!','Ошибка',mb_ok + mb_iconerror);
    Application.Terminate;
    Abort;
  end;
  
  dDate1.Date:=Now;
  //Запоминаем текущюю раскладку
  GetKeyboardLayoutName(FLang);
  //Загружаем русскую раскладку клавиатуры
  LoadKeyboardLayout(PChar('00000419'), KLF_ACTIVATE);
  Self.Caption := Application.Title;

  if TryStrToInt(ParamStr(1), FK_APPSOTR_ID) = False then
    FK_APPSOTR_ID := -1;
  oqInitMO.SetVariable('PAPPSOTRID', FK_APPSOTR_ID);
  oqInitMO.Execute;

  odsMedic.Open;
  odsMedic.First;
end;

procedure TfrmGetPeriod.frRepGetValue(const ParName: String;  var ParValue: Variant);
var
  s : string;
begin
  if ParName = 'var_date' then ParValue := dDate1.Date;
  if ParName = 'var_title' then
  begin
//:VALUE, :ISUSESKLAD, :CUR_MO_SKLAD_SYNONIM
    oqFUNC_SET.Execute;
    s := oqFUNC_SET.GetVariable('value');
    if ((s = '0')and(oqFUNC_SET.GetVariable('ISUSESKLAD') = 0))or((s = '0')and(oqFUNC_SET.GetVariable('ISUSESKLAD') = 1)and(oqFUNC_SET.GetVariable('CUR_MO_SKLAD_SYNONIM') = 'APTEKA'))
      then ParValue := 'Ведомость выборки остатков медикамента'#13#10'в подразделениях ОКБ';
    if ((s = '0')and(oqFUNC_SET.GetVariable('ISUSESKLAD') = 1)and(oqFUNC_SET.GetVariable('CUR_MO_SKLAD_SYNONIM') = 'IMN'))
      then ParValue := 'Ведомость выборки остатков'#13#10'в подразделениях ОКБ';

    if s = '1' then ParValue := 'Ведомость выборки остатков медикамента'#13#10'в отделениях стационара';
  end;
 end;


function TfrmGetPeriod.frRepUserFunction(const MethodName: string; var Params: Variant): Variant;
var
	d : string;
begin
	if UpperCase(MethodName) = 'MYSTRTOFLOAT' then
	begin
		d := frParser.Calc(Params[0]);
		Result:=StringReplace(d,',', '.',[rfReplaceAll]);
	end;

  if UpperCase(MethodName) = 'MEDOTRADE_SIGN' then
  begin
    Result := ReadMedotradeSign();
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
  lcb.EditValue := StrToInt(IniReadString(Application.ExeName+'.ini','Params', 'LastMedicID', '-1'));
end;

procedure TfrmGetPeriod.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IniWriteString(Application.ExeName+'.ini','Params', 'LastMedicID', IntToStr(lcb.EditValue));
  LoadKeyboardLayout(FLang, KLF_ACTIVATE);
  Action := caFree;
end;

procedure TfrmGetPeriod.lcbPropertiesCloseUp(Sender: TObject);
begin
//
end;

end.


