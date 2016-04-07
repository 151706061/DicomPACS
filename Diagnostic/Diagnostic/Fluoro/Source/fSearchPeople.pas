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
  dxSkinOffice2007Green;

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
    VPACCOMPANY: TcxGridDBColumn;
    VPACPERIOD: TcxGridDBColumn;
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

  if trim(sFIO.Text) <> '' then // !!! пересмотреть запрос, может стоит TPERIOD_COMPANY вынести во FROM ???
    begin                       // c датой рождения тоже разобраться
      odsPac.DeleteVariables;
      odsPac.Close;
      odsPac.SQL.Text := ' SELECT TPEOPLES_COMPANY.FK_PEOPLEID, '+#13+
                         '        TPEOPLES_COMPANY.FK_COMPANYID, '+#13+
                         '        TPEOPLES_COMPANY.FK_PERIODID, '+#13+
                         '        (SELECT FC_SHORT FROM ASU.TCOMPANY WHERE FK_ID = TPEOPLES_COMPANY.FK_COMPANYID) AS COMPANYNAME, '+#13+
                         '        (SELECT FN_PRIZNAK FROM ASU.TPERIOD_COMPANY WHERE FK_ID = TPEOPLES_COMPANY.FK_COMPANYID) AS FN_PRIZNAK, '+#13+
                         '        TPERIOD_COMPANY.FC_NAME AS PERIOD, '+#13+
                         '        TPERIOD_COMPANY.FK_OWNER, '+#13+
                         '        TPEOPLES.FC_FAM||'' ''||TPEOPLES.FC_IM||'' ''||TPEOPLES.FC_OTCH AS FIO, '+#13+
                         '        DECODE(TO_CHAR((SELECT TPEOPLES.FD_ROJD FROM ASU.TPEOPLES WHERE FK_ID = TPEOPLES_COMPANY.FK_PEOPLEID), '+#13+
                         '        ''dd.mm.yyyy hh24:mi:ss''), ''00.00.0000 00:00:00'', TRUNC(SYSDATE), '+#13+
                         '        (SELECT TPEOPLES.FD_ROJD FROM ASU.TPEOPLES WHERE FK_ID = TPEOPLES_COMPANY.FK_PEOPLEID)) AS FD_ROJD '+#13+
                         '   FROM ASU.TPEOPLES_COMPANY, ASU.TPEOPLES, ASU.TPERIOD_COMPANY '+#13+
                         '  WHERE TPEOPLES.FK_ID = TPEOPLES_COMPANY.FK_PEOPLEID '+#13+
                         '    AND TPEOPLES_COMPANY.FK_PERIODID = TPERIOD_COMPANY.FK_ID '+#13+
                         '    AND TPEOPLES.FC_FAM LIKE ''' + TRIM(SFAM) + '%'' '+ #13 +
                         '    AND NVL(TPEOPLES.FC_IM,'' '') LIKE ''' + TRIM(SIM) + '%'' '+ #13 +
                         '    AND NVL(TPEOPLES.FC_OTCH,'' '') LIKE ''' + TRIM(SOTCH) + '%'' '+ #13 +
                         '    AND TPERIOD_COMPANY.FL_DEL = 0 '+#13+
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

  TVPAC.StoreToRegistry('\SoftWare\SoftMaster\FLUORO\TVPACSEARCHPEOPLE'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID)+'Default', TRUE, [], 'TVPACSEARCHPEOPLE');
  TVPAC.RestoreFromRegistry('\SoftWare\SoftMaster\FLUORO\TVPACSEARCHPEOPLE'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID), FALSE, FALSE, [], 'TVPACSEARCHPEOPLE');
end;

procedure TfrmSearchPeople.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
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
