unit fLabPatAnatom;
//!!! - корректность ввода даты

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ActnList, Oracle, StdCtrls, cxLabel, cxGraphics, OracleData,
  cxLookupEdit, DB, cxStyles, jvDBUtils, DateUtils, cxTimeEdit, cxMemo, Menus,
  cxLookAndFeelPainters, cxButtons, cxClasses, cxVGrid, cxEdit, cxTextEdit,
  cxContainer, cxControls, cxCalendar, dxSkinsCore, dxSkinsDefaultPainters,
  cxDBLookupComboBox, cxSpinEdit, cxInplaceContainer, cxButtonEdit,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxMaskEdit;

type
  TfrmLabPatAnatom = class(TForm)
    Panel1: TPanel;
    al: TActionList;
    aSave: TAction;
    aCancel: TAction;
    odsVidOplat: TOracleDataSet;
    dsVidOplat: TDataSource;
    odsRegPrin: TOracleDataSet;
    dsRegPrin: TDataSource;
    dsKorennoe: TDataSource;
    odsKorennoe: TOracleDataSet;
    odsLaborant: TOracleDataSet;
    dsLaborant: TDataSource;
    VerGr: TcxVerticalGrid;
    catPac: TcxCategoryRow;
    merFIOMK: TcxMultiEditorRow;
    merDateAgeSex: TcxMultiEditorRow;
    rowKoren: TcxEditorRow;
    rowTypeOpl: TcxEditorRow;
    rowProj: TcxEditorRow;
    rowAddress: TcxEditorRow;
    rowWork: TcxEditorRow;
    catIssl: TcxCategoryRow;
    rowNum: TcxEditorRow;
    rowName: TcxEditorRow;
    cxButton1: TcxButton;
    cxButton3: TcxButton;
    cxStyleRepository1: TcxStyleRepository;
    stFIO: TcxStyle;
    odsUrgent: TOracleDataSet;
    dsUrgent: TDataSource;
    odsOrgan: TOracleDataSet;
    dsOrgan: TDataSource;
    stIssl: TcxStyle;
    rowKem: TcxEditorRow;
    cxVerticalGrid1: TcxVerticalGrid;
    rowDs: TcxEditorRow;
    rowMacro: TcxEditorRow;
    catPodpis: TcxCategoryRow;
    merDateTime: TcxMultiEditorRow;
    rowLaborant: TcxEditorRow;
    TVLIST: TcxGridDBTableView;
    grListLevel1: TcxGridLevel;
    grList: TcxGrid;
    dsList: TDataSource;
    odsList: TOracleDataSet;
    VNUMROW: TcxGridDBColumn;
    VKOLVO: TcxGridDBColumn;
    VCHAR: TcxGridDBColumn;
    VOSOB: TcxGridDBColumn;
    merUrgDate: TcxMultiEditorRow;
    merDateTimeIn: TcxMultiEditorRow;
    rowOtdel: TcxEditorRow;
    VOSOB_NT: TcxGridDBColumn;
    pmTV: TPopupMenu;
    N2: TMenuItem;
    odsListNT: TOracleDataSet;
    VNUMGLASS: TcxGridDBColumn;
    rowCompany: TcxEditorRow;
    Panel2: TPanel;
    cxLabel1: TcxLabel;
    odsIsI_PATGIST_ENDO: TOracleDataSet;
    oqUpdateTIB: TOracleQuery;
    grdbtvPMU: TcxGridDBTableView;
    grlPMU: TcxGridLevel;
    grPMU: TcxGrid;
    odsPMU: TOracleDataSet;
    dsPMU: TDataSource;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure odsLaborantBeforeOpen(DataSet: TDataSet);
    procedure rowKorenEditPropertiesChange(Sender: TObject);
    procedure rowProjEditPropertiesChange(Sender: TObject);
    procedure rowKemEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowKemEditPropertiesChange(Sender: TObject);
    procedure rowDsEditPropertiesChange(Sender: TObject);
    procedure rowMacroEditPropertiesChange(Sender: TObject);
    procedure odsListBeforeOpen(DataSet: TDataSet);
    procedure odsListApplyRecord(Sender: TOracleDataSet; Action: Char;
      var Applied: Boolean; var NewRowId: string);
    procedure VCHARPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N2Click(Sender: TObject);
    procedure VOSOB_NTPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowCompanyEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowTypeOplEditPropertiesChange(Sender: TObject);
  private
    isKorenChange, isProjChange, isTypeOplChange, isDsChange, isMacroChange, IsKemChange : Boolean;
    Russian : HKL;
    procedure SetVisibleColumn;
    { Private declarations }
  public
    pPACID, pPEPLID, pSMIDID, pNAZID : Integer;
    procedure DoShowForm(nAmbul : Integer; sDateRun, sNAME, sNUM : string; nNAZTYPE, nPACID, nPEPLID, nSMIDID : Integer; nNAZID : Integer=0);
    { Public declarations }
  end;

var
  frmLabPatAnatom: TfrmLabPatAnatom;

implementation

uses fMain, fKem, fSetChar, fSeCompany;

{$R *.dfm}

procedure TfrmLabPatAnatom.DoShowForm(nAmbul: Integer; sDateRun, sNAME, sNUM : string; nNAZTYPE, nPACID, nPEPLID, nSMIDID, nNAZID : Integer);
var ods : TOracleDataSet;
begin
  isKorenChange := False;
  isProjChange := False;
  isTypeOplChange := False;
  isDsChange := False;
  isMacroChange := False;
  IsKemChange := False;
  ods := TOracleDataSet.Create(nil);
  try
    Cursor := crSQLWait;
    pPACID := nPACID;
    pPEPLID := nPEPLID;
    pSMIDID := nSMIDID;
    pNAZID := nNAZID;

    odsIsI_PATGIST_ENDO.close;
    odsIsI_PATGIST_ENDO.setvariable('pid',nSMIDID);
    odsIsI_PATGIST_ENDO.Open;
    if odsIsI_PATGIST_ENDO.FieldByName('cnt').AsInteger > 0 then
     begin
       oqUpdateTIB.SetVariable('pacid',nNAZID);
       oqUpdateTIB.SetVariable('pfk_vrachid',frmMain.pSOTRID);
       oqUpdateTIB.execute;
       oqUpdateTIB.session.commit;
     end;
    odsIsI_PATGIST_ENDO.close;

    if odsList.Active = False then
      odsList.Active := True
    else
     begin
      odsList.close;
      odsList.open;
     end;
//-->>
    ods.Session := frmMain.os;
    ods.SQL.Text := ' SELECT FC_FAM||'' ''||FC_IM||'' ''||FC_OTCH AS FIO, sysdate, '+#13+
                    '        TO_CHAR(FD_ROJD, ''DD.MM.YYYY'') AS DATE_BIRTH, '+#13+
                    '        DECODE(FP_SEX, 0, ''Женский'', 1, ''Мужской'', -1, ''Не определен'') AS SEX, '+#13+
                    '        TRUNC(MONTHS_BETWEEN(SYSDATE,FD_ROJD)/12) AS AGE, '+#13#10+
                    '        ASU.GET_IB(:PFK_PACID) AS NUMMK, '+#13+
                    '        ASU.PKG_REGIST_PACFUNC.GET_PAC_ADRFULL(:PFK_PACID) AS ADDRESS, '+#13+
                    '        ASU.GET_PACCOMPANY(FK_COMPANYID)||'' ''||ASU.GET_PACCOMPANY_OTDEL(FK_OTDEL)||'' ''||ASU.GET_PACCOMPANY_DOLGNOST(FK_DOLGNOST)||'' ''||FC_RABOTA AS WORKPLACE, '+#13#10+
                    '        (SELECT FK_SMID FROM ASU.TIB WHERE FK_PACID = TPEOPLES.FK_ID AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM ASU.TSMID WHERE FC_SYNONIM = ''KOREN_NASEL''))) AS KOREN '+#13#10+
                    '   FROM ASU.TPEOPLES WHERE FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pPEPLID);
    ods.DeclareAndSet('PFK_PACID', otInteger, pPACID);
    ods.Open;
