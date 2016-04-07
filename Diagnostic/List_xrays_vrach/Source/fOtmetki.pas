unit fOtmetki;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, cxControls, cxContainer, cxEdit, cxLabel,
  ExtCtrls, cxMemo, cxRichEdit, cxTextEdit, cxGraphics, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxSpinEdit, cxGroupBox, cxCheckGroup, cxCalendar, ActnList, DB,
  OracleData, cxCurrencyEdit, Oracle, Menus, cxLookAndFeelPainters,
  StdCtrls, cxButtons, frxClass, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinsdxBarPainter, cxClasses, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxDBData, cxCheckBox, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxGrid, cxTL, cxInplaceContainer, cxDBTL, cxTLData, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue;

type
  TfrmOtmetki = class(TForm)
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    bbSave: TdxBarButton;
    bbCancel: TdxBarButton;
    Panel2: TPanel;
    cxLabel3: TcxLabel;
    cxResume: TcxRichEdit;
    cxLabel4: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxDSsovpalo: TcxLookupComboBox;
    cxSotr: TcxLookupComboBox;
    cxDate: TcxDateEdit;
    al: TActionList;
    aSave: TAction;
    aCancel: TAction;
    odsDSsovpalo: TOracleDataSet;
    dsDSsovpalo: TDataSource;
    odsDSposle: TOracleDataSet;
    dsDSposle: TDataSource;
    odsResumeSovpalo: TOracleDataSet;
    dsResumeSovpalo: TDataSource;
    odsSotr: TOracleDataSet;
    dsSotr: TDataSource;
    pmZakl: TPopupMenu;
    odsVyavleno: TOracleDataSet;
    dsVyavleno: TDataSource;
    bbResume: TcxButton;
    aResume: TAction;
    actPrint: TAction;
    bbPrint: TdxBarButton;
    frxRepOtmetki: TfrxReport;
    BMBar2: TdxBar;
    bbOK: TdxBarButton;
    bbOut: TdxBarButton;
    odsVyavlenoFL_CHECK: TFloatField;
    odsVyavlenoFK_ID: TFloatField;
    odsVyavlenoFC_NAME: TStringField;
    memVyav: TcxMemo;
    bbVyavleno: TcxButton;
    lbVyav: TcxLabel;
    cxLabel8: TcxLabel;
    cxDSposle: TcxLookupComboBox;
    cxLabel10: TcxLabel;
    cxDSAnatom: TcxMemo;
    cxLabel9: TcxLabel;
    cxResumesovpalo: TcxLookupComboBox;
    paVyavleno: TPanel;
    dxBarDockControl2: TdxBarDockControl;
    cxTreeNaz: TcxDBTreeList;
    cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn2: TcxDBTreeListColumn;
    odsNapr: TOracleDataSet;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField1: TStringField;
    cxLabel1: TcxLabel;
    cxNumIssl: TcxLabel;
    cxlbDays: TcxLabel;
    cxLabel2: TcxLabel;
    cxDS: TcxRichEdit;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure aResumeExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure frxRepOtmetkiGetValue(const VarName: String;
      var Value: Variant);
    procedure odsSotrBeforeOpen(DataSet: TDataSet);
    procedure bbVyavlenoClick(Sender: TObject);
    procedure cxLabel1Click(Sender: TObject);
    procedure bbOKClick(Sender: TObject);
    procedure bbOutClick(Sender: TObject);
    procedure cxlbDaysClick(Sender: TObject);
    procedure cxLabel2Click(Sender: TObject);
    procedure cxNumIsslClick(Sender: TObject);
    procedure cxDSClick(Sender: TObject);
    procedure cxLabel3Click(Sender: TObject);
    procedure cxResumeClick(Sender: TObject);
    procedure cxLabel4Click(Sender: TObject);
    procedure cxDSsovpaloClick(Sender: TObject);
    procedure cxLabel6Click(Sender: TObject);
    procedure cxSotrClick(Sender: TObject);
    procedure cxLabel7Click(Sender: TObject);
    procedure cxDateClick(Sender: TObject);
    procedure lbVyavClick(Sender: TObject);
    procedure cxLabel8Click(Sender: TObject);
    procedure cxDSposleClick(Sender: TObject);
    procedure cxLabel9Click(Sender: TObject);
    procedure cxResumesovpaloClick(Sender: TObject);
    procedure cxLabel10Click(Sender: TObject);
    procedure cxDSAnatomClick(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure cxDSsovpaloMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cxTreeNazExit(Sender: TObject);
    procedure cxSotrMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cxDateMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cxDSposleMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cxResumesovpaloMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cxTreeNazKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    pKABID : Integer;
    pNAZID : Integer;
    pPACID : Integer;
    IDSMID, IDOWNER : Integer;
    odsZakl : TOracleDataSet;
    sPacFio_4_Rep : String;
    sNameIssl_4_Rep : String;
    ArrNazID : array of Integer;
    procedure DoSetEditRights;
    procedure DoVyavleno(pKABID : Integer);
    procedure DoInsertEditParametersNaz(pKABID : Integer);
    procedure DoTypeParametersNaz;
    procedure DoTypeDiag;
    procedure DoMemoText(Sender : TObject);
    procedure DoTypeSotr;
    procedure DoTypeResume;
    { Private declarations }
  public
    procedure DoShowfrmOtmetki(nNAZID, nPACID, nKABID : Integer);
    { Public declarations }
  end;

var
  frmOtmetki: TfrmOtmetki;

implementation
uses fMain, fSetResume;
{$R *.dfm}

procedure TfrmOtmetki.aSaveExecute(Sender: TObject);
begin
  DoInsertEditParametersNaz(pKABID);
  ModalResult := MrOK;
end;

procedure TfrmOtmetki.bbOKClick(Sender: TObject);
var i : Integer;
    c : Integer;
begin
  memVyav.Clear;
  SetLength(ArrNazID, 0);
  SetLength(ArrNazID, dsVyavleno.DataSet.RecordCount);
  i:=0;
  c:=1;
  dsVyavleno.DataSet.First;
  while not dsVyavleno.DataSet.EOF do
    begin
      if dsVyavleno.DataSet.FieldByName('FL_CHECK').AsInteger = 1 then
        begin
          ArrNazID[i] := dsVyavleno.DataSet.FieldByName('FK_ID').AsInteger;
          memVyav.Text := memVyav.Text+IntToStr(c)+'. '+dsVyavleno.DataSet.FieldByName('FC_NAME').AsString+#13#10;
          i:=i+1;
          c:=c+1;
        end;
      dsVyavleno.DataSet.Next;
    end;
  paVyavleno.Visible := False;
  bbVyavleno.SetFocus;
end;

procedure TfrmOtmetki.bbOutClick(Sender: TObject);
begin
  paVyavleno.Visible := False;
  bbVyavleno.SetFocus;
end;

procedure TfrmOtmetki.bbVyavlenoClick(Sender: TObject);
begin
  paVyavleno.Left := memVyav.Left;
  paVyavleno.Top := memVyav.Top;
  paVyavleno.Visible := True;
  cxTreeNaz.SetFocus; 
end;

procedure TfrmOtmetki.cxDateClick(Sender: TObject);
begin
if paVyavleno.Visible = True then
    paVyavleno.Visible := False;
end;

procedure TfrmOtmetki.cxDateMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if paVyavleno.Visible = True then
    paVyavleno.Visible := False;
end;

procedure TfrmOtmetki.cxDSAnatomClick(Sender: TObject);
begin
if paVyavleno.Visible = True then
    paVyavleno.Visible := False;
end;

procedure TfrmOtmetki.cxDSClick(Sender: TObject);
begin
  if paVyavleno.Visible = True then
    paVyavleno.Visible := False;
end;

procedure TfrmOtmetki.cxDSposleClick(Sender: TObject);
begin
if paVyavleno.Visible = True then
    paVyavleno.Visible := False;
end;

procedure TfrmOtmetki.cxDSposleMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if paVyavleno.Visible = True then
    paVyavleno.Visible := False;
end;

procedure TfrmOtmetki.cxDSsovpaloClick(Sender: TObject);
begin
if paVyavleno.Visible = True then
    paVyavleno.Visible := False;
end;

procedure TfrmOtmetki.cxDSsovpaloMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if paVyavleno.Visible = True then
    paVyavleno.Visible := False;
end;

procedure TfrmOtmetki.cxLabel10Click(Sender: TObject);
begin
if paVyavleno.Visible = True then
    paVyavleno.Visible := False;
end;

procedure TfrmOtmetki.lbVyavClick(Sender: TObject);
begin
if paVyavleno.Visible = True then
    paVyavleno.Visible := False;
end;

procedure TfrmOtmetki.cxLabel1Click(Sender: TObject);
begin
  if paVyavleno.Visible = True then
    paVyavleno.Visible := False;
end;

procedure TfrmOtmetki.cxLabel2Click(Sender: TObject);
begin
  if paVyavleno.Visible = True then
    paVyavleno.Visible := False;
end;

procedure TfrmOtmetki.cxLabel3Click(Sender: TObject);
begin
  if paVyavleno.Visible = True then
    paVyavleno.Visible := False;
end;

procedure TfrmOtmetki.cxLabel4Click(Sender: TObject);
begin
if paVyavleno.Visible = True then
    paVyavleno.Visible := False;
end;

procedure TfrmOtmetki.cxLabel6Click(Sender: TObject);
begin
if paVyavleno.Visible = True then
    paVyavleno.Visible := False;
end;

procedure TfrmOtmetki.cxLabel7Click(Sender: TObject);
begin
if paVyavleno.Visible = True then
    paVyavleno.Visible := False;
end;

procedure TfrmOtmetki.cxLabel8Click(Sender: TObject);
begin
if paVyavleno.Visible = True then
    paVyavleno.Visible := False;
end;

procedure TfrmOtmetki.cxLabel9Click(Sender: TObject);
begin
if paVyavleno.Visible = True then
    paVyavleno.Visible := False;
end;

procedure TfrmOtmetki.cxlbDaysClick(Sender: TObject);
begin
  if paVyavleno.Visible = True then
    paVyavleno.Visible := False;
end;

procedure TfrmOtmetki.cxNumIsslClick(Sender: TObject);
begin
  if paVyavleno.Visible = True then
    paVyavleno.Visible := False;
end;

procedure TfrmOtmetki.cxResumeClick(Sender: TObject);
begin
  if paVyavleno.Visible = True then
    paVyavleno.Visible := False;
end;

procedure TfrmOtmetki.cxResumesovpaloClick(Sender: TObject);
begin
if paVyavleno.Visible = True then
    paVyavleno.Visible := False;
end;

procedure TfrmOtmetki.cxResumesovpaloMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if paVyavleno.Visible = True then
    paVyavleno.Visible := False;
end;

procedure TfrmOtmetki.cxSotrClick(Sender: TObject);
begin
if paVyavleno.Visible = True then
    paVyavleno.Visible := False;
end;

procedure TfrmOtmetki.cxSotrMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if paVyavleno.Visible = True then
    paVyavleno.Visible := False;
end;

procedure TfrmOtmetki.cxTreeNazExit(Sender: TObject);
begin
  if paVyavleno.Visible = True then
    paVyavleno.Visible := False;
end;

procedure TfrmOtmetki.cxTreeNazKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F2 then
    begin
      bbOKClick(nil);
    end;
  if Key = VK_ESCAPE then
    begin
      bbOutClick(nil);
    end;
end;

procedure TfrmOtmetki.aCancelExecute(Sender: TObject);
begin
  ModalResult := MrCancel;
end;

procedure TfrmOtmetki.DoSetEditRights;
var ods : TOracleDataSet;
    kolvoParam : Integer;
    kolvoDays : Integer;
begin
  if frmMain.bIsAdmin <> 1 then
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.SQL.Text := ' SELECT FC_VALUE FROM asu.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''KOLVODAYS_EDIT'' ';
        ods.Open;
        kolvoParam := StrToInt(ods.FieldByName('FC_VALUE').AsString);
        ods.DeleteVariables;
        ods.Close;
        ods.SQL.Text := ' SELECT ROUND(sysdate - (SELECT MAX(FD_DATE) FROM asu.TPODPISNAZ WHERE FK_SOS = GET_VIPNAZ AND FK_NAZID = :PFK_NAZID)) AS CNT FROM TNAZIS WHERE FK_ID = :PFK_NAZID ';
        ods.DeclareAndSet('PFK_NAZID', otInteger, pNAZID);
        ods.Open;
        kolvoDays := ods.FieldByName('CNT').AsInteger;
        if KolvoDays >= kolvoParam then
          begin
            cxLbDays.Visible := True;
            cxLbDays.Caption := ' Прошло более '+IntToStr(KolvoParam)+' суток! Изменить отметки нельзя! ';
            cxResume.Enabled := False;
            aResume.Enabled := False;
            cxDSsovpalo.Enabled := False;
            bbVyavleno.Enabled := False;
            memVyav.Enabled := False;
            cxSotr.Enabled := False;
            cxDate.Enabled := False;
            cxDSposle.Enabled := False;
            cxResumesovpalo.Enabled := False;
            aSave.Enabled := False;
          end else
          begin
            cxLbDays.Visible := False;
            cxLbDays.Caption := '';
            cxResume.Enabled := True;
            aResume.Enabled := True;
            cxDSsovpalo.Enabled := True;
            bbVyavleno.Enabled := True;
            memVyav.Enabled := True;
            cxSotr.Enabled := True;
            cxDate.Enabled := True;
            cxDSposle.Enabled := True;
            cxResumesovpalo.Enabled := True;
            aSave.Enabled := True;
          end;
      finally
        ods.Free;
      end;
    end;
end;

procedure TfrmOtmetki.DoShowfrmOtmetki(nNAZID, nPACID, nKABID: Integer);
var i : TMenuItem;
begin
  try
    Screen.Cursor := crSQLWait;
//--- запоминаем константы
    pNAZID := nNAZID;
    pPACID := nPACID;
    pKABID := nKABID;
//--- графа выявлено показывается только в кабинете маммографии
//    memVyav.Visible := nKABID = frmMain.GET_XRAY_MAMMOGRAF;
    memVyav.Visible := nKABID <> frmMain.get_xray_mrtkab;
    lbVyav.Visible := memVyav.Visible;
    bbVyavleno.Visible := memVyav.Visible;
    if (nKABID = frmMain.GET_XRAY_MAMMOGRAF) or (nKABID = frmMain.GET_XRAY_MAMMOGRAF2) then
      begin
        lbVyav.Caption := 'Выявлено:';
        dsVyavleno.DataSet := odsVyavleno;
      end else
      begin
        lbVyav.Caption := 'Направлен:';
        dsVyavleno.DataSet := odsNapr;
      end;

    DoTypeDiag;
    DoTypeParametersNaz;
    DoTypeSotr;
    DoTypeResume;

    if memVyav.Visible = True then
      DoVyavleno(nKABID);
    try
      odsZakl := TOracleDataSet.Create(nil);
      odsZakl.Session := frmMain.os;
      odsZakl.SQL.Text := ' SELECT FK_ID, FC_NAME, FK_OWNER '+#13+
                          '   FROM ASU.TSMID '+#13+
                          '  WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''RESUME_OTMETKI'') ';
      odsZakl.Open;
      while not odsZakl.Eof do
        begin
          i := TMenuItem.Create(pmZakl);
          i.Caption := odsZakl.FieldByName('FC_NAME').AsString;
          i.Tag := odsZakl.FieldByName('FK_ID').AsInteger;
          i.OnClick := DoMemoText;
          pmZakl.Items.Add(i);
          odsZakl.Next;
        end;
    except
    end;
    DoSetEditRights;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmOtmetki.DoInsertEditParametersNaz(pKABID : Integer);
var oqNaz, oqDel : TOracleQuery;
    i : Integer;
begin
  if pNAZID <> 0 then // !!! лишнее условие
    begin
      oqNaz := TOracleQuery.Create(nil);
      try
        oqNaz.Session := frmMain.os;
        oqNaz.Cursor := crSQLWait;
        if cxDSsovpalo.Text <> '' then //совпадение с направительным диагнозом
          begin
            oqNaz.DeleteVariables;
            oqNaz.SQL.Text := ' DECLARE '+
                              '   Cnt1 NUMBER; '+
                              ' BEGIN '+
                              '   SELECT COUNT(FK_ID) INTO Cnt1 FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''NAPRAVDIAG_SOVPALO'')); '+
                              ' IF Cnt1 > 0 THEN '+
                              '   UPDATE TIB SET FK_SMID = :pFK_SMID1, FK_SMEDITID =:pFK_SMEDITID1, FK_VRACHID =:pFK_VRACHID WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''NAPRAVDIAG_SOVPALO'')); '+
                              ' ELSE '+
                              '   INSERT INTO TIB(FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_ID, :pFK_SMID1, :pFK_SMEDITID1, :pFK_VRACHID); '+
                              ' END IF; '+
                              ' END; ';
            oqNaz.DeclareAndSet('PFK_ID', otInteger, pNAZID);
            oqNaz.DeclareAndSet('pFK_SMID1', otInteger, cxDSsovpalo.EditValue);
            oqNaz.DeclareAndSet('pFK_SMEDITID1', otInteger, cxDSsovpalo.EditValue);
            oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
            oqNaz.Execute;
            frmMain.os.Commit;
          end;
        if cxDSposle.Text <> '' then //заключительный диагноз после
          begin
            oqNaz.DeleteVariables;
            oqNaz.SQL.Text := ' DECLARE '+
                              '   Cnt3 NUMBER; '+
                              ' BEGIN '+
                              '   SELECT COUNT(FK_ID) INTO Cnt3 FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''DSZAKL_POSLE'')); '+
                              ' IF Cnt3 > 0 THEN '+
                              '   UPDATE TIB SET FK_SMID = :pFK_SMID3, FK_SMEDITID =:pFK_SMEDITID3, FK_VRACHID =:pFK_VRACHID WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''DSZAKL_POSLE'')); '+
                              ' ELSE '+
                              '   INSERT INTO TIB(FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_ID, :pFK_SMID3, :pFK_SMEDITID3, :pFK_VRACHID); '+
                              ' END IF; '+
                              ' END; ';
            oqNaz.DeclareAndSet('PFK_ID', otInteger, pNAZID);
            oqNaz.DeclareAndSet('pFK_SMID3', otInteger, cxDSposle.EditValue);
            oqNaz.DeclareAndSet('pFK_SMEDITID3', otInteger, cxDSposle.EditValue);
            oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
            oqNaz.Execute;
            frmMain.os.Commit;
          end;
        if cxResumesovpalo.Text <> '' then //Совпадение заключительного DS-а с заключением:
          begin
            oqNaz.DeleteVariables;
            oqNaz.SQL.Text := ' DECLARE '+
                              '   Cnt4 NUMBER; '+
                              ' BEGIN '+
                              '   SELECT COUNT(FK_ID) INTO Cnt4 FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''ZAKLDS_SOVPALO'')); '+
                              ' IF Cnt4 > 0 THEN '+
                              '   UPDATE TIB SET FK_SMID = :pFK_SMID4, FK_SMEDITID =:pFK_SMEDITID4, FK_VRACHID =:pFK_VRACHID WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''ZAKLDS_SOVPALO'')); '+
                              ' ELSE '+
                              '   INSERT INTO TIB(FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_ID, :pFK_SMID4, :pFK_SMEDITID4, :pFK_VRACHID); '+
                              ' END IF; '+
                              ' END; ';
            oqNaz.DeclareAndSet('PFK_ID', otInteger, pNAZID);
            oqNaz.DeclareAndSet('pFK_SMID4', otInteger, cxResumesovpalo.EditValue);
            oqNaz.DeclareAndSet('pFK_SMEDITID4', otInteger, cxResumesovpalo.EditValue);
            oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
            oqNaz.Execute;
            frmMain.os.Commit;
          end;
        if cxDate.Text <> '' then //дата
          begin
            oqNaz.DeleteVariables;
            oqNaz.SQL.Text := ' DECLARE '+
                              '   nSMID10 NUMBER; '+
                              '   Cnt10 NUMBER; '+
                              ' BEGIN '+
                              '   SELECT COUNT(FK_ID) INTO Cnt10 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''OTMETKI_DATE''); '+
                              ' IF Cnt10 > 0 THEN '+
                              '   UPDATE TIB SET FD_DATE = :pFD_DATE10, FK_VRACHID = :pFK_VRACHID WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''OTMETKI_DATE''); '+
                              ' ELSE '+
                              '   SELECT FK_ID INTO nSMID10 FROM TSMID WHERE FC_SYNONIM = ''OTMETKI_DATE''; '+
                              '   INSERT INTO TIB(FK_PACID, FD_DATE, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_ID, :PFD_DATE10, nSMID10, nSMID10, :pFK_VRACHID); '+
                              ' END IF; '+
                              ' END; ';
            oqNaz.DeclareAndSet('PFK_ID', otInteger, pNAZID);
            oqNaz.DeclareAndSet('pFD_DATE10', otDate, cxDate.Date);
            oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
            oqNaz.Execute;
            frmMain.os.Commit;
          end;
        if cxResume.Text <> '' then //ЗАКЛЮЧЕНИЕ
          begin
            oqNaz.DeleteVariables;
            oqNaz.SQL.Text := ' DECLARE '+
                              '   nSMID11 NUMBER; '+
                              '   Cnt11 NUMBER; '+
                              ' BEGIN '+
                              '   SELECT COUNT(FK_ID) INTO Cnt11 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''RESUME_OTMETKI''); '+
                              ' IF Cnt11 > 0 THEN '+
                              '   UPDATE TIB SET FN_NUM = :pFN_NUM11, FC_CHAR = :pFC_CHAR11, FK_VRACHID = :pFK_VRACHID WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''RESUME_OTMETKI''); '+
                              ' ELSE '+
                              '   SELECT FK_ID INTO nSMID11 FROM TSMID WHERE FC_SYNONIM = ''RESUME_OTMETKI''; '+
                              '   INSERT INTO TIB(FK_PACID, FN_NUM, FC_CHAR, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_ID, :pFN_NUM11, :PFC_CHAR11, nSMID11, nSMID11, :pFK_VRACHID); '+
                              ' END IF; '+
                              ' END; ';
            oqNaz.DeclareAndSet('PFK_ID', otInteger, pNAZID);
            oqNaz.DeclareAndSet('PFN_NUM11', otInteger, IDSMID);
            oqNaz.DeclareAndSet('pFC_CHAR11', otString, cxResume.Text);
            oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
            oqNaz.Execute;
            frmMain.os.Commit;
          end;
//------------------------------------------------------------------------------
      if cxSotr.Text <> '' then //Врач
        begin
          oqNaz.DeleteVariables;
          oqNaz.SQL.Text := ' DECLARE '+
                            '   nSMID15 NUMBER; '+
                            '   Cnt15 NUMBER; '+
                            ' BEGIN '+
                            '   SELECT COUNT(FK_ID) INTO Cnt15 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''OTMETKI_SOTR''); '+
                            ' IF Cnt15 > 0 THEN '+
                            '   UPDATE TIB SET FN_NUM = :pFN_NUM15, FK_VRACHID = :pFK_VRACHID WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''OTMETKI_SOTR''); '+
                            ' ELSE '+
                            '   SELECT FK_ID INTO nSMID15 FROM TSMID WHERE FC_SYNONIM = ''OTMETKI_SOTR''; '+
                            '   INSERT INTO TIB(FK_PACID, FN_NUM, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_ID, :pFN_NUM15, nSMID15, nSMID15, :pFK_VRACHID); '+
                            ' END IF; '+
                            ' END; ';
          oqNaz.DeclareAndSet('pFN_NUM15', otInteger, cxSotr.EditValue);
          oqNaz.DeclareAndSet('PFK_ID', otInteger, pNAZID);
          oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
          oqNaz.Execute;
          frmMain.os.Commit;
        end;
//------------------------------------------------------------------------------
      if memVyav.Visible = True then // выявлено (направлен)
        begin
          oqDel := TOracleQuery.Create(nil);
          try
            oqDel.Session := frmMain.os;
            oqDel.Cursor := crSQLWait;
            if (pKABID = frmMain.GET_XRAY_MAMMOGRAF) or (pKABID = frmMain.GET_XRAY_MAMMOGRAF2) then
              begin
                oqDel.SQL.Text := ' DELETE FROM asu.TIB '+
                                  '  WHERE FK_PACID = :PFK_PACID '+
                                  '    AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID '+
                                  '                     WHERE FK_ID <> (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''OTMETKI_VYAVLENO'') '+
                                  '                    START WITH FC_SYNONIM = ''OTMETKI_VYAVLENO'' '+
                                  '                    CONNECT BY PRIOR FK_ID = FK_OWNER) ';
              end else
              begin
                oqDel.SQL.Text := ' DELETE FROM asu.TIB '+
                                  '  WHERE FK_PACID = :PFK_PACID '+
                                  '    AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID '+
                                  '                     WHERE FK_ID <> (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_KUDA_NAPRAVLEN'') '+
                                  '                    START WITH FC_SYNONIM = ''XRAY_KUDA_NAPRAVLEN'' '+
                                  '                    CONNECT BY PRIOR FK_ID = FK_OWNER) ';
              end;
            oqDel.DeclareAndSet('PFK_PACID', otInteger, pNAZID);
            oqDel.Execute;
          finally
            oqDel.Free;
          end;
           for i := 0 to Length(ArrNazID) - 1 do
             if ArrNazID[i] <> 0 then
               begin
                 oqNaz.DeleteVariables;
                 oqNaz.SQL.Text := ' INSERT INTO ASU.TIB(FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID)'+
                                   ' VALUES(:pFK_ID, :pFK_SMID16, :pFK_SMEDITID16, :pFK_VRACHID) ';
                 oqNaz.DeclareAndSet('PFK_ID', otInteger, pNAZID);
                 oqNaz.DeclareAndSet('pFK_SMID16', otInteger, ArrNazID[i]);
                 oqNaz.DeclareAndSet('pFK_SMEDITID16', otInteger, ArrNazID[i]);
                 oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
                 oqNaz.Execute;
               end;
          frmMain.os.Commit;
        end;
      finally
        oqNaz.Free;
      end;
    end;
end;

procedure TfrmOtmetki.DoTypeParametersNaz;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' SELECT FK_NAZTYPEID, TRUNC(SYSDATE) AS SYS_DATE, '+
                    '       (SELECT MAX(FK_SMID) FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''NAPRAVDIAG_SOVPALO''))) AS SOVPALO_NAPRAV, '+
                    '       (SELECT MAX(FK_SMID) FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''DSZAKL_POSLE''))) AS ZAKL_POSLE, '+
                    '       (SELECT MAX(FK_SMID) FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''ZAKLDS_SOVPALO''))) AS SOVPALO_ZAKL, '+
                    '       (SELECT MAX(FC_CHAR) FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''NUMBER_ISSL'')) AS NUMISSL, '+
                    '       (SELECT MAX(FD_DATE) FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''OTMETKI_DATE'')) AS OTMETKI_DATE, '+
                    '       (SELECT MAX(FC_CHAR) FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''RESUME_OTMETKI'')) AS RESUME, '+
                    '       (SELECT PKG_LISTS.GET_DIAG_ANATOM(:PFK_PACID) FROM DUAL) AS DIAG_ANATOM '+
                    '   FROM ASU.TNAZIS WHERE FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pNAZID);
    ods.DeclareAndSet('PFK_PACID', otInteger, pPACID);
    ods.Open;
    cxDSsovpalo.EditValue := ods.FieldByName('SOVPALO_NAPRAV').AsInteger;
    if DateTimeToStr(ods.FieldByName('OTMETKI_DATE').AsDateTime) = '30.12.1899' then  //!!! пересмотреть это условие
      cxDate.Date := ods.FieldByName('SYS_DATE').AsDateTime
    else
      cxDate.Date := ods.FieldByName('OTMETKI_DATE').AsDateTime;
    cxDSposle.EditValue := ods.FieldByName('ZAKL_POSLE').AsInteger;
    cxResumesovpalo.EditValue := ods.FieldByName('SOVPALO_ZAKL').AsInteger;
    cxNumIssl.Caption := ods.FieldByName('NUMISSL').AsString;
    cxResume.Text := ods.FieldByName('RESUME').AsString;
    cxDSAnatom.Text := ods.FieldByName('DIAG_ANATOM').AsString;
  finally
    ods.Free;
  end;
end;

procedure TfrmOtmetki.DoTypeDiag;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' SELECT '+
                    '   DECODE((SELECT FC_CHAR FROM TIB WHERE FK_PACID = :PFK_NAZID AND FK_SMID = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_DIAGNOZ'')), '+
                    '           NULL, STAT.PKG_FRFORM30.GET_LAST_DIAG(:PFK_PACID), '+
                    '         (SELECT FC_CHAR FROM TIB WHERE FK_PACID = :PFK_NAZID AND FK_SMID = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_DIAGNOZ''))) AS DIAGMAIN '+
                    '  FROM DUAL ';
    ods.DeclareAndSet('PFK_NAZID', otInteger, pNAZID);
    ods.DeclareAndSet('PFK_PACID', otInteger, pPACID);
    ods.Open;

    cxDS.Text := ods.FieldByName('DIAGMAIN').AsString;
  finally
    ods.Free;
  end;
end;

procedure TfrmOtmetki.DoMemoText(Sender: TObject);
begin
  cxResume.Text := TMenuItem(Sender).Caption;
  IDSMID := TMenuItem(Sender).Tag;
  IDOWNER := odsZakl.FieldByName('FK_OWNER').AsInteger;
end;

procedure TfrmOtmetki.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  IDSMID := 0;
  IDOWNER := 0;
  odsZakl.Free;
end;

procedure TfrmOtmetki.FormCreate(Sender: TObject);
begin
  if odsDSsovpalo.Active = False then
    odsDSsovpalo.Active := True;
  if odsDSposle.Active = False then
    odsDSposle.Active := True;
  if odsVyavleno.Active = False then
    odsVyavleno.Active := True;
  if odsNapr.Active = False then
    odsNapr.Active := True;
  if odsResumeSovpalo.Active = False then
    odsResumeSovpalo.Active := True;
  if odsSotr.Active = False then
    odsSotr.Active := True;    
end;

procedure TfrmOtmetki.DoTypeSotr;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' SELECT MAX(FN_NUM) AS OTMETKI_SOTR FROM asu.TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''OTMETKI_SOTR'') ';
    ods.DeclareAndSet('PFK_ID', otInteger, pNAZID);
    ods.Open;
    if ods.FieldByName('OTMETKI_SOTR').AsInteger > 0 then
      cxSotr.EditValue := ods.FieldByName('OTMETKI_SOTR').AsInteger
    else
      cxSotr.EditValue := frmMain.pSOTRID;
  finally
    ods.Free;
  end;
end;

procedure TfrmOtmetki.DoVyavleno(pKABID : Integer);
var ods : TOracleDataSet;
      i : Integer;
      c : Integer;
begin
  if (pKABID = frmMain.GET_XRAY_MAMMOGRAF) or (pKABID = frmMain.GET_XRAY_MAMMOGRAF2) then
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.SQL.Text := ' SELECT FK_SMID, ASU.GET_SMIDNAME(FK_SMID) AS FC_NAME '+#13+
                        '   FROM ASU.TIB '+#13+
                        '  WHERE FK_PACID = :PFK_PACID '+#13+
                        '    AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID '+#13+
                        '                     WHERE FK_ID <> (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''OTMETKI_VYAVLENO'') '+#13+
                        '                    START WITH FC_SYNONIM = ''OTMETKI_VYAVLENO'' '+#13+
                        '                    CONNECT BY PRIOR FK_ID = FK_OWNER) ';
        ods.DeclareAndSet('PFK_PACID', otInteger, pNAZID);
        ods.Open;
        ods.First;
        SetLength(ArrNazID, 0);
        SetLength(ArrNazID, odsVyavleno.RecordCount);
        i:=0;
        c:=1;
        while not ods.Eof do
          begin
            ArrNazID[i] := ods.FieldByName('FK_SMID').AsInteger;
            memVyav.Text := memVyav.Text+IntToStr(c)+'. '+ods.FieldByName('FC_NAME').AsString+#13#10;
            odsVyavleno.Locate('FK_ID', ods.FieldByName('FK_SMID').AsInteger, []);
            odsVyavleno.Edit;
            odsVyavleno.FieldByName('FL_CHECK').AsInteger := 1;
            odsVyavleno.Post;
            i:=i+1;
            c:=c+1;
            ods.Next;
          end;
      finally
        ods.Free;
      end;
    end else
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.SQL.Text := ' SELECT FK_SMID, ASU.GET_SMIDNAME(FK_SMID) AS FC_NAME '+#13+
                        '   FROM ASU.TIB '+#13+
                        '  WHERE FK_PACID = :PFK_PACID '+#13+
                        '    AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID '+#13+
                        '                     WHERE FK_ID <> (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_KUDA_NAPRAVLEN'') '+#13+
                        '                    START WITH FC_SYNONIM = ''XRAY_KUDA_NAPRAVLEN'' '+#13+
                        '                    CONNECT BY PRIOR FK_ID = FK_OWNER) ';
        ods.DeclareAndSet('PFK_PACID', otInteger, pNAZID);
        ods.Open;
        ods.First;
        SetLength(ArrNazID, 0);
        SetLength(ArrNazID, odsNapr.RecordCount);
        i:=0;
        c:=1;
        while not ods.Eof do
          begin
            ArrNazID[i] := ods.FieldByName('FK_SMID').AsInteger;
            memVyav.Text := memVyav.Text+IntToStr(c)+'. '+ods.FieldByName('FC_NAME').AsString+#13#10;
            odsNapr.Locate('FK_ID', ods.FieldByName('FK_SMID').AsInteger, []);
            odsNapr.Edit;
            odsNapr.FieldByName('FL_CHECK').AsInteger := 1;
            odsNapr.Post;
            i:=i+1;
            c:=c+1;
            ods.Next;
          end;
      finally
        ods.Free;
      end;
    end;
end;

procedure TfrmOtmetki.DoTypeResume;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' DECLARE '+
                   '   nSMID11 NUMBER; '+
                   '   Cnt11 NUMBER; '+
                   ' BEGIN '+
                   '   SELECT COUNT(FK_ID) INTO Cnt11 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''RESUME_OTMETKI''); '+
                   ' IF Cnt11 > 0 THEN '+
                   '   SELECT MAX(FC_CHAR) INTO :VAL11 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''RESUME_OTMETKI'');'+
                   ' ELSE '+
                   '   SELECT MAX(FC_CHAR) INTO :VAL11 FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_VRACH_RESUME''); '+
                   ' END IF; '+
                   ' END; ';
   ods.DeclareAndSet('pFK_ID', otInteger, pNAZID);
   ods.DeclareVariable('VAL11', otString);
   ods.Open;

   cxResume.Text := ods.GetVariable('VAL11'); //FieldByName('VAL11').AsString;
  finally
    ods.Free;
  end;      
end;

procedure TfrmOtmetki.aResumeExecute(Sender: TObject);
begin
  if paVyavleno.Visible = True then
    paVyavleno.Visible := False;
  Application.CreateForm(TfrmSetResume, frmSetResume);
  frmSetResume.DoShowForm;
  frmSetResume.ShowModal;
  if frmSetResume.ModalResult = MrOK then
    begin
      cxResume.Text := cxResume.Text +' '+ frmSetResume.odsTree.FieldByName('FC_NAME').AsString;
    end;
  frmSetResume.Free;
end;

procedure TfrmOtmetki.actPrintExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  if paVyavleno.Visible = True then
    paVyavleno.Visible := False;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT ASU.PKG_REGIST_PACFUNC.GET_PAC_FULLFIO(:PFK_PACID) AS PACFIO, '+
                    '        (SELECT GET_NAME_RGISSL(FK_SMID) FROM asu.TNAZIS WHERE FK_ID=:PFK_ID) AS NAME_ISSL FROM DUAL ';
    ods.DeclareAndSet('PFK_PACID', otInteger, pPACID);
    ods.DeclareAndSet('PFK_ID', otInteger, pNAZID);
    ods.Open;
    sPacFio_4_Rep := ods.FieldByName('PACFIO').AsString;
    sNameIssl_4_Rep := ods.FieldByName('NAME_ISSL').AsString;
  finally
    ods.Free;
  end;
  frxRepOtmetki.ShowReport;
end;

procedure TfrmOtmetki.frxRepOtmetkiGetValue(const VarName: String; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'NUM_ISSL' then Value := cxNumIssl.Caption;
  if VarName = 'PACFIO' then Value := sPacFio_4_Rep;
  if VarName = 'DIAGNOZ' then Value := cxDS.Text;
  if VarName = 'NAME_ISSL' then Value := sNameIssl_4_Rep;
  if VarName = 'ZAKL' then Value := cxResume.Text;
  if VarName = 'DATE_ISSL' then Value := cxDate.Date;
  if VarName = 'NAPRAV_SOVPALO' then Value := cxDSsovpalo.Text;
  if VarName = 'VRACH' then Value := cxSotr.Text;
  if VarName = 'ZAKL_POSLE' then Value := cxDSposle.Text;
  if VarName = 'ZAKL_ZAKL' then Value := cxResumesovpalo.Text;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;  
end;

procedure TfrmOtmetki.odsSotrBeforeOpen(DataSet: TDataSet);
begin
  odsSotr.SetVariable('PFK_OTDELID', frmMain.pOTDELID);
end;

procedure TfrmOtmetki.Panel2Click(Sender: TObject);
begin
if paVyavleno.Visible = True then
    paVyavleno.Visible := False;
end;

end.
