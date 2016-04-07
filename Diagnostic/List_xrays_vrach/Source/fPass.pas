unit fPass;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, dxBar,
  ImgList, ActnList, cxClasses, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, StdCtrls, ExtCtrls, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue;

type
  TfrmPass = class(TForm)
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    actlstOkCancel: TActionList;
    il1: TImageList;
    BMBar1: TdxBar;
    bbPass: TdxBarButton;
    bbCancel: TdxBarButton;
    actSave: TAction;
    actCancel: TAction;
    pnl1: TPanel;
    rg1: TRadioGroup;
    rbFlu: TRadioButton;
    rbRg: TRadioButton;
    cxDateFlu: TcxDateEdit;
    cxDateRg: TcxDateEdit;
    procedure actSaveExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPass: TfrmPass;

implementation

{$R *.dfm}

procedure TfrmPass.actCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmPass.actSaveExecute(Sender: TObject);
begin
  if rbFlu.Checked then
    begin
      if cxDateFlu.Text = '' then
	begin
	  ShowMessage('Не указана дата прохождения флюорографии!');
	  cxDateFlu.SetFocus;
	  exit;
	end else
	begin
	  ModalResult := mrOk;
	end;
    end;
  if rbRg.Checked then
    begin
      if cxDateRg.Text = '' then
	begin
	  ShowMessage('Не указана дата прохождения рентгена грудной клетки!');
	  cxDateRg.SetFocus;
	  exit;
	end else
	begin
	  ModalResult := mrOk;
	end;
    end;
end;

end.
