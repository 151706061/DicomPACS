unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SmMainAPI, Oracle, OracleData, Registry, JclFileUtils, uGlobalConst,
  dxSkinsCore, dxSkinsdxBarPainter, dxBar, cxClasses,
  ImgList, ActnList, cxStyles, dxSkinscxPCPainter, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxGridBandedTableView, cxGridDBBandedTableView, jvDBUtils,
  cxDBLookupComboBox, Menus, cxCheckBox, cxCalendar, cxLabel, cxBarEditItem, cxGridExportLink,
  cxSplitter, ExtCtrls, cxContainer, dxSkinOffice2007Green;

type
  TfrmMain = class(TForm)
    os: TOracleSession;
    BM: TdxBarManager;
    BMBar1: TdxBar;
    dxBarDockControl1: TdxBarDockControl;
    bbAdd: TdxBarButton;
    bbClose: TdxBarButton;
    al: TActionList;
    IL: TImageList;
    aClose: TAction;
    aAdd: TAction;
    grMainLevel1: TcxGridLevel;
    grMain: TcxGrid;
    tvMain: TcxGridDBBandedTableView;
    tvMain_PervPac: TcxGridDBBandedColumn;
    tvMain_Date: TcxGridDBBandedColumn;
    tvMain_NumCamera: TcxGridDBBandedColumn;
    tvMain_FIO: TcxGridDBBandedColumn;
    tvMain_Adres: TcxGridDBBandedColumn;
    tvMain_OtdelIB: TcxGridDBBandedColumn;
    tvMain_Ds: TcxGridDBBandedColumn;
    tvMain_Mkb: TcxGridDBBandedColumn;
    tvMain_MedOtvod: TcxGridDBBandedColumn;
    tvMain_ComprSpeed: TcxGridDBBandedColumn;
    tvMain_ComprTime: TcxGridDBBandedColumn;
    tvMain_IzoPress: TcxGridDBBandedColumn;
    tvMain_IzoTime: TcxGridDBBandedColumn;
    tvMain_DeComprSpeed: TcxGridDBBandedColumn;
    tvMain_DeComprTime: TcxGridDBBandedColumn;
    tvMain_Osob: TcxGridDBBandedColumn;
    tvMain_TypeNaz: TcxGridDBBandedColumn;
    odsMain: TOracleDataSet;
    dsMain: TDataSource;
    bbRefresh: TdxBarButton;
    aRefresh: TAction;
    odsNumCam: TOracleDataSet;
    dsNumCam: TDataSource;
    odsCompr_Speed: TOracleDataSet;
    dsCompr_Speed: TDataSource;
    odsCompr_Time: TOracleDataSet;
    dsCompr_Time: TDataSource;
    odsIzo_Press: TOracleDataSet;
    dsIzo_Press: TDataSource;
    odsIzo_Time: TOracleDataSet;
    dsIzo_Time: TDataSource;
    odsDecompr_Speed: TOracleDataSet;
    dsDecompr_Speed: TDataSource;
    odsDecompr_Time: TOracleDataSet;
    dsDecompr_Time: TDataSource;
    pmTV: TPopupMenu;
    N2: TMenuItem;
    odsNazType: TOracleDataSet;
    dsNazType: TDataSource;
    aSetRemark: TAction;
    aSetDs: TAction;
    aEdit: TAction;
    aDel: TAction;
    bbEdit: TdxBarButton;
    bbDel: TdxBarButton;
    bbParams: TdxBarButton;
    aParams: TAction;
    bbBack: TdxBarButton;
    bbForward: TdxBarButton;
    lbPeriod: TcxBarEditItem;
    stRep: TcxStyleRepository;
    stBold: TcxStyle;
    aBack: TAction;
    aForward: TAction;
    aXLS: TAction;
    Excel1: TMenuItem;
    N1: TMenuItem;
    sdPopUp: TSaveDialog;
    paCnt: TPanel;
    cxSplitter1: TcxSplitter;
    cxLabel1: TcxLabel;
    lbCntNaz: TcxLabel;
    cxLabel3: TcxLabel;
    lbCntPac: TcxLabel;
    odsCntPac: TOracleDataSet;
    aSetOtdel: TAction;
    nCopy: TMenuItem;
    N4: TMenuItem;
    tvMain_Pressure: TcxGridDBBandedColumn;
    odsPressure: TOracleDataSet;
    dsPressure: TDataSource;
    nEditDate: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure osAfterLogOn(Sender: TOracleSession);
    procedure aCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aAddExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure odsMainApplyRecord(Sender: TOracleDataSet; Action: Char;
      var Applied: Boolean; var NewRowId: string);
    procedure N2Click(Sender: TObject);
    procedure tvMainCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure aSetRemarkExecute(Sender: TObject);
    procedure aSetDsExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure aParamsExecute(Sender: TObject);
    procedure odsMainBeforeOpen(DataSet: TDataSet);
    procedure odsMainAfterOpen(DataSet: TDataSet);
    procedure aBackExecute(Sender: TObject);
    procedure aForwardExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure aSetOtdelExecute(Sender: TObject);
    procedure nCopyClick(Sender: TObject);
    procedure nEditDateClick(Sender: TObject);
  private
    pAPPSOTRID : Integer;
    MedotradeSign : string;
    sSotrFIO, sCompanyName_4Rep, sOtdelName_4Rep : string;
    { Private declarations }
  public
    sDate1, sDate2 : string;
    nNum1, nNum2 : Integer;
    russian : HKL;
    pSOTRID : Integer;
    procedure DoShowForm;
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation
uses fAdd, fSetRemark, fSetDs, fEdit, fParams, fSetOtdel, fEditDate;
{$R *.dfm}

