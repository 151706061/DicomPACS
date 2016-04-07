unit fSetUch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, ActnList, ExtCtrls, cxGraphics, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, StdCtrls, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, OracleData, Registry, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, dxSkinsdxBarPainter, cxLabel,
  Menus, cxLookAndFeelPainters, cxButtons, dxSkinOffice2007Green;

type
  TfrmSetUch = class(TForm)
    actlstOkCancel: TActionList;
    actOk: TAction;
    actClose: TAction;
    cxGrid1: TcxGrid;
    TV: TcxGridDBTableView;
    VNAME: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    odsListUch: TOracleDataSet;
    dsListUch: TDataSource;
    Panel1: TPanel;
    lcbType: TcxLookupComboBox;
    cxLabel1: TcxLabel;
    dsType: TDataSource;
    odsType: TOracleDataSet;
    Panel2: TPanel;
    bOk: TcxButton;
    cxButton1: TcxButton;
    procedure actOkExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure lcbTypePropertiesEditValueChanged(Sender: TObject);
    procedure odsListUchAfterOpen(DataSet: TDataSet);
    procedure TVCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
  public
    procedure DoShowForm;
    { Public declarations }
  end;

var
  frmSetUch: TfrmSetUch;

implementation

uses fMain;

{$R *.dfm}

{ TfrmSetUch }

procedure TfrmSetUch.DoShowForm;
var Reg : TregIniFile;
begin
  actOk.Enabled := False;
  if odsType.Active = False then
    odsType.Active := True;

  Reg:=TRegIniFile.Create;
  try
    Reg.RootKey:=HKEY_CURRENT_USER;
    Reg.OpenKey('\Software\Softmaster\EditTalon\ID_SOTR'+IntToStr(frmMain.pSOTRID), True);
    lcbType.EditValue := Reg.ReadInteger('\Software\Softmaster\EditTalon\ID_SOTR'+IntToStr(frmMain.pSOTRID), 'ID_UCH', 0);
  finally
    Reg.Free;
  end;
end;

procedure TfrmSetUch.actOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetUch.actCloseExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetUch.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var Reg : TRegIniFile;
begin
  Reg := TRegIniFile.Create;
  try
    Reg.RootKey:=HKEY_CURRENT_USER;
    if not Reg.OpenKey('\Software\Softmaster\EditTalon\', FALSE) then
      Reg.CreateKey('\Software\Softmaster\EditTalon');
    try
      Reg.WriteInteger('\Software\Softmaster\EditTalon\ID_SOTR'+IntToStr(frmMain.pSOTRID), 'ID_UCH', lcbType.EditValue);
    except
    end;
  finally
    Reg.Free;
  end;
end;

procedure TfrmSetUch.lcbTypePropertiesEditValueChanged(Sender: TObject);
begin
  odsListUch.Close;
  odsListUch.SetVariable('pfk_typeid', lcbType.EditValue);
  odsListUch.Open;
end;

procedure TfrmSetUch.odsListUchAfterOpen(DataSet: TDataSet);
begin
  actOk.Enabled := odsListUch.RecordCount <> 0;
end;

procedure TfrmSetUch.TVCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if actOk.Enabled = True then
    ModalResult := mrOk;
end;

end.
