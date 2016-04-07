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
  dxSkinOffice2007Green;

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
    lbCapSotr: TcxLabel;
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
    bbPrint: TdxBarButton;
    aPrint: TAction;
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
    dxMemData1FD_NAZ: TStringField;
    dxMemData1FD_RUN: TStringField;
    dxMemData1FIOPAC: TStringField;
    dxMemData1ISSLNAME: TStringField;
    dxMemData1FD_RUN_TIME: TStringField;
    acEnable: TAction;
    TVSOTR: TcxGridTableView;
    VSOTRFD_NAZ: TcxGridColumn;
    VSOTRFD_RUN: TcxGridColumn;
    VSOTRFIOPAC: TcxGridColumn;
    VSOTRISSLNAME: TcxGridColumn;
    VSOTRTIME: TcxGridColumn;
    VSOTRFK_ID: TcxGridColumn;
    VSOTRFD_RUN_TIME: TcxGridColumn;
    dxMemData1TIME: TFloatField;
    aStop: TAction;
    VSOTRED: TcxGridColumn;
    dxMemData1ed: TFloatField;
    lbCapUsl: TcxLabel;
    lbUsl: TcxLabel;
    procedure osAfterLogOn(Sender: TOracleSession);
    procedure aCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure aRefreshExecute(Sender: TObject);
    procedure aParamExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure frxRepListGetValue(const VarName: string; var Value: Variant);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure oqThreadThreadFinished(Sender: TOracleQuery);
    procedure acEnableExecute(Sender: TObject);
    procedure oqThreadThreadRecord(Sender: TOracleQuery);
    procedure oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer;
      const ErrorMessage: string);
    procedure FormCreate(Sender: TObject);
  private
    MedotradeSign, FileVersion, sCompanyName, sOtdelName : String;
    sDateSys_4Rep : String;
    sType : string;
    procedure CheckEnabledButtons;
    { Private declarations }
  public
    pAPPSOTRID : Integer;
    pSOTRID : Integer;
    sVrachFIO : String;
    dSysDate : TDateTime;
    idSOTR : Integer;
    dDateBeg, dDateEnd : TDateTime;
    procedure DoShowForm;
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  StartTime: TTime;
  bbr: Boolean;

