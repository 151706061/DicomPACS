unit fBrakSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ComCtrls, ToolWin, fdmMain, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  JvComponentBase, JvFormPlacement, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, OracleData, cxTextEdit, cxMemo, cxCheckBox,
  cxHyperLinkEdit;

type
  TfmBrakSelect = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    tbuSelect: TToolButton;
    tbuFilter: TToolButton;
    ToolButton11: TToolButton;
    ToolButton6: TToolButton;
    ToolButton5: TToolButton;
    ToolButton3: TToolButton;
    al: TActionList;
    acClose: TAction;
    acRefresh: TAction;
    acSelect: TAction;
    acFilter: TAction;
    dsBRAK_MED: TDataSource;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1FK_ID: TcxGridDBColumn;
    cxGrid1DBTableView1UNIQSTR: TcxGridDBColumn;
    cxGrid1DBTableView1DRUGTXT: TcxGridDBColumn;
    cxGrid1DBTableView1SERIESNR: TcxGridDBColumn;
    cxGrid1DBTableView1LABNM: TcxGridDBColumn;
    cxGrid1DBTableView1LETTERDATE: TcxGridDBColumn;
    cxGrid1DBTableView1LETTERNR: TcxGridDBColumn;
    cxGrid1DBTableView1MNFNM: TcxGridDBColumn;
    cxGrid1DBTableView1SPECNM: TcxGridDBColumn;
    cxGrid1DBTableView1COUNTRYR: TcxGridDBColumn;
    cxGrid1DBTableView1FLGFALS: TcxGridDBColumn;
    cxGrid1DBTableView1FLGALLOW: TcxGridDBColumn;
    cxGrid1DBTableView1ALLOWNR: TcxGridDBColumn;
    cxGrid1DBTableView1ALLOWDATE: TcxGridDBColumn;
    cxGrid1DBTableView1LETTERTYPE: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    JvFormStorage1: TJvFormStorage;
    cxGrid1DBTableView1FILENAMEFIRST: TcxGridDBColumn;
    cxGrid1DBTableView1FILENAMEOTHER: TcxGridDBColumn;
    procedure acRefreshExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acSelectExecute(Sender: TObject);
    procedure acFilterExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
    FModalRes : Integer;
    FSERIESNR : string;
  public
    { Public declarations }
  end;

  function DoCheckAndShowBrakSelect(aOwner : TComponent; const aX, aY : Integer; var UNIQSTR : string; const aSERIESNR : string = '') : Boolean;

implementation
uses
  ShellAPI;

{$R *.dfm}
//==============================================================================
  function DoCheckAndShowBrakSelect(aOwner : TComponent; const aX, aY : Integer; var UNIQSTR : string; const aSERIESNR : string = '') : Boolean;
  var
    fmBrakSelect : TfmBrakSelect;
    IsLocated : boolean;

  begin
    if Assigned(aOwner) then
      fmBrakSelect := TfmBrakSelect.Create(aOwner)
    else
      Application.CreateForm(TfmBrakSelect, fmBrakSelect);
    try
      fmBrakSelect.cxGrid1DBTableView1.DataController.DataSource := nil;
      dmMain.odsBRAK_MED.Close;
      dmMain.odsBRAK_MED.SetVariable('pall', 0);
      dmMain.odsBRAK_MED.SetVariable('pSERIESNR', aSERIESNR);
      dmMain.odsBRAK_MED.Open;
      dmMain.odsBRAK_MED.First;

      if (dmMain.odsBRAK_MED.RecordCount = 0) then
      begin
        Result := False;
        UNIQSTR := '';
        Exit; // типа проверили серию, ничего не нашли - партия не в угоне
      end;

      // теперь просто открываем форму для отображения забракованных медикаментов с похожими сериями
      fmBrakSelect.Left := aX;
      fmBrakSelect.Top  := aY;
      fmBrakSelect.FSERIESNR := aSERIESNR;
      fmBrakSelect.acFilter.Checked := (aSERIESNR <> '');
      fmBrakSelect.acFilter.Visible := (aSERIESNR <> '');
      fmBrakSelect.acFilter.Enabled := (aSERIESNR <> '');

      fmBrakSelect.cxGrid1DBTableView1.DataController.DataSource := fmBrakSelect.dsBRAK_MED;

      IsLocated := False;
      if UNIQSTR <> '' then
        IsLocated := dmMain.odsBRAK_MED.Locate('UNIQSTR', UNIQSTR, []);

      if IsLocated = False then
        dmMain.odsBRAK_MED.Locate('SERIESNR', aSERIESNR, []);
       

      if (fmBrakSelect.ShowModal = mrOk)and(fmBrakSelect.cxGrid1DBTableView1.DataController.RecordCount > 0) then
      begin
        if VarIsNull(fmBrakSelect.cxGrid1DBTableView1UNIQSTR.EditValue) then
        begin
          UNIQSTR :=  '';
        end else
        begin
          UNIQSTR :=  fmBrakSelect.cxGrid1DBTableView1UNIQSTR.EditValue;
        end;
        Result := True;        
      end
      else
      begin
        UNIQSTR := '';
        Result := False;
      end;
    finally
      if Assigned(fmBrakSelect) then FreeAndNil( fmBrakSelect );
    end;
  end;
//==============================================================================
procedure TfmBrakSelect.acRefreshExecute(Sender: TObject);
begin
  dmMain.odsBRAK_MED.Close;
  dmMain.odsBRAK_MED.Open;
end;

procedure TfmBrakSelect.FormCreate(Sender: TObject);
begin
  FModalRes := mrNone;
end;

procedure TfmBrakSelect.acCloseExecute(Sender: TObject);
begin
  FModalRes    := mrCancel;
  ModalResult := mrCancel;
end;

procedure TfmBrakSelect.acSelectExecute(Sender: TObject);
begin
  FModalRes    := mrOk;
  ModalResult := mrOk;  
end;

procedure TfmBrakSelect.cxGrid1DBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  if (ACellViewInfo.Item.Index = cxGrid1DBTableView1FILENAMEFIRST.Index) or
     (ACellViewInfo.Item.Index = cxGrid1DBTableView1FILENAMEOTHER.Index)
  then
    ShellExecute( 0, PChar('open'), PChar(String(ACellViewInfo.Item.EditValue)), nil, nil, SW_SHOWMAXIMIZED );
end;

procedure TfmBrakSelect.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FModalRes = mrNone then
    ModalResult := mrCancel;
  Action := caHide;
end;

procedure TfmBrakSelect.acFilterExecute(Sender: TObject);
begin
  acFilter.Checked := tbuFilter.Down;
  case acFilter.Checked of
    True:
    begin
      dmMain.odsBRAK_MED.SetVariable('pSERIESNR', FSERIESNR);
      dmMain.odsBRAK_MED.SetVariable('pAll', 0);
    end;

    False:
    begin
      dmMain.odsBRAK_MED.SetVariable('pSERIESNR', FSERIESNR);
      dmMain.odsBRAK_MED.SetVariable('pAll', 1);
    end;
  end; // case chbFilterByMedics.Checked then
  acRefresh.Execute;
end;

procedure TfmBrakSelect.FormDestroy(Sender: TObject);
begin
  dmMain.odsBRAK_MED.Close;
end;

end.
