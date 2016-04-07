unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsdxBarPainter, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, dxBar, ActnList,
  ImgList, cxClasses, Oracle, SMMainAPI, JclFileUtils, DB, OracleData, uGlobalConst,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxCalendar,
  cxBarEditItem, Menus, jvDBUtils, dxBarExtItems, cxContainer, cxLabel, ExtCtrls,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxTimeEdit, uDigitalSignature,
  frxClass, frxDBSet, cxGridExportLink, StdCtrls;

type
  TSetSignFnc = procedure (aSignFnc: TSignFnc); stdcall;
  TEditPlugin_Personal = function(HostObjHandle: THandle;
                                  App: THandle;
                                  nPacID: Integer;
                                  nSotrID: Integer;
                                  nSpecID: Integer;
                                  nSecID: Integer = -1;
                                  nSmidID: Integer = -1;
                                  nNazID: Integer = -1;
                                  bReadOnly: Boolean = false;
																	ObjID: Integer=-1;
																	hMainForm : THandle=0) : LongInt; stdcall;
  TfrmMain = class(TForm)
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    BMBar1: TdxBar;
    AL: TActionList;
    IL: TImageList;
    aExit: TAction;
    os: TOracleSession;
    dsMain: TDataSource;
    odsMain: TOracleDataSet;
    odsInfo: TOracleDataSet;
    pmTv: TPopupMenu;
    N1: TMenuItem;
    aAdd: TAction;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    aRefresh: TAction;
    odsMainFK_ID: TFloatField;
    odsMainFN_NUM: TFloatField;
    odsMainFD_DATE: TDateTimeField;
    odsMainFK_SOTRID: TFloatField;
    odsMainFK_MSID: TFloatField;
    odsMainFIOSOTR: TStringField;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    paDate: TPanel;
    cxLabel1: TcxLabel;
    deDate: TcxDateEdit;
    aEdit: TAction;
    aDel: TAction;
    aProt: TAction;
    aPrint: TAction;
    odsMainFD_DATE_END: TDateTimeField;
    odsMainFIOMS: TStringField;
    odsMainFK_URGID: TFloatField;
    odsConst: TOracleDataSet;
    odsMainFIOPAC: TStringField;
    odsMainMETODICS: TStringField;
    oqDelJur: TOracleQuery;
    odsMainFK_PACID: TFloatField;
    pmBarPrint: TdxBarPopupMenu;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    aPrintProt: TAction;
    Panel1: TPanel;
    grList: TcxGrid;
    tvList: TcxGridDBTableView;
    VNUM: TcxGridDBColumn;
    vFIO: TcxGridDBColumn;
    vTime: TcxGridDBColumn;
    VSOTR: TcxGridDBColumn;
    vTimeEnd: TcxGridDBColumn;
    vMs: TcxGridDBColumn;
    vExtra: TcxGridDBColumn;
    vMetodics: TcxGridDBColumn;
    grListLevel1: TcxGridLevel;
    repList: TfrxReport;
    dbdsList: TfrxDBDataset;
    odsMainBEGIN_TIME: TStringField;
    odsMainEND_TIME: TStringField;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    aOpenMK: TAction;
    N6: TMenuItem;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aXLS: TAction;
    sdPopUp: TSaveDialog;
    N7: TMenuItem;
    Web1: TMenuItem;
    XML1: TMenuItem;
    XLS1: TMenuItem;
    tmrCheckApplication: TTimer;
    aInfo: TAction;
    N8: TMenuItem;
    odsIssl: TOracleDataSet;
    odsIsslFK_ID: TFloatField;
    odsIsslFK_SMID: TFloatField;
    odsIsslFK_PACID: TFloatField;
    odsIsslSMNAME: TStringField;
    odsIsslFK_NAZSOSID: TFloatField;
    odsIsslFL_OUT: TIntegerField;
    odsIsslFL_DEL: TFloatField;
    odsMainFP_TEK_COC: TFloatField;
    paCalendar: TPanel;
    p1: TPanel;
    p2: TPanel;
    p3: TPanel;
    p4: TPanel;
    p5: TPanel;
    p6: TPanel;
    p7: TPanel;
    blWeeks: TButton;
    blMon: TButton;
    brWeeks: TButton;
    brMon: TButton;
    pMonth: TPanel;
    dxBarControlContainerItem2: TdxBarControlContainerItem;
    bbAdd: TdxBarLargeButton;
    bbEdit: TdxBarLargeButton;
    bbDel: TdxBarLargeButton;
    bbRefresh: TdxBarLargeButton;
    bbFill: TdxBarLargeButton;
    bbPrint: TdxBarLargeButton;
    bbExit: TdxBarLargeButton;
    procedure aExitExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure osAfterLogOn(Sender: TOracleSession);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N1Click(Sender: TObject);
    procedure odsMainBeforeOpen(DataSet: TDataSet);
    procedure aAddExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure deDatePropertiesEditValueChanged(Sender: TObject);
    procedure deDate1Change(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure aProtExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure odsMainAfterOpen(DataSet: TDataSet);
    procedure tvListCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure aPrintProtExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure repListGetValue(const VarName: string; var Value: Variant);
    procedure aOpenMKExecute(Sender: TObject);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure tmrCheckApplicationTimer(Sender: TObject);
    procedure aInfoExecute(Sender: TObject);
    procedure tvListCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure blMonClick(Sender: TObject);
    procedure blWeeksClick(Sender: TObject);
    procedure brMonClick(Sender: TObject);
    procedure brWeeksClick(Sender: TObject);
    procedure p1Click(Sender: TObject);
    procedure p2Click(Sender: TObject);
    procedure p3Click(Sender: TObject);
    procedure p4Click(Sender: TObject);
    procedure p5Click(Sender: TObject);
    procedure p6Click(Sender: TObject);
    procedure p7Click(Sender: TObject);
  private
//    AppHandle : Integer;
    sSysDate4Rep : String;
    pAPPSOTRID : Integer;
    HandleDLL : THandle;
    EditPlugin_Personal : TEditPlugin_Personal;
    SetSignFnc : TSetSignFnc;
    gDigSignature: TDigitalSignature;
    arFIO:array of string;
    procedure DoInsertNaz(pName : String; pSmid : Integer; pNazID : Integer; pJurID : Integer);
    procedure DoInsertUpdateNaz(pName : String; pSmid : Integer; pNazID : Integer; pJurID : Integer);
    procedure DoInfo;
    procedure DoDelMetodic(pOut, pNazid : Integer);
    procedure DoDelOneMetodic(pSos, pOut, pNazid : Integer);
    procedure DoLoadPriem(nSmidID, nID : Integer);
    function RestoreApplication(AAppCaption:string):Boolean;
//    function WinExecAndWait32(FileName: string; Visibility: integer): integer;
    procedure DateChange;
    { Private declarations }
  public
    sCompanyName_4Rep, sOtdelName_4Rep, MedotradeSign : String;
    Russian : HKL;
    pSOTRID : Integer;
    get_vipnaz, get_nazextra : Integer;
    get_digsig : string;
    is_digsig : Boolean;
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation
uses fAdd, fKag, fACNK, fKag1, fDelManyMetodics, fSet, fWait, fPacInfoRhmdl, uGlobal;
{$R *.dfm}

procedure TfrmMain.aAddExecute(Sender: TObject);
var oq : TOracleQuery;
     i : Integer;
begin
  Application.CreateForm(TfrmAdd, frmAdd);
  try
    frmAdd.EditMode := False;
    frmAdd.rowSotr.Properties.Value := pSOTRID;
    frmAdd.DoShowForm;
    frmAdd.ShowModal;
    if frmAdd.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' insert into asu.tjurrhmdl(fn_num, fd_date, fk_sotrid, fk_msid, fk_urgid, fd_date_end, fk_pacid) '+#13+
                         ' values(:pfn_num, :pfd_date, :pfk_sotrid, :pfk_msid, :pfk_urgid, :pfd_date_end, :pfk_pacid) '+#13+
                         ' returning fk_id into :pfk_id ';
          oq.DeclareAndSet('pfn_num', otInteger, frmAdd.seNum.Value);
          oq.DeclareAndSet('pfd_date', otDate, StrToDateTime(DateToStr(frmAdd.deDate.Date)+' '+ FormatDateTime('hh:nn', frmAdd.teTime.Time)));
          oq.DeclareAndSet('pfk_sotrid', otInteger, frmAdd.rowSotr.Properties.Value);
          oq.DeclareAndSet('pfk_msid', otInteger, frmAdd.rowMS.Properties.Value);
          oq.DeclareAndSet('pfk_urgid', otInteger, frmAdd.lcbUrg.EditValue);
          oq.DeclareAndSet('pfd_date_end', otDate, StrToDateTime(DateToStr(frmAdd.deDate.Date)+' '+ FormatDateTime('hh:nn', frmAdd.teTimeEnd.Time)));
          oq.DeclareAndSet('pfk_pacid', otInteger, frmAdd.lbPac.Tag);
          oq.DeclareVariable('pfk_id', otInteger);
          oq.Execute;
          frmAdd.tvIsslTable.DataController.GotoFirst; 
          for i := 0 to frmAdd.tvIsslTable.DataController.RecordCount - 1 do
            begin
              DoInsertNaz(frmAdd.tvIsslTable.DataController.Values[frmAdd.tvIsslTable.DataController.FocusedRecordIndex, frmAdd.vNAME.Index],
                          frmAdd.tvIsslTable.DataController.Values[frmAdd.tvIsslTable.DataController.FocusedRecordIndex, frmAdd.vSmidID.Index],
                          frmAdd.tvIsslTable.DataController.Values[frmAdd.tvIsslTable.DataController.FocusedRecordIndex, frmAdd.vNazID.Index],
                          oq.GetVariable('pfk_id'));
              frmAdd.tvIsslTable.DataController.GotoNext;
            end;
          os.Commit;
          RefreshQuery(odsMain);
          odsMain.Locate('fk_id', oq.GetVariable('pfk_id'), []);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAdd.Free;
  end;
end;

procedure TfrmMain.aDelExecute(Sender: TObject);
var ods : TOracleDataSet;
    isVyp : Boolean;
begin
  if odsMain.FieldByName('fp_tek_coc').AsInteger = 3 then // если пациент выписан
    begin
      MessageDlg('Пациент выписан!'+#13+#10+'Невозможно удалить запись журнала!', mtInformation, [mbOK], 0);
      exit;
    end;

  isVyp := False;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select t1.fk_nazid, t1.fl_out, t2.fk_nazsosid '+#13+
                    '   from asu.trhmdl_vnaz t1, asu.vnaz t2'+#13+
                    '  where t1.fk_rhmdlid = :pfk_rhmdlid '+#13+
                    '    and t1.fk_nazid = t2.fk_id ';
    ods.DeclareAndSet('pfk_rhmdlid', otInteger, odsMain.FieldByName('fk_id').AsInteger);
    ods.Open;
    if ods.RecordCount > 1 then
      begin
        ods.First;
        while not ods.Eof do
          begin
            if ods.FieldByName('fk_nazsosid').AsInteger = get_vipnaz then
              isVyp := True;
            ods.Next;
          end;
        if isVyp = False then // среди методик нет ни одной выполненной => удаляем методики, удаляем запись журнала
          begin
            if Application.MessageBox('Вы действительно хотите удалить запись?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
              begin
                ods.First;
                while not ods.Eof do
                  begin
                    DoDelMetodic(ods.FieldByName('fl_out').AsInteger,
                                 ods.FieldByName('fk_nazid').AsInteger);
                    ods.Next;
                  end;
                oqDelJur.SetVariable('pfk_id', odsMain.FieldByName('fk_id').AsInteger);
                oqDelJur.Execute; // удаление записи журнала
                os.Commit;
                RefreshQuery(odsMain);
              end;
          end else
          begin
            Application.CreateForm(TfrmDelManyMetodics, frmDelManyMetodics); // открываем форму с подтверждением
            try
              frmDelManyMetodics.ShowModal;
              if frmDelManyMetodics.ModalResult = mrOk then
                begin
                  frmDelManyMetodics.odsIssl.First;
                  while not frmDelManyMetodics.odsIssl.Eof do
                    begin
                      if frmDelManyMetodics.odsIssl.FieldByName('fk_nazsosid').AsInteger <> get_vipnaz then
                        begin
                          DoDelMetodic(frmDelManyMetodics.odsIssl.FieldByName('fl_out').AsInteger,
                                       frmDelManyMetodics.odsIssl.FieldByName('fk_nazid').AsInteger);
                        end;
                      frmDelManyMetodics.odsIssl.Next;
                    end;
                  os.Commit;
                  RefreshQuery(odsMain);
                end;
            finally
              frmDelManyMetodics.Free;
            end;
          end;
      end else
      begin
        DoDelOneMetodic(ods.FieldByName('fk_nazsosid').AsInteger,
                        ods.FieldByName('fl_out').AsInteger,
                        ods.FieldByName('fk_nazid').AsInteger);
      end;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.aEditExecute(Sender: TObject);
var oq, oqDel : TOracleQuery;
    i : Integer;
begin
  if odsMain.FieldByName('fp_tek_coc').AsInteger = 3 then // если пациент выписан
    begin
      MessageDlg('Пациент выписан!'+#13+#10+'Запись журнала запрещена к редактированию! Возможен только просмотр!', mtInformation, [mbOK], 0);
    end;
  Application.CreateForm(TfrmAdd, frmAdd);
  try
    frmAdd.EditMode := True;
    frmAdd.Caption := 'Изменить запись в журнале';
    frmAdd.aEdit.Visible := True;
    frmAdd.aEdit.Enabled := True;
    frmAdd.seNum.Value := odsMain.FieldByName('fn_num').AsInteger;
    frmAdd.deDate.Date := odsMain.FieldByName('fd_date').AsDateTime;
    frmAdd.teTime.Time := odsMain.FieldByName('fd_date').AsDateTime;
    frmAdd.teTimeEnd.Time := odsMain.FieldByName('fd_date_end').AsDateTime;
    frmAdd.lcbUrg.EditValue := odsMain.FieldByName('fk_urgid').AsInteger;
    frmAdd.rowSotr.Properties.Value := odsMain.FieldByName('fk_sotrid').AsInteger;
    frmAdd.rowMs.Properties.Value := odsMain.FieldByName('fk_msid').AsInteger;
    DoInfo;
    frmAdd.aFind.Visible := False;
    frmAdd.aFind.Enabled := False;
    frmAdd.aChoose.Visible := False;
    frmAdd.aChoose.Enabled := False;
    frmAdd.Panel6.Visible := False;
    frmAdd.DoDisable(odsMain.FieldByName('fp_tek_coc').AsInteger);
    frmAdd.ShowModal;
    if frmAdd.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' update asu.tjurrhmdl '+#13+
                         '    set fn_num = :pfn_num, fd_date = :pfd_date, fk_sotrid = :pfk_sotrid, '+#13+
                         '        fk_msid = :pfk_msid, fk_urgid = :pfk_urgid, fd_date_end = :pfd_date_end '+#13+
                         '  where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfn_num', otInteger, frmAdd.seNum.Value);
          oq.DeclareAndSet('pfd_date', otDate, StrToDateTime(DateToStr(frmAdd.deDate.Date)+' '+ FormatDateTime('hh:nn', frmAdd.teTime.Time)));
          oq.DeclareAndSet('pfk_sotrid', otInteger, frmAdd.rowSotr.Properties.Value);
          oq.DeclareAndSet('pfk_msid', otInteger, frmAdd.rowMs.Properties.Value);
          oq.DeclareAndSet('pfk_urgid', otInteger, frmAdd.lcbUrg.EditValue);
          oq.DeclareAndSet('pfd_date_end', otDate, StrToDateTime(DateToStr(frmAdd.deDate.Date)+' '+ FormatDateTime('hh:nn', frmAdd.teTimeEnd.Time)));
          oq.DeclareAndSet('pfk_id', otInteger, odsMain.FieldByName('fk_id').AsInteger);
          oq.Execute;
// изменяем или добавляем исследования в записи журнала
          frmAdd.tvIsslTable.DataController.GotoFirst;
          for i := 0 to frmAdd.tvIsslTable.DataController.RecordCount - 1 do
            begin
              DoInsertUpdateNaz(frmAdd.tvIsslTable.DataController.Values[frmAdd.tvIsslTable.DataController.FocusedRecordIndex, frmAdd.vNAME.Index],
                                frmAdd.tvIsslTable.DataController.Values[frmAdd.tvIsslTable.DataController.FocusedRecordIndex, frmAdd.vSmidID.Index],
                                frmAdd.tvIsslTable.DataController.Values[frmAdd.tvIsslTable.DataController.FocusedRecordIndex, frmAdd.vNazID.Index],
                                oq.GetVariable('pfk_id'));
              frmAdd.tvIsslTable.DataController.GotoNext;
            end;
// удаляем исследования из записи если было удаление
          if frmAdd.isDel = True then
            begin
              odsIssl.First;
              while not odsIssl.Eof do
                begin
                  if odsIssl.FieldByName('fl_del').AsInteger = 1 then
                    begin
                      if odsIssl.FieldByName('fl_out').AsInteger = 1 then
                        begin
                          oqDel := TOracleQuery.Create(nil);
                          try
                            oqDel.Session := os;
                            oqDel.SQL.Text := ' delete from asu.trhmdl_vnaz where fk_nazid = :pfk_nazid ';
                            oqDel.DeclareAndSet('pfk_nazid', otInteger, odsIssl.FieldByName('fk_id').AsInteger);
                            oqDel.Execute;
                          finally
                            oqDel.Free;
                          end;
                        end else
                        begin
                          oqDel := TOracleQuery.Create(nil);
                          try
                            oqDel.Session := os;
                            oqDel.SQL.Text := ' delete from asu.trhmdl_vnaz where fk_nazid = :pfk_nazid ';
                            oqDel.DeclareAndSet('pfk_nazid', otInteger, odsIssl.FieldByName('fk_id').AsInteger);
                            oqDel.Execute;
                            oqDel.DeleteVariables;
                            oqDel.SQL.Text := ' delete from asu.vnaz where fk_id = :pfk_id ';
                            oqDel.DeclareAndSet('pfk_id', otInteger, odsIssl.FieldByName('fk_id').AsInteger);
                            oqDel.Execute;
                          finally
                            oqDel.Free;
                          end;
                        end;
                    end;
                  odsIssl.Next;
                end;
            end;
          os.Commit;
          RefreshQuery(odsMain);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAdd.Free;
  end;
end;

procedure TfrmMain.aExitExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.aInfoExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  Application.CreateForm(TfrmPacInfoRhmdl, frmPacInfoRhmdl);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select asu.get_peplid(:pfk_pacid) as peplid from dual ';
    ods.DeclareAndSet('pfk_pacid', otInteger, odsMain.FieldByName('fk_pacid').AsInteger);
    ods.Open;
    frmPacInfoRhmdl.DoShowPacInfo(odsMain.FieldByName('fk_pacid').AsInteger,
                                  ods.FieldByName('peplid').AsInteger);
    frmPacInfoRhmdl.ShowModal;
  finally
    ods.Free;
    frmPacInfoRhmdl.Free;
  end;
end;

procedure TfrmMain.aOpenMKExecute(Sender: TObject);
var AppProcID : Integer;
begin
  if RestoreApplication(odsMain.FieldByName('fiopac').AsString) then Exit;
  SetLength(arFIO,Length(arFIO)+1);
  arFIO[Length(arFIO)-1]:=odsMain.FieldByName('fiopac').AsString;
  aOpenMK.Enabled:=False;
  Application.ProcessMessages;
  tmrCheckApplication.Enabled:=True;

//  AppHandle := WinExecAndWait32(PChar('IBRazdel.exe '+IntToStr(pAPPSOTRID)+' '+IntToStr(odsMain.FieldByName('fk_pacid').AsInteger)+' '+IntToStr(-1)+' '+IntToStr(-1)), 1);
//  GetInputMapAppFromApp(AppHandle);

  AppProcID := AppStart(ExtractFilePath(paramstr(0))+'IBRazdel.exe', IntToStr(odsMain.FieldByName('fk_pacid').AsInteger)+' '+IntToStr(-1)+' '+IntToStr(-1));
  if AppProcID = -1 then ShowMessage('Ошибка запуска приложения');
  ShowWait(odsMain.FieldByName('fk_pacid').AsInteger,True);
end;

procedure TfrmMain.aProtExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select t1.fk_rhmdlid, t1.fk_nazid, t2.fk_smid, t2.fk_id, '+#13+
                    '        (select fc_synonim from asu.tsmid where fk_id = t2.fk_smid) as fc_synonim '+#13+
                    '   from asu.trhmdl_vnaz t1, asu.vnaz t2 '+#13+
                    '  where t1.fk_rhmdlid = :pfk_rhmdlid '+#13+
                    '    and t1.fk_nazid = t2.fk_id ';
    ods.DeclareAndSet('pfk_rhmdlid', otInteger, odsMain.FieldByName('fk_id').AsInteger);
    ods.Open;
    if ods.RecordCount > 1 then
      begin
        Application.CreateForm(TfrmSet, frmSet);
        try
          frmSet.DoShowForm(odsMain.FieldByName('fk_id').AsInteger);
          frmSet.ShowModal;
          if frmSet.ModalResult = mrOK then
            begin
              if frmSet.odsList.FieldByName('fc_synonim').AsString = 'RHMDL_ACNK' then // АСНК
                begin
                  Application.CreateForm(TfrmACNK, frmACNK);
                  frmACNK.DoShowForm(odsMain.FieldByName('fk_pacid').AsInteger,
                                     frmSet.odsList.FieldByName('fk_nazid').AsInteger,
                                     frmSet.odsList.FieldByName('fk_smid').AsInteger);
                  frmACNK.DoDisable(odsMain.FieldByName('fp_tek_coc').AsInteger);
                  frmACNK.lbPac.Caption := odsMain.FieldByName('fiopac').AsString;
                  try
                    frmACNK.ShowModal;
                  finally
                    frmACNK.Free;
                  end;
                end;
              if frmSet.odsList.FieldByName('fc_synonim').AsString = 'RHMDL_KAG' then  // КАГ
                begin
                  Application.CreateForm(TfrmKag, frmKag);
                  frmKag.DoShowForm(odsMain.FieldByName('fk_pacid').AsInteger,
                                    frmSet.odsList.FieldByName('fk_nazid').AsInteger,
                                    frmSet.odsList.FieldByName('fk_smid').AsInteger);
                  frmKag.DoDisable(odsMain.FieldByName('fp_tek_coc').AsInteger);
                  frmKag.lbPac.Caption := odsMain.FieldByName('fiopac').AsString;
                  try
                    frmKag.ShowModal;
                  finally
                    frmKag.Free;
                  end;
                end;
              if frmSet.odsList.FieldByName('fc_synonim').AsString = '' then
                begin
                  DoLoadPriem(frmSet.odsList.FieldByName('fk_smid').AsInteger, frmSet.odsList.FieldByName('fk_nazid').AsInteger);
                end;
            end;
        finally
          frmSet.Free;
        end;
      end else // если 1 исследование в записи
      begin
        if ods.FieldByName('fc_synonim').AsString = 'RHMDL_ACNK' then // АСНК
          begin
            Application.CreateForm(TfrmACNK, frmACNK);
            frmACNK.DoShowForm(odsMain.FieldByName('fk_pacid').AsInteger,
                               ods.FieldByName('fk_nazid').AsInteger,
                               ods.FieldByName('fk_smid').AsInteger);
            frmACNK.DoDisable(odsMain.FieldByName('fp_tek_coc').AsInteger);
            frmACNK.lbPac.Caption := odsMain.FieldByName('fiopac').AsString;
            try
              frmACNK.ShowModal;
            finally
              frmACNK.Free;
            end;
          end;
        if ods.FieldByName('fc_synonim').AsString = 'RHMDL_KAG' then // КАГ
          begin
            Application.CreateForm(TfrmKag, frmKag);
            frmKag.DoShowForm(odsMain.FieldByName('fk_pacid').AsInteger,
                              ods.FieldByName('fk_nazid').AsInteger,
                              ods.FieldByName('fk_smid').AsInteger);
            frmKag.DoDisable(odsMain.FieldByName('fp_tek_coc').AsInteger);
            frmKag.lbPac.Caption := odsMain.FieldByName('fiopac').AsString;
            try
              frmKag.ShowModal;
            finally
              frmKag.Free;
            end;
          end;
        if ods.FieldByName('fc_synonim').AsString = '' then
          begin
            DoLoadPriem(ods.FieldByName('fk_smid').AsInteger, ods.FieldByName('fk_id').AsInteger);
          end;
      end;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.aPrintExecute(Sender: TObject);
var ods : TOracleDataSet;
     id : Integer;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Cursor := crSQLWait;
    ods.Session := os;
    ods.SQL.Text := ' select to_char(sysdate, ''dd.mm.yyyy hh24:mi'') as datesys from dual ';
    ods.Open;
    sSysDate4Rep := ods.FieldByName('datesys').AsString;
    id := odsMain.FieldByName('fk_id').AsInteger;
    repList.ShowReport;
    odsMain.Locate('fk_id', id, []);
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.aPrintProtExecute(Sender: TObject);
begin
//
end;

procedure TfrmMain.aRefreshExecute(Sender: TObject);
var id : Integer;
begin
  id := odsMain.FieldByName('fk_id').AsInteger;
  odsMain.Close;
  odsMain.SetVariable('pfd_date', deDate.Date);
  odsMain.Open;
  odsMain.Locate('fk_id', id, []);
end;

procedure TfrmMain.aTextExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    if TVList.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToText(sdPopUp.FileName, grList, TRUE, FALSE)
    else
      ExportGridToText(sdPopUp.FileName, grList, TRUE, TRUE);
end;

procedure TfrmMain.aWebExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    if TVList.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToHTML(sdPopUp.FileName, grList, TRUE, FALSE)
    else
      ExportGridToHTML(sdPopUp.FileName, grList, TRUE, TRUE);
end;

procedure TfrmMain.aXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TVList.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, grList, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, grList, TRUE, TRUE);
end;

procedure TfrmMain.aXMLExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    if TVList.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToXML(sdPopUp.FileName, grList, TRUE, FALSE)
    else
      ExportGridToXML(sdPopUp.FileName, grList, TRUE, TRUE);
end;

procedure TfrmMain.blMonClick(Sender: TObject);
var mm,yy,dd:word;
begin
  decodeDate(deDate.EditValue,yy,mm,dd);
  if dd=31 then dd:=30;
  if ((mm=3) and (dd>28)) then dd:=28;
  if mm>1 then mm:=mm-1
   else
     begin
       mm:=12;
       yy:=yy-1;
     end;

  deDate.EditValue:=encodeDate(yy,mm,dd);
end;

procedure TfrmMain.blWeeksClick(Sender: TObject);
begin
  deDate.EditValue:=deDate.EditValue-1;
end;

procedure TfrmMain.brMonClick(Sender: TObject);
var yy,mm,dd:word;
begin
  decodeDate(deDate.EditValue,yy,mm,dd);
  if dd=31 then dd:=30;
  if ((mm=1) and (dd>28)) then dd:=28;
  if mm<12 then mm:=mm+1
   else
     begin
       mm:=1;
       yy:=yy+1;
     end;
  deDate.EditValue:=encodeDate(yy,mm,dd);
end;

procedure TfrmMain.brWeeksClick(Sender: TObject);
begin
  deDate.EditValue:=deDate.EditValue+1;
end;

procedure TfrmMain.DateChange;
var yy, mm, dd : word;
    wd : integer;
begin
  pMonth.Caption:=FormatDateTime('mmmm', deDate.EditValue)+', '+(FormatDateTime('dddd',deDate.EditValue));

  wd:=dayofweek(deDate.EditValue);
  if wd=1 then wd:=8;

  decodeDate(deDate.EditValue-wd+2,yy,mm,dd);
  p1.Caption:=inttostr(dd);

  decodeDate(deDate.EditValue-wd+3,yy,mm,dd);
  p2.Caption:=inttostr(dd);

  decodeDate(deDate.EditValue-wd+4,yy,mm,dd);
  p3.Caption:=inttostr(dd);

  decodeDate(deDate.EditValue-wd+5,yy,mm,dd);
  p4.Caption:=inttostr(dd);

  decodeDate(deDate.EditValue-wd+6,yy,mm,dd);
  p5.Caption:=inttostr(dd);

  decodeDate(deDate.EditValue-wd+7,yy,mm,dd);
  p6.Caption:=inttostr(dd);

  decodeDate(deDate.EditValue-wd+8,yy,mm,dd);
  p7.Caption:=inttostr(dd);

  p1.Color:=clCream;
  p2.Color:=clCream;
  p3.Color:=clCream;
  p4.Color:=clCream;
  p5.Color:=clCream;
  p6.Color:=clCream;
  p7.Color:=clCream;
  case wd-1 of
    1:p1.Color:=clSkyBlue;
    2:p2.Color:=clSkyBlue;
    3:p3.Color:=clSkyBlue;
    4:p4.Color:=clSkyBlue;
    5:p5.Color:=clSkyBlue;
    6:p6.Color:=clSkyBlue;
    7:p7.Color:=clSkyBlue;
  end;
end;

procedure TfrmMain.deDate1Change(Sender: TObject);
begin
  aRefreshExecute(nil);
end;

procedure TfrmMain.deDatePropertiesEditValueChanged(Sender: TObject);
begin
  DateChange;
  aRefreshExecute(nil);
end;

procedure TfrmMain.DoDelMetodic(pOut, pNazid: Integer);
var oq : TOracleQuery;
begin
  if pOut = 1 then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' delete from asu.trhmdl_vnaz where fk_nazid = :pfk_nazid '; // удаляем ссылку на назначение
        oq.DeclareAndSet('pfk_nazid', otInteger, pNazid);
        oq.Execute;
      finally
        oq.Free;
      end;
    end else
    begin
      oq := TOracleQuery.Create(nil); // удаляем ссылку на назначение и само назначение
      try
        oq.Session := os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' delete from asu.trhmdl_vnaz where fk_nazid = :pfk_nazid ';
        oq.DeclareAndSet('pfk_nazid', otInteger, pNazid);
        oq.Execute;
        oq.DeleteVariables;
        oq.SQL.Text := ' delete from asu.vnaz where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_id', otInteger, pNazid);
        oq.Execute;
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmMain.DoDelOneMetodic(pSos, pOut, pNazid : Integer);
var oq : TOracleQuery;
begin
  if pSos = get_vipnaz then
    begin
      MessageDlg('Внимание!'+#13+#10+
                 'Вы не можете удалить эту запись журнала, так как она содержит в себе'+#13+#10+
                 'исследование (или процедуру) со статусом "Выполнено"!', mtInformation, [mbOK], 0);
      exit;
    end;
  if Application.MessageBox('Вы действительно хотите удалить запись?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
    begin
      if pOut = 1 then
        begin
          oq := TOracleQuery.Create(nil);
          try
            oq.Session := os;
            oq.Cursor := crSQLWait;
            oq.SQL.Text := ' delete from asu.trhmdl_vnaz where fk_nazid = :pfk_nazid '; // удаляем ссылку на назначение
            oq.DeclareAndSet('pfk_nazid', otInteger, pNazid);
            oq.Execute;
            oq.DeleteVariables;
            oq.SQL.Text := ' delete from asu.tjurrhmdl where fk_id = :pfk_id '; // удаляем саму запись журнала
            oq.DeclareAndSet('pfk_id', otInteger, odsMain.FieldByName('fk_id').AsInteger);
            oq.Execute;
            os.Commit;
            RefreshQuery(odsMain);
          finally
            oq.Free;
          end;
        end else
        begin
          oq := TOracleQuery.Create(nil); // удаляем ссылку на назначение, само назначение и запись журнала
          try
            oq.Session := os;
            oq.Cursor := crSQLWait;
            oq.SQL.Text := ' delete from asu.trhmdl_vnaz where fk_nazid = :pfk_nazid ';
            oq.DeclareAndSet('pfk_nazid', otInteger, pNazid);
            oq.Execute;
            oq.DeleteVariables;
            oq.SQL.Text := ' delete from asu.vnaz where fk_id = :pfk_id ';
            oq.DeclareAndSet('pfk_id', otInteger, pNazid);
            oq.Execute;
            oq.DeleteVariables;
            oq.SQL.Text := ' delete from asu.tjurrhmdl where fk_id = :pfk_id ';
            oq.DeclareAndSet('pfk_id', otInteger, odsMain.FieldByName('fk_id').AsInteger);
            oq.Execute;
            os.Commit;
            RefreshQuery(odsMain);
          finally
            oq.Free;
          end;
        end;
    end;
end;

procedure TfrmMain.DoInfo;
var ods : TOracleDataSet;
    idPac : Integer;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select t1.fk_id, t1.fk_smid, t1.fk_pacid, asu.get_smidname(t1.fk_smid) as smname, t1.fk_nazsosid, '+#13+
                    '        t2.fl_out '+#13+
                    '   from asu.vnaz t1, asu.trhmdl_vnaz t2 '+#13+
                    '  where t1.fk_id = t2.fk_nazid '+#13+
                    '    and t2.fk_rhmdlid = :pfk_rhmdlid ';
    ods.DeclareAndSet('pfk_rhmdlid', otInteger, odsMain.FieldByName('fk_id').AsInteger);
    ods.Open;
    odsIssl.Close;
    odsIssl.SetVariable('pfk_rhmdlid', odsMain.FieldByName('fk_id').AsInteger);
    odsIssl.Open;
    odsIssl.First;
// -- формируем назначения
    while not odsIssl.Eof do
      begin
        frmAdd.tvIsslTable.BeginUpdate;
        frmAdd.tvIsslTable.DataController.RecordCount := frmAdd.tvIsslTable.DataController.RecordCount + 1;
        with frmAdd.tvIsslTable.DataController do
          begin
            try
              Values[frmAdd.tvIsslTable.DataController.RecordCount - 1, frmAdd.vName.Index] := odsIssl.FieldByName('smname').AsString;
              Values[frmAdd.tvIsslTable.DataController.RecordCount - 1, frmAdd.vSmidID.Index] := odsIssl.FieldByName('fk_smid').AsInteger;
              Values[frmAdd.tvIsslTable.DataController.RecordCount - 1, frmAdd.vNazID.Index] := odsIssl.FieldByName('fk_id').AsInteger;
              Values[frmAdd.tvIsslTable.DataController.RecordCount - 1, frmAdd.vSos.Index] := odsIssl.FieldByName('fk_nazsosid').AsInteger;
              Values[frmAdd.tvIsslTable.DataController.RecordCount - 1, frmAdd.vOut.Index] := odsIssl.FieldByName('fl_out').AsInteger;
            finally
              frmAdd.tvIsslTable.EndUpdate;
            end;
          end;
        odsIssl.Next;
      end;
    idPac := ods.FieldByName('fk_pacid').AsInteger;
// -- формируем информацию о пациенте
// -- фио пациента
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select asu.pkg_regist_pacfunc.get_pac_fullfio(:pfk_pacid) as fiopac from dual ';
    ods.DeclareAndSet('pfk_pacid', otInteger, idPac);
    ods.Open;
    frmAdd.lbPac.Caption := ods.FieldByName('fiopac').AsString;
    frmAdd.lbPac.Tag := idPac;
// -- Дата рождения
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select to_char(fd_rojd, ''dd.mm.yyyy'') as datebirth '+#13+
                    '   from asu.tpeoples '+#13+
                    '  where fk_id = asu.get_peplid(:pfk_pacid) ';
    ods.DeclareAndSet('pfk_pacid', otInteger, idPac);
    ods.Open;
    frmAdd.lbDateBirth.Caption := ods.FieldByName('datebirth').AsString;
// -- Номер МК
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select asu.get_ib(:pfk_pacid) as nummk from dual ';
    ods.DeclareAndSet('pfk_pacid', otInteger, idPac);
    ods.Open;
    frmAdd.lbNumMK.Caption := ods.FieldByName('nummk').AsString;
// -- пол
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select decode(fp_sex, 0, ''Женский'', 1, ''Мужской'') as sex '+#13+
                    '   from asu.tpeoples '+#13+
                    '  where fk_id = asu.get_peplid(:pfk_pacid) ';
    ods.DeclareAndSet('pfk_pacid', otInteger, idPac);
    ods.Open;
    frmAdd.lbSex.Caption := ods.FieldByName('sex').AsString;
// -- возраст
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select trunc(months_between(sysdate, fd_rojd)/12) as age from asu.tpeoples where fk_id = asu.get_peplid(:pfk_pacid) ';
    ods.DeclareAndSet('pfk_pacid', otInteger, idPac);
    ods.Open;
    frmAdd.lbAge.Caption := IntToStr(ods.FieldByName('age').AsInteger);
// адрес регистрации
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select asu.get_adr_by_peplid_level_street(asu.get_peplid(:pfk_pacid), 1) as adr from dual ';
    ods.DeclareAndSet('pfk_pacid', otInteger, idPac);
    ods.Open;
    frmAdd.lbAddress.Caption := ods.FieldByName('adr').AsString;
// Диагноз
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select stat.pkg_frform30.get_last_diag(:pfk_pacid) as diag from dual ';
    ods.DeclareAndSet('pfk_pacid', otInteger, idPac);
    ods.Open;
    frmAdd.lbDS.Caption := ods.FieldByName('diag').AsString;
// Житель
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = asu.get_peplid(:pfk_pacid) '+#13+
                    '    and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''LD_LIVEIN'') ';
    ods.DeclareAndSet('pfk_pacid', otInteger, idPac);
    ods.Open;
    frmAdd.lbJit.Caption := ods.FieldByName('smname').AsString;
// Региональная принадлежность
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = asu.get_peplid(:pfk_pacid) '+#13+
                    '    and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''PD_MZ'') ';
    ods.DeclareAndSet('pfk_pacid', otInteger, idPac);
    ods.Open;
    frmAdd.lbReg.Caption := ods.FieldByName('smname').AsString;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.DoInsertNaz(pName: String; pSmid, pNazID, pJurID : Integer);
var oq : TOracleQuery;
    id : Integer;
begin
  oq := TOracleQuery.Create(nil);
  oq.Session := os;
  oq.Cursor := crSQLWait;
  try
    if pNazID = 0 then
      begin
        oq.SQL.Text := ' insert into asu.vnaz(fk_smid, fd_naz, fd_run, fk_roomid, fk_vrachid, fk_nazsosid, fk_pacid, fc_name, fk_naztypeid) '+#13+
                       ' values(:pfk_smid, sysdate, sysdate, :pfk_roomid, :pfk_vrachid, asu.get_nevip, :pfk_pacid, asu.get_smidname(:pfk_smid), :pfk_naztypeid) '+#13+
                       ' returning fk_id into :pfk_id ';
        oq.DeclareAndSet('pfk_smid', otInteger, pSmid);
        oq.DeclareAndSet('pfk_roomid', otInteger, -1); // !!!
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmAdd.rowSotr.Properties.Value);
        oq.DeclareAndSet('pfk_pacid', otInteger, frmAdd.lbPac.Tag); // !!! проверить что сюда передается
        oq.DeclareAndSet('pfk_naztypeid', otInteger, frmAdd.lcbUrg.EditValue);
        oq.DeclareVariable('pfk_id', otInteger);
        oq.Execute;
        id := oq.GetVariable('pfk_id');
        oq.DeleteVariables;
        oq.SQL.Text := ' insert into asu.trhmdl_vnaz(fk_rhmdlid, fk_nazid, fl_out) '+#13+
                       ' values(:pfk_rhmdlid, :pfk_nazid, 0) ';
        oq.DeclareAndSet('pfk_rhmdlid', otInteger, pJurID);
        oq.DeclareAndSet('pfk_nazid', otInteger, id);
        oq.Execute;
//        os.Commit;
      end else
      begin
        oq.SQL.Text := ' insert into asu.trhmdl_vnaz(fk_rhmdlid, fk_nazid, fl_out) '+#13+
                       ' values(:pfk_rhmdlid, :pfk_nazid, 1) ';
        oq.DeclareAndSet('pfk_rhmdlid', otInteger, pJurID);
        oq.DeclareAndSet('pfk_nazid', otInteger, pNazID);
        oq.Execute;
//        os.Commit;
      end;
  finally
    oq.Free;
  end;
end;

procedure TfrmMain.DoInsertUpdateNaz(pName: String; pSmid, pNazID, pJurID: Integer);
var oq : TOracleQuery;
    id : Integer;
begin
  oq := TOracleQuery.Create(nil);
  oq.Session := os;
  oq.Cursor := crSQLWait;
  try
    if pNazID = 0 then
      begin
        oq.SQL.Text := ' insert into asu.vnaz(fk_smid, fd_naz, fd_run, fk_roomid, fk_vrachid, fk_nazsosid, fk_pacid, fc_name, fk_naztypeid) '+#13+
                       ' values(:pfk_smid, sysdate, sysdate, :pfk_roomid, :pfk_vrachid, asu.get_nevip, :pfk_pacid, asu.get_smidname(:pfk_smid), :pfk_naztypeid) '+#13+
                       ' returning fk_id into :pfk_id ';
        oq.DeclareAndSet('pfk_smid', otInteger, pSmid);
        oq.DeclareAndSet('pfk_roomid', otInteger, -1); // !!!
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmAdd.rowSotr.Properties.Value);
        oq.DeclareAndSet('pfk_pacid', otInteger, frmAdd.lbPac.Tag);
        oq.DeclareAndSet('pfk_naztypeid', otInteger, frmAdd.lcbUrg.EditValue);
        oq.DeclareVariable('pfk_id', otInteger);
        oq.Execute;
        id := oq.GetVariable('pfk_id');
        oq.DeleteVariables;
        oq.SQL.Text := ' insert into asu.trhmdl_vnaz(fk_rhmdlid, fk_nazid, fl_out) '+#13+
                       ' values(:pfk_rhmdlid, :pfk_nazid, 0) ';
        oq.DeclareAndSet('pfk_rhmdlid', otInteger, pJurID);
        oq.DeclareAndSet('pfk_nazid', otInteger, id);
        oq.Execute;
      end else
      begin
        oq.SQL.Text := ' update asu.vnaz set fk_smid = :pfk_smid, fc_name = asu.get_smidname(:pfk_smid) where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_smid', otInteger, pSmid);
        oq.DeclareAndSet('pfk_id', otInteger, pNazID);
        oq.Execute;
      end;
  finally
    oq.Free;
  end;
