// $Id: fActOstEdit.pas,v 1.4 2007/06/04 06:43:05 delphi5 Exp $
// Caption := 'Регистрация документа о возврате';
unit fActOstEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, ComCtrls, ToolWin, ExtCtrls, StdCtrls, Db, OracleData,
  DBCtrls, Oracle,  Mask, JvToolEdit, JvBaseEdits, JvFormPlacement, HtmlHlp,
  JvComponentBase, JvExStdCtrls, JvEdit, JvValidateEdit, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxTextEdit, cxSpinEdit, cxCurrencyEdit, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGridLevel, cxGrid, cxCalendar, cxDBLookupComboBox,
  cxContainer, cxMaskEdit, cxDropDownEdit;

type
  TfrmActOstEdit = class(TForm)
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
    Label4: TLabel;
    lcbActMaker: TDBLookupComboBox;
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
    odsActMaker: TOracleDataSet;
    dsActMaker: TDataSource;
    odsKart: TOracleDataSet;
    dsKart: TDataSource;
    Label5: TLabel;
    Label8: TLabel;
    odsMedic: TOracleDataSet;
    cePriceDoc: TJvValidateEdit;
    acrefresh: TAction;
    odsActMakerMOID: TIntegerField;
    odsActMakerFC_NAME: TStringField;
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
    cxGridPrihKart: TcxGrid;
    cxGridPrihKartLevel1: TcxGridLevel;
    cxGridPrihKartDBTableView1: TcxGridDBTableView;
    cxGridPrihKartDBTableView1ROWNUM: TcxGridDBColumn;
    cxGridPrihKartDBTableView1NAMEKART: TcxGridDBColumn;
    cxGridPrihKartDBTableView1FN_PARTY_NUM: TcxGridDBColumn;
    cxGridPrihKartDBTableView1FC_SERIAL: TcxGridDBColumn;
    cxGridPrihKartDBTableView1lkeiname: TcxGridDBColumn;
    cxGridPrihKartDBTableView1FN_KOL: TcxGridDBColumn;
    cxGridPrihKartDBTableView1FN_PRICE: TcxGridDBColumn;
    cxGridPrihKartDBTableView1FN_SUMM: TcxGridDBColumn;
    dsMO_GroupTo: TDataSource;
    odsMO_GroupTo: TOracleDataSet;
    lcbMO_GROUP_TO: TDBLookupComboBox;
    mComment: TEdit;
    deRegistrDate: TcxDateEdit;
    deInvoiceDate: TcxDateEdit;
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
    function FormHelp(Command: Word; Data: Integer; var CallHelp: Boolean): Boolean;
    procedure FormCreate(Sender: TObject);
	private
		{ Private declarations }
    procedure PrintConfirm();  // спрашиваем нужно ли распечатывать акт ввода остатков
	public
		{ Public declarations }
		flNewPrice: boolean;
		curdata: TDateTime;
		bEnableEdit : boolean;
		datechange: boolean;  //  проверка изменения даты при изменении документа
		idDocs: Integer;
		thisformcalledfrom_frmMedKartLst:boolean;
                IsNeedPrint : Boolean;
                IsChanged : boolean;

//    procedure EnableInput( aEnabled : Boolean );
//    procedure EnableActions( aEnabled : Boolean );

		constructor Create(Owner: TComponent); override;
	end;
var flPrih: boolean;

var
	frmActOstEdit: TfrmActOstEdit;

implementation

uses fdmMain, fmainform, fprihList, fMoveList, fMedKardLst,
  fMedKardEdit;


{$R *.DFM}
{$C+}

constructor TfrmActOstEdit.Create(Owner: TComponent);
begin
  inherited Create(owner);
  bEnableEdit := True;

  odsKart.Close;
  odsKart.Open;
  odsActMaker.Open;
  IsNeedPrint := False;
  IsChanged := False;
end;

// Сохранить
procedure TfrmActOstEdit.actSaveExecute(Sender: TObject);
begin
  if eNumdoc.Text = '' then
  begin
    MessageBox(Self.Handle, PChar('Необходимо ввести номер акта ввода остатков!'), 'Ошибка', MB_OK + mb_iconerror);
    eNumDoc.SetFocus;
    exit;
  end;
  if deInvoiceDate.Date = NullDate then
  begin
    MessageBox(Self.Handle, PChar('Необходимо ввести правильную дату документа!'), 'Ошибка', MB_OK + mb_iconerror);
    deInvoiceDate.SetFocus;
    exit;
  end;
  if deRegistrDate.Date = NullDate then
  begin
    MessageBox(Self.Handle, PChar('Необходимо ввести правильную дату регистрации документа!'), 'Ошибка', MB_OK + mb_iconerror);
    deRegistrDate.SetFocus;
    exit;
  end;
  if odsKart.IsEmpty then
  begin
    MessageBox(Self.Handle, PChar('Необходимо выбрать партию!'), 'Ошибка', MB_OK + mb_iconerror);
    exit;
  end;
  PrintConfirm;
  ModalResult := mrOk;
