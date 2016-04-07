unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Oracle, SMMainAPI, ExtCtrls, cxStyles, cxGraphics, cxEdit,
  cxDBLookupComboBox, cxCalendar, cxButtonEdit, cxDropDownEdit, cxSpinEdit,
  cxCheckBox, cxMaskEdit, dxSkinsCore, dxSkinOffice2007Green, cxVGrid,
  cxControls, cxInplaceContainer, dxSkinsdxBarPainter, cxClasses, dxBar,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridCustomView, cxGrid,
  JclFileUtils, OracleData, ActnList, ImgList, uGlobalConst, cxContainer,
  cxLabel, JvExControls, JvAnimatedImage, JvGIFCtrl, cxSplitter, cxBarEditItem,
  DB, dxmdaset, Menus, cxGridExportLink, frxClass, frxDBSet, dxSkinCaramel,
  dxSkinCoffee;

type
  TfrmMain = class(TForm)
    os: TOracleSession;
    oqThread: TOracleQuery;
    Panel1: TPanel;
    Panel2: TPanel;
    vgrDates: TcxVerticalGrid;
    rowCategoryCommon: TcxCategoryRow;
    rowDate1: TcxEditorRow;
    rowDate2: TcxEditorRow;
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    BMBar1: TdxBar;
    cxGr: TcxGrid;
    VIEW: TcxGridTableView;
    VIEW_PACFIO: TcxGridColumn;
    VIEW_ROJD: TcxGridColumn;
    cxGrLevel1: TcxGridLevel;
    bbRef: TdxBarButton;
    bbOpenMK: TdxBarButton;
    bbPrint: TdxBarButton;
    bbClose: TdxBarButton;
    VIEW_ADRF: TcxGridColumn;
    VIEW_ADRR: TcxGridColumn;
    VIEW_PHONE: TcxGridColumn;
    al: TActionList;
    aRef: TAction;
    aOpenMK: TAction;
    aPrint: TAction;
    aClose: TAction;
    il: TImageList;
    ilSmall: TcxImageList;
    cxSplitter2: TcxSplitter;
    paSubParam: TPanel;
    Animator1: TJvGIFAnimator;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    dxBarDockControl2: TdxBarDockControl;
    BMBar2: TdxBar;
    bbAdd: TdxBarButton;
    bbDel: TdxBarButton;
    aAdd: TAction;
    aDel: TAction;
    cxBarEditItem1: TcxBarEditItem;
    grNaz: TcxGrid;
    tvNaz: TcxGridTableView;
    colNaz: TcxGridColumn;
    colStatus: TcxGridColumn;
    cxGridLevel1: TcxGridLevel;
    colID: TcxGridColumn;
    dxMemData1: TdxMemData;
    dxMemData1FIOPAC: TStringField;
    dxMemData1FD_ROJD: TDateField;
    dxMemData1ADRF: TStringField;
    dxMemData1ADRR: TStringField;
    dxMemData1phones: TStringField;
    VIEW_PACID: TcxGridColumn;
    dxMemData1pacid: TIntegerField;
    VIEW_PEPLID: TcxGridColumn;
    tmrCheckApplication: TTimer;
    dxMemData1peplid: TIntegerField;
    pmVIEW: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    Web1: TMenuItem;
    XML1: TMenuItem;
    Excel1: TMenuItem;
    N3: TMenuItem;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aXLS: TAction;
    sdPopUp: TSaveDialog;
    frxList: TfrxReport;
    frxDBList: TfrxDBDataset;
    rowAge1: TcxEditorRow;
    rowAge2: TcxEditorRow;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aCloseExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure aAddExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure osAfterLogOn(Sender: TOracleSession);
    procedure aRefExecute(Sender: TObject);
    procedure oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer;
      const ErrorMessage: string);
    procedure oqThreadThreadFinished(Sender: TOracleQuery);
    procedure oqThreadThreadRecord(Sender: TOracleQuery);
    procedure aOpenMKExecute(Sender: TObject);
    procedure tmrCheckApplicationTimer(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure frxListGetValue(const VarName: string; var Value: Variant);
  private
    pAPPSOTRID, pSOTRID : Integer;
    MedotradeSign, sOtdelName_4Rep, sSotrFIO, FileVersion, sCompanyName_4Rep,
    sDateSys_4Rep, strName_4Rep : string;
    dDateBegin, dDateEnd : TDateTime;
    StartTime : TTime;
    bbr : Boolean;
    nRec : Integer;
    arFIO:array of string;
    function RestoreApplication(AAppCaption:string):Boolean;
    { Private declarations }
  public
    russian : HKL;  
    procedure DoShowForm;
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses fAddNaz, fWait;

{$R *.dfm}

procedure TfrmMain.aAddExecute(Sender: TObject);
var I : integer;
begin
  Application.CreateForm(TfrmAddNaz, frmAddNaz);
  try
    frmAddNaz.ShowModal;
    if frmAddNaz.ModalResult = mrOk then
      begin
        tvNaz.DataController.PostEditingData;
        for I := 0 to frmAddNaz.tvList.DataController.RecordCount - 1 do
          begin
            if frmAddNaz.tvList.DataController.Values[i, frmAddNaz.tvListCheck.Index] = 1 then
              begin
                tvNaz.DataController.RecordCount := tvNaz.DataController.RecordCount + 1;
                tvNaz.DataController.Values[tvNaz.DataController.RecordCount - 1, colNaz.Index] := frmAddNaz.tvList.DataController.Values[i, frmAddNaz.tvListName.Index];
                tvNaz.DataController.Values[tvNaz.DataController.RecordCount - 1, colID.Index] := frmAddNaz.tvList.DataController.Values[i, frmAddNaz.tvListID.Index];
              end;
          end;
      end;
  finally
    frmAddNaz.Free;
  end;
end;

procedure TfrmMain.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.aDelExecute(Sender: TObject);
begin
  tvNaz.DataController.DeleteFocused;
end;

procedure TfrmMain.aOpenMKExecute(Sender: TObject);
var ods : TOracleDataSet;
    AppProcID : Integer;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT ASU.PKG_REGIST_PEPLFUNC.GET_PEPL_FIO(:FK_PEPLID) FIOPAC FROM DUAL ';
    ods.DeclareAndSet('FK_PEPLID', otInteger, VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_PEPLID.Index]);
    ods.Open;
    if RestoreApplication(ods.FieldByName('FIOPAC').AsString) then Exit;
    SetLength(frmMain.arFIO,Length(frmMain.arFIO)+1);
    arFIO[Length(frmMain.arFIO)-1]:=ods.FieldByName('FIOPAC').AsString;
    aOpenMK.Enabled:=False;
    Application.ProcessMessages;
    Screen.Cursor := crSQLWait;
    tmrCheckApplication.Enabled:=True;

    AppProcID := AppStart(ExtractFilePath(paramstr(0))+'IBRazdel.exe', IntToStr(VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_PACID.Index])+' '+IntToStr(-1)+' '+IntToStr(-1));
    if AppProcID = -1 then ShowMessage('Ошибка запуска приложения');
    ShowWait(VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_PACID.Index],True);
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.aPrintExecute(Sender: TObject);
var ods : TOracleDataSet;
    I : Integer;
