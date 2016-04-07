unit fDolgTalon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxSkinsCore, ActnList, dxBar,
  cxClasses, cxStyles, dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, dxmdaset, Oracle, cxGridLevel, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid, Menus, cxGridExportLink,
  dxSkinsDefaultPainters,
  dxSkinsdxBarPainter;

type
  TInitPlugin = procedure(nPacid: Integer; nNazid: Integer; nSotrid : Integer); stdcall;
  TFreePlugin = function(): LongInt; stdcall;
  
  TfrmDolgTalon = class(TForm)
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    BMBar1: TdxBar;
    bbClose: TdxBarButton;
    al: TActionList;
    aClose: TAction;
    aLoad: TAction;
    bbLoad: TdxBarButton;
    cxGr: TcxGrid;
    tvDolg: TcxGridTableView;
    cxGrLevel1: TcxGridLevel;
    oqThread: TOracleQuery;
    memData: TdxMemData;
    memDatasotropen: TStringField;
    memDatafd_opened: TDateField;
    memDatapacfio: TStringField;
    memDatanumib: TStringField;
    memDatasex: TStringField;
    tvDolgSotr: TcxGridColumn;
    tvDolgPacFio: TcxGridColumn;
    tvDolgNumib: TcxGridColumn;
    tvDolgFdOpen: TcxGridColumn;
    tvDolgFdRojd: TcxGridColumn;
    tvDolgSex: TcxGridColumn;
    bbEditTalon: TdxBarButton;
    aEditTalon: TAction;
    tvDolg_PacId: TcxGridColumn;
    tvDolg_NazId: TcxGridColumn;
    memDataPacID: TIntegerField;
    memDataNazID: TIntegerField;
    pmGr: TPopupMenu;
    N1: TMenuItem;
    memDataNameIssl: TStringField;
    tvDolg_NameIssl: TcxGridColumn;
    memDatafd_rojd: TDateTimeField;
    N2: TMenuItem;
    bbBase: TdxBarButton;
    aBase: TAction;
    tvDolg_PeplId: TcxGridColumn;
    memDataPeplID: TIntegerField;
    tvDolg_State: TcxGridColumn;
    memDataState: TStringField;
    bbNeyav: TdxBarButton;
    aNeyav: TAction;
    tvDolg_NazsosId: TcxGridColumn;
    memDataNazSosId: TIntegerField;
    tvDolg_TalonId: TcxGridColumn;
    memDataTalonId: TIntegerField;
    tvDolg_OplName: TcxGridColumn;
    memDataoplname: TStringField;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aExcel: TAction;
    N3: TMenuItem;
    N4: TMenuItem;
    Web1: TMenuItem;
    XML1: TMenuItem;
    Excel1: TMenuItem;
    sdPopUp: TSaveDialog;
    memDataispolfio: TStringField;
    tvDolg_ispolfio: TcxGridColumn;
    procedure aCloseExecute(Sender: TObject);
    procedure aLoadExecute(Sender: TObject);
    procedure oqThreadThreadRecord(Sender: TOracleQuery);
    procedure oqThreadThreadFinished(Sender: TOracleQuery);
    procedure oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer;
      const ErrorMessage: string);
    procedure aEditTalonExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N2Click(Sender: TObject);
    procedure aBaseExecute(Sender: TObject);
    procedure aNeyavExecute(Sender: TObject);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aExcelExecute(Sender: TObject);
  private
    nRec : Integer;
    HandleDLL: THandle;
    InitPlugin: TInitPlugin;
    FreePlugin : TFreePlugin;
    { Private declarations }
  public
    procedure DoShowfrmDolgTalon;
    { Public declarations }
  end;

var
  frmDolgTalon: TfrmDolgTalon;

implementation
uses fMain, fAllHistory;
{$R *.dfm}

procedure TfrmDolgTalon.aBaseExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmAllHistory, frmAllHistory);
  try
    frmAllHistory.DoShowForm(tvDolg.DataController.Values[tvDolg.DataController.FocusedRecordIndex, tvDolg_PeplId.Index],
                             tvDolg.DataController.Values[tvDolg.DataController.FocusedRecordIndex, tvDolgPacFio.Index]);
    frmAllHistory.ShowModal;
  finally
    frmAllHistory.Free;
  end;
end;

