unit fReportInputActSpis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, cxMemo, ExtCtrls, ComCtrls, ToolWin, Grids, ValEdit,
  cxControls, cxContainer, cxEdit, cxGroupBox, cxLookAndFeelPainters, cxStyles,
  cxGraphics, cxInplaceContainer, cxVGrid, cxDBLookupComboBox, DB, OracleData,
  StdCtrls, Oracle, ImgList;

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
    procedure tbuOkClick(Sender: TObject);
    procedure tbuCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmReportInputActSpis: TfmReportInputActSpis;

  function DoShowReportInputActSpis( aSession : TOracleSession; var aInputNamesValues : TArrayOfParams; var aZaklKom, aSpisano, aPrikaz : string) : Integer;
implementation

{$R *.dfm}

uses
  cxDropDownEdit;

function DoShowReportInputActSpis(aSession : TOracleSession; var aInputNamesValues : TArrayOfParams; var aZaklKom, aSpisano, aPrikaz : string) : Integer;
var
  er : TcxCustomRow;

  i : integer;
begin

  fmReportInputActSpis := TfmReportInputActSpis.Create( Application );
//  fmReportInputActSpis.ValueListEditor1.Strings.Text := aInputNamesValues.Text;
  fmReportInputActSpis.odsSotr.Session := aSession;
  fmReportInputActSpis.odsSotr.Open;

  for I := 0 to Length(aInputNamesValues) - 1 do
  begin
    er := fmReportInputActSpis.cxVerticalGrid1.Add(TcxEditorRow);
    case aInputNamesValues[i].ParamType of
      0 : TcxEditorRow(er).Properties.EditPropertiesClass := TcxTextEditProperties;
      1 :
      begin
        TcxEditorRow(er).Properties.EditPropertiesClass := TcxLookupComboBoxProperties;
        TcxLookupComboBoxProperties(TcxEditorRow(er).Properties.EditProperties).KeyFieldNames := 'FC_FIO';
        TcxLookupComboBoxProperties(TcxEditorRow(er).Properties.EditProperties).ListFieldNames := 'FC_FIO';
        TcxLookupComboBoxProperties(TcxEditorRow(er).Properties.EditProperties).ListSource := fmReportInputActSpis.dsSotr;

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

  fmReportInputActSpis.tePrikaz.Text  := aPrikaz;
  fmReportInputActSpis.meZaklKom.Text := aZaklKom;  

  Result :=  fmReportInputActSpis.ShowModal;
  if Result = mrOk then
  begin
    for I := 0 to Length(aInputNamesValues) - 1 do
    begin
      if VarIsnull(TcxEditorRow(fmReportInputActSpis.cxVerticalGrid1.RowByCaption(aInputNamesValues[i].Name)).Properties.Value) then
        aInputNamesValues[i].Value := ''
      else
        aInputNamesValues[i].Value := TcxEditorRow(fmReportInputActSpis.cxVerticalGrid1.RowByCaption(aInputNamesValues[i].Name)).Properties.Value;
    end;

//    aInputNamesValues.Text := fmReportInputActSpis.ValueListEditor1.Strings.Text;
    aZaklKom := fmReportInputActSpis.meZaklKom.Text;
    aSpisano := fmReportInputActSpis.meSpisano.Text;
    aPrikaz  := fmReportInputActSpis.tePrikaz.Text;
  end;
  fmReportInputActSpis.odsSotr.Close;
  fmReportInputActSpis.cxVerticalGrid1.ClearRows;
  fmReportInputActSpis.Free;
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
