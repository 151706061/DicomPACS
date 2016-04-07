unit fTransfer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, dxBar,
  cxGroupBox, cxControls, cxContainer, cxEdit, cxProgressBar, cxClasses, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, ImgList, ActnList, ExtCtrls,
  cxTextEdit, cxStyles, dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, DB, cxDBData, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, OracleData, Oracle, JvDBUtils,
  cxLabel, cxImageComboBox, dxSkinOffice2007Green;

type
  TfrmTransfer = class(TForm)
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    BMBar1: TdxBar;
    pbTransfer: TcxProgressBar;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    cxGroupBox3: TcxGroupBox;
    AL: TActionList;
    IL: TImageList;
    bTransfer: TcxButton;
    bOtmena: TcxButton;
    aClose: TAction;
    bbClose: TdxBarButton;
    paFrom: TPanel;
    paTo: TPanel;
    teCompanyFrom: TcxTextEdit;
    bSearchFrom: TcxButton;
    teCompanyTo: TcxTextEdit;
    bSearchTo: TcxButton;
    TVFROM: TcxGridDBTableView;
    cxGrFromLevel1: TcxGridLevel;
    cxGrFrom: TcxGrid;
    cxGrTo: TcxGrid;
    TVTO: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    VFROMFIO: TcxGridDBColumn;
    VTOFIO: TcxGridDBColumn;
    dsFrom: TDataSource;
    odsFrom: TOracleDataSet;
    odsTo: TOracleDataSet;
    dsTo: TDataSource;
    aTransfer: TAction;
    aOtmena: TAction;
    bTransferOne: TcxButton;
    aTransferOne: TAction;
    cxLabel1: TcxLabel;
    lbStatus: TcxLabel;
    cxLabel3: TcxLabel;
    lbKolvo: TcxLabel;
    procedure aCloseExecute(Sender: TObject);
    procedure bSearchFromClick(Sender: TObject);
    procedure odsFromBeforeOpen(DataSet: TDataSet);
    procedure bSearchToClick(Sender: TObject);
    procedure odsToBeforeOpen(DataSet: TDataSet);
    procedure aTransferExecute(Sender: TObject);
    procedure aTransferOneExecute(Sender: TObject);
    procedure aOtmenaExecute(Sender: TObject);
    procedure bOtmenaMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure bOtmenaMouseLeave(Sender: TObject);
    procedure odsFromAfterOpen(DataSet: TDataSet);
  private
    CompanyFromId : Integer;
    PeriodFromId : Integer;
    CompanyToId : Integer;
    PeriodToId : Integer;
    bAbort : Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTransfer: TfrmTransfer;

const
  sql1 = ' SELECT TC.FK_ID, '+
         '        TC.FK_PEOPLEID, '+
         '        TC.FK_COMPANYID, '+
         '        ASU.PKG_REGIST_PEPLFUNC.GET_PEPL_FIO(TC.FK_PEOPLEID) AS PEPLFIO '+
         '   FROM ASU.TPEOPLES_COMPANY TC, ASU.TPEOPLES TP '+
         '  WHERE TC.FK_COMPANYID = :PFK_COMPANYID '+
         '    AND TC.FK_PERIODID = :PFK_PERIODID '+
         '    AND TC.FK_PEOPLEID = TP.FK_ID '+
         ' ORDER BY PEPLFIO ';

  sql2 = ' SELECT TC.FK_ID, '+
         '        TC.FK_PEOPLEID, '+
         '        TC.FK_COMPANYID, '+
         '        ASU.PKG_REGIST_PEPLFUNC.GET_PEPL_FIO(TC.FK_PEOPLEID) AS PEPLFIO '+
         '   FROM ASU.TPEOPLES_COMPANY TC, ASU.TPEOPLES TP '+
         '  WHERE TC.FK_COMPANYID = :PFK_COMPANYID '+
         '    AND TC.FK_PERIODID = (SELECT FK_OWNER FROM ASU.TPERIOD_COMPANY WHERE FK_ID = :PFK_PERIODID) '+
         '    AND TC.FK_PEOPLEID = TP.FK_ID '+
         ' ORDER BY PEPLFIO ';

implementation
uses fMain, fSetCompanyTransfer;
{$R *.dfm}

procedure TfrmTransfer.aCloseExecute(Sender: TObject);
begin
  ModalResult := MrCancel;
end;

procedure TfrmTransfer.aOtmenaExecute(Sender: TObject);
begin
  if Application.MessageBox('Вы действительно хотите прервать перенос пациентов?', 'Вопрос', MB_OKCANCEL+MB_ICONQUESTION) = IDOK then
    begin
      bAbort := True;
    end;
end;

procedure TfrmTransfer.aTransferExecute(Sender: TObject);
var oq : TOracleQuery;
     i : Integer;
