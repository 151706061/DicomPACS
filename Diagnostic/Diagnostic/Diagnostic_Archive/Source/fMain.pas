unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsdxBarPainter, dxSkinOffice2007Green, ExtCtrls,
  frxClass, frxDBSet, DB, dxmdaset, Oracle, Menus, cxStyles, cxGraphics,
  ImgList, ActnList, dxBar, cxClasses, OracleData, cxEdit, cxDBLookupComboBox,
  cxDropDownEdit, cxCalendar, cxButtonEdit, cxTextEdit, cxCheckBox,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxControls,
  cxGridCustomView, cxGrid, cxSplitter, cxVGrid, cxInplaceContainer,
  cxContainer, cxLabel, JvExControls, JvAnimatedImage, JvGIFCtrl, SmMainAPI,
  JclFileUtils, uGlobalConst, cxGridExportLink, Registry, jpeg;

type
  TfrmMain = class(TForm)
    odsMain: TOracleDataSet;
    dsMain: TDataSource;
    odsKab: TOracleDataSet;
    dsKab: TDataSource;
    odsSotr: TOracleDataSet;
    dsSotr: TDataSource;
    odsTypeNaz: TOracleDataSet;
    dsTypeNaz: TDataSource;
    odsRegPrin: TOracleDataSet;
    dsRegPrin: TDataSource;
    odsVidOplat: TOracleDataSet;
    dsVidOplat: TDataSource;
    os: TOracleSession;
    BM: TdxBarManager;
    BMBar1: TdxBar;
    bbClose: TdxBarButton;
    bbRefresh: TdxBarButton;
    bbPrint: TdxBarButton;
    bbProtocol: TdxBarButton;
    bbOpenMK: TdxBarButton;
    al: TActionList;
    aClose: TAction;
    aRefresh: TAction;
    aPrint: TAction;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aXLS: TAction;
    aProtocol: TAction;
    aOpenMK: TAction;
    il: TImageList;
    ilSmall: TcxImageList;
    stRep: TcxStyleRepository;
    stNormal: TcxStyle;
    stBold: TcxStyle;
    cxStyle1: TcxStyle;
    sdPopUp: TSaveDialog;
    pmVIEW: TPopupMenu;
    MenuItem1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    Web1: TMenuItem;
    XML1: TMenuItem;
    Excel1: TMenuItem;
    N3: TMenuItem;
    oqThread: TOracleQuery;
    memData: TdxMemData;
    memDataFK_ID: TIntegerField;
    memDataFK_PACID: TIntegerField;
    memDataFD_NAZ_STR: TStringField;
    memDataFD_RUN_STR: TStringField;
    memDataFIOPAC: TStringField;
    memDataNAMEISSL: TStringField;
    memDataVRACHFIO: TStringField;
    memDataNUMMK: TStringField;
    memDataPEPLID: TIntegerField;
    memDatafd_run: TDateField;
    memDatarojdpac: TDateField;
    memDataadr: TStringField;
    pm: TPopupMenu;
    N1: TMenuItem;
    frList: TfrxReport;
    frDBList: TfrxDBDataset;
    tmrCheckApplication: TTimer;
    Panel1: TPanel;
    paSubParam: TPanel;
    Animator1: TJvGIFAnimator;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    vGr: TcxVerticalGrid;
    catParams: TcxCategoryRow;
    rowStatus: TcxEditorRow;
    rowPeriodFrom: TcxEditorRow;
    rowPeriodTo: TcxEditorRow;
    rowKab: TcxEditorRow;
    rowVrach: TcxEditorRow;
    rowPac: TcxEditorRow;
    rowSex: TcxEditorRow;
    rowIssl: TcxEditorRow;
    catDop: TcxCategoryRow;
    rowTypePac: TcxEditorRow;
    rowProj: TcxEditorRow;
    rowUrg: TcxEditorRow;
    rowOpl: TcxEditorRow;
    rowKem: TcxEditorRow;
    rowOtdel: TcxEditorRow;
    cxSplitter1: TcxSplitter;
    cxSplitter2: TcxSplitter;
    paMain: TPanel;
    cxGr: TcxGrid;
    VIEW: TcxGridTableView;
    VIEW_FK_ID: TcxGridColumn;
    VIEW_PACID: TcxGridColumn;
    VIEW_FD_NAZ: TcxGridColumn;
    VIEW_FD_RUN: TcxGridColumn;
    VIEW_NUMMK: TcxGridColumn;
    VIEW_PACFIO: TcxGridColumn;
    VIEW_NAMEISSL: TcxGridColumn;
    VIEW_VRACH: TcxGridColumn;
    VIEW_PEPLID: TcxGridColumn;
    cxGrLevel1: TcxGridLevel;
    dxBarDockControl1: TdxBarDockControl;
    VIEW_ROJDPAC: TcxGridColumn;
    VIEW_ADR: TcxGridColumn;
    VIEW_VIDOPL: TcxGridColumn;
    memDatavidopl: TStringField;
    bbInfo: TdxBarButton;
    aInfo: TAction;
    VIEW_AGE: TcxGridColumn;
    VIEW_SEX: TcxGridColumn;
    memDataage: TStringField;
    memDatasex: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N3Click(Sender: TObject);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure odsKabBeforeOpen(DataSet: TDataSet);
    procedure odsSotrBeforeOpen(DataSet: TDataSet);
    procedure aRefreshExecute(Sender: TObject);
    procedure oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer;
      const ErrorMessage: string);
    procedure oqThreadThreadFinished(Sender: TOracleQuery);
    procedure oqThreadThreadRecord(Sender: TOracleQuery);
    procedure aOpenMKExecute(Sender: TObject);
    procedure rowPacEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowIsslEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowKemEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowOtdelEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowTypePacEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowProjEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowUrgEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowOplEditPropertiesEditValueChanged(Sender: TObject);
    procedure aProtocolExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure frListGetValue(const VarName: string; var Value: Variant);
    procedure aInfoExecute(Sender: TObject);
  private
    nRec : Integer;
    pAPPSOTRID, pOTDELID, get_vipnaz, get_labvip, get_nevip : Integer;
    sSotrFIO, sSpec, DateSys_4Rep, sParams : string;
    dDateBegin, dDateEnd : TDateTime;
    StartTime: TTime;
    bbr : Boolean;
    arFIO:array of string;
    function RestoreApplication(AAppCaption:string):Boolean;
    procedure BmpToJPEG(pFNAME1,pFNAME2:String);
    function PhysicalResolveFileType(AStream: TStream): Integer;
    { Private declarations }
  public
    dicom_show_3d : Boolean;
    sCompanyName_4Rep, sOtdelName_4Rep, get_digsig, MedotradeSign, get_dbname,
    get_dicom_port, get_dicom_ip, get_dicom_called, sCallingAET, get_dicom_show : string;
    is_digsig : Boolean;
    pSOTRID : Integer;
    LIST_PATANAT_PROSMOTR_HTML : integer;
    Russian : HKL;
    sPath : string; // путь к лаунчеру мультивокса
    procedure DoShowForm;
    procedure DoResultHTML(nNazID : Integer; nPacID : Integer);
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

