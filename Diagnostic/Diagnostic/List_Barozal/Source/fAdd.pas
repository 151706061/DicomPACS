unit fAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel,
  ExtCtrls, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxGraphics,
  cxMaskEdit, cxDropDownEdit, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, DB, cxDBData, ActnList, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, Oracle, OracleData, Registry, dxSkinOffice2007Green;

type
  TfrmAdd = class(TForm)
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    teFio: TcxTextEdit;
    bFind: TcxButton;
    bClear: TcxButton;
    cxLabel2: TcxLabel;
    cbTypePac: TcxComboBox;
    cxGr: TcxGrid;
    tvPac: TcxGridDBTableView;
    VFIO: TcxGridDBColumn;
    VROJD: TcxGridDBColumn;
    VNUMBER: TcxGridDBColumn;
    VTYPEDOC: TcxGridDBColumn;
    VSOS: TcxGridDBColumn;
    cxGrLevel1: TcxGridLevel;
    al: TActionList;
    aSearch: TAction;
    aClearSearch: TAction;
    aPrint: TAction;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aXLS: TAction;
    aOk: TAction;
    aCancel: TAction;
    odsPac: TOracleDataSet;
    dsPac: TDataSource;
    Panel2: TPanel;
    cxButton2: TcxButton;
    cxButton1: TcxButton;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aClearSearchExecute(Sender: TObject);
    procedure aSearchExecute(Sender: TObject);
    procedure teFioClick(Sender: TObject);
    procedure teFioEnter(Sender: TObject);
    procedure teFioKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure tvPacCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure tvPacKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdd: TfrmAdd;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmAdd.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmAdd.aClearSearchExecute(Sender: TObject);
begin
  teFIO.Clear;
  teFIO.SetFocus;
end;

procedure TfrmAdd.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmAdd.aSearchExecute(Sender: TObject);
var sFam, sIm, sOtch : String;
    strIm : String;
    flag : Integer;
begin
  flag := 0; //!!! проверить во всех проектах
  if Pos(' ', teFIO.Text) = 0 then
    begin
      sFam := teFIO.Text;
      flag := 1;
    end else
    begin
      sFam := copy(teFIO.Text, 1, Pos(' ', teFIO.Text));
    end;

  if flag = 1 then
    strIm := ''
  else
    strIm := trim(copy(teFIO.Text, Length(sFam), Length(teFIO.Text)+1 - Length(sFam)));

  sIm := trim(copy(strIm, 1, Pos(' ', strIm)));
  if sIm = '' then
    sIm := strIm;

  sOtch := trim(copy(strIm, Length(sIm)+1, Length(strIm)-Length(sIm)+1));

  if trim(teFIO.Text) <> '' then
    begin
      if cbTypePac.ItemIndex = 0 then
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
                             '        1 AS IS_AMBULANCE '+ #13 +
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
     if cbTypePac.ItemIndex = 1 then
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
												    '        0 AS IS_AMBULANCE '+ #13 +
												    '   from asu.tkarta, asu.tuslvid '+ #13 +
												    '  where tkarta.fc_fam like :pFAM||''%'' '+ #13 +
                            '    and nvl(tkarta.fc_im,'' '') like :pIM||''%'' '+ #13 +
                            '    and nvl(tkarta.fc_otch,'' '') like :pOTCH||''%'' '+ #13 +
                            '    and tkarta.fk_uslvidid = tuslvid.fk_id '+#13+
												    '    and tkarta.fp_tek_coc <> 3 '+ #13 +
												    ' order by fio ';
			   odsPac.DeclareAndSet('pFAM', otString, trim(sFAM));
		     odsPac.DeclareAndSet('pIM', otString, trim(sIM));
			   odsPac.DeclareAndSet('pOTCH', otString, trim(sOTCH));
			   odsPac.Open;
       end;
     if cbTypePac.ItemIndex = 2 then
       begin
         odsPac.Close;
			   odsPac.SQL.Text := ' select tambulance.fk_peplid as fk_id, '+ #13 +
                            '        tambulance.fc_fam||'' ''||tambulance.fc_im||'' ''|| tambulance.fc_otch fio, '+ #13 +
												    '        DECODE(TO_CHAR(tambulance.FD_ROJD, ''dd.mm.yyyy hh24:mi:ss''), ''00.00.0000 00:00:00'', TRUNC(SYSDATE), tambulance.FD_ROJD) FD_ROJD, '+ #13 +
												    '        tuslvid.fc_name, '+ #13 +
												    '        asu.pkg_regist_peplfunc.get_pepl_sex(tambulance.fk_peplid) sex, '+ #13 +
                            '        ASU.GET_IB(TAMBULANCE.FK_ID) AS NIB, ''Амбулаторное лечение'' stek_coc, '+
                            '        tambulance.fk_id PacID, '+ #13 +
                            '        1 AS IS_AMBULANCE '+ #13 +
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
												    '        0 AS IS_AMBULANCE '+ #13 +
												    '   from asu.tkarta, asu.tuslvid '+ #13 +
												    '  where tkarta.fc_fam like :pFAM||''%'' '+ #13 +
                            '    and nvl(tkarta.fc_im,'' '') like :pIM||''%'' '+ #13 +
                            '    and nvl(tkarta.fc_otch,'' '') like :pOTCH||''%'' '+ #13 +
                            '    and tkarta.fk_uslvidid = tuslvid.fk_id '+#13+
												    '    and tkarta.fp_tek_coc <> 3 '+ #13 +
												    ' order by fio ';
			   odsPac.DeclareAndSet('pFAM', otString, trim(sFAM));
			   odsPac.DeclareAndSet('pIM', otString, trim(sIM));
			   odsPac.DeclareAndSet('pOTCH', otString, trim(sOTCH));
			   odsPac.Open;
       end;
		end;
