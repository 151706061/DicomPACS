unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvExControls, JvAnimatedImage, JvGIFCtrl, cxControls, cxContainer,
  cxEdit, cxLabel, ExtCtrls, DB, dxmdaset, Oracle, OracleData, ActnList, ImgList, dxBar,
  cxClasses, Menus, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridCustomView, cxGrid, cxSplitter, SMMainAPI, cxGridExportLink, JclFileUtils, uGlobalConst,
  cxImageComboBox, frxClass, frxDBSet;

type
  TfrmMain = class(TForm)
    dxBarDockControl1: TdxBarDockControl;
    pmTV: TPopupMenu;
    N1: TMenuItem;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
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
    dxMemData1: TdxMemData;
    dxMemData1FIOPAC: TStringField;
    paParam: TPanel;
    Splitter1: TSplitter;
    paMainParam: TPanel;
    cxLabel2: TcxLabel;
    lbDateBeg: TcxLabel;
    cxLabel3: TcxLabel;
    lbDateEnd: TcxLabel;
    paSubParam: TPanel;
    Animator1: TJvGIFAnimator;
    cxLabel6: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel4: TcxLabel;
    cxSplitter1: TcxSplitter;
    cxGr: TcxGrid;
    tvPlan: TcxGridTableView;
    tvPLAN_FIOPAC: TcxGridColumn;
    tvPLAN_ROJD: TcxGridColumn;
    cxGrLevel1: TcxGridLevel;
    tvPlan_TUB: TcxGridColumn;
    tvPlan_SEX: TcxGridColumn;
    tvPlan_LAST: TcxGridColumn;
    tvPlan_WORK: TcxGridColumn;
    tvPlan_PLAN: TcxGridColumn;
    dxMemData1TUB: TIntegerField;
    dxMemData1SEX: TStringField;
    dxMemData1ROJD: TDateField;
    dxMemData1PLAN: TDateField;
    dxMemData1WORK: TStringField;
    dxMemData1LAST: TDateField;
    ilCntTub: TImageList;
    frxDBPrint: TfrxDBDataset;
    frxRepPrint: TfrxReport;
    acEnable: TAction;
    tvPlan_Med: TcxGridColumn;
    dxMemData1MEDRAB: TStringField;
    lbWorkCaption: TcxLabel;
    lbWork: TcxLabel;
    lbUchCaption: TcxLabel;
    lbUch: TcxLabel;
    tvPlan_UCH: TcxGridColumn;
    dxMemData1UCH: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure aCloseExecute(Sender: TObject);
    procedure aParamExecute(Sender: TObject);
    procedure oqThreadThreadRecord(Sender: TOracleQuery);
    procedure oqThreadThreadFinished(Sender: TOracleQuery);
    procedure aRefreshExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure frxRepPrintGetValue(const VarName: string; var Value: Variant);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure acEnableExecute(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer;
      const ErrorMessage: string);
    procedure osAfterLogOn(Sender: TOracleSession);
  private
    pAPPSOTRID : Integer;
    MedotradeSign, sVrachFIO, sCompanyName, sOtdelName, sDateSys_4Rep : string;
    dSysDate, dDateBeg, dDateEnd : TDateTime;
    procedure CheckEnabledButtons;
    { Private declarations }
  public
    pSOTRID : Integer;
    procedure DoShowForm;
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  StartTime: TTime;
  bbr : Boolean;