const sqlText = ' select tnazlech.fk_id, '+#13+
                '        tnazlech.fk_nazsosid, '+#13+
                '        tnazlech.fk_smid, '+#13+
                '        tnazlech.fd_naz, '+#13+
                '        tnazlech.fd_run, to_char(tnazlech.fd_run, ''dd.mm.yyyy hh24:mi'') as fd_run_time, '+#13+
                '        tnazlech.fc_name, '+#13+
                '        asu.pkg_regist_pacfunc.get_pac_fio(fk_pacid) as fiopac, '+#13+
                '        (select to_number(fc_time) from asu.tsmid where fk_id = tnazlech.fk_smid) as fn_time, '+#13+
                '        (select fn_norm1 from asu.tsmid where fk_id = tnazlech.fk_smid) as fn_norm1 '+#13+
                '   from asu.tnazlech '+#13+
                '  where tnazlech.fk_nazsosid = asu.get_vipnaz '+#13+
                '    and tnazlech.fd_run >= :pdate1 '+#13+
                '    and tnazlech.fd_run <= :pdate2 '+#13+
                '    and tnazlech.fk_smid in (select fk_id '+#13+
                '                              from asu.tsmid '+#13+
                '                             where fl_showanal = 1 '+#13+
                '                             start with fc_synonim = ''PROC_FIZTER'' '+#13+
                '                             connect by prior fk_id = fk_owner) ';

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
    end;
  if lbUsl.Tag <> 0 then
    begin
      frmSetParam.teUsl.Tag := idSOTR;
      frmSetParam.teUsl.Text := lbUsl.Caption;
    end;
  if dDateBeg <> 0 then
    begin
      frmSetParam.cxDateBeg.Date := dDateBeg;
      frmSetParam.cxDateEnd.Date := dDateEnd;
    end else
    begin
      frmSetParam.cxDateBeg.Date := dSysDate;
      frmSetParam.cxDateEnd.Date := dSysDate;
    end;
  if sType = '' then
    frmSetParam.cbType.EditValue := 'по врачу'
  else
    frmSetParam.cbType.EditValue := sType;
  frmSetParam.ShowModal;
  if frmSetParam.ModalResult = mrOK then
    begin
      bbr := False;
      aRefresh.Enabled := False;
      aParam.Enabled := False;
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
      sType := frmSetParam.cbType.EditValue;
      lbUsl.Tag := frmSetParam.teUsl.Tag;
      lbCapSotr.Visible := idSOTR <> 0;
      lbCapUsl.Visible := frmSetParam.teUsl.Tag <> 0;
      dDateBeg := frmSetParam.cxDateBeg.Date;
      dDateEnd := StrToDateTime(FormatDateTime('dd.mm.yyyy', frmSetParam.cxDateEnd.Date)+' 23:59:59');
      lbSotrFIO.Caption := frmSetParam.cxFIOSotr.Text;
      lbUsl.Caption := frmSetParam.teUsl.Text;
      lbDateBeg.Caption := frmSetParam.cxDateBeg.Text;
      lbDateEnd.Caption := frmSetParam.cxDateEnd.Text;
      paParam.Visible := True;
      paSubParam.Visible := True;
      cxSplitter1.Visible := True;
      StartTime:= Now;
      cxLabel6.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
      cxLabel6.Refresh;
      oqThread.Scrollable := True;
      Animator1.Animate := True;
      oqThread.DeleteVariables;
      oqThread.SQL.Text := sqlText;
      if idSOTR <> 0 then
        begin
          if sType = 'по врачу' then
            begin
              oqThread.SQL.Add(' and tnazlech.fk_ispolid = :pfk_sotrid ');
              oqThread.DeclareAndSet('pfk_sotrid', otInteger, idSOTR);
            end;
          if sType = 'по медсестре' then
            begin
              oqThread.SQL.Add(' and (select fn_num from asu.tib where fk_pacid = tnazlech.fk_id and fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''DIAGNOSTIC_MS'')) = :pfk_sotrid ');
              oqThread.DeclareAndSet('pfk_sotrid', otInteger, idSOTR);
            end;
        end;
      if lbUsl.Tag <> 0 then
        begin
          oqThread.SQL.Add(' and tnazlech.fk_smid = :pfk_smid ');
          oqThread.DeclareAndSet('pfk_smid', otInteger, lbUsl.Tag);
        end; 
      oqThread.DeclareAndSet('PDATE1', otDate, dDateBeg);
      oqThread.DeclareAndSet('PDATE2', otDate, dDateEnd);
      oqThread.Execute;
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
  aRefresh.Enabled := False;
  aParam.Enabled := False;
  aPrint.Enabled := False;
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
  oqThread.DeleteVariables;
  oqThread.SQL.Text := sqlText;
  if idSOTR <> 0 then
    begin
      oqThread.SQL.Add(' and tnazlech.fk_ispolid = :pfk_sotrid ');
      oqThread.DeclareAndSet('pfk_sotrid', otInteger, idSOTR);
    end;
  if lbUsl.Tag <> 0 then
    begin
      oqThread.SQL.Add(' and tnazlech.fk_smid = :pfk_smid ');
      oqThread.DeclareAndSet('pfk_smid', otInteger, lbUsl.Tag);
    end;
  oqThread.DeclareAndSet('PDATE1', otDate, dDateBeg);
  oqThread.DeclareAndSet('PDATE2', otDate, dDateEnd);
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
  aPrint.Enabled := dsList.DataSet.RecordCount <> 0;
end;