//-->> Дата, время, ФИО, № МК, Дата рожд., Возраст, Пол, Коренной житель, Адрес, Место работы
    merDateTime.Properties.Editors[0].Value := sDateRun;
    if trim(copy(sDateRun, Pos(' ', sDateRun), Pos(' ', sDateRun))) = '00:00' then
      merDateTime.Properties.Editors[1].Value := ods.FieldByName('sysdate').AsDateTime
    else
      merDateTime.Properties.Editors[1].Value := sDateRun;
    merFIOMK.Properties.Editors[0].Value := ods.FieldByName('FIO').AsString;
    merFIOMK.Properties.Editors[1].Value := ods.FieldByName('NUMMK').AsString;
    merDateAgeSex.Properties.Editors[0].Value := ods.FieldByName('DATE_BIRTH').AsString;
    merDateAgeSex.Properties.Editors[1].Value := ods.FieldByName('AGE').AsString;
    merDateAgeSex.Properties.Editors[2].Value := ods.FieldByName('SEX').AsString;
    rowKoren.Properties.Value := ods.FieldByName('KOREN').AsInteger;
    rowAddress.Properties.Value := ods.FieldByName('ADDRESS').AsString;
    rowWork.Properties.Value := ods.FieldByName('WORKPLACE').AsString;
//-->> Способ оплаты
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := '   SELECT FK_SMID, (select fc_synonim from asu.tsmid where fk_id = tib.fk_smid) as syn '+#13#10+
                    '     FROM ASU.TIB '+#13#10+
                    '    WHERE FK_PACID = :PFK_PACID '+#13#10+
                    '      AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''AMBTALON_OPL'')) ';
    ods.DeclareAndSet('PFK_PACID', otInteger, pNAZID);
    ods.Open;
    rowTypeOpl.Properties.Value := ods.FieldByName('FK_SMID').AsInteger;
    rowCompany.Visible := ods.FieldByName('syn').AsString = 'TAL_OTHER';
    if rowCompany.Visible = True then
      begin
        ods.DeleteVariables;
        ods.Close;
        ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smid) as smname '+#13+
                        '   from asu.tib '+#13+
                        '  where fk_pacid = :pfk_pacid '+#13+
                        '    and fk_smid in (select fk_id from asu.tsmid where fk_owner = (select fk_id from asu.tsmid where fc_synonim = ''XRAY_COMPANY_DOGOVOR'')) ';
        ods.DeclareAndSet('pfk_pacid', otInteger, pNazid);
        ods.Open;
        rowCompany.Tag := ods.FieldByName('fk_smid').AsInteger;
        rowCompany.Properties.Value := ods.FieldByName('smname').AsString;
      end;
//-->> Проживает постоянно
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' SELECT FK_SMID FROM ASU.TIB '+#13#10+
                    '  WHERE FK_PACID = :PFK_PACID '+#13#10+
                    '    AND (FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''PD_MZ'')) '+#13#10+
                    '     OR FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''LIVEIN_SELO'')) ';
    ods.DeclareAndSet('PFK_PACID', otInteger, pPACID);
    ods.Open;
    rowProj.Properties.Value := ods.FieldByName('FK_SMID').AsInteger;
//-->> Диагноз
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' BEGIN '+#13+
                    '   SELECT MAX(FC_CHAR) INTO :NAMEDIAG '+#13+
                    '     FROM ASU.TIB '+#13+
                    '    WHERE FK_PACID = :PFK_NAZID '+#13+
                    '      AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''DS_PATANATOM''); '+#13+
                    '   IF :NAMEDIAG IS NULL THEN '+#13+
                    '     SELECT STAT.PKG_FRFORM30.GET_LAST_DIAG(:PFK_PACID) INTO :NAMEDIAG FROM DUAL; '+#13+
                    '   END IF; '+#13+
                    ' END; ';
    ods.DeclareAndSet('PFK_NAZID', otInteger, pNAZID);
    ods.DeclareAndSet('PFK_PACID', otInteger, PPACID);
    ods.DeclareVariable('NAMEDIAG', otString);
    ods.Open;
    rowDs.Properties.Value := ods.GetVariable('NAMEDIAG'); //ods.FieldByName('FC_CHAR').AsString;
//-->> Макроописание
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' SELECT FC_CHAR '+#13+
                    '   FROM ASU.TIB '+#13+
                    '  WHERE FK_PACID = :PFK_PACID '+#13+
                    '    AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''MACRO_PATANATOM'') ';
    ods.DeclareAndSet('PFK_PACID', otInteger, pNAZID);
    ods.Open;
    rowMacro.Properties.Value := ods.FieldByName('FC_CHAR').AsString;
//-->> Номер исследования
    rowNum.Properties.Value := sNUM;
//-->> Исследование
    rowName.Properties.Value := sNAME;
//-->> Срочность
    merUrgDate.Properties.Editors[0].Value := nNAZTYPE;
//-->> Лаборант
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' SELECT FN_NUM '+#13#10+
                    '   FROM ASU.TIB '+#13#10+
                    '  WHERE FK_PACID = :PFK_PACID '+#13#10+
                    '    AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''LABORANT_PATANATOM'') ';
    ods.DeclareAndSet('PFK_PACID', otInteger, pNAZID);
    ods.Open;
    rowLaborant.Properties.Value := ods.FieldByName('FN_NUM').AsInteger;
    if rowLaborant.Properties.Value = 0 then
      rowLaborant.Properties.Value := frmMain.pSOTRID;
//-->> Дата (и время) поступления материала
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' SELECT TO_CHAR(max(FD_DATE), ''dd.mm.yyyy hh24:mi'') AS FD_DATE, SYSDATE '+#13#10+
                    '   FROM ASU.TIB '+#13#10+
                    '  WHERE FK_PACID = :PFK_PACID '+#13#10+
                    '    AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''DATEIN_PATANATOM'') ';
    ods.DeclareAndSet('PFK_PACID', otInteger, pNAZID);
    ods.Open;
    if ods.FieldByName('fd_date').AsString = '' then
      begin
        merDateTimeIn.Properties.Editors[0].Value := ods.FieldByName('sysdate').AsDateTime;
        merDateTimeIn.Properties.Editors[1].Value := ods.FieldByName('sysdate').AsDateTime;
      end else
      begin
        merDateTimeIn.Properties.Editors[0].Value := ods.FieldByName('fd_date').AsString;
        merDateTimeIn.Properties.Editors[1].Value := ods.FieldByName('fd_date').AsString;
      end;
//-->> Направившее учреждение
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' SELECT DECODE(FC_CHAR, NULL, ASU.GET_SMIDNAME(TIB.FK_SMID), FC_CHAR) AS KEM '+#13+
                    '   FROM ASU.TIB '+#13+
                    '  WHERE FK_PACID = :PFK_ID '+#13+
                    '    AND FK_SMID IN (SELECT FK_ID '+#13+
                    '                      FROM ASU.TSMID '+#13+
                    '                    START WITH FC_SYNONIM = ''KEM_NAPRAVLEN'' '+#13+  // для поддержки старых значений
                    '                    CONNECT BY PRIOR FK_ID = FK_OWNER '+#13+
                    '                    UNION ALL '+#13+
                    '                    SELECT FK_ID FROM ASU.TSMID '+#13+
                    '                    START WITH FC_SYNONIM = ''PD_NAPRAVIV_YCH'' '+#13+
                    '                    CONNECT BY PRIOR FK_ID = FK_OWNER) ';
    ods.DeclareAndSet('PFK_ID', otInteger, nNAZID);
    ods.Open;
    rowKem.Properties.Value := ods.FieldByName('KEM').AsString;
    TVList.StoreToRegistry('\SoftWare\SoftMaster\ListPatAnatom\fLabPatAnatom\grListVrach_' + IntToStr(frmMain.pSOTRID)+'Default', TRUE, [], 'grList');
    TVList.RestoreFromRegistry('\SoftWare\SoftMaster\ListPatAnatom\fLabPatAnatom\grListVrach_' + IntToStr(frmMain.pSOTRID), FALSE, FALSE, [], 'grList');
    SetVisibleColumn;
  finally
    Cursor := crDefault;
  end;
