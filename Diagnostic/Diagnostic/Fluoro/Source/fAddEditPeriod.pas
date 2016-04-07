unit fAddEditPeriod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, ActnList, ExtCtrls, ImgList, cxTextEdit, cxControls,
  cxContainer, cxEdit, cxLabel, StdCtrls, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxSpinEdit, cxButtonEdit, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinsdxBarPainter, cxClasses, dxSkinOffice2007Green;

type
  TfrmAddEditPeriod = class(TForm)
    Panel1: TPanel;
    al: TActionList;
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    bbSave: TdxBarButton;
    bbCancel: TdxBarButton;
    IL: TImageList;
    aSave: TAction;
    aCancel: TAction;
    cxLabel1: TcxLabel;
    cxName: TcxTextEdit;
    lbl1: TLabel;
    cxOrder: TcxSpinEdit;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  private
    function DoCheckParameters:Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddEditPeriod: TfrmAddEditPeriod;

implementation

uses Fcompanylist;

{$R *.dfm}

procedure TfrmAddEditPeriod.aSaveExecute(Sender: TObject);
begin
  if DoCheckParameters = 0 then
    exit;
  ModalResult := MrOk;
end;

procedure TfrmAddEditPeriod.aCancelExecute(Sender: TObject);
begin
  ModalResult := MrCancel;
end;

function TfrmAddEditPeriod.DoCheckParameters:Integer;
begin
  if cxName.Text = '' then
    begin
      Application.MessageBox('Внимание! Вам необходимо заполнить поле "Наименование"!', 'Предупреждение', MB_OK+MB_ICONWARNING);
      cxName.SetFocus;
      Result := 0;
      exit;
    end;

//  if cxCompany.Tag = 0 then  //???
//    begin
//      Application.MessageBox('Внимание! Вам необходимо поставить соответствие с компанией из справочника компаний!', 'Предупреждение', MB_OK+MB_ICONWARNING);
//      cxCompany.SetFocus;
//      Result := 0;
//      exit;
//    end;

  Result := 1;
end;

end.
