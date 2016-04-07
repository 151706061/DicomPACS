unit fInputNameValue;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ComCtrls, ToolWin, ActnList, cxTextEdit, Grids,
  ValEdit;

type
  TfmInputNameValue = class(TForm)
    alOtmena: TActionList;
    acApply: TAction;
    acCancel: TAction;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ValueListEditor1: TValueListEditor;
    procedure acApplyExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

// aInputNamesValues - входной и одновременно выходной параметр. Подставлять TStringList с заполненными полями Keys и Values
function DoShowNameValueInput( var aInputNamesValues : TStringList; const aFormCaption : string = 'Введите значения параметров'; const aNameHeaderStr : string = 'Параметр'; const aValueHeaderStr : string = 'Значение' ) : Integer;

var
  fmInputNameValue: TfmInputNameValue;

implementation

{$R *.dfm}
//==============================================================================
function DoShowNameValueInput( var aInputNamesValues : TStringList; const aFormCaption : string = 'Введите значения параметров'; const aNameHeaderStr : string = 'Параметр'; const aValueHeaderStr : string = 'Значение' ) : Integer;
begin
  fmInputNameValue := TfmInputNameValue.Create( Application );
  fmInputNameValue.ValueListEditor1.TitleCaptions.Clear;
  fmInputNameValue.ValueListEditor1.TitleCaptions.Add(aNameHeaderStr);
  fmInputNameValue.ValueListEditor1.TitleCaptions.Add(aValueHeaderStr);
  fmInputNameValue.Caption := aFormCaption;
  fmInputNameValue.ValueListEditor1.Strings.Text := aInputNamesValues.Text;

  Result :=  fmInputNameValue.ShowModal;
  if Result = mrOk then
    aInputNamesValues.Text := fmInputNameValue.ValueListEditor1.Strings.Text;
  fmInputNameValue.Free;
end;
//==============================================================================
procedure TfmInputNameValue.acApplyExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfmInputNameValue.acCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfmInputNameValue.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ModalResult = mrNone then ModalResult := mrCancel;
end;

end.
