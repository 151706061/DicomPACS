unit fRecipe;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TfrmRecipe = class(TForm)
    gbSerial: TGroupBox;
    gbNumber: TGroupBox;
    edSerial: TEdit;
    edNumberFrom: TEdit;
    edNumberTo: TEdit;
	lblNumberTo: TLabel;
	lblNumberFrom: TLabel;
    btnOK: TButton;
    btnCancel: TButton;
    cbResetCurrentNum: TCheckBox;
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRecipe: TfrmRecipe;

implementation

uses
	fdmMain;

{$R *.DFM}

procedure TfrmRecipe.btnOKClick(Sender: TObject);
begin
	try
		StrToInt64(edNumberFrom.Text);
	except
		on e : EConvertError do begin
			Application.MessageBox('Номер рецепта должен быть числом', 'Ошибка', MB_ICONWARNING + MB_OK);
			edNumberFrom.SetFocus;
			Exit;
		end;
	end;
	try
		StrToInt64(edNumberTo.Text);
	except
		on e : EConvertError do begin
			Application.MessageBox('Номер рецепта должен быть числом', 'Ошибка', MB_ICONWARNING + MB_OK);
			edNumberTo.SetFocus;
			Exit;
		end;
	end;
	dmMain.pkgSmini.Writestring('CONFIG', 'S_RECIPE_NUMBER_FROM', edNumberFrom.Text);
	dmMain.pkgSmini.Writestring('CONFIG', 'S_RECIPE_NUMBER_TO', edNumberTo.Text);
	if cbResetCurrentNum.Checked then begin
		dmMain.pkgSmini.Writestring('CONFIG', 'S_RECIPE_NUMBER_LAST', edNumberFrom.Text);
	end;
	ModalResult := mrOk;
end;

procedure TfrmRecipe.FormCreate(Sender: TObject);
var
	s : string;
begin
	s := dmMain.pkgSmini.Readstring('CONFIG', 'S_RECIPE_SERIAL', '86');
	edSerial.Text := s;
	s := dmMain.pkgSmini.Readstring('CONFIG', 'S_RECIPE_NUMBER_FROM', '1');
	edNumberFrom.Text := s;
	s := dmMain.pkgSmini.Readstring('CONFIG', 'S_RECIPE_NUMBER_TO', '9999999999');
	edNumberTo.Text := s;
	s := dmMain.pkgSmini.Readstring('CONFIG', 'S_RECIPE_NUMBER_LAST', '1');
	gbNumber.Caption := Format('Номер (текущий: %s)', [s]);
end;

end.
