unit fNarcoticActReportUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ToolWin, ActnMan, ActnCtrls, cxStyles, cxGraphics, cxEdit, cxTextEdit, cxVGrid, cxControls, cxInplaceContainer,
  ComCtrls;

type
  TfNarcoticActReport = class(TForm)
    al: TActionList;
    acOk: TAction;
    acCancel: TAction;
    tbCommon: TToolBar;
    btnOk: TToolButton;
    btnCancel: TToolButton;
    sepOk: TToolButton;
    cbCommon: TCoolBar;
    grdParams: TcxVerticalGrid;
    grdParamsActNumber: TcxEditorRow;
    grdParamsPredsedatel: TcxEditorRow;
    grdParamsCommission1: TcxEditorRow;
    grdParamsPack: TcxEditorRow;
    grdParamsCommission2: TcxEditorRow;
    procedure acOkExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function DoAddParamsNarcoticAct ( var aParams : Variant ) : TModalResult;

implementation

uses fdmMain, cxVGridLayoutEditor;

{$R *.dfm}

function DoAddParamsNarcoticAct ( var aParams : Variant ) : TModalResult;
var
  fNarcoticActReport: TfNarcoticActReport;
begin
  Result := mrNone;

  if( VarArrayHighBound( aParams, 1 ) < 3 ) then
  begin
    Application.MessageBox(PChar( '������� ����� ������ ����������!' ), PChar ( '��������' ), MB_OK + MB_ICONERROR);
    Exit;
  end;

  fNarcoticActReport := TfNarcoticActReport.Create(nil);

  try
    with  fNarcoticActReport do
    begin
      grdParams.BeginUpdate;
      grdParamsActNumber.Properties.Value := VarToStr( aParams [0] );  // ����� ����
      grdParamsPredsedatel.Properties.Value := VarToStr( aParams[1] ); // ������������
      grdParamsCommission1.Properties.Value := VarToStr( aParams[2] ); // ����� ��������
      grdParamsCommission2.Properties.Value := VarToStr( aParams[3] ); // ����� ��������
      grdParamsPack.Properties.Value := VarToStr( aParams[4] ); // ��������
      grdParams.EndUpdate;
    end;

    Result := fNarcoticActReport.ShowModal;

    if ( Result = mrOk ) then
    begin
      fNarcoticActReport.grdParams.HideEdit; // ������� ��������

      aParams[0] := Trim( VarToStrDef( fNarcoticActReport.grdParamsActNumber.Properties.Value, EmptyStr ) ) ;   // ����� ����
      aParams[1] := Trim( VarToStrDef( fNarcoticActReport.grdParamsPredsedatel.Properties.Value, EmptyStr) );  // ������������
      aParams[2] := Trim( VarToStrDef( fNarcoticActReport.grdParamsCommission1.Properties.Value, EmptyStr ) );   // ����� ��������
      aParams[3] := Trim( VarToStrDef( fNarcoticActReport.grdParamsCommission2.Properties.Value, EmptyStr ) );   // ����� ��������
      aParams[4] := Trim( VarToStrDef( fNarcoticActReport.grdParamsPack.Properties.Value, EmptyStr ) );         // ��������
    end;                                                                     
  finally
    fNarcoticActReport.Free;
  end;
end;

procedure TfNarcoticActReport.acCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfNarcoticActReport.acOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.