end;

procedure TfrmLabPatAnatom.aSaveExecute(Sender: TObject);
var ods : TOracleDataSet;
     oq : TOracleQuery;
begin
  ods := TOracleDataSet.Create(nil);
  oq := TOracleQuery.Create(nil);
  try
    Screen.Cursor := crSQLWait;
    ods.Session := frmMain.os;
    oq.Session := frmMain.os;
//-->> Коренное население
    if (rowKoren.Properties.Value <> 0) and (isKorenChange = True) then
      begin
        ods.SQL.Text := ' MERGE INTO ASU.TIB '+#13#10+
                        '  USING DUAL ON (FK_PACID = :PFK_PACID '+#13#10+
                        '                 AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID '+#13#10+
                        '                                  WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''KOREN_NASEL''))) '+#13#10+
                        ' WHEN MATCHED THEN UPDATE SET FK_SMID = :PFK_SMID, FK_SMEDITID = :PFK_SMEDITID '+#13#10+
                        '                    WHERE FK_PACID = :PFK_PACID '+#13#10+
                        '                      AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID '+#13#10+
                        '                                       WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''KOREN_NASEL'')) '+#13#10+
                        ' WHEN NOT MATCHED THEN INSERT(FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID) '+#13#10+
                        '                       VALUES(:pFK_PACID, :pFK_SMID, :pFK_SMEDITID, :pFK_VRACHID) ';
        ods.DeclareAndSet('PFK_PACID', otInteger, pPEPLID);
        ods.DeclareAndSet('pFK_SMID', otInteger, rowKoren.Properties.Value);
        ods.DeclareAndSet('pFK_SMEDITID', otInteger, rowKoren.Properties.Value);
        ods.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
        ods.Open;
      end;
//-->>Проживает
  if (rowProj.Properties.Value <> 0) and (isProjChange = True) then
    begin
      ods.DeleteVariables;
      ods.Close;
      ods.SQL.Text := ' MERGE INTO ASU.TIB '+#13#10+
                      '  USING DUAL ON (FK_PACID = :PFK_PACID '+#13#10+
                      '                 AND (FK_SMID IN (SELECT FK_ID FROM ASU.TSMID '+#13#10+
                      '                                   WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM ASU.TSMID WHERE FC_SYNONIM = ''PD_MZ'')) '+#13#10+
                      '                 OR FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''LIVEIN_SELO''))) '+#13#10+
                      ' WHEN MATCHED THEN UPDATE SET FK_SMID = :pFK_SMID, FK_SMEDITID = (select fk_owner from asu.tsmid where fk_id = :pfk_smid) '+#13#10+
                      '                    WHERE FK_PACID = :PFK_PACID '+#13#10+
                      '                      AND (FK_SMID IN (SELECT FK_ID FROM ASU.TSMID '+#13#10+
                      '                                   WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM ASU.TSMID WHERE FC_SYNONIM = ''PD_MZ'')) '+#13#10+
                      '                                      OR FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''LIVEIN_SELO'')) '+#13#10+
                      ' WHEN NOT MATCHED THEN INSERT(FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID) '+#13#10+
                      '                       VALUES(:pFK_PACID, :pFK_SMID, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pFK_VRACHID) ';
      ods.DeclareAndSet('PFK_PACID', otInteger, pPACID);
      ods.DeclareAndSet('pFK_SMID', otInteger, rowProj.Properties.Value);
      ods.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
      ods.Open;
    end;
//-->> Способ оплаты
    if (rowTypeOpl.Properties.Value <> 0) and (isTypeOplChange = True) then
      begin
        ods.DeleteVariables;
        ods.Close;
        ods.SQL.Text := ' MERGE INTO ASU.TIB '+#13#10+
                        '  USING DUAL ON (FK_PACID = :PFK_PACID '+#13#10+
                        '                 AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID '+#13#10+
                        '                                  WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''AMBTALON_OPL''))) '+#13#10+
                        ' WHEN MATCHED THEN UPDATE SET FK_SMID = :PFK_SMID, FK_SMEDITID = :PFK_SMEDITID '+#13#10+
                        '                    WHERE FK_PACID = :PFK_PACID '+#13#10+
                        '                      AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID '+#13#10+
                        '                                       WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''AMBTALON_OPL'')) '+#13#10+
                        ' WHEN NOT MATCHED THEN INSERT(FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID) '+#13#10+
                        '                       VALUES(:pFK_PACID, :pFK_SMID, :pFK_SMEDITID, :pFK_VRACHID) ';
        ods.DeclareAndSet('PFK_PACID', otInteger, pNAZID);
        ods.DeclareAndSet('pFK_SMID', otInteger, rowTypeOpl.Properties.Value);
        ods.DeclareAndSet('pFK_SMEDITID', otInteger, rowTypeOpl.Properties.Value);
        ods.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
        ods.Open;
      end;
    if rowCompany.Visible = True then
      begin
        if rowCompany.Tag <> 0 then
          begin
            ods.DeleteVariables;
            ods.Close;
            ods.SQL.Text := ' merge into asu.tib '+#13+
                            '  using dual on (fk_pacid = :pfk_pacid '+#13+
                            '                 and fk_smid in (select fk_id from asu.tsmid'+#13+
                            '                                 where fk_owner = (select fk_id from asu.tsmid where fc_synonim = ''XRAY_COMPANY_DOGOVOR''))) '+#13+
                            '  when matched then '+#13+
                            '    update set fk_smid = :pfk_smid, fk_smeditid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                            '    where fk_pacid = :pfk_pacid and fk_smid in (select fk_id from asu.tsmid where fk_owner = (select fk_id from asu.tsmid where fc_synonim = ''XRAY_COMPANY_DOGOVOR'')) '+#13+
                            '  when not matched then '+#13+
                            '    insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                            '    values(:pfk_pacid, :pfk_smid, :pfk_smid, :pfk_vrachid, sysdate) ';
            ods.DeclareAndSet('pfk_smid', otInteger, rowCompany.Tag);
            ods.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
            ods.DeclareAndSet('pfk_pacid', otInteger, pNAZID);
            ods.Open;
          end;
      end else
      begin
        ods.DeleteVariables;
        ods.Close;
        ods.SQL.Text := ' delete from asu.tib where fk_pacid = :pfk_pacid '+#13+
                        ' and fk_smid in (select fk_id from asu.tsmid where fk_owner = (select fk_id from asu.tsmid where fc_synonim = ''XRAY_COMPANY_DOGOVOR'')) ';
        ods.DeclareAndSet('pfk_pacid', otInteger, pNAZID);
        ods.Open;
      end;
