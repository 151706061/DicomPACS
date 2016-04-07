unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OracleData, JclFileUtils, Oracle, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinsdxBarPainter, ImgList, ActnList, dxBar,
  cxClasses, cxStyles, dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, jvDBUtils, cxContainer, cxLabel, ExtCtrls, cxSplitter, frxClass,
  frxDBSet, Menus, cxGridExportLink, JvExControls, JvAnimatedImage, JvGIFCtrl,
  dxmdaset, cxLookAndFeelPainters, StdCtrls, cxButtons, uGlobalConst, SMMainAPI,
  cxCalendar, cxTimeEdit, dxSkinOffice2007Green;

type
  TfrmMain = class(TForm)
    os: TOracleSession;
    dxBarDockControl1: TdxBarDockControl;
    BMMain: TdxBarManager;
    alMain: TActionList;
    ILMain: TImageList;                                
    BMMainBar1: TdxBar;
    bbRefresh: TdxBarButton;
    aClose: TAction;
    bbClose: TdxBarButton;
    aRefresh: TAction;
    TVLIST: TcxGridDBTableView;
    cxGrLevel1: TcxGridLevel;
    cxGr: TcxGrid;
    dsList: TDataSource;
    bbParam: TdxBarButton;
    aParam: TAction;
    VLISTKABINET: TcxGridDBColumn;
    VLISTISSLNAME: TcxGridDBColumn;
    VLISTFD_NAZ: TcxGridDBColumn;
    paParam: TPanel;
    Splitter1: TSplitter;
    paMainParam: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    lbSotrFIO: TcxLabel;
    lbDateBeg: TcxLabel;
    cxLabel3: TcxLabel;
    lbDateEnd: TcxLabel;
    paSubParam: TPanel;
    cxSplitter1: TcxSplitter;
    VLISTFD_RUN: TcxGridDBColumn;
    VLISTFIOPAC: TcxGridDBColumn;
    VLISTSTATE: TcxGridDBColumn;
    VLISTTIME: TcxGridDBColumn;
    bbResult: TdxBarButton;
    bbPrint: TdxBarButton;
    aResult: TAction;
    aPrint: TAction;
    frxRepProtocol: TfrxReport;
    frxRepList: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    pmTV: TPopupMenu;
    N1: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    N2: TMenuItem;
    sdPopUp: TSaveDialog;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aXLS: TAction;
    Animator1: TJvGIFAnimator;
    cxLabel6: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel4: TcxLabel;
    oqThread: TOracleQuery;
    dxMemData1: TdxMemData;
    dxMemData1FK_ID: TIntegerField;
    dxMemData1KABNAME: TStringField;
    dxMemData1FD_NAZ: TStringField;
    dxMemData1FD_RUN: TStringField;
    dxMemData1FIOPAC: TStringField;
    dxMemData1ISSLNAME: TStringField;
    dxMemData1STATE: TStringField;
    dxMemData1FK_NAZSOSID: TIntegerField;
    dxMemData1FD_RUN_TIME: TStringField;
    acEnable: TAction;
    TVSOTR: TcxGridTableView;
    VSOTRKABNAME: TcxGridColumn;
    VSOTRFD_NAZ: TcxGridColumn;
    VSOTRFD_RUN: TcxGridColumn;
    VSOTRFIOPAC: TcxGridColumn;
    VSOTRISSLNAME: TcxGridColumn;
    VSOTRTIME: TcxGridColumn;
    VSOTRFK_ID: TcxGridColumn;
    VSOTRFK_NAZSOSID: TcxGridColumn;
    VSOTRFD_RUN_TIME: TcxGridColumn;
    dxMemData1TIME: TFloatField;
    VSOTRFD_ROJD: TcxGridColumn;
    VSOTRDOZA: TcxGridColumn;
    oqThreadLab: TOracleQuery;
    VSOTRTIMEVYP: TcxGridColumn;
    dxMemData1timevyp: TStringField;
    VSOTROPLTYPE: TcxGridColumn;
    dxMemData1opltype: TStringField;
    procedure osAfterLogOn(Sender: TOracleSession);
    procedure aCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure aRefreshExecute(Sender: TObject);
    procedure aParamExecute(Sender: TObject);
    procedure aResultExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure frxRepProtocolGetValue(const VarName: string; var Value: Variant);
    procedure frxRepListGetValue(const VarName: string; var Value: Variant);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure oqThreadThreadFinished(Sender: TOracleQuery);
    procedure acEnableExecute(Sender: TObject);
    procedure oqThreadThreadRecord(Sender: TOracleQuery);
    procedure TVSOTRCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure oqThreadLabThreadFinished(Sender: TOracleQuery);
    procedure oqThreadLabThreadRecord(Sender: TOracleQuery);
    procedure oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer;
      const ErrorMessage: string);
    procedure oqThreadLabThreadError(Sender: TOracleQuery; ErrorCode: Integer;
      const ErrorMessage: string);
    procedure TVSOTRFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    MedotradeSign : string;
    sCompanyName, sOtdelName : String;
    GET_VIPNAZ : Integer;
    GET_LABVIP : Integer;
    sSotrFIO_4rep, sTextIssl_4rep, sNumIssl_4rep, sNumIB_4rep : String;
    sDateSys_4Rep : String;
    procedure CheckEnabledButtons;
    { Private declarations }
  public
    pIDSPEC : Integer; 
    pAPPSOTRID : Integer;
    pSOTRID : Integer;
    sVrachFIO : String;
    pSPEC : Integer;
    dSysDate : TDateTime;
    idSOTR : Integer;
    dDateBeg, dDateEnd : TDateTime;
    GET_XRAY_VRACH : Integer;
    GET_ZAV_SPEC : Integer;
    pOTDELID : Integer;
    procedure DoShowForm;
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  StartTime: TTime;
  bbr: Boolean;

