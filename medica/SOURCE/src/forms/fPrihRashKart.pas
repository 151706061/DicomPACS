// $Id: fPrihRashKart.pas,v 1.6 2007/06/04 06:43:05 delphi5 Exp $
//
unit fPrihRashKart;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    ExtCtrls, ComCtrls, ToolWin, ActnList, StdCtrls, DBCtrls, Db, OracleData,
    dxCntner, dxEditor, dxExEdtr, dxEdLib, dxDBELib, Buttons, Mask, JvToolEdit,
    JvBaseEdits, JvSpin,
    fMedic, Oracle, DBCtrlsEh, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxDBEdit, frmKartFields, cxGroupBox;

type
    TfrmPrihRashKart = class(TForm)
        CoolBar1: TCoolBar;
        ToolBar1: TToolBar;
        btnSave: TToolButton;
        btnCancel: TToolButton;
    al: TActionList;
        actSave: TAction;
        actCancel: TAction;
        actCardSelect: TAction;
    acSecret: TAction;
    odskartList: TOracleDataSet;
    odskartListFC_NAME: TStringField;
    odskartListEINAME: TStringField;
    odskartListKARTID: TIntegerField;
    odskartListPROD: TStringField;
    odskartListCERT: TStringField;
    odskartListEIID: TIntegerField;
    odskartListMEDICID: TIntegerField;
    odskartListFN_FPACKINUPACK: TFloatField;
    odskartListFK_FPACKID: TFloatField;
    dsKartList: TDataSource;
    odsDpc: TOracleDataSet;
    odsDpcFN_KOL: TFloatField;
    odsDpcFN_SUMM: TFloatField;
    dsDpc: TDataSource;
    FrameKartFields1: TFrameKartFields;
		procedure actSaveExecute(Sender: TObject);
		procedure actCancelExecute(Sender: TObject);
		procedure FormActivate(Sender: TObject);
		procedure SpeedButton1Click(Sender: TObject);
		procedure openlistExecute(Sender: TObject);
		procedure seKolChange(Sender: TObject);
		procedure sePrice_Change(Sender: TObject);
		procedure cePriceViewChange(Sender: TObject);
		procedure sesummChange(Sender: TObject);
		procedure cePriceViewKeyPress(Sender: TObject; var Key: Char);
		procedure sesummKeyPress(Sender: TObject; var Key: Char);
		procedure edProducerCertificateButtonClick(Sender: TObject);
		procedure FormCreate(Sender: TObject);
    procedure acSecretExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lcbEdizmCloseUp(Sender: TObject);
    procedure lcbEdizmDropDown(Sender: TObject);
	private
          FEiid: Integer;
		{}
	public
		{ Public declarations }
		flsum: integer;
		flprice: integer;
		m_bSecret: Boolean; // Флажок установлен, если используются секретные возможности
                fl_ManualTreb : Boolean; //признак того что форма поднимается с ручного требования (TfrmManualTreb)
                fl_prih : Boolean;       //признак того что форма вызывается при приходе
                sFilter : String;       //переменная для передачи
                nMedicID : Integer;
                pId      : Integer;   // KartID
                bHideProdCert : Boolean; //прячет сведения о Производителе и Сертификате
                IsOpenForView : Boolean;
	end;

var
    frmPrihRashKart: TfrmPrihRashKart;

implementation

uses fdmMain, fPrihEdit, fMedKardLst, fMoveEdit, uProdCertDlg, Pkgmedkart,
  fMedKardListFilter, fMainForm, fMedKardEdit;

{$R *.DFM}

// Сохранить
procedure TfrmPrihRashKart.actSaveExecute(Sender: TObject);
var
  kartid: integer;
