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
  cxCheckBox, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  dxSkinsdxBarPainter, cxBarEditItem, cxImageComboBox, frxClass, frxDBSet,
  cxLookAndFeelPainters, cxButtons, cxGridExportLink, cxCalendar, SMMainAPI, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue, JvStringHolder;

type
  TfrmSearch = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    cxLabel1: TcxLabel;
    sFIO: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    TVPAC: TcxGridDBTableView;
    cxGrLevel1: TcxGridLevel;
    cxGr: TcxGrid;
    al: TActionList;
    aClose: TAction;
    dsPac: TDataSource;
    odsPac: TOracleDataSet;
    VFIO: TcxGridDBColumn;
    aSearch: TAction;
    VROJD: TcxGridDBColumn;
    VNUMBER: TcxGridDBColumn;
    VSOS: TcxGridDBColumn;
    VLASTFLU: TcxGridDBColumn;
    dxBarDockControl1: TdxBarDockControl;
    BM: TdxBarManager;
    bbHistory: TdxBarButton;
    bbNew: TdxBarButton;
    aNew: TAction;
    aHistory: TAction;
    bbInfo: TdxBarButton;
    aInfo: TAction;
    bbNaprav: TdxBarButton;
    aNaprav: TAction;
    VTYPEDOC: TcxGridDBColumn;
    pmTV: TPopupMenu;
    N2: TMenuItem;
    bbOpenMK: TdxBarButton;
    aOpenMK: TAction;
    cxSplitter1: TcxSplitter;
    pnlNaz: TPanel;
    cxGrid2: TcxGrid;
    TVISSL: TcxGridDBTableView;
    VDATE: TcxGridDBColumn;
    VNAMEISSL: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    dxBarDockControl2: TdxBarDockControl;
    dsNaz: TDataSource;
    odsNaz: TOracleDataSet;
    bbEditNaz: TdxBarButton;
    bbCloseNaz: TdxBarButton;
    actClosenaz: TAction;
    actEditNaz: TAction;
    bb1: TdxBarButton;
    actLoadNaz: TAction;
    bbRefreshNaz: TdxBarButton;
    actRefreshNaz: TAction;
    VSOSID: TcxGridDBColumn;
    VDATENAZ: TcxGridDBColumn;
    cxCheckMK: TcxBarEditItem;
    odsNazFK_ID: TFloatField;
    odsNazFK_SMID: TFloatField;
    odsNazOWNER: TFloatField;
    odsNazFD_NAZ: TStringField;
    odsNazRUN_DATE: TDateTimeField;
    odsNazFD_RUN: TStringField;
    odsNazFK_PACID: TFloatField;
    odsNazFK_ROOMID: TIntegerField;
    odsNazFK_NAZSOSID: TFloatField;
    odsNazNAMEISSL: TStringField;
    odsNazOWNERNAME: TStringField;
    odsNazNUMBERISSL: TStringField;
    odsNazSMIDORDER: TFloatField;
    bbPass: TdxBarButton;
    actPass: TAction;
    bbTub: TdxBarButton;
    actTub: TAction;
    pnlTub: TPanel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    lbBegin: TcxLabel;
    lbEnd: TcxLabel;
    VCNTTUB: TcxGridDBColumn;
    ilCntTub: TImageList;
    odsTubDates: TOracleDataSet;
    VPACPLAN: TcxGridDBColumn;
    aClearSearch: TAction;
    odsNazPRED_DATE: TStringField;
    pmTVNAZ: TPopupMenu;
    MenuItem1: TMenuItem;
    odsNazFD_NAZ_RUN: TStringField;
    odsNazIS_AMBULANCE: TFloatField;
    aPrintSearch: TAction;
    frxRepSearch: TfrxReport;
    frxDBSearch: TfrxDBDataset;
    N1: TMenuItem;
    bEnter: TcxButton;
    bClear: TcxButton;
    bClose: TcxButton;
    lbSex: TcxLabel;
    lbRojd: TcxLabel;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aXLS: TAction;
    N3: TMenuItem;
    N4: TMenuItem;
    Web1: TMenuItem;
    XML1: TMenuItem;
    Excel1: TMenuItem;
    sdPopUp: TSaveDialog;
    N5: TMenuItem;
    N6: TMenuItem;
    aRefresh: TAction;
    tmrCheckApplication: TTimer;
    VRGPLUS: TcxGridDBColumn;
    ilRgPlus: TImageList;
    aSysInfo: TAction;
    VPACDOOBSL: TcxGridDBColumn;
    bbPolis: TdxBarButton;
    aPolis: TAction;
    mshSQL: TJvMultiStringHolder;
    procedure aCloseExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sFIOClick(Sender: TObject);
    procedure sFIOEnter(Sender: TObject);
    procedure aSearchExecute(Sender: TObject);
    procedure odsPacAfterScroll(DataSet: TDataSet);
    procedure aNewExecute(Sender: TObject);
    procedure aHistoryExecute(Sender: TObject);
    procedure aInfoExecute(Sender: TObject);
    procedure aNapravExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N2Click(Sender: TObject);
    procedure aOpenMKExecute(Sender: TObject);
    procedure actClosenazExecute(Sender: TObject);
    procedure actEditNazExecute(Sender: TObject);
    procedure actLoadNazExecute(Sender: TObject);
    procedure odsNazBeforeOpen(DataSet: TDataSet);
    procedure actRefreshNazExecute(Sender: TObject);
    procedure TVPACFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure TVISSLCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure odsNazAfterOpen(DataSet: TDataSet);
    procedure odsNazAfterScroll(DataSet: TDataSet);
    procedure cxCheckMKPropertiesChange(Sender: TObject);
    procedure odsPacAfterOpen(DataSet: TDataSet);
    procedure actPassExecute(Sender: TObject);
    procedure actTubExecute(Sender: TObject);
    procedure DoShowTub;
    procedure aClearSearchExecute(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure TVISSLCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure aPrintSearchExecute(Sender: TObject);
    procedure frxRepSearchGetValue(const VarName: string; var Value: Variant);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure tmrCheckApplicationTimer(Sender: TObject);
    procedure aSysInfoExecute(Sender: TObject);
    procedure aPolisExecute(Sender: TObject);
  private
    arFIO:array of string;
    sDateSys_4Rep : String;
    {$IFDEF USE_NEW_AUTH}
      function RestoreApplication(AAppCaption:string):Boolean;
    {$ENDIF}
    { Private declarations }
  public
    Russian : HKL;
    sSOTRFIO : String;
    procedure DoShowfrmSearch;
    procedure CheckEnabledButtons;
    { Public declarations }
  end;

var
  frmSearch: TfrmSearch;

implementation

uses fPacInfo, fRegistrAmbPac, fMain, fRegistrAmbPacFlu, fWait,
     fEditNaz, fOtmena, fTub, fFluoro, fAllHistory, fSysInfo, fSetPolis,
  fRegistRad;

{$R *.dfm}

procedure TfrmSearch.aClearSearchExecute(Sender: TObject);
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
  if VarName = 'USLOVIE' then Value := sFIO.Text;
  if VarName = 'SOTRNAME' then Value := frmMain.sSotrFIO;
  if VarName = 'DATESYS' then Value := sDateSys_4Rep;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;  
end;

procedure TfrmSearch.MenuItem1Click(Sender: TObject);
begin
  TVISSL.RestoreFromRegistry('\SoftWare\SoftMaster\RgRegistr\TVISSLSEARCH\NazVrach_' + IntToStr(frmMain.pSOTRID)+'Default', FALSE, FALSE, [], 'TVISSLSEARCH');
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
  for i:=0 to Length(arFIO)-1 do
  begin
    Wnd := GetWindow(Handle, gw_HWndFirst);
    while Wnd <> 0 do
    begin
      if (Wnd <> Application.Handle) and (GetWindow(Wnd, gw_Owner) = 0) then
        begin
          GetWindowText(Wnd, buff, sizeof(buff));
          if Trim(StrPas(buff)) = Trim(arFIO[i-iDel]) then
            begin
              if IsWindowVisible(Wnd) then
              begin
                  for j:=i-iDel to Length(arFIO)-2 do
                  begin
                    arFIO[j]:=arFio[j+1];
                  end;
                  SetLength(arFIO,Length(arFIO)-1);
                  Inc(iDel);
                  if Length(arFIO) = 0 then
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
  if sFIO.Text <> '' then
    begin
      odsPac.AfterScroll := nil;
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
      odsPac.deletevariables;
      if trim(sFIO.Text) <> '' then
        begin
          odsPac.Close;
          odsPac.declareandset('pfam',otstring,trim(sfam));
          odsPac.declareandset('pim',otstring,trim(sim));
          odsPac.declareandset('potch',otstring,trim(sotch));
          if rgreg_hide_last_fluoro = 1 then
           begin
            odsPac.SQL.Text := mshSQL.StringsByName['un_fluoro'].Text;
           end
          else
           begin
            odsPac.SQL.Text := mshSQL.StringsByName['default'].Text;
           end;
          odsPac.Open;
        end;
      CheckEnabledButtons;
      odsPac.AfterScroll := odsPacAfterScroll;
      DoShowTub;
    end;
end;

procedure TfrmSearch.aSysInfoExecute(Sender: TObject);
begin
  if (cxSplitter1.Visible = True) and (cxGrid2.Visible = True) and (odsNaz.FieldByName('fk_id').AsInteger <> 0) then
    begin
      Application.CreateForm(TfrmSysInfo, frmSysInfo);
      try
        frmSysInfo.DoShowForm(odsPac.FieldByName('pacid').AsInteger,
                              odsPac.FieldByName('fk_id').AsInteger,
                              odsNaz.FieldByName('fk_id').AsInteger); // NazID
        frmSysInfo.ShowModal;
      finally
        frmSysInfo.Free;
      end;
    end;
end;

procedure TfrmSearch.aTextExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    if TVPAC.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmSearch.aWebExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    if TVPAC.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmSearch.aXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TVPAC.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmSearch.aXMLExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    if TVPAC.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmSearch.odsPacAfterOpen(DataSet: TDataSet);
begin
  if odsPac.RecordCount = 0 then
    begin
      lbSex.Caption := '--';
      lbRojd.Caption := '--';
    end;
  aPrintSearch.Enabled := odsPac.RecordCount <> 0;
end;

procedure TfrmSearch.odsPacAfterScroll(DataSet: TDataSet);
begin
  lbRojd.Caption := DateTimeToStr(odsPac.FieldByName('FD_ROJD').AsDateTime);
  lbSex.Caption := odsPac.FieldByName('SEX').AsString;
  DoShowTub;
  CheckEnabledButtons;
  if odsPac.RecordCount > 0 then
    begin
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
  aPolis.Enabled := odsPac.FieldByName('is_ambulance').AsInteger = 1;
end;
{$IFDEF USE_NEW_AUTH}
function TfrmSearch.RestoreApplication(AAppCaption: string): Boolean;
var Wnd               : hWnd;
    buff              : array[0..127] of Char;
begin
  Result := False;
  Self.SetFocus;
  Application.ProcessMessages;
  Wnd := GetWindow(Handle, gw_HWndFirst);
  while Wnd <> 0 do
  begin
    if (Wnd <> Application.Handle) and (GetWindow(Wnd, gw_Owner) = 0) then
    begin
      GetWindowText(Wnd, buff, sizeof(buff));
      if StrPas(buff) = AAppCaption then
      begin
        Application.ProcessMessages;
        ShowWindow(wnd, SW_SHOWMINIMIZED);
        ShowWindow(wnd, SW_SHOWNORMAL);
        SetForegroundWindow(wnd);
        Application.ProcessMessages;
        Result := True;
        Exit;
      end; //if StrPas(buff) = cFIO
    end; //if (Wnd <> Application.Handle) and (GetWindow(Wnd, gw_Owner) = 0) then
    Wnd := GetWindow(Wnd, gw_hWndNext);
  end; //while Wnd <> 0
end;
{$ENDIF} 
procedure TfrmSearch.aNewExecute(Sender: TObject);
begin
  if frmMain.pOtdelID = get_radio_otdel then
    begin
      Application.CreateForm(TfrmRegistRad, frmRegistRad);
      frmRegistRad.DoShowForm(1,
				  	                  0, // pacid
					  	                0, // peplid
						                  sFIO.Text,
						                  frmMain.pOtdelID,
						                  0, // smidid
                              frmMain.odsKab.FieldByName('fk_id').AsInteger,
						                  0, // nazid
                              ''); // fc_name
      try
        frmRegistRad.ShowModal;
      finally
        frmRegistRad.Free;
      end;
    end else
    begin
      if frmMain.odsKab.FieldByName('is_flu').AsInteger = 1 then
        begin
          Application.CreateForm(TfrmRegistrAmbPacFlu, frmRegistrAmbPacFlu);
          frmRegistrAmbPacFlu.cxFam.Enabled := True;
          frmRegistrAmbPacFlu.cxName.Enabled := True;
          frmRegistrAmbPacFlu.cxOtch.Enabled := True;
          frmRegistrAmbPacFlu.cxNum.Enabled := True;
          frmRegistrAmbPacFlu.cxdeRojd.Enabled := True;
          frmRegistrAmbPacFlu.cxFemale.Enabled := True;
          frmRegistrAmbPacFlu.cxMale.Enabled := True;          
          if (frmmain.DB_NAME = 'X') and (frmMain.odsKab.FieldByName('FK_ID').AsInteger = rgreg_peredvig_apparat_fluoro) then
           frmRegistrAmbPacFlu.caption := 'Направление на передвежные аппараты';
          frmRegistrAmbPacFlu.DoShowfrmRegistrAmbPac(1, 0, 0, sFIO.Text, frmMain.pOTDELID, 0);
          frmRegistrAmbPacFlu.ShowModal;
          frmRegistrAmbPacFlu.Free;
        end else
        begin
          Application.CreateForm(TfrmRegistrAmbPac, frmRegistrAmbPac);
          frmRegistrAmbPac.cxFam.Enabled := True;
          frmRegistrAmbPac.cxName.Enabled := True;
          frmRegistrAmbPac.cxOtch.Enabled := True;
          frmRegistrAmbPac.cxNum.Enabled := True;
          frmRegistrAmbPac.cxdeRojd.Enabled := True;
          frmRegistrAmbPac.cxFemale.Enabled := True;
          frmRegistrAmbPac.cxMale.Enabled := True;
          if (frmmain.DB_NAME = 'X') and (frmMain.odsKab.FieldByName('FK_ID').AsInteger = rgreg_peredvig_apparat_fluoro) then
           frmRegistrAmbPac.caption := 'Направление на передвежные аппараты';
          frmRegistrAmbPac.DoShowfrmRegistrAmbPac(1, 0, 0, sFIO.Text, frmMain.pOTDELID, 0);
          frmRegistrAmbPac.ShowModal;
          frmRegistrAmbPac.Free;
        end;
    end;
end;

procedure TfrmSearch.aHistoryExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmAllHistory, frmAllHistory);
  try
    frmAllHistory.DoShowForm(odsPac.FieldByName('FK_ID').AsInteger, odsPac.FieldByName('FIO').AsString);
    frmAllHistory.ShowModal;
  finally
    frmAllHistory.Free;
  end;
