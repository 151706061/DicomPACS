unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, DB,
  dxmdaset, Oracle, ActnList, ImgList, dxBar, cxClasses, Menus, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxGridLevel, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGrid, cxSplitter, JvExControls, JvAnimatedImage, JvGIFCtrl,
  cxContainer, cxLabel, ExtCtrls, OracleData, cxGridExportLink, frxClass,
  frxDBSet, JclFileUtils, uGlobalConst, SMMainAPI, dxSkinOffice2007Green;

type
  TfrmMain = class(TForm)
    pmTV: TPopupMenu;
    N1: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    N2: TMenuItem;
    BM: TdxBarManager;
    BMBar1: TdxBar;
    bbClose: TdxBarButton;
    bbParam: TdxBarButton;
    bbPrint: TdxBarButton;
    bbRefresh: TdxBarButton;
    ilMain: TImageList;
    sdPopUp: TSaveDialog;
    alMain: TActionList;
    aClose: TAction;
    aParam: TAction;
    aPrint: TAction;
    aRefresh: TAction;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aXLS: TAction;
    os: TOracleSession;
    dsJournal: TDataSource;
    oqThread: TOracleQuery;
    dxBarDockControl1: TdxBarDockControl;
    paParam: TPanel;
    Splitter1: TSplitter;
    paMainParam: TPanel;
    cxLabel1: TcxLabel;
    lbBeg: TcxLabel;
    paSubParam: TPanel;
    Animator1: TJvGIFAnimator;
    cxLabel6: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel4: TcxLabel;
    cxSplitter1: TcxSplitter;
    cxGr: TcxGrid;
    TV: TcxGridTableView;
    cxGrLevel1: TcxGridLevel;
    VNAME: TcxGridColumn;
    VPLAN: TcxGridColumn;
    VOSMOTRENO: TcxGridColumn;
    V2YEAR: TcxGridColumn;
    frxRepPrint: TfrxReport;
    dxMemData1: TdxMemData;
    frxDBPrint: TfrxDBDataset;
    dxMemData1FC_NAME: TStringField;
    dxMemData1PLAN: TIntegerField;
    dxMemData1OSMOTRENO: TIntegerField;
    dxMemData1TWO_YEARS: TIntegerField;
    dxMemData1OSMOTRENO_TWO_YEARS: TIntegerField;
    VOSMOTRENO_2YEAR: TcxGridColumn;
    cxLabel2: TcxLabel;
    lbEnd: TcxLabel;
    procedure aParamExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N2Click(Sender: TObject);
    procedure oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer;
      const ErrorMessage: string);
    procedure oqThreadThreadFinished(Sender: TOracleQuery);
    procedure oqThreadThreadRecord(Sender: TOracleQuery);
    procedure aRefreshExecute(Sender: TObject);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure frxRepPrintGetValue(const VarName: string; var Value: Variant);
    procedure osAfterLogOn(Sender: TOracleSession);
    procedure FormCreate(Sender: TObject);
  private
    dDateBeg, dDateEnd : TDateTime;
    sDateSys_4rep : string;
    sSysDate : string;
    sVrachFIO : String;
    sCompanyName, sOtdelName : string;
    procedure CheckEnabledButtons;
    { Private declarations }
  public
    pSOTRID : Integer;
    MedotradeSign : string;
    sMonthPeriod : string;
    sDatePeriod : string;
    procedure DoShowForm;
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  StartTime: TTime;
  bbr : Boolean;
implementation

uses fSetParam, uPeriod;

{$R *.dfm}

