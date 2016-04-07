unit fMedic;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, ComCtrls, ToolWin, Db, OracleData, Grids,
  JvFormPlacement, Oracle, JvDBUtils, ExtCtrls, StdCtrls, JvDBCombobox,
  JvDBControls, DBCtrls, HtmlHlp,
  JvComponentBase, cxMaskEdit, Menus, cxGraphics, cxCustomData,
  cxStyles, cxTL, cxInplaceContainer, cxDBTL, cxControls, cxTLData,
  cxCheckBox, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxDBLookupComboBox, cxLabel, cxSpinEdit, cxSplitter, cxClasses,
  cxGridCustomView, cxGrid, cxTextEdit, cxPC, cxContainer, cxGroupBox, fdmMain;

const
  medlst_ini = 'medlst.ini';
    
type
  TfrmMedic = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    al: TActionList;
    acClose: TAction;
    acDel: TAction;
    acEdit: TAction;
    acAdd: TAction;
    acRefresh: TAction;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    tbuSelect: TToolButton;
    ToolButton9: TToolButton;
    acSelect: TAction;
    FormStorage: TJvFormStorage;
    pmRefresh: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    odsMedicsList: TOracleDataSet;
    dsMedicsList: TDataSource;
    cxGrid1DBTableView1FC_NAME: TcxGridDBColumn;
    cxGrid1DBTableView1FC_NAME_LAT: TcxGridDBColumn;
    cxGrid1DBTableView1FC_UCHNAME: TcxGridDBColumn;
    cxGrid1DBTableView1FC_FARMNAME: TcxGridDBColumn;
    cxGrid1DBTableView1FC_PREP: TcxGridDBColumn;
    cxGrid1DBTableView1FC_EANCODE: TcxGridDBColumn;
    cxGrid1DBTableView1FC_UEDIZM: TcxGridDBColumn;
    cxGrid1DBTableView1FN_FPACKINUPACK: TcxGridDBColumn;
    cxGrid1DBTableView1FC_FEDIZM: TcxGridDBColumn;
    cxGrid1DBTableView1FN_MASS: TcxGridDBColumn;
    cxGrid1DBTableView1FC_MASSUNITS: TcxGridDBColumn;
    cxGrid1DBTableView1FC_SPECIALMEDIC: TcxGridDBColumn;
    cxGrid1DBTableView1FC_LGOTA: TcxGridDBColumn;
    cxGrid1DBTableView1FL_PRINT_LAT_NAME: TcxGridDBColumn;
    cxGrid1DBTableView1FC_SOST: TcxGridDBColumn;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    odsSostMedics: TOracleDataSet;
    dsSostMedics: TDataSource;
    cxGrid2DBTableView1FC_NAME: TcxGridDBColumn;
    cxGrid2DBTableView1FC_NAME_LAT: TcxGridDBColumn;
    cxGrid2DBTableView1FC_UEDIZM: TcxGridDBColumn;
    cxGrid2DBTableView1FN_FPACKINUPACK: TcxGridDBColumn;
    cxGrid2DBTableView1FC_FEDIZM: TcxGridDBColumn;
    cxGrid2DBTableView1FN_MASS: TcxGridDBColumn;
    cxGrid2DBTableView1FC_MASSUNITS: TcxGridDBColumn;
    cxGrid2DBTableView1FN_AMOUNT: TcxGridDBColumn;
    cxSplitter1: TcxSplitter;
    cxGrid1DBTableView1MEDICID: TcxGridDBColumn;
    tbuExportToExcel: TToolButton;
    acExportToExcel: TAction;
    sd: TSaveDialog;
    cxGrid1DBTableView1FL_VISIBLE_FOR_NOT_APTEKA: TcxGridDBColumn;
    acCancelFilterEAN13: TAction;
    tmrEANCode: TTimer;
    cxGrid2DBTableView1MEDICID: TcxGridDBColumn;
    cxGrid1DBTableView1FL_EQUIPMENT: TcxGridDBColumn;
    tbuSkladSelect: TToolButton;
    cxGrid1DBTableView1FC_INTERNATIONAL_NAME: TcxGridDBColumn;
    cxGrid1DBTableView1FK_GROUP_LF: TcxGridDBColumn;
    cxGrid1DBTableView1FC_QUOTA_CODE_34: TcxGridDBColumn;
    cxGrid1DBTableView1FL_JNVLS: TcxGridDBColumn;
    cxGrid1DBTableView1FK_SKLAD_ID: TcxGridDBColumn;
    ToolButton8: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    cxGrid2DBTableView1FL_TARA: TcxGridDBColumn;
    tbtVisible: TToolButton;
    acHide: TAction;
    pmGrid: TPopupMenu;
    N3: TMenuItem;
    acSetUchGr: TAction;
    cxGrid1DBTableView1FL_MIBP: TcxGridDBColumn;
    paVisible: TPanel;
    cbShowHidden: TCheckBox;
    acShow: TAction;
    cxGrid1DBTableView1FL_FORMULAR: TcxGridDBColumn;
    cxGrid1DBTableView1FC_SHORTNAME: TcxGridDBColumn;
    cxGrid1DBTableView1FK_ATC: TcxGridDBColumn;
    cxGrid1DBTableView1FC_PROD: TcxGridDBColumn;
    cxGrid1DBTableView1FC_CERT: TcxGridDBColumn;
    cxGrid1DBTableView1FC_CLASS: TcxGridDBColumn;
    cxGrid1DBTableView1FC_OKDP: TcxGridDBColumn;
    cxGrid1DBTableView1FC_ATC_ROOT: TcxGridDBColumn;
    cxGrid1DBTableView1FL_CHECK: TcxGridDBColumn;
    cxGrid1DBTableView1FL_FORM_KOMISS: TcxGridDBColumn;
    cxGrid1DBTableView1UCHGRID: TcxGridDBColumn;
    N_ChngUchGrp: TMenuItem;
    acUchGrChangesList: TAction;
    cxGrid1DBTableView1FL_VRACH_KOMISS: TcxGridDBColumn;
    odsUchgr: TOracleDataSet;
    dsUchgr: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acDelExecute(Sender: TObject);
    procedure acEditExecute(Sender: TObject);
    procedure acAddExecute(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    procedure acSelectExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
    procedure N2Click(Sender: TObject);
    procedure odsMedicsListAfterScroll(DataSet: TDataSet);
    procedure odsMedicsListAfterOpen(DataSet: TDataSet);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure acExportToExcelExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure acCancelFilterEAN13Execute(Sender: TObject);
    procedure tmrEANCodeTimer(Sender: TObject);
    procedure tbuSkladSelectClick(Sender: TObject);
    procedure cxGrid1DBTableView1FC_UCHNAMEPropertiesEditValueChanged(
      Sender: TObject);
    procedure acHideExecute(Sender: TObject);
    procedure acSetUchGrExecute(Sender: TObject);
    procedure acShowExecute(Sender: TObject);
    procedure cbShowHiddenClick(Sender: TObject);
    procedure cxGrid1DBTableView1CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure odsMedicsListApplyRecord(Sender: TOracleDataSet; Action: Char; var Applied: Boolean; var NewRowId: string);
    procedure odsMedicsListAfterPost(DataSet: TDataSet);
    procedure odsMedicsListBeforePost(DataSet: TDataSet);
    procedure cxGrid1DBTableView1FL_FORMULARPropertiesChange(Sender: TObject);
    procedure cxGrid1DBTableView1FL_FORM_KOMISSPropertiesChange(
      Sender: TObject);
    procedure acUchGrChangesListExecute(Sender: TObject);
    procedure alUpdate(Action: TBasicAction; var Handled: Boolean);

  private
    { Private declarations }
    FIsShtrihCodeInput : Boolean;
    FIsAddEditDelVisible : Boolean;
    FIsCanEdit : boolean;
    FIsSelect : Boolean;
    FEAN13Code1, FEAN13Code2 : string;  // буфер для накапливания цифр - для штрих-сканера
    FIs13KeyPressed : boolean;
    FShowCount : Integer;
    MedicidList : TarrInt;
    fShowFullUchGrName : boolean;
  public
    { Public declarations }
    nID: Integer;
    procedure InitForm( pID: integer = -1; aIsSelect: Boolean = True; aWhere : string = ''; aIsAddEditDelVisible : Boolean = False; aIsShtrihCodeInput : Boolean = False; aMedicFilter : string = ''; aFormTitle : string = 'Список объектов учета'; aSkladID : Integer = 0);
  end;

//function DoShowMedic(pID: integer = -1; bAssortiment: Boolean = False; bTreb: Boolean = False): Integer;
function DoShowMedic( pID: integer = -1; aIsSelect: Boolean = True; aWhere : string = ''; aIsAddEditDelVisible : Boolean = False; aIsShtrihCodeInput : Boolean = False; aMedicFilter : string = ''; aFormTitle : string = 'Список объектов учета'; aSkladID : Integer = 0): Integer;
function DoShowMedicForGroupAdd( pID: integer = -1; aIsSelect: Boolean = True; aWhere : string = ''; aIsAddEditDelVisible : Boolean = False; aIsShtrihCodeInput : Boolean = False; aMedicFilter : string = ''; aFormTitle : string = 'Список объектов учета'; aSkladID : Integer = 0): TarrInt;

var
  frmMedic: TfrmMedic;
  frmMedicModal: TfrmMedic;
  IsModal,
  v_is_Mouse_Right_Click : Boolean;

implementation

uses fmainform, fMedicEdit, fdmPrintReports, cxGridExportLink, ShellAPI,
  fdmSkladSelect, fm_Select_UchGr, Variants, fUchgrpsChr;

{$R *.DFM}

function myvartoint (p_var:variant) : Integer;
begin
  if VarIsNull(p_var)  then
  begin
    Result := 0;
  end else
  if fdmMain.nvl(p_var,0)=0 then
    Result := 0
  else
    Result := 1;
end;

function DoShowMedicForGroupAdd( pID: integer = -1; aIsSelect: Boolean = True; aWhere : string = ''; aIsAddEditDelVisible : Boolean = False; aIsShtrihCodeInput : Boolean = False; aMedicFilter : string = ''; aFormTitle : string = 'Список объектов учета'; aSkladID : Integer = 0): TarrInt;
var
  i : integer;
begin
  IsModal := aIsSelect;
  if aIsSelect then
  begin
    frmMedicModal := TfrmMedic.Create(Application);
    frmMedicModal.tbuSkladSelect.Visible := (dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1) and (frmMain.ProvisorState = 0) and (aSkladID = 0);
    frmMedicModal.InitForm(pID, aIsSelect, aWhere, aIsAddEditDelVisible, aIsShtrihCodeInput, aMedicFilter, aFormTitle, aSkladID);

    //////////////////////////
    frmMedicModal.cxGrid1DBTableView1FL_CHECK.VisibleForCustomization := true;
    frmMedicModal.cxGrid1DBTableView1FL_CHECK.Visible := true;
    frmMedicModal.cxGrid1DBTableView1.OptionsData.Editing := True;
    for i := 0 to frmMedicModal.cxGrid1DBTableView1.ColumnCount-1 do
    begin
      frmMedicModal.cxGrid1DBTableView1.Columns[i].Options.Editing := False;
    end;
    frmMedicModal.cxGrid1DBTableView1FL_CHECK.Options.Editing  := True;
    if aIsShtrihCodeInput = True then
      frmMedicModal.cxGrid1DBTableView1FC_EANCODE.Options.Editing  := True;
    //////////////////////////
    frmMedicModal.ShowModal;
    
    /////////////////////////
    result := frmMedicModal.MedicidList;
    /////////////////////////
    ///result := frmMedicModal.nid;
  end
  else
  begin
    if not frmMain.RestoreMDI_Window('frmMedic') then
    begin
      frmMedic := TfrmMedic.Create(Application);
      frmMedic.InitForm(pID, aIsSelect, aWhere, aIsAddEditDelVisible, False, aMedicFilter, aFormTitle, aSkladID);
      frmMedic.FormStyle := fsMDIChild;
    end;
    SetLength(Result,1);
    result[0] := frmMedic.nid;
  end;
end;

// полностью переделал механизм работы это процедуры Воронов О.А. 18.06.2007
function DoShowMedic( pID: integer = -1; aIsSelect: Boolean = True; aWhere : string = ''; aIsAddEditDelVisible : Boolean = False; aIsShtrihCodeInput : Boolean = False; aMedicFilter : string = ''; aFormTitle : string = 'Список объектов учета'; aSkladID : Integer = 0): Integer;
//function DoShowMedic(pID: integer = -1; bAssortiment: Boolean = False; bTreb: Boolean = False): Integer;
//var CurMo: Integer;
begin
//  CurMo := Round(dmMain.pkgMedSes.getcurmo);
//  if CurMo = -1 then Application.MessageBox('Не выбран материально ответсвенный!','Внимание',mb_iconwarning + mb_ok);
//  odsMedicLst.SetVariable('MOID',CurMo);
//  if not odsMedicLst.Active then dmMain.odsMedicLst.Open;
//  dmMain.odsMedicLst.First;

  IsModal := aIsSelect;
  if aIsSelect then
  begin
    frmMedicModal := TfrmMedic.Create(Application);
    frmMedicModal.tbuSkladSelect.Visible := (dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1) and (frmMain.ProvisorState = 0) and (aSkladID = 0);
    frmMedicModal.InitForm(pID, aIsSelect, aWhere, aIsAddEditDelVisible, aIsShtrihCodeInput, aMedicFilter, aFormTitle, aSkladID);
    frmMedicModal.ShowModal;
    result := frmMedicModal.nid;
  end
  else
  begin
    if not frmMain.RestoreMDI_Window('frmMedic') then
    begin
      frmMedic := TfrmMedic.Create(Application);
      frmMedic.InitForm(pID, aIsSelect, aWhere, aIsAddEditDelVisible, False, aMedicFilter, aFormTitle, aSkladID);
      frmMedic.FormStyle := fsMDIChild;
    end;
    result := frmMedic.nid;
  end;
end;

procedure TfrmMedic.InitForm( pID: integer = -1; aIsSelect: Boolean = True; aWhere : string = ''; aIsAddEditDelVisible : Boolean = False; aIsShtrihCodeInput : Boolean = False; aMedicFilter : string = ''; aFormTitle : string = 'Список объектов учета'; aSkladID : Integer = 0);
var
  i : Integer;
begin
  FIsAddEditDelVisible := aIsAddEditDelVisible;
  // либо включена константа на использование прав и у юзера есть права, либо константа не включена
  FIsCanEdit := FIsAddEditDelVisible and
    ( ( dmMain.ConfigParams.GetParamValue('FUNC_USE_RIGHT_EDIT_MEDIC', 0) = 0)  or
      ( dmMain.ConfigParams.GetParamValue('FUNC_USE_RIGHT_EDIT_MEDIC', 0) = 1 and dmMain.ConfigParams.GetParamValue('FUNC_CAN_EDIT_MEDIC', False) )
    ) ;  ;
  FIsSelect := aIsSelect;
  UpdateActions;
  self.Caption := aFormTitle;
  odsMedicsList.AfterScroll := nil;
  odsMedicsList.Close;
  odsMedicsList.SetVariable('PFK_SKLAD_ID', aSkladID);
  odsMedicsList.SetVariable('PADDITIONWHERE', aWhere);
  odsMedicsList.Open;
  tbuSkladSelect.Tag := aSkladID; // выставляем текущий склад на менюшке

  odsMedicsList.Filtered := False;
  if aMedicFilter <> '' then
  begin
    odsMedicsList.Filter   := aMedicFilter;
    odsMedicsList.Filtered := True;
  end;

  nid := pID;
  if pID > 0 then odsMedicsList.Locate('MEDICID', pID, []);
  odsMedicsList.AfterScroll := odsMedicsListAfterScroll;
  odsMedicsListAfterOpen(nil);

  cxGrid1DBTableView1.OptionsData.Editing := (aIsAddEditDelVisible and (not FIsSelect)) or (aIsShtrihCodeInput = True);
  cxGrid1DBTableView1.OptionsSelection.MultiSelect := aIsAddEditDelVisible and (not FIsSelect);

  FIsShtrihCodeInput := aIsShtrihCodeInput;
  if aIsShtrihCodeInput = True then
  begin
    for i := 0 to cxGrid1DBTableView1.ColumnCount-1 do
    begin
      cxGrid1DBTableView1.Columns[i].Options.Editing := False;
    end;
    cxGrid1DBTableView1FC_EANCODE.Options.Editing  := True;
    cxGrid1DBTableView1FC_EANCODE.Width := 105;
    cxGrid1DBTableView1FC_EANCODE.Focused := True;// Selected := True;
    acSelect.ShortCut := 0;
    FEAN13Code1 := '';
    FEAN13Code2 := '';
  end;

end;

procedure TfrmMedic.acDelExecute(Sender: TObject);
var
   i: Integer;
   pMedicid: Integer;
begin
  if windows.MessageBoxEx(Handle, PChar('Вы действительно хотите удалить ' + IntToStr(cxGrid1DBTableView1.DataController.GetSelectedCount) + ' объект(ов) учета?'), 'Подтвердите действие', MB_YESNO + MB_ICONQUESTION,$0419 {Russian}) = mrYes then begin
  //      op.CallProcedure('DoDel', [odsList.FieldValues['FK_ID']]);
    odsMedicsList.DisableControls;
    for i := 0 to cxGrid1DBTableView1.DataController.GetSelectedCount - 1 do
    begin
      pMedicid := cxGrid1DBTableView1.DataController.Controller.SelectedRecords[I].Values[cxGrid1DBTableView1MEDICID.Index];

      try
        odsMedicsList.Locate('medicid', pMedicid,[]);
        dmMain.pkgMedic.DODEL(pMedicid);
      except
        on E: Exception do
        begin
          if Pos('ORA-02292', E.Message) > 0 then
            MessageBox(Handle, PChar('Невозможно удалить объект учета - '+ odsMedicsList.FieldByName('fc_name').AsString + #10#13 +
              'На него заведены партии.'), 'Ошибка', MB_ICONERROR or MB_OK);

          if (i <> cxGrid1DBTableView1.DataController.GetSelectedCount - 1)
             and (MessageBox(Handle, PChar('Продолжить удаление следующих объектов учета?'), 'Вопрос', MB_ICONQUESTION + MB_YESNO) = IDNO) then
          begin
            Break;
          end;
        end;
      end;
    end;
    odsMedicsList.EnableControls;
    acRefresh.Execute;
  end;
end;

procedure TfrmMedic.acEditExecute(Sender: TObject);
var
  MEDICID : Integer;
begin
  MEDICID := odsMedicsList.FieldByName('MEDICID').AsInteger;
  if windows.MessageBoxEx(Handle, pAnsiChar('Вы собираетесь ИЗМЕНИТЬ объект учета: ' + #10#13 +
                                  odsMedicsList.FieldByName('FC_NAME').AsString + #10#13 +
                                  'Вы действительно хотите этого?'),
                                  'Подтвердите действие',
                                  MB_YESNO + MB_ICONQUESTION,$0419 {Russian}) <> mrYes then exit;

  DoShowMedicEdit(MEDICID);

  odsMedicsList.AfterScroll := nil;
  odsMedicsList.Refresh;
  odsMedicsList.Locate('MEDICID',MEDICID,[]);
  odsMedicsList.AfterScroll := odsMedicsListAfterScroll;
  odsMedicsListAfterScroll( odsMedicsList );
end;

procedure TfrmMedic.acAddExecute(Sender: TObject);
var
  medId : integer;
begin
  medId := DoShowMedicEdit(-1);
	acRefresh.Execute;
  try
    odsMedicsList.DisableControls;
    odsMedicsList.AfterScroll := nil;
    odsMedicsList.Locate('medicid', medId, []);
    odsMedicsList.EnableControls;
    odsMedicsList.AfterScroll := odsMedicsListAfterScroll;
    odsMedicsListAfterScroll( odsMedicsList );
  except
  end;
//  acRefresh.Execute;
end;

procedure TfrmMedic.acCloseExecute(Sender: TObject);
begin
//  odsMedicLst.First;
  nID := 0;
  Close;
end;

procedure TfrmMedic.acRefreshExecute(Sender: TObject);
var
  CurMedicId  : Integer;
begin
  CurMedicId := odsMedicsList.FieldByName( 'MEDICID' ).AsInteger;

  with odsMedicsList do
  try
    AfterScroll := nil;
    AfterOpen   := nil;

    DisableControls;
    Close;
    Open;

    if not Locate( 'MEDICID', CurMedicId, [] ) then
      First;
  finally
    EnableControls;
    AfterScroll := odsMedicsListAfterScroll;
    AfterOpen   := odsMedicsListAfterOpen;

    odsMedicsListAfterScroll( odsMedicsList );
    odsMedicsListAfterOpen( odsMedicsList );
  end;

  if FIsShtrihCodeInput then cxGrid1DBTableView1FC_EANCODE.Selected := True;
end;

procedure TfrmMedic.acSelectExecute(Sender: TObject);
begin
//  nID := odsMedicLst.FieldByName('MEDICID').AsInteger;
  nID := odsMedicsList.FieldByName('MEDICID').AsInteger;

  //////////////////////////
  if cxGrid1DBTableView1FL_CHECK.Visible then begin
    odsMedicsList.AfterScroll := nil;
    odsMedicsList.DisableControls;
    odsMedicsList.First;
    while not odsMedicsList.eof do begin
      if odsMedicsList.FieldByName('FL_CHECK').AsInteger = 1 then begin
        SetLength(MedicidList, Length(MedicidList) + 1);
        MedicidList[Length(MedicidList)-1] := odsMedicsList.FieldByName('MEDICID').AsInteger;
      end;
      odsMedicsList.Next;
    end;
    odsMedicsList.Locate('medicid',nID,[]);
    odsMedicsList.EnableControls;
    odsMedicsList.AfterScroll := odsMedicsListAfterScroll;
    odsMedicsListAfterScroll(nil);

    if Length(MedicidList) = 0 then begin
      SetLength(MedicidList, 1);
      MedicidList[0] := nID;
    end;
  end;
  //////////////////////////

  cxGrid1DBTableView1.StoreToIniFile(medlst_ini, True, [gsoUseFilter]);
  Close;
end;

procedure TfrmMedic.acSetUchGrExecute(Sender: TObject);
var
  pUchGrID, pUchGrIDOld, pmedicid: Integer;
  I : Integer;
  pTmp: Integer;
begin
  pUchGrID := DoShowSelectUchGr(odsMedicsList.FieldByName('uchgrid').AsInteger);
  pTmp := odsMedicsList.FieldByName('medicid').AsInteger;
  if pUchGrID <> -100 then
  begin
    for i := 0 to cxGrid1DBTableView1.DataController.GetSelectedCount - 1 do
    begin
      pmedicid := cxGrid1DBTableView1.DataController.Controller.SelectedRecords[I].Values[cxGrid1DBTableView1MEDICID.Index];
      pUchGrIDOld:=cxGrid1DBTableView1.DataController.Controller.SelectedRecords[I].Values[cxGrid1DBTableView1UCHGRID.Index];
      if ( pUchGrID <> pUchGrIDOld )  then
      begin
        dmMain.pkgMedic.DOSETUCHGROUP(pUchGrID,pmedicid);
        if dmMain.ConfigParams.GetParamValue('FUNC_USE_MEDUCHGRP_CH', 0) = '1'then
        try
          // заносим смену учетной группы в историю
          dmMain.pkgMedic.SETUCHGRCHANGEHISTORY( pmedicid,pUchGrIDOld, pUchGrID, dmMain.MOID );
          // обновляем учетные группы в карточках
          dmMain.pkgMedic.SETUCHGRFORKARTS( pmedicid, pUchGrID, Date );
        finally

        end;
      end;
    end;
    acRefreshExecute(nil);
    
    odsMedicsList.AfterScroll := nil;
    odsMedicsList.AfterOpen   := nil;
    odsMedicsList.Locate('MEDICID', pTmp, []);
    odsMedicsList.AfterScroll := odsMedicsListAfterScroll;
    odsMedicsList.AfterOpen   := odsMedicsListAfterOpen;
  end;
end;

procedure TfrmMedic.acShowExecute(Sender: TObject);
var
   i: Integer;
   pMedicid: Integer;
begin
  if windows.MessageBoxEx(Handle, PChar('Вы действительно хотите вернуть видимость ' + IntToStr(cxGrid1DBTableView1.DataController.GetSelectedCount) + ' объект(ов) учета?'), 'Подтвердите действие', MB_YESNO + MB_ICONQUESTION,$0419 {Russian}) = mrYes then begin
    odsMedicsList.DisableControls;
    for i := 0 to cxGrid1DBTableView1.DataController.GetSelectedCount - 1 do
    begin
      pMedicid := cxGrid1DBTableView1.DataController.Controller.SelectedRecords[I].Values[cxGrid1DBTableView1MEDICID.Index];

      try
        odsMedicsList.Locate('medicid', pMedicid,[]);
        dmMain.pkgMedic.DOVISIBLE(pMedicid);
      except
        on E: Exception do
        begin
          MessageBox(Handle, PChar('При возврате объекта учёта - '+ odsMedicsList.FieldByName('fc_name').AsString + ', из скрытых возникла ошибка.' + #10#13 +
                         'Обратитесь к системному администратору'), 'Ошибка', MB_ICONERROR or MB_OK);

          if (i <> cxGrid1DBTableView1.DataController.GetSelectedCount - 1)
             and (MessageBox(Handle, PChar('Продолжить возврат следующих объектов учета?'), 'Вопрос', MB_ICONQUESTION + MB_YESNO) = IDNO) then
          begin
            Break;
          end;
        end;
      end;
    end;
    odsMedicsList.EnableControls;
    acRefresh.Execute;
  end;
end;


procedure TfrmMedic.FormCreate(Sender: TObject);
var
  SKLAD_SYNONIM : string;
begin
  FIsAddEditDelVisible := False;// (frmMain.ProvisorState = 1);
  // либо включена константа на использование прав и у юзера есть права, либо константа не включена
  FIsCanEdit := (FIsAddEditDelVisible) and
    ( ( dmMain.ConfigParams.GetParamValue('FUNC_USE_RIGHT_EDIT_MEDIC', 0) = 0)  or
      ( dmMain.ConfigParams.GetParamValue('FUNC_USE_RIGHT_EDIT_MEDIC', 0) = 1 and dmMain.ConfigParams.GetParamValue('FUNC_CAN_EDIT_MEDIC', False) )
    ) ;;
  FIsSelect := False;
  UpdateActions;
  v_is_Mouse_Right_Click:=False;
//  fmainform.CheckOnMaximize(TForm(self));
//  if not IsModal then
//    fmainform.FormStorageRestorePlacement(FormStorage, TForm(self));
//  CurMo := Round(dmMain.pkgMedSes.getcurmo);
//  if CurMo = -1 then Application.MessageBox('Не выбран материально ответственный!', 'Внимание', mb_iconwarning + mb_ok);
//  if CurMo > -1 then odsMedicLst.SetVariable('MOID',CurMo);
  FShowCount := 0;
  odsSostMedics.Open;
//  odsMedicsList.Open;
//  odsSostMedics.Open;
  try
    odsUchgr.Close;
    odsUchgr.Open;
  except
  end;

  cxGrid1DBTableView1.FilterRow.Visible := dmMain.ConfigParams.GetParamValue('FUNC_SHOW_FILTERROW', '0') = '1';

  cxGrid1DBTableView1FL_VISIBLE_FOR_NOT_APTEKA.VisibleForCustomization := (dmMain.ConfigParams.GetParamValue('FUNC_MEDIC_VISIBLE_FOR_NOT_APTEKA', 0) = 1);

  fShowFullUchGrName := ( dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_SHOW_FULL_UCHGR_NAME', '0') = '1' );

  if (fShowFullUchGrName) then
    TcxLookupComboBoxProperties(cxGrid1DBTableView1FC_UCHNAME.Properties).ListColumns.Items[0].FieldName := 'FC_FULL_UCHGR_NAME'
  else
    TcxLookupComboBoxProperties(cxGrid1DBTableView1FC_UCHNAME.Properties).ListColumns.Items[0].FieldName := 'FC_UCHGR';


  if (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_QUOTA_CODE', 0) = 0) then
  begin
    cxGrid1DBTableView1FC_QUOTA_CODE_34.Visible := False;
    cxGrid1DBTableView1FC_QUOTA_CODE_34.VisibleForCustomization := False;

    TcxLookupComboBoxProperties(cxGrid1DBTableView1FC_UCHNAME.Properties).ListColumns.Delete(1);
//    TcxLookupComboBoxProperties(cxGrid1DBTableView1FC_UCHNAME.Properties).ListFieldNames := 'FC_UCHGR';
  end;

  if (dmMain.ConfigParams.GetParamValue('FUNC_USE_JNVLS', 0) = 0) then
  begin
    cxGrid1DBTableView1FL_JNVLS.Visible := False;
    cxGrid1DBTableView1FL_JNVLS.VisibleForCustomization := False;
  end;       

  if (dmMain.ConfigParams.GetParamValue('FUNC_USE_OKDP', 0) = 0) then
  begin
    cxGrid1DBTableView1FC_OKDP.Visible := False;
    cxGrid1DBTableView1FC_OKDP.VisibleForCustomization := False;
  end;

  if (dmMain.ConfigParams.GetParamValue('FUNC_USE_MIBP', 0) = 0) then
  begin
    cxGrid1DBTableView1FL_MIBP.Visible := False;
    cxGrid1DBTableView1FL_MIBP.VisibleForCustomization := False;
  end;          

  if (dmMain.ConfigParams.GetParamValue('FUNC_USE_FORM_KOMISS', 0) = 0) then
  begin
    cxGrid1DBTableView1FL_FORM_KOMISS.Visible := False;
    cxGrid1DBTableView1FL_FORM_KOMISS.VisibleForCustomization := False;
  end;             

  if (dmMain.ConfigParams.GetParamValue('FUNC_USE_FORMULAR', 0) = 0) then
  begin
    cxGrid1DBTableView1FL_FORMULAR.Visible := False;
    cxGrid1DBTableView1FL_FORMULAR.VisibleForCustomization := False;
  end;

  if (dmMain.ConfigParams.GetParamValue('FUNC_USE_CLASS', 0) = 0) then
  begin
    cxGrid1DBTableView1FC_CLASS.Visible := False;
    cxGrid1DBTableView1FC_CLASS.VisibleForCustomization := False;
  end;

  if (dmMain.ConfigParams.GetParamValue('FUNC_USE_VRACH_KOMISS', 0) = 0) then
  begin
    cxGrid1DBTableView1FL_VRACH_KOMISS.Visible := False;
    cxGrid1DBTableView1FL_VRACH_KOMISS.VisibleForCustomization := False;
  end;

  cxGrid1DBTableView1FL_FORMULAR.Options.Editing := (dmMain.ConfigParams.GetParamValue('FUNC_CAN_EDIT_FORMULAR', False));
//  cxGrid1DBTableView1FL_FORM_KOMISS.Options.Editing := (dmMain.ConfigParams.GetParamValue('FUNC_USE_FORM_KOMISS', 0) = 1);

  SKLAD_SYNONIM := '';
  if dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1 then
  begin
    dmMain.odsSklad.First;
    while (not dmMain.odsSklad.Eof)and( dmMain.odsSklad.FieldByName('FK_ID').AsInteger <>odsMedicsList.GetVariable('PFK_SKLAD_ID') ) do
      dmMain.odsSklad.Next;
    if (not dmMain.odsSklad.Eof) then SKLAD_SYNONIM := dmMain.odsSklad.FieldByName('FC_SYNONIM').AsString;
  end;

  cxGrid1DBTableView1FC_PROD.Visible := (dmMain.ConfigParams.GetParamValue('FUNC_USE_MEDICPRODCERT',0) = 1);
  cxGrid1DBTableView1FC_CERT.Visible := (dmMain.ConfigParams.GetParamValue('FUNC_USE_MEDICPRODCERT',0) = 1);

  cxGrid2DBTableView1FL_TARA.Visible := (dmMain.ConfigParams.GetParamValue('FUNC_USE_TARA_IN_RPO',0) = 1);  
  // подгоняем внешний вид таблицы под склад Воронов О.А. 10.02.2009
  if (dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1)and(SKLAD_SYNONIM = cSKLAD_SYNONIM_IMN) then
  begin
    cxGrid1DBTableView1FC_NAME_LAT.VisibleForCustomization := False;
    cxGrid1DBTableView1FC_NAME_LAT.Visible := False;
    cxGrid1DBTableView1FC_FARMNAME.VisibleForCustomization := False;
    cxGrid1DBTableView1FC_FARMNAME.Visible := False;
    cxGrid1DBTableView1FN_MASS.Visible := False;
    cxGrid1DBTableView1FN_MASS.VisibleForCustomization := False;
    cxGrid1DBTableView1FC_MASSUNITS.VisibleForCustomization := False;
    cxGrid1DBTableView1FC_MASSUNITS.Visible := False;
    cxGrid1DBTableView1FC_SPECIALMEDIC.VisibleForCustomization := False;
    cxGrid1DBTableView1FC_SPECIALMEDIC.Visible := False;
    cxGrid1DBTableView1FC_LGOTA.VisibleForCustomization := False;
    cxGrid1DBTableView1FC_LGOTA.Visible := False;
    cxGrid1DBTableView1FL_PRINT_LAT_NAME.Visible := False;
    cxGrid1DBTableView1FL_PRINT_LAT_NAME.VisibleForCustomization := False;
    cxGrid1DBTableView1FC_SOST.VisibleForCustomization := False;
    cxGrid1DBTableView1FC_SOST.Visible := False;
    cxGrid1DBTableView1FL_VISIBLE_FOR_NOT_APTEKA.Visible := False;
    cxGrid1DBTableView1FL_VISIBLE_FOR_NOT_APTEKA.VisibleForCustomization := False;
    cxGrid1DBTableView1FC_PREP.Visible := False;
    cxGrid1DBTableView1FC_PREP.VisibleForCustomization := False;

//    cxGrid1DBTableView1FL_EQUIPMENT.Visible := True;
    cxGrid1DBTableView1FL_EQUIPMENT.VisibleForCustomization := True;
  end
  else
  begin
    cxGrid1DBTableView1FC_NAME_LAT.VisibleForCustomization := True;
//    cxGrid1DBTableView1FC_NAME_LAT.Visible := True;
    cxGrid1DBTableView1FC_FARMNAME.VisibleForCustomization := True;
//    cxGrid1DBTableView1FC_FARMNAME.Visible := True;
//    cxGrid1DBTableView1FN_MASS.Visible := True;
    cxGrid1DBTableView1FN_MASS.VisibleForCustomization := True;
    cxGrid1DBTableView1FC_MASSUNITS.VisibleForCustomization := True;
//    cxGrid1DBTableView1FC_MASSUNITS.Visible := False;
    cxGrid1DBTableView1FC_SPECIALMEDIC.VisibleForCustomization := True;
//    cxGrid1DBTableView1FC_SPECIALMEDIC.Visible := False;
    cxGrid1DBTableView1FC_LGOTA.VisibleForCustomization := True;
    cxGrid1DBTableView1FC_LGOTA.Visible := False;
//    cxGrid1DBTableView1FL_PRINT_LAT_NAME.Visible := False;
    cxGrid1DBTableView1FL_PRINT_LAT_NAME.VisibleForCustomization := True;
    cxGrid1DBTableView1FC_SOST.VisibleForCustomization := True;
//    cxGrid1DBTableView1FC_SOST.Visible := False;
    cxGrid1DBTableView1FL_VISIBLE_FOR_NOT_APTEKA.Visible := False;
    cxGrid1DBTableView1FL_VISIBLE_FOR_NOT_APTEKA.VisibleForCustomization := (dmMain.ConfigParams.GetParamValue('FUNC_MEDIC_VISIBLE_FOR_NOT_APTEKA', 0) = 1);
    cxGrid1DBTableView1FC_PREP.Visible := False;
    cxGrid1DBTableView1FC_PREP.VisibleForCustomization := True;

    cxGrid1DBTableView1FL_EQUIPMENT.Visible := False;
    cxGrid1DBTableView1FL_EQUIPMENT.VisibleForCustomization := False;
    if (dmMain.ConfigParams.GetParamValue('FUNC_USE_GROUP_LF', 0) = 1) then
      cxGrid1DBTableView1FK_GROUP_LF.VisibleForCustomization := True
    else
      cxGrid1DBTableView1FK_GROUP_LF.Visible := False;
  end;

// загружаем настройки видимости столбцов
//  n := cxDBTreeList1.ColumnCount-1;
//  for i := 0 to n do
//    cxDBTreeList1.Columns[i].Visible := (UpperCase(IniReadString(iniFileName, Self.Name, cxDBTreeList1.Columns[i].Name, BoolToStr(cxDBTreeList1.Columns[i].Visible, True))) = 'TRUE');
end;

procedure TfrmMedic.FormClose(Sender: TObject; var Action: TCloseAction);
//var
//  i, n : Integer;
begin
// сохраняем настройки видимости столбцов
//  n := cxDBTreeList1.ColumnCount-1;
//  for i := 0 to n do
//    IniWriteString(iniFileName, Self.Name, cxDBTreeList1.Columns[i].Name, BoolToStr(cxDBTreeList1.Columns[i].Visible, True)); // сохраняем в виде слов True и False

  frmMain.tbAssortiment.ImageIndex := 51;
  action := caFree;
end;

function TfrmMedic.FormHelp(Command: Word; Data: Integer;
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

procedure TfrmMedic.N2Click(Sender: TObject);
begin
//  odsMedicLst.SetVariable('MEDIC_FROM_VRACH', TMenuItem(Sender).Tag);
  odsMedicsList.SetVariable('MEDIC_FROM_VRACH', TMenuItem(Sender).Tag);
  acRefresh.Execute;
end;

procedure TfrmMedic.acUchGrChangesListExecute(Sender: TObject);
begin
  // Изменения учетной группы
  frmUchGrpsChanges := TFrmUchGrpsChanges.Create( Self);
  try
    frmUchGrpsChanges.MedicId := odsMedicsList.FieldByName('MEDICID').AsInteger;
    frmUchGrpsChanges.Caption := frmUchGrpsChanges.Caption + ' для "'+ odsMedicsList.FieldByName('FC_NAME').AsString + '"';
    frmUchGrpsChanges.ShowModal;
  finally
    frmUchGrpsChanges.Free;
  end;
end;

// здесь обновляются состояния всех экшенов
procedure TfrmMedic.alUpdate(Action: TBasicAction; var Handled: Boolean);
var
  bCanEdit, bActive, bSelected : Boolean;
begin
  bCanEdit := (FIsCanEdit);
  bActive := Assigned ( cxGrid1DBTableView1.DataController.DataSet ) and ( cxGrid1DBTableView1.DataController.DataSet.Active ) ;
  bSelected := (bActive) and (not cxGrid1DBTableView1.DataController.DataSet.IsEmpty) and (cxGrid1DBTableView1.Controller.FocusedRow <> nil);

  acAdd.Visible := FIsAddEditDelVisible; // для кнопки "Добавить" не использовать схему с правами доступа(желание пользователя %) )
  acAdd.Enabled := FIsAddEditDelVisible and bActive;

  acEdit.Visible := bCanEdit;
  acEdit.Enabled := bCanEdit and bSelected;

  acDel.Visible := bCanEdit ;
  acDel.Enabled := bCanEdit and bSelected;

  acHide.Visible := bCanEdit;
  acHide.Enabled := (bCanEdit) and (bSelected) and (not cbShowHidden.Checked);

  acShow.Visible := bCanEdit;
  acShow.Enabled := (bCanEdit) and (bSelected) and (cbShowHidden.Checked);

  paVisible.Visible := FIsAddEditDelVisible;

  acSetUchGr.Visible := bCanEdit;
  acSetUchGr.Enabled := bCanEdit and bSelected;

  acUchGrChangesList.Visible := ( dmMain.ConfigParams.GetParamValue('FUNC_USE_MEDUCHGRP_CH', 0) = '1' );
  acUchGrChangesList.Enabled := (acUchGrChangesList.Visible) and (bSelected) and ( cxGrid1DBTableView1.Controller.SelectedRecordCount = 1 );

  ToolButton7.Visible := acAdd.Visible or acEdit.Visible or acHide.Visible ;

  acSelect.Visible    := FIsSelect;
  acSelect.Enabled    := FIsSelect and bSelected;
  ToolButton9.Visible := acSelect.Visible;
end;

procedure TfrmMedic.odsMedicsListAfterScroll(DataSet: TDataSet);
var
  n : Integer;
begin
  n := odsMedicsList.FieldByName('FN_SostMedCount').AsInteger;

  // обновляем запрос с составными медикаментами только тогда, когда они есть
  odsSostMedics.Close;
  if n > 0 then
  begin
    odsSostMedics.SetVariable('FK_MEDIC', odsMedicsList.FieldByName('MEDICID').AsInteger);
    odsSostMedics.Open;
  end
  else
    odsSostMedics.SetVariable('FK_MEDIC', -1);

  cxGrid2.Visible := (n > 0);
  cxSplitter1.Visible := (n > 0);
  if cxGrid2.Visible then
    cxGrid2.Height := cxGrid2DBTableView1.OptionsView.HeaderHeight + (cxGrid2DBTableView1.OptionsView.DataRowHeight + 1) * n;
end;

procedure TfrmMedic.odsMedicsListApplyRecord(Sender: TOracleDataSet; Action: Char; var Applied: Boolean; var NewRowId: string);
begin
  Applied := True;
end;

procedure TfrmMedic.odsMedicsListBeforePost(DataSet: TDataSet);
begin
  odsMedicsList.AfterScroll := nil;
end;

procedure TfrmMedic.odsMedicsListAfterOpen(DataSet: TDataSet);
begin
  if FIsShtrihCodeInput then cxGrid1DBTableView1FC_EANCODE.Selected := True;
end;

procedure TfrmMedic.odsMedicsListAfterPost(DataSet: TDataSet);
begin
  odsMedicsList.AfterScroll := odsMedicsListAfterScroll;
  odsMedicsListAfterScroll(nil);
end;

procedure TfrmMedic.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  if acSelect.Enabled then
    acSelect.Execute;
//  else
//    acEdit.Execute;
//  if (nID = 0) and acEdit.Enabled then
//
//  else
end;      

procedure TfrmMedic.cxGrid1DBTableView1FC_UCHNAMEPropertiesEditValueChanged(Sender: TObject);
begin
  if (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_QUOTA_CODE', 0) = 1) then
  begin
    cxGrid1DBTableView1.DataController.PostEditingData;
    if odsUchGr.Locate('uchgrid', cxGrid1DBTableView1FC_UCHNAME.EditValue, []) then
      dmMain.oqSetQUOTA_UchGr.SetVariable('FC_QUOTA_CODE_2', nvl(odsUchGr.FieldByName('FC_QUOTA_CODE_2').AsVariant,'00'))
  else
    dmMain.oqSetQUOTA_UchGr.SetVariable('FC_QUOTA_CODE_2', '00');
//      cxGrid1DBTableView1FC_QUOTA_CODE_234.EditValue := nvl(dmMain.odsUchGr.FieldByName('FC_QUOTA_CODE_2').AsString,'00') + Copy(nvl(cxGrid1DBTableView1FC_QUOTA_CODE_234.EditValue,'000000'), 3,4);

    if Application.MessageBox(PAnsiChar('Обновить коды квот во всех партиях по медикаменту "'+string(cxGrid1DBTableView1FC_NAME.EditValue)+'"?'), 'Внимание', MB_YESNO+MB_ICONQUESTION ) = IDYES then
    begin
      dmMain.oqSetQUOTA_UchGr.SetVariable('MEDICID', cxGrid1DBTableView1MEDICID.EditValue);
      dmMain.oqSetQUOTA_UchGr.SetVariable('FC_QUOTA_CODE_34', cxGrid1DBTableView1FC_QUOTA_CODE_34.EditValue);
      dmMain.oqSetQUOTA_UchGr.Execute;

      ShowMessage(#13#10'Код квоты был успешно обновлен.'#13#10'Обновлено партий: '+IntToStr(dmMain.oqSetQUOTA_UchGr.GetVariable('FN_TKART_UCHGR')));
    end;
    dmMain.os.Commit;
  end;
end;

procedure TfrmMedic.cxGrid1DBTableView1FL_FORMULARPropertiesChange(
  Sender: TObject);
var v_FL_FORMULAR, v_FL_FORM_KOMISS : Integer;
    v_OracleQuery : TOracleQuery;
begin //
  if true then // not cxGrid1DBTableView1.OptionsData.Editing then
  begin
    v_FL_FORM_KOMISS := myvartoint(cxGrid1DBTableView1FL_FORM_KOMISS.EditValue);
    v_FL_FORMULAR := myvartoint(cxGrid1DBTableView1FL_FORMULAR.EditValue);
    if (v_FL_FORM_KOMISS=0) or (v_FL_FORMULAR=1) then
    begin
      v_OracleQuery := TOracleQuery.Create(nil);
      try
        v_OracleQuery.Session := dmMain.os;
        v_OracleQuery.SQL.Text := 'update MED.TMEDIC set FL_FORMULAR=:p_FL_FORMULAR where MEDICID=:p_MEDICID';
        v_OracleQuery.DeclareVariable('p_FL_FORMULAR',otInteger);
        v_OracleQuery.SetVariable('p_FL_FORMULAR',1-v_FL_FORMULAR);
        v_OracleQuery.DeclareVariable('p_MEDICID',otInteger);
        v_OracleQuery.SetVariable('p_MEDICID',odsMedicsList.FieldByName('MEDICID').AsInteger);
        v_OracleQuery.Execute;
        v_OracleQuery.Session.Commit;
      finally
        v_OracleQuery.Free;
      end;
    end else begin
      cxGrid1DBTableView1FL_FORMULAR.EditValue:=0;
    end;
  end;
end;

procedure TfrmMedic.cxGrid1DBTableView1FL_FORM_KOMISSPropertiesChange(
  Sender: TObject);
var v_FL_FORMULAR, v_FL_FORM_KOMISS : Integer;
    v_OracleQuery : TOracleQuery;
begin  //
  if true then // not cxGrid1DBTableView1.OptionsData.Editing then
  begin
    v_FL_FORM_KOMISS := myvartoint(cxGrid1DBTableView1FL_FORM_KOMISS.EditValue);
    v_FL_FORMULAR := myvartoint(cxGrid1DBTableView1FL_FORMULAR.EditValue);
    if (v_FL_FORM_KOMISS=1) or (v_FL_FORMULAR=0) then
    begin
      v_OracleQuery := TOracleQuery.Create(nil);
      try
        v_OracleQuery.Session := dmMain.os;
        v_OracleQuery.SQL.Text := 'update MED.TMEDIC set FL_FORM_KOMISS=:p_FL_FORM_KOMISS where MEDICID=:p_MEDICID';
        v_OracleQuery.DeclareVariable('p_FL_FORM_KOMISS',otInteger);
        v_OracleQuery.SetVariable('p_FL_FORM_KOMISS',1-v_FL_FORM_KOMISS);
        v_OracleQuery.DeclareVariable('p_MEDICID',otInteger);
        v_OracleQuery.SetVariable('p_MEDICID',odsMedicsList.FieldByName('MEDICID').AsInteger);
        v_OracleQuery.Execute;
        v_OracleQuery.Session.Commit;
      finally
        v_OracleQuery.Free;
      end;
    end else
    begin
      cxGrid1DBTableView1FL_FORM_KOMISS.EditValue:=0;
    end;
  end;
end;

procedure TfrmMedic.cbShowHiddenClick(Sender: TObject);
begin
  if cbShowHidden.Checked then
  begin
    tbtVisible.Action := acShow;
    odsMedicsList.SetVariable('pVisible',0);
  end
  else
  begin          
    tbtVisible.Action := acHide;
    odsMedicsList.SetVariable('pVisible',1);
  end;

  acRefreshExecute(nil);
end;

procedure TfrmMedic.cxGrid1DBTableView1CellClick( Sender: TcxCustomGridTableView;
                                                  ACellViewInfo: TcxGridTableDataCellViewInfo;
                                                  AButton: TMouseButton;
                                                  AShift: TShiftState;
                                                  var AHandled: Boolean);
var
  i, Last : Integer;
  Value , v_FL_FORMULAR, v_FL_FORM_KOMISS : Integer;
  v_OracleQuery : TOracleQuery;
  P : TPoint;
begin
  if not v_is_Mouse_Right_Click then
  try
    v_FL_FORM_KOMISS := myvartoint(cxGrid1DBTableView1FL_FORM_KOMISS.EditValue);
    v_FL_FORMULAR := myvartoint(cxGrid1DBTableView1FL_FORMULAR.EditValue);
    v_is_Mouse_Right_Click:=True;
    if (ACellViewInfo.Item.Index = cxGrid1DBTableView1FL_PRINT_LAT_NAME.Index)and(AButton = mbRight) and (FIsCanEdit) then
    begin
      Value := (odsMedicsList.FieldByName('FL_PRINT_LAT_NAME').AsInteger + 1) mod 2; // делаем toggle
      odsMedicsList.DisableControls; // с этим работает гораздо быстрее !!
      odsMedicsList.AfterScroll := nil;
      Last := cxGrid1DBTableView1.Controller.SelectedRecordCount-1;
      for i := 0 to Last do
      begin
        odsMedicsList.Locate('MEDICID', cxGrid1DBTableView1.Controller.SelectedRows[i].Values[ cxGrid1DBTableView1MEDICID.Index ], []);
        odsMedicsList.Edit;
        odsMedicsList.FieldByName('FL_PRINT_LAT_NAME').AsInteger := Value;
        odsMedicsList.Post;
        //
        v_OracleQuery := TOracleQuery.Create(nil);
        try
          v_OracleQuery.Session := dmMain.os;
          v_OracleQuery.SQL.Text := 'update MED.TMEDIC set FL_PRINT_LAT_NAME=:p_FL_PRINT_LAT_NAME where MEDICID=:p_MEDICID';
          v_OracleQuery.DeclareVariable('p_FL_PRINT_LAT_NAME',otInteger);
          v_OracleQuery.SetVariable('p_FL_PRINT_LAT_NAME',Value);
          v_OracleQuery.DeclareVariable('p_MEDICID',otInteger);
          v_OracleQuery.SetVariable('p_MEDICID',odsMedicsList.FieldByName('MEDICID').AsInteger);
          v_OracleQuery.Execute;
          v_OracleQuery.Session.Commit;
        finally
          v_OracleQuery.Free;
        end;
        //
      end;
      odsMedicsList.EnableControls;
      odsMedicsList.AfterScroll := odsMedicsListAfterScroll;
      odsMedicsList.Session.Commit;
    //  odsMedicsListAfterScroll( odsMedicsList );
    end else
    if (ACellViewInfo.Item.Index = cxGrid1DBTableView1FL_VISIBLE_FOR_NOT_APTEKA.Index)and(AButton = mbRight) and (FIsCanEdit) then
    begin
      Value := (odsMedicsList.FieldByName('FL_VISIBLE_FOR_NOT_APTEKA').AsInteger + 1) mod 2; // делаем toggle
      Last := cxGrid1DBTableView1.Controller.SelectedRecordCount-1;
      odsMedicsList.DisableControls; // с этим работает гораздо быстрее !!
      odsMedicsList.AfterScroll := nil;
      for i := 0 to Last do
      begin
        odsMedicsList.Locate('MEDICID', cxGrid1DBTableView1.Controller.SelectedRows[i].Values[ cxGrid1DBTableView1MEDICID.Index ], []);
        odsMedicsList.Edit;
        odsMedicsList.FieldByName('FL_VISIBLE_FOR_NOT_APTEKA').AsInteger := Value;
        odsMedicsList.Post;
        //
        v_OracleQuery := TOracleQuery.Create(nil);
        try
          v_OracleQuery.Session := dmMain.os;
          v_OracleQuery.SQL.Text := 'update MED.TMEDIC set FL_VISIBLE_FOR_NOT_APTEKA=:p_FL_VISIBLE_FOR_NOT_APTEKA where MEDICID=:p_MEDICID';
          v_OracleQuery.DeclareVariable('p_FL_VISIBLE_FOR_NOT_APTEKA',otInteger);
          v_OracleQuery.SetVariable('p_FL_VISIBLE_FOR_NOT_APTEKA',Value);
          v_OracleQuery.DeclareVariable('p_MEDICID',otInteger);
          v_OracleQuery.SetVariable('p_MEDICID',odsMedicsList.FieldByName('MEDICID').AsInteger);
          v_OracleQuery.Execute;
          v_OracleQuery.Session.Commit;
        finally
          v_OracleQuery.Free;
        end;
        //
      end;
      odsMedicsList.EnableControls;
      odsMedicsList.AfterScroll := odsMedicsListAfterScroll;
      odsMedicsList.Session.Commit;
      odsMedicsListAfterScroll( odsMedicsList );
    end else
    if (ACellViewInfo.Item.Index = cxGrid1DBTableView1FL_EQUIPMENT.Index)and(AButton = mbRight) and (FIsCanEdit) then
    begin
      Value := (odsMedicsList.FieldByName('FL_EQUIPMENT').AsInteger + 1) mod 2; // делаем toggle
      Last := cxGrid1DBTableView1.Controller.SelectedRecordCount-1;
      odsMedicsList.DisableControls; // с этим работает гораздо быстрее !!
      odsMedicsList.AfterScroll := nil;
      for i := 0 to Last do
      begin
        odsMedicsList.Locate('MEDICID', cxGrid1DBTableView1.Controller.SelectedRows[i].Values[ cxGrid1DBTableView1MEDICID.Index ], []);
        odsMedicsList.Edit;
        odsMedicsList.FieldByName('FL_EQUIPMENT').AsInteger := Value;
        odsMedicsList.Post;
        //
        v_OracleQuery := TOracleQuery.Create(nil);
        try
          v_OracleQuery.Session := dmMain.os;
          v_OracleQuery.SQL.Text := 'update MED.TMEDIC set FL_EQUIPMENT=:p_FL_EQUIPMENT where MEDICID=:p_MEDICID';
          v_OracleQuery.DeclareVariable('p_FL_EQUIPMENT',otInteger);
          v_OracleQuery.SetVariable('p_FL_EQUIPMENT',Value);
          v_OracleQuery.DeclareVariable('p_MEDICID',otInteger);
          v_OracleQuery.SetVariable('p_MEDICID',odsMedicsList.FieldByName('MEDICID').AsInteger);
          v_OracleQuery.Execute;
          v_OracleQuery.Session.Commit;
        finally
          v_OracleQuery.Free;
        end;
        //
      end;
      odsMedicsList.EnableControls;
      odsMedicsList.AfterScroll := odsMedicsListAfterScroll;
      odsMedicsList.Session.Commit;
      odsMedicsListAfterScroll( odsMedicsList );
    end else

    if (dmMain.ConfigParams.GetParamValue('FUNC_USE_MIBP', 0) = 1) and
      (ACellViewInfo.Item.Index = cxGrid1DBTableView1FL_MIBP.Index) and // флаг МИБП
      (AButton = mbRight) and (FIsCanEdit) then
    begin
      odsMedicsList.DisableControls; // с этим работает гораздо быстрее !!
      odsMedicsList.AfterScroll := nil;
      odsMedicsList.Edit;

      if fdmMain.nvl( odsMedicsList.FieldByName( 'FL_MIBP' ).Value,0) = 0 then
        odsMedicsList.FieldByName( 'FL_MIBP' ).Value := 1
      else
        odsMedicsList.FieldByName( 'FL_MIBP' ).Value := 0;

      odsMedicsList.Post;

      v_OracleQuery := TOracleQuery.Create(nil);
      try
        v_OracleQuery.Session := dmMain.os;
        v_OracleQuery.SQL.Text := 'update MED.TMEDIC set FL_MIBP=:p_FL_MIBP where MEDICID=:p_MEDICID';
        v_OracleQuery.DeclareAndSet ('p_FL_MIBP',otInteger, odsMedicsList.FieldByName( 'FL_MIBP' ).AsInteger);
        v_OracleQuery.DeclareAndSet ('p_MEDICID',otInteger, odsMedicsList.FieldByName('MEDICID').AsInteger);
        v_OracleQuery.Execute;
        v_OracleQuery.Session.Commit;
      finally
        v_OracleQuery.Free;
      end;

      odsMedicsList.EnableControls;
      odsMedicsList.AfterScroll := odsMedicsListAfterScroll;
      odsMedicsList.Session.Commit;
      odsMedicsListAfterScroll( odsMedicsList );
    end else
    if (dmMain.ConfigParams.GetParamValue('FUNC_USE_FORM_KOMISS', 0) = 1) and
       (ACellViewInfo.Item.Index = cxGrid1DBTableView1FL_FORM_KOMISS.Index) and
       ( (v_FL_FORM_KOMISS=1) or (v_FL_FORMULAR=0) ) and(AButton = mbRight) and (FIsCanEdit)
    then // флаг Формулярная комиссия
    begin
      v_FL_FORM_KOMISS:=1-v_FL_FORM_KOMISS;
      odsMedicsList.DisableControls; // с этим работает гораздо быстрее !!
      odsMedicsList.AfterScroll := nil;
      odsMedicsList.Edit;
      odsMedicsList.FieldByName('FL_FORM_KOMISS').AsInteger:=v_FL_FORM_KOMISS;
      odsMedicsList.Post;
      cxGrid1DBTableView1FL_FORM_KOMISS.EditValue := v_FL_FORM_KOMISS;
      //
      v_OracleQuery := TOracleQuery.Create(nil);
      try
        v_OracleQuery.Session := dmMain.os;
        v_OracleQuery.SQL.Text := 'update MED.TMEDIC set FL_FORM_KOMISS=:p_FL_FORM_KOMISS where MEDICID=:p_MEDICID';
        v_OracleQuery.DeclareVariable('p_FL_FORM_KOMISS',otInteger);
        v_OracleQuery.SetVariable('p_FL_FORM_KOMISS',v_FL_FORM_KOMISS);
        v_OracleQuery.DeclareVariable('p_MEDICID',otInteger);
        v_OracleQuery.SetVariable('p_MEDICID',odsMedicsList.FieldByName('MEDICID').AsInteger);
        v_OracleQuery.Execute;
        v_OracleQuery.Session.Commit;
      finally
        v_OracleQuery.Free;
      end;
      odsMedicsList.EnableControls;
      odsMedicsList.AfterScroll := odsMedicsListAfterScroll;
      odsMedicsList.Session.Commit;
      odsMedicsListAfterScroll( odsMedicsList );
    end else
    if (dmMain.ConfigParams.GetParamValue('FUNC_USE_FORMULAR', 0) = 1) and
       (ACellViewInfo.Item.Index = cxGrid1DBTableView1FL_FORMULAR.Index) and
       ( (v_FL_FORM_KOMISS=0) or (v_FL_FORMULAR=1) ) and(AButton = mbRight) and (FIsCanEdit)
     {and (dmMain.ConfigParams.GetParamValue('FUNC_CAN_EDIT_FORMULAR', False)) }
    then // флаг Формуляр
    begin
      v_FL_FORMULAR:=1-v_FL_FORMULAR;
      odsMedicsList.DisableControls; // с этим работает гораздо быстрее !!
      odsMedicsList.AfterScroll := nil;
      odsMedicsList.Edit;
      odsMedicsList.FieldByName('FL_FORMULAR').AsInteger:=v_FL_FORMULAR;
      odsMedicsList.Post;
      cxGrid1DBTableView1FL_FORMULAR.EditValue := v_FL_FORMULAR;
      //
      v_OracleQuery := TOracleQuery.Create(nil);
      try
        v_OracleQuery.Session := dmMain.os;
        v_OracleQuery.SQL.Text := 'update MED.TMEDIC set FL_FORMULAR=:p_FL_FORMULAR where MEDICID=:p_MEDICID';
        v_OracleQuery.DeclareVariable('p_FL_FORMULAR',otInteger);
        v_OracleQuery.SetVariable('p_FL_FORMULAR',v_FL_FORMULAR);
        v_OracleQuery.DeclareVariable('p_MEDICID',otInteger);
        v_OracleQuery.SetVariable('p_MEDICID',odsMedicsList.FieldByName('MEDICID').AsInteger);
        v_OracleQuery.Execute;
        v_OracleQuery.Session.Commit;
      finally
        v_OracleQuery.Free;
      end;
      //
      odsMedicsList.EnableControls;
      odsMedicsList.AfterScroll := odsMedicsListAfterScroll;
      odsMedicsList.Session.Commit;
      odsMedicsListAfterScroll( odsMedicsList );
    end
    else
    if (dmMain.ConfigParams.GetParamValue('FUNC_USE_VRACH_KOMISS', 0) = 1) and
       (ACellViewInfo.Item.Index = cxGrid1DBTableView1FL_VRACH_KOMISS.Index) and
       (AButton = mbRight) and (FIsCanEdit) then
    begin
      try
        odsMedicsList.DisableControls; // с этим работает гораздо быстрее !!
        odsMedicsList.AfterScroll := nil;
        odsMedicsList.Edit;
        odsMedicsList.FieldByName('FL_VRACH_KOMISS').AsInteger:= 1 - odsMedicsList.FieldByName('FL_VRACH_KOMISS').AsInteger;
        odsMedicsList.Post;
        cxGrid1DBTableView1FL_VRACH_KOMISS.EditValue := odsMedicsList.FieldByName('FL_VRACH_KOMISS').AsInteger;

        dmMain.InitAdditionalUpdateTable('MED.TMEDIC');
        dmMain.AddAdditionalUpdateTable('FL_VRACH_KOMISS', otInteger, odsMedicsList.FieldByName('FL_VRACH_KOMISS').AsInteger );
        dmMain.ExecuteAdditionalUpdateTable('MEDICID', otInteger, odsMedicsList.FieldByName('MEDICID').AsInteger );
        dmMain.os.Commit;
      finally
        odsMedicsList.EnableControls;
        odsMedicsList.AfterScroll := odsMedicsListAfterScroll;
        odsMedicsList.Session.Commit;
        odsMedicsListAfterScroll( odsMedicsList );
      end;
    end
    else
    if (AButton = mbRight) then
    begin
        GetCursorPos( P );
        pmGrid.Popup(P.X, P.Y);
    end;    
  finally
    v_is_Mouse_Right_Click:=False;
  end;
end;

procedure TfrmMedic.cxGrid1DBTableView1CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if dmMain.ConfigParams.GetParamValue('FUNC_USE_CLASS', 0) = 1 then
  begin
    if AViewInfo.GridRecord.Values[ cxGrid1DBTableView1FC_CLASS.Index ] = '2а' then
      ACanvas.Brush.Color := $7fff00
    else if AViewInfo.GridRecord.Values[ cxGrid1DBTableView1FC_CLASS.Index ] = '2б' then
      ACanvas.Brush.Color := $03c03c
    else if AViewInfo.GridRecord.Values[ cxGrid1DBTableView1FC_CLASS.Index ] = '3' then
      ACanvas.Brush.Color := $3300ff;
  end;
end;

procedure TfrmMedic.acExportToExcelExecute(Sender: TObject);
begin
  if sd.Execute then
  begin
    ExportGridToExcel(sd.FileName,cxGrid1);
    if Application.MessageBox('Открыть сохраненный документ?', 'Подтверждение', MB_YESNO+MB_ICONQUESTION) = IDYES	then
      ShellExecute( 0, PChar('open'), PChar(sd.FileName), nil, nil, SW_SHOWMAXIMIZED );
  end;
end;

procedure TfrmMedic.acHideExecute(Sender: TObject);
var
   i: Integer;
   pMedicid: Integer;
begin
  if windows.MessageBoxEx(Handle, PChar('Вы действительно хотите скрыть ' + IntToStr(cxGrid1DBTableView1.DataController.GetSelectedCount) + ' объект(ов) учета?'), 'Подтвердите действие', MB_YESNO + MB_ICONQUESTION,$0419 {Russian}) = mrYes then begin
    odsMedicsList.DisableControls;
    for i := 0 to cxGrid1DBTableView1.DataController.GetSelectedCount - 1 do
    begin
      pMedicid := cxGrid1DBTableView1.DataController.Controller.SelectedRecords[I].Values[cxGrid1DBTableView1MEDICID.Index];

      try
        odsMedicsList.Locate('medicid', pMedicid,[]);
        dmMain.pkgMedic.DOINVISIBLE(pMedicid);
      except
        on E: Exception do
        begin
          MessageBox(Handle, PChar('При скрытии объекта учёта - '+ odsMedicsList.FieldByName('fc_name').AsString + ', возникла ошибка.' + #10#13 +
                         'Обратитесь к системному администратору'), 'Ошибка', MB_ICONERROR or MB_OK);

          if (i <> cxGrid1DBTableView1.DataController.GetSelectedCount - 1)
             and (MessageBox(Handle, PChar('Продолжить скрытие следующих объектов учета?'), 'Вопрос', MB_ICONQUESTION + MB_YESNO) = IDNO) then
          begin
            Break;
          end;
        end;
      end;
    end;
    odsMedicsList.EnableControls;
    acRefresh.Execute;
  end;
end;

procedure TfrmMedic.FormActivate(Sender: TObject);
begin
  if dmMain.ConfigParams.GetParamValue('FUNC_MEDIC_VISIBLE_FOR_NOT_APTEKA', 0) = 0 then
    cxGrid1DBTableView1FL_VISIBLE_FOR_NOT_APTEKA.Visible := False;

  if dmMain.ConfigParams.GetParamValue('FUNC_SHOW_QUOTA_CODE', 0) = 0 then
    cxGrid1DBTableView1FC_QUOTA_CODE_34.Visible := False;

  cxGrid1DBTableView1.RestoreFromIniFile(medlst_ini, True, False, [gsoUseFilter]);

  cxGrid1DBTableView1FL_CHECK.Visible := cxGrid1DBTableView1FL_CHECK.VisibleForCustomization;

  cxGrid1DBTableView1FK_SKLAD_ID.VisibleForCustomization := (dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1);
  if cxGrid1DBTableView1FK_SKLAD_ID.VisibleForCustomization = False then
    cxGrid1DBTableView1FK_SKLAD_ID.Visible := False;
//  if FShowCount = 0 then
//    acRefresh.Execute;
//  Inc( FShowCount );
end;

procedure TfrmMedic.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if not tmrEANCode.Enabled then tmrEANCode.Enabled := True; // после каждого нажатия включаем таймер на очистку буфера цифр
  if (Key = 13) then                                         // таким образом, если перед перед использование сканера
  begin                                                      // делали быстрый поиск (IncSearch), то буфер очистится
    FIs13KeyPressed := True;
  end
  else
  begin
    FIs13KeyPressed := False;
    FEAN13Code1 := FEAN13Code1 +  GetCharFromVirtualKey(Key);
  end;
end;

procedure TfrmMedic.acCancelFilterEAN13Execute(Sender: TObject);
begin
  //if FIsShtrihCodeInput= True then
  begin
    // отмена фильтрации по нажатию кнопки Esc
    FEAN13Code1 := '';
    odsMedicsList.Filtered := False;
    odsMedicsList.Filter := '';
  end;
end;

procedure TfrmMedic.tmrEANCodeTimer(Sender: TObject);
begin
  tmrEANCode.Enabled := False;

  if (FIs13KeyPressed)and(FEAN13Code1 <> '') then
  begin
    odsMedicsList.Filter := 'FC_EANCODE = '''+trim(FEAN13Code1)+'''';
    SaveToLog('frmMedic - EANCODE_filter', odsMedicsList.Filter);
    odsMedicsList.Filtered := True;
    if odsMedicsList.RecordCount = 1 then acSelect.Execute;
  end;
  FEAN13Code1 := '';
end;

procedure TfrmMedic.tbuSkladSelectClick(Sender: TObject);
var
  P : TPoint;
begin
  dmSkladSelect.SkladID := -1;
  dmSkladSelect.SetRadioCheckBySkladID( tbuSkladSelect.Tag );
  if dmSkladSelect.SkladID < 0 then
  begin
    P.X := 0;
    P.Y := tbuSkladSelect.Height;
    P := tbuSkladSelect.ClientToScreen(P);
    dmSkladSelect.pmSkladSelect.Popup(P.X, P.Y);
    Application.ProcessMessages;
  end;
  if dmSkladSelect.SkladID < 0 then Exit;
  try
    tbuSkladSelect.Tag := dmSkladSelect.SkladID;
    // фильтрация по типу склада
    if tbuSkladSelect.Tag = 0 then
      odsMedicsList.SetVariable('PFK_SKLAD_ID', 0)
    else
      odsMedicsList.SetVariable('PFK_SKLAD_ID', dmSkladSelect.SkladID);
    acRefresh.Execute;
    
  finally
    dmSkladSelect.SkladID := -1;
  end;
end;

end.