//  CheckEnabledButtons;
end;

procedure TfrmAdd.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var Reg : TRegIniFile;
begin
  Reg := TRegIniFile.Create;
  try
    Reg.RootKey:=HKEY_CURRENT_USER;
    if not Reg.OpenKey('\Software\Softmaster\List_barozal\fAdd\', FALSE) then
      begin
        Reg.CreateKey('\Software\Softmaster\List_barozal\fAdd');
      end;
    try
      if cbTypePac.ItemIndex = 0 then
        Reg.WriteInteger('\Software\Softmaster\List_barozal\fAdd\ID_SOTR'+IntToStr(frmMain.pSOTRID), 'ID_VIDPAC', 0);
      if cbTypePac.ItemIndex = 1 then
        Reg.WriteInteger('\Software\Softmaster\List_barozal\fAdd\ID_SOTR'+IntToStr(frmMain.pSOTRID), 'ID_VIDPAC', 1);
      if cbTypePac.ItemIndex = 2 then
        Reg.WriteInteger('\Software\Softmaster\List_barozal\fAdd\ID_SOTR'+IntToStr(frmMain.pSOTRID), 'ID_VIDPAC', 2);
    except
    end;
  finally
    Reg.Free;
  end;
  tvPac.StoreToRegistry('\SoftWare\SoftMaster\List_barozal\fAdd\tvPacVrach_' + IntToStr(frmMain.pSOTRID), TRUE, [], 'tvPac');
end;

procedure TfrmAdd.FormShow(Sender: TObject);
var Reg : TRegIniFile;
begin
  Reg := TRegIniFile.Create;
  try
    Reg.RootKey:=HKEY_CURRENT_USER;
    Reg.OpenKey('\Software\Softmaster\List_barozal\fAdd\ID_SOTR'+IntToStr(frmMain.pSOTRID), True);
    case Reg.ReadInteger('\Software\Softmaster\List_barozal\fAdd\ID_SOTR'+IntToStr(frmMain.pSOTRID), 'ID_VIDPAC', 0) of
      0: cbTypePac.ItemIndex := 0;
      1: cbTypePac.ItemIndex := 1;
      2: cbTypePac.ItemIndex := 2;
    end;
    tvPac.StoreToRegistry('\SoftWare\SoftMaster\List_barozal\fAdd\tvPacVrach_' + IntToStr(frmMain.pSOTRID)+'Default', TRUE, [], 'tvPac'); 
    tvPac.RestoreFromRegistry('\SoftWare\SoftMaster\List_barozal\fAdd\tvPacVrach_' + IntToStr(frmMain.pSOTRID), FALSE, FALSE, [], 'tvPac');
  finally
    Reg.Free;
  end;
end;

procedure TfrmAdd.teFioClick(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

procedure TfrmAdd.teFioEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

procedure TfrmAdd.teFioKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    aSearchExecute(nil);
end;

procedure TfrmAdd.tvPacCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  aOkExecute(nil);
end;

procedure TfrmAdd.tvPacKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
    aOkExecute(nil);
end;

end.
