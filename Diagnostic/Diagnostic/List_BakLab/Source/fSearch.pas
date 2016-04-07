unit fSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel,
  cxGroupBox, cxRadioGroup, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, Buttons, ActnList, ImgList,
  OracleData, Oracle, dxBar, Menus, ShellAPI, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, dxSkinsdxBarPainter, cxSplitter, Registry,
  cxCheckBox, cxBarEditItem, JvDBUtils, cxLookAndFeelPainters, cxButtons, cxGridExportLink,
  frxClass, frxDBSet, cxMemo, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxCalendar, uDigitalSignature, SMMainAPI,
  dxSkinOffice2007Green; 

const
  WM_REFRESHNAZ = WM_USER + 100;

type
  TSetSignFnc = procedure (aSignFnc: TSignFnc); stdcall;
  TEditPlugin_Personal = function(HostObjHandle: THandle;
                                  App: THandle;
                                  nPacID: Integer;
                                  nSotrID: Integer;
                                  nSpecID: Integer;
                                  nSecID: Integer = -1;
                                  nSmidID: Integer = -1;
                                  nNazID: Integer = -1;
                                  bReadOnly: Boolean = false;
																	ObjID: Integer=-1;
																	hMainForm : THandle=0) : LongInt; stdcall;

  TInitDLLWizzard = function(OSS: TOracleSession; Panel_HND, App_HND, Wnd_HND: THandle; pPacID, pSotrID, pAppSotrID, pOsmotrID, pRootID:Integer): THandle; stdcall;
  TInitDLLWizzardDefIspolKab = function(OSS: TOracleSession; Panel_HND, App_HND, Wnd_HND: THandle; pPacID, pSotrID, pAppSotrID, pOsmotrID, pRootID, pIspolID, pKabID : Integer): THandle; stdcall;
  TResizeDLLWizzard = procedure(Panel_HND : THandle); stdcall;
  TFreeDLLWizzard = procedure ; stdcall;

  TShowPacInfo = function(HostObjHandle: THandle; pPacID: integer; EditMode: boolean; pSotrID: integer): LongInt; StdCall;
  TfrmSearch = class(TForm)
    al: TActionList;
    aClose: TAction;
    dsPac: TDataSource;
    odsPac: TOracleDataSet;
    aSearch: TAction;
    BM: TdxBarManager;
    bbNew: TdxBarButton;
    aNew: TAction;
    bbInfo: TdxBarButton;
    aInfo: TAction;
    pmTV: TPopupMenu;
    N2: TMenuItem;
    bbOpenMK: TdxBarButton;
    aOpenMK: TAction;
    bbNaz: TdxBarButton;
    actNaz: TAction;
    bbLoad: TdxBarButton;
    actLoadNaz: TAction;
    BMBar2: TdxBar;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    actEditNaz: TAction;
    actRefreshNaz: TAction;
    actCloseNaz: TAction;
    cxCheckMK: TcxBarEditItem;
    dxBarButton3: TdxBarButton;
    dsNaz: TDataSource;
    odsNaz: TOracleDataSet;
    aClearSearch: TAction;
    bbFill: TdxBarButton;
    aFill: TAction;
    paMain: TPanel;
    Panel1: TPanel;
    p: TPanel;
    cxLabel1: TcxLabel;
    sFIO: TcxTextEdit;
    bSearch: TcxButton;
    bClear: TcxButton;
    cxLabel2: TcxLabel;
    lbSex: TcxLabel;
    cxLabel3: TcxLabel;
    lbRojd: TcxLabel;
    bClose: TcxButton;
    Panel2: TPanel;
    paPac: TPanel;
    cxGr: TcxGrid;
    TVPAC: TcxGridDBTableView;
    VFIO: TcxGridDBColumn;
    VROJD: TcxGridDBColumn;
    VNUMBER: TcxGridDBColumn;
    VTYPEDOC: TcxGridDBColumn;
    VSOS: TcxGridDBColumn;
    cxGrLevel1: TcxGridLevel;
    dxBarDockControl1: TdxBarDockControl;
    paNazWizard: TPanel;
    Panel3: TPanel;
    dxBarDockControl2: TdxBarDockControl;
    paLoad: TPanel;
    cxGrid2: TcxGrid;
    TVISSL: TcxGridDBTableView;
    VDATENAZ: TcxGridDBColumn;
    VDATE: TcxGridDBColumn;
    VNAMEISSL: TcxGridDBColumn;
    VSOSID: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxSplitter1: TcxSplitter;
    aPrint: TAction;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aXLS: TAction;
    N1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Web1: TMenuItem;
    Excel1: TMenuItem;
    Excel2: TMenuItem;
    sdPopUp: TSaveDialog;
    frxRepSearch: TfrxReport;
    frxDBSearch: TfrxDBDataset;
    bbOtmena: TdxBarButton;
    aOtmena: TAction;
    bbProsmotr: TdxBarButton;
    aProsmotr: TAction;
    frxRepProsmotr: TfrxReport;
    memParam: TcxMemo;
    cxLabel4: TcxLabel;
    cxGroupBox1: TcxGroupBox;
    rbAmb: TcxRadioButton;
    rbStac: TcxRadioButton;
    rbAll: TcxRadioButton;
    odsNazFK_ID: TFloatField;
    odsNazFK_SMID: TFloatField;
    odsNazOWNER: TFloatField;
    odsNazFD_NAZ: TDateTimeField;
    odsNazRUN_DATE: TDateTimeField;
    odsNazFD_RUN: TStringField;
    odsNazFK_PACID: TFloatField;
    odsNazFK_ROOMID: TIntegerField;
    odsNazFK_NAZSOSID: TFloatField;
    odsNazFK_DOCID: TFloatField;
    odsNazNAMEISSL: TStringField;
    odsNazPARAM: TStringField;
    dsKem: TDataSource;
    odsKem: TOracleDataSet;
    paNapravlen: TPanel;
    cxLabel5: TcxLabel;
    cxNapravlen: TcxLookupComboBox;
    cxLabel6: TcxLabel;
    cxType: TcxLookupComboBox;
    odsType: TOracleDataSet;
    dsType: TDataSource;
    odsNazFK_NAZTYPEID: TFloatField;
    tmrCheckApplication: TTimer;
    VNAZSOTR: TcxGridDBColumn;
    odsNazNAZSOTR: TStringField;
    odsNazFP_TEK_COC: TFloatField;
    procedure aCloseExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sFIOClick(Sender: TObject);
    procedure sFIOEnter(Sender: TObject);
    procedure aSearchExecute(Sender: TObject);
    procedure odsPacAfterScroll(DataSet: TDataSet);
    procedure aNewExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N2Click(Sender: TObject);
    procedure aOpenMKExecute(Sender: TObject);
    procedure odsPacAfterOpen(DataSet: TDataSet);
    procedure aInfoExecute(Sender: TObject);
    procedure actNazExecute(Sender: TObject);
    procedure actLoadNazExecute(Sender: TObject);
    procedure actEditNazExecute(Sender: TObject);
    procedure actRefreshNazExecute(Sender: TObject);
    procedure actCloseNazExecute(Sender: TObject);
    procedure odsNazAfterOpen(DataSet: TDataSet);
    procedure odsNazBeforeOpen(DataSet: TDataSet);
    procedure cxBarEditItem1PropertiesChange(Sender: TObject);
    procedure TVISSLCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure TVPACFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure paLoadResize(Sender: TObject);
    procedure aClearSearchExecute(Sender: TObject);
    procedure aFillExecute(Sender: TObject);
    procedure TVISSLCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure aPrintExecute(Sender: TObject);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure frxRepSearchGetValue(const VarName: string; var Value: Variant);
    procedure aOtmenaExecute(Sender: TObject);
    procedure aProsmotrExecute(Sender: TObject);
    procedure frxRepProsmotrGetValue(const VarName: string; var Value: Variant);
    procedure TVISSLFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure sFIOKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TVPACKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxNapravlenPropertiesEditValueChanged(Sender: TObject);
    procedure cxTypePropertiesEditValueChanged(Sender: TObject);
    procedure tmrCheckApplicationTimer(Sender: TObject);
  private
    Russian : HKL;