end;

procedure TfrmSearch.DoShowfrmSearch;
var ods : TOracleDataSet;
begin
  actPass.Visible := frmMain.bIsAdmin = 1;
  actTub.Visible := frmMain.bIsAdmin = 1;
  aHistory.Enabled := False;
  aInfo.Enabled := False;
  aNaprav.Enabled := False;
  aOpenMK.Enabled := False;
  actLoadNaz.Enabled := False;
  actPass.Enabled := False;
  actTub.Enabled := False;
  aPrintSearch.Enabled := False;
  aRefresh.Enabled := False;
  cxSplitter1.CloseSplitter;
  cxSplitter1.Visible := False;
  aPolis.Enabled := False;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY'') AS DATESYS, SYSDATE FROM DUAL ';
    ods.Open;
    frmSearch.Caption := 'Поиск пациента. Сегодня: '+FormatDateTime('dddd', ods.FieldByName('SYSDATE').AsDateTime)+' '+ods.FieldByName('DATESYS').AsString;
  finally
    ods.Free;
  end;

  TVPAC.StoreToRegistry('\SoftWare\SoftMaster\RgRegistr\TVPACVrach_' + IntToStr(frmMain.pSOTRID)+'Default', TRUE, [], 'TVPAC');
  TVPAC.RestoreFromRegistry('\SoftWare\SoftMaster\RgRegistr\TVPACVrach_' + IntToStr(frmMain.pSOTRID), FALSE, FALSE, [], 'TVPAC');
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
      aOpenMK.Enabled := odsPac.RecordCount <> 0;
      aHistory.Enabled := odsPac.RecordCount <> 0;
      aInfo.Enabled := odsPac.RecordCount <> 0;
      aNaprav.Enabled := (odsPac.RecordCount <> 0) and (odsPac.FieldByName('FP_TEK_COC').AsInteger <> 3) and (odsPac.FieldByName('ARCHIVED').AsInteger = 0);;
      actLoadNaz.Enabled := odsPac.RecordCount <> 0;
      actPass.Enabled := odsPac.RecordCount <> 0;
      actTub.Enabled := odsPac.RecordCount <> 0;
      aRefresh.Enabled := odsPac.RecordCount <> 0;
      aPolis.Enabled := odsPac.RecordCount <> 0;
    end;
  if odsNaz.Active then
    begin
      actEditNaz.Enabled := (odsNaz.RecordCount <> 0) and ((odsNaz.FieldByName('FK_NAZSOSID').AsInteger = GET_NEVIP)
                                                           or (odsNaz.FieldByName('FK_NAZSOSID').AsInteger = GET_RECOMEND));
    end;
