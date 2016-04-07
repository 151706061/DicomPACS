unit fSearchLab;

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
  cxCheckBox, cxBarEditItem, frxClass, frxDBSet, cxLookAndFeelPainters,
  cxButtons, cxImageComboBox, cxGridExportLink, cxCalendar, SMMainAPI, JvStringHolder;

type
  TfrmSearchLab = class(TForm)
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
    bbLoadnaz: TdxBarButton;
    actLoadNaz: TAction;
    actEditNaz: TAction;
    actRefreshNaz: TAction;
    actCloseNaz: TAction;
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
    bbEditNaz: TdxBarButton;
    bbRefreshNaz: TdxBarButton;
    bbCloseNaz: TdxBarButton;
    VDATENAZ: TcxGridDBColumn;
    VSOSID: TcxGridDBColumn;
    cxCheckMK: TcxBarEditItem;
    bbPass: TdxBarButton;
    actPass: TAction;
    aClearSearch: TAction;
    aPrintSearch: TAction;
    frxRepSearch: TfrxReport;
    frxDBSearch: TfrxDBDataset;
    N1: TMenuItem;
    bEnter: TcxButton;
    bClear: TcxButton;
    bClose: TcxButton;
    cxLabel2: TcxLabel;
    lbSex: TcxLabel;
    cxLabel3: TcxLabel;
    lbRojd: TcxLabel;
    VPACCNTTUB: TcxGridDBColumn;
    odsTubDates: TOracleDataSet;
    ilCntTub: TImageList;
    pnlTub: TPanel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    lbBegin: TcxLabel;
    lbEnd: TcxLabel;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aXLS: TAction;
    sdPopUp: TSaveDialog;
    N3: TMenuItem;
    N4: TMenuItem;
    Web1: TMenuItem;
    XML1: TMenuItem;
    Excel1: TMenuItem;
    tmrCheckApplication: TTimer;
    aSysInfo: TAction;
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
    procedure odsPacAfterOpen(DataSet: TDataSet);
    procedure actLoadNazExecute(Sender: TObject);
    procedure actEditNazExecute(Sender: TObject);
    procedure actRefreshNazExecute(Sender: TObject);
    procedure actCloseNazExecute(Sender: TObject);
    procedure odsNazBeforeOpen(DataSet: TDataSet);
    procedure TVPACFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure TVISSLCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure odsNazAfterOpen(DataSet: TDataSet);
    procedure odsNazAfterScroll(DataSet: TDataSet);
    procedure cxCheckMKPropertiesChange(Sender: TObject);
    procedure actPassExecute(Sender: TObject);
    procedure aClearSearchExecute(Sender: TObject);
    procedure TVISSLCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure aPrintSearchExecute(Sender: TObject);
    procedure frxRepSearchGetValue(const VarName: string; var Value: Variant);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure tmrCheckApplicationTimer(Sender: TObject);
    procedure aSysInfoExecute(Sender: TObject);
  private
    Russian : HKL;
    arFIO:array of string;
    sDateSys_4Rep : String;
    procedure DoShowTub;
    {$IFDEF USE_NEW_AUTH}
//      function WinExecAndWait32(FileName: string; Visibility: integer): integer;
      function RestoreApplication(AAppCaption:string):Boolean;
    {$ENDIF}
    procedure CheckEnabledButtons;
    { Private declarations }
  public
    procedure DoShowfrmSearch;
    function Get_Pac_NUMIB(pFK_PacID: Integer): String;
    { Public declarations }
  end;

var
  frmSearchLab: TfrmSearchLab;

implementation

uses fPacInfo, fLabNaprav, fMain, fLabNapravFlu, fWait, fEditNaz, fOtmena,
     fPass, fAllHistory, fSysInfo, fNaprRad;

{$R *.dfm}

procedure TfrmSearchLab.aClearSearchExecute(Sender: TObject);
begin
  sFIO.Clear;
  sFIO.SetFocus;
end;

procedure TfrmSearchLab.aCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmSearchLab.FormCreate(Sender: TObject);
begin
  russian:=LoadKeyboardLayout('00000419', 0);
end;

