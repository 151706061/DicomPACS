unit fRlsChosePrep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, Db, OracleData, StdCtrls,
  ExtCtrls, ComCtrls, ToolWin, JvFormPlacement,
  frmRlsChosePrep_B, frmRlsChosePrep1, frmRlsChosePrep2, JvComponentBase;

type
  TfrmRlsChosePrep = class(TForm)
    alRls: TActionList;
    aOk: TAction;
    aCancel: TAction;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    aApplyFilter: TAction;
    FormStorage: TJvFormStorage;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    btnView: TToolButton;
    actView: TAction;
    frameRlsChosePrep: TframeRlsChosePrep_B;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aApplyFilterExecute(Sender: TObject);

    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actViewExecute(Sender: TObject);

  private
    { Private declarations }
    FilterChoice : Integer; // значение фильтра
    FilterText : string;
        
  public
    PrepInfo : TPrepInfo; // информация о выбранном препарате

    { Public declarations }
  end;


implementation

uses fdmMain;
{$R *.DFM}
//------------------------------------------------------------------------------
procedure TfrmRlsChosePrep.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
  frameRlsChosePrep.UpdateCurrentPrep( PrepInfo );
end;
//------------------------------------------------------------------------------
procedure TfrmRlsChosePrep.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;
//------------------------------------------------------------------------------
procedure TfrmRlsChosePrep.FormShow(Sender: TObject);
begin
  actViewExecute( nil );
end;
//------------------------------------------------------------------------------
procedure TfrmRlsChosePrep.aApplyFilterExecute(Sender: TObject);
begin
  frameRlsChosePrep.OnFormApplyFilterExecute;
end;
//------------------------------------------------------------------------------
procedure TfrmRlsChosePrep.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  frameRlsChosePrep.OnFormKeyDown( Sender, Key, Shift );
end;
//------------------------------------------------------------------------------

//constructor TfrmRlsChosePrep.Create(AOwner: TComponent; pEanCode: String;pNomenID: Integer);
//begin
//  inherited Create(AOwner);
//  sSelectRestriction := 'SELECT VNOMENRLS.FK_ID, ' +
//                        '       VNOMENRLS.EANCODE AS FC_EANCODE, ' +
//                        '       VPREPRLS.RESULT || VNOMENRLS.RESULT AS FC_PREP, ' +
//                        '       VPREPRLS.TRADENAME AS FC_TRADENAME, ' +
//                        '       VPREPRLS.LATINNAME AS FC_LATINNAME ' +
//                        '  FROM VPREPRLS, VNOMENRLS ' +
//                        ' WHERE VPREPRLS.FK_ID = VNOMENRLS.FK_PREP';
//  odsRlsPreps.Sql.Text := sSelectRestriction;
//  if Length(pEanCode) > 0 then
//  begin
//    rgFilter.ItemIndex := 2;
//    edFilter.Text := pEanCode;
//    aApplyFilter.Execute;
//  end
//  else if pNomenID > 0 then
//  begin
//    odsRlsPreps.Sql.Text := sSelectRestriction +
//      ' AND VNOMENRLS.FK_ID = ' + IntToStr(pNomenID);
//    odsRlsPreps.Open;
//  end;
//end;


 //#todo1 раскладка клавиатуры для использования штрих-кодов должна быть English(
 //Device генерит символы в соотв с раскладкой)

procedure TfrmRlsChosePrep.actViewExecute(Sender: TObject);
begin
  if Assigned(frameRlsChosePrep) then
  begin
    if frameRlsChosePrep.ClassName <> 'TframeRlsChosePrep_B' then
      frameRlsChosePrep.GetCurrentFilter( FilterChoice, FilterText );
    frameRlsChosePrep.Free;
  end;

  case actView.Tag of
    0 :  frameRlsChosePrep := TframeRlsChosePrep1.Create( self );
    1 :  frameRlsChosePrep := TframeRlsChosePrep2.Create( self );
  end;
  frameRlsChosePrep.Parent := Self;
  frameRlsChosePrep.Align  := alClient;
  frameRlsChosePrep.OnFormShow( PrepInfo.FC_EANCODE, PrepInfo.FK_ID, FilterChoice, FilterText );
   
  actView.Tag := (actView.Tag + 1) mod 2;  
end;

end.
