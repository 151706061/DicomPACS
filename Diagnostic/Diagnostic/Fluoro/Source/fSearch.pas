unit fSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel,
  cxGroupBox, cxRadioGroup, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, Buttons, ActnList, ImgList,
  OracleData, Oracle, dxBar, Menus, ShellAPI, cxSplitter, jvDBUtils,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter, dxSkinsdxBarPainter,
  cxCheckBox, cxBarEditItem, cxImageComboBox, cxLookAndFeelPainters, cxButtons, cxGridExportLink,
  frxClass, frxDBSet, SMMainAPI, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue;

type
  TfrmSearch = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    cxLabel1: TcxLabel;
    sFIO: TcxTextEdit;
    TVPAC: TcxGridDBTableView;
    cxGrLevel1: TcxGridLevel;
    cxGr: TcxGrid;
    al: TActionList;
    il: TImageList;
    aClose: TAction;
    dsPac: TDataSource;
    odsPac: TOracleDataSet;
    VFIO: TcxGridDBColumn;
    aSearch: TAction;
    VROJD: TcxGridDBColumn;
    VLASTFLU: TcxGridDBColumn;
    dxBarDockControl1: TdxBarDockControl;
    BM: TdxBarManager;
    bbInfo: TdxBarButton;
    aInfo: TAction;
    pmTV: TPopupMenu;
    N2: TMenuItem;
    bbOpenMK: TdxBarButton;
    aOpenMK: TAction;
    bb1: TdxBarButton;
    actCloseNaz: TAction;
    actRefreshNaz: TAction;
    actLoadNaz: TAction;
    pnlNaz: TPanel;
    cxGrid2: TcxGrid;
    TVISSL: TcxGridDBTableView;
    VDATE: TcxGridDBColumn;
    VNAMEISSL: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    dxBarDockControl2: TdxBarDockControl;
    cxSplitter1: TcxSplitter;
    odsNaz: TOracleDataSet;
    dsNaz: TDataSource;
    bbCloseNaz: TdxBarButton;
    bbRefreshNaz: TdxBarButton;
    VDATENAZ: TcxGridDBColumn;
    VSOSID: TcxGridDBColumn;
    bbLoad: TdxBarButton;
    actLoad: TAction;
    VNUMDOC: TcxGridDBColumn;
    VTYPEDOC: TcxGridDBColumn;
    bbNew: TdxBarButton;
    actNew: TAction;
    cxCheckMK: TcxBarEditItem;
    bbPass: TdxBarButton;
    actTub: TAction;
    pnlTub: TPanel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    lbBegin: TcxLabel;
    lbEnd: TcxLabel;
    odsTubDates: TOracleDataSet;
    ilCntTub: TImageList;
    VPACTUB: TcxGridDBColumn;
    bEnter: TcxButton;
    bClear: TcxButton;
    aClear: TAction;
    cxLabel2: TcxLabel;
    lbSex: TcxLabel;
    cxLabel3: TcxLabel;
    lbRojd: TcxLabel;
    bClose: TcxButton;
    sdPopUp: TSaveDialog;
    N1: TMenuItem;
    N3: TMenuItem;
    Web1: TMenuItem;
    XML1: TMenuItem;
    XLS1: TMenuItem;
    frxRepSearch: TfrxReport;
    frxDBSearch: TfrxDBDataset;
    N4: TMenuItem;
    tmrCheckApplication: TTimer;
    actText: TAction;
    actWeb: TAction;
    actXML: TAction;
    actXLS: TAction;
    aPrint: TAction;
    procedure aCloseExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sFIOClick(Sender: TObject);
    procedure sFIOEnter(Sender: TObject);
    procedure aSearchExecute(Sender: TObject);
    procedure odsPacAfterScroll(DataSet: TDataSet);
    procedure aInfoExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N2Click(Sender: TObject);
    procedure aOpenMKExecute(Sender: TObject);
    procedure odsPacAfterOpen(DataSet: TDataSet);
    procedure actCloseNazExecute(Sender: TObject);
    procedure actRefreshNazExecute(Sender: TObject);
    procedure TVPACFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure actLoadNazExecute(Sender: TObject);
    procedure odsNazBeforeOpen(DataSet: TDataSet);
    procedure TVISSLCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure odsNazAfterOpen(DataSet: TDataSet);
    procedure odsNazAfterScroll(DataSet: TDataSet);
    procedure actLoadExecute(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure cxCheckMKPropertiesChange(Sender: TObject);
    procedure actTubExecute(Sender: TObject);
    procedure aClearExecute(Sender: TObject);
    procedure actTextExecute(Sender: TObject);
    procedure actWebExecute(Sender: TObject);
    procedure actXMLExecute(Sender: TObject);
    procedure actXLSExecute(Sender: TObject);
    procedure frxRepSearchGetValue(const VarName: string; var Value: Variant);
    procedure aPrintExecute(Sender: TObject);
    procedure tmrCheckApplicationTimer(Sender: TObject);
  private
    Russian : HKL;
    pWorkMode : Integer;
    pDOCID : Integer;
//    AppHandle : Integer;
    sDateSys_4Rep : string;
    procedure DoShowTub;
    function WinExecAndWait32(FileName: string; Visibility: integer): integer;
    procedure CheckEnabledButtons;    
    { Private declarations }
  public
    procedure DoShowfrmSearch(WorkMode: Integer; nDOCID : Integer=0);
    { Public declarations }
  end;

var
  frmSearch: TfrmSearch;

implementation

uses fMain, fPacInfo, fWait, fFastRegist, fTub;

{$R *.dfm}

procedure TfrmSearch.aClearExecute(Sender: TObject);
begin
  sFIO.Clear;
  sFIO.SetFocus;
end;

procedure TfrmSearch.aCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmSearch.FormCreate(Sender: TObject);
begin
  russian:=LoadKeyboardLayout('00000419', 0);
end;

procedure TfrmSearch.frxRepSearchGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'USLOVIE' then Value := sFIO.TExt;
  if VarName = 'SOTRNAME' then Value := frmMain.sVrachFIO;
  if VarName = 'DATESYS' then Value := sDateSys_4Rep;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;  
end;

procedure TfrmSearch.sFIOClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmSearch.sFIOEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmSearch.tmrCheckApplicationTimer(Sender: TObject);
var Wnd               : hWnd;
    buff              : array[0..127] of Char;
    i, j, iDel        : Integer;
begin
  Application.ProcessMessages;
  if not(tmrCheckApplication.Enabled) then exit;
  iDel:=0;
  for i:=0 to Length(frmMain.arFIO)-1 do
  begin
    Wnd := GetWindow(Handle, gw_HWndFirst);
    while Wnd <> 0 do
    begin
      if (Wnd <> Application.Handle) and (GetWindow(Wnd, gw_Owner) = 0) then
        begin
          GetWindowText(Wnd, buff, sizeof(buff));
          if StrPas(buff) = frmMain.arFIO[i-iDel] then
            begin
              if IsWindowVisible(Wnd) then
              begin
                  for j:=i-iDel to Length(frmMain.arFIO)-2 do
                  begin
                    frmMain.arFIO[j]:=frmMain.arFio[j+1];
                  end;
                  SetLength(frmMain.arFIO,Length(frmMain.arFIO)-1);
                  Inc(iDel);
                  if Length(frmMain.arFIO) = 0 then
                  begin
                    tmrCheckApplication.Enabled:=False;
                    Screen.Cursor:=crDefault;
                    aOpenMK.Enabled:=True;
                    Exit;
                  end;
                  Break;
              end;
            end;
        end;
      Wnd := GetWindow(Wnd, gw_hWndNext);
    end;
  end;
end;

procedure TfrmSearch.aSearchExecute(Sender: TObject);
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
  if pWorkMode = 1 then // участки
    begin
      if trim(sFIO.Text) <> '' then
        begin
          odsPac.DeleteVariables;
          odsPac.Close;
          odsPac.SQL.Text := ' SELECT TPEOPLES.FK_ID, '+ #13 +
                             '        TPEOPLES.FC_FAM||'' ''||TPEOPLES.FC_IM||'' ''|| TPEOPLES.FC_OTCH FIO, '+ #13 +
                             '        DECODE(TO_CHAR(TPEOPLES.FD_ROJD, ''dd.mm.yyyy hh24:mi:ss''), ''00.00.0000 00:00:00'', TRUNC(SYSDATE), TPEOPLES.FD_ROJD) FD_ROJD, '+ #13 +
                             '        TUSLVID.FC_NAME, '+ #13 +
                             '        asu.PKG_REGIST_PEPLFUNC.GET_PEPL_SEX(TPEOPLES.FK_ID) SEX, '+ #13 +
                             '        TPEOPLES.FC_DOCSER, '+ #13 +
                             '        TPEOPLES.FC_DOCNUM, '+ #13 +
                             '        ASU.GET_IB(TAMBULANCE.FK_ID) AS NIB, '+ #13 +
                             '        ''АМБУЛАТОРНОЕ ЛЕЧЕНИЕ'' STEK_COC, '+ #13 +
                             '        TAMBULANCE.FK_ID AS PACID, '+ #13 +
                             '        asu.GET_LAST_FLUORO(TPEOPLES.FK_ID) AS LASTFLU, '+ #13 +
                             '        1 AS IS_AMBULANCE, '+ #13 +
                             '        0 AS FP_TEK_COC, '+ #13 +
                             '        TUSLVID.FK_ID AS USLID, '+ #13 +
                             '        (SELECT 1 FROM ASU.TNAZIS '+ #13 +
                             '          WHERE FK_PACID = ASU.GET_PEPLID(TAMBULANCE.FK_ID) AND FK_SMID = asu.GET_XRAY_TUBDISPANCER '+ #13 +
                             '            AND SYSDATE >= FD_NAZ '+ #13 +
                             '            AND (SYSDATE < TO_DATE(FD_RUN)+1 OR FD_RUN IS NULL)) AS CNTTUB, '+ #13 +
                             '        (SELECT 1 FROM asu.TNAZIS WHERE FK_PACID = ASU.GET_PEPLID(TAMBULANCE.FK_ID) AND FK_SMID = asu.GET_XRAY_TUBDISPANCER) AS CNTTUB_ALL '+ #13 +
                             '   FROM asu.TPEOPLES, asu.TAMBULANCE, asu.TDOCOBSL, asu.TUSLVID '+ #13 +
                             '  WHERE TAMBULANCE.FK_PEPLID=TPEOPLES.FK_ID '+ #13 +
                             '    AND TPEOPLES.FC_FAM LIKE ''' + TRIM(SFAM) + '%'' '+ #13 +
                             '    AND NVL(TPEOPLES.FC_IM,'' '') LIKE ''' + TRIM(SIM) + '%'' '+ #13 +
                             '    AND NVL(TPEOPLES.FC_OTCH,'' '') LIKE ''' + TRIM(SOTCH) + '%'' '+ #13 +
                             '    AND TAMBULANCE.FK_DOCOBSL = TDOCOBSL.FK_ID '+ #13 +
                             '    AND TDOCOBSL.FK_VIDDOCID = TUSLVID.FK_ID '+ #13 +
                             ' ORDER BY FIO ';
          odsPac.Open;
        end;
    end;

  if pWorkMode = 2 then // предприятия
    begin
      if trim(sFIO.Text) <> '' then
        begin
          odsPac.DeleteVariables;
          odsPac.Close;
          odsPac.SQL.Text := ' SELECT TPEOPLES.FK_ID, '+ #13 +
                             '        TPEOPLES.FC_FAM||'' ''||TPEOPLES.FC_IM||'' ''|| TPEOPLES.FC_OTCH FIO, '+ #13 +
			                       '        DECODE(TO_CHAR(TPEOPLES.FD_ROJD, ''dd.mm.yyyy hh24:mi:ss''), ''00.00.0000 00:00:00'', TRUNC(SYSDATE), TPEOPLES.FD_ROJD) FD_ROJD, '+ #13 +
                             '        TUSLVID.FC_NAME, '+ #13 +
                             '        PKG_REGIST_PEPLFUNC.GET_PEPL_SEX(TPEOPLES.FK_ID) SEX, '+ #13 +
                             '        TPEOPLES.FC_DOCSER, '+ #13 +
                             '        TPEOPLES.FC_DOCNUM, '+ #13 +
                             '        ASU.GET_IB(TAMBULANCE.FK_ID) AS NIB, '+ #13 +
                             '        ''АМБУЛАТОРНОЕ ЛЕЧЕНИЕ'' STEK_COC, '+ #13 +
                             '        TAMBULANCE.FK_ID AS PACID, '+ #13 +
                             '        GET_LAST_FLUORO(TPEOPLES.FK_ID) AS LASTFLU, '+ #13 +
                             '        1 AS IS_AMBULANCE, '+ #13 +
                             '        0 AS FP_TEK_COC, '+ #13 +
                             '        TUSLVID.FK_ID AS USLID, '+ #13 +
                             '        (SELECT 1 FROM ASU.TNAZIS '+ #13 +
                             '          WHERE FK_PACID = ASU.GET_PEPLID(TAMBULANCE.FK_ID) AND FK_SMID = GET_XRAY_TUBDISPANCER '+ #13 +
                             '            AND SYSDATE >= FD_NAZ '+ #13 +
                             '            AND (SYSDATE < TO_DATE(FD_RUN)+1 OR FD_RUN IS NULL)) AS CNTTUB, '+ #13 +
                             '        (SELECT 1 FROM TNAZIS WHERE FK_PACID = ASU.GET_PEPLID(TAMBULANCE.FK_ID) AND FK_SMID = GET_XRAY_TUBDISPANCER) AS CNTTUB_ALL '+ #13 +
                             '   FROM asu.TPEOPLES, asu.TAMBULANCE, asu.TDOCOBSL, asu.TUSLVID '+ #13 +
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
                             '        PKG_REGIST_PEPLFUNC.GET_PEPL_SEX(TPEOPLES.FK_ID) SEX, '+ #13 +
                             '        TPEOPLES.FC_DOCSER, '+ #13 +
                             '        TPEOPLES.FC_DOCNUM, '+ #13 +
                             '        ASU.GET_IB(TKARTA.FK_ID) AS NIB, '+ #13 +
                             '        DECODE(TKARTA.FP_TEK_COC,3,''ВЫПИСАН'',2,''В СТАЦИОНАРЕ'',-2,''НА ОФОРМЛЕНИИ ПО'','''') STEK_COC, '+ #13 +
                             '        TKARTA.FK_ID PACID, '+ #13 +
                             '        GET_LAST_FLUORO(TPEOPLES.FK_ID) AS LASTFLU, '+ #13 +
                             '        0 AS IS_AMBULANCE, '+ #13 +
                             '        TKARTA.FP_TEK_COC, '+ #13 +
                             '        TUSLVID.FK_ID AS USLID, '+ #13 +
                             '        (SELECT 1 FROM ASU.TNAZIS '+ #13 +
                             '          WHERE FK_PACID = ASU.GET_PEPLID(TKARTA.FK_ID) AND FK_SMID = GET_XRAY_TUBDISPANCER '+ #13 +
                             '            AND SYSDATE >= FD_NAZ '+ #13 +
                             '            AND (SYSDATE < TO_DATE(FD_RUN)+1 OR FD_RUN IS NULL)) AS CNTTUB, '+ #13 +
                             '        (SELECT 1 FROM asu.TNAZIS WHERE FK_PACID = ASU.GET_PEPLID(TKARTA.FK_ID) AND FK_SMID = GET_XRAY_TUBDISPANCER) AS CNTTUB_ALL '+ #13 +
                             '   FROM asu.TPEOPLES, asu.TKARTA, asu.TUSLVID '+ #13 +
                             '  WHERE TKARTA.FK_PEPLID=TPEOPLES.FK_ID '+ #13 +
                             '    AND TPEOPLES.FC_FAM LIKE ''' + TRIM(SFAM) + '%'' '+ #13 +
                             '    AND NVL(TPEOPLES.FC_IM,'' '') LIKE ''' + TRIM(SIM) + '%'' '+ #13 +
                             '    AND NVL(TPEOPLES.FC_OTCH,'' '') LIKE ''' + TRIM(SOTCH) + '%'' '+ #13 +
                             '    AND TKARTA.FK_USLVIDID = TUSLVID.FK_ID '+#13+
                             ' ORDER BY FIO ';
          odsPac.Open;
        end;
    end;
  CheckEnabledButtons;
end;

procedure TfrmSearch.odsPacAfterScroll(DataSet: TDataSet);
begin
  lbRojd.Caption := DateTimeToStr(Trunc(odsPac.FieldByName('FD_ROJD').AsDateTime));
  lbSex.Caption := odsPac.FieldByName('SEX').AsString;
  DoShowTub;
  CheckEnabledButtons;
  if cxSplitter1.Visible = True then
    begin
      if cxCheckMK.EditValue = 1 then
        begin
	  cxCheckMK.EditValue := 0;
	  odsNaz.Filtered := False;
	  cxCheckMK.EditValue := 1;
	  odsNaz.Filtered := True;
	  odsNaz.Filter := 'FK_PACID = '+odsPac.FieldByName('PACID').AsString;
	end;
    end;
end;

procedure TfrmSearch.DoShowfrmSearch(WorkMode: Integer; nDOCID : Integer); // nDOCID лишний параметр !!!
begin
  pWorkMode := WorkMode;
  if pWorkMode = 1 then // участки
    begin
      actLoad.Visible := False;
      actNew.Visible := False;
      actLoad.Enabled := False;
      actNew.Enabled := False;
    end;
  if pWorkMode = 2 then // предприятия
    begin
      actLoad.Visible := True;
      actNew.Visible := True;
      actNew.Enabled := True;
    end;
  pDOCID := nDOCID;
  aInfo.Enabled := FALSE;
  aOpenMK.Enabled := FALSE;
  actLoad.Enabled := FALSE;
  actLoadNaz.Enabled := FALSE;
  actTub.Enabled := FALSE;
  cxSplitter1.CloseSplitter;
  cxSplitter1.Visible := FALSE;
  TVPAC.StoreToRegistry('\SoftWare\SoftMaster\FLUORO\TVPACSEARCH'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID)+'Default', TRUE, [], 'TVPACSEARCH'); //!!! сохраняются настройки из врача!
  TVPAC.RestoreFromRegistry('\SoftWare\SoftMaster\FLUORO\TVPACSEARCH'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID), FALSE, FALSE, [], 'TVPACSEARCH');