end;

procedure TfrmSearch.cxCheckMKPropertiesChange(Sender: TObject);
begin
  if odsPac.RecordCount > 0 then
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

procedure TfrmSearch.aNapravExecute(Sender: TObject);
begin
  if frmMain.pOtdelID = get_radio_otdel then
    begin
      Application.CreateForm(TfrmRegistRad, frmRegistRad);
      frmRegistRad.DoShowForm(odsPac.FieldByName('is_ambulance').AsInteger,
				  	                  odsPac.FieldByName('pacid').AsInteger,
					  	                odsPac.FieldByName('fk_id').AsInteger, // peplid
						                  '',
						                  frmMain.pOtdelID,
						                  0,
                              frmMain.odsKab.FieldByName('fk_id').AsInteger,
						                  0, // nazid
                              ''); // fc_name
      try
        frmRegistRad.ShowModal;
      finally
        frmRegistRad.Free;
      end;
    end else
    begin
      if frmMain.odsKab.FieldByName('is_flu').AsInteger = 1 then
        begin
          if (odsPac.FieldByName('age').AsInteger >= 18) and (odsPac.FieldByName('uslid').AsInteger = frmMain.get_doc_ambuldp) then
            begin
              MessageDlg('Внимание!'+#13+#10+
                         'Возраст пациента равен или больше 18 лет! '+#13+
                         'В этом случае вносить ФГ необходимо в амбулаторную карту взрослой поликлиники!', mtWarning, [mbOK], 0);
              exit;
            end;

          if (odsPac.FieldByName('uslid').AsInteger = frmMain.get_doc_ambul) or (odsPac.FieldByName('uslid').AsInteger = frmMain.get_doc_ambuldp) then
            begin
              Application.CreateForm(TfrmRegistrAmbPacFlu, frmRegistrAmbPacFlu);
              try
                frmRegistrAmbPacFlu.cxFam.Enabled := False;
                frmRegistrAmbPacFlu.cxName.Enabled := False;
                frmRegistrAmbPacFlu.cxOtch.Enabled := False;
                frmRegistrAmbPacFlu.cxNum.Enabled := False;
                frmRegistrAmbPacFlu.cxdeRojd.Enabled := False;
                frmRegistrAmbPacFlu.cxFemale.Enabled := False;
                frmRegistrAmbPacFlu.cxMale.Enabled := False;     
                if (frmmain.DB_NAME = 'X') and (frmMain.odsKab.FieldByName('FK_ID').AsInteger = rgreg_peredvig_apparat_fluoro) then
                 frmRegistrAmbPacFlu.caption := 'Направление на передвижные аппараты флюорографии';
                frmRegistrAmbPacFlu.DoShowfrmRegistrAmbPac(odsPac.FieldByName('IS_AMBULANCE').AsInteger,
					           	                                     odsPac.FieldByName('PACID').AsInteger,
						                                               odsPac.FieldByName('FK_ID').AsInteger,
						                                               '',
						                                               frmMain.pOTDELID,
						                                               0);
                frmRegistrAmbPacFlu.ShowModal;
              finally
                frmRegistrAmbPacFlu.Free;
              end;
            end else
            begin
              MessageDlg('Внимание!'+#13+#10+
                         'Вы можете добавить ФГ только в Взрослую или Детскую Амбулаторную карту пациента!'+#13+#10+
                         'Внимательно посмотрите карты пациента и выберите нужную!'+#13+#10+
                         'Если у пациента нет ни одной амбулаторной карты, заведите новую, '+#13+#10+
                         'воспользовавшись кнопкой "Новый"!', mtWarning, [mbOK], 0);
            end;
        end else
        begin
          Application.CreateForm(TfrmRegistrAmbPac, frmRegistrAmbPac);
          try
            frmRegistrAmbPac.cxFam.Enabled := False;
            frmRegistrAmbPac.cxName.Enabled := False;
            frmRegistrAmbPac.cxOtch.Enabled := False;
            frmRegistrAmbPac.cxNum.Enabled := False;
            frmRegistrAmbPac.cxdeRojd.Enabled := False;
            frmRegistrAmbPac.cxFemale.Enabled := False;
            frmRegistrAmbPac.cxMale.Enabled := False;
            if (frmmain.DB_NAME = 'X') and (frmMain.odsKab.FieldByName('FK_ID').AsInteger = rgreg_peredvig_apparat_fluoro) then
             frmRegistrAmbPac.caption := 'Направление на передвижные аппараты флюорографии';
            frmRegistrAmbPac.DoShowfrmRegistrAmbPac(odsPac.FieldByName('IS_AMBULANCE').AsInteger,
				  	                                        odsPac.FieldByName('PACID').AsInteger,
					                                          odsPac.FieldByName('FK_ID').AsInteger,
					                                          '',
					                                          frmMain.pOTDELID,
					                                          0);
            frmRegistrAmbPac.ShowModal;
          finally
            frmRegistrAmbPac.Free;
          end;
        end;
    end;
