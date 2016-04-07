unit fTrebLst;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ActnList, ComCtrls, ToolWin, ExtCtrls, Db, OracleData,
  FR_DSet, FR_DBSet, FR_Class, JvFormPlacement, cxControls, cxSplitter, Oracle, 
  JvComponentBase, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxMaskEdit, cxCalendar, cxTextEdit,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGridLevel, cxGrid, fMainForm, cxCheckBox,
  cxDBLookupComboBox, cxSpinEdit, fCryptUtils, cxContainer, cxDropDownEdit,
  JvExControls, JvArrowButton, dxSkinsCore, dxSkinscxPCPainter,
  dxSkinOffice2007Black, dxSkinOffice2007Green, dxSkiniMaginary, dxSkinBlack;

type

  TfrmTrebLst = class(TForm)
    Panel1: TPanel;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    al: TActionList;
    tbuAdd: TToolButton;
    acAddByNaznList: TAction;
		acAddManual: TAction;
    pmTreb: TPopupMenu;
    N1: TMenuItem;
    acAddManual1: TMenuItem;
    acAdd: TAction;
    acEdit: TAction;
    acDelete: TAction;
    tbuEdit: TToolButton;
    tbuDel: TToolButton;
    acPrintTreb: TAction;
    ToolButton4: TToolButton;
    tbuPrint: TToolButton;
    odsTreb: TOracleDataSet;
    dsTreb: TDataSource;
    odsReport: TOracleDataSet;
    frDBdsTreb: TfrDBDataSet;
    acClose: TAction;
    tbuClose: TToolButton;
    acRefresh: TAction;
    tbuRefresh: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    frTreb: TfrReport;
    acSelect: TAction;
    tbuSelect: TToolButton;
    ToolButton11: TToolButton;
    FormStorage: TJvFormStorage;
    acFillMinZapas: TAction;
    N2: TMenuItem;
    cxSplitter1: TcxSplitter;
    odsMedic: TOracleDataSet;
    dsMedic: TDataSource;
    N3: TMenuItem;
    acAddTrebByPattern: TAction;
    N4: TMenuItem;
    oqDuplicateTrebDPC: TOracleQuery;
    cxGridTrebDpc: TcxGrid;
    cxGridTrebDpcLevel1: TcxGridLevel;
    cxGridTrebDpcDBTableView1: TcxGridDBTableView;
    cxGridTrebDpcDBTableView1ROWNUM: TcxGridDBColumn;
    cxGridTrebDpcDBTableView1FC_MEDIC: TcxGridDBColumn;
    cxGridTrebDpcDBTableView1FC_EDIZM: TcxGridDBColumn;
    cxGridTrebDpcDBTableView1FN_KOL: TcxGridDBColumn;
    cxGridTrebLst: TcxGrid;
    cxGridTrebLstLevel1: TcxGridLevel;
    cxGridTrebLstDBTableView1: TcxGridDBTableView;
    cxGridTrebLstDBTableView1FD_DATE: TcxGridDBColumn;
    cxGridTrebLstDBTableView1FC_TREB: TcxGridDBColumn;
    cxGridTrebLstDBTableView1FC_MOFROM: TcxGridDBColumn;
    cxGridTrebLstDBTableView1FC_MOTO: TcxGridDBColumn;
    cxGridTrebLstDBTableView1FC_COMMENT: TcxGridDBColumn;
    cxGridTrebLstDBTableView1FC_PROCESSED: TcxGridDBColumn;
    cxGridTrebLstDBTableView1FL_CITO: TcxGridDBColumn;
    frTrebOld: TfrReport;
    cxGridTrebLstDBTableView1FK_ID: TcxGridDBColumn;
    cxGridTrebDpcDBTableView1FK_ID: TcxGridDBColumn;
    cxGridTrebDpcDBTableView1FD_CREATE: TcxGridDBColumn;
    cxGridTrebDpcDBTableView1FK_CREATE_MO_ID: TcxGridDBColumn;
    cxGridTrebDpcDBTableView1FD_EDIT: TcxGridDBColumn;
    cxGridTrebDpcDBTableView1FK_EDIT_MO_ID: TcxGridDBColumn;
    acNewClearTreb: TAction;
    pmSelect: TPopupMenu;
    N5: TMenuItem;
    N6: TMenuItem;
    cxGridTrebDpcDBTableView1FC_NAME_LAT: TcxGridDBColumn;
    pmPrint: TPopupMenu;
    N7: TMenuItem;
    N8: TMenuItem;
    acPrintTrebNakl: TAction;
    odsTDocs: TOracleDataSet;
    tbuQuota: TToolButton;
    acQuota: TAction;
    tbuQuotaSep: TToolButton;
    cxGridTrebLstDBTableView1FK_FINSOURCE_ID: TcxGridDBColumn;
    cxGridTrebLstDBTableView1_FL_ECP1: TcxGridDBColumn;
    cxGridTrebLstDBTableView1_FL_ECP2: TcxGridDBColumn;
    cxGridTrebLstDBTableView1_FL_ECP3: TcxGridDBColumn;
    cxGridTrebLstDBTableView1_ECP1_NOTE: TcxGridDBColumn;
    cxGridTrebLstDBTableView1_ECP2_NOTE: TcxGridDBColumn;
    cxGridTrebLstDBTableView1_ECP3_NOTE: TcxGridDBColumn;
    cxGridTrebLstDBTableView1_ECP1_FK_ID: TcxGridDBColumn;
    cxGridTrebLstDBTableView1_ECP2_FK_ID: TcxGridDBColumn;
    cxGridTrebLstDBTableView1_ECP3_FK_ID: TcxGridDBColumn;
    Panel2: TPanel;
    abuSetDocPeriod: TJvArrowButton;
    Panel3: TPanel;
    dedDate1: TcxDateEdit;
    dedDate2: TcxDateEdit;
    chbDate1: TcxCheckBox;
    chbDate2: TcxCheckBox;
    ToolButton1: TToolButton;
    pmTrebFilterPeriod: TPopupMenu;
    N19: TMenuItem;
    N14: TMenuItem;
    N20: TMenuItem;
    N18: TMenuItem;
    N16: TMenuItem;
    N21: TMenuItem;
    N17: TMenuItem;
    N15: TMenuItem;
    pmTrebNaklV2: TPopupMenu;
    MenuItem1: TMenuItem;
    pmDamagedTrebNakl: TPopupMenu;
    miDamagedTrebNaklCheck: TMenuItem;
    miDamagedTrebNaklRepair: TMenuItem;
    miDamagedTrebNaklDel: TMenuItem;
    oqDamagedTrebNaklRepair: TOracleQuery;
    oqDamagedTrebNaklDelete: TOracleQuery;
    acAddForRPO: TAction;
    N9: TMenuItem;
    cxGridTrebLstDBTableView1_FL_RPO: TcxGridDBColumn;
    tbuSign: TToolButton;
    tbuSignSep: TToolButton;
    acSign: TAction;
    cxGridTrebLstDBTableView1FL_EDIT: TcxGridDBColumn;
    cxGridTrebDpcDBTableView1FC_INTERNATIONAL_NAME: TcxGridDBColumn;
    cxGridTrebLstDBTableView1fc_num_doc_str: TcxGridDBColumn;
    procedure acAddManualExecute(Sender: TObject);
		procedure acAddExecute(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    procedure acEditExecute(Sender: TObject);
    procedure acDeleteExecute(Sender: TObject);
    procedure acPrintTrebExecute(Sender: TObject);
    procedure acAddByNaznListExecute(Sender: TObject);
    procedure frTrebGetValue(const ParName: String;
      var ParValue: Variant);
		procedure odsTrebAfterScroll(DataSet: TDataSet);
    procedure acSelectExecute(Sender: TObject);
    procedure dbTrebLstDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure frTrebObjectClick(View: TfrView);
    procedure frTrebMouseOverObject(View: TfrView; var Cursor: TCursor);
    procedure acFillMinZapasExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure frTrebUserFunction(const Name: String; p1, p2, p3: Variant;
      var Val: Variant);
    procedure acAddTrebByPatternExecute(Sender: TObject);
    procedure cxGridTrebLstDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGridTrebDpcDBTableView1DblClick(Sender: TObject);
    procedure acNewClearTrebExecute(Sender: TObject);
    procedure tbuSelectClick(Sender: TObject);
    procedure acPrintTrebNaklExecute(Sender: TObject);
    procedure acQuotaExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure odsTrebApplyRecord(Sender: TOracleDataSet; Action: Char;
      var Applied: Boolean; var NewRowId: string);
    procedure chbDate1Click(Sender: TObject);
    procedure chbDate2Click(Sender: TObject);
    procedure dedDate1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dedDate1PropertiesEditValueChanged(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure cxGridTrebLstDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure MenuItem1Click(Sender: TObject);
    procedure miDamagedTrebNaklRepairClick(Sender: TObject);
    procedure miDamagedTrebNaklDelClick(Sender: TObject);
    procedure acAddForRPOExecute(Sender: TObject);
    procedure acSignExecute(Sender: TObject);
  private
    { Private declarations }
    FbSelect: Boolean;
    FIsTrebByPattern : Boolean; // флаг создания требования по образцу
    FIsUseECPInTreb, FNotRefresh : boolean;
    FCryptoProUtils : TCryptoProUils;
    procedure SetbSelect(const Value: Boolean);
    procedure DoDelTreb(nID: Integer);

  public
		nId: Integer;
    IsNewClearTreb : Boolean;
		MOID:INTEGER;
    RPO_SELECT : boolean;
		property bSelect : Boolean read FbSelect write SetbSelect;
    { Public declarations }
  end;

var frmTrebLst : TfrmTrebLst;
    frmTrebLstModal : TfrmTrebLst;

function DoShowTrebLst(bSelect: Boolean = False): TModalResult;

implementation

{$R *.DFM}

uses fdmMain, JvDBUtils, fTrebManual, fTrebByNaz, FR_Utils,FR_Const, fDateInput, FR_View, fFioZav,
  fdmPrintReports, fdmPrintSelect, fTreb_Quota, Variants, DateUtils;

function DoShowTrebLst(bSelect: Boolean = False): TModalResult;
begin
  if bSelect = False then
  begin
    frmTrebLst := TfrmTrebLst.Create(Application);
    frmTrebLst.bSelect := bSelect;

    frmTrebLst.acQuota.Enabled     := (dmMain.ConfigParams.GetParamValue('FUNC_USE_TREB_QUOTA', 0) = 1) and (frmMain.ProvisorState = 0);
    frmTrebLst.acQuota.Visible     := frmTrebLst.acQuota.Enabled;
    frmTrebLst.tbuQuotaSep.Visible := frmTrebLst.acQuota.Enabled;

    if not frmMain.RestoreMDI_Window('frmTrebLst') then
      frmTrebLst.FormStyle := fsMDIChild;
    Result := mrYes;  
  end
  else
  begin
    try
      frmTrebLstModal := TfrmTrebLst.Create(Application);
      frmTrebLstModal.bSelect := bSelect;
      Result := frmTrebLst.ShowModal;
    finally
      if Assigned(frmTrebLst) then frmTrebLst.Free;
    end;
  end;
end;

function CreateTrebShablon: Integer;
var oq : TOracleQuery;
begin
	oq := TOracleQuery.Create(nil);
  try
    oq.Session := dmMain.os;
    oq.Sql.Text := 'INSERT INTO MED.TTREB (FK_MOOWNERID) VALUES (MED.PKG_MEDSES.GET_CURMO) RETURNING FK_ID INTO :FK_ID';
    oq.DeclareVariable('FK_ID',otInteger);
    try
      oq.Execute;
      Result := oq.GetVariable('FK_ID');
    except
      Result := -1;
    end;
  finally
    oq.Free;
  end;
end;

procedure DoSetTreb(pFk_Id:Integer; pDate: TDateTime; pMoFrom: Integer;
  pMoTo: Integer; pComment: String);
//pNumDoc: String;
var oq : TOracleQuery;
begin
	oq := TOracleQuery.Create(nil);
  try
    oq.Session := dmMain.os;

    oq.Sql.Text := 'UPDATE MED.TTREB D ' +
      'SET ' +
//      '    D.FC_TREB = :FC_TREB, ' +
      '    D.FD_DATE = :FD_DATE, ' +
      '    D.FK_MOTOID = :FK_MOTOID, ' +
			'    D.FK_MOFROMID = :FK_MOFROMID, ' +
      '    D.FC_COMMENT = :FC_COMMENT ' +
      'WHERE D.FK_ID = :FK_ID';
//    oq.DeclareVariable('FC_TREB',otString);
    oq.DeclareVariable('FD_DATE',otDate);
    oq.DeclareVariable('FK_MOTOID',otInteger);
    oq.DeclareVariable('FK_MOFROMID',otInteger);
    oq.DeclareVariable('FC_COMMENT',otString);
    oq.DeclareVariable('FK_ID',otInteger);
    oq.SetVariable('FK_ID',pFk_Id);
//    oq.SetVariable('FC_TREB',pNumDoc);
    oq.SetVariable('FD_DATE',pDate);
    oq.SetVariable('FK_MOTOID',pMoTo);
    oq.SetVariable('FK_MOFROMID',pMoFrom);
    oq.SetVariable('FC_COMMENT',pComment);
    oq.Execute;
  finally
    oq.Free;
  end;
end;

procedure TfrmTrebLst.acAddManualExecute(Sender: TObject);
var frmTrebManual : TfrmTrebManual;
    nTreb : Integer; // Ид требования
begin
  nTreb := trunc(dmMain.PKGTREB.CREATESHABLON(MOID));
  frmTrebManual := TfrmTrebManual.Create(Self);
  frmTrebManual.iWho_called:=2;
  frmTrebManual.idTreb := nTreb;
  frmTrebManual.iStatus:=0;
  frmTrebManual.deRegisterDate.Date := ServerDate(dmMain.os);

  frmTrebManual.bReadOnly := False;
  try
    if frmTrebManual.ShowModal = mrOk then
    begin
      dmMain.PKGTREB.DOSETTREB( nTreb,
                                frmTrebManual.deNumTreb.Text,
                                frmTrebManual.deRegisterDate.Date,
                                frmTrebManual.LcbFrom.KeyValue,
                                frmTrebManual.LcbTo.KeyValue,
                                frmTrebManual.mComment.Text,
                                frmTrebManual.lcbMO_GroupFrom.KeyValue,
                                frmTrebManual.lcbMO_GroupTo.KeyValue,
                                frmTrebManual.chbFL_CITO.Tag );
//"наращиваем на скилет Мясо"
      if(dmMain.ConfigParams.GetParamValue('FUNC_REQUIRE_FINSOURCE_IN_TREB', 0) = 1) then
      begin
        dmMain.InitAdditionalUpdateTable('MED.TTREB');
        dmMain.AddAdditionalUpdateTable('FK_FINSOURCE_ID', otInteger, frmTrebManual.lcbFinSource.EditValue);
        dmMain.ExecuteAdditionalUpdateTable('FK_ID', otInteger, nTreb); // обновление таблицы TDOCS выполнено
      end;

      dmMain.os.Commit;
      odsTreb.AfterScroll := nil;
      odsTreb.Close;
      odsTreb.Open;
      odsTreb.Locate('FK_ID',nTreb,[]);
      odsTreb.AfterScroll := odsTrebAfterScroll;
      odsTrebAfterScroll(odsTreb);
    end
    else
      dmMain.os.Rollback;
  finally
    frmTrebManual.Free;
  end;
end;

procedure TfrmTrebLst.acAddExecute(Sender: TObject);
var
  P : TPoint;
begin
  P.X := 0;
  P.Y := tbuAdd.Height;
  P := tbuAdd.ClientToScreen(P);
  tbuAdd.DropdownMenu.Popup(P.X, P.Y);
end;

procedure TfrmTrebLst.acAddForRPOExecute(Sender: TObject);
var frmTrebManual : TfrmTrebManual;
    nTreb : Integer; // Ид требования
begin
  nTreb := trunc(dmMain.PKGTREB.CREATESHABLON(MOID));
  frmTrebManual := TfrmTrebManual.Create(Self);
  frmTrebManual.iWho_called:=2;
  frmTrebManual.FL_RPO := True;

  frmTrebManual.idTreb := nTreb;
  frmTrebManual.iStatus:=0;
  frmTrebManual.deRegisterDate.Date := ServerDate(dmMain.os);

  frmTrebManual.bReadOnly := False;
  try
    if frmTrebManual.ShowModal = mrOk then
    begin
      dmMain.PKGTREB.DOSETTREB( nTreb,
                                frmTrebManual.deNumTreb.Text,
                                frmTrebManual.deRegisterDate.Date,
                                frmTrebManual.LcbFrom.KeyValue,
                                frmTrebManual.LcbTo.KeyValue,
                                frmTrebManual.mComment.Text,
                                frmTrebManual.lcbMO_GroupFrom.KeyValue,
                                frmTrebManual.lcbMO_GroupTo.KeyValue,
                                frmTrebManual.chbFL_CITO.Tag );
//"наращиваем на скилет Мясо"
      dmMain.InitAdditionalUpdateTable('MED.TTREB');
      dmMain.AddAdditionalUpdateTable('FL_RPO', otInteger, 1);
      dmMain.ExecuteAdditionalUpdateTable('FK_ID', otInteger, nTreb);

      dmMain.os.Commit;
      odsTreb.AfterScroll := nil;
      odsTreb.Close;
      odsTreb.Open;
      odsTreb.Locate('FK_ID',nTreb,[]);
      odsTreb.AfterScroll := odsTrebAfterScroll;
      odsTrebAfterScroll(odsTreb);
    end
    else dmMain.os.Rollback;
  finally
    frmTrebManual.Free;
  end;
end;

procedure TfrmTrebLst.acCloseExecute(Sender: TObject);
begin
  if bSelect then
    ModalResult := mrCancel
  else
    Close;
end;

procedure TfrmTrebLst.acRefreshExecute(Sender: TObject);
//var
//  ID : Integer;
var
  s : string;
  date_temp : TDate;
begin
  //--------------------------------
  if FNotRefresh then Exit;

  odsTreb.AfterScroll:=nil;
  cxGridTrebLst.BeginUpdate;
  if TRUNC(dedDate1.Date) > TRUNC(dedDate2.Date) then
  begin
    date_temp := dedDate1.Date;
    dedDate1.Date := dedDate2.Date;
    dedDate2.Date := date_temp;
  end;
  odsTreb.Close;
  odsTreb.SetVariable('DATE1', TRUNC(dedDate1.Date));
  odsTreb.SetVariable('DATE2', TRUNC(dedDate2.Date));
  s := 'Список требований :: Период:';
  case chbDate1.Checked of
    TRUE :
    begin
      odsTreb.SetVariable('FILTERED_BY_DATE1', 1);
      s := s + ' c '+DateToStr(dedDate1.Date);
    end;

    FALSE: odsTreb.SetVariable('FILTERED_BY_DATE1', 0);
  end;
  case chbDate2.Checked of
    TRUE :
    begin
      odsTreb.SetVariable('FILTERED_BY_DATE2', 1);
      s := s + ' по '+DateToStr(dedDate2.Date);
    end;

    FALSE: odsTreb.SetVariable('FILTERED_BY_DATE2', 0);
  end;

  if (chbDate1.Checked or chbDate2.Checked) = False then
    s := 'Список требований :: Без периода';

  Self.Caption := s;

//  odsTreb.SQL.SaveToFile('1.sql');
  odsTreb.Open;

  // проставляем признаки валидности подписей
  if (FIsUseECPInTreb){and(dmMain.isCryptoProProviderPresent)} then
  begin
    // сокращаем список для обновления
    odsTreb.Filtered := false;
    odsTreb.Filter := '(ECP1_FK_ID > 0) or (ECP2_FK_ID > 0) or (ECP3_FK_ID > 0)';
    odsTreb.Filtered := True;

    while odsTreb.Eof = False do
    begin
      if (odsTreb.FieldByName('ECP1_FK_ID').IsNull or
         odsTreb.FieldByName('ECP2_FK_ID').IsNull or
         odsTreb.FieldByName('ECP1_FK_ID').IsNull ) = true  then
      begin
        odsTreb.Edit;

        if odsTreb.FieldByName('ECP1_FK_ID').IsNull = False then
  //        odsTreb.FieldByName('FL_ECP1').AsInteger := 0
  //      else
          case FCryptoProUtils.CheckSign( odsTreb.FieldByName('ECP1_FK_ID').AsInteger ) of
            True : odsTreb.FieldByName('FL_ECP1').AsInteger := 1;
            False: odsTreb.FieldByName('FL_ECP1').AsInteger := -1;
          end;

        if odsTreb.FieldByName('ECP2_FK_ID').IsNull = False then
  //        odsTreb.FieldByName('FL_ECP2').AsInteger := 0
  //      else
          case FCryptoProUtils.CheckSign( odsTreb.FieldByName('ECP2_FK_ID').AsInteger ) of
            True : odsTreb.FieldByName('FL_ECP2').AsInteger := 1;
            False: odsTreb.FieldByName('FL_ECP2').AsInteger := -1;
          end;

        if odsTreb.FieldByName('ECP3_FK_ID').IsNull = False then
  //        odsTreb.FieldByName('FL_ECP3').AsInteger := 0
  //      else
          case FCryptoProUtils.CheckSign( odsTreb.FieldByName('ECP3_FK_ID').AsInteger ) of
            True : odsTreb.FieldByName('FL_ECP3').AsInteger := 1;
            False: odsTreb.FieldByName('FL_ECP3').AsInteger := -1;
          end;
        odsTreb.Post;
      end;

      odsTreb.Next;
    end;
    odsTreb.Filtered := false;    
    odsTreb.First;    
  end;
  
  cxGridTrebLst.EndUpdate;
  odsTreb.AfterScroll:=odsTrebAfterScroll;
  odsTrebAfterScroll(odsTreb);
end;

procedure TfrmTrebLst.acEditExecute(Sender: TObject);
var frmTrebManual : TfrmTrebManual;
    odsSelBeforeEdit : TOracleDataSet;
    nTrebStatus : Integer;
begin
  //Запись в таблицу TTreb
  frmTrebManual := TfrmTrebManual.Create(Self);
  try
    //Проверяем статус непосредственно перед изменением
    odsSelBeforeEdit := TOracleDataSet.Create(Self);
    odsSelBeforeEdit.Session := odsTreb.Session;
    odsSelBeforeEdit.SQL.Text := 'select MED.GET_TREBSTATUS('+IntTOStr(odsTreb.FieldByName('FK_ID').AsInteger)+') AS FK_PROCESSED from dual';
    odsSelBeforeEdit.Open;
    nTrebStatus := odsSelBeforeEdit.FieldByName('FK_PROCESSED').AsInteger;
    odsSelBeforeEdit.Close;
    odsSelBeforeEdit.Free;

    frmTrebManual.iStatus:=nTrebStatus;
    frmTrebManual.bReadOnly := (nTrebStatus <> 0) //Статус <> "Необработанно"
            or bSelect
            or ( (odsTreb.FieldByName('FL_EDIT').AsInteger = 0) and
                 (dmMain.ConfigParams.GetParamValue('FUNC_IGNORE_TREB_PODPIS', 1)=0) );   //используем форму для выбора
            {or (trunc(odsTreb.FieldByName('fd_date').AsDateTime) <= trunc(dateClose))};    //период закрыт

    if nTrebStatus=0 then frmTrebManual.deRegisterDate.Enabled:=true //необработан
    else									frmTrebManual.deRegisterDate.Enabled:=false;
    // блокировка документа от изменения другим пользователем
    if frmTrebManual.bReadOnly = False then
    begin
      frmTrebManual.sLockMO := '';
      case dmMain.SetLock('MED.TTREB.FK_ID='+IntTOStr(odsTreb.FieldByName('FK_ID').AsInteger), frmTrebManual.CurTrebLockID, frmTrebManual.sLockMO) of
        0 : ;
        else
        begin
          Application.MessageBox(PAnsiChar('Выбранное требование уже используется другим сотрудником:'#13#10+frmTrebManual.sLockMO), 'Внимание', MB_OK+MB_ICONWARNING);
          Screen.Cursor := crDefault;
          Exit;
        end;
      end;
    end;

    frmTrebManual.idTreb := odsTreb.FieldByName('FK_ID').AsInteger;

    frmTrebManual.deNumTreb.Text := odsTreb.FieldByName('FC_TREB').AsString;
    frmTrebManual.deRegisterDate.Date := odsTreb.FieldByName('FD_DATE').AsDateTime;
    frmTrebManual.LcbFrom.KeyValue := odsTreb.FieldByName('FK_MOFROMID').AsInteger;
//    frmTrebManual.lcbFromClick(nil);
    frmTrebManual.LcbTo.KeyValue := odsTreb.FieldByName('FK_MOTOID').AsInteger;
//    frmTrebManual.LCBToClick(nil);
    frmTrebManual.lcbMO_GroupFrom.KeyValue := odsTreb.FieldByName('FK_MOGROUPID_FROM').AsInteger;
    frmTrebManual.lcbMO_GroupTo.KeyValue := odsTreb.FieldByName('FK_MOGROUPID_TO').AsInteger;
    frmTrebManual.mComment.Text := odsTreb.FieldByName('FC_COMMENT').AsString;
    frmTrebManual.chbFL_CITO.Checked := odsTreb.FieldByName('FL_CITO').AsInteger = 1;
    frmTrebManual.lcbFinSource.EditValue := odsTreb.FieldByName('FK_FINSOURCE_ID').AsVariant;
    
    if FIsTrebByPattern then // когда делаем требование по образцу, то необходимо разлочить поля от кого и откуда
    begin
      frmTrebManual.lcbFrom.Enabled := True;
      frmTrebManual.lcbMO_GroupFrom.Enabled := True;
    end;
    if frmTrebManual.ShowModal = mrOk then
      begin
  //      DoSetTreb(frmTrebManual.idTreb,
        dmMain.PKGTREB.DOSETTREB( frmTrebManual.idTreb,
                                  frmTrebManual.deNumTreb.Text,
                                  frmTrebManual.deRegisterDate.Date,
                                  frmTrebManual.LcbFrom.KeyValue,
                                  frmTrebManual.LcbTo.KeyValue,
                                  frmTrebManual.mComment.Text,
                                  frmTrebManual.lcbMO_GroupFrom.KeyValue,
                                  frmTrebManual.lcbMO_GroupTo.KeyValue,
                                  frmTrebManual.chbFL_CITO.Tag );

        if(dmMain.ConfigParams.GetParamValue('FUNC_REQUIRE_FINSOURCE_IN_TREB', 0) = 1) then
        begin
          dmMain.InitAdditionalUpdateTable('MED.TTREB');
          dmMain.AddAdditionalUpdateTable('FK_FINSOURCE_ID', otInteger, frmTrebManual.lcbFinSource.EditValue);
          dmMain.ExecuteAdditionalUpdateTable('FK_ID', otInteger, frmTrebManual.idTreb); // обновление таблицы TDOCS выполнено
        end;

        dmMain.os.Commit;
        odsTreb.AfterScroll := nil;
        odsTreb.Close;
        odsTreb.Open;

        odsTreb.Locate('FK_ID', frmTrebManual.idTreb, []);
        odsTreb.AfterScroll := odsTrebAfterScroll;
        odsTrebAfterScroll( odsTreb );
      end
      else dmMain.os.Rollback;
  finally
    frmTrebManual.Free;
  end;
end;

procedure TfrmTrebLst.acDeleteExecute(Sender: TObject);
begin
	if Windows.MessageBox(Self.Handle, PChar('Вы действительно хотите удалить данную запись ?'), 'Предупреждение', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = mrYes then
  begin
    if trunc(odsTreb.FieldByName('fd_date').AsDateTime) <= trunc(dateClose) then
    begin
      windows.MessageBox(Self.Handle, PChar('Удаление не возможно!' + #10#13 +
        'Период закрыт (' + FormatDateTime('dd.mm.yyyy',DateClose) + ')'), 'Предупреждение', MB_OK);
      exit;
    end;
    //Dpc удаляются триггером
    DoDelTreb(odsTreb.FieldByName('FK_ID').AsInteger);
    dmMain.os.Commit;
    acRefresh.Execute;
  end;
end;

procedure TfrmTrebLst.acPrintTrebExecute(Sender: TObject);
var
  P : TPoint;
begin
  if dmPrintSelect.PrintFlag = 0 then
  begin
    P.X := 0;
    P.Y := tbuPrint.Height;
    P := tbuPrint.ClientToScreen(P);
    dmPrintSelect.pmPrintSelect.Popup(P.X, P.Y);
    Application.ProcessMessages; // только после этого срабатывает событие TdmPrintReports.miPrintToExcelClick(Sender: TObject);
  end;                           // и проставляется флаг - далее проверки на номер флага должны быть внутри каждой функции печати
  if dmPrintSelect.PrintFlag = 0 then Exit;
  try
    dmPrintReports.PrintSimlpeTreb( odsTreb.FieldByName('FK_ID').AsInteger );
  finally
    dmPrintSelect.PrintFlag := 0;
  end;
end;

procedure TfrmTrebLst.acPrintTrebNaklExecute(Sender: TObject);
begin
  try
    dmPrintSelect.PrintFlag := 2;
    odsTDocs.Close;
    odsTDocs.SetVariable('PTREBID', odsTreb.FieldByName('FK_ID').AsVariant);
    odsTDocs.SetVariable('PDPID',   odsTreb.FieldByName('FK_DPID').AsVariant);
    odsTDocs.Open;

    if (dmMain.ConfigParams.GetParamValue('FUNC_IS_PRINT_VIDANO_IN_TREB_NAKL_BY_TREBID', 0) = 0)or
       (nvl(odsTreb.FieldByName('FK_DPID').AsVariant,-1) = -1) then
      dmPrintReports.PrintTreb( -1,
                                odsTDocs.FieldByName('FC_DOC').AsString,
                                odsTDocs.FieldByName('FD_INVOICE').AsDateTime,
                                odsTDocs.FieldByName('FC_MOGROUPID_FROM_ORIG').AsString,
                                odsTDocs.FieldByName('FC_MOGROUPID_TO_ORIG').AsString,
                                odsTDocs.FieldByName('FC_DOCMIX').AsString+'.xls',
                                odsTDocs.FieldByName('NAMEFROM').AsString,
                                odsTDocs.FieldByName('NAMETO').AsString,
                                False,
                                fdmMain.nvl(odsTDocs.FieldByName('mogr_from_fk_sklad_id').AsInteger,-1),
//                                odsTreb.FieldByName('FK_ID').AsVariant,
                                odsTreb.FieldByName('FK_ID').AsInteger,
                                False,
                                (dmMain.ConfigParams.GetParamValue('FUNC_USE_LAT_NAME_IN_TREB_IN_TREBLIST', 0) = 1)
                              )
    else
      dmPrintReports.PrintTreb( odsTreb.FieldByName('FK_DPID').AsVariant,
                                odsTDocs.FieldByName('FC_DOC').AsString,
                                odsTDocs.FieldByName('FD_INVOICE').AsDateTime,
                                odsTDocs.FieldByName('FC_MOGROUPID_FROM_ORIG').AsString,
                                odsTDocs.FieldByName('FC_MOGROUPID_TO_ORIG').AsString,
                                odsTDocs.FieldByName('FC_DOCMIX').AsString+'.xls',
                                odsTDocs.FieldByName('NAMEFROM').AsString,
                                odsTDocs.FieldByName('NAMETO').AsString,
                                False,
                                fdmMain.nvl(odsTDocs.FieldByName('mogr_from_fk_sklad_id').AsInteger,-1),
                                -1,
                                False,
                                (dmMain.ConfigParams.GetParamValue('FUNC_USE_LAT_NAME_IN_TREB_IN_TREBLIST', 0) = 1)
                              );
  finally
    dmPrintSelect.PrintFlag := 0;
    odsTDocs.Close;
  end;
end;

procedure TfrmTrebLst.acQuotaExecute(Sender: TObject);
begin
  DoShowTrebQuota;
end;

procedure TfrmTrebLst.acAddByNaznListExecute(Sender: TObject);
var frmTrebByNaz : TfrmTrebByNaz;
    nTreb : Integer; // Ид требования
begin
  nTreb := -1;

	try
    try
      frmTrebByNaz := TfrmTrebByNaz.Create(Self);
      frmTrebByNaz.deRegisterDate.Date := ServerDate(dmMain.os);

      nTreb := trunc(dmMain.PKGTREB.CREATESHABLON(MOID)); //"делаем скилет" (так делается если есть foregnKeys с таблицей TTreb_Dpc)
      if nTreb < 0 then
        RaiseException(0, 0 , 0, nil );

      frmTrebByNaz.idTreb := nTreb;
    except
      on e : Exception do
      begin
        dmMain.os.Rollback;
        Application.MessageBox( PAnsiChar( 'Не удалось сформировать требование!' + #13#10 + e.Message ), 'Ошибка', MB_ICONERROR + MB_OK);
        Exit;
      end;
    end;

    //переместим все записи для nTreb и MOID
//			dmMain.PKGTREB.MOVETTREBDPCBYNAZTOTTREBDPC(nTreb, round(dmMain.pkgMedSes.GetCurMo));
//			dmMain.PKGTREB.MOVETTREBDPCBYNAZTOTTREBDPC(nTreb, round(dmMain.pkgMedSes.GET_CUR_MOGROUP_BY_CUR_MO));
		if frmTrebByNaz.ShowModal = mrOk then
    try
      //"наращиваем на скилет Мясо"
      dmMain.PKGTREB.DOSETTREB(nTreb, '', frmTrebByNaz.deRegisterDate.Date,
        frmTrebByNaz.LcbFrom.KeyValue, frmTrebByNaz.LcbTo.KeyValue,
        frmTrebByNaz.mComment.Text,
        frmTrebByNaz.lcbMO_GroupFrom.KeyValue, frmTrebByNaz.lcbMO_GroupTo.KeyValue);

      if(dmMain.ConfigParams.GetParamValue('FUNC_REQUIRE_FINSOURCE_IN_TREB', 0) = 1) then
      begin
        dmMain.InitAdditionalUpdateTable('MED.TTREB');
        dmMain.AddAdditionalUpdateTable('FK_FINSOURCE_ID', otInteger, frmTrebByNaz.lcbFinSource.KeyValue);
        dmMain.ExecuteAdditionalUpdateTable('FK_ID', otInteger, nTreb); // обновление таблицы TDOCS выполнено
      end;
      dmMain.os.Commit;
    except
      on e : Exception do
      begin
        dmMain.os.Rollback;
        Application.MessageBox( PAnsiChar( 'Ошибка при сохранении требования! Требование не сохранено!' + #13#10 + e.Message ), 'Ошибка', MB_OK + MB_ICONWARNING);
        Exit;
      end;
    end
    else
      dmMain.os.Rollback;

  finally
    frmTrebByNaz.Free;
  end;

  odsTreb.AfterScroll := nil;
  odsTreb.Close;
  odsTreb.Open;
  odsTreb.Locate('FK_ID',nTreb,[]);
  odsTreb.AfterScroll := odsTrebAfterScroll;
  odsTrebAfterScroll( odsTreb );

end;

procedure TfrmTrebLst.frTrebGetValue(const ParName: String;
	var ParValue: Variant);
begin
//  if ParName = 'var_mo' then ParValue := odsTreb.FieldByName('FC_MOFROM').AsString
	if ParName = 'var_sender' then
  begin
    with TOracleQuery.Create(nil) do
    try
      Session := dmMain.Os;
      Sql.Text := 'SELECT FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''CONFIG'' AND FC_KEY = ''SENDER''';
      try
        Execute;
        ParValue := Field(0);
      except
        ParValue := '';
      end;
    finally
      Free;
    end;
  end
  else if ParName = 'var_receiver' then
  begin
    with TOracleQuery.Create(nil) do
    try
			Session := dmMain.Os;
      Sql.Text := 'SELECT FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''MANAGER_DOC'' AND FC_KEY = ''CLIENT_NAME_SMS''';
      try
        Execute;
        ParValue := Field(0);
      except
        ParValue := '';
      end;
    finally
      Free;
    end;
  end
  else if ParName = 'var_MagOtd' then ParValue := IniReadString(iniFileName,'ZavOtdel','FIO')
  else if ParName = 'var_zam_gl_vra4' then
  begin
    with TOracleQuery.Create(nil) do
    try
      Session := dmMain.Os;
      Sql.Text := 'SELECT FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''MANAGER_DOC'' AND FC_KEY = ''ZAM_GL_VRA4''';
      try
        Execute;
        ParValue := Field(0);
      except
        ParValue := '';
      end;
    finally
      Free;
    end;
  end;
end;

procedure TfrmTrebLst.odsTrebAfterScroll(DataSet: TDataSet);
var
  DocIsSign: Boolean;
begin

  DocIsSign := True;
  if (not DataSet.IsEmpty) then DocIsSign := odsTreb.FieldByName('FL_EDIT').AsInteger = 0;
  if  (not DocIsSign) then
  begin
    acSign.Caption := '  Утвердить  ';
  end
  else
  begin
    acSign.Caption := 'Отм. утверж.';
  end;

//  acPrintTreb.Enabled := not DataSet.IsEmpty;
  acSelect.Enabled := ((not DataSet.IsEmpty) or (dmMain.ConfigParams.GetParamValue('FUNC_EDIT_TREB_IN_RASH', 0)=1)) and (bSelect) and (DocIsSign or (dmMain.ConfigParams.GetParamValue('FUNC_IGNORE_TREB_PODPIS', 1)=1));
  //tbuSelect.Enabled := acSelect.Enabled;
  acAddTrebByPattern.Enabled := not DataSet.IsEmpty;

  acEdit.Enabled := (not DataSet.IsEmpty) and (not bSelect);
  case DataSet.FieldByName('FK_PROCESSED').AsInteger of
    0: begin
         acEdit.Caption := 'Изменить';
         acSign.Enabled := true;
       end;
    2: begin  //Если отпущено, то снять подпись нельзя
         acSign.Enabled := not DocIsSign;
       end
  else
  begin // 1 - корректируется
    acEdit.Caption := 'Просмотр';
    acSign.Enabled := True;
  end;
  end;
  if (DocIsSign and (dmMain.ConfigParams.GetParamValue('FUNC_IGNORE_TREB_PODPIS', 1)=0)) then
    acEdit.Caption := 'Просмотр';


  acDelete.Enabled := (not DataSet.IsEmpty) and ((not DocIsSign) or (dmMain.ConfigParams.GetParamValue('FUNC_IGNORE_TREB_PODPIS', 1)=1)) and (not bSelect) and
    (DataSet.FieldByName('FK_PROCESSED').AsInteger = 0); //необработанно

  odsMedic.Close;
  odsMedic.SetVariable('FK_TREBID', odsTreb.FieldByName('FK_ID').AsInteger);
  odsMedic.Open;
end;

procedure TfrmTrebLst.odsTrebApplyRecord(Sender: TOracleDataSet; Action: Char;
  var Applied: Boolean; var NewRowId: string);
begin
  case Action of
    'U' : Applied := True;  
  end;
end;

procedure TfrmTrebLst.acSelectExecute(Sender: TObject);
begin
  nId := odsTreb.FieldByName('FK_ID').AsInteger;
  ModalResult := mrOk;
end;  

procedure DoSetEditTreb();
var id, FL_EDIT_OLD: integer;
    oq: TOracleQuery;
begin
  id := frmTrebLst.odsTreb.FieldByName('FK_ID').AsInteger;
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := dmMain.os;
    oq.SQL.Text := 'select FL_EDIT from MED.TTREB WHERE FK_ID=:pTrebID';
    oq.DeclareAndSet('pTrebID',otInteger, id);
    oq.Execute;

    FL_EDIT_OLD := -1;

    if (not oq.Eof)and(not VarIsEmpty(oq.Field(0))) then
      FL_EDIT_OLD := oq.FieldAsInteger(0);
    oq.Close;
    case FL_EDIT_OLD of
      1: oq.Sql.Text := 'UPDATE MED.TTREB SET FL_EDIT=0 WHERE FK_ID=:pTrebID AND FL_EDIT = 1' //подписать
    else
      oq.Sql.Text := 'UPDATE MED.TTREB SET FL_EDIT=1 WHERE FK_ID=:pTrebID AND FL_EDIT = 0'; //отменить подпись
    end;

    oq.DeleteVariables;
    oq.DeclareAndSet('pTrebID',otInteger, id);

    try
      oq.Execute;
      dmMain.os.Commit;

      frmTrebLst.odsTreb.AfterScroll := nil;
      frmTrebLst.odsTreb.Close;
      frmTrebLst.odsTreb.Open;

      frmTrebLst.odsTreb.Locate('FK_ID', id, []);
      frmTrebLst.odsTreb.AfterScroll := frmTrebLst.odsTrebAfterScroll;
      frmTrebLst.odsTrebAfterScroll( frmTrebLst.odsTreb );
    except
    end;
  finally
    oq.Free;
  end;
end;

procedure TfrmTrebLst.acSignExecute(Sender: TObject);
var
  sMess : string;
begin
// теперь выводим сообщение в зависимости от подписанности требования
  case odsTreb.FieldByName('fl_edit').AsInteger of
    0:sMess := 'Отменить подпись в требовании ' + odsTreb.FieldByName('FC_TREB').AsString + '?';
  else
    sMess := 'Утвердить требование ' + odsTreb.FieldByName('FC_TREB').AsString + '?';
  end;

	if Application.MessageBox(pChar(sMess),'Внимание',
    mb_yesno + mb_iconquestion + mb_defbutton1) = idyes
  then DoSetEditTreb;
end;

procedure TfrmTrebLst.SetbSelect(const Value: Boolean);
begin
	FbSelect := Value;

  acSelect.Enabled := Value;
  acSelect.Visible := Value;

  if (Value)and(dmMain.ConfigParams.GetParamValue('FUNC_EDIT_TREB_IN_RASH', 0) = 1) then
  begin
    acNewClearTreb.Enabled := True;
    acNewClearTreb.Visible := True;
    tbuSelect.Style        := tbsDropDown;
    tbuSelect.DropdownMenu := pmSelect;
  end;

  acAdd.Enabled := not Value;
  acEdit.Enabled := not Value;
  acDelete.Enabled := acDelete.Enabled and acAdd.Enabled;

  acAdd.Visible := acAdd.Enabled;
  acDelete.Visible := acDelete.Enabled;

  if (FbSelect = True) and (RPO_SELECT = False) then
  begin
    odsTreb.Filtered := False;
    odsTreb.Filter := 'FK_PROCESSED = 0'; // только 0 - 'Не отпущено'
    odsTreb.Filtered := True;
  end;
end;

procedure TfrmTrebLst.dbTrebLstDblClick(Sender: TObject);
begin
	if acSelect.Enabled then acSelect.Execute
  else acEdit.Execute;
end;

procedure TfrmTrebLst.dedDate1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then acrefresh.Execute;
end;

procedure TfrmTrebLst.dedDate1PropertiesEditValueChanged(Sender: TObject);
begin
 acrefresh.Execute;
end;

procedure TfrmTrebLst.FormShow(Sender: TObject);
begin
// прячем ненужные кнопки
  tbuSelect.Visible := bSelect;
  ToolButton11.Visible := bSelect;

  ToolButton4.Visible := not bSelect;
  tbuAdd.Visible := not bSelect;
  tbuEdit.Visible := not bSelect;
  tbuDel.Visible := not bSelect;
  tbuPrint.Visible := not bSelect;
  ToolButton8.Visible := not bSelect;
  tbuSign.Visible := tbuSign.Visible and (not bSelect);
  tbuSignSep.Visible := tbuSign.Visible and (not bSelect);

	acRefresh.Execute;
  acSelect.Enabled := (odsTreb.RecordCount > 0) and (bSelect);
  odsTrebAfterScroll(odsTreb);
  acNewClearTreb.Enabled := (dmMain.ConfigParams.GetParamValue('FUNC_EDIT_TREB_IN_RASH', 0) = 1);

  cxGridTrebLstDBTableView1FK_FINSOURCE_ID.VisibleForCustomization := (dmMain.ConfigParams.GetParamValue('FUNC_REQUIRE_FINSOURCE_IN_TREB', 0) = 1);
  cxGridTrebLstDBTableView1FK_FINSOURCE_ID.Visible := (dmMain.ConfigParams.GetParamValue('FUNC_REQUIRE_FINSOURCE_IN_TREB', 0) = 1);

  if (dmMain.ConfigParams.GetParamValue('FUNC_USE_TREB_FOR_RPO', 0) = 0) then
  begin
    cxGridTrebLstDBTableView1_FL_RPO.Visible := False;
    cxGridTrebLstDBTableView1_FL_RPO.VisibleForCustomization := False;    
  end;
end;

procedure TfrmTrebLst.frTrebObjectClick(View: TfrView);
var frmDateInput : TfrmDateInput;
    vPos         : Integer;
    aPrompt      : String; 
begin
  if (View.Name = 'meComment') or (View.Name = 'Memo56') or (View.Name = 'Memo57') or (View.Name = 'Memo1') or
     (View.Name = 'Memo58') or (View.Name = 'Memo60') or (View.Name = 'Memo20') or (View.Name = 'Memo51') then
  begin
    View.FrameTyp := 15;
    View.FrameColor := clRed;
    vPos := frTreb.Preview.Window.VScrollBar.Position;
    frTreb.Preview.Zoom := frTreb.Preview.Zoom; //дабы перерисовался отчет
    frTreb.Preview.Window.VScrollBar.Position := vPos;
    try
      if (View.Name = 'meComment') then
      begin
        View.Memo.Text := InputBox('Ввод данных','',Remove1310(View.Memo.Text));
      end;

      if (View.Name = 'Memo56') or (View.Name = 'Memo57') then
    //	if StrToInt(Copy(View.Name,5,2)) in [56,57{,42,43,44}] then
    //  if View.Name = 'Memo56' then
      begin
    //    View.FrameTyp := 15;
    //    View.FrameColor := clRed;
    //    vPos := frTreb.Preview.Window.VScrollBar.Position;
    //    frTreb.Preview.Zoom := frTreb.Preview.Zoom; //дабы перерисовался отчет
    //    frTreb.Preview.Window.VScrollBar.Position := vPos;

          frmDateInput := TfrmDateInput.Create(frTreb.Preview.Window);
          try
            if frmDateInput.ShowModal = mrOk then
            begin
              if frmDateInput.deDate.Date = NullDate then
                View.Memo.Text := '"     "                 200  г.'
              else
                View.Memo.Text := FormatDateTime('''"''dd''"'' mmmm yyyy ''г.''',frmDateInput.deDate.Date);
            end;
          finally
            frmDateInput.Free;
          end;
  //      finally
  //        View.FrameTyp := 0;
  //        View.FrameColor := clBlack;
  //        vPos := frTreb.Preview.Window.VScrollBar.Position;
  //        frTreb.Preview.Zoom := frTreb.Preview.Zoom; //дабы перерисовался отчет
  //        frTreb.Preview.Window.VScrollBar.Position := vPos;
  //      end;
      end
      else if (View.Name = 'Memo1') or (View.Name = 'Memo58') or (View.Name = 'Memo60') or (View.Name = 'Memo20') or (View.Name = 'Memo51') then
    //  else if StrToInt(Copy(View.Name,5,2)) in [1,58,60,20,51] then
      begin

        Case StrToInt(Copy(View.Name,5,2)) of
    //      1  : aPrompt := 'Заместитель главного врача по мед. части';
    //      58 : aPrompt := 'Отпустил';
          58 : aPrompt := 'Затребовал';
          60 : aPrompt := 'Получил';
          20 : aPrompt := 'Материальное ответственное лицо';
          51 : aPrompt := 'Структурное подразделение';
        end;

//        View.FrameTyp := 15;
//        View.FrameColor := clRed;
//        vPos := frTreb.Preview.Window.VScrollBar.Position;
//        frTreb.Preview.Zoom := frTreb.Preview.Zoom; //дабы перерисовался отчет
//        frTreb.Preview.Window.VScrollBar.Position := vPos;
//        try
          View.Memo.Text := InputBox('Ввод данных',aPrompt,Remove1310(View.Memo.Text));
//        finally
//          View.FrameTyp := 0;
//          View.FrameColor := clBlack;
//          vPos := frTreb.Preview.Window.VScrollBar.Position;
//          frTreb.Preview.Zoom := frTreb.Preview.Zoom; //дабы перерисовался отчет
//          frTreb.Preview.Window.VScrollBar.Position := vPos;
      end;
    finally
      View.FrameTyp := 0;
      View.FrameColor := clBlack;
      vPos := frTreb.Preview.Window.VScrollBar.Position;
      frTreb.Preview.Zoom := frTreb.Preview.Zoom; //дабы перерисовался отчет
      frTreb.Preview.Window.VScrollBar.Position := vPos;
    end;
  end;

end;

procedure TfrmTrebLst.frTrebMouseOverObject(View: TfrView;
  var Cursor: TCursor);
begin
  if (View.Name = 'meComment') or (View.Name = 'Memo56') or (View.Name = 'Memo57') or (View.Name = 'Memo1') or
     (View.Name = 'Memo58') or (View.Name = 'Memo60') or (View.Name = 'Memo20') or (View.Name = 'Memo51') then
//	if StrToInt(Copy(View.Name,5,2)) in [56,57,{42,43,{44,}1,58,60,20,51] then
  begin
    Cursor := crHandPoint;
  end;
end;

procedure TfrmTrebLst.acFillMinZapasExecute(Sender: TObject);
var frmTrebManual : TfrmTrebManual;
//    nTreb : Integer; // Ид требования
begin
  frmTrebManual := TfrmTrebManual.Create(Self);
  frmTrebManual.deRegisterDate.Date := ServerDate(dmMain.os);
  frmTrebManual.iWho_called:=1;
  try
    frmTrebManual.idTreb := trunc(dmMain.PKGTREB.CREATESHABLON(MOID)); //"делаем скилет" (так делается если есть foregnKeys с таблицей TTreb_Dpc)
    frmTrebManual.bReadOnly := False;
    frmTrebManual.iStatus:=0;

    frmTrebManual.bFillMinZapas := True;

    if frmTrebManual.ShowModal = mrOk then
    begin
      dmMain.PKGTREB.DOSETTREB( frmTrebManual.idTreb,
//                                Null, // нафига, я тебя спрашиваю, о таинственный незнакомец, ты поставил это???
                                '', // Исправил Воронов О.А., 01.06.2007
                                frmTrebManual.deRegisterDate.Date,
                                frmTrebManual.LcbFrom.KeyValue, frmTrebManual.LcbTo.KeyValue,
                                frmTrebManual.mComment.Text,
                                frmTrebManual.lcbMO_GroupFrom.KeyValue, frmTrebManual.lcbMO_GroupTo.KeyValue,
                                frmTrebManual.chbFL_CITO.Tag);

      dmMain.os.Commit;

      odsTreb.AfterScroll := nil;
      odsTreb.Close;
      odsTreb.Open;
      odsTreb.Locate('FK_ID',frmTrebManual.idTreb,[]);
      odsTreb.AfterScroll := odsTrebAfterScroll;
      odsTrebAfterScroll( odsTreb );
    end
    else dmMain.os.Rollback;
  finally
    frmTrebManual.Free;
  end;
end;

procedure TfrmTrebLst.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormStyle = fsMDIChild then
    Action := caFree
  else
    Action := caHide;  

  // проверки на валидность дат
  dedDate1.PostEditValue;
  dedDate2.PostEditValue;  

  FormStorage.AppStorage.Flush;
  IniWriteString( iniFileName, Self.Name, 'dpeDate1Checked',  BoolToStr(chbDate1.Checked, True) );  // сохраняем  булеан в виде слов
  IniWriteString( iniFileName, Self.Name, 'dpeDate2Checked',  BoolToStr(chbDate2.Checked, True) );
  IniWriteString( iniFileName, Self.Name, 'dpeDate1Date',     DateToStr(TRUNC(dedDate1.EditValue))   );
  IniWriteString( iniFileName, Self.Name, 'dpeDate2Date',     DateToStr(TRUNC(dedDate2.EditValue))   );  

  if FIsUseECPInTreb then
    FCryptoProUtils.Free;  
end;

procedure TfrmTrebLst.FormCreate(Sender: TObject);
var
  CurDate : TDate;
begin
  CurDate := Trunc(ServerDate(dmMain.os));
  FNotRefresh := True;
  RPO_SELECT := False;
  chbDate1.Checked := UpperCase(IniReadString( iniFileName, Self.Name, 'dpeDate1Checked',  'TRUE')) = 'TRUE';
  chbDate2.Checked := UpperCase(IniReadString( iniFileName, Self.Name, 'dpeDate2Checked',  'TRUE')) = 'TRUE';
  dedDate1.EditValue := StrToDate(IniReadString( iniFileName, Self.Name, 'dpeDate1Date', DateToStr(StartOfTheYear(CurDate) )) );
  dedDate2.EditValue := StrToDate(IniReadString( iniFileName, Self.Name, 'dpeDate2Date', DateToStr(EndOfTheYear(CurDate))) );
  // если дата из настроек не влючает сегодняшний день, то ставим периодом текущий год
  if (chbDate1.Checked)and(Trunc(dedDate1.Date) > CurDate)or(Trunc(dedDate2.Date) < CurDate)and(chbDate2.Checked) then
  begin
    dedDate1.EditValue := StartOfTheYear(CurDate);
    dedDate2.EditValue := EndOfTheYear(CurDate);
  end;
  FNotRefresh := False;

  // провизоры не могут делать требования на пополнение мин. запаса и по листам назначений
  // давать порвизору делать требование по назначению логично только с от лица другого отделения.
  //Нужно Делать дополнительные проверки (нельзя допускать чтобы провизор делал требование самому себе),
  // разлочить поля от кого Воронов О.А. 21.06.2008
  acAddByNaznList.Enabled := (frmMain.ProvisorState = 0);// or ((frmMain.ProvisorState = 1)and((dmPrintReports.GetValueFromTSMINI('medica.exe', 'FUNC_TREB_BY_NAZ_FOR_PROVIZOR') = '1')));
  acAddByNaznList.Visible := acAddByNaznList.Enabled;
  acFillMinZapas.Enabled  := frmMain.ProvisorState = 0;
  acFillMinZapas.Visible  := acFillMinZapas.Enabled;

	//#todo1 убрать когда Нягань будет назначать

  // deemaric comment
  // при переносе на Югорскую базу необходимо было чтоб
  // пункт меню pmTreb 'По листам назначений' был активным
// 	acAddByNaznList.Enabled := dmMain.bNyagan;
//  acAddByNaznList.Visible := dmMain.bNyagan;

	MOID:=dmMain.nCurMO;
  FIsTrebByPattern := False;
  IsNewClearTreb := False;

  acSign.Visible := dmMain.ConfigParams.GetParamValue('FUNC_IGNORE_TREB_PODPIS', 1)=0;
  tbuSignSep.Visible := dmMain.ConfigParams.GetParamValue('FUNC_IGNORE_TREB_PODPIS', 1)=0;
  cxGridTrebLstDBTableView1FL_EDIT.Visible := dmMain.ConfigParams.GetParamValue('FUNC_IGNORE_TREB_PODPIS', 1)=0;

  // настройки видимости ЭЦП 
  FIsUseECPInTreb := (dmMain.ConfigParams.GetParamValue('FUNC_USE_ECP_IN_TREB', 0) = 1);
  if FIsUseECPInTreb = False then
  begin
    cxGridTrebLstDBTableView1_ECP1_NOTE.Visible := False;
    cxGridTrebLstDBTableView1_ECP2_NOTE.Visible := False;
    cxGridTrebLstDBTableView1_ECP3_NOTE.Visible := False;

    FormStorage.StoredProps.Delete( FormStorage.StoredProps.IndexOf('cxGridTrebLstDBTableView1_ECP1_NOTE.Visible') );
    FormStorage.StoredProps.Delete( FormStorage.StoredProps.IndexOf('cxGridTrebLstDBTableView1_ECP2_NOTE.Visible') );
    FormStorage.StoredProps.Delete( FormStorage.StoredProps.IndexOf('cxGridTrebLstDBTableView1_ECP3_NOTE.Visible') );
  end;
  cxGridTrebLstDBTableView1_ECP1_NOTE.VisibleForCustomization := FIsUseECPInTreb;
  cxGridTrebLstDBTableView1_ECP2_NOTE.VisibleForCustomization := FIsUseECPInTreb;
  cxGridTrebLstDBTableView1_ECP3_NOTE.VisibleForCustomization := FIsUseECPInTreb;

  if FIsUseECPInTreb then
  begin
    FCryptoProUtils := TCryptoProUils.Create( dmMain.os );

    odsTreb.SetVariable('ECP1_RULE_ID', dmMain.oqECP_RULE_ID.GetVariable('ECP1_RULE_ID'));
    odsTreb.SetVariable('ECP2_RULE_ID', dmMain.oqECP_RULE_ID.GetVariable('ECP2_RULE_ID'));
    odsTreb.SetVariable('ECP3_RULE_ID', dmMain.oqECP_RULE_ID.GetVariable('ECP3_RULE_ID'));

    odsTreb.SQL.Text := StringReplace(odsTreb.SQL.Text, '--ECP', '', [rfReplaceAll]);
  end;

  acAddForRPO.Visible := (dmMain.ConfigParams.GetParamValue('FUNC_USE_TREB_FOR_RPO', 0) = 1);
end;

procedure TfrmTrebLst.frTrebUserFunction(const Name: String; p1, p2,
  p3: Variant; var Val: Variant);
var
  d : Double;
  IntNumber : Integer;
begin
	if name = 'MONEYSTR' then
	begin
    d := frParser.Calc(p1);
		val := MoneyToString(d, TRUE);
  end;
	if name = 'GET_NAIM_KOL' then
	begin
    IntNumber := frParser.Calc(p1);
		val := DMMAIN.get_countstr((IntNumber));
  end;
end;

procedure TfrmTrebLst.MenuItem1Click(Sender: TObject);
begin
  try
    dmPrintReports.PRINT_TREB_NAKL_V2_FNAME := 'frxTrebNakl_v2.fr3';
    dmPrintSelect.PrintFlag := 2;
    odsTDocs.Close;
    odsTDocs.SetVariable('PTREBID', odsTreb.FieldByName('FK_ID').AsVariant);
    odsTDocs.SetVariable('PDPID',   odsTreb.FieldByName('FK_DPID').AsVariant);
    odsTDocs.Open;

    if (dmMain.ConfigParams.GetParamValue('FUNC_IS_PRINT_VIDANO_IN_TREB_NAKL_BY_TREBID', 0) = 0)or
       (nvl(odsTreb.FieldByName('FK_DPID').AsVariant,-1) = -1) then
      dmPrintReports.PrintTreb( -1,
                                odsTDocs.FieldByName('FC_DOC').AsString,
                                odsTDocs.FieldByName('FD_INVOICE').AsDateTime,
                                odsTDocs.FieldByName('FC_MOGROUPID_FROM_ORIG').AsString,
                                odsTDocs.FieldByName('FC_MOGROUPID_TO_ORIG').AsString,
                                odsTDocs.FieldByName('FC_DOCMIX').AsString+'.xls',
                                odsTDocs.FieldByName('NAMEFROM').AsString,
                                odsTDocs.FieldByName('NAMETO').AsString,
                                False,
                                fdmMain.nvl(odsTDocs.FieldByName('mogr_from_fk_sklad_id').AsInteger,-1),
                                odsTreb.FieldByName('FK_ID').AsVariant
                              )
    else
      dmPrintReports.PrintTreb( odsTreb.FieldByName('FK_DPID').AsVariant,
                                odsTDocs.FieldByName('FC_DOC').AsString,
                                odsTDocs.FieldByName('FD_INVOICE').AsDateTime,
                                odsTDocs.FieldByName('FC_MOGROUPID_FROM_ORIG').AsString,
                                odsTDocs.FieldByName('FC_MOGROUPID_TO_ORIG').AsString,
                                odsTDocs.FieldByName('FC_DOCMIX').AsString+'.xls',
                                odsTDocs.FieldByName('NAMEFROM').AsString,
                                odsTDocs.FieldByName('NAMETO').AsString,
                                False,
                                fdmMain.nvl(odsTDocs.FieldByName('mogr_from_fk_sklad_id').AsInteger,-1),
                                -1
                              );
  finally
    dmPrintSelect.PrintFlag := 0;
    dmPrintReports.PRINT_TREB_NAKL_V2_FNAME := '';
    odsTDocs.Close;
  end;
end;

procedure TfrmTrebLst.miDamagedTrebNaklDelClick(Sender: TObject);
var
  ID : variant;
begin
  ID := cxGridTrebLstDBTableView1FK_ID.EditValue;
  oqDamagedTrebNaklDelete.SetVariable('FK_TREBID', ID);
  oqDamagedTrebNaklDelete.Execute;
  dmMain.os.Commit;  

  odsTreb.AfterScroll := nil;
  odsTreb.Close;
  odsTreb.Open;

  odsTreb.Locate('FK_ID', ID, []);
  odsTreb.AfterScroll := odsTrebAfterScroll;
  odsTrebAfterScroll( odsTreb );
end;

procedure TfrmTrebLst.miDamagedTrebNaklRepairClick(Sender: TObject);
var
  ID : variant;
begin
  ID := cxGridTrebLstDBTableView1FK_ID.EditValue;
  oqDamagedTrebNaklRepair.SetVariable('FK_TREBID', ID);
  oqDamagedTrebNaklRepair.Execute;
  dmMain.os.Commit;

  odsTreb.AfterScroll := nil;
  odsTreb.Close;
  odsTreb.Open;

  odsTreb.Locate('FK_ID', ID, []);
  odsTreb.AfterScroll := odsTrebAfterScroll;
  odsTrebAfterScroll( odsTreb );
end;

procedure TfrmTrebLst.N19Click(Sender: TObject);
var
  CurDate : TDate;
begin
  if not Assigned(Sender) then Exit;
  FNotRefresh := True;
  CurDate := ServerDate(dmMain.os);
  case TMenuItem(Sender).Tag of
    1:  // прошлый год
    begin
      dedDate1.EditValue := Trunc(StartOfTheYear(IncYear(CurDate, -1)));
      dedDate2.EditValue := Trunc(EndOfTheYear(IncYear(CurDate, -1)));
    end;

    2:  // Текущий год
    begin
      dedDate1.EditValue := Trunc(StartOfTheYear(CurDate));
      dedDate2.EditValue := Trunc(EndOfTheYear(CurDate));
    end;

    3:  // прошлый месяц
    begin
      dedDate1.EditValue := Trunc(StartOfTheMonth(IncMonth(CurDate,-1)));
      dedDate2.EditValue := Trunc(EndOfTheMonth(IncMonth(CurDate,-1)));
    end;

    4:  // текущий месяц
    begin
      dedDate1.EditValue := Trunc(StartOfTheMonth(CurDate));
      dedDate2.EditValue := Trunc(EndOfTheMonth(CurDate));
    end;

    5:  // текущий день
    begin
      dedDate1.EditValue := Trunc(CurDate);
      dedDate2.EditValue := Trunc(CurDate);
    end;
  end;

  chbDate1.Checked := (TMenuItem(Sender).Tag <> 0);
  chbDate2.Checked := (TMenuItem(Sender).Tag <> 0);
  FNotRefresh := False;
    
  acrefresh.Execute;
end;

procedure TfrmTrebLst.acAddTrebByPatternExecute(Sender: TObject);
var
  IDTreb, IDTrebPattern : Integer; // Ид требования
begin
  IDTrebPattern := odsTreb.FieldByName('FK_ID').AsInteger;
  IDTreb := trunc(dmMain.PKGTREB.CREATESHABLON(MOID)); //"делаем скилет" (так делается если есть foregnKeys с таблицей TTreb_Dpc)
  oqDuplicateTrebDPC.SetVariable('OLD_TREB_ID', IDTrebPattern);
  oqDuplicateTrebDPC.SetVariable('NEW_TREB_ID', IDTreb);
  oqDuplicateTrebDPC.Execute; // копируем все препараты из выбранного требования в новое

  if odsTreb.Modified then odsTreb.Post;
//  dmMain.os.Commit;
  odsTreb.refresh;

  odsTreb.AfterScroll := nil;
  FIsTrebByPattern := True;
  if odsTreb.Locate('FK_ID',IDTreb,[]) then
    acEdit.Execute; // открываем на редактирование требование
  FIsTrebByPattern := False;    
  odsTreb.AfterScroll := odsTrebAfterScroll;
  if fTrebManual.ModalRes <> mrOk then
  begin
    DoDelTreb( IDTreb );
    dmMain.os.Commit;
    acRefresh.Execute;
    odsTreb.AfterScroll := nil;
    odsTreb.Locate('FK_ID',IDTrebPattern,[]);
    odsTreb.AfterScroll := odsTrebAfterScroll;
  end
  else
   ;
end;

procedure TfrmTrebLst.cxGridTrebLstDBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  case AButton of
    mbRight:
    begin
      if dmMain.ConfigParams.GetParamValue('FUNC_PRINT_TREB_NAKL_V2', False) = True then
        pmTrebNaklV2.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y );

      if (ACellViewInfo.Item.Index = cxGridTrebLstDBTableView1FC_PROCESSED.Index)and(dmMain.ConfigParams.GetParamValue('FUNC_DAMAGED_TREB_NAKL', False) = True) then
        pmDamagedTrebNakl.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y );
    end;
  end;
end;

procedure TfrmTrebLst.cxGridTrebLstDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
//  if ANode.Values[ dbTrebLstFL_CITO.Index ] = 1 then  AFont.Style := AFont.Style + [fsBold];
  if AViewInfo.GridRecord.Values[ cxGridTrebLstDBTableView1FL_CITO.Index ] = 1 then  ACanvas.Font.Style := ACanvas.Font.Style + [fsBold];

  if AnsiLowerCase(AViewInfo.Text)=AnsiLowerCase('Нет') then
    ACanvas.Brush.Color := clRed;

  case (FIsUseECPInTreb)and(dmMain.isCryptoProProviderPresent) of
    True:
    begin
      if (AViewInfo.GridRecord.Values[ cxGridTrebLstDBTableView1_FL_ECP1.Index ] = -1)and(AViewInfo.Item.Index = cxGridTrebLstDBTableView1_ECP1_NOTE.Index) then
      begin
        ACanvas.Font.Style := ACanvas.Font.Style + [fsStrikeOut];
        ACanvas.Font.Color := clRed;
      end;
      if (AViewInfo.GridRecord.Values[ cxGridTrebLstDBTableView1_FL_ECP2.Index ] = -1)and(AViewInfo.Item.Index = cxGridTrebLstDBTableView1_ECP2_NOTE.Index) then
      begin
        ACanvas.Font.Style := ACanvas.Font.Style + [fsStrikeOut];
        ACanvas.Font.Color := clRed;
      end;
      if (AViewInfo.GridRecord.Values[ cxGridTrebLstDBTableView1_FL_ECP3.Index ] = -1)and(AViewInfo.Item.Index = cxGridTrebLstDBTableView1_ECP3_NOTE.Index) then
      begin
        ACanvas.Font.Style := ACanvas.Font.Style + [fsStrikeOut];
        ACanvas.Font.Color := clRed;
      end;

      if (AViewInfo.GridRecord.Values[ cxGridTrebLstDBTableView1_FL_ECP1.Index ] = 1)and(AViewInfo.Item.Index = cxGridTrebLstDBTableView1_ECP1_NOTE.Index) then
      begin
        ACanvas.Font.Color := clGreen;
      end;
      if (AViewInfo.GridRecord.Values[ cxGridTrebLstDBTableView1_FL_ECP2.Index ] = 1)and(AViewInfo.Item.Index = cxGridTrebLstDBTableView1_ECP2_NOTE.Index) then
      begin
        ACanvas.Font.Color := clGreen;
      end;
      if (AViewInfo.GridRecord.Values[ cxGridTrebLstDBTableView1_FL_ECP3.Index ] = 1)and(AViewInfo.Item.Index = cxGridTrebLstDBTableView1_ECP3_NOTE.Index) then
      begin
        ACanvas.Font.Color := clGreen;
      end;
    end;
  end;
end;

procedure TfrmTrebLst.DoDelTreb(nID: Integer);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := dmMain.os;
    oq.Sql.Text := 'DELETE FROM MED.TTREB WHERE FK_ID = :FK_ID';
    oq.DeclareVariable('FK_ID',otInteger);
    oq.SetVariable('FK_ID',nID);
    oq.Execute;
  finally
    oq.Free;
  end;
end;

procedure TfrmTrebLst.chbDate1Click(Sender: TObject);
begin
  dedDate1.Enabled := chbDate1.Checked;
  acrefresh.Execute;
end;

procedure TfrmTrebLst.chbDate2Click(Sender: TObject);
begin
  dedDate2.Enabled := chbDate2.Checked;
  acrefresh.Execute;
end;

procedure TfrmTrebLst.cxGridTrebDpcDBTableView1DblClick(Sender: TObject);
begin
  acEdit.Execute;
end;

procedure TfrmTrebLst.acNewClearTrebExecute(Sender: TObject);
var
  FK_TREB_ID : integer;
  oq : TOracleQuery;
begin
  FK_TREB_ID := CreateTrebShablon;
  dmMain.PKGTREB.DOSETTREB(FK_TREB_ID, '', ServerDate(dmMain.os), -1, dmMain.nCurMO, '', -1, dmMain.FK_CurMO_GROUP, 1 );

  //Автоматически подписываем требование
  oq := TOracleQuery.Create(Self);
  oq.Session := dmMain.os;
  oq.SQL.Text := 'update med.ttreb set FL_EDIT = 0 where FK_ID = :pTrebID';
  oq.DeclareAndSet('pTrebID',otInteger,FK_TREB_ID);
  oq.Execute;
  oq.Free;

  nId := FK_TREB_ID;
  IsNewClearTreb := True;
  ModalResult := mrOk;
end;

procedure TfrmTrebLst.tbuSelectClick(Sender: TObject);
begin
  if acSelect.Enabled then acSelect.Execute
  else
    if ((odsTreb.FieldByName('FL_EDIT').AsInteger = 1)and (dmMain.ConfigParams.GetParamValue('FUNC_IGNORE_TREB_PODPIS', 1)=0))then
      Application.MessageBox('Требование ещё не утверждено. Вы не можете его выбрать.','Предупреждение',MB_ICONSTOP+MB_OK);
end;

end.
