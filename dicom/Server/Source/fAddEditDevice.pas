unit fAddEditDevice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit, cxGroupBox, cxLabel,
  cxContainer, cxEdit, cxImage, ExtCtrls, JvExExtCtrls, JvExtComponent, JvPanel,
  cxPC, cxControls, cxMaskEdit, ActnList, JvDBUtils, FIBQuery, pFIBQuery, pFIBProps,
  dxSkinOffice2007Green;

type
  TfrmAddEditDevice = class(TForm)
    pcParam: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    teTitle: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    teIP: TcxTextEdit;
    cxLabel3: TcxLabel;
    mePort: TcxMaskEdit;
    al: TActionList;
    aSave: TAction;
    aCancel: TAction;
    aAdd: TAction;
    Panel1: TPanel;
    cxButton1: TcxButton;
    bSave: TcxButton;
    bClose: TcxButton;
    procedure aAddExecute(Sender: TObject);
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddEditDevice: TfrmAddEditDevice;

implementation

uses fMain, fParam;

{$R *.dfm}

procedure TfrmAddEditDevice.aAddExecute(Sender: TObject);
var qFIB : TpFIBQuery;
begin
  mePort.PostEditValue;
  if teTitle.Text = '' then
    begin
      Application.MessageBox('Вы не указали AE Title терминала!', 'Предупреждение', MB_OK);
      teTitle.SetFocus;
      Exit;
    end;
  if teIP.Text = '' then
    begin
      Application.MessageBox('Вы не указали IP-адрес терминала!', 'Предупреждение', MB_OK);
      teIP.SetFocus;
      Exit;
    end;
  if mePort.Text = '' then
    begin
      Application.MessageBox('Вы не указали порт терминала!', 'Предупреждение', MB_OK);
      mePort.SetFocus;
      Exit;
    end;
  qFIB := TpFIBQuery.Create(nil);
  try
    qFIB.Database := frmMain.DB;
    if frmMain.trWrite.Active = False then
      frmMain.trWrite.Active := True;
    qFIB.Transaction := frmMain.trWrite;
    qFIB.Options := qFIB.Options + [qoAutoCommit];
    qFIB.SQL.Text := ' INSERT INTO DEVICES(FC_TITLE, FC_IP, FN_PORT) '+
                     ' VALUES(:PFC_TITLE, :PFC_IP, :PFN_PORT) ';
    qFIB.ParamByName('PFC_TITLE').AsString := teTitle.Text;
    qFIB.ParamByName('PFC_IP').AsString := teIP.Text;
    qFIB.ParamByName('PFN_PORT').AsInteger := mePort.EditValue;
    qFIB.ExecQuery;
    RefreshQuery(frmParam.dsDevices);
    frmParam.CheckEnabledButtons;
  finally
    qFIB.Free;
    teTitle.Clear;
    teIP.Clear;
    mePort.Clear;
    teTitle.SetFocus;
  end;
end;

procedure TfrmAddEditDevice.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmAddEditDevice.aSaveExecute(Sender: TObject);
begin
  if teTitle.Text = '' then
    begin
      Application.MessageBox('Вы не указали AE Title терминала!', 'Предупреждение', MB_OK);
      teTitle.SetFocus;
      Exit;
    end;
  if teIP.Text = '' then
    begin
      Application.MessageBox('Вы не указали IP-адрес терминала!', 'Предупреждение', MB_OK);
      teIP.SetFocus;
      Exit;
    end;
  if mePort.Text = '' then
    begin
      Application.MessageBox('Вы не указали порт терминала!', 'Предупреждение', MB_OK);
      mePort.SetFocus;
      Exit;
    end;
  ModalResult := mrOk;
end;

end.