const oqText = ' select (select count(*) from asu.tnazis '+#13+
               '          where fk_pacid = t1.fk_id '+#13+
               '            and fk_smid = asu.get_xray_tubdispancer '+#13+
               '            and sysdate >= fd_naz '+#13+
               '            and (sysdate < to_date(fd_run)+1 or fd_run is null)) as tub, '+#13+
               '        fc_fam||'' ''||fc_im||'' ''||fc_otch as fiopac, '+#13+
               '        decode(fp_sex, 1, ''М'', 0, ''Ж'') as fp_sex, '+#13+
               '        fd_rojd, '+#13+
               '        to_date(asu.get_last_fluoro_date(t1.fk_id, 1), ''dd.mm.yyyy'') as last_fluoro, '+#13+
               '        t3.fc_name as work, '+#13+
               '        t4.fd_date as plan_fluoro, '+#13+
               '        decode((select 1 from asu.tpeplid_med where fk_peplid = t1.fk_id), null, '''', 1, ''ДА'') as MEDRAB, '+#13+
               '        asu.get_area_for_xray(t1.fk_id, :pfk_typeid) as uch '+#13+
               '   from asu.tpeoples t1, asu.tpeoples_company t2, asu.tperiod_company t3, asu.tplanfluoro t4 '+#13+
               '  where t1.fk_id = t2.fk_peopleid '+#13+
               '    and t2.fk_companyid = t3.fk_companyid '+#13+
               '    and t2.fk_periodid = t3.fk_owner '+#13+
               '    and t3.fl_del = 0 '+#13+
               '    and t1.fk_id = t4.fk_peplid '+#13+
               '    and t4.fd_date >= :pdate1 '+#13+
               '    and t4.fd_date <= :pdate2 ';

implementation
uses uPeriod_Param;
{$R *.dfm}

procedure TfrmMain.acEnableExecute(Sender: TObject);
var i : Integer;
begin
  for i := 0 to tvPlan.DataController.LockCount - 1 do
    tvPlan.EndUpdate;
end;

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
              bbr := False;
              dDateBeg := Period.First;
              dDateEnd := Period.Last;
              lbDateBeg.Caption := DateTimeToStr(Period.First);
              lbDateEnd.Caption := DateTimeToStr(trunc(Period.Last));

              aRefresh.Enabled := False;
              aParam.Enabled := False;
              aPrint.Enabled := False;

              cxLabel6.Caption := '';
              cxLabel5.Caption := '';
              cxLabel4.Caption := 'Выполняется запрос к Базе Данных...';

              if tvPlan.DataController.LockCount = 0 then
                tvPlan.BeginUpdate;
              tvPlan.DataController.RecordCount := 0;
              while tvPlan.DataController.LockCount > 0 do
                tvPlan.EndUpdate;
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
              oqThread.DeleteVariables;
              oqThread.SQL.Text := oqText;
              if beWork.Tag <> 0 then
                begin
                  lbWork.Tag := beWork.Tag;
                  oqThread.SQL.Add(' and t2.fk_companyid in (select fk_companyid from asu.tperiod_company where fl_del = 0 start with fk_id = :pfk_companyid connect by prior fk_id = fk_owner) ');
                  oqThread.DeclareAndSet('pfk_companyid', otInteger, beWork.Tag);
                end else
                begin
                  lbWork.Tag := 0;
                end;
              if beUch.Tag <> 0 then
                begin
                  if isAll = True then
                    begin
                      lbUchCaption.Tag := beUch.Tag;
                      oqThread.SQL.Add(' and exists (select 1 from asu.tdistrict_pacient tdp, asu.tdistrict_name tdn where tdp.fk_peplid = t1.fk_id and tdp.fk_arealid = tdn.fk_id and tdn.fk_typeid = :pfk_typeid1) ');
                      oqThread.DeclareAndSet('pfk_typeid1', otInteger, lbUchCaption.Tag);
                    end else
                    begin
                      lbUch.Tag := beUch.Tag;
                      lbUchCaption.Tag := 0;
                      oqThread.SQL.Add(' and exists (select 1 from asu.tdistrict_pacient where fk_peplid = t1.fk_id and fk_arealid = :pfk_arealid) ');
                      oqThread.DeclareAndSet('pfk_arealid', otInteger, lbUch.Tag);
                    end;
                end else
                begin
                  lbUch.Tag := 0;
                  lbUchCaption.Tag := 0;
                end;
              oqThread.SQL.Add(' order by fiopac ');
              lbWorkCaption.Visible := beWork.Tag <> 0;
              lbWork.Visible := beWork.Tag <> 0;
              lbWork.Caption := beWork.Text;
              lbUchCaption.Visible := beUch.Tag <> 0;
              lbUch.Visible := beUch.Tag <> 0;
              lbUch.Caption := beUch.Text;
              oqThread.DeclareAndSet('pdate1', otDate, dDateBeg);
              oqThread.DeclareAndSet('pdate2', otDate, dDateEnd);
              oqThread.DeclareAndSet('pfk_typeid', otInteger, lbUchCaption.Tag);
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
    sDateSys_4Rep := ods.FieldByName('DATESYS').AsString;
  finally
    ods.Free;
  end;
  frxRepPrint.FindObject('Memo24').Visible := lbWork.Tag <> 0;
  frxRepPrint.FindObject('Memo25').Visible := lbWork.Tag <> 0;
  frxRepPrint.FindObject('Memo26').Visible := lbUch.Tag <> 0;
  frxRepPrint.FindObject('Memo27').Visible := lbUch.Tag <> 0;
  frxRepPrint.ShowReport;
end;

procedure TfrmMain.aRefreshExecute(Sender: TObject);
begin
  aRefresh.Enabled := False;
  aParam.Enabled := False;
  aPrint.Enabled := False;

  cxLabel4.Caption := 'Выполняется запрос к Базе Данных...';
  if tvPlan.DataController.LockCount = 0 then
    tvPlan.BeginUpdate;
  tvPlan.DataController.RecordCount := 0;
  while tvPlan.DataController.LockCount > 0 do
    tvPlan.EndUpdate;
  cxGr.Refresh;
  dxMemData1.Close;
  dxMemData1.Open;
  StartTime:= Now;
  oqThread.Scrollable := True;
  Animator1.Animate := True;
  oqThread.SetVariable('pdate1', dDateBeg);
  oqThread.SetVariable('pdate2', dDateEnd);
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
  pAPPSOTRID := StrToInt(paramstr(1));
  ods := TOracleDataSet.Create(nil);
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FK_SOTRID, DO_VRACHFIO(FK_SOTRID) AS VRACHFIO, TRUNC(SYSDATE) AS DATESYS, '+#13+
                    '        ASU.PKG_SMINI.READSTRING (''CONFIG'', ''S_FULLNAME'', '''') AS COMPANYNAME, '+#13+
                    '        (SELECT FC_NAME '+#13+
                    '           FROM asu.TOTDEL '+#13+
                    '          WHERE FK_ID = (SELECT FK_OTDID FROM asu.TSOTR WHERE FK_ID = TAPPSOTR.FK_SOTRID)) AS OTDELNAME '+#13+
                    '   FROM LOGIN.TAPPSOTR WHERE FL_DEL <> 1 AND FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pAPPSOTRID);
    ods.Open;
    pSOTRID := ods.FieldByName('FK_SOTRID').AsInteger;
    sVrachFIO := ods.FieldByName('VRACHFIO').AsString;
    dSysDate := ods.FieldByName('DATESYS').AsDateTime;
    sCompanyName := ods.FieldByName('COMPANYNAME').AsString;
    frmMain.Caption := 'План по флюорографии по выверке предприятий('+Ver.FileVersion+'). Пользователь: '+sVrachFIO;
    sOtdelName := ods.FieldByName('OTDELNAME').AsString;
  finally
    ods.Free;
    Ver.Free;
  end;
  aPrint.Enabled := False;
  aRefresh.Enabled := False;
  MedotradeSign := ReadMedotradeSign;
  tvPlan.StoreToRegistry('\SoftWare\SoftMaster\Fluoro_company_plan\fMain\tvPlanSotr_' + IntToStr(pSOTRID)+'Default', TRUE, [], 'TVPLAN');
  tvPlan.RestoreFromRegistry('\SoftWare\SoftMaster\Fluoro_company_plan\fMain\tvPlanSotr_' + IntToStr(pSOTRID), FALSE, FALSE, [], 'TVPLAN');
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
  tvPlan.StoreToRegistry('\SoftWare\SoftMaster\Fluoro_company_plan\fMain\tvPlanSotr_' + IntToStr(pSOTRID), TRUE, [], 'tvPlan');
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  GetSession(os, 'ASU');
end;