end;

procedure TfrmSearch.DoShowTub;
begin
  if odsPac.FieldByName('CNTTUB_ALL').AsInteger <> 0 then
    begin
      pnlTub.Visible := True;
      odsTubDates.Close;
      odsTubDates.SetVariable('PFK_PEPLID', odsPac.FieldByName('FK_ID').AsInteger);
      odsTubDates.Open;
      odsTubDates.Last;
      lbBegin.Caption := odsTubDates.FieldByName('FD_NAZSTR').AsString;
      lbEnd.Caption := odsTubDates.FieldByName('FD_RUNSTR').AsString;
      if odsTubDates.FieldByName('FD_RUNSTR').AsString = '' then
        begin
          cxLabel4.Style.Font.Color := clRed;
          cxLabel4.Style.TextStyle := [fsBold];
        end else
        begin
          cxLabel4.Style.Font.Color := clBlack;
          cxLabel4.Style.TextStyle := cxLabel4.Style.TextStyle - [fsBold];
        end;
    end else
    begin
      pnlTub.Visible := False;
    end;
end;

procedure TfrmSearch.CheckEnabledButtons;
begin
  if odsPac.Active then
    begin
      aInfo.Enabled := odsPac.RecordCount <> 0;
      aOpenMK.Enabled := odsPac.RecordCount <> 0;
      actLoadNaz.Enabled := odsPac.RecordCount <> 0;
      actLoad.Enabled := (odsPac.RecordCount <> 0) and (pWorkMode <> 1);
      actTub.Enabled := odsPac.RecordCount <> 0;
    end;