//    AppHandle : Integer;
    SetSignFnc : TSetSignFnc;
    sPacAge_4rep : string;
    sIspolFIO_4rep : string;
    sTextIssl_4Rep : string;
    sPhone_4Rep : string;
    HandleDLL : THandle;
    ANazHandle : THandle;
    FDMedNazHandle : THandle;
    EditPlugin_Personal : TEditPlugin_Personal;
    procedure DoVisibleKemNapravlen(var Msg: TMessage); message WM_REFRESHNAZ;
//    function WinExecAndWait32(FileName: string; Visibility: integer): integer;
    procedure CheckEnabledButtons;
    { Private declarations }
  public
    procedure DoShowfrmSearch;
    { Public declarations }
  end;

var
  frmSearch: TfrmSearch;

implementation

uses fMain, fPacInfoDiagnost, fWait, fEditNaz, fOtmena;

{$R *.dfm}

procedure TfrmSearch.aClearSearchExecute(Sender: TObject);
begin
  sFIO.Clear;
  sFIO.SetFocus;
end;

procedure TfrmSearch.aCloseExecute(Sender: TObject);
var Reg : TRegIniFile;
begin
  if cxSplitter1.Visible = True then
    begin
      Reg:=TRegIniFile.Create;
      Reg.RootKey:=HKEY_CURRENT_USER;
      try
        Reg.WriteInteger('\Software\Softmaster\List_diagnost\ID_SOTR'+IntToStr(frmMain.pSOTRID), 'WIDTH_PANEL_NAZ', paNazWizard.Width);
      finally
        Reg.Free;
      end;
    end;
  Close;
end;

procedure TfrmSearch.FormCreate(Sender: TObject);
begin
  russian:=LoadKeyboardLayout('00000419', 0);
end;

procedure TfrmSearch.frxRepProsmotrGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'PACAGE' then Value := sPacAge_4rep;
  if VarName = 'PACFIO' then Value := odsPac.FieldByName('FIO').AsString;
  if VarName = 'RUNDATE' then Value := odsNaz.FieldByName('FD_RUN').AsString;
  if VarName = 'ISSLNAME' then Value := odsNaz.FieldByName('NAMEISSL').AsString;
  if VarName = 'ISSLTEXT' then Value := sTextIssl_4Rep;
  if frmMain.is_digsig = True then
    begin
      if VarName = 'SOTRNAME' then Value := 'ЭЦП '+sIspolFIO_4rep
    end else
    begin
      if VarName = 'SOTRNAME' then Value := sIspolFIO_4rep;
    end;
  if VarName = 'PHONE' then Value := sPhone_4Rep;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;
end;

procedure TfrmSearch.frxRepSearchGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'USLOVIE' then Value := sFIO.TExt;
  if VarName = 'SOTRNAME' then Value := frmMain.sSotrFIO;
  if VarName = 'DATESYS' then Value := frmMain.GET_SYSDATE_4REP;
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

procedure TfrmSearch.sFIOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    aSearchExecute(nil);
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
                    Screen.Cursor := crDefault;
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

procedure TfrmSearch.TVISSLCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var ods : TOracleDataSet;
begin
  if odsNaz.RecordCount <> 0 then
    begin
	    if odsNaz.FieldByName('FK_NAZSOSID').AsInteger = GET_NAZCANCEL then
		    begin
			    Application.CreateForm(TfrmOtmena, frmOtmena);
			    frmOtmena.acOk.Visible := FALSE;
          frmOtmena.GroupBox1.Visible := FALSE;
          frmOtmena.cxOtmena.Align := alClient;
          frmOtmena.acCancel.ImageIndex := 2;
			    frmOtmena.acCancel.Caption := 'Закрыть';
			    ods := TOracleDataSet.Create(nil);
			    try
				    ods.Session := frmMain.os;
				    ods.Cursor := crSQLWait;
				    ods.SQL.Text := ' SELECT FC_RES, FD_INS, FK_VRACHID, ASU.DO_VRACHFIO(FK_VRACHID) AS VRACHFIO '+
                            '   FROM VRES WHERE FK_NAZID = :pFK_NAZID AND FK_SOS = GET_NAZCANCEL ';
				    ods.DeclareAndSet('pFK_NAZID', otInteger, odsNaz.FieldByName('FK_ID').AsInteger);
				    ods.Open;
				    frmOtmena.cxOtmena.Text := 'Сотрудник:'+' '+ods.FieldByName('VRACHFIO').AsString+','+' '+
						    											 'Дата отмены:'+' '+DateTimeToStr(ods.FieldByName('FD_INS').AsDateTime)+#13#10+
								    									 'Обоснование отмены:'+' '+ods.FieldByName('FC_RES').AsString;
			    finally
				    ods.Free;
			    end;
			    frmOtmena.ShowModal;
			    frmOtmena.Free;
        end else
        begin
          if (odsNaz.FieldByName('FK_NAZSOSID').AsInteger = GET_NEVIP) or (odsNaz.FieldByName('FK_NAZSOSID').AsInteger = GET_RECOMEND) then
            begin
              aFillExecute(nil);
              exit;
            end;
          if odsNaz.FieldByName('FK_NAZSOSID').AsInteger = GET_VIPNAZ then
            begin
              aProsmotrExecute(nil);
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
  if AViewInfo.GridRecord.Values[VSOSID.Index] = get_neyav then
    ACanvas.Brush.Color:=RGB(251, 172, 182);
  if AViewInfo.GridRecord.Values[VSOSID.Index] = GET_VIPNAZ then
    ACanvas.Brush.Color:=RGB(118, 245, 188);
