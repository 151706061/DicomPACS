unit fTrebByNaz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, ExtCtrls, JvFormPlacement, ComCtrls, ToolWin, Db, OracleData,
  StdCtrls, DBCtrls,  JvComponentBase, Variants,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxMaskEdit, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxControls, cxGridCustomView, cxClasses, cxGridLevel,
  cxGrid, cxCalendar, cxTextEdit, cxContainer, cxDropDownEdit, cxSpinEdit,
  cxButtonEdit, cxSplitter, Oracle, cxGroupBox, fMainForm, cxLookAndFeelPainters, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  dxLayoutControl, Menus, cxCheckBox, JvExControls, JvArrowButton;

type
  TfrmTrebByNaz = class(TForm)
    FormStorage: TJvFormStorage;
    paAll: TPanel;
    al: TActionList;
    acSave: TAction;
    acCancel: TAction;
    CoolBar1: TCoolBar;
		ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    acRefresh: TAction;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    acSecret: TAction;
    acInsDPC: TAction;
    acEditDPC: TAction;
    acDelDPC: TAction;
    acFormDPC: TAction;
    odsNameFrom: TOracleDataSet;
    dsNameFrom: TDataSource;
    odsNameTo: TOracleDataSet;
    dsNameTo: TDataSource;
		odsMedTreb_Naz: TOracleDataSet;
    dsMedTreb_Naz: TDataSource;
    dsMO_GroupFrom: TDataSource;
    odsMO_GroupFrom: TOracleDataSet;
    odsMO_GroupTo: TOracleDataSet;
    dsMO_GroupTo: TDataSource;
    odsGetMedicIdByNazMedicID: TOracleDataSet;
    oqSaveMedicLink: TOracleQuery;
    paCaption: TPanel;
    LCBTo: TDBLookupComboBox;
    lcbFrom: TDBLookupComboBox;
    deNumTreb: TEdit;
    deRegisterDate: TcxDateEdit;
    lcbMO_GroupFrom: TDBLookupComboBox;
    lcbMO_GroupTo: TDBLookupComboBox;
    mComment: TEdit;
    paTreb: TPanel;
    CoolBar2: TCoolBar;
    tbTreb: TToolBar;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    grMedTreb: TcxGrid;
    grMedTrebDBTableView1: TcxGridDBTableView;
    grMedTrebDBTableView1ROWNUM1: TcxGridDBColumn;
    grMedTrebDBTableView1FK_TREB: TcxGridDBColumn;
    grMedTrebDBTableView1FK_NAZN_MEDIC_NAME: TcxGridDBColumn;
    grMedTrebDBTableView1FC_NAZN_MEDIC_NAME: TcxGridDBColumn;
    grMedTrebDBTableView1FN_NAZNKOL_F: TcxGridDBColumn;
    grMedTrebDBTableView1FC_NAZN_EI: TcxGridDBColumn;
    grMedTrebDBTableView1FC_MEDIC: TcxGridDBColumn;
    grMedTrebDBTableView1FN_TREBKOL: TcxGridDBColumn;
    grMedTrebDBTableView1FC_EDIZM_U: TcxGridDBColumn;
    grMedTrebDBTableView1FK_NAZMEDLECHID: TcxGridDBColumn;
    grMedTrebDBTableView1FK_ID: TcxGridDBColumn;
    grMedTrebLevel1: TcxGridLevel;
    lcbFinSource: TDBLookupComboBox;
    lcCaptionGroup_Root: TdxLayoutGroup;
    lcCaption: TdxLayoutControl;
    lcCaption_mComment: TdxLayoutItem;
    lcCaption_lcbFinSource: TdxLayoutItem;
    lcCaptionItem3: TdxLayoutItem;
    lcCaptionItem4: TdxLayoutItem;
    lcCaptionItem5: TdxLayoutItem;
    lcCaptionItem6: TdxLayoutItem;
    lcCaptionGroupFrom: TdxLayoutGroup;
    lcCaptionItem7: TdxLayoutItem;
    lcCaptionItem8: TdxLayoutItem;
    lcCaptionGroupTreb: TdxLayoutGroup;
    lcCaptionGroup1: TdxLayoutGroup;
    lcCaptionGroup2: TdxLayoutGroup;
    procedure acCancelExecute(Sender: TObject);
    procedure acSaveExecute(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    procedure acSecretExecute(Sender: TObject);
    procedure acInsDPCExecute(Sender: TObject);
    procedure acDelDPCExecute(Sender: TObject);
    procedure acEditDPCExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acFormDPCExecute(Sender: TObject);
    procedure grMedTrebDblClick(Sender: TObject);
    procedure odsMedTrebAfterScroll(DataSet: TDataSet);
    procedure lcbFromClick(Sender: TObject);
    procedure grNazPacEnter(Sender: TObject);
    procedure LCBToClick(Sender: TObject);
    procedure grNazPacDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure grNaznListDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure grMedTrebDBTableView1FN_TREBKOL1PropertiesEditValueChanged(
      Sender: TObject);
    procedure deRegisterDatePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
//    procedure grMedTrebDBTableView1DragDrop(Sender, Source: TObject; X,
//      Y: Integer);
//    procedure grMedTrebDBTableView1DragOver(Sender, Source: TObject; X,
//      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure grMedTrebDBTableView1FC_MEDICPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure lcbMO_GroupToCloseUp(Sender: TObject);
    procedure LCBToKeyPress(Sender: TObject; var Key: Char);
    procedure alUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure lcbMO_GroupFromCloseUp(Sender: TObject);
    procedure odsMedTreb_NazAfterOpen(DataSet: TDataSet);
	private
		FidDocs: Integer;
		FidTreb: Integer;
//    fIsRefreshed : Boolean;
//    FDrawNazListCount, FDrawNazPacCount : Integer;  // отладочные счетчики количества перерисовок
//    FClearNazList, FClearNazPac : Boolean;  // флаги очистки списка назначений и пациентов соответственно
		procedure SetidTreb(const Value: Integer);
		{ Private declarations }
	public
		{ Public declarations }
		property idDocs: Integer read FidDocs write FidDocs;

		property idTreb: Integer read FidTreb write SetidTreb;

	end;


implementation

uses fdmMain, JvDBUtils, fMedic, fNaznList;

{$R *.DFM}

procedure TfrmTrebByNaz.acCancelExecute(Sender: TObject);
begin
	LCBFrom.CloseUp(False);
	ModalResult := mrCancel;
end;

procedure TfrmTrebByNaz.acSaveExecute(Sender: TObject);
begin
	if deRegisterDate.Date = NullDate then
	begin
		MessageBox(Self.Handle, PChar('Необходимо ввести правильную дату регистрации документа!'),
			'Ошибка', MB_OK + mb_iconerror);
		deRegisterDate.SetFocus;
		Exit;
	end;
  if VarIsNull ( LCBFrom.KeyValue ) or ( Trim( LCBFrom.Text ) = EmptyStr ) then
  begin
    LCBFrom.SetFocus;
    Application.MessageBox(PChar('Вы не выбрали "От кого" требование!'), 'Ошибка', MB_OK + mb_iconerror);
    exit;
  end;
  if VarIsNull (LCBTo.KeyValue ) or  ( Trim (LCBTo.Text) = EmptyStr )  then
  begin
    LCBTo.SetFocus;
    Application.MessageBox(PChar('Вы не выбрали "Кому" требование!'), 'Ошибка', MB_OK + mb_iconerror);
    exit;
  end;
	if VarIsNull(lcbMO_GroupFrom.KeyValue) or ( Trim(lcbMO_GroupFrom.Text) = EmptyStr )  then
	begin
		lcbMO_GroupFrom.SetFocus;
		MessageBox(Self.Handle, PChar('Вы не выбрали "Откуда" требование!'), 'Ошибка', MB_OK + mb_iconerror);
		exit;
  end;
  if VarIsNull(lcbMO_GroupTo.KeyValue) or ( Trim ( lcbMO_GroupTo.Text) = EmptyStr ) then
  begin
    lcbMO_GroupTo.SetFocus;
		MessageBox(Self.Handle, PChar('Вы не выбрали "Куда" требование!'), 'Ошибка', MB_OK + mb_iconerror);
    exit;
  end;
  if lcbMO_GroupFrom.KeyValue = lcbMO_GroupTo.KeyValue then
  begin
		LCBTo.SetFocus;
    MessageBox(Self.Handle, PChar('Невозможно формировать требование внутри отделения!'), 'Ошибка', MB_OK + mb_iconerror);
    exit;
  end;

  if (dmMain.ConfigParams.GetParamValue('FUNC_REQUIRE_FINSOURCE_IN_TREB', 0)=1) then
  begin
    if VarIsNull( lcbFinSource.KeyValue ) or ( Trim (lcbFinSource.Text) = EmptyStr  ) then
    begin
      lcbFinSource.SetFocus;
      Application.MessageBox(PChar('Необходимо указать источник финансирования'), 'Ошибка', MB_OK + mb_iconerror);
      exit;
    end;
  end;
  
  //grNaznList2.SetFocus; // фикс access violation при вводе цифры при помощи спинэдита и нажатия кнопки сохранить Воронов О.А. 10.06.2008
//  grMedTrebDBTableView1.DataController.PostEditingData;
  if odsMedTreb_Naz.State = dsEdit then
    odsMedTreb_Naz.Post;
  odsMedTreb_Naz.First;
  while (not odsMedTreb_Naz.Eof)and(odsMedTreb_Naz.FieldByName('FC_MEDIC').IsNull = False) do
    odsMedTreb_Naz.Next;

  if (not odsMedTreb_Naz.Eof) then
  begin
    Application.MessageBox(PAnsiChar('Для назначенного препарата "'+odsMedTreb_Naz.FieldByName('FC_NAZN_MEDIC_NAME').AsString+'" не сопоставлен медикамент из справочника.'#13#10+
                                     'Необходимо указать медикамент из справочника или удалить назначенный препарат из списка!'),'Внимание', MB_OK+MB_ICONWARNING );
    grMedTreb.SetFocus;
    Exit;
  end;
  if odsMedTreb_Naz.RecordCount = 0 then
  begin
    Application.MessageBox('Для формирования требования не указано ни одного медикамента.','Внимание', MB_OK+MB_ICONWARNING );
    Exit;
  end;

  ModalResult := mrok;
end;

procedure TfrmTrebByNaz.acRefreshExecute(Sender: TObject);
begin        
  try
    odsMedTreb_Naz.Close;
    odsMedTreb_Naz.Open;
  except
    on e : Exception do
      Application.MessageBox( PAnsiChar( 'Ошибка при получении позиций требования!' + #13#10 + e.Message ), 'Ошибка', MB_OK + MB_ICONERROR );
  end;
end;

procedure TfrmTrebByNaz.acSecretExecute(Sender: TObject);
begin
  deRegisterDate.Enabled := True;
end;

procedure TfrmTrebByNaz.alUpdate(Action: TBasicAction; var Handled: Boolean);
begin                                                                        
  acEditDPC.Enabled := Assigned(odsMedTreb_Naz) and (odsMedTreb_Naz.Active) and (not odsMedTreb_Naz.IsEmpty)
    and ( grMedTrebDBTableView1.DataController.FocusedRowIndex >= 0 );

	acDelDPC.Enabled := acEditDPC.Enabled;
end;

procedure TfrmTrebByNaz.acInsDPCExecute(Sender: TObject);
var
		nDpcId  : Integer;

    SelNum, SelCount : Integer;
    i : Integer;
    fNaznList : TNazMedLechArr;
begin
  nDpcId := -1;


	if VarIsNull(lcbMO_GroupFrom.KeyValue) or ( Trim(lcbMO_GroupFrom.Text) = EmptyStr )  then
	begin
		lcbMO_GroupFrom.SetFocus;
		MessageBox(Self.Handle, PChar('Вы не выбрали "Откуда" требование!'), 'Ошибка', MB_OK + mb_iconerror);
		exit;
  end;

  if VarIsNull (LCBTo.KeyValue ) or  ( Trim (LCBTo.Text) = EmptyStr )  then
  begin
    LCBTo.SetFocus;
    Application.MessageBox(PChar('Вы не выбрали "Кому" требование!'), 'Ошибка', MB_OK + mb_iconerror);
    exit;
  end;

  fNaznList := DoSelectNazn ( lcbMO_GroupFrom.KeyValue, -1, lcbMO_GroupFrom.Text, True );
  SetLength( fNaznList, Length(fNaznList) );

  if ( Length(fNaznList) > 0 ) then
  for i := 0 to  Length(fNaznList) - 1 do
  begin
    nDpcId := Trunc(dmMain.PKGTREB.DOSETTREBDPC_BY_NAZMEDLECH(-1, FidTreb, fNaznList[i].FK_MEDICID, 0, fNaznList[i].FK_NAZMEDLECHID ) );
  end;

  acRefresh.Execute;

  if nDpcId > 0  then  
     odsMedTreb_Naz.Locate('FK_ID',nDpcId,[]);
end;

procedure TfrmTrebByNaz.acDelDPCExecute(Sender: TObject);
begin
  if Windows.MessageBox(Self.Handle, PChar('Вы действительно хотите удалить данную запись?'),
    'Подтверждение', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYes then
  begin
		dmMain.PKGTREB.DODELTREBDPC(odsMedTreb_Naz.FieldByName('FK_ID').AsInteger);
//		dmMain.PKGTREB.DODELTTREBDPCBYNAZ(odsMedTreb_Naz.FieldByName('FK_ID').AsInteger);
		acRefresh.Execute;
  end;
end;

procedure TfrmTrebByNaz.acEditDPCExecute(Sender: TObject);
var
		nDpcId : Integer;
    nMedicId: Integer;
begin
  nMedicId := -1;
  nMedicId := DoShowMedic(nMedicId, True);
  if nMedicId <= 0 then Exit; // не выбрали медикамент

  nDpcId := odsMedTreb_Naz.FieldByName('FK_ID').AsInteger;
	dmMain.PKGTREB.DOSETTREBDPC(nDpcId, FidTreb, nMedicId, odsMedTreb_Naz.FieldByName('FN_KOL').AsFloat);

  { перевел на таблицу  med.TLATIN_NAMES
  oqSaveMedicLink.SetVariable('FK_MEDIC_ID', nMedicId);
  oqSaveMedicLink.SetVariable('FK_NAZMEDID', odsMedTreb_Naz.FieldByName('FK_NAZN_MEDIC_NAME').AsInteger);
  oqSaveMedicLink.Execute;  }

  acRefresh.Execute;

  odsMedTreb_Naz.Locate('FK_ID',nDpcId,[]);
end;

procedure TfrmTrebByNaz.FormCreate(Sender: TObject);
begin                                               
  odsNameFrom.Open;
  odsNameTo.Open;
  odsMO_GroupFrom.Open;
  odsMO_GroupTo.Open;

  deRegisterDate.Date := trunc(ServerDate(dmMain.os));

  LCBTo.KeyValue := odsNameTo.FieldByName('MOID').AsInteger;
  lcbMO_GroupTo.KeyValue := dmMain.pkgMedSes.GET_CUR_MOGROUP_BY_MOID( LCBTo.KeyValue );
  lcbMO_GroupToCloseUp( Sender );

  lcbFrom.KeyValue := dmMain.pkgMedSes.GetCurMo;
  lcbMO_GroupFrom.KeyValue := dmMain.pkgMedSes.GET_CUR_MOGROUP_BY_MOID( lcbFrom.KeyValue );
  lcbMO_GroupFromCloseUp( Sender );

//  lcbMO_GroupFrom.Enabled := dmMain.ConfigParams.GetParamValue('FUNC_TREB_NAZN_LIST_FROM_ANYWHERE', 0);   //frmMain.ProvisorState = 1;
//  lcbFrom.Enabled         := lcbMO_GroupFrom.Enabled; //frmMain.ProvisorState = 1;                     s

  lcCaption_lcbFinSource.Visible := dmMain.ConfigParams.GetParamValue('FUNC_REQUIRE_FINSOURCE_IN_TREB', 0) = 1;

  if (not lcCaption_lcbFinSource.Visible ) then
    paCaption.Height := paCaption.Height - lcCaption_lcbFinSource.Control.Height;

  // автоматически определяем длину ограничения на поле Воронов О.А. 25.08.2008
  mComment.MaxLength := dmMain.GetFieldLength('med', 'TTREB', 'FC_COMMENT');
end;

procedure TfrmTrebByNaz.FormShow(Sender: TObject);
begin
//  fIsRefreshed := True;
  acRefresh.Execute;   
end;

procedure TfrmTrebByNaz.SetidTreb(const Value: Integer);
begin
  FidTreb := Value;

  odsMedTreb_Naz.SetVariable('FK_TREBID',FidTreb);
//  odsNaznList.SetVariable('FK_TREB',FidTreb);

//	dmMain.PKGTREB.FORMBYNAZN(FidTreb,lcbMO_GroupFrom.KeyValue);
//  dmMain.PKGTREB.FORMBYNAZNTTREBDPCBYNAZ(FidTreb, lcbMO_GroupFrom.KeyValue);
end;

procedure TfrmTrebByNaz.acFormDPCExecute(Sender: TObject);
begin
{	if Nvl(LCBFrom.KeyValue,0) = 0 then
	begin
		pc.ActivePageIndex := 0;
		LCBFrom.SetFocus;
		MessageBox(Self.Handle, PChar('Вы не выбрали "От кого" требование!'), 'Ошибка',
			MB_OK + mb_iconerror);
		exit;
	end;

	if Application.MessageBox('Переформировать список медикаментов в требовании?', 'Подтверждение',
	MB_ICONQUESTION or MB_YESNO) = idyes then
	begin
		dmMain.PKGTREB.FORMBYNAZN(FidTreb,lcbMO_GroupFrom.KeyValue);
//		dmMain.PKGTREB.FORMBYNAZNTTREBDPCBYNAZ(FidTreb,lcbMO_GroupFrom.KeyValue);
		acRefresh.Execute;
	end; }
end;

procedure TfrmTrebByNaz.grMedTrebDblClick(Sender: TObject);
begin
	acEditDPC.Execute;
end;

procedure TfrmTrebByNaz.lcbFromClick(Sender: TObject);
begin
	odsNameTo.Refresh;
	LCBTo.KeyValue := odsNameTo.FieldByName('MOID').AsInteger;
//------acFormDPC---без-вопросов------------------------------------------------  жаль что я не матрос, вопросы имеются
//	dmMain.PKGTREB.FORMBYNAZN(FidTreb,lcbFrom.KeyValue);
// формируем список по группе МО

//  odsMO_GroupFrom.Close;
//  odsMO_GroupFrom.SetVariable('MOID', lcbFrom.KeyValue);
//  odsMO_GroupFrom.Open;
end;

procedure TfrmTrebByNaz.grNazPacEnter(Sender: TObject);
begin
	TWinControl(Sender).Repaint;
end;

procedure TfrmTrebByNaz.LCBToClick(Sender: TObject);
begin
//  odsMO_GroupTo.Close;
//  odsMO_GroupTo.SetVariable('MOID', LCBTo.KeyValue);
//  odsMO_GroupTo.Open;
end;

procedure TfrmTrebByNaz.grNazPacDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
//  inherited;
{ if //not Sender.Focused and //TWinControl(Sender).Focused and
 (odsMedTreb.FieldByName('FK_MEDICID').AsInteger = AViewInfo.GridRecord.Values[grNazPacDBTableView1FK_MEDICID1.Index])and(not FClearNazPac) then
 begin
    ACanvas.Brush.Color := $00D7F5FB; //$00ACE1F0;
    ACanvas.Font.Color := $00404040;
 end
  else
	begin
		ACanvas.Brush.Color := clWhite;
		ACanvas.Font.Color := clBlack;
	end;} 
// Inc(FDrawNazPacCount);
// Self.Caption := 'DrawNazList = '+IntToStr(FDrawNazListCount)+', DrawNazPac = '+ IntToStr(FDrawNazPacCount);
end;

procedure TfrmTrebByNaz.grNaznListDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
//  inherited;
{	if //not Sender.Focused and //TWinControl(Sender).Focused and
	(odsNaznList.FieldByName('FK_MEDICID').AsInteger = AViewInfo.GridRecord.Values[grNaznListDBTableView1FK_NAZN_MEDIC_NAME.Index])and(not FClearNazList) then
	begin
		ACanvas.Brush.Color := $00E0E0E0;//$00ACE1F0;
		ACanvas.Font.Color := $00404040;
	end
  else
	begin
		ACanvas.Brush.Color := clWhite;
		ACanvas.Font.Color := clBlack;
	end; }
//  Inc(FDrawNazListCount);
//  Self.Caption := 'DrawNazList = '+IntToStr(FDrawNazListCount)+', DrawNazPac = '+ IntToStr(FDrawNazPacCount);
end;
//==============================================================================
// Обработчеги  odsMedTreb_Naz
//==============================================================================
procedure TfrmTrebByNaz.odsMedTrebAfterScroll(DataSet: TDataSet);
begin
//  FClearNazList := True;
//  FClearNazPac := False;
//  grNaznListDBTableView1.ViewChanged;
//  grNazPacDBTableView1.ViewChanged;
end;
procedure TfrmTrebByNaz.odsMedTreb_NazAfterOpen(DataSet: TDataSet);
begin
  lcbMO_GroupFrom.Enabled := (DataSet.IsEmpty) and (dmMain.ConfigParams.GetParamValue('FUNC_TREB_NAZN_LIST_FROM_ANYWHERE', 0)) ;
  lcbFrom.Enabled := lcbMO_GroupFrom.Enabled;                                                                                
end;

//------------------------------------------------------------------------------
procedure TfrmTrebByNaz.grMedTrebDBTableView1FN_TREBKOL1PropertiesEditValueChanged(
  Sender: TObject);
begin
  if odsMedTreb_Naz.State in [dsEdit, dsInsert] then
    grMedTrebDBTableView1.DataController.Post;
end;
//------------------------------------------------------------------------------
procedure TfrmTrebByNaz.grMedTrebDBTableView1FC_MEDICPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
	acEditDPC.Execute;
end;
//------------------------------------------------------------------------------
procedure TfrmTrebByNaz.deRegisterDatePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  cxDateEdit_PropertiesValidate(Sender, DisplayValue, ErrorText, Error);
end;
//------------------------------------------------------------------------------
//procedure TfrmTrebByNaz.grMedTrebDBTableView1DragDrop(Sender,
//  Source: TObject; X, Y: Integer);
//begin
//  if (TcxDragControlObject(Source).Control.Parent.Name = 'grNaznList2') then
//    acInsDPC.Execute;
//end;
//------------------------------------------------------------------------------
//procedure TfrmTrebByNaz.grMedTrebDBTableView1DragOver(Sender,
//  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
//begin
//  Accept := (TcxDragControlObject(Source).Control.Parent.Name = 'grNaznList2');
//end;
//------------------------------------------------------------------------------


procedure TfrmTrebByNaz.lcbMO_GroupFromCloseUp(Sender: TObject);
var
  CurVal : Variant;
begin
  CurVal := lcbFrom.KeyValue;
  // автоматически фильтруем
  if lcbFrom.Enabled then
  begin
    odsNameFrom.Filtered := False;
    odsNameFrom.Filter := 'FK_CURMOGROUPID = '+IntToStr(odsMO_GroupFrom.FieldByName('GROUPID').AsInteger);
    odsNameFrom.Filtered := True;

    if ( odsNameFrom.RecordCount > 0 ) then
    begin
      if odsNameFrom.Locate ( 'MOID', CurVal, [] ) then
         lcbFrom.KeyValue := CurVal
      else
      begin
        odsNameFrom.First;
        lcbFrom.KeyValue := odsNameFrom.FieldByName('MOID').AsInteger;
      end;
    end
    else
      lcbFrom.KeyValue := Null; 

  end;
end;

procedure TfrmTrebByNaz.lcbMO_GroupToCloseUp(Sender: TObject);
var
  CurVal : Variant;
begin
  CurVal := LCBTo.KeyValue;
  // автоматически фильтруем получателей требования
  if LCBTo.Enabled then
  begin
    odsNameTo.Filtered := False;
    odsNameTo.Filter := 'FK_CURMOGROUPID = '+IntToStr(odsMO_GroupTo.FieldByName('GROUPID').AsInteger);
    odsNameTo.Filtered := True;

    if ( odsNameTo.RecordCount > 0 ) then
    begin
      if odsNameTo.Locate ( 'MOID', CurVal, [] ) then
        LCBTo.KeyValue := CurVal
      else
      begin
        odsNameTo.First;
        LCBTo.KeyValue := odsNameTo.FieldByName('MOID').AsInteger;
      end;
    end
    else
      LCBTo.KeyValue := Null;
  end;
end;

procedure TfrmTrebByNaz.LCBToKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then odsNameTo.Filtered := False;
end;

end.
