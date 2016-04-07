unit fAbstract;

{
11.05.05 sill
Описание мед препарата
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, ComCtrls, ToolWin, StdCtrls, ExtCtrls, Db, OracleData, JvFormPlacement;

type
  TfrmAbstract = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ActionList1: TActionList;
    aClose: TAction;
    Panel3: TPanel;
    gbDescription: TGroupBox;
    reDescription: TRichEdit;
    FormStorage: TJvFormStorage;
    odsDescription: TOracleDataSet;
    odsDescriptionDSDesigner: TFloatField;
    odsDescriptionDSDesigner2: TFloatField;
    odsDescriptionDSDesigner3: TStringField;
    odsDescriptionDSDesigner4: TStringField;
    odsDescriptionDSDesigner5: TStringField;
    odsDescriptionDSDesigner6: TStringField;
    odsDescriptionDSDesigner10: TStringField;
    odsDescriptionDSDesigner7: TStringField;
    odsDescriptionDSDesigner8: TMemoField;
    odsDescriptionDSDesigner9: TMemoField;
    odsDescriptionDSDesigner11: TMemoField;
    odsDescriptionDSDesigner12: TStringField;
    odsDescriptionDSDesigner13: TMemoField;
    odsDescriptionDSDesigner14: TMemoField;
    odsDescriptionDSDesigner15: TMemoField;
    odsDescriptionDSDesigner16: TMemoField;
    odsDescriptionDSDesigner17: TMemoField;
    odsDescriptionDSDesigner18: TMemoField;
    odsDescriptionDSDesigner19: TMemoField;
    odsDescriptionDSDesigner20: TMemoField;
    odsDescriptionDSDesigner21: TMemoField;
    odsDescriptionDSDesigner22: TMemoField;
    odsDescriptionDSDesigner23: TMemoField;
    odsDescriptionDSDesigner24: TMemoField;
    odsDescriptionDSDesigner25: TMemoField;
    odsDescriptionDSDesigner26: TMemoField;
    odsDescriptionDSDesigner27: TMemoField;
    odsDescriptionDSDesigner28: TMemoField;
    odsDescriptionDSDesigner29: TMemoField;
    odsDescriptionDSDesigner30: TMemoField;
    odsDescriptionDSDesigner31: TStringField;
    odsDescriptionDSDesigner32: TStringField;
    odsDescriptionEAN: TStringField;
    odsDescriptionDSDesigner33: TStringField;
    procedure aCloseExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    RlsNomenID: Integer;
    { Public declarations }
  end;

//var
//  frmAbstract: TfrmAbstract;

implementation

uses mainform;

{$R *.DFM}

procedure TfrmAbstract.aCloseExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmAbstract.FormShow(Sender: TObject);
var I            : Integer;
    sBoldText    : String;
    sCommonText  : String;
begin
  odsDescription.SetVariable('FK_ID',RlsNomenID);
  try
    odsDescription.Open;
  except
    Application.MessageBox('Нет соединения с базой данных','Ошибка...',mb_ok+mb_iconerror);
    exit;
  end;
  For I := 2 to odsDescription.FieldCount - 1 do //пропускаются коды препаратов и номентклатуры
  begin
    if I = 11 then Continue;//пропускаем "Описание ф.д."(11) будет добавлятся к "Фармакологическое действие"(12)
    if trim(odsDescription.Fields[I].AsString) <> '' then
    begin
      sBoldText := odsDescription.Fields[I].DisplayName + ':';
      sCommonText := odsDescription.Fields[I].AsString;
      if I = 12 then sCommonText := odsDescription.Fields[I-1].AsString + sCommonText; //добавление
      reDescription.Lines.Add(sBoldText + ' ' + sCommonText);
      reDescription.SelStart := Length(reDescription.Text) - Length(sBoldText + ' ' + sCommonText) - 2;
      reDescription.SelLength := Length(sBoldText);
      reDescription.SelAttributes.Style := reDescription.SelAttributes.Style + [fsBold];
      reDescription.SelAttributes.Color := clBlue;
    end;
  end;
  reDescription.SelLength := 0;
end;

end.
