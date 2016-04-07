unit DCM_Client_Retry;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, CnsJpgGr, ExtCtrls, cnsmsg;

type
  TDicomConnectErrorForm = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ErrorCode: Integer;
    ErrorMessage: string;
    Host: string;
  end;

implementation

{$R *.dfm}

procedure TDicomConnectErrorForm.FormCreate(Sender: TObject);
begin
  ErrorCode := 0;
  ErrorMessage := '';
end;

procedure TDicomConnectErrorForm.FormShow(Sender: TObject);
begin
  Label1.Caption := Format(V_OPENTABLE_ERROR, [Host]);
  Memo1.Lines.Add(ErrorMessage);
  if ErrorCode = 10038 then //连接不了
  begin

  end
  else
    if ErrorCode = 10053 then //发送错误
  begin

  end
  else
    if ErrorCode = 1 then //WADO错误
  begin

  end
  else
    if ErrorCode = 0 then //数据库错误
  begin
     Label1.Caption := Format(V_OPENTABLE_DBERROR, [Host]);
  end;
end;

end.

