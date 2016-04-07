unit fInvEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Math,
  Dialogs, ComCtrls, ToolWin, ActnList, Oracle, OracleMonitor, DB, OracleData, cxStyles, cxGraphics, cxEdit, cxTextEdit, cxDBLookupComboBox,
  cxCalendar, cxVGrid, cxDBVGrid, cxControls, cxInplaceContainer, cxCheckComboBox, cxDropDownEdit, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxCheckBox, ExtCtrls, cxPC, JvComponentBase, JvFormPlacement, cxGridBandedTableView, cxGridDBBandedTableView, cxCurrencyEdit, cxSpinEdit,
  cxMemo, cxRichEdit, dxmdaset, Menus;

type
  TfrmInvEdit = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    al: TActionList;
    acSave: TAction;
    acCancel: TAction;
    ToolButton2: TToolButton;
    grdInvEdit: TcxDBVerticalGrid;
    grdInvEditFC_DOCNUM: TcxDBEditorRow;
    grdInvEditFD_DATA1: TcxDBEditorRow;
    grdInvEditFD_DATA2: TcxDBEditorRow;
    grdInvEditMATOTVID: TcxDBEditorRow;
    grdInvEditFD_DT_BEG: TcxDBEditorRow;
    grdInvEditFD_DT_END: TcxDBEditorRow;
    grdInvEditFN_TYPE: TcxDBEditorRow;
    grdInvEditPrikaz: TcxDBMultiEditorRow;
    grdInvEditFK_FINSOURCE_ID: TcxDBEditorRow;
    odsInvEdit: TOracleDataSet;
    dsInvEdit: TDataSource;
    acRefresh: TAction;
    odsInvTypes: TOracleDataSet;
    dsInvTypes: TDataSource;
    odsTFinSource: TOracleDataSet;
    dsTFinSource: TDataSource;
    grdGroupsTVSpirts: TcxGridDBTableView;
    grdGroupsLvlSpirt: TcxGridLevel;
    grdGroups: TcxGrid;
    dsSpirtList: TDataSource;
    grdGroupsTVSpirtsFC_UCHGR: TcxGridDBColumn;
    odsSpirtList: TOracleDataSet;
    grdGroupsTVSpirtscFL_CHECK: TcxGridDBColumn;
    pcInvInfo: TcxPageControl;
    tsSpirt: TcxTabSheet;
    tsDeficit: TcxTabSheet;
    pcInventory: TcxPageControl;
    tsInventory: TcxTabSheet;
    tsOpis: TcxTabSheet;
    pnlInvInfo: TPanel;
    grdGroupsTVDeficit: TcxGridDBTableView;
    grdGroupsLvlDeficit: TcxGridLevel;
    Splitter1: TSplitter;
    tsNarc: TcxTabSheet;
    odsDeficit: TOracleDataSet;
    dsDeficit: TDataSource;
    grdGroupsLvlNarc: TcxGridLevel;
    grdGroupsTVNarc: TcxGridDBTableView;
    grdGroupsTVDeficitFL_CHECK: TcxGridDBColumn;
    grdGroupsTVDeficitFC_UCHGR: TcxGridDBColumn;
    grdGroupsTVDeficitUCHGRID: TcxGridDBColumn;
    grdGroupsTVSpirtsUCHGRID: TcxGridDBColumn;
    odsNarc: TOracleDataSet;
    dsNarc: TDataSource;
    grdGroupsTVNarcFL_CHECK: TcxGridDBColumn;
    grdGroupsTVNarcFC_UCHGR: TcxGridDBColumn;
    grdGroupsTVNarcUCHGRID: TcxGridDBColumn;
    grdOpis: TcxGrid;
    grdInvEditCategoryProp: TcxCategoryRow;
    grdInvEditCategoryComission: TcxCategoryRow;
    grdInvEditDBEditorFC_PREDS: TcxDBEditorRow;
    grdInvEditDBEditorFC_CHLEN1: TcxDBEditorRow;
    grdInvEditDBEditorFC_CHLEN2: TcxDBEditorRow;
    grdInvEditDBEditorFC_CHLEN3: TcxDBEditorRow;
    grdInvEditCategorySignature: TcxCategoryRow;
    grdInvEditDBEditorFL_EDIT: TcxDBEditorRow;
    grdInvEditDBEditorFC_SIGNED_BY_MO: TcxDBEditorRow;
    grdInvEditDBEditorFD_SIGNED: TcxDBEditorRow;
    odsMOGroups: TOracleDataSet;
    dsMOGroups: TDataSource;
    JvFormStorage1: TJvFormStorage;
    tlbOpis: TToolBar;
    acCalcOpis: TAction;
    acClearOpis: TAction;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    odsOpis: TOracleDataSet;
    dsOpis: TDataSource;
    grdOpisLvl: TcxGridLevel;
    grdOpisDBBandedTV: TcxGridDBBandedTableView;
    grdOpisDBBandedTVFC_NAME: TcxGridDBBandedColumn;
    grdOpisDBBandedTVFC_EDIZM: TcxGridDBBandedColumn;
    grdOpisDBBandedTVFC_INVNUM: TcxGridDBBandedColumn;
    grdOpisDBBandedTVFC_OKEI: TcxGridDBBandedColumn;
    grdOpisDBBandedTVFN_PRICE: TcxGridDBBandedColumn;
    grdOpisDBBandedTVFN_FACTKOL: TcxGridDBBandedColumn;
    grdOpisDBBandedTVFN_FACTSUM: TcxGridDBBandedColumn;
    grdOpisDBBandedTVFN_BUHKOL: TcxGridDBBandedColumn;
    grdOpisDBBandedTVFN_BUHPRICE: TcxGridDBBandedColumn;
    grdGroupsTVSpirtsFC_SKLAD: TcxGridDBColumn;
    grdGroupsTVNarcFC_SKLAD: TcxGridDBColumn;
    grdGroupsTVDeficitFC_SKLAD: TcxGridDBColumn;
    grdOpisDBBandedTVFC_UCHGR_PATH: TcxGridDBBandedColumn;
    tsAttendsPeoples: TcxTabSheet;
    grdGroupsLvlAttendsPeoples: TcxGridLevel;
    grdGroupsTVAttendsPeoples: TcxGridDBTableView;
    odsAttendPeoples: TOracleDataSet;
    dsAttendPeoples: TDataSource;
    grdGroupsTVAttendsPeoplesFC_POST: TcxGridDBColumn;
    grdGroupsTVAttendsPeoplesFC_FIO: TcxGridDBColumn;
    mdAttendsPeoples: TdxMemData;
    acAttPeoplesAddByManual: TAction;
    tlbAttendsPeoples: TToolBar;
    btnAttPeopleAdd: TToolButton;
    acAttPeoplesDel: TAction;
    acAttPeopleAddByLPU: TAction;
    pmAttPeopleAdd: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    sepAtendPeopleDel: TToolButton;
    btnAttPeoplesDel: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acSaveExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    procedure odsSpirtListApplyRecord(Sender: TOracleDataSet; Action: Char; var Applied: Boolean; var NewRowId: string);
    procedure pcInvInfoPageChanging(Sender: TObject; NewPage: TcxTabSheet; var AllowChange: Boolean);
    procedure alUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure grdInvEditDrawValue(Sender: TObject; ACanvas: TcxCanvas; APainter: TcxvgPainter; AValueInfo: TcxRowValueInfo;
      var Done: Boolean);
    procedure acCalcOpisExecute(Sender: TObject);
    procedure acClearOpisExecute(Sender: TObject);
    procedure odsOpisBeforePost(DataSet: TDataSet);
    procedure grdOpisDBBandedTVFN_FACTKOLPropertiesEditValueChanged(Sender: TObject);
    procedure acAttPeoplesAddByManualExecute(Sender: TObject);
    procedure acAttPeoplesDelExecute(Sender: TObject);
    procedure acAttPeopleAddByLPUExecute(Sender: TObject);
  private
    { Private declarations }
    fInvListId : Integer;
    fIsReadOnly : Boolean;

    procedure SetReadOnly ( AValue : Boolean );
    procedure OpenLookupDatasets;
    procedure SetCaption;
    function DoCreateInventory : integer;
    function DoCheckOk : Boolean;
    function DoSave : Boolean;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent; AInvListId : Integer = -1 );

    property InvListId : Integer read fInvListId;
    property IsReadOnly : Boolean read fIsReadOnly write SetReadOnly ;
  end;

  const
    cErrOnDSOpening = 'Ошибка при открытии датасета %s';
    cErrorEmptyField = 'Не заполнено обязательное поле "%s"!';
    clReadOnly =  $00CAFFFF;

