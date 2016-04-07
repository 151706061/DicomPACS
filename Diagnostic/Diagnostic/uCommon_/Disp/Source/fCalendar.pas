unit fCalendar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls, Grids,
  Calendar, dxSkinsCore, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel,
  cxMaskEdit, Oracle, OracleData, jvDbUtils, JvComponentBase, JvFormPlacement,
  ActnList, cxSpinEdit, cxTimeEdit, cxDropDownEdit, cxCalendar, dxSkinCaramel,
  dxSkinCoffee, dxSkinOffice2007Green;

type
  TfrmCalendar = class(TForm)
    JvFormStorage1: TJvFormStorage;
    al: TActionList;
    aOK: TAction;
    aCancel: TAction;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cxLabel3: TcxLabel;
    deDate: TcxDateEdit;
    teTime: TcxTimeEdit;
    Panel2: TPanel;
    bEnter: TcxButton;
    bCancel: TcxButton;
    cxButton3: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure cxButton3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure teTimeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    pJurID : Integer;
    { Private declarations }
  public
    procedure DoShowForm(nJurID : Integer);
    { Public declarations }
  end;

var
  frmCalendar: TfrmCalendar;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmCalendar.aCancelExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmCalendar.aOKExecute(Sender: TObject);
var oq : TOracleQuery;
    ods : TOracleDataSet;
begin
  Screen.Cursor := crSQLWait;
  ods := TOracleDataSet.Create(nil);
  oq := TOracleQuery.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' select :pdate - sysdate as dif from dual ';
    ods.DeclareAndSet('pdate', otDate, StrToDateTime(DateToStr(deDate.Date)+' '+FormatDateTime('hh:nn', teTime.Time)));
    ods.Open;
    if ods.FieldByName('dif').AsFloat <= 0 then
      begin
        frmMain.DoShowRemark('Дата пред. заказа не может быть меньше или равной текущей дате и времени!', frmMain.stError);
        exit;
      end;
    oq.Session := frmMain.os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' merge into taxi.tpred using dual on (fk_jurid = :pfk_jurid) '+#13+
                   ' when matched then update set fd_date = :pfd_date where fk_jurid = :pfk_jurid '+#13+
                   ' when not matched then insert(fd_date, fk_jurid, fk_taxiid) values(:pfd_date, :pfk_jurid, :pfk_taxiid) ';
    oq.DeclareAndSet('pfd_date', otDate, StrToDateTime(DateToStr(deDate.Date)+' '+FormatDateTime('hh:nn', teTime.Time)));
    oq.DeclareAndSet('pfk_jurid', otInteger, pJurID);
    oq.DeclareAndSet('pfk_taxiid', otInteger, frmMain.pTaxiID);
    oq.Execute;
    oq.DeleteVariables;
    oq.SQL.Text := ' update taxi.tjournal set fn_sos = 7, fl_pred = 1 where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfk_id', otInteger, pJurID);
    oq.Execute;
    frmMain.os.Commit;
    frmMain.odsJur.AfterScroll := nil;
    RefreshQuery(frmMain.odsJur);
    frmMain.odsJur.AfterScroll := frmMain.odsJurAfterScroll;
    frmMain.DoEnableVisibleStop;
    frmMain.DoVisibleOtmena;
    frmMain.DoVisibleCopy;
    frmMain.DoVisibleFact;
    frmMain.DoVisibleKM;
    frmMain.DoVisibleNotExit;
    frmMain.DoVisibleComeBack;
    frmMain.DoVisibleAddTime;

    frmMain.DoEnableNeoplata;
    frmMain.DoEnableBaggage;
    frmMain.DoEnablePeregon;
    frmMain.DoEnableFicsControls;
    frmMain.DoEnableAddTimeControls;
    frmMain.DoEnableStopControls;
    frmMain.DoEnableKmControls;
    frmMain.DoEnableFactControls;
    frmMain.DoEnablePredZakaz;
    frmMain.aContinueRas.Visible := frmMain.odsJur.FieldByName('fn_sos').AsInteger = 1;
  finally
    Screen.Cursor := crDefault;
    ods.Free;
    oq.Free;
  end;
  close;
end;

procedure TfrmCalendar.cxButton3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(WM_SYSCOMMAND, $F012, 0);
end;

procedure TfrmCalendar.DoShowForm(nJurID: Integer);
begin
  pJurID := nJurID;
end;

procedure TfrmCalendar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TfrmCalendar.FormCreate(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' select sysdate from dual ';
    ods.Open;
    deDate.Date := ods.FieldByName('sysdate').AsDateTime;
  finally
    ods.Free;
  end;
end;

procedure TfrmCalendar.teTimeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_return then
    aOKExecute(nil);
end;

end.
