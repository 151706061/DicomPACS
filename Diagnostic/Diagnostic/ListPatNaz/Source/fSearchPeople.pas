unit fSearchPeople;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, Menus, cxLookAndFeelPainters,
  StdCtrls, cxButtons, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel,
  ExtCtrls, ActnList, dxSkinsdxBarPainter, cxCheckBox, dxBar, cxBarEditItem,
  cxClasses, cxStyles, dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid, OracleData;

type
  TfrmSearchPeople = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    cxLabel1: TcxLabel;
    sFIO: TcxTextEdit;
    bEnter: TcxButton;
    bClear: TcxButton;
    bClose: TcxButton;
    alMain: TActionList;
    aClose: TAction;
    BM: TdxBarManager;
    BMBar1: TdxBar;
    bbLoad: TdxBarButton;
    dxBarDockControl1: TdxBarDockControl;
    aSet: TAction;
    cxGrid1: TcxGrid;
    TVPAC: TcxGridDBTableView;
    VFIO: TcxGridDBColumn;
    VROJD: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    odsPac: TOracleDataSet;
    dsPac: TDataSource;
    aClear: TAction;
    aSearch: TAction;
    pmTV: TPopupMenu;
    N2: TMenuItem;
    procedure aCloseExecute(Sender: TObject);
    procedure aSetExecute(Sender: TObject);
    procedure aClearExecute(Sender: TObject);
    procedure aSearchExecute(Sender: TObject);
    procedure sFIOClick(Sender: TObject);
    procedure sFIOEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TVPACCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    Russian : HKL;
    procedure CheckEnabledButtons;
    { Private declarations }
  public
    procedure DoShowfrmSearchPeople;
    { Public declarations }
  end;

var
  frmSearchPeople: TfrmSearchPeople;

implementation
uses fRun;

{$R *.dfm}

procedure TfrmSearchPeople.aClearExecute(Sender: TObject);
begin
  sFIO.Clear;
  sFIO.SetFocus;
end;

procedure TfrmSearchPeople.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmSearchPeople.aSearchExecute(Sender: TObject);
var sFam, sIm, sOtch : String;
    strIm : String;
    flag : Integer;
