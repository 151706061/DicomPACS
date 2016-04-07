unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SMMainAPI, Oracle, DB, OracleData, cxStyles, cxGraphics, cxEdit,
  cxLabel, cxVGrid, cxControls, cxInplaceContainer, dxBar, cxProgressBar,
  cxContainer, JvExControls, JvAnimatedImage, JvGIFCtrl, ExtCtrls, cxClasses;

type
  TfrmMain = class(TForm)
    os: TOracleSession;
    odsCnt: TOracleDataSet;
    vGr1: TcxVerticalGrid;
    catKardio: TcxCategoryRow;
    rowKolvoPerson: TcxEditorRow;
    Panel1: TPanel;
    paProgress: TPanel;
    Animator1: TJvGIFAnimator;
    lbCap: TcxLabel;
    lbKolvo: TcxLabel;
    lbTime: TcxLabel;
    pbMain: TcxProgressBar;
    lbKolvo1: TcxLabel;
    dxBarDockControl1: TdxBarDockControl;
    BM: TdxBarManager;
    BMBar1: TdxBar;
    bbRun: TdxBarButton;
    odsPeoples: TOracleDataSet;
    procedure FormCreate(Sender: TObject);
    procedure bbRunClick(Sender: TObject);
  private
    StartTime: TTime;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.bbRunClick(Sender: TObject);
var ods : TOracleDataSet;
    plan_date : TDateTime;
    i : Integer;
begin
  ods := TOracleDataSet.Create(nil);
  ods.Session := os;
  try
    odsPeoples.Close;
    odsPeoples.Open;
    i := 0;
    Animator1.Animate := True;
    StartTime:= Now;
    lbTime.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
    lbTime.Refresh;
    pbMain.Position := 0;
    pbMain.Properties.Max := odsPeoples.RecordCount;
    odsPeoples.First;
    while not odsPeoples.Eof do
      begin
        ods.DeleteVariables;
        ods.Close;
        ods.SQL.Text := ' select to_date(asu.get_plan_fluoro_date(:pfk_id), ''dd.mm.yyyy'') as plan_date from dual ';
        ods.DeclareAndSet('pfk_id', otInteger, odsPeoples.FieldByName('fk_id').AsInteger);
        ods.Open;
        plan_date := ods.FieldByName('plan_date').AsDateTime;
        if DateTimeToStr(plan_date) <> '30.12.1899' then
          begin
            ods.DeleteVariables;
            ods.Close;
            ods.SQL.Text := ' merge into asu.tplanfluoro using dual on (fk_peplid = :pfk_peplid) '+#13+
                            ' when not matched then '+#13+
                            '   insert(fk_peplid, fd_date) values(:pfk_peplid, :pfd_date) '+#13+
                            ' when matched then '+#13+
                            '   update set fd_date = :pfd_date where fk_peplid = :pfk_peplid ';
            ods.DeclareAndSet('pfk_peplid', otInteger, odsPeoples.FieldByName('fk_id').AsInteger);
            ods.DeclareAndSet('pfd_date', otDate, plan_date);
            ods.Open;
          end;
        pbMain.Position := pbMain.Position + 1;
        lbTime.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
        lbTime.Refresh;
        lbKolvo1.Caption := IntToStr(StrToInt(lbKolvo1.Caption)+1);
        lbKolvo1.Refresh;
        Application.ProcessMessages;
        odsPeoples.Next;
        i := i + 1;
        if i = 1000 then
          begin
            os.Commit;
            i := 0;
          end;
      end;
  finally
    Animator1.Animate := False;
    ods.Free;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  GetSession(os, 'ASU');
  if odsCnt.Active = False then
    odsCnt.Active := True;
  rowKolvoPerson.Properties.Value := odsCnt.FieldByName('cnt').AsInteger;
end;

end.
