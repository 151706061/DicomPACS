unit fProduceByTreb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxSpinEdit, cxCalendar,
  cxDBLookupComboBox, OracleData, Oracle, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls, cxGridCustomView,
  cxGrid, cxContainer, cxGroupBox, cxMaskEdit, StdCtrls, cxDropDownEdit,
  cxTextEdit, ExtCtrls, cxSplitter, Menus, cxButtons, ActnList;

type
  TfmProduceByTreb = class(TForm)
    cxGroupBox1: TcxGroupBox;
    grTrebMedic: TcxGrid;
    grTrebMedicDBTableView1: TcxGridDBTableView;
    grTrebMedicDBTableView1_FC_MEDIC: TcxGridDBColumn;
    grTrebMedicDBTableView1_FC_NAME_LAT: TcxGridDBColumn;
    grTrebMedicDBTableView1_FC_EDIZM: TcxGridDBColumn;
    grTrebMedicDBTableView1_FN_KOL: TcxGridDBColumn;
    grTrebMedicDBTableView1_FD_CREATE: TcxGridDBColumn;
    grTrebMedicDBTableView1_FK_CREATE_MO_ID: TcxGridDBColumn;
    grTrebMedicDBTableView1_FD_EDIT: TcxGridDBColumn;
    grTrebMedicDBTableView1_FK_EDIT_MO_ID: TcxGridDBColumn;
    grTrebMedicLevel1: TcxGridLevel;
    odsTrebMedic: TOracleDataSet;
    dsTrebMedic: TDataSource;
    grTrebMedicDBTableView1_fn_amount: TcxGridDBColumn;
    odsTreb: TOracleDataSet;
    odsComplexMedics: TOracleDataSet;
    odsIngrOst: TOracleDataSet;
    buSign: TcxButton;
    buDel: TcxButton;
    buProduceMedic: TcxButton;
    odsCheckProduce: TOracleDataSet;
    grTrebMedicDBTableView1_fk_tkartcomposid: TcxGridDBColumn;
    grTrebMedicDBTableView1_FK_TREBID: TcxGridDBColumn;
    paButtons: TPanel;
    ActionList1: TActionList;
    acSign: TAction;
    acUnsign: TAction;
    odsKARTCOMPOS: TOracleDataSet;
    odsCheckSign: TOracleDataSet;
    oqCreateRashByTreb: TOracleQuery;
    oqDeleteRashByTreb: TOracleQuery;
    grTrebMedicDBTableView1_FK_ID: TcxGridDBColumn;
    procedure grTrebMedicDBTableView1DblClick(Sender: TObject);
    procedure acUnsignExecute(Sender: TObject);
    procedure acSignExecute(Sender: TObject);
    procedure buDelClick(Sender: TObject);
    procedure buProduceMedicClick(Sender: TObject);
    procedure ActionList1Update(Action: TBasicAction; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    function AutoProduceByTreb(aTrebID : integer; aDateProduce : TDateTime) : integer;
  end;

    function ShowProduceByTreb(aTrebID : integer) : integer;

implementation

uses
  fdmMain, fMedProduceEdit, fDateInput;

{$R *.dfm}


{ TfmProduceByTreb }

function ShowProduceByTreb(aTrebID : integer) : integer;
var
  fmProduceByTreb: TfmProduceByTreb;
  frmDateInput : TfrmDateInput;
begin
  Result := 0;
  Application.CreateForm(TfmProduceByTreb, fmProduceByTreb);

  fmProduceByTreb.odsTreb.Close;
  fmProduceByTreb.odsTreb.SetVariable('PTREBID', aTrebID);
  fmProduceByTreb.odsTreb.Open;

  fmProduceByTreb.odsTrebMedic.Close;
  fmProduceByTreb.odsTrebMedic.SetVariable('FK_TREBID', aTrebID);
  fmProduceByTreb.odsTrebMedic.Open;

  // проверяем было ли произведено ранее
  fmProduceByTreb.odsCheckProduce.Close;
  fmProduceByTreb.odsCheckProduce.SetVariable('FK_TREBID', aTrebID);
  fmProduceByTreb.odsCheckProduce.Open;
  if fmProduceByTreb.odsCheckProduce.RecordCount = 0 then
  begin
      Application.CreateForm(TfrmDateInput, frmDateInput);
      frmDateInput.deDate.Date := ServerDate( dmMain.os );
      if frmDateInput.ShowModal <> mrOk then
      begin
        frmDateInput.Free;
        fmProduceByTreb.Free;
        Exit;
      end;

    fmProduceByTreb.AutoProduceByTreb(aTrebID, frmDateInput.deDate.Date);
    frmDateInput.Free;
  end;

  fmProduceByTreb.odsCheckSign.Close;
  fmProduceByTreb.odsCheckSign.SetVariable('PFK_TREBID', aTrebID);
  fmProduceByTreb.odsCheckSign.Open;

//  kc.KARTCOMPOS_count, kc.max_fl_edit,
//  tdp.med_treb_count, td.fk_treb_id, td.fk_dpid, td.fl_rpo, td.dpid, td.fl_edit,
//  k.n
  if (fmProduceByTreb.odsCheckSign.FieldByName('KARTCOMPOS_count').AsVariant = 0) or
     (fmProduceByTreb.odsCheckSign.FieldByName('max_fl_edit').AsVariant = 1) or
     (fmProduceByTreb.odsCheckSign.FieldByName('dpid').IsNull)or
     (fmProduceByTreb.odsCheckSign.FieldByName('fl_edit').AsVariant <> 0) then
    fmProduceByTreb.buSign.Action := fmProduceByTreb.acSign
  else
    fmProduceByTreb.buSign.Action := fmProduceByTreb.acUnsign;

  Result := fmProduceByTreb.ShowModal;

  fmProduceByTreb.Free;
end;



procedure TfmProduceByTreb.acSignExecute(Sender: TObject);
begin
  odsCheckSign.Close;
  odsCheckSign.Open;
//kc.KARTCOMPOS_count, kc.max_fl_edit,
  if (odsCheckSign.FieldByName('KARTCOMPOS_count').AsVariant = 0)or(odsCheckSign.FieldByName('max_fl_edit').AsVariant = 1) then
  begin
    odsKARTCOMPOS.Close;
    odsKARTCOMPOS.SetVariable('PFK_TREB_ID', odsTrebMedic.FieldByName('FK_TREBID').AsVariant);
    odsKARTCOMPOS.Open;
    odsKARTCOMPOS.First;

    while odsKARTCOMPOS.Eof = False do
    begin
      try
        dmMain.oqSignRPO.SetVariable('FK_TKARTCOMPOSID', odsKARTCOMPOS.FieldByName('FK_ID').AsVariant);
        dmMain.oqSignRPO.SetVariable('FD_DATA',          odsKARTCOMPOS.FieldByName('FD_DATA').AsVariant);
        dmMain.oqSignRPO.SetVariable('FK_MEDICID',       odsKARTCOMPOS.FieldByName('FK_MEDICID').AsVariant);
        dmMain.oqSignRPO.SetVariable('FC_SERIAL',        odsKARTCOMPOS.FieldByName('FC_SERIAL').AsVariant);
        dmMain.oqSignRPO.SetVariable('FD_GODEN_DO',      odsKARTCOMPOS.FieldByName('FD_GODEN_DO').AsVariant);
        dmMain.oqSignRPO.SetVariable('FN_PRICE_FOR1',    odsKARTCOMPOS.FieldByName('FN_PRICE_FOR_1').AsVariant);
        dmMain.oqSignRPO.SetVariable('FN_AMOUNT',        odsKARTCOMPOS.FieldByName('FN_AMOUNT').AsVariant);
        dmMain.oqSignRPO.SetVariable('nmb_TKARTCOMPOS',  odsKARTCOMPOS.FieldByName('FN_NUMBER').AsVariant);
        dmMain.oqSignRPO.Execute;

        dmMain.os.Commit;
      except
        on E: Exception do
        begin
          dmMain.os.Rollback;
          Application.MessageBox(PChar('При подписании производства возникла ошибка.'#13#10'Обратитесь службу поддержки.'#13#10#13#10+E.Message), 'Ошибка', MB_OK+MB_ICONERROR);
        end;
      end;
      odsKARTCOMPOS.Next;
    end;
    odsKARTCOMPOS.Close;
  end;

  odsCheckSign.Close;
  odsCheckSign.Open;
//td.dpid, td.fl_edit
  if (odsCheckSign.FieldByName('dpid').IsNull)or(odsCheckSign.FieldByName('fl_edit').AsVariant <> 0) then
  begin
    // делаем расход по требованию
    oqCreateRashByTreb.SetVariable('PFK_TREB_ID', odsTrebMedic.FieldByName('FK_TREBID').AsVariant);
    oqCreateRashByTreb.Execute;
  end;

  dmMain.os.Commit;

  buSign.Action := acUnsign;
end;

procedure TfmProduceByTreb.ActionList1Update(Action: TBasicAction;
  var Handled: Boolean);
begin
  buDel.Enabled := (buSign.Action = acSign);
  buProduceMedic.Enabled := (buSign.Action = acSign);  
end;

procedure TfmProduceByTreb.acUnsignExecute(Sender: TObject);
begin
  // удаляем расход по требованию
  oqDeleteRashByTreb.SetVariable('PFK_TREB_ID', odsTrebMedic.FieldByName('FK_TREBID').AsVariant);
  oqDeleteRashByTreb.Execute;

//  odsTrebMedic.First;
//  while odsTrebMedic.Eof = False do
//  begin
    odsKARTCOMPOS.Close;
    odsKARTCOMPOS.SetVariable('PFK_TREB_ID', odsTrebMedic.FieldByName('FK_TREBID').AsVariant);
    odsKARTCOMPOS.Open;
    odsKARTCOMPOS.First;
    while odsKARTCOMPOS.Eof = False do
    begin
      try
        dmMain.oqUnSignRPO.SetVariable('FK_TKARTCOMPOSID', odsKARTCOMPOS.FieldByName('FK_ID').AsInteger);
        dmMain.oqUnSignRPO.SetVariable('PRIH_DPID',        odsKARTCOMPOS.FieldByName('fk_doc_prih').AsVariant);
        dmMain.oqUnSignRPO.SetVariable('RASH_DPID',        odsKARTCOMPOS.FieldByName('fk_doc_rash').AsVariant);

        dmMain.oqUnSignRPO.Execute;
        dmMain.os.Commit;
      except
        on E: Exception do
        begin
          dmMain.os.Rollback;
          Application.MessageBox(PChar('При отмене подписи производства возникла ошибка.'#13#10'Обратитесь службу поддержки.'#13#10#13#10+E.Message), 'Ошибка', MB_OK+MB_ICONERROR);
        end;
      end;
      odsKARTCOMPOS.Next;
    end;
    odsKARTCOMPOS.Close;

//    odsTrebMedic.Next;
//  end;

  dmMain.os.Commit;

  buSign.Action := acSign;  
end;

function TfmProduceByTreb.AutoProduceByTreb(aTrebID: integer; aDateProduce : TDateTime): integer;
var
  CurMedicID, Num : integer;
  PRODUCE_TYPE_LFP_ID  : integer;
  CurKol, NeedKol, NeedKolFor1, KARTCO_ITEM_ID, CurProduceID  : Double;
  s_cur, s_final : string;

begin
  if dmMain.odsTProduce_type.Locate('FC_SYNONIM', 'LFP', []) then
    PRODUCE_TYPE_LFP_ID := dmMain.odsTProduce_type.FieldByName('FK_ID').AsInteger
  else
    PRODUCE_TYPE_LFP_ID := 0;

  odsTreb.Close;
  odsTreb.SetVariable('pTrebID', aTrebID);
  odsTreb.Open;

  odsTrebMedic.Close;
  odsTrebMedic.SetVariable('FK_TREBID', aTrebID);
  odsTrebMedic.Open;

  oqCreateRashByTreb.SetVariable('PDATE', aDateProduce);

  if odsTrebMedic.RecordCount = 0 then
  begin // проверяем наличие медикаментов
    Application.MessageBox('В требовании нет медикаментов!', 'ВНИМАНИЕ', MB_ICONWARNING+MB_OK);
    Result := -1;
    Exit;
  end;
  dmMain.ClearTempOst(odsTreb.FieldByName('fk_mogroupid_to').AsInteger);  
  odsTreb.First;

  // перебираем все медикаменты в требовании - каждый сначала нужно произвести,
  // потом внести в расход по требованию
  while odsTrebMedic.Eof = False do
  begin
    odsComplexMedics.Close;
    odsComplexMedics.SetVariable('FK_MEDIC', odsTrebMedic.FieldByName('fk_medicid').AsVariant);
    odsComplexMedics.SetVariable('TKARTCOMPOS_FN_AMOUNT', odsTrebMedic.FieldByName('fn_kol').AsVariant);
    odsComplexMedics.Open;
    odsComplexMedics.First;

    CurProduceID := dmMain.PKGTKARTCOMPOS.CREATEBLANKTKARTCOMPOS;
    Num := trunc(dmMain.PKGTKARTCOMPOS.GETNEXTNUMBER);
    dmMain.InitAdditionalUpdateTable('MED.TKARTCOMPOS');
    if (dmMain.ConfigParams.GetParamValue('FUNC_USE_RPO_DIFF', 0) = 1) then // если производство с типом, апдейтим тип
    begin
      dmMain.AddAdditionalUpdateTable('FK_PRODUCE_TYPE', otInteger, PRODUCE_TYPE_LFP_ID);
    end;
    dmMain.AddAdditionalUpdateTable('FK_TREB_ID', otInteger, odsTreb.FieldByName('FK_ID').AsVariant);
    dmMain.AddAdditionalUpdateTable('fk_medicid', otInteger, odsTrebMedic.FieldByName('fk_medicid').AsVariant);
    dmMain.AddAdditionalUpdateTable('fd_data', otDate, aDateProduce);
    dmMain.AddAdditionalUpdateTable('FL_EDIT', otInteger, 1);
    dmMain.AddAdditionalUpdateTable('fn_amount', otInteger, odsTrebMedic.FieldByName('fn_kol').AsVariant);
//    dmMain.AddAdditionalUpdateTable('FL_TARA', otInteger, 1);
    dmMain.AddAdditionalUpdateTable('fn_number', otInteger, Num);
    dmMain.AddAdditionalUpdateTable('fc_serial', otString, Num);
    dmMain.ExecuteAdditionalUpdateTable('FK_ID', otInteger, CurProduceID); // связываем производство и требование

    // остатки смотрим по дате
    odsIngrOst.Close;
    odsIngrOst.SetVariable('PPRODUCE_DATE', aDateProduce);
    odsIngrOst.Open;

    // пытаемся произвести затребованный медикамент
    //сначала проверяем наличие доступных остатков
    s_final := '';
    while (odsComplexMedics.Eof = False) do
    begin
      s_cur := '';
      CurMedicID := odsComplexMedics.FieldByName('MEDICID').AsInteger;
      NeedKol    := odsComplexMedics.FieldByName('FN_AMOUNT').AsFloat;
      NeedKolFor1:= odsComplexMedics.FieldByName('FN_AMOUNT_FOR1').AsFloat;

      odsIngrOst.Filtered := False;
      odsIngrOst.Filter := 'medicid = '+IntToStr(CurMedicID);
      odsIngrOst.Filtered := True;
      odsIngrOst.First;
      while (odsIngrOst.Eof = False)and(NeedKol>0) do
      begin
        if odsIngrOst.FieldByName('FN_KOLOST').AsFloat >= NeedKol then
        begin
          CurKol := NeedKol;
          NeedKol := 0;
        end
        else
        begin
          CurKol := odsIngrOst.FieldByName('FN_KOLOST').AsFloat;
          NeedKol := NeedKol - odsIngrOst.FieldByName('FN_KOLOST').AsFloat;
        end;

        KARTCO_ITEM_ID := dmMain.PKGTKARTCOITEM.ADDTKARTCOITEM( CurProduceID,
                                              CurKol,
                                              NeedKolFor1,
                                              odsIngrOst.FieldByName('KARTID').asInteger
                                              );

        // связываем потраченные в процессе производства медкиаменты с медикаментом из требования
        dmMain.InitAdditionalUpdateTable('MED.TKARTCO_ITEM');
        dmMain.AddAdditionalUpdateTable('FK_TREB_DPC_ID', otInteger, odsTrebMedic.FieldByName('FK_ID').AsVariant);
        dmMain.ExecuteAdditionalUpdateTable('FK_ID', otInteger, KARTCO_ITEM_ID);

        // во временных остатках отнимаем потраченные позиции
        dmMain.SetTempOst(odsTreb.FieldByName('fk_mogroupid_to').AsInteger, odsIngrOst.FieldByName('KARTID').asInteger, -CurKol);

        odsIngrOst.Next;
      end;
      if (odsIngrOst.Eof = False)and(NeedKol>0) then // недостающие остатки
        s_cur := s_cur + #13#10+'  '+odsComplexMedics.FieldByName('FC_MEDICNAME').AsString+' '+FloatToStr(NeedKol)+odsComplexMedics.FieldByName('FC_UEDIZM').AsString;

      odsIngrOst.Filtered := False;
              
      odsComplexMedics.Next;
    end; // while (odsComplexMedics.Eof = False) do
    delete(s_cur,1,2);
    if s_cur <> '' then
    begin
      s_final := s_final+#13#10#13#10 + odsTrebMedic.FieldByName('FC_MEDIC').AsString+'('+FloatTOStr(odsTrebMedic.FieldByName('FN_KOL').AsFloat)+' '+odsTrebMedic.FieldByName('FC_EDIZM').AsString+') '+s_cur;
    end;
    odsTrebMedic.Next;
  end; // while odsTrebMedic.Eof = False do

  // чистим, блистим, лакируем
  dmMain.ClearTempOst(odsTreb.FieldByName('fk_mogroupid_to').AsInteger);
  odsIngrOst.Close;
  odsCheckProduce.close;
  odsComplexMedics.Close;

  if s_final <> '' then
  begin  // объявдяем ахтунг
    Application.MessageBox(PAnsiChar('Для производства не хватило остатков.'+s_final), 'Внимание', MB_OK+MB_ICONINFORMATION);
    Result := 0;
  end
  else
    Result := 1;
  dmMain.os.Commit;    

  odsTrebMedic.Close;
  odsTrebMedic.Open;  
//  RashByTrebID  := dmMain.PkgPrihRash.Createshablon( VID_DVIJENIE, VIDMOVE_NAKL_TREB );
end;

procedure TfmProduceByTreb.buDelClick(Sender: TObject);
var
  fk_id : integer;
begin
  if buSign.Action = acUnsign then
  begin
    Application.MessageBox('Удалять можно только неподписанное производство!', 'ВНИМАНИЕ', MB_OK+MB_ICONINFORMATION);
    exit;
  end;

    if odsTrebMedic.RecordCount > 0 then
  begin
    fk_id := odsTrebMedic.FieldByName('fk_id').AsInteger;
    dmMain.PKGTKARTCOMPOS.DELTKARTCOMPOS(odsTrebMedic.FieldByName('fk_tkartcomposid').AsInteger);

    odsTrebMedic.Close;
    odsTrebMedic.Open;
    odsTrebMedic.Locate('fk_id', fk_id, []);
  end;
end;

procedure TfmProduceByTreb.buProduceMedicClick(Sender: TObject);
var
  frmDateInput : TfrmDateInput; 
begin
  if buSign.Action = acUnsign then
  begin
    Application.MessageBox('Перепроизводить можно только неподписанное производство!', 'ВНИМАНИЕ', MB_OK+MB_ICONINFORMATION);
    exit;
  end;

  if Application.MessageBox('Предыдущее производство по данному требованию будет удалено'#13#10'(расход по требованию, приходы и расходы из РПО)'#13#10'Продолжить?', 'ВНИМАНИЕ', MB_YESNO+MB_ICONQUESTION)<>IDYES then
    Exit;
  Application.CreateForm(TfrmDateInput, frmDateInput);
  frmDateInput.deDate.Date := ServerDate( dmMain.os );
  if frmDateInput.ShowModal <> mrOk then
  begin
    frmDateInput.Free;
    Exit;
  end;

  acUnsign.Execute;
  odsTrebMedic.First;
  while odsTrebMedic.Eof = False do
  begin
    dmMain.PKGTKARTCOMPOS.DELTKARTCOMPOS(odsTrebMedic.FieldByName('fk_tkartcomposid').AsInteger);
    odsTrebMedic.Next;
  end;

  AutoProduceByTreb( odsTrebMedic.GetVariable('FK_TREBID'), frmDateInput.deDate.Date );
  frmDateInput.Free;

  odsTrebMedic.Close;
  odsTrebMedic.Open;  
end;

procedure TfmProduceByTreb.grTrebMedicDBTableView1DblClick(Sender: TObject);
var
  res : integer;

begin
  if VarIsNull(grTrebMedicDBTableView1_fk_tkartcomposid.EditValue) then
    res := fMedProduceEdit.DoShowMedProduceEdit( -1, True )
  else
    res := fMedProduceEdit.DoShowMedProduceEdit( grTrebMedicDBTableView1_fk_tkartcomposid.EditValue, False );

  if Res > 0 then
  begin
    dmMain.InitAdditionalUpdateTable('MED.TKARTCOMPOS');
//    if (dmMain.ConfigParams.GetParamValue('FUNC_USE_RPO_DIFF', 0) = 1) then // если производство с типом, апдейтим тип
//    begin
//      dmMain.AddAdditionalUpdateTable('FK_PRODUCE_TYPE', otInteger, PRODUCE_TYPE_NSP_ID);
//    end;
    dmMain.AddAdditionalUpdateTable('FK_TREB_ID', otInteger, grTrebMedicDBTableView1_FK_TREBID.EditValue);
    dmMain.ExecuteAdditionalUpdateTable('FK_ID', otInteger, Res); // связываем производство и требование
  end; 
end;

end.
