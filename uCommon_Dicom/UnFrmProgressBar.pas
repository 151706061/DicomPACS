{ ����� ��� ����������� progressbar
  ��� �������� ����� �����
  PostMessage(Self.Handle, WM_SYSCOMMAND, SC_CLOSE, 0);
}
unit UnFrmProgressBar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinOffice2007Green, cxControls, cxContainer, cxEdit,
  cxProgressBar, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  Dcm_View, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxLabel, cxPC, Medotrade;

const c_width = 400;
      c_max_ini = 0;

type
  TFrmProgressBar = class(TForm)
    cxPageControlFirst: TcxPageControl;
    TSTop: TcxTabSheet;
    PBFirst: TcxProgressBar;
    LbFirstString: TcxLabel;
    cxPageControlButton: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxPageControlMain: TcxPageControl;
    cxTabSheet3: TcxTabSheet;
    PBMain: TcxProgressBar;
    LbMainString: TcxLabel;
    bCancel: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bCancelClick(Sender: TObject);
  public
    { Public declarations }
    procedure MyIncPos( p_str_output : string = ''; p_step:integer = 1; p_position : integer =-1 );
    procedure MyIncPosMain( p_str_output : string = ''; p_position : integer =-1 ); // ����������� �������� �� ������� ������
    procedure MySetText(const p_text : string); // ����������� ��������
    procedure MySetMaxPos(const p_max : integer); // ��������� max
    procedure clc_posMain( p_amm            : Integer = c_max_ini;
                           p_str_output     : string = '�������� ������';
                           p_is_one         : Boolean = True;
                           p_empty_position : Boolean = True
                         );
    procedure clc_pos( p_is_on_top     : Boolean = True;
                       p_str2_output   : string = '�������� ������������';
                       p_ammTop        : Integer = c_max_ini;
                       p_is_one        : Boolean = True;
                       p_empty_position : Boolean = True
                     );
  end;

procedure chk_close;

var
  FrmProgressBar: TFrmProgressBar;

implementation

Uses DCM_Client, DCM_Attributes, DCM_Dict, DICOM_CMN, CmnUnit;

{$R *.dfm}

procedure myrfrmsg;
begin
  Application.ProcessMessages;
 // Sleep(1);
end;

procedure chk_close;
begin
  if Assigned(FrmProgressBar) then begin
    FrmProgressBar.Visible:=False;
    FreeAndNil(FrmProgressBar);
  end;
end;

procedure clc_frm_parms(const p_is_one : Boolean);
begin
  FrmProgressBar.cxPageControlFirst.Visible := not p_is_one;
  if p_is_one then begin
    FrmProgressBar.Height := FrmProgressBar.cxPageControlMain.Height+
                             FrmProgressBar.cxPageControlButton.Height+
                             39;
  end else begin
    FrmProgressBar.Height := FrmProgressBar.cxPageControlFirst.Height+
                             FrmProgressBar.cxPageControlMain.Height+
                             FrmProgressBar.cxPageControlButton.Height+
                             45;
  end;
end;

procedure TFrmProgressBar.clc_posMain( p_amm            : Integer = c_max_ini;
                                       p_str_output     : string = '�������� ������';
                                       p_is_one         : Boolean = True;
                                       p_empty_position : Boolean = True
                                     );
begin
  myrfrmsg;
  clc_frm_parms(p_is_one);
  FrmProgressBar.PBMain.Visible := not (p_amm=c_max_ini);
  // ��������� ��������
  FrmProgressBar.PBMain.Properties.Min:=0;
  FrmProgressBar.PBMain.Properties.Max:=p_amm;
  if p_empty_position then  
    FrmProgressBar.PBMain.Position:=0;
  FrmProgressBar.PBMain.Update;
  // ��������� ������� ����� ��������� �� ��������
  FrmProgressBar.LbMainString.Caption:=p_str_output;
  FrmProgressBar.Visible:=True;
  myrfrmsg;
end;

