unit fmKontrakt_Select;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, DB, OracleData, Oracle,
  OracleMonitor;

type
  Tfm_Kontrakt_Select = class(TForm)
    lcbKontrakt: TcxLookupComboBox;
    buOk: TcxButton;
    buCancel: TcxButton;
    odsKonrakt: TOracleDataSet;
    dsKonrakt: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function DoSelectKontrakt(aOS : TOracleSession; aPostavID : integer; var aKontrakt : string ) : boolean;

implementation

{$R *.dfm}

function DoSelectKontrakt(aOS : TOracleSession; aPostavID : integer; var aKontrakt : string ) : boolean;
var
  fm_Kontrakt_Select: Tfm_Kontrakt_Select;
begin
  Application.CreateForm(Tfm_Kontrakt_Select,  fm_Kontrakt_Select);

  try
    fm_Kontrakt_Select.odsKonrakt.Session := aOS;
    fm_Kontrakt_Select.odsKonrakt.SetVariable('PPOSTID', aPostavID);
    fm_Kontrakt_Select.odsKonrakt.Open;
    if (aKontrakt <> '')and(fm_Kontrakt_Select.odsKonrakt.Locate('FC_NUM', aKontrakt, [])) then
    begin
      fm_Kontrakt_Select.lcbKontrakt.EditValue := aKontrakt;
    end;

    Result := (fm_Kontrakt_Select.ShowModal = mrOk);
    if Result then aKontrakt := fm_Kontrakt_Select.lcbKontrakt.EditValue;
    
  finally
    fm_Kontrakt_Select.Free;
  end;
end;

procedure Tfm_Kontrakt_Select.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  odsKonrakt.Close;
  if ModalResult = mrNone then ModalResult := mrCancel;
end;

end.
