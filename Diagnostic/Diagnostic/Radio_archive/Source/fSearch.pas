unit fSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, Menus, cxLookAndFeelPainters,
  DB, OracleData, StdCtrls, cxRadioGroup, cxGroupBox, cxButtons, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls, dxSkinsdxBarPainter,
  cxCheckBox, cxStyles, dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  dxBar, cxBarEditItem, ImgList, ActnList, Oracle, dxSkinOffice2007Green;

type
  TfrmSearch = class(TForm)
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
    dsPac: TDataSource;
    odsPac: TOracleDataSet;
    BM: TdxBarManager;
    BMBar1: TdxBar;
    dxBarDockControl1: TdxBarDockControl;
    cxGr: TcxGrid;
    TVPAC: TcxGridDBTableView;
    VFIO: TcxGridDBColumn;
    VROJD: TcxGridDBColumn;
    cxGrLevel1: TcxGridLevel;
    al: TActionList;
    aClose: TAction;
    aSearch: TAction;
    il: TImageList;
    bbSet: TdxBarButton;
    aSet: TAction;
    aClear: TAction;
    procedure aSetExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure sFIOClick(Sender: TObject);
    procedure sFIOEnter(Sender: TObject);
    procedure sFIOKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure aSearchExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure aClearExecute(Sender: TObject);
    procedure TVPACCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure TVPACKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    Russian : HKL;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSearch: TfrmSearch;

implementation

{$R *.dfm}

procedure TfrmSearch.aClearExecute(Sender: TObject);
begin
  sFIO.Clear;
  sFIO.SetFocus;
end;

procedure TfrmSearch.aCloseExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSearch.aSearchExecute(Sender: TObject);
var sFam, sIm, sOtch : String;
    strIm : String;
    flag : Integer;
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
      odsPac.Close;
			odsPac.SQL.Text := ' select tpeoples.fk_id, '+ #13 +
                         '        tpeoples.fc_fam||'' ''||tpeoples.fc_im||'' ''||tpeoples.fc_otch fio, '+ #13 +
			  						     '        DECODE(TO_CHAR(tpeoples.FD_ROJD, ''dd.mm.yyyy hh24:mi:ss''), ''00.00.0000 00:00:00'', TRUNC(SYSDATE), tpeoples.FD_ROJD) FD_ROJD, '+ #13 +
										     '        '''' AS fc_name, '+ #13 +
										     '        asu.pkg_regist_peplfunc.get_pepl_sex(tpeoples.fk_id) sex, '+ #13 +
                         '        '''' AS NIB, '+ #13 +
                         '        '''' stek_coc, '+ #13 +
                         '        0 AS PacID, '+ #13 +
                         '        0 AS IS_AMBULANCE '+ #13 +
                         '   from asu.tpeoples '+ #13 +
                         '  where tpeoples.fc_fam like :pFAM||''%'' '+ #13 +
                         '    and nvl(tpeoples.fc_im,'' '') like :pIM||''%'' '+ #13 +
                         '    and nvl(tpeoples.fc_otch,'' '') like :pOTCH||''%'' '+ #13 +
				  					     ' order by fio ';
			odsPac.DeclareAndSet('pFAM', otString, trim(sFAM));
			odsPac.DeclareAndSet('pIM', otString, trim(sIM));
			odsPac.DeclareAndSet('pOTCH', otString, trim(sOTCH));
			odsPac.Open;
      aSet.Enabled := odsPac.RecordCount <> 0;
		end;
end;

procedure TfrmSearch.aSetExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSearch.FormCreate(Sender: TObject);
begin
  russian:=LoadKeyboardLayout('00000419', 0);
  aSet.Enabled := False;
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

procedure TfrmSearch.TVPACCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  aSetExecute(nil);
end;

procedure TfrmSearch.TVPACKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    aSetExecute(nil);
end;

end.