end;

procedure TfrmSearch.TVISSLFocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
var ods : TOracleDataSet;
begin
  CheckEnabledButtons;
  if (odsNaz.FieldByName('PARAM').AsString <> '') and (odsNaz.FieldByName('FK_NAZSOSID').AsInteger <> GET_NAZCANCEL) and (odsNaz.FieldByName('FK_NAZSOSID').AsInteger <> get_neyav) then
    begin
      memParam.Visible := True;
      memParam.Lines.Text := odsNaz.FieldByName('PARAM').AsString;
    end else
    begin
      memParam.Visible := False;
      memParam.Lines.Text := '';
    end;

    cxType.Properties.OnEditValueChanged := nil;
    cxType.EditValue := odsNaz.FieldByName('FK_NAZTYPEID').AsInteger;
    cxType.Properties.OnEditValueChanged := cxTypePropertiesEditValueChanged;

    ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT MAX(FK_SMID) AS ID_KEMNAPRAVLEN '+#13+
                        '           FROM ASU.TIB '+#13+
                        '          WHERE FK_PACID = :PFK_ID '+#13+
                        '            AND FK_SMID IN (SELECT FK_ID FROM asu.TSMID '+#13+
                        '                            START WITH FC_SYNONIM = ''KEM_NAPRAVLEN'' '+#13+
                        '                            CONNECT BY PRIOR FK_ID = FK_OWNER '+#13+
                        '                            UNION ALL '+#13+
                        '                            SELECT FK_ID '+#13+
                        '                              FROM ASU.TSMID '+#13+
                        '                            START WITH FC_SYNONIM = ''PD_NAPRAVIV_YCH'' '+#13+
                        '                            CONNECT BY PRIOR FK_ID = FK_OWNER ) ';
        ods.DeclareAndSet('PFK_ID', otInteger, odsNaz.FieldByName('FK_ID').AsInteger);
        ods.Open;
        cxNapravlen.Properties.OnEditValueChanged := nil;
        cxNapravlen.EditValue := ods.FieldByName('ID_KEMNAPRAVLEN').AsInteger;
        cxNapravlen.Properties.OnEditValueChanged := cxNapravlenPropertiesEditValueChanged;
      finally
        ods.Free;
      end;
      
  if (odsNaz.FieldByName('FK_NAZSOSID').AsInteger <> GET_NAZCANCEL) and (odsNaz.FieldByName('FK_NAZSOSID').AsInteger <> GET_VIPNAZ) and (odsNaz.FieldByName('FK_NAZSOSID').AsInteger <> get_neyav) then
    begin
      cxNapravlen.Enabled := True;
      cxType.Enabled := True;
    end else
    begin
      cxType.Enabled := False;
      cxNapravlen.Enabled := False;
    end; 
end;

procedure TfrmSearch.TVPACFocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  if cxSplitter1.Visible then
    begin
      odsNaz.Close;
      odsNaz.Open;
    end;
end;

procedure TfrmSearch.TVPACKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    aSearchExecute(nil);
end;

//function TfrmSearch.WinExecAndWait32(FileName: string; Visibility: integer): integer;
//var zAppName: array[0..512] of char;
//    zCurDir: array[0..255] of char;
//    WorkDir: string;
//    StartupInfo: TStartupInfo;
//    ProcessInfo: TProcessInformation;
//begin
//  StrPCopy(zAppName, FileName);
//  GetDir(0, WorkDir);
//  StrPCopy(zCurDir, FileName);
//  FillChar(StartupInfo, Sizeof(StartupInfo), #0);
//  StartupInfo.cb := Sizeof(StartupInfo);
//  StartupInfo.hStdInput := 23999;
//  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
//  StartupInfo.wShowWindow := Visibility;
//  if not CreateProcess(nil,
//         zAppName, { указатель командной строки }
//         nil, { указатель на процесс атрибутов безопасности }
//         nil, { указатель на поток атрибутов безопасности }
//         false, { флаг родительского обработчика }
//         CREATE_NEW_CONSOLE or { флаг создания }
//         NORMAL_PRIORITY_CLASS,
//         nil, { указатель на новую среду процесса }
//         nil, { указатель на имя текущей директории }
//         StartupInfo, { указатель на STARTUPINFO }
//         ProcessInfo) then Result := -1 { указатель на PROCESS_INF }
//  else begin
//      Result := ProcessInfo.dwProcessId;
//  end;
//end;

procedure TfrmSearch.aSearchExecute(Sender: TObject);
var sFam, sIm, sOtch : String;
    strIm : String;
    flag : Integer;
