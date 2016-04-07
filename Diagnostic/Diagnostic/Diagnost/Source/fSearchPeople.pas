unit fSearchPeople;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, Menus, cxLookAndFeelPainters,
  StdCtrls, cxButtons, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel,
  ExtCtrls, ActnList, dxSkinsdxBarPainter, cxCheckBox, dxBar, cxBarEditItem,
  cxClasses, cxStyles, dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid, OracleData,
  cxRadioGroup, cxGroupBox, registry, cxImageComboBox, dxSkinOffice2007Green, Medotrade;

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
    odsPac: TOracleDataSet;
    dsPac: TDataSource;
    aClear: TAction;
    aSearch: TAction;
    pmTV: TPopupMenu;
    N2: TMenuItem;
    cxLabel2: TcxLabel;
    lbSex: TcxLabel;
    cxLabel3: TcxLabel;
    lbRojd: TcxLabel;
    cxGr: TcxGrid;
    TVPAC: TcxGridDBTableView;
    VFIO: TcxGridDBColumn;
    VROJD: TcxGridDBColumn;
    VNUMBER: TcxGridDBColumn;
    VTYPEDOC: TcxGridDBColumn;
    VSOS: TcxGridDBColumn;
    cxGrLevel1: TcxGridLevel;
    cxLabel4: TcxLabel;
    cxGroupBox1: TcxGroupBox;
    rbAmb: TcxRadioButton;
    rbStac: TcxRadioButton;
    rbAll: TcxRadioButton;
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
    procedure odsPacAfterScroll(DataSet: TDataSet);
    procedure TVPACKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure odsPacAfterOpen(DataSet: TDataSet);
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
uses fMain;

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
      if rbAmb.Checked = True then //поиск амбулаторных
        begin
          odsPac.DeleteVariables;
          odsPac.Close;
          odsPac.SQL.Text := ' SELECT TAMBULANCE.FK_PEPLID AS FK_ID, '+ #13 +
                             '        TAMBULANCE.FC_FAM||'' ''||TAMBULANCE.FC_IM||'' ''||TAMBULANCE.FC_OTCH FIO, '+ #13 +
		                         '        DECODE(TO_CHAR(TAMBULANCE.FD_ROJD, ''dd.mm.yyyy hh24:mi:ss''), ''00.00.0000 00:00:00'', TRUNC(SYSDATE), TAMBULANCE.FD_ROJD) FD_ROJD, '+ #13 +
                             '        TUSLVID.FC_NAME, '+ #13 +
                             '        ASU.PKG_REGIST_PEPLFUNC.GET_PEPL_SEX(TAMBULANCE.FK_PEPLID) SEX, '+ #13 +
                             '        ASU.GET_IB(TAMBULANCE.FK_ID) AS NIB, '+ #13 +
                             '        ''Амбулаторное лечение'' STEK_COC, '+ #13 +
                             '        TAMBULANCE.FK_ID PACID, '+ #13 +
                             '        1 AS IS_AMBULANCE, '+ #13 +
                             '        0 AS FP_TEK_COC, '+ #13 +
                             '        TUSLVID.FK_ID AS USLID '+ #13 +
                             '   FROM ASU.TAMBULANCE, ASU.TDOCOBSL, ASU.TUSLVID '+ #13 +
                             '  WHERE TAMBULANCE.FC_FAM LIKE ''' + TRIM(SFAM) + '%'' '+ #13 +
                             '    AND NVL(TAMBULANCE.FC_IM,'' '') LIKE ''' + TRIM(SIM) + '%'' '+ #13 +
                             '    AND NVL(TAMBULANCE.FC_OTCH,'' '') LIKE ''' + TRIM(SOTCH) + '%'' '+ #13 +
                             '    AND TAMBULANCE.FK_DOCOBSL = TDOCOBSL.FK_ID '+ #13 +
                             '    AND TDOCOBSL.FK_VIDDOCID = TUSLVID.FK_ID '+ #13 ;
          odsPac.Open;
        end;
      if rbStac.Checked = True then //поиск стационарных
        begin
          odsPac.DeleteVariables;
          odsPac.Close;
          odsPac.SQL.Text := ' SELECT TKARTA.FK_PEPLID AS FK_ID, '+ #13 +
                             '        TKARTA.FC_FAM||'' ''||TKARTA.FC_IM||'' ''||TKARTA.FC_OTCH FIO, '+ #13 +
		                         '        DECODE(TO_CHAR(TKARTA.FD_ROJD, ''dd.mm.yyyy hh24:mi:ss''), ''00.00.0000 00:00:00'', TRUNC(SYSDATE), TKARTA.FD_ROJD) FD_ROJD, '+ #13 +
                             '        TUSLVID.FC_NAME, '+ #13 +
                             '        ASU.PKG_REGIST_PEPLFUNC.GET_PEPL_SEX(TKARTA.FK_PEPLID) SEX, '+ #13 +
                             '        ASU.GET_IB(TKARTA.FK_ID) AS NIB, '+ #13 +
                             '        DECODE(TKARTA.FP_TEK_COC,3,''Выписан'',2,''В стационаре'',-2,''На оформлении ПО'','''') STEK_COC, '+ #13 +
                             '        TKARTA.FK_ID PACID, '+ #13 +
                             '        0 AS IS_AMBULANCE, '+ #13 +
                             '        TKARTA.FP_TEK_COC, '+ #13 +
                             '        TUSLVID.FK_ID AS USLID '+ #13 +
                             '   FROM ASU.TKARTA, ASU.TPERESEL, ASU.TDOCOBSL, ASU.TUSLVID '+ #13 +
                             '  WHERE TKARTA.FC_FAM LIKE ''' + TRIM(SFAM) + '%'' '+ #13 +
                             '    AND NVL(TKARTA.FC_IM,'' '') LIKE ''' + TRIM(SIM) + '%'' '+ #13 +
                             '    AND NVL(TKARTA.FC_OTCH,'' '') LIKE ''' + TRIM(SOTCH) + '%'' '+ #13 +
                             '    AND GET_MAXPERESELID(TKARTA.FK_ID) = TPERESEL.FK_ID '+ #13 +
                             '    AND TPERESEL.FK_DOCOBSLID = TDOCOBSL.FK_ID '+ #13 +
                             '    AND TDOCOBSL.FK_VIDDOCID = TUSLVID.FK_ID '+ #13 +
                             '    AND TKARTA.FP_TEK_COC <> 3 '+ #13 +
                             '  ORDER BY FIO ';
          odsPac.Open;
        end;
      if rbAll.Checked = True then // поиск по всем (и амбулаторным, и стационарным)
        begin
          odsPac.DeleteVariables;
          odsPac.Close;
          odsPac.SQL.Text := ' SELECT TAMBULANCE.FK_PEPLID AS FK_ID, '+ #13 +
                             '        TAMBULANCE.FC_FAM||'' ''||TAMBULANCE.FC_IM||'' ''||TAMBULANCE.FC_OTCH FIO, '+ #13 +
		                         '        DECODE(TO_CHAR(TAMBULANCE.FD_ROJD, ''dd.mm.yyyy hh24:mi:ss''), ''00.00.0000 00:00:00'', TRUNC(SYSDATE), TAMBULANCE.FD_ROJD) FD_ROJD, '+ #13 +
                             '        TUSLVID.FC_NAME, '+ #13 +
                             '        ASU.PKG_REGIST_PEPLFUNC.GET_PEPL_SEX(TAMBULANCE.FK_PEPLID) SEX, '+ #13 +
                             '        ASU.GET_IB(TAMBULANCE.FK_ID) AS NIB, '+ #13 +
                             '        ''Амбулаторное лечение'' STEK_COC, '+ #13 +
                             '        TAMBULANCE.FK_ID PACID, '+ #13 +
                             '        1 AS IS_AMBULANCE, '+ #13 +
                             '        0 AS FP_TEK_COC, '+ #13 +
                             '        TUSLVID.FK_ID AS USLID '+ #13 +
                             '   FROM ASU.TAMBULANCE, ASU.TDOCOBSL, ASU.TUSLVID '+ #13 +
                             '  WHERE TAMBULANCE.FC_FAM LIKE ''' + TRIM(SFAM) + '%'' '+ #13 +
                             '    AND NVL(TAMBULANCE.FC_IM,'' '') LIKE ''' + TRIM(SIM) + '%'' '+ #13 +
                             '    AND NVL(TAMBULANCE.FC_OTCH,'' '') LIKE ''' + TRIM(SOTCH) + '%'' '+ #13 +
                             '    AND TAMBULANCE.FK_DOCOBSL = TDOCOBSL.FK_ID '+ #13 +
                             '    AND TDOCOBSL.FK_VIDDOCID = TUSLVID.FK_ID '+ #13 +
                             ' UNION ALL '+
                             ' SELECT TKARTA.FK_PEPLID AS FK_ID, '+ #13 +
                             '        TKARTA.FC_FAM||'' ''||TKARTA.FC_IM||'' ''||TKARTA.FC_OTCH FIO, '+ #13 +
		                         '        DECODE(TO_CHAR(TKARTA.FD_ROJD, ''dd.mm.yyyy hh24:mi:ss''), ''00.00.0000 00:00:00'', TRUNC(SYSDATE), TKARTA.FD_ROJD) FD_ROJD, '+ #13 +
                             '        TUSLVID.FC_NAME, '+ #13 +
                             '        ASU.PKG_REGIST_PEPLFUNC.GET_PEPL_SEX(TKARTA.FK_PEPLID) SEX, '+ #13 +
                             '        ASU.GET_IB(TKARTA.FK_ID) AS NIB, '+ #13 +
                             '        DECODE(TKARTA.FP_TEK_COC,3,''Выписан'',2,''В стационаре'',-2,''На оформлении ПО'','''') STEK_COC, '+ #13 +
                             '        TKARTA.FK_ID PACID, '+ #13 +
                             '        0 AS IS_AMBULANCE, '+ #13 +
                             '        TKARTA.FP_TEK_COC, '+ #13 +
                             '        TUSLVID.FK_ID AS USLID '+ #13 +
                             '   FROM ASU.TKARTA, ASU.TPERESEL, ASU.TDOCOBSL, ASU.TUSLVID '+ #13 +
                             '  WHERE TKARTA.FC_FAM LIKE ''' + TRIM(SFAM) + '%'' '+ #13 +
                             '    AND NVL(TKARTA.FC_IM,'' '') LIKE ''' + TRIM(SIM) + '%'' '+ #13 +
                             '    AND NVL(TKARTA.FC_OTCH,'' '') LIKE ''' + TRIM(SOTCH) + '%'' '+ #13 +
                             '    AND GET_MAXPERESELID(TKARTA.FK_ID) = TPERESEL.FK_ID '+ #13 +
                             '    AND TPERESEL.FK_DOCOBSLID = TDOCOBSL.FK_ID '+ #13 +
                             '    AND TDOCOBSL.FK_VIDDOCID = TUSLVID.FK_ID '+ #13 +
                             '    AND TKARTA.FP_TEK_COC <> 3 '+ #13 +
                             '  ORDER BY FIO ';
          odsPac.Open;
        end;
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
var Reg : TRegIniFile;
     id : Integer;
