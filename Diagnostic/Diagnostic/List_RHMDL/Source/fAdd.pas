unit fAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxControls,
  cxContainer, cxEdit, cxLabel, cxTextEdit, cxMaskEdit, cxSpinEdit,
  cxDropDownEdit, cxCalendar, cxGraphics, DB, OracleData, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, dxBar, ActnList, dxSkinsdxBarPainter,
  cxClasses, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxVGrid, cxInplaceContainer,
  Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxGroupBox, cxPC,
  cxCheckBox, Oracle, dxmdaset, cxTimeEdit, ImgList;

type
  TfrmAdd = class(TForm)
    al: TActionList;
    aAdd: TAction;
    BM: TdxBarManager;
    BMBar1: TdxBar;
    bbAdd: TdxBarButton;
    bbDel: TdxBarButton;
    aDel: TAction;
    aFind: TAction;
    aSave: TAction;
    aCancel: TAction;
    pcMain: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    seNum: TcxSpinEdit;
    cxLabel2: TcxLabel;
    deDate: TcxDateEdit;
    cxGroupBox1: TcxGroupBox;
    cxLabel3: TcxLabel;
    lbPac: TcxLabel;
    cxLabel5: TcxLabel;
    lbDateBirth: TcxLabel;
    cxLabel9: TcxLabel;
    lbAge: TcxLabel;
    cxLabel6: TcxLabel;
    lbAddress: TcxLabel;
    cxLabel7: TcxLabel;
    lbDS: TcxLabel;
    cxLabel4: TcxLabel;
    lbNumMK: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel10: TcxLabel;
    lcbUrg: TcxLookupComboBox;
    Panel2: TPanel;
    dxBarDockControl1: TdxBarDockControl;
    grIssl: TcxGrid;
    grIsslLevel1: TcxGridLevel;
    vGrPodpis: TcxVerticalGrid;
    catPod: TcxCategoryRow;
    rowSotr: TcxEditorRow;
    rowMS: TcxEditorRow;
    Panel3: TPanel;
    cxLabel11: TcxLabel;
    teFIO: TcxTextEdit;
    bClear: TcxButton;
    bFindPac: TcxButton;
    tvFind: TcxGridDBTableView;
    grFindLevel1: TcxGridLevel;
    grFind: TcxGrid;
    aChoose: TAction;
    cxTabSheet3: TcxTabSheet;
    Panel4: TPanel;
    paDate: TPanel;
    p1: TPanel;
    p2: TPanel;
    p3: TPanel;
    p4: TPanel;
    p5: TPanel;
    p6: TPanel;
    p7: TPanel;
    blWeeks: TButton;
    blMon: TButton;
    brWeeks: TButton;
    brMon: TButton;
    pMonth: TPanel;
    deDateCh: TcxDateEdit;
    tvList: TcxGridDBTableView;
    grListLevel1: TcxGridLevel;
    grList: TcxGrid;
    odsFind: TOracleDataSet;
    dsFind: TDataSource;
    vFio: TcxGridDBColumn;
    vDateR: TcxGridDBColumn;
    aFindPac: TAction;
    aClear: TAction;
    aFindPacSet: TAction;
    dsExtr: TDataSource;
    odsExtr: TOracleDataSet;
    dsSotr: TDataSource;
    odsSotr: TOracleDataSet;
    dsMs: TDataSource;
    odsMs: TOracleDataSet;
    dsList: TDataSource;
    odsList: TOracleDataSet;
    cxTabSheet4: TcxTabSheet;
    tvMetod: TcxGridDBTableView;
    grMetodLevel1: TcxGridLevel;
    grMetod: TcxGrid;
    odsMetods: TOracleDataSet;
    dsMetod: TDataSource;
    tvMetodName: TcxGridDBColumn;
    tvIsslTable: TcxGridTableView;
    vName: TcxGridColumn;
    aSetMetod: TAction;
    vSmidID: TcxGridColumn;
    vNazID: TcxGridColumn;
    lbSex: TcxLabel;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    lbJit: TcxLabel;
    lbReg: TcxLabel;
    vNumIB: TcxGridDBColumn;
    vState: TcxGridDBColumn;
    pmFind: TPopupMenu;
    N1: TMenuItem;
    teTime: TcxTimeEdit;
    vListName: TcxGridDBColumn;
    vListFio: TcxGridDBColumn;
    teTimeEnd: TcxTimeEdit;
    cxLabel12: TcxLabel;
    cxLabel15: TcxLabel;
    Panel5: TPanel;
    BMBar2: TdxBar;
    dxBarDockControl2: TdxBarDockControl;
    bbCancel: TdxBarButton;
    bbSave: TdxBarButton;
    Panel6: TPanel;
    dxBarDockControl3: TdxBarDockControl;
    BMBar3: TdxBar;
    bbFind: TdxBarButton;
    bbChoose: TdxBarButton;
    IL: TcxImageList;
    bbEdit: TdxBarButton;
    aEdit: TAction;
    vSos: TcxGridColumn;
    vOut: TcxGridColumn;
    Panel7: TPanel;
    cxLabel16: TcxLabel;
    teFilter: TcxTextEdit;
    bClearFilter: TcxButton;
    bbSet: TdxBarButton;
    aChooseSet: TAction;
    lbVyp: TcxLabel;
    vTypeDoc: TcxGridDBColumn;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure aChooseExecute(Sender: TObject);
    procedure aFindExecute(Sender: TObject);
    procedure aFindPacExecute(Sender: TObject);
    procedure aClearExecute(Sender: TObject);
    procedure teFIOClick(Sender: TObject);
    procedure teFIOEnter(Sender: TObject);
    procedure tvFindCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure aFindPacSetExecute(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
    procedure tvMetodCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure aSetMetodExecute(Sender: TObject);
    procedure blMonClick(Sender: TObject);
    procedure blWeeksClick(Sender: TObject);
    procedure p1Click(Sender: TObject);
    procedure p2Click(Sender: TObject);
    procedure p3Click(Sender: TObject);
    procedure p4Click(Sender: TObject);
    procedure p5Click(Sender: TObject);
    procedure p6Click(Sender: TObject);
    procedure p7Click(Sender: TObject);
    procedure brWeeksClick(Sender: TObject);
    procedure brMonClick(Sender: TObject);
    procedure pcMainChange(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure deDateChPropertiesChange(Sender: TObject);
    procedure tvListCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure aEditExecute(Sender: TObject);
    procedure teFilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bClearFilterClick(Sender: TObject);
    procedure teFIOKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure odsFindAfterOpen(DataSet: TDataSet);
    procedure aChooseSetExecute(Sender: TObject);
    procedure odsListAfterOpen(DataSet: TDataSet);
  private
    isEdit : Boolean; // происходит ли изменение методики
    procedure DateChange;
    { Private declarations }
  public
    isDel : Boolean; 
    EditMode : Boolean;
    procedure DoShowForm;
    procedure DoDisable(nId : Integer);
    { Public declarations }
  end;

var
  frmAdd: TfrmAdd;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmAdd.aAddExecute(Sender: TObject);
begin
  pcMain.ActivePageIndex := 3;
  bbSet.Visible := ivAlways;
  bbSet.Action := aSetMetod;
  if odsMetods.Active = False then
    odsMetods.Active := True;
  aChoose.Visible := False;
  bbFind.Caption := 'Вернуться';
  bbFind.ImageIndex := 4;
  aSave.Enabled := False;
  aSave.Visible := False;
  if EditMode = True then
    begin
      Panel6.Visible := True;
      aFind.Visible := True;
      aFind.Enabled := True;
    end;
end;

procedure TfrmAdd.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmAdd.aChooseExecute(Sender: TObject);
begin
  deDateCh.Date := trunc(deDate.Date);
  pcMain.ActivePageIndex := 2;
  bbSet.Visible := ivAlways;
  bbSet.Action := aChooseSet;
  bbFind.Caption := 'Вернуться';
  bbFind.ImageIndex := 4;
  aChoose.Visible := False;
  aSave.Visible := False;
  aSave.Enabled := True;
end;

procedure TfrmAdd.aChooseSetExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  lbPac.Caption := odsList.FieldByName('pacfio').AsString;
  lbPac.Tag := odsList.FieldByName('fk_pacid').AsInteger;
  lcbUrg.EditValue := odsList.FieldByName('fk_naztypeid').AsInteger;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
// дата рождения
    ods.SQL.Text := ' select to_char(fd_rojd) as date_birth from asu.tpeoples where fk_id = :pfk_id ';
    ods.DeclareAndSet('pfk_id', otInteger, odsList.FieldByName('fk_peplid').AsInteger);
    ods.Open;
    lbDateBirth.Caption := ods.FieldByName('date_birth').AsString;
// Номер МК
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select asu.get_ib(:pfk_pacid) as numib from dual ';
    ods.DeclareAndSet('pfk_pacid', otInteger, odsList.FieldByName('fk_pacid').AsInteger);
    ods.Open;
    lbNumMK.Caption := ods.FieldByName('numib').AsString;
// пол
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select decode(fp_sex, 0, ''Женский'', 1, ''Мужской'') as sex from asu.tpeoples where fk_id = :pfk_id ';
    ods.DeclareAndSet('pfk_id', otInteger, odsList.FieldByName('fk_peplid').AsInteger);
    ods.Open;
    lbSex.Caption := ods.FieldByName('sex').AsString;
// возраст
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select trunc(months_between(sysdate, fd_rojd)/12) as age from asu.tpeoples where fk_id = :pfk_id ';
    ods.DeclareAndSet('pfk_id', otInteger, odsList.FieldByName('fk_peplid').AsInteger);
    ods.Open;
    lbAge.Caption := IntToStr(ods.FieldByName('age').AsInteger);
// адрес регистрации
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select asu.get_adr_by_peplid_level_street(:pfk_id, 1) as adr from dual ';
    ods.DeclareAndSet('pfk_id', otInteger, odsList.FieldByName('fk_peplid').AsInteger);
    ods.Open;
    lbAddress.Caption := ods.FieldByName('adr').AsString;
// Диагноз
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select stat.pkg_frform30.get_last_diag(:pfk_pacid) as diag from dual ';
    ods.DeclareAndSet('pfk_pacid', otInteger, odsList.FieldByName('fk_pacid').AsInteger);
    ods.Open;
    lbDS.Caption := ods.FieldByName('diag').AsString;
// Житель
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_peplid '+#13+
                    '    and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''LD_LIVEIN'') ';
    ods.DeclareAndSet('pfk_peplid', otInteger, odsList.FieldByName('fk_peplid').AsInteger);
    ods.Open;
    lbJit.Caption := ods.FieldByName('smname').AsString;
// Региональная принадлежность
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_peplid '+#13+
                    '    and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''PD_MZ'') ';
    ods.DeclareAndSet('pfk_peplid', otInteger, odsList.FieldByName('fk_peplid').AsInteger);
    ods.Open;
    lbReg.Caption := ods.FieldByName('smname').AsString;
    odsList.DisableControls;
    odsList.First;
    tvIsslTable.BeginUpdate;
    tvIsslTable.DataController.RecordCount := 0;
    while not odsList.Eof do
      begin
        if lbPac.Tag = odsList.FieldByName('fk_pacid').AsInteger then
          begin
            tvIsslTable.DataController.RecordCount := tvIsslTable.DataController.RecordCount + 1;
            with tvIsslTable.DataController do
              begin
                  Values[tvIsslTable.DataController.RecordCount - 1, vName.Index] := odsList.FieldByName('fc_name').AsString;
                  Values[tvIsslTable.DataController.RecordCount - 1, vSmidID.Index] := odsList.FieldByName('fk_smid').AsInteger;
                  Values[tvIsslTable.DataController.RecordCount - 1, vNazID.Index] := odsList.FieldByName('fk_id').AsInteger;
             end;
          end;
        odsList.Next;
      end;
    tvIsslTable.EndUpdate;
    odsList.EnableControls;
    pcMain.ActivePageIndex := 0;
    bbSet.Visible := ivNever;
    aFind.Visible := True;
    bbFind.Caption := 'Найти пациента...';
    bbFind.ImageIndex := 1;
    aChoose.Visible := True;
    aSave.Enabled := True;
    aSave.Visible := True;
  finally
    ods.Free;
  end;
end;

procedure TfrmAdd.aClearExecute(Sender: TObject);
begin
  teFIO.Clear;
  teFIO.SetFocus;
end;

procedure TfrmAdd.aDelExecute(Sender: TObject);
//var oq : TOracleQuery;
begin
  if EditMode = True then
    begin
      if tvIsslTable.DataController.Values[tvIsslTable.DataController.FocusedRecordIndex, vSos.Index] = frmMain.get_vipnaz then
        begin
          MessageDlg('Внимание!'+#13+#10+
                     'Это исследование (процедура) имеет статус "Выполнено"!'+#13+#10+
                     'Вы не можете удалить его!', mtInformation, [mbOK], 0);
          exit;
        end;

      frmMain.odsIssl.Locate('fk_id', tvIsslTable.DataController.Values[tvIsslTable.DataController.FocusedRecordIndex, vNazID.Index], []);
      frmMain.odsIssl.Edit;
      frmMain.odsIssl.FieldByName('fl_del').AsInteger := 1;
      frmMain.odsIssl.Post;
      tvIsslTable.BeginUpdate;
      tvIssltable.DataController.DeleteFocused;
      tvIsslTable.EndUpdate;
      isDel := True;
    end else
    begin
      tvIsslTable.BeginUpdate;
      tvIssltable.DataController.DeleteFocused;
      tvIsslTable.EndUpdate;
    end;
end;

procedure TfrmAdd.aEditExecute(Sender: TObject);
begin
  if tvIsslTable.DataController.Values[tvIsslTable.DataController.FocusedRecordIndex, vSos.Index] = 1 then
    begin
      MessageDlg('Внимание!'+#13+#10+'Это исследование(процедура) подписано и имеет статус "Выполнено"!'+#13+#10+'Изменить его нельзя!', mtWarning, [mbOK], 0);
      exit;
    end;

  pcMain.ActivePageIndex := 3;
  if odsMetods.Active = False then
    odsMetods.Active := True;
  bbFind.Caption := 'Вернуться';
  bbFind.ImageIndex := 4;
  aSave.Enabled := False;
  aSave.Visible := False;
  if EditMode = True then
    begin
      Panel6.Visible := True;
      aFind.Visible := True;
      aFind.Enabled := True;
    end;
  isEdit := True;
end;

procedure TfrmAdd.aFindExecute(Sender: TObject);
begin
  if bbFind.Caption = 'Вернуться' then
    begin
      pcMain.ActivePageIndex := 0;
      bbSet.Visible := ivNever;
      if EditMode <> True then
        begin
          aChoose.Visible := True;
          bbFind.Caption := 'Найти пациента...';
          bbFind.ImageIndex := 1;
          Panel6.Visible := True;
        end else
        begin
          Panel6.Visible := False;
        end;
      aSave.Enabled := True;
      aSave.Visible := True;
      tvFind.StoreToRegistry('\SoftWare\SoftMaster\List_RHMDL\fAdd\grFindSotr_' + IntToStr(frmMain.pSOTRID), TRUE, [], 'grFind');
    end else
    begin
      pcMain.ActivePageIndex := 1;
      bbSet.Visible := ivAlways;
      bbSet.Action := aFindPacSet;
      aFindPacSet.Enabled := False;
      aChoose.Visible := False;
      bbFind.Caption := 'Вернуться';
      bbFind.ImageIndex := 4;
      teFIO.SetFocus;
      aSave.Enabled := False;
      aSave.Visible := False;
      tvFind.StoreToRegistry('\SoftWare\SoftMaster\List_RHMDL\fAdd\grFindSotr_' + IntToStr(frmMain.pSOTRID)+'Default', TRUE, [], 'grFind');
      tvFind.RestoreFromRegistry('\SoftWare\SoftMaster\List_RHMDL\fAdd\grFindSotr_' + IntToStr(frmMain.pSOTRID), FALSE, FALSE, [], 'grFind');
    end;
end;

procedure TfrmAdd.aFindPacExecute(Sender: TObject);
var sFam, sIm, sOtch : String;
    strIm : String;
    flag : Integer;
begin
  if teFIO.Text <> '' then
    begin
      flag := 0;
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
      odsFind.Close;
      odsFind.SetVariable('sFam', trim(sFam)+'%');
      odsFind.SetVariable('sIm', trim(sIm)+'%');
      odsFind.SetVariable('sOtch', trim(sOtch)+'%');
      odsFind.Open;
    end;
end;

procedure TfrmAdd.aFindPacSetExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  lbPac.Caption := odsFind.FieldByName('fio').AsString;
  lbPac.Tag := odsFind.FieldByName('pacid').AsInteger; 
  lbDateBirth.Caption := DateTimeToStr(odsFind.FieldByName('fd_rojd').AsDateTime);
  lbNumMK.Caption := odsFind.FieldByName('nib').AsString;
  lbSex.Caption := odsFind.FieldByName('sex').AsString;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
// возраст
    ods.SQL.Text := ' select trunc(months_between(sysdate, fd_rojd)/12) as age from asu.tpeoples where fk_id = :pfk_id ';
    ods.DeclareAndSet('pfk_id', otInteger, odsFind.FieldByName('fk_peplid').AsInteger);
    ods.Open;
    lbAge.Caption := IntToStr(ods.FieldByName('age').AsInteger);
// адрес регистрации
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select asu.get_adr_by_peplid_level_street(:pfk_id, 1) as adr from dual ';
    ods.DeclareAndSet('pfk_id', otInteger, odsFind.FieldByName('fk_peplid').AsInteger);
    ods.Open;
    lbAddress.Caption := ods.FieldByName('adr').AsString;
// Диагноз
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select stat.pkg_frform30.get_last_diag(:pfk_pacid) as diag from dual ';
    ods.DeclareAndSet('pfk_pacid', otInteger, odsFind.FieldByName('pacid').AsInteger);
    ods.Open;
    lbDS.Caption := ods.FieldByName('diag').AsString;
// Житель
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_peplid '+#13+
                    '    and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''LD_LIVEIN'') ';
    ods.DeclareAndSet('pfk_peplid', otInteger, odsFind.FieldByName('fk_peplid').AsInteger);
    ods.Open;
    lbJit.Caption := ods.FieldByName('smname').AsString;
// Региональная принадлежность
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_peplid '+#13+
                    '    and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''PD_MZ'') ';
    ods.DeclareAndSet('pfk_peplid', otInteger, odsFind.FieldByName('fk_peplid').AsInteger);
    ods.Open;
    lbReg.Caption := ods.FieldByName('smname').AsString;
    tvFind.StoreToRegistry('\SoftWare\SoftMaster\List_RHMDL\fAdd\grFindSotr_' + IntToStr(frmMain.pSOTRID), TRUE, [], 'grFind');
    pcMain.ActivePageIndex := 0;
    bbSet.Visible := ivNever;
    aChoose.Visible := True;
    bbFind.Caption := 'Найти пациента...';
    bbFind.ImageIndex := 1;
    aSave.Enabled := True;
    aSave.Visible := True;
    tvIsslTable.BeginUpdate;
    tvIsslTable.DataController.RecordCount := 0;
    tvIsslTable.EndUpdate;
  finally
    ods.Free;
  end;
end;

procedure TfrmAdd.aSaveExecute(Sender: TObject);
begin
  if seNum.Value = 0 then
    begin
      MessageDlg('Внимание!'+#13+#10+'Укажите номер записи в журнале!', mtWarning, [mbOK], 0);
      seNum.SetFocus;
      exit;
    end;
  if (deDate.Text = '') or (deDate.Text = '0') or (deDate.Text = '30.12.1899') then
    begin
      MessageDlg('Внимание!'+#13+#10+'Укажите дату записи в журнале!', mtWarning, [mbOK], 0);
      deDate.SetFocus;
      exit;
    end;
  if lbPac.Tag = 0 then
    begin
      MessageDlg('Внимание!'+#13+#10+'Не выбран пациент!'+#13+#10+'Вы не можете сохранить запись в журнале!', mtWarning, [mbOK], 0);
      exit;
    end;
  if tvIsslTable.DataController.RecordCount = 0 then
    begin
      MessageDlg('Внимание!'+#13+#10+'Список диагностических/лечебных вмешательств пуст!'+#13+#10+'Вы не можете сохранить запись в журнале!', mtWarning, [mbOK], 0);
      exit;
    end;
  if rowSotr.Properties.Value = 0 then
    begin
      MessageDlg('Внимание!'+#13+#10+'Укажите врача!', mtWarning, [mbOK], 0);
      rowSotr.Focused := True;
      exit;
    end;

  ModalResult := mrOK;
end;

procedure TfrmAdd.aSetMetodExecute(Sender: TObject);
begin
  if isEdit then
    begin
      tvIsslTable.BeginUpdate;
      with tvIsslTable.DataController do
        begin
          try
            Values[tvIsslTable.DataController.FocusedRecordIndex, vName.Index] := odsMetods.FieldByName('fc_name').AsString;
            Values[tvIsslTable.DataController.FocusedRecordIndex, vSmidID.Index] := odsMetods.FieldByName('fk_id').AsInteger;
          finally
            tvIsslTable.EndUpdate;
          end;
        end;
      isEdit := False;
    end else
    begin
      tvIsslTable.BeginUpdate;
      tvIsslTable.DataController.RecordCount := tvIsslTable.DataController.RecordCount + 1;
      with tvIsslTable.DataController do
        begin
          try
            Values[tvIsslTable.DataController.RecordCount - 1, vName.Index] := odsMetods.FieldByName('fc_name').AsString;
            Values[tvIsslTable.DataController.RecordCount - 1, vSmidID.Index] := odsMetods.FieldByName('fk_id').AsInteger;
            Values[tvIsslTable.DataController.RecordCount - 1, vNazID.Index] := 0;
          finally
            tvIsslTable.EndUpdate;
          end;
        end;
    end;
  aSave.Enabled := True;
  aSave.Visible := True;
  if EditMode = False then
    begin
      aChoose.Visible := True;
      bbFind.Caption := 'Найти пациента...';
      bbFind.ImageIndex := 1;
    end else
    begin
      Panel6.Visible := False;
    end;
  bbSet.Visible := ivNever;
  pcMain.ActivePageIndex := 0;
end;

procedure TfrmAdd.bClearFilterClick(Sender: TObject);
begin
  teFilter.Text := '';
  odsMetods.Filtered := False;
end;

procedure TfrmAdd.blMonClick(Sender: TObject);
var mm,yy,dd:word;
begin
  decodeDate(deDateCh.EditValue,yy,mm,dd);
  if dd=31 then dd:=30;
  if ((mm=3) and (dd>28)) then dd:=28;
  if mm>1 then mm:=mm-1
   else
     begin
       mm:=12;
       yy:=yy-1;
     end;
  deDateCh.EditValue:=encodeDate(yy,mm,dd);
end;

procedure TfrmAdd.blWeeksClick(Sender: TObject);
begin
  deDateCh.EditValue:=deDateCh.EditValue-1;
end;

procedure TfrmAdd.brMonClick(Sender: TObject);
var yy,mm,dd:word;
begin
  decodeDate(deDateCh.EditValue,yy,mm,dd);
  if dd=31 then dd:=30;
  if ((mm=1) and (dd>28)) then dd:=28;
  if mm<12 then mm:=mm+1
   else
     begin
       mm:=1;
       yy:=yy+1;
     end;
  deDateCh.EditValue:=encodeDate(yy,mm,dd);
end;

procedure TfrmAdd.brWeeksClick(Sender: TObject);
begin
  deDateCh.EditValue:=deDateCh.EditValue+1;
end;

procedure TfrmAdd.DateChange;
var yy,mm,dd:word;
    wd:integer;
begin
	pMonth.Caption:=FormatDateTime('mmmm',deDateCh.EditValue)+', '+(FormatDateTime('dddd',deDateCh.EditValue));

	wd:=dayofweek(deDateCh.EditValue);
	if wd=1 then wd:=8;

	decodeDate(deDateCh.EditValue-wd+2,yy,mm,dd);
	p1.Caption:=inttostr(dd);

	decodeDate(deDateCh.EditValue-wd+3,yy,mm,dd);
	p2.Caption:=inttostr(dd);

	decodeDate(deDateCh.EditValue-wd+4,yy,mm,dd);
	p3.Caption:=inttostr(dd);

	decodeDate(deDateCh.EditValue-wd+5,yy,mm,dd);
	p4.Caption:=inttostr(dd);

	decodeDate(deDateCh.EditValue-wd+6,yy,mm,dd);
	p5.Caption:=inttostr(dd);

	decodeDate(deDateCh.EditValue-wd+7,yy,mm,dd);
	p6.Caption:=inttostr(dd);

  decodeDate(deDateCh.EditValue-wd+8,yy,mm,dd);
  p7.Caption:=inttostr(dd);

  p1.Color:=clCream;
  p2.Color:=clCream;
  p3.Color:=clCream;
  p4.Color:=clCream;
  p5.Color:=clCream;
  p6.Color:=clCream;
  p7.Color:=clCream;
  case wd-1 of
    1:p1.Color:=clSkyBlue;
    2:p2.Color:=clSkyBlue;
    3:p3.Color:=clSkyBlue;
    4:p4.Color:=clSkyBlue;
    5:p5.Color:=clSkyBlue;
    6:p6.Color:=clSkyBlue;
    7:p7.Color:=clSkyBlue;
  end;
end;

procedure TfrmAdd.deDateChPropertiesChange(Sender: TObject);
begin
  DateChange;
  odsList.Close;
  odsList.SetVariable('pfd_date', trunc(deDateCh.Date));
  odsList.Open;
end;

procedure TfrmAdd.DoDisable(nId: Integer);
begin
  if nId = 3 then // если пациент выписан
    begin
      lbVyp.Visible := True; 
      grIssl.Enabled := False;
      aSave.Visible := False;
      seNum.Enabled := False;
      seNum.Properties.SpinButtons.Visible := False;
      deDate.Enabled := False;
      teTime.Enabled := False;
      teTimeEnd.Enabled := False;
      lcbUrg.Enabled := False;

      deDate.Properties.Buttons[0].Visible := False;
      teTime.Properties.SpinButtons.Visible := False;
      teTimeEnd.Properties.SpinButtons.Visible := False;
      lcbUrg.Properties.Buttons[0].Visible := False;

      dxBarDockControl1.Visible := False;

      vGrPodpis.Enabled := False;
      rowSotr.Properties.Options.ShowEditButtons := eisbNever;
      rowMs.Properties.Options.ShowEditButtons := eisbNever;
    end;
end;

procedure TfrmAdd.DoShowForm;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' select asu.seq_rhmdl.nextval as valnext from dual ';
    ods.Open;
    seNum.EditValue := ods.FieldByName('valnext').AsInteger;
    ods.Close;
    ods.SQL.Text := ' select sysdate from dual ';
    ods.Open;
    deDate.Date := ods.FieldByName('sysdate').AsDateTime;
    teTime.Time := ods.FieldByName('sysdate').AsDateTime;
    teTimeEnd.Time := ods.FieldByName('sysdate').AsDateTime;
  finally
    ods.Free;
  end;
end;

procedure TfrmAdd.FormCreate(Sender: TObject);
begin
  pcMain.ActivePageIndex := 0;
  if odsExtr.Active = False then
    odsExtr.Active := True;
  if odsSotr.Active = False then
    odsSotr.Active := True;
  if odsMs.Active = False then
    odsMs.Active := True;
  isEdit := False;
  isDel := False;
  bbSet.Visible := ivNever;
end;

procedure TfrmAdd.N1Click(Sender: TObject);
begin
  tvFind.RestoreFromRegistry('\SoftWare\SoftMaster\List_RHMDL\fAdd\grFindSotr_' + IntToStr(frmMain.pSOTRID)+'Default', FALSE, FALSE, [], 'grFind');
end;

procedure TfrmAdd.odsFindAfterOpen(DataSet: TDataSet);
begin
  aFindPacSet.Enabled := odsFind.RecordCount <> 0;  
end;

procedure TfrmAdd.odsListAfterOpen(DataSet: TDataSet);
begin
  aChooseSet.Enabled := odsList.RecordCount <> 0;
end;

procedure TfrmAdd.p1Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(deDateCh.EditValue);
  if wd=1 then wd:=8;
  deDateCh.EditValue:=deDateCh.EditValue-wd+2;
end;

procedure TfrmAdd.p2Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(deDateCh.EditValue);
  if wd=1 then wd:=8;
  deDateCh.EditValue:=deDateCh.EditValue-wd+3;
end;

procedure TfrmAdd.p3Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(deDateCh.EditValue);
  if wd=1 then wd:=8;
  deDateCh.EditValue:=deDateCh.EditValue-wd+4;
end;

procedure TfrmAdd.p4Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(deDateCh.EditValue);
  if wd=1 then wd:=8;
  deDateCh.EditValue:=deDateCh.EditValue-wd+5;
end;

procedure TfrmAdd.p5Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(deDateCh.EditValue);
  if wd=1 then wd:=8;
  deDateCh.EditValue:=deDateCh.EditValue-wd+6;
end;

procedure TfrmAdd.p6Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(deDateCh.EditValue);
  if wd=1 then wd:=8;
  deDateCh.EditValue:=deDateCh.EditValue-wd+7;
end;

procedure TfrmAdd.p7Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(deDateCh.EditValue);
  if wd=1 then wd:=8;
  deDateCh.EditValue:=deDateCh.EditValue-wd+8;
end;

procedure TfrmAdd.pcMainChange(Sender: TObject);
begin
  if pcMain.ActivePageIndex = 2 then
    begin
      deDateCh.Date := deDate.Date;
    end;
end;

procedure TfrmAdd.teFilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  odsMetods.Filtered := false;
  if length(teFilter.Text) > 0 then
    begin
      odsMetods.Filter := 'fc_name_up = ''*' + AnsiUpperCase(teFilter.Text) + '*'' ';
      odsMetods.Filtered := true;
      bClearFilter.Enabled := True;
    end else
    begin
      bClearFilter.Enabled := False;
    end;
end;

procedure TfrmAdd.teFIOClick(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

procedure TfrmAdd.teFIOEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

procedure TfrmAdd.teFIOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    aFindPacExecute(nil);
end;

procedure TfrmAdd.tvFindCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  aFindPacSetExecute(nil);
end;

procedure TfrmAdd.tvListCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  aChooseSetExecute(nil);
end;

procedure TfrmAdd.tvMetodCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  aSetMetodExecute(nil);
end;

end.
