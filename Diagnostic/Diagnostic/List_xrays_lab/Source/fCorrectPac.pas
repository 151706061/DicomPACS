unit fCorrectPac;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls, cxTextEdit,
  Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, dxSkinsCore, 
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, DB, cxDBData, cxImageComboBox, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, OracleData, ActnList;

type
  TfrmCorrectPac = class(TForm)
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    sFIO: TcxTextEdit;
    cxButton1: TcxButton;
    cxGr: TcxGrid;
    TVPAC: TcxGridDBTableView;
    VFIO: TcxGridDBColumn;
    VROJD: TcxGridDBColumn;
    VNUMBER: TcxGridDBColumn;
    VTYPEDOC: TcxGridDBColumn;
    VSOS: TcxGridDBColumn;
    VLASTFLU: TcxGridDBColumn;
    cxGrLevel1: TcxGridLevel;
    odsPac: TOracleDataSet;
    dsPac: TDataSource;
    Panel2: TPanel;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    al: TActionList;
    aSave: TAction;
    aCancel: TAction;
    aSearch: TAction;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure aSearchExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCorrectPac: TfrmCorrectPac;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmCorrectPac.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmCorrectPac.aSaveExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmCorrectPac.aSearchExecute(Sender: TObject);
var sFam, sIm, sOtch : String;
    strIm : String;
    flag : Integer;
begin
if sFIO.Text <> '' then
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
          odsPac.Close;
          odsPac.SQL.Text := ' SELECT TAMBULANCE.FK_PEPLID AS FK_ID, '+ #13 +
                             '        TAMBULANCE.FC_FAM||'' ''||TAMBULANCE.FC_IM||'' ''||TAMBULANCE.FC_OTCH FIO, '+ #13 +
														 '        DECODE(TO_CHAR(TAMBULANCE.FD_ROJD, ''dd.mm.yyyy hh24:mi:ss''), ''00.00.0000 00:00:00'', TRUNC(SYSDATE), TAMBULANCE.FD_ROJD) FD_ROJD, '+ #13 +
														 '        TUSLVID.FC_NAME, '+ #13 +
														 '        ASU.PKG_REGIST_PEPLFUNC.GET_PEPL_SEX(TAMBULANCE.FK_PEPLID) SEX, '+ #13 +
														 '        ASU.GET_IB(TAMBULANCE.FK_ID) AS NIB, '+ #13 +
														 '        ''Амбулаторное лечение'' STEK_COC, '+ #13 +
														 '        TAMBULANCE.FK_ID PACID, '+ #13 +
														 '        ASU.GET_LAST_FLUORO(TAMBULANCE.FK_PEPLID) AS LASTFLU, '+ #13 +
														 '        1 AS IS_AMBULANCE, '+ #13 +
														 '        0 AS FP_TEK_COC, '+ #13 +
														 '        TUSLVID.FK_ID AS USLID '+ #13 +
														 '   FROM ASU.TAMBULANCE, ASU.TDOCOBSL, ASU.TUSLVID '+ #13 +
														 '  WHERE TAMBULANCE.FC_FAM LIKE ''' + TRIM(SFAM) + '%'' '+ #13 +
														 '    AND NVL(TAMBULANCE.FC_IM,'' '') LIKE ''' + TRIM(SIM) + '%'' '+ #13 +
														 '    AND NVL(TAMBULANCE.FC_OTCH,'' '') LIKE ''' + TRIM(SOTCH) + '%'' '+ #13 +
														 '    AND TAMBULANCE.FK_DOCOBSL = TDOCOBSL.FK_ID '+ #13 +
														 '    AND TDOCOBSL.FK_VIDDOCID = TUSLVID.FK_ID '+ #13 +
                             ' ORDER BY FIO ';
          odsPac.Open;
          aSave.Enabled := odsPac.RecordCount <> 0;
        end;
  end;
end;

procedure TfrmCorrectPac.FormShow(Sender: TObject);
begin
  sFio.SetFocus;
end;

end.