begin
  aSet.Enabled := FALSE;

  Reg:=TRegIniFile.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
  Reg.OpenKey('\Software\Softmaster\Diagnost\fSearchPeople\ID_SOTR'+IntToStr(frmMain.pSOTRID), True);
  id := Reg.ReadInteger('\Software\Softmaster\Diagnost\fSearchPeople\ID_SOTR'+IntToStr(frmMain.pSOTRID), 'ID_VIDPAC', 0);
  case id of
  0: rbAmb.Checked := True;
  1: rbStac.Checked := True;
  2: rbAll.Checked := True;
  end;
  Reg.Free;

  TVPAC.StoreToRegistry('\SoftWare\SoftMaster\FLUORO\TVPACSEARCHPEOPLE'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID)+'Default', TRUE, [], 'TVPACSEARCHPEOPLE');
  TVPAC.RestoreFromRegistry('\SoftWare\SoftMaster\FLUORO\TVPACSEARCHPEOPLE'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID), FALSE, FALSE, [], 'TVPACSEARCHPEOPLE');
end;

procedure TfrmSearchPeople.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var Reg : TRegIniFile;
begin
  Reg := TRegIniFile.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
  if not Reg.OpenKey('\Software\Softmaster\Diagnost\fSearchPeople\', FALSE) then
   begin
     Reg.CreateKey('\Software\Softmaster\Diagnost\fSearchPeople');
   end;
  try
    if rbAmb.Checked then
      Reg.WriteInteger('\Software\Softmaster\Diagnost\fSearchPeople'+'\ID_SOTR'+IntToStr(frmMain.pSOTRID), 'ID_VIDPAC', 0);
    if rbStac.Checked then
      Reg.WriteInteger('\Software\Softmaster\Diagnost\fSearchPeople'+'\ID_SOTR'+IntToStr(frmMain.pSOTRID), 'ID_VIDPAC', 1);
    if rbAll.Checked then
      Reg.WriteInteger('\Software\Softmaster\Diagnost\fSearchPeople'+'\ID_SOTR'+IntToStr(frmMain.pSOTRID), 'ID_VIDPAC', 2);
  except
  end;
  Reg.Free;

  TVPAC.StoreToRegistry('\SoftWare\SoftMaster\FLUORO\TVPACSEARCHPEOPLE'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID), TRUE, [], 'TVPACSEARCHPEOPLE');
end;

procedure TfrmSearchPeople.FormCreate(Sender: TObject);
begin
  russian:=LoadKeyboardLayout('00000419', 0);
end;

procedure TfrmSearchPeople.N2Click(Sender: TObject);
begin
  TVPAC.RestoreFromRegistry('\SoftWare\SoftMaster\FLUORO\TVPACSEARCHPEOPLE'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID)+'Default', FALSE, FALSE, [], 'TVPACSEARCHPEOPLE');
end;

procedure TfrmSearchPeople.odsPacAfterOpen(DataSet: TDataSet);
begin
  if odsPac.RecordCount = 0 then
    begin
      lbSex.Caption := '--';
      lbRojd.Caption := '--';
    end;
end;

procedure TfrmSearchPeople.odsPacAfterScroll(DataSet: TDataSet);
begin
  lbSex.Caption := odsPac.FieldByName('SEX').AsString;
  lbRojd.Caption := DateTimeToStr(odsPac.FieldByName('FD_ROJD').AsDateTime);
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

procedure TfrmSearchPeople.TVPACKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    begin
      if odsPac.RecordCount > 0 then
        begin
          aSetExecute(nil);
        end;
    end;
end;

end.