procedure TfrmSearchLab.frxRepSearchGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'USLOVIE' then Value := sFIO.TExt;
  if VarName = 'SOTRNAME' then Value := frmMain.sSotrFIO;
  if VarName = 'DATESYS' then Value := sDateSys_4Rep;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;  
end;

function TfrmSearchLab.Get_Pac_NUMIB(pFK_PacID: Integer): String;
var
  ODS: TOracleDataSet;
begin
  Result := '';
  ods := TOracleDataSet.Create(nil);

  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT asu.pkg_regist_pacfunc.GET_PAC_IB(:PACID) NUM_IB FROM DUAL';
    ods.DeclareAndSet(':PACID', otInteger, pFK_PACID);
    ods.Open;
    Result := ods.FieldByName('NUM_IB').AsString;
  finally
    ods.Free;
  end;
end;

procedure TfrmSearchLab.sFIOClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmSearchLab.sFIOEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmSearchLab.tmrCheckApplicationTimer(Sender: TObject);
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
          if StrPas(buff) = arFIO[i-iDel] then
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

procedure TfrmSearchLab.aSearchExecute(Sender: TObject);
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
          odsPac.declareandset('pfam',otstring,sfam);
          odsPac.declareandset('pim',otstring,sim);
          odsPac.declareandset('potch',otstring,sotch);
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

procedure TfrmSearchLab.aSysInfoExecute(Sender: TObject);
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

procedure TfrmSearchLab.aTextExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    if TVPAC.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmSearchLab.aWebExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    if TVPAC.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmSearchLab.aXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TVPAC.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmSearchLab.aXMLExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    if TVPAC.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmSearchLab.odsPacAfterScroll(DataSet: TDataSet);
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
end;
{$IFDEF USE_NEW_AUTH}
function TfrmSearchLab.RestoreApplication(AAppCaption: string): Boolean;
var
  Wnd               : hWnd;
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
procedure TfrmSearchLab.aNewExecute(Sender: TObject);
begin
  if frmMain.pOtdelID = get_radio_otdel then
    begin
      Application.CreateForm(TfrmNaprRad, frmNaprRad);
      frmNaprRad.DoShowForm(1,
				  	                0, // pacid
					  	              0, // peplid
						                sFIO.Text,
						                frmMain.pOtdelID,
						                0, // smidid
                            frmMain.odsKab.FieldByName('fk_id').AsInteger,
						                0, // nazid
                            ''); // fc_name
      try
        frmNaprRad.ShowModal;
      finally
        frmNaprRad.Free;
      end;
    end else
    begin
      if frmMain.odsKab.FieldByName('is_flu').AsInteger = 1 then
        begin
          Application.CreateForm(TfrmLabNapravFlu, frmLabNapravFlu);
          frmLabNapravFlu.cxFam.Enabled := True;
          frmLabNapravFlu.cxName.Enabled := True;
          frmLabNapravFlu.cxOtch.Enabled := True;
          frmLabNapravFlu.cxNum.Enabled := True;
          frmLabNapravFlu.cxdeRojd.Enabled := True;
          frmLabNapravFlu.cxMale.Enabled := True;
          frmLabNapravFlu.cxFemale.Enabled := True;
          frmLabNapravFlu.DoShowForm(1, 0, 0, sFIO.Text, frmMain.pOTDELID, 0);
          frmLabNapravFlu.ShowModal;
          frmLabNapravFlu.Free;
        end else
        begin
          Application.CreateForm(TfrmLabNaprav, frmLabNaprav);
          frmLabNaprav.cxFam.Enabled := True;
          frmLabNaprav.cxName.Enabled := True;
          frmLabNaprav.cxOtch.Enabled := True;
          frmLabNaprav.cxNum.Enabled := True;
          frmLabNaprav.cxdeRojd.Enabled := True;
          frmLabNaprav.cxMale.Enabled := True;
          frmLabNaprav.cxFemale.Enabled := True;
          frmLabNaprav.DoShowForm(1, 0, 0, sFIO.Text, frmMain.pOTDELID, 0);
          frmLabNaprav.ShowModal;
          frmLabNaprav.Free;
        end;
    end;