begin
  if cxNapravlen.Focused <> True then
  begin

  flag := 0; //!!! проверить во всех проектах
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
      if rbAmb.Checked = True then  // амбулаторные
        begin
          odsPac.Close;
			    odsPac.SQL.Text := ' select tambulance.fk_peplid as fk_id, '+ #13 +
                             '        tambulance.fc_fam||'' ''||tambulance.fc_im||'' ''||tambulance.fc_otch fio, '+ #13 +
												     '        DECODE(TO_CHAR(tambulance.FD_ROJD, ''dd.mm.yyyy hh24:mi:ss''), ''00.00.0000 00:00:00'', TRUNC(SYSDATE), tambulance.FD_ROJD) FD_ROJD, '+ #13 +
												     '        tuslvid.fc_name, '+ #13 +
												     '        asu.pkg_regist_peplfunc.get_pepl_sex(tambulance.fk_peplid) sex, '+ #13 +
                             '        ASU.GET_IB(TAMBULANCE.FK_ID) AS NIB, '+ #13 +
                             '        ''Амбулаторное лечение'' stek_coc, '+ #13 +
                             '        tambulance.fk_id PacID, '+ #13 +
                             '        1 AS IS_AMBULANCE, '+ #13 +
                             '        0 as fp_tek_coc '+#13+
                             '   from asu.tambulance, asu.tdocobsl, asu.tuslvid '+ #13 +
                             '  where tambulance.fc_fam like :pFAM||''%'' '+ #13 +
                             '    and nvl(tambulance.fc_im,'' '') like :pIM||''%'' '+ #13 +
                             '    and nvl(tambulance.fc_otch,'' '') like :pOTCH||''%'' '+ #13 +
												     '    and tambulance.fk_docobsl = tdocobsl.fk_id '+ #13 +
												     '    and tdocobsl.fk_viddocid = tuslvid.fk_id '+ #13 +
                             ' order by fio ';
			    odsPac.DeclareAndSet('pFAM', otString, trim(sFAM));
			    odsPac.DeclareAndSet('pIM', otString, trim(sIM));
			    odsPac.DeclareAndSet('pOTCH', otString, trim(sOTCH));
			    odsPac.Open;
        end;
     if rbStac.Checked = True then // стационарные
       begin
         odsPac.Close;
			   odsPac.SQL.Text := ' select tkarta.fk_peplid as fk_id, '+ #13 +
                            '        tkarta.fc_fam||'' ''||tkarta.fc_im||'' ''|| tkarta.fc_otch fio, '+ #13 +
												    '        DECODE(TO_CHAR(tkarta.FD_ROJD, ''dd.mm.yyyy hh24:mi:ss''), ''00.00.0000 00:00:00'', TRUNC(SYSDATE), tkarta.FD_ROJD) FD_ROJD, '+ #13 +
												    '        tuslvid.fc_name, '+ #13 +
												    '        asu.pkg_regist_peplfunc.get_pepl_sex(tkarta.fk_peplid) sex, '+ #13 +
												    '        ASU.GET_IB(TKARTA.FK_ID) AS nIB, '+ #13 +
                            '        decode(tkarta.fp_tek_coc,3,''Выписан'',2,''В стационаре'',-2,''На оформлении ПО'','''') stek_coc, '+ #13 +
                            '        tkarta.fk_id PacID, '+ #13 +
												    '        0 AS IS_AMBULANCE, '+ #13 +
                            '        TKARTA.FP_TEK_COC '+#13+
												    '   from asu.tkarta, asu.tuslvid '+ #13 +
												    '  where tkarta.fc_fam like :pFAM||''%'' '+ #13 +
                            '    and nvl(tkarta.fc_im,'' '') like :pIM||''%'' '+ #13 +
                            '    and nvl(tkarta.fc_otch,'' '') like :pOTCH||''%'' '+ #13 +
                            '    and tkarta.fk_uslvidid = tuslvid.fk_id '+#13+
//												    '    and tkarta.fp_tek_coc <> 3 '+ #13 +
												    ' order by fio ';
			   odsPac.DeclareAndSet('pFAM', otString, trim(sFAM));
		     odsPac.DeclareAndSet('pIM', otString, trim(sIM));
			   odsPac.DeclareAndSet('pOTCH', otString, trim(sOTCH));
			   odsPac.Open;
       end;
     if rbAll.Checked = True then // все
       begin
         odsPac.Close;
			   odsPac.SQL.Text := ' select tambulance.fk_peplid as fk_id, '+ #13 +
                            '        tambulance.fc_fam||'' ''||tambulance.fc_im||'' ''|| tambulance.fc_otch fio, '+ #13 +
												    '        DECODE(TO_CHAR(tambulance.FD_ROJD, ''dd.mm.yyyy hh24:mi:ss''), ''00.00.0000 00:00:00'', TRUNC(SYSDATE), tambulance.FD_ROJD) FD_ROJD, '+ #13 +
												    '        tuslvid.fc_name, '+ #13 +
												    '        asu.pkg_regist_peplfunc.get_pepl_sex(tambulance.fk_peplid) sex, '+ #13 +
                            '        ASU.GET_IB(TAMBULANCE.FK_ID) AS NIB, ''Амбулаторное лечение'' stek_coc, '+
                            '        tambulance.fk_id PacID, '+ #13 +
                            '        1 AS IS_AMBULANCE, '+ #13 +
                            '        0 AS FP_TEK_COC '+#13+
                            '   from asu.tambulance, asu.tdocobsl, asu.tuslvid '+ #13 +
                            '  where tambulance.fc_fam like :pFAM||''%'' '+ #13 +
                            '    and nvl(tambulance.fc_im,'' '') like :pIM||''%'' '+ #13 +
                            '    and nvl(tambulance.fc_otch,'' '') like :pOTCH||''%'' '+ #13 +
												    '    and tambulance.fk_docobsl = tdocobsl.fk_id '+ #13 +
												    '    and tdocobsl.fk_viddocid = tuslvid.fk_id '+ #13 +
												    ' union all '+ #13 +
												    ' select tkarta.fk_peplid as fk_id, '+ #13 +
                            '        tkarta.fc_fam||'' ''||tkarta.fc_im||'' ''|| tkarta.fc_otch fio, '+ #13 +
												    '        DECODE(TO_CHAR(tkarta.FD_ROJD, ''dd.mm.yyyy hh24:mi:ss''), ''00.00.0000 00:00:00'', TRUNC(SYSDATE), tkarta.FD_ROJD) FD_ROJD, '+ #13 +
												    '        tuslvid.fc_name, '+ #13 +
												    '        asu.pkg_regist_peplfunc.get_pepl_sex(tkarta.fk_peplid) sex, '+ #13 +
												    '        ASU.GET_IB(TKARTA.FK_ID) AS NIB, '+ #13 +
                            '        decode(tkarta.fp_tek_coc,3,''Выписан'',2,''В стационаре'',-2,''На оформлении ПО'','''') stek_coc, '+ #13 +
                            '        tkarta.fk_id PacID, '+ #13 +
												    '        0 AS IS_AMBULANCE, '+ #13 +
                            '        TKARTA.FP_TEK_COC '+#13+
												    '   from asu.tkarta, asu.tuslvid '+ #13 +
												    '  where tkarta.fc_fam like :pFAM||''%'' '+ #13 +
                            '    and nvl(tkarta.fc_im,'' '') like :pIM||''%'' '+#13+
                            '    and nvl(tkarta.fc_otch,'' '') like :pOTCH||''%'' '+#13+
                            '    and tkarta.fk_uslvidid = tuslvid.fk_id '+#13+
//												    '    and tkarta.fp_tek_coc <> 3 '+ #13 +
												    ' order by fio ';
			   odsPac.DeclareAndSet('pFAM', otString, trim(sFAM));
			   odsPac.DeclareAndSet('pIM', otString, trim(sIM));
			   odsPac.DeclareAndSet('pOTCH', otString, trim(sOTCH));
			   odsPac.Open;
       end;
		end;
  CheckEnabledButtons;
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

procedure TfrmSearch.odsPacAfterScroll(DataSet: TDataSet);
var FreeDLLWizzard : TFreeDLLWizzard;
begin
  lbRojd.Caption := DateTimeToStr(odsPac.FieldByName('FD_ROJD').AsDateTime);
  lbSex.Caption := odsPac.FieldByName('SEX').AsString;
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
  if ANazHandle <> 0 then
    begin
      @FreeDLLWizzard := GetProcAddress(ANazHandle, 'FreePlugin');
      if @FreeDLLWizzard <> nil then
        FreeDLLWizzard;
      FreeLibrary(ANazHandle);
      ANazHandle := 0;
    end;
  if bbNaz.Down = True then
    bbNaz.Down := False;
