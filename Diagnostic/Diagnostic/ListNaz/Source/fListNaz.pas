unit fListNaz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, StdCtrls, ExtCtrls, ImgList, cxStyles, cxCustomData, cxGraphics, cxFilter,
	cxData, cxDataStorage, cxEdit, DB, cxDBData, ActnList, OracleData,
	Oracle, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
	cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, jvDbUtils,
  Menus, cxSplitter, cxContainer, cxTextEdit, cxMemo, cxImageComboBox,
  cxMaskEdit, cxDropDownEdit, cxCalendar, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxGridExportLink, frxClass, frxDBSet, JclFileUtils, uGlobalConst, SMMainAPI,
  dxSkinOffice2007Green;

type
  TfrmMain = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    tbnRefresh: TToolButton;
    IL: TImageList;
    ToolButton1: TToolButton;
    Panel2: TPanel;
    p1: TPanel;
    p2: TPanel;
    p3: TPanel;
    p4: TPanel;
    p5: TPanel;
    p6: TPanel;
    p7: TPanel;
    blWeeks: TButton;
    blMon: TButton;
    brWeeks: TButton;
    brMon: TButton;
    pMonth: TPanel;
    TVLISTNAZ: TcxGridDBTableView;
    cxGrLevel1: TcxGridLevel;
    cxGr: TcxGrid;
    dsListNaz: TDataSource;
    os: TOracleSession;
    odsListNaz: TOracleDataSet;
    AL: TActionList;
    aRefresh: TAction;
    VTIME: TcxGridDBColumn;
    VNAME: TcxGridDBColumn;
    VPODGOTOVKA: TcxGridDBColumn;
    ToolButton2: TToolButton;
    tbnCloae: TToolButton;
    aClose: TAction;
    pmTV: TPopupMenu;
    N2: TMenuItem;
    VFIOPAC: TcxGridDBColumn;
    VDATEBIRTH: TcxGridDBColumn;
    VAGE: TcxGridDBColumn;
    VSEX: TcxGridDBColumn;
    VDIAG: TcxGridDBColumn;
    VPALATA: TcxGridDBColumn;
    paMemo: TPanel;
    cxText: TcxMemo;
    cxSplitter1: TcxSplitter;
    VKAB: TcxGridDBColumn;
    VCOUNT: TcxGridDBColumn;
    ILcount: TImageList;
    dxdeDate: TcxDateEdit;
    tbnPrint: TToolButton;
    ToolButton4: TToolButton;
    aPrint: TAction;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aExcel: TAction;
    N1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Web1: TMenuItem;
    XML1: TMenuItem;
    Excel1: TMenuItem;
    sdPopUp: TSaveDialog;
    frxPrintList: TfrxReport;
    frxDBList: TfrxDBDataset;
    procedure blMonClick(Sender: TObject);
    procedure blWeeksClick(Sender: TObject);
    procedure p1Click(Sender: TObject);
    procedure p2Click(Sender: TObject);
    procedure p3Click(Sender: TObject);
    procedure p4Click(Sender: TObject);
    procedure p5Click(Sender: TObject);
    procedure p6Click(Sender: TObject);
    procedure p7Click(Sender: TObject);
    procedure brWeeksClick(Sender: TObject);
    procedure brMonClick(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure odsListNazBeforeOpen(DataSet: TDataSet);
    procedure aCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N2Click(Sender: TObject);
    procedure odsListNazAfterScroll(DataSet: TDataSet);
    procedure cxDateEdit1PropertiesChange(Sender: TObject);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aExcelExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure frxPrintListGetValue(const VarName: string; var Value: Variant);
    procedure osAfterLogOn(Sender: TOracleSession);
    procedure FormCreate(Sender: TObject);
  private
    MedotradeSign : string;
    sCompany_4Rep, sOtdel_4Rep, sDateSys_4Rep : string;
    sVrachFIO : string;
    procedure DateChange;
    { Private declarations }
  public
    pAPPSOTRID, pSOTRID, pOTDELID : Integer;
    procedure DoShowForm;
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.blMonClick(Sender: TObject);
var mm,yy,dd:word;
begin
  decodeDate(dxdeDate.Date,yy,mm,dd);
  if dd=31 then dd:=30;
  if ((mm=3) and (dd>28)) then dd:=28;
  if mm>1 then mm:=mm-1
   else
     begin
       mm:=12;
       yy:=yy-1;
     end;

  dxdeDate.Date:=encodeDate(yy,mm,dd);
end;

procedure TfrmMain.blWeeksClick(Sender: TObject);
begin
  dxdeDate.Date:=dxdeDate.Date-1;
end;

procedure TfrmMain.p1Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(dxdeDate.Date);
  if wd=1 then wd:=8;
  dxdeDate.Date:=dxdeDate.Date-wd+2;
end;

procedure TfrmMain.p2Click(Sender: TObject);
var
 wd:integer;
begin
  wd:=dayofweek(dxdeDate.Date);
  if wd=1 then wd:=8;
  dxdeDate.Date:=dxdeDate.Date-wd+3;
end;

procedure TfrmMain.p3Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(dxdeDate.Date);
  if wd=1 then wd:=8;
  dxdeDate.Date:=dxdeDate.Date-wd+4;
end;

procedure TfrmMain.p4Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(dxdeDate.Date);
  if wd=1 then wd:=8;
  dxdeDate.Date:=dxdeDate.Date-wd+5;
end;

procedure TfrmMain.p5Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(dxdeDate.Date);
  if wd=1 then wd:=8;
  dxdeDate.Date:=dxdeDate.Date-wd+6;
end;

procedure TfrmMain.p6Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(dxdeDate.Date);
  if wd=1 then wd:=8;
  dxdeDate.Date:=dxdeDate.Date-wd+7;
end;

procedure TfrmMain.p7Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(dxdeDate.Date);
  if wd=1 then wd:=8;
  dxdeDate.Date:=dxdeDate.Date-wd+8;
end;

procedure TfrmMain.brWeeksClick(Sender: TObject);
begin
  dxdeDate.Date:=dxdeDate.Date+1;
end;

procedure TfrmMain.brMonClick(Sender: TObject);
var yy,mm,dd:word;
begin
  decodeDate(dxdeDate.Date,yy,mm,dd);
  if dd=31 then dd:=30;
  if ((mm=1) and (dd>28)) then dd:=28;
  if mm<12 then mm:=mm+1
   else
     begin
       mm:=1;
       yy:=yy+1;
     end;
  dxdeDate.Date:=encodeDate(yy,mm,dd);
end;

procedure TfrmMain.DateChange;
var
 yy,mm,dd:word;
 wd:integer;
// pDate:tDateTime;
begin
//  pDate:=dxdeDate.Date;
  pMonth.Caption:=FormatDateTime('mmmm',dxdeDate.Date)+', '+(FormatDateTime('dddd',dxdeDate.Date));

  wd:=dayofweek(dxdeDate.Date);
  if wd=1 then wd:=8;
//  pDate:=dxdeDate.Date;

//  pDate:=dxdeDate.Date-wd+2;
  decodeDate(dxdeDate.Date-wd+2,yy,mm,dd);
  p1.Caption:=inttostr(dd);

//  pDate:=dxdeDate.Date-wd+3;
  decodeDate(dxdeDate.Date-wd+3,yy,mm,dd);
  p2.Caption:=inttostr(dd);

//  pDate:=dxdeDate.Date-wd+4;
  decodeDate(dxdeDate.Date-wd+4,yy,mm,dd);
  p3.Caption:=inttostr(dd);

//  pDate:=dxdeDate.Date-wd+5;
  decodeDate(dxdeDate.Date-wd+5,yy,mm,dd);
  p4.Caption:=inttostr(dd);

//  pDate:=dxdeDate.Date-wd+6;
  decodeDate(dxdeDate.Date-wd+6,yy,mm,dd);
  p5.Caption:=inttostr(dd);

//  pDate:=dxdeDate.Date-wd+7;
  decodeDate(dxdeDate.Date-wd+7,yy,mm,dd);
  p6.Caption:=inttostr(dd);

//  pDate:=dxdeDate.Date-wd+8;
  decodeDate(dxdeDate.Date-wd+8,yy,mm,dd);
  p7.Caption:=inttostr(dd);

  p1.Color:=clCream;
  p2.Color:=clCream;
  p3.Color:=clCream;
  p4.Color:=clCream;
  p5.Color:=clCream;
  p6.Color:=clCream;
  p7.Color:=clCream;
  case wd-1 of
    1:p1.Color:=clSkyBlue;
    2:p2.Color:=clSkyBlue;
    3:p3.Color:=clSkyBlue;
    4:p4.Color:=clSkyBlue;
    5:p5.Color:=clSkyBlue;
    6:p6.Color:=clSkyBlue;
    7:p7.Color:=clSkyBlue;
  end;
end;

procedure TfrmMain.aExcelExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TVLISTNAZ.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aPrintExecute(Sender: TObject);
var ods : TOracleDataSet;
     id : Integer;
begin
  id := odsListNaz.FieldByName('FK_ID').AsInteger;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY HH24:MI'') AS DATESYS, '+#13+
                    '        ASU.PKG_SMINI.READSTRING (''CONFIG'', ''S_FULLNAME'', '''') AS COMPANYNAME, '+#13+
                    '        (SELECT FC_NAME '+#13+
                    '           FROM asu.TOTDEL '+#13+
                    '          WHERE FK_ID = (SELECT FK_OTDID FROM asu.TSOTR WHERE FK_ID = TAPPSOTR.FK_SOTRID)) AS OTDELNAME '+#13+
                    '   FROM LOGIN.TAPPSOTR WHERE FL_DEL <> 1 AND FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pAPPSOTRID);
    ods.Open;
    sCompany_4Rep := ods.FieldByName('COMPANYNAME').AsString;
    sOtdel_4Rep := ods.FieldByName('OTDELNAME').AsString;
    sDateSys_4Rep := ods.FieldByName('DATESYS').AsString;
  finally
    ods.Free;
  end;
  frxPrintList.ShowReport;
  odsListNaz.Locate('FK_ID', id, []);
end;

procedure TfrmMain.aRefreshExecute(Sender: TObject);
begin
  RefreshQuery(odsListNaz);
end;

procedure TfrmMain.aTextExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    if TVLISTNAZ.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aWebExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    if TVLISTNAZ.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aXMLExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    if TVLISTNAZ.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.DoShowForm;
var ods : TOracleDataSet;
    Ver : TJclFileVersionInfo;
begin
  pAPPSOTRID := StrToInt(paramstr(1));
  ods := TOracleDataSet.Create(nil);
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FK_SOTRID FROM LOGIN.TAPPSOTR WHERE FL_DEL <> 1 AND FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pAPPSOTRID);
    ods.Open;
    pSOTRID := ods.FieldByName('FK_SOTRID').AsInteger;
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT FK_OTDELID, FK_SPRAVID, DO_VRACHFIO(:PFK_ID) AS VRACHFIO FROM TSOTR WHERE FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pSOTRID);
    ods.Open;
    pOTDELID := ods.FieldByName('FK_OTDELID').AsInteger;
    sVrachFIO := ods.FieldByName('VRACHFIO').AsString;
    frmMain.Caption := 'Список исследований('+Ver.FileVersion+'). Пользователь: '+ods.FieldByName('VRACHFIO').AsString;
    dxdeDate.Date := Date;
    MedotradeSign := ReadMedotradeSign;
  finally
    ods.Free;
    Ver.Free;
  end;
//------------------------------------------------------------------------------
  TVLISTNAZ.StoreToRegistry('\SoftWare\SoftMaster\ListNaz\TVLISTNAZ'+'Vrach'+ '_' + IntToStr(pSOTRID)+'Default', TRUE, [], 'TVLISTNAZ');
  TVLISTNAZ.RestoreFromRegistry('\SoftWare\SoftMaster\ListNaz\TVLISTNAZ'+'Vrach'+ '_' + IntToStr(pSOTRID), FALSE, FALSE, [], 'TVLISTNAZ');
end;

procedure TfrmMain.odsListNazBeforeOpen(DataSet: TDataSet);
begin
  odsListNaz.SetVariable('PFD_RUN', dxdeDate.Date);
  odsListNaz.SetVariable('PFK_VRACHID', pSOTRID);
end;

procedure TfrmMain.osAfterLogOn(Sender: TOracleSession);
var Ver: TJclFileVersionInfo;
begin
  Sender.DBMS_Application_Info.Set_Client_Info(ParamStr(1));
	Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
	Sender.DBMS_Application_Info.Set_Module(ExtractFileName(ParamStr(0)) + ' (' + Ver.FileVersion + ')', Self.Name + ' "' + Self.Caption + '"');
	Ver.Free;
end;

procedure TfrmMain.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Вы хотите выйти из приложения ?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
    action := caFree
  else
    action := caNone;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  TVLISTNAZ.StoreToRegistry('\SoftWare\SoftMaster\ListNaz\TVLISTNAZ'+'Vrach'+ '_' + IntToStr(pSOTRID), TRUE, [], 'TVLISTNAZ');
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  GetSession(os, 'ASU');
end;

procedure TfrmMain.frxPrintListGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompany_4Rep;
  if VarName = 'OTDELNAME' then Value := sOtdel_4Rep;
  if VarName = 'SOTRNAME' then Value := sVrachFIO;
  if VarName = 'DATESYS' then Value := sDateSys_4Rep;
  if VarName = 'DATENOW' then Value := dxdeDate.Date;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;  
end;

procedure TfrmMain.N2Click(Sender: TObject);
begin
  TVLISTNAZ.RestoreFromRegistry('\SoftWare\SoftMaster\ListNaz\TVLISTNAZ'+'Vrach'+ '_' + IntToStr(pSOTRID)+'Default', FALSE, FALSE, [], 'TVLISTNAZ');
end;

procedure TfrmMain.odsListNazAfterScroll(DataSet: TDataSet);
begin
  cxText.Lines.Text := odsListNaz.FieldByName('FC_TEXT').AsString;
end;

procedure TfrmMain.cxDateEdit1PropertiesChange(Sender: TObject);
begin
  DateChange;
  odsListNaz.AfterScroll := nil;
  aRefreshExecute(nil);
  odsListNaz.AfterScroll := odsListNazAfterScroll;
  odsListNazAfterScroll(nil);
end;

end.