//-->> Диагноз
    if isDsChange = True then
      begin
        ods.DeleteVariables;
        ods.Close;
        ods.SQL.Text := ' MERGE INTO ASU.TIB '+#13#10+
                        '  USING DUAL ON (FK_PACID = :PFK_PACID '+#13#10+
                        '                 AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''DS_PATANATOM'')) '+#13#10+
                        ' WHEN MATCHED THEN UPDATE SET FC_CHAR = :PFC_CHAR '+#13#10+
                        '                    WHERE FK_PACID = :PFK_PACID '+#13#10+
                        '                      AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''DS_PATANATOM'') '+#13#10+
                        ' WHEN NOT MATCHED THEN INSERT(FC_CHAR, FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID) '+#13#10+
                        '                       VALUES(:PFC_CHAR, :pFK_PACID, (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''DS_PATANATOM''), (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''DS_PATANATOM''), :pFK_VRACHID) ';
        ods.DeclareAndSet('PFC_CHAR', otString, rowDs.Properties.Value);
        ods.DeclareAndSet('PFK_PACID', otInteger, pNAZID);
        ods.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
        ods.Open;
      end;
//-->> Макроописание
    if isMacroChange = True then
      begin
        ods.DeleteVariables;
        ods.Close;
        ods.SQL.Text := ' MERGE INTO ASU.TIB '+#13#10+
                        '  USING DUAL ON (FK_PACID = :PFK_PACID '+#13#10+
                        '                 AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''MACRO_PATANATOM'')) '+#13#10+
                        ' WHEN MATCHED THEN UPDATE SET FC_CHAR = :PFC_CHAR '+#13#10+
                        '                    WHERE FK_PACID = :PFK_PACID '+#13#10+
                        '                      AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''MACRO_PATANATOM'') '+#13#10+
                        ' WHEN NOT MATCHED THEN INSERT(FC_CHAR, FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID) '+#13#10+
                        '                       VALUES(:PFC_CHAR, :pFK_PACID, (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''MACRO_PATANATOM''), (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''MACRO_PATANATOM''), :pFK_VRACHID) ';
        ods.DeclareAndSet('PFC_CHAR', otString, rowMacro.Properties.Value);
        ods.DeclareAndSet('PFK_PACID', otInteger, pNAZID);
        ods.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
        ods.Open;
      end;
//-->> Кем направлен
    if IsKemChange = True then
      begin
        ods.DeleteVariables;
        ods.Close;
        ods.SQL.Text := ' MERGE INTO ASU.TIB '+#13+
                        '  USING DUAL ON (FK_PACID = :PFK_ID '+#13+
                        '                 AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID '+#13+
                        '                                 START WITH FC_SYNONIM = ''KEM_NAPRAVLEN'' '+#13+
                        '                                 CONNECT BY PRIOR FK_ID = FK_OWNER '+#13+
                        '                                 UNION ALL '+#13+
                        '                                 SELECT FK_ID FROM ASU.TSMID '+#13+
                        '                                 START WITH FC_SYNONIM = ''PD_NAPRAVIV_YCH'' '+#13+
                        '                                 CONNECT BY PRIOR FK_ID = FK_OWNER)) '+#13+
                        '  WHEN MATCHED THEN '+#13+
                        '    UPDATE SET FK_SMID = :pFK_SMID, FK_SMEDITID =:pFK_SMEDITID, FC_CHAR = :pFC_CHAR, FK_VRACHID =:pFK_VRACHID '+#13+
                        '    WHERE FK_PACID = :PFK_ID '+#13+
                        '                 AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID '+#13+
                        '                                 START WITH FC_SYNONIM = ''KEM_NAPRAVLEN'' '+#13+
                        '                                 CONNECT BY PRIOR FK_ID = FK_OWNER '+#13+
                        '                                 UNION ALL '+#13+
                        '                                 SELECT FK_ID FROM ASU.TSMID '+#13+
                        '                                 START WITH FC_SYNONIM = ''PD_NAPRAVIV_YCH'' '+#13+
                        '                                 CONNECT BY PRIOR FK_ID = FK_OWNER) '+#13+
                        '  WHEN NOT MATCHED THEN INSERT (FK_PACID, FK_SMID, FK_SMEDITID, FC_CHAR, FK_VRACHID) '+#13+
                        '                        VALUES(:pFK_ID, :pFK_SMID, :pFK_SMEDITID, :pFC_CHAR, :pFK_VRACHID) ';
        ods.DeclareAndSet('PFK_ID', otInteger, pNAZID);
        ods.DeclareAndSet('PFK_SMID', otInteger, rowKem.Tag);
        ods.DeclareAndSet('PFK_SMEDITID', otInteger, rowKem.Tag);
        ods.DeclareAndSet('PFK_VRACHID', otInteger, frmMain.pSOTRID);
        ods.DeclareAndSet('PFC_CHAR', otString, rowKem.Properties.Value);
        ods.Open;
      end;
//-->> Лаборант в TIB
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' MERGE INTO ASU.TIB '+#13#10+
                    '  USING DUAL ON (FK_PACID = :PFK_PACID '+#13#10+
                    '                 AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''LABORANT_PATANATOM'')) '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FN_NUM = :PFN_NUM '+#13#10+
                    '                    WHERE FK_PACID = :PFK_PACID '+#13#10+
                    '                      AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''LABORANT_PATANATOM'') '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT(FN_NUM, FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID) '+#13#10+
                    '                       VALUES(:PFN_NUM, :pFK_PACID, (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''LABORANT_PATANATOM''), (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''LABORANT_PATANATOM''), :pFK_VRACHID) ';
    ods.DeclareAndSet('PFN_NUM', otInteger, rowLaborant.Properties.Value);
    ods.DeclareAndSet('PFK_PACID', otInteger, pNAZID);
    ods.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
    ods.Open;
//-->> Дата (и время) поступления материала
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' MERGE INTO ASU.TIB '+#13#10+
                    '  USING DUAL ON (FK_PACID = :PFK_PACID '+#13#10+
                    '                 AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''DATEIN_PATANATOM'')) '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FD_DATE = :PFD_DATE '+#13#10+
                    '                    WHERE FK_PACID = :PFK_PACID '+#13#10+
                    '                      AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''DATEIN_PATANATOM'') '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT(FD_DATE, FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID) '+#13#10+
                    '                       VALUES(:PFD_DATE, :pFK_PACID, (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''DATEIN_PATANATOM''), (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''DATEIN_PATANATOM''), :pFK_VRACHID) ';
    ods.DeclareAndSet('PFD_DATE', otDate, StrToDateTime(DateToStr(merDateTimeIn.Properties.Editors[0].Value)+' '+FormatDateTime('hh:nn:ss', merDateTimeIn.Properties.Editors[1].Value)));
    ods.DeclareAndSet('PFK_PACID', otInteger, pNAZID);
    ods.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
    ods.Open;
//-->> Номер исследования, срочность, лаборант, дата исследования
    if frmMain.odsList.FieldByName('FK_NAZSOSID').AsInteger = GET_VIPNAZ then
      begin
        oq.SQL.Text := ' UPDATE ASU.TNAZIS '+#13#10+
                       '    SET FC_TYPE = :PFC_TYPE, FK_NAZTYPEID = :PFK_NAZTYPEID '+#13#10+
                       '  WHERE FK_ID = :PFK_ID ';
        oq.DeclareAndSet('PFC_TYPE', otString, rowNum.Properties.Value);
        oq.DeclareAndSet('PFK_NAZTYPEID', otInteger, merUrgDate.Properties.Editors[0].Value);
        oq.DeclareAndSet('PFK_ID', otInteger, pNAZID);
        oq.Execute;
      end else
      begin
        oq.SQL.Text := ' UPDATE ASU.TNAZIS '+#13#10+
                       '    SET FK_NAZSOSID = :PFK_NAZSOSID, FD_RUN = :PFD_RUN, FC_TYPE = :PFC_TYPE, FK_NAZTYPEID = :PFK_NAZTYPEID, '+#13#10+
                       '        FK_ISPOLID = :PFK_ISPOLID '+#13#10+
                       '  WHERE FK_ID = :PFK_ID ';
        oq.DeclareAndSet('PFK_NAZSOSID', otInteger, GET_LABVIP);
        oq.DeclareAndSet('PFD_RUN', otDate, StrToDateTime(DateToStr(merDateTime.Properties.Editors[0].Value)+' '+FormatDateTime('hh:nn:ss', IncSecond(merDateTime.Properties.Editors[1].Value, 1))));
        oq.DeclareAndSet('PFC_TYPE', otString, rowNum.Properties.Value);
        oq.DeclareAndSet('PFK_NAZTYPEID', otInteger, merUrgDate.Properties.Editors[0].Value);
        oq.DeclareAndSet('PFK_ISPOLID', otInteger, rowLaborant.Properties.Value);
        oq.DeclareAndSet('PFK_ID', otInteger, pNAZID);
        oq.Execute;
      end;
