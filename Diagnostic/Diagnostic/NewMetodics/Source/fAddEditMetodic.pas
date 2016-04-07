unit fAddEditMetodic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, ActnList,
  dxBar, cxClasses, ExtCtrls, cxTextEdit, cxControls, cxContainer, cxEdit,
  cxLabel, cxGraphics, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxSplitter, cxMemo, DB, OracleData, cxSpinEdit, cxCalendar,
  dxSkinOffice2007Green;

type
  TfrmAddEditMetodic = class(TForm)
    dxBarDockControl1: TdxBarDockControl;
    BM: TdxBarManager;
    actlstOKCancel: TActionList;
    BMBar1: TdxBar;
    bbSave: TdxBarButton;
    bbCancel: TdxBarButton;
    actSave: TAction;
    actCancel: TAction;
    pnl1: TPanel;
    cxLabel1: TcxLabel;
    cxNameMetodic: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxSystemGroup: TcxLookupComboBox;
    cxLabel3: TcxLabel;
    cxRgGroup: TcxLookupComboBox;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxSplitter1: TcxSplitter;
    dsSysGroup: TDataSource;
    odsSysGroup: TOracleDataSet;
    dsRgGroup: TDataSource;
    odsRgGroup: TOracleDataSet;
    cxDoza: TcxSpinEdit;
    cxSnimki: TcxSpinEdit;
    cxTime: TcxSpinEdit;
    cxLabel8: TcxLabel;
    cxdeDate: TcxDateEdit;
    pnl2: TPanel;
    cxMemo1: TcxMemo;
    procedure actSaveExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddEditMetodic: TfrmAddEditMetodic;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmAddEditMetodic.actCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmAddEditMetodic.actSaveExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmAddEditMetodic.FormCreate(Sender: TObject);
begin
  if odsSysGroup.Active = False then
    odsSysGroup.Open;
  if odsRgGroup.Active = False then
    odsRgGroup.Open;
  cxdeDate.Date := frmMain.dSysDate;
  cxSplitter1.State := ssClosed;
end;

end.

