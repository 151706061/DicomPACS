unit fInsReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, ActnList,
  dxBar, cxClasses, cxStyles, dxSkinscxPCPainter, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, OracleData,
  cxGridLevel, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, jvDBUtils, Oracle,
  dxSkinOffice2007Green;

type
  TfrmInsReport = class(TForm)
    dxBM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    actlstInsRep: TActionList;
    dxBMBar1: TdxBar;
    bb1: TdxBarButton;
    bb2: TdxBarButton;
    bb3: TdxBarButton;
    bb4: TdxBarButton;
    bbClose: TdxBarButton;
    actAdd: TAction;
    actEdit: TAction;
    actDel: TAction;
    actClose: TAction;
    actRefresh: TAction;
    TVREP: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dsListRep: TDataSource;
    odsListRep: TOracleDataSet;
    VREPColumn1: TcxGridDBColumn;
    VREPColumn2: TcxGridDBColumn;
    VREPColumn3: TcxGridDBColumn;
    VREPColumn4: TcxGridDBColumn;
    procedure actCloseExecute(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure odsListRepBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    pSMID : Integer;
    procedure DoShowInsReport(nSMID : Integer);
    { Public declarations }
  end;

var
  frmInsReport: TfrmInsReport;

implementation
uses fMain, fAddEditRep;
{$R *.dfm}

procedure TfrmInsReport.actAddExecute(Sender: TObject);
//var oq : TOracleQuery;
begin
//  Application.CreateForm(TfrmAddEditRep, frmAddEditRep);
//  frmAddEditRep.ShowModal;
//  if frmAddEditRep.ModalResult = mrOK then
//    begin
//      oq := TOracleQuery.Create(nil);
//      try
//        oq.Session := frmMain.os;
//        oq.Cursor := crSQLWait;
//        oq.SQL.Text := ' INSERT INTO TS_COLUMNNAZ(FC_NAME, FK_OWNER, FK_SMID, FC_SYNONIM, FC_TABLENAME) '+
//                       ' VALUES(:PFC_NAME, :PFK_OWNER, :PFK_SMID, :PFC_SYNONIM, :PFC_TABLENAME) ';
//        oq.DeclareAndSet('PFC_NAME', otString, );
//        oq.DeclareAndSet('PFK_OWNER', otInteger, );
//        oq.DeclareAndSet('PFK_SMID', otInteger, );
//        oq.DeclareAndSet('PFC_SYNONIM', otString, );
//        oq.DeclareAndSet('PFC_TABLENAME', otString, );
//        oq.Execute;
//        frmMain.os.Commit;
//        RefreshQuery(odsListRep);
//      finally
//        oq.Free;
//      end;
//    end;
//  frmAddEditRep.Free;
end;

procedure TfrmInsReport.actCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmInsReport.actDelExecute(Sender: TObject);
begin
//
end;

procedure TfrmInsReport.actEditExecute(Sender: TObject);
begin
//
end;

procedure TfrmInsReport.actRefreshExecute(Sender: TObject);
begin
  RefreshQuery(odsListRep);
end;

procedure TfrmInsReport.DoShowInsReport(nSMID: Integer);
begin
  pSMID := nSMID;
  if odsListRep.Active = False then
    odsListRep.Open;
end;

procedure TfrmInsReport.odsListRepBeforeOpen(DataSet: TDataSet);
begin
  odsListRep.SetVariable('PFK_ID', pSMID);
end;

end.