//-->> TPODPISNAZ
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' MERGE INTO ASU.TPODPISNAZ '+#13#10+
                    '  USING DUAL ON (FK_NAZID = :PFK_NAZID AND FK_SOTRID = :pFK_SOTRID) '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FK_SOS=:PFK_SOS, FD_INS = :PFD_INS '+#13#10+
                    '                    WHERE FK_NAZID = :PFK_NAZID AND FK_SOTRID = :pFK_SOTRID '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT(FK_NAZID, FK_SOTRID, FK_SOS, FD_DATE, FD_INS) '+#13#10+
                    '                       VALUES(:pFK_NAZID, :pFK_SOTRID, :PFK_SOS, SYSDATE, :pFD_INS) ';
    ods.DeclareAndSet('pFK_NAZID', otInteger, pNAZID);
    ods.DeclareAndSet('pFK_SOTRID', otInteger, rowLaborant.Properties.Value);
    ods.DeclareAndSet('PFK_SOS', otInteger, GET_LABVIP);
    ods.DeclareAndSet('pFD_INS', otDate, StrToDateTime(DateToStr(merDateTime.Properties.Editors[0].Value)+' '+FormatDateTime('hh:nn:ss', IncSecond(merDateTime.Properties.Editors[1].Value, 1))));
    ods.Open;
    frmMain.os.Commit;
  finally
    ods.Free;
    Screen.Cursor := crDefault;
    ModalResult := mrOk;
  end;
end;

procedure TfrmLabPatAnatom.aCancelExecute(Sender: TObject);
begin
  ModalResult := MrCancel;
end;

procedure TfrmLabPatAnatom.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  TVList.StoreToRegistry('\SoftWare\SoftMaster\ListPatAnatom\fLabPatAnatom\grListVrach_' + IntToStr(frmMain.pSOTRID), TRUE, [], 'grList');
end;

procedure TfrmLabPatAnatom.FormCreate(Sender: TObject);
begin
  russian:=LoadKeyboardLayout('00000419', 0);
//-->> "Заряжаем" датасеты
  if odsKorennoe.Active = False then
    odsKorennoe.Active := True;
  if odsVidOplat.Active = False then
    odsVidOplat.Active := True;
  if odsRegPrin.Active = False then
    odsRegPrin.Active := True;
  if odsUrgent.Active = False then
    odsUrgent.Active := True;
  if odsLaborant.Active = False then
    odsLaborant.Active := True;
  if odsOrgan.Active = False then
    odsOrgan.Active := True;

  if (frmMain.get_dbname = 'TO') or (frmMain.get_dbname = 'TM') or (frmMain.get_dbname = 'SO') then // для Нижнего Тагила и Томска
    odsList.SQL.Text := odsListNT.SQL.Text;

  SetVisibleColumn;
end;

procedure TfrmLabPatAnatom.N2Click(Sender: TObject);
begin
  tvList.RestoreFromRegistry('\SoftWare\SoftMaster\ListPatanatom\fLabPatAnatom\grListVrach_' + IntToStr(frmMain.pSOTRID)+'Default', False, False, [], 'grList');
end;

procedure TfrmLabPatAnatom.odsLaborantBeforeOpen(DataSet: TDataSet);
begin
  odsLaborant.SetVariable('PFK_OTDELID', frmMain.pOTDELID);
end;

procedure TfrmLabPatAnatom.odsListApplyRecord(Sender: TOracleDataSet; Action: Char; var Applied: Boolean; var NewRowId: string);
var ods : TOracleDataSet;
begin
  case Action of
    'U':
       begin
         if VNUMGLASS.Focused then
           begin
             ods := TOracleDataSet.Create(nil);
             try
               ods.Session := frmMain.os;
               ods.Cursor := crSQLWait;
               ods.SQL.Text := ' MERGE INTO ASU.TIB '+#13+
                               '  USING DUAL ON (FK_PACID = :PFK_PACID '+#13+
                               '             AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = :PFC_SYNONIM)) '+#13+
                               '   WHEN MATCHED THEN UPDATE SET FC_CHAR = :PFC_CHAR, FK_VRACHID = :PFK_VRACHID '+#13+
                               '                      WHERE FK_PACID = :PFK_PACID AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = :PFC_SYNONIM) '+#13+
                               '   WHEN NOT MATCHED THEN INSERT (FK_PACID, FC_CHAR, FK_SMID, FK_SMEDITID, FK_VRACHID) '+#13+
                               '                         VALUES(:PFK_PACID, :PFC_CHAR, (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = :PFC_SYNONIM), (SELECT FK_OWNER FROM ASU.TSMID WHERE FC_SYNONIM = :PFC_SYNONIM), :PFK_VRACHID) ';
               ods.DeclareAndSet('PFC_CHAR', otString, VNUMGLASS.DataBinding.Field.Value);
               ods.DeclareAndSet('PFK_PACID', otInteger, pNAZID);
               ods.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
               if odsList.RecNo = 1 then
                 ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK1_NUMGLASS');
               if odsList.RecNo = 2 then
                 ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK2_NUMGLASS');
               if odsList.RecNo = 3 then
                 ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK3_NUMGLASS');
               if odsList.RecNo = 4 then
                 ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK4_NUMGLASS');
               if odsList.RecNo = 5 then
                 ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK5_NUMGLASS');
               if odsList.RecNo = 6 then
                 ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK6_NUMGLASS');
               if odsList.RecNo = 7 then
                 ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK7_NUMGLASS');
               if odsList.RecNo = 8 then
                 ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK8_NUMGLASS');
               if odsList.RecNo = 9 then
                 ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK9_NUMGLASS');
               if odsList.RecNo = 10 then
                 ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK10_NUMGLASS');
               ods.Open;
               frmMain.os.Commit;
             finally
               ods.Free;
             end;
           end;
         if VKOLVO.Focused then
           begin
             ods := TOracleDataSet.Create(nil);
             try
               ods.Session := frmMain.os;
               ods.Cursor := crSQLWait;
               ods.SQL.Text := ' MERGE INTO ASU.TIB '+#13+
                               '  USING DUAL ON (FK_PACID = :PFK_PACID '+#13+
                               '             AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = :PFC_SYNONIM)) '+#13#10+
                               '   WHEN MATCHED THEN UPDATE SET FN_NUM = :PFN_NUM, FK_VRACHID = :PFK_VRACHID '+#13+
                               '                      WHERE FK_PACID = :PFK_PACID AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = :PFC_SYNONIM) '+#13+
                               '   WHEN NOT MATCHED THEN INSERT (FK_PACID, FN_NUM, FK_SMID, FK_SMEDITID, FK_VRACHID) '+#13+
                               '                         VALUES(:PFK_PACID, :PFN_NUM, (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = :PFC_SYNONIM), (SELECT FK_OWNER FROM ASU.TSMID WHERE FC_SYNONIM = :PFC_SYNONIM), :PFK_VRACHID) ';
               ods.DeclareAndSet('PFN_NUM', otInteger, VKOLVO.DataBinding.Field.Value);
               ods.DeclareAndSet('PFK_PACID', otInteger, pNAZID);
               ods.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
               if odsList.RecNo = 1 then
                 ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK1_KOLVOFR');
               if odsList.RecNo = 2 then
                 ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK2_KOLVOFR');
               if odsList.RecNo = 3 then
                 ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK3_KOLVOFR');
               if odsList.RecNo = 4 then
                 ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK4_KOLVOFR');
               if odsList.RecNo = 5 then
                 ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK5_KOLVOFR');
               if odsList.RecNo = 6 then
                 ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK6_KOLVOFR');
               if odsList.RecNo = 7 then
                 ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK7_KOLVOFR');
               if odsList.RecNo = 8 then
                 ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK8_KOLVOFR');
               if odsList.RecNo = 9 then
                 ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK9_KOLVOFR');
               if odsList.RecNo = 10 then
                 ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK10_KOLVOFR');
               ods.Open;
               frmMain.os.Commit;
             finally
               ods.Free;
             end;
           end;
         if VOSOB.Focused then
           begin
             ods := TOracleDataSet.Create(nil);
             try
               ods.Session := frmMain.os;
               ods.Cursor := crSQLWait;
               ods.SQL.Text := ' MERGE INTO ASU.TIB '+#13+
                               '  USING DUAL ON (FK_PACID = :PFK_PACID '+#13+
                               '             AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = :PFC_SYNONIM)) '+#13+
                               '   WHEN MATCHED THEN UPDATE SET FC_CHAR = :PFC_CHAR, FK_VRACHID = :PFK_VRACHID '+#13+
                               '                      WHERE FK_PACID = :PFK_PACID AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = :PFC_SYNONIM) '+#13+
                               '   WHEN NOT MATCHED THEN INSERT (FK_PACID, FC_CHAR, FK_SMID, FK_SMEDITID, FK_VRACHID) '+#13+
                               '                         VALUES(:PFK_PACID, :PFC_CHAR, (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = :PFC_SYNONIM), (SELECT FK_OWNER FROM ASU.TSMID WHERE FC_SYNONIM = :PFC_SYNONIM), :PFK_VRACHID) ';
               ods.DeclareAndSet('PFC_CHAR', otString, VOSOB.DataBinding.Field.Value);
               ods.DeclareAndSet('PFK_PACID', otInteger, pNAZID);
               ods.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
               if odsList.RecNo = 1 then
                 ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK1_OSOB');
               if odsList.RecNo = 2 then
                 ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK2_OSOB');
               if odsList.RecNo = 3 then
                 ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK3_OSOB');
               if odsList.RecNo = 4 then
                 ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK4_OSOB');
               if odsList.RecNo = 5 then
                 ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK5_OSOB');
               if odsList.RecNo = 6 then
                 ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK6_OSOB');
               if odsList.RecNo = 7 then
                 ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK7_OSOB');
               if odsList.RecNo = 8 then
                 ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK8_OSOB');
               if odsList.RecNo = 9 then
                 ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK9_OSOB');
               if odsList.RecNo = 10 then
                 ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK10_OSOB');
               ods.Open;
               frmMain.os.Commit;
             finally
               ods.Free;
             end;
           end;
       end;
  end;
  Applied := TRUE;