end;

procedure TfrmSearch.paLoadResize(Sender: TObject);
var ResizeDLLWizzard : TResizeDLLWizzard;
begin
  if ANazHandle <> 0 then
    begin
      @ResizeDLLWizzard := GetProcAddress(ANazHandle, 'ResizePlugin');
      if @ResizeDLLWizzard <> nil then
        ResizeDLLWizzard(paNazWizard.Handle);
    end;
end;

procedure TfrmSearch.aNewExecute(Sender: TObject);
//var ShowPacInfo: TShowPacInfo;
var AmbInfo : THandle;
    DoShowAmbInfo : function(App_HND:THandle;
                             APacID:Integer;
                             ASotrID: Integer;
                             AAppSotr: Integer;
                             ATalonId : Integer;
                             AMode : Integer) : Integer; stdcall;
    str : string;
begin
  AmbInfo := LoadLibrary('DLL_RegistAmb.dll');
  try
    if AmbInfo <> 0 then
      begin
        @DoShowAmbInfo := GetProcAddress(AmbInfo, 'DoShowAmbInfo');
        if @DoShowAmbInfo = nil then
          Application.MessageBox('Функция DoShowAmbInfo не найдена в DLL_RegistAmb.dll', 'Внимание', MB_OK + MB_ICONEXCLAMATION);
        try
          DoShowAmbInfo(Application.Handle,
                        -1,
                        frmMain.pSOTRID,
                        frmMain.pAPPSOTRID,
                        -1,
                        -1);
        except
          on E:  Exception do
            begin
              str :='Ошибка при запуске внешнего модуля DLL_RegistAmb.dll'+sLineBreak+E.Message;
              Application.MessageBox(PChar(str), 'Ошибка', MB_OK + MB_ICONERROR);
            end;
          end;
      end else
      begin
        Application.MessageBox('Библиотека DLL_RegistAmb.dll не найдена', 'Внимание', MB_OK + MB_ICONEXCLAMATION);
      end;
  finally
    FreeLibrary(AmbInfo);
  end;
end;

procedure TfrmSearch.DoShowfrmSearch;
var Reg : TRegIniFile;
     id : Integer;
begin
  aOpenMK.Visible := frmMain.aOpen.Visible;
  aOpenMK.Enabled := FALSE;
  aInfo.Enabled := FALSE;
  actNaz.Enabled := False;
  actLoadNaz.Enabled := FALSE;
  aPrint.Enabled := False;
	cxSplitter1.CloseSplitter;
  cxSplitter1.Visible := FALSE;
//---
  Reg := TRegIniFile.Create;
  try
    Reg.RootKey:=HKEY_CURRENT_USER;
    Reg.OpenKey('\Software\Softmaster\List_diagnost\fSearch\ID_SOTR'+IntToStr(frmMain.pSOTRID), True); // !!! не диагност
    id := Reg.ReadInteger('\Software\Softmaster\List_diagnost\fSearch\ID_SOTR'+IntToStr(frmMain.pSOTRID), 'ID_VIDPAC', 0);
    case id of
      0: rbAmb.Checked := True;
      1: rbStac.Checked := True;
      2: rbAll.Checked := True;
    end;
    TVPAC.StoreToRegistry('\SoftWare\SoftMaster\ListPatAnatom\fSearch\TVPACVrach_' + IntToStr(frmMain.pSOTRID)+'Default', TRUE, [], 'TVPAC'); 
    TVPAC.RestoreFromRegistry('\SoftWare\SoftMaster\ListPatAnatom\fSearch\TVPACVrach_' + IntToStr(frmMain.pSOTRID), FALSE, FALSE, [], 'TVPAC');
  finally
    Reg.Free;
  end;
end;

procedure TfrmSearch.DoVisibleKemNapravlen(var Msg: TMessage);
begin
//
end;

procedure TfrmSearch.CheckEnabledButtons;
begin
  if odsPac.Active then
    begin
      aOpenMK.Enabled := odsPac.RecordCount <> 0;
      aInfo.Enabled := odsPac.RecordCount <> 0;
      actLoadNaz.Enabled := odsPac.RecordCount <> 0;
    end;
  if odsNaz.Active then
    begin
      paNapravlen.Enabled := ((odsNaz.FieldByName('FK_NAZSOSID').AsInteger = GET_NEVIP) or
                             (odsNaz.FieldByName('FK_NAZSOSID').AsInteger = GET_RECOMEND)) and
                             (odsNaz.FieldByName('FP_TEK_COC').AsInteger <> 3);
      paNapravlen.Visible := (odsNaz.RecordCount <> 0);
      actEditNaz.Enabled := (odsNaz.RecordCount <> 0) and ((odsNaz.FieldByName('FK_NAZSOSID').AsInteger = GET_NEVIP)
                                                           or (odsNaz.FieldByName('FK_NAZSOSID').AsInteger = GET_RECOMEND));
      aFill.Enabled := (odsNaz.RecordCount <> 0)
                    and ((odsNaz.FieldByName('FK_NAZSOSID').AsInteger = GET_NEVIP) or (odsNaz.FieldByName('FK_NAZSOSID').AsInteger = GET_RECOMEND));
      aOtmena.Enabled := (odsNaz.RecordCount <> 0)
                      and ((odsNaz.FieldByName('FK_NAZSOSID').AsInteger = GET_NEVIP) or (odsNaz.FieldByName('FK_NAZSOSID').AsInteger = GET_RECOMEND));
      aProsmotr.Enabled := odsNaz.FieldByName('FK_NAZSOSID').AsInteger = GET_VIPNAZ;
    end;
end;

procedure TfrmSearch.cxBarEditItem1PropertiesChange(Sender: TObject);
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

