unit fPac;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, dxBar, ExtCtrls,
  ActnList, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, DB, cxDBData, OracleData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, frxClass, frxDBSet, Oracle, Menus, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, dxSkinsdxBarPainter,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxLabel, JvDBUtils, Clipbrd;

type
  TfrmPac = class(TForm)
    BM: TdxBarManager;
    bbClose: TdxBarButton;
    actlstPac: TActionList;
    actClose: TAction;
    cxGrid1: TcxGrid;
    TVLIST: TcxGridDBTableView;
    VLISTRUN: TcxGridDBColumn;
    VLISTNAME: TcxGridDBColumn;
    VDOZA: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    odsList: TOracleDataSet;
    dsList: TDataSource;
    bbProsmotr: TdxBarButton;
    bbPrint: TdxBarButton;
    actProsmotr: TAction;
    actPrint: TAction;
    frxDBPrintList: TfrxDBDataset;
    pmGrid: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    C1: TMenuItem;
    frxReport1: TfrxReport;
    frxPrintList: TfrxReport;
    Panel4: TPanel;
    lbFIO: TcxLabel;
    bClose: TcxButton;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    Panel2: TPanel;
    dxBarDockControl1: TdxBarDockControl;
    bbRefresh: TdxBarButton;
    aRefresh: TAction;
    pmFIO: TPopupMenu;
    N3: TMenuItem;
    procedure actCloseExecute(Sender: TObject);
    procedure odsListBeforeOpen(DataSet: TDataSet);
    procedure actProsmotrExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure frxPrintListGetValue(const VarName: String;
      var Value: Variant);
    procedure frxReport1GetValue(const VarName: String;
      var Value: Variant);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure C1Click(Sender: TObject);
    procedure TVLISTDblClick(Sender: TObject);
    procedure odsListAfterOpen(DataSet: TDataSet);
    procedure aRefreshExecute(Sender: TObject);
    procedure lbFIOMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lbFIOMouseLeave(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TVLISTKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    Russian : HKL;
    { Private declarations }
  public
    GET_SYSDATE_4REP : String;
    sSotrFIO_4rep, sTextIssl_4rep, sNumIssl_4rep : String;
    procedure DoShowFormPac;
    { Public declarations }
  end;

var
  frmPac: TfrmPac;

implementation
uses fMain, fDolg;
{$R *.dfm}

procedure TfrmPac.actCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmPac.DoShowFormPac;
begin
  lbFIO.Caption := frmDolg.odsList.FieldByName('FIOPAC').AsString;
  if odsList.Active = False then
    odsList.Open;

  TVLIST.StoreToRegistry('\SoftWare\SoftMaster\Fluoro_vyverka\TVLISTPAC'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID)+'Default', TRUE, [], 'TVLISTPAC');
  TVLIST.RestoreFromRegistry('\SoftWare\SoftMaster\Fluoro_vyverka\TVLISTPAC'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID), FALSE, FALSE, [], 'TVLISTPAC');
end;

procedure TfrmPac.odsListBeforeOpen(DataSet: TDataSet);
begin
  odsList.SetVariable('PFK_PACID', frmDolg.odsList.FieldByName('PEPLID').AsInteger);
end;

procedure TfrmPac.actProsmotrExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FK_ID, '+
                    '        ASU.DO_VRACHFIO(FK_ISPOLID) AS VRACHFIO, '+
                    '        (SELECT FB_TEXT FROM ASU.TRICHVIEWDATA WHERE FK_PACID = TNAZIS.FK_ID) AS TEXTISSL, '+
                    '        DECODE(ASU.GET_OWNER_FROM_SMID(TNAZIS.FK_SMID), '+
                    '               ASU.GET_XRAY_FLU, '+
                    '              (SELECT MAX(FC_CHAR) '+
                    '                 FROM ASU.TIB '+
                    '                WHERE FK_PACID = TNAZIS.FK_ID '+
                    '                  AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_FLU_NUMBER'')), '+
                    '              (SELECT MAX(FC_CHAR) '+
                    '                 FROM ASU.TIB '+
                    '                WHERE FK_PACID = TNAZIS.FK_ID '+
                    '                  AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''NUMBER_ISSL''))) AS NUMBER_ISSL '+
                    '   FROM ASU.TNAZIS '+
                    '  WHERE FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
    ods.Open;
    sSotrFIO_4rep := ods.FieldByName('VRACHFIO').AsString;
    sTextIssl_4rep := ods.FieldByName('TEXTISSL').AsString;
    sNumIssl_4rep := ods.FieldByName('NUMBER_ISSL').AsString;
  finally
    ods.Free;
  end;
  frxReport1.ShowReport;