procedure TfrmMain.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.aParamExecute(Sender: TObject);
begin
  with TfrmParamDate.Create(Self) do
    begin
      if Execute then
        begin
      if ModalResult = MrOK then
        begin
          dDateBeg := Period.First;
          dDateEnd := Period.Last;
          lbBeg.Caption := DateTimeToStr(Period.First);
          lbEnd.Caption := DateTimeToStr(trunc(Period.Last));
          bbr := False;
          aRefresh.Enabled := False;
          aParam.Enabled := False;
          aPrint.Enabled := False;
          cxLabel6.Caption := '';
          cxLabel5.Caption := '';
          cxLabel4.Caption := 'Выполняется запрос к Базе Данных...';

          if TV.DataController.LockCount = 0 then
            TV.BeginUpdate;
          TV.DataController.RecordCount := 0;
          while TV.DataController.LockCount > 0 do
            TV.EndUpdate;
          cxGr.Refresh;
          dxMemData1.Close;
          dxMemData1.Open;

          paParam.Visible := True;
          paSubParam.Visible := True;
          cxSplitter1.Visible := True;

          StartTime:= Now;
          cxLabel6.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
          cxLabel6.Refresh;
          oqThread.Scrollable := True;
          Animator1.Animate := True;
          oqThread.SetVariable('PDATE1', dDateBeg);
          oqThread.SetVariable('PDATE2', dDateEnd);
          oqThread.Execute;
        end;
        end;
    Free;
  end;
end;

procedure TfrmMain.aPrintExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY HH24:MI'') AS DATESYS FROM DUAL ';
    ods.Open;
    sDateSys_4rep := ods.FieldByName('DATESYS').AsString;
  finally
    ods.Free;
  end;
  frxRepPrint.ShowReport;
end;

procedure TfrmMain.aRefreshExecute(Sender: TObject);
begin
  aRefresh.Enabled := False;
  aParam.Enabled := False;
  aPrint.Enabled := False;

  cxLabel4.Caption := 'Выполняется запрос к Базе Данных...';
  if TV.DataController.LockCount = 0 then
    TV.BeginUpdate;
  TV.DataController.RecordCount := 0;
  while TV.DataController.LockCount > 0 do
    TV.EndUpdate;
  cxGr.Refresh;
  dxMemData1.Close;
  dxMemData1.Open;
  StartTime:= Now;
  oqThread.Scrollable := True;
  Animator1.Animate := True;
  oqThread.Execute;
end;