end;

procedure TfrmSearch.cxCheckMKPropertiesChange(Sender: TObject);
begin
	if cxCheckMK.EditValue = 1 then
    begin
			odsNaz.Filtered := True;
			odsNaz.Filter := 'FK_PACID = '+odsPac.FieldByName('PACID').AsString;
		end else
		begin
      odsNaz.Filtered := False;
		end;
end;

procedure TfrmSearch.aInfoExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmPacInfo, frmPacInfo);
  try
    frmPacInfo.DoShowPacInfo(odsPac.FieldByName('PACID').AsInteger,
                             odsPac.FieldByName('FK_ID').AsInteger,
                             '');
    frmPacInfo.ShowModal;
  finally
    frmPacInfo.Free;
  end;
end;

procedure TfrmSearch.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  TVPAC.StoreToRegistry('\SoftWare\SoftMaster\FLUORO\TVPACSEARCH'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID), TRUE, [], 'TVPACSEARCH');
end;

procedure TfrmSearch.N2Click(Sender: TObject);
begin
  TVPAC.RestoreFromRegistry('\SoftWare\SoftMaster\FLUORO\TVPACSEARCH'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID)+'Default', FALSE, FALSE, [], 'TVPACSEARCH');
end;

procedure TfrmSearch.aOpenMKExecute(Sender: TObject);
var ods : TOracleDataSet;
    AppProcID : Integer;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT ASU.PKG_REGIST_PEPLFUNC.GET_PEPL_FIO(:FK_PEPLID) FIOPAC FROM DUAL ';
    ods.DeclareAndSet('FK_PEPLID', otInteger, odsPac.FieldByName('FK_ID').AsInteger);
    ods.Open;
    if frmMain.RestoreApplication(ods.FieldByName('FIOPAC').AsString) then Exit;
    SetLength(frmMain.arFIO,Length(frmMain.arFIO)+1);
    frmMain.arFIO[Length(frmMain.arFIO)-1]:=ods.FieldByName('FIOPAC').AsString;
    aOpenMK.Enabled:=False;
    Application.ProcessMessages;
    Screen.Cursor := crSQLWait;
    tmrCheckApplication.Enabled:=True;

