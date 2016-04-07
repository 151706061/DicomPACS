unit fSendParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ActnList, Menus, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinsDefaultPainters, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel,
  StdCtrls, cxButtons, dxSkinOffice2007Green, cxMaskEdit, cxButtonEdit, cxDBEdit,
  dxSkinBlack, ComCtrls, pFIBDatabase, dxSkinOffice2007Black, cxGraphics,
  cxDropDownEdit, cxSpinEdit, cxTrackBar, DB_CMN, Medotrade;

type
  TfrmSendParam = class(TForm)
    Panel1: TPanel;
    alOKCancel: TActionList;
    aOk: TAction;
    aCancel: TAction;
    bOk: TcxButton;
    bCancel: TcxButton;
    cxLabel3: TcxLabel;
    EdtAETitle: TcxButtonEdit;
    GroupBox2: TGroupBox;
    Panel2: TPanel;
    Label1: TLabel;
    CBTypeZip: TcxComboBox;
    Label2: TLabel;
    LbPrc: TLabel;
    TBSetZipPrc: TcxTrackBar;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EdtAETitlePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxTrackBar1PropertiesChange(Sender: TObject);
    procedure CBTypeZipPropertiesChange(Sender: TObject);
  public
    teServer : string;
    tePort   : Integer;
    pr_zip   : integer;
    ZipQuality : integer;
    v_device_comm,
    v_device_name : string;
    frmSendParam: TfrmSendParam;
    v_trRead    : TpFIBTransaction;
    v_DB        : TpFIBDatabase;
    procedure SetShowPacsList( p_is_show_pacs_list : Boolean = True );
  end;

implementation

Uses {fMain,} pFIBDataSet, UnFrmGetDevices, DICOM_CMN;

{$R *.dfm}

procedure TfrmSendParam.SetShowPacsList( p_is_show_pacs_list : Boolean = True );
begin
  Panel1.Visible:=p_is_show_pacs_list;
  Height:=Height-Panel1.Height;
end;

procedure TfrmSendParam.aCancelExecute(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TfrmSendParam.aOkExecute(Sender: TObject);
//var FIBDataSet: TpFIBDataSet;
  procedure LocPrc;
  begin
    // установим тип сжатия
    pr_zip:=CBTypeZip.ItemIndex;
    ZipQuality:=TBSetZipPrc.Position*10; // Trunc(TBSetZipPrc.Position*100/TBSetZipPrc.Properties.Max);
    ModalResult:=mrOk;
  end;
begin
  teServer := '';
  tePort   := 0;
  // определим параметры устройства
  if Panel1.Visible then
  begin
    if v_DB=nil then
    begin
      v_DB:=DB_CMN.DB;
      v_trRead:=DB_CMN.trRead;
    end;
    gt_servParms ( v_device_name,
                   v_DB,
                   v_trRead,
                   v_isPostgres ,
                   DB_CMN.PGconn,
                   DB_CMN.MnUniTransaction,
                   v_isOracle,
                   DB_CMN.OraConn,
                   teServer,
                   tePort );
    if ((tePort>0) and
        (Trim(teServer)<>''))
    then
    begin
      LocPrc;
    end else
    begin
      MessageDlg('Устройство '+EdtAETitle.Text+' не найдено в списке устройств.', mtWarning, [mbOK], 0);
    end;
  end else
  begin
    LocPrc;
  end;
end;

procedure TfrmSendParam.CBTypeZipPropertiesChange(Sender: TObject);
begin
  if (v_trsyntList[CBTypeZip.SelectedItem,1] = '1') then
   begin
     TBSetZipPrc.Enabled := True;
   end else
   begin
     TBSetZipPrc.Position:=TBSetZipPrc.Properties.Max;
     TBSetZipPrc.Enabled := False;
   end;
end;

procedure TfrmSendParam.cxTrackBar1PropertiesChange(Sender: TObject);
begin
  LbPrc.Caption := IntToStr(Trunc((TBSetZipPrc.Position*100)/TBSetZipPrc.Properties.Max))+' % ';
end;

procedure TfrmSendParam.EdtAETitlePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin // выбор AETitle из списка
  Application.CreateForm(TFrmGetDevices, FrmGetDevices);
  try
    FrmGetDevices.SetPosListAETitle(EdtAETitle.Text);
    if FrmGetDevices.ShowModal = mrok then
    begin
      EdtAETitle.Text := FrmGetDevices.v_device_name_chk+' ('+FrmGetDevices.v_AETitle_chk+')';
      v_device_name:=FrmGetDevices.v_AETitle_chk;
      v_device_comm:=FrmGetDevices.v_device_name_chk;
    end;
  finally
    FreeAndNil(FrmGetDevices);
  end;
end;

procedure TfrmSendParam.FormCreate(Sender: TObject);
var I: Integer;
begin
  teServer := '';
  tePort   := 0;
  CBTypeZip.Properties.Items.Clear;
  // v_trsyntList
  for I := 0 to Length(v_trsyntList) - 1 do
    CBTypeZip.Properties.Items.Add(v_trsyntList[i,0]);
end;

end.