//    MedKart: TMedKart;
begin
    if IsOpenForView = False then
    begin
      if bLog then SaveToLog('fPrihRashKart','actSaveExecute...Start');
  //    if eKartName.Text = '' then begin
  //        windows.MessageBox(Self.Handle, PChar('Необходимо выбрать карточку !'), 'Ошибка', MB_OK + mb_iconerror);
  //        SpeedButton1.Click;
  //        exit;
  //    end;
      if (seKol.Value <= 0) then begin
          windows.MessageBox(Self.Handle, PChar('Кол-во ТМЦ должно быть больше нуля !'), 'Ошибка', MB_OK + mb_iconerror);
          exit;
      end;
      if bLog then SaveToLog('fPrihRashKart','actSaveExecute...TMedKart.Create(dmMain.pkgMedKart.Session)');
  { 5.09.2005 sill закоментил операции с карточками  ... получаются блокировки из за этого , если хотят что то поредактировать пусть это делают в карточках
      MedKart := TMedKart.Create(dmMain.pkgMedKart.Session);
      MedKart.KartID := odskartListKARTID.AsFloat;
      if bLog then SaveToLog('fPrihRashKart','actSaveExecute...dmMain.pkgMedKart.GetKart(MedKart)');
      dmMain.pkgMedKart.GetKart(MedKart);
      MedKart.fcCertificate := edCertificate.Text;
      MedKart.fcProducer := edProducer.Text;
      if bLog then SaveToLog('fPrihRashKart','actSaveExecute...dmMain.pkgMedKart.SetKart(MedKart)');
      dmMain.pkgMedKart.SetKart(MedKart);
      MedKart.Free;
  }
      //	if (sePrice.Value <= 0) and ((flPrih = true) or (flrash = true)) then  begin
      //		    windows.MessageBox(Self.Handle, PChar('Цена ТМЦ должно быть больше нуля !'), 'Ошибка', MB_OK + mb_iconerror);
      //		    exit;
      //  end;


      kartid := Round(dmMain.pkgMedKart.DOSET('', FrameKartFields1.nMedicID, dmMain.pkgMedSes.GETCURMO, FrameKartFields1.edGoden.Date, FrameKartFields1.edSerial.Text, FrameKartFields1.nID, FrameKartFields1.m_nProdCertID, FrameKartFields1.PartyNum, cePriceView.Value, seKol.Value ));
//      kartid := FrameKartFields1.DoSave;

      if (kartid < 1) and (FrameKartFields1.edMedic.Text <> '') then  exit;

      // Воронов О.А. убрал, попытка выбирать препарат из списка препаратов, а не из списка карточек
        odskartList.Close;
        odskartList.SetVariable('akartid', kartid);
        odskartList.Open;
//        odskartList.refresh;
        odsDpc.Close;
        odsDpc.SetVariable('akartid', kartid);
        odsDpc.Open;
//        odsDpc.refresh;
  //      eKartName.Text := odskartListFC_NAME.AsString;
      //  eEdIzm.Text := odskartListEINAME.AsString;
      //  odsEdizm.SetVariable('MEDICID',odskartList.FieldByName('MEDICID').AsInteger);
      //  odsEdizm.Refresh;
        lcbEdizm.KeyValue := odskartList.FieldByName('EIID').AsInteger;
  // попытка искоренить усредненныую цену на медикамент
//        sePrice.Value := dmMain.pkgprihrash.GetLastnewprice(odskartListKARTID.AsInteger, ndata, round(dmMain.fromid));
//        cePriceView.Value := sePrice.Value;//dmMain.pkgprihrash.GetLastnewprice(odskartListKARTID.AsInteger, ndata, round(dmMain.fromid));

      //если выбранны фасовочные единицы, то нужно перевести в упаковочные ... т.к. в базе хранится в упаковочных
//      if lcbEdizm.KeyValue = odskartList.FieldByName('FK_FPACKID').AsInteger then //Фасовочные единицы
//        seKol.Value := seKol.Value / odskartList.FieldByName('FN_FPACKINUPACK').AsInteger;
    end;        
    ModalResult := mrok;
end;

