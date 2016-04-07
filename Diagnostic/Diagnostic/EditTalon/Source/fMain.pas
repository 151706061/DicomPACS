//+++ для работы vsnormal необходимо подключение в uses модуля cxTextEdit
unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxEdit, dxSkinsCore, dxSkinsDefaultPainters,
  Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxInplaceContainer, cxVGrid, SMMainAPI, Oracle, cxButtonEdit, cxLabel,
  cxDBLookupComboBox, DB, OracleData, cxCalendar, cxTextEdit, ActnList,
  cxCheckBox, dxSkinscxPCPainter, cxPC, cxContainer, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxDateUtils,
  dxSkinOffice2007Green, ExtCtrls;

type
  TfrmMain = class(TForm)
    os: TOracleSession;
    odsInfo: TOracleDataSet;
    odsTalon: TOracleDataSet;
    al: TActionList;
    aCommit: TAction;
    aSave: TAction;
    cxStyleRep: TcxStyleRepository;
    stBoldRed: TcxStyle;
    stDefault: TcxStyle;
    pcMain: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    verGr: TcxVerticalGrid;
    rowPacient: TcxCategoryRow;
    merFIOMK: TcxMultiEditorRow;
    merDateAgeSex: TcxMultiEditorRow;
    rowDoc: TcxEditorRow;
    rowAddress: TcxEditorRow;
    rowAdrPreb: TcxEditorRow;
    rowWork: TcxEditorRow;
    rowNat: TcxEditorRow;
    rowSocStatus: TcxEditorRow;
    catTalon: TcxCategoryRow;
    rowSos: TcxEditorRow;
    rowDateBeg: TcxEditorRow;
    rowDateEnd: TcxEditorRow;
    rowSotr: TcxEditorRow;
    rowPolis: TcxEditorRow;
    rowPlace: TcxEditorRow;
    rowNapr: TcxEditorRow;
    rowReason: TcxEditorRow;
    rowTravma: TcxEditorRow;
    rowResult: TcxEditorRow;
    rowDop: TcxEditorRow;
    catUsl: TcxCategoryRow;
    rowNameUsl: TcxEditorRow;
    rowDateUsl: TcxEditorRow;
    verGrDS: TcxVerticalGrid;
    catDiags: TcxCategoryRow;
    rowDSNapr: TcxEditorRow;
    rowDSPred: TcxEditorRow;
    rowDSZakl: TcxEditorRow;
    rowDSZaklSop: TcxEditorRow;
    bSetDate: TcxButton;
    aSetDate: TAction;
    tsNaz: TcxTabSheet;
    tvNaz: TcxGridDBTableView;
    grNazLevel1: TcxGridLevel;
    grNaz: TcxGrid;
    odsNaz: TOracleDataSet;
    dsNaz: TDataSource;
    tvNazRun: TcxGridDBColumn;
    tvNazName: TcxGridDBColumn;
    tvNazIspol: TcxGridDBColumn;
    tvNazState: TcxGridDBColumn;
    rowStandart: TcxEditorRow;
    dsStandart: TDataSource;
    odsStandart: TOracleDataSet;
    odsCntOut: TOracleDataSet;
    rowTypeTalon: TcxEditorRow;
    dsTypeTalon: TDataSource;
    odsTypeTalon: TOracleDataSet;
    merDateNum: TcxMultiEditorRow;
    rowUch: TcxEditorRow;
    rowTypeMedHelp: TcxEditorRow;
    rowRezim: TcxEditorRow;
    odsTypeMedHelp: TOracleDataSet;
    dsTypeMedHelp: TDataSource;
    odsRezim: TOracleDataSet;
    dsRezim: TDataSource;
    odsPolis: TOracleDataSet;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    bCommit: TcxButton;
    bSave: TcxButton;
    bClose: TcxButton;
    rowVidPos: TcxEditorRow;
    dsVidPos: TDataSource;
    odsVidPos: TOracleDataSet;
    procedure FormCreate(Sender: TObject);
    procedure odsInfoBeforeOpen(DataSet: TDataSet);
    procedure odsInfoAfterOpen(DataSet: TDataSet);
    procedure rowNatEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowSocStatusEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowDocEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure odsTalonBeforeOpen(DataSet: TDataSet);
    procedure rowPlaceEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowReasonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowTravmaEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure aCommitExecute(Sender: TObject);
    procedure rowNaprEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure bCloseClick(Sender: TObject);
    procedure aSaveExecute(Sender: TObject);
    procedure rowDSNaprEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowDSPredEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowDSZaklEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure verGrDSEditorRow1EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowPolisEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowSotrEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure aSetDateExecute(Sender: TObject);
    procedure odsNazBeforeOpen(DataSet: TDataSet);
    procedure rowStandartEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowTypeTalonEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowUchEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    get_nevip : Integer;
    sLiterMkb : string;
    CanPodpis : Boolean;
    pPACID, pNAZID, pPEPLID : Integer;
    sSerDoc, sNumDoc, sKemDoc : string;
    nDSNapr_first, nDSNapr_showib, nDSPred_first, nDSPred_showib, nDSZakl_first, nDSZakl_showib,
    nDSZaklSop_first, nDSZaklSop_showib : Integer;
    nDSNapr_sotrid, nDSPred_sotrid, nDSZakl_sotrid, nDSZaklSop_sotrid : Integer;
    sDSNapr_name, sDSPred_name, sDSZakl_name, sDSZaklSop_name : string;
    idNaprDiag, idPredDiag, idMainDiag, idSoputDiag : Integer;
    procedure GetDiags;
    procedure DoTalonMode;
    { Private declarations }
  public
    varRes : Integer;
    pSOTRID, pSMID, pTALONID, pAPPSOTRID : Integer;
    DateSys : string;
    procedure DoShowfrmMain(nPacid, nNazid, nSotrid, nAppSotrid : Integer);
     procedure GetValue(str1 : string);
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation
uses fSet, fSetDoc, fCommit, fSetDs, fEditDs, fSetOpl, fSetSotr, fSetUch;
{$R *.dfm}

{ TfrmMain }

procedure TfrmMain.aCommitExecute(Sender: TObject);
var oq : TOracleQuery;
//    ods : TOracleDataSet;
begin
  aSaveExecute(nil); // сначала сохраняем
//  if odsInfo.FieldByName('db_name').AsString = 'SK' then
//    begin
//      ods := TOracleDataSet.Create(nil);
//      try
//        ods.Cursor := crSQLWait;
//        ods.Session := os;
//        ods.SQL.Text := ' select asu.is_heal_talon_podpis(:p) as heal_ex from dual '; // проверка на сопоставление с THEAL
//        ods.DeclareAndSet('p', otInteger, pTALONID);
//        ods.Open;
//        if ods.FieldByName('heal_ex').AsInteger = 0 then
//          begin
//            Application.MessageBox('Для данного назначения не установлен тариф медицинской помощи!'+#13+#10+
//                                   'Вы не можете подписать талон!', 'Информация', MB_ICONINFORMATION + MB_OK);
//            exit;
//          end;
//        ods.DeleteVariables;
//        ods.Close;
//        ods.SQL.Text := ' select asu.get_can_subscribe_if_opl(:pnaz, :pdate) as n from DUAL ';
//        ods.DeclareAndSet('pnaz', otInteger, pNAZID);
//        ods.DeclareAndSet('pdate', otDate, StrToDateTime(rowDateUsl.Properties.Value));
//        ods.Open;
//        if ods.FieldByName('n').AsInteger = -1 then
//          begin
//            Application.MessageBox('Отсутствует действующий тариф!'+#13+#10+
//                                   'Вы не можете подписать талон!', 'Информация', MB_ICONINFORMATION + MB_OK);
//            exit;
//          end;
//      finally
//        ods.Free;
//      end;
//    end;

  if CanPodpis = False then
    exit;

  if rowNameUsl.Tag = get_nevip then
    begin
      Application.MessageBox('Внимание! Услуга не является выполненной! Вы не можете подписать талон!',
                             'Предупреждение', mb_ok+mb_iconwarning);
      exit;
    end;
  if StrToDateTime(rowDateBeg.Properties.Value) > StrToDateTime(rowDateUsl.Properties.Value) then
    begin
      Application.MessageBox('Дата открытия талона не может быть больше даты выполнения услуги!',
                             'Предупреждение', mb_ok+mb_iconwarning);
      exit;
    end;
  if odsNaz.RecordCount > 1 then
    begin
      odsNaz.First;
      if trunc(StrToDateTime(rowDateBeg.Properties.Value)) <> trunc(odsNaz.FieldByName('fd_run').AsDateTime) then
        begin
          Application.MessageBox('Дата открытия талона должна быть равна дате выполнения первой услуги!',
                                 'Предупреждение', mb_ok+mb_iconwarning);
          exit;
        end;
    end else
    begin
      if trunc(StrToDateTime(rowDateBeg.Properties.Value)) <> trunc(StrToDateTime(rowDateUsl.Properties.Value)) then
        begin
          Application.MessageBox('Дата открытия талона должна быть равна дате выполнения услуги!',
                                 'Предупреждение', mb_ok+mb_iconwarning);
          exit;
        end;
    end;
  if odsInfo.FieldByName('db_name').AsString <> 'M' then
    begin
      if (rowNat.Properties.Value = null) or (rowNat.Properties.Value = '') or (rowNat.Tag = 0) then
        begin
          Application.MessageBox('Прежде чем подписать талон заполните графу "Гражданство"! ', 'Предупреждение', mb_iconwarning+mb_ok);
          rowNat.Focused := True;
          Exit;
        end;
    end;
  if odsInfo.FieldByName('db_name').AsString <> 'M' then
    begin
      if (rowSocStatus.Properties.Value = null) or (rowSocStatus.Properties.Value = '') or (rowSocStatus.Tag = 0) then
        begin
          Application.MessageBox('Прежде чем подписать талон заполните графу "Социальный статус"! ', 'Предупреждение', mb_iconwarning+mb_ok);
          rowSocStatus.Focused := True;
          Exit;
        end;
    end;
  if odsInfo.FieldByName('db_name').AsString <> 'M' then
    begin
      if (rowNapr.Properties.Value = null) or (rowNapr.Properties.Value = '') or (rowNapr.Tag = 0) then
        begin
          Application.MessageBox('Прежде чем подписать талон заполните графу "Направившее учреждение"! ', 'Предупреждение', mb_iconwarning+mb_ok);
          rowNapr.Focused := True;
          Exit;
        end;
    end;
  if odsInfo.FieldByName('db_name').AsString <> 'M' then
    begin
      if (rowPlace.Properties.Value = null) or (rowPlace.Properties.Value = '') or (rowPlace.Tag = 0) then
        begin
          Application.MessageBox('Прежде чем подписать талон заполните графу "Место обслуживания"! ', 'Предупреждение', mb_iconwarning+mb_ok);
          rowPlace.Focused := True;
          Exit;
        end;
    end;
  if odsInfo.FieldByName('db_name').AsString <> 'M' then
    begin
      if (rowReason.Properties.Value = null) or (rowReason.Properties.Value = '') or (rowReason.Tag = 0) then
        begin
          Application.MessageBox('Прежде чем подписать талон заполните графу "Цель посещения"! ', 'Предупреждение', mb_iconwarning+mb_ok);
          rowReason.Focused := True;
          Exit;
        end;
    end;
  if odsInfo.FieldByName('db_name').AsString <> 'M' then
    begin
      if (rowStandart.Properties.Value = null) or (rowStandart.Properties.Value = '') or (rowStandart.Tag = 0) then
        begin
          Application.MessageBox('Прежде чем подписать талон заполните графу "Стандарт медпомощи"! ', 'Предупреждение', mb_iconwarning+mb_ok);
          rowStandart.Focused := True;
          Exit;
        end;
    end;
  if (rowPolis.Properties.Value = null) or (rowPolis.Properties.Value = '') or (rowPolis.Tag = 0) then
    begin
      Application.MessageBox('Прежде чем подписать талон заполните графу "Вид оплаты"! ', 'Предупреждение', mb_iconwarning+mb_ok);
      rowPolis.Focused := True;
      Exit;
    end;
  if odsInfo.FieldByName('db_name').AsString <> 'M' then
    begin
      if (rowTypeMedHelp.Properties.Value = null) or (rowTypeMedHelp.Properties.Value = -1) or (rowTypeMedHelp.Properties.Value = 0) then
        begin
          Application.MessageBox('Прежде чем подписать талон заполните графу "Тип вида медицинской помощи"! ', 'Предупреждение', mb_iconwarning+mb_ok);
          rowTypeMedHelp.Focused := True;
          Exit;
        end;
    end;
  if odsInfo.FieldByName('db_name').AsString <> 'M' then
    begin
      if (rowRezim.Properties.Value = null) or (rowRezim.Properties.Value = -1) then
        begin
          Application.MessageBox('Прежде чем подписать талон заполните графу "Режим"! ', 'Предупреждение', mb_iconwarning+mb_ok);
          rowRezim.Focused := True;
          Exit;
        end;
    end;
  if odsInfo.FieldByName('db_name').AsString <> 'M' then
    begin
      if rowTypeTalon.Properties.Caption = 'Тип талона*' then
        begin
          if (rowTypeTalon.Properties.Value = null) or (rowTypeTalon.Properties.Value = -1) or (rowTypeTalon.Properties.Value = 0) then
            begin
              Application.MessageBox('Прежде чем подписать талон заполните графу "Тип талона"! ', 'Предупреждение', mb_iconwarning+mb_ok);
              rowTypeTalon.Focused := True;
              Exit;
            end;
        end;
    end;
  if (merDateNum.Visible = True) and (merDateNum.Properties.Editors[0].Caption = 'Дата*') then
    begin
      if merDateNum.Properties.Editors[0].Value = Null then
        begin
          Application.MessageBox('Прежде чем подписать талон заполните графу "Дата направления"! ', 'Предупреждение', mb_iconwarning+mb_ok);
          pcMain.ActivePageIndex := 0;
          merDateNum.Focused := True;
          Exit;
        end;
      if (merDateNum.Properties.Editors[1].Value = Null) or (VarToStr(merDateNum.Properties.Editors[1].Value) = '') then
        begin
          Application.MessageBox('Прежде чем подписать талон заполните графу "Номер направления"! ', 'Предупреждение', mb_iconwarning+mb_ok);
          pcMain.ActivePageIndex := 0;
          merDateNum.Focused := True;
          Exit;
        end;
    end;
  if odsInfo.FieldByName('db_name').AsString <> 'M' then
    begin
      if (rowUch.Visible = True) and (rowUch.Properties.Caption = 'Участок*') then
        begin
          if (rowUch.Tag = -1) or (rowUch.Tag = 0) then
            begin
              Application.MessageBox('Прежде чем подписать талон заполните графу "Участок"! ', 'Предупреждение', mb_iconwarning+mb_ok);
              pcMain.ActivePageIndex := 0;
              rowUch.Focused := True;
              Exit;
            end;
        end;
    end;
  if odsInfo.FieldByName('db_name').AsString = 'SK' then
    begin
      if (rowDSPred.Properties.Value = null) or (rowDSPred.Properties.Value = '') or (rowDSPred.Tag = 0) then
        begin
          Application.MessageBox('Прежде чем подписать талон заполните графу "Предварительный DS"! ', 'Предупреждение', mb_iconwarning+mb_ok);
          pcMain.ActivePageIndex := 1;
          rowDSPred.Focused := True;
          Exit;
        end;
    end;
  if (rowDSZakl.Properties.Value = null) or (rowDSZakl.Properties.Value = '') or (rowDSZakl.Tag = 0) then
    begin
      Application.MessageBox('Прежде чем подписать талон заполните графу "Заключительный основной DS"! ', 'Предупреждение', mb_iconwarning+mb_ok);
      pcMain.ActivePageIndex := 1;
      rowDSZakl.Focused := True;
      Exit;
    end;
  if (sLiterMkb ='S') or (sLiterMkb = 'T') then
    begin
      if (rowTravma.Tag = 0) or (rowTravma.Properties.Value = null) or (rowTravma.Properties.Value = '') then
        begin
          Application.MessageBox('Прежде чем подписать талон заполните графу "Вид травмы"! ', 'Предупреждение', mb_iconwarning+mb_ok);
          pcMain.ActivePageIndex := 0;
          rowTravma.Focused := True;
          Exit;
        end;
    end;
  if (odsInfo.FieldByName('db_name').AsString = 'SK') then
    begin
      if (rowVidPos.Visible = True) and (rowVidPos.Properties.Caption = 'Вид посещения*') then
        begin
          if (rowVidPos.Properties.Value = null) or (rowVidPos.Properties.Value = '0') or (rowVidPos.Properties.Value = '-1') then
            begin
              Application.MessageBox('Прежде чем подписать талон заполните графу "Вид посещения"! ', 'Предупреждение', mb_iconwarning+mb_ok);
              pcMain.ActivePageIndex := 0;
              rowVidPos.Focused := True;
              Exit;
            end;
        end;
    end;

  Application.CreateForm(TfrmCommit, frmCommit);