end;

procedure TfrmSearchLab.aHistoryExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmAllHistory, frmAllHistory);
  try
    frmAllHistory.DoShowForm(odsPac.FieldByName('FK_ID').AsInteger, odsPac.FieldByName('FIO').AsString);
    frmAllHistory.ShowModal;
  finally
    frmAllHistory.Free;
  end;
end;

procedure TfrmSearchLab.DoShowfrmSearch;
begin
  aHistory.Enabled := FALSE;
  aInfo.Enabled := FALSE;
  aNaprav.Enabled := FALSE;
  aOpenMK.Enabled := FALSE;
  actLoadNaz.Enabled := FALSE;
  actPass.Enabled := FALSE;
  aPrintSearch.Enabled := False;
	cxSplitter1.CloseSplitter;
  cxSplitter1.Visible := FALSE;
  TVPAC.StoreToRegistry('\SoftWare\SoftMaster\List_xrays_lab\TVPAC'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID)+'Default', TRUE, [], 'TVPAC');
  TVPAC.RestoreFromRegistry('\SoftWare\SoftMaster\List_xrays_lab\TVPAC'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID), FALSE, FALSE, [], 'TVPAC');
end;

procedure TfrmSearchLab.DoShowTub;
begin
  if odsPac.FieldByName('CNTTUB_ALL').AsInteger <> 0 then
    begin
      pnlTub.Visible := True;
      odsTubDates.Close;
      odsTubDates.SetVariable('PFK_PEPLID', odsPac.FieldByName('FK_ID').AsInteger);
      odsTubDates.Open;
      odsTubDates.Last;
      lbBegin.Caption := odsTubDates.FieldByName('FD_NAZSTR').AsString;  // !!! эти же даты можно выбрать в основном запросе поиска ???
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

procedure TfrmSearchLab.CheckEnabledButtons;
begin
  if odsPac.Active then
    begin
      aOpenMK.Enabled := odsPac.RecordCount <> 0;
      aHistory.Enabled := odsPac.RecordCount <> 0;
      aInfo.Enabled := odsPac.RecordCount <> 0;
      aNaprav.Enabled := (odsPac.RecordCount <> 0) and (odsPac.FieldByName('FP_TEK_COC').AsInteger <> 3) and (odsPac.FieldByName('ARCHIVED').AsInteger = 0);
      actLoadNaz.Enabled := odsPac.RecordCount <> 0;
      actPass.Enabled := odsPac.RecordCount <> 0;
    end;
  if odsNaz.Active then
    begin
      actEditNaz.Enabled := (odsNaz.RecordCount <> 0) and ((odsNaz.FieldByName('FK_NAZSOSID').AsInteger = GET_NEVIP)
                                                           or (odsNaz.FieldByName('FK_NAZSOSID').AsInteger = GET_RECOMEND));
    end;
end;

procedure TfrmSearchLab.cxCheckMKPropertiesChange(Sender: TObject);
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

procedure TfrmSearchLab.aInfoExecute(Sender: TObject);
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

procedure TfrmSearchLab.aNapravExecute(Sender: TObject);
begin
  if frmMain.pOtdelID = get_radio_otdel then
    begin
      Application.CreateForm(TfrmNaprRad, frmNaprRad);
      frmNaprRad.DoShowForm(odsPac.FieldByName('is_ambulance').AsInteger,
				  	                  odsPac.FieldByName('pacid').AsInteger,
					  	                odsPac.FieldByName('fk_id').AsInteger, // peplid
						                  '',
						                  frmMain.pOtdelID,
						                  0,
                              frmMain.odsKab.FieldByName('fk_id').AsInteger,
						                  0, // nazid
                              ''); // fc_name
      try
        frmNaprRad.ShowModal;
      finally
        frmNaprRad.Free;
      end;
    end else
    begin
      if frmMain.odsKab.FieldByName('is_flu').AsInteger = 1 then
        begin