procedure TfrmMain.aAddExecute(Sender: TObject);
var oq : TOracleQuery;
    idNaz : Integer;
begin
  Application.CreateForm(TfrmAdd, frmAdd);
  try
    frmAdd.ShowModal;
    if frmAdd.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil); // !!! статус исследования сразу "вып." ???
        try
          oq.Session := os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' insert into asu.vnaz(fk_smid, fd_naz, fd_run, fk_ispolid, fk_vrachid, fk_nazsosid, fk_pacid, fc_name, fk_naztypeid) '+#13+
                         ' values((select fk_id from asu.tsmid where fc_synonim = ''PROCEDURE_BAROZAL''), sysdate, sysdate, :psotrid, :psotrid, asu.get_vipnaz, :pfk_pacid, (select fc_name from asu.tsmid where fc_synonim = ''PROCEDURE_BAROZAL''), asu.get_nazplan) '+#13+
                         ' returning fk_id into :pfk_id ';
          oq.DeclareAndSet('psotrid', otInteger, pSotrID);
          oq.DeclareAndSet('pfk_pacid', otInteger, frmAdd.odsPac.FieldByName('pacid').AsInteger);
          oq.DeclareVariable('pfk_id', otInteger);
          oq.Execute;
          idNaz := oq.GetVariable('pfk_id');
          oq.DeleteVariables;
          oq.SQL.Text := ' insert into asu.vres(fk_smid, fd_ins, fc_type, fk_vrachid, fk_pacid, fk_nazid, fk_sos) '+#13+
                         ' values((select fk_id from asu.tsmid where fc_synonim = ''PROCEDURE_BAROZAL''), sysdate, ''TEXT'', :pfk_vrachid, :pfk_pacid, :pfk_nazid, asu.get_vipnaz) ';
          oq.DeclareAndSet('pfk_vrachid', otInteger, pSotrID);
          oq.DeclareAndSet('pfk_pacid', otInteger, frmAdd.odsPac.FieldByName('pacid').AsInteger);
          oq.DeclareAndSet('pfk_nazid', otInteger, idNaz);
          oq.Execute;
          oq.DeleteVariables;
          oq.SQL.Text := ' insert into asu.tbarozal(fk_nazid) '+#13+
                         ' values(:pfk_nazid) ';
          oq.DeclareAndSet('pfk_nazid', otInteger, idNaz);
          oq.Execute;
          os.Commit;
          RefreshQuery(odsMain);
          odsMain.Locate('fk_id', idNaz, []);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAdd.Free;
  end;
end;