procedure TfrmMain.aTextExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    ExportGridToText(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aWebExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aXMLExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.CheckEnabledButtons;
begin
  aPrint.Enabled := oqThread.RowCount <> 0;
end;

procedure TfrmMain.DoShowForm;
var ods : TOracleDataSet;
    Ver : TJclFileVersionInfo;
begin
  ods := TOracleDataSet.Create(nil);
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FK_SOTRID, ASU.DO_VRACHFIO(FK_SOTRID) AS VRACHFIO, TO_CHAR(SYSDATE, ''YYYY'') AS DATESYS, '+#13+
                    '        ASU.PKG_SMINI.READSTRING (''CONFIG'', ''S_FULLNAME'', '''') AS COMPANYNAME, '+#13+
                    '        (SELECT FC_NAME FROM ASU.TOTDEL WHERE FK_ID = (SELECT FK_OTDID FROM ASU.TSOTR WHERE FK_ID = TAPPSOTR.FK_SOTRID)) AS OTDELNAME '+#13+
                    '   FROM LOGIN.TAPPSOTR WHERE FL_DEL <> 1 AND FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, StrToInt(paramstr(1)));
    ods.Open;
    pSOTRID := ods.FieldByName('FK_SOTRID').AsInteger;
    sVrachFIO := ods.FieldByName('VRACHFIO').AsString;
    sCompanyName := ods.FieldByName('COMPANYNAME').AsString;
    frmMain.Caption := 'ПЛАН ПО УЧАСТКАМ - ОБЩИЙ('+Ver.FileVersion+'). Пользователь: '+sVrachFIO;
    sOtdelName := ods.FieldByName('OTDELNAME').AsString;
    sSysDate := ods.FieldByName('DATESYS').AsString;
  finally
    ods.Free;
    Ver.Free;
  end;

  aPrint.Enabled := False;

  MedotradeSign := ReadMedotradeSign;
  TV.StoreToRegistry('\SoftWare\SoftMaster\Fluoro_uch\fMain\TVVrach_' + IntToStr(pSOTRID)+'Default', TRUE, [], 'TV');
  TV.RestoreFromRegistry('\SoftWare\SoftMaster\Fluoro_uch\fMain\TVVrach_' + IntToStr(pSOTRID), FALSE, FALSE, [], 'TV');
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Вы хотите выйти из приложения ?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
    begin
      oqThread.BreakThread;
      action := caFree
    end else
    begin
      action := caNone;
    end;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  TV.StoreToRegistry('\SoftWare\SoftMaster\Fluoro_uch\fMain\TVVrach_' + IntToStr(pSOTRID), TRUE, [], 'TV');
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  GetSession(os, 'ASU');
end;

procedure TfrmMain.frxRepPrintGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName;
  if VarName = 'OTDELNAME' then Value := sOtdelName;
  if VarName = 'SYSDATE' then Value := sDateSys_4rep;
  if VarName = 'SOTRNAME' then Value := sVrachFIO;
  if VarName = 'DATE1' then Value := lbBeg.Caption;
  if VarName = 'DATE2' then Value := lbEnd.Caption; 
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;  
end;

procedure TfrmMain.N2Click(Sender: TObject);
begin
  TV.RestoreFromRegistry('\SoftWare\SoftMaster\Fluoro_uch\fMain\TVVrach_' + IntToStr(pSOTRID)+'Default', FALSE, FALSE, [], 'TV');
end;

procedure TfrmMain.oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer;
  const ErrorMessage: string);
begin
  MessageDlg('Во время выполнения запроса произошла ошибка! Обратитесь к администратору системы!'+
             #13#10+'Код ошибки: '+IntToStr(ErrorCode)+
             #13#10+'Текст ошибки: '+ErrorMessage,
             mtError, [mbOK], 0);
  bbr := True; 
end;

procedure TfrmMain.oqThreadThreadFinished(Sender: TOracleQuery);
begin
  Animator1.Animate := False;
  if bbr then
    cxLabel4.Caption := 'При выполнении запроса произошла ошибка!'
  else
    cxLabel4.Caption := 'Запрос к Базе Данных выполнился успешно!';

  aPrint.Enabled := True;
  aRefresh.Enabled := True;
  aParam.Enabled := True;

  CheckEnabledButtons;
end;

procedure TfrmMain.oqThreadThreadRecord(Sender: TOracleQuery);
begin
  dxMemData1.First;
  TV.BeginUpdate;
  TV.DataController.RecordCount := TV.DataController.RecordCount + 1;
  with TV.DataController do
  begin
    try
      Values[TV.DataController.RecordCount - 1, VNAME.Index] := Sender.Field('FC_NAME');
      Values[TV.DataController.RecordCount - 1, VPLAN.Index] := Sender.Field('PLAN');
      Values[TV.DataController.RecordCount - 1, VOSMOTRENO.Index] := Sender.Field('OSMOTRENO');
      Values[TV.DataController.RecordCount - 1, V2YEAR.Index] := Sender.Field('TWO_YEARS');
      Values[TV.DataController.RecordCount - 1, VOSMOTRENO_2YEAR.Index] := Sender.Field('OSMOTRENO_TWO_YEARS');
      dxMemData1.Insert;
      dxMemData1.FieldByName('FC_NAME').AsString := Sender.Field('FC_NAME');
      dxMemData1.FieldByName('PLAN').AsString := Sender.Field('PLAN');
      dxMemData1.FieldByName('OSMOTRENO').AsString := Sender.Field('OSMOTRENO');
      dxMemData1.FieldByName('TWO_YEARS').AsString := Sender.Field('TWO_YEARS');
      dxMemData1.FieldByName('OSMOTRENO_TWO_YEARS').AsString := Sender.Field('OSMOTRENO_TWO_YEARS');
      dxMemData1.Post;
      dxMemData1.Next;
    finally
    end;
  end;
  TV.EndUpdate;
  cxLabel6.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
  cxLabel6.Refresh;
  cxLabel5.Caption := 'Выбрано ' + IntToStr(TV.DataController.RecordCount) + ' записей.';
  cxLabel5.Refresh;
end;

procedure TfrmMain.osAfterLogOn(Sender: TOracleSession);
var Ver: TJclFileVersionInfo;
begin
  Sender.DBMS_Application_Info.Set_Client_Info(ParamStr(1));
	Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
	Sender.DBMS_Application_Info.Set_Module(ExtractFileName(ParamStr(0)) + ' (' + Ver.FileVersion + ')', Self.Name + ' "' + Self.Caption + '"');
	Ver.Free;
end;

end.
