unit uMKB10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, cxClasses, ActnList, Menus,
  cxLookAndFeelPainters, cxGraphics, cxCustomData, cxStyles, cxTL, cxCheckBox,
  cxMaskEdit, cxInplaceContainer, cxDBTL, cxTLData, DB, OracleData, StdCtrls,
  cxButtons, cxControls, cxContainer, cxEdit, cxTextEdit, ExtCtrls, OracleMonitor,
  ImgList, fMain;

type
  TfrmMKB10 = class(TForm)
    ActionList1: TActionList;
    aOK: TAction;
    aCancel: TAction;
    aCollapse: TAction;
    aExpand: TAction;
    aDelFiltr: TAction;
    aDelPacFiltr: TAction;
    BM: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    Panel1: TPanel;
    Label1: TLabel;
    FilterText: TcxTextEdit;
    cxButton1: TcxButton;
    odsUslList: TOracleDataSet;
    dsUslList: TDataSource;
    tlUslList: TcxDBTreeList;
    tlUslListcxDBTreeListColumn1: TcxDBTreeListColumn;
    tlUslListcxDBTreeListColumn2: TcxDBTreeListColumn;
    tlUslListcxDBTreeListColumn3: TcxDBTreeListColumn;
    aClearMark: TAction;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    cxImageList1: TcxImageList;

    procedure FilterTextKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aCollapseExecute(Sender: TObject);
    procedure aExpandExecute(Sender: TObject);
    procedure aClearMarkExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Init();
    procedure SaveMKB();


  end;

  function SetMKB10():Boolean;

implementation


{$R *.dfm}

function SetMKB10():Boolean;
begin
  with TfrmMKB10.Create(nil) do
  begin
    try
      Init();
      Result := ShowModal = mrOk;
      if (Result) then
      begin
        SaveMKB();
      end;
    finally
      Free;
    end;
  end;
end;

procedure TfrmMKB10.SaveMKB();
var
  I:Integer;
  iLen:Integer;
begin
   SetLength(frmMain.arMKB,0);
   with odsUslList do
   begin
     if State in [dsEdit] then
        Post;     
     tlUslList.BeginUpdate;
     DisableControls;
     try
       First;
       for I := 0 to RecordCount - 1 do
       begin
         if FieldByName('fl_check').AsInteger = 1 then
         begin
           iLen := Length(frmMain.arMKB);
           SetLength(frmMain.arMKB,iLen+1);
           frmMain.arMKB[iLen] := FieldByName('fk_id').AsInteger;
         end;
         Next;
       end;
     finally
       tlUslList.EndUpdate;
       EnableControls;
     end;
   end;
end;

procedure TfrmMKB10.Init();
var
  I: Integer;
begin
  odsUslList.Close;
  odsUslList.Open;
  tlUslList.BeginUpdate;
  odsUslList.DisableControls;
  try
    for I := 0 to Length(frmMain.arMKB) - 1 do
    begin
      if odsUslList.Locate('fk_id',frmMain.arMKB[i],[]) then
      begin
        odsUslList.Edit;
        odsUslList.FieldByName('fl_check').AsInteger := 1;
        odsUslList.Post;
      end;
    end;
  finally
    tlUslList.EndUpdate;
    odsUslList.EnableControls;
  end;
end;

procedure TfrmMKB10.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmMKB10.aClearMarkExecute(Sender: TObject);
var
  I: Integer;
  id:Integer;
begin
    id := odsUslList.FieldByName('fk_id').AsInteger;
    tlUslList.BeginUpdate;
    odsUslList.DisableControls;
    try
      odsUslList.First;
      for I := 0 to odsUslList.RecordCount - 1 do
      begin
        if (odsUslList.FieldByName('fl_check').AsInteger = 1) then
        begin
          odsUslList.Edit;
          odsUslList.FieldByName('fl_check').AsInteger := 0;
          odsUslList.Post;

        end;
        odsUslList.Next;
      end;
    finally
      tlUslList.EndUpdate;
      odsUslList.EnableControls;
      odsUslList.Locate('fk_id',id,[]);
    end;
end;

procedure TfrmMKB10.aCollapseExecute(Sender: TObject);
begin
  tlUslList.FullCollapse;
end;

procedure TfrmMKB10.aExpandExecute(Sender: TObject);
begin
  tlUslList.FullExpand;
end;

procedure TfrmMKB10.aOKExecute(Sender: TObject);
begin
  if not odsUslList.Active then Exit;
  ModalResult := mrOk;
end;

procedure TfrmMKB10.FilterTextKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 38 then
  begin
      tlUslList.GotoPrev;
      Exit;
  end;

  if Key = 40 then
  begin
      tlUslList.GotoNext;
      Exit;
  end;

  if Key = VK_RETURN then
  begin
      aOK.Execute;
      Exit;
  end;

  odsUslList.Filtered := false;
  if length(FilterText.Text) > 0 then
  begin
    odsUslList.Filter := 'fc_name = ''*' + AnsiUpperCase(FilterText.Text) + '*'' ';
    odsUslList.Filtered := true;
    aDelFiltr.Enabled := True;
  end
  else begin
    aDelFiltr.Enabled := False;
  end;
end;

end.
