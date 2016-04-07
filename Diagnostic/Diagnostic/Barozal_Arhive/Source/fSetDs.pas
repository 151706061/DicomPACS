//!!! раскрывать диагноз если в поиске по коду есть подветки например поискать диагноз ≈12
unit fSetDs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxEdit, cxDBLookupComboBox, cxButtonEdit,
  dxSkinsCore, dxSkinsDefaultPainters, cxVGrid, cxControls, cxInplaceContainer,
  cxCustomData, cxTL, cxMaskEdit, cxDBTL, cxTLData, DB, Oracle, OracleData,
  Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, ActnList, cxCheckBox, Registry,
  dxSkinOffice2007Green, ExtCtrls;

type
  TfrmSetDs = class(TForm)
    vGrFilters: TcxVerticalGrid;
    rowGroup: TcxEditorRow;
    tvNameDiag: TcxDBTreeList;
    cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn2: TcxDBTreeListColumn;
    odsGroup: TOracleDataSet;
    dsGroupDiag: TDataSource;
    odsDiag: TOracleDataSet;
    odsDiagFK_ID: TFloatField;
    odsDiagFC_NAME: TStringField;
    odsDiagFK_MKB10: TStringField;
    odsDiagFK_OWNER: TFloatField;
    odsDiagFC_SYNONIM: TStringField;
    dsNameDiag: TDataSource;
    al: TActionList;
    aSave: TAction;
    aCancel: TAction;
    merSearch: TcxMultiEditorRow;
    catFilter: TcxCategoryRow;
    odsDiagFC_NAME_UP: TStringField;
    Panel1: TPanel;
    bSave: TcxButton;
    bCancel: TcxButton;
    procedure rowGroupEditPropertiesEditValueChanged(Sender: TObject);
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure tvNameDiagDblClick(Sender: TObject);
    procedure tvNameDiagKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure merSearchEditors0EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure merSearchEditors1EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    procedure DoShowForm;
    { Public declarations }
  end;

var
   frmSetDs: TfrmSetDs;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmSetDs.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetDs.aSaveExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetDs.DoShowForm;
var Reg : TRegIniFile;
begin
  Reg := TRegIniFile.Create;
  try
    Screen.Cursor := crSQLWait;
//--- "зар€жаем" датасеты
    if odsGroup.Active = False then
      odsGroup.Active := True;
    if odsDiag.Active = False then
      odsDiag.Active := True;
//--- ѕоднимаем настройки из реестра
    Reg.RootKey:=HKEY_CURRENT_USER;
    Reg.OpenKey('\Software\Softmaster\Xray_ds\fSetDs\SOTRID'+IntToStr(frmMain.pSOTRID), True);
    if Reg.ReadInteger('\Software\Softmaster\Xray_ds\fSetDs\SOTRID'+IntToStr(frmMain.pSOTRID), 'DIAGID', 0) <> 0 then
      begin
        rowGroup.Properties.Value := Reg.ReadInteger('\Software\Softmaster\Xray_ds\fSetDs\SOTRID'+IntToStr(frmMain.pSOTRID), 'DIAGID', 0);
        rowGroupEditPropertiesEditValueChanged(nil);
      end else
      begin
        rowGroup.Properties.Value := -3; // если ранее не сохранено то выставл€ем по умолчанию группу "диагнозы пациента"
        rowGroupEditPropertiesEditValueChanged(nil);
      end;
    tvNameDiag.RestoreFromRegistry('\SoftWare\SoftMaster\Xray_ds\fSetDs\tvNameDiagSotr_' + IntToStr(frmMain.pSOTRID) + 'tvNameDiag');
  finally
    Screen.Cursor := crDefault;
    Reg.Free;
  end;
end;