end;

procedure TfrmActOstEdit.acescExecute(Sender: TObject);
begin
  lcbActMaker.CloseUp(False);
  ModalResult := mrcancel;
end;

procedure TfrmActOstEdit.actAddExecute(Sender: TObject);
var id       : variant;
begin
datechange := True;
if deRegistrDate.Text = '' then
	begin
		windows.MessageBox(Self.Handle, PChar('Перед вводом карточки необходимо ввести дату!'), 'Ошибка', MB_OK + mb_iconerror);
		exit;
	end;
if (lcbActMaker.Text = '')or(lcbMO_GROUP_TO.Text = '') then
	begin
		windows.MessageBox(Self.Handle, PChar('Перед вводом карточки необходимо определить кому приход!'), 'Ошибка', MB_OK + mb_iconerror);
		exit;
	end;
Application.CreateForm(TfrmMedKardEdit, frmMedKardEdit);
flPrih := true;
//  frmMedKardEdit.fl_prih := True; //ни как не определимся что со сканером штрих коов делать
if frmMedKardEdit.ShowModal = mrok then
	begin
//*sill 31.08.2005
		if dmMain.pkgprihrash.Checkinkart(frmMedKardEdit.nID, idDocs) <> 0 then
		begin
			if MessageBoxEx(Self.Handle, PChar('Данная карточка уже существует в данном документе!' + #10#13+
					 'Будет произведен пересчет стоимости!' + #10#13 + 'Вы уверены?'),
					 PChar('Подтверждение'), MB_yesno + mb_iconquestion,$0419 {Russian}) = idYes
			then
			begin

				odsKart.Locate('kartid', frmMedKardEdit.nID,[]);


				id := dmMain.PkgPrihRash.DoSetPrihRash(idDocs,
								       frmMedKardEdit.seKol.value + odsKart.FieldByName('FN_KOL').AsFloat,
                                                                       0, //dmMain.pkgMedKart.GETPRICE(frmMedKardEdit.nID),   //Этот параметр не используется
                                                                       frmMedKardEdit.nID,
                                                                       odsKart.FieldByName('DPCID').AsInteger, 10);
			end
			else Exit;
		end
		else	id := dmMain.PkgPrihRash.DoSetPrihRash( idDocs,
								                                  frmMedKardEdit.seKol.value,
                                                  0, //dmMain.pkgMedKart.GETPRICE(frmMedKardEdit.nID),   //Этот параметр не используется
                                                  frmMedKardEdit.nID,
//								curdata,
                                                  0, 1);

//- 31.08.2005
		(*    if odsNametoPrihMOID.AsInteger <> dmMain.pkgprihrash.getmoidkart(frmMedKardEdit.odskartList.fieldbyname('kartid').asinteger) then
				begin
					id := dmMain.PkgPrihRash.Dosetnewprice(idDocs,
						frmMedKardEdit.seKol.value,
						frmMedKardEdit.seprice.value,
						frmMedKardEdit.odskartList.fieldbyname('kartid').asinteger,
						curdata, 0, 2);

				end
				else
				begin*)
		//    end;
		odsKart.SetVariable('adpid', idDocs); // ID документа
		odsKart.refresh;
		odsKart.Locate('kartid', {frmMedKardEdit.odskartList.fieldbyname('kartid').asinteger,}frmMedKardEdit.nID, []);

//    EnableActions( True );
		actSave.Enabled := true;
		acedit.Enabled := true;
		actDelete.Enabled := true;
    IsChanged := True;

		lcbActMaker.Enabled := false;
		lcbMO_GROUP_TO.Enabled := false;
//    frmPrihEdit.cePriceDoc.Value := dmMain.PkgPrihRash.Getsumdoc(idDocs, 1);
		cePriceDoc.Value := dmMain.PkgPrihRash.Getsumdoc(idDocs, 1);
		frmMedKardEdit.free;
	end;
flPrih := false;
end;

procedure TfrmActOstEdit.actDeleteExecute(Sender: TObject);
begin
	datechange := True;
	if windows.MessageBox(Self.Handle, PChar('Вы действительно хотите удалить данную запись ?'), 'Предупреждение', MB_YESNO + MB_ICONQUESTION) = mrYes then
	begin
		dmMain.PkgPrihRash.Dodelkart(odsKart.fieldbyname('kartid').asinteger, odsKart.fieldbyname('dpcid').asinteger);
    IsChanged := True;    
		odsKart.SetVariable('adpid', idDocs);
    odsKart.refresh;
		self.cePriceDoc.Value := dmMain.PkgPrihRash.Getsumdoc(idDocs, 1);
	end;
end;

procedure TfrmActOstEdit.eNumDocChange(Sender: TObject);
begin
if odsKart.RecordCount > 0 then
	begin
		if self.thisformcalledfrom_frmMedKartLst = false then  {вызывали frmPrihEdit из frmPrihLst}
			Begin
				if (Assigned(frmPrihList) and (frmPrihList.odsSelDocPrih.FieldByName('FL_EDIT').AsInteger <> 0))
				then
					begin
						acedit.Enabled := true;
						actDelete.Enabled := true;
						lcbActMaker.Enabled := false;
            lcbMO_GROUP_TO.Enabled := false;
					end;
			end
		else {вызывали frmPrihEdit из frmMedKartLst}
			Begin
				IF ROUND(dmMain.PKGTDOCS.GETFLEDIT(idDocs))<>0 THEN
					Begin
						acedit.Enabled := true;
						actDelete.Enabled := true;
						lcbActMaker.Enabled := false;
            lcbMO_GROUP_TO.Enabled := false;            
					end;
			end;
	end;
end;
{
procedure TfrmActOstEdit.dxDBgPrihKartEdited(Sender: TObject; Node: TdxTreeListNode);
var id: variant;
begin
	if flNewPrice = false then begin
		dmMain.os.Savepoint('spEdit');
		if odsKart.Modified then begin
			odsKart.Post;
		end;
		if dmMain.PkgPrihRash.Getcheckcountkart(idDocs) > 0 then begin
			dmMain.os.RollbackToSavepoint('spEdit');
			odsKart.refresh;
		end;
    (*    id := dmMain.PkgPrihRash.Dosetnewprice(idDocs,
          odsKartFN_KOL.AsFloat,
          odsKartFN_PRICE.AsFloat,
          odsKartKARTID.asinteger,
          curdata,
          odsKartDPCID.asinteger, 0);*)
    id := odsKartKARTID.AsInteger;
    dmMain.PkgPrihRash.DoSetPrihRash(idDocs,
      odsKartFN_KOL.AsInteger,
      odsKartFN_PRICE.AsFloat,    //Этот параметр не используется
      id,
//      curdata,
      odsKartDPCID.asinteger, 1);

    odsKart.refresh;
    odsKart.Locate('dpcid', id, []);
    self.cePriceDoc.Value := dmMain.PkgPrihRash.Getsumdoc(idDocs, 1);
  end
	else begin
		if odsKart.Modified then begin
			odsKart.Post;
		end;
    odsKart.refresh;
    self.cePriceDoc.Value := dmMain.PkgPrihRash.Getsumdoc(idDocs, 1);
  end;
end;
}
procedure TfrmActOstEdit.odsPostavAfterScroll(DataSet: TDataSet);
begin
  dmMain.fromid := 0;
end;

procedure TfrmActOstEdit.dxDBgPrihKartColumn6Change(Sender: TObject);
begin
  flNewPrice := true;
end;

procedure TfrmActOstEdit.aceditExecute(Sender: TObject);
var
  id: integer;
begin
  id := -1;
  datechange := true;
  Application.CreateForm(TfrmMedKardEdit, frmMedKardEdit);
  frmMedKardEdit.nID := odsKart.fieldbyname('kartid').asinteger; // передаем KartID  
  frmMedKardEdit.sekol.Value := odsKart.fieldbyname('fn_kol').asfloat;
	frmMedKardEdit.sesumm.Value := odsKart.fieldbyname('fn_summ').asfloat;
//	frmMedKardEdit.eKartName.Text := odsKart.fieldbyname('namekart').asstring;
//  frmMedKardEdit.odskartList.SetVariable('akartid', odsKart.fieldbyname('kartid').asinteger);
//
//  frmMedKardEdit.odskartList.Close;
//  frmMedKardEdit.odskartList.Open;  
  flPrih := true;
//  frmMedKardEdit.fl_prih := True;

  if frmMedKardEdit.ShowModal = mrOk then begin

  if (odsKart.FieldByName('KARTID').AsInteger <> {frmMedKardEdit.odskartList.FieldByName('kartid').AsInteger} frmMedKardEdit.nID ) and
  (dmMain.pkgprihrash.Checkinkart({frmMedKardEdit.odskartList.fieldbyname('kartid').asinteger} frmMedKardEdit.nID, idDocs) <> 0) then //если изменили карточку и такая уже есть, то
  begin
    if MessageBox(Self.Handle, PChar('Данная карточка уже существует в данном документе!' + #10#13+
         'Будет произведен пересчет стоимости!' + #10#13 + 'Вы уверены?'),
         'Подтверждение', MB_yesno + mb_iconquestion) = idYes
    then
    begin
      dmMain.PkgPrihRash.Dodelkart(odsKart.FieldByName('KARTID').AsInteger, odsKart.fieldbyname('dpcid').asinteger);//удаляем старую карточку
      //перебрасываем на новую
      odsKart.Locate('kartid',{frmMedKardEdit.odskartList.fieldbyname('kartid').AsInteger,} frmMedKardEdit.nID,[]);
      dmMain.PkgPrihRash.DoSetPrihRash(idDocs,
                        frmMedKardEdit.seKol.value + odsKart.FieldByName('FN_KOL').AsFloat,
                        frmMedKardEdit.cePriceView.Value,   //Этот параметр не используется
//                        odsKart.FieldByName('FN_SUMM').AsFloat + frmMedKardEdit.sesumm.Value,

                        //frmMedKardEdit.odskartList.fieldbyname('kartid').asinteger,
                        frmMedKardEdit.nID,
//                        curdata,
                        odsKart.FieldByName('DPCID').AsInteger, 10);
      IsChanged := True;
    end
    else Exit;
  end
  else
  begin
    if odsActMakerMOID.AsInteger <> dmMain.pkgprihrash.getmoidkart(odsKartKARTID.asinteger) then begin
      id := frmMedKardEdit.nID; //frmMedKardEdit.odskartList.fieldbyname('kartid').asinteger;
      dmMain.PkgPrihRash.DoSetPrihRash(idDocs,
        frmMedKardEdit.seKol.value,
        frmMedKardEdit.cePriceView.Value,   //Этот параметр не используется
        id,
//        curdata,
        odsKartDPCID.asinteger, 2);
    end
    else begin
      id := frmMedKardEdit.nID; //frmMedKardEdit.odskartList.fieldbyname('kartid').asinteger;
      dmMain.PkgPrihRash.DoSetPrihRash( idDocs,
				                                frmMedKardEdit.seKol.value,
                                        frmMedKardEdit.cePriceView.Value,   //Этот параметр не используется
                                        id,
//        curdata,
                                        odsKartDPCID.asinteger, 1);
      IsChanged := True;                                        
    end;
  end;
    odsKart.SetVariable('adpid', idDocs);
    odsKart.refresh;
    odsKart.Locate('kartid', id, []);
    self.cePriceDoc.Value := dmMain.PkgPrihRash.Getsumdoc(idDocs, 1);
    frmMedKardEdit.free;
  end;
  flPrih := false;
end;

procedure TfrmActOstEdit.FormActivate(Sender: TObject);
begin
  datechange:=false;
  if odsKart.RecordCount=0 then
    ndata := dmmain.pkgprihrash.GETRASHDATA(date)
  else
	begin
		if self.thisformcalledfrom_frmMedKartLst = false then  {вызывали frmPrihEdit из frmPrihLst}
			Begin
				if Assigned(frmPrihList) then
					ndata:=frmPrihList.odsSelDocPrih.FieldByName('FD_DATA').AsDateTime
				else if Assigned(frmMoveList) then
					ndata := frmMoveList.odsSelDocMove.FieldByName('FD_DATA').AsDateTime;
			end
		else     {вызывали frmPrihEdit из frmMedKartLst}
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

procedure TfrmActOstEdit.deRegistrDateChange(Sender: TObject);
begin
  if DateToStr(deRegistrDate.Date) = '01.01.1700' then Exit;
  dmMain.pkgprihrash.setnewdate(idDocs, deRegistrDate.Date);
  if deRegistrDate.Date <= dateclose then
  begin
    windows.MessageBox(Self.Handle, PChar('Выбраная дата находится в пределах закрытого периода!'),
      'Ошибка', MB_OK + MB_ICONerror);
    deRegistrDate.Text:='';
    exit;
  end;
  datechange := true;
  ndata := dmMain.pkgprihrash.getcurdate(idDocs);
  curdata := dmMain.pkgprihrash.getcurdate(idDocs);
  deRegistrDate.Date := StrToDate(Datetostr(curdata));
  globdata := deRegistrDate.date;
end;

procedure TfrmActOstEdit.Action1Execute(Sender: TObject);
begin
  if Assigned(frmPrihList) then
  begin
    if int(frmPrihList.odsSelDocPrih.FieldByName('FD_DATA').AsDateTime) <= int(dateclose) then exit;
  end
  else if Assigned(frmMoveList) then
    if int(frmMoveList.odsSelDocMove.FieldByName('FD_DATA').AsDateTime) <= int(dateclose) then exit;
  bEnableEdit := True;
  eNumDoc.Enabled := true;
  deInvoiceDate.Enabled := True;
  deRegistrDate.Enabled := true;
  deRegistrTime.Enabled := true;
  mComment.Enabled := true;

	actAdd.Enabled := true;
  acedit.Enabled := true;
  actDelete.Enabled := true;

	actSave.Enabled := true;
//  cxGridPrihKart.OnDblClick := aceditExecute;
  cxGridPrihKartDBTableView1.OnDblClick := aceditExecute;
  //  dxDBgPrihKart.OnDblClick := aceditExecute;
end;

procedure TfrmActOstEdit.Action2Execute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmActOstEdit.actDeleteUpdate(Sender: TObject);
begin
	if odsKart.RecordCount = 0 then begin
		actDelete.Enabled := false;
		lcbActMaker.Enabled := true;
		lcbMO_GROUP_TO.Enabled := true;    
	end
	else begin
		actDelete.Enabled := bEnableEdit;
	end;
end;

procedure TfrmActOstEdit.actAddUpdate(Sender: TObject);
begin
	actAdd.Enabled := not(lcbActMaker.Text = '') and bEnableEdit;
end;

procedure TfrmActOstEdit.actSaveUpdate(Sender: TObject);
begin
  actSave.Enabled := (eNumdoc.Text <> '') and (deRegistrDate.Text <> '') and (odsKart.RecordCount > 0)
          and (deRegistrDate.Text <> '') 
          and bEnableEdit;
end;

procedure TfrmActOstEdit.aceditUpdate(Sender: TObject);
begin
  acEdit.Enabled := bEnableEdit and (odsKart.RecordCount > 0);
end;

function TfrmActOstEdit.FormHelp(Command: Word; Data: Integer;
  var CallHelp: Boolean): Boolean;
begin
	Result := False;
  try
    // TODo Подумать насчет праметра  Command
    if Data = -1 then
      HtmlHelp(0, PChar('Medica.chm'), HH_DISPLAY_TOPIC, 0)
    else
      HtmlHelp(0, PChar('Medica.chm'), HH_HELP_CONTEXT, Data);
    CallHelp := False;
    Result := True;
  except
    on EConvertError do
      ShowMessage('Справка не найдена');
  end;
end;

procedure TfrmActOstEdit.PrintConfirm;
begin
  if IsChanged then
    IsNeedPrint := MessageBoxEx(Application.MainForm.Handle, PChar('Распечатать этот акт ввода остатков?'),PChar('Подтверждение'), MB_YESNO + MB_ICONQUESTION + MB_APPLMODAL ,$0419 {Russian}) = ID_YES;
end;

//procedure TfrmMoveEdit.EnableInput( aEnabled : Boolean );
//begin
//  eNumDoc.Enabled          := aEnabled;
//  deInvoiceDate.Enabled    := aEnabled;
//  deRegisterDate.Enabled   := aEnabled;
//  deRegistrTime.Enabled    := aEnabled;
//  LCBPostav.Enabled        := aEnabled;
//  lcbMO_GROUP_FROM.Enabled := aEnabled;
//  LCBTo.Enabled            := aEnabled;
//  lcbMO_GROUP_TO.Enabled   := aEnabled;
//  mComment.Enabled         := aEnabled;
//  bbuSelectVidSpasanie.Enabled := aEnabled;
//end;
//
//procedure TfrmMoveEdit.EnableActions( aEnabled : Boolean );
//begin
//  acins.Enabled            := aEnabled;
//  acedit.Enabled           := aEnabled;
//  acdel.Enabled            := aEnabled;
//  acenter.Enabled          := aEnabled;
//end;

procedure TfrmActOstEdit.FormCreate(Sender: TObject);
begin
  odsActMaker.Open;
  odsMO_GroupTo.Open;
end;

end.


