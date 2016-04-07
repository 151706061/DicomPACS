unit fBrakCheckProgress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, Gauges, StdCtrls, cxButtons,
  ExtCtrls;

type
  TfmBrakCheckProgress = class(TForm)
    buCancel: TcxButton;
    Gauge1: TGauge;
    Timer1: TTimer;
    procedure buCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ModalRes : integer;
  end;

implementation

uses fdmMain, fMedKardLst, cxGridTableView, Oracle, OracleData;

{$R *.dfm}

procedure TfmBrakCheckProgress.buCancelClick(Sender: TObject);
begin
  dmMain.os.Rollback;
  ModalRes := mrCancel;
  Close;
end;

procedure TfmBrakCheckProgress.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ModalResult = mrNone then
    ModalResult := mrCancel;
  Action := caHide;
end;

procedure TfmBrakCheckProgress.FormActivate(Sender: TObject);
var
  i : integer;
  FC_SERIAL, BRAK_UNIQSTR : string;
begin
  Application.ProcessMessages;
  ModalRes := mrNone;
  try
    if frmMedKardLst.cxGridMedicDBTableView1.DataController.DataSource.DataSet is TOracleDataSet  then
     ( frmMedKardLst.cxGridMedicDBTableView1.DataController.DataSource.DataSet as TOracleDataSet ).CommitOnPost := False;

    frmMedKardLst.cxGridMedicDBTableView1.DataController.DataSource.DataSet.AfterScroll := nil;
    frmMedKardLst.cxGridMedicDBTableView1.Controller.GoToFirst;
    Gauge1.MinValue := 1;
    Gauge1.MaxValue := frmMedKardLst.cxGridMedicDBTableView1.ViewData.RecordCount;
    for i := 0 to frmMedKardLst.cxGridMedicDBTableView1.ViewData.RecordCount-1 do
    begin
//      frmMedKardLst.cxGridMedicDBTableView1.Controller.GridView.ViewData.Rows[i].Values (frmMedKardLst.cxGridMedicDBTableView1.VisibleColumns[0], frmMedKardLst.cxGridMedicDBTableView1.VisibleColumns[frmMedKardLst.cxGridMedicDBTableView1.VisibleColumnCount-1], i,i);
      dmMain.odsBRAK_MED.Close;
      dmMain.odsBRAK_MED.Filtered := False;
      dmMain.odsBRAK_MED.Filter := '';
      dmMain.odsBRAK_MED.SetVariable('pALL', 0);
      FC_SERIAL := fdmMain.nvl(frmMedKardLst.cxGridMedicDBTableView1.Controller.GridView.ViewData.Rows[i].Values[frmMedKardLst.cxGridMedicDBTableView1FC_SERIAL.Index],'');
      if FC_SERIAL <> '' then
      begin
        dmMain.odsBRAK_MED.SetVariable('pSERIESNR', FC_SERIAL);
        dmMain.odsBRAK_MED.Open;
        BRAK_UNIQSTR := fdmMain.nvl(frmMedKardLst.cxGridMedicDBTableView1.Controller.GridView.ViewData.Rows[i].Values[frmMedKardLst.cxGridMedicDBTableView1BRAK_UNIQSTR.Index],'');