end;

procedure TfrmMain.DoLoadPriem(nSmidID, nID : Integer);
begin
  HandleDLL := LoadLibrary('PriemDll.dll');
  if HandleDLL <> 0 then
    begin
      EditPlugin_Personal := GetProcAddress(HandleDLL, 'EditPlugin_Personal');
      if @EditPlugin_Personal <> nil then
      begin
        try
          @SetSignFnc := GetProcAddress(HandleDLL, 'SetSignFnc');
          if Assigned(@SetSignFnc) then
            SetSignFnc(frmMain.gDigSignature.SignDocument);
					EditPlugin_Personal(Panel1.Handle, //хэндл панели
															Application.Handle, //хэндл аппликейшена
															odsMain.FieldByName('fk_pacid').AsInteger, //код пациента
															pSOTRID, //код сотрудника
															pAPPSOTRID, //специализация
                              -1, //секция
															nSmidID, //смид
															nID, //назид
															FALSE,
															nID, //ид объекта
															Panel1.Parent.Handle);
        except
        end;
      end;
    end;
  try
    Application.ProcessMessages;
    FreeLibrary(HandleDLL);
    HandleDll:=0;
  except
  end;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Закрыть программу ?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
    action := caFree
  else
    action := caNone;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  tvList.StoreToRegistry('\SoftWare\SoftMaster\List_RHMDL\cxGrSotr_' + IntToStr(pSOTRID), TRUE, [], 'cxGr');
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var Ver : TJclFileVersionInfo;
begin
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  try
    GetSession(os, 'ASU');
    pAPPSOTRID := StrToInt(paramstr(1));
