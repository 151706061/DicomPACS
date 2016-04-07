// iii - cxTextEdit в uses нужен для vsNormal, vsHideCursor
unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, cxStyles, cxGraphics, cxEdit,
  cxSplitter, cxInplaceContainer, cxVGrid, cxControls, cxContainer, cxLabel,
  JvExControls, JvAnimatedImage, JvGIFCtrl, ExtCtrls, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, dxBar, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxGridCustomView, cxGrid,
  dxSkinsdxBarPainter, ImgList, ActnList, Oracle, SMMainAPI, cxDBLookupComboBox,
  DB, OracleData, cxCalendar, JclFileUtils, dxmdaset, cxButtonEdit,
  cxDropDownEdit, cxTextEdit, Menus, frxClass, frxDBSet,
  uGlobalConst, cxGridExportLink, Registry, jpeg, word2000, uReportUtils,
  cxCheckBox, cxSpinEdit, cxConstantsRus, dxBarCustomize_Rus, JvStringHolder,
  cxGridCustomPopupMenu, cxGridPopupMenu;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    paSubParam: TPanel;
    Animator1: TJvGIFAnimator;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    vGr: TcxVerticalGrid;
    cxSplitter1: TcxSplitter;
    paMain: TPanel;
    cxGr: TcxGrid;
    VIEW: TcxGridTableView;
    VIEW_PACID: TcxGridColumn;
    VIEW_FD_RUN: TcxGridColumn;
    VIEW_PACFIO: TcxGridColumn;
    VIEW_OTDEL: TcxGridColumn;
    cxGrLevel1: TcxGridLevel;
    dxBarDockControl1: TdxBarDockControl;
    cxSplitter2: TcxSplitter;
    BM: TdxBarManager;
    BMBar1: TdxBar;
    bbClose: TdxBarButton;
    al: TActionList;
    il: TImageList;
    os: TOracleSession;
    aClose: TAction;
    oqThread: TOracleQuery;
    catParams: TcxCategoryRow;
    rowPeriodFrom: TcxEditorRow;
    rowPeriodTo: TcxEditorRow;
    ilSmall: TcxImageList;
    bbRefresh: TdxBarButton;
    aRefresh: TAction;
    memData: TdxMemData;
    rowPac: TcxEditorRow;
    rowSex: TcxEditorRow;
    pm: TPopupMenu;
    N1: TMenuItem;
    stRep: TcxStyleRepository;
    stNormal: TcxStyle;
    stBold: TcxStyle;
    cxStyle1: TcxStyle;
    rowDiag: TcxEditorRow;
    bbPrint: TdxBarButton;
    aPrint: TAction;
    frDBList: TfrxDBDataset;
    pmVIEW: TPopupMenu;
    MenuItem1: TMenuItem;
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
    rowPhase: TcxEditorRow;
    aProtocol: TAction;
    bbProtocol: TdxBarButton;
    frList: TfrxReport;
    rowDates: TcxEditorRow;
    bbOpenMK: TdxBarButton;
    aOpenMK: TAction;
    tmrCheckApplication: TTimer;
    rowVozr: TcxEditorRow;
    rowOper: TcxEditorRow;
    VIEW_IB: TcxGridColumn;
    VIEW_OPERNAME: TcxGridColumn;
    VIEW_BITH: TcxGridColumn;
    VIEW_KDN_BEFORE: TcxGridColumn;
    VIEW_KDN_AFTER: TcxGridColumn;
    VIEW_KDN: TcxGridColumn;
    VIEW_DS: TcxGridColumn;
    VIEW_AGE: TcxGridColumn;
    VIEW_SEX: TcxGridColumn;
    VIEW_KODOPER: TcxGridColumn;
    VIEW_PHASE: TcxGridColumn;
    VIEW_DATA1: TcxGridColumn;
    VIEW_DATA2: TcxGridColumn;
    VIEW_ISPOL: TcxGridColumn;
    VIEW_ROOM: TcxGridColumn;
    VIEW_GITEL: TcxGridColumn;
    VIEW_SROCHNOST: TcxGridColumn;
    VIEW_REGION: TcxGridColumn;
    VIEW_RAION: TcxGridColumn;
    VIEW_CITY: TcxGridColumn;
    memDataIB: TStringField;
    memDataPACID: TIntegerField;
    memDataPACFIO: TStringField;
    memDataAGE: TIntegerField;
    memDataSEX: TStringField;
    memDataOPERNAME: TStringField;
    VIEW_NAZID: TcxGridColumn;
    memDataNAZID: TIntegerField;
    memDataKODOPER: TStringField;
    memDataDS: TStringField;
    memDataPHASE: TStringField;
    memDataKDN_BEFORE: TIntegerField;
    memDataKDN_AFTER: TIntegerField;
    memDataKDN: TIntegerField;
    memDataDATA1: TDateField;
    memDataBITH: TDateField;
    memDataDATA2: TDateField;
    memDataFD_RUN: TDateTimeField;
    memDataISPOL: TStringField;
    memDataOTDEL: TStringField;
    memDataROOM: TStringField;
    memDataGITEL: TStringField;
    memDataSROCHNOST: TStringField;
    memDataREGION: TStringField;
    memDataRAION: TStringField;
    memDataCITY: TStringField;
    VIEW_PEPLID: TcxGridColumn;
    memDataPEPLID: TIntegerField;
    VIEW_RN: TcxGridColumn;
    memDataRN: TIntegerField;
    dxBarDockControl2: TdxBarDockControl;
    bbClear: TdxBarButton;
    aClearFilter: TAction;
    BMBar2: TdxBar;
    memDataOPERATOR: TStringField;
    cxGridPopupMenu1: TcxGridPopupMenu;
    VIEW_OPERATOR: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aRefreshExecute(Sender: TObject);
    procedure oqThreadThreadRecord(Sender: TOracleQuery);
    procedure oqThreadThreadFinished(Sender: TOracleQuery);
    procedure oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer;
      const ErrorMessage: string);
    procedure rowPacEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure N1Click(Sender: TObject);
    procedure rowMatEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure aPrintExecute(Sender: TObject);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N3Click(Sender: TObject);
    procedure aProtocolExecute(Sender: TObject);
    procedure frListGetValue(const VarName: string; var Value: Variant);
    procedure aOpenMKExecute(Sender: TObject);
    procedure tmrCheckApplicationTimer(Sender: TObject);
    procedure rowPhaseEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowVozrEditPropertiesChange(Sender: TObject);
    procedure rowOperEditPropertiesChange(Sender: TObject);
    procedure aClearFilterExecute(Sender: TObject);
    procedure VIEWFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
  private
    nRec : Integer;
    pAPPSOTRID, get_vipnaz, get_labvip, get_nevip : Integer;
    sSotrFIO, DateSys_4Rep, sCompanyName_4Rep, MedotradeSign, sParams, get_dbname : string;
    dDateBegin, dDateEnd : TDateTime;
    StartTime: TTime;
    bbr : Boolean;
    strID, strName : string;
    arFIO:array of string;
    procedure DoResult(nNazID: Integer);
    procedure BmpToJPEG(pFNAME1, pFNAME2 : String);
    function PhysicalResolveFileType(AStream: TStream): Integer;
    procedure DoWordProcess(path : String; FormatPr: Integer = 0; bLandscape: Boolean = false);
    function RestoreApplication(AAppCaption:string):Boolean;
    { Private declarations }
  public
    pSOTRID : Integer;
    Russian : HKL;

    arMKB: array of Integer;


    procedure DoShowForm;

    function GetMKB10Text: string;
    function GetMKB10ID: string;
    { Public declarations }
  end;