// -- ставим автоматически дату подписи
  if odsNaz.RecordCount > 1 then
    begin
      odsNaz.Last;
      frmCommit.rowDateRun.Properties.Value := DateTimeToStr(trunc(odsNaz.FieldByName('fd_run').AsDateTime));
    end else
    begin
      frmCommit.rowDateRun.Properties.Value := DateTimeToStr(trunc(StrToDateTime(rowDateUsl.Properties.Value)));
    end;
  try
    frmCommit.ShowModal;
    if frmCommit.ModalResult = mrOk then
      begin
        if CanPodpis = True then
          begin
            oq := TOracleQuery.Create(nil);
            try
              oq.Session := os;
              oq.Cursor := crSQLWait;
              oq.SQL.Text := ' update asu.tambtalon '+#13+
                             '    set fk_sotrclosed = :pfk_sotrclosed, fk_dopishodid = :pfk_dopishodid, fk_result = :pfk_result, '+#13+
                             '        fd_closed = :pfd_closed, fk_servplace = :pfk_servplace, fk_reason = :pfk_reason, fn_sos = 1 '+#13+
                             '  where fk_id = :pfk_id ';
              oq.DeclareAndSet('pfk_servplace', otInteger, rowPlace.Tag);
              oq.DeclareAndSet('pfk_reason', otInteger, rowReason.Tag);
              oq.DeclareAndSet('pfk_sotrclosed', otInteger, pSOTRID);
              oq.DeclareAndSet('pfk_dopishodid', otInteger, frmCommit.rowDop.Properties.Value);
              oq.DeclareAndSet('pfk_result', otInteger, frmCommit.rowResult.Properties.Value);
              oq.DeclareAndSet('pfd_closed', otDate, StrToDateTime(frmCommit.rowDateRun.Properties.Value));
              oq.DeclareAndSet('pfk_id', otInteger, pTALONID);
              oq.Execute;
              os.Commit;
              rowDateEnd.Properties.Value := frmCommit.rowDateRun.Properties.Value;
              rowResult.Properties.Value := frmCommit.odsRes.FieldByName('fc_name').AsString;
              rowDop.Properties.Value := frmCommit.odsDop.FieldByName('fc_name').AsString;
              aCommit.Enabled := False;
              aSave.Enabled := False;
              aSetDate.Enabled := False;
              merFIOMK.Options.Focusing := False;
              rowSos.Styles.Content := stBoldRed;
              rowSos.Properties.Value := 'Закрыт';
              rowDoc.Properties.Options.Editing := False;
              rowDoc.Properties.Options.ShowEditButtons := eisbNever;
              rowDoc.Options.Focusing := False;
              rowNat.Properties.Options.Editing := False;
              rowNat.Properties.Options.ShowEditButtons := eisbNever;
              rowNat.Options.Focusing := False;
              rowSocStatus.Properties.Options.Editing := False;
              rowSocStatus.Properties.Options.ShowEditButtons := eisbNever;
              rowSocStatus.Options.Focusing := False;
              rowDateBeg.Properties.Options.Editing := False;
              rowDateBeg.Properties.Options.ShowEditButtons := eisbNever;
              rowDateBeg.Options.Focusing := False;
              rowPolis.Properties.Options.Editing := False;
              rowPolis.Properties.Options.ShowEditButtons := eisbNever;
              rowPolis.Options.Focusing := False;
              rowPlace.Properties.Options.Editing := False;
              rowPlace.Properties.Options.ShowEditButtons := eisbNever;
              rowPlace.Options.Focusing := False;
              rowNapr.Properties.Options.Editing := False;
              rowNapr.Properties.Options.ShowEditButtons := eisbNever;
              rowNapr.Options.Focusing := False;
              rowReason.Properties.Options.Editing := False;
              rowReason.Properties.Options.ShowEditButtons := eisbNever;
              rowReason.Options.Focusing := False;
              rowTravma.Properties.Options.Editing := False;
              rowTravma.Properties.Options.ShowEditButtons := eisbNever;
              rowTravma.Options.Focusing := False;
              rowDSNapr.Properties.Options.Editing := False;
              rowDSNapr.Properties.Options.ShowEditButtons := eisbNever;
              rowDSNapr.Options.Focusing := False;
              rowDSPred.Properties.Options.Editing := False;
              rowDSPred.Properties.Options.ShowEditButtons := eisbNever;
              rowDSPred.Options.Focusing := False;
              rowDSZakl.Properties.Options.Editing := False;
              rowDSZakl.Properties.Options.ShowEditButtons := eisbNever;
              rowDSZakl.Options.Focusing := False;
              rowDSZaklSop.Properties.Options.Editing := False;
              rowDSZaklSop.Properties.Options.ShowEditButtons := eisbNever;
              rowDSZaklSop.Options.Focusing := False;
              frmMain.Caption := 'Данные амбулаторного талона. Талон закрыт для редактирования!';
              varRes := 1;
            finally
              oq.Free;
            end;
          end;
      end;
  finally
    frmCommit.Free;
  end;
end;

procedure TfrmMain.aSaveExecute(Sender: TObject);
var oq : TOracleQuery;
    ods : TOracleDataSet;
begin
  if VarToStr(rowDateBeg.Properties.Value) = '' then
    begin
      Application.MessageBox('Дата начала случая не может быть пустой!',
                             'Предупреждение', mb_ok+mb_iconwarning);
      rowDateBeg.Focused := True;
      CanPodpis := False;
      exit;
    end;
  if StrToDateTime(rowDateBeg.Properties.Value) > StrToDateTime(rowDateUsl.Properties.Value) then
    begin
      Application.MessageBox('Дата начала случая не может быть больше даты выполнения услуги!',
                             'Предупреждение', mb_ok+mb_iconwarning);
      CanPodpis := False;
      exit;
    end;
  if odsNaz.RecordCount > 1 then
    begin
      odsNaz.First;
      if trunc(StrToDateTime(rowDateBeg.Properties.Value)) <> trunc(odsNaz.FieldByName('fd_run').AsDateTime) then
        begin
          Application.MessageBox('Дата открытия талона должна быть равна дате выполнения первой услуги!',
                                 'Предупреждение', mb_ok+mb_iconwarning);
          CanPodpis := False;
          exit;
        end;
    end else
    begin
      if trunc(StrToDateTime(rowDateBeg.Properties.Value)) <> trunc(StrToDateTime(rowDateUsl.Properties.Value)) then
        begin
          Application.MessageBox('Дата начала случая должна быть равна дате выполнения услуги!',
                                 'Предупреждение', mb_ok+mb_iconwarning);
          CanPodpis := False;
          exit;
        end;
    end;

  CanPodpis := True;
  oq := TOracleQuery.Create(nil);
  ods := TOracleDataSet.Create(nil);
  try
    oq.Session := os;
    oq.Cursor := crSQLWait;
    ods.Session := os;
    ods.Cursor := crSQLWait;
//-- Документ
    oq.DeleteVariables;
    oq.SQL.Text := ' update asu.tpeoples '+#13+
                   '    set fk_docvid = :pfk_docvid, fc_docser = :pfc_docser, fc_docnum = :pfc_docnum, fc_docvidan = :pfc_docvidan '+#13+
                   '  where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfk_docvid', otInteger, rowDoc.Tag);
    oq.DeclareAndSet('pfc_docser', otString, sSerDoc);
    oq.DeclareAndSet('pfc_docnum', otString, sNumDoc);
    oq.DeclareAndSet('pfc_docvidan', otString, sKemDoc);
    oq.DeclareAndSet('pfk_id', otInteger, pPEPLID);
    oq.Execute;