begin
// -- назначения
  for I := 0 to tvNaz.DataController.RecordCount - 1 do
    begin
      strName_4Rep := strName_4Rep + tvNaz.DataController.Values[i, colNaz.Index] + ',';
    end;
  strName_4Rep := COPY(strName_4Rep, 1, Length(strName_4Rep)-1);  
// -- системная дата
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select to_char(sysdate, ''dd.mm.yyyy hh24:mi'') as datesys from dual ';
    ods.Open;
    sDateSys_4Rep := ods.FieldByName('datesys').AsString;
  finally
    ods.Free;
  end;
  frxList.ShowReport;
end;

procedure TfrmMain.aRefExecute(Sender: TObject);
var strSmid : string;
    I: Integer;
begin
// -- проверяем выбрано ли назначение
  strSmid := '';
  for I := 0 to tvNaz.DataController.RecordCount - 1 do
    begin
      strSmid := strSmid + IntToStr(tvNaz.DataController.Values[i, colID.Index]) + ',';
    end;
  strSmid := COPY(strSmid, 1, Length(strSmid)-1);
  if strSmid = '' then
    begin
      MessageDlg('Внимание!'+#13+#10+'Выберите хотя бы одно назначение!', mtInformation, [mbOK], 0);
      exit;
    end;

  cxGr.SetFocus;

  aRef.Enabled := False;
  aPrint.Enabled := False;
  aOpenMK.Enabled := False;

  if VIEW.DataController.LockCount = 0 then
    VIEW.BeginUpdate;
  VIEW.DataController.RecordCount := 0;
  while VIEW.DataController.LockCount > 0 do
    VIEW.EndUpdate;
  dxMemData1.Close;
  dxMemData1.Open;
  dDateBegin := VarToDateTime(rowDate1.Properties.Value);
  dDateEnd := VarToDateTime(rowDate2.Properties.Value+' 23:59:59');
  oqThread.Scrollable := True;

  cxLabel1.Caption := '';
  cxLabel2.Caption := '';
  cxLabel3.Caption := 'Выполняется запрос к Базе Данных...';
  StartTime := Now;
  cxLabel1.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
  cxLabel1.Refresh;
  bbr := False;
  paSubParam.Visible := True;
  cxSplitter2.Visible := True;
  Animator1.Animate := True;
  if (rowAge2.Properties.Value <> null) and (rowAge2.Properties.Value <> 0) then
    begin
      oqThread.SetVariable('pAge', ' and asu.pkg_regist_pacfunc.get_pac_age_now(fk_pacid) >= '+IntToStr(rowAge1.Properties.Value)+
                                   ' and asu.pkg_regist_pacfunc.get_pac_age_now(fk_pacid) <= '+IntToStr(rowAge2.Properties.Value));
    end;
  
  oqThread.SetVariable('pdate1', dDateBegin);
  oqThread.SetVariable('pdate2', dDateEnd);
  oqThread.SetVariable('pSmid', 'fk_id in ('+strSmid+')');
  VIEW.BeginUpdate;
  nRec := 0;  
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

procedure TfrmMain.DoShowForm;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY'') AS DATESYS, FK_SOTRID, ASU.DO_VRACHFIO(FK_SOTRID) AS VRACHFIO, '+#13+
                    '        (SELECT FC_NAME FROM ASU.TOTDEL WHERE FK_ID = (SELECT FK_OTDID FROM ASU.TSOTR WHERE FK_ID = TAPPSOTR.FK_SOTRID)) AS OTDELNAME '+#13+
                    '   FROM LOGIN.TAPPSOTR WHERE FL_DEL <> 1 AND FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, StrToInt(paramstr(1)));
    ods.Open;
    pAPPSOTRID := StrToInt(paramstr(1));
    pSOTRID := ods.FieldByName('FK_SOTRID').AsInteger;
    rowDate1.Properties.Value := ods.FieldByName('DATESYS').AsVariant;
    rowDate2.Properties.Value := ods.FieldByName('DATESYS').AsVariant;
    sOtdelName_4Rep := ods.FieldByName('OTDELNAME').AsString;
    sSotrFIO := ods.FieldByName('VRACHFIO').AsString;
    frmMain.Caption := 'Журнал для диспансеризации ('+FileVersion+')'+'. Пользователь: '+ods.FieldByName('vrachfio').AsString;
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' select asu.pkg_smini.readstring(''CONFIG'', ''S_FULLNAME'', '''') as companyname from dual ';
    ods.Open;
    sCompanyName_4Rep := ods.FieldByName('companyname').AsString; 
    VIEW.StoreToRegistry('\SoftWare\SoftMaster\DispList\fMain\ViewVrach_' + IntToStr(pSOTRID)+'Default', True, [], 'VIEW');
    VIEW.RestoreFromRegistry('\SoftWare\SoftMaster\DispList\fMain\ViewVrach_' + IntToStr(pSOTRID), False, False, [], 'VIEW');
    MedotradeSign := ReadMedotradeSign;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Вы хотите закрыть программу ?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
    begin
      oqThread.BreakThread;
      action := caFree;
    end else
    begin
      action := caNone;
    end;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  VIEW.StoreToRegistry('\SoftWare\SoftMaster\DispList\fMain\ViewVrach_' + IntToStr(pSOTRID), True, [], 'VIEW');
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  russian := LoadKeyboardLayout('00000419', 0);
  GetSession(os, 'ASU');
  Self.WindowState := wsMaximized;
end;

procedure TfrmMain.frxListGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'DATESYS' then Value := sDateSys_4Rep;
  if VarName = 'DATE1' then Value := rowDate1.Properties.Value;
  if VarName = 'DATE2' then Value := rowDate2.Properties.Value;
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := sOtdelName_4Rep;
  if VarName = 'MEDOTRADESIGN' then Value := ReadMedotradeSign;
  if VarName = 'LISTNAZ' then Value := strName_4Rep;
  if VarName = 'SOTR' then Value := sSotrFIO;
end;

procedure TfrmMain.N3Click(Sender: TObject);
begin
  VIEW.RestoreFromRegistry('\SoftWare\SoftMaster\DispList\fMain\ViewVrach_' + IntToStr(pSOTRID)+'Default', FALSE, FALSE, [], 'VIEW');
end;

procedure TfrmMain.oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer;
  const ErrorMessage: string);
begin
  VIEW.EndUpdate;
  MessageDlg('Во время выполнения запроса произошла ошибка! Обратитесь к администратору системы!'+
             #13#10+'Код ошибки: '+IntToStr(ErrorCode)+
             #13#10+'Текст ошибки: '+ErrorMessage,
             mtError, [mbOK], 0);
  bbr := True;
end;

procedure TfrmMain.oqThreadThreadFinished(Sender: TOracleQuery);
begin
  VIEW.EndUpdate;
  aRef.Enabled := True;
  Animator1.Animate := False;
  if bbr then
    cxLabel3.Caption := 'При выполнении запроса произошла ошибка!'
  else
    cxLabel3.Caption := 'Запрос к Базе Данных выполнился успешно!';

  aOpenMK.Enabled := oqThread.RowCount > 0;
  aPrint.Enabled := oqThread.RowCount > 0;
end;

procedure TfrmMain.oqThreadThreadRecord(Sender: TOracleQuery);
begin
  VIEW.DataController.RecordCount := VIEW.DataController.RecordCount + 1;
  with VIEW.DataController do
  begin
    try
      Values[VIEW.DataController.RecordCount - 1, VIEW_PACFIO.Index] := Sender.Field('pacfio');
      Values[VIEW.DataController.RecordCount - 1, VIEW_ROJD.Index] := Sender.Field('fd_rojd');
      Values[VIEW.DataController.RecordCount - 1, VIEW_ADRF.Index] := Sender.Field('adrf');
      Values[VIEW.DataController.RecordCount - 1, VIEW_ADRR.Index] := Sender.Field('adrr');
      Values[VIEW.DataController.RecordCount - 1, VIEW_PHONE.Index] := Sender.Field('phones');
      Values[VIEW.DataController.RecordCount - 1, VIEW_PACID.Index] := Sender.Field('fk_pacid');
      Values[VIEW.DataController.RecordCount - 1, VIEW_PEPLID.Index] := Sender.Field('peplid');

      dxMemData1.Insert;
      dxMemData1.FieldByName('fiopac').AsString := Sender.Field('pacfio');
      dxMemData1.FieldByName('fd_rojd').AsDateTime := Sender.Field('fd_rojd');
      dxMemData1.FieldByName('adrf').AsString := Sender.Field('adrf');
      dxMemData1.FieldByName('adrr').AsString := Sender.Field('adrr');
      dxMemData1.FieldByName('phones').AsString := Sender.Field('phones');
      dxMemData1.FieldByName('pacid').AsInteger := Sender.Field('fk_pacid');
      dxMemData1.FieldByName('peplid').AsInteger := Sender.Field('peplid');
      dxMemData1.Post;
      dxMemData1.Next;
    finally
    end;
  end;
  cxLabel1.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
  cxLabel1.Refresh;
  cxLabel2.Caption := 'Выбрано ' + IntToStr(VIEW.DataController.RecordCount) + ' записей.';
  cxLabel2.Refresh;
  nRec := nRec + 1;
  if nRec > 100 then
    begin
      nRec := 0;
      VIEW.EndUpdate;
      VIEW.BeginUpdate;
    end;
end;

procedure TfrmMain.osAfterLogOn(Sender: TOracleSession);
var Ver: TJclFileVersionInfo;
begin
  Sender.DBMS_Application_Info.Set_Client_Info(ParamStr(1));
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  try
	  Sender.DBMS_Application_Info.Set_Module(ExtractFileName(ParamStr(0)) + ' (' + Ver.FileVersion + ')', Self.Name + ' "' + Self.Caption + '"');
    FileVersion := Ver.FileVersion;
  finally
	  Ver.Free;
  end;
end;

function TfrmMain.RestoreApplication(AAppCaption: string): Boolean;
var
  Wnd               : hWnd;
  buff              : array[0..127] of Char;
begin
  Result := False;
  Self.SetFocus;
  Application.ProcessMessages;
  Wnd := GetWindow(Handle, gw_HWndFirst);
  while Wnd <> 0 do
  begin
    if (Wnd <> Application.Handle) and (GetWindow(Wnd, gw_Owner) = 0) then
    begin
      GetWindowText(Wnd, buff, sizeof(buff));
      if StrPas(buff) = AAppCaption then
      begin
        Application.ProcessMessages;
        ShowWindow(wnd, SW_SHOWMINIMIZED);
        ShowWindow(wnd, SW_SHOWNORMAL);
        SetForegroundWindow(wnd);
        Application.ProcessMessages;
        Result := True;
        Exit;
      end; //if StrPas(buff) = cFIO
    end; //if (Wnd <> Application.Handle) and (GetWindow(Wnd, gw_Owner) = 0) then
    Wnd := GetWindow(Wnd, gw_hWndNext);
  end; //while Wnd <> 0
end;

procedure TfrmMain.tmrCheckApplicationTimer(Sender: TObject);
var Wnd               : hWnd;
    buff              : array[0..127] of Char;
    i, j, iDel        : Integer;
begin
  Application.ProcessMessages;
  if not(tmrCheckApplication.Enabled) then exit;
  iDel:=0;
  for i:=0 to Length(arFIO)-1 do
  begin
    Wnd := GetWindow(Handle, gw_HWndFirst);
    while Wnd <> 0 do
    begin
      if (Wnd <> Application.Handle) and (GetWindow(Wnd, gw_Owner) = 0) then
        begin
          GetWindowText(Wnd, buff, sizeof(buff));
          if StrPas(buff) = arFIO[i-iDel] then
            begin
              if IsWindowVisible(Wnd) then
              begin
                  for j:=i-iDel to Length(arFIO)-2 do
                  begin
                    arFIO[j]:=arFio[j+1];
                  end;
                  SetLength(arFIO,Length(arFIO)-1);
                  Inc(iDel);
                  if Length(arFIO) = 0 then
                  begin
                    tmrCheckApplication.Enabled:=False;
                    Screen.Cursor:=crDefault;
                    aOpenMK.Enabled:=True;
                    Exit;
                  end;
                  Break;
              end;
            end;
        end;
      Wnd := GetWindow(Wnd, gw_hWndNext);
    end;
  end;
end;

end.