var
  frmMain: TfrmMain;

implementation

uses fSearch, fSetChar, fPreview, fWait, uMKB10;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure TfrmMain.aClearFilterExecute(Sender: TObject);
begin
  if Application.MessageBox('Вы действительно хотите очистить все критерии выборки?', 'Вопрос', MB_YESNO) = mrYes then
    begin
      rowPac.Tag := -1;
      rowPac.Properties.Value := null;
      strID := '';
      strName := '';
      rowSex.Properties.Value := null;

      rowVozr.Tag := -1;
      rowVozr.Properties.Value := null;

      rowDiag.Tag := -1;
      rowDiag.Properties.Value := -1;
      rowDiag.Properties.Value := null;
      rowDiag.Properties.ImageIndex := -1;
      rowDiag.Styles.Content := stNormal;
      rowDiag.Styles.Header := stNormal;

      rowPhase.Tag := -1;
      rowPhase.Properties.Value := -1;
      rowPhase.Properties.Value := null;
      rowPhase.Properties.ImageIndex := -1;
      rowPhase.Styles.Content := stNormal;
      rowPhase.Styles.Header := stNormal;


      try
        TcxButtonEdit(vGr.InplaceEditor).EditValue := null;
      except
      end;
      vGr.FocusRow(vGr.FirstRow, 0);
    end;
end;

//------------------------------------------------------------------------------
procedure TfrmMain.aCloseExecute(Sender: TObject);
begin
 close;
end;

//------------------------------------------------------------------------------
procedure TfrmMain.aOpenMKExecute(Sender: TObject);
var ods : TOracleDataSet;
    AppProcID : Integer;
begin
  ods := TOracleDataSet.Create(nil);
  try
     {$IFDEF USE_NEW_AUTH}
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT ASU.PKG_REGIST_PEPLFUNC.GET_PEPL_FIO(:FK_PEPLID) FIOPAC FROM DUAL ';
        ods.DeclareAndSet('FK_PEPLID', otInteger, VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_PEPLID.Index]);
        ods.Open;

        if RestoreApplication(ods.FieldByName('FIOPAC').AsString) then
           Exit;

        SetLength(frmMain.arFIO,Length(frmMain.arFIO)+1);
        arFIO[Length(frmMain.arFIO) - 1] := ods.FieldByName('FIOPAC').AsString;
        aOpenMK.Enabled := False;
        Application.ProcessMessages;
        Screen.Cursor := crSQLWait;
        tmrCheckApplication.Enabled := True;

        AppProcID := AppStart(ExtractFilePath(paramstr(0))+'IBRazdel.exe', IntToStr(VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_PACID.Index])+' '+IntToStr(-1)+' '+IntToStr(-1));
        if AppProcID = -1 then
           ShowMessage('Ошибка запуска приложения');
     {$ELSE}
        AppProcID := 0;
        if ShellExecute(Application.Handle,
                        pChar('open'),
                        PChar(ExtractFilePath(paramstr(0)) + 'IBRazdel.exe'),
                        PChar(IntToStr(frmMain.pAPPSOTRID) + ' ' +
                        IntToStr(VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_PACID.Index]) + ' ' +
                        IntToStr(-1) + ' ' +
                        IntToStr(-1)), PChar(ExtractFilePath(paramstr(0))), SW_SHOWNORMAL) < 32
        then
           Application.MessageBox('Запуск внешнего модуля не удался.', 'Ошибка', MB_OK + MB_ICONERROR);
     {$ENDIF}

     ShowWait(VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_PACID.Index],True);

  finally
     ods.Free;
     Screen.Cursor := crDefault;
     aOpenMK.Enabled := True;
  end;

end;

//------------------------------------------------------------------------------
procedure TfrmMain.aPrintExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select to_char(sysdate, ''dd.mm.yyyy hh24:mi'') as datesys from dual ';
    ods.Open;
    DateSys_4Rep := ods.FieldByName('datesys').AsString;
  finally
    ods.Free;
  end;
  sParams := '';
  sParams := ' Параметры: ';

  if rowPac.Tag <> -1 then
     sParams := sParams + 'Пациент: ' + rowPac.Properties.Value + '; ';
  if VarToStr(rowSex.Properties.Value) <> '' then
     sParams := sParams + 'Пол пациента: ' + rowSex.Properties.Value + '; ';
  if VarToStr(rowVozr.Properties.Value) <> '' then
     sParams := sParams + 'Возраст: ' + rowVozr.Properties.Value + '; ';
  if Trim(VarToStr(rowOper.Properties.Value)) <> '' then
     sParams := sParams + 'Наименование операции: ' + rowOper.Properties.Value + '; ';
  if Trim(VarToStr(rowDiag.Properties.Value)) <> '' then
     sParams := sParams + 'Диагноз: ' + rowDiag.Properties.Value + ' ';
  if VarToStr(rowPhase.Properties.Value) <> '' then
     sParams := sParams + 'Стадия заболевания: ' + rowPhase.Properties.Value + '; ';

  if sParams = ' Параметры: ' then
     sParams := '';

  frList.ShowReport;
end;

//---------------------
procedure TfrmMain.aProtocolExecute(Sender: TObject);
begin
  DoResult(VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_NAZID.Index]);