end;

procedure TfrmSearch.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  TVPAC.StoreToRegistry('\SoftWare\SoftMaster\RgRegistr\TVPACVrach_' + IntToStr(frmMain.pSOTRID), TRUE, [], 'TVPAC');
end;

procedure TfrmSearch.N2Click(Sender: TObject);
begin
  TVPAC.RestoreFromRegistry('\SoftWare\SoftMaster\RgRegistr\TVPACVrach_' + IntToStr(frmMain.pSOTRID)+'Default', FALSE, FALSE, [], 'TVPAC');
end;

procedure TfrmSearch.aOpenMKExecute(Sender: TObject);
var ods : TOracleDataSet;
    AppProcID : Integer;
begin
  ods := TOracleDataSet.Create(nil);
  try
  {$IFDEF USE_NEW_AUTH}
      ods.Session := frmMain.os;
      ods.Cursor := crSQLWait;
      ods.SQL.Text := ' SELECT ASU.PKG_REGIST_PEPLFUNC.GET_PEPL_FIO(:FK_PEPLID) FIOPAC FROM DUAL ';
      ods.DeclareAndSet('FK_PEPLID', otInteger, odsPac.FieldByName('FK_ID').AsInteger);
      ods.Open;
      if RestoreApplication(ods.FieldByName('FIOPAC').AsString) then Exit;
      SetLength(arFIO,Length(arFIO)+1);
      arFIO[Length(arFIO)-1]:=ods.FieldByName('FIOPAC').AsString;
      aOpenMK.Enabled:=False;
      Application.ProcessMessages;
      Screen.Cursor := crSQLWait;
      tmrCheckApplication.Enabled:=True;

      AppProcID := AppStart(ExtractFilePath(paramstr(0))+'IBRazdel.exe', IntToStr(odsPac.FieldByName('PACID').AsInteger)+' '+IntToStr(-1)+' '+IntToStr(-1));
      if AppProcID = -1 then ShowMessage('Ошибка запуска приложения');
  {$ELSE}
      AppProcID := 0;
      if ShellExecute(Application.Handle,
                      pChar('open'),
                      PChar(ExtractFilePath(paramstr(0)) + 'IBRazdel.exe'),
                      PChar(IntToStr(frmMain.pAPPSOTRID) + ' ' +
                      IntToStr(odsPac.FieldByName('PACID').AsInteger) + ' ' +
                      IntToStr(-1) + ' ' +
                      IntToStr(-1)), PChar(ExtractFilePath(paramstr(0))), SW_SHOWNORMAL) < 32 then
      Application.MessageBox('Запуск внешнего модуля не удался.', 'Ошибка', MB_OK + MB_ICONERROR);
  {$ENDIF}
    ShowWait(odsPac.FieldByName('PACID').AsInteger,True);
  finally
    ods.Free;
  end;
