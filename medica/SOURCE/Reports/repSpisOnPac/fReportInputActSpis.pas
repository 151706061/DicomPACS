unit fReportInputActSpis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, cxMemo, ExtCtrls, ComCtrls, ToolWin, Grids, ValEdit,
  cxControls, cxContainer, cxEdit, cxGroupBox, cxLookAndFeelPainters, cxStyles,
  cxGraphics, cxInplaceContainer, cxVGrid, cxDBLookupComboBox, DB, OracleData,
  StdCtrls, Oracle, ImgList, dxLayoutControl, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, dxLayoutLookAndFeels;

type
  TParams = record
    Name : string;
    Value : string;
    ParamType : integer; // 0 - строка, 1 - комбобокс с выбором ФИО сотрудника
  end;
  TArrayOfParams = array of TParams;

  TfmReportInputActSpis = class(TForm)
    Panel1: TPanel;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    cxGroupBox3: TcxGroupBox;
    CoolBar2: TCoolBar;
    ToolBar2: TToolBar;
    tbuOk: TToolButton;
    tbuCancel: TToolButton;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    meZaklKom: TcxMemo;
    meSpisano: TcxMemo;
    cxGroupBox4: TcxGroupBox;
    tePrikaz: TcxTextEdit;
    cxVerticalGrid1: TcxVerticalGrid;
    odsSotr: TOracleDataSet;
    dsSotr: TDataSource;
    ilMain: TImageList;
    Panel2: TPanel;
    pnDopParams: TPanel;
    spltDopParams: TSplitter;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    lcbMO: TcxLookupComboBox;
    dxLayoutControl1Item1: TdxLayoutItem;
    odsMO: TOracleDataSet;
    dsMO: TDataSource;
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    dxLayoutOfficeLookAndFeel1: TdxLayoutOfficeLookAndFeel;
    edtVIDDEYAT: TcxTextEdit;
    dxLayoutControl1Item2: TdxLayoutItem;
    edtINVNUM: TcxTextEdit;
    dxLayoutControl1Item3: TdxLayoutItem;
    edtSCHET: TcxTextEdit;
    dxLayoutControl1Item4: TdxLayoutItem;
    edtMVZ: TcxTextEdit;
    dxLayoutControl1Item5: TdxLayoutItem;
    edtZakaz: TcxTextEdit;
    dxLayoutControl1Item6: TdxLayoutItem;
    procedure tbuOkClick(Sender: TObject);
    procedure tbuCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function DoShowReportInputActSpis( aSession : TOracleSession; aShowDopParams : boolean; var aInputNamesValues : TArrayOfParams; var aZaklKom, aSpisano, aPrikaz : string;
    var DopParams : Variant ) : Integer;

implementation

{$R *.dfm}



function DoShowReportInputActSpis(aSession : TOracleSession; aShowDopParams : boolean; var aInputNamesValues : TArrayOfParams; var aZaklKom, aSpisano, aPrikaz : string;
  var DopParams : Variant) : Integer;
var
  er : TcxCustomRow;
  fmReportInputActSpis: TfmReportInputActSpis;
  i : integer;