//          if odsPac.FieldByName('uslid').AsInteger = frmMain.get_doc_ambul then
          if True then
            begin
              Application.CreateForm(TfrmLabNapravFlu, frmLabNapravFlu);
              try
                frmLabNapravFlu.cxFam.Enabled := False;
                frmLabNapravFlu.cxName.Enabled := False;
                frmLabNapravFlu.cxOtch.Enabled := False;
                frmLabNapravFlu.cxNum.Enabled := False;
                frmLabNapravFlu.cxdeRojd.Enabled := False;
                frmLabNapravFlu.cxMale.Enabled := False;
                frmLabNapravFlu.cxFemale.Enabled := False;
                frmLabNapravFlu.DoShowForm(odsPac.FieldByName('IS_AMBULANCE').AsInteger,
                                           odsPac.FieldByName('PACID').AsInteger,
                                           odsPac.FieldByName('FK_ID').AsInteger,
                                           '',
                                           frmMain.pOTDELID,
                                           0);
                frmLabNapravFlu.ShowModal;
              finally
                frmLabNapravFlu.Free;
              end;
            end else
            begin
              MessageDlg('Внимание!'+#13+#10+
                         'Вы можете добавить ФГ только в Взрослую Амбулаторную карту пациента!'+#13+#10+
                         'Внимательно посмотрите карты пациента и выберите нужную!'+#13+#10+
                         'Если у пациента нет ни одной взрослой амбулаторной карты, заведите новую, '+#13+#10+
                         'воспользовавшись кнопкой "Новый"!', mtWarning, [mbOK], 0);
            end;
        end else
        begin
          Application.CreateForm(TfrmLabNaprav, frmLabNaprav);
          try
            frmLabNaprav.cxFam.Enabled := False;
            frmLabNaprav.cxName.Enabled := False;
            frmLabNaprav.cxOtch.Enabled := False;
            frmLabNaprav.cxNum.Enabled := False;
            frmLabNaprav.cxdeRojd.Enabled := False;
            frmLabNaprav.cxMale.Enabled := False;
            frmLabNaprav.cxFemale.Enabled := False;
            frmLabNaprav.DoShowForm(odsPac.FieldByName('IS_AMBULANCE').AsInteger,
                                    odsPac.FieldByName('PACID').AsInteger, odsPac.FieldByName('FK_ID').AsInteger, '', frmMain.pOTDELID, 0);
            frmLabNaprav.ShowModal;
          finally
            frmLabNaprav.Free;
          end;
        end;
    end;
    RefreshQuery(odsNaz);
end;

procedure TfrmSearchLab.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  TVPAC.StoreToRegistry('\SoftWare\SoftMaster\List_xrays_lab\TVPAC'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID), TRUE, [], 'TVPAC');
end;

procedure TfrmSearchLab.N2Click(Sender: TObject);
begin
  TVPAC.RestoreFromRegistry('\SoftWare\SoftMaster\List_xrays_lab\TVPAC'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID)+'Default', FALSE, FALSE, [], 'TVPAC');
end;

procedure TfrmSearchLab.aOpenMKExecute(Sender: TObject);
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

    if RestoreApplication(ods.FieldByName('FIOPAC').AsString  + ' - ' + Get_Pac_NUMIB(odsPac.FieldByName('PACID').AsInteger))
    then Exit;

    SetLength(arFIO,Length(arFIO)+1);
    arFIO[Length(arFIO)-1]:=ods.FieldByName('FIOPAC').AsString;
    aOpenMK.Enabled:=False;
    Application.ProcessMessages;
    Screen.Cursor := crSQLWait;
    tmrCheckApplication.Enabled:=True;
    
    Application.ProcessMessages;
    sleep(100);

