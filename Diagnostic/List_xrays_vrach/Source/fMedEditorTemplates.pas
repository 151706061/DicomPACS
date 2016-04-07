unit fMedEditorTemplates;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RVScroll, RichView, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, cxButtons, dxBar, DB, OracleData,
  RVEdit,RVStyle, Oracle, cxPC, JvStringHolder, cxContainer, cxEdit,
  cxLabel,cxGraphics, ImgList, cxCheckBox, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter, dxSkinsdxBarPainter;

type
  TfmMedEditorTemplates = class(TForm)
    Panel1: TPanel;
    Bevel1: TBevel;
    BM: TdxBarManager;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Splitter1: TSplitter;
    odsTempl: TOracleDataSet;
    odsTemplFK_ID: TFloatField;
    odsTemplFK_SMID: TFloatField;
    odsTemplFN_COMPRESS: TFloatField;
    odsTemplFD: TDateTimeField;
    odsTemplFK_SOTR: TFloatField;
    dsTempl: TDataSource;
    odsTemplFC_NAME: TStringField;
    odsTemplRC_REMARK: TStringField;
    odsBlob: TOracleDataSet;
    BlobField1: TBlobField;
    odsBlobFK_ID: TFloatField;
    odsBlobFN_TYPE: TFloatField;
    odsTemplFN_TYPE: TFloatField;
    bbDel: TdxBarButton;
    quDelTemplate: TOracleQuery;
    PC: TcxPageControl;
    tsRV: TcxTabSheet;
    tsSys: TcxTabSheet;
    RV: TRichViewEdit;
    shTempl: TJvStrHolder;
    TVSys: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    odsSysTempl: TOracleDataSet;
    dsSysTempl: TDataSource;
    odsSysTemplFK_ID: TFloatField;
    odsSysTemplFK_SMID: TFloatField;
    odsSysTemplFN_COMPRESS: TFloatField;
    odsSysTemplFD: TDateTimeField;
    odsSysTemplFK_SOTR: TFloatField;
    odsSysTemplFC_NAME: TStringField;
    odsSysTemplRC_REMARK: TStringField;
    odsSysTemplFN_TYPE: TFloatField;
    TVSysFK_ID: TcxGridDBColumn;
    TVSysFK_SMID: TcxGridDBColumn;
    TVSysFN_COMPRESS: TcxGridDBColumn;
    TVSysFD: TcxGridDBColumn;
    TVSysFK_SOTR: TcxGridDBColumn;
    TVSysFC_NAME: TcxGridDBColumn;
    TVSysRC_REMARK: TcxGridDBColumn;
    TVSysFN_TYPE: TcxGridDBColumn;
    TVSysDefault: TcxGridDBColumn;
    odsDefTempl: TOracleDataSet;
    odsDefTemplFK_ID: TFloatField;
    odsDefTemplFK_SOTR: TFloatField;
    odsDefTemplFK_RICHVIEW_TEML: TFloatField;
    bbSetDefault: TdxBarButton;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    odsDefTemplSys: TOracleDataSet;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    bbCancelDef: TdxBarButton;
    paLeft: TPanel;
    dxBarDockControl1: TdxBarDockControl;
    cxGrid1: TcxGrid;
    tv: TcxGridDBTableView;
    tvFK_ID: TcxGridDBColumn;
    tvFK_SMID: TcxGridDBColumn;
    tvFN_COMPRESS: TcxGridDBColumn;
    tvFD: TcxGridDBColumn;
    tvFK_SOTR: TcxGridDBColumn;
    tvName: TcxGridDBColumn;
    tvFN_Type: TcxGridDBColumn;
    tvDefault: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    il16: TImageList;
    bbApply: TcxButton;
    ckNotShow: TcxCheckBox;
    odsDefTemplSysFK_SMID: TFloatField;
    odsDefTemplFK_SMID: TFloatField;
    bbSaveToFile: TdxBarButton;
    sd: TSaveDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure odsTemplNewRecord(DataSet: TDataSet);
    procedure odsTemplAfterScroll(DataSet: TDataSet);
    procedure odsBlobAfterScroll(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbDelClick(Sender: TObject);
    procedure bbSetDefaultClick(Sender: TObject);
    procedure bbCancelDefClick(Sender: TObject);
    procedure tvCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure bbApplyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure odsDefTemplSysNewRecord(DataSet: TDataSet);
    procedure tvFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure odsTemplBeforePost(DataSet: TDataSet);
    procedure odsTemplAfterPost(DataSet: TDataSet);
    procedure bbSaveToFileClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    FFK_SMID : Integer;
    FTypeofuse : Integer; // 1 - добавление шаблона
    FMemStreamNew : TMemoryStream;
    FNotsavedBolb : Boolean;
    procedure SaveNewTemplate;
    procedure GetRVFromDB;
    procedure SaveDefaults;
    procedure InitDefaults;
    procedure InitDefaultsSys;
  public
    procedure InitForSave(AFK_SMID:Integer;AMedEditorRVF : TMemoryStream;ARVStyles: TRVStyle);
    procedure InitForLoad(AFK_SMID:Integer;AMedEditorRVF : TMemoryStream;ARVStyles: TRVStyle);
  end;

   Function SaveMedEditorAsTemplate(AFK_SMID:Integer; AMedEditorRVF : TMemoryStream; ARVStyles: TRVStyle ): boolean;
   Function LoadMedEditorFromTemplate(AFK_SMID:Integer; AMedEditorRVF : TMemoryStream; ARVStyles: TRVStyle ): boolean;

implementation

uses jvJCLUtils, fMain;

{$R *.dfm}
Function SaveMedEditorAsTemplate(AFK_SMID:Integer; AMedEditorRVF : TMemoryStream;ARVStyles: TRVStyle): boolean;
begin
  Result := True;
  with TfmMedEditorTemplates.Create(Application) do
  begin
    InitForSave(AFK_SMID,AMedEditorRVF,ARVStyles);
    ShowModal;
    Free;
  end;    // with
end;
//------------------------------------------------------------------------------
Function LoadMedEditorFromTemplate(AFK_SMID:Integer; AMedEditorRVF : TMemoryStream; ARVStyles: TRVStyle ): boolean;
begin
  with TfmMedEditorTemplates.Create(Application) do
  begin
    InitForLoad(AFK_SMID,AMedEditorRVF,ARVStyles);
    Result := ShowModal=mrOk;
    if Result  then
    begin
      case PC.ActivePageIndex of
        0: // обычные шаблоны
          begin
            if odsTempl.RecordCount<>0 then
            begin
              AMedEditorRVF.Position :=0;
              TBLOBField(odsBlob.FieldByName('FB_BLOB')).SaveToStream(AMedEditorRVF);

            end;

          end;
        1:// —истемный шаблон
          begin
            if odsSysTempl.RecordCount<>0 then
            begin
              odsBlob.Close;
              odsBlob.Master:=nil;
              odsBlob.AfterScroll := nil;
              odsBlob.SetVariable('fk_id',odsSysTempl.FieldByName('FK_ID').AsInteger);
              odsBlob.Open;
              AMedEditorRVF.Position :=0;
              TBLOBField(odsBlob.FieldByName('FB_BLOB')).SaveToStream(AMedEditorRVF);

            end;
              
          end;
      end;    // case

    end;
    Free;
  end;    // with

end;
{ TfmMedEditorTemplates }
//------------------------------------------------------------------------------
procedure TfmMedEditorTemplates.InitForSave(AFK_SMID: Integer;AMedEditorRVF : TMemoryStream;ARVStyles: TRVStyle);
begin
  FTypeofuse := 1;
  Caption := 'Ўаблоны :: —охранение';
  TV.OptionsView.NewItemRow  := True;
  FFK_SMID := AFK_SMID;
  RV.Style := TRVStyle.Create(Self);

  FMemStreamNew :=  AMedEditorRVF;
  odsTempl.SQL.Clear;
  odsTempl.SQL.Add(shTempl.ExpandMacros);
  odsTempl.SetVariable('FK_SMID',AFK_SMID);
  odsTempl.SetVariable('fk_sotr', frmMain.pSOTRID);

  odsTempl.Open;

  odsBlob.Open;
  InitDefaults;// —тавим галки дл€ использовани€ по усмолчанию

  odsTempl.AfterScroll :=  odsTemplAfterScroll;
  odsTemplAfterScroll(odsTempl);
  odsBlobAfterScroll(odsBlob);
end;
//------------------------------------------------------------------------------
// –азные процедуры инициализации? потому что разное поведение, дл€ сохранени€ нужен новый элемент
procedure TfmMedEditorTemplates.InitForLoad(AFK_SMID: Integer;
  AMedEditorRVF: TMemoryStream; ARVStyles: TRVStyle);
begin
  FTypeofuse := 2;
  Caption := 'Ўаблоны :: ¬ыбор';
  FFK_SMID := AFK_SMID;
  RV.Style := TRVStyle.Create(Self);
  FMemStreamNew :=  AMedEditorRVF;
  odsTempl.SQL.Clear;
  odsTempl.SQL.Add(shTempl.ExpandMacros);
  odsTempl.SQL.Add(' OR (fk_id = -1)');
  odsTempl.SetVariable('FK_SMID',AFK_SMID);
  odsTempl.SetVariable('fk_sotr',frmMain.pSOTRID);
  odsTempl.Open;

  InitDefaults;// —тавим галки дл€ использовани€ по усмолчанию
  odsTempl.AfterScroll :=  odsTemplAfterScroll;
  odsTemplAfterScroll(odsTempl);
  odsBlob.Open;
  tv.OptionsBehavior.ImmediateEditor := False;
end;
//------------------------------------------------------------------------------
procedure TfmMedEditorTemplates.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  case modalResult of
    mrOK:
      begin
        // Ќовый шаблон сохна€ем в базу
        if FTypeofuse =1 then SaveNewTemplate
        else
        begin

        end;
        odsTempl.CheckBrowseMode;
        SaveDefaults; // —охран€ем галки по умолчанию
        // ’анты просили записывать в зависимости от пользовател€ в базу
        frmMain.opSMINI.CallProcedure('WRITESTRING'
          ,['MedEditorTemplates'
             ,'LoadOnNewPriem\'+IntToStr(frmMain.pSOTRID)
             ,BoolToStr(ckNotShow.Checked)] );
      end;
    mrCancel: ;
  end;    // case

end;
//------------------------------------------------------------------------------
procedure TfmMedEditorTemplates.odsTemplNewRecord(DataSet: TDataSet);
begin
  odsTempl.FieldByName('FK_SMID').AsInteger := FFK_SMID;
  odsTempl.FieldByName('FK_SOTR').AsInteger  := frmMain.pSOTRID;
  odsTempl.FieldByName('FN_COMPRESS').AsInteger := 1;
  odsTempl.FieldByName('FN_type').AsInteger := 2; // обычный пользовательский шаблон

end;
//------------------------------------------------------------------------------
procedure TfmMedEditorTemplates.odsTemplAfterScroll(DataSet: TDataSet);
begin
  // Ќазначаетс€ динамически
  if DataSet.FieldByName('fk_id').AsInteger=-1  then
  begin // Ёто системные шаблоны
    PC.ActivePageIndex := tsSys.PageIndex;
    tv.OptionsData.Editing := False;
    tv.OptionsData.Deleting := False;
    bbSetDefault.Enabled := False;
    bbDel.Enabled := False;
    bbCancelDef.Enabled := False;
    bbSaveToFile.Enabled := False;
    if not odsSysTempl.Active then
    begin
      odsSysTempl.Close;
      odsSysTempl.SetVariable('FK_SMID',odsTempl.GetVariable('FK_SMID'));
      odsSysTempl.Open;
      InitDefaultsSys;// заполним галки по умолчанию
    end;

  end
  else
  begin  // Ёто пользовательсие шаблоны
    bbSetDefault.Enabled := True;
    bbDel.Enabled := True;
    bbCancelDef.Enabled := True;
    bbSaveToFile.Enabled := True;
    PC.ActivePageIndex := tsRV.PageIndex;
    tv.OptionsData.Editing := True;
    tv.OptionsData.Deleting := True;
  end

end;
//------------------------------------------------------------------------------
procedure TfmMedEditorTemplates.SaveNewTemplate;
begin
  if not tv.Controller.NewItemRecordFocused then
  begin
    if (MessageDlg('«аменить шаблон?', mtConfirmation, [mbYes, mbNo], 0) in [mrNo, mrNone]) then
    begin
      Abort;
    end;
  end;
    
  if not (odsTempl.State in [dsEdit,dsInsert]) then
  begin
    if odsTempl.RecordCount=0 then odsTempl.Insert
    else odsTempl.Edit;
  end;
  
  odsTempl.Post;
  odsBlob.Close;
  odsBlob.Open;
  odsBlob.Edit;

  FMemStreamNew.Position :=0;
  TBlobField(odsBlob.FieldByName('FB_BLOB')).LoadFromStream(FMemStreamNew);
  odsBlob.Post;

end;
//------------------------------------------------------------------------------
procedure TfmMedEditorTemplates.GetRVFromDB;
var
  memStream : TmemoryStream;
begin

  memStream := TMemoryStream.Create;
  TBLOBField(odsBlob.FieldByName('FB_BLOB')).SaveToStream(memStream);
  memStream.Position :=0;
  RV.Clear;
  RV.LoadRVFFromStream(memStream);
  RV.Format;
  memStream.Free;
end;
//------------------------------------------------------------------------------
procedure TfmMedEditorTemplates.odsBlobAfterScroll(DataSet: TDataSet);
begin
 // измен€етс€ динамически!
  GetRVFromDB;
end;
//------------------------------------------------------------------------------
procedure TfmMedEditorTemplates.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    Close;
  end;

end;
//------------------------------------------------------------------------------
procedure TfmMedEditorTemplates.bbDelClick(Sender: TObject);
begin
  if (odsTempl.RecordCount <>0) and (odsTempl.FieldByName('FK_ID').AsInteger <>-1) then
  begin
    if (MessageDlg('”далить шаблон?', mtConfirmation, [mbYes, mbNo], 0) in [mrNo, mrNone]) then Exit;
    tv.DataController.DeleteFocused;
    tv.DataController.RefreshExternalData;
  end;

end;
//------------------------------------------------------------------------------
procedure TfmMedEditorTemplates.SaveDefaults;
var
  I: Integer;
  val : Integer;
begin
  for I := 0 to TV.DataController.RecordCount - 1 do    // Iterate
  begin
    if not VarIsNull(TV.DataController.Values[I,tvDefault.Index]) then
    begin
      val := TV.DataController.Values[I,tvDefault.Index];
      case val of    //
        0:begin
            if odsDefTempl.Locate('FK_RICHVIEW_TEML',TV.DataController.Values[I,tvFK_ID.Index],[]) then
            begin
              odsDefTempl.Delete;
            end;
          end;

        1:begin
            if not odsDefTempl.Locate('FK_RICHVIEW_TEML',TV.DataController.Values[I,tvFK_ID.Index],[]) then
            begin
              odsDefTempl.Insert;
              odsDefTempl.FieldValues['fk_sotr']:= frmMain.pSOTRID;
              odsDefTempl.FieldValues['fk_smid']:= FFK_SMID;
              odsDefTempl.FieldValues['fk_richview_teml']:= TV.DataController.Values[I,tvFK_ID.Index];
              odsDefTempl.Post;
            end
          end;
      end;    // case
    end;
  end;    // for
  // ≈ще удалить те которых уже нет, в триггере не полуаетс€ это сделать, потому как не могу ограничить по сотруднику
  odsDefTempl.First;
  while not odsDefTempl.Eof do
  begin
    if not TV.DataController.LocateByKey(odsDefTempl.FieldValues['FK_RICHVIEW_TEML']) then
      odsDefTempl.Delete
    else
      odsDefTempl.Next;
  end;    // while

  //---- теперь системные шаблоны
  TVSys.DataController.PostEditingData;
  if not odsSysTempl.Active then Exit;
  for I := 0 to TVSys.DataController.RecordCount - 1 do    // Iterate
  begin
    if not VarIsNull(TVSys.DataController.Values[I,TVSysDefault.Index]) then
    begin
      val := TVSys.DataController.Values[I,TVSysDefault.Index];
      case val of    //
        0:begin
            if odsDefTemplSys.Locate('FK_RICHVIEW_TEML',TVSys.DataController.Values[I,TVSysFK_ID.Index],[]) then
            begin
              odsDefTemplSys.Delete;
            end;
          end;

        1:begin
            if not odsDefTemplSys.Locate('FK_RICHVIEW_TEML',TVSys.DataController.Values[I,TVSysFK_ID.Index],[]) then
            begin
              odsDefTemplSys.Insert;
              odsDefTemplSys.FieldValues['fk_sotr']:= frmMain.pSOTRID;
              odsDefTemplSys.FieldValues['fk_richview_teml']:= TVSys.DataController.Values[I,TVSysFK_ID.Index];
              odsDefTemplSys.Post;
            end
          end;
      end;    // case
    end;
  end;    // for

end;
//------------------------------------------------------------------------------
procedure TfmMedEditorTemplates.InitDefaults;
var
  I : Integer;
begin
  // —тавим галки дл€ использовани€ по усмолчанию
  if odsDefTempl.Active then Exit;
  // ѕроставл€ем все галки в пустоту

  odsDefTempl.SetVariable('FK_SMID',odsTempl.GetVariable('fk_smid'));
  odsDefTempl.SetVariable('FK_SOTR',frmMain.pSOTRID);
  odsDefTempl.Open;
  tv.DataController.BeginUpdate;
  for I := 0 to tv.DataController.RecordCount - 1 do    // Iterate
  begin
    TV.DataController.Values[I,tvDefault.Index] := 0;
  end;    // for
  tv.DataController.EndUpdate;

  while not odsDefTempl.Eof do
  begin
    if tv.DataController.LocateByKey(odsDefTempl.FieldValues['fk_richview_teml']) then
      tv.DataController.Values[tv.DataController.FocusedRecordIndex,tvDefault.Index] := 1;
    odsDefTempl.Next;
  end;    // while
  tv.DataController.EndUpdate;

end;
//------------------------------------------------------------------------------
procedure TfmMedEditorTemplates.bbSetDefaultClick(Sender: TObject);
var
  I: Integer;
begin
  case PC.ActivePageIndex of    //
    0:begin
        TV.DataController.Values[tv.DataController.FocusedRecordIndex,tvDefault.Index] := 1;
        TV.DataController.PostEditingData;
        if odsTempl.State in [dsEdit,dsInsert] then odsTempl.Post;

        tv.DataController.BeginUpdate;
        for I := 0 to tv.DataController.RecordCount - 1 do    // Iterate
        begin
          TV.DataController.Values[I,tvDefault.Index] := 0;
        end;    // for
        TV.DataController.Values[tv.DataController.FocusedRecordIndex,tvDefault.Index] := 1;
        tv.DataController.EndUpdate;
      end;
    1:begin
        //
      end;

  end;    // case
end;
procedure TfmMedEditorTemplates.cxButton2Click(Sender: TObject);
begin

end;

//------------------------------------------------------------------------------
procedure TfmMedEditorTemplates.InitDefaultsSys;
var
  I : Integer;
begin
  // —тавим галки дл€ использовани€ по усмолчанию
  if odsDefTemplSys.Active then Exit;

  odsDefTemplSys.SetVariable('FK_SMID',odsTempl.GetVariable('fk_smid'));
  odsDefTemplSys.SetVariable('FK_SOTR',frmMain.pSOTRID);
  odsDefTemplSys.Open;
  TVSys.DataController.BeginUpdate;
  // ѕроставл€ем все галки в пустоту
  TVSys.DataController.BeginUpdate;
  for I := 0 to TVSys.DataController.RecordCount - 1 do    // Iterate
  begin
    TVSys.DataController.Values[I,TVSysDefault.Index] := 0;
  end;    // for
  TVSys.DataController.EndUpdate;


  while not odsDefTemplSys.Eof do
  begin
    if TVSys.DataController.LocateByKey(odsDefTemplSys.FieldValues['fk_richview_teml']) then
      TVSys.DataController.Values[TVSys.DataController.FocusedRecordIndex,TVSysDefault.Index] := 1;
    odsDefTemplSys.Next;
  end;    // while

end;
//------------------------------------------------------------------------------
procedure TfmMedEditorTemplates.bbCancelDefClick(Sender: TObject);
begin
  case PC.ActivePageIndex of    //
    0:begin
        TV.DataController.BeginUpdate;
        TV.DataController.Values[tv.DataController.FocusedRecordIndex,tvDefault.Index] := 0;
        TV.DataController.EndUpdate;
      end;
    1:begin
        //
      end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmMedEditorTemplates.tvCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
Var
  fk_id : Integer;
  ARec: TRect;

begin
  fk_id := VarToInt(AViewInfo.GridRecord.Values[tvFK_ID.Index]);
  if FK_ID =-1 then
    ACanvas.Brush.Color := clMoneyGreen;
  if (FK_ID =-1) and (AViewInfo.Item.Index = tvDefault.Index) then
  begin
    ARec := AViewInfo.Bounds;
    ACanvas.FillRect(ARec);
    ADone := True;
  end;

end;
//------------------------------------------------------------------------------
procedure TfmMedEditorTemplates.bbApplyClick(Sender: TObject);
begin
  odsTempl.CheckBrowseMode;
  SaveDefaults; // —охран€ем галки по умолчанию
        // ’анты просили записывать в зависимости от пользовател€ в базу
  frmMain.opSMINI.CallProcedure('WRITESTRING'
    ,['MedEditorTemplates'
       ,'LoadOnNewPriem\'+IntToStr(frmMain.pSOTRID)
       ,BoolToStr(ckNotShow.Checked)] );

end;
//------------------------------------------------------------------------------
procedure TfmMedEditorTemplates.FormCreate(Sender: TObject);
var
  S : string;
begin
  S :=frmMain.opSMINI.CallStringFunction('READSTRING'
      ,['MedEditorTemplates'
         ,'LoadOnNewPriem\'+IntToStr(frmMain.pSOTRID)
         ,'FALSE' ] );
   ckNotShow.Checked :=SysUtils.StrToBool(S);

end;
//------------------------------------------------------------------------------
procedure TfmMedEditorTemplates.odsDefTemplSysNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldValues['fk_smid'] := FFK_SMID;
end;
//------------------------------------------------------------------------------
procedure TfmMedEditorTemplates.tvFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  if (AFocusedRecord =nil) and ANewItemRecordFocusingChanged then
  begin
    RV.Clear;
    FMemStreamNew.Position :=0;
    RV.LoadRVFFromStream(FMemStreamNew);
    RV.Format;
    odsBlob.AfterScroll := nil;
  end
  else
  begin
    if not Assigned(odsBlob.AfterScroll) then
    begin
      odsBlob.AfterScroll := odsBlobAfterScroll;
      odsBlobAfterScroll(odsBlob);
    end;

  end;
end;
//------------------------------------------------------------------------------
procedure TfmMedEditorTemplates.odsTemplBeforePost(DataSet: TDataSet);
begin
  if DataSet.State in [dsInsert] then FNotsavedBolb :=True;

end;
//------------------------------------------------------------------------------
procedure TfmMedEditorTemplates.odsTemplAfterPost(DataSet: TDataSet);
begin
  if FNotsavedBolb then
  begin
    odsBlob.Close;
    odsBlob.Open;
    odsBlob.Edit;

    FMemStreamNew.Position :=0;
    TBlobField(odsBlob.FieldByName('FB_BLOB')).LoadFromStream(FMemStreamNew);
    odsBlob.Post;
    odsBlobAfterScroll(odsBlob);
  end;

  FNotsavedBolb := False;
end;
//------------------------------------------------------------------------------
// —охран€ет пользовательский шаблонв файл
procedure TfmMedEditorTemplates.bbSaveToFileClick(Sender: TObject);
begin
  if sd.Execute then
    RV.SaveRVF(sd.FileName, False);
end;

end.
