unit fSelectSotr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, ComCtrls, ToolWin, ExtCtrls, Db, OracleData, Variants,
  JvComponentBase, cxGraphics, cxCustomData, cxStyles, cxTL, cxMaskEdit,
  cxTextEdit, cxInplaceContainer, cxDBTL, cxControls, cxTLData,
  JvFormPlacement, ImgList, fdmMain;

type
  TfrmSelectSotr = class(TForm)
    paAll: TPanel;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    al: TActionList;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    acSelect: TAction;
    odsSotr: TOracleDataSet;
    dsSotr: TDataSource;
    acExit: TAction;
    il: TImageList;
    FormStorage: TJvFormStorage;
    grdSotrList: TcxDBTreeList;
    cxDBTreeList1FK_ID: TcxDBTreeListColumn;
    cxDBTreeList1FK_OWNERID: TcxDBTreeListColumn;
    cxDBTreeList1FC_NAME: TcxDBTreeListColumn;
    grdSotrListcxDBTreeListFK_SOTRID: TcxDBTreeListColumn;
    procedure acSelectExecute(Sender: TObject);
    procedure acExitExecute(Sender: TObject);
    procedure dxDBTreeList1DblClick(Sender: TObject);
    procedure alUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FSotrId: Integer;
    procedure SetSotrId(Value: Integer);
    { Private declarations }
  public
    property SotrId: Integer read FSotrId write SetSotrId;
    { Public declarations }
  end;


implementation

{$R *.DFM}

procedure TfrmSelectSotr.acSelectExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSelectSotr.alUpdate(Action: TBasicAction; var Handled: Boolean);
begin
  // выбираем только сотрудников,а не все вподряд
  acSelect.Enabled := ( Assigned( odsSotr) ) and ( odsSotr.Active ) and ( not odsSotr.IsEmpty) and
    Assigned( grdSotrList.FocusedNode) and ( not VarIsNull( grdSotrList.FocusedNode.Values[grdSotrListcxDBTreeListFK_SOTRID.ItemIndex]));
end;

procedure TfrmSelectSotr.acExitExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSelectSotr.SetSotrId(Value: Integer);
begin
  FSotrId := Value;
end;

procedure TfrmSelectSotr.dxDBTreeList1DblClick(Sender: TObject);
begin
  acSelect.Execute;
end;

procedure TfrmSelectSotr.FormCreate(Sender: TObject);
begin
  FSotrId := -1;
end;

procedure TfrmSelectSotr.FormShow(Sender: TObject);
begin
  try
    odsSotr.Close;
    odsSotr.Open;
    odsSotr.First;

    if FSotrId > 0 then
      odsSotr.Locate( 'FK_SOTRID', FSotrId, [] );  
  except
    on e : Exception do
    begin
      Application.MessageBox( PAnsiChar( 'Ошибка при открытии списка сотрудников!' + #13#10 + e.Message ), MSG_CAPTION_ERROR, MB_OK + MB_ICONERROR );
      Exit;
    end;
  end;
end;

end.