implementation

uses fSetParam, fSetSotr;

{$R *.dfm}

{ TfrmMain }

procedure TfrmMain.acEnableExecute(Sender: TObject);
var i : Integer;
begin
  for i := 0 to TVSOTR.DataController.LockCount - 1 do
    TVSOTR.EndUpdate;
end;

procedure TfrmMain.aCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.aParamExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmSetParam, frmSetParam);
  if idSOTR <> 0 then
    begin
      frmSetParam.cxFIOSotr.Tag := idSOTR;
      frmSetParam.cxFIOSotr.Text := lbSotrFIO.Caption;
      frmSetParam.cxDateBeg.Date := dDateBeg;
      frmSetParam.cxDateEnd.Date := dDateEnd;
    end else
    begin
      frmSetParam.cxDateBeg.Date := dSysDate;
      frmSetParam.cxDateEnd.Date := dSysDate;
    end;
  frmSetParam.ShowModal;
  if frmSetParam.ModalResult = mrOK then
    begin
      bbr := False;
      aRefresh.Enabled := False;
      aParam.Enabled := False;
      aResult.Enabled := False;
      aPrint.Enabled := False;
      cxLabel6.Caption := '';
      cxLabel5.Caption := '';
      cxLabel4.Caption := 'Выполняется запрос к Базе Данных...';
      if TVSOTR.DataController.LockCount = 0 then
        TVSOTR.BeginUpdate;
      TVSOTR.DataController.RecordCount := 0;
      while TVSOTR.DataController.LockCount > 0 do
        TVSOTR.EndUpdate;
      cxGr.Refresh;
      dxMemData1.Close;
      dxMemData1.Open;
      idSOTR := frmSetParam.cxFIOSotr.Tag;
      dDateBeg := frmSetParam.cxDateBeg.Date;
      dDateEnd := StrToDateTime(FormatDateTime('dd.mm.yyyy', frmSetParam.cxDateEnd.Date)+' 23:59:59');
      lbSotrFIO.Caption := frmSetParam.cxFIOSotr.Text;
      lbDateBeg.Caption := frmSetParam.cxDateBeg.Text;
      lbDateEnd.Caption := frmSetParam.cxDateEnd.Text;
      paParam.Visible := True;
      paSubParam.Visible := True;
      cxSplitter1.Visible := True;
      if (pIDSPEC = GET_XRAY_VRACH) or (pIDSPEC = GET_ZAV_SPEC) then
        begin
          StartTime:= Now;
          cxLabel6.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
          cxLabel6.Refresh;
          oqThread.Scrollable := True;
          Animator1.Animate := True;
          oqThread.SetVariable('PFK_SOTRID', idSOTR);
          oqThread.SetVariable('PDATE1', dDateBeg);
          oqThread.SetVariable('PDATE2', dDateEnd);
          oqThread.Execute;
        end else
        begin
          StartTime:= Now;
          cxLabel6.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
          cxLabel6.Refresh;
          oqThreadLab.Scrollable := True;
          Animator1.Animate := True;
          oqThreadLab.SetVariable('PFK_SOTRID', idSOTR);
          oqThreadLab.SetVariable('PDATE1', dDateBeg);
          oqThreadLab.SetVariable('PDATE2', dDateEnd);
          try
          oqThreadLab.Execute;
          except
            on e:Exception do
              begin
                showmessage(e.Message);
              end;
          end;
        end;
    end;
  frmSetParam.Free;
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
    sDateSys_4Rep := ods.FieldByName('DATESYS').AsString;
  finally
    ods.Free;
  end;
  frxRepList.ShowReport;
