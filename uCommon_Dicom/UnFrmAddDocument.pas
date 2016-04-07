unit UnFrmAddDocument;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinBlack, Medotrade, dxSkinOffice2007Green,
  cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxMaskEdit, cxButtonEdit,
  dxSkinOffice2007Black;

type
  TFrmAddDocument = class(TForm)
    cxLabel6: TcxLabel;
    teComment: TcxTextEdit;
    btnSave: TcxButton;
    btnCancel: TcxButton;
    lbFile: TcxLabel;
    bteditFile: TcxButtonEdit;
    FileOpenDialog1: TFileOpenDialog;
    procedure btnSaveClick(Sender: TObject);
    procedure bteditFilePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    v_STUDYUID,
    vComm,
    vUser : string;
    v_id : Integer;
    IsAdd : Boolean;
    procedure ShowForm( p_STUDYUID : string );
  end;

var
  FrmAddDocument: TFrmAddDocument;

implementation

{$R *.dfm}

Uses DB_CMN, pFIBQuery, pFIBProps, fMain;

procedure TFrmAddDocument.bteditFilePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  FileOpenDialog1.FileName := bteditFile.Text ;
  if FileOpenDialog1.Execute then
    if (bteditFile.Text <> FileOpenDialog1.FileName) then
      bteditFile.Text := FileOpenDialog1.FileName;
end;

procedure TFrmAddDocument.btnSaveClick(Sender: TObject);
var vFIBQuery : TpFIBQuery;
begin
  if (Trim(teComment.Text)='') then
    MessageDlg('Пустое описание документа ...', mtWarning, [mbOK], 0)
  else if ( (Trim(bteditFile.Text)='') and IsAdd ) then
    MessageDlg('Не задан файл ...', mtWarning, [mbOK], 0)
  else if ( IsAdd and (not FileExists(Trim(bteditFile.Text))) ) then
    MessageDlg('Не найден файл ...', mtWarning, [mbOK], 0)
  else
    if IsAdd then   // добавить документ
    begin
      vFIBQuery := TpFIBQuery.Create(nil);
      try
        vFIBQuery.Database := DB_CMN.DB;
        vFIBQuery.Transaction := DB_CMN.trWrite;
        if DB_CMN.trWrite.Active = False then
          DB_CMN.trWrite.StartTransaction;
        vFIBQuery.Options := vFIBQuery.Options + [qoAutoCommit];
        vFIBQuery.SQL.Text := 'select max(F_ID)+1 as nn from STUDYDOCS ';
        vFIBQuery.ExecQuery;
        v_id := vFIBQuery.FieldByName('nn').AsInteger ;
      finally
        vFIBQuery.Free;
      end;
      vFIBQuery := TpFIBQuery.Create(nil);
      try
        vFIBQuery.Database := DB_CMN.DB;
        vFIBQuery.Transaction := DB_CMN.trWrite;
        if DB_CMN.trWrite.Active = False then
          DB_CMN.trWrite.StartTransaction;
        vFIBQuery.Options := vFIBQuery.Options + [qoAutoCommit];
        vFIBQuery.SQL.Text := 'insert into STUDYDOCS ( STUDYUID, FDATE, FCOMMENT, F_FILE, FC_LOGIN, F_ID ) '+
            'values ( :STUDYUID, :FDATE, :FCOMMENT, :F_FILE, :FC_LOGIN, :F_ID )';
        vFIBQuery.ParamByName('F_ID').AsInteger := FrmAddDocument.v_id;
        vFIBQuery.ParamByName('STUDYUID').AsString := FrmAddDocument.v_STUDYUID;
        vFIBQuery.ParamByName('FDATE').AsDateTime := Date ;
        vFIBQuery.ParamByName('FCOMMENT').AsString := Trim(teComment.Text) ;
        vFIBQuery.ParamByName('F_FILE').LoadFromFile(Trim(bteditFile.Text));
        vFIBQuery.ParamByName('FC_LOGIN').AsString := vUser;
        vFIBQuery.ExecQuery;
      finally
        vFIBQuery.Free;
      end;
      ModalResult := mrOk;
    end else
    begin  // изменить описание
      vFIBQuery := TpFIBQuery.Create(nil);
      try
        vFIBQuery.Database := DB_CMN.DB;
        vFIBQuery.Transaction := DB_CMN.trWrite;
        if DB_CMN.trWrite.Active = False then
          DB_CMN.trWrite.StartTransaction;
        vFIBQuery.Options := vFIBQuery.Options + [qoAutoCommit];
        vFIBQuery.SQL.Text := 'update STUDYDOCS s set FCOMMENT=:FCOMMENT '+
                              ' where s.studyuid=:p_studyuid';
        vFIBQuery.ParamByName('p_studyuid').AsString := FrmAddDocument.v_STUDYUID;
        vFIBQuery.ParamByName('FCOMMENT').AsString := Trim(teComment.Text) ;
        vFIBQuery.ExecQuery;
      finally
        vFIBQuery.Free;
      end;
      ModalResult := mrOk;
    end;
end;

procedure TFrmAddDocument.ShowForm( p_STUDYUID : string );
const c_add = 'Добавить документ' ;
      c_edt = 'Изменить описание' ;
begin
  FrmAddDocument.v_STUDYUID := p_STUDYUID;
  if IsAdd then   // добавить документ
  begin
    FrmAddDocument.Caption := c_add ;
    btnSave.Top := 121;
    btnCancel.Top := btnSave.Top;
    FrmAddDocument.Height := 199;
    lbFile.Visible := True;
    bteditFile.Visible := True;
  end else begin  // изменить описание
    FrmAddDocument.Caption := c_edt ;
    btnSave.Top := 72;
    btnCancel.Top := btnSave.Top;
    FrmAddDocument.Height := 144;
    lbFile.Visible := False;
    bteditFile.Visible := False;
  end;
  teComment.Text := FrmAddDocument.vComm;
  FrmAddDocument.ShowModal;
end;

end.