//    AppHandle := WinExecAndWait32(PChar('IBRazdel.exe '+IntToStr(frmMain.pAPPSOTRID)+' '+IntToStr(odsPac.FieldByName('PACID').AsInteger)+' '+IntToStr(-1)+' '+IntToStr(-1)), 1);
//    GetInputMapAppFromApp(AppHandle);

    AppProcID := AppStart(ExtractFilePath(paramstr(0))+'IBRazdel.exe', IntToStr(odsPac.FieldByName('PACID').AsInteger)+' '+IntToStr(-1)+' '+IntToStr(-1));
    if AppProcID = -1 then ShowMessage('Ошибка запуска приложения');
    ShowWait(odsPac.FieldByName('PACID').AsInteger,True);
  finally
    ods.Free;
  end;
end;

procedure TfrmSearch.aPrintExecute(Sender: TObject);
var ods : TOracleDataSet;
     id : Integer;
begin
  odsPac.AfterScroll := nil;
  TVPAC.OnFocusedRecordChanged := nil;

  id := odsPac.FieldByName('PACID').AsInteger;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY HH24:MI'') AS DATESYS FROM DUAL ';
    ods.Open;
    sDateSys_4Rep := ods.FieldByName('DATESYS').AsString;
  finally
    ods.Free;
  end;
  frxRepSearch.ShowReport;
  odsPac.Locate('PACID', id, []);
  TVPAC.OnFocusedRecordChanged := TVPACFocusedRecordChanged;
  odsPac.AfterScroll := odsPacAfterScroll;