end;

procedure TfrmMain.aRefreshExecute(Sender: TObject);
begin
  if idSOTR <> 0 then
    begin
      aRefresh.Enabled := False;
      aParam.Enabled := False;
      aResult.Enabled := False;
      aPrint.Enabled := False;
      if pIDSPEC = GET_XRAY_VRACH then
        begin
          cxLabel4.Caption := 'Выполняется запрос к Базе Данных...';
          if TVSOTR.DataController.LockCount = 0 then
            TVSOTR.BeginUpdate;
          TVSOTR.DataController.RecordCount := 0;
          while TVSOTR.DataController.LockCount > 0 do
            TVSOTR.EndUpdate;
          cxGr.Refresh;
          dxMemData1.Close;
          dxMemData1.Open;
          StartTime:= Now;
          oqThread.Scrollable := True;
          Animator1.Animate := True;
          oqThread.SetVariable('PFK_SOTRID', idSOTR);
          oqThread.SetVariable('PDATE1', dDateBeg);
          oqThread.SetVariable('PDATE2', dDateEnd);
          oqThread.Execute;
//          CheckEnabledButtons;
        end else
        begin
          cxLabel4.Caption := 'Выполняется запрос к Базе Данных...';
          if TVSOTR.DataController.LockCount = 0 then
            TVSOTR.BeginUpdate;
          TVSOTR.DataController.RecordCount := 0;
          while TVSOTR.DataController.LockCount > 0 do
            TVSOTR.EndUpdate;
          cxGr.Refresh;
          dxMemData1.Close;
          dxMemData1.Open;
          StartTime:= Now;
          oqThreadLab.Scrollable := True;
          Animator1.Animate := True;
          oqThreadLab.SetVariable('PFK_SOTRID', idSOTR);
          oqThreadLab.SetVariable('PDATE1', dDateBeg);
          oqThreadLab.SetVariable('PDATE2', dDateEnd);
          oqThreadLab.Execute;
//          CheckEnabledButtons;
        end;
    end;
end;

procedure TfrmMain.aResultExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  if TVSOTR.DataController.Values[TVSOTR.DataController.FocusedRecordIndex, VSOTRFK_NAZSOSID.Index] = GET_VIPNAZ then
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT FK_ID, '+
                        '        DO_VRACHFIO(FK_ISPOLID) AS VRACHFIO, '+
                        '        (SELECT FB_TEXT FROM TRICHVIEWDATA WHERE FK_PACID = TNAZIS.FK_ID) AS TEXTISSL, '+
                        '        ASU.GET_IB(FK_PACID) AS NUMIB, '+
                        '        (SELECT MAX(FC_CHAR) FROM TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''NUMBER_ISSL'')) AS NUMBER_ISSL '+
                        '   FROM TNAZIS '+
                        '  WHERE FK_ID = :PFK_ID ';
        ods.DeclareAndSet('PFK_ID', otInteger, TVSOTR.DataController.Values[TVSOTR.DataController.FocusedRecordIndex, VSOTRFK_ID.Index]); //dsList.DataSet.FieldByName('FK_ID').AsInteger);
        ods.Open;
        sSotrFIO_4rep := ods.FieldByName('VRACHFIO').AsString;
        sTextIssl_4rep := ods.FieldByName('TEXTISSL').AsString;
        sNumIssl_4rep := ods.FieldByName('NUMBER_ISSL').AsString;
        sNumIB_4rep := ods.FieldByName('NUMIB').AsString;
      finally
        ods.Free;
      end;
        frxRepProtocol.ShowReport;
    end;
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
  aResult.Enabled := (dsList.DataSet.RecordCount <> 0)
                     and (TVSOTR.DataController.Values[TVSOTR.DataController.FocusedRecordIndex, VSOTRFK_NAZSOSID.Index] <> GET_LABVIP);
  aPrint.Enabled := dsList.DataSet.RecordCount <> 0;