// -- константы
    odsConst.Close;
    odsConst.Open;
    get_vipnaz := odsConst.FieldByName('get_vipnaz').AsInteger;
    get_nazextra := odsConst.FieldByName('get_nazextra').AsInteger;
// -- служебные данные
    odsInfo.Close;
    odsInfo.SetVariable('pfk_id', pAPPSOTRID);
    odsInfo.Open;
    pSOTRID := odsInfo.FieldByName('fk_sotrid').AsInteger;
    sCompanyName_4Rep := odsInfo.FieldByName('companyname').AsString;
    sOtdelName_4Rep := odsInfo.FieldByName('otdelname').AsString;
    deDate.EditValue := odsInfo.FieldByName('datesys').AsDateTime;
    frmMain.Caption := '';
    frmMain.Caption := 'Журнал РХМДЛ('+Ver.FileVersion+'). Пользователь: '+odsInfo.FieldByName('sotrfio').AsString;
    MedotradeSign := ReadMedotradeSign;
    tvList.StoreToRegistry('\SoftWare\SoftMaster\List_RHMDL\cxGrSotr_' + IntToStr(pSOTRID)+'Default', TRUE, [], 'cxGr');
    tvList.RestoreFromRegistry('\SoftWare\SoftMaster\List_RHMDL\cxGrSotr_' + IntToStr(pSOTRID), FALSE, FALSE, [], 'cxGr');
    russian:=LoadKeyboardLayout('00000419', 0);
    gDigSignature := TDigitalSignature.Create(Self);
    frmMain.WindowState := wsMaximized;
