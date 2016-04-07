unit fAddEditElement;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, ActnList, ExtCtrls, cxTextEdit, cxControls,
  cxContainer, cxEdit, cxLabel, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinsdxBarPainter, cxClasses, cxMaskEdit, cxSpinEdit, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue;

type
  TfrmAddEditElement = class(TForm)
    Panel1: TPanel;
    al: TActionList;
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    bbSave: TdxBarButton;
    bbCancel: TdxBarButton;
    aSave: TAction;
    aCancel: TAction;
    cxLabel1: TcxLabel;
    cxName: TcxTextEdit;
    cxLabel2: TcxLabel;
    seOrder: TcxSpinEdit;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddEditElement: TfrmAddEditElement;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmAddEditElement.aSaveExecute(Sender: TObject);
begin
  if (seOrder.Value = 0) or (seOrder.Value < 0) or (seOrder.Text = '') then
    begin
      Application.MessageBox('�� ����� ������������ �������� � ���� "�������"!'+#13#10+
                             '�������� ���� "�������" �� ������:'+#13#10+
                             ' 1. ��������� ����;'+#13#10+
                             ' 2. ���� ������ ����;'+#13#10+
                             ' 3. ���� ������. '+#13#10+
                             '��������� ������������ ���������� ���� "�������"!' , '��������', MB_ICONWARNING+MB_OK);
      seOrder.SetFocus;
      Exit;
    end;
  
  ModalResult := MrOk;
end;

procedure TfrmAddEditElement.aCancelExecute(Sender: TObject);
begin
  ModalResult := MrCancel;
end;

end.
