unit fCommit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxEdit, dxSkinsCore, dxSkinsDefaultPainters,
  cxControls, cxInplaceContainer, cxVGrid, Menus, cxLookAndFeelPainters,
  StdCtrls, cxButtons, ActnList, cxLabel, cxCalendar, cxDBLookupComboBox,
  cxButtonEdit, DB, Oracle, OracleData, cxCheckBox, cxTextEdit,
  dxSkinOffice2007Green, ExtCtrls;

type
  TfrmCommit = class(TForm)
    cxVerticalGrid1: TcxVerticalGrid;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    rowSotr: TcxEditorRow;
    rowDateRun: TcxEditorRow;
    rowResult: TcxEditorRow;
    rowDop: TcxEditorRow;
    catCommit: TcxCategoryRow;
    dsRes: TDataSource;
    dsDop: TDataSource;
    odsRes: TOracleDataSet;
    odsDop: TOracleDataSet;
    Panel1: TPanel;
    bOk: TcxButton;
    bCancel: TcxButton;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCommit: TfrmCommit;

implementation
uses fMain;
{$R *.dfm}

function CheckPeriodSubscribe(var pError: string) : boolean;
var ods : TOracleDataSet;
    res: string;
begin
   ods := TOracleDataSet.Create(nil);
   try
     ods.Session := frmMain.os;
     ods.SQL.Text := ' select asu.is_can_subscribe_talon(:pfk_appsotrnid, :ptalondate, :pfk_talonid) as s from dual ';
     ods.DeclareAndSet('pfk_appsotrnid', otInteger, frmMain.pAPPSOTRID);
     ods.DeclareAndSet('ptalondate', otDate, frmCommit.rowDateRun.Properties.Value);
     ods.DeclareAndSet('pfk_talonid', otInteger, frmMain.pTalonID);
     ods.Close;
     ods.Open;
     Res := ods.FieldByName('S').AsString;
   finally
     ods.Free;
   end;

   pError := Res;
   Result := Res = 'TALON_CORRECT';
end;

procedure TfrmCommit.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmCommit.aOkExecute(Sender: TObject);
var pError : string;
begin
  if rowDateRun.Properties.Value = null then
    begin
      Application.MessageBox('Дата закрытия талона не может быть пустой!', 'Предупреждение', mb_iconwarning+mb_ok);
      Exit;
    end;
  if trunc(StrToDateTime(rowDateRun.Properties.Value)) < trunc(StrToDateTime(frmMain.rowDateBeg.Properties.Value)) then
    begin
      Application.MessageBox('Дата закрытия талона не может быть меньше даты открытия талона!', 'Предупреждение', mb_iconwarning+mb_ok);
      Exit;
    end;
  if trunc(StrToDateTime(rowDateRun.Properties.Value)) <> trunc(StrToDateTime(frmMain.rowDateUsl.Properties.Value)) then
    begin
      Application.MessageBox('Дата закрытия талона должна быть равна дате выполнения услуги!', 'Предупреждение', mb_iconwarning+mb_ok);
      Exit;
    end;
  if (rowResult.Properties.Value = null) or (rowResult.Properties.Value = '') then
    begin
      Application.MessageBox('Прежде чем закрыть талон заполните графу "Результат обращения"! ', 'Предупреждение', mb_iconwarning+mb_ok);
      Exit;
    end;
  if (rowDop.Properties.Value = null) or (rowDop.Properties.Value = '') then
    begin
      Application.MessageBox('Прежде чем закрыть талон заполните графу "Дополнительный исход"! ', 'Предупреждение', mb_iconwarning+mb_ok);
      Exit;
    end;
  if not CheckPeriodSubscribe(pError) then
    begin
      Application.MessageBox(pAnsichar(pError), 'Невозможно подписать талон', MB_ICONINFORMATION + MB_OK);
      Exit;
    end;

  ModalResult := mrOk;
end;

procedure TfrmCommit.FormCreate(Sender: TObject);
var ods : TOracleDataSet;
begin
  rowDateRun.Properties.Value := frmMain.DateSys;
  rowSotr.Properties.Value := frmMain.odsTalon.FieldByName('sotrclosed').AsString;
  if odsRes.Active = False then
    odsRes.Active := True;
  if odsDop.Active = False then
    odsDop.Active := True;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select count(*) as cnt from asu.tsmid '+#13+
                    '  where fc_synonim in (''RAZ_ANAL'', ''ISSLED'') '+#13+
                    ' start with fk_id = :pfk_id connect by prior fk_owner = fk_id ';
    ods.DeclareAndSet('pfk_id', otInteger, frmMain.pSMID);
    ods.Open;
    if ods.FieldByName('cnt').AsInteger > 0 then
      begin
        odsRes.Locate('fk_default', 1, []);
        odsDop.Locate('fk_default', 1, []);
        rowResult.Properties.Value := odsRes.FieldByName('fk_id').AsInteger;
        rowDop.Properties.Value := odsDop.FieldByName('fk_id').AsInteger;
      end;
  finally
    ods.Free;
  end;
end;

end.