procedure TfrmMain.aBackExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select add_months(:pdate1, -1) as prevdate1, trunc(add_months(:pdate2, -1)) as prevdate2 from dual ';
    ods.DeclareAndSet('pdate1', otDate, StrToDateTime(sDate1));
    ods.DeclareAndSet('pdate2', otDate, StrToDateTime(sDate2));
    ods.Open;
    sDate1 := DateTimeToStr(ods.FieldByName('prevdate1').AsDateTime);
    sDate2 := DateTimeToStr(ods.FieldByName('prevdate2').AsDateTime);
    lbPeriod.Caption := 'Период: '+sDate1+' - '+DateTimeToStr(ods.FieldByName('prevdate2').AsDateTime);
    RefreshQuery(odsMain);
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.aDelExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  if MessageDlg('Вы собираетесь удалить процедуру и все её параметры!'+#13+#10+'Уверены?', mtConfirmation, [mbYes, mbNo], 0) = idYes then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' delete from asu.vnaz where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_id', otInteger, odsMain.FieldByName('fk_id').AsInteger);
        oq.Execute;
        os.Commit;
        RefreshQuery(odsMain);
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmMain.aEditExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmEdit, frmEdit);
  try
    frmEdit.lbPac.EditValue := odsMain.FieldByName('pacfio').AsString;
    frmEdit.lcbNumCamera.EditValue := odsMain.FieldByName('fn_numcamera').AsInteger;
    frmEdit.lbMKB.Tag := odsMain.FieldByName('fk_smdiagid').AsInteger;
    frmEdit.lbMKB.Caption := odsMain.FieldByName('mkb10').AsString;
    frmEdit.beDs.Text := odsMain.FieldByName('fc_write').AsString;
    frmEdit.beDs.Tag := odsMain.FieldByName('fk_diagid').AsInteger;
    frmEdit.lcbCS.EditValue := odsMain.FieldByName('fn_speedcompr').AsInteger;
    frmEdit.lcbCT.EditValue := odsMain.FieldByName('fn_timecompr').AsInteger;
    frmEdit.lcbIP.EditValue := odsMain.FieldByName('fn_pressureizo').AsInteger;
    frmEdit.lcbIT.EditValue := odsMain.FieldByName('fn_timeizo').AsInteger;
    frmEdit.lcbDS.EditValue := odsMain.FieldByName('fn_speeddecompr').AsInteger;
    frmEdit.lcbDT.EditValue := odsMain.FieldByName('fn_timedecompr').AsInteger;
    frmEdit.memRemark.Text := odsMain.FieldByName('fc_remark').AsString;
    frmEdit.lcbTypeNaz.EditValue := odsMain.FieldByName('fk_naztypeid').AsInteger;
    frmEdit.pPacID := odsMain.FieldByName('fk_pacid').AsInteger;
    frmEdit.ShowModal;
    if frmEdit.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' update asu.tbarozal '+#13+
                         '    set fn_numcamera=:pfn_numcamera, fn_speedcompr=:pfn_speedcompr, fn_timecompr=:pfn_timecompr, '+#13+
                         '        fn_pressureizo=:pfn_pressureizo, fn_timeizo=:pfn_timeizo, fn_speeddecompr=:pfn_speeddecompr, '+#13+
                         '        fn_timedecompr=:pfn_timedecompr, fc_remark=:pfc_remark, fk_diagid=:pfk_diagid, '+#13+
                         '        fk_smdiagid=:pfk_smdiagid, fc_write=:pfc_write '+#13+
                         '  where fk_id = :pfk_id ' ;
          oq.DeclareAndSet('pfn_numcamera', otInteger, frmEdit.lcbNumCamera.EditValue);
          oq.DeclareAndSet('pfn_speedcompr', otInteger, frmEdit.lcbCS.EditValue);
          oq.DeclareAndSet('pfn_timecompr', otInteger, frmEdit.lcbCT.EditValue);
          oq.DeclareAndSet('pfn_pressureizo', otInteger, frmEdit.lcbIP.EditValue);
          oq.DeclareAndSet('pfn_timeizo', otInteger, frmEdit.lcbIT.EditValue);
          oq.DeclareAndSet('pfn_speeddecompr', otInteger, frmEdit.lcbDS.EditValue);
          oq.DeclareAndSet('pfn_timedecompr', otInteger, frmEdit.lcbDT.EditValue);
          oq.DeclareAndSet('pfc_remark', otString, frmEdit.memRemark.Text);
          oq.DeclareAndSet('pfk_diagid', otInteger, frmEdit.beDs.Tag);
          oq.DeclareAndSet('pfk_smdiagid', otInteger, frmEdit.lbMKB.Tag);
          oq.DeclareAndSet('pfc_write', otString, frmEdit.beDs.Text);
          oq.DeclareAndSet('pfk_id', otInteger, odsMain.FieldByName('ParID').AsInteger);
          oq.Execute;
          oq.DeleteVariables;
          oq.SQL.Text := ' update asu.vnaz set fk_naztypeid = :pfk_naztypeid where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfk_naztypeid', otInteger,  frmEdit.lcbTypeNaz.EditValue);
          oq.DeclareAndSet('pfk_id', otInteger, odsMain.FieldByName('fk_id').AsInteger);
          oq.Execute;
          os.Commit;
          RefreshQuery(odsMain);
        finally
          oq.Free;
        end;
      end;
  finally
    frmEdit.Free;
  end;
end;

procedure TfrmMain.aForwardExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select add_months(:pdate1, 1) as prevdate1, trunc(add_months(:pdate2, 1)) as prevdate2 from dual ';
    ods.DeclareAndSet('pdate1', otDate, StrToDateTime(sDate1));
    ods.DeclareAndSet('pdate2', otDate, StrToDateTime(sDate2));
    ods.Open;
    sDate1 := DateTimeToStr(ods.FieldByName('prevdate1').AsDateTime);
    sDate2 := DateTimeToStr(ods.FieldByName('prevdate2').AsDateTime);
    lbPeriod.Caption := 'Период: '+sDate1+' - '+DateTimeToStr(ods.FieldByName('prevdate2').AsDateTime);
    RefreshQuery(odsMain);
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.aParamsExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmParams, frmParams);
  try
    frmParams.seNum1.Properties.OnChange := nil;
    frmParams.seNum1.Value := nNum1;
    frmParams.seNum1.Properties.OnChange := frmParams.seNum1PropertiesChange;
    frmParams.seNum2.Properties.OnChange := nil;
    frmParams.seNum2.Value := nNum2;
    frmParams.seNum2.Properties.OnChange := frmParams.seNum2PropertiesChange;
    frmParams.ShowModal;
    if frmParams.isChange = True then
      RefreshQuery(odsMain);
  finally
    frmParams.Free;
  end;