begin
  flag := 0;
  if Pos(' ', sFIO.Text) = 0 then
    begin
      sFam := sFIO.Text;
      flag := 1;
    end else
    begin
      sFam := copy(sFIO.Text, 1, Pos(' ', sFIO.Text));
    end;

  if flag = 1 then
    strIm := ''
  else
    strIm := trim(copy(sFIO.Text, Length(sFam), Length(sFIO.Text)+1 - Length(sFam)));

  sIm := trim(copy(strIm, 1, Pos(' ', strIm)));
  if sIm = '' then
    sIm := strIm;

  sOtch := trim(copy(strIm, Length(sIm)+1, Length(strIm)-Length(sIm)+1));

  if trim(sFIO.Text) <> '' then
    begin
      odsPac.DeleteVariables;
      odsPac.Close;
      odsPac.SQL.Text := ' SELECT TPEOPLES.FK_ID, '+ #13 +
                             '        TPEOPLES.FC_FAM||'' ''||TPEOPLES.FC_IM||'' ''|| TPEOPLES.FC_OTCH FIO, '+ #13 +
			                       '        DECODE(TO_CHAR(TPEOPLES.FD_ROJD, ''dd.mm.yyyy hh24:mi:ss''), ''00.00.0000 00:00:00'', TRUNC(SYSDATE), TPEOPLES.FD_ROJD) FD_ROJD, '+ #13 +
                             '        TUSLVID.FC_NAME, '+ #13 +
                             '        ASU.PKG_REGIST_PEPLFUNC.GET_PEPL_SEX(TPEOPLES.FK_ID) SEX, '+ #13 +
                             '        TPEOPLES.FC_DOCSER, '+ #13 +
                             '        TPEOPLES.FC_DOCNUM, '+ #13 +
                             '        TPEOPLES.FD_DOCDATE, '+ #13 +
                             '        ASU.GET_IB(TAMBULANCE.FK_ID) AS NIB, '+ #13 +
                             '        ''ÀÌÁÓËÀÒÎÐÍÎÅ ËÅ×ÅÍÈÅ'' STEK_COC, '+ #13 +
                             '        TAMBULANCE.FK_ID AS PACID, '+ #13 +
                             '        ASU.GET_LAST_FLUORO(TPEOPLES.FK_ID) AS LASTFLU, '+ #13 +
                             '        1 AS IS_AMBULANCE, '+ #13 +
                             '        0 AS FP_TEK_COC, '+ #13 +
                             '        TUSLVID.FK_ID AS USLID, '+ #13 +
                             '        (SELECT COUNT(*) FROM ASU.TNAZIS '+ #13 +
                             '          WHERE FK_PACID = ASU.GET_PEPLID(TAMBULANCE.FK_ID) AND FK_SMID = ASU.GET_XRAY_TUBDISPANCER '+ #13 +
                             '            AND SYSDATE >= FD_NAZ '+ #13 +
                             '            AND (SYSDATE < TO_DATE(FD_RUN)+1 OR FD_RUN IS NULL)) AS CNTTUB, '+ #13 +
                             '        (SELECT COUNT(*) FROM ASU.TNAZIS WHERE FK_PACID = ASU.GET_PEPLID(TAMBULANCE.FK_ID) AND FK_SMID = ASU.GET_XRAY_TUBDISPANCER) AS CNTTUB_ALL '+ #13 +
                             '   FROM ASU.TPEOPLES, ASU.TAMBULANCE, ASU.TDOCOBSL, ASU.TUSLVID '+ #13 +
                             '  WHERE TAMBULANCE.FK_PEPLID=TPEOPLES.FK_ID '+ #13 +
                             '    AND TPEOPLES.FC_FAM LIKE ''' + TRIM(SFAM) + '%'' '+ #13 +
                             '    AND NVL(TPEOPLES.FC_IM,'' '') LIKE ''' + TRIM(SIM) + '%'' '+ #13 +
                             '    AND NVL(TPEOPLES.FC_OTCH,'' '') LIKE ''' + TRIM(SOTCH) + '%'' '+ #13 +
                             '    AND TAMBULANCE.FK_DOCOBSL = TDOCOBSL.FK_ID '+ #13 +
                             '    AND TDOCOBSL.FK_VIDDOCID = TUSLVID.FK_ID '+ #13 +
                             ' UNION ALL '+ #13 +
                             ' SELECT TPEOPLES.FK_ID, '+ #13 +
                             '        TPEOPLES.FC_FAM||'' ''||TPEOPLES.FC_IM||'' ''|| TPEOPLES.FC_OTCH FIO, '+ #13 +
                             '        DECODE(TO_CHAR(TPEOPLES.FD_ROJD, ''dd.mm.yyyy hh24:mi:ss''), ''00.00.0000 00:00:00'', TRUNC(SYSDATE), TPEOPLES.FD_ROJD) FD_ROJD, '+ #13 +
                             '        TUSLVID.FC_NAME, '+ #13 +
                             '        ASU.PKG_REGIST_PEPLFUNC.GET_PEPL_SEX(TPEOPLES.FK_ID) SEX, '+ #13 +
                             '        TPEOPLES.FC_DOCSER, '+ #13 +
                             '        TPEOPLES.FC_DOCNUM, '+ #13 +
                             '        TPEOPLES.FD_DOCDATE, '+ #13 +
                             '        ASU.GET_IB(TKARTA.FK_ID) AS NIB, '+ #13 +
                             '        DECODE(TKARTA.FP_TEK_COC,3,''ÂÛÏÈÑÀÍ'',2,''Â ÑÒÀÖÈÎÍÀÐÅ'',-2,''ÍÀ ÎÔÎÐÌËÅÍÈÈ ÏÎ'','''') STEK_COC, '+ #13 +
                             '        TKARTA.FK_ID PACID, '+ #13 +
                             '        ASU.GET_LAST_FLUORO(TPEOPLES.FK_ID) AS LASTFLU, '+ #13 +
                             '        0 AS IS_AMBULANCE, '+ #13 +
                             '        TKARTA.FP_TEK_COC, '+ #13 +
                             '        TUSLVID.FK_ID AS USLID, '+ #13 +
                             '        (SELECT COUNT(*) FROM ASU.TNAZIS '+ #13 +
                             '          WHERE FK_PACID = ASU.GET_PEPLID(TKARTA.FK_ID) AND FK_SMID = ASU.GET_XRAY_TUBDISPANCER '+ #13 +
                             '            AND SYSDATE >= FD_NAZ '+ #13 +
                             '            AND (SYSDATE < TO_DATE(FD_RUN)+1 OR FD_RUN IS NULL)) AS CNTTUB, '+ #13 +
                             '        (SELECT COUNT(*) FROM ASU.TNAZIS WHERE FK_PACID = ASU.GET_PEPLID(TKARTA.FK_ID) AND FK_SMID = ASU.GET_XRAY_TUBDISPANCER) AS CNTTUB_ALL '+ #13 +
                             '   FROM ASU.TPEOPLES, ASU.TKARTA, ASU.TPERESEL, ASU.TDOCOBSL, ASU.TUSLVID '+ #13 +
                             '  WHERE TKARTA.FK_PEPLID=TPEOPLES.FK_ID '+ #13 +
                             '    AND TPEOPLES.FC_FAM LIKE ''' + TRIM(SFAM) + '%'' '+ #13 +
                             '    AND NVL(TPEOPLES.FC_IM,'' '') LIKE ''' + TRIM(SIM) + '%'' '+ #13 +
                             '    AND NVL(TPEOPLES.FC_OTCH,'' '') LIKE ''' + TRIM(SOTCH) + '%'' '+ #13 +
                             '    AND ASU.GET_MAXPERESELID(TKARTA.FK_ID) = TPERESEL.FK_ID '+ #13 +
                             '    AND TPERESEL.FK_DOCOBSLID = TDOCOBSL.FK_ID '+ #13 +
                             '    AND TDOCOBSL.FK_VIDDOCID = TUSLVID.FK_ID '+ #13 +
                             ' ORDER BY FIO ';
          odsPac.Open;
        end;
  CheckEnabledButtons;
