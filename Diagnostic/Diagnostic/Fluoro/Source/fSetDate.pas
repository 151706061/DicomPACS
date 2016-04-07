unit fSetDate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, ActnList, JvExControls, JvCalendar, ComCtrls,
  JvExComCtrls, JvMonthCalendar, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinsdxBarPainter, cxClasses, dxSkinOffice2007Green;

type
  TfrmSetDate = class(TForm)
    actlstOKCancel: TActionList;
    actOK: TAction;
    actCancel: TAction;
    BM: TdxBarManager;
    bbOK: TdxBarButton;
    bbCancel: TdxBarButton;
    dxBarDockControl1: TdxBarDockControl;
    JvCalendar1: TJvMonthCalendar;
    procedure actOKExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetDate: TfrmSetDate;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmSetDate.actOKExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetDate.FormCreate(Sender: TObject);
begin
  JvCalendar1.Date := frmMain.GET_SYSTEMDATE;
end;

procedure TfrmSetDate.actCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
