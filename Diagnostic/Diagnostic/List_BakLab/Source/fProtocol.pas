unit fProtocol;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxEdit, cxLabel, cxDBLookupComboBox,
  cxTextEdit, cxSpinEdit, cxCalendar, cxTimeEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxVGrid, cxControls, cxInplaceContainer, OracleData, Oracle,
  ExtCtrls, dxSkinsdxBarPainter, cxClasses, dxBar, RVScroll, RichView, RVEdit,
  cxCheckBox, cxBarEditItem, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxContainer, cxMemo, ActnList, dxSkinOffice2007Green, cxRadioGroup;

type
  TfrmProtocol = class(TForm)
    VerGr: TcxVerticalGrid;
    catPac: TcxCategoryRow;
    merFIOMK: TcxMultiEditorRow;
    merDateAgeSex: TcxMultiEditorRow;
    cxStyleRepository1: TcxStyleRepository;
    stFIO: TcxStyle;
    rowNum: TcxEditorRow;
    rowIssl: TcxEditorRow;
    stIssl: TcxStyle;
    Panel2: TPanel;
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    dxBarDockControl2: TdxBarDockControl;
    BMBar1: TdxBar;
    BMBar2: TdxBar;
    rveText: TRichViewEdit;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    cxVerticalGrid1: TcxVerticalGrid;
    catPodpis: TcxCategoryRow;
    merDateTime: TcxMultiEditorRow;
    rowLaborant: TcxEditorRow;
    rowVrach: TcxEditorRow;
    cxBarEditItem1: TcxBarEditItem;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton7: TdxBarButton;
    bbOk: TcxButton;
    bbCancel: TcxButton;
    bbPrint: TcxButton;
    Panel1: TPanel;
    dxBarDockControl3: TdxBarDockControl;
    dxBarDockControl4: TdxBarDockControl;
    BMBar3: TdxBar;
    BMBar4: TdxBar;
    cxBarEditItem2: TcxBarEditItem;
    dxBarButton8: TdxBarButton;
    cxTextResume: TcxMemo;
    al: TActionList;
    aSave: TAction;
    aCancel: TAction;
    aPrint: TAction;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
  private
    pPACID, pPEPLID, PSMIDID, pNAZID : Integer;
    { Private declarations }
  public
    procedure DoShowForm(nPACID, nPEPLID, nSMIDID, nNAZID : Integer);
    { Public declarations }
  end;

var
  frmProtocol: TfrmProtocol;

implementation
uses fMain;
{$R *.dfm}

{ TfrmProtocol }

procedure TfrmProtocol.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmProtocol.aPrintExecute(Sender: TObject);
begin
//
end;

procedure TfrmProtocol.aSaveExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmProtocol.DoShowForm(nPACID, nPEPLID, nSMIDID, nNAZID: Integer);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    Screen.Cursor := crSQLWait;
    pPACID := nPACID;
    pPEPLID := nPEPLID;
    PSMIDID := nSMIDID;
    pNAZID := nNAZID;
    ods.Session := frmMain.os;
    ods.SQL.Text := ' SELECT FC_FAM||'' ''||FC_IM||'' ''||FC_OTCH AS FIO, '+#13#10+
                    '        TO_CHAR(FD_ROJD, ''DD.MM.YYYY'') AS DATE_BIRTH, '+#13#10+
                    '        DECODE(FP_SEX, 0, ''Женский'', 1, ''Мужской'', -1, ''Не определен'') AS SEX, '+#13#10+
                    '        TRUNC(MONTHS_BETWEEN(SYSDATE,FD_ROJD)/12) AS AGE, '+#13#10+
                    '        ASU.GET_IB(:PFK_PACID) AS NUMMK '+#13#10+
                    '   FROM ASU.TPEOPLES WHERE FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pPEPLID);
    ods.DeclareAndSet('PFK_PACID', otInteger, pPACID);
    ods.Open;
    merFIOMK.Properties.Editors[0].Value := ods.FieldByName('FIO').AsString;
    merFIOMK.Properties.Editors[1].Value := ods.FieldByName('NUMMK').AsString;
    merDateAgeSex.Properties.Editors[0].Value := ods.FieldByName('DATE_BIRTH').AsString;
    merDateAgeSex.Properties.Editors[1].Value := ods.FieldByName('AGE').AsString;
    merDateAgeSex.Properties.Editors[2].Value := ods.FieldByName('SEX').AsString;
  finally
    Screen.Cursor := crDefault;
  end;
end;

end.