begin
  if CompanyFromId = CompanyToId then
    begin
      Application.MessageBox('Внимание! Компании "откуда переносить" и "куда переносить" совпадают! Будьте внимательны!', 'Предупреждение', MB_OK+MB_ICONWARNING);
      Exit;
    end;
  if MessageDlg('Внимание! Вы собираетесь перенести пациентов из одной компании в другую.'
                +#13+#10+'Компания, из которой перемещаете - '+teCompanyFrom.Text
                +#13+#10+'Компания, в которую перемещаете - '+teCompanyTo.Text
                +#13+#10+'Продолжить?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      if teCompanyFrom.Text = '' then
        begin
          Application.MessageBox('Внимание! Вы не выбрали компанию, из которой будете переносить!', 'Предупреждение', MB_OK+MB_ICONWARNING);
          bSearchFrom.SetFocus;
          Exit;
        end;
      if teCompanyTo.Text = '' then
        begin
          Application.MessageBox('Внимание! Вы не выбрали компанию, в которую будете переносить!', 'Предупреждение', MB_OK+MB_ICONWARNING);
          bSearchTo.SetFocus;
          Exit;
        end;
      pbTransfer.Position := 0;
      pbTransfer.Properties.Max := odsFrom.RecordCount;
      oq := TOracleQuery.Create(nil);
      try
        bAbort := False;
        i := 1;
        lbStatus.Caption := 'Идёт перенос...';
        lbStatus.Style.Font.Color := clBlack;
        Screen.Cursor := crHourGlass;
        aClose.Enabled := False;
        aTransfer.Enabled := False;
        aOtmena.Visible := True;
        oq.Session := frmMain.os;
        oq.SQL.Text := ' UPDATE ASU.TPEOPLES_COMPANY SET FK_COMPANYID = :PFK_COMPANYID, FK_PERIODID = :PFK_PERIODID WHERE FK_ID = :PFK_ID ';
        oq.DeclareVariable('PFK_COMPANYID', otInteger);
        oq.DeclareVariable('PFK_PERIODID', otInteger);
        oq.DeclareVariable('PFK_ID', otInteger);
        odsFrom.First;
        while not odsFrom.Eof do
          begin
            if bAbort = True then
              begin
                lbStatus.Caption := 'Перенос прерван!';
                lbStatus.Style.Font.Color := clRed;
                RefreshQuery(odsFrom);
                Exit;
              end else
              begin
                lbKolvo.Caption := IntToStr(i)+'/'+IntToStr(odsFrom.RecordCount);
                oq.SetVariable('PFK_COMPANYID', CompanyToId);
                oq.SetVariable('PFK_ID', odsFrom.FieldByName('FK_ID').AsInteger);
                oq.SetVariable('PFK_PERIODID', PeriodToId);
                oq.Execute;
                frmMain.os.Commit;
                RefreshQuery(odsTo);
                pbTransfer.Position := pbTransfer.Position + 1;
                Application.ProcessMessages;
                odsFrom.Next;
                i := i + 1;
              end;
          end;
        RefreshQuery(odsFrom);
        lbStatus.Caption := 'Все перенесены';
        lbStatus.Style.Font.Color := clGreen;
      finally
        oq.Free;
        aClose.Enabled := True;
        aOtmena.Visible := False;
        Screen.Cursor := crDefault;
      end;
    end;
end;

procedure TfrmTransfer.aTransferOneExecute(Sender: TObject);
var oq : TOracleQuery;
    id : Integer;
begin
  if teCompanyFrom.Text = '' then
    begin
      Application.MessageBox('Внимание! Вы не выбрали компанию, из которой будете переносить!', 'Предупреждение', MB_OK+MB_ICONWARNING);
      bSearchFrom.SetFocus;
      Exit;
    end;
  if teCompanyTo.Text = '' then
    begin
      Application.MessageBox('Внимание! Вы не выбрали компанию, в которую будете переносить!', 'Предупреждение', MB_OK+MB_ICONWARNING);
      bSearchTo.SetFocus;
      Exit;
    end;
  if CompanyFromId = CompanyToId then
    begin
      Application.MessageBox('Внимание! Компании "откуда переносить" и "куда переносить" совпадают! Будьте внимательны!', 'Предупреждение', MB_OK+MB_ICONWARNING);
      Exit;
    end;

  oq := TOracleQuery.Create(nil);
  try
    oq.Session := frmMain.os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' UPDATE ASU.TPEOPLES_COMPANY SET FK_COMPANYID = :PFK_COMPANYID, FK_PERIODID = :PFK_PERIODID WHERE FK_ID = :PFK_ID ';
    oq.DeclareAndSet('PFK_COMPANYID', otInteger, CompanyToId);
    oq.DeclareAndSet('PFK_PERIODID', otInteger, PeriodToId);
    oq.DeclareAndSet('PFK_ID', otInteger, odsFrom.FieldByName('FK_ID').AsInteger);
    id := odsFrom.FieldByName('FK_ID').AsInteger;
    oq.Execute;
    frmMain.os.Commit;
    RefreshQuery(odsFrom);
    RefreshQuery(odsTo);
    odsTo.Locate('FK_ID', id, []);
  finally
    oq.Free;
  end;
end;

procedure TfrmTransfer.bOtmenaMouseLeave(Sender: TObject);
begin
  if aOtmena.Visible = True then  
    Screen.Cursor := crHourGlass
  else
    Screen.Cursor := crDefault;
end;

procedure TfrmTransfer.bOtmenaMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  Screen.Cursor := crDefault;
end;

procedure TfrmTransfer.bSearchFromClick(Sender: TObject);
begin
  Application.CreateForm(TfrmSetCompanyTransfer, frmSetCompanyTransfer);
  try
    frmSetCompanyTransfer.DoShowForm(1);
    frmSetCompanyTransfer.ShowModal;
    if frmSetCompanyTransfer.ModalResult = MrOk then
      begin
        if frmSetCompanyTransfer.odsSearchCompany.FieldByName('OWNERID').AsInteger > 0 then
          begin
            CompanyFromId := frmSetCompanyTransfer.odsSearchCompany.FieldByName('FK_COMPANYID').AsInteger;
            PeriodFromId := frmSetCompanyTransfer.odsSearchCompany.FieldByName('FK_OWNER').AsInteger;
            teCompanyFrom.Text := frmSetCompanyTransfer.odsSearchCompany.FieldByName('FC_NAME').AsString+'-'+frmSetCompanyTransfer.odsSearchCompany.FieldByName('FC_OWNER').AsString;
            odsFrom.Close;
//            odsFrom.SQL.Text := sql2;
            odsFrom.Open;
            lbStatus.Caption := '--';
            lbKolvo.Caption := '--';
            pbTransfer.Position := 0;
          end else
          begin
            CompanyFromId := frmSetCompanyTransfer.odsSearchCompany.FieldByName('FK_COMPANYID').AsInteger;
            PeriodFromId := frmSetCompanyTransfer.odsSearchCompany.FieldByName('FK_OWNER').AsInteger;
            teCompanyFrom.Text := frmSetCompanyTransfer.odsSearchCompany.FieldByName('FC_NAME').AsString+'-'+frmSetCompanyTransfer.odsSearchCompany.FieldByName('FC_OWNER').AsString;
            odsFrom.Close;
//            odsFrom.SQL.Text := sql1;
            odsFrom.Open;
            lbStatus.Caption := '--';
            lbKolvo.Caption := '--';
            pbTransfer.Position := 0;
          end;
      end;
  finally
    frmSetCompanyTransfer.Free;
  end;
end;

procedure TfrmTransfer.bSearchToClick(Sender: TObject);
begin
  Application.CreateForm(TfrmSetCompanyTransfer, frmSetCompanyTransfer);
  try
    frmSetCompanyTransfer.DoShowForm(2);
    frmSetCompanyTransfer.ShowModal;
    if frmSetCompanyTransfer.ModalResult = MrOk then
      begin
        if frmSetCompanyTransfer.odsSearchCompany.FieldByName('OWNERID').AsInteger > 0 then
          begin
            CompanyToId := frmSetCompanyTransfer.odsSearchCompany.FieldByName('FK_COMPANYID').AsInteger;
            PeriodToId := frmSetCompanyTransfer.odsSearchCompany.FieldByName('FK_OWNER').AsInteger;
            teCompanyTo.Text := frmSetCompanyTransfer.odsSearchCompany.FieldByName('FC_NAME').AsString+'-'+frmSetCompanyTransfer.odsSearchCompany.FieldByName('FC_OWNER').AsString;
            odsTo.Close;
//            odsTo.SQL.Text := sql2;
            odsTo.Open;
            lbStatus.Caption := '--';
            lbKolvo.Caption := '--';
            pbTransfer.Position := 0;
          end else
          begin
            CompanyToId := frmSetCompanyTransfer.odsSearchCompany.FieldByName('FK_COMPANYID').AsInteger;
            PeriodToId := frmSetCompanyTransfer.odsSearchCompany.FieldByName('FK_OWNER').AsInteger;
            teCompanyTo.Text := frmSetCompanyTransfer.odsSearchCompany.FieldByName('FC_NAME').AsString+'-'+frmSetCompanyTransfer.odsSearchCompany.FieldByName('FC_OWNER').AsString;
            odsTo.Close;
//            odsTo.SQL.Text := sql1;
            odsTo.Open;
            lbStatus.Caption := '--';
            lbKolvo.Caption := '--';
            pbTransfer.Position := 0;
          end;
      end;
  finally
    frmSetCompanyTransfer.Free;
  end;
end;

procedure TfrmTransfer.odsFromAfterOpen(DataSet: TDataSet);
begin
  aTransferOne.Enabled := odsFrom.RecordCount <> 0;
  aTransfer.Enabled := odsFrom.RecordCount <> 0;
end;

procedure TfrmTransfer.odsFromBeforeOpen(DataSet: TDataSet);
begin
  odsFrom.SetVariable('PFK_COMPANYID', CompanyFromId);
  odsFrom.SetVariable('PFK_PERIODID', PeriodFromId);
end;

procedure TfrmTransfer.odsToBeforeOpen(DataSet: TDataSet);
begin
  odsTo.SetVariable('PFK_COMPANYID', CompanyToId);
  odsTo.SetVariable('PFK_PERIODID', PeriodToId);
end;

end.