function DoInventoryEdit ( var AInvListId : Integer; AFL_EDIT : Boolean = True ) : Boolean;

implementation

{$R *.dfm}

uses fdmMain, fSelectSotr;

function DoInventoryEdit ( var AInvListId : Integer; AFL_EDIT : Boolean = True ) : Boolean;
var
  frmInvEdit: TfrmInvEdit;
  fLockId, fLockStr : string;
  IsUseLock : Boolean;
begin
  Result := False;
  fLockId := EmptyStr;
  fLockStr := EmptyStr;
  IsUseLock := (AInvListId > 0) and (AFL_EDIT);

  if IsUseLock then
  case dmMain.SetLock( 'MED.TINVLIST.INVLISTID='+IntTOStr(AInvListId),  fLockId, fLockStr ) of
    0 : ;
    else
    begin
      Application.MessageBox(PAnsiChar('Выбранный документ уже редактируется другим сотрудником:'#13#10 + fLockStr), 'Внимание', MB_OK+MB_ICONWARNING);
      Exit;
    end;
  end;

  frmInvEdit := TfrmInvEdit.Create(Application, AInvListId ) ;

  try
    Result := (frmInvEdit.ShowModal = mrOk);
    AInvListId :=  frmInvEdit.InvListId;
  finally
    if IsUseLock then
      dmMain.SetUnLock(fLockId);

    frmInvEdit.Free;
  end;
end;

procedure TfrmInvEdit.acAttPeopleAddByLPUExecute(Sender: TObject);
var
  frmSelectSotr: TfrmSelectSotr;
begin
  frmSelectSotr := TfrmSelectSotr.Create(Self);
  try
    if frmSelectSotr.ShowModal = mrOk then
    begin
      grdGroupsTVAttendsPeoples.DataController.DataSet.Append;
      grdGroupsTVAttendsPeoples.DataController.DataSet.FieldByName( 'FC_POST' ).AsString := frmSelectSotr.odsSotr.FieldByName('FC_POST').AsString;
      grdGroupsTVAttendsPeoples.DataController.DataSet.FieldByName( 'FC_FIO' ).AsString := frmSelectSotr.odsSotr.FieldByName('FC_NAME').AsString;
      grdGroupsTVAttendsPeoples.Controller.EditingController.ShowEdit;
    end;
  finally
    frmSelectSotr.Free;
  end;
end;

procedure TfrmInvEdit.acAttPeoplesAddByManualExecute(Sender: TObject);
begin
  grdGroupsTVAttendsPeoples.DataController.DataSet.Append;
  grdGroupsTVAttendsPeoples.Controller.EditingController.ShowEdit;
end;

procedure TfrmInvEdit.acAttPeoplesDelExecute(Sender: TObject);
begin
  if (Application.MessageBox ( PAnsiChar('Удалить запись из списка ?'), MSG_CATION_QUESTION, MB_YESNO + MB_ICONQUESTION ) = mrYes) then
  begin
    grdGroupsTVAttendsPeoples.DataController.DeleteFocused;
  end;
end;

procedure TfrmInvEdit.acCalcOpisExecute(Sender: TObject);
begin
  try
    if not DoSave then
      Exit;
    dmMain.pkgInvOpis.GEN( fInvListId );

    acRefresh.Execute;
  except
    on e : Exception do
    begin
      Application.MessageBox( PAnsiChar( 'Ошибка при формировании описи!' + #13#10 + e.Message ), MSG_CAPTION_ERROR, MB_OK + MB_ICONERROR );
      Exit;
    end;
  end;
end;

procedure TfrmInvEdit.acCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;                          

procedure TfrmInvEdit.acClearOpisExecute(Sender: TObject);
begin
  try
    if not DoSave then
      Exit;

    dmMain.pkgInvOpis.DOOPISCLEAR ( fInvListId );

    acRefresh.Execute;
  except
    on e : Exception do
    begin
      Application.MessageBox( PAnsiChar( 'Ошибка при формировании описи!' + #13#10 + e.Message ), MSG_CAPTION_ERROR, MB_OK + MB_ICONERROR );
      Exit;
    end;
  end;
end;

procedure TfrmInvEdit.acRefreshExecute(Sender: TObject);
begin
  try
    odsInvEdit.Close;
    odsInvEdit.SetVariable( 'PINVLISTID', fInvListId );
    odsInvEdit.Open;

    if not odsInvEdit.IsEmpty then
      IsReadOnly := (odsInvEdit.FieldByName( 'FL_EDIT' ).AsInteger = 0)
    else
    begin
      Application.MessageBox( PAnsiChar( 'Не существует такая запись в БД!'), MSG_CAPTION_ERROR, MB_OK + MB_ICONERROR );
      Close;
      Exit;
    end;

  except
    on e : Exception do
    begin
      Application.MessageBox( PAnsiChar( Format ( cErrOnDSOpening, [odsInvEdit.Name] ) + #13#10 + e.Message ),
        PAnsiChar ( MSG_CAPTION_ERROR ), MB_OK + MB_ICONERROR );
      Exit;
    end;
  end;

  try
    odsSpirtList.Close;
    odsSpirtList.SetVariable( 'PINVLISTID', fInvListId );
    odsSpirtList.Open;
  except
    on e : Exception do
    begin
      Application.MessageBox( PAnsiChar( Format ( cErrOnDSOpening, [odsSpirtList.Name] ) + #13#10 + e.Message ),
        PAnsiChar ( MSG_CAPTION_ERROR ), MB_OK + MB_ICONERROR );
      Exit;
    end;
  end;

  try
    odsDeficit.Close;
    odsDeficit.SetVariable( 'PINVLISTID', fInvListId );
    odsDeficit.Open;
  except
    on e : Exception do
    begin
      Application.MessageBox( PAnsiChar( Format ( cErrOnDSOpening, [odsDeficit.Name] ) + #13#10 + e.Message ),
        PAnsiChar ( MSG_CAPTION_ERROR ), MB_OK + MB_ICONERROR );
      Exit;
    end;
  end;

  try
    odsNarc.Close;
    odsNarc.SetVariable( 'PINVLISTID', fInvListId );
    odsNarc.Open;
  except
    on e : Exception do
    begin
      Application.MessageBox( PAnsiChar( Format ( cErrOnDSOpening, [odsNarc.Name] ) + #13#10 + e.Message ),
        PAnsiChar ( MSG_CAPTION_ERROR ), MB_OK + MB_ICONERROR );
      Exit;
    end;
  end;

  try
    odsOpis.Close;
    odsOpis.SetVariable( 'PINVLISTID', fInvListId );
    odsOpis.Open;
  except
    on e : Exception do
    begin
      Application.MessageBox( PAnsiChar( Format ( cErrOnDSOpening, [odsOpis.Name] ) + #13#10 + e.Message ),
        PAnsiChar ( MSG_CAPTION_ERROR ), MB_OK + MB_ICONERROR );
      Exit;
    end;
  end;

  try
    odsAttendPeoples.Close;
    odsAttendPeoples.SetVariable( 'PINVLISTID', fInvListId );
    odsAttendPeoples.Open;

    mdAttendsPeoples.Close;
    mdAttendsPeoples.LoadFromDataSet( odsAttendPeoples ); // напрямую с датасетом не работаем
  except
    on e : Exception do
    begin
      Application.MessageBox( PAnsiChar( Format ( cErrOnDSOpening, [odsAttendPeoples.Name] ) + #13#10 + e.Message ),
        PAnsiChar ( MSG_CAPTION_ERROR ), MB_OK + MB_ICONERROR );
      Exit;
    end;
  end;    

end;

procedure TfrmInvEdit.acSaveExecute(Sender: TObject);
begin
  if not DoSave then
    Exit;

  dmMain.os.Commit;
  ModalResult := mrOk;
end;

procedure TfrmInvEdit.alUpdate(Action: TBasicAction; var Handled: Boolean);
begin
  acSave.Enabled := (not fIsReadOnly);

  acCalcOpis.Enabled := (not fIsReadOnly);
  acClearOpis.Enabled := (not fIsReadOnly);

  acAttPeoplesAddByManual.Enabled := (not fIsReadOnly) and (pcInvInfo.ActivePage.Name = 'tsAttendsPeoples');
  acAttPeopleAddByLPU.Enabled := acAttPeoplesAddByManual.Enabled;

  acAttPeoplesDel.Enabled := (not fIsReadOnly) and (pcInvInfo.ActivePage.Name = 'tsAttendsPeoples') and
    ( Assigned (grdGroupsTVAttendsPeoples.Controller.FocusedRecord) );          
end;

constructor TfrmInvEdit.Create(AOwner: TComponent; AInvListId: Integer);
begin
  fInvListId := AInvListId;

  if not ( fInvListId > 0 ) then
   fInvListId := DoCreateInventory;  

  inherited Create ( AOwner );
end;

function TfrmInvEdit.DoCheckOk: Boolean;
begin
  Result := True;

  grdInvEdit.HideEdit;

  if Trim( odsInvEdit.FieldByName ( 'FC_DOCNUM' ).AsString ) = EmptyStr then
  begin
    Application.MessageBox( PAnsiChar( Format( cErrorEmptyField, [grdInvEditFC_DOCNUM.Properties.Caption ] ) ) , MSG_CAPTION_ERROR, MB_OK + MB_ICONERROR );
    Result := False;
    Exit;
  end;

  if odsInvEdit.FieldByName ( 'FN_TYPE' ).IsNull   then
  begin
    Application.MessageBox( PAnsiChar( Format( cErrorEmptyField, [grdInvEditFN_TYPE.Properties.Caption ] ) ) , MSG_CAPTION_ERROR, MB_OK + MB_ICONERROR );
    Result := False;
    Exit;
  end;

  if odsInvEdit.FieldByName ( 'FD_DATA1' ).IsNull   then
  begin
    Application.MessageBox( PAnsiChar( Format( cErrorEmptyField, [grdInvEditFD_DATA1.Properties.Caption ] ) ) , MSG_CAPTION_ERROR, MB_OK + MB_ICONERROR );
    Result := False;
    Exit;
  end;

  if odsInvEdit.FieldByName ( 'FD_DATA2' ).IsNull   then
  begin
    Application.MessageBox( PAnsiChar( Format( cErrorEmptyField, [grdInvEditFD_DATA2.Properties.Caption ] ) ) , MSG_CAPTION_ERROR, MB_OK + MB_ICONERROR );
    Result := False;
    Exit;
  end;

  if odsInvEdit.FieldByName ( 'MATOTVID' ).IsNull   then
  begin
    Application.MessageBox( PAnsiChar( Format( cErrorEmptyField, [grdInvEditMATOTVID.Properties.Caption ] ) ) , MSG_CAPTION_ERROR, MB_OK + MB_ICONERROR );
    Result := False;
    Exit;
  end;

//  if odsInvEdit.FieldByName ( 'FK_FINSOURCE_ID' ).IsNull   then
//  begin
//    Application.MessageBox( PAnsiChar( Format( cErrorEmptyField, [grdInvEditFK_FINSOURCE_ID.Properties.Caption ] ) ) , MSG_CAPTION_ERROR, MB_OK + MB_ICONERROR );
//    Result := False;
//    Exit;
//  end;

  if odsInvEdit.FieldByName ( 'FD_DT_BEG' ).IsNull   then
  begin
    Application.MessageBox( PAnsiChar( Format( cErrorEmptyField, [grdInvEditFD_DT_BEG.Properties.Caption ] ) ) , MSG_CAPTION_ERROR, MB_OK + MB_ICONERROR );
    Result := False;
    Exit;
  end;

  if odsInvEdit.FieldByName ( 'FD_DT_END' ).IsNull   then
  begin
    Application.MessageBox( PAnsiChar( Format( cErrorEmptyField, [grdInvEditFD_DT_END.Properties.Caption ] ) ) , MSG_CAPTION_ERROR, MB_OK + MB_ICONERROR );
    Result := False;
    Exit;
  end;

  if Trim( odsInvEdit.FieldByName ( 'FC_NMB_PRIKAZ' ).AsString ) = EmptyStr then
  begin
    Application.MessageBox( PAnsiChar( Format( cErrorEmptyField, [grdInvEditPrikaz.Properties.Editors[0].Caption ] ) ) , MSG_CAPTION_ERROR, MB_OK + MB_ICONERROR );
    Result := False;
    Exit;
  end;

  if odsInvEdit.FieldByName ( 'FD_DAT_PRIKAZ' ).IsNull   then
  begin
    Application.MessageBox( PAnsiChar( Format( cErrorEmptyField, [grdInvEditPrikaz.Properties.Editors[1].Caption ] ) ) , MSG_CAPTION_ERROR, MB_OK + MB_ICONERROR );
    Result := False;
    Exit;
  end;

  if (odsInvEdit.FieldByName ( 'FD_DATA1' ).AsDateTime > odsInvEdit.FieldByName ( 'FD_DATA2' ).AsDateTime) then
  begin
    Application.MessageBox( PAnsiChar( 'Неправильно указан период проведения инвентаризации!' ) , MSG_CAPTION_ERROR, MB_OK + MB_ICONERROR );
    Result := False;
    Exit;
  end;

  if (odsInvEdit.FieldByName ( 'FD_DT_BEG' ).AsDateTime > odsInvEdit.FieldByName ( 'FD_DT_END' ).AsDateTime) then
  begin
    Application.MessageBox( PAnsiChar( 'Неправильно указан отчетный период!' ) , MSG_CAPTION_ERROR, MB_OK + MB_ICONERROR );
    Result := False;
    Exit;
  end;

  if (odsInvEdit.FieldByName ( 'FD_DATA1' ).AsDateTime < odsInvEdit.FieldByName ( 'FD_DT_END' ).AsDateTime) then
  begin
    Application.MessageBox( PAnsiChar( 'Дата начала проведения инвентаризации не может быть раньше даты окончания отчетного периода!' ) , MSG_CAPTION_ERROR, MB_OK + MB_ICONERROR );
    Result := False;
    Exit;
  end;      
end;

function TfrmInvEdit.DoCreateInventory: integer;
begin
  try
    Result := dmMain.pkgInvOpis.CREATESHABLON;
  except
    on e : Exception do
    begin
      Result := -1;
      Application.MessageBox( PAnsiChar( 'Ошибка при добавлении инвентаризации!' +#13#10 + e.Message ), MSG_CAPTION_ERROR, MB_OK + MB_ICONERROR );
    end;
  end;
end;

function TfrmInvEdit.DoSave: Boolean;
  procedure SetUchGroupsOraObj ( AObj : TOracleObject; ADataSet : TOracleDataSet );
  var
    i : integer;
  begin
    ADataSet.First;
    for  i := 0 to  min (ADataSet.RecordCount, 200 ) - 1 do { тип MED.ARRAY200_OF_INT рассчитан на 200 эл-тов }
    begin

      if (ADataSet.FieldByName( 'FL_CHECK' ).AsInteger = 1) then
      begin
        AObj.Elements [ AObj.ElementCount ] := ADataSet.FieldByName( 'UCHGRID' ).AsInteger;
      end;

      ADataSet.Next;
    end;
  end;

  procedure SetAttendPeoples ( AObj : TOracleObject );
  var
    i : integer;
    fRecObj : TOracleObject;
  begin
    fRecObj := TOracleObject.Create( dmMain.os, 'MED.O_FC_POST_FIO_SOTR ', '' );
    try
      mdAttendsPeoples.First;

      for i := 0 to min (mdAttendsPeoples.RecordCount, 200 ) - 1 do { тип MED.ARRAY200_OF_POST_FIO_SOTR рассчитан на 200 эл-тов }
      begin
        fRecObj.SetAttr( 'FC_POST', Trim(mdAttendsPeoples.FieldByName ( 'FC_POST' ).AsString) );
        fRecObj.SetAttr( 'FC_FIO', Trim(mdAttendsPeoples.FieldByName ( 'FC_FIO' ).AsString) );
        AObj.ObjElements[ i ]  := fRecObj;

        mdAttendsPeoples.Next;
      end;                    
    finally
      FreeAndNil( fRecObj );
    end;
  end;                                                                                  
var
  fArrSpirtGr, fArrDeficitGr, fArrNarcGr, fArrAttenPeople : TOracleObject;
  i : Integer;
begin
  Result := DoCheckOk; // проверка полей

  if not Result then
    Exit;

  try
    // инвентаризация
    grdInvEdit.HideEdit;

    fArrSpirtGr := TOracleObject.Create( dmMain.os, 'MED.ARRAY200_OF_INT', '' );
    fArrNarcGr := TOracleObject.Create( dmMain.os, 'MED.ARRAY200_OF_INT', '' );
    fArrDeficitGr := TOracleObject.Create( dmMain.os, 'MED.ARRAY200_OF_INT', '' );
    fArrAttenPeople := TOracleObject.Create( dmMain.os, 'MED.ARRAY200_OF_POST_FIO_SOTR', '' );
    // заполнение объектов
    SetUchGroupsOraObj ( fArrSpirtGr, odsSpirtList );
    SetUchGroupsOraObj ( fArrDeficitGr, odsDeficit );
    SetUchGroupsOraObj ( fArrNarcGr, odsNarc );
    SetAttendPeoples ( fArrAttenPeople );

    try     // do_set
      dmMain.pkgInvOpis.DOSET( fInvListId , odsInvEdit.FieldByName( 'MATOTVID' ).AsInteger, Trim(odsInvEdit.FieldByName( 'FC_DOCNUM' ).AsString),
        odsInvEdit.FieldByName( 'FD_DATA1' ).AsDateTime, odsInvEdit.FieldByName( 'FD_DATA2' ).AsDateTime, Trim(odsInvEdit.FieldByName( 'FC_PREDS' ).AsString),
        Trim(odsInvEdit.FieldByName( 'FC_CHLEN1' ).AsString), Trim(odsInvEdit.FieldByName( 'FC_CHLEN2' ).AsString), Trim(odsInvEdit.FieldByName( 'FC_CHLEN3' ).AsString),
        odsInvEdit.FieldByName( 'FN_TYPE' ).AsInteger, odsInvEdit.FieldByName( 'FD_DT_BEG' ).AsDateTime, odsInvEdit.FieldByName( 'FD_DT_END' ).AsDateTime,
        odsInvEdit.FieldByName( 'FD_DAT_PRIKAZ' ).AsDateTime, Trim(odsInvEdit.FieldByName( 'FC_NMB_PRIKAZ' ).AsString), odsInvEdit.FieldByName( 'FK_FINSOURCE_ID' ).Value,
        fArrSpirtGr, fArrDeficitGr, fArrNarcGr, fArrAttenPeople );

    except
      on e : Exception do
      begin
        Result := false;
        Application.MessageBox( PAnsiChar( 'Ошибка при сохранении данных!' + #13#10 + e.Message), MSG_CAPTION_ERROR, MB_OK + MB_ICONERROR );
      end;
    end;
  finally
    if Assigned(fArrSpirtGr)  then
      FreeAndNil( fArrSpirtGr );
    if Assigned(fArrNarcGr)  then
      FreeAndNil( fArrNarcGr );
    if Assigned(fArrDeficitGr)  then
      FreeAndNil( fArrDeficitGr );
    if Assigned(fArrAttenPeople)  then
      FreeAndNil(fArrAttenPeople);
  end;
end;

procedure TfrmInvEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmMain.os.Rollback;
  Action := caFree;
end;

procedure TfrmInvEdit.FormShow(Sender: TObject);
begin
  acRefresh.Execute;

  OpenLookupDatasets;

  SetCaption;

  pcInventory.ActivePage := tsInventory;
  pcInvInfo.ActivePage := tsSpirt;
end;

procedure TfrmInvEdit.grdInvEditDrawValue(Sender: TObject; ACanvas: TcxCanvas; APainter: TcxvgPainter; AValueInfo: TcxRowValueInfo;
  var Done: Boolean);
var
  i : Integer;  
begin
  OutputDebugString( PAnsiChar( AValueInfo.Row.Name  ));
  if (AValueInfo.Row is TcxDBEditorRow) then
  begin
    if ( fIsReadOnly) or   // только чтение
       // поля только на чтение
       ( AValueInfo.Row.Name = 'grdInvEditDBEditorFL_EDIT' ) or
       ( AValueInfo.Row.Name = 'grdInvEditDBEditorFC_SIGNED_BY_MO' ) or
       ( AValueInfo.Row.Name = 'grdInvEditDBEditorFD_SIGNED' ) or
       // если есть добавленные позиции документа, то часть полей не редактируется
       ( (odsInvEdit.FieldByName ( 'FN_OPIS_CNT' ).AsInteger > 0) and
         ( ( AValueInfo.Row.Name = 'grdInvEditMATOTVID' ) or
           ( AValueInfo.Row.Name = 'grdInvEditFK_FINSOURCE_ID' ) or
           ( AValueInfo.Row.Name = 'grdInvEditFD_DT_BEG' ) or
           ( AValueInfo.Row.Name = 'grdInvEditFD_DT_END' ) )
       )
     then
    begin
      (AValueInfo.Row as TcxDBEditorRow).Properties.Options.Editing := False;

      ACanvas.Brush.Color := clReadOnly;
    end
    else
      (AValueInfo.Row as TcxDBEditorRow).Properties.Options.Editing := True;
  end;

  if  (AValueInfo.Row is TcxDBMultiEditorRow) then
  begin
    for i := 0 to (AValueInfo.Row as TcxDBMultiEditorRow).Properties.Editors.Count - 1 do
    begin
      (AValueInfo.Row as TcxDBMultiEditorRow).Properties.Editors.Items[i].Options.Editing := not fIsReadOnly;
    end;

    if fIsReadOnly then
      ACanvas.Brush.Color := clReadOnly;           
  end;
end;

procedure TfrmInvEdit.grdOpisDBBandedTVFN_FACTKOLPropertiesEditValueChanged(Sender: TObject);
begin
  try
    grdOpisDBBandedTV.DataController.Post;
  except
    on e : Exception do
      Application.ShowException( e);
  end;
end;

procedure TfrmInvEdit.odsOpisBeforePost(DataSet: TDataSet);
begin
  odsOpis.FieldByName( 'FN_FACTSUM').AsFloat := odsOpis.FieldByName( 'FN_FACTKOL').AsFloat * odsOpis.FieldByName( 'FN_PRICE').AsFloat;
end;

procedure TfrmInvEdit.odsSpirtListApplyRecord(Sender: TOracleDataSet; Action: Char; var Applied: Boolean; var NewRowId: string);
begin
  Applied := True;
end;

procedure TfrmInvEdit.OpenLookupDatasets;
begin
  try
    odsInvTypes.Close;
    odsInvTypes.Open;
  except
    on e : Exception do
      Application.MessageBox( PAnsiChar( Format ( cErrOnDSOpening, [odsInvTypes.Name] ) + #13#10 + e.Message ),
        PAnsiChar ( MSG_CAPTION_ERROR ), MB_OK + MB_ICONERROR );
  end;

  try
    odsTFinSource.Close;
    odsTFinSource.Open;
  except
    on e : Exception do
      Application.MessageBox( PAnsiChar( Format ( cErrOnDSOpening, [odsTFinSource.Name] ) + #13#10 + e.Message ),
        PAnsiChar ( MSG_CAPTION_ERROR ), MB_OK + MB_ICONERROR );
  end;

  try
    odsMOGroups.Close;
    odsMOGroups.SetVariable( 'pFK_SOTRID', dmMain.nSotrFK_ID );
    odsMOGroups.Open;
  except
    on e : Exception do
      Application.MessageBox( PAnsiChar( Format ( cErrOnDSOpening, [odsMOGroups.Name] ) + #13#10 + e.Message ),
        PAnsiChar ( MSG_CAPTION_ERROR ), MB_OK + MB_ICONERROR );
  end;
end;

procedure TfrmInvEdit.pcInvInfoPageChanging(Sender: TObject; NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  tlbAttendsPeoples.Visible := (NewPage.Name = 'tsAttendsPeoples');

  if NewPage.Name = 'tsSpirt' then
    grdGroups.ActiveLevel := grdGroupsLvlSpirt
  else
  if NewPage.Name = 'tsDeficit' then
    grdGroups.ActiveLevel := grdGroupsLvlDeficit
  else
  if NewPage.Name = 'tsAttendsPeoples' then
    grdGroups.ActiveLevel := grdGroupsLvlAttendsPeoples
  else
    grdGroups.ActiveLevel := grdGroupsLvlNarc;
end;

procedure TfrmInvEdit.SetCaption;
begin
  if (odsInvEdit.Active) and (not odsInvEdit.IsEmpty) then
  begin
    if fIsReadOnly then
      Self.Caption := 'Просмотр инвентаризации №' + odsInvEdit.FieldByName('FC_DOCNUM').AsString
    else
      Self.Caption := 'Редактирование инвентаризации №' + odsInvEdit.FieldByName('FC_DOCNUM').AsString;
  end;
end;

procedure TfrmInvEdit.SetReadOnly(AValue: Boolean);
begin
  fIsReadOnly := AValue;

  grdInvEdit.OptionsData.Editing := not fIsReadOnly;
  grdOpisDBBandedTV.OptionsData.Editing := not fIsReadOnly;
  grdGroupsTVSpirts.OptionsData.Editing := not fIsReadOnly;
  grdGroupsTVDeficit.OptionsData.Editing := not fIsReadOnly;
  grdGroupsTVNarc.OptionsData.Editing := not fIsReadOnly;

  grdGroupsTVAttendsPeoples.OptionsData.Editing := not fIsReadOnly;
  grdGroupsTVAttendsPeoples.OptionsData.Deleting := grdGroupsTVAttendsPeoples.OptionsData.Editing;
  grdGroupsTVAttendsPeoples.OptionsData.Inserting := grdGroupsTVAttendsPeoples.OptionsData.Editing;
end;

end.
