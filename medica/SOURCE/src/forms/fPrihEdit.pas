unit fPrihEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, ComCtrls, ToolWin, ExtCtrls, StdCtrls, Db, OracleData,
  DBCtrls, Oracle,
  JvToolEdit, JvBaseEdits, JvFormPlacement, HtmlHlp,
  JvComponentBase, JvExStdCtrls, JvEdit, JvValidateEdit, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxTextEdit, cxSpinEdit, cxCurrencyEdit, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGridLevel, cxGrid, cxCalendar, cxDBLookupComboBox,
  cxContainer, cxMaskEdit, cxDropDownEdit;

type
	TfrmPrihEdit = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    btnSave: TToolButton;
    btnCancel: TToolButton;
    al: TActionList;
    actSave: TAction;
    acesc: TAction;
    Panel1: TPanel;
    Label1: TLabel;
    eNumDoc: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    lcbPostav: TDBLookupComboBox;
    Label4: TLabel;
    Label6: TLabel;
    CoolBar2: TCoolBar;
    ToolBar2: TToolBar;
    btnAdd: TToolButton;
    btnEdit: TToolButton;
    btnDel: TToolButton;
    actAdd: TAction;
    acedit: TAction;
    actDelete: TAction;
    Panel2: TPanel;
    odsPostav: TOracleDataSet;
    dsPostav: TDataSource;
    odsKart: TOracleDataSet;
    dsKart: TDataSource;
    Label5: TLabel;
    Label8: TLabel;
    odsMedic: TOracleDataSet;
    cePriceDoc: TJvValidateEdit;
    acrefresh: TAction;
    Action1: TAction;
    Action2: TAction;
    odsKartDPCID: TFloatField;
    odsKartMEDICID: TIntegerField;
    odsKartFN_KOL: TFloatField;
    odsKartFN_SUMM: TFloatField;
    odsKartKARTID: TIntegerField;
    odsKartNAMEKART: TStringField;
    odsKartlkeiname: TStringField;
    odsKartROWNUM: TFloatField;
    odsKartFC_SERIAL: TStringField;
    FormStorage: TJvFormStorage;
    lbInvoice: TLabel;
    lbFrom: TLabel;
    deRegistrTime: TDateTimePicker;
    odsKartFN_PRICE: TFloatField;
    odsKartFN_PARTY_NUM: TFloatField;
    lcbMO_GROUP_TO: TDBLookupComboBox;
    odsMO_GroupTo: TOracleDataSet;
    dsMO_GroupTo: TDataSource;
    cxDBgPrihKart: TcxGrid;
    cxDBgPrihKartLevel1: TcxGridLevel;
    cxDBgPrihKartDBTableView1: TcxGridDBTableView;
    cxDBgPrihKartDBTableView1ROWNUM: TcxGridDBColumn;
    cxDBgPrihKartDBTableView1NAMEKART: TcxGridDBColumn;
    cxDBgPrihKartDBTableView1FN_PARTY_NUM: TcxGridDBColumn;
    cxDBgPrihKartDBTableView1FC_SERIAL: TcxGridDBColumn;
    cxDBgPrihKartDBTableView1lkeiname: TcxGridDBColumn;
    cxDBgPrihKartDBTableView1FN_KOL: TcxGridDBColumn;
    cxDBgPrihKartDBTableView1FN_PRICE: TcxGridDBColumn;
    cxDBgPrihKartDBTableView1FN_SUMM: TcxGridDBColumn;
    mComment: TEdit;
    deInvoiceDate: TcxDateEdit;
    deRegistrDate: TcxDateEdit;
    odsKartFK_MOGROUPID: TFloatField;
    odsKartFD_GODEN: TDateTimeField;
    procedure actSaveExecute(Sender: TObject);
    procedure acescExecute(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
		procedure eNumDocChange(Sender: TObject);
//    procedure dxDBgPrihKartEdited(Sender: TObject; Node: TdxTreeListNode);
    procedure odsPostavAfterScroll(DataSet: TDataSet);
    procedure dxDBgPrihKartColumn6Change(Sender: TObject);
    procedure aceditExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
		procedure deRegistrDateChange(Sender: TObject);
		procedure Action1Execute(Sender: TObject);
		procedure Action2Execute(Sender: TObject);
		procedure actDeleteUpdate(Sender: TObject);
		procedure actAddUpdate(Sender: TObject);
		procedure actSaveUpdate(Sender: TObject);
    procedure aceditUpdate(Sender: TObject);
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
    procedure cxDBgPrihKartDBTableView1EditChanged(
      Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
    procedure cxDBgPrihKartDBTableView1DblClick(Sender: TObject);
    procedure odsKartAfterOpen(DataSet: TDataSet);
	private
		{ Private declarations }
	public
		{ Public declarations }
		flNewPrice: boolean;
		curdata: TDateTime;
		bEnableEdit : boolean;
		datechange: boolean;  //  �������� ��������� ���� ��� ��������� ���������
		idDocs: Integer;
		thisformcalledfrom_frmMedKartLst:boolean;

//    procedure DisableInput;
    procedure EnableInput(const aEnabled : Boolean );

		constructor Create(Owner: TComponent); override;
	end;
var flPrih: boolean;

var
	frmPrihEdit: TfrmPrihEdit;

implementation

uses fdmMain, fmainform, fprihList, fMoveList, fMedKardLst,
  fMedKardEdit;


{$R *.DFM}
{$C+}

constructor TfrmPrihEdit.Create(Owner: TComponent);
begin
  inherited Create(owner);
  bEnableEdit := True;

  odsKart.Close;
  odsKart.Open;
  odsPostav.Open;
  odsMO_GroupTo.Open;
//  odsNametoPrih.Open;
end;

// ���������
procedure TfrmPrihEdit.actSaveExecute(Sender: TObject);
begin
  if eNumdoc.Text = '' then
  begin
    MessageBox(Self.Handle, PChar('���������� ������ ����� ���������!'), '������', MB_OK + mb_iconerror);
    eNumDoc.SetFocus;
    exit;
  end;
  if deInvoiceDate.Date = NullDate then
  begin
    MessageBox(Self.Handle, PChar('���������� ������ ���������� ���� ���������!'), '������', MB_OK + mb_iconerror);
    deInvoiceDate.SetFocus;
    exit;
  end;
  if deRegistrDate.Date = NullDate then
  begin
    MessageBox(Self.Handle, PChar('���������� ������ ���������� ���� ����������� ���������!'), '������', MB_OK + mb_iconerror);
    deRegistrDate.SetFocus;
    exit;
  end;
  if deRegistrDate.Text = '' then
    begin
      windows.MessageBox(Self.Handle, PChar('���������� ������ ����!'), '������', MB_OK + mb_iconerror);
      exit;
    end;
  if lcbMO_GROUP_TO.Text = '' then
    begin
      windows.MessageBox(Self.Handle, PChar('���������� ���������� ���� ������!'), '������', MB_OK + mb_iconerror);
      exit;
    end;

  if odsKart.IsEmpty then
  begin
    MessageBox(Self.Handle, PChar('���������� �������� ������!'), '������', MB_OK + mb_iconerror);
    exit;
  end;
  ModalResult := mrOk;
end;

procedure TfrmPrihEdit.acescExecute(Sender: TObject);
begin
  lcbPostav.CloseUp(False);
  lcbMO_GROUP_TO.CloseUp(False);
  ModalResult := mrcancel;
end;

procedure TfrmPrihEdit.actAddExecute(Sender: TObject);
var id       : variant;
begin
datechange := True;
//if deRegistrDate.Text = '' then
//	begin
//		windows.MessageBox(Self.Handle, PChar('����� ������ �������� ���������� ������ ����!'), '������', MB_OK + mb_iconerror);
//		exit;
//	end;
//if LCBNameTo.Text = '' then
//	begin
//		windows.MessageBox(Self.Handle, PChar('����� ������ �������� ���������� ���������� ���� ������!'), '������', MB_OK + mb_iconerror);
//		exit;
//	end;
Application.CreateForm(TfrmMedKardEdit, frmMedKardEdit);
flPrih := true;
//  frmMedKardEdit.fl_prih := True; //�� ��� �� ����������� ��� �� �������� ����� ���� ������
if frmMedKardEdit.ShowModal = mrok then
	begin
//*sill 31.08.2005
		if dmMain.pkgprihrash.Checkinkart(frmMedKardEdit.nID {odskartList.fieldbyname('kartid').asinteger}, idDocs) <> 0 then
		begin
			if MessageBox(Self.Handle, PChar('������ ������ ��� ������������ � ������ ���������!' + #10#13+
					 '��������� � ���������� ����������?' + #10#13 + '�� �������?'),
					 '�������������', MB_yesno + mb_iconquestion) = idYes
			then
			begin
				// ������� (�������� 2 �������� �� 10 ��� �  5 �������� �� 15 ������. ������� ���� �����:(10*2+15*5)/(2+5))
				// ������ ���������� ����� � ���-��
// ���� �� ����� ������� ��� �������, � ������ ������ ����� ���� ���� ����
				odsKart.Locate('kartid',frmMedKardEdit.nID {odskartList.fieldbyname('kartid').AsInteger},[]);
                                                                  //      adpid     IN   NUMBER,
                                                                  //      akol      IN   NUMBER,
                                                                  //      aprice    IN   NUMBER,
                                                                  //      akartid   IN   NUMBER,
                                                                  //      aData     IN   DATE,
                                                                  //      adpcid    IN   NUMBER,
                                                                  //      prizn     IN   NUMBER

// ������ �������
				id := dmMain.PkgPrihRash.DoSetPrihRash(idDocs,
								       frmMedKardEdit.seKol.value + odsKart.FieldByName('FN_KOL').AsFloat,
								       frmMedKardEdit.cePriceView.value,   //���� �������� �� ������������
								       frmMedKardEdit.nID, //odskartList.fieldbyname('kartid').asinteger,
//								       curdata,
                                                                       odsKart.FieldByName('DPCID').AsInteger, 10);

			end
			else Exit;
		end
		else	id := dmMain.PkgPrihRash.DoSetPrihRash( idDocs,
                                                                frmMedKardEdit.seKol.value,
                                                                frmMedKardEdit.cePriceView.value,   //���� �������� �� ������������
                                                                frmMedKardEdit.nID, //odskartList.fieldbyname('kartid').asinteger,
                                                                 0, 1);

		odsKart.SetVariable('adpid', idDocs); // ID ���������

//		odsKart.refresh;
                odsKart.Close;
                odsKart.Open;
		odsKart.Locate('kartid', frmMedKardEdit.nID {odskartList.fieldbyname('kartid').asinteger}, []);

		actSave.Enabled := true;
		acedit.Enabled := true;
		actDelete.Enabled := true;

//		LCBNameTo.Enabled := false;
//    frmPrihEdit.cePriceDoc.Value := dmMain.PkgPrihRash.Getsumdoc(idDocs, 1);
		cePriceDoc.Value := dmMain.PkgPrihRash.Getsumdoc(idDocs, 1);
		frmMedKardEdit.free;
	end;
flPrih := false;
end;

procedure TfrmPrihEdit.actDeleteExecute(Sender: TObject);
begin
	datechange := True;
	if windows.MessageBox(Self.Handle, PChar('�� ������������� ������ ������� ������ ������ ?'), '��������������', MB_YESNO + MB_ICONQUESTION) = mrYes then
	begin
		dmMain.PkgPrihRash.Dodelkart(odsKart.fieldbyname('kartid').asinteger, odsKart.fieldbyname('dpcid').asinteger);
		odsKart.SetVariable('adpid', idDocs);
//                odsKart.refresh;
                odsKart.Close;
                odsKart.Open;                
		self.cePriceDoc.Value := dmMain.PkgPrihRash.Getsumdoc(idDocs, 1);
	end;
end;

procedure TfrmPrihEdit.eNumDocChange(Sender: TObject);
begin
// �� �����, ������ ������. �������� ������� �.�. 
//if odsKart.RecordCount > 0 then
//	begin
//		if self.thisformcalledfrom_frmMedKartLst = false then  {�������� frmPrihEdit �� frmPrihLst}
//			Begin
//				if (Assigned(frmPrihList) and (frmPrihList.odsSelDocPrih.FieldByName('FL_EDIT').AsInteger <> 0))
////      (Assigned(frmMoveList) and (frmMoveList.odsSelDocMove.FieldByName('FL_EDIT').AsInteger <> 0))
//				then
//					begin
//						acedit.Enabled := true;
//						actDelete.Enabled := true;
////						lcbMO_GROUP_TO.Enabled := false;
//					end;
//			end
//		else {�������� frmPrihEdit �� frmMedKartLst}
//			Begin
//				IF ROUND(dmMain.PKGTDOCS.GETFLEDIT(idDocs))<>0 THEN
//					Begin
//						acedit.Enabled := true;
//						actDelete.Enabled := true;
////						lcbMO_GROUP_TO.Enabled := false;
//					end;
//			end;
//	end;
end;
{
procedure TfrmPrihEdit.dxDBgPrihKartEdited(Sender: TObject; Node: TdxTreeListNode);
var id: variant;
begin
	if flNewPrice = false then begin
		dmMain.os.Savepoint('spEdit');
		if odsKart.Modified then begin
			odsKart.Post;
		end;
		if dmMain.PkgPrihRash.Getcheckcountkart(idDocs) > 0 then begin
			dmMain.os.RollbackToSavepoint('spEdit');
//			odsKart.refresh;
			odsKart.Close;
			odsKart.Open;

		end;
    (*    id := dmMain.PkgPrihRash.Dosetnewprice(idDocs,
          odsKartFN_KOL.AsFloat,
          odsKartFN_PRICE.AsFloat,
          odsKartKARTID.asinteger,
          curdata,
          odsKartDPCID.asinteger, 0);*)
    id := odsKartKARTID.AsInteger;
    dmMain.PkgPrihRash.DoSetPrihRash( idDocs,
                                      odsKartFN_KOL.AsInteger,
                                      odsKartFN_PRICE.AsInteger,   //���� �������� �� ������������
                                      id,
//                                      curdata,
                                      odsKartDPCID.asinteger, 1);

//    odsKart.refresh;
    odsKart.Close;
    odsKart.Open;
    odsKart.Locate('dpcid', id, []);
    self.cePriceDoc.Value := dmMain.PkgPrihRash.Getsumdoc(idDocs, 1);
  end
	else begin
		if odsKart.Modified then begin
			odsKart.Post;
		end;
    odsKart.Close;
    odsKart.Open;
//    odsKart.refresh;
    self.cePriceDoc.Value := dmMain.PkgPrihRash.Getsumdoc(idDocs, 1);
  end;
end;
}
procedure TfrmPrihEdit.odsPostavAfterScroll(DataSet: TDataSet);
begin
  dmMain.fromid := 0;
end;

procedure TfrmPrihEdit.dxDBgPrihKartColumn6Change(Sender: TObject);
begin
  flNewPrice := true;
end;

procedure TfrmPrihEdit.aceditExecute(Sender: TObject);
var
  id: integer;
begin
  id := -1;
  datechange := true;
  Application.CreateForm(TfrmMedKardEdit, frmMedKardEdit);
  frmMedKardEdit.nID := odsKart.fieldbyname('kartid').asinteger; // �������� KartID
  frmMedKardEdit.sekol.Value := odsKart.fieldbyname('fn_kol').asfloat;
	frmMedKardEdit.sesumm.Value := odsKart.fieldbyname('fn_summ').asfloat;
//	frmMedKardEdit.eKartName.Text := odsKart.fieldbyname('namekart').asstring;
//  frmMedKardEdit.odskartList.SetVariable('akartid', odsKart.fieldbyname('kartid').asinteger);

  //  frmMedKardEdit.odskartList.refresh;
  // ����� ������� ���, ����� �������� ������ ��� �������� ��������
//  frmMedKardEdit.odskartList.Close;
//  frmMedKardEdit.odskartList.Open;

  flPrih := true;
//  frmMedKardEdit.fl_prih := True;

  if frmMedKardEdit.ShowModal = mrOk then begin

  if (odsKart.FieldByName('KARTID').AsInteger <> frmMedKardEdit.nID ) and
  (dmMain.pkgprihrash.Checkinkart(frmMedKardEdit.nID , idDocs) <> 0) then //���� �������� �������� � ����� ��� ����, ��
  begin
			if MessageBox(Self.Handle, PChar('������ ������ ��� ������������ � ������ ���������!' + #10#13+
					 '��������� � ���������� ����������?' + #10#13 + '�� �������?'),
					 '�������������', MB_yesno + mb_iconquestion) = idYes
    then
    begin
      dmMain.PkgPrihRash.Dodelkart(odsKart.FieldByName('KARTID').AsInteger, odsKart.fieldbyname('dpcid').asinteger);//������� ������ ��������
      //������������� �� �����
      odsKart.Locate('kartid',frmMedKardEdit.nID{odskartList.fieldbyname('kartid').AsInteger},[]);
      dmMain.PkgPrihRash.DoSetPrihRash( idDocs,
                                        frmMedKardEdit.seKol.value + odsKart.FieldByName('FN_KOL').AsFloat,
                                        frmMedKardEdit.cePriceView.Value,    //���� �������� �� ������������
//                                        odsKart.FieldByName('FN_SUMM').AsFloat + frmMedKardEdit.sesumm.Value,
                                        frmMedKardEdit.nID, // odskartList.fieldbyname('kartid').asinteger,
                //                        curdata,
                                        odsKart.FieldByName('DPCID').AsInteger, 10);
    end
    else Exit;
  end
  else
  begin
//    if odsNametoPrihMOID.AsInteger <> dmMain.pkgprihrash.getmoidkart(odsKartKARTID.asinteger) then begin
   if (odsMO_GroupTo.FieldByName('groupid').AsInteger <> odsKartFK_MOGROUPID.asinteger) then begin
      id := frmMedKardEdit.nID; //odskartList.fieldbyname('kartid').asinteger;
      dmMain.PkgPrihRash.DoSetPrihRash(idDocs,
        frmMedKardEdit.seKol.value,
        frmMedKardEdit.cePriceView.value,    //���� �������� �� ������������
        id,
//        curdata,
        odsKartDPCID.asinteger, 2);
    end
    else begin
      id := frmMedKardEdit.nID;  //odskartList.fieldbyname('kartid').asinteger;
      dmMain.PkgPrihRash.DoSetPrihRash( idDocs,
                                        frmMedKardEdit.seKol.value,
                                        frmMedKardEdit.cePriceView.value,   //���� �������� �� ������������
                                        id,
//                                        curdata,
                                        odsKartDPCID.asinteger, 1);
    end;
  end;
    odsKart.SetVariable('adpid', idDocs);
//    odsKart.refresh;
    odsKart.Close;
    odsKart.Open;
    odsKart.Locate('kartid', id, []);
    self.cePriceDoc.Value := dmMain.PkgPrihRash.Getsumdoc(idDocs, 1);
    frmMedKardEdit.free;
  end;
  flPrih := false;
end;

procedure TfrmPrihEdit.FormActivate(Sender: TObject);
begin
  datechange:=false;
  if odsKart.RecordCount=0 then
    ndata := dmmain.pkgprihrash.GETRASHDATA(date)
  else
	begin
		if self.thisformcalledfrom_frmMedKartLst = false then  {�������� frmPrihEdit �� frmPrihLst}
			Begin
				if Assigned(frmPrihList) then
					ndata:=frmPrihList.odsSelDocPrih.FieldByName('FD_DATA').AsDateTime
				else if Assigned(frmMoveList) then
					ndata := frmMoveList.odsSelDocMove.FieldByName('FD_DATA').AsDateTime;
			end
		else     {�������� frmPrihEdit �� frmMedKartLst}
			Begin
//				ndata:=frmMedKardLst.odsEdit.FieldByName('FD_DATA').AsDateTime;
			end;
  end;

  globdata := deRegistrDate.date;
  Screen.Cursor := crSQLWait;
  curdata := dmMain.pkgprihrash.getcurdate(idDocs);
  flNewPrice := false;
  eNumDocChange(sender);
  Screen.Cursor := crDefault;
end;

procedure TfrmPrihEdit.deRegistrDateChange(Sender: TObject);
begin
  if DateToStr(deRegistrDate.Date) = '01.01.1700' then Exit;
  dmMain.pkgprihrash.setnewdate(idDocs,deRegistrDate.Date);
  if deRegistrDate.Date <= dateclose then
  begin
    windows.MessageBox(Self.Handle, PChar('�������� ���� ��������� � �������� ��������� �������!'),
      '������', MB_OK + MB_ICONerror);
    deRegistrDate.Text:='';
    exit;
  end;
  datechange := true;
  ndata := dmMain.pkgprihrash.getcurdate(idDocs);
  curdata := dmMain.pkgprihrash.getcurdate(idDocs);
  deRegistrDate.Date := StrToDate(Datetostr(curdata));
  globdata := deRegistrDate.date;
end;

procedure TfrmPrihEdit.Action1Execute(Sender: TObject);
begin
  if Assigned(frmPrihList) then
  begin
    if int(frmPrihList.odsSelDocPrih.FieldByName('FD_DATA').AsDateTime) <= int(dateclose) then exit;
  end
  else if Assigned(frmMoveList) then
    if int(frmMoveList.odsSelDocMove.FieldByName('FD_DATA').AsDateTime) <= int(dateclose) then exit;
  bEnableEdit := True;
  EnableInput( True );
  cxDBgPrihKartDBTableView1.OnDblClick := aceditExecute;
end;

procedure TfrmPrihEdit.Action2Execute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmPrihEdit.actDeleteUpdate(Sender: TObject);
begin
	if odsKart.RecordCount = 0 then begin
		actDelete.Enabled := false;
//		lcbNameTo.Enabled := true;
		lcbMO_GROUP_TO.Enabled := true;
	end
	else begin
		actDelete.Enabled := bEnableEdit;
	end;
end;

procedure TfrmPrihEdit.actAddUpdate(Sender: TObject);
begin
//	actAdd.Enabled := not(lcbNameTo.Text = '') and bEnableEdit;
	actAdd.Enabled := not(lcbMO_GROUP_TO.Text = '') and bEnableEdit;
end;

procedure TfrmPrihEdit.actSaveUpdate(Sender: TObject);
begin
  actSave.Enabled := (eNumdoc.Text <> '') and (deRegistrDate.Text <> '') and (odsKart.RecordCount > 0) and
                     (deRegistrDate.Text <> '') and (lcbPostav.Text <> '') and
                     bEnableEdit;
end;

procedure TfrmPrihEdit.aceditUpdate(Sender: TObject);
begin
//  acEdit.Enabled := bEnableEdit and (odsKart.RecordCount > 0);
end;

function TfrmPrihEdit.FormHelp(Command: Word; Data: Integer;
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

//procedure TfrmPrihEdit.DisableInput;
//begin
//  eNumDoc.Enabled := false;
//  deInvoiceDate.Enabled := frmPrihEdit.eNumDoc.Enabled;
//  deRegistrDate.Enabled := false;
//  deRegistrTime.Enabled := false;
//  LCBpostav.Enabled := false;
//  LCBnameTo.Enabled := false;
//  lcbMO_GROUP_TO.Enabled := False;
//  mComment.Enabled := false;
//  bEnableEdit := False;
//
//  actAdd.Enabled := False;
//  acedit.Enabled := False;
//  actDelete.Enabled := False;
//end;

procedure TfrmPrihEdit.EnableInput(const aEnabled : Boolean );
begin
  eNumDoc.Enabled        := aEnabled;
  deInvoiceDate.Enabled  := aEnabled;
  deRegistrDate.Enabled  := aEnabled;
  deRegistrTime.Enabled  := aEnabled;
  LCBpostav.Enabled      := aEnabled;
//  LCBnameTo.Enabled      := aEnabled;
  lcbMO_GROUP_TO.Enabled := aEnabled;
  mComment.Enabled       := aEnabled;

	actAdd.Enabled    := aEnabled;
  acedit.Enabled    := aEnabled;
  actDelete.Enabled := aEnabled;
	actSave.Enabled   := aEnabled;
end;

procedure TfrmPrihEdit.cxDBgPrihKartDBTableView1EditChanged(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
var id: variant;
begin
	if flNewPrice = false then begin
		dmMain.os.Savepoint('spEdit');
		if odsKart.Modified then begin
			odsKart.Post;
		end;
		if dmMain.PkgPrihRash.Getcheckcountkart(idDocs) > 0 then begin
			dmMain.os.RollbackToSavepoint('spEdit');
//			odsKart.refresh;
			odsKart.Close;
			odsKart.Open;

		end;
    (*    id := dmMain.PkgPrihRash.Dosetnewprice(idDocs,
          odsKartFN_KOL.AsFloat,
          odsKartFN_PRICE.AsFloat,
          odsKartKARTID.asinteger,
          curdata,
          odsKartDPCID.asinteger, 0);*)
    id := odsKartKARTID.AsInteger;
    dmMain.PkgPrihRash.DoSetPrihRash( idDocs,
                                      odsKartFN_KOL.AsInteger,
                                      odsKartFN_PRICE.AsInteger,   //���� �������� �� ������������
                                      id,
//                                      curdata,
                                      odsKartDPCID.asinteger, 1);

//    odsKart.refresh;
    odsKart.Close;
    odsKart.Open;
    odsKart.Locate('dpcid', id, []);
    self.cePriceDoc.Value := dmMain.PkgPrihRash.Getsumdoc(idDocs, 1);
  end
	else begin
		if odsKart.Modified then begin
			odsKart.Post;
		end;
    odsKart.Close;
    odsKart.Open;
//    odsKart.refresh;
    self.cePriceDoc.Value := dmMain.PkgPrihRash.Getsumdoc(idDocs, 1);
  end;
end;

procedure TfrmPrihEdit.cxDBgPrihKartDBTableView1DblClick(Sender: TObject);
begin
  acedit.Execute;
end;

procedure TfrmPrihEdit.odsKartAfterOpen(DataSet: TDataSet);
begin
  acedit.Enabled := odsKart.RecordCount > 0;
  actDelete.Enabled := odsKart.RecordCount > 0;
end;

end.