end;

procedure TfrmLabPatAnatom.odsListBeforeOpen(DataSet: TDataSet);
begin
  odsList.SetVariable('PFK_PACID', pNAZID);
end;

procedure TfrmLabPatAnatom.rowCompanyEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  Application.CreateForm(TfrmSetCompany, frmSetCompany);
  try
    frmSetCompany.ShowModal;
    if frmSetCompany.ModalResult = mrOk then
      begin
        rowCompany.Tag := frmSetCompany.odsList.FieldByName('fk_id').AsInteger;
        TcxButtonEdit(verGr.InplaceEditor).Properties.ViewStyle := vsNormal;
        TcxButtonEdit(verGr.InplaceEditor).EditingText := frmSetCompany.odsList.FieldByName('fc_name').AsString;
        TcxButtonEdit(verGr.InplaceEditor).Properties.ViewStyle := vsHideCursor;
      end;
  finally
    frmSetCompany.Free;
  end;
end;

procedure TfrmLabPatAnatom.rowDsEditPropertiesChange(Sender: TObject);
begin
  isDsChange := True;
end;

procedure TfrmLabPatAnatom.rowKemEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  Application.CreateForm(TfrmKem, frmKem);
  try
    frmKem.ShowModal;
    if frmKem.ModalResult = MrOk then
      begin
        TcxButtonEdit(verGr.InplaceEditor).Properties.ViewStyle := vsNormal;
        TcxButtonEdit(verGr.InplaceEditor).EditingText := frmKem.odsKem.FieldByName('FC_NAME').AsString;
        TcxButtonEdit(verGr.InplaceEditor).Properties.ViewStyle := vsHideCursor;
        rowKem.Tag := frmKem.odsKem.FieldByName('FK_ID').AsInteger;
      end;
  finally
    frmKem.Free;
  end;
end;

procedure TfrmLabPatAnatom.rowKemEditPropertiesChange(Sender: TObject);
begin
  IsKemChange := True;
end;

procedure TfrmLabPatAnatom.rowKorenEditPropertiesChange(Sender: TObject);
begin
  isKorenChange := True;
end;

procedure TfrmLabPatAnatom.rowMacroEditPropertiesChange(Sender: TObject);
begin
  isMacroChange := True;
end;

procedure TfrmLabPatAnatom.rowProjEditPropertiesChange(Sender: TObject);
begin
  isProjChange := True;
end;

procedure TfrmLabPatAnatom.rowTypeOplEditPropertiesChange(Sender: TObject);
begin
  isTypeOplChange := True;
  if odsVidOplat.FieldByName('FC_SYNONIM').AsString = 'TAL_OTHER' then
    begin
      Application.CreateForm(TfrmSetCompany, frmSetCompany);
      try
        frmSetCompany.ShowModal;
        if frmSetCompany.ModalResult = mrOk then
          begin
            rowCompany.Tag := frmSetCompany.odsList.FieldByName('fk_id').AsInteger;
            rowCompany.Properties.Value := frmSetCompany.odsList.FieldByName('fc_name').AsString;
          end;
      finally
        rowCompany.Visible := True;
        frmSetCompany.Free;
      end;
    end else
    begin
      rowCompany.Tag := 0;
      rowCompany.Properties.Value := '';
      rowCompany.Visible := False;
    end;
end;

procedure TfrmLabPatAnatom.SetVisibleColumn;
begin
  VOSOB.Visible := (frmMain.get_dbname <> 'TO') and (frmMain.get_dbname <> 'SO');
  VOSOB_NT.Visible := (frmMain.get_dbname = 'TO') or (frmMain.get_dbname = 'SO');
  VNUMGLASS.Visible := (frmMain.get_dbname = 'TO') or (frmMain.get_dbname = 'TM') or (frmMain.get_dbname = 'SO');
end;

procedure TfrmLabPatAnatom.VCHARPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var ods, odsPrev : TOracleDataSet;
     oq : TOracleQuery;
     id : Integer; 
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetChar, frmSetChar);
      frmSetChar.Caption := 'Характер материала';
      frmSetChar.DoShowForm('ORGAN_PATANATOM');
