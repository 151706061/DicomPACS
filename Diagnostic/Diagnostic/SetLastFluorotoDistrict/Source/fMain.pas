unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxEdit, cxDBLookupComboBox, dxSkinsCore,
  cxVGrid, cxControls, cxInplaceContainer, cxContainer, cxLabel, JvExControls,
  JvAnimatedImage, JvGIFCtrl, ExtCtrls, dxSkinsdxBarPainter, dxBar, cxClasses,
  cxProgressBar, DB, OracleData, JclFileUtils, Oracle, SMMainAPI, ImgList,
  ActnList, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridLevel, cxGrid,
  dxmdaset, dxSkinOffice2007Green;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    cxVerticalGrid1: TcxVerticalGrid;
    cxVerticalGrid1CategoryRow1: TcxCategoryRow;
    rowType: TcxEditorRow;
    paSubParam: TPanel;
    Animator1: TJvGIFAnimator;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    Panel2: TPanel;
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    BMBar1: TdxBar;
    bbLoad: TdxBarButton;
    bbRun: TdxBarButton;
    pbMain: TcxProgressBar;
    dsType: TDataSource;
    odsType: TOracleDataSet;
    os: TOracleSession;
    al: TActionList;
    IL: TImageList;
    aLoad: TAction;
    aRun: TAction;
    aClose: TAction;
    bbClose: TdxBarButton;
    cxGrLevel1: TcxGridLevel;
    cxGr: TcxGrid;
    TV: TcxGridTableView;
    V_FIO: TcxGridColumn;
    V_LAST: TcxGridColumn;
    V_UCH: TcxGridColumn;
    V_AGE: TcxGridColumn;
    oqThread: TOracleQuery;
    dxMemData1: TdxMemData;
    dxMemData1FIO: TStringField;
    dxMemData1PEPLID: TIntegerField;
    dxMemData1last: TStringField;
    dxMemData1AGE: TIntegerField;
    V_PEPLID: TcxGridColumn;
    dxMemData1UCH: TStringField;
    rowNum: TcxEditorRow;
    dsListUch: TDataSource;
    odsListUch: TOracleDataSet;
    oqIns: TOracleQuery;
    V_AMBID: TcxGridColumn;
    dxMemData1AMBID: TIntegerField;
    V_ROJD: TcxGridColumn;
    dxMemData1rojd: TDateField;
    procedure osAfterLogOn(Sender: TOracleSession);
    procedure FormCreate(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure oqThreadThreadRecord(Sender: TOracleQuery);
    procedure oqThreadThreadFinished(Sender: TOracleQuery);
    procedure oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer;
      const ErrorMessage: string);
    procedure aLoadExecute(Sender: TObject);
    procedure rowTypeEditPropertiesEditValueChanged(Sender: TObject);
    procedure aRunExecute(Sender: TObject);
  private
    bbr : Boolean;
    StartTime: TTime;
    pAPPSOTRID, pSOTRID : Integer;
    { Private declarations }
  public
    procedure DoShowForm;
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.aLoadExecute(Sender: TObject);
begin
  if TV.DataController.LockCount = 0 then
    TV.BeginUpdate;
  TV.DataController.RecordCount := 0;
  while TV.DataController.LockCount > 0 do
    TV.EndUpdate;
  dxMemData1.Close;
  dxMemData1.Open;
  oqThread.Scrollable := True;
  cxLabel1.Caption := '';
  cxLabel2.Caption := '';
  cxLabel3.Caption := 'Выполняется запрос к Базе Данных...';
  StartTime:= Now;
  cxLabel1.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
  cxLabel1.Refresh;
  bbr := False;
  paSubParam.Visible := True;
  Animator1.Animate := True;
  oqThread.SetVariable('pfk_arealid', rowNum.Properties.Value);
  oqThread.Execute;
end;

procedure TfrmMain.aRunExecute(Sender: TObject);
var i : Integer;
    d, m, y, dd, mm, yy : Word;