procedure TfrmPrihRashKart.actCancelExecute(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure TfrmPrihRashKart.FormActivate(Sender: TObject);
begin
  if bLog then SaveToLog('fPrihRashKart','FormActivate.');
  flprice := 0;
  flsum := 0;
  seSumm.Value := seKol.Value * sePrice.Value;
//  eEdIzm.Text := odskartListEINAME.asstring;

//  odsEdizm.SetVariable('MEDICID',odskartList.FieldByName('MEDICID').AsInteger);
//  odsEdizm.Refresh;
//  lcbEdizm.KeyValue := odskartList.FieldByName('EIID').AsInteger;

//  edProducer.Text := odskartListPROD.AsString;
//  edCertificate.Text := odskartListCERT.AsString;
  if fl_ManualTreb or flMove then
  begin
    if not m_bSecret then begin
            Label2.Visible := false;
            seSumm.Visible := false;
//            Width := 348;
    end;
    cePriceView.Visible := false;
    Label4.Visible := false;

//    edCertificate.Visible := False;
//    edProducer.Visible := False;
//    lblProducer.Visible := False;
//    lblCertificate.Visible := False;
//    Height := 206;
  end;
//  if bHideProdCert then
//  begin
//    edCertificate.Visible := False;
//    edProducer.Visible := False;
//    lblProducer.Visible := False;
//    lblCertificate.Visible := False;
//    Height := 215;
//  end;

//  if eKartName.Text = '' then begin
//      SpeedButton1Click(Sender);
//  end;
  // делаем по аналогии
  if pId < 1 then
  begin //если препарат добавляется, то при открытии формы сразу даем выбрать медикамент
    pId := -1;
    FrameKartFields1.edMedicButtonClick( FrameKartFields1.edMedic );
  end
  else
  begin // если на редактирование, то отображаем его
    FrameKartFields1.nID := pId;
  end;
  FrameKartFields1.FillForm;
  cePriceView.Value := sePrice.Value;

// режим просмотра - когда оформляется расход
  if IsOpenForView then
  begin
    cePriceView.Enabled := False;
    sesumm.Enabled := False;
    seKol.MinValue := 1;
    seKol.MaxValue := 9999999;
    seKol.Value    := 1;

    FrameKartFields1.edMedic.Enabled := False;
    FrameKartFields1.edSerial.Enabled := False;
    FrameKartFields1.cbProdCert.Enabled := False;
    FrameKartFields1.edGoden.Enabled := False;
  end;
end;

// Выбор карточки
// этого уже нет Воронов О.А. 25.04.2007
procedure TfrmPrihRashKart.SpeedButton1Click(Sender: TObject);
var
//    MedID: Integer;
		kartid: integer;
		frmMedKardListFilter : TfrmMedKardListFilter;
		sWhereAdition        : String;

begin
//MedID := -1;
//* sill 2.05.05 - мертвый код отказались от этого
if fl_prih then
	begin
		frmMedKardListFilter := TfrmMedKardListFilter.Create(Self);
		try
		 if frmMedKardListFilter.ShowModal = mrCancel then exit;
		 if frmMedKardListFilter.rgFilter.ItemIndex = 0 then sWhereAdition := ''
		 else sWhereAdition := ' AND FC_EANCODE = ' + trim(frmMedKardListFilter.edFilter.Text);
		finally
		 frmMedKardListFilter.Free;
		end;
	end;

if (Assigned(frmMoveEdit) and frmMoveEdit.bReturn) then
		kartid := DoShowMedKardLst(nMedicID, 0, round(dmMain.fromid), False, FALSE)
//		kartid := DoShowMedKardLst(nMedicID, 0, round(dmMain.fromid), False, frmMoveEdit.bReturn) БЫЛО 11.01.2007
//      kartid := DoShowMedKardLst(nMedicID, 0, round(dmMain.pkgMedSes.getcurmo), False, frmMoveEdit.bReturn)
else
begin
               kartid := DoShowMedKardLst(nMedicID, pId, round(dmMain.fromid),False,False,sWhereAdition,False,sFilter);
end;

if (kartid < 1) and (FrameKartFields1.edMedic.Text <> '') then exit;

// Воронов О.А. убрал, попытка выбирать препарат из списка препаратов, а не из списка карточек
  odskartList.SetVariable('akartid', kartid);
  odskartList.refresh;
  odsDpc.SetVariable('akartid', kartid);
  odsDpc.refresh;
//  eKartName.Text := odskartListFC_NAME.AsString;
//  eEdIzm.Text := odskartListEINAME.AsString;
//  odsEdizm.SetVariable('MEDICID',odskartList.FieldByName('MEDICID').AsInteger);
//  odsEdizm.Refresh;
  lcbEdizm.KeyValue := odskartList.FieldByName('EIID').AsInteger;
  sePrice.Value := dmMain.pkgprihrash.GetLastnewprice(odskartListKARTID.AsInteger, ndata, round(dmMain.fromid));
  cePriceView.Value := sePrice.Value;//dmMain.pkgprihrash.GetLastnewprice(odskartListKARTID.AsInteger, ndata, round(dmMain.fromid));

  FrameKartFields1.nID := kartid;
  FrameKartFields1.FillForm;
end;

procedure TfrmPrihRashKart.openlistExecute(Sender: TObject);
begin
//		SpeedButton1.Click;
end;

procedure TfrmPrihRashKart.seKolChange(Sender: TObject);
begin
    if seKol.Value < 0 then begin
        seKol.Value := 0;
    end;
    seSumm.Value := seKol.Value * sePrice.Value;
end;

procedure TfrmPrihRashKart.sePrice_Change(Sender: TObject);
begin
    //cePriceView.Value:=sePrice.Value;
end;

procedure TfrmPrihRashKart.cePriceViewChange(Sender: TObject);
begin
    flprice := 1;
    if flsum <> 1 then
        sePrice.Value := cePriceView.Value;
    flsum := 0;
    seSumm.Value := seKol.Value * sePrice.Value;
end;

procedure TfrmPrihRashKart.sesummChange(Sender: TObject);
begin
    flsum := 1;
    if flprice = 0 then
    begin
        if seKol.Value <> 0 then
            sePrice.Value := seSumm.Value / seKol.Value;
        cepriceView.Value := seprice.Value;
    end
    else
    begin
        flprice := 0;
        flsum := 0;
    end;
end;

procedure TfrmPrihRashKart.cePriceViewKeyPress(Sender: TObject;
    var Key: Char);
begin
    flprice := 0;
    flsum := 0;
end;

procedure TfrmPrihRashKart.sesummKeyPress(Sender: TObject; var Key: Char);
begin
    flprice := 0;
    flsum := 0;
end;

procedure TfrmPrihRashKart.edProducerCertificateButtonClick(Sender: TObject);
//var
//    dlg: TProdCertDlg;
begin
//    dlg := TProdCertDlg.Create(Self);
//    if dlg.ShowModal = mrOK then begin
//        edProducer.Text := dlg.m_strProd;
//        edCertificate.Text := dlg.m_strCert;
//    end;
//    dlg.Free;
end;

procedure TfrmPrihRashKart.FormCreate(Sender: TObject);
begin
  m_bSecret := False;
  IsOpenForView := False;
  FrameKartFields1.InitEventsHandlers;  // иницируем обработчики фрейма
end;

procedure TfrmPrihRashKart.acSecretExecute(Sender: TObject);
begin
  TAction(Sender).Checked := not TAction(Sender).Checked;
  Label4.Visible := TAction(Sender).Checked;
  cePriceView.Visible := TAction(Sender).Checked;
  Label4.Visible := TAction(Sender).Checked;
end;

procedure TfrmPrihRashKart.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  lcbEdizm.CloseUp(False);
end;

procedure TfrmPrihRashKart.lcbEdizmCloseUp(Sender: TObject);
begin
  if lcbEdizm.KeyValue <> FEiid then
  begin
    if lcbEdizm.KeyValue = odskartList.FieldByName('EIID').AsInteger then //Фасовочные -> Упаковочные единицы
      seKol.Value := seKol.Value / odskartList.FieldByName('FN_FPACKINUPACK').AsInteger
    else if lcbEdizm.KeyValue = odskartList.FieldByName('FK_FPACKID').AsInteger then //Упаковочные -> Фасовочные единицы
      seKol.Value := seKol.Value * odskartList.FieldByName('FN_FPACKINUPACK').AsInteger;
  end;
end;

procedure TfrmPrihRashKart.lcbEdizmDropDown(Sender: TObject);
begin
  Feiid := lcbEdizm.KeyValue;
end;

end.