procedure TfrmDolgTalon.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmDolgTalon.aEditTalonExecute(Sender: TObject);
begin
  HandleDLL := LoadLibrary('EditTalon.dll');
  try
    if HandleDLL <> 0 then
      begin
        InitPlugin := GetProcAddress(HandleDLL, 'InitPlugin');
        if @InitPlugin <> nil then
          begin
            try
              InitPlugin(tvDolg.DataController.Values[tvDolg.DataController.FocusedRecordIndex, tvDolg_PacId.Index],
                         tvDolg.DataController.Values[tvDolg.DataController.FocusedRecordIndex, tvDolg_NazId.Index],
                         frmMain.pSOTRID);
            except
            end;
          end;
      end;
  finally
    if HandleDLL <> 0 then
      begin
        FreePlugin := GetProcAddress(HandleDLL, 'FreePlugin');
        if @FreePlugin <> nil then
          FreePlugin;
        FreeLibrary(HandleDLL);
      end;
    FreeLibrary(HandleDLL);
  end;
end;

procedure TfrmDolgTalon.aExcelExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, TRUE)
end;

procedure TfrmDolgTalon.aLoadExecute(Sender: TObject);
begin
  aLoad.Enabled := False;
  aEditTalon.Enabled := False;
  aBase.Enabled := False;
  aNeyav.Enabled := False;
  if tvDolg.DataController.LockCount = 0 then
    tvDolg.BeginUpdate;
  tvDolg.DataController.RecordCount := 0;
  while tvDolg.DataController.LockCount > 0 do
    tvDolg.EndUpdate;
  cxGr.Refresh;
  memData.Close;
  memData.Open;
  oqThread.Scrollable := True;
  tvDolg.BeginUpdate;
  nRec := 0;
  oqThread.Execute;
end;

procedure TfrmDolgTalon.aNeyavExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  if (tvDolg.DataController.Values[tvDolg.DataController.FocusedRecordIndex, tvDolg_NazSosId.Index] <> 1) and
    (tvDolg.DataController.Values[tvDolg.DataController.FocusedRecordIndex, tvDolg_NazSosId.Index] <> -11) and
    (tvDolg.DataController.Values[tvDolg.DataController.FocusedRecordIndex, tvDolg_TalonId.Index] <> 0) then // !!! asu.get_vipnaz дб вместо 1
    begin
      if Application.MessageBox('Внимание! После отметки неявки редактирование талона будет невозможно! Продолжить?',
                                'Предупреждение', mb_iconwarning+mb_yesno) = idYes then
        begin
          oq := TOracleQuery.Create(nil);
          try
            oq.Session := frmMain.os;
            oq.Cursor := crSQLWait;
            oq.SQL.Text := ' update asu.tambtalon '+#13+
                           '    set fn_sos = 2, fd_closed = trunc(sysdate),  '+#13+
                           '        fk_result = stat.pkg_statutil.get_smidid(''TALON_NE_YAVKA''), '+#13+
                           '        fk_sotrclosed = :pSotr '+#13+
                           '  where fk_id = :pfk_id ';
            oq.DeclareAndSet('pSotr', otInteger, frmMain.pSOTRID);
            oq.DeclareAndSet('pfk_id', otInteger, tvDolg.DataController.Values[tvDolg.DataController.FocusedRecordIndex, tvDolg_TalonId.Index]);
            oq.Execute;
            frmMain.os.Commit;
          finally
            oq.Free;
          end;
        end;
    end else
    begin
      MessageDlg('Нельзя поставить отметку о неявке талону, '+#13+#10+'назначение которого уже имеет статус "Выполнено" или "Выполнено РЛ"!', mtWarning, [mbOK], 0);
    end;
end;

procedure TfrmDolgTalon.aTextExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    ExportGridToText(sdPopUp.FileName, cxGr, TRUE, TRUE)
end;

procedure TfrmDolgTalon.aWebExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, TRUE)
end;

procedure TfrmDolgTalon.aXMLExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, TRUE)
end;

procedure TfrmDolgTalon.DoShowfrmDolgTalon;
begin
  aEditTalon.Enabled := False;
  aBase.Enabled := False;
  aNeyav.Enabled := False;
  frmDolgTalon.Caption := 'Долги по талонам за последние полгода. Сотрудник: '+frmMain.sSotrFIO;
  tvDolg.StoreToRegistry('\SoftWare\SoftMaster\List_xrays_vrach\fDolgTalon\tvDolgSotr_' + IntToStr(frmMain.pSOTRID)+'Default', TRUE, [], 'tvDolg');
  tvDolg.RestoreFromRegistry('\SoftWare\SoftMaster\List_xrays_vrach\fDolgTalon\tvDolgSotr_' + IntToStr(frmMain.pSOTRID), FALSE, FALSE, [], 'tvDolg');
end;

procedure TfrmDolgTalon.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  tvDolg.StoreToRegistry('\SoftWare\SoftMaster\List_xrays_vrach\fDolgTalon\tvDolgSotr_' + IntToStr(frmMain.pSOTRID), TRUE, [], 'tvDolg');
end;

procedure TfrmDolgTalon.N2Click(Sender: TObject);
begin
  tvDolg.RestoreFromRegistry('\SoftWare\SoftMaster\List_xrays_vrach\fDolgTalon\tvDolgSotr_' + IntToStr(frmMain.pSOTRID)+'Default', FALSE, FALSE, [], 'tvDolg');