const
  sqlList = ' select fk_id, '+#13+
            '        fk_pacid, '+#13+
            '        fk_nazsosid, '+#13+
            '        asu.get_fullpath_sha(tnazis.fk_smid) as nameissl, '+#13+
            '        fd_run, to_char(fd_run, ''dd.mm.yyyy hh24:mi'') as fd_run_str, '+#13+
            '        fd_naz, to_char(fd_naz, ''dd.mm.yyyy hh24:mi'') as fd_naz_str, '+#13+
            '        asu.pkg_regist_pacfunc.get_pac_fio(fk_pacid) as fiopac, '+#13+
            '        asu.pkg_regist_pacfunc.get_pac_bith(fk_pacid) as rojdpac, '+#13+
            '        asu.get_adr_by_peplid_level_street(asu.get_peplid(fk_pacid), 1) as adres, '+#13+
            '        asu.do_vrachfio(tnazis.fk_ispolid) as ispolfio, '+#13+
            '        asu.get_ib(tnazis.fk_pacid) as nummk, '+#13+
            '        asu.get_peplid(fk_pacid) as peplid, '+#13+
            '        asu.get_napravlen(fk_pacid, fk_id) as otdel, '+#13+
            '        decode(asu.is_ambulance(tnazis.fk_pacid), '+#13+
            '               1, (select t4.fc_name '+#13+
            '                     from asu.tambtalon_naz t1, asu.tambtalon t2, asu.tinsurdocs t3, asu.ttypedoc t4 '+#13+
            '                    where t1.fk_nazid = tnazis.fk_id '+#13+
            '                      and t1.fk_talonid = t2.fk_id '+#13+
            '                      and t2.fk_insuranceid = t3.fk_id '+#13+
            '                      and t3.fk_typedocid = t4.fk_id), '+#13+
            '               0, (select t3.fc_name '+#13+
            '                     from asu.tpac_insurance t1, asu.tinsurdocs t2, asu.ttypedoc t3 '+#13+
            '                    where t1.fk_pacid = tnazis.fk_id '+#13+
            '                      and t1.fk_insurdocid = t2.fk_id '+#13+
            '                      and t2.fk_typedocid = t3.fk_id)) as vid_opl, '+#13+
            '        asu.pkg_regist_pacfunc.GET_PAC_AGE_DATE(fk_pacid,fd_naz) age,'+#13+
            '        asu.pkg_regist_pacfunc.GET_PAC_SEX(fk_pacid) sex'+#13+
            '   from asu.tnazis '+#13+
            '  where fd_run >= :pdate1 '+#13+
            '    and fd_run <= :pdate2 '+#13+
            '    and fk_smid in (select distinct fk_smid '+#13+
            '                      from asu.tnazvrach '+#13+
            '                     where fk_sotrid = :psotrid) ';

implementation
uses fWait, fSearch, fSetIssl, fKem, fSetOtdel, fPreview, uPrintDocument, fPacInfoDiagnost;
{$R *.dfm}

procedure TfrmMain.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.aInfoExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmPacInfoDiagnost, frmPacInfoDiagnost);
  try
    frmPacInfoDiagnost.DoShowPacInfo(VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_PACID.Index],
                                     VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_PEPLID.Index],
                                     VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_VRACH.Index]);
    frmPacInfoDiagnost.ShowModal;
  finally
    frmPacInfoDiagnost.Free;
  end;
end;