// -- кнопка "Протокол" показывается в зависимости от настроек
  aProt.Visible := (DO_CHECK_OBJECT_ACCESS(os, pAPPSOTRID, aProt.Owner.Name + '.' + aProt.Name) > 0);    
  finally
    Ver.Free;
  end;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  FreeAndNil(gDigSignature);
end;

procedure TfrmMain.N1Click(Sender: TObject);
begin
  tvList.RestoreFromRegistry('\SoftWare\SoftMaster\List_RHMDL\cxGrSotr_' + IntToStr(pSOTRID)+'Default', FALSE, FALSE, [], 'cxGr');
end;

procedure TfrmMain.odsMainAfterOpen(DataSet: TDataSet);
begin
  aEdit.Enabled := odsMain.RecordCount <> 0;
  aDel.Enabled := odsMain.RecordCount <> 0;
  aProt.Enabled := odsMain.RecordCount <> 0;
  aPrint.Enabled := odsMain.RecordCount <> 0;
  aOpenMK.Enabled := odsMain.RecordCount <> 0;
  aInfo.Enabled := odsMain.RecordCount <> 0;
end;

procedure TfrmMain.odsMainBeforeOpen(DataSet: TDataSet);
begin
  odsMain.SetVariable('pfd_date', deDate.EditValue);