end;

procedure TfrmPac.aRefreshExecute(Sender: TObject);
begin
  RefreshQuery(odsList);
end;

procedure TfrmPac.actPrintExecute(Sender: TObject);
var ods : TOracleDataSet;
     id : Integer;
begin
  id := odsList.FieldByName('FK_ID').AsInteger;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY HH24:MI'') AS SYSTEMDATE FROM DUAL ';
    ods.Open;
    GET_SYSDATE_4REP := ods.FieldByName('SYSTEMDATE').AsString;
  finally
    ods.Free;
  end;
  frxPrintList.ShowReport;
  odsList.Locate('FK_ID', id, []);
end;

procedure TfrmPac.frxPrintListGetValue(const VarName: String; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'PACFIO' then Value := lbFIO.Caption;
  if VarName = 'KOLVONAZ' then Value := odsList.RecordCount;
  if VarName = 'SYSDATE' then Value := GET_SYSDATE_4REP;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;  
end;

procedure TfrmPac.frxReport1GetValue(const VarName: String; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4rep;
  if VarName = 'PACFIO' then Value := lbFIO.Caption;
  if VarName = 'DATE_ROJD' then Value := odsList.FieldByName('FD_ROJD').AsDateTime;
  if VarName = 'NUMIB' then Value := odsList.FieldByName('NUMIB').AsString;
  if VarName = 'NAMEISSL' then Value := odsList.FieldByName('FC_NAME').AsString;
  if VarName = 'DOZA' then Value := odsList.FieldByName('DOZA').AsString;
  if VarName = 'DATEISSL' then Value := odsList.FieldByName('FD_RUN').AsString;
  if VarName = 'TEXTISSL' then Value := sTextIssl_4rep;
  if VarName = 'NUMISSL' then Value := sNumIssl_4rep;
  if VarName = 'SOTR' then Value := sSotrFIO_4rep;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;  
end;

procedure TfrmPac.lbFIOMouseLeave(Sender: TObject);
begin
  lbFIO.Style.BorderStyle := ebsNone;
  lbFIO.Style.BorderColor := clBtnFace;
end;

procedure TfrmPac.lbFIOMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  lbFIO.Style.BorderStyle := ebsUltraFlat;
  lbFIO.Style.BorderColor := clGray;
end;

procedure TfrmPac.N3Click(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
  Clipboard.AsText := lbFIO.Caption;
end;

procedure TfrmPac.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  TVLIST.StoreToRegistry('\SoftWare\SoftMaster\Fluoro_vyverka\TVLISTPAC'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID), TRUE, [], 'TVLISTPAC');
end;

procedure TfrmPac.FormCreate(Sender: TObject);
begin
  russian:=LoadKeyboardLayout('00000419', 0);
end;

procedure TfrmPac.C1Click(Sender: TObject);
begin
  TVLIST.RestoreFromRegistry('\SoftWare\SoftMaster\Fluoro_vyverka\TVLISTPAC'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID)+'Default', FALSE, FALSE, [], 'TVLISTPAC');
end;

procedure TfrmPac.TVLISTDblClick(Sender: TObject);
begin
  if odsList.RecordCount > 0 then
    actProsmotrExecute(nil);
end;

procedure TfrmPac.TVLISTKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if odsList.RecordCount <> 0 then
    begin
      if Key = VK_RETURN then
        actProsmotrExecute(nil);
    end;
end;

procedure TfrmPac.odsListAfterOpen(DataSet: TDataSet);
begin
  actPrint.Enabled := odsList.RecordCount <> 0;
  actProsmotr.Enabled := odsList.RecordCount <> 0;
end;

end.