//-- Направившее учреждение
    oq.DeleteVariables;
    oq.SQL.Text := ' merge into asu.tib using dual on '+#13+
                   '   (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''PD_NAPRAVIV_YCH'')) '+#13+
                   ' when not matched then '+#13+
                   '   insert(fk_smid, fk_smeditid, fk_vrachid, fk_pacid) '+#13+
                   '   values(:pfk_smid, (select fk_id from asu.tsmid where fc_synonim = ''PD_NAPRAVIV_YCH''), :pfk_vrachid, :pfk_pacid) '+#13+
                   ' when matched then '+#13+
                   '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid '+#13+
                   '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''PD_NAPRAVIV_YCH'') ';
    oq.DeclareAndSet('pfk_smid', otInteger, rowNapr.Tag);
    oq.DeclareAndSet('pfk_vrachid', otInteger, pSOTRID);
    oq.DeclareAndSet('pfk_pacid', otInteger, pTALONID);
    oq.Execute;
//-- Тип талона
    oq.DeleteVariables;
    oq.SQL.Text := ' merge into asu.tib using dual on '+#13+
                   '   (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''TALON_TYPE_CREATE'')) '+#13+
                   ' when not matched then '+#13+
                   '   insert(fk_smid, fk_smeditid, fk_vrachid, fk_pacid) '+#13+
                   '   values(:pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, :pfk_pacid) '+#13+
                   ' when matched then '+#13+
                   '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid '+#13+
                   '    where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_owner from asu.tsmid where fk_id = :pfk_smid) ';
    oq.DeclareAndSet('pfk_smid', otInteger, rowTypeTalon.Properties.Value);
    oq.DeclareAndSet('pfk_vrachid', otInteger, pSOTRID);
    oq.DeclareAndSet('pfk_pacid', otInteger, pTALONID);
    oq.Execute;
//-- Гражданство
    oq.DeleteVariables;
    oq.SQL.Text := ' merge into asu.tib using dual on '+#13+
                   '   (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''LD_GRAGZ'')) '+#13+
                   ' when not matched then '+#13+
                   '   insert(fk_smid, fk_smeditid, fk_vrachid, fk_pacid) '+#13+
                   '   values(:pfk_smid, (select fk_id from asu.tsmid where fc_synonim = ''LD_GRAGZ''), :pfk_vrachid, :pfk_pacid) '+#13+
                   ' when matched then '+#13+
                   '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid '+#13+
                   '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''LD_GRAGZ'') ';
    oq.DeclareAndSet('pfk_pacid', otInteger, pPEPLID);
    oq.DeclareAndSet('pfk_smid', otInteger, rowNat.Tag);
    oq.DeclareAndSet('pfk_vrachid', otInteger, pSOTRID);
    oq.Execute;
//-- Социальный статус
    oq.DeleteVariables;
    oq.SQL.Text := ' merge into asu.tib using dual on '+#13+
                   '   (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''LD_SOC_POL'')) '+#13+
                   ' when not matched then '+#13+
                   '   insert(fk_smid, fk_smeditid, fk_vrachid, fk_pacid) '+#13+
                   '   values(:pfk_smid, (select fk_id from asu.tsmid where fc_synonim = ''LD_SOC_POL''), :pfk_vrachid, :pfk_pacid) '+#13+
                   ' when matched then '+#13+
                   '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid '+#13+
                   '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''LD_SOC_POL'') ';
    oq.DeclareAndSet('pfk_pacid', otInteger, pPEPLID);
    oq.DeclareAndSet('pfk_smid', otInteger, rowSocStatus.Tag);
    oq.DeclareAndSet('pfk_vrachid', otInteger, pSOTRID);
    oq.Execute;
//-- Стандарт медицинской помощи
    oq.DeleteVariables;
    oq.SQL.Text := ' merge into asu.tib using dual on '+#13+
                   '   (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''CPD_STANDARTGROUP'')) '+#13+
                   ' when not matched then '+#13+
                   '   insert(fk_smid, fk_smeditid, fk_vrachid, fk_pacid) '+#13+
                   '   values(:pfk_smid, (select fk_id from asu.tsmid where fc_synonim = ''CPD_STANDARTGROUP''), :pfk_vrachid, :pfk_pacid) '+#13+
                   ' when matched then '+#13+
                   '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid '+#13+
                   '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''CPD_STANDARTGROUP'') ';
    oq.DeclareAndSet('pfk_pacid', otInteger, pTALONID);
    oq.DeclareAndSet('pfk_smid', otInteger, rowStandart.Tag);
    oq.DeclareAndSet('pfk_vrachid', otInteger, pSOTRID);
    oq.Execute;
//-- Тип вида медицинской помощи
    oq.DeleteVariables;
    oq.SQL.Text := ' merge into asu.tib using dual on '+#13+
                   '   (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''TYPE_V_MU'')) '+#13+
                   ' when not matched then '+#13+
                   '   insert(fk_smid, fk_smeditid, fk_vrachid, fk_pacid) '+#13+
                   '   values(:pfk_smid, (select fk_id from asu.tsmid where fc_synonim = ''TYPE_V_MU''), :pfk_vrachid, :pfk_pacid) '+#13+
                   ' when matched then '+#13+
                   '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid '+#13+
                   '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''TYPE_V_MU'') ';
    oq.DeclareAndSet('pfk_pacid', otInteger, pTALONID);
    oq.DeclareAndSet('pfk_smid', otInteger, rowTypeMedHelp.Properties.Value);
    oq.DeclareAndSet('pfk_vrachid', otInteger, pSOTRID);
    oq.Execute;
//-- Направительный диагноз
    if rowDSNapr.Tag <> 0 then
      begin
        if idNaprDiag <> 0 then
          begin
            oq.DeleteVariables;
            oq.SQL.Text := ' update asu.tdiag '+#13+
                           '    set fk_smdiagid = :pfk_smdiagid, fl_first = :pfl_first, fc_write = :pfc_write, '+#13+
                           '        fk_vrachid = :pfk_vrachid, fl_showib = :pfl_showib, fk_mkb_10 = :pfk_mkb_10, fd_date = sysdate '+#13+
                           ' where fk_id = :pfk_id ';
            oq.DeclareAndSet('pfk_smdiagid', otInteger, rowDSNapr.Tag);
            oq.DeclareAndSet('pfl_first', otInteger, nDSNapr_first);
            oq.DeclareAndSet('pfc_write', otString, sDSNapr_name);
            oq.DeclareAndSet('pfk_vrachid', otInteger, pSOTRID);
            oq.DeclareAndSet('pfl_showib', otInteger, nDSNapr_showib);
            oq.DeclareAndSet('pfk_mkb_10', otInteger, rowDSNapr.Tag);
            oq.DeclareAndSet('pfk_id', otInteger, idNaprDiag);
            oq.Execute;
          end else
          begin
            oq.DeleteVariables;
            oq.SQL.Text := ' insert into asu.tdiag '+#13+
                           '  (fk_pacid, fk_smdiagid, fp_type, fl_first, fc_write, fd_date, fk_vrachid, fl_main, fl_showib, fk_nazid, fk_mkb_10) '+#13+
                           '   values(:pfk_pacid, :pfk_smdiagid, (select fk_id from asu.tsmid where fc_synonim = ''S_MESTA_OTBORA''), '+#13+
                           '          :pfl_first, :pfc_write, sysdate, :pfk_vrachid, asu.get_maindiag, :pfl_showib, :pfk_nazid, :pfk_mkb_10) '+#13+
                           ' returning fk_id into :pfk_id ';
            oq.DeclareVariable('pfk_id', otInteger);
            oq.DeclareAndSet('pfk_pacid', otInteger, pPACID);
            oq.DeclareAndSet('pfk_smdiagid', otInteger, rowDSNapr.Tag);
            oq.DeclareAndSet('pfl_first', otInteger, nDSNapr_first);
            oq.DeclareAndSet('pfc_write', otString, sDSNapr_name);
            oq.DeclareAndSet('pfk_vrachid', otInteger, pSOTRID);
            oq.DeclareAndSet('pfl_showib', otInteger, nDSNapr_showib);
            oq.DeclareAndSet('pfk_nazid', otInteger, pNAZID);
            oq.DeclareAndSet('pfk_mkb_10', otInteger, rowDSNapr.Tag);
            oq.Execute;
            idNaprDiag := oq.GetVariable('pfk_id');
            oq.DeleteVariables;
            oq.SQL.Text := ' insert into asu.tambtalon_diags(fk_diagid, fk_talonid) '+#13+
                           ' values(:pfk_diagid, :pfk_talonid) ';
            oq.DeclareAndSet('pfk_diagid', otInteger, idNaprDiag);
            oq.DeclareAndSet('pfk_talonid', otInteger, pTALONID);
            oq.Execute;
          end;
      end;
//-- Предварительный диагноз
    if rowDSPred.Tag <> 0 then
      begin
        if idPredDiag <> 0 then
          begin
            oq.DeleteVariables;
            oq.SQL.Text := ' update asu.tdiag '+#13+
                           '    set fk_smdiagid = :pfk_smdiagid, fl_first = :pfl_first, fc_write = :pfc_write, '+#13+
                           '        fk_vrachid = :pfk_vrachid, fl_showib = :pfl_showib, fk_mkb_10 = :pfk_mkb_10, fd_date = sysdate '+#13+
                           ' where fk_id = :pfk_id ';
            oq.DeclareAndSet('pfk_smdiagid', otInteger, rowDSPred.Tag);
            oq.DeclareAndSet('pfl_first', otInteger, nDSPred_first);
            oq.DeclareAndSet('pfc_write', otString, sDSPred_name);
            oq.DeclareAndSet('pfk_vrachid', otInteger, pSOTRID);
            oq.DeclareAndSet('pfl_showib', otInteger, nDSPred_showib);
            oq.DeclareAndSet('pfk_mkb_10', otInteger, rowDSPred.Tag);
            oq.DeclareAndSet('pfk_id', otInteger, idPredDiag);
            oq.Execute;
          end else
          begin
            oq.DeleteVariables;
            oq.SQL.Text := ' insert into asu.tdiag '+#13+
                           '  (fk_pacid, fk_smdiagid, fp_type, fl_first, fc_write, fd_date, fk_vrachid, fl_main, fl_showib, fk_nazid, fk_mkb_10) '+#13+
                           '   values(:pfk_pacid, :pfk_smdiagid, (select fk_id from asu.tsmid where fc_synonim = ''NA_OSMOTRE''), '+#13+
                           '          :pfl_first, :pfc_write, sysdate, :pfk_vrachid, asu.get_maindiag, :pfl_showib, :pfk_nazid, :pfk_mkb_10) '+#13+
                           ' returning fk_id into :pfk_id ';
            oq.DeclareVariable('pfk_id', otInteger);
            oq.DeclareAndSet('pfk_pacid', otInteger, pPACID);
            oq.DeclareAndSet('pfk_smdiagid', otInteger, rowDSPred.Tag);
            oq.DeclareAndSet('pfl_first', otInteger, nDSPred_first);
            oq.DeclareAndSet('pfc_write', otString, sDSPred_name);
            oq.DeclareAndSet('pfk_vrachid', otInteger, pSOTRID);
            oq.DeclareAndSet('pfl_showib', otInteger, nDSPred_showib);
            oq.DeclareAndSet('pfk_nazid', otInteger, pNAZID);
            oq.DeclareAndSet('pfk_mkb_10', otInteger, rowDSPred.Tag);
            oq.Execute;
            idPredDiag := oq.GetVariable('pfk_id');
            oq.DeleteVariables;
            oq.SQL.Text := ' insert into asu.tambtalon_diags(fk_diagid, fk_talonid) '+#13+
                           ' values(:pfk_diagid, :pfk_talonid) ';
            oq.DeclareAndSet('pfk_diagid', otInteger, idPredDiag);
            oq.DeclareAndSet('pfk_talonid', otInteger, pTALONID);
            oq.Execute;
          end;
      end;