end;

procedure TfrmMain.osAfterLogOn(Sender: TOracleSession);
var Ver: TJclFileVersionInfo;
begin
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  try
    Sender.DBMS_Application_Info.Set_Client_Info(ParamStr(1));
	  Sender.DBMS_Application_Info.Set_Module(ExtractFileName(ParamStr(0)) + ' (' + Ver.FileVersion + ')', Self.Name + ' "' + Self.Caption + '"');
  finally
  	Ver.Free;
  end;
end;

procedure TfrmMain.p1Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(deDate.EditValue);
  if wd=1 then wd:=8;
  deDate.EditValue:=deDate.EditValue-wd+2;
end;

procedure TfrmMain.p2Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(deDate.EditValue);
  if wd=1 then wd:=8;
  deDate.EditValue:=deDate.EditValue-wd+3;
end;

procedure TfrmMain.p3Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(deDate.EditValue);
  if wd=1 then wd:=8;
  deDate.EditValue:=deDate.EditValue-wd+4;
end;

procedure TfrmMain.p4Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(deDate.EditValue);
  if wd=1 then wd:=8;
  deDate.EditValue:=deDate.EditValue-wd+5;
end;

procedure TfrmMain.p5Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(deDate.EditValue);
  if wd=1 then wd:=8;
  deDate.EditValue:=deDate.EditValue-wd+6;
end;

procedure TfrmMain.p6Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(deDate.EditValue);
  if wd=1 then wd:=8;
  deDate.EditValue:=deDate.EditValue-wd+7;
end;

procedure TfrmMain.p7Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(deDate.EditValue);
  if wd=1 then wd:=8;
  deDate.EditValue:=deDate.EditValue-wd+8;
end;

procedure TfrmMain.repListGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'DATEPRINT' then Value := sSysDate4Rep;
  if VarName = 'DATENAZ' then Value := deDate.Date;
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := sOtdelName_4Rep;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
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

procedure TfrmMain.tvListCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  aProtExecute(nil);
end;

procedure TfrmMain.tvListCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  if AViewInfo.GridRecord.Values[vExtra.Index] = get_nazextra then
    begin
      ACanvas.Font.Style := [fsBold];
      ACanvas.Font.Color := clNavy; 
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