end;

procedure TfrmMain.DoShowForm;
var ods : TOracleDataSet;
    Ver : TJclFileVersionInfo;
begin
  pAPPSOTRID := StrToInt(paramstr(1));
  pIDSPEC := 0;
  ods := TOracleDataSet.Create(nil);
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FK_SOTRID, DO_VRACHFIO(FK_SOTRID) AS VRACHFIO, TRUNC(SYSDATE) AS DATESYS, '+#13+
                    '        ASU.PKG_SMINI.READSTRING (''CONFIG'', ''S_FULLNAME'', '''') AS COMPANYNAME, '+#13+
                    '        GET_VIPNAZ, GET_NAZCANCEL, GET_LABVIP, GET_XRAY_VRACH, GET_ZAVOTDEL, '+#13+
                    '        (SELECT FC_NAME '+#13+
                    '           FROM TOTDEL '+#13+
                    '          WHERE FK_ID = (SELECT FK_OTDID FROM ASU.TSOTR WHERE FK_ID = TAPPSOTR.FK_SOTRID)) AS OTDELNAME '+#13+
                    '   FROM LOGIN.TAPPSOTR WHERE FL_DEL <> 1 AND FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pAPPSOTRID);
    ods.Open;
    pSOTRID := ods.FieldByName('FK_SOTRID').AsInteger;
    sVrachFIO := ods.FieldByName('VRACHFIO').AsString;
    dSysDate := ods.FieldByName('DATESYS').AsDateTime;
    sCompanyName := ods.FieldByName('COMPANYNAME').AsString;
    frmMain.Caption := 'Статистика по сотруднику('+Ver.FileVersion+'). Пользователь: '+sVrachFIO;
    GET_VIPNAZ := ods.FieldByName('GET_VIPNAZ').AsInteger;
    GET_LABVIP := ods.FieldByName('GET_LABVIP').AsInteger;
    GET_XRAY_VRACH := ods.FieldByName('GET_XRAY_VRACH').AsInteger;
    GET_ZAV_SPEC := ods.FieldByName('GET_ZAVOTDEL').AsInteger;
    sOtdelName := ods.FieldByName('OTDELNAME').AsString;
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT FK_OTDELID, FK_SPRAVID FROM TSOTR WHERE FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pSOTRID);
    ods.Open;
    pOTDELID := ods.FieldByName('FK_OTDELID').AsInteger;
  finally
    ods.Free;
    Ver.Free;
  end;
  aResult.Enabled := False;
  aPrint.Enabled := False;
  MedotradeSign := ReadMedotradeSign;
  TVSOTR.StoreToRegistry('\SoftWare\SoftMaster\Xray_sotr\fMain\TVLIST'+'Vrach'+ '_' + IntToStr(pSOTRID)+'Default', TRUE, [], 'TVLIST');
  TVSOTR.RestoreFromRegistry('\SoftWare\SoftMaster\Xray_sotr\fMain\TVLIST'+'Vrach'+ '_' + IntToStr(pSOTRID), FALSE, FALSE, [], 'TVLIST');
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
  TVSOTR.StoreToRegistry('\SoftWare\SoftMaster\Xray_sotr\fMain\TVLIST'+'Vrach'+ '_' + IntToStr(pSOTRID), TRUE, [], 'TVLIST');
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  GetSession(os, 'ASU');
end;

procedure TfrmMain.frxRepListGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName;
  if VarName = 'OTDELNAME' then Value := sOtdelName;
  if VarName = 'KOLVO' then Value := dsList.DataSet.RecordCount;
  if VarName = 'DATESYS' then Value := sDateSys_4Rep;
  if VarName = 'SOTR' then Value := sVrachFIO;
  if VarName = 'SOTRNAME' then Value := lbSotrFIO.Caption;
  if VarName = 'DATE1' then Value := dDateBeg;
  if VarName = 'DATE2' then Value := DateTimeToStr(Trunc(dDateEnd));
  if VarName = 'SUMTIME' then Value := TVSOTR.DataController.Summary.FooterSummaryValues[1];
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;   
end;

procedure TfrmMain.frxRepProtocolGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName;
  if VarName = 'OTDELNAME' then Value := sOtdelName;
  if VarName = 'PACFIO' then Value := TVSOTR.DataController.Values[TVSOTR.DataController.FocusedRecordIndex, VSOTRFIOPAC.Index]; //dsList.DataSet.FieldByName('FIOPAC').AsString;
  if VarName = 'DATE_ROJD' then Value := TVSOTR.DataController.Values[TVSOTR.DataController.FocusedRecordIndex, VSOTRFD_ROJD.Index]; //dsList.DataSet.FieldByName('FD_ROJD').AsDateTime;
  if VarName = 'NUMIB' then Value := sNumIB_4rep;
  if VarName = 'NAMEISSL' then Value := TVSOTR.DataController.Values[TVSOTR.DataController.FocusedRecordIndex, VSOTRISSLNAME.Index]; //dsList.DataSet.FieldByName('ISSLNAME').AsString;
  if VarName = 'DOZA' then Value := TVSOTR.DataController.Values[TVSOTR.DataController.FocusedRecordIndex, VSOTRDOZA.Index]; //dsList.DataSet.FieldByName('DOZA').AsString;
  if VarName = 'DATEISSL' then Value := TVSOTR.DataController.Values[TVSOTR.DataController.FocusedRecordIndex, VSOTRFD_RUN_TIME.Index]; //dsList.DataSet.FieldByName('FD_RUN').AsString;
  if VarName = 'TEXTISSL' then Value := sTextIssl_4rep;
  if VarName = 'NUMISSL' then Value := sNumIssl_4rep;
  if VarName = 'SOTR' then Value := sSotrFIO_4rep;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
end;

procedure TfrmMain.N2Click(Sender: TObject);
begin
  TVSOTR.RestoreFromRegistry('\SoftWare\SoftMaster\Xray_sotr\fMain\TVLIST'+'Vrach'+ '_' + IntToStr(pSOTRID)+'Default', FALSE, FALSE, [], 'TVLIST');
end;

procedure TfrmMain.oqThreadLabThreadError(Sender: TOracleQuery;
  ErrorCode: Integer; const ErrorMessage: string);
begin
  MessageDlg('Во время выполнения запроса произошла ошибка! Обратитесь к администратору системы!'+
             #13#10+'Код ошибки: '+IntToStr(ErrorCode)+
             #13#10+'Текст ошибки: '+ErrorMessage,
             mtError, [mbOK], 0);
  bbr := True;
end;

procedure TfrmMain.oqThreadLabThreadFinished(Sender: TOracleQuery);
begin
  acEnable.Execute;
  Animator1.Animate := False;
  if bbr then
    cxLabel4.Caption := 'При выполнении запроса произошла ошибка!'
  else
    cxLabel4.Caption := 'Запрос к Базе Данных выполнился успешно!';
  aResult.Enabled := True;
  aPrint.Enabled := True;
  aRefresh.Enabled := True;
  aParam.Enabled := True;
  CheckEnabledButtons;
end;

procedure TfrmMain.oqThreadLabThreadRecord(Sender: TOracleQuery);
begin
  TVSOTR.BeginUpdate;
  TVSOTR.DataController.RecordCount := TVSOTR.DataController.RecordCount + 1;
  with TVSOTR.DataController do
  begin
    try
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRFK_ID.Index] := Sender.Field('FK_ID');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRKABNAME.Index] := Sender.Field('KABNAME');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRFD_NAZ.Index] := Sender.Field('FD_NAZ');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRFD_RUN.Index] := Sender.Field('FD_RUN');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRFIOPAC.Index] := Sender.Field('FIOPAC');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRISSLNAME.Index] := Sender.Field('ISSLNAME');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRFK_NAZSOSID.Index] := Sender.Field('FK_NAZSOSID');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRFD_RUN_TIME.Index] := Sender.Field('FD_RUN_TIME');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRTIME.Index] := Sender.Field('TIMEISSL');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRDOZA.Index] := Sender.Field('DOZA');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRFD_ROJD.Index] := Sender.Field('FD_ROJD');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRTIMEVYP.Index] := Sender.Field('timevyp');
      dxMemData1.Insert;
      dxMemData1.FieldByName('KABNAME').AsString := Sender.Field('KABNAME');
      dxMemData1.FieldByName('FD_NAZ').AsString := Sender.Field('FD_NAZ');
      dxMemData1.FieldByName('FD_RUN').AsString := Sender.Field('FD_RUN_TIME');
      dxMemData1.FieldByName('FIOPAC').AsString := Sender.Field('FIOPAC');
      dxMemData1.FieldByName('ISSLNAME').AsString := Sender.Field('ISSLNAME');
      dxMemData1.FieldByName('FD_RUN_TIME').AsString := Sender.Field('FD_RUN_TIME');
      dxMemData1.FieldByName('TIME').AsInteger := Sender.Field('TIMEISSL');
      dxMemData1.FieldByName('TIMEVYP').AsString := Sender.Field('timevyp');
      dxMemData1.Post;
      dxMemData1.Next;
    finally
    end;
  end;
  TVSOTR.EndUpdate;
  cxLabel6.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
  cxLabel6.Refresh;
  cxLabel5.Caption := 'Выбрано ' + IntToStr(TVSOTR.DataController.RecordCount) + ' записей.';
  cxLabel5.Refresh;
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
  acEnable.Execute;
  Animator1.Animate := False;
  if bbr then
    cxLabel4.Caption := 'При выполнении запроса произошла ошибка!'
  else
    cxLabel4.Caption := 'Запрос к Базе Данных выполнился успешно!';

  aResult.Enabled := True;
  aPrint.Enabled := True;
  aRefresh.Enabled := True;
  aParam.Enabled := True;
  CheckEnabledButtons;
end;

procedure TfrmMain.oqThreadThreadRecord(Sender: TOracleQuery);
begin
  TVSOTR.BeginUpdate;
  TVSOTR.DataController.RecordCount := TVSOTR.DataController.RecordCount + 1;
  with TVSOTR.DataController do
  begin
    try
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRFK_ID.Index] := Sender.Field('FK_ID');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRKABNAME.Index] := Sender.Field('KABNAME');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRFD_NAZ.Index] := Sender.Field('FD_NAZ');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRFD_RUN.Index] := Sender.Field('FD_RUN');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRFIOPAC.Index] := Sender.Field('FIOPAC');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRISSLNAME.Index] := Sender.Field('ISSLNAME');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRFK_NAZSOSID.Index] := Sender.Field('FK_NAZSOSID');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRFD_RUN_TIME.Index] := Sender.Field('FD_RUN_TIME');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRTIME.Index] := Sender.Field('TIMEISSL');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRDOZA.Index] := Sender.Field('DOZA');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRFD_ROJD.Index] := Sender.Field('FD_ROJD');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRTIMEVYP.Index] := Sender.Field('timevyp');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTROPLTYPE.Index] := Sender.Field('opltype');
      dxMemData1.Insert;
      dxMemData1.FieldByName('KABNAME').AsString := Sender.Field('KABNAME');
      dxMemData1.FieldByName('FD_NAZ').AsString := Sender.Field('FD_NAZ');
      dxMemData1.FieldByName('FD_RUN').AsString := Sender.Field('FD_RUN_TIME');
      dxMemData1.FieldByName('FIOPAC').AsString := Sender.Field('FIOPAC');
      dxMemData1.FieldByName('ISSLNAME').AsString := Sender.Field('ISSLNAME');
      dxMemData1.FieldByName('FD_RUN_TIME').AsString := Sender.Field('FD_RUN_TIME');
      dxMemData1.FieldByName('TIME').AsInteger := Sender.Field('TIMEISSL');
      dxMemData1.FieldByName('TIMEVYP').AsString := Sender.Field('timevyp');
      dxMemData1.FieldByName('OPLTYPE').AsString := Sender.Field('opltype');
      dxMemData1.Post;
      dxMemData1.Next;
    finally
    end;
  end;
  TVSOTR.EndUpdate;
  cxLabel6.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
  cxLabel6.Refresh;
  cxLabel5.Caption := 'Выбрано ' + IntToStr(TVSOTR.DataController.RecordCount) + ' записей.';
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

procedure TfrmMain.TVSOTRCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if dsList.DataSet.RecordCount <> 0 then
    begin
      aResultExecute(nil);
    end;
end;

procedure TfrmMain.TVSOTRFocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  aResult.Enabled := TVSOTR.DataController.Values[TVSOTR.DataController.FocusedRecordIndex, VSOTRFK_NAZSOSID.Index] <> GET_LABVIP;
end;

end.