procedure TfrmMain.frxRepPrintGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName;
  if VarName = 'OTDELNAME' then Value := sOtdelName;
  if VarName = 'VSEGO' then Value := oqThread.RowCount;
  if VarName = 'SYSDATE' then Value := sDateSys_4Rep;
  if VarName = 'SOTRNAME' then Value := sVrachFIO;
  if VarName = 'DATE1' then Value := dDateBeg;
  if VarName = 'DATE2' then Value := DateTimeToStr(Trunc(dDateEnd));
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
  if VarName = 'WORKPLACE' then Value := lbWork.Caption;
  if VarName = 'UCH' then Value := lbUch.Caption;  
end;

procedure TfrmMain.N2Click(Sender: TObject);
begin
  tvPlan.RestoreFromRegistry('\SoftWare\SoftMaster\Fluoro_company_plan\fMain\tvPlanSotr_' + IntToStr(pSOTRID)+'Default', FALSE, FALSE, [], 'tvPlan');
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
  tvPlan.BeginUpdate;
  tvPlan.DataController.RecordCount := tvPlan.DataController.RecordCount + 1;
  with tvPlan.DataController do
  begin
    try
//      Values[tvPlan.DataController.RecordCount - 1, tvPLAN_NUMPP.Index] := Sender.Field('rownum');
      Values[tvPlan.DataController.RecordCount - 1, tvPLAN_TUB.Index] := Sender.Field('tub');
      Values[tvPlan.DataController.RecordCount - 1, tvPLAN_FIOPAC.Index] := Sender.Field('fiopac');
      Values[tvPlan.DataController.RecordCount - 1, tvPLAN_SEX.Index] := Sender.Field('fp_sex');
      Values[tvPlan.DataController.RecordCount - 1, tvPLAN_ROJD.Index] := Sender.Field('fd_rojd');
      Values[tvPlan.DataController.RecordCount - 1, tvPLAN_LAST.Index] := Sender.Field('last_fluoro');
      Values[tvPlan.DataController.RecordCount - 1, tvPLAN_WORK.Index] := Sender.Field('work');
      Values[tvPlan.DataController.RecordCount - 1, tvPLAN_PLAN.Index] := Sender.Field('plan_fluoro');
      Values[tvPlan.DataController.RecordCount - 1, tvPLAN_MED.Index] := Sender.Field('medrab');
      Values[tvPlan.DataController.RecordCount - 1, tvPLAN_UCH.Index] := Sender.Field('UCH');
      dxMemData1.Insert;
//      dxMemData1.FieldByName('numpp').AsInteger := Sender.Field('rownum');
      dxMemData1.FieldByName('tub').AsInteger := Sender.Field('tub');
      dxMemData1.FieldByName('fiopac').AsString := Sender.Field('fiopac');
      dxMemData1.FieldByName('sex').AsString := Sender.Field('fp_sex');
      dxMemData1.FieldByName('rojd').AsDateTime := Sender.Field('fd_rojd');
      dxMemData1.FieldByName('last').AsDateTime := Sender.Field('last_fluoro');
      dxMemData1.FieldByName('work').AsString := Sender.Field('work');
      dxMemData1.FieldByName('plan').AsDateTime := Sender.Field('plan_fluoro');
      dxMemData1.FieldByName('medrab').AsString := Sender.Field('medrab');
      dxMemData1.FieldByName('uch').AsString := Sender.Field('uch');
      dxMemData1.Post;
      dxMemData1.Next;
    finally
    end;
  end;
  tvPlan.EndUpdate;
  cxLabel6.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
  cxLabel6.Refresh;
  cxLabel5.Caption := 'Выбрано ' + IntToStr(tvPlan.DataController.RecordCount) + ' записей.';
  cxLabel5.Refresh;
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

end.
