unit fEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, ActnList, ExtCtrls, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLabel, StdCtrls, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxRadioGroup, cxGroupBox, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinsdxBarPainter, cxClasses, cxGraphics, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, OracleData, Oracle, DB, cxCheckBox, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue, Menus,
  cxLookAndFeelPainters, cxButtons;

type
  TfrmEdit = class(TForm)
    actlstOKCancel: TActionList;
    actOK: TAction;
    actCancel: TAction;
    odsPeriod: TOracleDataSet;
    dsPeriod: TDataSource;
    odsCat: TOracleDataSet;
    dsCat: TDataSource;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxFam: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxName: TcxTextEdit;
    cxLabel4: TcxLabel;
    cxOtch: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxdeRojd: TcxDateEdit;
    cxLabel5: TcxLabel;
    cxMale: TcxRadioButton;
    cxFemale: TcxRadioButton;
    cxLabel7: TcxLabel;
    cxGroupBox2: TcxGroupBox;
    cxLabel6: TcxLabel;
    cxPeriod: TcxLookupComboBox;
    lbCat: TcxLabel;
    cxCat: TcxLookupComboBox;
    cbRgPlus: TcxCheckBox;
    cbMed: TcxCheckBox;
    mePhone: TcxMaskEdit;
    Panel1: TPanel;
    bOk: TcxButton;
    bCancel: TcxButton;
    procedure actOKExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbMedPropertiesEditValueChanged(Sender: TObject);
    procedure cxPeriodPropertiesEditValueChanged(Sender: TObject);
    procedure cxFamKeyPress(Sender: TObject; var Key: Char);
    procedure cxNameKeyPress(Sender: TObject; var Key: Char);
    procedure cxOtchKeyPress(Sender: TObject; var Key: Char);
  private
    pPEPLID : Integer;
    function DoCheckParameters : Integer;
    { Private declarations }
  public
    procedure DoPeriod(nPEPLID : Integer);
    procedure DoSetRgPlus(nPEPLID : Integer);
    procedure DoPhone(nPEPLID : Integer);
    { Public declarations }
  end;

var
  frmEdit: TfrmEdit;

implementation

uses fMain;

{$R *.dfm}

procedure TfrmEdit.actOKExecute(Sender: TObject);
var oqNaz : TOracleQuery;
    oqRg : TOracleQuery;
begin
  cxdeRojd.PostEditValue;
  if DoCheckParameters = 1 then
    begin
      oqNaz := TOracleQuery.Create(nil);
      oqRg := TOracleQuery.Create(nil);
      try
        oqNaz.Session := frmMain.os;
        oqNaz.Cursor := crSQLWait;
        oqRg.Session := frmMain.os;
        oqRg.Cursor := crSQLWait;