end;

procedure TfrmSearch.aPolisExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmSetPolis, frmSetPolis);
  try
    frmSetPolis.DoShowForm(odsPac.FieldByName('fk_id').AsInteger); // peplid
    frmSetPolis.ShowModal;
    if frmSetPolis.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' merge into asu.tpac_insurance using dual on (fk_pacid = :pfk_pacid) '+#13+
                         '   when matched then update set fk_insurdocid = :pfk_insurdocid where fk_pacid = :pfk_pacid '+#13+
                         '   when not matched then insert(fk_insurdocid, fk_pacid) values(:pfk_insurdocid, :pfk_pacid) ';
          oq.DeclareAndSet('pfk_insurdocid', otInteger, frmSetPolis.odsList.FieldByName('fk_id').AsInteger);
          oq.DeclareAndSet('pfk_pacid', otInteger, odsPac.FieldByName('pacid').AsInteger);
          oq.Execute;
          frmMain.os.Commit;
        finally
          oq.Free;
        end;
      end;
  finally
    frmSetPolis.Free;
  end;
end;

procedure TfrmSearch.aPrintSearchExecute(Sender: TObject);
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

procedure TfrmSearch.aRefreshExecute(Sender: TObject);
begin
  odsPac.AfterScroll := nil;
  RefreshQuery(odsPac);
  odsPac.AfterScroll := odsPacAfterScroll;
  odsPacAfterScroll(nil);