procedure TfrmSetDs.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var Reg : TRegIniFile;
begin
  Reg := TRegIniFile.Create;
  try
    Reg.RootKey:=HKEY_CURRENT_USER;
    if not Reg.OpenKey('\Software\Softmaster\Xray_ds\fSetDs\', FALSE) then
      Reg.CreateKey('\Software\Softmaster\Xray_ds\fSetDs\');
    Reg.WriteString('\Software\Softmaster\Xray_ds\fSetDs\SOTRID'+IntToStr(frmMain.pSOTRID), 'DIAGID', rowGroup.Properties.Value);
    tvNameDiag.StoreToRegistry('\SoftWare\SoftMaster\Xray_ds\fSetDs\tvNameDiagSotr_' + IntToStr(frmMain.pSOTRID) + 'tvNameDiag');
  finally
    Reg.Free;
  end;
end;

procedure TfrmSetDs.merSearchEditors0EditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if AButtonIndex = 0 then
    begin
      odsDiag.Locate('FK_MKB10', TcxButtonEdit(vGrFilters.InplaceEditor).EditingText, []);
      if TcxButtonEdit(vGrFilters.InplaceEditor).EditingText <> odsDiag.FieldByName('FK_MKB10').AsString then
        tvNameDiag.FullCollapse;
    end;
  if AButtonIndex = 1 then
    begin
      TcxButtonEdit(vGrFilters.InplaceEditor).EditingText := '';
      tvNameDiag.FullCollapse;
    end;
end;

procedure TfrmSetDs.merSearchEditors1EditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if AButtonIndex = 0 then
    begin
      odsDiag.Filtered := True;
      odsDiag.Filter := 'FC_NAME_UP = ''*'+ AnsiUpperCase(TcxButtonEdit(vGrFilters.InplaceEditor).EditingText) + '*'' ';
    end;
  if AButtonIndex = 1 then
    begin
      TcxButtonEdit(vGrFilters.InplaceEditor).EditingText := '';
      odsDiag.Filter := '';
      odsDiag.Filtered := False;
      tvNameDiag.FullCollapse;
    end; 
end;

procedure TfrmSetDs.rowGroupEditPropertiesEditValueChanged(Sender: TObject);
var ods : TOracleDataSet;
    str : string;
      i : Integer;
begin
//--- последние 20 диагнозов
  if rowGroup.Properties.Value = -3 then
    begin
      ods:=TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.SQL.Text := ' SELECT DISTINCT FK_SMDIAGID, FD_DATE FROM ASU.TDIAG WHERE FK_VRACHID = :pFK_VRACHID ORDER BY FD_DATE DESC ';
        ods.DeclareAndSet('PFK_VRACHID', otInteger, frmMain.pSOTRID);
        ods.Open;
        ods.First;
//        if ods.RecordCount > 0 then // ???
        str := '';
        i := 0;
        while i < 20 do
          begin
            str := str+IntToStr(ods.FieldByName('FK_SMDIAGID').AsInteger)+',';
            ods.Next;
            i := i+1;
          end;
        str := COPY(str, 1, Length(str)-1);

        odsDiag.DeleteVariables;
        odsDiag.Close;
        odsDiag.SQL.Text :=' SELECT ROWID, FK_ID, FC_NAME, UPPER(FC_NAME) AS FC_NAME_UP, FK_MKB10, FK_OWNER, FC_SYNONIM '+#13+
                               '   FROM ASU.TSMID '+#13+
                               '  WHERE FK_ID IN ('+str+') '; //!!! неправильно это. должно быть через bind-переменную
//        odsDiag.DeclareAndSet('PFC_STR', otString, str);
        odsDiag.Open;
      finally
        ods.Free;
      end;
    end;
//--- все группы и кажда€ группа по отдельности
  if (rowGroup.Properties.Value <> -3) and (rowGroup.Properties.Value <> -4) then
    begin
      odsDiag.DeleteVariables;
      odsDiag.Close;
      odsDiag.SQL.Text := ' SELECT ROWID, FK_ID, FC_NAME, UPPER(FC_NAME) AS FC_NAME_UP, FK_MKB10, FK_OWNER, FC_SYNONIM '+#13+
                          '   FROM ASU.TSMID '+#13+
                          '  WHERE FK_MKB10 IS NOT NULL '+#13+
                          '    AND FK_ID <> :pFK_OWNER '+#13+
                          ' START WITH FK_ID = :pFK_OWNER '+#13+
                          ' CONNECT BY PRIOR FK_ID = FK_OWNER ';
      odsDiag.DeclareAndSet('PFK_OWNER', otInteger, rowGroup.Properties.Value);
      odsDiag.Open;
    end;
end;

procedure TfrmSetDs.tvNameDiagDblClick(Sender: TObject);
begin
  if aSave.Enabled = True then
    aSaveExecute(nil);
end;

procedure TfrmSetDs.tvNameDiagKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    begin
      if aSave.Enabled = True then
        aSaveExecute(nil);
    end;
end;

end.