procedure TfrmMain.aOpenMKExecute(Sender: TObject);
var AppProcID : Integer;
begin
  try
    if RestoreApplication(VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_PACFIO.Index]) then
      Exit;
    SetLength(arFIO,Length(arFIO)+1);
    arFIO[Length(frmMain.arFIO)-1]:=VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_PACFIO.Index];
    aOpenMK.Enabled := False;
    Application.ProcessMessages;
    Screen.Cursor := crSQLWait;
    tmrCheckApplication.Enabled:=True;

    AppProcID := AppStart('IBRazdel.exe', IntToStr(VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_PACID.Index])+' '+IntToStr(-1)+' '+IntToStr(-1));
    if AppProcID = -1 then ShowMessage('Ошибка запуска приложения');
    ShowWait(VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_PACID.Index], True);
  finally
    aOpenMK.Enabled:=True;
    Screen.Cursor := crDefault;
  end;
end;

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
  if rowKab.Properties.Value <> -1 then
    sParams := sParams + 'Кабинет: '+odsKab.FieldByName('FC_NAME').AsString+'; ';
  if rowVrach.Properties.Value <> -1 then
    sParams := sParams + 'Врач: '+odsSotr.FieldByName('FC_NAME').AsString+'; ';
  if rowPac.Tag <> -1 then
    sParams := sParams + 'Пациент: '+rowPac.Properties.Value+'; ';
  if VarToStr(rowSex.Properties.Value) <> '' then
    sParams := sParams + 'Пол пациента: '+rowSex.Properties.Value+'; ';
  if rowIssl.Tag <> -1 then
    sParams := sParams + 'Исследование: '+rowIssl.Properties.Value+'; ';
  if VarToStr(rowTypePac.Properties.Value) <> '' then
    sParams := sParams + 'Тип пациента: '+rowTypePac.Properties.Value+'; ';
  if (rowProj.Properties.Value <> -1) and (VarToStr(rowProj.Properties.Value) <> '') then
    sParams := sParams + 'Проживает: '+odsRegPrin.FieldByName('FC_NAME').AsString+'; ';
  if (rowUrg.Properties.Value <> -1) and (VarToStr(rowUrg.Properties.Value) <> '') then
    sParams := sParams + 'Срочность: '+odsTypeNaz.FieldByName('FC_NAME').AsString+'; ';
  if (rowOpl.Properties.Value <> -1) and (VarToStr(rowOpl.Properties.Value) <> '') then
    sParams := sParams + 'Способ оплаты: '+odsVidOplat.FieldByName('FC_NAME').AsString+'; ';
  if rowKem.Tag <> -1 then
    sParams := sParams + 'Направившее учреждение: '+rowKem.Properties.Value+'; ';
  if rowOtdel.Tag <> -1 then
    sParams := sParams + 'Направившее отделение: '+rowOtdel.Properties.Value+'; ';
  if sParams = ' Параметры: ' then
    sParams := '';
  frList.ShowReport;
end;

procedure TfrmMain.aProtocolExecute(Sender: TObject);
begin
  DoResultHTML(VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_FK_ID.Index], VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_PACID.Index]); // формируем в HTML
end;

procedure TfrmMain.aRefreshExecute(Sender: TObject);
begin
  cxGr.SetFocus;
  aRefresh.Enabled := False;
  aPrint.Enabled := False;
  aProtocol.Enabled := False;
  aOpenMK.Enabled := False;
  aInfo.Enabled := False;

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

  oqThread.DeleteVariables;
  oqThread.SQL.Text := sqlList;

//-->> 1. Статус исследования
  oqThread.SQL.Add(' and fk_nazsosid = :pfk_nazsosid ');
  oqThread.DeclareAndSet('pfk_nazsosid', otInteger, rowStatus.Properties.Value);
//-->> 2. Кабинет
  if rowKab.Properties.Value <> -1 then
    begin
      oqThread.SQL.Add(' and fk_roomid = :pfk_roomid ');
      oqThread.DeclareAndSet('pfk_roomid', otInteger, rowKab.Properties.Value);
    end;
//-->> 3. Врач-исполнитель
  if rowVrach.Properties.Value <> -1 then
    begin
      oqThread.SQL.Add(' and fk_ispolid = :pfk_ispolid ');
      oqThread.DeclareAndSet('pfk_ispolid', otInteger, rowVrach.Properties.Value);
    end;
//-->> 4. Пациент
  if rowPac.Tag <> -1 then
    begin
      oqThread.SQL.Add(' and asu.get_peplid(fk_pacid) = :pfk_pacid ');
      oqThread.DeclareAndSet('pfk_pacid', otInteger, rowPac.Tag);
    end;
//-->> 5. Пол пациента
  if VarToStr(rowSex.Properties.Value) <> '' then
    begin
      oqThread.SQL.Add(' and asu.pkg_regist_pacfunc.get_pac_sexid(fk_pacid) = :pfk_sexid ');
      if rowSex.Properties.Value = 'Мужчины' then
        oqThread.DeclareAndSet('pfk_sexid', otInteger, 1);
      if rowSex.Properties.Value = 'Женщины' then
        oqThread.DeclareAndSet('pfk_sexid', otInteger, 0);
    end;
//-->> 6. Тип пациента
  if VarToStr(rowTypePac.Properties.Value) <> '' then
    begin
      oqThread.SQL.Add(' and asu.is_ambulance(fk_pacid) = :pfk_typepac ');
      if rowTypePac.Properties.Value = 'стационарный' then
        oqThread.DeclareAndSet('pfk_typepac', otInteger, 0);
      if rowTypePac.Properties.Value = 'амбулаторный' then
        oqThread.DeclareAndSet('pfk_typepac', otInteger, 1);
    end;
