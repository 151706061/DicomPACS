unit fcross_table_check;

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
  cxGridCustomView, cxGrid, cxTextEdit, cxCustomPivotGrid, cxDBPivotGrid,
  ImgList, cxContainer, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxGridBandedTableView, cxLookAndFeelPainters, cxButtons, cxGroupBox;

type       
  TfrmCROSS_TABLE_CHECK = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    al: TActionList;
    acClose: TAction;
    acRefresh: TAction;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    FormStorage: TJvFormStorage;
    ImageList1: TImageList;
    odsTCROSS_TABLE_PARAMS: TOracleDataSet;
    dsTCROSS_TABLE_PARAMS: TDataSource;
    ToolButton2: TToolButton;
    Panel1: TPanel;
    lcbCROSS_TABLE_SELECT: TcxLookupComboBox;
    cxLabel1: TcxLabel;
    odsParam2_Value: TOracleDataSet;
    odsParam1: TOracleDataSet;
    ToolButton3: TToolButton;
    oqSetValue: TOracleQuery;
    tbuCROSS_TABLE_PARAMS: TToolButton;
    ToolButton7: TToolButton;
    dsParam1: TDataSource;
    dsParam2_Value: TDataSource;
    grbTable2: TcxGroupBox;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1_FC_NAME: TcxGridDBColumn;
    cxGrid1DBTableView1_FN_VALUE: TcxGridDBColumn;
    cxGrid1DBTableView1_FK_ID: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxDBPivotGrid1: TcxDBPivotGrid;
    grbTable1: TcxGroupBox;
    lcbParam1: TcxLookupComboBox;
    buExchange: TcxButton;
    pmSetValues: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    procedure acRefreshExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acCloseExecute(Sender: TObject);
    procedure tbuCROSS_TABLE_PARAMSClick(Sender: TObject);
    procedure cxDBPivotGrid1CustomDrawCell(Sender: TcxCustomPivotGrid;
      ACanvas: TcxCanvas; AViewInfo: TcxPivotGridDataCellViewInfo;
      var ADone: Boolean);
    procedure lcbCROSS_TABLE_SELECTPropertiesChange(Sender: TObject);
    procedure lcbParam1PropertiesChange(Sender: TObject);
    procedure cxGrid1DBTableView1_FN_VALUEPropertiesChange(Sender: TObject);
    procedure odsParam2_ValueApplyRecord(Sender: TOracleDataSet; Action: Char;
      var Applied: Boolean; var NewRowId: string);
    procedure buExchangeClick(Sender: TObject);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
    FBtm : TBitmap;
    fc_key_field1, fc_name_field1, fc_table1,
    fc_key_field2, fc_name_field2, fc_table2 : variant;
  public
    { Public declarations }

  end;

procedure DoShowCROSS_TABLE_CHECK(  );



implementation

uses fmainform, fdmMain, fCROSS_TABLE_PARAMS, Variants;

{$R *.DFM}
procedure DoShowCROSS_TABLE_CHECK(  );
var
  frmCROSS_TABLE_CHECK: TfrmCROSS_TABLE_CHECK;
begin
  if not frmMain.RestoreMDI_Window('frmCROSS_TABLE_CHECK') then
  begin
    frmCROSS_TABLE_CHECK := TfrmCROSS_TABLE_CHECK.Create(Application);
    frmCROSS_TABLE_CHECK.FormStyle := fsMDIChild;
  end;
end;

procedure TfrmCROSS_TABLE_CHECK.acRefreshExecute(Sender: TObject);
var
  tmpID: integer;