//-- вычисляем некоторые значения
      odsPrev := TOracleDataSet.Create(nil);
      try
        odsPrev.Session := frmMain.os;
        odsPrev.Cursor := crSQLWait;
        odsPrev.SQL.Text := ' select fk_smid, fc_char from asu.tib where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = :pfc_synonim) ';
        odsPrev.DeclareAndSet('pfk_pacid', otInteger, pNAZID);
        if odsList.RecNo = 1 then
          odsPrev.DeclareAndSet('PFC_SYNONIM', otString, 'MARK1_CHAR');
        if odsList.RecNo = 2 then
          odsPrev.DeclareAndSet('PFC_SYNONIM', otString, 'MARK2_CHAR');
        if odsList.RecNo = 3 then
          odsPrev.DeclareAndSet('PFC_SYNONIM', otString, 'MARK3_CHAR');
        if odsList.RecNo = 4 then
          odsPrev.DeclareAndSet('PFC_SYNONIM', otString, 'MARK4_CHAR');
        if odsList.RecNo = 5 then
          odsPrev.DeclareAndSet('PFC_SYNONIM', otString, 'MARK5_CHAR');
        if odsList.RecNo = 6 then
          odsPrev.DeclareAndSet('PFC_SYNONIM', otString, 'MARK6_CHAR');
        if odsList.RecNo = 7 then
          odsPrev.DeclareAndSet('PFC_SYNONIM', otString, 'MARK7_CHAR');
        if odsList.RecNo = 8 then
          odsPrev.DeclareAndSet('PFC_SYNONIM', otString, 'MARK8_CHAR');
        if odsList.RecNo = 9 then
          odsPrev.DeclareAndSet('PFC_SYNONIM', otString, 'MARK9_CHAR');
        if odsList.RecNo = 10 then
          odsPrev.DeclareAndSet('PFC_SYNONIM', otString, 'MARK10_CHAR');
        odsPrev.Open;
        if odsPrev.RecordCount > 0 then
          begin
            frmSetChar.ods.Locate('fk_id', odsPrev.FieldByName('fk_smid').AsInteger, []);
            frmSetChar.teDop.Text := odsPrev.FieldByName('fc_char').AsString;
          end;
      finally
        odsPrev.Free;
      end;
// -- открываем форму и делаем запись в БД
      try
        frmSetChar.ShowModal;
        if frmSetChar.ModalResult = mrOk then
          begin
            ods := TOracleDataSet.Create(nil);
            try
              ods.Session := frmMain.os;
              ods.Cursor := crSQLWait;
              ods.SQL.Text := ' MERGE INTO ASU.TIB '+#13+
                              '  USING DUAL ON (FK_PACID = :PFK_PACID '+#13+
                              '             AND FK_SMEDITID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = :PFC_SYNONIM)) '+#13+
                              '   WHEN MATCHED THEN UPDATE SET fc_char = :pfc_char, FK_SMID =:PFK_SMID, FK_VRACHID = :PFK_VRACHID '+#13+
                              '                      WHERE FK_PACID = :PFK_PACID '+#13+
                              '                        AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID START WITH FC_SYNONIM = ''ORGAN_PATANATOM'' CONNECT BY PRIOR FK_ID = FK_OWNER) '+#13+
                              '                        AND FK_SMEDITID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = :PFC_SYNONIM) '+#13+
                              '   WHEN NOT MATCHED THEN INSERT(fc_char, FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID) '+#13+
                              '                         VALUES(:pfc_char, :PFK_PACID, :PFK_SMID, (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = :PFC_SYNONIM), :PFK_VRACHID) ';
              ods.DeclareAndSet('PFK_PACID', otInteger, pNAZID);
              ods.DeclareAndSet('PFK_SMID', otInteger, frmSetChar.ods.FieldByName('FK_ID').AsInteger);
              ods.DeclareAndSet('pfc_char', otString, frmSetChar.teDop.Text);
              ods.DeclareAndSet('PFK_VRACHID', otInteger, frmMain.pSOTRID);
              if odsList.RecNo = 1 then
                ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK1_CHAR');
              if odsList.RecNo = 2 then
                ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK2_CHAR');
              if odsList.RecNo = 3 then
                ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK3_CHAR');
              if odsList.RecNo = 4 then
                ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK4_CHAR');
              if odsList.RecNo = 5 then
                ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK5_CHAR');
              if odsList.RecNo = 6 then
                ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK6_CHAR');
              if odsList.RecNo = 7 then
                ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK7_CHAR');
              if odsList.RecNo = 8 then
                ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK8_CHAR');
              if odsList.RecNo = 9 then
                ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK9_CHAR');
              if odsList.RecNo = 10 then
                ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK10_CHAR');
              ods.Open;
              frmMain.os.Commit;

              id := odsList.FieldByName('rownum').AsInteger;
              if odsList.FieldByName('rownum').AsInteger > 5  then
                begin
                  odsList.DisableControls;
                  RefreshQuery(odsList);
                  odsList.EnableControls;
                  tvList.DataController.Scroll(10);
                  odsList.Locate('rownum', id, []);
                end else
                begin
                  RefreshQuery(odsList);
                end;
            finally
              ods.Free;
            end;
          end;
      finally
        frmSetChar.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      if Application.MessageBox('Вы действительно хотите удалить "Характер материала"?', 'Вопрос', MB_ICONQUESTION+MB_YESNO) = mrYes then
        begin
          oq := TOracleQuery.Create(nil);
          try
            oq.Session := frmMain.os;
            oq.Cursor := crSQLWait;
            oq.SQL.Text := ' delete from asu.tib '+#13+
                           '  where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = :pfc_synonim) ';
            oq.DeclareAndSet('pfk_pacid', otInteger, pNAZID);
            if odsList.RecNo = 1 then
              oq.DeclareAndSet('pfc_synonim', otString, 'MARK1_CHAR');
            if odsList.RecNo = 2 then
              oq.DeclareAndSet('pfc_synonim', otString, 'MARK2_CHAR');
            if odsList.RecNo = 3 then
              oq.DeclareAndSet('pfc_synonim', otString, 'MARK3_CHAR');
            if odsList.RecNo = 4 then
              oq.DeclareAndSet('pfc_synonim', otString, 'MARK4_CHAR');
            if odsList.RecNo = 5 then
              oq.DeclareAndSet('pfc_synonim', otString, 'MARK5_CHAR');
            if odsList.RecNo = 6 then
              oq.DeclareAndSet('pfc_synonim', otString, 'MARK6_CHAR');
            if odsList.RecNo = 7 then
              oq.DeclareAndSet('pfc_synonim', otString, 'MARK7_CHAR');
            if odsList.RecNo = 8 then
              oq.DeclareAndSet('pfc_synonim', otString, 'MARK8_CHAR');
            if odsList.RecNo = 9 then
              oq.DeclareAndSet('pfc_synonim', otString, 'MARK9_CHAR');
            if odsList.RecNo = 10 then
              oq.DeclareAndSet('pfc_synonim', otString, 'MARK10_CHAR');
            oq.Execute;
            frmMain.os.Commit;
            id := odsList.FieldByName('rownum').AsInteger;
            if odsList.FieldByName('rownum').AsInteger > 5 then
              begin
                odsList.DisableControls;
                RefreshQuery(odsList);
                odsList.EnableControls;
                tvList.DataController.Scroll(10);
                odsList.Locate('rownum', id, []);
              end else
              begin
                RefreshQuery(odsList);
              end;
          finally
            oq.Free;
          end;
        end;
    end;
end;

procedure TfrmLabPatAnatom.VOSOB_NTPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var oq : TOracleQuery;
    ods, odsPrev : TOracleDataSet;
    id : Integer;
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetChar, frmSetChar);
      frmSetChar.Caption := 'Особенности';
      frmSetChar.DoShowForm('DESCRIPTION_PATANATOM');
