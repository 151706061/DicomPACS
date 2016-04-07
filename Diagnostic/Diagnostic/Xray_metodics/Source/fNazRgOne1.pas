unit fNazRgOne1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, OracleData, Oracle, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ActnList, ImgList, dxBar,
  cxImageComboBox, ExtCtrls, dxBarExtItems, cxLabel, cxContainer,
  cxTextEdit, Registry, fMain, cxSplitter, StrUtils, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, dxSkinsdxBarPainter,
  dxSkinOffice2007Green;

type
  TfrmNazRg1 = class(TForm)
    ds: TDataSource;
    odsChild: TOracleDataSet;
    al: TActionList;
    dxBarDockControl1: TdxBarDockControl;
    BM: TdxBarManager;
    bbExit: TdxBarButton;
    IL: TImageList;
    aClose: TAction;
    Panel1: TPanel;
    TVGROUPS: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    Splitter1: TSplitter;
    VGROUPNAME: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    Panel2: TPanel;
    cxGrid1: TcxGrid;
    TV: TcxGridDBTableView;
    TVNAME: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    dxBarDockControl2: TdxBarDockControl;
    stName: TdxBarStatic;
    odsGroups: TOracleDataSet;
    dsGroups: TDataSource;
    bbSet: TdxBarButton;
    aSet: TAction;
    procedure TVDblClick(Sender: TObject);
    procedure TVKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure aCloseExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure odsGroupsAfterScroll(DataSet: TDataSet);
    procedure aSetExecute(Sender: TObject);
  private
    { Private declarations }
  public
    procedure DoShowfrmNazRg;
    { Public declarations }
  end;

var
  frmNazRg1: TfrmNazRg1;

implementation

{$R *.dfm}

procedure TfrmNazRg1.TVDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmNazRg1.TVKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
    begin
      TVDblClick(nil);
    end;
end;

procedure TfrmNazRg1.aCloseExecute(Sender: TObject);
begin
  ModalResult := MrCancel;
end;

procedure TfrmNazRg1.FormCreate(Sender: TObject);
begin
  odsGroups.AfterScroll := nil;
  if odsGroups.Active = FALSE then
    odsGroups.Open;
  odsGroups.AfterScroll := odsGroupsAfterScroll;  
end;

procedure TfrmNazRg1.aSetExecute(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmNazRg1.DoShowfrmNazRg;
var  id : Integer;
    Reg : TRegIniFile;
begin
  Reg:=TRegIniFile.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
  Reg.OpenKey('\Software\Softmaster\Xray_metodics\fNazRg\ID_VIDNAZ'+IntToStr(frmMain.pSOTRID), True);
  id := Reg.ReadInteger('\Software\Softmaster\Xray_metodics\fNazRg\ID_VIDNAZ'+IntToStr(frmMain.pSOTRID), 'ID_VIDNAZ', 0);
  odsGroups.AfterScroll := nil;
  if id <> 0 then
    odsGroups.Locate('FK_ID', id, []);
  odsChild.Close;
  odsChild.SetVariable('PFK_GROUP', odsGroups.FieldByName('FK_ID').AsInteger);
  odsChild.Open;
  stName.Caption := odsGroups.FieldByName('FC_NAME').AsString;
  odsGroups.AfterScroll := odsGroupsAfterScroll;
  Reg.Free;
end;

procedure TfrmNazRg1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var Reg : TRegIniFile;
begin
  Reg := TRegIniFile.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
  if not Reg.OpenKey('\Software\Softmaster\Xray_metodics\fNazRg\', FALSE) then
   begin
     Reg.CreateKey('\Software\Softmaster\Xray_metodics\fNazRg');
   end;
  try
    Reg.WriteInteger('\Software\Softmaster\Xray_metodics\fNazRg'+'\ID_VIDNAZ'+IntToStr(frmMain.pSOTRID), 'ID_VIDNAZ', odsGroups.FieldByName('FK_ID').AsInteger);
  except
  end;
  Reg.Free;
end;

procedure TfrmNazRg1.odsGroupsAfterScroll(DataSet: TDataSet);
begin
  odsChild.Close;
  odsChild.SetVariable('PFK_GROUP', odsGroups.FieldByName('FK_ID').AsInteger);
  odsChild.Open;
  stName.Caption := odsGroups.FieldByName('FC_NAME').AsString;
end;

end.