begin

  fmReportInputActSpis := TfmReportInputActSpis.Create( Application );

  with fmReportInputActSpis do
  try
    odsSotr.Session := aSession;
    odsSotr.Open;

    for I := 0 to Length(aInputNamesValues) - 1 do
    begin
      er := cxVerticalGrid1.Add(TcxEditorRow);
      case aInputNamesValues[i].ParamType of
        0 : TcxEditorRow(er).Properties.EditPropertiesClass := TcxTextEditProperties;
        1 :
        begin
          TcxEditorRow(er).Properties.EditPropertiesClass := TcxLookupComboBoxProperties;
          TcxLookupComboBoxProperties(TcxEditorRow(er).Properties.EditProperties).KeyFieldNames := 'FC_FIO';
          TcxLookupComboBoxProperties(TcxEditorRow(er).Properties.EditProperties).ListFieldNames := 'FC_FIO';
          TcxLookupComboBoxProperties(TcxEditorRow(er).Properties.EditProperties).ListSource := dsSotr;

          TcxLookupComboBoxProperties(TcxEditorRow(er).Properties.EditProperties).ListOptions.ShowHeader := False;
          TcxLookupComboBoxProperties(TcxEditorRow(er).Properties.EditProperties).ListOptions.CaseInsensitive := True;
          TcxLookupComboBoxProperties(TcxEditorRow(er).Properties.EditProperties).ListOptions.AnsiSort := True;

          TcxLookupComboBoxProperties(TcxEditorRow(er).Properties.EditProperties).ImmediatePost := True;
          TcxLookupComboBoxProperties(TcxEditorRow(er).Properties.EditProperties).DropDownAutoSize := True;
          TcxLookupComboBoxProperties(TcxEditorRow(er).Properties.EditProperties).DropDownSizeable := True;

          TcxLookupComboBoxProperties(TcxEditorRow(er).Properties.EditProperties).DropDownListStyle := lsEditList;
        end;
      end;
      TcxEditorRow(er).Properties.Caption := aInputNamesValues[i].Name;
      TcxEditorRow(er).Properties.Value   := aInputNamesValues[i].Value;
    end;

    tePrikaz.Text  := aPrikaz;
    meZaklKom.Text := aZaklKom;

    // доп. параметры
    if aShowDopParams then
    begin
      try
        odsMO.Close;
        odsMO.Session := aSession;
        odsMO.Open;
      except
        on e : Exception do
          Application.ShowException( e );
      end;

      if not VarIsNull (DopParams) then
      begin
        if ( odsMO.Active ) and ( odsMo.Locate ( 'FC_MO_NAME', DopParams[0], [loCaseInsensitive]  ) ) then
          lcbMO.Text := DopParams[0];

        edtVIDDEYAT.Text := DopParams[1];
        edtINVNUM.Text := DopParams[2];
        edtSCHET.Text := DopParams[3];
        edtMVZ.Text := DopParams[4];
        edtZakaz.Text := DopParams[5];
      end;
    end
    else
    begin // скрываем
      pnDopParams.Visible := False;
      spltDopParams.Visible := False;
      fmReportInputActSpis.Height := fmReportInputActSpis.Height - ( pnDopParams.Height + spltDopParams.Height );
    end;


    Result :=  fmReportInputActSpis.ShowModal;

    if Result = mrOk then
    begin
      for I := 0 to Length(aInputNamesValues) - 1 do
      begin
        if VarIsnull(TcxEditorRow(cxVerticalGrid1.RowByCaption(aInputNamesValues[i].Name)).Properties.Value) then
          aInputNamesValues[i].Value := ''
        else
          aInputNamesValues[i].Value := TcxEditorRow(cxVerticalGrid1.RowByCaption(aInputNamesValues[i].Name)).Properties.Value;
      end;

  //    aInputNamesValues.Text := fmReportInputActSpis.ValueListEditor1.Strings.Text;
      aZaklKom := meZaklKom.Text;
      aSpisano := meSpisano.Text;
      aPrikaz  := tePrikaz.Text;

      if VarIsNull ( DopParams )  then
        DopParams := VarArrayCreate( [0, 5], varVariant );      

      DopParams[0] := lcbMO.Text;
      DopParams[1] := edtVIDDEYAT.Text;
      DopParams[2] := edtINVNUM.Text;
      DopParams[3] := edtSCHET.Text;
      DopParams[4] := edtMVZ.Text;
      DopParams[5] := edtZakaz.Text;
    end;
  finally
    FreeAndNil(fmReportInputActSpis );
  end;
end;

procedure TfmReportInputActSpis.tbuOkClick(Sender: TObject);
begin
  cxVerticalGrid1.SetFocus; // таким образом постим все поля
  ModalResult := mrOk;
end;

procedure TfmReportInputActSpis.tbuCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfmReportInputActSpis.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ModalResult = mrNone then ModalResult := mrCancel;
end;

end.
