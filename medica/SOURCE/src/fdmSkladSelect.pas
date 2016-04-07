unit fdmSkladSelect;

interface

uses
  SysUtils, Classes, Menus;

type
  TdmSkladSelect = class(TDataModule)
    pmSkladSelect: TPopupMenu;
    miSkladAll: TMenuItem;
    N2: TMenuItem;
    procedure DataModuleCreate(Sender: TObject);
    procedure miSkladAllClick(Sender: TObject);
//    procedure miPrintToExcelClick(Sender: TObject);
  private
    { Private declarations }
    FSkladID : Integer;
    procedure SetSkladID(const aValue: Integer);
  public
    { Public declarations }

    procedure FillSkladMenuItems;
    function SetRadioCheckBySkladID(  aSkladID : integer ) : Boolean;
    property SkladID:Integer  read FSkladID write SetSkladID;

  end;

var
  dmSkladSelect: TdmSkladSelect;

implementation
uses fdmMain;
{$R *.dfm}

procedure TdmSkladSelect.SetSkladID(const aValue: Integer);
begin
  FSkladID := aValue;
end;

procedure TdmSkladSelect.DataModuleCreate(Sender: TObject);
begin
  FSkladID := -1;
end;

procedure TdmSkladSelect.miSkladAllClick(Sender: TObject);
begin
  SkladID := TMenuItem(Sender).Tag;
end;

procedure TdmSkladSelect.FillSkladMenuItems;
var
  mi : TMenuItem;
begin
  // динамически формируем список складов
  dmMain.odsSklad.First;
  while not dmMain.odsSklad.Eof do
  begin
    mi := TMenuItem.Create( pmSkladSelect );
    mi.Caption := dmMain.odsSklad.FieldByName('FC_NAME').AsString;
    mi.Tag     := dmMain.odsSklad.FieldByName('FK_ID').AsInteger;
    mi.OnClick := miSkladAllClick;
    mi.RadioItem := True;
    mi.AutoCheck := True;    
    mi.Visible := True;

    pmSkladSelect.Items.Add(mi);
    dmMain.odsSklad.Next;
  end;
end;

function TdmSkladSelect.SetRadioCheckBySkladID(aSkladID: integer): Boolean;
var
  i : integer;
begin
  Result := False;
  for i := 0 to pmSkladSelect.Items.Count - 1 do
  begin
    if (pmSkladSelect.Items[i].Enabled) then
    begin
      pmSkladSelect.Items[i].Checked := (pmSkladSelect.Items[i].Tag = aSkladID);
      Result := Result or (pmSkladSelect.Items[i].Checked);
    end;
  end;
end;

end.