end;

procedure TfrmSearch.actClosenazExecute(Sender: TObject);
begin
  cxSplitter1.CloseSplitter;
  cxSplitter1.Visible := False;
  TVISSL.StoreToRegistry('\SoftWare\SoftMaster\RgRegistr\TVISSLSEARCH'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID), TRUE, [], 'TVISSLSEARCH');
end;

procedure TfrmSearch.actEditNazExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmEditNaz, frmEditNaz);
  frmEditNaz.pDateNaz := odsNaz.FieldByName('fd_naz').AsDateTime;
  frmEditNaz.DoShowEditNaz(odsNaz.FieldByName('FK_PACID').AsInteger,
                           frmMain.pSOTRID,
                           -1,
                           '',
                           Trunc(odsNaz.FieldByName('RUN_DATE').AsDateTime),
                           odsNaz.FieldByName('FK_ROOMID').AsInteger);
  frmEditNaz.ShowModal;
  if frmEditNaz.ModalResult = MrOK then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' UPDATE ASU.TNAZIS SET FD_RUN = :PFD_RUN, FK_ROOMID = :PFK_ROOMID, fl_in_raspis = 1 WHERE FK_ID = :PFK_ID ';
        oq.DeclareAndSet('PFD_RUN', otDate, StrToDateTime(DateToStr(frmEditNaz.cxdeDate.Date)+' '+FormatDateTime('hh:nn:ss', frmEditNaz.cxteTime.Time)));
        oq.DeclareAndSet('PFK_ROOMID', otInteger, frmEditNaz.cxlcKabinet.EditValue);
        oq.DeclareAndSet('PFK_ID', otInteger, odsNaz.FieldByName('FK_ID').AsInteger);
        oq.Execute;
        frmMain.os.Commit;
      finally
        oq.Free;
      end;
    end;
  frmEditNaz.Free;
  RefreshQuery(odsNaz);