end;

procedure TfrmSearch.odsPacAfterOpen(DataSet: TDataSet);
begin
  if odsPac.RecordCount = 0 then
    begin
      lbRojd.Caption := '--';
      lbSex.Caption := '--';
    end;
end;

procedure TfrmSearch.actCloseNazExecute(Sender: TObject);
begin
  cxSplitter1.CloseSplitter;
  cxSplitter1.Visible := False;
  TVISSL.StoreToRegistry('\SoftWare\SoftMaster\List_xrays_vrach\TVISSLSEARCH'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID), TRUE, [], 'TVISSLSEARCH');
end;

procedure TfrmSearch.actRefreshNazExecute(Sender: TObject);
begin
  RefreshQuery(odsNaz);
end;

procedure TfrmSearch.actTextExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    if TVPAC.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmSearch.actTubExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmTub, frmTub);
  frmTub.DoShowFormTub(odsPac.FieldByName('FK_ID').AsInteger, odsPac.FieldByName('FIO').AsString);
  frmTub.ShowModal;
  frmTub.Free;
  DoShowTub;
end;

procedure TfrmSearch.actWebExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    if TVPAC.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmSearch.actXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TVPAC.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmSearch.actXMLExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    if TVPAC.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmSearch.TVPACFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  if cxSplitter1.Visible then
    begin
      odsNaz.Close;
      odsNaz.Open;
    end;