procedure TfrmSearch.cxNapravlenPropertiesEditValueChanged(Sender: TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := frmMain.os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' DECLARE '+#13+
                   '   ID23 NUMBER; '+#13+
                   ' BEGIN '+#13+
                   '   SELECT MAX(FK_ID) INTO ID23 '+#13+
                   '     FROM asu.TIB '+#13+
                   '    WHERE FK_PACID = :PFK_ID '+#13+
                   '      AND FK_SMID IN (SELECT FK_ID FROM asu.TSMID '+#13+
                   '                      START WITH FC_SYNONIM = ''KEM_NAPRAVLEN'' '+#13+
                   '                      CONNECT BY PRIOR FK_ID = FK_OWNER '+#13+
                   '                      UNION ALL '+#13+
                   '                      SELECT FK_ID FROM ASU.TSMID '+#13+
                   '                      START WITH FC_SYNONIM = ''PD_NAPRAVIV_YCH'' '+#13+
                   '                      CONNECT BY PRIOR FK_ID = FK_OWNER); '+#13+
                   '   IF ID23 IS NOT NULL THEN '+#13+
                   '     UPDATE asu.TIB '+#13+
                   '        SET FK_SMID = :pFK_SMID23, FK_SMEDITID =:pFK_SMEDITID23, FC_CHAR = :pFC_CHAR, FK_VRACHID =:pFK_VRACHID '+#13+
                   '      WHERE FK_ID = ID23; '+#13+
                   '   ELSE '+#13+
                   '     INSERT INTO asu.TIB(FK_PACID, FK_SMID, FK_SMEDITID, FC_CHAR, FK_VRACHID) '+#13+
                   '     VALUES(:pFK_ID, :pFK_SMID23, :pFK_SMEDITID23, :pFC_CHAR, :pFK_VRACHID); '+#13+
                   '   END IF; '+#13+
                   ' END; ';
    oq.DeclareAndSet('PFK_ID', otInteger, odsNaz.FieldByName('FK_ID').AsInteger);
    oq.DeclareAndSet('pFK_SMID23', otInteger, odsKem.FieldByName('FK_ID').AsInteger);
    oq.DeclareAndSet('pFK_SMEDITID23', otInteger, odsKem.FieldByName('FK_ID').AsInteger);
    oq.DeclareAndSet('pFC_CHAR', otString, cxNapravlen.Text);
    oq.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
    oq.Execute;
    frmMain.os.Commit;
  finally
    oq.Free;
  end;
end;

procedure TfrmSearch.cxTypePropertiesEditValueChanged(Sender: TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := frmMain.os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' UPDATE ASU.TNAZIS SET FK_NAZTYPEID = :PFK_NAZTYPEID WHERE FK_ID = :PFK_ID ';
    oq.DeclareAndSet('PFK_NAZTYPEID', otInteger, odsType.FieldByName('FK_ID').AsInteger);
    oq.DeclareAndSet('PFK_ID', otInteger, odsNaz.FieldByName('FK_ID').AsInteger);
    oq.Execute;
    frmMain.os.Commit;
    RefreshQuery(odsNaz);
  finally
    oq.Free;
  end;
end;

procedure TfrmSearch.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var FreeDLLWizzard : TFreeDLLWizzard;
    Reg : TRegIniFile;
begin
//---
  if ANazHandle <> 0 then
    begin
      @FreeDLLWizzard := GetProcAddress(ANazHandle, 'FreePlugin');
      if @FreeDLLWizzard <> nil then
        FreeDLLWizzard;
      FreeLibrary(ANazHandle);
      ANazHandle := 0;
    end;
  if paNapravlen.Visible = True then
    paNapravlen.Visible := False;
//---
  Reg := TRegIniFile.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
  if not Reg.OpenKey('\Software\Softmaster\List_diagnost\fSearch\', FALSE) then
   begin
     Reg.CreateKey('\Software\Softmaster\List_diagnost\fSearch');
   end;
  try
    if rbAmb.Checked then
      Reg.WriteInteger('\Software\Softmaster\List_diagnost\fSearch'+'\ID_SOTR'+IntToStr(frmMain.pSOTRID), 'ID_VIDPAC', 0);
    if rbStac.Checked then
      Reg.WriteInteger('\Software\Softmaster\List_diagnost\fSearch'+'\ID_SOTR'+IntToStr(frmMain.pSOTRID), 'ID_VIDPAC', 1);
    if rbAll.Checked then
      Reg.WriteInteger('\Software\Softmaster\List_diagnost\fSearch'+'\ID_SOTR'+IntToStr(frmMain.pSOTRID), 'ID_VIDPAC', 2);
  except
  end;
  Reg.Free;

  TVPAC.StoreToRegistry('\SoftWare\SoftMaster\ListPatAnatom\fSearch\TVPACVrach_' + IntToStr(frmMain.pSOTRID), TRUE, [], 'TVPAC');
end;

procedure TfrmSearch.N2Click(Sender: TObject);
begin
  TVPAC.RestoreFromRegistry('\SoftWare\SoftMaster\ListPatAnatom\fSearch\TVPACVrach_' + IntToStr(frmMain.pSOTRID)+'Default', FALSE, FALSE, [], 'TVPAC');
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
    AppProcID := AppStart('IBRazdel.exe', IntToStr(odsPac.FieldByName('PACID').AsInteger)+' '+IntToStr(-1)+' '+IntToStr(-1));
    if AppProcID = -1 then ShowMessage('Ошибка запуска приложения');
    ShowWait(odsPac.FieldByName('PACID').AsInteger,True);
  finally
    ods.Free;
  end;
end;

procedure TfrmSearch.aOtmenaExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  if odsNaz.FieldByName('fp_tek_coc').AsInteger = 3 then
    begin
      MessageDlg('Внимание!'+#13+#10+
                 'Данное исследование закреплено за выписанной медицинской картой пациента!'+#13+#10+
                 'Вы не можете что-либо изменить в его медицинской карте!', mtWarning, [mbOK], 0);
    end else
    begin
      Application.CreateForm(TfrmOtmena, frmOtmena);
      try
        frmOtmena.DoShowfrmOtmena(odsNaz.FieldByName('FK_PACID').AsInteger, frmMain.pSOTRID);
        frmOtmena.ShowModal;
        if frmOtmena.ModalResult = MrOK then
          begin
            oq := TOracleQuery.Create(nil);
            oq.Session := frmMain.os;
            oq.Cursor := crSQLWait;
            oq.SQL.Text := ' UPDATE asu.TNAZIS SET FK_ISPOLID = :pFK_ISPOLID, FK_NAZSOSID = :pFK_NAZSOSID WHERE FK_ID = :pFK_ID ';
            oq.DeclareAndSet('pFK_ISPOLID', otInteger, frmMain.pSOTRID);
            oq.DeclareAndSet('pFK_NAZSOSID', otInteger, GET_NAZCANCEL);
            oq.DeclareAndSet('pFK_ID', otInteger, odsNaz.FieldByName('FK_ID').AsInteger);
            oq.Execute;
            oq.DeleteVariables;
            oq.SQL.Text := ' INSERT INTO asu.VRES(FK_SMID, FD_INS, FC_RES, FC_TYPE, FK_VRACHID, FK_PACID, FK_NAZID, FK_SOS) '+
                           ' VALUES(:pFK_SMID, SYSDATE, :pFC_RES, ''TEXT'', :pFK_VRACHID, :pFK_PACID, :pFK_NAZID, :pFK_SOS) ';
            oq.DeclareAndSet('pFK_SMID', otInteger, odsNaz.FieldByName('FK_SMID').AsInteger);
            oq.DeclareAndSet('pFC_RES', otString, frmOtmena.cxOtmena.Text+';'+frmOtmena.cxOtmenaHand.Text);
            oq.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
            oq.DeclareAndSet('pFK_PACID', otInteger, odsNaz.FieldByName('FK_PACID').AsInteger);
            oq.DeclareAndSet('pFK_NAZID', otInteger, odsNaz.FieldByName('FK_ID').AsInteger);
            oq.DeclareAndSet('pFK_SOS', otInteger, GET_NAZCANCEL);
            oq.Execute;
            frmMain.os.Commit;
            oq.Free;
            RefreshQuery(odsNaz);
          end;
      finally
        frmOtmena.Free;
      end;
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
    frmMain.GET_SYSDATE_4REP := ods.FieldByName('DATESYS').AsString;
  finally
    ods.Free;
  end;
  frxRepSearch.ShowReport;
  odsPac.Locate('PACID', id, []);
  TVPAC.OnFocusedRecordChanged := TVPACFocusedRecordChanged;
  odsPac.AfterScroll := odsPacAfterScroll;
end;

procedure TfrmSearch.aProsmotrExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT (SELECT FB_TEXT FROM ASU.TRICHVIEWDATA WHERE FK_PACID = :PFK_PACID) AS FB_TEXT, '+
                    '        (SELECT FC_PHONE FROM ASU.TKABINET WHERE FK_ID = :PFK_ID ) AS FC_PHONE '+
                    '   FROM DUAL ';
    ods.DeclareAndSet('PFK_PACID', otInteger, odsNaz.FieldByName('FK_ID').AsInteger);
    ods.DeclareAndSet('PFK_ID', otInteger, odsNaz.FieldByName('FK_ROOMID').AsInteger);
    ods.Open;
    sTextIssl_4Rep := ods.FieldByName('FB_TEXT').AsString;
    sPhone_4Rep := ods.FieldByName('FC_PHONE').AsString;
    if sPhone_4Rep = '' then
      frxRepProsmotr.FindObject('MemTel').Visible := False
    else
      frxRepProsmotr.FindObject('MemTel').Visible := True;
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT ASU.DO_VRACHFIO(TNAZIS.FK_ISPOLID) AS ISPOLFIO, '+               // !!! зачем здесь делать запрос из TNAZIS
                    '        ASU.PKG_REGIST_PACFUNC.GET_PAC_AGE_NOW(TNAZIS.FK_PACID) AGE '+   // если в гриде и так TNAZIS
                    '   FROM TNAZIS '+
                    '  WHERE FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, odsNaz.FieldByName('FK_ID').AsInteger);
    ods.Open;
    sPacAge_4rep := ods.FieldByName('AGE').AsString;
    sIspolFIO_4rep := ods.FieldByName('ISPOLFIO').AsString;
    if frmMain.get_digsig = '1' then
      begin
        ods.Close;
        ods.DeleteVariables;
        ods.SQL.Text := ' SELECT COUNT(*) AS CNT FROM ASU.TPODPIS_RICHVIEWDATA P, ASU.TRICHVIEWDATA D '+
                        '  WHERE P.FK_RICHVIEWDATA = D.FK_ID '+
                        '    AND D.FK_PACID = :PFK_PACID ';
        ods.DeclareAndSet('PFK_PACID', otInteger, odsNaz.FieldByName('FK_ID').AsInteger);
        ods.Open;
        if ods.FieldByName('CNT').AsInteger > 0 then
          frmMain.is_digsig := True
        else
          frmMain.is_digsig := False;
      end;
  finally
    ods.Free;
  end;
  frxRepProsmotr.ShowReport;
end;

procedure TfrmSearch.odsNazAfterOpen(DataSet: TDataSet);
begin
  CheckEnabledButtons;
end;

procedure TfrmSearch.odsNazBeforeOpen(DataSet: TDataSet);
begin
  odsNaz.SetVariable('PFK_PACID', odsPac.FieldByName('FK_ID').AsInteger);
  odsNaz.SetVariable('PSOTRID', frmMain.pSOTRID);
end;

procedure TfrmSearch.odsPacAfterOpen(DataSet: TDataSet);
begin
  if odsPac.RecordCount = 0 then
    begin
      lbSex.Caption := '--';
      lbRojd.Caption := '--';
    end;
  actNaz.Enabled := odsPac.RecordCount <> 0;
  aPrint.Enabled := odsPac.RecordCount <> 0;
end;

procedure TfrmSearch.actCloseNazExecute(Sender: TObject);
var FreeDLLWizzard : TFreeDLLWizzard;
    Reg : TRegIniFile;
begin
  if ANazHandle <> 0 then
    begin
      @FreeDLLWizzard := GetProcAddress(ANazHandle, 'FreePlugin');
      if @FreeDLLWizzard <> nil then
        FreeDLLWizzard;
      FreeLibrary(ANazHandle);
      ANazHandle := 0;
    end;
  if paNapravlen.Visible = True then
    paNapravlen.Visible := False;
  if bbNaz.Down = True then
    bbNaz.Down := False;
  actRefreshNaz.Enabled := True;
  cxCheckMK.Enabled := True;
//------------------------------------------------------------------------------  
  Reg:=TRegIniFile.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
  try
    Reg.WriteInteger('\Software\Softmaster\List_diagnost\ID_SOTR'+IntToStr(frmMain.pSOTRID), 'WIDTH_PANEL_NAZ', paNazWizard.Width);   //'WIDTH_PANEL_NAZ'
  finally
    Reg.Free;
  end;
  cxSplitter1.CloseSplitter;
  cxSplitter1.Visible := False;
  TVISSL.StoreToRegistry('\SoftWare\SoftMaster\List_diagnost\fSearch\TVISSL'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID), TRUE, [], 'TVISSL');
//------------------------------------------------------------------------------
end;

procedure TfrmSearch.actEditNazExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  if odsNaz.FieldByName('fp_tek_coc').AsInteger = 3 then
    begin
      MessageDlg('Внимание!'+#13+#10+
                 'Данное исследование закреплено за выписанной медицинской картой пациента!'+#13+#10+
                 'Вы не можете что-либо изменить в его медицинской карте!', mtWarning, [mbOK], 0);
    end else
    begin
      Application.CreateForm(TfrmEditNaz, frmEditNaz);
      try
        frmEditNaz.DoShowEditNaz(odsNaz.FieldByName('FK_PACID').AsInteger,
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
              oq.SQL.Text := ' UPDATE asu.TNAZIS SET FD_RUN = :PFD_RUN, FK_ROOMID = :PFK_ROOMID, fl_in_raspis = 1 WHERE FK_ID = :PFK_ID ';
              oq.DeclareAndSet('PFD_RUN', otDate, StrToDateTime(DateToStr(frmEditNaz.cxdeDate.Date)+' '+FormatDateTime('hh:nn:ss', frmEditNaz.cxteTime.Time)));
              oq.DeclareAndSet('PFK_ROOMID', otInteger, frmEditNaz.cxlcKabinet.EditValue);
              oq.DeclareAndSet('PFK_ID', otInteger, odsNaz.FieldByName('FK_ID').AsInteger);
              oq.Execute;
              frmMain.os.Commit;
            finally
              oq.Free;
            end;
          end;
        RefreshQuery(odsNaz);
      finally
        frmEditNaz.Free;
      end;
    end;
end;

procedure TfrmSearch.actLoadNazExecute(Sender: TObject);
var Reg : TRegIniFile;
    id : Integer;
begin
  if cxSplitter1.Visible <> True then
    begin
      cxSplitter1.Visible := True;
      cxSplitter1.OpenSplitter;
      Reg:=TRegIniFile.Create;
      Reg.RootKey:=HKEY_CURRENT_USER;
      id := Reg.ReadInteger('\Software\Softmaster\List_diagnost\ID_SOTR'+IntToStr(frmMain.pSOTRID), 'WIDTH_PANEL_NAZ', 0);
      Reg.Free;
      if id <> 0 then
        paNazWizard.Width := id
      else
        paNazWizard.Width := 300;
      TVISSL.RestoreFromRegistry('\SoftWare\SoftMaster\List_diagnost\fSearch\TVISSL'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID), FALSE, FALSE, [], 'TVISSL');
    end;
  odsNaz.Close;
  odsNaz.Open;
  if odsKem.Active = False then
    odsKem.Active := True;
  if odsType.Active = False then
    odsType.Active := True;
end;

procedure TfrmSearch.actNazExecute(Sender: TObject);
var InitDLLWizzardDefIspolKab : TInitDLLWizzardDefIspolKab;
    FreeDLLWizzard : TFreeDLLWizzard;
begin
  if odsPac.FieldByName('fp_tek_coc').AsInteger = 3 then
    begin
      MessageDlg('Внимание!'+#13+#10+
                 'Пациент выписан!'+#13+#10+
                 'Вы не можете добавить новое исследование в его медицинскую карту!', mtWarning, [mbOK], 0);
      exit;           
    end;
  if bbNaz.Down then
    begin
      paNapravlen.Visible := False;
      actEditNaz.Enabled := False;
      actRefreshNaz.Enabled := False;
      aOtmena.Enabled := False;
      aProsmotr.Enabled := False;
      cxCheckMK.Enabled := False;
      aFill.Enabled := False;
      ANazHandle := LoadLibrary('DLL_NazWizzard.dll');
      if ANazHandle <> 0 then
        begin
          @InitDLLWizzardDefIspolKab := GetProcAddress(ANazHandle, 'InitPluginWithSessionDefIspolKab');
          if @InitDLLWizzardDefIspolKab <> nil then
            FDMedNazHandle := InitDLLWizzardDefIspolKab(frmMain.os,
                                                        paLoad.Handle,
                                                        Application.Handle,
                                                        Handle,
                                                        odsPac.FieldByName('PACID').AsInteger,
                                                        frmMain.pSOTRID,
                                                        StrToInt(paramstr(1)), //pAPPSOTRID,
                                                        -2,
                                                        frmMain.GET_ISSLEDID,
                                                        frmMain.pSOTRID,
                                                        frmMain.odsKab.FieldByName('kabid').AsInteger);
        end;
    end else
    begin
      if ANazHandle <> 0 then
        begin
          @FreeDLLWizzard := GetProcAddress(ANazHandle, 'FreePlugin');
          if @FreeDLLWizzard <> nil then
            FreeDLLWizzard;
          FreeLibrary(ANazHandle);
        end;
      if paNapravlen.Visible = True then
        paNapravlen.Visible := False;
      CheckEnabledButtons;
      actRefreshNaz.Enabled := True;
      cxCheckMK.Enabled := True;
      aOtmena.Enabled := True;
      aProsmotr.Enabled := True;
      ANazHandle := 0;
      paNapravlen.Visible := True;
      RefreshQuery(odsNaz);
    end;
end;

procedure TfrmSearch.actRefreshNazExecute(Sender: TObject);
begin
  RefreshQuery(odsNaz);
end;

procedure TfrmSearch.aFillExecute(Sender: TObject);
var id : Integer;
begin
  if odsNaz.FieldByName('fp_tek_coc').AsInteger = 3 then
    begin
      MessageDlg('Внимание!'+#13+#10+
                 'Данное исследование закреплено за выписанной медицинской картой пациента!'+#13+#10+
                 'Вы не можете что-либо изменить в его медицинской карте!', mtWarning, [mbOK], 0);
    end else
    begin
      id := odsNaz.FieldByName('FK_ID').AsInteger;
      HandleDLL := LoadLibrary('PriemDll.dll');
      if HandleDLL <> 0 then
        begin
          EditPlugin_Personal := GetProcAddress(HandleDLL, 'EditPlugin_Personal');
          if @EditPlugin_Personal <> nil then
            begin
              try
                @SetSignFnc := GetProcAddress(HandleDLL, 'SetSignFnc');
                if Assigned(@SetSignFnc) then
                  SetSignFnc(frmMain.gDigSignature.SignDocument);
					      EditPlugin_Personal(paMain.Handle, //хэндл панели
								      							Application.Handle, //хэндл аппликейшена
											      				odsNaz.FieldByName('FK_PACID').AsInteger, //код пациента
													      		frmMain.pSOTRID, //код сотрудника
															      frmMain.pAPPSOTRID, //специализация
                                    -1, //секция
															      -1, //odsNaz.FieldByName('FK_SMID').AsInteger, //смид
															      odsNaz.FieldByName('FK_ID').AsInteger, //назид
															      FALSE,
															      odsNaz.FieldByName('FK_ID').AsInteger, //ид объекта
															      paMain.Parent.Handle);
              except
              end;
            end;
        end;
      try
        Application.ProcessMessages;
        FreeLibrary(HandleDLL);
        HandleDll:=0;
      except
      end;
      RefreshQuery(odsNaz);
      odsNaz.Locate('FK_ID', id, []);
    end;
end;

procedure TfrmSearch.aInfoExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmPacInfoDiagnost, frmPacInfoDiagnost);
  try
    frmPacInfoDiagnost.DoShowPacInfo(odsPac.FieldByName('PACID').AsInteger,
                                     odsPac.FieldByName('FK_ID').AsInteger,
                                     '');
    frmPacInfoDiagnost.ShowModal;
  finally
    frmPacInfoDiagnost.Free;
  end;
end;

end.
