unit uSprOKDPEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TSprOKDPEdit = class(TForm)
    m_lblEditCaption: TLabel;
    m_edCode: TEdit;
    m_btnOK: TButton;
    m_btnCancel: TButton;
    Label1: TLabel;
    m_edName: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
		function GetCode : String;
    function GetName : String;
		procedure SetCode(strCode : String);
    procedure SetName(strName : String);
  end;

var
  SprOKDPEdit: TSprOKDPEdit;

implementation

{$R *.dfm}      

function TSprOKDPEdit.GetCode : String;
begin
	Result := m_edCode.Text;
end;           

function TSprOKDPEdit.GetName : String;
begin
	Result := m_edName.Lines.Text;
end;

procedure TSprOKDPEdit.SetCode(strCode : String);
begin
	m_edCode.Text := strCode;
end;        

procedure TSprOKDPEdit.SetName(strName : String);
begin
	m_edName.Lines.Text := strName;
end;


end.
