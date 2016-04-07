unit fCorrect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxSkinsCore, dxSkinsDefaultPainters, cxLabel, cxControls,
  cxContainer, cxEdit, cxImage, JvExExtCtrls, JvExtComponent, JvPanel,
  cxTextEdit, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, ActnList,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue, Oracle, OracleData;

type
  TfrmCorrect = class(TForm)
    JvPanel1: TJvPanel;
    cxImage1: TcxImage;
    cxLabel1: TcxLabel;
    JvPanel2: TJvPanel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    lbNum: TcxLabel;
    teNewNum: TcxTextEdit;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    Panel1: TPanel;
    bOk: TcxButton;
    bCancel: TcxButton;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCorrect: TfrmCorrect;

implementation

uses fMain;

{$R *.dfm}

procedure TfrmCorrect.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmCorrect.aOkExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' select asu.pkg_regist_pacfunc.get_pac_fullfio(tnazis.fk_pacid) as fiopac, to_char(fd_run, ''dd.mm.yyyy hh24:mi'') as fd_run, fc_name '+#13+
                    '   from asu.tnazis '+#13+
                    '  where fc_type = :pfc_type '+#13+
                    '    and fk_pacid <> :pfk_pacid ';
    ods.DeclareAndSet('pfc_type', otString, trim(teNewNum.Text));
    ods.DeclareAndSet('pfk_pacid', otInteger, frmMain.odsList.FieldByName('fk_pacid').AsInteger);
    ods.Open;
    if ods.RecordCount > 0 then
      begin
        MessageDlg('Внимание!'+#13+#10+
                   'Такой номер протокола уже есть у другого пациента!'+#13+#10+
                   'Пациент: '+ods.FieldByName('fiopac').AsString+#13+#10+
                   'Исследование: '+ods.FieldByName('fd_run').AsString+' '+ods.FieldByName('fc_name').AsString, mtInformation, [mbOK], 0);
        exit;           
      end;
  finally
    ods.Free;
  end;
  
  if (teNewNum.Text = '') or (teNewNum.Text = '0') then
    begin
      Application.MessageBox('Вам необходимо указать новый номер протокола! Пустые значения недопустимы!', 'Предупреждение', MB_OK+MB_ICONWARNING);
      teNewNum.SetFocus;
      Exit;
    end;
  ModalResult := mrOk;
end;

end.