end;

function TfrmSearch.WinExecAndWait32(FileName: string; Visibility: integer): integer;
var zAppName: array[0..512] of char;
    zCurDir: array[0..255] of char;
    WorkDir: string;
    StartupInfo: TStartupInfo;
    ProcessInfo: TProcessInformation;
begin
  StrPCopy(zAppName, FileName);
  GetDir(0, WorkDir);
  StrPCopy(zCurDir, FileName);
  FillChar(StartupInfo, Sizeof(StartupInfo), #0);
  StartupInfo.cb := Sizeof(StartupInfo);
  StartupInfo.hStdInput := 23999;
  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := Visibility;
  if not CreateProcess(nil,
         zAppName, { указатель командной строки }
         nil, { указатель на процесс атрибутов безопасности }
         nil, { указатель на поток атрибутов безопасности }
         false, { флаг родительского обработчика }
         CREATE_NEW_CONSOLE or { флаг создания }
         NORMAL_PRIORITY_CLASS,
         nil, { указатель на новую среду процесса }
         nil, { указатель на имя текущей директории }
         StartupInfo, { указатель на STARTUPINFO }
         ProcessInfo) then Result := -1 { указатель на PROCESS_INF }
  else begin
      Result := ProcessInfo.dwProcessId;
  end;
end;

procedure TfrmSearch.actLoadNazExecute(Sender: TObject);
begin
  if cxSplitter1.Visible <> True then
    begin
      cxSplitter1.Visible := True;
      cxSplitter1.OpenSplitter;
      TVISSL.RestoreFromRegistry('\SoftWare\SoftMaster\List_xrays_vrach\TVISSLSEARCH'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID), FALSE, FALSE, [], 'TVISSLSEARCH');
    end;
  odsNaz.Close;
  odsNaz.Open;