end;

procedure TfrmSearch.actLoadNazExecute(Sender: TObject);
begin
  if cxSplitter1.Visible <> True then
    begin
      cxSplitter1.Visible := True;
      cxSplitter1.OpenSplitter;
      TVISSL.StoreToRegistry('\SoftWare\SoftMaster\RgRegistr\TVISSLSEARCH'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID)+'Default', TRUE, [], 'TVISSLSEARCH');
      TVISSL.RestoreFromRegistry('\SoftWare\SoftMaster\RgRegistr\TVISSLSEARCH'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID), FALSE, FALSE, [], 'TVISSLSEARCH');
    end;
  odsNaz.Close;
  odsNaz.Open;
  //CheckEnabledButtons;
  if frmMain.get_def_thismk = '-1' then
    begin
      cxCheckMK.EditValue := 1;
      cxCheckMKPropertiesChange(nil);
    end;
end;

procedure TfrmSearch.actPassExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmFluoro, frmFluoro);
  try
    frmFluoro.DoShowForm(odsPac.FieldByName('FIO').AsString,
                         odsPac.FieldByName('PACID').AsInteger,
                         odsPac.FieldByName('FK_ID').AsInteger); //peplid
    frmFluoro.ShowModal;
    if frmFluoro.isEdit = True then
      begin
        odsPac.AfterScroll := nil;
        RefreshQuery(odsPac);
        odsPac.AfterScroll := odsPacAfterScroll;
        sFIO.SetFocus;
      end;
  finally
    frmFluoro.Free;
  end;
end;

procedure TfrmSearch.odsNazBeforeOpen(DataSet: TDataSet);
begin
	odsNaz.SetVariable('pfk_pacid', odsPac.FieldByName('fk_id').AsInteger);
  odsNaz.SetVariable('psotrid', frmMain.pSotrID);
end;

procedure TfrmSearch.actRefreshNazExecute(Sender: TObject);
begin
  RefreshQuery(odsNaz);
end;

procedure TfrmSearch.actTubExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmTub, frmTub);
  try
    frmTub.DoShowFormTub(odsPac.FieldByName('FK_ID').AsInteger, odsPac.FieldByName('FIO').AsString);
    frmTub.ShowModal;
    DoShowTub;
  finally
    frmTub.Free;
  end;
end;

procedure TfrmSearch.TVPACFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  if cxSplitter1.Visible then
    begin
      odsNaz.Close;
      odsNaz.Open;
    end;
end;