end;

procedure TfrmSearchPeople.aSetExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSearchPeople.CheckEnabledButtons;
begin
  if odsPac.Active then
    begin
      aSet.Enabled := odsPac.RecordCount <> 0;
    end;
end;
procedure TfrmSearchPeople.DoShowfrmSearchPeople;
begin
  aSet.Enabled := FALSE;

//  TVPAC.StoreToRegistry('\SoftWare\SoftMaster\FLUORO\TVPACSEARCHPEOPLE'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID)+'Default', TRUE, [], 'TVPACSEARCHPEOPLE');
//  TVPAC.RestoreFromRegistry('\SoftWare\SoftMaster\FLUORO\TVPACSEARCHPEOPLE'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID), FALSE, FALSE, [], 'TVPACSEARCHPEOPLE');
end;

procedure TfrmSearchPeople.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
//  TVPAC.StoreToRegistry('\SoftWare\SoftMaster\FLUORO\TVPACSEARCHPEOPLE'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID), TRUE, [], 'TVPACSEARCHPEOPLE');
end;

procedure TfrmSearchPeople.FormCreate(Sender: TObject);
begin
  russian:=LoadKeyboardLayout('00000419', 0);
end;

procedure TfrmSearchPeople.N2Click(Sender: TObject);
begin
//  TVPAC.RestoreFromRegistry('\SoftWare\SoftMaster\FLUORO\TVPACSEARCHPEOPLE'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID)+'Default', FALSE, FALSE, [], 'TVPACSEARCHPEOPLE');
end;

procedure TfrmSearchPeople.sFIOClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmSearchPeople.sFIOEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmSearchPeople.TVPACCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if odsPac.RecordCount > 0 then
    begin
      aSetExecute(nil);
    end;
end;

end.