begin
  if (VarIsNull(lcbCROSS_TABLE_SELECT.EditValue)=False) then
  begin
    if (odsTCROSS_TABLE_PARAMS.Locate( 'FK_ID', lcbCROSS_TABLE_SELECT.EditValue, [] )) then
    begin
      odsParam1.Close;
      odsParam1.Fields.Clear;
      odsParam1.SQL.Text := 'SELECT '#13#10+
                            '  '+fc_key_field1+' as FK_ID,'#13#10+
                            '  '+fc_name_field1+' as FC_NAME'#13#10+
                            'FROM '+fc_table1+#13#10+
                            //'ORDER BY '+fc_name_field1+#13#10;
                            'ORDER BY FC_NAME'+#13#10;

      if VarIsNull(lcbParam1.EditValue) = False then
      begin
        tmpID := lcbParam1.EditValue;
        odsParam1.Open;
        lcbParam1.EditValue := tmpID;
      end else begin
        odsParam1.Open;
        odsParam1.First;
        lcbParam1.EditValue := odsParam1.FieldByName('FK_ID').AsInteger;
      end;

      odsParam2_Value.Fields.Clear;
      odsParam2_Value.SQL.Text := 'SELECT '#13#10+
                                  '  '+fc_key_field2+' as FK_ID,'#13#10+
                                  '  '+fc_name_field2+' as FC_NAME,'#13#10+
                                  '  c.rowid, c.fn_value'#13#10;
      // учет переворота настроек
      if buExchange.Down then
      begin
        odsParam2_Value.SQL.Text := odsParam2_Value.SQL.Text +
                                  'FROM (select tc.rowid, tc.* from med.tcross_table_check tc where tc.fk_cross_params_id = :fk_cross_params_id and tc.fk_key2 = :fk_key) c,'#13#10+
                                  '     '+fc_table2+' t2'#13#10+
                                  'WHERE t2.'+fc_key_field2+' = c.fk_key1(+)'#13#10+
                                  //'ORDER BY t2.'+fc_name_field2;
                                  'ORDER BY FC_NAME';
      end
      else
      begin
        odsParam2_Value.SQL.Text := odsParam2_Value.SQL.Text +
                                  'FROM (select tc.rowid, tc.* from med.tcross_table_check tc where tc.fk_cross_params_id = :fk_cross_params_id and tc.fk_key1 = :fk_key) c,'#13#10+
                                  '     '+fc_table2+' t2'#13#10+
                                  'WHERE t2.'+fc_key_field2+' = c.fk_key2(+)'#13#10+
                                  //'ORDER BY t2.'+fc_name_field2;
                                  'ORDER BY FC_NAME';
      end;
    end;
                         
    odsParam2_Value.Close;
    odsParam2_Value.SetVariable( 'fk_cross_params_id', lcbCROSS_TABLE_SELECT.EditValue );
    odsParam2_Value.SetVariable( 'fk_key',  lcbParam1.EditValue );

    odsParam2_Value.Open;
  end;
end;

procedure TfrmCROSS_TABLE_CHECK.buExchangeClick(Sender: TObject);
var
  a : variant;
  key1, key2 : variant;
begin
  a := fc_key_field1;   fc_key_field1 := fc_key_field2;   fc_key_field2 := a;
  a := fc_name_field1;  fc_name_field1 := fc_name_field2; fc_name_field2 := a;
  a := fc_table1;       fc_table1 := fc_table2;           fc_table2 := a;

  a:= grbTable1.Caption;  grbTable1.Caption := grbTable2.Caption; grbTable2.Caption := a;

  key1 := lcbParam1.EditValue;
  key2 := cxGrid1DBTableView1_FK_ID.EditValue;

  acRefresh.Execute;

  lcbParam1.EditValue := key2;
  lcbParam1PropertiesChange(nil);
  odsParam2_Value.Locate('FK_ID', key1, []);
end;

procedure TfrmCROSS_TABLE_CHECK.cxDBPivotGrid1CustomDrawCell(
  Sender: TcxCustomPivotGrid; ACanvas: TcxCanvas;
  AViewInfo: TcxPivotGridDataCellViewInfo; var ADone: Boolean);
begin
  FBtm := TBitmap.Create;
  FBtm.Height := 11;
  FBtm.Width := 11;
  ACanvas.FillRect(Rect(AViewInfo.Bounds.Left, AViewInfo.Bounds.Top, AViewInfo.Bounds.Right-1, AViewInfo.Bounds.Bottom-1));

  ImageList1.GetBitmap(nvl(AViewInfo.Value,0), FBtm);
  ACanvas.Draw(AViewInfo.Bounds.Left+1, AViewInfo.Bounds.Top+1 ,FBtm);

  FBtm.Free;
  ADone := True;
end;

procedure TfrmCROSS_TABLE_CHECK.cxGrid1DBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  if (AButton = mbRight)and(ACellViewInfo.Item.Index = cxGrid1DBTableView1_FN_VALUE.Index) then
  begin
    pmSetValues.Popup( Mouse.CursorPos.X, Mouse.CursorPos.Y );

  end;
end;

procedure TfrmCROSS_TABLE_CHECK.cxGrid1DBTableView1_FN_VALUEPropertiesChange(
  Sender: TObject);
begin
  // учет переворота настроек
  oqSetValue.SetVariable('FK_CROSS_PARAMS_ID', lcbCROSS_TABLE_SELECT.EditValue);
  if buExchange.Down then
  begin
    oqSetValue.SetVariable('FK_KEY2',            lcbParam1.EditValue);
    oqSetValue.SetVariable('FK_KEY1',            cxGrid1DBTableView1_FK_ID.EditValue);
  end
  else
  begin
    oqSetValue.SetVariable('FK_KEY1',            lcbParam1.EditValue);
    oqSetValue.SetVariable('FK_KEY2',            cxGrid1DBTableView1_FK_ID.EditValue);
  end;

  oqSetValue.SetVariable('FN_VALUE',           cxGrid1DBTableView1_FN_VALUE.EditValue);
  oqSetValue.Execute;
  odsParam2_Value.RefreshRecord;