//-->> 7. Срочность
  if (rowUrg.Properties.Value <> -1) and (VarToStr(rowUrg.Properties.Value) <> '') then
    begin
      oqThread.SQL.Add(' and fk_naztypeid = :pfk_naztypeid ');
      oqThread.DeclareAndSet('pfk_naztypeid', otInteger, rowUrg.Properties.Value);
    end;
//-->> 9. Проживает
  if (rowProj.Properties.Value <> -1) and (VarToStr(rowProj.Properties.Value) <> '') then
    begin
      oqThread.SQL.Add(' and exists (select 1 from asu.tib where fk_pacid = tnazis.fk_pacid and fk_smid = :pfk_smid2) ');
      oqThread.DeclareAndSet('pfk_smid2', otInteger, rowProj.Properties.Value);
    end;
//-->> 10. Вид оплаты
  if (rowOpl.Properties.Value <> -1) and (VarToStr(rowOpl.Properties.Value) <> '') then
    begin
      oqThread.SQL.Add(' and (exists (select 1 from asu.tinsurdocs ii, asu.tpac_insurance pi, asu.tkarta kk '+#13+
                       '               where ii.fk_id = pi.fk_insurdocid and kk.fk_id = tnazis.fk_pacid '+#13+
                       '                 and ii.fk_typedocid = :pTypeDocID '+#13+
                       '                 and pi.fk_pacid = kk.fk_id) '+#13+
                       '     or exists '+#13+
                       '     (select 1 from asu.tambtalon a, asu.tambtalon_naz an, asu.tinsurdocs ii '+#13+
                       '       where an.fk_nazid = tnazis.fk_id '+#13+
                       '         and an.fk_talonid = a.fk_id '+#13+
                       '         and ii.fk_typedocid = :pTypeDocID '+#13+
                       '         and a.fk_insuranceid = ii.fk_id)) ');
      oqThread.DeclareAndSet('pTypeDocID', otInteger, rowOpl.Properties.Value);
    end;
//-->> 11. Исследование
  if rowIssl.Tag <> -1 then
    begin
      oqThread.SQL.Add(' and fk_smid = :pfk_smid4 ');
      oqThread.DeclareAndSet('pfk_smid4', otInteger, rowIssl.Tag);
    end;
//-->> 13. Направившее учреждение
  if rowKem.Tag <> -1 then
    begin
      oqThread.SQL.Add(' and exists (select 1 from asu.tib where fk_pacid = tnazis.fk_id and fk_smid = :pfk_smid6) ');
      oqThread.DeclareAndSet('pfk_smid6', otString, rowKem.Tag);
    end;
//-->> 14. Направившее отделение
  if rowOtdel.Tag <> -1 then
    begin
      oqThread.SQL.Add(' and asu.get_vrachfcotdel(tnazis.fk_vrachid) = :pfc_otdel ');
      oqThread.DeclareAndSet('pfc_otdel', otString, rowOtdel.Properties.Value);
    end;

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
  oqThread.DeclareAndSet('psotrid', otInteger, pSOTRID);
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

procedure TfrmMain.BmpToJPEG(pFNAME1, pFNAME2: String);
var
  JPEG: TJPEGImage;
  Bitmap: TBitmap;
  Image1: TImage;
  lStream: TFileStream;
begin
  lStream:=TFileStream.Create(ExtractFilePath(paramstr(0))+pFNAME2,fmOpenRead);
  try
    if PhysicalResolveFileType(lStream)=1 then
      begin
        lStream.Free;
        JPEG := TJPEGImage.Create;
        Bitmap := TBitmap.Create;
        Image1:=timage.create(nil);
        try
          Bitmap.LoadFromFile(ExtractFilePath(paramstr(0))+pFNAME2);
          JPEG.Assign(Bitmap);
          Image1.Picture.Assign(JPEG);
          Image1.Picture.SaveToFile(ExtractFilePath(paramstr(0))+pFNAME1);
        finally
          Image1.free;
          JPEG.Free;
          Bitmap.Free;
        end;
      end
      else
          lStream.Free;
  except
    lStream.Free;
  end;
end;

procedure TfrmMain.DoResultHTML(nNazID, nPacID: Integer);
var oq : TOracleDataSet;
    ods : TOracleDataSet;
    LOB : TLOBLocator;
    IDRes : Integer;
    RegSave, RegLoad : TRegIniFile;