//-- вычисляем некоторые значения
      odsPrev := TOracleDataSet.Create(nil);
      try
        odsPrev.Session := frmMain.os;
        odsPrev.Cursor := crSQLWait;
        odsPrev.SQL.Text := ' select fn_num, fc_char from asu.tib where fk_pacid = :pfk_pacid and fk_smid = (select fk_id from asu.tsmid where fc_synonim = :pfc_synonim) ';
        odsPrev.DeclareAndSet('pfk_pacid', otInteger, pNAZID);
        if odsList.RecNo = 1 then
          odsPrev.DeclareAndSet('PFC_SYNONIM', otString, 'MARK1_OSOB');
        if odsList.RecNo = 2 then
          odsPrev.DeclareAndSet('PFC_SYNONIM', otString, 'MARK2_OSOB');
        if odsList.RecNo = 3 then
          odsPrev.DeclareAndSet('PFC_SYNONIM', otString, 'MARK3_OSOB');
        if odsList.RecNo = 4 then
          odsPrev.DeclareAndSet('PFC_SYNONIM', otString, 'MARK4_OSOB');
        if odsList.RecNo = 5 then
          odsPrev.DeclareAndSet('PFC_SYNONIM', otString, 'MARK5_OSOB');
        if odsList.RecNo = 6 then
          odsPrev.DeclareAndSet('PFC_SYNONIM', otString, 'MARK6_OSOB');
        if odsList.RecNo = 7 then
          odsPrev.DeclareAndSet('PFC_SYNONIM', otString, 'MARK7_OSOB');
        if odsList.RecNo = 8 then
          odsPrev.DeclareAndSet('PFC_SYNONIM', otString, 'MARK8_OSOB');
        if odsList.RecNo = 9 then
          odsPrev.DeclareAndSet('PFC_SYNONIM', otString, 'MARK9_OSOB');
        if odsList.RecNo = 10 then
          odsPrev.DeclareAndSet('PFC_SYNONIM', otString, 'MARK10_OSOB');
        odsPrev.Open;
        if odsPrev.RecordCount > 0 then
          begin
            frmSetChar.ods.Locate('fk_id', odsPrev.FieldByName('fn_num').AsInteger, []);
            frmSetChar.teDop.Text := copy(odsPrev.FieldByName('fc_char').AsString, Pos(';', odsPrev.FieldByName('fc_char').AsString)+2, Pos(';', odsPrev.FieldByName('fc_char').AsString)-1);
          end;
      finally
        odsPrev.Free;
      end;
// -- открываем форму и делаем запись в БД
      try
        frmSetChar.ShowModal;
        if frmSetChar.ModalResult = mrOk then
          begin
            ods := TOracleDataSet.Create(nil);
            try
              ods.Session := frmMain.os;
              ods.Cursor := crSQLWait;
              ods.SQL.Text := ' MERGE INTO ASU.TIB '+#13+
                              '  USING DUAL ON (FK_PACID = :PFK_PACID '+#13+
                              '             AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = :PFC_SYNONIM)) '+#13+
                              '   WHEN MATCHED THEN UPDATE SET fc_char = :pfc_char, fn_num = :pfn_num, FK_VRACHID = :PFK_VRACHID '+#13+
                              '                      WHERE FK_PACID = :PFK_PACID '+#13+
                              '                        AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = :PFC_SYNONIM) '+#13+
                              '   WHEN NOT MATCHED THEN INSERT(fc_char, fn_num, FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID) '+#13+
                              '                         VALUES(:pfc_char, :pfn_num, :PFK_PACID, (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = :PFC_SYNONIM), (SELECT FK_OWNER FROM ASU.TSMID WHERE FC_SYNONIM = :PFC_SYNONIM), :PFK_VRACHID) ';
              ods.DeclareAndSet('PFK_PACID', otInteger, pNAZID);
              if frmSetChar.teDop.Text <> '' then
                ods.DeclareAndSet('PFC_CHAR', otString, frmSetChar.ods.FieldByName('FC_NAME').AsString+'; '+frmSetChar.teDop.Text)
              else
                ods.DeclareAndSet('PFC_CHAR', otString, frmSetChar.ods.FieldByName('FC_NAME').AsString);
              ods.DeclareAndSet('PFN_NUM', otInteger, frmSetChar.ods.FieldByName('FK_ID').AsString);
              ods.DeclareAndSet('PFK_VRACHID', otInteger, frmMain.pSOTRID);
              if odsList.RecNo = 1 then
                ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK1_OSOB');
              if odsList.RecNo = 2 then
                ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK2_OSOB');
              if odsList.RecNo = 3 then
                ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK3_OSOB');
              if odsList.RecNo = 4 then
                ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK4_OSOB');
              if odsList.RecNo = 5 then
                ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK5_OSOB');
              if odsList.RecNo = 6 then
                ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK6_OSOB');
              if odsList.RecNo = 7 then
                ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK7_OSOB');
              if odsList.RecNo = 8 then
                ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK8_OSOB');
              if odsList.RecNo = 9 then
                ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK9_OSOB');
              if odsList.RecNo = 10 then
                ods.DeclareAndSet('PFC_SYNONIM', otString, 'MARK10_OSOB');
              ods.Open;
              frmMain.os.Commit;
              id := odsList.FieldByName('rownum').AsInteger;
              if odsList.FieldByName('rownum').AsInteger > 5 then
                begin
                  odsList.DisableControls;
                  RefreshQuery(odsList);
                  odsList.EnableControls;
                  tvList.DataController.Scroll(10);
                  odsList.Locate('rownum', id, []);
                end else
                begin
                  RefreshQuery(odsList);
                end;
            finally
              ods.Free;
            end;
          end;
      finally
        frmSetChar.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      if Application.MessageBox('Вы действительно хотите удалить "Особенности"?', 'Вопрос', MB_ICONQUESTION+MB_YESNO) = mrYes then
        begin
          oq := TOracleQuery.Create(nil);
          try
            oq.Session := frmMain.os;
            oq.Cursor := crSQLWait;
            oq.SQL.Text := ' delete from asu.tib '+#13+
                           '  where fk_pacid = :pfk_pacid and fk_smid = (select fk_id from asu.tsmid where fc_synonim = :pfc_synonim) ';
            oq.DeclareAndSet('pfk_pacid', otInteger, pNAZID);
            if odsList.RecNo = 1 then
              oq.DeclareAndSet('pfc_synonim', otString, 'MARK1_OSOB');
            if odsList.RecNo = 2 then
              oq.DeclareAndSet('pfc_synonim', otString, 'MARK2_OSOB');
            if odsList.RecNo = 3 then
              oq.DeclareAndSet('pfc_synonim', otString, 'MARK3_OSOB');
            if odsList.RecNo = 4 then
              oq.DeclareAndSet('pfc_synonim', otString, 'MARK4_OSOB');
            if odsList.RecNo = 5 then
              oq.DeclareAndSet('pfc_synonim', otString, 'MARK5_OSOB');
            if odsList.RecNo = 6 then
              oq.DeclareAndSet('pfc_synonim', otString, 'MARK6_OSOB');
            if odsList.RecNo = 7 then
              oq.DeclareAndSet('pfc_synonim', otString, 'MARK7_OSOB');
            if odsList.RecNo = 8 then
              oq.DeclareAndSet('pfc_synonim', otString, 'MARK8_OSOB');
            if odsList.RecNo = 9 then
              oq.DeclareAndSet('pfc_synonim', otString, 'MARK9_OSOB');
            if odsList.RecNo = 10 then
              oq.DeclareAndSet('pfc_synonim', otString, 'MARK10_OSOB');
            oq.Execute;
            frmMain.os.Commit;
            id := odsList.FieldByName('rownum').AsInteger;
            if odsList.FieldByName('rownum').AsInteger > 5 then
              begin
                odsList.DisableControls;
                RefreshQuery(odsList);
                odsList.EnableControls;
                tvList.DataController.Scroll(10);
                odsList.Locate('rownum', id, []);
              end else
              begin
                RefreshQuery(odsList);
              end;
          finally
            oq.Free;
          end;
        end;
    end;
end;

end.