// Заключительный основной диагноз
    if rowDSZakl.Tag <> 0 then
      begin
        if idMainDiag <> 0 then
          begin
            oq.DeleteVariables;
            oq.SQL.Text := ' update asu.tdiag '+#13+
                           '    set fk_smdiagid = :pfk_smdiagid, fl_first = :pfl_first, fc_write = :pfc_write, '+#13+
                           '        fk_vrachid = :pfk_vrachid, fl_showib = :pfl_showib, fk_mkb_10 = :pfk_mkb_10, fd_date = sysdate '+#13+
                           ' where fk_id = :pfk_id ';
            oq.DeclareAndSet('pfk_smdiagid', otInteger, rowDSZakl.Tag);
            oq.DeclareAndSet('pfl_first', otInteger, nDSZakl_first);
            oq.DeclareAndSet('pfc_write', otString, sDSZakl_name);
            oq.DeclareAndSet('pfk_vrachid', otInteger, pSOTRID);
            oq.DeclareAndSet('pfl_showib', otInteger, nDSZakl_showib);
            oq.DeclareAndSet('pfk_mkb_10', otInteger, rowDSZakl.Tag);
            oq.DeclareAndSet('pfk_id', otInteger, idMainDiag);
            oq.Execute;
          end else
          begin
            oq.DeleteVariables;
            oq.SQL.Text := ' insert into asu.tdiag '+#13+
                           '  (fk_pacid, fk_smdiagid, fp_type, fl_first, fc_write, fd_date, fk_vrachid, fl_main, fl_showib, fk_nazid, fk_mkb_10) '+#13+
                           '   values(:pfk_pacid, :pfk_smdiagid, (select fk_id from asu.tsmid where fc_synonim = ''PRI_VYPISKE''), '+#13+
                           '          :pfl_first, :pfc_write, sysdate, :pfk_vrachid, asu.get_maindiag, :pfl_showib, :pfk_nazid, :pfk_mkb_10) '+#13+
                           ' returning fk_id into :pfk_id ';
            oq.DeclareVariable('pfk_id', otInteger);
            oq.DeclareAndSet('pfk_pacid', otInteger, pPACID);
            oq.DeclareAndSet('pfk_smdiagid', otInteger, rowDSZakl.Tag);
            oq.DeclareAndSet('pfl_first', otInteger, nDSZakl_first);
            oq.DeclareAndSet('pfc_write', otString, sDSZakl_name);
            oq.DeclareAndSet('pfk_vrachid', otInteger, pSOTRID);
            oq.DeclareAndSet('pfl_showib', otInteger, nDSZakl_showib);
            oq.DeclareAndSet('pfk_nazid', otInteger, pNAZID);
            oq.DeclareAndSet('pfk_mkb_10', otInteger, rowDSZakl.Tag);
            oq.Execute;
            idMainDiag := oq.GetVariable('pfk_id');
            oq.DeleteVariables;
            oq.SQL.Text := ' insert into asu.tambtalon_diags(fk_diagid, fk_talonid) '+#13+
                           ' values(:pfk_diagid, :pfk_talonid) ';
            oq.DeclareAndSet('pfk_diagid', otInteger, idMainDiag);
            oq.DeclareAndSet('pfk_talonid', otInteger, pTALONID);
            oq.Execute;
          end;
      end;
// Заключительный сопутствующий диагноз
    if rowDSZaklSop.Tag <> 0 then
      begin
        if idSoputDiag <> 0 then
          begin
            oq.DeleteVariables;
            oq.SQL.Text := ' update asu.tdiag '+#13+
                           '    set fk_smdiagid = :pfk_smdiagid, fl_first = :pfl_first, fc_write = :pfc_write, '+#13+
                           '        fk_vrachid = :pfk_vrachid, fl_showib = :pfl_showib, fk_mkb_10 = :pfk_mkb_10, fd_date = sysdate '+#13+
                           ' where fk_id = :pfk_id ';
            oq.DeclareAndSet('pfk_smdiagid', otInteger, rowDSZaklSop.Tag);
            oq.DeclareAndSet('pfl_first', otInteger, nDSZaklSop_first);
            oq.DeclareAndSet('pfc_write', otString, sDSZaklSop_name);
            oq.DeclareAndSet('pfk_vrachid', otInteger, pSOTRID);
            oq.DeclareAndSet('pfl_showib', otInteger, nDSZaklSop_showib);
            oq.DeclareAndSet('pfk_mkb_10', otInteger, rowDSZaklSop.Tag);
            oq.DeclareAndSet('pfk_id', otInteger, idSoputDiag);
            oq.Execute;
          end else
          begin
            oq.DeleteVariables;
            oq.SQL.Text := ' insert into asu.tdiag '+#13+
                           '  (fk_pacid, fk_smdiagid, fp_type, fl_first, fc_write, fd_date, fk_vrachid, fl_main, fl_showib, fk_nazid, fk_mkb_10) '+#13+
                           '   values(:pfk_pacid, :pfk_smdiagid, (select fk_id from asu.tsmid where fc_synonim = ''PRI_VYPISKE''), '+#13+
                           '          :pfl_first, :pfc_write, sysdate, :pfk_vrachid, asu.get_soputdiag, :pfl_showib, :pfk_nazid, :pfk_mkb_10) '+#13+
                           ' returning fk_id into :pfk_id ';
            oq.DeclareVariable('pfk_id', otInteger);
            oq.DeclareAndSet('pfk_pacid', otInteger, pPACID);
            oq.DeclareAndSet('pfk_smdiagid', otInteger, rowDSZaklSop.Tag);
            oq.DeclareAndSet('pfl_first', otInteger, nDSZaklSop_first);
            oq.DeclareAndSet('pfc_write', otString, sDSZaklSop_name);
            oq.DeclareAndSet('pfk_vrachid', otInteger, pSOTRID);
            oq.DeclareAndSet('pfl_showib', otInteger, nDSZaklSop_showib);
            oq.DeclareAndSet('pfk_nazid', otInteger, pNAZID);
            oq.DeclareAndSet('pfk_mkb_10', otInteger, rowDSZaklSop.Tag);
            oq.Execute;
            idSoputDiag := oq.GetVariable('pfk_id');
            oq.DeleteVariables;
            oq.SQL.Text := ' insert into asu.tambtalon_diags(fk_diagid, fk_talonid) '+#13+
                           ' values(:pfk_diagid, :pfk_talonid) ';
            oq.DeclareAndSet('pfk_diagid', otInteger, idSoputDiag);
            oq.DeclareAndSet('pfk_talonid', otInteger, pTALONID);
            oq.Execute;
          end;
      end;
// Талон
    oq.DeleteVariables;
    oq.SQL.Text := ' update asu.tambtalon_info '+#13+
                   '    set fk_visitvid = :pfk_visitvid '+#13+
                   '  where fk_talonid = :pfk_talonid ';
    oq.DeclareAndSet('pfk_visitvid', otInteger, rowVidPos.Properties.Value);
    oq.DeclareAndSet('pfk_talonid', otInteger, pTALONID);
    oq.Execute;
    oq.DeleteVariables;
    oq.SQL.Text := ' update asu.tambtalon '+#13+
                   '    set fd_opened = :pfd_opened, fk_servplace = :pfk_servplace, fk_reason = :pfk_reason, fk_travma = :pfk_travma, '+#13+
                   '        fk_diagmain = :pfk_diagmain, fk_diagsub = :pfk_diagsub, fk_diagmainpred = :pfk_diagmainpred, '+#13+
                   '        fk_insuranceid = :pfk_insuranceid, fk_sotrid = :pfk_sotrid, fd_naprdate = :pfd_naprdate, fc_naprnum = :pfc_naprnum, '+#13+
                   '        fk_uchid = :pfk_uchid, fk_rezhimid = :pfk_rezhimid '+#13+
                   '  where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfd_opened', otDate, rowDateBeg.Properties.Value);
    oq.DeclareAndSet('pfk_servplace', otInteger, rowPlace.Tag);
    oq.DeclareAndSet('pfk_reason', otInteger, rowReason.Tag);
    oq.DeclareAndSet('pfk_travma', otInteger, rowTravma.Tag);
    oq.DeclareAndSet('pfk_diagmain', otInteger, idMainDiag);
    oq.DeclareAndSet('pfk_diagsub', otInteger, idSoputDiag);
    oq.DeclareAndSet('pfk_diagmainpred', otInteger, idPredDiag);
    oq.DeclareAndSet('pfk_id', otInteger, pTALONID);
    oq.DeclareAndSet('pfk_insuranceid', otInteger, rowPolis.Tag);
    oq.DeclareAndSet('pfk_sotrid', otInteger, rowSotr.Tag);
    oq.DeclareAndSet('pfd_naprdate', otDate, merDateNum.Properties.Editors[0].Value);
    oq.DeclareAndSet('pfc_naprnum', otString, merDateNum.Properties.Editors[1].Value);
    oq.DeclareAndSet('pfk_uchid', otInteger, rowUch.Tag);
    oq.DeclareAndSet('pfk_rezhimid', otInteger, rowRezim.Properties.Value);
    oq.Execute;
    os.Commit;
  finally
    oq.Free;
  end;
end;

procedure TfrmMain.aSetDateExecute(Sender: TObject);
begin
  if odsNaz.RecordCount > 1 then
    begin
      odsNaz.First;
      rowDateBeg.Properties.Value := odsNaz.FieldByName('fd_run_str_tr').AsString;
    end else
    begin
      rowDateBeg.Properties.Value := rowDateUsl.Properties.Value;
    end;
end;

procedure TfrmMain.bCloseClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmMain.DoShowfrmMain(nPacid, nNazid, nSotrid, nAppSotrid: Integer);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  Screen.Cursor := crSQLWait;
  try
  pPACID := nPacid;
  pNAZID := nNazid;
  pSOTRID := nSotrid;
  pAPPSOTRID := nAppSotrid;
//-- "Заряжаем" датасеты
  if odsTypeTalon.Active = False then
    odsTypeTalon.Active := True;
  if odsTypeMedHelp.Active = False then
    odsTypeMedHelp.Active := True;
  if odsRezim.Active = False then
    odsRezim.Active := True;
  if odsVidPos.Active = False then
    odsVidPos.Active := True;
  if odsInfo.Active = False then
    odsInfo.Open;

  if odsInfo.FieldByName('db_name').AsString = 'SK' then
    rowDSPred.Properties.Caption := 'Предварительный DS*'
  else
    rowDSPred.Properties.Caption := 'Предварительный DS';

  if odsInfo.FieldByName('db_name').AsString = 'M' then
    begin
      rowNat.Properties.Caption := 'Гражданство';
      rowSocStatus.Properties.Caption := 'Социальный статус';
      rowNapr.Properties.Caption := 'Направившее учреждение';
      rowStandart.Properties.Caption := 'Стандарт медпомощи';
      rowTypeMedHelp.Properties.Caption := 'Тип вида медицинской помощи';
      rowRezim.Properties.Caption := 'Режим';
      rowTypeTalon.Properties.Caption := 'Тип талона';
      rowUch.Properties.Caption := 'Участок';
    end else
    begin
      rowNat.Properties.Caption := 'Гражданство*';
      rowSocStatus.Properties.Caption := 'Социальный статус*';
      rowNapr.Properties.Caption := 'Направившее учреждение*';
      rowStandart.Properties.Caption := 'Стандарт медпомощи*';
      rowTypeMedHelp.Properties.Caption := 'Тип вида медицинской помощи*';
      rowRezim.Properties.Caption := 'Режим*';
      rowTypeTalon.Properties.Caption := 'Тип талона*';
      rowUch.Properties.Caption := 'Участок*';
    end;

  if odsTalon.Active = False then
    odsTalon.Open;
  odsCntOut.Close;
  odsCntOut.SetVariable('pTalonID', odsTalon.FieldByName('fk_id').AsInteger);
  odsCntOut.Open;
  DoTalonMode;
  get_nevip := odsTalon.FieldByName('get_nevip').AsInteger;
//-- "Поднимаем" данные
    ods.Session := os;
//-- гражданство
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''LD_GRAGZ'') ';
    ods.DeclareAndSet('pfk_pacid', otInteger, pPEPLID);
    ods.Open;
    rowNat.Properties.Value := ods.FieldByName('smname').AsString;
    rowNat.Tag := ods.FieldByName('fk_smid').AsInteger;
//-- социальный статус
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''LD_SOC_POL'') ';
    ods.DeclareAndSet('pfk_pacid', otInteger, pPEPLID);
    ods.Open;
    rowSocStatus.Properties.Value := ods.FieldByName('smname').AsString;
    rowSocStatus.Tag := ods.FieldByName('fk_smid').AsInteger;