procedure TfrmMain.DoShowForm;
var ods : TOracleDataSet;
begin
  pAPPSOTRID := StrToInt(paramstr(1));
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select fk_sotrid, do_vrachfio(fk_sotrid) as vrachfio, trunc(sysdate) as datesys, '+#13+
                    '        asu.pkg_smini.readstring (''CONFIG'', ''S_FULLNAME'', '''') as companyname, '+#13+
                    '        (select fc_name '+#13+
                    '           from totdel '+#13+
                    '          where fk_id = (select fk_otdid from asu.tsotr where fk_id = tappsotr.fk_sotrid)) as otdelname '+#13+
                    '   from login.tappsotr where fl_del <> 1 and fk_id = :pfk_id ';
    ods.DeclareAndSet('PFK_ID', otInteger, pAPPSOTRID);
    ods.Open;
    pSOTRID := ods.FieldByName('FK_SOTRID').AsInteger;
    sVrachFIO := ods.FieldByName('VRACHFIO').AsString;
    dSysDate := ods.FieldByName('DATESYS').AsDateTime;
    sCompanyName := ods.FieldByName('COMPANYNAME').AsString;
    frmMain.Caption := 'Статистика по физио('+FileVersion+'). Пользователь: '+sVrachFIO;
    sOtdelName := ods.FieldByName('OTDELNAME').AsString;
    aPrint.Enabled := False;
    MedotradeSign := ReadMedotradeSign;
    TVSOTR.StoreToRegistry('\SoftWare\SoftMaster\Fizio_sotr\fMain\TVLISTSotr_' + IntToStr(pSOTRID)+'Default', TRUE, [], 'TVLIST');
    TVSOTR.RestoreFromRegistry('\SoftWare\SoftMaster\Fizio_sotr\fMain\TVLISTSotr_' + IntToStr(pSOTRID), FALSE, FALSE, [], 'TVLIST');
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Вы хотите выйти из приложения ?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
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
  TVSOTR.StoreToRegistry('\SoftWare\SoftMaster\Fizio_sotr\fMain\TVLISTSotr_' + IntToStr(pSOTRID), TRUE, [], 'TVLIST');
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
  if VarName = 'USLNAME' then Value := lbUsl.Caption;
  if VarName = 'DATE1' then Value := dDateBeg;
  if VarName = 'DATE2' then Value := DateTimeToStr(Trunc(dDateEnd));
  if VarName = 'SUMTIME' then Value := TVSOTR.DataController.Summary.FooterSummaryValues[1];
  if VarName = 'SUMED' then Value := TVSOTR.DataController.Summary.FooterSummaryValues[2];
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
end;

procedure TfrmMain.N2Click(Sender: TObject);
begin
  TVSOTR.RestoreFromRegistry('\SoftWare\SoftMaster\Fizio_sotr\fMain\TVLISTSotr_' + IntToStr(pSOTRID)+'Default', FALSE, FALSE, [], 'TVLIST');
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
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRFK_ID.Index] := Sender.Field('fk_id');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRFD_NAZ.Index] := Sender.Field('fd_naz');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRFD_RUN.Index] := Sender.Field('fd_run');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRFIOPAC.Index] := Sender.Field('fiopac');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRISSLNAME.Index] := Sender.Field('fc_name');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRFD_RUN_TIME.Index] := Sender.Field('fd_run_time');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRTIME.Index] := Sender.Field('fn_time');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRED.Index] := Sender.Field('fn_norm1');
      dxMemData1.Insert;
      dxMemData1.FieldByName('fd_naz').AsString := Sender.Field('fd_naz');
      dxMemData1.FieldByName('fd_run').AsString := Sender.Field('fd_run_time');
      dxMemData1.FieldByName('fiopac').AsString := Sender.Field('fiopac');
      dxMemData1.FieldByName('isslname').AsString := Sender.Field('fc_name');
      dxMemData1.FieldByName('fd_run_time').AsString := Sender.Field('fd_run_time');
      dxMemData1.FieldByName('time').AsInteger := Sender.Field('fn_time');
      dxMemData1.FieldByName('ed').AsFloat := Sender.Field('fn_norm1');
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
  try
    Sender.DBMS_Application_Info.Set_Module(ExtractFileName(ParamStr(0)) + ' (' + Ver.FileVersion + ')', Self.Name + ' "' + Self.Caption + '"');
    FileVersion := Ver.FileVersion;
  finally
    Ver.Free;
  end;
end;

end.