procedure TfrmSearch.TVISSLCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var ods : TOracleDataSet;
begin
if odsNaz.RecordCount <> 0 then
  begin
  if (odsNaz.FieldByName('FK_NAZSOSID').AsInteger = GET_NAZCANCEL) or (odsNaz.FieldByName('FK_NAZSOSID').AsInteger = GET_NEYAV) then
    begin
      Application.CreateForm(TfrmOtmena, frmOtmena);
      frmOtmena.acOk.Visible := FALSE;
      frmOtmena.GroupBox1.Visible := FALSE;
      frmOtmena.cxOtmena.Align := alClient;
      frmOtmena.acCancel.Caption := 'Закрыть';
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT FC_RES, '+#13+
                        '        NVL(TO_CHAR(FD_INS, ''DD.MM.YYYY HH24:MI''), 0) FD_INS, '+#13+
                        '        FK_VRACHID, ASU.DO_VRACHFIO(FK_VRACHID) AS SOTRFIO '+#13+
                        '   FROM asu.VRES '+#13+
                        '  WHERE FK_NAZID = :pFK_NAZID AND FK_SOS = :PFK_SOS ';
        ods.DeclareAndSet('pFK_NAZID', otInteger, odsNaz.FieldByName('FK_ID').AsInteger);
        ods.DeclareAndSet('PFK_SOS', otInteger, odsNaz.FieldByName('FK_NAZSOSID').AsInteger);
        ods.Open;
        if ods.RecordCount > 0 then
          begin
            frmOtmena.cxOtmena.Text := 'Сотрудник:'+' '+ods.FieldByName('SOTRFIO').AsString+','+' '+
                                       'Дата:'+' '+DateTimeToStr(ods.FieldByName('FD_INS').AsDateTime)+#13#10+
                                       'Обоснование отмены:'+' '+ods.FieldByName('FC_RES').AsString;
          end else
          begin
            frmOtmena.cxOtmena.Text := 'Нет данных';
          end;
      finally
        ods.Free;
      end;
      frmOtmena.ShowModal;
      frmOtmena.Free;
    end else
    begin
      if odsNaz.FieldByName('OWNER').AsInteger = frmMain.GET_ISSL_FLU then
        begin
          Application.CreateForm(TfrmRegistrAmbPacFlu, frmRegistrAmbPacFlu);
          try
            frmRegistrAmbPacFlu.cxFam.Enabled := False;
            frmRegistrAmbPacFlu.cxName.Enabled := False;
            frmRegistrAmbPacFlu.cxOtch.Enabled := False;
            frmRegistrAmbPacFlu.cxNum.Enabled := False;
            frmRegistrAmbPacFlu.cxdeRojd.Enabled := False;
            frmRegistrAmbPacFlu.cxFemale.Enabled := False;
            frmRegistrAmbPacFlu.cxMale.Enabled := False;
            frmRegistrAmbPacFlu.DoShowfrmRegistrAmbPac(odsNaz.FieldByName('IS_AMBULANCE').AsInteger,
                                                       odsNaz.FieldByName('FK_PACID').AsInteger,
                                                       odsPac.FieldByName('FK_ID').AsInteger,
                                                       '',
                                                       frmMain.pOTDELID,
                                                       odsNaz.FieldByName('FK_SMID').AsInteger,
                                                       odsNaz.FieldByName('FK_ID').AsInteger);
            frmRegistrAmbPacFlu.ShowModal;
            RefreshQuery(odsNaz);
          finally
            frmRegistrAmbPacFlu.Free;
          end;
        end else
        begin
          Application.CreateForm(TfrmRegistrAmbPac, frmRegistrAmbPac);
          try
            frmRegistrAmbPac.cxFam.Enabled := False;
            frmRegistrAmbPac.cxName.Enabled := False;
            frmRegistrAmbPac.cxOtch.Enabled := False;
            frmRegistrAmbPac.cxNum.Enabled := False;
            frmRegistrAmbPac.cxdeRojd.Enabled := False;
            frmRegistrAmbPac.cxFemale.Enabled := False;
            frmRegistrAmbPac.cxMale.Enabled := False;
            frmRegistrAmbPac.DoShowfrmRegistrAmbPac(odsNaz.FieldByName('IS_AMBULANCE').AsInteger,
                                                    odsNaz.FieldByName('FK_PACID').AsInteger,
                                                    odsPac.FieldByName('FK_ID').AsInteger,
                                                    '',
                                                    frmMain.pOTDELID,
                                                    0,
                                                    odsNaz.FieldByName('FK_ID').AsInteger,
                                                    odsNaz.FieldByName('NUMBERISSL').AsString);
            frmRegistrAmbPac.ShowModal;
            RefreshQuery(odsNaz);
          finally
            frmRegistrAmbPac.Free;
          end;
        end;
    end;
  end;
end;

procedure TfrmSearch.TVISSLCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
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

end.