end;

//------------------------------------------------------------------------------
procedure TfrmMain.aRefreshExecute(Sender: TObject);
var
  sSQL: string;

begin
  cxGr.SetFocus;
  aRefresh.Enabled := False;
  aPrint.Enabled := False;
  aProtocol.Enabled := False;
  aOpenMK.Enabled := False;

  if VIEW.DataController.LockCount = 0 then
     VIEW.BeginUpdate;

  VIEW.DataController.RecordCount := 0;

  while VIEW.DataController.LockCount > 0 do
     VIEW.EndUpdate;

  memData.Close;
  memData.Open;

  dDateBegin := VarToDateTime(rowPeriodFrom.Properties.Value);
  dDateEnd := VarToDateTime(rowPeriodTo.Properties.Value+' 23:59:59');

  oqThread.Scrollable := True;

  oqThread.DeclareAndSet('PDATA1', otDate, dDateBegin);
  oqThread.DeclareAndSet('PDATA2', otDate, dDateEnd);


//-->> 3. Пациент
  if rowPac.Tag <> -1 then begin
     sSQL := Format(' asu.get_peplid(fk_pacid) = %s', [IntToStr(rowPac.Tag)]);
  end else begin
     sSQL := ' 1 = 1';
  end;
  oqThread.SetVariable(':psubpacid', sSQL);


//-->> 4. Пол пациента
  if VarToStr(rowSex.Properties.Value) <> '' then begin
     if rowSex.Properties.Value = 'Мужчины' then
        sSQL := Format(' FC_SEX = ''%s'' ', ['М']);
     if rowSex.Properties.Value = 'Женщины' then
        sSQL := Format(' FC_SEX = ''%s'' ', ['Ж']);
  end else begin
     sSQL := ' 2 = 2';
  end;
  oqThread.SetVariable(':psubsex', sSQL);


//-->> 5. Возраст
  if VarToStr(rowVozr.Properties.Value) <> '' then begin
     sSQL := Format(' FN_AGE = %s' , [VarToStr(rowVozr.Properties.Value)]);
  end else begin
     sSQL := ' 3 = 3';
  end;
  oqThread.SetVariable(':psubage', sSQL);


//-->> 6. Наименование операции
  if VarToStr(rowOper.Properties.Value) <> '' then begin
     sSQL := '  UPPER(NVL(LTRIM(asu.PKG_LISTS.GET_OPER_NAME(FK_NAZID)), ASU.GET_SMIDNAME(FK_SMIDID))) like UPPER(''%' + VarToStr(rowOper.Properties.Value) + '%'') ';
  end else begin
     sSQL := ' 4 = 4';
  end;
  oqThread.SetVariable(':psubopername', sSQL);


//-->> 6. Диагноз
  if VarToStr(rowDiag.Properties.Value) <> '' then begin
     sSQL := Format(' (select max(d.fk_smdiagid) from asu.tdiag d where fk_id = fk_diag) in (select fk_id from asu.tsmid connect by prior fk_id = fk_owner and nvl(fl_del, 0) = 0 start with fk_id in (%s))' , [Self.GetMKB10ID()]);
  end else begin
     sSQL := ' 5 = 5';
  end;
  oqThread.SetVariable(':psubds', sSQL);


//-->> 6. Стадия
  if VarToStr(rowPhase.Properties.Value) <> '' then begin
     sSQL := Format(' (select max(nm.fk_phase) from asu.tdiag d, asu.tdiag_tnm nm where d.fk_id = nm.fk_diagid (+) and d.fk_id = fk_diag) = %s' , [IntToStr(rowPhase.Tag)]);
  end else begin
     sSQL := ' 6 = 6';
  end;
  oqThread.SetVariable(':psubphase', sSQL);

    if VarToStr(rowDates.Properties.Value) <> '' then begin
     if rowDates.Properties.Value = 'дате выполнения' then
      sSQL := ' FD_RUN '
     else if rowDates.Properties.Value = 'дате поступления' then
      sSQL := ' FD_DATA1 '
     else if rowDates.Properties.Value = 'дате выписки' then
      sSQL := ' FD_DATA2 ';//}
    end
    else
     sSql := ' fd_run ';

//-->> 7. ограничивать по
 { if VarToStr(rowDates.Properties.Value) <> '' then begin
     case rowDates.Properties.ItemIndex of
      1 : sSQL := ' FD_DATA1 ';
      2 : sSQL := ' FD_DATA2 ';
      else
      sSQL := ' FD_RUN ';
     end;
  end else begin
     sSQL := ' FD_RUN ';
  end;       }
  oqThread.SetVariable(':pdates', sSQL);

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

  VIEW.BeginUpdate;
  nRec := 0;

  oqThread.Execute;
  
end;

