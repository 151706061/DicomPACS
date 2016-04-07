unit fMedProduceList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, Oracle, JvFormPlacement, ActnList, Grids, 
  Db, OracleData, PKGMEDKART, JvDBUtils, ExtCtrls,
  Menus, StdCtrls, FR_DSet, FR_DBSet, FR_Class, HtmlHlp, fViewPeriodChange,
  JvComponentBase, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxMaskEdit, cxCalendar,
  cxTextEdit, cxSpinEdit, cxCurrencyEdit, cxDBLookupComboBox,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGridLevel, cxGrid, frxClass, frxDBSet;
type
	TfrmMedProduceList = class(TForm)
    al: TActionList;
    acClose: TAction;
    acDel: TAction;
    acEdit: TAction;
    acAdd: TAction;
    acRefresh: TAction;
    acPrint: TAction;
    Splitter1: TSplitter;
    panel: TPanel;
		paMedKart: TPanel;
    oq: TOracleQuery;
    frKart: TfrReport;
    FormStorage: TJvFormStorage;
    grbMedics: TGroupBox;
		GroupBox2: TGroupBox;
    ToolBar1: TToolBar;
    ToolButton4: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    tbuPrint: TToolButton;
    ToolButton3: TToolButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    odsKARTCOMPOS: TOracleDataSet;
    dsKARTCOMPOS: TDataSource;
    odsIngridients: TOracleDataSet;
    dsIngridients: TDataSource;
    laFN_SUMMA_FOR_INGRIDIENTS: TLabel;
    laFN_NACHENKA: TLabel;
    laFN_UCHENKA: TLabel;
    frDBKARTCOMPOS2: TfrDBDataSet;
    frDBodsIngridients: TfrDBDataSet;
    tbuSign: TToolButton;
    odsIngridToPodpis: TOracleDataSet;
    acSign: TAction;
    acDelSecret: TAction;
    ToolButton8: TToolButton;
    acSetDatePeriod: TAction;
    ToolButton9: TToolButton;
    ToolButton11: TToolButton;
    cxGridProduceMedics: TcxGrid;
    cxGridProduceMedicsLevel1: TcxGridLevel;
    cxGridProduceMedicsDBTableView1: TcxGridDBTableView;
    cxGridProduceMedicsDBTableView1ROWNUM: TcxGridDBColumn;
    cxGridProduceMedicsDBTableView1FN_NUMBER: TcxGridDBColumn;
    cxGridProduceMedicsDBTableView1FD_DATA: TcxGridDBColumn;
    cxGridProduceMedicsDBTableView1FC_SERIAL: TcxGridDBColumn;
    cxGridProduceMedicsDBTableView1FK_MEDICID: TcxGridDBColumn;
    cxGridProduceMedicsDBTableView1FC_NAME: TcxGridDBColumn;
    cxGridProduceMedicsDBTableView1FC_UEDIZM: TcxGridDBColumn;
    cxGridProduceMedicsDBTableView1FN_AMOUNT: TcxGridDBColumn;
    cxGridProduceMedicsDBTableView1FN_PRICE_FOR_1: TcxGridDBColumn;
    cxGridProduceMedicsDBTableView1FN_SUMMA_TRUNCED: TcxGridDBColumn;
    cxGridProduceMedicsDBTableView1FN_NACHENKA: TcxGridDBColumn;
    cxGridProduceMedicsDBTableView1FN_UCHENKA: TcxGridDBColumn;
    cxGridProduceMedicsDBTableView1FN_AMOUNT_POLUCHENO: TcxGridDBColumn;
    cxGridProduceMedicsDBTableView1PODPISAN: TcxGridDBColumn;
    cxGridIngr: TcxGrid;
    cxGridIngrLevel1: TcxGridLevel;
    cxGridIngrDBTableView1: TcxGridDBTableView;
    cxGridIngrDBTableView1ROWNUM: TcxGridDBColumn;
    cxGridIngrDBTableView1FK_ID: TcxGridDBColumn;
    cxGridIngrDBTableView1FK_TKARTCOMPOSID: TcxGridDBColumn;
    cxGridIngrDBTableView1FK_KART_ITEM: TcxGridDBColumn;
    cxGridIngrDBTableView1TKART_NAME: TcxGridDBColumn;
    cxGridIngrDBTableView1FN_PARTY_NUM: TcxGridDBColumn;
    cxGridIngrDBTableView1FC_SERIAL: TcxGridDBColumn;
    cxGridIngrDBTableView1FC_UEDIZM: TcxGridDBColumn;
    cxGridIngrDBTableView1FN_AMOUNT: TcxGridDBColumn;
    cxGridIngrDBTableView1FN_AMOUNT1: TcxGridDBColumn;
    cxGridIngrDBTableView1FN_PRICE: TcxGridDBColumn;
    cxGridIngrDBTableView1FN_SUMMA: TcxGridDBColumn;
    acGodMode: TAction;
    oqSetPrih: TOracleQuery;
    oqSetRash: TOracleQuery;
    acUnSign: TAction;
    aclPrint: TActionList;
    pmPrint: TPopupMenu;
    acPrintOne: TAction;
    acPrintDiapazon: TAction;
    acPrintSprav: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    frPrintSprav: TfrReport;
    frDBPrintSprav: TfrDBDataSet;
    odsPrintSprav: TOracleDataSet;
    ToolBar2: TToolBar;
    btnAdd: TToolButton;
    btnEdit: TToolButton;
    btnDel: TToolButton;
    dsObazat_Ingridienti: TDataSource;
    odsObazat_Ingridienti: TOracleDataSet;
    cxGridProduceMedicsDBTableView1FN_SUMMA_FOR_INGRIDIENTS: TcxGridDBColumn;
    Label4: TLabel;
    laFN_SUMMA_TRUNCED: TLabel;
    odsPartyOst: TOracleDataSet;
    frxPrintSprav: TfrxReport;
    frxDBdsPrintSprav: TfrxDBDataset;
    cxGridProduceMedicsDBTableView1FK_ID: TcxGridDBColumn;
    ToolButton5: TToolButton;
    ToolButton10: TToolButton;
    pmProduceType: TPopupMenu;
    miProduceType_ALL: TMenuItem;
    N5: TMenuItem;
    cxGridProduceMedicsDBTableView1FK_PRODUCE_TYPE: TcxGridDBColumn;
    dsTProduce_type: TDataSource;
    ToolButton12: TToolButton;
    tbuAddByTreb: TToolButton;
    acAddByTreb: TAction;
    oqSetFK_PRODUCE_TYPE: TOracleQuery;
    cxGridProduceMedicsDBTableView1FK_FINSOURCE_ID: TcxGridDBColumn;
    cxGridIngrDBTableView1FK_FINSOURCE_ID: TcxGridDBColumn;
    cxGridProduceMedicsDBTableView1dpid_prich_str: TcxGridDBColumn;
    cxGridProduceMedicsDBTableView1dpid_rasch_str: TcxGridDBColumn;
    oqKartComposExists: TOracleQuery;
		procedure acCloseExecute(Sender: TObject);
		procedure odsKARTCOMPOSAfterOpen(DataSet: TDataSet);
    procedure acDelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acEditExecute(Sender: TObject);
    procedure acAddExecute(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
//    procedure odsKardoperBeforeOpen(DataSet: TDataSet);
		procedure odsKARTCOMPOSAfterScroll(DataSet: TDataSet);
    procedure dbgDblClick(Sender: TObject);
    procedure frKartGetValue(const ParName: String; var ParValue: Variant);
    procedure frKartUserFunction(const Name: String; p1, p2, p3: Variant; var Val: Variant);
    procedure acSignExecute(Sender: TObject);
    procedure acDelSecretExecute(Sender: TObject);
    function FormHelp(Command: Word; Data: Integer; var CallHelp: Boolean): Boolean;
    procedure acSetDatePeriodExecute(Sender: TObject);
    procedure acGodModeExecute(Sender: TObject);
    procedure acUnSignExecute(Sender: TObject);
    procedure cxGridProduceMedicsDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure acPrintOneExecute(Sender: TObject);
    procedure tbuPrintClick(Sender: TObject);
    procedure acPrintDiapazonExecute(Sender: TObject);
    procedure acPrintSpravExecute(Sender: TObject);
    procedure frPrintSpravGetValue(const ParName: String;
      var ParValue: Variant);
    procedure frPrintSpravUserFunction(const Name: String; p1, p2,
      p3: Variant; var Val: Variant);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure cxGridIngrDBTableView1FN_AMOUNTPropertiesEditValueChanged( Sender: TObject );
    procedure frxPrintSpravGetValue(const VarName: String;
      var Value: Variant);
    function frxPrintSpravUserFunction(const MethodName: String;
      var Params: Variant): Variant;
    procedure FormDeactivate(Sender: TObject);
    procedure miProduceType_ALLClick(Sender: TObject);
    procedure acAddByTrebExecute(Sender: TObject);
    procedure odsKARTCOMPOSApplyRecord(Sender: TOracleDataSet; Action: Char;
      var Applied: Boolean; var NewRowId: string);
  private
    FGodMode : Boolean;
    FSpravkaSign : string;
    FProduceType : integer;
    FNeedRefresh : boolean;
		{ Private declarations }
 		procedure SetOstatok;

  public
		{ Public declarations }
		flIns:boolean;
		bPodpisan:boolean; // true - ��������
		nID: integer;
		nMOID: Integer;
		TKARTCOMPOS_FK_ID:variant;
		idDocs: variant;

	end;

procedure doShowMedProduceList;
function CheckAmountOfParty(aPartyOst : TOracleDataSet; aNeedAmount : Double): boolean;

var
	frmMedProduceList: TfrmMedProduceList;
	Date1,Date2 : TDate;

function MONEYSTR(Summa: double): string;  

implementation

uses fmainform, fdmMain, fPrihEdit, fMoveEdit, fMedProduceEdit, fMoveList,
     fPrihList, PkgPrihrash, PKGMEDSES, ShellAPI, DateUtils, fSelectCheckedList,
     fCheckedListEdit, Math, fMedKardLst, fdmPrintReports, fLinkedDocs,
     fdmPrintSelect, Variants, fTrebLst, fProduceByTreb,
     uProcess{$IFNDEF OLD_AUTH}, SMMainAPI{$ENDIF};


{$R *.DFM}
function MONEYSTR(Summa: double): string;
begin
  Result := fdmPrintReports.MoneyToString(Summa, TRUE);
end;

function CheckAmountOfParty(aPartyOst : TOracleDataSet; aNeedAmount : Double): boolean;
begin
{  if odsMedKartItem.Eof then
  begin
    Result := False;
    Exit;
  end;}

  if aPartyOst.Eof then
    Result := (aNeedAmount = 0)
  else
    Result := aPartyOst.FieldByName('FN_KOLOST').AsFloat >= aNeedAmount;
end;


procedure DoSetEditKARTCOMPOS;
var id: integer;
    oq: TOracleQuery;
begin
{
��. DecodeDoc
1	�����������
2	����������
3	���������
4	��������
5	������
6	�������
7 ������������ ������������
}
id := frmMoveList.odsSelDocMove.FieldByName('DPID').AsInteger;
oq := TOracleQuery.Create(nil);
try
	oq.Session := dmMain.os;
	oq.Sql.Text := 'UPDATE MED.TDOCS SET FL_EDIT=0 WHERE DPID=:ADPID AND FL_EDIT = 1'; //�� ������������
	oq.DeclareVariable('adpid', otInteger);
	oq.SetVariable('adpid', frmMoveList.odsSelDocMove.FieldByName('DPID').AsInteger);
	try
		oq.Execute;
		dmMain.os.Commit;
		frmMoveList.odsSelDocMove.refresh;
		frmMoveList.odsSelDocMove.Locate('dpid', id, []);
		except
	end;
	finally
		oq.Free;
	end;  
end;

procedure doShowMedProduceList;
begin
  if not frmMain.RestoreMDI_Window('frmMedProduceList') then
  begin
    frmMedProduceList := TfrmMedProduceList.Create(Application);
    frmMedProduceList.FormStyle := fsMDIChild;
  end;
//    Application.CreateForm(TfrmMedProduceList, frmMedProduceList);
//   frmMain.CreateChild(TfrmMedProduceList, frmMedProduceList);
end;

procedure TfrmMedProduceList.acCloseExecute(Sender: TObject);
begin
	nID := -1;
	ModalResult := mrCancel;
	close;
end;

procedure TfrmMedProduceList.odsKARTCOMPOSAfterOpen(DataSet: TDataSet);
var
  IsNotEmpty : boolean;
begin
  IsNotEmpty := DataSet.RecordCount > 0;
  tbuPrint.Enabled := IsNotEmpty;
	acEdit.Enabled   := IsNotEmpty;
	acDel.Enabled    := IsNotEmpty;
  acSign.Enabled   := IsNotEmpty;
  acUnSign.Enabled := IsNotEmpty;  

  odsKARTCOMPOSAfterScroll( DataSet );
end;

procedure TfrmMedProduceList.acDelExecute(Sender: TObject);
var
  FK_ID : integer;
begin
  if odsKARTCOMPOS.recordcount<1 then exit;

  FK_ID := odsKARTCOMPOS.FieldByName('FK_ID').AsInteger;
  
  with oqKartComposExists do
  try
    ClearVariables;
    SetVariable( 'FK_TKARTCOMPOSID', FK_ID );
    Execute;
    FK_ID := GetVariable( 'pFK_ID' );
  except
    FK_ID := -1;
  end;

  if ( FK_ID = -1 ) then     //�������� �� ����������
  begin
    acRefresh.Execute;
    Exit;
  end;

  odsKARTCOMPOS.RefreshRecord; // ������� ������ �� ����

if (odsKARTCOMPOS.FieldByName('FL_EDIT').AsInteger = 0)and(not FGodMode) then
	begin
		windows.MessageBox(Self.Handle, PChar('�������� ����������!' + #10#13 +
			'�������� ��������.'), '��������������', MB_OK);
    acRefresh.Execute;      
		exit;
	end;
if windows.MessageBox(Handle, '������� ��� ��������?', '��������', MB_YESNO + MB_ICONWARNING) = mrYes then
	begin
		dmMain.PKGTKARTCOMPOS.DELTKARTCOMPOS(FK_ID);
		acRefresh.Execute;
	end;
end;

procedure TfrmMedProduceList.FormCreate(Sender: TObject);
var
  CurDate : TDate;
  mi : TMenuItem;
begin
//  fmainform.CheckOnMaximize(TForm(self));
//  fmainform.FormStorageRestorePlacement(FormStorage, TForm(self));
  TKARTCOMPOS_FK_ID := null;
  FGodMode := False; // ���������� ����� ���������� ������ ���� ��������
  odsKARTCOMPOS.Close;
  CurDate := Trunc(ServerDate(dmMain.os));
  Date1 := Trunc(StrToDate (IniReadString( iniFileName, 'ProduceDate', 'date1', DateToStr(CurDate) )));
  Date2 := Trunc(StrToDate (IniReadString( iniFileName, 'ProduceDate', 'date2', DateToStr(CurDate) )));

  acGodMode.Enabled := False; // ��������� ��� ������� ����� ����

  // �������� - ������ ��  ������� ���� � ������� ��������� �������
  if (CurDate < Date1) or (CurDate > Date2) then
  begin
    Date1 := CurDate;
    Date2 := CurDate;
    IniWriteString(iniFileName, 'ProduceDate', 'date1', DateToStr(Date1));
    IniWriteString(iniFileName, 'ProduceDate', 'date2', DateToStr(Date2));
    dmMain.ShowBalloonHint('������ ����������� �� �������� ������� ����'#13#10'������ ����������� ��������� �� ������� ����('+DateToStr( Date1 )+')', '��������', Self);
  end;

  FNeedRefresh := False;
  if (dmMain.ConfigParams.GetParamValue('FUNC_USE_RPO_DIFF', 0) = 1) then
  begin
    FProduceType := IniReadInteger( iniFileName, 'ProduceType', 'Type', 0 );
    if FProduceType = 0 then miProduceType_ALLClick( miProduceType_ALL );
    
    dmMain.odsTProduce_type.First;
    while dmMain.odsTProduce_type.Eof=False do
    begin
      mi := TMenuItem.Create( pmProduceType );
      mi.AutoCheck := True;
      mi.GroupIndex := 1;
      mi.RadioItem := True;
      mi.Caption := dmMain.odsTProduce_type.FieldByName('FC_NAME').AsString;
      mi.Tag     := dmMain.odsTProduce_type.FieldByName('FK_ID').AsInteger;
      mi.OnClick := miProduceType_ALLClick;
      mi.Visible := True;
      pmProduceType.Items.Add(mi);
      if mi.Tag = FProduceType then
      begin
        mi.Checked := True;
        miProduceType_ALLClick( mi );
      end;
      
      dmMain.odsTProduce_type.Next;
    end;

    cxGridProduceMedicsDBTableView1.PopupMenu := pmProduceType;
    cxGridProduceMedicsDBTableView1FK_PRODUCE_TYPE.VisibleForCustomization := True;
  end;
  FNeedRefresh := True;  

  acAddByTreb.Visible := (dmMain.ConfigParams.GetParamValue('FUNC_USE_TREB_FOR_RPO','0') = '1');

  cxGridProduceMedicsDBTableView1FK_FINSOURCE_ID.Visible := (dmMain.ConfigParams.GetParamValue('FUNC_USE_FINSOURCE_IN_RPO',0) = 1);
  cxGridProduceMedicsDBTableView1FK_FINSOURCE_ID.VisibleForCustomization := (dmMain.ConfigParams.GetParamValue('FUNC_USE_FINSOURCE_IN_RPO',0) = 1);

  cxGridIngrDBTableView1FK_FINSOURCE_ID.Visible := (dmMain.ConfigParams.GetParamValue('FUNC_USE_FINSOURCE_IN_RPO',0) = 1);
  cxGridIngrDBTableView1FK_FINSOURCE_ID.VisibleForCustomization := (dmMain.ConfigParams.GetParamValue('FUNC_USE_FINSOURCE_IN_RPO',0) = 1);

  acRefresh.Execute;
  odsKARTCOMPOS.AfterScroll := nil;
  odsKARTCOMPOS.AfterOpen := nil;
  odsKARTCOMPOS.First;
  odsKARTCOMPOS.AfterScroll := odsKARTCOMPOSAfterScroll;
  odsKARTCOMPOS.AfterOpen := odsKARTCOMPOSAfterOpen;
  //dmMain.odsKardoper.BeforeOpen := odsKardoperBeforeOpen;

  odsPartyOst.Open;

end;

procedure TfrmMedProduceList.acEditExecute(Sender: TObject);
var
  FK_ID : integer;
begin
  if odsKARTCOMPOS.recordcount<1 then exit;

  FK_ID := odsKARTCOMPOS.FieldByName('FK_ID').AsInteger;

  with oqKartComposExists do
  try
    ClearVariables;
    SetVariable( 'FK_TKARTCOMPOSID', FK_ID );
    Execute;
    FK_ID := GetVariable( 'pFK_ID' );
  except
    FK_ID := -1;
  end;

  if ( FK_ID = -1 ) then
  begin
    Application.MessageBox( pChar('�������� �� ����������!'),'��������', MB_OK + MB_ICONWARNING );
    acRefresh.Execute;
    Exit;
  end;

  odsKARTCOMPOS.RefreshRecord;

  flIns := false;
  bPodpisan:= (odsKARTCOMPOS.FieldByName('FL_EDIT').AsInteger=0);

  dmMain.os.Savepoint('MedProcedureList');
  DoShowMedProduceEdit(FK_ID, false);
  acRefresh.Execute;
end;

procedure TfrmMedProduceList.acAddByTrebExecute(Sender: TObject);
var
  frmTrebLst  : TfrmTrebLst;

begin
	frmTrebLst := TfrmTrebLst.Create(Application);
  frmTrebLst.RPO_SELECT := True;
  frmTrebLst.bSelect := True;
  try
    if frmTrebLst.ShowModal = mrOk then
    begin
      if nvl(frmTrebLst.odsTreb.FieldByName('FL_RPO').AsVariant,0)=0 then
      begin
        Application.MessageBox('�������� ���������� �� ��� ���', '������', MB_ICONWARNING+MB_OK);
        exit;
      end;

      fProduceByTreb.ShowProduceByTreb(frmTrebLst.nId);

//      MakeAddMove(VID_DVIJENIE, VIDMOVE_NAKL_TREB, 'acInsertByTreb', frmTrebLst.nId, frmTrebLst.IsNewClearTreb);
    end;  // if frmTrebLst.ShowModal = mrOk then
  finally
//    frmTrebLst.Free;
  end;
end;

procedure TfrmMedProduceList.acAddExecute(Sender: TObject);
var
  p : TPoint;
begin
  flIns := true;
  dmMain.os.Savepoint('MedProcedureList');

  if (dmMain.ConfigParams.GetParamValue('FUNC_USE_RPO_DIFF', 0) = 1) then
  begin
    if FProduceType = 0 then // ���� ��� �� ������, ���������� ��� �������
    begin
      p.X := 20;
      p.Y := 20;
      p := cxGridProduceMedics.ClientToScreen(p);
      dmMain.ShowBalloonHint('�� ������ ��� ������������ ������������!');
      pmProduceType.Popup( p.x, p.y );      
      Exit;
    end;
  end;

  TKARTCOMPOS_FK_ID := dmMain.PKGTKARTCOMPOS.CREATEBLANKTKARTCOMPOS;

  if (dmMain.ConfigParams.GetParamValue('FUNC_USE_RPO_DIFF', 0) = 1) then // ���� ������������ � �����, �������� ���
  begin
    dmMain.InitAdditionalUpdateTable('MED.TKARTCOMPOS');
    dmMain.AddAdditionalUpdateTable('FK_PRODUCE_TYPE', otInteger, FProduceType);
    dmMain.ExecuteAdditionalUpdateTable('FK_ID', otInteger, TKARTCOMPOS_FK_ID);
  end;

  bPodpisan := False;
  DoShowMedProduceEdit(TKARTCOMPOS_FK_ID,true);
  acRefresh.Execute;
  TKARTCOMPOS_FK_ID := null;
//  cxGridProduceMedicsDBTableView1.ApplyBestFit(nil);
end;

procedure TfrmMedProduceList.acRefreshExecute(Sender: TObject);
var
  FK_ID : Integer;
begin
  if TKARTCOMPOS_FK_ID <> null then
    FK_ID := TKARTCOMPOS_FK_ID
  else
  begin
    if odsKARTCOMPOS.Active then
      FK_ID := odsKARTCOMPOS.FieldByName('FK_ID').AsInteger
    else
      FK_ID := -1;  
  end;
  odsKARTCOMPOS.AfterScroll := nil;
  odsKARTCOMPOS.Close;
  odsKARTCOMPOS.SetVariable('DATE1', Date1);
  odsKARTCOMPOS.SetVariable('DATE2', Date2);

  if FProduceType = 0 then
    odsKARTCOMPOS.SetVariable('FK_PRODUCE_TYPE', '')
  else
    odsKARTCOMPOS.SetVariable('FK_PRODUCE_TYPE', 'AND KS.FK_PRODUCE_TYPE='+IntToStr(FProduceType));

  odsKARTCOMPOS.Open;
  odsKARTCOMPOS.Locate('FK_ID', FK_ID, []);
  Self.Caption := '�����������-���������� ������ :: ������: � '+ DateToStr(Date1) + ' �� '+DateToStr(Date2);
  if FGodMode then
    Self.Caption := Self.Caption + ' (God Mode)';

  odsKARTCOMPOS.AfterScroll := odsKARTCOMPOSAfterScroll;
  odsKARTCOMPOSAfterScroll(odsKARTCOMPOS);
//  cxGridProduceMedicsDBTableView1.ApplyBestFit(nil);
end;

procedure TfrmMedProduceList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormStyle = fsMDIChild then Action := caFree;
  frmMain.tbMedProduce.ImageIndex := 51;
end;

//procedure TfrmMedProduceList.odsKardoperBeforeOpen(DataSet: TDataSet);
//begin
////  dmMain.odsKardoper.SetVariable('PFK_ID', dmMain.odsMedKart.FieldByName('KARTID').AsInteger);
////  dmMain.odsKardoper.SetVariable('MOID', nMOID);
//end;

procedure TfrmMedProduceList.odsKARTCOMPOSAfterScroll(DataSet: TDataSet);
begin
//	dmMain.odsKardoper.Close;
//  dmMain.odsKardoper.Open;
//           FORMATFLOAT
  odsIngridients.DeclareVariable('FK_TKARTCOMPOSID', otInteger);
  odsIngridients.SetVariable('FK_TKARTCOMPOSID',odsKARTCOMPOS.FieldByName('fk_id').AsInteger);
  odsIngridients.Close;
  odsIngridients.Open;
  SetOstatok;

//  acSign.Enabled := (not Dataset.IsEmpty) and (odsKARTCOMPOS.FieldByName('FL_EDIT').AsInteger = 1);//�� ����������
  if (not Dataset.IsEmpty) and (odsKARTCOMPOS.FieldByName('FL_EDIT').AsInteger = 1) then //�� ����������
    tbuSign.Action := acSign
  else
    tbuSign.Action := acUnSign;
  acPrint.Enabled := (not Dataset.IsEmpty);	//������ ���������
  acDel.Enabled := (not Dataset.IsEmpty) and (odsKARTCOMPOS.FieldByName('FL_EDIT').AsInteger = 1) or (FGodMode);//����������
  if (odsKARTCOMPOS.FieldByName('FL_EDIT').AsInteger = 1) then acEdit.Caption := '��������' else acEdit.Caption := '��������'; 

// ���������� ������ ���������� �������������
  btnAdd.Enabled  := (not Dataset.IsEmpty) and (odsKARTCOMPOS.FieldByName('FL_EDIT').AsInteger = 1) or (FGodMode);//����������
  btnEdit.Enabled := (not Dataset.IsEmpty) and (odsKARTCOMPOS.FieldByName('FL_EDIT').AsInteger = 1) and (not odsIngridients.IsEmpty) or (FGodMode);//����������
  btnDel.Enabled  := (not Dataset.IsEmpty) and (odsKARTCOMPOS.FieldByName('FL_EDIT').AsInteger = 1) and (not odsIngridients.IsEmpty) or (FGodMode);//����������
end;

procedure TfrmMedProduceList.odsKARTCOMPOSApplyRecord(Sender: TOracleDataSet; Action: Char; var Applied: Boolean; var NewRowId: string);
begin
  case Action of
    'U':
    begin
      oqSetFK_PRODUCE_TYPE.SetVariable('AFK_ID', cxGridProduceMedicsDBTableView1FK_ID.EditValue);
      oqSetFK_PRODUCE_TYPE.SetVariable('FK_PRODUCE_TYPE', Sender.FieldByName('FK_PRODUCE_TYPE').Value );
      oqSetFK_PRODUCE_TYPE.Execute;
      dmMain.os.Commit;
      Applied := True;
    end;

  end;
end;

procedure TfrmMedProduceList.SetOstatok;
var
//	ost, lastNewPrice : Double;
  FN_SUMMA_FOR_INGRIDIENTS,FN_UCHENKA,FN_NACHENKA : double;
//    nMedKartM : Integer;
//    date : TDateTime;
begin
  FN_SUMMA_FOR_INGRIDIENTS := odsKARTCOMPOS.FieldByName('FN_SUMMA_FOR_INGRIDIENTS').AsFloat;
  laFN_SUMMA_FOR_INGRIDIENTS.caption:= FloatToStr(FN_SUMMA_FOR_INGRIDIENTS) + ' �.';

  laFN_SUMMA_TRUNCED.Caption := FloatToStr(odsKARTCOMPOS.FieldByName('FN_SUMMA_TRUNCED').AsFloat) + ' �.';

  FN_UCHENKA := odsKARTCOMPOS.FieldByName('FN_UCHENKA').AsFloat;
  laFN_UCHENKA.caption:=floattostr(FN_UCHENKA) + ' �.';

  FN_NACHENKA := odsKARTCOMPOS.FieldByName('FN_NACHENKA').AsFloat;
  laFN_NACHENKA.caption:=floattostr(FN_NACHENKA) + ' �.';

//  date := dmMain.odsMedKart.FieldByName('D').AsDateTime;
//  nMedKartM := dmMain.odsMedKartM.AsInteger;
//  nMedKartM := Round(dmMain.pkgMedSes.GetCurMo);
////  ost := dmMain.odsMedKart.FieldByName('FN_KOLOST').AsFloat;
////  lastNewPrice := dmMain.odsMedKart.FieldByName('FN_PRICE').AsFloat;
//  ost := dmMain.pkgMedKart.GetOst(nKartID, date, nMedKartM);
//  lastNewPrice := dmMain.pkgprihrash.getlastnewprice(nKartID, date, nMedKartM);
{  if not dmMain.odsMedKart.FieldByName('FN_FPACKINUPACK').IsNull then
		StaticText1.Caption := Format(' �������: %g (%g), ����: %.2f�.', [ost,
			ost * dmMain.odsMedKart.FieldByName('FN_FPACKINUPACK').AsFloat,lastNewPrice])
	else
		StaticText1.Caption := Format(' �������: %g, ����: %.2f�.', [ost,lastNewPrice]);
{  if not dmMain.odsMedKart.FieldByName('FN_FPACKINUPACK').IsNull then
		StaticText1.Caption := Format(' �������: %.0f (%.0f), ����: %.2f�.', [ost,
			ost * dmMain.odsMedKart.FieldByName('FN_FPACKINUPACK').AsFloat,lastNewPrice])
  else
    StaticText1.Caption := Format(' �������: %.f, ����: %.2f�.', [ost,lastNewPrice]);}
end;

procedure TfrmMedProduceList.dbgDblClick(Sender: TObject);
begin
	if odsKARTCOMPOS.RecordCount>0 then acEdit.Execute;
end;

procedure TfrmMedProduceList.frKartGetValue(const ParName: String;
	var ParValue: Variant);
begin
//todo3 ���������� �� �������� �� ��������
  // ������ ����� �� ������������
  if ParName = 'var_ost' then
    ParValue := dmMain.pkgMedKart.GetOst( dmMain.odsMedKart.FieldByName('KARTID').AsInteger,
                                          ServerDate(dmMain.Os){,
                                          dmMain.pkgMedSes.GetCurmo})
  else
    if ParName = 'var_price' then
      ParValue := dmMain.pkgMedKart.GETPRICE( dmMain.odsMedKart.FieldByName('KARTID').AsInteger );

//      dmMain.pkgprihrash.GetLastnewprice( dmMain.odsMedKart.FieldByName('KARTID').AsInteger,
//                                                      ServerDate(dmMain.Os),
//                                                      dmMain.pkgMedSes.GetCurmo);
end;

procedure TfrmMedProduceList.frKartUserFunction(const Name: String; p1, p2,
	p3: Variant; var Val: Variant);
var
	d : string;
begin
	if name = 'MYSTRTOFLOAT' then
	begin
		d := frParser.Calc(p1);
		val:=StringReplace(d,',', '.',[rfReplaceAll]);
	end;
end;

procedure TfrmMedProduceList.acSignExecute(Sender: TObject);
var
  kol: real;
  FK_ID : Integer;
  
begin
  FK_ID := odsKARTCOMPOS.FieldByName('FK_ID').AsInteger;

  with oqKartComposExists do
  try
    ClearVariables;
    SetVariable( 'FK_TKARTCOMPOSID', FK_ID );
    Execute;
    FK_ID := GetVariable( 'pFK_ID' );
  except
    FK_ID := -1;
  end;

  if ( FK_ID = -1 ) then
  begin
    Application.MessageBox( pChar('�������� �� ����������!'),'��������', MB_OK + MB_ICONWARNING );
    acRefresh.Execute;
    Exit;
  end;   

  if Application.MessageBox( pChar('��������� ������������ �������� "' +
		             odsKARTCOMPOS.FieldByName('FC_NAME').AsString + '" ?'),'��������',
		             mb_yesno + mb_iconquestion + mb_defbutton1) <> idyes
  then exit;


  odsKARTCOMPOS.RefreshRecord;

  if (odsKARTCOMPOS.FieldByName('FL_EDIT').AsInteger = 0 ) then // �������� ��� ��������
  begin
    acRefresh.Execute;
    Exit;
  end;


  odsIngridToPodpis.close;
  odsIngridToPodpis.DeclareVariable('FK_TKARTCOMPOSID',otInteger);
  odsIngridToPodpis.SetVariable('FK_TKARTCOMPOSID',FK_ID);
  odsIngridToPodpis.Open;

  //++++   � ���� ������ ����������� ��� ���������� � ��������� ���������     ++++++++++++++++++++++++++++++++++
  odsIngridToPodpis.First;
  while not odsIngridToPodpis.EOF do
  Begin
    kol := odsIngridToPodpis.FieldByName('FN_KOLOST').AsFloat;

    if(odsIngridToPodpis.FieldByName('FN_AMOUNT').AsFloat > kol) then
    begin
        Application.MessageBox( PAnsiChar('��� ������������ ����������� "'+odsKARTCOMPOS.FieldByName('FC_NAME').AsString+'" �� ������� ������������!'), '������', MB_OK + MB_ICONERROR);
        Screen.Cursor := crDefault;
        exit;
    end;  //  if(odsIngridToPodpis.FieldByName('FN_AMOUNT').AsFloat <= kol) then

    odsIngridToPodpis.Next;
  end; // while not odsIngridToPodpis.EOF do
  //----   � ���� ������ ����������� ��� ���������� � ��������� ���������     -----------------------------------
  odsIngridToPodpis.close;

  try
    dmMain.oqSignRPO.SetVariable('FK_TKARTCOMPOSID', FK_ID);
    dmMain.oqSignRPO.SetVariable('FD_DATA',          odsKARTCOMPOS.FieldByName('FD_DATA').AsVariant);
    dmMain.oqSignRPO.SetVariable('FK_MEDICID',       odsKARTCOMPOS.FieldByName('FK_MEDICID').AsVariant);
    dmMain.oqSignRPO.SetVariable('FC_SERIAL',        odsKARTCOMPOS.FieldByName('FC_SERIAL').AsVariant);
    dmMain.oqSignRPO.SetVariable('FD_GODEN_DO',      odsKARTCOMPOS.FieldByName('FD_GODEN_DO').AsVariant);
    dmMain.oqSignRPO.SetVariable('FN_PRICE_FOR1',    odsKARTCOMPOS.FieldByName('FN_PRICE_FOR_1').AsVariant);
    dmMain.oqSignRPO.SetVariable('FN_AMOUNT',        odsKARTCOMPOS.FieldByName('FN_AMOUNT').AsVariant);  
    dmMain.oqSignRPO.SetVariable('FK_FINSOURCE_ID',  odsKARTCOMPOS.FieldByName('FK_FINSOURCE_ID').AsVariant);
    dmMain.oqSignRPO.SetVariable('nmb_TKARTCOMPOS',  odsKARTCOMPOS.FieldByName('FN_NUMBER').AsVariant);
    dmMain.oqSignRPO.Execute;

    dmMain.os.Commit;
  except
    on E: Exception do
    begin
      dmMain.os.Rollback;
      Application.MessageBox(PChar('��� ���������� ������������ �������� ������.'#13#10'���������� � ������ ���������.'#13#10#13#10+E.Message), '������', MB_OK+MB_ICONERROR);
    end;
  end;

  {---- �������� ��������� �������, ��� ��������� �������� ������������� ����������� ----}

  Screen.Cursor := crDefault;
  odsKARTCOMPOS.AfterScroll := nil;
  odsKARTCOMPOS.close;
  odsKARTCOMPOS.open;
  odsKARTCOMPOS.Locate('FK_ID', FK_ID,[]);
  odsKARTCOMPOS.AfterScroll := odsKARTCOMPOSAfterScroll;
  odsKARTCOMPOSAfterScroll(odsKARTCOMPOS);    
  tbuSign.Action := acUnSign;
end;

procedure TfrmMedProduceList.acUnSignExecute(Sender: TObject);
var
  FK_ID : Integer;
  sMess : string;
begin
  FK_ID := odsKARTCOMPOS.FieldByName('FK_ID').AsInteger;

  with oqKartComposExists do
  try
    ClearVariables;
    SetVariable( 'FK_TKARTCOMPOSID', FK_ID );
    Execute;
    FK_ID := GetVariable( 'pFK_ID' );
  except
    FK_ID := -1;
  end;

  if ( FK_ID = -1 ) then
  begin
    Application.MessageBox( pChar('�������� �� ����������!'),'��������', MB_OK + MB_ICONWARNING );
    acRefresh.Execute;
    Exit;
  end;   

  sMess := CheckAndShowLinkedDocs( odsKARTCOMPOS.FieldByName('fk_doc_prih').AsInteger, nil, False, '������ ������� �� ����� ���� ���������,'#13#10'��������� �� �������������� ����������� ��� ������:', False );
  if sMess <> '' then
  begin
    Application.MessageBox(pChar('������ ������� �� ����� ���� ���������,'#13#10'��������� �� �������������� ����������� ��� ������:'+#13#10#13#10+sMess),'������', MB_OK + MB_ICONERROR);
    Exit;
  end;

  if Application.MessageBox( PChar('�������� ������� ������������� ��������� "' +
		             odsKARTCOMPOS.FieldByName('FC_NAME').AsString + '" ?'),'��������',
		             mb_yesno + mb_iconquestion + mb_defbutton1) <> idyes
  then exit;

  FK_ID := odsKARTCOMPOS.FieldByName('FK_ID').AsInteger;
  try
    dmMain.oqUnSignRPO.SetVariable('FK_TKARTCOMPOSID', FK_ID);
    dmMain.oqUnSignRPO.SetVariable('PRIH_DPID', odsKARTCOMPOS.FieldByName('fk_doc_prih').AsVariant);
    dmMain.oqUnSignRPO.SetVariable('RASH_DPID', odsKARTCOMPOS.FieldByName('fk_doc_rash').AsVariant);

    dmMain.oqUnSignRPO.Execute;
    dmMain.os.Commit;
  except
    on E: Exception do
    begin
      dmMain.os.Rollback;
      Application.MessageBox(PChar('��� ������ ������� ������������ �������� ������.'#13#10'���������� � ������ ���������.'#13#10#13#10+E.Message), '������', MB_OK+MB_ICONERROR);
    end;
  end;
  dmMain.os.Commit;

  odsKARTCOMPOS.AfterScroll := nil;
  odsKARTCOMPOS.close;
  odsKARTCOMPOS.open;
  odsKARTCOMPOS.Locate('FK_ID', FK_ID,[]);
  odsKARTCOMPOS.AfterScroll := odsKARTCOMPOSAfterScroll;
  odsKARTCOMPOSAfterScroll(odsKARTCOMPOS);

  tbuSign.Action := acSign;
end;

procedure TfrmMedProduceList.acDelSecretExecute(Sender: TObject);
begin
if odsKARTCOMPOS.recordcount<1 then exit;
{if windows.MessageBox(Self.Handle, PChar('�� ������������� ������ ������� ������ ������ ?'), '��������������', MB_YESNO + MB_ICONQUESTION) = mrYes then
	begin
		//�������� ��������� ����������
		dmMain.pkgprihrash.Dodeltreb(odsSelDocMoveDPID.AsInteger);
		dmMain.pkgprihrash.Dodelvoz(odsSelDocMoveDPID.AsInteger);
		dmMain.pkgprihrash.Dodeltrebvid(odsSelDocMoveDPID.AsInteger);
		dmMain.PkgPrihRash.dodel(odsSelDocMove.fieldbyname('dpid').asinteger);

		//�������� ��������� ����������
		dmMain.PkgPrihRash.dodel(odsSelDocPrih.fieldbyname('dpid').asinteger);


		dmMain.PKGTKARTCOMPOS.DELTKARTCOMPOS(odsKARTCOMPOS.FieldByName('FK_ID').AsInteger);

		dmMain.os.Commit;
		acRefresh.Execute;
	end;}
end;

function TfrmMedProduceList.FormHelp(Command: Word; Data: Integer;
  var CallHelp: Boolean): Boolean;
begin
Result := False;
  try
    // TODo �������� ������ ��������  Command
    if Data = -1 then
      HtmlHelp(0, PChar('Medica.chm'), HH_DISPLAY_TOPIC, 0)
    else
      HtmlHelp(0, PChar('Medica.chm'), HH_HELP_CONTEXT, Data);
    CallHelp := False;
    Result := True;
  except
    on EConvertError do
      ShowMessage('������� �� �������');
  end;
end;

procedure TfrmMedProduceList.acSetDatePeriodExecute(Sender: TObject);
var
  CurDate : TDate;
begin
  CurDate := Trunc(ServerDate(dmMain.os));
  Date1 := StrToDate (IniReadString( iniFileName, 'ProduceDate', 'date1', DateToStr(CurDate) ));
  Date2 := StrToDate (IniReadString( iniFileName, 'ProduceDate', 'date2', DateToStr(CurDate) ));

  if not DoShowModalPeriodChange( Date1, Date2, Date1, Date2, '������ �����������' ) then Exit; // ���� ���� �� �����, �������

  if Date1 > Date2 then
  begin
    CurDate := Date1; // ����� CurDate ��������� ����������
    Date1   := Date2;
    Date2   := CurDate;
  end;

  IniWriteString(iniFileName, 'ProduceDate', 'date1', DateToStr(Date1));
  IniWriteString(iniFileName, 'ProduceDate', 'date2', DateToStr(Date2));

  acRefresh.Execute;
end;

procedure TfrmMedProduceList.acGodModeExecute(Sender: TObject);
begin
  FGodMode := not FGodMode;
  if FGodMode then
    Self.Caption :=  Self.Caption + ' (God mode)'
  else
    Self.Caption := StringReplace(Self.Caption, ' (God mode)', '',[]);
end;

procedure TfrmMedProduceList.cxGridProduceMedicsDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AnsiLowerCase(AViewInfo.Text)=AnsiLowerCase('���') then
		ACanvas.Brush.Color := clRed;
end;

procedure TfrmMedProduceList.tbuPrintClick(Sender: TObject);
begin
  acPrintDiapazon.Execute;
end;

procedure TfrmMedProduceList.acPrintOneExecute(Sender: TObject);
var
  P : TPoint;
begin
  if dmPrintSelect.PrintFlag = 0 then
  begin
    P.X := 0;
    P.Y := tbuPrint.Height;
    P := tbuPrint.ClientToScreen(P);
    dmPrintSelect.pmPrintSelect.Popup(P.X, P.Y);
    Application.ProcessMessages; // ������ ����� ����� ����������� ������� TdmPrintReports.miPrintToExcelClick(Sender: TObject);
  end;                           // � ������������� ���� - ����� �������� �� ����� ����� ������ ���� ������ ������ ������� ������
  if dmPrintSelect.PrintFlag = 0 then Exit;
  try
//    odsKARTCOMPOS2.DeclareVariable('FK_TKARTCOMPOSID', otInteger);
//    odsKARTCOMPOS2.SetVariable('FK_TKARTCOMPOSID',odsKARTCOMPOS.FieldByName('fk_id').AsInteger);
//    odsKARTCOMPOS2.Close;
//    odsKARTCOMPOS2.Open;

    frKart.PrepareReport;
    case dmPrintSelect.PrintFlag of // ���� ���� ��������
      1: ExportFRToExcel( frKart, odsKARTCOMPOS.FieldByName('FC_NAME').AsString+' '+DateToStr(odsKARTCOMPOS.FieldByName('FD_DATA').AsDateTime)+' �'+IntToStr(odsKARTCOMPOS.FieldByName('FK_ID').AsInteger)+'.xls' );
      2: frKart.ShowPreparedReport;
    end;

  finally
//    odsKARTCOMPOS2.Close;
    dmPrintSelect.PrintFlag := 0;
  end;

end;

procedure TfrmMedProduceList.acPrintDiapazonExecute(Sender: TObject);
var
  FName, Date1, Date2 : string;
  P : TPoint;
  pr : TProcess;
begin
  Date1 := IniReadString( iniFileName, 'ProduceDate', 'date1', DateToStr( Trunc(ServerDate(dmMain.os) ) ));
  Date2 := IniReadString( iniFileName, 'ProduceDate', 'date2', DateToStr( Trunc(ServerDate(dmMain.os) ) ));

  if dmPrintSelect.PrintFlag = 0 then
  begin
    P.X := 0;
    P.Y := tbuPrint.Height;
    P := tbuPrint.ClientToScreen(P);
    dmPrintSelect.pmPrintSelect.Popup(P.X, P.Y);
    Application.ProcessMessages; // ������ ����� ����� ����������� ������� TdmPrintReports.miPrintToExcelClick(Sender: TObject);
  end;                           // � ������������� ���� - ����� �������� �� ����� ����� ������ ���� ������ ������ ������� ������
  if dmPrintSelect.PrintFlag = 0 then Exit;

//  P.X := 0;  // ������ ���������� ���� �������� �������
//  P.Y := tbuPrint.Height;
//  P := tbuPrint.ClientToScreen(P);
  try
    FName := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))+'ProducedMedics.exe';
    if FileExists(FName) then
//      ShellExecute( 0, PChar('open'), PChar(FName), PChar( '"'+Date1+'" "'+Date2+'" "'+IntToStr( dmMain.pkgMedSes.GET_CUR_MOGROUP_BY_CUR_MO )+'" "'+IntToStr(dmPrintSelect.PrintFlag)+'"'), nil, SW_SHOWNORMAL )
    begin
      pr := TProcess.Create(FName, '"'+Date1+'" "'+Date2+'" "'+IntToStr( dmMain.FK_CurMO_GROUP )+'" "'+IntToStr(dmPrintSelect.PrintFlag)+'" "'+IntToStr(FProduceType)+'"', True);
      {$IFNDEF OLD_AUTH}
      if pr.IsProcessCatched then GetInputMapAppFromApp(pr.PID);
      {$ENDIF}      
      pr.Free;
    end
    else
      Application.MessageBox('�� ������ ������ ������������ ������� ���������������� ��������.'#13#10'���������� �������� ������ ProducedMedics.exe', '������', MB_OK+MB_ICONERROR);
  finally
    dmPrintSelect.PrintFlag := 0;
  end;
end;

procedure TfrmMedProduceList.acPrintSpravExecute(Sender: TObject);
//var
//  DateMonth1, DateMonth2 : TDate;
//  P : TPoint;
begin
{  if dmPrintReports.PrintFlag = 0 then
  begin
    P.X := 0;
    P.Y := tbuPrint.Height;
    P := tbuPrint.ClientToScreen(P);
    dmPrintReports.pmPrintSelect.Popup(P.X, P.Y);
    Application.ProcessMessages; // ������ ����� ����� ����������� ������� TdmPrintReports.miPrintToExcelClick(Sender: TObject);
  end;                           // � ������������� ���� - ����� �������� �� ����� ����� ������ ���� ������ ������ ������� ������
  if dmPrintReports.PrintFlag = 0 then Exit;}

//  if FileExists('������� ���.frf') then            // ���� ������ ����
//    frPrintSprav.LoadFromFile('������� ���.frf');  // ��������� ���

  if FileExists('������� ���.fr3') then            // ���� ������ ����
    frxPrintSprav.LoadFromFile('������� ���.fr3');  // ��������� ���

  FSpravkaSign := '';
  if DoShowSelectCheckedList(FSpravkaSign, '��������:'#13#10'���. �������:'#13#10'��. ���������:', '�������� ������������� ���������') = mrCancel then Exit;
  FSpravkaSign := StringReplace(FSpravkaSign, #13#10, '  ________________________'#13#10#13#10, [rfReplaceAll]); // ��������� ����� ��� �������
  try
//    DateMonth1 := Trunc(StartOfTheMonth( odsKARTCOMPOS.FieldByName('FD_DATA').AsDateTime ));
//    DateMonth2 := Trunc(EndOfTheMonth(DateMonth1));

    odsPrintSprav.Close;
//    odsPrintSprav.SetVariable('date1', DateMonth1);
//    odsPrintSprav.SetVariable('date2', DateMonth2);
    odsPrintSprav.SetVariable('date1', Date1);
    odsPrintSprav.SetVariable('date2', Date2);

//    odsPrintSprav.SetVariable('MonthYear', AnsiLowerCase(LongMonthNames[MonthOf(DateMonth1)])+' '+IntToStr(YearOf (DateMonth1))+' �.');
    odsPrintSprav.SetVariable('MonthYear', ' ');
    odsPrintSprav.Open;

    frxPrintSprav.AddFunction('function MONEYSTR(Summa: double): string', 'MONEY');
    frxPrintSprav.PrepareReport;
//    frPrintSprav.PrepareReport;
{    case dmPrintReports.PrintFlag of // ���� ���� ��������
      1: ExportFRToFilter( frxPrintSprav, '������� � �������� � ������ �� ��� c '+DateToStr(odsPrintSprav.GetVariable('DATE1'))+' �� '+DateToStr(odsPrintSprav.GetVariable('DATE2'))+'.xls', dmPrintReports.frxXMLExport1 );
      2:} frxPrintSprav.ShowPreparedReport;
{    end;}
  finally
    odsPrintSprav.Close;
    dmPrintSelect.PrintFlag := 0;
  end;
end;

procedure TfrmMedProduceList.frPrintSpravGetValue(const ParName: String; var ParValue: Variant);
const
  StrRusMonths : array[1..12] of string = ('������', '�������', '�����', '������', '���', '����', '����', '�������', '��������', '�������', '������', '�������');
var
  CurDate : TDate;
begin
	if ParName = 'StrSpravDate' then
  begin
    CurDate := Trunc(ServerDate(dmMain.os));
    ParValue := Format('�� "%d" %s %d �.', [DayOf(CurDate), StrRusMonths[MonthOf(CurDate)], YearOf(CurDate)]);
  end // if ParName = 'var_sender' then
	else if ParName = 'Signs' then
  begin
    ParValue := FSpravkaSign;
  end;
  if ParName = 'var_glav_vrach' then ParValue := dmPrintReports.GetValueFromTSMINI('NACHLOK', 'FIO'); //MANAGER_DOC', 'GLAV_VRACH')
// ������ ����� ��������� �������� ����� frf
  if ParName = 'OKB' then
    if dmMain.ConfigParams.GetParamValue('Func_Set', FUNC_SET_HANTI) = FUNC_SET_HANTI then ParValue := '���' else ParValue := '';
  if ParName = 'var_glav_vrach_doljnost' then
    case dmMain.ConfigParams.GetParamValue('Func_Set', FUNC_SET_HANTI) of
      FUNC_SET_HANTI: ParValue := '������� ���� ��� �. �����-���������';
      FUNC_SET_MID: ParValue := '������� ���� ������� ���� "�������-���������������� ������ ��� ������"'
      else ParValue := '������� ����';
    end;
end;

procedure TfrmMedProduceList.frPrintSpravUserFunction(const Name: String;  p1, p2, p3: Variant; var Val: Variant);
var
  d : Double;
begin
	if UpperCase(name) = 'MONEYSTR' then
	begin
    d := frParser.Calc(p1);
		val := MoneyToString(d, TRUE);
  end;
end;

procedure TfrmMedProduceList.btnAddClick(Sender: TObject);
var
  sFilter : string;
  res : Integer;
  AmountForN, AmountFor1 : Double;
  OstRec : TOstatokRec;
begin
  sFilter := '';
  odsObazat_Ingridienti.DisableControls;
  odsObazat_Ingridienti.SetVariable('FK_MEDIC',  odsKARTCOMPOS.FieldByName('FK_MEDICID').AsFloat);
  odsObazat_Ingridienti.SetVariable('TKARTCOMPOS_FN_AMOUNT',  odsKARTCOMPOS.FieldByName('FN_AMOUNT').AsFloat);

  odsObazat_Ingridienti.Close;
  odsObazat_Ingridienti.Open;

  odsObazat_Ingridienti.First;
  while not odsObazat_Ingridienti.Eof do
  begin
    sFilter := sFilter + ' or (medicid = '+ IntToStr(odsObazat_Ingridienti.FieldByName('medicid').AsInteger)+')';
    odsObazat_Ingridienti.Next;
  end;
  Delete(sFilter, 1,4);


  OstRec := DoShowMedKardLst( -1,-1, 0,False,SPISANIE_VID_NONE, '',False,sFilter,False, True);
  if OstRec.KARTID < 0 then
  begin
    odsObazat_Ingridienti.EnableControls;
    Exit; // �� ������� ����������
  end;

  // �������������� ���������� �����������
  odsObazat_Ingridienti.First;
  while (not odsObazat_Ingridienti.Eof)and(odsObazat_Ingridienti.FieldByName('MEDICID').AsInteger <> OstRec.MEDICID) do
    odsObazat_Ingridienti.Next;

  AmountFor1 := 0;
  AmountForN := 0;
  if not odsObazat_Ingridienti.Eof then
  begin
    AmountFor1 := odsObazat_Ingridienti.FieldByName('FN_AMOUNT_FOR1').AsFloat;
    AmountForN := odsObazat_Ingridienti.FieldByName('FN_AMOUNT').AsFloat;
  end;
  odsObazat_Ingridienti.EnableControls;
  res := round( dmMain.PKGTKARTCOITEM.ADDTKARTCOITEM( odsKARTCOMPOS.FieldByName('FK_ID').AsInteger,
                                                      AmountForN,
                                                      AmountFor1,
                                                      OstRec.KARTID) );
  if res=-1 then
  Begin
    Application.MessageBox('��������� ������ ����������� ��� ���� � ������ "������� �����������". �� ������ ������������� ��� ������� ������ ������ ������������ � ���� ������!', '������', MB_OK + mb_iconerror);
    exit;
  end
  else
  begin
    dmMain.os.Commit;  // ����� ��������
    odsIngridients.Close;
    odsIngridients.Open;
  end;  

//  CheckAmountOfIngridients;
end;

procedure TfrmMedProduceList.btnEditClick(Sender: TObject);
var
  sFilter : string;
  OstRec : TOstatokRec;
begin
  if odsIngridients.RecordCount>0 then
  begin
    sFilter := 'medicid = '+odsIngridients.FieldByName('MedicID').AsString;
    OstRec := DoShowMedKardLst( -1, -1, 0, False, SPISANIE_VID_NONE, '',False,sFilter,False, True);

    if OstRec.KARTID > 0 then
    begin
      dmMain.PKGTKARTCOITEM.EDITTKARTCOITEM( odsIngridients.FieldByName('FK_ID').AsInteger,
                                             OstRec.KARTID,
                                             odsIngridients.FieldByName('FN_AMOUNT').AsFloat,
                                             odsIngridients.FieldByName('FN_AMOUNT_FOR1').AsFloat );
      dmMain.os.Commit;  // ����� ��������
    end;


  end;

  odsIngridients.Close;
  odsIngridients.Open;
end;

procedure TfrmMedProduceList.btnDelClick(Sender: TObject);
begin
  if odsIngridients.recordcount<1 then exit;
  if windows.MessageBoxEx(Self.Handle, PChar('�� ������������� ������ ������� ������ ������ ?'), '��������������', MB_YESNO + MB_ICONQUESTION,$0419 {Russian}) = mrYes then
  begin
    dmMain.PKGTKARTCOITEM.DELTKARTCOITEM(odsIngridients.FieldByName('FK_ID').AsInteger);
    dmMain.os.Commit;  // ����� ��������
    odsIngridients.refresh;
  end;
end;

procedure TfrmMedProduceList.cxGridIngrDBTableView1FN_AMOUNTPropertiesEditValueChanged(
  Sender: TObject);
begin
  if CheckAmountOfParty( odsPartyOst, cxGridIngrDBTableView1FN_AMOUNT1.EditValue*odsKARTCOMPOS.FieldByName('FN_AMOUNT').AsFloat ) then
  begin
    if odsIngridients.State = dsEdit then odsIngridients.Post;
    dmMain.PKGTKARTCOITEM.EDITTKARTCOITEM( odsIngridients.FieldByName('FK_ID').AsInteger,
                                         odsIngridients.FieldByName('fk_kart_item').AsInteger,
                                         odsIngridients.FieldByName('FN_AMOUNT_FOR1').AsFloat* odsKARTCOMPOS.FieldByName('FN_AMOUNT').AsFloat,
                                         odsIngridients.FieldByName('FN_AMOUNT_FOR1').AsFloat );
  end
  else
    dmMain.ShowBalloonHint('������ ��������� '+ odsIngridients.FieldByName('TKART_NAME').AsString+' ������������!', '��������', Self);
  odsIngridients.RefreshRecord;
end;

procedure TfrmMedProduceList.frxPrintSpravGetValue(const VarName: String; var Value: Variant);
const
  StrRusMonths : array[1..12] of string = ('������', '�������', '�����', '������', '���', '����', '����', '�������', '��������', '�������', '������', '�������');
var
  CurDate : TDate;
//  Signs : string;
begin
	if VarName = 'StrSpravDate' then
  begin
    CurDate := Trunc(ServerDate(dmMain.os));
    Value := Format('�� "%d" %s %d �.', [DayOf(CurDate), StrRusMonths[MonthOf(CurDate)], YearOf(CurDate)]);
  end; // if ParName = 'var_sender' then
  if VarName = 'SIGNS' then
  begin
    Value := FSpravkaSign;
  end;
  if VarName = 'var_glav_vrach' then Value := dmPrintReports.GetValueFromTSMINI('NACHLOK', 'FIO'); //MANAGER_DOC', 'GLAV_VRACH')
  if VarName = 'OKB' then
    if dmMain.ConfigParams.GetParamValue('Func_Set', FUNC_SET_HANTI) = FUNC_SET_HANTI then Value := '���' else Value := '';
  if VarName = 'var_glav_vrach_doljnost' then
    case dmMain.ConfigParams.GetParamValue('Func_Set', FUNC_SET_HANTI) of
      FUNC_SET_HANTI: Value := '������� ���� ��� �. �����-���������';
      FUNC_SET_MID: Value := '������� ���� ������� ���� "�������-���������������� ������ ��� ������"'
      else Value := '������� ����';
    end;
end;

function TfrmMedProduceList.frxPrintSpravUserFunction( const MethodName: String; var Params: Variant): Variant;
begin
	if UpperCase(MethodName) = 'MONEYSTR' then
	begin
    Result := MONEYSTR( Params[0] );
  end;
end;

procedure TfrmMedProduceList.miProduceType_ALLClick(Sender: TObject);
begin
  FProduceType := TMenuItem(sender).Tag;
  cxGridProduceMedicsDBTableView1FK_PRODUCE_TYPE.Visible := (FProduceType = 0);

  grbMedics.Caption := ' ��������������� �����������: '+TMenuItem(sender).Caption;

  IniWriteInteger( iniFileName, 'ProduceType', 'Type', FProduceType );
  if FNeedRefresh then
    acRefresh.Execute;
end;

procedure TfrmMedProduceList.FormDeactivate(Sender: TObject);
begin
  dmMain.bhtMain.CancelHint;
end;

end.