begin
  Application.CreateForm(TfrmPreview, frmPreview);
  RegLoad := TRegIniFile.Create;
  ods := TOracleDataSet.Create(nil);
  oq := TOracleDataSet.Create(nil);
  lob := TLOBLocator.Create(os, otCLOB);
  try
    RegLoad.RootKey := HKEY_CURRENT_USER;
    RegLoad.OpenKey('\Software\Softmaster\Print\ID_VRACH'+IntToStr(pSotrID), True);
    frmPreview.bbFormat.ItemIndex := RegLoad.ReadInteger('\Software\Softmaster\Print\ID_VRACH'+IntToStr(pSOTRID), 'RazmerList', 0);
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FK_ID FROM asu.VRES WHERE FK_NAZID = :pfk_nazid ';
    ods.DeclareAndSet('pfk_nazid', otInteger, nNazID);
    ods.Open;
    IDRes := ods.FieldByName('FK_ID').AsInteger;
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' SELECT THTMLIMAGES.FC_NAME||''.JPG'' SFILENAME, THTMLIMAGES.FB_BLOB '+#13+
                    '   FROM ASU.TRICHVIEWDATA, ASU.THTMLIMAGES '+#13+
                    '  WHERE TRICHVIEWDATA.FK_PACID = :pfk_pacid '+#13+
                    '    AND THTMLIMAGES.FK_RICHVIEW = TRICHVIEWDATA.FK_ID ';
    ods.DeclareAndSet('pfk_pacid', otInteger, nNazID);
    ods.Open;
    if ods.RecordCount > 0 then
      begin
        while not ods.Eof do
          begin
            TBlobField(ods.FieldByName('FB_BLOB')).SaveToFile(ExtractFilePath(paramstr(0))+ods.FieldByName('SFILENAME').AsString);
            BmpToJPEG(ods.FieldByName('SFILENAME').AsString, ods.FieldByName('SFILENAME').AsString);
            ods.Next;
          end;
      end;

    oq.Session:=os;
    oq.Cursor := crSQLWait;
    oq.DeclareVariable('html', otCLOB);
    oq.SetComplexVariable('html', LOB);
    oq.SQL.Add(' begin ');
    oq.SQL.Add('  dbms_lob.createtemporary(:html, True, dbms_lob.SESSION); ');
    oq.SQL.Add('  dbms_lob.WRITE(:html,1,1,'' ''); ');
    oq.SQL.Add('  :html := asu.GET_HTM_OSM_KOLYA('+IntToStr(IDRes)+', :pBase); ');
    oq.SQL.Add(' end; ');
    oq.DeclareAndSet('pBase', otString, get_dbname);
    oq.Open;

    lob := TLOBLocator(oq.GetComplexVariable('html'));
    lob.SaveToFile(ExtractFilePath(paramstr(0))+inttostr(nPacID) +'print.htm');
    frmPreview.wb.Navigate(ExtractFilePath(paramstr(0))+inttostr(nPacID) +'print.htm');
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
          RegSave.WriteInteger('\Software\Softmaster\Print\ID_VRACH'+IntToStr(pSotrID), 'RazmerList', frmPreview.bbFormat.ItemIndex);
        except
        end;
        RegSave.Free;
        DoPrintDocument(ExtractFilePath(paramstr(0))+inttostr(nPacID) +'print.htm', frmPreview.bbFormat.ItemIndex);
        try
          DeleteFile(ExtractFilePath(paramstr(0))+inttostr(nPacID) +'print.htm');
          ods.First;
          while not ods.Eof do
            begin
              DeleteFile(ExtractFilePath(paramstr(0))+ods.FieldByName('SFILENAME').AsString);
              ods.Next;
            end;
        except
        end;
      end else
      begin
        try
          DeleteFile(ExtractFilePath(paramstr(0))+inttostr(nPacID) +'print.htm');
          ods.First;
          while not ods.Eof do
            begin
              DeleteFile(ExtractFilePath(paramstr(0))+ods.FieldByName('SFILENAME').AsString);
              ods.Next;
            end;
        except
        end;
      end;
  finally
    RegLoad.Free;
    ods.Free;
    oq.Free;
    lob.Free;
    frmPreview.Free;
  end;
end;

procedure TfrmMain.DoShowForm;
var ods : TOracleDataSet;
    Ver : TJclFileVersionInfo;