//------------------------------------------------------------------------------
procedure TfrmMain.aTextExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
     ExportGridToText(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

//------------------------------------------------------------------------------
procedure TfrmMain.aWebExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
     ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

//------------------------------------------------------------------------------
procedure TfrmMain.aXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
     ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

//------------------------------------------------------------------------------
procedure TfrmMain.aXMLExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
     ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

//------------------------------------------------------------------------------
procedure TfrmMain.BmpToJPEG(pFNAME1, pFNAME2: String);
var
  JPEG: TJPEGImage;
  Bitmap: TBitmap;
  Image1: TImage;
  lStream: TFileStream;
begin
  lStream:=TFileStream.Create(ExtractFilePath(paramstr(0))+'RGIMAGES'+pFNAME2,fmOpenRead);
  try
     if PhysicalResolveFileType(lStream)=1 then begin
        lStream.Free;
        JPEG := TJPEGImage.Create;
        Bitmap := TBitmap.Create;
        Image1:=timage.create(nil);
        try
           Bitmap.LoadFromFile(ExtractFilePath(paramstr(0))+'RGIMAGES'+pFNAME2);
           JPEG.Assign(Bitmap);
           Image1.Picture.Assign(JPEG);
           Image1.Picture.SaveToFile(ExtractFilePath(paramstr(0))+'RGIMAGES'+pFNAME1);
        finally
           Image1.free;
           JPEG.Free;
           Bitmap.Free;
        end;

     end else
        lStream.Free;
  except
    lStream.Free;
  end;
end;

//---------------------
procedure TfrmMain.DoResult(nNazID: Integer);
var q : TOracleDataSet;
    ods : TOracleDataSet;
    LOB : TLOBLocator;
    IDRes : Integer;
    RegSave, RegLoad : TRegIniFile;
begin
  Application.CreateForm(TfrmPreview, frmPreview);
  frmPreview.WindowState := wsMaximized;

  RegLoad := TRegIniFile.Create;
  RegLoad.RootKey:=HKEY_CURRENT_USER;
  RegLoad.OpenKey('\Software\Softmaster\Print\ID_VRACH'+IntToStr(pSotrID), True);
  frmPreview.bbFormat.ItemIndex := RegLoad.ReadInteger('\Software\Softmaster\Print\ID_VRACH'+IntToStr(pSOTRID), 'RazmerList', 0);
  RegLoad.Free;

  if not DirectoryExists(ExtractFilePath(paramstr(0))+'RGIMAGES') then
    CreateDir(ExtractFilePath(paramstr(0))+'RGIMAGES');

  ods := TOracleDataSet.Create(nil);
  ods.Session := os;
  ods.Cursor := crSQLWait;
  ods.SQL.Text := ' SELECT FK_ID FROM VRES WHERE FK_NAZID ='+IntToStr(nNazID);
  ods.Open;
  IDRes := ods.FieldByName('FK_ID').AsInteger;

  ods.DeleteVariables;
  ods.Close;
  ods.SQL.Text := ' SELECT THTMLIMAGES.FC_NAME||''.JPG'' SFILENAME, THTMLIMAGES.FB_BLOB '+
                  '   FROM ASU.TRICHVIEWDATA, ASU.THTMLIMAGES '+
                  '  WHERE TRICHVIEWDATA.FK_PACID ='+IntToStr(nNazID)+  
                  '    AND THTMLIMAGES.FK_RICHVIEW=TRICHVIEWDATA.FK_ID ';
  ods.Open;
  if ods.RecordCount > 0 then
    begin
      while not ods.Eof do
        begin
          TBlobField(ods.FieldByName('FB_BLOB')).SaveToFile(ExtractFilePath(paramstr(0))+'RGIMAGES'+ods.FieldByName('SFILENAME').AsString);
          BmpToJPEG(ods.FieldByName('SFILENAME').AsString, ods.FieldByName('SFILENAME').AsString);
          ods.Next;
        end;
    end;
  ods.Free;

//--
  q:=TOracleDataSet.Create(nil);
  q.Session:=os;
  q.Cursor := crSQLWait;
  LOB:=TLOBLocator.Create(os, otCLOB);
  q.DeclareVariable('html', otCLOB);
  q.SetComplexVariable('html', LOB);
  q.SQL.Add(' BEGIN ');
  q.SQL.Add('  dbms_lob.createtemporary(:html, TRUE, dbms_lob.SESSION);');
  q.SQL.Add('  dbms_lob.WRITE(:html,1,1,'' '');');
  q.SQL.Add('  :html:='+'STAT.PKG_IBXML.GET_HTM_OSM('+IntToStr(IDRes)+');');
  q.SQL.Add(' END; ');
  q.Open;

  LOB:=TLOBLocator(q.GetComplexVariable('html'));
  LOB.SaveToFile(ExtractFilePath(paramstr(0))+'RGIMAGES'+IntToStr(VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_PACID.Index]) +'print.htm');
  q.Free;
  LOB.Free;
  frmPreview.wb.Navigate(ExtractFilePath(paramstr(0))+'RGIMAGES'+IntToStr(VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_PACID.Index]) +'print.htm');
  frmPreview.ShowModal;
  if frmPreview.ModalResult = MrOk then
    begin
      RegSave := TRegIniFile.Create;
      RegSave.RootKey:=HKEY_CURRENT_USER;
      if not RegSave.OpenKey('\Software\Softmaster\Print\', FALSE) then
        begin
          RegSave.CreateKey('\Software\Softmaster\Print');
        end;
      try
        RegSave.WriteInteger('\Software\Softmaster\Print'+'\ID_VRACH'+IntToStr(pSotrID), 'RazmerList', frmPreview.bbFormat.ItemIndex); 
      except
      end;
      RegSave.Free;
      DoWordProcess(ExtractFilePath(paramstr(0))+'RGIMAGES'+inttostr(VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_PACID.Index]) +'print.htm', frmPreview.bbFormat.ItemIndex);
      try
        DeleteFile(ExtractFilePath(paramstr(0))+'RGIMAGES'+inttostr(VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_PACID.Index]) +'print.htm');
      except
      end;
      frmPreview.Free;
    end else
    begin
      try
        DeleteFile(ExtractFilePath(paramstr(0))+'RGIMAGES'+inttostr(VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_PACID.Index]) +'print.htm');
      except
      end;
      frmPreview.Free;
    end;
end;

//------------------------------------------------------------------------------
procedure TfrmMain.DoShowForm;
var ods : TOracleDataSet;
    Ver : TJclFileVersionInfo;
