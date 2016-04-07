unit fSetPeriodCategory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, ActnList, cxClasses, cxGraphics, DB, OracleData, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxControls, cxContainer, cxEdit, cxLabel, Oracle, dxSkinsCore,
  dxSkinsdxBarPainter, dxSkinOffice2007Green, ExtCtrls, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons;

type
  TfrmSetPeriodCategory = class(TForm)
    actlstOKCancel: TActionList;
    actOK: TAction;
    actCancel: TAction;
    odsPeriod: TOracleDataSet;
    dsPeriod: TDataSource;
    odsCat: TOracleDataSet;
    dsCat: TDataSource;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cxPeriod: TcxLookupComboBox;
    lbCat: TcxLabel;
    cxCat: TcxLookupComboBox;
    Panel2: TPanel;
    bSave: TcxButton;
    bCancel: TcxButton;
    procedure actOKExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxPeriodPropertiesEditValueChanged(Sender: TObject);
  private
    pPEPLID : Integer;
    { Private declarations }
  public
    procedure DoPeriod(nPEPLID : Integer);
    { Public declarations }
  end;

var
  frmSetPeriodCategory: TfrmSetPeriodCategory;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmSetPeriodCategory.actCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetPeriodCategory.actOKExecute(Sender: TObject);
var oqNaz : TOracleQuery;
begin
  oqNaz := TOracleQuery.Create(nil);
  try
    oqNaz.Session := frmMain.os;
    oqNaz.Cursor := crSQLWait;
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
  finally
    oqNaz.Free;
  end;
  ModalResult := mrOk;
end;

procedure TfrmSetPeriodCategory.cxPeriodPropertiesEditValueChanged(Sender: TObject);
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
        ods.SQL.Text := ' select fk_smid '+#13+
                        '   from asu.tib '+#13+
                        '  where fk_pacid = :pfk_pacid '+#13+
                        '    and fk_smid in (select fk_id '+#13+
                        '                      from asu.tsmid '+#13+
                        '                    start with fc_synonim = ''FLU_PERIOD_CATEGORY'' connect by prior fk_id = fk_owner) ';
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
        ods.SQL.Text := ' select fk_smid '+#13+
                        '   from asu.tib '+#13+
                        '  where fk_pacid = :pfk_pacid '+#13+
                        '    and fk_smid in (select fk_id '+#13+
                        '                      from asu.tsmid '+#13+
                        '                    start with fc_synonim = ''FLU_PERIOD_CATEGORY'' connect by prior fk_id = fk_owner) ';
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

procedure TfrmSetPeriodCategory.DoPeriod(nPEPLID: Integer);
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

procedure TfrmSetPeriodCategory.FormCreate(Sender: TObject);
begin
  if odsPeriod.Active = False then
    odsPeriod.Active := True;
end;

end.