end;

procedure TfrmSearch.odsNazBeforeOpen(DataSet: TDataSet);
begin
  odsNaz.SetVariable('PFK_PACID', odsPac.FieldByName('FK_ID').AsInteger); //odsPac.FieldByName('PACID').AsInteger);
end;

procedure TfrmSearch.TVISSLCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.GridRecord.Values[VSOSID.Index] = GET_NAZCANCEL then
    ACanvas.Brush.Color:=RGB(251, 172, 182);
  if AViewInfo.GridRecord.Values[VSOSID.Index] = GET_NEYAV then
    ACanvas.Brush.Color:=RGB(251, 172, 182);
  if AViewInfo.GridRecord.Values[VSOSID.Index] = GET_VIPNAZ then
    ACanvas.Brush.Color:=RGB(118, 245, 188);
end;

procedure TfrmSearch.odsNazAfterOpen(DataSet: TDataSet);
begin
  CheckEnabledButtons;
end;

procedure TfrmSearch.odsNazAfterScroll(DataSet: TDataSet);
begin
  CheckEnabledButtons;
end;

procedure TfrmSearch.actLoadExecute(Sender: TObject);
var oq : TOracleQuery;
    ods : TOracleDataSet;
begin
  if frmMain.WorkMode = 1 then // Режим работы - Участки
    begin
      oq := TOracleQuery.Create(nil);
      try
	      oq.Session := frmMain.os;
	      oq.Cursor := crSQLWait;
	      oq.SQL.Text := ' UPDATE TAMBULANCE SET FK_UCHID = :PFK_UCHID WHERE FK_ID = :PFK_ID ';
	      oq.DeclareAndSet('PFK_UCHID', otInteger, frmMain.dxName.Tag);
	      oq.DeclareAndSet('PFK_ID', otInteger, odsPac.FieldByName('PACID').AsInteger);
	      oq.Execute;
	      frmMain.os.Commit;
	      RefreshQuery(frmMain.dsList.DataSet);
        if frmMain.bHide = True then
          frmMain.DoHideRows;
      finally
	      oq.Free;
      end;
    end;
  if frmMain.WorkMode = 2 then //Режим работы - Предприятия
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT (SELECT FC_SHORT FROM ASU.TCOMPANY WHERE FK_ID = TPEOPLES_COMPANY.FK_COMPANYID) AS COMPANYNAME '+
                        ' FROM ASU.TPEOPLES_COMPANY WHERE FK_PEOPLEID = :PFK_PEOPLEID ';
        ods.DeclareAndSet('PFK_PEOPLEID', otInteger, odsPac.FieldByName('FK_ID').AsInteger);
        ods.Open;
        if ods.RecordCount > 0 then
          begin
            MessageDlg('Данный пациент принадлежит к предприятию "'+ods.FieldByName('COMPANYNAME').AsString+'"!'
                        +#13+#10+'Вы не можете его добавить еще раз в это же или другое предприятие!'
                        +#13+#10+'Сначала открепите данного пациента от предприятия, к которому он сейчас принадлежит!', mtWarning, [mbOK], 0);
            Exit;
          end;
      finally
        ods.Free;
      end;

      oq := TOracleQuery.Create(nil);
      try
	      oq.Session := frmMain.os;
	      oq.Cursor := crSQLWait;
	      oq.SQL.Text := ' INSERT INTO TPEOPLES_COMPANY(FK_COMPANYID, FK_PEOPLEID, FK_PERIODID) '+
		                   ' VALUES(:PFK_COMPANYID, :PFK_PEOPLEID, :PFK_PERIODID) ';
	      oq.DeclareAndSet('PFK_COMPANYID', otInteger, frmMain.dxName.Tag);
	      oq.DeclareAndSet('PFK_PEOPLEID', otInteger, odsPac.FieldByName('FK_ID').AsInteger);
        oq.DeclareAndSet('PFK_PERIODID', otInteger, frmMain.PeriodId);
	      oq.Execute;
	      frmMain.os.Commit;
	      RefreshQuery(frmMain.dsList.DataSet);
        if frmMain.bHide = True then
          frmMain.DoHideRows;
      finally
	      oq.Free;
      end;
    end;
  sFIO.Clear;
end;

procedure TfrmSearch.actNewExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmFastRegist, frmFastRegist);
  try
    frmFastRegist.DoShowfrmRegistrAmbPac(1, frmMain.pSOTRID, 0, 0, sFIO.Text, frmMain.pOTDELID, 0);
    frmFastRegist.ShowModal;
  finally
    frmFastRegist.Free;
  end;
end;

end.