//    GetInputMapAppFromApp(WinExecAndWait32(PChar('IBRazdel.exe '+IntToStr(frmMain.pAPPSOTRID)+' '+IntToStr(odsPac.FieldByName('PACID').AsInteger)+' '+IntToStr(-1)+' '+IntToStr(-1)), 1));
    AppProcID := AppStart(ExtractFilePath(paramstr(0))+'IBRazdel.exe', IntToStr(odsPac.FieldByName('PACID').AsInteger)+' '+IntToStr(-1)+' '+IntToStr(-1));
    if AppProcID = -1 then ShowMessage('Ошибка запуска приложения');
  {$ELSE}
    if ShellExecute(Application.Handle,
                    pChar('open'),
                    PChar(ExtractFilePath(paramstr(0)) + 'IBRazdel.exe'),
                    PChar(IntToStr(frmMain.pAPPSOTRID) + ' ' +
                    IntToStr(odsPac.FieldByName('PACID').AsInteger) + ' ' +
                    IntToStr(-1) + ' ' +
                    IntToStr(-1)), PChar(ExtractFilePath(paramstr(0))), SW_SHOWNORMAL) < 32 then
      Application.MessageBox('Запуск внешнего модуля не удался.', 'Ошибка', MB_OK + MB_ICONERROR);
    ShowWait(odsPac.FieldByName('PACID').AsInteger,True);
  {$ENDIF}
  finally
    ods.Free;
  end;
end;

procedure TfrmSearchLab.aPrintSearchExecute(Sender: TObject);
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

procedure TfrmSearchLab.odsPacAfterOpen(DataSet: TDataSet);
begin
  if odsPac.RecordCount = 0 then
    begin
      lbSex.Caption := '--';
      lbRojd.Caption := '--';
    end;
    aPrintSearch.Enabled := odsPac.RecordCount <> 0;   
end;

procedure TfrmSearchLab.actLoadNazExecute(Sender: TObject);
begin
  if cxSplitter1.Visible <> True then
    begin
      cxSplitter1.Visible := True;
      cxSplitter1.OpenSplitter;
      TVISSL.RestoreFromRegistry('\SoftWare\SoftMaster\List_xrays_lab\TVISSLSEARCH'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID), FALSE, FALSE, [], 'TVISSLSEARCH');
    end;
  odsNaz.Close;
  odsNaz.Open;
  if frmMain.get_def_thismk = '-1' then
    begin
      cxCheckMK.EditValue := 1;
      cxCheckMKPropertiesChange(nil);
    end;
end;

procedure TfrmSearchLab.actPassExecute(Sender: TObject);
var oq : TOracleQuery;
begin
	Application.CreateForm(TfrmPass, frmPass);
	frmPass.ShowModal;
	if frmPass.ModalResult = MrOk then
		begin
			oq := TOracleQuery.Create(nil);
			try
				if frmPass.rbFlu.Checked then
					begin
						oq.Session := frmMain.os;
						oq.Cursor := crSQLWait;
						oq.SQL.Text := ' INSERT INTO TNAZIS(FK_SMID, FC_REMARK, FD_NAZ, FD_RUN, FK_ROOMID, FK_ISPOLID, FK_VRACHID, FK_NAZSOSID, FK_PACID, FC_NAME, FK_NAZTYPEID, FK_NAZOWNER, FC_TYPE) '+
													 ' VALUES(asu.GET_FLU_ONE_PROJECTION, ''Зачтённое назначение'', SYSDATE, :PFD_RUN, 0, :PFK_ISPOLID, :PFK_VRACHID, GET_PASS_REGISTRATOR, :PFK_PACID, GET_SMIDNAME(GET_FLU_ONE_PROJECTION), GET_NAZPLAN, 0, -1) ';
						oq.DeclareAndSet('PFD_RUN', otDate, frmPass.cxDateFlu.Date);
						oq.DeclareAndSet('PFK_ISPOLID', otInteger, frmMain.pSOTRID);
						oq.DeclareAndSet('PFK_VRACHID', otInteger, frmMain.pSOTRID);
						oq.DeclareAndSet('PFK_PACID', otInteger, odsPac.FieldByName('PACID').AsInteger);
						oq.Execute;
						frmMain.os.Commit;
						RefreshQuery(odsPac);
					end;
				if frmPass.rbRg.Checked then
					begin
						oq.Session := frmMain.os;
						oq.Cursor := crSQLWait;
						oq.SQL.Text := ' INSERT INTO TNAZIS(FK_SMID, FC_REMARK, FD_NAZ, FD_RUN, FK_ROOMID, FK_ISPOLID, FK_VRACHID, FK_NAZSOSID, FK_PACID, FC_NAME, FK_NAZTYPEID, FK_NAZOWNER, FC_TYPE) '+
													 ' VALUES(GET_OGPRG_ONE_PROJECTION, ''Зачтённое назначение'', SYSDATE, :PFD_RUN, 0, :PFK_ISPOLID, :PFK_VRACHID, GET_PASS_REGISTRATOR, :PFK_PACID, GET_SMIDNAME(GET_OGPRG_ONE_PROJECTION), GET_NAZPLAN, 0, -1) ';
						oq.DeclareAndSet('PFD_RUN', otDate, frmPass.cxDateRg.Date);
						oq.DeclareAndSet('PFK_ISPOLID', otInteger, frmMain.pSOTRID);
						oq.DeclareAndSet('PFK_VRACHID', otInteger, frmMain.pSOTRID);
						oq.DeclareAndSet('PFK_PACID', otInteger, odsPac.FieldByName('PACID').AsInteger);
						oq.Execute;
						frmMain.os.Commit;
						RefreshQuery(odsPac);
          end;
				finally
					oq.Free;
				end;
		end;
	frmPass.Free;
