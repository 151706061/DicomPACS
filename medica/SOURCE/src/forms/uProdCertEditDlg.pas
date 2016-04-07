// $Id: uProdCertEditDlg.pas,v 1.1 2007/03/12 13:44:42 delphi5 Exp $
//
unit uProdCertEditDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cxControls, cxContainer, cxEdit, cxCheckBox;

type
  TProdCertEditDlg = class(TForm)
    m_edValue: TEdit;
    m_lblEditCaption: TLabel;
    m_btnOK: TButton;
    m_btnCancel: TButton;
    chbForeighn: TcxCheckBox;
  private
    { Private declarations }
  public
		{ Public declarations }
		constructor CreateProd;
		constructor CreateCert;
		function GetEditValue : String;
    function GetForeighn : boolean;
		procedure SetEditValue(strVal : String);
    procedure SetForeighn(bForeighn : boolean);
	end;

implementation

{$R *.DFM}

constructor TProdCertEditDlg.CreateProd;
begin
	inherited Create(nil);
	Caption := 'Информация о производителе';
	m_lblEditCaption.Caption := 'Производитель:';
end;

constructor TProdCertEditDlg.CreateCert;
begin
	inherited Create(nil);
	Caption := 'Информация о сертификате';
	m_lblEditCaption.Caption := 'Сертификат:';
  chbForeighn.Visible := False;
end;

function TProdCertEditDlg.GetEditValue : String;
begin
	Result := m_edValue.Text;
end;           

function TProdCertEditDlg.GetForeighn : boolean;
begin
	Result := chbForeighn.Checked;
end;

procedure TProdCertEditDlg.SetEditValue(strVal : String);
begin
	m_edValue.Text := strVal;
end;        

procedure TProdCertEditDlg.SetForeighn(bForeighn : boolean);
begin
	chbForeighn.Checked := bForeighn;
end;

end.