end;

procedure TfrmMain.aRefreshExecute(Sender: TObject);
begin
  RefreshQuery(odsMain);
end;

procedure TfrmMain.aSetDsExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmSetDs, frmSetDs);
  try
    frmSetDs.odsDs.Close;
    frmSetDs.odsDs.SetVariable('pfk_pacid', odsMain.FieldByName('fk_pacid').AsInteger);
    frmSetDs.odsDs.Open;
    frmSetDs.ShowModal;
    if frmSetDs.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' update asu.tbarozal '+#13+
                         '    set fk_diagid = :pfk_diagid, fc_write = :pfc_write, fk_smdiagid = :pfk_smdiagid '+#13+
                         '  where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfk_diagid', otInteger, frmSetDs.odsDs.FieldByName('fk_id').AsInteger);
          oq.DeclareAndSet('pfc_write', otString, frmSetDs.odsDs.FieldByName('fc_write').AsString);
          oq.DeclareAndSet('pfk_smdiagid', otInteger, frmSetDs.odsDs.FieldByName('fk_smdiagid').AsInteger);
          oq.DeclareAndSet('pfk_id', otInteger, odsMain.FieldByName('ParId').AsInteger);
          oq.Execute;
          os.Commit;
          RefreshQuery(odsMain);
        finally
          oq.Free;
        end;
      end;
  finally
    frmSetDs.Free;
  end;
end;

procedure TfrmMain.aSetOtdelExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  if odsMain.FieldByName('is_amb').AsInteger = 1 then
    begin
      Application.CreateForm(TfrmSetOtdel, frmSetOtdel);
      try
        frmSetOtdel.ShowModal;
        if frmSetOtdel.ModalResult = mrOk then
          begin
            oq := TOracleQuery.Create(nil);
            try
              oq.Session := os;
              oq.Cursor := crSQLWait;
              oq.SQL.Text := ' merge into asu.tib using dual on (fk_pacid=:pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''BAROZAL_OTDEL'')) '+#13+
                             ' when matched then '+#13+
                             '   update set fk_smid = :pfk_smid '+#13+
                             '    where fk_pacid=:pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''BAROZAL_OTDEL'') '+#13+
                             ' when not matched then '+#13+
                             '   insert(fk_smid, fk_smeditid, fk_pacid, fk_vrachid, fd_date) '+#13+
                             '   values(:pfk_smid, (select fk_owner from asu.tsmid where fk_id=:pfk_smid), :pfk_pacid, :pfk_vrachid, sysdate) ';
              oq.DeclareAndSet('pfk_smid', otInteger, frmSetOtdel.lcbOtdel.EditValue);
              oq.DeclareAndSet('pfk_pacid', otInteger, odsMain.FieldByName('fk_id').AsInteger);
              oq.DeclareAndSet('pfk_vrachid', otInteger, pSOTRID);
              oq.Execute;
              os.Commit;
              RefreshQuery(odsMain);
            finally
              oq.Free;
            end;
          end;
      finally
        frmSetOtdel.Free;
      end;
    end;
end;

procedure TfrmMain.aSetRemarkExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmSetRemark, frmSetRemark);
  try
    frmSetRemark.memRemark.Text := odsMain.FieldByName('fc_remark').AsString;
    frmSetRemark.ShowModal;
    if frmSetRemark.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' update asu.tbarozal set fc_remark = :pfc_remark where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfc_remark', otString, frmSetRemark.memRemark.Text);
          oq.DeclareAndSet('pfk_id', otInteger, odsMain.FieldByName('ParId').AsInteger);
          oq.Execute;
          os.Commit;
          RefreshQuery(odsMain);
        finally
          oq.Free;
        end;
      end;
  finally
    frmSetRemark.Free;
  end;
end;

procedure TfrmMain.aXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if tvMain.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, grMain, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, grMain, TRUE, TRUE);
end;

procedure TfrmMain.DoShowForm;
var ods : TOracleDataSet;
    Ver : TJclFileVersionInfo;