end;

procedure TfrmSearchLab.actEditNazExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmEditNaz, frmEditNaz);
  frmEditNaz.pDateNaz := odsNaz.FieldByName('fd_naz').AsDateTime;
  frmEditNaz.DoShowEditNaz(odsNaz.FieldByName('fk_pacid').AsInteger,
                           frmMain.pSOTRID,
                           -1,
                           '',
                           Trunc(odsNaz.FieldByName('RUN_DATE').AsDateTime),
                           odsNaz.FieldByName('FK_ROOMID').AsInteger,
                           odsNaz.FieldByName('FK_SMID').AsInteger,
                           odsNaz.FieldByName('FK_ID').AsInteger);
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

procedure TfrmSearchLab.actRefreshNazExecute(Sender: TObject);
begin
  RefreshQuery(odsNaz);
end;

procedure TfrmSearchLab.actCloseNazExecute(Sender: TObject);
begin
  cxSplitter1.CloseSplitter;
  cxSplitter1.Visible := False;
  TVISSL.StoreToRegistry('\SoftWare\SoftMaster\List_xrays_lab\TVISSLSEARCH'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID), TRUE, [], 'TVISSLSEARCH');
end;

procedure TfrmSearchLab.odsNazBeforeOpen(DataSet: TDataSet);
begin
  odsNaz.SetVariable('PFK_PACID', odsPac.FieldByName('fk_id').AsInteger);
  odsNaz.SetVariable('psotrid', frmMain.pSotrID);
 { if frmmain.USE_METODICS_IN_NAZN=1 then
    odsNaz.SetVariable('p_usl_metodic', 'and asu.check_nazn(TNAZIS.FK_ID,1)=1')
  else
    odsNaz.SetVariable('p_usl_metodic', '');  }
end;