//        if (nvl(frmMedKardLst.cxGridMedicDBTableView1.Controller.SelectedRows[0].Values[frmMedKardLst.cxGridMedicDBTableView1FL_BRAK.Index],'2') = '1')and(BRAK_UNIQSTR <>'') then // стоит признак забраковки
//          dmMain.odsBRAK_MED.Filter := '(FLGALLOW = ''False'') and (UNIQSTR = '''+BRAK_UNIQSTR+''')'
//        else
//          dmMain.odsBRAK_MED.Filter := 'FLGALLOW = ''False'''; // исключаем забракованные, но позже разрешенные
//        dmMain.odsBRAK_MED.Filtered := True;

        if (nvl(frmMedKardLst.cxGridMedicDBTableView1.Controller.SelectedRows[0].Values[frmMedKardLst.cxGridMedicDBTableView1FL_BRAK.Index],'2') = '1')and(BRAK_UNIQSTR <>'') then // стоит признак забраковки
        begin
          dmMain.odsBRAK_MED.Filter := '(UNIQSTR = '''+BRAK_UNIQSTR+''')';
          dmMain.odsBRAK_MED.Filtered := True;
        end;
      end;
      if (dmMain.odsBRAK_MED.Active)and(dmMain.odsBRAK_MED.RecordCount > 0) then
      begin
        dmMain.InitAdditionalUpdateTable('MED.TKART');
        dmMain.AddAdditionalUpdateTable('BRAK_UNIQSTR', otString,  fdmMain.nvl(dmMain.odsBRAK_MED.FieldByName('UNIQSTR').AsString,''));
        dmMain.AddAdditionalUpdateTable('FL_BRAK', otInteger, 1);
        dmMain.ExecuteAdditionalUpdateTable('KARTID', otInteger, frmMedKardLst.cxGridMedicDBTableView1.Controller.GridView.ViewData.Rows[i].Values[frmMedKardLst.cxGridMedicDBTableView1KARTID.Index]);
//        dmMain.SetTKART_BRAK_UNIQSTR(frmMedKardLst.cxGridMedicDBTableView1.Controller.GridView.ViewData.Rows[i].Values[frmMedKardLst.cxGridMedicDBTableView1KARTID.Index], fdmMain.nvl(dmMain.odsBRAK_MED.FieldByName('UNIQSTR').AsString,''));
//        dmMain.SetTKART_FL_Brak(frmMedKardLst.cxGridMedicDBTableView1.Controller.GridView.ViewData.Rows[i].Values[frmMedKardLst.cxGridMedicDBTableView1KARTID.Index], 1);
      end
      else
      begin
        dmMain.InitAdditionalUpdateTable('MED.TKART');
        dmMain.AddAdditionalUpdateTable('BRAK_UNIQSTR', otString,  '');
        dmMain.AddAdditionalUpdateTable('FL_BRAK', otInteger,  0);
        dmMain.ExecuteAdditionalUpdateTable('KARTID', otInteger, frmMedKardLst.cxGridMedicDBTableView1.Controller.GridView.ViewData.Rows[i].Values[frmMedKardLst.cxGridMedicDBTableView1KARTID.Index]);
//        dmMain.SetTKART_BRAK_UNIQSTR(frmMedKardLst.cxGridMedicDBTableView1.Controller.GridView.ViewData.Rows[i].Values[frmMedKardLst.cxGridMedicDBTableView1KARTID.Index], '');
//        dmMain.SetTKART_FL_Brak(frmMedKardLst.cxGridMedicDBTableView1.Controller.GridView.ViewData.Rows[i].Values[frmMedKardLst.cxGridMedicDBTableView1KARTID.Index], 0);
      end;
      frmMedKardLst.cxGridMedicDBTableView1.Controller.GoToNext(False, True);
      Gauge1.Progress := Gauge1.Progress+1;
      Application.ProcessMessages;
      if ModalRes = mrCancel then
      begin
        Timer1.Enabled := True;
        Exit;
      end;
    end;
  finally
    dmMain.odsBRAK_MED.Close;
    dmMain.odsBRAK_MED.Filtered := False;
    dmMain.odsBRAK_MED.Filter := '';
    if frmMedKardLst.cxGridMedicDBTableView1.DataController.DataSource.DataSet is TOracleDataSet  then
       ( frmMedKardLst.cxGridMedicDBTableView1.DataController.DataSource.DataSet as TOracleDataSet ).CommitOnPost := True;
    frmMedKardLst.cxGridMedicDBTableView1.DataController.DataSource.DataSet.AfterScroll := frmMedKardLst.odsMedKartAfterScroll;
  end;
  dmMain.os.Commit;
  frmMedKardLst.acRefresh.Execute;
  ModalRes := mrOk;
  ModalResult := mrOk;
  Timer1.Enabled := True;
end;

procedure TfmBrakCheckProgress.Timer1Timer(Sender: TObject);
begin
  Close;
end;

end.
