unit fRlsFarmGroup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData,fdmMain, ExtCtrls,
  StdCtrls, DBCtrls, ActnList, ComCtrls, ToolWin, JvFormPlacement,
  JvComponentBase, cxGraphics, cxCustomData, cxStyles, cxTL, cxMaskEdit,
  cxInplaceContainer, cxDBTL, cxControls, cxTLData;

type
  TfrmRlsFarmGroup = class(TForm)
    odsRlsFarmGroups: TOracleDataSet;
    odsRlsFarmGroupsFK_ID: TFloatField;
    odsRlsFarmGroupsFK_PARENT: TFloatField;
    odsRlsFarmGroupsFC_NAME: TStringField;
    odsRlsFarmGroupsDESCRIPTION: TMemoField;
    dsRlsFarmGroups: TDataSource;
    paRls: TPanel;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    ToolButton1: TToolButton;
    alRls: TActionList;
    aOk: TAction;
    aCancel: TAction;
    aExpandCollapse: TAction;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    paName: TPanel;
    paDescription: TPanel;
    gbDescription: TGroupBox;
    meRlsDescription: TDBMemo;
    Splitter1: TSplitter;
    FormStorage: TJvFormStorage;
    lbFilter: TLabel;
    edFilter: TEdit;
    grRlsFarmGroups: TcxDBTreeList;
    cxDBTreeList1FK_ID: TcxDBTreeListColumn;
    cxDBTreeList1FK_PARENT: TcxDBTreeListColumn;
    cxDBTreeList1FC_NAME: TcxDBTreeListColumn;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aExpandCollapseExecute(Sender: TObject);
    procedure edFilterChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
//    procedure grRlsFarmGroupsCustomDrawCell(Sender: TObject;
//      ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
//      AColumn: TdxTreeListColumn; ASelected, AFocused,
//      ANewItemRow: Boolean; var AText: String; var AColor: TColor;
//      AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  private
    { Private declarations }
  public
    Constructor Create(AOwner: TComponent; RlsID: Integer); reintroduce;
    { Public declarations }
  end;

//var
//  frmRlsFarmGroup: TfrmRlsFarmGroup;

implementation

uses fFarmGrEdit, Oracle, JvDBUtils;

{$R *.DFM}

procedure TfrmRlsFarmGroup.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmRlsFarmGroup.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmRlsFarmGroup.aExpandCollapseExecute(Sender: TObject);
begin
  TAction(Sender).Checked := not TAction(Sender).Checked;
  if TAction(Sender).Checked then
  begin
    TAction(Sender).ImageIndex := 53;
    grRlsFarmGroups.FullExpand;
  end
  else
  begin
    TAction(Sender).ImageIndex := 54;
    grRlsFarmGroups.FullCollapse;
  end;
end;

Constructor TfrmRlsFarmGroup.Create(AOwner: TComponent; RlsID: Integer);
begin
  inherited Create(AOwner);
  try
    odsRlsFarmGroups.Open;
    if odsRlsFarmGroups.Lookup('FK_ID',rLSid,'FK_ID') > -1 then
      odsRlsFarmGroups.Locate('FK_ID',rLSid,[]);
  except
    Application.MessageBox('Нет соединения с сервером','Ошибка...', mb_ok + mb_iconwarning);
  end;
  aExpandCollapse.Execute;
end;

procedure TfrmRlsFarmGroup.edFilterChange(Sender: TObject);
begin
  odsRlsFarmGroups.Filtered := TEdit(Sender).Text <> '';
  odsRlsFarmGroups.Filter := 'FC_NAME=''*' + TEdit(Sender).Text+ '*''';
end;

procedure TfrmRlsFarmGroup.FormResize(Sender: TObject);
begin
//  paName.Height := paRls.Height div 2;
end;

//procedure TfrmRlsFarmGroup.grRlsFarmGroupsCustomDrawCell(Sender: TObject;
//  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
//  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
//  var AText: String; var AColor: TColor; AFont: TFont;
//  var AAlignment: TAlignment; var ADone: Boolean);
//begin
//  if not ASelected then begin
//    if ANode.AbsoluteIndex mod 2 = 0 then AColor := $00ACE1F0
//    else AColor := clSilver;
//  end;
//end;

end.