begin
  rowPac.Tag := -1;
  rowIssl.Tag := -1;
  rowKem.Tag := -1;
  rowOtdel.Tag := -1;
  ods := TOracleDataSet.Create(nil);
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY'') AS DATESYS, '+#13+
                    '        FK_SOTRID, '+#13+
                    '        ASU.DO_VRACHFIO(FK_SOTRID) AS VRACHFIO, asu.get_vipnaz, '+#13+
                    '        (SELECT FC_NAME '+#13+
                    '           FROM ASU.TOTDEL '+#13+
                    '          WHERE FK_ID = (SELECT FK_OTDID FROM ASU.TSOTR WHERE FK_ID = TAPPSOTR.FK_SOTRID)) AS OTDELNAME '+#13+
                    '   FROM LOGIN.TAPPSOTR WHERE FL_DEL <> 1 AND FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, StrToInt(paramstr(1)));
    ods.Open;
    rowStatus.Properties.Value := ods.FieldByName('get_vipnaz').AsInteger;
    pAPPSOTRID := StrToInt(paramstr(1));
    pSOTRID := ods.FieldByName('FK_SOTRID').AsInteger;
    frmMain.Caption := 'Диагностика - архив ('+Ver.FileVersion+')'+'. Пользователь: '+ods.FieldByName('VRACHFIO').AsString;
    rowPeriodFrom.Properties.Value := ods.FieldByName('DATESYS').AsVariant;
    rowPeriodTo.Properties.Value := ods.FieldByName('DATESYS').AsVariant;
    sOtdelName_4Rep := ods.FieldByName('OTDELNAME').AsString;
    sSotrFIO := ods.FieldByName('VRACHFIO').AsString;
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT TSOTR.FK_OTDELID, TS_SPRAV.FC_NAME '+#13+
                    '   FROM ASU.TSOTR, ASU.TS_SPRAV '+#13+
                    '  WHERE TSOTR.FK_SPRAVID = TS_SPRAV.FK_ID AND TSOTR.FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pSOTRID);
    ods.Open;
    pOTDELID := ods.FieldByName('FK_OTDELID').AsInteger;
    sSpec := ods.FieldByName('FC_NAME').AsString;
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' select asu.pkg_smini.readstring(''CONFIG'', ''S_FULLNAME'', '''') as companyname, '+#13+
                    '        asu.get_vipnaz, asu.get_labvip, asu.get_nevip, '+#13+
                    '        asu.pkg_smini.readstring(''CONFIG'', ''DB_NAME'', ''H'') as db_name, '+#13+
                    '        (select fc_value from asu.tsmini where fc_section = ''CONFIG'' and fc_key = ''USE_DIGITSUBSCRIBE'') as digsig '+#13+
                    '   from dual ';
    ods.Open;
    sCompanyName_4Rep := ods.FieldByName('companyname').AsString;
    get_vipnaz := ods.FieldByName('get_vipnaz').AsInteger;
    get_labvip := ods.FieldByName('get_labvip').AsInteger;
    get_nevip := ods.FieldByName('get_nevip').AsInteger;
    get_dbname := ods.FieldByName('db_name').AsString;
    get_digsig := ods.FieldByName('digsig').AsString;
//-- tsmini
    dicom_show_3d := True; // по умолчанию НЕ включаем 3D
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' select fc_value, fc_key from asu.tsmini where fc_section = ''XRAY'' order by fk_id ';
    ods.Open;
    ods.First;
    while not ods.Eof do
      begin
        if ods.FieldByName('fc_key').AsString = 'SHOW_DICOM' then
          begin
            if ods.FieldByName('fc_value').AsString = '' then
              get_dicom_show := '0'
            else
              get_dicom_show := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'DICOM_PORT' then
          begin
            get_dicom_port := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'DICOM_IP' then
          begin
            get_dicom_ip := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'DICOM_CALLED_AE' then
          begin
            get_dicom_called := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'DICOM_SHOW_3D' then // Показывать кнопку "Включить 3D"
          begin
            if ods.FieldByName('fc_value').AsString = '-1' then // обратная логика если True, то не показываем 3D
              dicom_show_3d := False
            else
              dicom_show_3d := True;
          end;
        ods.Next;
      end;
//--- "заряжаем" датасеты
    if odsMain.Active = False then
      odsMain.Open;
    if odsKab.Active = False then
      odsKab.Open;
    if odsSotr.Active = False then
      odsSotr.Open;
    if odsTypeNaz.Active = False then
      odsTypeNaz.Open;
    if odsRegPrin.Active = False then
      odsRegPrin.Open;
    if odsVidOplat.Active = False then
      odsVidOplat.Open;
    VIEW.StoreToRegistry('\SoftWare\SoftMaster\Diagnostic_Archive\fMain\ViewVrach_' + IntToStr(pSOTRID)+'Default', True, [], 'VIEW');
    VIEW.RestoreFromRegistry('\SoftWare\SoftMaster\Diagnostic_Archive\fMain\ViewVrach_' + IntToStr(pSOTRID), False, False, [], 'VIEW');
    MedotradeSign := ReadMedotradeSign;
  finally
    ods.Free;
    Ver.Free;
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
  VIEW.StoreToRegistry('\SoftWare\SoftMaster\Diagnostic_Archive\fMain\ViewVrach_' + IntToStr(pSOTRID), TRUE, [], 'VIEW');
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  LIST_PATANAT_PROSMOTR_HTML := -1;
  GetSession(os, 'ASU');
  Russian:=LoadKeyboardLayout('00000419', 0);
  aPrint.Enabled := False;
  aProtocol.Enabled := False;
  aOpenMk.Enabled := False;
  aInfo.Enabled := False;
  Self.WindowState := wsMaximized;
end;

procedure TfrmMain.frListGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := sOtdelName_4Rep;
  if VarName = 'DATESYS' then Value := DateSys_4Rep;
  if VarName = 'SOTR' then Value := sSotrFIO;
  if VarName = 'DATE1' then Value := rowPeriodFrom.Properties.Value;
  if VarName = 'DATE2' then Value := rowPeriodTo.Properties.Value;
  if VarName = 'PARAMS' then Value := sParams;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
  if VarName = 'VSEGO' then Value := oqThread.RowCount;
  if rowStatus.Properties.Value = get_vipnaz then
    begin
      if VarName = 'STATUS' then Value := 'Выполнено';
    end;
  if rowStatus.Properties.Value = get_nevip then
    begin
      if VarName = 'STATUS' then Value := 'Не вып.';
    end;
  if rowStatus.Properties.Value = get_labvip then
    begin
      if VarName = 'STATUS' then Value := 'Вып. лаборантом';
    end;
  if rowStatus.Properties.Value = -100 then
    begin
      if VarName = 'STATUS' then Value := 'Вып. + вып. лаборантом';
    end;
end;

procedure TfrmMain.N3Click(Sender: TObject);
begin
  VIEW.RestoreFromRegistry('\SoftWare\SoftMaster\Diagnostic_Archive\fMain\ViewVrach_' + IntToStr(pSOTRID)+'Default', False, False, [], 'VIEW');
end;

procedure TfrmMain.odsKabBeforeOpen(DataSet: TDataSet);
begin
  odsKab.SetVariable('PSOTR', pSOTRID);
end;

procedure TfrmMain.odsSotrBeforeOpen(DataSet: TDataSet);
begin
  odsSotr.SetVariable('PFK_OTDELID', pOTDELID);
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
  aRefresh.Enabled := True;
  aPrint.Enabled := oqThread.RowCount <> 0;
  aProtocol.Enabled := oqThread.RowCount <> 0;
  aOpenMK.Enabled := oqThread.RowCount <> 0;
  aInfo.Enabled := oqThread.RowCount <> 0;
  Animator1.Animate := False;
  if bbr then
    cxLabel3.Caption := 'При выполнении запроса произошла ошибка!'
  else
    cxLabel3.Caption := 'Запрос к Базе Данных выполнился успешно!';
end;

procedure TfrmMain.oqThreadThreadRecord(Sender: TOracleQuery);
begin
//  VIEW.BeginUpdate;
  VIEW.DataController.RecordCount := VIEW.DataController.RecordCount + 1;
  with VIEW.DataController do
  begin
    try
      Values[VIEW.DataController.RecordCount - 1, VIEW_FK_ID.Index] := Sender.Field('FK_ID');
      Values[VIEW.DataController.RecordCount - 1, VIEW_PACID.Index] := Sender.Field('FK_PACID');
      Values[VIEW.DataController.RecordCount - 1, VIEW_FD_NAZ.Index] := Sender.Field('FD_NAZ');
      Values[VIEW.DataController.RecordCount - 1, VIEW_FD_RUN.Index] := Sender.Field('FD_RUN');
      Values[VIEW.DataController.RecordCount - 1, VIEW_PACFIO.Index] := Sender.Field('FIOPAC');
      Values[VIEW.DataController.RecordCount - 1, VIEW_NAMEISSL.Index] := Sender.Field('NAMEISSL');
      Values[VIEW.DataController.RecordCount - 1, VIEW_VRACH.Index] := Sender.Field('ISPOLFIO');
      Values[VIEW.DataController.RecordCount - 1, VIEW_NUMMK.Index] := Sender.Field('NUMMK');
      Values[VIEW.DataController.RecordCount - 1, VIEW_PEPLID.Index] := Sender.Field('PEPLID');
      Values[VIEW.DataController.RecordCount - 1, VIEW_ROJDPAC.Index] := Sender.Field('rojdpac');
      Values[VIEW.DataController.RecordCount - 1, VIEW_ADR.Index] := Sender.Field('adres');
      Values[VIEW.DataController.RecordCount - 1, VIEW_VIDOPL.Index] := Sender.Field('vid_opl');
      Values[VIEW.DataController.RecordCount - 1, VIEW_AGE.Index] := Sender.Field('age');
      Values[VIEW.DataController.RecordCount - 1, VIEW_SEX.Index] := Sender.Field('sex');

      memData.Insert;
      memData.FieldByName('FK_ID').AsString := Sender.Field('FK_ID');
      memData.FieldByName('FK_PACID').AsString := Sender.Field('FK_PACID');
      memData.FieldByName('FD_NAZ_STR').AsString := Sender.Field('FD_NAZ_STR');
      memData.FieldByName('FD_RUN_STR').AsString := Sender.Field('FD_RUN_STR');
      memData.FieldByName('FIOPAC').AsString := Sender.Field('FIOPAC');
      memData.FieldByName('NAMEISSL').AsString := Sender.Field('NAMEISSL');
      memData.FieldByName('VRACHFIO').AsString := Sender.Field('ISPOLFIO'); // исполнитель
      memData.FieldByName('NUMMK').AsString := Sender.Field('NUMMK');
      memData.FieldByName('PEPLID').AsString := Sender.Field('PEPLID');
      memData.FieldByName('rojdpac').AsDateTime := Sender.Field('rojdpac');
      memData.FieldByName('adr').AsString := Sender.Field('adres');
      memData.FieldByName('vidopl').AsString := Sender.Field('vid_opl');    
      memData.FieldByName('age').AsString := Sender.Field('age');
      memData.FieldByName('sex').AsString := Sender.Field('sex');
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
  if nRec > 100 then
    begin
      nRec := 0;
      VIEW.EndUpdate;
      VIEW.BeginUpdate;
    end;
end;

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
      ((p[0] = #77) and (p[1] = #77) and (p[2] = #42) and (p[3] = #0)) then
      Result := 2;
    {jpg format}
    if (p[6] = #74) and (p[7] = #70) and (p[8] = #73) and (p[9] = #70) then
      Result := 3;
    {png format}
    if (p[0] = #137) and (p[1] = #80) and (p[2] = #78) and (p[3] = #71) and
      (p[4] = #13) and (p[5] = #10) and (p[6] = #26) and (p[7] = #10) then
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

procedure TfrmMain.rowIsslEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetIssl, frmSetIssl);
      try
        frmSetIssl.ShowModal;
        if frmSetIssl.ModalResult = mrOk then
          begin
            rowIssl.Tag := frmSetIssl.odsList.FieldByName('FK_SMID').AsInteger;
            TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(vGr.InplaceEditor).EditingText := frmSetIssl.odsList.FieldByName('fc_name').AsString;
            TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsHideCursor;
          end;
      finally
        frmSetIssl.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      frmSetIssl.Tag := -1;
      TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsNormal;
      TcxButtonEdit(vGr.InplaceEditor).EditingText := ' ';
      TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsHideCursor;
    end;
end;

procedure TfrmMain.rowKemEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetKem, frmSetKem);
      try
        frmSetKem.ShowModal;
        if frmSetKem.ModalResult = mrOk then
          begin
            rowKem.Tag := frmSetKem.ods.FieldByName('fk_id').AsInteger;
            TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(vGr.InplaceEditor).EditingText := frmSetKem.ods.FieldByName('fc_name').AsString;
            TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsHideCursor;
            if rowKem.Tag = -1 then
              begin
                rowKem.Properties.ImageIndex := -1;
                rowKem.Styles.Content := stNormal;
                rowKem.Styles.Header := stNormal;
              end else
              begin
                rowKem.Properties.ImageIndex := 4;
                rowKem.Styles.Content := stBold;
                rowKem.Styles.Header := stBold;
              end;
          end;
      finally
        frmSetKem.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      rowKem.Tag := -1;
      TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsNormal;
      TcxButtonEdit(vGr.InplaceEditor).EditingText := ' ';
      TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsHideCursor;
      rowKem.Properties.ImageIndex := -1;
      rowKem.Styles.Content := stNormal;
      rowKem.Styles.Header := stNormal;
    end;
end;

procedure TfrmMain.rowOplEditPropertiesEditValueChanged(Sender: TObject);
begin
  if rowOpl.Properties.Value = -1 then
    begin
      rowOpl.Properties.ImageIndex := -1;
      rowOpl.Styles.Content := stNormal;
      rowOpl.Styles.Header := stNormal;
    end else
    begin
      rowOpl.Properties.ImageIndex := 4;
      rowOpl.Styles.Content := stBold;
      rowOpl.Styles.Header := stBold;
    end;
end;

procedure TfrmMain.rowOtdelEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetOtdel, frmSetOtdel);
      try
        frmSetOtdel.ShowModal;
        if frmSetOtdel.ModalResult = mrOk then
          begin
            rowOtdel.Tag := frmSetOtdel.ods.FieldByName('fk_id').AsInteger;
            TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(vGr.InplaceEditor).EditingText := frmSetOtdel.ods.FieldByName('fc_name').AsString;
            TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsHideCursor;
            if rowOtdel.Tag = -1 then
              begin
                rowOtdel.Properties.ImageIndex := -1;
                rowOtdel.Styles.Content := stNormal;
                rowOtdel.Styles.Header := stNormal;
              end else
              begin
                rowOtdel.Properties.ImageIndex := 4;
                rowOtdel.Styles.Content := stBold;
                rowOtdel.Styles.Header := stBold;
              end;
          end;
      finally
        frmSetOtdel.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      rowOtdel.Tag := -1;
      TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsNormal;
      TcxButtonEdit(vGr.InplaceEditor).EditingText := ' ';
      TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsHideCursor;
      rowOtdel.Properties.ImageIndex := -1;
      rowOtdel.Styles.Content := stNormal;
      rowOtdel.Styles.Header := stNormal;
    end;
end;

procedure TfrmMain.rowPacEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSearch, frmSearch);
      try
        frmSearch.ShowModal;
        if frmSearch.ModalResult = mrOk then
          begin
            rowPac.Tag := frmSearch.odsPac.FieldByName('FK_ID').AsInteger;
            TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(vGr.InplaceEditor).EditingText := frmSearch.odsPac.FieldByName('FIO').AsString;
            TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsHideCursor;
          end;
      finally
        frmSearch.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      rowPac.Tag := -1;
      TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsNormal;
      TcxButtonEdit(vGr.InplaceEditor).EditingText := ' ';
      TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsHideCursor;
    end;
end;

procedure TfrmMain.rowProjEditPropertiesEditValueChanged(Sender: TObject);
begin
  if rowProj.Properties.Value = -1 then
    begin
      rowProj.Properties.ImageIndex := -1;
      rowProj.Styles.Content := stNormal;
      rowProj.Styles.Header := stNormal;
    end else
    begin
      rowProj.Properties.ImageIndex := 4;
      rowProj.Styles.Content := stBold;
      rowProj.Styles.Header := stBold;
    end;
end;

procedure TfrmMain.rowTypePacEditPropertiesEditValueChanged(Sender: TObject);
begin
  if rowTypePac.Properties.Value = null then
    begin
      rowTypePac.Properties.ImageIndex := -1;
      rowTypePac.Styles.Content := stNormal;
      rowTypePac.Styles.Header := stNormal;
    end else
    begin
      rowTypePac.Properties.ImageIndex := 4;
      rowTypePac.Styles.Content := stBold;
      rowTypePac.Styles.Header := stBold;
    end;
end;

procedure TfrmMain.rowUrgEditPropertiesEditValueChanged(Sender: TObject);
begin
  if rowUrg.Properties.Value = -1 then
    begin
      rowUrg.Properties.ImageIndex := -1;
      rowUrg.Styles.Content := stNormal;
      rowUrg.Styles.Header := stNormal;
    end else
    begin
      rowUrg.Properties.ImageIndex := 4;
      rowUrg.Styles.Content := stBold;
      rowUrg.Styles.Header := stBold;
    end;
end;

end.