begin
  frmMain.Show;
  tvMain.ApplyBestFit;
  if odsMain.Active = False then
    odsMain.Active := True;

  pAPPSOTRID := StrToInt(paramstr(1));
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select tappsotr.fk_sotrid, '+#13+
                    '        tsotr.fc_fam || '' '' || '+#13+
                    '        decode(asu.varcharisnull(tsotr.fc_name), 1, '''', substr(tsotr.fc_name, 0, 1) || ''. '' || '+#13+
                    '        decode (asu.varcharisnull(tsotr.fc_otch), 1, '''', substr(tsotr.fc_otch, 0, 1) || ''. '')) as sotrfio, '+#13+
                    '        asu.pkg_smini.readstring(''CONFIG'', ''S_FULLNAME'', '''') as companyname, '+#13+
                    '        totdel.fc_name as otdelname '+#13+
                    '   from login.tappsotr, asu.tsotr, asu.totdel '+#13+
                    '  where tappsotr.fk_sotrid = tsotr.fk_id '+#13+
                    '    and tsotr.fk_otdelid = totdel.fk_id '+#13+
                    '    and tappsotr.fl_del <> 1 '+#13+
                    '    and tappsotr.fk_id = :pfk_id ';
    ods.DeclareAndSet('PFK_ID', otInteger, pAPPSOTRID);
    ods.Open;
    pSOTRID := ods.FieldByName('FK_SOTRID').AsInteger;
    sSotrFIO := ods.FieldByName('SOTRFIO').AsString;
    sCompanyName_4Rep := ods.FieldByName('COMPANYNAME').AsString;
    sOtdelName_4Rep := ods.FieldByName('OTDELNAME').AsString;
    frmMain.Caption := 'Журнал барозала ('+Ver.FileVersion+'). Пользователь: '+sSotrFIO+'';
    MedotradeSign := ReadMedotradeSign;
    tvMain.StoreToRegistry('\SoftWare\SoftMaster\List_barozal\fMain\tvMainVrach_' + IntToStr(pSOTRID)+'Default', TRUE, [], 'tvMain');
    tvMain.RestoreFromRegistry('\SoftWare\SoftMaster\List_barozal\fMain\tvMainVrach_' + IntToStr(pSOTRID), FALSE, FALSE, [], 'tvMain');
  finally
    ods.Free;
    ver.Free;
  end;
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
  tvMain.StoreToRegistry('\SoftWare\SoftMaster\List_barozal\fMain\tvMainVrach_' + IntToStr(pSOTRID), TRUE, [], 'tvMain');
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var ods : TOracleDataSet;
begin
  GetSession(os, 'ASU');
  russian := LoadKeyboardLayout('00000419', 0);
// -- заряжаем датасеты
  if odsNumCam.Active = False then
    odsNumCam.Active := True;
  if odsCompr_Speed.Active = False then
    odsCompr_Speed.Active := True;
  if odsCompr_Time.Active = False then
    odsCompr_Time.Active := True;
  if odsIzo_Press.Active = False then
    odsIzo_Press.Active := True;
  if odsIzo_Time.Active = False then
    odsIzo_Time.Active := True;
  if odsDecompr_Speed.Active = False then
    odsDecompr_Speed.Active := True;
  if odsDecompr_Time.Active = False then
    odsDecompr_Time.Active := True;
  if odsPressure.Active = False then
    odsPressure.Active := True; 
  if odsNazType.Active = False then
    odsNazType.Active := True;
// -- поднимаем параметры(даты)
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select fc_value from asu.tsmini where fc_section = ''BAROZAL_PARAMS'' and fc_key = ''DATE_BEG'' ';
    ods.Open;
    if ods.FieldByName('fc_value').AsString = '' then
      nNum1 := 1
    else
      nNum1 := StrToInt(ods.FieldByName('fc_value').AsString);
    ods.Close;
    ods.SQL.Text := ' select fc_value from asu.tsmini where fc_section = ''BAROZAL_PARAMS'' and fc_key = ''DATE_END'' ';
    ods.Open;
    if ods.FieldByName('fc_value').AsString = '' then
      nNum2 := 1
    else
      nNum2 := StrToInt(ods.FieldByName('fc_value').AsString);
    ods.Close;
    ods.SQL.Text := ' select to_char(sysdate, ''mm.yyyy'') as datesys, '+#13+
                    '        to_number(to_char(sysdate, ''dd'')) as numday, to_char(sysdate, ''mm'') as nummonth, '+#13+
                    '        to_char(sysdate, ''yyyy'') as numyear, '+#13+
                    '        to_char(trunc(add_months(sysdate, -1)), ''mm'') as prevmonth, '+#13+
                    '        to_char(trunc(add_months(sysdate, -1)), ''yyyy'') as prevyear, '+#13+
                    '        to_char(trunc(add_months(sysdate, 1)), ''mm'') as nextmonth, '+#13+
                    '        to_char(trunc(add_months(sysdate, 1)), ''yyyy'') as nextyear '+#13+
                    '   from dual ';
    ods.Open;
    if ods.FieldByName('numday').AsInteger > nNum1 then
      begin
        sDate1 := IntToStr(nNum1)+'.'+ods.FieldByName('nummonth').AsString+'.'+ods.FieldByName('numyear').AsString;
        sDate2 := IntToStr(nNum2)+'.'+ods.FieldByName('nextmonth').AsString+'.'+ods.FieldByName('nextyear').AsString+' 23:59:59';
        lbPeriod.Caption := 'Период: '+sDate1+' - '+IntToStr(nNum2)+'.'+ods.FieldByName('nextmonth').AsString+'.'+ods.FieldByName('nextyear').AsString;
      end else
      begin
        sDate1 := IntToStr(nNum1)+'.'+ods.FieldByName('prevmonth').AsString+'.'+ods.FieldByName('prevyear').AsString;
        sDate2 := IntToStr(nNum2)+'.'+ods.FieldByName('datesys').AsString+' 23:59:59';
        lbPeriod.Caption := 'Период: '+sDate1+' - '+IntToStr(nNum2)+'.'+ods.FieldByName('datesys').AsString;
      end;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.N2Click(Sender: TObject);
begin
  tvMain.RestoreFromRegistry('\SoftWare\SoftMaster\List_barozal\fMain\tvMainVrach_' + IntToStr(pSOTRID)+'Default', FALSE, FALSE, [], 'tvMain');
end;

procedure TfrmMain.nCopyClick(Sender: TObject);
var oq : TOracleQuery;
    idNaz : Integer;
begin
  if MessageDlg('Вы собираетесь копировать данные '+odsMain.FieldByName('pacfio').AsString+#13+#10+'Продолжить?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      oq := TOracleQuery.Create(nil); // !!! статус исследования сразу "вып." ???
      try
        oq.Session := os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' insert into asu.vnaz(fk_smid, fd_naz, fd_run, fk_ispolid, fk_vrachid, fk_nazsosid, fk_pacid, fc_name, fk_naztypeid) '+#13+
                       ' values(:pfk_smid, sysdate, sysdate, :psotrid, :psotrid, asu.get_vipnaz, :pfk_pacid, :pfc_name, asu.get_nazplan) '+#13+
                       ' returning fk_id into :pfk_id ';
        oq.DeclareAndSet('pfk_smid', otInteger, odsMain.FieldByName('fk_smid').AsInteger);
        oq.DeclareAndSet('psotrid', otInteger, pSotrID);
        oq.DeclareAndSet('pfk_pacid', otInteger, odsMain.FieldByName('fk_pacid').AsInteger);
        oq.DeclareAndSet('pfc_name', otString, odsMain.FieldByName('fc_name').AsString);
        oq.DeclareVariable('pfk_id', otInteger);
        oq.Execute;
        idNaz := oq.GetVariable('pfk_id');
        oq.DeleteVariables;
        oq.SQL.Text := ' insert into asu.vres(fk_smid, fd_ins, fc_type, fk_vrachid, fk_pacid, fk_nazid, fk_sos) '+#13+
                       ' values(:pfk_smid, sysdate, ''TEXT'', :pfk_vrachid, :pfk_pacid, :pfk_nazid, asu.get_vipnaz) ';
        oq.DeclareAndSet('pfk_smid', otInteger, odsMain.FieldByName('fk_smid').AsInteger);
        oq.DeclareAndSet('pfk_vrachid', otInteger, pSotrID);
        oq.DeclareAndSet('pfk_pacid', otInteger, odsMain.FieldByName('fk_pacid').AsInteger);
        oq.DeclareAndSet('pfk_nazid', otInteger, idNaz);
        oq.Execute;
        oq.DeleteVariables;
        oq.SQL.Text := ' insert into asu.tbarozal(fk_nazid, fn_numcamera, fk_diagid, fc_write, fk_smdiagid) '+#13+
                       ' values(:pfk_nazid, :pfn_numcamera, :pfk_diagid, :pfc_write, :pfk_smdiagid) ';
        oq.DeclareAndSet('pfk_nazid', otInteger, idNaz);
        oq.DeclareAndSet('pfn_numcamera', otInteger, odsMain.FieldByName('fn_numcamera').AsInteger);
        oq.DeclareAndSet('pfk_diagid', otInteger, odsMain.FieldByName('fk_diagid').AsInteger);
        oq.DeclareAndSet('pfc_write', otString, odsMain.FieldByName('fc_write').AsString);
        oq.DeclareAndSet('pfk_smdiagid', otInteger, odsMain.FieldByName('fk_smdiagid').AsInteger);
        oq.Execute;
        if odsMain.FieldByName('is_amb').AsInteger = 1 then
          begin
            oq.DeleteVariables;
            oq.SQL.Text := ' insert into asu.tib(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                           ' values(:pfk_pacid, '+#13+
                           '        (select fk_smid from asu.tib where fk_pacid = :nazid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim=''BAROZAL_OTDEL'')), '+#13+
                           '        (select fk_id from asu.tsmid where fc_synonim=''BAROZAL_OTDEL''), :psotrid, sysdate) ';
            oq.DeclareAndSet('pfk_pacid', otInteger, idNaz);
            oq.DeclareAndSet('nazid', otInteger, odsMain.FieldByName('fk_id').AsInteger);
            oq.DeclareAndSet('psotrid', otInteger, pSotrID);
            oq.Execute;
          end;
        os.Commit;
        RefreshQuery(odsMain);
        odsMain.Locate('fk_id', idNaz, []);
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmMain.nEditDateClick(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmEditDate, frmEditDate);
  try
    frmEditDate.deDate.Date := odsMain.FieldByName('fd_run').AsDateTime;
    frmEditDate.ShowModal;
    if frmEditDate.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' update asu.vnaz set fd_run = :pfd_run where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfd_run', otDate, frmEditDate.deDate.Date);
          oq.DeclareAndSet('pfk_id', otInteger, odsMain.FieldByName('fk_id').AsInteger);
          oq.Execute;
          os.Commit;
          RefreshQuery(odsMain);
        finally
          oq.Free;
        end;
      end;
  finally
    frmEditDate.Free;
  end;
end;

procedure TfrmMain.odsMainAfterOpen(DataSet: TDataSet);
begin
  aEdit.Enabled := odsMain.RecordCount <> 0;
  aDel.Enabled := odsMain.RecordCount <> 0;
  nEditDate.Enabled := odsMain.RecordCount <> 0;
  nCopy.Enabled := odsMain.RecordCount <> 0;
  if odsMain.RecordCount > 0 then
    begin
      cxSplitter1.OpenSplitter;
      cxSplitter1.Visible := True;
      lbCntNaz.Caption := IntToStr(odsMain.RecordCount);
      odsCntPac.Close;
      odsCntPac.SetVariable('pdate1', StrToDateTime(sDate1));
      odsCntPac.SetVariable('pdate2', StrToDateTime(sDate2));
      odsCntPac.Open;
      lbCntPac.Caption := IntToStr(odsCntPac.FieldByName('cnt').AsInteger);
    end else
    begin
      cxSplitter1.CloseSplitter;
      cxSplitter1.Visible := False;
    end;
end;

procedure TfrmMain.odsMainApplyRecord(Sender: TOracleDataSet; Action: Char; var Applied: Boolean; var NewRowId: string);
var oq : TOracleQuery;
begin
  case Action of
    'U':
       begin
         if tvMain_PervPac.Focused then // -- первичный пациент
           begin
             oq := TOracleQuery.Create(nil);
             try
               oq.Session := frmMain.os;
               oq.Cursor := crSQLWait;
               oq.SQL.Text := ' update asu.tbarozal set fn_first = :pfn_first where fk_id = :pfk_id ';
               oq.DeclareAndSet('pfn_first', otInteger, tvMain_PervPac.DataBinding.Field.Value);
               oq.DeclareAndSet('pfk_id', otInteger, odsMain.FieldByName('ParID').AsInteger);
               oq.Execute;
               frmMain.os.Commit;
             finally
               oq.Free;
             end;
           end;
         if tvMain_NumCamera.Focused then // -- номер камеры
           begin
             oq := TOracleQuery.Create(nil);
             try
               oq.Session := frmMain.os;
               oq.Cursor := crSQLWait;
               oq.SQL.Text := ' update asu.tbarozal set fn_numcamera = :pfn_numcamera where fk_id = :pfk_id ';
               oq.DeclareAndSet('pfn_numcamera', otInteger, tvMain_NumCamera.DataBinding.Field.Value);
               oq.DeclareAndSet('pfk_id', otInteger, odsMain.FieldByName('ParID').AsInteger);
               oq.Execute;
               frmMain.os.Commit;
             finally
               oq.Free;
             end;
           end;
         if tvMain_ComprSpeed.Focused then // -- Компрессия - скорость
           begin
             oq := TOracleQuery.Create(nil);
             try
               oq.Session := frmMain.os;
               oq.Cursor := crSQLWait;
               oq.SQL.Text := ' update asu.tbarozal set fn_speedcompr = :pfn_speedcompr where fk_id = :pfk_id ';
               oq.DeclareAndSet('pfn_speedcompr', otInteger, tvMain_ComprSpeed.DataBinding.Field.Value);
               oq.DeclareAndSet('pfk_id', otInteger, odsMain.FieldByName('ParID').AsInteger);
               oq.Execute;
               frmMain.os.Commit;
             finally
               oq.Free;
             end;
           end;
         if tvMain_ComprTime.Focused then // -- Компрессия - время
           begin
             oq := TOracleQuery.Create(nil);
             try
               oq.Session := frmMain.os;
               oq.Cursor := crSQLWait;
               oq.SQL.Text := ' update asu.tbarozal set fn_timecompr = :pfn_timecompr where fk_id = :pfk_id ';
               oq.DeclareAndSet('pfn_timecompr', otInteger, tvMain_ComprTime.DataBinding.Field.Value);
               oq.DeclareAndSet('pfk_id', otInteger, odsMain.FieldByName('ParID').AsInteger);
               oq.Execute;
               frmMain.os.Commit;
             finally
               oq.Free;
             end;
           end;
         if tvMain_IzoPress.Focused then // -- Изопрессия - давление
           begin
             oq := TOracleQuery.Create(nil);
             try
               oq.Session := frmMain.os;
               oq.Cursor := crSQLWait;
               oq.SQL.Text := ' update asu.tbarozal set fn_pressureizo = :pfn_pressureizo where fk_id = :pfk_id ';
               oq.DeclareAndSet('pfn_pressureizo', otInteger, tvMain_IzoPress.DataBinding.Field.Value);
               oq.DeclareAndSet('pfk_id', otInteger, odsMain.FieldByName('ParID').AsInteger);
               oq.Execute;
               frmMain.os.Commit;
             finally
               oq.Free;
             end;
           end;
         if tvMain_IzoTime.Focused then // -- Изопрессия - время
           begin
             oq := TOracleQuery.Create(nil);
             try
               oq.Session := frmMain.os;
               oq.Cursor := crSQLWait;
               oq.SQL.Text := ' update asu.tbarozal set fn_timeizo = :pfn_timeizo where fk_id = :pfk_id ';
               oq.DeclareAndSet('pfn_timeizo', otInteger, tvMain_IzoTime.DataBinding.Field.Value);
               oq.DeclareAndSet('pfk_id', otInteger, odsMain.FieldByName('ParID').AsInteger);
               oq.Execute;
               frmMain.os.Commit;
             finally
               oq.Free;
             end;
           end;
         if tvMain_DeComprSpeed.Focused then // -- Декомпрессия - скорость
           begin
             oq := TOracleQuery.Create(nil);
             try
               oq.Session := frmMain.os;
               oq.Cursor := crSQLWait;
               oq.SQL.Text := ' update asu.tbarozal set fn_speeddecompr = :pfn_speeddecompr where fk_id = :pfk_id ';
               oq.DeclareAndSet('pfn_speeddecompr', otInteger, tvMain_DeComprSpeed.DataBinding.Field.Value);
               oq.DeclareAndSet('pfk_id', otInteger, odsMain.FieldByName('ParID').AsInteger);
               oq.Execute;
               frmMain.os.Commit;
             finally
               oq.Free;
             end;
           end;
         if tvMain_DeComprTime.Focused then // -- Декомпрессия - время
           begin
             oq := TOracleQuery.Create(nil);
             try
               oq.Session := frmMain.os;
               oq.Cursor := crSQLWait;
               oq.SQL.Text := ' update asu.tbarozal set fn_timedecompr = :pfn_timedecompr where fk_id = :pfk_id ';
               oq.DeclareAndSet('pfn_timedecompr', otInteger, tvMain_DeComprTime.DataBinding.Field.Value);
               oq.DeclareAndSet('pfk_id', otInteger, odsMain.FieldByName('ParID').AsInteger);
               oq.Execute;
               frmMain.os.Commit;
             finally
               oq.Free;
             end;
           end;
         if tvMain_Pressure.Focused then // -- Давление
           begin
             oq := TOracleQuery.Create(nil);
             try
               oq.Session := frmMain.os;
               oq.Cursor := crSQLWait;
               oq.SQL.Text := ' update asu.tbarozal set fk_pressure = :pfk_pressure where fk_id = :pfk_id ';
               oq.DeclareAndSet('pfk_pressure', otInteger, tvMain_Pressure.DataBinding.Field.Value);
               oq.DeclareAndSet('pfk_id', otInteger, odsMain.FieldByName('ParID').AsInteger);
               oq.Execute;
               frmMain.os.Commit;
             finally
               oq.Free;
             end;
           end;
         if tvMain_TypeNaz.Focused then // -- Тип назначения
           begin
             oq := TOracleQuery.Create(nil);
             try
               oq.Session := frmMain.os;
               oq.Cursor := crSQLWait;
               oq.SQL.Text := ' update asu.vnaz set fk_naztypeid = :pfk_naztypeid where fk_id = :pfk_id ';
               oq.DeclareAndSet('pfk_naztypeid', otInteger, tvMain_TypeNaz.DataBinding.Field.Value);
               oq.DeclareAndSet('pfk_id', otInteger, odsMain.FieldByName('fk_id').AsInteger);
               oq.Execute;
               frmMain.os.Commit;
             finally
               oq.Free;
             end;
           end;
       end;
  end;
  Applied := True;
end;

procedure TfrmMain.odsMainBeforeOpen(DataSet: TDataSet);
begin
  odsMain.SetVariable('pDate1', StrToDateTime(sDate1));
  odsMain.SetVariable('pDate2', StrToDateTime(sDate2));
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

procedure TfrmMain.tvMainCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if tvMain_OtdelIb.Focused then
    begin
      aSetOtdelExecute(nil);
    end;
  if tvMain_Ds.Focused then
    begin
      aSetDsExecute(nil);
    end;
  if tvMain_Osob.Focused then
    begin
      aSetRemarkExecute(nil);
    end;
end;

end.