procedure TfrmSearchLab.TVPACFocusedRecordChanged(
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

procedure TfrmSearchLab.TVISSLCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var ods : TOracleDataSet;
begin
// -- статусы Отмена или Неявка
  if (odsNaz.FieldByName('fk_nazsosid').AsInteger = GET_NAZCANCEL) or (odsNaz.FieldByName('FK_NAZSOSID').AsInteger = GET_NEYAV) then
    begin
      Application.CreateForm(TfrmOtmena, frmOtmena);
      frmOtmena.acOk.Visible := FALSE;
      frmOtmena.GroupBox1.Visible := FALSE;
      frmOtmena.cxOtmena.Align := alClient;
      frmOtmena.acCancel.Caption := 'Закрыть';
      frmOtmena.acCancel.ImageIndex := 2;
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
// -- для Радионуклидки
      if (odsNaz.FieldByName('owner').AsInteger = get_rad_gamma) or (odsNaz.FieldByName('owner').AsInteger = get_rad_petct) then
        begin
          Application.CreateForm(TfrmNaprRad, frmNaprRad);
          frmNaprRad.DoShowForm(odsNaz.FieldByName('is_ambulance').AsInteger,
				       	                odsNaz.FieldByName('fk_pacid').AsInteger,
					  	                  odsPac.FieldByName('fk_id').AsInteger,
						                    '',
						                    frmMain.pOtdelID,
						                    odsNaz.FieldByName('fk_smid').AsInteger,
                                frmMain.odsKab.FieldByName('fk_id').AsInteger,
						                    odsNaz.FieldByName('fk_id').AsInteger,
                                odsNaz.FieldByName('nameissl').AsString,
                                odsNaz.FieldByName('is_reanim').AsInteger,
                                odsNaz.FieldByName('owner').AsInteger);
          try
            frmNaprRad.ShowModal;
            if frmNaprRad.ModalResult = mrOk then
              begin
                RefreshQuery(odsNaz);
              end;
          finally
            frmNaprRad.Free;
          end;
        end else // для рентгена
        begin
          if odsNaz.FieldByName('OWNER').AsInteger = frmMain.GET_ISSL_FLU then
            begin
              Application.CreateForm(TfrmLabNapravFlu, frmLabNapravFlu);
              frmLabNapravFlu.cxFam.Enabled := False;
              frmLabNapravFlu.cxName.Enabled := False;
              frmLabNapravFlu.cxOtch.Enabled := False;
              frmLabNapravFlu.cxNum.Enabled := False;
              frmLabNapravFlu.cxdeRojd.Enabled := False;
              frmLabNapravFlu.cxMale.Enabled := False;
              frmLabNapravFlu.cxFemale.Enabled := False;
              frmLabNapravFlu.DoShowForm(odsNaz.FieldByName('IS_AMBULANCE').AsInteger,
                                         odsNaz.FieldByName('FK_PACID').AsInteger,
                                         odsPac.FieldByName('FK_ID').AsInteger,
                                         '',
                                         frmMain.pOTDELID,
                                         odsNaz.FieldByName('FK_SMID').AsInteger,
                                         odsNaz.FieldByName('FK_ID').AsInteger);
              frmLabNapravFlu.ShowModal;
              frmLabNapravFlu.Free;
              RefreshQuery(odsNaz);
            end else
            begin
              Application.CreateForm(TfrmLabNaprav, frmLabNaprav);
              frmLabNaprav.cxFam.Enabled := False;
              frmLabNaprav.cxName.Enabled := False;
              frmLabNaprav.cxOtch.Enabled := False;
              frmLabNaprav.cxNum.Enabled := False;
              frmLabNaprav.cxdeRojd.Enabled := False;
              frmLabNaprav.cxMale.Enabled := False;
              frmLabNaprav.cxFemale.Enabled := False;
              frmLabNaprav.DoShowForm(odsNaz.FieldByName('IS_AMBULANCE').AsInteger,
                                      odsNaz.FieldByName('FK_PACID').AsInteger,
                                      odsPac.FieldByName('FK_ID').AsInteger,
                                      '',
                                      frmMain.pOTDELID,
                                      odsNaz.FieldByName('FK_SMID').AsInteger,
                                      odsNaz.FieldByName('FK_ID').AsInteger,
                                      odsNaz.FieldByName('IS_REANIM').AsInteger,
                                      odsNaz.FieldByName('FK_DOCID').AsInteger,
                                      odsNaz.FieldByName('fc_an').AsString); //  NUMBERISSL
              frmLabNaprav.VDOZA.Visible := True; // odsNaz.FieldByName('owner').AsInteger <> frmMain.get_xray_mrt;
              frmLabNaprav.VSNIMOK.Visible := True; // odsNaz.FieldByName('owner').AsInteger <> frmMain.get_xray_mrt;
              frmLabNaprav.VPROS.Visible := True; // odsNaz.FieldByName('owner').AsInteger <> frmMain.get_xray_mrt;
              frmLabNaprav.ShowModal;
              frmLabNaprav.Free;
              RefreshQuery(odsNaz);
            end;
        end;
    end;
end;

procedure TfrmSearchLab.TVISSLCustomDrawCell(
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

procedure TfrmSearchLab.odsNazAfterOpen(DataSet: TDataSet);
begin
  CheckEnabledButtons;
end;

procedure TfrmSearchLab.odsNazAfterScroll(DataSet: TDataSet);
begin
  CheckEnabledButtons;
end;

end.
