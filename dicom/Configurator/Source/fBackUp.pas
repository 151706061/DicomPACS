unit fBackUp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinOffice2007Green, cxImage, cxControls, cxContainer, cxEdit, cxLabel,
  ExtCtrls, JvExExtCtrls, JvExtComponent, JvPanel, Menus, cxLookAndFeelPainters,
  cxMemo, StdCtrls, cxButtons, cxTextEdit, IB_Services, ActnList, dxSkinsCore,
  dxSkinBlack, dxSkinOffice2007Black, DB_CMN;

type
  TFrmBackUp = class(TForm)
    jvpnl2: TJvPanel;
    cxlbl3: TcxLabel;
    cxtxtdtBD: TcxTextEdit;
    cxmBackUp: TcxMemo;
    btnBackUp: TcxButton;
    fibBackUp: TpFIBBackupService;
    actlstal: TActionList;
    actSave: TAction;
    actDisable: TAction;
    procedure actSaveExecute(Sender: TObject);
    procedure actDisableExecute(Sender: TObject);
  private
    v_dest_dir,
//    v_dbname,
    v_username,
    v_password:AnsiString;
  public
    v_ok : Boolean;
    v_file_backup : AnsiString;
    procedure SetParams ( const p_dest_dir:AnsiString;
              //            const p_dbname:AnsiString;
                          const p_username:AnsiString;
                          const p_password:AnsiString
                        );
  end;

var
  FrmBackUp: TFrmBackUp;

implementation

Uses DateUtils, fMain;

{$R *.dfm}

// ���������� ���������
procedure TFrmBackUp.actDisableExecute(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TFrmBackUp.actSaveExecute(Sender: TObject);
var v_curtime : TDateTime; v_ch_tmp : string;
begin
if cxtxtdtBD.Text = '' then
    begin
      MessageDlg('�� ������� ����������� ���������� �����������!', mtError,[mbOk],0);
      Exit;
    end else
    begin
      With fibBackUp do begin
        DatabaseName :=  DB_CMN.DB.AliasName;
        ServerName := 'LocalHost';
        BackupFile.Clear;
        // ���� ���������� �����������
        v_curtime:=now;
        cxtxtdtBD.Text:=Trim(cxtxtdtBD.Text);
        // ���� �������� ��� - �������� ���
        if not DirectoryExists(cxtxtdtBD.Text) then begin
          if not CreateDir(cxtxtdtBD.Text) then
          begin
            if not ForceDirectories(cxtxtdtBD.Text) then
            begin
              MessageDlg('������ �������� ��������', mtError, [], 0);
              exit;
            end;
          end;
        end;
        // ������� ����������� ���� ��� ���
        v_ch_tmp:=Copy(cxtxtdtBD.Text,length(cxtxtdtBD.Text),1);
        if (v_ch_tmp<>'\') and (v_ch_tmp<>'/') then
           cxtxtdtBD.Text := cxtxtdtBD.Text+'\';
        FrmBackUp.v_file_backup:=cxtxtdtBD.Text + 'PACSDB_' +
             StringReplace(DateToStr(v_curtime),'.','_',[rfReplaceAll, rfIgnoreCase])+'_'+
             IntToStr( Hourof(v_curtime)) +'_'+
             IntToStr( Minuteof(v_curtime)) +'_'+
             IntToStr( Secondof(v_curtime)) +
             '.bak';
        BackupFile.Add(FrmBackUp.v_file_backup);
        Params.Clear;
        Params.Add('user_name='+v_username);
        Params.Add('password='+v_password);
        Active := True; // ���������� �������
        try
          Screen.Cursor := crSQLWait;
          ServiceStart; // � �������� ���
          cxmBackUp.Lines.Add('**************** ��������� ����������� ������ ****************');
         {���� �� ���������� ������� ������� ���� � ��������, ��� ���� ����� ���� ������������ ����� �������� Verbose ��������� � �������� TRUE}
          while not (Eof) do
            begin
              cxmBackUp.Lines.Add(GetNextLine);
            end;
          cxmBackUp.Lines.Add('*************** ��������� ����������� ��������� ***************');
          Active := False; //��������� �������
          FrmBackUp.v_ok:=True; // ��������� �������� ��������� �����������
        except
          on e: Exception do
            MessageDlg('������ ��� ��������� ����������� ���� ������!'+#13+
                       e.Message, mtError,[mbOk],0);
        end;

      end;
      Screen.Cursor := crDefault;
    end;
end;

// ������������� ����������
procedure TFrmBackUp.SetParams (  const p_dest_dir:AnsiString;
                                //  const p_dbname:AnsiString;
                                  const p_username:AnsiString;
                                  const p_password:AnsiString
                               );
begin
  FrmBackUp.v_ok:=False;
  cxtxtdtBD.Text:=Trim(p_dest_dir);
  //
  v_dest_dir := p_dest_dir;
//  v_dbname := p_dbname;
  v_username := p_username;
  v_password := p_password;
end;

end.