//-- направившее учреждение
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''PD_NAPRAVIV_YCH'') ';
    ods.DeclareAndSet('pfk_pacid', otInteger, pTALONID);
    ods.Open;
    rowNapr.Properties.Value := ods.FieldByName('smname').AsString;
    rowNapr.Tag := ods.FieldByName('fk_smid').AsInteger;
//-- Стандарт мед помощи
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''CPD_STANDARTGROUP'') ';
    ods.DeclareAndSet('pfk_pacid', otInteger, pTALONID);
    ods.Open;
    rowStandart.Properties.Value := ods.FieldByName('smname').AsString;
    rowStandart.Tag := ods.FieldByName('fk_smid').AsInteger;
    if ods.FieldByName('smname').AsString = '' then
      begin
        ods.DeleteVariables;
        ods.Close;
        ods.SQL.Text := ' select fk_id, fc_name from asu.tsmid where fk_default = 1 start with fc_synonim = ''CPD_STANDARTGROUP'' connect by prior fk_id = fk_owner ';
        ods.Open;
        rowStandart.Properties.Value := ods.FieldByName('fc_name').AsString;
        rowStandart.Tag := ods.FieldByName('fk_id').AsInteger;
      end;
//-- Тип вида мед помощи
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''TYPE_V_MU'') ';
    ods.DeclareAndSet('pfk_pacid', otInteger, pTALONID);
    ods.Open;
    rowTypeMedHelp.Properties.Value := ods.FieldByName('fk_smid').AsInteger;
    odsTypeMedHelp.Locate('fk_id', ods.FieldByName('fk_smid').AsInteger, []);
    if rowTypeMedHelp.Properties.Value = 0 then
      begin
        ods.Close;
        ods.DeleteVariables;
        ods.SQL.Text := ' select fk_id, fc_name '+#13+
                        '   from asu.tsmid '+#13+
                        '  where fk_owner = (select fk_id from asu.tsmid where fc_synonim = ''TYPE_V_MU'') '+#13+
                        '    and fk_default = 1 ';
        ods.Open;
        rowTypeMedHelp.Properties.Value := ods.FieldByName('fk_id').AsInteger;
        odsTypeMedHelp.Locate('fk_id', ods.FieldByName('fk_id').AsInteger, []);
      end;
//-- Вид посещения
    if odsInfo.FieldByName('db_name').AsString = 'SK' then
      begin
        ods.Close;
        ods.DeleteVariables;
        ods.SQL.Text := ' select fk_visitvid '+#13+
                        '   from asu.tambtalon_info '+#13+
                        '  where fk_talonid = :pfk_talonid ';
        ods.DeclareAndSet('pfk_talonid', otInteger, pTALONID);
        ods.Open;
        rowVidPos.Properties.Value := ods.FieldByName('fk_visitvid').AsInteger;
        odsVidPos.Locate('fk_id', ods.FieldByName('fk_visitvid').AsInteger, []);
        if rowVidPos.Properties.Value = 0 then
          begin
            ods.Close;
            ods.DeleteVariables;
            ods.SQL.Text := ' select fk_id, fc_name '+#13+
                            '   from asu.tsmid '+#13+
                            '  where fk_owner = (select fk_id from asu.tsmid where fc_synonim = ''VID_AMB_POS'') '+#13+
                            '    and fk_default = 1 ';
            ods.Open;
            rowVidPos.Properties.Value := ods.FieldByName('fk_id').AsInteger;
            odsVidPos.Locate('fk_id', ods.FieldByName('fk_id').AsInteger, []);
          end;
      end else
      begin
        rowVidPos.Visible := False;
      end;
//-- Тип талона
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''TALON_TYPE_CREATE'') ';
    ods.DeclareAndSet('pfk_pacid', otInteger, pTALONID);
    ods.Open;
    rowTypeTalon.Properties.Value := ods.FieldByName('fk_smid').AsInteger;
    odsTypeTalon.Locate('fk_id', ods.FieldByName('fk_smid').AsInteger, []);
    if (rowTypeTalon.Properties.Value = 0) and (odsInfo.FieldByName('db_name').AsString = 'SK') then
      begin
        ods.Close;
        ods.DeleteVariables;
        ods.SQL.Text := ' select fk_id, fc_name '+#13+
                        '   from asu.tsmid '+#13+
                        '  where fk_owner = (select fk_id from asu.tsmid where fc_synonim = ''TALON_TYPE_CREATE'') '+#13+
                        '    and fk_default = 1 ';
        ods.Open;
        rowTypeTalon.Properties.Value := ods.FieldByName('fk_id').AsInteger;
        odsTypeTalon.Locate('fk_id', ods.FieldByName('fk_id').AsInteger, []);
      end;
    merDateNum.Visible := odsTypeTalon.FieldByName('fc_synonim').AsString = 'TALON_TYPE_CREATE_NAPR';
    rowUch.Visible := odsTypeTalon.FieldByName('fc_synonim').AsString = 'TALON_TYPE_CREATE_PRIKREP';
//-- Услуга и дата выполнения услуги
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' select to_char(fd_run, ''dd.mm.yyyy hh24:mi'') as daterun, fc_name, fk_nazsosid, fk_smid '+#13+
                    '   from asu.vnaz where fk_id = :pfk_id ';
    ods.DeclareAndSet('pfk_id', otInteger, pNAZID);
    ods.Open;
    rowNameUsl.Properties.Value := ods.FieldByName('fc_name').AsString;
    rowNameUsl.Tag := ods.FieldByName('fk_nazsosid').AsInteger;
    rowDateUsl.Properties.Value := ods.FieldByName('daterun').AsString;
    pSMID := ods.FieldByName('fk_smid').AsInteger;
//-- Диагнозы
    GetDiags;
//-- Назначения
  if odsNaz.Active = False then
    odsNaz.Active := True;
  if odsNaz.RecordCount > 1 then
    begin
      odsNaz.Last;
      rowDateUsl.Properties.Value := odsNaz.FieldByName('fd_run_str').AsString;
      tsNaz.TabVisible := True;
    end else
    begin
      tsNaz.TabVisible := False;
    end;
  finally
    ods.Free;
    Screen.Cursor := crDefault;
  end;    
end;

procedure TfrmMain.DoTalonMode;
begin
  rowSos.Properties.Value := odsTalon.FieldByName('sos').AsString;
  rowDateBeg.Properties.Value := odsTalon.FieldByName('fd_opened').AsString;
  rowDateEnd.Properties.Value := odsTalon.FieldByName('fd_closed').AsString;
  rowSotr.Properties.Value := odsTalon.FieldByName('sotrfio').AsString;
  rowSotr.Tag := odsTalon.FieldByName('fk_sotrid').AsInteger;
  rowPlace.Properties.Value := odsTalon.FieldByName('servplace').AsString;
  rowPlace.Tag := odsTalon.FieldByName('fk_servplace').AsInteger;
//-- Вид оплаты (полис)
  odsPolis.Close;
  odsPolis.SetVariable('pTalonID', odsTalon.FieldByName('fk_insuranceid').AsInteger);
  odsPolis.Open;
  rowPolis.Properties.Value := odsPolis.FieldByName('oplataname').AsString;
  rowPolis.Tag := odsTalon.FieldByName('fk_insuranceid').AsInteger;
  if odsPolis.FieldByName('fc_synonim').AsString = 'OMS' then
    begin
      rowTypeTalon.Properties.Caption := 'Тип талона*';
      rowUch.Properties.Caption := 'Участок*';
      merDateNum.Properties.Editors[0].Caption := 'Дата*';
      merDateNum.Properties.Editors[1].Caption := 'Номер*';
      rowVidPos.Properties.Caption := 'Вид посещения*';
    end else
    begin
      rowTypeTalon.Properties.Caption := 'Тип талона';
      rowUch.Properties.Caption := 'Участок';
      merDateNum.Properties.Editors[0].Caption := 'Дата';
      merDateNum.Properties.Editors[1].Caption := 'Номер';
      rowVidPos.Properties.Caption := 'Вид посещения';      
    end;

  rowReason.Properties.Value := odsTalon.FieldByName('reason').AsString;
  rowReason.Tag := odsTalon.FieldByName('fk_reason').AsInteger;
  rowTravma.Properties.Value := odsTalon.FieldByName('travma').AsString;
  rowTravma.Tag := odsTalon.FieldByName('fk_travma').AsInteger;
  rowResult.Properties.Value := odsTalon.FieldByName('resultpos').AsString;
  rowDop.Properties.Value := odsTalon.FieldByName('dopishod').AsString;
  if DateTimeToStr(odsTalon.FieldByName('fd_naprdate').AsDateTime) = '30.12.1899' then
    merDateNum.Properties.Editors[0].Value := null
  else
    merDateNum.Properties.Editors[0].Value := odsTalon.FieldByName('fd_naprdate').AsDateTime;
  merDateNum.Properties.Editors[1].Value := odsTalon.FieldByName('fc_naprnum').AsString;
  if copy(odsTalon.FieldByName('uch').AsString, 1, Pos(';', odsTalon.FieldByName('uch').AsString)-1) = '' then
    rowUch.Tag := -1
  else
    rowUch.Tag := StrToInt(copy(odsTalon.FieldByName('uch').AsString, 1, Pos(';', odsTalon.FieldByName('uch').AsString)-1));
  rowUch.Properties.Value := copy(odsTalon.FieldByName('uch').AsString, Length(IntToStr(rowUch.Tag))+2, Length(odsTalon.FieldByName('uch').AsString) - Length(IntToStr(rowUch.Tag)));
  rowRezim.Properties.Value := odsTalon.FieldByName('fk_rezhimid').AsInteger;
  odsRezim.Locate('fk_id', odsTalon.FieldByName('fk_rezhimid').AsInteger, []);
  pTALONID := odsTalon.FieldByName('fk_id').AsInteger;
  varRes := odsTalon.FieldByName('fn_sos').AsInteger;
//-- талон выгружен
  if odsCntOut.FieldByName('cnt_out').AsInteger > 0 then
    begin
      frmMain.Caption := 'Данные амбулаторного талона. Талон выгружен и закрыт для редактирования!';
      aCommit.Enabled := False;
      aSave.Enabled := False;
      aSetDate.Enabled := False;
      merFIOMK.Options.Focusing := False;
      rowSos.Styles.Content := stBoldRed;
      rowDoc.Properties.Options.Editing := False;
      rowDoc.Properties.Options.ShowEditButtons := eisbNever;
      rowDoc.Options.Focusing := False;
      rowNat.Properties.Options.Editing := False;
      rowNat.Properties.Options.ShowEditButtons := eisbNever;
      rowNat.Options.Focusing := False;
      rowSocStatus.Properties.Options.Editing := False;
      rowSocStatus.Properties.Options.ShowEditButtons := eisbNever;
      rowSocStatus.Options.Focusing := False;
      rowDateBeg.Properties.Options.Editing := False;
      rowDateBeg.Properties.Options.ShowEditButtons := eisbNever;
      rowDateBeg.Options.Focusing := False;
      rowPolis.Properties.Options.Editing := False;
      rowPolis.Properties.Options.ShowEditButtons := eisbNever;
      rowPolis.Options.Focusing := False;
      rowPlace.Properties.Options.Editing := False;
      rowPlace.Properties.Options.ShowEditButtons := eisbNever;
      rowPlace.Options.Focusing := False;
      rowNapr.Properties.Options.Editing := False;
      rowNapr.Properties.Options.ShowEditButtons := eisbNever;
      rowNapr.Options.Focusing := False;
      rowReason.Properties.Options.Editing := False;
      rowReason.Properties.Options.ShowEditButtons := eisbNever;
      rowReason.Options.Focusing := False;
      rowTravma.Properties.Options.Editing := False;
      rowTravma.Properties.Options.ShowEditButtons := eisbNever;
      rowTravma.Options.Focusing := False;
      rowDSNapr.Properties.Options.Editing := False;
      rowDSNapr.Properties.Options.ShowEditButtons := eisbNever;
      rowDSNapr.Options.Focusing := False;
      rowDSPred.Properties.Options.Editing := False;
      rowDSPred.Properties.Options.ShowEditButtons := eisbNever;
      rowDSPred.Options.Focusing := False;
      rowDSZakl.Properties.Options.Editing := False;
      rowDSZakl.Properties.Options.ShowEditButtons := eisbNever;
      rowDSZakl.Options.Focusing := False;
      rowDSZaklSop.Properties.Options.Editing := False;
      rowDSZaklSop.Properties.Options.ShowEditButtons := eisbNever;
      rowDSZaklSop.Options.Focusing := False;
      rowTypeTalon.Properties.Options.Editing := False;
      rowTypeTalon.Properties.Options.ShowEditButtons := eisbNever;
      rowTypeTalon.Options.Focusing := False;
      rowStandart.Properties.Options.Editing := False;
      rowStandart.Properties.Options.ShowEditButtons := eisbNever;
      rowStandart.Options.Focusing := False;
      rowTypeMedHelp.Properties.Options.Editing := False;
      rowTypeMedHelp.Properties.Options.ShowEditButtons := eisbNever;
      rowTypeMedHelp.Options.Focusing := False;
      rowRezim.Properties.Options.Editing := False;
      rowRezim.Properties.Options.ShowEditButtons := eisbNever;
      rowRezim.Options.Focusing := False;
      rowVidPos.Properties.Options.Editing := False;
      rowVidPos.Properties.Options.ShowEditButtons := eisbNever;
      rowVidPos.Options.Focusing := False;

      merDateNum.Options.Focusing := False;
      merDateNum.Properties.Editors[0].Options.Editing := False;
      merDateNum.Properties.Editors[0].Options.ShowEditButtons := eisbNever;
      merDateNum.Properties.Editors[1].Options.Editing := False;
      merDateNum.Properties.Editors[1].Options.ShowEditButtons := eisbNever;
      exit;
    end;