begin
  if Application.MessageBox('Всем людям на данном участке автоматически выставится последняя флюорография !'+#13+
                            'Для тех у кого нет последней флюорографии она проставится числом 01.04.2009 с статусом "зачтено регистратором".'+#13+
                            'Для тех, кому исполнилось в этом году 15 лет проставится от даты рождения.'+#13+
                            'Продолжить?',
                            'Вопрос', mb_okcancel+mb_iconquestion) = idOK then
    begin
      Application.ProcessMessages;
      pbMain.Position := 0;
      pbMain.Properties.Max := TV.DataController.RecordCount;
      for I := 0 to TV.DataController.RecordCount - 1 do
        begin
          if (TV.DataController.Values[i, V_LAST.Index] = '') and (TV.DataController.Values[i, V_AGE.Index] > 15)
              and (TV.DataController.Values[i, V_AMBID.Index] <> 0) then
            begin
              oqIns.SetVariable('ppacid', TV.DataController.Values[i, V_AMBID.Index]);
              oqIns.SetVariable('pdate', StrToDateTime('01.04.2009'));
              oqIns.SetVariable('psotr', pSOTRID);
              oqIns.Execute;
              TV.DataController.Values[i, V_LAST.Index] := '01.04.2009';
            end else
            begin
              if (TV.DataController.Values[i, V_AGE.Index] = 14) and (TV.DataController.Values[i, V_LAST.Index] = '') and
               (TV.DataController.Values[i, V_AMBID.Index] <> 0) then
                begin
                  oqIns.SetVariable('ppacid', TV.DataController.Values[i, V_AMBID.Index]);
                  DecodeDate(Date, yy, mm, dd);
                  DecodeDate(TV.DataController.Values[i, V_ROJD.Index], y, m, d);
                  oqIns.SetVariable('pdate', EncodeDate(yy, m, d));
                  oqIns.SetVariable('psotr', pSOTRID);
                  oqIns.Execute;
                  TV.DataController.Values[i, V_LAST.Index] := DateTimeToStr(EncodeDate(yy, m, d));
                end;
              if (TV.DataController.Values[i, V_AGE.Index] = 15) and (TV.DataController.Values[i, V_LAST.Index] = '') and
               (TV.DataController.Values[i, V_AMBID.Index] <> 0) then
                begin
                  oqIns.SetVariable('ppacid', TV.DataController.Values[i, V_AMBID.Index]);
                  DecodeDate(Date, yy, mm, dd);
                  DecodeDate(TV.DataController.Values[i, V_ROJD.Index], y, m, d);
                  oqIns.SetVariable('pdate', EncodeDate(yy-1, m, d));
                  oqIns.SetVariable('psotr', pSOTRID);
                  oqIns.Execute;
                  TV.DataController.Values[i, V_LAST.Index] := DateTimeToStr(EncodeDate(yy-1, m, d));
                end;
            end;
          pbMain.Position := pbMain.Position + 1;
          Application.ProcessMessages;
        end;
      os.Commit;
    end;
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
    ods.SQL.Text := ' SELECT FK_SOTRID '+#13+
                    '   FROM LOGIN.TAPPSOTR WHERE FL_DEL <> 1 AND FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pAPPSOTRID);
    ods.Open;
    pSOTRID := ods.FieldByName('FK_SOTRID').AsInteger;
  finally
    ods.Free;
    Ver.Free;
  end;
end;


procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  GetSession(os, 'ASU');
  if odsType.Active = False then
    odsType.Active := True;
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
    cxLabel3.Caption := 'При выполнении запроса произошла ошибка!'
  else
    cxLabel3.Caption := 'Запрос к Базе Данных выполнился успешно!';
end;

procedure TfrmMain.oqThreadThreadRecord(Sender: TOracleQuery);
begin
  TV.BeginUpdate;
  TV.DataController.RecordCount := TV.DataController.RecordCount + 1;
  with TV.DataController do
  begin
    try
      Values[TV.DataController.RecordCount - 1, V_PEPLID.Index] := Sender.Field('FK_PEPLID');
      Values[TV.DataController.RecordCount - 1, V_FIO.Index] := Sender.Field('FIO');
      Values[TV.DataController.RecordCount - 1, V_LAST.Index] := Sender.Field('date_fluoro');
      Values[TV.DataController.RecordCount - 1, V_UCH.Index] := Sender.Field('uch');
      Values[TV.DataController.RecordCount - 1, V_AGE.Index] := Sender.Field('age');
      Values[TV.DataController.RecordCount - 1, V_AMBID.Index] := Sender.Field('ambid');
      Values[TV.DataController.RecordCount - 1, V_ROJD.Index] := Sender.Field('fd_rojd');
      dxMemData1.Insert;
      dxMemData1.FieldByName('PEPLID').AsInteger := Sender.Field('FK_PEPLID');
      dxMemData1.FieldByName('FIO').AsString := Sender.Field('FIO');
      dxMemData1.FieldByName('last').AsString := Sender.Field('date_fluoro');
      dxMemData1.FieldByName('UCH').AsString := Sender.Field('uch');
      dxMemData1.FieldByName('AGE').AsInteger := Sender.Field('age');
      dxMemData1.FieldByName('AMBID').AsInteger := Sender.Field('ambid');
      dxMemData1.FieldByName('ROJD').AsDateTime := Sender.Field('fd_rojd');
      dxMemData1.Post;
      dxMemData1.Next;
    finally
    end;
  end;
  TV.EndUpdate;
  cxLabel1.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
  cxLabel1.Refresh;
  cxLabel2.Caption := 'Выбрано ' + IntToStr(TV.DataController.RecordCount) + ' записей.';
  cxLabel2.Refresh;
end;

procedure TfrmMain.osAfterLogOn(Sender: TOracleSession);
var Ver: TJclFileVersionInfo;
begin
  Sender.DBMS_Application_Info.Set_Client_Info(ParamStr(1));
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  try
    Sender.DBMS_Application_Info.Set_Module(ExtractFileName(ParamStr(0)) + ' (' + Ver.FileVersion + ')', Self.Name + ' "' + Self.Caption + '"');
  finally
    Ver.Free;
  end;
end;

procedure TfrmMain.rowTypeEditPropertiesEditValueChanged(Sender: TObject);
begin
  odsListUch.Close;
  odsListUch.SetVariable('pfk_typeid', rowType.Properties.Value);
  odsListUch.Open;
end;

end.
