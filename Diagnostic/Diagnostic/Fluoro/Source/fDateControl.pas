unit fDateControl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, cxClasses,
  dxBar, ImgList, ExtCtrls, ActnList, cxGraphics, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit, cxMaskEdit, cxCalendar,
  cxControls, cxContainer, cxEdit, cxLabel, DB, OracleData,
  dxSkinOffice2007Green;

type
  TfrmDateControl = class(TForm)
    dxbar: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    AL: TActionList;
    Panel1: TPanel;
    IL: TImageList;
    dxbarBar1: TdxBar;
    bbOk: TdxBarButton;
    bbCancel: TdxBarButton;
    aOk: TAction;
    aCancel: TAction;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    deControl: TcxDateEdit;
    lcbControl: TcxLookupComboBox;
    odsSotr: TOracleDataSet;
    dsSotr: TDataSource;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDateControl: TfrmDateControl;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmDateControl.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmDateControl.aOkExecute(Sender: TObject);
begin
  if (deControl.Text = '') or (deControl.Text = '0') then
    begin
      Application.MessageBox('Внимание! Вы не указали дату!', 'Предупреждение', MB_OK+MB_ICONWARNING);
      deControl.SetFocus;
      Exit;
    end;
  if lcbControl.Text = '' then
    begin
      Application.MessageBox('Внимание! Вы не указали сотрудника!', 'Предупреждение', MB_OK+MB_ICONWARNING);
      lcbControl.SetFocus;
      Exit;
    end;
  ModalResult := mrOk;
end;

end.