//-- если есть админские права - даём редактировать
  if (odsInfo.FieldByName('is_admin').AsInteger = 1) and (odsTalon.FieldByName('fn_sos').AsInteger <> 0) then
    begin
      frmMain.Caption := 'Данные амбулаторного талона. Право администратора - талон открыт для редактирования!';
      exit;
    end;
//-- талон подписан
  if odsTalon.FieldByName('fn_sos').AsInteger <> 0 then
    begin
      frmMain.Caption := 'Данные амбулаторного талона. Талон подписан и закрыт для редактирования!';
      aCommit.Enabled := False;
      aSave.Enabled := False;
      aSetDate.Enabled := False;
      merFIOMK.Options.Focusing := False;
      rowSos.Styles.Content := stBoldRed;
      rowDoc.Properties.Options.Editing := False;
      rowDoc.Properties.Options.ShowEditButtons := eisbNever;
      rowDoc.Options.Focusing := False;
      rowNat.Properties.Options.Editing := False;
      rowNat.Properties.Options.ShowEditButtons := eisbNever;
      rowNat.Options.Focusing := False;
      rowSocStatus.Properties.Options.Editing := False;
      rowSocStatus.Properties.Options.ShowEditButtons := eisbNever;
      rowSocStatus.Options.Focusing := False;
      rowDateBeg.Properties.Options.Editing := False;
      rowDateBeg.Properties.Options.ShowEditButtons := eisbNever;
      rowDateBeg.Options.Focusing := False;
      rowPolis.Properties.Options.Editing := False;
      rowPolis.Properties.Options.ShowEditButtons := eisbNever;
      rowPolis.Options.Focusing := False;
      rowPlace.Properties.Options.Editing := False;
      rowPlace.Properties.Options.ShowEditButtons := eisbNever;
      rowPlace.Options.Focusing := False;
      rowNapr.Properties.Options.Editing := False;
      rowNapr.Properties.Options.ShowEditButtons := eisbNever;
      rowNapr.Options.Focusing := False;
      rowReason.Properties.Options.Editing := False;
      rowReason.Properties.Options.ShowEditButtons := eisbNever;
      rowReason.Options.Focusing := False;
      rowTravma.Properties.Options.Editing := False;
      rowTravma.Properties.Options.ShowEditButtons := eisbNever;
      rowTravma.Options.Focusing := False;
      rowDSNapr.Properties.Options.Editing := False;
      rowDSNapr.Properties.Options.ShowEditButtons := eisbNever;
      rowDSNapr.Options.Focusing := False;
      rowDSPred.Properties.Options.Editing := False;
      rowDSPred.Properties.Options.ShowEditButtons := eisbNever;
      rowDSPred.Options.Focusing := False;
      rowDSZakl.Properties.Options.Editing := False;
      rowDSZakl.Properties.Options.ShowEditButtons := eisbNever;
      rowDSZakl.Options.Focusing := False;
      rowDSZaklSop.Properties.Options.Editing := False;
      rowDSZaklSop.Properties.Options.ShowEditButtons := eisbNever;
      rowDSZaklSop.Options.Focusing := False;
      rowTypeTalon.Properties.Options.Editing := False;
      rowTypeTalon.Properties.Options.ShowEditButtons := eisbNever;
      rowTypeTalon.Options.Focusing := False;
      merDateNum.Options.Focusing := False;
      merDateNum.Properties.Editors[0].Options.Editing := False;
      merDateNum.Properties.Editors[0].Options.ShowEditButtons := eisbNever;
      merDateNum.Properties.Editors[1].Options.Editing := False;
      merDateNum.Properties.Editors[1].Options.ShowEditButtons := eisbNever;
      rowStandart.Properties.Options.Editing := False;
      rowStandart.Properties.Options.ShowEditButtons := eisbNever;
      rowStandart.Options.Focusing := False;
      rowTypeMedHelp.Properties.Options.Editing := False;
      rowTypeMedHelp.Properties.Options.ShowEditButtons := eisbNever;
      rowTypeMedHelp.Options.Focusing := False;
      rowRezim.Properties.Options.Editing := False;
      rowRezim.Properties.Options.ShowEditButtons := eisbNever;
      rowRezim.Options.Focusing := False;
      rowVidPos.Properties.Options.Editing := False;
      rowVidPos.Properties.Options.ShowEditButtons := eisbNever;
      rowVidPos.Options.Focusing := False;
    end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  {$IFDEF USE_NEW_AUTH}
    GetSession(os,'ASU');
  {$ELSE}
    os.LogonUsername := 'ASU';
    os.LogonPassword := 'ASU';
    os.LogonDatabase := 'ASU';
    os.Connected:=True;
  {$ENDIF}    
  pcMain.ActivePageIndex := 0;
end;

procedure TfrmMain.GetDiags;
var ods : TOracleDataSet;
begin
  idNaprDiag := 0;
  idPredDiag := 0;
  idMainDiag := 0;
  idSoputDiag := 0;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select tdiag.fk_id, tdiag.fk_pacid, tdiag.fk_smdiagid, tdiag.fk_vrachid, tdiag.fl_main, '+#13+
                    '        asu.get_soputdiag, asu.get_maindiag, '+#13+
                    '        tdiag.fp_type, tdiag.fl_first, tdiag.fd_date, tdiag.fc_write, '+#13+
                    '        (select fk_mkb10 from asu.tsmid where fk_id = tdiag.fk_smdiagid) as fk_mkb10, '+#13+
                    '        tdiag.fc_write, '+#13+
                    '        tdiag.fk_vrachid, tdiag.fl_main, tdiag.fl_showib, tdiag.fk_nazid, tdiag.fk_mkb_10, '+#13+
                    '        (select fc_synonim from asu.tsmid where fk_id = tdiag.fp_type) as typesyn '+#13+
                    '   from asu.tdiag '+#13+
                    '  where tdiag.fk_nazid = :pfk_nazid ';
    ods.DeclareAndSet('pfk_nazid', otInteger, pNAZID);
    ods.Open;
    if ods.RecordCount > 0 then
      begin
        ods.First;
        while not ods.Eof do
          begin
            if ods.FieldByName('typesyn').AsString = 'S_MESTA_OTBORA' then
              begin
                idNaprDiag := ods.FieldByName('fk_id').AsInteger;
                nDSNapr_first := ods.FieldByName('fl_first').AsInteger;
                nDSNapr_showib := ods.FieldByName('fl_showib').AsInteger;
                sDSNapr_name := ods.FieldByName('fc_write').AsString;
                rowDSNapr.Tag := ods.FieldByName('fk_smdiagid').AsInteger;
                rowDSNapr.Properties.Value := '('+ods.FieldByName('fk_mkb10').AsString+') '+ods.FieldByName('fc_write').AsString;
                nDSNapr_sotrid := ods.FieldByName('fl_showib').AsInteger;
              end;
            if ods.FieldByName('typesyn').AsString = 'NA_OSMOTRE' then
              begin
                idPredDiag := ods.FieldByName('fk_id').AsInteger;
                nDSPred_first := ods.FieldByName('fl_first').AsInteger;
                nDSPred_showib := ods.FieldByName('fl_showib').AsInteger;
                sDSPred_name := ods.FieldByName('fc_write').AsString;
                rowDSPred.Tag := ods.FieldByName('fk_smdiagid').AsInteger;
                rowDSPred.Properties.Value := '('+ods.FieldByName('fk_mkb10').AsString+') '+ods.FieldByName('fc_write').AsString;
                nDSPred_sotrid := ods.FieldByName('fl_showib').AsInteger;
              end;
            if ods.FieldByName('typesyn').AsString = 'PRI_VYPISKE' then
              begin
                if ods.FieldByName('fl_main').AsInteger = ods.FieldByName('get_maindiag').AsInteger then
                  begin
                    idMainDiag := ods.FieldByName('fk_id').AsInteger;
                    nDSZakl_first := ods.FieldByName('fl_first').AsInteger;
                    nDSZakl_showib := ods.FieldByName('fl_showib').AsInteger;
                    sDSZakl_name := ods.FieldByName('fc_write').AsString;
                    rowDSZakl.Tag := ods.FieldByName('fk_smdiagid').AsInteger;
                    rowDSZakl.Properties.Value := '('+ods.FieldByName('fk_mkb10').AsString+') '+ods.FieldByName('fc_write').AsString;
                    nDSZakl_sotrid := ods.FieldByName('fl_showib').AsInteger;
                    sLiterMkb := copy(ods.FieldByName('FK_MKB10').AsString, 1, 1);
                  end;
                if ods.FieldByName('fl_main').AsInteger = ods.FieldByName('get_soputdiag').AsInteger then
                  begin
                    idSoputDiag := ods.FieldByName('fk_id').AsInteger;
                    nDSZaklSop_first := ods.FieldByName('fl_first').AsInteger;
                    nDSZaklSop_showib := ods.FieldByName('fl_showib').AsInteger;
                    sDSZaklSop_name := ods.FieldByName('fc_write').AsString;
                    rowDSZaklSop.Tag := ods.FieldByName('fk_smdiagid').AsInteger;
                    rowDSZaklSop.Properties.Value := '('+ods.FieldByName('fk_mkb10').AsString+') '+ods.FieldByName('fc_write').AsString;
                    nDSZaklSop_sotrid := ods.FieldByName('fl_showib').AsInteger;
                  end;
              end;
            ods.Next;
          end;
      end;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.GetValue(str1: string);
begin
  MessageDlg(str1, mtWarning, [mbOK], 0);
end;

procedure TfrmMain.odsInfoAfterOpen(DataSet: TDataSet);
begin
  merFIOMK.Properties.Editors[0].Value := odsInfo.FieldByName('PACFIO').AsString;
  merFIOMK.Properties.Editors[1].Value := odsInfo.FieldByName('IB').AsString;
  merDateAgeSex.Properties.Editors[0].Value := odsInfo.FieldByName('FD_ROJD').AsString;
  merDateAgeSex.Properties.Editors[1].Value := odsInfo.FieldByName('PACAGE').AsString;
  merDateAgeSex.Properties.Editors[2].Value := odsInfo.FieldByName('SEX').AsString;
  rowWork.Properties.Value := odsInfo.FieldByName('WORKPLACE').AsString;
  rowAddress.Properties.Value := odsInfo.FieldByName('ADDRESS').AsString;
  rowAdrPreb.Properties.Value := odsInfo.FieldByName('ADR_PROJ').AsString;
  rowDoc.Properties.Value := odsInfo.FieldByName('docname').AsString+', '+
                             'Серия: '+odsInfo.FieldByName('fc_docser').AsString+' '+
                             'Номер: '+odsInfo.FieldByName('fc_docnum').AsString+' '+
                             'Выдан: '+odsInfo.FieldByName('fc_docvidan').AsString;
  rowDoc.Tag := odsInfo.FieldByName('fk_docvid').AsInteger;
  sSerDoc := odsInfo.FieldByName('fc_docser').AsString;
  sNumDoc := odsInfo.FieldByName('fc_docnum').AsString;
  sKemDoc := odsInfo.FieldByName('fc_docvidan').AsString;
  DateSys := odsInfo.FieldByName('date_sys').AsString;
  pPEPLID := odsInfo.FieldByName('fk_peplid').AsInteger;
