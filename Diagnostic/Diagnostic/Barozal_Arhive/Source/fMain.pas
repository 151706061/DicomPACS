unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Oracle, JclFileUtils, dxSkinsCore, cxStyles,
  cxGraphics, cxEdit, cxButtonEdit, cxDBLookupComboBox, cxCalendar,
  cxDropDownEdit, cxSpinEdit, cxCheckBox, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, dxSkinsdxBarPainter, dxBar, cxClasses,
  ImgList, ActnList, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxControls, cxGridCustomView, cxGrid, cxSplitter, cxVGrid, cxInplaceContainer,
  cxContainer, cxLabel, JvExControls, JvAnimatedImage, JvGIFCtrl, ExtCtrls, OracleData,
  uGlobalConst, SMMainAPI, cxTextEdit, DB, dxmdaset, Menus, cxGridExportLink,
  dxSkinOffice2007Green, frxClass, frxDBSet;

type
  TfrmMain = class(TForm)
    os: TOracleSession;
    paParam: TPanel;
    Panel1: TPanel;
    paSubParam: TPanel;
    Animator1: TJvGIFAnimator;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    VerticalGrid: TcxVerticalGrid;
    rowCategoryCommon: TcxCategoryRow;
    rowPeriodFrom: TcxEditorRow;
    rowPeriodTo: TcxEditorRow;
    rowPacient: TcxEditorRow;
    rowTypePac: TcxEditorRow;
    rowSex: TcxEditorRow;
    merAge: TcxMultiEditorRow;
    rowCategoryAnother: TcxCategoryRow;
    rowPlace: TcxEditorRow;
    rowTypeNaz: TcxEditorRow;
    cxSplitter1: TcxSplitter;
    cxSplitter2: TcxSplitter;
    paMain: TPanel;
    grMain: TcxGrid;
    tvMain: TcxGridTableView;
    tvMain_FK_ID: TcxGridColumn;
    tvMain_PACID: TcxGridColumn;
    tvMain_FD_RUN: TcxGridColumn;
    tvMain_NUMMK: TcxGridColumn;
    tvMain_PACFIO: TcxGridColumn;
    tvMain_ROJD: TcxGridColumn;
    tvMain_PEPLID: TcxGridColumn;
    grMainLevel1: TcxGridLevel;
    dxBarDockControl2: TdxBarDockControl;
    al: TActionList;
    aClose: TAction;
    aRefresh: TAction;
    aPrint: TAction;
    aHide: TAction;
    aShow: TAction;
    aProtocol: TAction;
    aXLS: TAction;
    aOpenMK: TAction;
    il: TImageList;
    BM: TdxBarManager;
    BMBar1: TdxBar;
    bbClose: TdxBarButton;
    bbRefresh: TdxBarButton;
    bbClear: TdxBarButton;
    bbSaveFilter: TdxBarButton;
    bbLoadFilter: TdxBarButton;
    bbPrint: TdxBarButton;
    bbProtocol: TdxBarButton;
    bbOpenMK: TdxBarButton;
    oqThread: TOracleQuery;
    odsTypePac: TOracleDataSet;
    dsTypePac: TDataSource;
    ilSmall: TcxImageList;
    odsRegPrin: TOracleDataSet;
    dsRegPrin: TDataSource;
    odsTypeNaz: TOracleDataSet;
    dsTypeNaz: TDataSource;
    dxMemData1: TdxMemData;
    dxMemData1FK_ID: TIntegerField;
    dxMemData1FK_PACID: TIntegerField;
    dxMemData1FIOPAC: TStringField;
    dxMemData1NUMMK: TStringField;
    dxMemData1PEPLID: TIntegerField;
    dxMemData1FD_ROJD: TDateField;
    odsCntPepl: TOracleDataSet;
    tmrCheckApplication: TTimer;
    rowDs: TcxEditorRow;
    pmVIEW: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Excel1: TMenuItem;
    sdPopUp: TSaveDialog;
    rowPP: TcxEditorRow;
    rowNumCam: TcxEditorRow;
    odsNumCam: TOracleDataSet;
    dsNumCam: TDataSource;
    rowOtdelStac: TcxEditorRow;
    rowOtdelAmb: TcxEditorRow;
    odsOtdel: TOracleDataSet;
    dsOtdel: TDataSource;
    tvMain_Otdel: TcxGridColumn;
    tvMain_Ds: TcxGridColumn;
    dxMemData1OTDEL: TStringField;
    dxMemData1DS: TStringField;
    dxMemData1fd_run: TDateField;
    frxRepList: TfrxReport;
    frxDBList: TfrxDBDataset;
    dxMemData1fd_naz: TDateField;
    dxMemData1fc_name: TStringField;
    dxMemData1ispolfio: TStringField;
    dxMemData1mkb10: TStringField;
    tvMain_mkb10: TcxGridColumn;
    procedure osAfterLogOn(Sender: TOracleSession);
    procedure aHideExecute(Sender: TObject);
    procedure aShowExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aCloseExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure rowPacientEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure aRefreshExecute(Sender: TObject);
    procedure oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer;
      const ErrorMessage: string);
    procedure oqThreadThreadFinished(Sender: TOracleQuery);
    procedure oqThreadThreadRecord(Sender: TOracleQuery);
    procedure aOpenMKExecute(Sender: TObject);
    procedure tmrCheckApplicationTimer(Sender: TObject);
    procedure rowDsEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure N2Click(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure rowOtdelStacEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowTypePacEditPropertiesChange(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure frxRepListGetValue(const VarName: string; var Value: Variant);
  private
    nRec : Integer;
    bbr : Boolean;
    StartTime: TTime;
    pAPPSOTRID : Integer;
    MedotradeSign : string;
    dDateBegin, dDateEnd : TDateTime;
    arFIO:array of string;
    sCompanyName_4Rep, sOtdelName_4Rep, sSotrFIO, sSysDate_4Rep, sParams : String;
    procedure CheckEnabledButtons;
    function RestoreApplication(AAppCaption:string):Boolean;
    procedure DoRefreshSmidConst;
    { Private declarations }
  public
    Russian : HKL;
    pSOTRID : Integer;
    procedure DoShowMainForm;
    { Public declarations }
  end;
const
  sqlList = ' select t1.fk_id, '+#13+
            '        t1.fk_pacid, '+#13+
            '        t1.fk_nazsosid, '+#13+
            '        t1.fk_smid, '+#13+
            '        asu.get_smidname(t1.fk_smid) as fc_name, '+#13+
            '        t1.fd_naz, '+#13+
            '        t1.fd_run, to_char(t1.fd_run, ''dd.mm.yyyy hh24:mi'') as fd_run_str, '+#13+
            '        asu.do_vrachfio(t1.fk_ispolid) as ispolfio, '+#13+
            '        asu.pkg_regist_pacfunc.get_pac_fio(t1.fk_pacid) as fiopac, '+#13+
            '        trunc(asu.pkg_regist_pacfunc.get_pac_bith(t1.fk_pacid)) as fd_rojd, '+#13+
            '        asu.get_ib(t1.fk_pacid) as nummk, '+#13+
            '        asu.get_peplid(t1.fk_pacid) as peplid, '+#13+
            '        decode(asu.is_ambulance(t1.fk_pacid), '+#13+
            '               0, '+#13+
            '               asu.pkg_regist_pacfunc.get_pac_fcotdel(t1.fk_pacid), '+#13+
            '               1, '+#13+
            '               (select asu.get_smidname(fk_smid) '+#13+
            '                  from asu.tib '+#13+
            '                 where fk_pacid = t1.fk_id and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim=''BAROZAL_OTDEL''))) as otdel, '+#13+
            '        t2.fc_write, '+#13+
            '        (select fk_mkb10 '+#13+
            '           from asu.tsmid '+#13+
            '          where fk_id = t2.fk_smdiagid) as mkb10 '+#13+
            '   from asu.vnaz t1, asu.tbarozal t2 '+#13+
            '  where t1.fk_smid in (select fk_id from asu.tsmid '+#13+
            '                       start with fc_synonim = ''ISL_BAROZAL'' '+#13+
            '                       connect by prior fk_id = fk_owner) '+#13+
            '    and t1.fk_id = t2.fk_nazid '+#13+
            '    and t1.fd_run >= :pdate1 '+#13+
            '    and t1.fd_run <= :pdate2 '+#13+
            '    and t1.fk_nazsosid = asu.get_vipnaz ';

  sqlListCount = ' select count(distinct asu.get_peplid(t1.fk_pacid)) as cnt '+#13+
                 '   from asu.vnaz t1, asu.tbarozal t2 '+#13+
                 '  where t1.fd_run >= :pdate1 '+#13+
                 '    and t1.fd_run <= :pdate2 '+#13+
                 '    and t1.fk_id = t2.fk_nazid '+#13+
                 '    and t1.fk_smid in (select fk_id from asu.tsmid '+#13+
                 '                       start with fc_synonim = ''ISL_BAROZAL'' '+#13+
                 '                       connect by prior fk_id = fk_owner) '+#13+
                 '    and t1.fk_nazsosid = asu.get_vipnaz ';
var
  frmMain: TfrmMain;

implementation
uses fSearch, fWait, fSetDs, fSetOtdel;
{$R *.dfm}

procedure TfrmMain.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.aHideExecute(Sender: TObject);
begin
  cxSplitter2.CloseSplitter;
end;

procedure TfrmMain.aOpenMKExecute(Sender: TObject);
var ods : TOracleDataSet;
    AppProcID : Integer; 
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT ASU.PKG_REGIST_PEPLFUNC.GET_PEPL_FIO(:FK_PEPLID) as FIOPAC FROM DUAL ';
    ods.DeclareAndSet('FK_PEPLID', otInteger, tvMain.DataController.Values[tvMain.DataController.FocusedRecordIndex, tvMain_PEPLID.Index]);
    ods.Open;
    if RestoreApplication(ods.FieldByName('FIOPAC').AsString) then Exit;
    SetLength(frmMain.arFIO, Length(frmMain.arFIO)+1);
    arFIO[Length(frmMain.arFIO)-1]:=ods.FieldByName('FIOPAC').AsString;
    aOpenMK.Enabled:=False;
    Application.ProcessMessages;
    Screen.Cursor := crSQLWait;
    tmrCheckApplication.Enabled:=True;

    AppProcID := AppStart(ExtractFilePath(paramstr(0))+'IBRazdel.exe', IntToStr(tvMain.DataController.Values[tvMain.DataController.FocusedRecordIndex, tvMain_PACID.Index])+' '+IntToStr(-1)+' '+IntToStr(-1));
    if AppProcID = -1 then ShowMessage('Ошибка запуска приложения');
    ShowWait(tvMain.DataController.Values[tvMain.DataController.FocusedRecordIndex, tvMain_PACID.Index],True);
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.aPrintExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  VerticalGrid.FocusRow(VerticalGrid.FirstRow, 0);
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY HH24:MI'') AS DATESYS FROM DUAL ';
    ods.Open;
    sSysDate_4Rep := ods.FieldByName('DATESYS').AsString;
  finally
    ods.Free;
  end;
  sParams := '';
  if rowPacient.Tag <> -1 then
    sParams := sParams + 'Пациент: '+rowPacient.Properties.Value+'; ';
  if (rowTypePac.Properties.Value <> -1) and (rowTypePac.Properties.Value <> null)  then
    sParams := sParams + 'Тип пациента: '+odsTypePac.FieldByName('fc_name').AsString+'; ';
  if (rowOtdelAmb.Visible) and (rowOtdelAmb.Properties.Value <> -1) and (VarToStr(rowOtdelAmb.Properties.Value) <> '') then
    sParams := sParams + 'Отделение: '+odsOtdel.FieldByName('fc_name').AsString+'; ';
  if (rowOtdelStac.Visible) and (rowOtdelStac.Tag <> -1) then
    sParams := sParams + 'Отделение: '+rowOtdelStac.Properties.Value+'; ';
  if VarToStr(rowSex.Properties.Value) <> '' then
    sParams := sParams + 'Пол пациента: '+rowSex.Properties.Value+'; ';    
  if merAge.Properties.Editors[1].Value <> 0  then
    sParams := sParams + 'Возраст с: '+IntToStr(merAge.Properties.Editors[0].Value)+' по: '+IntToStr(merAge.Properties.Editors[1].Value);
  if (rowPlace.Properties.Value <> -1) and (VarToStr(rowPlace.Properties.Value) <> '') then
    sParams := sParams + 'Проживает: '+odsRegPrin.FieldByName('FC_NAME').AsString+'; ';
  if (rowTypeNaz.Properties.Value <> -1) and (VarToStr(rowTypeNaz.Properties.Value) <> '') then
    sParams := sParams + 'Тип назначения: '+odsTypeNaz.FieldByName('FC_NAME').AsString+'; ';
  if rowDs.Tag <> -1 then
    sParams := sParams + 'Диагноз: '+rowDs.Properties.Value+'; ';
  if rowPP.Properties.Value <> 0 then
    sParams := sParams + 'Первичный пациент: ДА; ';
  if (rowNumCam.Properties.Value <> -1) and (VarToStr(rowNumCam.Properties.Value) <> '') then
    sParams := sParams + '№ барокамеры: '+odsNumCam.FieldByName('FC_NAME').AsString+'; ';
  if sParams = '' then
    begin
      frxRepList.FindObject('Memo22').Visible := False;
    end else
    begin
      frxRepList.FindObject('Memo22').Visible := True;
    end;
  frxRepList.ShowReport;
end;

procedure TfrmMain.aRefreshExecute(Sender: TObject);
begin
  grMain.SetFocus;
//-->> проверяем на правильность введенных данных
  if merAge.Properties.Editors[0].Value < 0 then
    begin
      Application.MessageBox('Начальная цифра возрастного периода не может быть меньше нуля!', 'Внимание', MB_ICONWARNING + MB_OK);
      merAge.Properties.Editors[0].Row.Focused := True;
      Exit;
    end;
  if merAge.Properties.Editors[1].Value < 0 then
    begin
      Application.MessageBox('Конечная цифра возрастного периода не может быть меньше нуля!', 'Внимание', MB_ICONWARNING + MB_OK);
      merAge.Properties.Editors[1].Row.Focused := True;
      Exit;
    end;

  aRefresh.Enabled := False;
  aProtocol.Enabled := False;
  aPrint.Enabled := False;
  aOpenMK.Enabled := False;

  if tvMain.DataController.LockCount = 0 then
    tvMain.BeginUpdate;
  tvMain.DataController.RecordCount := 0;
  while tvMain.DataController.LockCount > 0 do
    tvMain.EndUpdate;
  dxMemData1.Close;
  dxMemData1.Open;
  dDateBegin := VarToDateTime(rowPeriodFrom.Properties.Value);
  dDateEnd := VarToDateTime(rowPeriodTo.Properties.Value+' 23:59:59');
  oqThread.Scrollable := True;

  oqThread.DeleteVariables;
  oqThread.SQL.Text := sqlList;
  odsCntPepl.Close;
  odsCntPepl.DeleteVariables;
  odsCntPepl.SQL.Text := sqlListCount;
//-->> 1 Пол пациента
  if VarToStr(rowSex.Properties.Value) <> '' then
    begin
      oqThread.SQL.Add(' and asu.pkg_regist_pacfunc.get_pac_sexid(fk_pacid) = :pfk_sexid ');
      if rowSex.Properties.Value = 'Мужчины' then
        oqThread.DeclareAndSet('PFK_SEXID', otInteger, 1);
      if rowSex.Properties.Value = 'Женщины' then
        oqThread.DeclareAndSet('PFK_SEXID', otInteger, 0);
      odsCntPepl.SQL.Add(' and asu.pkg_regist_pacfunc.get_pac_sexid(fk_pacid) = :pfk_sexid ');
      if rowSex.Properties.Value = 'Мужчины' then
        odsCntPepl.DeclareAndSet('PFK_SEXID', otInteger, 1);
      if rowSex.Properties.Value = 'Женщины' then
        odsCntPepl.DeclareAndSet('PFK_SEXID', otInteger, 0);
    end;
//-->> 2 Тип пациента
  if (rowTypePac.Properties.Value <> -1) and (rowTypePac.Properties.Value <> null) then
    begin
      oqThread.SQL.Add(' and asu.is_ambulance(fk_pacid) = :pfk_typepac ');
      oqThread.DeclareAndSet('PFK_TYPEPAC', otInteger, rowTypePac.Properties.Value);
      odsCntPepl.SQL.Add(' and asu.is_ambulance(fk_pacid) = :pfk_typepac ');
      odsCntPepl.DeclareAndSet('PFK_TYPEPAC', otInteger, rowTypePac.Properties.Value);
    end;
//-->> 3 Возраст пациента
  if merAge.Properties.Editors[1].Value <> 0 then
    begin
      oqThread.SQL.Add(' and asu.pkg_regist_pacfunc.get_pac_age_now(t1.fk_pacid) >= :page1 ');
      oqThread.SQL.Add(' and asu.pkg_regist_pacfunc.get_pac_age_now(t1.fk_pacid) <= :page2 ');
      oqThread.DeclareAndSet('PAGE1', otInteger, merAge.Properties.Editors[0].Value);
      oqThread.DeclareAndSet('PAGE2', otInteger, merAge.Properties.Editors[1].Value);
      odsCntPepl.SQL.Add(' and asu.pkg_regist_pacfunc.get_pac_age_now(t1.fk_pacid) >= :page1 ');
      odsCntPepl.SQL.Add(' and asu.pkg_regist_pacfunc.get_pac_age_now(t1.fk_pacid) <= :page2 ');
      odsCntPepl.DeclareAndSet('PAGE1', otInteger, merAge.Properties.Editors[0].Value);
      odsCntPepl.DeclareAndSet('PAGE2', otInteger, merAge.Properties.Editors[1].Value);
    end;
//-->> 4 Проживает
  if (rowPlace.Properties.Value <> -1) and (VarToStr(rowPlace.Properties.Value) <> '') then
    begin
      oqThread.SQL.Add(' and exists (select 1 from asu.tib where fk_pacid = asu.get_peplid(t1.fk_pacid) and fk_smid = :pfk_smid2) ');
      oqThread.DeclareAndSet('PFK_SMID2', otInteger, rowPlace.Properties.Value);
      odsCntPepl.SQL.Add(' and exists (select 1 from asu.tib where fk_pacid = asu.get_peplid(t1.fk_pacid) and fk_smid = :pfk_smid2) ');
      odsCntPepl.DeclareAndSet('PFK_SMID2', otInteger, rowPlace.Properties.Value);
    end;
//-->> 5 Тип назначения
  if (rowTypeNaz.Properties.Value <> -1) and (VarToStr(rowTypeNaz.Properties.Value) <> '') then
    begin
      oqThread.SQL.Add(' and fk_naztypeid = :pfk_naztypeid ');
      oqThread.DeclareAndSet('PFK_NAZTYPEID', otInteger, rowTypeNaz.Properties.Value);
      odsCntPepl.SQL.Add(' and fk_naztypeid = :pfk_naztypeid ');
      odsCntPepl.DeclareAndSet('PFK_NAZTYPEID', otInteger, rowTypeNaz.Properties.Value);
    end;
//-->> 6 Пациент
  if rowPacient.Tag <> -1 then
    begin
      oqThread.SQL.Add(' and asu.get_peplid(fk_pacid) = :pfk_pacid ');
      oqThread.DeclareAndSet('PFK_PACID', otInteger, rowPacient.Tag);
      odsCntPepl.SQL.Add(' and asu.get_peplid(fk_pacid) = :pfk_pacid ');
      odsCntPepl.DeclareAndSet('PFK_PACID', otInteger, rowPacient.Tag);
    end;
//-->> 7 Диагноз
  if rowDs.Tag <> -1 then
    begin
      oqThread.SQL.Add(' and t2.fk_smdiagid = :pfk_smdiagid ');
      oqThread.DeclareAndSet('pfk_smdiagid', otInteger, rowDs.Tag);
      odsCntPepl.SQL.Add(' and t2.fk_smdiagid = :pfk_smdiagid ');
      odsCntPepl.DeclareAndSet('pfk_smdiagid', otInteger, rowDs.Tag);
    end;
//-->> 8 Первичный пациент
  if rowPP.Properties.Value <> 0 then
    begin
      oqThread.SQL.Add(' and t2.fn_first = :pfn_first ');
      oqThread.DeclareAndSet('pfn_first', otInteger, rowPP.Properties.Value);
      odsCntPepl.SQL.Add(' and t2.fn_first = :pfn_first ');
      odsCntPepl.DeclareAndSet('pfn_first', otInteger, rowPP.Properties.Value);
    end;
//-->> 9 № барокамеры
  if (rowNumCam.Properties.Value <> -1) and (VarToStr(rowNumCam.Properties.Value) <> '') then
    begin
      oqThread.SQL.Add(' and t2.fn_numcamera = :pfn_numcamera ');
      oqThread.DeclareAndSet('pfn_numcamera', otInteger, rowNumCam.Properties.Value);
      odsCntPepl.SQL.Add(' and t2.fn_numcamera = :pfn_numcamera ');
      odsCntPepl.DeclareAndSet('pfn_numcamera', otInteger, rowNumCam.Properties.Value);
    end;
//-->> 10 Отделение
  if rowTypePac.Properties.Value = 1 then
    begin
      if (rowOtdelAmb.Visible = True) and (rowOtdelAmb.Properties.Value <> -1) and (rowOtdelAmb.Properties.Value <> null) then
        begin
          oqThread.SQL.Add('and exists (select 1 from asu.tib where fk_pacid = t1.fk_id and fk_smid = :pfk_smid3)');
          oqThread.DeclareAndSet('pfk_smid3', otInteger, rowOtdelAmb.Properties.Value);
          odsCntPepl.SQL.Add('and exists (select 1 from asu.tib where fk_pacid = t1.fk_id and fk_smid = :pfk_smid3)');
          odsCntPepl.DeclareAndSet('pfk_smid3', otInteger, rowOtdelAmb.Properties.Value);
        end;
    end;
  if rowTypePac.Properties.Value = 0 then
    begin
      if (rowOtdelStac.Visible = True) and (rowOtdelStac.Tag <> -1) then
        begin
          oqThread.SQL.Add('and asu.pkg_regist_pacfunc.get_pac_otdelid(t1.fk_pacid) = :pOtdelID');
          oqThread.DeclareAndSet('pOtdelID', otInteger, rowOtdelStac.Tag);
          odsCntPepl.SQL.Add('and asu.pkg_regist_pacfunc.get_pac_otdelid(t1.fk_pacid) = :pOtdelID');
          odsCntPepl.DeclareAndSet('pOtdelID', otInteger, rowOtdelStac.Tag);
        end;
    end;

//-->> 8 Отдел // !!! пока не понятно что с этим делать надо как-то по-другому определять отделение
//  if rowOtdel.Tag <> -1 then
//    begin
//      oqThread.SQL.Add(' and asu.get_vrachfcotdel(tnazis.fk_vrachid) = :pfc_otdel ');
//      oqThread.DeclareAndSet('pfc_otdel', otString, rowOtdel.Properties.Value);
//    end;

  cxLabel1.Caption := '';
  cxLabel2.Caption := '';
  cxLabel3.Caption := 'Выполняется запрос к Базе Данных...';
  StartTime:= Now;
  cxLabel1.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
  cxLabel1.Refresh;
  bbr := False;
  paSubParam.Visible := True;
  cxSplitter2.Visible := True;
  Animator1.Animate := True;
  oqThread.DeclareAndSet('PDATE1', otDate, dDateBegin);
  oqThread.DeclareAndSet('PDATE2', otDate, dDateEnd);
  tvMain.BeginUpdate;
  nRec := 0;
  oqThread.Execute;
end;

procedure TfrmMain.aShowExecute(Sender: TObject);
begin
  cxSplitter2.OpenSplitter;
end;

procedure TfrmMain.aXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    ExportGridToExcel(sdPopUp.FileName, grMain, TRUE, TRUE);
end;

procedure TfrmMain.CheckEnabledButtons;
begin
  aProtocol.Enabled := oqThread.RowCount <> 0;
  aPrint.Enabled := oqThread.RowCount <> 0;
  aOpenMK.Enabled := oqThread.RowCount <> 0;
  aOpenMK.Enabled := oqThread.RowCount <> 0;
end;

procedure TfrmMain.DoRefreshSmidConst;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.SQL.Text := ' SELECT ASU.PKG_SMINI.READSTRING (''CONFIG'', ''S_FULLNAME'', '''') AS COMPANYNAME '+#13+
                    '   FROM DUAL ';
    ods.Open;
    sCompanyName_4Rep := ods.FieldByName('COMPANYNAME').AsString;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.DoShowMainForm;
var ods : TOracleDataSet;
    Ver : TJclFileVersionInfo;
begin
  aOpenMK.Enabled := False;
  aProtocol.Enabled := False;
  aPrint.Enabled := False;
  merAge.Properties.Editors[0].Value := 0;
  merAge.Properties.Editors[1].Value := 0;
  DoRefreshSmidConst;
  ods := TOracleDataSet.Create(nil);
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
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
    frmMain.Caption := 'Архив барозала ('+Ver.FileVersion+')'+'. Пользователь: '+ods.FieldByName('VRACHFIO').AsString;
    sOtdelName_4Rep := ods.FieldByName('OTDELNAME').AsString;
    sSotrFIO := ods.FieldByName('VRACHFIO').AsString;
    rowPeriodFrom.Properties.Value := ods.FieldByName('DATESYS').AsVariant;
    rowPeriodTo.Properties.Value := ods.FieldByName('DATESYS').AsVariant;

    rowPP.Properties.Value := 0;
    rowPacient.Tag := -1;
    rowDs.Tag := -1;
    rowOtdelStac.Tag := -1;
    tvMain.StoreToRegistry('\SoftWare\SoftMaster\Barozal_Archive\fMain\tvMainVrach_' + IntToStr(pSOTRID)+'Default', True, [], 'tvMain');
    tvMain.RestoreFromRegistry('\SoftWare\SoftMaster\Barozal_Archive\fMain\tvMainVrach_' + IntToStr(pSOTRID), False, False, [], 'tvMain');
    MedotradeSign := ReadMedotradeSign;
  finally
    Ver.Free;
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
  tvMain.StoreToRegistry('\SoftWare\SoftMaster\Barozal_Archive\fMain\tvMainVrach_' + IntToStr(pSOTRID), True, [], 'tvMain');
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  GetSession(os, 'ASU');
// -- заряжаем датасеты
  if odsTypePac.Active = False then
    odsTypePac.Active := True;
  if odsRegPrin.Active = False then
    odsRegPrin.Active := True;
  if odsTypeNaz.Active = False then
    odsTypeNaz.Active := True;
  if odsNumCam.Active = False then
    odsNumCam.Active := True;  
  if odsOtdel.Active = False then
    odsOtdel.Active := True;

  Russian:=LoadKeyboardLayout('00000419', 0);    
end;

procedure TfrmMain.frxRepListGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := sOtdelName_4Rep;
  if VarName = 'VSEGO' then Value := oqThread.RowCount;
  if VarName = 'DATESYS' then Value := sSysDate_4Rep;
  if VarName = 'SOTR' then Value := sSotrFIO;
  if VarName = 'DATE1' then Value := rowPeriodFrom.Properties.Value;
  if VarName = 'DATE2' then Value := rowPeriodTo.Properties.Value;
  if VarName = 'PARAMS' then Value := sParams;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
end;

procedure TfrmMain.N2Click(Sender: TObject);
begin
  tvMain.RestoreFromRegistry('\SoftWare\SoftMaster\Barozal_Archive\fMain\tvMainVrach_' + IntToStr(pSOTRID)+'Default', FALSE, FALSE, [], 'tvMain');
end;

procedure TfrmMain.oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer;
  const ErrorMessage: string);
begin
  tvMain.EndUpdate;
  MessageDlg('Во время выполнения запроса произошла ошибка! Обратитесь к администратору системы!'+
             #13#10+'Код ошибки: '+IntToStr(ErrorCode)+
             #13#10+'Текст ошибки: '+ErrorMessage,
             mtError, [mbOK], 0);
  bbr := True;
end;

procedure TfrmMain.oqThreadThreadFinished(Sender: TOracleQuery);
begin
  tvMain.EndUpdate;
  aRefresh.Enabled := True;
  Animator1.Animate := False;
  if bbr then
    cxLabel3.Caption := 'При выполнении запроса произошла ошибка!'
  else
    cxLabel3.Caption := 'Запрос к Базе Данных выполнился успешно!';

  odsCntPepl.DeclareAndSet('PDATE1', otDate, dDateBegin);
  odsCntPepl.DeclareAndSet('PDATE2', otDate, dDateEnd);
  odsCntPepl.Open;
  cxlabel2.Caption := cxLabel2.Caption + ' Из них лиц - '+IntToStr(odsCntPepl.FieldByName('cnt').AsInteger);
  CheckEnabledButtons;
end;

procedure TfrmMain.oqThreadThreadRecord(Sender: TOracleQuery);
begin
//  tvMain.BeginUpdate;
  tvMain.DataController.RecordCount := tvMain.DataController.RecordCount + 1;
  with tvMain.DataController do
  begin
    try
      Values[tvMain.DataController.RecordCount - 1, tvMain_FK_ID.Index] := Sender.Field('FK_ID');
      Values[tvMain.DataController.RecordCount - 1, tvMain_PACID.Index] := Sender.Field('FK_PACID');
      Values[tvMain.DataController.RecordCount - 1, tvMain_FD_RUN.Index] := Sender.Field('FD_RUN');
      Values[tvMain.DataController.RecordCount - 1, tvMain_PACFIO.Index] := Sender.Field('FIOPAC');
      Values[tvMain.DataController.RecordCount - 1, tvMain_NUMMK.Index] := Sender.Field('NUMMK');
      Values[tvMain.DataController.RecordCount - 1, tvMain_PEPLID.Index] := Sender.Field('PEPLID');
      Values[tvMain.DataController.RecordCount - 1, tvMain_ROJD.Index] := Sender.Field('FD_ROJD');
      Values[tvMain.DataController.RecordCount - 1, tvMain_Otdel.Index] := Sender.Field('otdel');
      Values[tvMain.DataController.RecordCount - 1, tvMain_Ds.Index] := Sender.Field('fc_write');
      Values[tvMain.DataController.RecordCount - 1, tvMain_mkb10.Index] := Sender.Field('mkb10');

      dxMemData1.Insert;
      dxMemData1.FieldByName('FK_ID').AsString := Sender.Field('FK_ID');
      dxMemData1.FieldByName('FK_PACID').AsString := Sender.Field('FK_PACID');
      dxMemData1.FieldByName('FD_RUN').AsDateTime := Sender.Field('FD_RUN');
      dxMemData1.FieldByName('FIOPAC').AsString := Sender.Field('FIOPAC');
      dxMemData1.FieldByName('NUMMK').AsString := Sender.Field('NUMMK');
      dxMemData1.FieldByName('PEPLID').AsString := Sender.Field('PEPLID');
      dxMemData1.FieldByName('FD_ROJD').AsString := Sender.Field('FD_ROJD');
      dxMemData1.FieldByName('OTDEL').AsString := Sender.Field('otdel');
      dxMemData1.FieldByName('DS').AsString := Sender.Field('fc_write');
      dxMemData1.FieldByName('fd_naz').AsDateTime := Sender.Field('fd_naz');
      dxMemData1.FieldByName('fc_name').AsString := Sender.Field('fc_name');
      dxMemData1.FieldByName('ispolfio').AsString := Sender.Field('ispolfio');
      dxMemData1.FieldByName('mkb10').AsString := Sender.Field('mkb10');
      dxMemData1.Post;
      dxMemData1.Next;
    finally
    end;
  end;
//  tvMain.EndUpdate;
  cxLabel1.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
  cxLabel1.Refresh;
  cxLabel2.Caption := 'Выбрано ' + IntToStr(tvMain.DataController.RecordCount) + ' записей.';
  cxLabel2.Refresh;
  nRec := nRec + 1;
  if nRec > 100 then
    begin
      nRec := 0;
      tvMain.EndUpdate;
      tvMain.BeginUpdate;
    end;  
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

function TfrmMain.RestoreApplication(AAppCaption: string): Boolean;
var Wnd               : hWnd;
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

procedure TfrmMain.rowDsEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetDs, frmSetDs);
      try
        frmSetDs.DoShowForm;
        frmSetDs.ShowModal;
        if frmSetDs.ModalResult = mrOk then
          begin
            rowDs.Tag := frmSetDs.odsDiag.FieldByName('fk_id').AsInteger;
            TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(VerticalGrid.InplaceEditor).EditingText := '('+frmSetDs.odsDiag.FieldByName('fk_mkb10').AsString+') '+frmSetDs.odsDiag.FieldByName('fc_name').AsString;
            TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsHideCursor;
          end;
      finally
        frmSetDs.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      rowDs.Tag := -1;
      TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsNormal;
      TcxButtonEdit(VerticalGrid.InplaceEditor).EditingText := ' ';
      TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsHideCursor;
    end;
end;

procedure TfrmMain.rowOtdelStacEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetOtdel, frmSetOtdel);
      try
        frmSetOtdel.ShowModal;
        if frmSetOtdel.ModalResult = mrOk then
          begin
          rowOtdelStac.Tag := frmSetOtdel.ods.FieldByName('fk_id').AsInteger;
          TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsNormal;
          TcxButtonEdit(VerticalGrid.InplaceEditor).EditingText := frmSetOtdel.ods.FieldByName('fc_name').AsString;
          TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsHideCursor;
          end;
      finally
        frmSetOtdel.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      rowOtdelStac.Tag := -1;
      TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsNormal;
      TcxButtonEdit(VerticalGrid.InplaceEditor).EditingText := ' ';
      TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsHideCursor;
    end;
end;

procedure TfrmMain.rowPacientEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSearch, frmSearch);
      try
        frmSearch.ShowModal;
        if frmSearch.ModalResult = mrOk then
          begin
            rowPacient.Tag := frmSearch.odsPac.FieldByName('FK_ID').AsInteger;
            TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(VerticalGrid.InplaceEditor).EditingText := frmSearch.odsPac.FieldByName('FIO').AsString;
            TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsHideCursor;
          end;
      finally
        frmSearch.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      rowPacient.Tag := -1;
      TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsNormal;
      TcxButtonEdit(VerticalGrid.InplaceEditor).EditingText := ' ';
      TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsHideCursor;
    end;
end;

procedure TfrmMain.rowTypePacEditPropertiesChange(Sender: TObject);
begin
  if rowTypePac.Properties.Value = 1 then
    begin
      rowOtdelAmb.Visible := True;
      rowOtdelStac.Visible := False;
      rowOtdelStac.Tag := -1;
      rowOtdelStac.Properties.Value := '';
    end;
  if rowTypePac.Properties.Value = 0 then
    begin
      rowOtdelStac.Visible := True;
      rowOtdelAmb.Visible := False;
      rowOtdelAmb.Properties.Value := -1;
    end;
  if rowTypePac.Properties.Value = -1 then
    begin
      rowOtdelStac.Visible := False;
      rowOtdelAmb.Visible := False;
      rowOtdelStac.Tag := -1;
      rowOtdelStac.Properties.Value := '';
      rowOtdelAmb.Properties.Value := -1;
    end;
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

//function TfrmMain.WinExecAndWait32(FileName: string; Visibility: integer): integer;
//var zAppName: array[0..512] of char;
//    zCurDir: array[0..255] of char;
//    WorkDir: string;
//    StartupInfo: TStartupInfo;
//    ProcessInfo: TProcessInformation;
//begin
//  StrPCopy(zAppName, FileName);
//  GetDir(0, WorkDir);
//  StrPCopy(zCurDir, FileName);
//  FillChar(StartupInfo, Sizeof(StartupInfo), #0);
//  StartupInfo.cb := Sizeof(StartupInfo);
//  StartupInfo.hStdInput := 23999;
//  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
//  StartupInfo.wShowWindow := Visibility;
//  if not CreateProcess(nil,
//         zAppName, { указатель командной строки }
//         nil, { указатель на процесс атрибутов безопасности }
//         nil, { указатель на поток атрибутов безопасности }
//         false, { флаг родительского обработчика }
//         CREATE_NEW_CONSOLE or { флаг создания }
//         NORMAL_PRIORITY_CLASS,
//         nil, { указатель на новую среду процесса }
//         nil, { указатель на имя текущей директории }
//         StartupInfo, { указатель на STARTUPINFO }
//         ProcessInfo) then Result := -1 { указатель на PROCESS_INF }
//  else begin
//      Result := ProcessInfo.dwProcessId;
//  end;
//end;

end.