end;

procedure TfrmDolgTalon.oqThreadThreadError(Sender: TOracleQuery;
  ErrorCode: Integer; const ErrorMessage: string);
begin
  tvDolg.EndUpdate;
  MessageDlg('Во время выполнения запроса произошла ошибка! Обратитесь к администратору системы!'+
             #13#10+'Код ошибки: '+IntToStr(ErrorCode)+
             #13#10+'Текст ошибки: '+ErrorMessage,
             mtError, [mbOK], 0);
end;

procedure TfrmDolgTalon.oqThreadThreadFinished(Sender: TOracleQuery);
begin
  tvDolg.EndUpdate;
  aLoad.Enabled := True;
  aEditTalon.Enabled := oqThread.RowCount > 0;
  aBase.Enabled := oqThread.RowCount > 0;
  aNeyav.Enabled := oqThread.RowCount > 0;
end;

procedure TfrmDolgTalon.oqThreadThreadRecord(Sender: TOracleQuery);
begin
//  tvDolg.BeginUpdate;
  tvDolg.DataController.RecordCount := tvDolg.DataController.RecordCount + 1;
  with tvDolg.DataController do
  begin
    try
      Values[tvDolg.DataController.RecordCount - 1, tvDolgSotr.Index] := Sender.Field('sotropen');
      Values[tvDolg.DataController.RecordCount - 1, tvDolgFdOpen.Index] := Sender.Field('fd_opened');
      Values[tvDolg.DataController.RecordCount - 1, tvDolgPacFio.Index] := Sender.Field('pacfio');
      Values[tvDolg.DataController.RecordCount - 1, tvDolgNumib.Index] := Sender.Field('numib');
      Values[tvDolg.DataController.RecordCount - 1, tvDolgFdRojd.Index] := Sender.Field('fd_rojd');
      Values[tvDolg.DataController.RecordCount - 1, tvDolgSex.Index] := Sender.Field('sex');
      Values[tvDolg.DataController.RecordCount - 1, tvDolg_PacId.Index] := Sender.Field('PacID');
      Values[tvDolg.DataController.RecordCount - 1, tvDolg_NazId.Index] := Sender.Field('NazID');
      Values[tvDolg.DataController.RecordCount - 1, tvDolg_NameIssl.Index] := Sender.Field('NameIssl');
      Values[tvDolg.DataController.RecordCount - 1, tvDolg_PeplID.Index] := Sender.Field('PeplID');
      Values[tvDolg.DataController.RecordCount - 1, tvDolg_State.Index] := Sender.Field('State');
      Values[tvDolg.DataController.RecordCount - 1, tvDolg_NazSosId.Index] := Sender.Field('fk_nazsosid');
      Values[tvDolg.DataController.RecordCount - 1, tvDolg_TalonId.Index] := Sender.Field('fk_id');
      Values[tvDolg.DataController.RecordCount - 1, tvDolg_oplname.Index] := Sender.Field('oplname');
      Values[tvDolg.DataController.RecordCount - 1, tvDolg_ispolfio.Index] := Sender.Field('ispolfio');
      memData.Insert;
      memData.FieldByName('sotropen').AsString := Sender.Field('sotropen');
      memData.FieldByName('fd_opened').AsDateTime := Sender.Field('fd_opened');
      memData.FieldByName('pacfio').AsString := Sender.Field('pacfio');
      memData.FieldByName('numib').AsString := Sender.Field('numib');
      memData.FieldByName('fd_rojd').AsString := Sender.Field('fd_rojd');
      memData.FieldByName('sex').AsString := Sender.Field('sex');
      memData.FieldByName('PacID').AsInteger := Sender.Field('PacID');
      memData.FieldByName('NazID').AsInteger := Sender.Field('NazID');
      memData.FieldByName('NameIssl').AsString := Sender.Field('NameIssl');
      memData.FieldByName('PeplID').AsInteger := Sender.Field('PeplID');
      memData.FieldByName('State').AsString := Sender.Field('State');
      memData.FieldByName('NazSosId').AsInteger := Sender.Field('fk_nazsosid');
      memData.FieldByName('TalonId').AsInteger := Sender.Field('fk_id');
      memData.FieldByName('oplname').AsString := Sender.Field('oplname');
      memData.FieldByName('ispolfio').AsString := Sender.Field('ispolfio');
      memData.Post;
      memData.Next;
    finally
    end;
  end;
//  tvDolg.EndUpdate;
  nRec := nRec + 1;
  if nRec > 100 then
    begin
      nRec := 0;
      tvDolg.EndUpdate;
      tvDolg.BeginUpdate;
    end;
end;

end.