//-- Периодичность осмотров
        if (cxPeriod.Text <> '') and (cxPeriod.Enabled = True) then // Периодичность осмотров
          begin
            oqNaz.SQL.Text := ' DECLARE '+#13+
                              '   Cnt14 NUMBER; '+#13+
                              ' BEGIN '+#13+
                              '   SELECT COUNT(FK_ID) INTO Cnt14 '+#13+
                              '     FROM asu.TIB '+#13+
                              '    WHERE FK_PACID = :PFK_ID '+#13+
                              '      AND FK_SMID IN (SELECT FK_ID '+#13+
                              '                        FROM asu.TSMID '+#13+
                              '                       WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM asu.TSMID WHERE FC_SYNONIM = ''XRAY_PERIOD_OSMOTROV'')); '+#13+
                              ' IF Cnt14 > 0 THEN '+#13+
                              '   UPDATE asu.TIB SET FK_SMID = :pFK_SMID14, '+#13+
                              '                  FK_SMEDITID = (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''XRAY_PERIOD_OSMOTROV''), '+#13+
                              '                  FK_VRACHID =:pFK_VRACHID '+#13+
                              '    WHERE FK_PACID = :pFK_ID '+#13+
                              '      AND FK_SMID IN (SELECT FK_ID FROM asu.TSMID '+#13+
                              '                       WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM asu.TSMID WHERE FC_SYNONIM = ''XRAY_PERIOD_OSMOTROV'')); '+#13+
                              ' ELSE '+#13+
                              '   INSERT INTO asu.TIB(FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID) '+#13+
                              '   VALUES(:pFK_ID, :pFK_SMID14, (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''XRAY_PERIOD_OSMOTROV''), :pFK_VRACHID); '+#13+
                              ' END IF; '+#13+
                              ' END; ';
            oqNaz.DeclareAndSet('PFK_ID', otInteger, pPEPLID);
            oqNaz.DeclareAndSet('pFK_SMID14', otInteger, cxPeriod.EditValue);
            oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
            oqNaz.Execute;
            frmMain.os.Commit;
          end else
          begin
            oqNaz.DeleteVariables;
            oqNaz.SQL.Text := ' delete from asu.tib '+#13+
                              '  where fk_pacid = :pfk_pacid '+#13+
                              '    and fk_smid in (select fk_id '+#13+
                              '                      from asu.tsmid '+#13+
                              '                     where fk_owner = (select fk_id from asu.tsmid where fc_synonim = ''XRAY_PERIOD_OSMOTROV'')) ';
            oqNaz.DeclareAndSet('pfk_pacid', otInteger, pPEPLID);
            oqNaz.Execute;
            frmMain.os.Commit;
          end;