begin
  rowPac.Tag := -1;
  rowDiag.Tag := -1;
  rowPhase.Tag := -1;

  ods := TOracleDataSet.Create(nil);
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));

  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY'') AS DATESYS, '+#13+
                    '        FK_SOTRID, '+#13+
                    '        ASU.DO_VRACHFIO(FK_SOTRID) AS VRACHFIO, asu.get_vipnaz, '+#13+
                    '        (SELECT FC_NAME FROM ASU.TOTDEL WHERE FK_ID = (SELECT FK_OTDID FROM ASU.TSOTR WHERE FK_ID = TAPPSOTR.FK_SOTRID)) AS OTDELNAME '+#13+
                    '   FROM LOGIN.TAPPSOTR '+#13+
                    '  WHERE FL_DEL <> 1 '+#13+
                    '    AND FK_ID = :PFK_ID ';

    ods.DeclareAndSet('PFK_ID', otInteger, StrToInt(paramstr(1)));
    ods.Open;

    pAPPSOTRID := StrToInt(paramstr(1));
    pSOTRID := ods.FieldByName('FK_SOTRID').AsInteger;
    frmMain.Caption := 'Архив выполненных операций ('+Ver.FileVersion+')'+'. Пользователь: '+ods.FieldByName('VRACHFIO').AsString;

    rowPeriodFrom.Properties.Value := ods.FieldByName('DATESYS').AsVariant;
    rowPeriodTo.Properties.Value := ods.FieldByName('DATESYS').AsVariant;

    sSotrFIO := ods.FieldByName('VRACHFIO').AsString;
    ods.Close;


    ods.DeleteVariables;
    ods.SQL.Text := ' select asu.pkg_smini.readstring(''CONFIG'', ''S_FULLNAME'', '''') as companyname, '+#13+
                    '        asu.get_vipnaz, asu.get_labvip, asu.get_nevip, '+#13+
                    '        asu.pkg_smini.readstring(''CONFIG'', ''DB_NAME'', ''H'') as db_name '+#13+
                    '   from dual ';
    ods.Open;
    sCompanyName_4Rep := ods.FieldByName('companyname').AsString;
    get_vipnaz := ods.FieldByName('get_vipnaz').AsInteger;
    get_labvip := ods.FieldByName('get_labvip').AsInteger;
    get_nevip := ods.FieldByName('get_nevip').AsInteger;
    get_dbname := ods.FieldByName('db_name').AsString;

    VIEW_OPERATOR.Visible := get_dbname = 'TO'; 
    VIEW_OPERATOR.VisibleForCustomization := get_dbname = 'TO';

    rowVozr.Properties.Value := null;


//--- "заряжаем" датасеты

//--- "заряжаем" датасеты


    VIEW.StoreToRegistry('\SoftWare\SoftMaster\Oper_Archive\fMain\ViewVrach_' + IntToStr(pSOTRID)+'Default', TRUE, [], 'VIEW');
    VIEW.RestoreFromRegistry('\SoftWare\SoftMaster\Oper_Archive\fMain\ViewVrach_' + IntToStr(pSOTRID), FALSE, FALSE, [], 'VIEW');
    MedotradeSign := ReadMedotradeSign;
    
  finally
    ods.Free;
    Ver.Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TfrmMain.DoWordProcess(path: String; FormatPr: Integer; bLandscape: Boolean);
var
  WordApp : TWordApplication;
  WordDoc : TWordDocument;
  Template, NewTemplate, FileName,
  ConfirmConversions, ReadOnly, AddToRecentFiles,
  PasswordDocument, PasswordTemplate, Revert,
  WritePasswordDocument, WritePasswordTemplate,
  Format, Encoding, EmPar, Visible,
  Background, time,SaveCHanges,OriginalFormat,
  RouteDocument : OleVariant;
begin
  Screen.Cursor := crHourGlass;
  EmPar:='';
  WordApp:=TWordApplication.Create(nil);
  WordDoc:=TWordDocument.Create(nil);
  try
     Template:='';
     NewTemplate:=True;
     try
        WordApp.Connect;
     except
        WordDoc.Close;
        WordDoc.Free;
        Wordapp.Quit;
        WordApp.Free;
        Application.Terminate; //???
     end;

     Wordapp.Visible:=false;
     WordApp.Options.CheckSpellingAsYouType:=False;
     WordApp.Options.CheckGrammarAsYouType:=False;
     FileName:=path;
     ConfirmConversions:=FALSE;
     ReadOnly:=FALSE;
     AddToRecentFiles:=FALSE;
     PasswordDocument:= '';
     PasswordTemplate:= '';
     Revert:=FALSE;
     WritePasswordDocument:= '';
     WritePasswordTemplate:= '';
     Format:=wdOpenFormatAuto;
     Visible:=TRUE;
     WordDoc.ConnectTo(WordApp.Documents.Open(FileName, ConfirmConversions, ReadOnly, AddToRecentFiles, PasswordDocument, PasswordTemplate, Revert, WritePasswordDocument, WritePasswordTemplate, Format, Encoding, visible));
     BackGround:=False;
     Time:=WordApp.Documents.Count;

     if FormatPr = 1 then begin
        WordDoc.PageSetup.LineNumbering.Active := 0;
        WordDoc.PageSetup.Orientation := wdOrientLandscape;
        WordDoc.PageSetup.TopMargin := 22.5;
        WordDoc.PageSetup.BottomMargin := 22.5;
        WordDoc.PageSetup.LeftMargin := 56.7;
        WordDoc.PageSetup.RightMargin := 56.7;
        WordDoc.PageSetup.Gutter := 0;
        WordDoc.PageSetup.HeaderDistance := 35.4;
        WordDoc.PageSetup.FooterDistance := 35.4;
        WordDoc.PageSetup.PageWidth := 595.35;
        WordDoc.PageSetup.PageHeight := 419.55;
        WordDoc.PageSetup.FirstPageTray := wdPrinterDefaultBin;
        WordDoc.PageSetup.OtherPagesTray := wdPrinterDefaultBin;
        WordDoc.PageSetup.SectionStart := wdSectionNewPage;
        WordDoc.PageSetup.OddAndEvenPagesHeaderFooter := 0;
        WordDoc.PageSetup.DifferentFirstPageHeaderFooter := 0;
        WordDoc.PageSetup.VerticalAlignment := wdAlignVerticalTop;
        WordDoc.PageSetup.SuppressEndnotes := 0;
        WordDoc.PageSetup.MirrorMargins := 0;
        WordDoc.PageSetup.TwoPagesOnOne := FALSE;
        WordDoc.PageSetup.GutterPos := wdGutterPosLeft;
     end else begin
        WordDoc.PageSetup.Orientation:= wdOrientPortrait;
        WordDoc.PageSetup.TextColumns.SetCount(1);
     end;

     WordApp.ActiveWindow.View.Type_:=wdPageView;
     TReportUtils.AddMedotradeSign(WordApp);
     WordApp.PrintOut(BackGround);
     SaveChanges := WdDoNotSaveChanges;
     WordApp.Quit(SaveChanges,OriginalFormat,RouteDocument) ;

     try
        WordApp.Disconnect;
     except
        on E: Exception do begin
           Showmessage(E.Message);
           WordApp.Disconnect;
        end;
     end;

  except
     on E: Exception do begin
        ShowMessage(E.Message);
        WordApp.Disconnect;
     end;
  end;

  try
     WordDoc.free;
     WordApp.free;
  finally
     Screen.Cursor := crArrow;
  end;
end;

//------------------------------------------------------------------------------
procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Вы хотите закрыть программу ?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then begin
     oqThread.BreakThread;
     SetLength(arMKB,0);
     action := caFree;
  end else begin
     action := caNone;
  end;
end;

//------------------------------------------------------------------------------
procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  VIEW.StoreToRegistry('\SoftWare\SoftMaster\Oper_Archive\fMain\ViewVrach_' + IntToStr(pSOTRID), TRUE, [], 'VIEW');
end;

//------------------------------------------------------------------------------
procedure TfrmMain.FormCreate(Sender: TObject);
begin
  GetSession(os, 'ASU');
  Russian:=LoadKeyboardLayout('00000419', 0);
  aPrint.Enabled := False;
  aProtocol.Enabled := False;
  aOpenMk.Enabled := False;
  Self.WindowState := wsMaximized;
  rowDates.Properties.Value := 'дате выполнения';

  SetLength(arMKB,0);
end;

//------------------------------------------------------------------------------
procedure TfrmMain.frListGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'DATESYS' then Value := DateSys_4Rep;
  if VarName = 'SOTR' then Value := sSotrFIO;
  if VarName = 'DATE1' then Value := rowPeriodFrom.Properties.Value;
  if VarName = 'DATE2' then Value := rowPeriodTo.Properties.Value;
  if VarName = 'PARAMS' then Value := sParams;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
  if VarName = 'VSEGO' then Value := oqThread.RowCount;
  if VarName = 'DATES' then Value := rowDates.Properties.Value;
end;

//------------------------------------------------------------------------------
procedure TfrmMain.N1Click(Sender: TObject);
begin
  aClearFilterExecute(Sender);
end;

//------------------------------------------------------------------------------
procedure TfrmMain.N3Click(Sender: TObject);
begin
  VIEW.RestoreFromRegistry('\SoftWare\SoftMaster\Oper_Archive\fMain\ViewVrach_' + IntToStr(pSOTRID)+'Default', FALSE, FALSE, [], 'VIEW');
end;

//------------------------------------------------------------------------------
procedure TfrmMain.oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer; const ErrorMessage: string);
begin
  VIEW.EndUpdate;
  MessageDlg('Во время выполнения запроса произошла ошибка! Обратитесь к администратору системы!'+
             #13#10+'Код ошибки: '+IntToStr(ErrorCode)+
             #13#10+'Текст ошибки: '+ErrorMessage,
             mtError, [mbOK], 0);
  bbr := True;
end;

//------------------------------------------------------------------------------
procedure TfrmMain.oqThreadThreadFinished(Sender: TOracleQuery);
begin
  VIEW.EndUpdate;
  aRefresh.Enabled := True;
  aPrint.Enabled := oqThread.RowCount <> 0;
  aProtocol.Enabled := oqThread.RowCount <> 0;
  aOpenMK.Enabled := oqThread.RowCount <> 0;
  Animator1.Animate := False;
  if bbr then
     cxLabel3.Caption := 'При выполнении запроса произошла ошибка!'
  else
     cxLabel3.Caption := 'Запрос к Базе Данных выполнился успешно!';
end;

//------------------------------------------------------------------------------
procedure TfrmMain.oqThreadThreadRecord(Sender: TOracleQuery);
begin
//  VIEW.BeginUpdate;
  VIEW.DataController.RecordCount := VIEW.DataController.RecordCount + 1;

  with VIEW.DataController do begin
    try
      Values[VIEW.DataController.RecordCount - 1, VIEW_NAZID.Index] := Sender.Field('FK_NAZID');
      Values[VIEW.DataController.RecordCount - 1, VIEW_IB.Index] := Sender.Field('FC_IB');
      Values[VIEW.DataController.RecordCount - 1, VIEW_PACID.Index] := Sender.Field('FK_PACID');
      Values[VIEW.DataController.RecordCount - 1, VIEW_PACFIO.Index] := Sender.Field('FC_FIO');
      Values[VIEW.DataController.RecordCount - 1, VIEW_BITH.Index] := Sender.Field('FD_ROJD');
      Values[VIEW.DataController.RecordCount - 1, VIEW_AGE.Index] := Sender.Field('FN_AGE');
      Values[VIEW.DataController.RecordCount - 1, VIEW_SEX.Index] := Sender.Field('FC_SEX');
      Values[VIEW.DataController.RecordCount - 1, VIEW_OPERNAME.Index] := Sender.Field('FC_OPLECHNAME');
      Values[VIEW.DataController.RecordCount - 1, VIEW_KODOPER.Index] := Sender.Field('FN_KODOPER');
      Values[VIEW.DataController.RecordCount - 1, VIEW_DS.Index] := Sender.Field('fc_diag');
      Values[VIEW.DataController.RecordCount - 1, VIEW_PHASE.Index] := Sender.Field('fc_phase');
      Values[VIEW.DataController.RecordCount - 1, VIEW_KDN_BEFORE.Index] := Sender.Field('FN_KDNDO');
      Values[VIEW.DataController.RecordCount - 1, VIEW_KDN_AFTER.Index] := Sender.Field('FN_KDNAFTER');
      Values[VIEW.DataController.RecordCount - 1, VIEW_KDN.Index] := Sender.Field('FN_KDNA');
      Values[VIEW.DataController.RecordCount - 1, VIEW_DATA1.Index] := Sender.Field('FD_DATA1');
      Values[VIEW.DataController.RecordCount - 1, VIEW_DATA2.Index] := Sender.Field('FD_DATA2');
      Values[VIEW.DataController.RecordCount - 1, VIEW_FD_RUN.Index] := Sender.Field('FD_RUN');
      Values[VIEW.DataController.RecordCount - 1, VIEW_ISPOL.Index] := Sender.Field('FC_RUNSOTR');
//      Values[VIEW.DataController.RecordCount - 1, VIEW_OPERATOR.Index] := Sender.Field('FC_RUNSOTR');
      Values[VIEW.DataController.RecordCount - 1, VIEW_OTDEL.Index] := Sender.Field('FC_OTDEL');
      Values[VIEW.DataController.RecordCount - 1, VIEW_ROOM.Index] := Sender.Field('FC_ROOM');
      Values[VIEW.DataController.RecordCount - 1, VIEW_GITEL.Index] := Sender.Field('fc_jitel');
      Values[VIEW.DataController.RecordCount - 1, VIEW_SROCHNOST.Index] := Sender.Field('fc_naztypeid');
      Values[VIEW.DataController.RecordCount - 1, VIEW_REGION.Index] := Sender.Field('fc_region');
      Values[VIEW.DataController.RecordCount - 1, VIEW_RAION.Index] := Sender.Field('fc_raion');
      Values[VIEW.DataController.RecordCount - 1, VIEW_CITY.Index] := Sender.Field('fc_city');
      Values[VIEW.DataController.RecordCount - 1, VIEW_PEPLID.Index] := Sender.Field('FK_PEPLID');
      Values[VIEW.DataController.RecordCount - 1, VIEW_RN.Index] := Sender.Field('RN');
      Values[VIEW.DataController.RecordCount - 1, VIEW_OPERATOR.Index] := Sender.Field('FC_OPERATOR');


      memData.Insert;
      memData.FieldByName('NAZID').AsInteger := Sender.Field('FK_NAZID');
      memData.FieldByName('IB').AsString := Sender.Field('FC_IB');
      memData.FieldByName('PACID').AsInteger := Sender.Field('FK_PACID');
      memData.FieldByName('PACFIO').AsString := Sender.Field('FC_FIO');
      memData.FieldByName('BITH').AsDateTime := Sender.Field('FD_ROJD');
      memData.FieldByName('AGE').AsInteger := Sender.Field('FN_AGE');
      memData.FieldByName('SEX').AsString := Sender.Field('FC_SEX');
      memData.FieldByName('OPERNAME').AsString := Sender.Field('FC_OPLECHNAME');
      memData.FieldByName('KODOPER').AsString := Sender.Field('FN_KODOPER');
      memData.FieldByName('DS').AsString := Sender.Field('fc_diag');
      memData.FieldByName('PHASE').AsString := Sender.Field('fc_phase');
      memData.FieldByName('KDN_BEFORE').AsInteger := Sender.Field('FN_KDNDO');
      memData.FieldByName('KDN_AFTER').AsInteger := Sender.Field('FN_KDNAFTER');
      memData.FieldByName('KDN').AsInteger := Sender.Field('FN_KDNA');
      memData.FieldByName('DATA1').AsDateTime := Sender.Field('FD_DATA1');
      memData.FieldByName('DATA2').AsDateTime := Sender.Field('FD_DATA2');
      memData.FieldByName('FD_RUN').AsDateTime := Sender.Field('FD_RUN');
      memData.FieldByName('ISPOL').AsString := Sender.Field('FC_VRACH');     
      memData.FieldByName('OPERATOR').AsString := Sender.Field('FC_RUNSOTR');
      memData.FieldByName('OTDEL').AsString := Sender.Field('FC_OTDEL');
      memData.FieldByName('ROOM').AsString := Sender.Field('FC_ROOM');
      memData.FieldByName('GITEL').AsString := Sender.Field('fc_jitel');
      memData.FieldByName('SROCHNOST').AsString := Sender.Field('fc_naztypeid');
      memData.FieldByName('REGION').AsString := Sender.Field('fc_region');
      memData.FieldByName('RAION').AsString := Sender.Field('fc_raion');
      memData.FieldByName('CITY').AsString := Sender.Field('fc_city');
      memData.FieldByName('PEPLID').AsInteger := Sender.Field('FK_PEPLID');
      memData.FieldByName('RN').AsInteger := Sender.Field('RN');
      memData.Post;
      memData.Next;
    finally
    end;
  end;
//  VIEW.EndUpdate;
  cxLabel1.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
  cxLabel1.Refresh;
  cxLabel2.Caption := 'Выбрано ' + IntToStr(VIEW.DataController.RecordCount) + ' записей.';
  cxLabel2.Refresh;
  nRec := nRec + 1;

  if nRec > 100 then begin
     nRec := 0;
     VIEW.EndUpdate;
     VIEW.BeginUpdate;
  end;
end;

//------------------------------------------------------------------------------
function TfrmMain.PhysicalResolveFileType(AStream: TStream): Integer;
var p: PChar;
begin
  Result := 0;
  if not Assigned(AStream) then
     Exit;

  GetMem(p, 10);

  try
     AStream.Position := 0;
     AStream.Read(p[0], 10);

     {bitmap format}
     if (p[0] = #66) and (p[1] = #77) then
        Result := 1;

     {tiff format}
     if ((p[0] = #73) and (p[1] = #73) and (p[2] = #42) and (p[3] = #0)) or
        ((p[0] = #77) and (p[1] = #77) and (p[2] = #42) and (p[3] = #0))
     then
        Result := 2;

     {jpg format}
     if (p[6] = #74) and (p[7] = #70) and (p[8] = #73) and (p[9] = #70) then
        Result := 3;

     {png format}
     if (p[0] = #137) and (p[1] = #80) and (p[2] = #78) and (p[3] = #71) and
         (p[4] = #13) and (p[5] = #10) and (p[6] = #26) and (p[7] = #10)
     then
        Result := 4;

     {dcx format}
     if (p[0] = #177) and (p[1] = #104) and (p[2] = #222) and (p[3] = #58) then
        Result := 5;

     {pcx format}
     if p[0] = #10 then
        Result := 6;

     {emf format}
     if (p[0] = #215) and (p[1] = #205) and (p[2] = #198) and (p[3] = #154) then
        Result := 7;

     {emf format}
     if (p[0] = #1) and (p[1] = #0) and (p[2] = #0) and (p[3] = #0) then
        Result := 7;
  finally
     Freemem(p);
  end;
end;

//------------------------------------------------------------------------------
function TfrmMain.RestoreApplication(AAppCaption: string): Boolean;
var
  Wnd               : hWnd;
  buff              : array[0..127] of Char;
begin
  Result := False;
  Self.SetFocus;
  Application.ProcessMessages;
  Wnd := GetWindow(Handle, gw_HWndFirst);
  while Wnd <> 0 do begin
     if (Wnd <> Application.Handle) and (GetWindow(Wnd, gw_Owner) = 0) then begin
        GetWindowText(Wnd, buff, sizeof(buff));
        if trim(StrPas(buff)) = trim(AAppCaption) then begin
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

//------------------------------------------------------------------------------
procedure TfrmMain.rowMatEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if AButtonIndex = 0 then begin

     if SetMKB10() then begin
        rowDiag.Tag := 1;
        TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsNormal;
        TcxButtonEdit(vGr.InplaceEditor).EditingText := Self.GetMKB10Text();
        TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsHideCursor;
     end;

     if rowDiag.Tag = -1 then begin
        rowDiag.Properties.ImageIndex := -1;
        rowDiag.Styles.Content := stNormal;
        rowDiag.Styles.Header := stNormal;
     end else begin
        rowDiag.Properties.ImageIndex := 4;
        rowDiag.Styles.Content := stBold;
        rowDiag.Styles.Header := stBold;
     end;
  end;

  if AButtonIndex = 1 then begin
     rowDiag.Tag := -1;
     TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsNormal;
     TcxButtonEdit(vGr.InplaceEditor).EditingText := '';
     TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsHideCursor;
     rowDiag.Properties.Value := -1;
     rowDiag.Properties.Value := null;
     rowDiag.Properties.ImageIndex := -1;
     rowDiag.Styles.Content := stNormal;
     rowDiag.Styles.Header := stNormal;

     SetLength(arMKB,0);
  end;
end;

//------------------------------------------------------------------------------
procedure TfrmMain.rowOperEditPropertiesChange(Sender: TObject);
begin
  if (trim(VarToStr(rowOper.Properties.Value)) <> '') then begin
     rowOper.Properties.ImageIndex := 4;
     rowOper.Styles.Content := stBold;
     rowOper.Styles.Header := stBold;
  end else begin
     rowOper.Properties.ImageIndex := -1;
     rowOper.Styles.Content := stNormal;
     rowOper.Styles.Header := stNormal;
  end;
end;

//------------------------------------------------------------------------------
procedure TfrmMain.rowPacEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if AButtonIndex = 0 then begin
     Application.CreateForm(TfrmSearch, frmSearch);
     try
        frmSearch.ShowModal;
        if frmSearch.ModalResult = mrOk then begin
           rowPac.Tag := frmSearch.odsPac.FieldByName('FK_ID').AsInteger;
           TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsNormal;
           TcxButtonEdit(vGr.InplaceEditor).EditingText := frmSearch.odsPac.FieldByName('FIO').AsString;
           TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsHideCursor;
        end;
     finally
        frmSearch.Free;
     end;
  end;

  if AButtonIndex = 1 then begin
     rowPac.Tag := -1;
     TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsNormal;
     TcxButtonEdit(vGr.InplaceEditor).EditingText := ' ';
     TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsHideCursor;
  end;
end;

//------------------------------------------------------------------------------
procedure TfrmMain.rowPhaseEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  if (AButtonIndex = 0) then begin
     Application.CreateForm(TfrmSetChar, frmSetChar);
     frmSetChar.DoShowForm('DIAGS_PHASE_ONKO');
     try
        frmSetChar.ShowModal;
        if (frmSetChar.ModalResult = mrOK) then begin
           rowPhase.Tag := frmSetChar.ods.FieldByName('fk_id').AsInteger;
           TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsNormal;
           TcxButtonEdit(vGr.InplaceEditor).EditingText := frmSetChar.ods.FieldByName('fc_name').AsString;
           TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsHideCursor;

           if (rowPhase.Tag = -1) then begin
              rowPhase.Properties.ImageIndex := -1;
              rowPhase.Styles.Content := stNormal;
              rowPhase.Styles.Header := stNormal;
           end else begin
              rowPhase.Properties.ImageIndex := 4;
              rowPhase.Styles.Content := stBold;
              rowPhase.Styles.Header := stBold;
           end;
        end;
     finally
        frmSetChar.Free;
     end;
  end;

  if (AButtonIndex = 1) then begin
     rowPhase.Tag := -1;
     TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsNormal;
     TcxButtonEdit(vGr.InplaceEditor).EditingText := '';
     TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsHideCursor;
     rowPhase.Properties.Value := -1;
     rowPhase.Properties.Value := null;
     rowPhase.Properties.ImageIndex := -1;
     rowPhase.Styles.Content := stNormal;
     rowPhase.Styles.Header := stNormal;
  end;
end;

//------------------------------------------------------------------------------
procedure TfrmMain.rowVozrEditPropertiesChange(Sender: TObject);
begin
  if (rowVozr.Properties.Value < 0) then begin
     rowVozr.Properties.Value := 0;
  end;
  if (rowVozr.Properties.Value > 200) then begin
     rowVozr.Properties.Value := 200;
  end;

  if (rowVozr.Properties.Value <> 0) and (rowVozr.Properties.Value <> null) then begin
     rowVozr.Properties.ImageIndex := 4;
     rowVozr.Styles.Content := stBold;
     rowVozr.Styles.Header := stBold;
  end else begin
     rowVozr.Properties.ImageIndex := -1;
     rowVozr.Styles.Content := stNormal;
     rowVozr.Styles.Header := stNormal;
  end;
end;

//------------------------------------------------------------------------------
procedure TfrmMain.tmrCheckApplicationTimer(Sender: TObject);
var Wnd               : hWnd;
    buff              : array[0..127] of Char;
    i, j, iDel        : Integer;
    s : string;
begin
  Application.ProcessMessages;
  if not(tmrCheckApplication.Enabled) then
     Exit;

  iDel:=0;
  for i:=0 to Length(arFIO)-1 do
   begin
     Wnd := GetWindow(Handle, gw_HWndFirst);
     while Wnd <> 0 do
      begin
        if (Wnd <> Application.Handle) and (GetWindow(Wnd, gw_Owner) = 0) then
         begin
           GetWindowText(Wnd, buff, sizeof(buff));
           s := StrPas(buff);
           if trim(s) = trim(arFIO[i-iDel]) then
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
                    tmrCheckApplication.Enabled := False;
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

procedure TfrmMain.VIEWFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
var
  i :integer;
  res : boolean;
begin
  res := true;
  for I := 0 to Length(frmMain.arFIO) - 1 do
   begin
    if arFIO[Length(frmMain.arFIO)-1] = AFocusedRecord.Values[VIEW_PACFIO.index] then
     begin
       res := false;
       break;
     end;
   end;
  aOpenMK.enabled := res;
end;

//------------------------------------------------------------------------------
function TfrmMain.GetMKB10Text: string;
var
  I: Integer;
  ods: TOracleDataSet;
begin
  Result := '';
  ods := TOracleDataSet.Create(nil);
  ods.Session := Self.os;
  ods.SQL.Text := 'select * from asu.tsmid where fk_id = :id';
  ods.DeclareVariable('id', otInteger);

  for I := 0 to Length(arMKB) - 1 do begin
     ods.Close;
     ods.SetVariable('id',arMKB[i]);
     ods.Open;
     Result := Result + ods.FieldByName('fk_mkb10').AsString+'; ';
  end;

  ods.Free;
end;

//------------------------------------------------------------------------------
function TfrmMain.GetMKB10ID: string;
var
  I: Integer;
begin
  Result := '-1';
  for I := 0 to Length(arMKB) - 1 do
  begin
    Result := Result + ','+IntToStr(arMKB[i]);
  end;
end;

end.