end;

procedure TfrmMain.odsInfoBeforeOpen(DataSet: TDataSet);
begin
  odsInfo.SetVariable('PFK_PACID', pPACID);
  odsInfo.SetVariable('PFK_SOTRID', pSOTRID);
end;

procedure TfrmMain.odsNazBeforeOpen(DataSet: TDataSet);
begin
  odsNaz.SetVariable('pTalonID', pTALONID);
end;

procedure TfrmMain.odsTalonBeforeOpen(DataSet: TDataSet);
begin
  odsTalon.SetVariable('pfk_nazid', pNAZID);
  odsTalon.SetVariable('pfk_sotrid', pSOTRID);
end;

procedure TfrmMain.rowDocEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  Application.CreateForm(TfrmSetDoc, frmSetDoc);
  try
    frmSetDoc.rowTypeDoc.Properties.Value := rowDoc.Tag;
    frmSetDoc.rowSer.Properties.Value := sSerDoc;
    frmSetDoc.rowNum.Properties.Value := sNumDoc;
    frmSetDoc.rowKem.Properties.Value := sKemDoc;
    frmSetDoc.ShowModal;
    if frmSetDoc.ModalResult = mrOk then
      begin
        TcxButtonEdit(VerGr.InplaceEditor).Properties.ViewStyle := vsNormal;
        TcxButtonEdit(VerGr.InplaceEditor).EditingText := frmSetDoc.odsType.FieldByName('fc_name').AsString+', '+
                                                          'Серия: '+frmSetDoc.rowSer.Properties.Value+' '+
                                                          'Номер: '+frmSetDoc.rowNum.Properties.Value+' '+
                                                          'Выдан: '+frmSetDoc.rowKem.Properties.Value;
        TcxButtonEdit(VerGr.InplaceEditor).Properties.ViewStyle := vsHideCursor;
        rowDoc.Tag := frmSetDoc.rowTypeDoc.Properties.Value; // tviddoc.fk_id
        sSerDoc := frmSetDoc.rowSer.Properties.Value;
        sNumDoc := frmSetDoc.rowNum.Properties.Value;
        sKemDoc := frmSetDoc.rowKem.Properties.Value;
      end;
  finally
    frmSetDoc.Free;
  end;
end;