//-- Категория
        if (cxCat.Text <> '') and (cxCat.EditValue <> -1) and (cxCat.Visible <> False) then
          begin
            oqNaz.DeleteVariables;
            oqNaz.SQL.Text := ' DECLARE '+#13+
                              '   Cnt15 NUMBER; '+#13+
                              ' BEGIN '+#13+
                              '   SELECT COUNT(FK_ID) INTO Cnt15 '+#13+
                              '     FROM asu.TIB '+#13+
                              '    WHERE FK_PACID = :PFK_ID '+#13+
                              '      AND FK_SMID IN (SELECT FK_ID '+#13+
                              '                        FROM asu.TSMID '+#13+
                              '                      START WITH FC_SYNONIM = ''FLU_PERIOD_CATEGORY'' CONNECT BY PRIOR FK_ID = FK_OWNER); '+#13+
                              ' IF Cnt15 > 0 THEN '+#13+
                              '   UPDATE asu.TIB SET FK_SMID = :pFK_SMID14, '+#13+
                              '                  FK_SMEDITID = (SELECT FK_OWNER FROM ASU.TSMID WHERE FK_ID = :PFK_SMID14), '+#13+
                              '                  FK_VRACHID =:pFK_VRACHID '+#13+
                              '    WHERE FK_PACID = :pFK_ID '+#13+
                              '      AND FK_SMID IN (SELECT FK_ID FROM asu.TSMID '+#13+
                              '                      START WITH FC_SYNONIM = ''FLU_PERIOD_CATEGORY'' CONNECT BY PRIOR FK_ID = FK_OWNER); '+#13+
                              ' ELSE '+#13+
                              '   INSERT INTO asu.TIB(FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID) '+#13+
                              '   VALUES(:pFK_ID, :pFK_SMID14, (SELECT FK_OWNER FROM asu.TSMID WHERE FK_ID = :PFK_SMID14), :pFK_VRACHID); '+#13+
                              ' END IF; '+#13+
                              ' END; ';
            oqNaz.DeclareAndSet('PFK_ID', otInteger, pPEPLID);
            oqNaz.DeclareAndSet('pFK_SMID14', otInteger, cxCat.EditValue);
            oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
            oqNaz.Execute;
            frmMain.os.Commit;
          end else
          begin
            oqNaz.DeleteVariables;
            oqNaz.SQL.Text := ' delete from asu.tib '+#13+
                              '  where fk_pacid = :pfk_pacid '+#13+
                              '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                              '                     where fk_owner in (select fk_id '+#13+
                              '                                          from asu.tsmid '+#13+
                              '                                         where fc_synonim = ''FLU_PERIOD_CATEGORY_ONEINYEAR'' '+#13+
                              '                                            or fc_synonim = ''FLU_PERIOD_CATEGORY_TWOINYEAR'')) ';
            oqNaz.DeclareAndSet('pfk_pacid', otInteger, pPEPLID);
            oqNaz.Execute;
            frmMain.os.Commit;
          end;
//-- Rg+
        if cbRgPlus.Checked = True then // Rg+
          begin
            oqRg.SQL.Text := ' merge into asu.tib '+#13+
                             '  using dual on (fk_pacid = :pfk_pacid and fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''XRAY_RG_PLUS'')) '+#13+
                             '  when not matched then '+#13+
                             '    insert(fk_pacid, fk_smid, fk_smeditid, fd_date, fk_vrachid) '+#13+
                             '    values(:pfk_pacid, (select fk_id from asu.tsmid where fc_synonim = ''XRAY_RG_PLUS''), '+#13+
                             '                       (select fk_id from asu.tsmid where fc_synonim = ''XRAY_RG_PLUS''), sysdate, :pfk_vrachid) ';
            oqRg.DeclareAndSet('pfk_pacid', otInteger, pPEPLID); // tpeoples.fk_id (сохраняем на пипла)
            oqRg.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
            oqRg.Execute;
            frmMain.os.Commit;
          end else
          begin
            oqRg.SQL.Text := ' delete from asu.tib '+#13+
                             '  where fk_pacid = :pfk_pacid and fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''XRAY_RG_PLUS'') ';
            oqRg.DeclareAndSet('pfk_pacid', otInteger, pPEPLID); // tpeoples.fk_id
            oqRg.Execute;
            frmMain.os.Commit;
          end;
//-- Мед работник
        if cbMed.Checked = True then
          begin
            oqNaz.DeleteVariables;
            oqNaz.SQL.Text := ' merge into asu.tpeplid_med using dual on (fk_peplid = :pfk_peplid) '+#13+
                              ' when not matched then insert(fk_peplid) values(:pfk_peplid) ';
            oqNaz.DeclareAndSet('pfk_peplid', otInteger, pPEPLID);
            oqNaz.Execute;
            frmMain.os.Commit;
          end else
          begin
            oqNaz.DeleteVariables;
            oqNaz.SQL.Text := ' delete from asu.tpeplid_med where fk_peplid = :pfk_peplid ';
            oqNaz.DeclareAndSet('pfk_peplid', otInteger, pPEPLID);
            oqNaz.Execute;
            frmMain.os.Commit;
          end;
//-- Телефон (сот.)
        oqNaz.DeleteVariables;
        oqNaz.SQL.Text := ' merge into asu.tcontacts using dual on (fk_pacid = :pfk_pacid and fk_type = 10) '+#13+
                          '   when not matched then insert(fk_pacid, fc_contact, fc_remark) values(:pfk_pacid, :pfc_contact, ''Телефон (моб.)'')  '+#13+
                          '   when matched then update set fc_contact = :pfc_contact where fk_pacid = :pfk_pacid and fk_type = 10 ';
        oqNaz.DeclareAndSet('pfk_pacid', otInteger, pPEPLID);
        oqNaz.DeclareAndSet('pfc_contact', otString, mePhone.Text);
        oqNaz.Execute;
        frmMain.os.Commit;
      finally
        oqNaz.Free;
        oqRg.Free;
      end;
      ModalResult := mrOk;
    end;
end;

procedure TfrmEdit.cbMedPropertiesEditValueChanged(Sender: TObject);
begin
  if cbMed.Checked = True then
    begin
      odsPeriod.Locate('fc_synonim', 'ONE_IN_YEAR', []);
      cxPeriod.EditValue := odsPeriod.FieldByName('fk_id').AsInteger;
    end; 
end;

procedure TfrmEdit.cxFamKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in ['!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '_', '+', '"', '№', ';', ':', '?', '=', '\', '/', '.', ',', '>', '<', '|', '[', ']', '{', '}'] then
    Key := #0;
end;

procedure TfrmEdit.cxNameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in ['!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '_', '+', '"', '№', ';', ':', '?', '=', '\', '/', '.', ',', '>', '<', '|', '[', ']', '{', '}'] then
    Key := #0;
end;

procedure TfrmEdit.cxOtchKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in ['!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '_', '+', '"', '№', ';', ':', '?', '=', '\', '/', '.', ',', '>', '<', '|', '[', ']', '{', '}'] then
    Key := #0;
end;

procedure TfrmEdit.cxPeriodPropertiesEditValueChanged(Sender: TObject);
var ods : TOracleDataSet;
begin
  if cxPeriod.EditValue = frmMain.get_oneinyear then
    begin
      lbCat.Visible := True;
      cxCat.Visible := True;
      odsCat.Close;
      odsCat.SetVariable('pfc_synonim', 'FLU_PERIOD_CATEGORY_ONEINYEAR');
      odsCat.Open;
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' select fk_smid from asu.tib where fk_pacid = :pfk_pacid '+#13+
                        ' and fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''FLU_PERIOD_CATEGORY'' connect by prior fk_id = fk_owner) ';
        ods.DeclareAndSet('pfk_pacid', otInteger, pPEPLID);
        ods.Open;
        cxCat.EditValue := ods.FieldByName('fk_smid').AsInteger;
      finally
        ods.Free;
      end;
    end;
  if cxPeriod.EditValue = frmMain.get_twoinyear then
    begin
      lbCat.Visible := True;
      cxCat.Visible := True;
      odsCat.Close;
      odsCat.SetVariable('pfc_synonim', 'FLU_PERIOD_CATEGORY_TWOINYEAR');
      odsCat.Open;
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' select fk_smid from asu.tib where fk_pacid = :pfk_pacid '+#13+
                        ' and fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''FLU_PERIOD_CATEGORY'' connect by prior fk_id = fk_owner) ';
        ods.DeclareAndSet('pfk_pacid', otInteger, pPEPLID);
        ods.Open;
        cxCat.EditValue := ods.FieldByName('fk_smid').AsInteger;
      finally
        ods.Free;
      end;
    end;
  if (cxPeriod.EditValue <> frmMain.get_oneinyear) and (cxPeriod.EditValue <> frmMain.get_twoinyear) then
    begin
      lbCat.Visible := False;
      cxCat.Visible := False;
    end;
end;

function TfrmEdit.DoCheckParameters : Integer;
var DateCh : TDateTime;
    odsDate : TOracleDataSet;
    DateSys : TDateTime;
begin
  odsDate := TOracleDataSet.Create(nil);
  try
    odsDate.Session := frmMain.os;
    odsDate.Cursor := crSQLWait;
    odsDate.SQL.Text := ' select trunc(sysdate) as datesys from dual ';
    odsDate.Open;
    DateSys := odsDate.FieldByName('datesys').AsDateTime;
  finally
    odsDate.Free;
  end;
  if cxFam.Text = '' then
    begin
      Application.MessageBox('Вам необходимо указать ФАМИЛИЮ пациента!', 'Предупреждение !', MB_OK + MB_ICONWARNING);
      cxFam.SetFocus;
      Result:= 0;
      exit;
    end;

  if cxName.Text = '' then
    begin
      Application.MessageBox('Вам необходимо указать ИМЯ пациента!', 'Предупреждение !', MB_OK + MB_ICONWARNING);
      cxName.SetFocus;
      Result:= 0;
      exit;
    end;

  DateCh := DateSys;
  if (cxdeRojd.Text = '') or (cxdeRojd.Text = '0') or (cxdeRojd.Text = '30.12.1899') or (TryStrToDate(cxdeRojd.Text, DateCh) = False) then
    begin
      Application.MessageBox('Вам необходимо указать ДАТУ РОЖДЕНИЯ пациента!', 'Предупреждение !', MB_OK + MB_ICONWARNING);
      cxdeRojd.SetFocus;
      Result:= 0;
      exit;
    end;

  if cxdeRojd.Date < StrToDateTime('01.01.1899') then
    begin
      Application.MessageBox('Проверьте правильность ввода даты рождения!', 'Предупреждение !', MB_OK + MB_ICONWARNING);
      cxdeRojd.SetFocus;
      Result := 0;
      exit;
    end;

  if trunc(cxdeRojd.Date) > DateSys then
    begin
      Application.MessageBox('Дата рождения не может быть больше текущей даты!', 'Предупреждение !', MB_OK + MB_ICONWARNING);
      cxdeRojd.SetFocus;
      Result := 0;
      exit;
    end;

  if (cxMale.Checked = FALSE) and (cxFemale.Checked = FALSE) then
    begin
      Application.MessageBox('Вам необходимо указать ПОЛ пациента!', 'Предупреждение !', MB_OK + MB_ICONWARNING);
      cxMale.SetFocus;
      Result:= 0;
      exit;
    end;

  if (mePhone.Text <> '') and (Length(mePhone.Text) <> 11) then
    begin
      Application.MessageBox('Номер сотового телефона должен состоять из 11 символов!', 'Предупреждение !', MB_OK + MB_ICONWARNING);
      mePhone.SetFocus;
      Result:= 0;
      exit;
    end;
  
  Result := 1;
end;

procedure TfrmEdit.DoPeriod(nPEPLID : Integer);
var ods : TOracleDataSet;
begin
  pPEPLID := nPEPLID;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' BEGIN '+#13+
                    '   SELECT MAX(FK_SMID) INTO :VAL '+#13+
                    '     FROM asu.TIB '+#13+
                    '    WHERE FK_PACID = :PFK_ID '+#13+
                    '      AND FK_SMID IN (SELECT FK_ID FROM asu.TSMID '+#13+
                    '                       WHERE FK_OWNER = (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''XRAY_PERIOD_OSMOTROV'')); '+#13+
                    '   IF :VAL IS NULL THEN '+#13+
                    '     select -1 into :val from dual; '+#13+
                    '   END IF; '+#13+
                    ' END; ';
    ods.DeclareAndSet('PFK_ID', otInteger, nPEPLID);
    ods.DeclareVariable('VAL', otInteger);
    ods.Open;
    cxPeriod.EditValue := ods.GetVariable('VAL');
  finally
    ods.Free;
  end;
end;

procedure TfrmEdit.DoPhone(nPEPLID: Integer);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' select fc_contact from asu.tcontacts where fk_pacid = :pfk_pacid and fk_type = 10 ';
    ods.DeclareAndSet('pfk_pacid', otInteger, nPEPLID);
    ods.Open;
    mePhone.Text := ods.FieldByName('fc_contact').AsString;
  finally
    ods.Free;
  end;
end;

procedure TfrmEdit.DoSetRgPlus(nPEPLID : Integer);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' select count(*) as cnt '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid and fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''XRAY_RG_PLUS'') ';
    ods.DeclareAndSet('pfk_pacid', otInteger, nPEPLID);
    ods.Open;
    cbRgPlus.Checked := ods.FieldByName('cnt').AsInteger > 0;
    cbMed.Properties.OnEditValueChanged := nil;
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select count(*) as cnt from asu.tpeplid_med where fk_peplid = :pfk_peplid ';
    ods.DeclareAndSet('pfk_peplid', otInteger, nPEPLID);
    ods.Open;
    cbMed.Checked := ods.FieldByName('cnt').AsInteger > 0;
    cbMed.Properties.OnEditValueChanged := cbMedPropertiesEditValueChanged;
  finally
    ods.Free;
  end;
end;

procedure TfrmEdit.FormCreate(Sender: TObject);
begin
  if odsPeriod.Active = False then
    odsPeriod.Active := True;
end;

procedure TfrmEdit.actCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