end;

procedure TfrmCROSS_TABLE_CHECK.FormCreate(Sender: TObject);
begin
  odsTCROSS_TABLE_PARAMS.Open;
  acRefresh.Execute;
end;

procedure TfrmCROSS_TABLE_CHECK.lcbCROSS_TABLE_SELECTPropertiesChange(Sender: TObject);
begin
  buExchange.Enabled := lcbCROSS_TABLE_SELECT.EditValue > 0;

  odsTCROSS_TABLE_PARAMS.Locate('FK_ID', lcbCROSS_TABLE_SELECT.EditValue, []);
  fc_key_field1  := odsTCROSS_TABLE_PARAMS.FieldByName('fc_key_field1').AsString;
  fc_name_field1 := odsTCROSS_TABLE_PARAMS.FieldByName('fc_name_field1').AsString;
  fc_table1      := odsTCROSS_TABLE_PARAMS.FieldByName('fc_table1').AsString;

  fc_key_field2  := odsTCROSS_TABLE_PARAMS.FieldByName('fc_key_field2').AsString;
  fc_name_field2 := odsTCROSS_TABLE_PARAMS.FieldByName('fc_name_field2').AsString;
  fc_table2      := odsTCROSS_TABLE_PARAMS.FieldByName('fc_table2').AsString;

  grbTable1.Caption := odsTCROSS_TABLE_PARAMS.FieldByName('FC_TABLE1_COMMENT').AsString;
  grbTable2.Caption := odsTCROSS_TABLE_PARAMS.FieldByName('FC_TABLE2_COMMENT').AsString;

//  odsParam1.Close;
//  odsParam1.Fields.Clear;
//  odsParam1.SQL.Text := 'SELECT '#13#10+
//                        '  '+fc_key_field1+' as FK_ID,'#13#10+
//                        '  '+fc_name_field1+' as FC_NAME'#13#10+
//                        'FROM '+fc_table1+#13#10+
//                        'ORDER BY '+fc_name_field1;
//  odsParam1.Open;

  acRefresh.Execute;
end;

procedure TfrmCROSS_TABLE_CHECK.lcbParam1PropertiesChange(Sender: TObject);
begin
  if Length(odsParam2_Value.SQL.Text) < 3 then Exit;
  odsParam2_Value.Close;
  odsParam2_Value.SetVariable( 'FK_KEY', lcbParam1.EditValue );
  odsParam2_Value.Open;
//  acRefresh.Execute;
end;

procedure TfrmCROSS_TABLE_CHECK.N1Click(Sender: TObject);
begin
  odsParam2_Value.First;
  while odsParam2_Value.Eof = False do
  begin
    oqSetValue.SetVariable('FK_CROSS_PARAMS_ID', lcbCROSS_TABLE_SELECT.EditValue);
    if buExchange.Down then
    begin
      oqSetValue.SetVariable('FK_KEY2', lcbParam1.EditValue);
      oqSetValue.SetVariable('FK_KEY1', cxGrid1DBTableView1_FK_ID.EditValue);
    end
    else
    begin
      oqSetValue.SetVariable('FK_KEY1', lcbParam1.EditValue);
      oqSetValue.SetVariable('FK_KEY2', cxGrid1DBTableView1_FK_ID.EditValue);
    end;

    case TMenuItem(Sender).Tag of
      1 : oqSetValue.SetVariable('FN_VALUE', 1);
      2 : oqSetValue.SetVariable('FN_VALUE', 0);
      3 : oqSetValue.SetVariable( 'FN_VALUE', ((nvl(odsParam2_Value.FieldByName('FN_VALUE').AsInteger, 1) +1) mod 2) );
    end;

    oqSetValue.Execute;
    odsParam2_Value.Next;
  end;
  odsParam2_Value.Close;
  odsParam2_Value.Open;  
end;

procedure TfrmCROSS_TABLE_CHECK.odsParam2_ValueApplyRecord(
  Sender: TOracleDataSet; Action: Char; var Applied: Boolean;
  var NewRowId: string);
begin
  Applied := True;
end;

procedure TfrmCROSS_TABLE_CHECK.tbuCROSS_TABLE_PARAMSClick(
  Sender: TObject);
begin
  DoShowCROSS_TABLE_PARAMS;
  odsTCROSS_TABLE_PARAMS.Refresh;
end;

procedure TfrmCROSS_TABLE_CHECK.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TfrmCROSS_TABLE_CHECK.acCloseExecute(Sender: TObject);
begin
  Close;
end;

end.