procedure TfrmMain.rowDSNaprEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
//-- поставить диагноз
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetDs, frmSetDs);
      try
        if nDSNapr_first <> 0 then
          frmSetDs.rowVyavlen.Properties.Value := nDSNapr_first;
        frmSetDs.DoShowForm(pPACID);
        frmSetDs.ShowModal;
        if frmSetDs.ModalResult = mrOk then
          begin
            TcxButtonEdit(verGrDS.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(verGrDS.InplaceEditor).EditingText := '('+frmSetDs.odsDiag.FieldByName('FK_MKB10').AsString +') '+frmSetDs.odsDiag.FieldByName('FC_NAME').AsString;
            TcxButtonEdit(verGrDS.InplaceEditor).Properties.ViewStyle := vsHideCursor;
            rowDSNapr.Tag := frmSetDs.odsDiag.FieldByName('FK_ID').AsInteger; // tsmid.fk_id
            if frmSetDs.rowVyavlen.Properties.Value = null then
              nDSNapr_first := 0
            else
              nDSNapr_first := frmSetDs.rowVyavlen.Properties.Value;
            sDSNapr_name := frmSetDs.odsDiag.FieldByName('FC_NAME').AsString;
            nDSNapr_showib := frmSetDs.rowShowIB.Properties.Value;
          end;
      finally
        frmSetDs.Free;
      end;
    end;
//-- редактировать диагноз
  if AButtonIndex = 1 then
    begin
      if rowDSNapr.Tag = 0 then
        begin
          Application.MessageBox('Чтобы редактировать диагноз сначала необходимо его поставить!'+#13+
                                 'Воспользуйтесь соответствующей кнопкой!', 'Внимание', MB_ICONINFORMATION+mb_ok);
          exit;
        end;
      Application.CreateForm(TfrmEditDs, frmEditDs);
      frmEditDs.memDs.Text := sDSNapr_name; 
      try
        frmEditDs.ShowModal;
        if frmEditDs.ModalResult = mrOk then
          begin
            sDSNapr_name := frmEditDs.memDs.Text;
            TcxButtonEdit(verGrDS.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(verGrDS.InplaceEditor).EditingText := frmEditDs.memDs.Text;
            TcxButtonEdit(verGrDS.InplaceEditor).Properties.ViewStyle := vsHideCursor;
          end;
      finally
        frmEditDs.Free;
      end;
    end;
//-- визард
  if AButtonIndex = 2 then
    begin
      if rowDSNapr.Tag = 0 then
        begin
          Application.MessageBox('Чтобы воспользоваться этой функцией сначала необходимо поставить направительный диагноз! '+#13+
                                 'Воспользуйтесь соответствующей кнопкой!', 'Внимание', MB_ICONINFORMATION+mb_ok);
          exit;
        end;
      //-- ставим предварительный
      if rowDSPred.Tag = 0 then
        begin
          rowDSPred.Properties.Value := rowDSNapr.Properties.Value;
          rowDSPred.Tag := rowDSNapr.Tag;
          nDSPred_first := nDSNapr_first;
          sDSPred_name := sDSNapr_name;
          nDSPred_showib := nDSNapr_showib;
      end;
      //-- ставим заключительный
      if rowDSZakl.Tag = 0 then
        begin
          rowDSZakl.Properties.Value := rowDSNapr.Properties.Value;
          rowDSZakl.Tag := rowDSNapr.Tag;
          nDSZakl_first := nDSNapr_first;
          sDSZakl_name := sDSNapr_name;
          nDSZakl_showib := nDSNapr_showib;
        end;
    end;
   verGrDS.FocusRow(verGrDS.FirstRow, 0);
end;

procedure TfrmMain.rowDSPredEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetDs, frmSetDs);
      try
        if nDSPred_first <> 0 then
          frmSetDs.rowVyavlen.Properties.Value := nDSPred_first;
        frmSetDs.DoShowForm(pPACID);
        frmSetDs.ShowModal;
        if frmSetDs.ModalResult = mrOk then
          begin
            TcxButtonEdit(verGrDS.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(verGrDS.InplaceEditor).EditingText := '('+frmSetDs.odsDiag.FieldByName('FK_MKB10').AsString +') '+frmSetDs.odsDiag.FieldByName('FC_NAME').AsString;
            TcxButtonEdit(verGrDS.InplaceEditor).Properties.ViewStyle := vsHideCursor;
            rowDSPred.Tag := frmSetDs.odsDiag.FieldByName('FK_ID').AsInteger; // tsmid.fk_id
            if frmSetDs.rowVyavlen.Properties.Value = null then
              nDSPred_first := 0
            else
              nDSPred_first := frmSetDs.rowVyavlen.Properties.Value;
            sDSPred_name := frmSetDs.odsDiag.FieldByName('FC_NAME').AsString;
            nDSPred_showib := frmSetDs.rowShowIB.Properties.Value;
          end;
      finally
        frmSetDs.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      if rowDSPred.Tag = 0 then
        begin
          Application.MessageBox('Чтобы редактировать диагноз сначала необходимо его поставить!'+#13+
                                 'Воспользуйтесь соответствующей кнопкой!', 'Внимание', MB_ICONINFORMATION+mb_ok);
          exit;
        end;
      Application.CreateForm(TfrmEditDs, frmEditDs);
      frmEditDs.memDs.Text := sDSPred_name;
      try
        frmEditDs.ShowModal;
        if frmEditDs.ModalResult = mrOk then
          begin
            sDSPred_name := frmEditDs.memDs.Text;
            TcxButtonEdit(verGrDS.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(verGrDS.InplaceEditor).EditingText := frmEditDs.memDs.Text;
            TcxButtonEdit(verGrDS.InplaceEditor).Properties.ViewStyle := vsHideCursor;
          end;
      finally
        frmEditDs.Free;
      end;
    end;
end;

procedure TfrmMain.rowDSZaklEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetDs, frmSetDs);
      try
        if nDSZakl_first <> 0 then
          frmSetDs.rowVyavlen.Properties.Value := nDSZakl_first;
        frmSetDs.DoShowForm(pPACID);
        frmSetDs.ShowModal;
        if frmSetDs.ModalResult = mrOk then
          begin
            TcxButtonEdit(verGrDS.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(verGrDS.InplaceEditor).EditingText := '('+frmSetDs.odsDiag.FieldByName('FK_MKB10').AsString +') '+frmSetDs.odsDiag.FieldByName('FC_NAME').AsString;
            TcxButtonEdit(verGrDS.InplaceEditor).Properties.ViewStyle := vsHideCursor;
            rowDSZakl.Tag := frmSetDs.odsDiag.FieldByName('FK_ID').AsInteger; // tsmid.fk_id
            if frmSetDs.rowVyavlen.Properties.Value = null then
              nDSZakl_first := 0
            else
              nDSZakl_first := frmSetDs.rowVyavlen.Properties.Value;
            sDSZakl_name := frmSetDs.odsDiag.FieldByName('FC_NAME').AsString;
            nDSZakl_showib := frmSetDs.rowShowIB.Properties.Value;
            sLiterMkb := copy(frmSetDs.odsDiag.FieldByName('FK_MKB10').AsString, 1, 1);
          end;
      finally
        frmSetDs.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      if rowDSZakl.Tag = 0 then
        begin
          Application.MessageBox('Чтобы редактировать диагноз сначала необходимо его поставить!'+#13+
                                 'Воспользуйтесь соответствующей кнопкой!', 'Внимание', MB_ICONINFORMATION+mb_ok);
          exit;
        end;
      Application.CreateForm(TfrmEditDs, frmEditDs);
      frmEditDs.memDs.Text := sDSZakl_name;
      try
        frmEditDs.ShowModal;
        if frmEditDs.ModalResult = mrOk then
          begin
            sDSZakl_name := frmEditDs.memDs.Text;
            TcxButtonEdit(verGrDS.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(verGrDS.InplaceEditor).EditingText := frmEditDs.memDs.Text;
            TcxButtonEdit(verGrDS.InplaceEditor).Properties.ViewStyle := vsHideCursor;
          end;
      finally
        frmEditDs.Free;
      end;
    end;
end;

procedure TfrmMain.rowNaprEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  Application.CreateForm(TfrmSet, frmSet);
  try
    frmSet.paFilter.Visible := True;
    frmSet.dsList.DataSet := frmSet.odsList;
    frmSet.DoShowSet('PD_NAPRAVIV_YCH', rowNapr.Tag);
    frmSet.ShowModal;
    if frmSet.ModalResult = mrOk then
      begin
        TcxButtonEdit(VerGr.InplaceEditor).Properties.ViewStyle := vsNormal;
        TcxButtonEdit(VerGr.InplaceEditor).EditingText := frmSet.dsList.DataSet.FieldByName('FC_NAME').AsString;
        TcxButtonEdit(VerGr.InplaceEditor).Properties.ViewStyle := vsHideCursor;
        rowNapr.Tag := frmSet.dsList.DataSet.FieldByName('FK_ID').AsInteger;
      end;
  finally
    frmSet.paFilter.Visible := False;
    frmSet.Free;
  end;
end;

procedure TfrmMain.rowNatEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  Application.CreateForm(TfrmSet, frmSet);
  try
    frmSet.dsList.DataSet := frmSet.odsList;
    frmSet.DoShowSet('LD_GRAGZ', rowNat.Tag);
    frmSet.ShowModal;
    if frmSet.ModalResult = mrOk then
      begin
        TcxButtonEdit(VerGr.InplaceEditor).Properties.ViewStyle := vsNormal;
        TcxButtonEdit(VerGr.InplaceEditor).EditingText := frmSet.odsList.FieldByName('FC_NAME').AsString;
        TcxButtonEdit(VerGr.InplaceEditor).Properties.ViewStyle := vsHideCursor;
        rowNat.Tag := frmSet.odsList.FieldByName('FK_ID').AsInteger;
      end;
  finally
    frmSet.Free;
  end;
end;

procedure TfrmMain.rowPlaceEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  Application.CreateForm(TfrmSet, frmSet);
  try
    frmSet.dsList.DataSet := frmSet.odsList;
    frmSet.DoShowSet('AMBTALON_SERVPLACE', rowPlace.Tag);
    frmSet.ShowModal;
    if frmSet.ModalResult = mrOk then
      begin
        TcxButtonEdit(VerGr.InplaceEditor).Properties.ViewStyle := vsNormal;
        TcxButtonEdit(VerGr.InplaceEditor).EditingText := frmSet.odsList.FieldByName('FC_NAME').AsString;
        TcxButtonEdit(VerGr.InplaceEditor).Properties.ViewStyle := vsHideCursor;
        rowPlace.Tag := frmSet.odsList.FieldByName('FK_ID').AsInteger;
      end;
  finally
    frmSet.Free;
  end;
end;

procedure TfrmMain.rowPolisEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  Application.CreateForm(TfrmSetOpl, frmSetOpl);
  try
    frmSetOpl.odsList.Close;
    frmSetOpl.odsList.SetVariable('pacid', pPACID);
    frmSetOpl.odsList.Open;
    if rowPolis.Tag <> 0 then
      frmSetOpl.odsList.Locate('FK_INSURANCE', rowPolis.Tag, []);
    frmSetOpl.ShowModal;
    if frmSetOpl.ModalResult = mrOk then
      begin
        TcxButtonEdit(VerGr.InplaceEditor).Properties.ViewStyle := vsNormal;
        if frmSetOpl.odsList.FieldByName('FL_NOTDOC').AsInteger = 1 then
          begin
            TcxButtonEdit(VerGr.InplaceEditor).EditingText := frmSetOpl.odsList.FieldByName('FC_OPLATANAME').AsString;
          end else
          begin
            if DateTimeToStr(frmSetOpl.odsList.FieldByName('FD_END').AsDateTime) = '30.12.1899' then
              TcxButtonEdit(VerGr.InplaceEditor).EditingText := frmSetOpl.odsList.FieldByName('FC_OPLATANAME').AsString
            else
              TcxButtonEdit(VerGr.InplaceEditor).EditingText := frmSetOpl.odsList.FieldByName('FC_OPLATANAME').AsString+
                                                            ' Действительный по: '+DateTimeToStr(frmSetOpl.odsList.FieldByName('FD_END').AsDateTime);
          end;
        TcxButtonEdit(VerGr.InplaceEditor).Properties.ViewStyle := vsHideCursor;
        rowPolis.Tag := frmSetOpl.odsList.FieldByName('FK_INSURANCE').AsInteger;
        if frmSetOpl.odsList.FieldByName('fc_synonim').AsString = 'OMS' then
          begin
            rowTypeTalon.Properties.Caption := 'Тип талона*';
            rowUch.Properties.Caption := 'Участок*';
            merDateNum.Properties.Editors[0].Caption := 'Дата*';
            merDateNum.Properties.Editors[1].Caption := 'Номер*';
            rowVidPos.Properties.Caption := 'Вид посещения*';
          end else
          begin
            rowTypeTalon.Properties.Caption := 'Тип талона';
            rowUch.Properties.Caption := 'Участок';
            merDateNum.Properties.Editors[0].Caption := 'Дата';
            merDateNum.Properties.Editors[1].Caption := 'Номер';
            rowVidPos.Properties.Caption := 'Вид посещения';
          end;
      end;
  finally
    frmSetOpl.Free;
  end;
end;

procedure TfrmMain.rowReasonEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  Application.CreateForm(TfrmSet, frmSet);
  try
    frmSet.dsList.DataSet := frmSet.odsList;
    frmSet.DoShowSet('AMBTALON_REASON', rowReason.Tag);
    frmSet.ShowModal;
    if frmSet.ModalResult = mrOk then
      begin
        TcxButtonEdit(VerGr.InplaceEditor).Properties.ViewStyle := vsNormal;
        TcxButtonEdit(VerGr.InplaceEditor).EditingText := frmSet.odsList.FieldByName('FC_NAME').AsString;
        TcxButtonEdit(VerGr.InplaceEditor).Properties.ViewStyle := vsHideCursor;
        rowReason.Tag := frmSet.odsList.FieldByName('FK_ID').AsInteger;
      end;
  finally
    frmSet.Free;
  end;
end;

procedure TfrmMain.rowSocStatusEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  Application.CreateForm(TfrmSet, frmSet);
  try
    frmSet.dsList.DataSet := frmSet.odsList;
    frmSet.DoShowSet('LD_SOC_POL', rowSocStatus.Tag);
    frmSet.ShowModal;
    if frmSet.ModalResult = mrOk then
      begin
        TcxButtonEdit(VerGr.InplaceEditor).Properties.ViewStyle := vsNormal;
        TcxButtonEdit(VerGr.InplaceEditor).EditingText := frmSet.odsList.FieldByName('FC_NAME').AsString;
        TcxButtonEdit(VerGr.InplaceEditor).Properties.ViewStyle := vsHideCursor;
        rowSocStatus.Tag := frmSet.odsList.FieldByName('FK_ID').AsInteger;
      end;
  finally
    frmSet.Free;
  end;
end;

procedure TfrmMain.rowSotrEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select fk_otdelid from asu.tsotr where fk_id = :pfk_id ';
    ods.DeclareAndSet('pfk_id', otInteger, rowSotr.Tag);
    ods.Open;
    if ods.FieldByName('fk_otdelid').AsInteger <> odsInfo.FieldByName('otdelid').AsInteger then
      begin
        MessageDlg('Внимание!'+#13+#10+
                   'Данный талон открыл сотрудник не из вашего отделения!'+#13+#10+
                   'Вы не можете изменить сотрудника, открывшего талон!', mtWarning, [mbOK], 0);
        exit;
      end;
  finally
    ods.Free;
  end;
  Application.CreateForm(TfrmSetSotr, frmSetSotr);
  try
    frmSetSotr.DoShowForm(odsInfo.FieldByName('otdelid').AsInteger);
    frmSetSotr.ShowModal;
    if frmSetSotr.ModalResult = mrOk then
      begin
        TcxButtonEdit(VerGr.InplaceEditor).Properties.ViewStyle := vsNormal;
        TcxButtonEdit(VerGr.InplaceEditor).EditingText := frmSetSotr.odsSotr.FieldByName('fio').AsString;
        TcxButtonEdit(VerGr.InplaceEditor).Properties.ViewStyle := vsHideCursor;
        rowSotr.Tag := frmSetSotr.odsSotr.FieldByName('fk_id').AsInteger;
      end;
  finally
    frmSetSotr.Free;
  end;
end;

procedure TfrmMain.rowStandartEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  Application.CreateForm(TfrmSet, frmSet);
  try
    frmSet.dsList.DataSet := frmSet.odsList;
    frmSet.DoShowSet('CPD_STANDARTGROUP', rowStandart.Tag);
    frmSet.ShowModal;
    if frmSet.ModalResult = mrOk then
      begin
        TcxButtonEdit(VerGr.InplaceEditor).Properties.ViewStyle := vsNormal;
        TcxButtonEdit(VerGr.InplaceEditor).EditingText := frmSet.odsList.FieldByName('FC_NAME').AsString;
        TcxButtonEdit(VerGr.InplaceEditor).Properties.ViewStyle := vsHideCursor;
        rowStandart.Tag := frmSet.odsList.FieldByName('FK_ID').AsInteger;
      end;
  finally
    frmSet.Free;
  end;
end;

procedure TfrmMain.rowTravmaEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  Application.CreateForm(TfrmSet, frmSet);
  try
    frmSet.dsList.DataSet := frmSet.odsTravm;
    frmSet.DoShowSet('PD_TRAVM', rowTravma.Tag);
    frmSet.ShowModal;
    if frmSet.ModalResult = mrOk then
      begin
        TcxButtonEdit(VerGr.InplaceEditor).Properties.ViewStyle := vsNormal;
        TcxButtonEdit(VerGr.InplaceEditor).EditingText := frmSet.dsList.DataSet.FieldByName('FC_NAME').AsString;
        TcxButtonEdit(VerGr.InplaceEditor).Properties.ViewStyle := vsHideCursor;
        rowTravma.Tag := frmSet.dsList.DataSet.FieldByName('FK_ID').AsInteger;
      end;
  finally
    frmSet.Free;
  end;
end;

procedure TfrmMain.rowTypeTalonEditPropertiesEditValueChanged(Sender: TObject);
begin
  merDateNum.Visible := odsTypeTalon.FieldByName('fc_synonim').AsString = 'TALON_TYPE_CREATE_NAPR';
  if merDateNum.Visible = False then
    begin
      merDateNum.Properties.Editors[0].Value := null;
      merDateNum.Properties.Editors[1].Value := null;
    end;
  rowUch.Visible := odsTypeTalon.FieldByName('fc_synonim').AsString = 'TALON_TYPE_CREATE_PRIKREP';
end;

procedure TfrmMain.rowUchEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetUch, frmSetUch);
      try
        frmSetUch.DoShowForm;
        frmSetUch.ShowModal;
        if frmSetUch.ModalResult = mrOk then
          begin
            TcxButtonEdit(VerGr.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(VerGr.InplaceEditor).EditingText := frmSetUch.odsListUch.FieldByName('nameuch').AsString+'-'+
                                                              frmSetUch.lcbType.EditText;
            TcxButtonEdit(VerGr.InplaceEditor).Properties.ViewStyle := vsHideCursor;
            rowUch.Tag := frmSetUch.odsListUch.FieldByName('fk_id').AsInteger;
          end;
      finally
        frmSetUch.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      TcxButtonEdit(VerGr.InplaceEditor).Properties.ViewStyle := vsNormal;
      TcxButtonEdit(VerGr.InplaceEditor).EditingText := '';
      TcxButtonEdit(VerGr.InplaceEditor).Properties.ViewStyle := vsHideCursor;
      rowUch.Tag := -1;
    end;
end;

procedure TfrmMain.verGrDSEditorRow1EditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetDs, frmSetDs);
      try
        if nDSZaklSop_first <> 0 then
          frmSetDs.rowVyavlen.Properties.Value := nDSZaklSop_first;
        frmSetDs.DoShowForm(pPACID);
        frmSetDs.ShowModal;
        if frmSetDs.ModalResult = mrOk then
          begin
            TcxButtonEdit(verGrDS.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(verGrDS.InplaceEditor).EditingText := '('+frmSetDs.odsDiag.FieldByName('FK_MKB10').AsString +') '+frmSetDs.odsDiag.FieldByName('FC_NAME').AsString;
            TcxButtonEdit(verGrDS.InplaceEditor).Properties.ViewStyle := vsHideCursor;
            rowDSZaklSop.Tag := frmSetDs.odsDiag.FieldByName('FK_ID').AsInteger; // tsmid.fk_id
            if frmSetDs.rowVyavlen.Properties.Value = null then
              nDSZaklSop_first := 0
            else
              nDSZaklSop_first := frmSetDs.rowVyavlen.Properties.Value;
            sDSZaklSop_name := frmSetDs.odsDiag.FieldByName('FC_NAME').AsString;
            nDSZaklSop_showib := frmSetDs.rowShowIB.Properties.Value;
          end;
      finally
        frmSetDs.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      if rowDSZakl.Tag = 0 then
        begin
          Application.MessageBox('Чтобы редактировать диагноз сначала необходимо его поставить!'+#13+
                                 'Воспользуйтесь соответствующей кнопкой!', 'Внимание', MB_ICONINFORMATION+mb_ok);
          exit;
        end;
      Application.CreateForm(TfrmEditDs, frmEditDs);
      frmEditDs.memDs.Text := sDSZaklSop_name;
      try
        frmEditDs.ShowModal;
        if frmEditDs.ModalResult = mrOk then
          begin
            sDSZaklSop_name := frmEditDs.memDs.Text;
            TcxButtonEdit(verGrDS.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(verGrDS.InplaceEditor).EditingText := frmEditDs.memDs.Text;
            TcxButtonEdit(verGrDS.InplaceEditor).Properties.ViewStyle := vsHideCursor;
          end;
      finally
        frmEditDs.Free;
      end;
    end;
end;

end.