procedure TFrmProgressBar.clc_pos( p_is_on_top     : Boolean = True;
                                   p_str2_output   : string = '�������� ������������';
                                   p_ammTop        : Integer = c_max_ini;
                                   p_is_one        : Boolean = True;
                                   p_empty_position : Boolean = True
                                 );
begin
  myrfrmsg;
  LbFirstString.Caption:=p_str2_output;
  if p_empty_position then
    clc_frm_parms(p_is_one);
  // ��������� �������� ��������
  FrmProgressBar.PBFirst.Properties.Min:=0;
  FrmProgressBar.PBFirst.Properties.Max:=p_ammTop;
  if p_empty_position then
    FrmProgressBar.PBFirst.Position:=0;
  FrmProgressBar.PBFirst.Update;
  // ���������� ������ ���� ����
  if p_is_on_top then FormStyle := fsStayOnTop;
  FrmProgressBar.Visible:=True;
  myrfrmsg;
end;

procedure TFrmProgressBar.MySetText(const p_text : string); // ��������� ���������
begin
  if CmnUnit.v_exit_progressbar=0 then begin // ����������/���������� �������� �� ����
    FrmProgressBar.LbMainString.Caption:=p_text;
    FrmProgressBar.Refresh;
    myrfrmsg;
  end;
end;

procedure TFrmProgressBar.MySetMaxPos(const p_max : integer); // ��������� max
begin
  if CmnUnit.v_exit_progressbar=0 then
  begin // ����������/���������� �������� �� ����
    FrmProgressBar.PBMain.Properties.Max:=p_max;
    FrmProgressBar.Refresh;
  end;
end;

procedure TFrmProgressBar.MyIncPos( p_str_output : string = ''; p_step:integer = 1; p_position : integer =-1 ); // ����������� ��������
begin
    if CmnUnit.v_exit_progressbar=0 then
    begin // ����������/���������� �������� �� ����
      myrfrmsg;
      FrmProgressBar.PBMain.Visible := not (PBMain.Properties.Max=c_max_ini);
      // �������� �������
      if p_position>-1 then
      begin
        FrmProgressBar.PBMain.Position:=p_position;
      end else
      begin
        FrmProgressBar.PBMain.Position:=FrmProgressBar.PBMain.Position+p_step;
      end;
      if p_str_output<>'' then FrmProgressBar.LbMainString.Caption:=p_str_output;
      try
        FrmProgressBar.Refresh;
      except
        on E:exception do
          ShowMessage(E.Message);
      end;
      myrfrmsg;
    end;
end;

procedure TFrmProgressBar.MyIncPosMain( p_str_output : string = ''; p_position : integer =-1 ); // ����������� �������� �� ������� ������
begin
    if CmnUnit.v_exit_progressbar=0 then
    begin // ����������/���������� �������� �� ����
      myrfrmsg;
      FrmProgressBar.PBFirst.Visible := not (PBFirst.Properties.Max=c_max_ini);
      // �������� �������
      if p_position>-1 then
      begin
        FrmProgressBar.PBFirst.Position:=p_position;
      end else
      begin
        FrmProgressBar.PBFirst.Position:=FrmProgressBar.PBFirst.Position+1;
      end;
      if p_str_output<>'' then FrmProgressBar.LbFirstString.Caption:=p_str_output;
      FrmProgressBar.Refresh;
      myrfrmsg;
    end;
end;

procedure TFrmProgressBar.bCancelClick(Sender: TObject);
begin
  // ��������� ������� ��������
  // 1 - �������������� ���������
  CmnUnit.v_exit_progressbar:=1;
end;

procedure TFrmProgressBar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TFrmProgressBar.FormCreate(Sender: TObject);
begin
  // ��������� ������� ��������
  // 0 - � �����
  CmnUnit.v_exit_progressbar:=0;
  FrmProgressBar.PBMain.Properties.Max:=999999;
  FrmProgressBar.PBFirst.Properties.Max:=999999;
end;

end.
