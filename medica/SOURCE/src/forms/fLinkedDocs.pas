//------------------------------------------------------------------------------
//  юнит для проверки зависимостей у указанного документа
//------------------------------------------------------------------------------
unit fLinkedDocs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxControls, cxContainer, cxEdit, cxTextEdit, cxMemo,
  Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, DB, OracleData,
  cxLabel, JvComponentBase, JvFormPlacement, Oracle;

type
  TfrmLinkedDocs = class(TForm)
    cxMemo1: TcxMemo;
    Panel1: TPanel;
    buOk: TcxButton;
    odsCheckLinkedDocs: TOracleDataSet;
    cxLabel1: TcxLabel;
    JvFormStorage1: TJvFormStorage;
    laMessage: TcxLabel;
    odsDocKol: TOracleDataSet;
    OracleDataSet1: TOracleDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  TIntList = array of Integer;
  TIntList_p = ^TIntList;  
//var
//  frmLinkedDocs: TfrmLinkedDocs;

// проверяет указанный документ на наличие зависимых документов
// в результате формирует список документов, на которые может повлиять
// указанный документ. Если таких документов нет - то вернет пустую строку.
// актуально при отмене подписи документа
function CheckAndShowLinkedDocs(const aDPID: integer; adpid_listp : TIntList_p; const aCheckOnlyNextRash : Boolean = False; aMessage : string = '';aOnlySignedDocs : Boolean = True; aCheckOnly : boolean = false; aKartId : Integer = -1 ): string;
// проверяет в указанном документе нехватку по всем позициям.  Воронов О.А. 29.04.2008
// актуально при подписи документа
function CheckDocKol(aDPID: integer; aDocDate : TDateTime; aMessage : string = ''): string;

implementation
uses fdmMain, PKGMEDSES;

{$R *.dfm}
//------------------------------------------------------------------------------
procedure TfrmLinkedDocs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ModalResult = mrNone then ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
function CheckAndShowLinkedDocs(const aDPID: integer; adpid_listp : TIntList_p; const aCheckOnlyNextRash : Boolean = False; aMessage : string = '';aOnlySignedDocs : Boolean = True; aCheckOnly : boolean = false; aKartId : Integer = -1 ): string;
var
  i : integer;
  sMess : string;
  frmLinkedDocs: TfrmLinkedDocs;

begin
  sMess := '';
  frmLinkedDocs := TfrmLinkedDocs.Create(Application.MainForm);
  try
    frmLinkedDocs.odsCheckLinkedDocs.SetVariable('KARTID', aKartId);
    if aKartId >= 0 then
      frmLinkedDocs.odsCheckLinkedDocs.SetVariable('BY_KARTID', 1)
    else
      frmLinkedDocs.odsCheckLinkedDocs.SetVariable('BY_KARTID', 0);
    frmLinkedDocs.odsCheckLinkedDocs.SetVariable('aDPID', aDPID);

    frmLinkedDocs.odsCheckLinkedDocs.Filtered := False;
    frmLinkedDocs.odsCheckLinkedDocs.Open;

    if aCheckOnlyNextRash then
    begin
      frmLinkedDocs.odsCheckLinkedDocs.Locate('DPID', aDPID, []); // сначала берем группы МО, которые указаны у целевого документа
      frmLinkedDocs.odsCheckLinkedDocs.SetVariable('PFK_MG_FROM', frmLinkedDocs.odsCheckLinkedDocs.FieldByName('FK_MOGROUPID_TO').AsInteger);
      frmLinkedDocs.odsCheckLinkedDocs.Close;
      frmLinkedDocs.odsCheckLinkedDocs.Open;
    end;

    if aOnlySignedDocs then // фильтр только по подписанным документам
    begin                   // например для РПО, нужно смотреть все документы
      frmLinkedDocs.odsCheckLinkedDocs.Filter := '(FL_EDIT = 0)';
      frmLinkedDocs.odsCheckLinkedDocs.Filtered := True;
    end;


    if (frmLinkedDocs.odsCheckLinkedDocs.RecordCount <= 1)and(frmLinkedDocs.odsCheckLinkedDocs.FieldByName('DPID').AsInteger = aDPID) then
      sMess := ''
    else
    begin
      if adpid_listp <> nil then
        SetLength(adpid_listp^, frmLinkedDocs.odsCheckLinkedDocs.RecordCount);
      sMess := '';
      i := 0;
      frmLinkedDocs.odsCheckLinkedDocs.First;
      while not frmLinkedDocs.odsCheckLinkedDocs.Eof do
      begin
        Inc(i);
        if frmLinkedDocs.odsCheckLinkedDocs.FieldByName('DPID').AsInteger = aDPID then
          sMess := sMess + #13#10+'* '+IntToStr(i)+') '+frmLinkedDocs.odsCheckLinkedDocs.FieldByName('fc_docmix').AsString + ' (зарег. '+frmLinkedDocs.odsCheckLinkedDocs.FieldByName('FC_DOC_REG_DATE').AsString+' - '+frmLinkedDocs.odsCheckLinkedDocs.FieldByName('FC_MG').AsString+')'
        else
          sMess := sMess + #13#10+'   '+IntToStr(i)+') '+frmLinkedDocs.odsCheckLinkedDocs.FieldByName('fc_docmix').AsString + ' (зарег. '+frmLinkedDocs.odsCheckLinkedDocs.FieldByName('FC_DOC_REG_DATE').AsString+' - '+frmLinkedDocs.odsCheckLinkedDocs.FieldByName('FC_MG').AsString+')';
        if adpid_listp <> nil then
          adpid_listp^[i-1] := frmLinkedDocs.odsCheckLinkedDocs.FieldByName('DPID').AsInteger;
        frmLinkedDocs.odsCheckLinkedDocs.Next;
      end;
      Delete(sMess,1,2);
//      Result := sMess+#13#10#13#10'Символом * отмечен текущий документ.'
    end;
    frmLinkedDocs.odsCheckLinkedDocs.Close;

    if (aCheckOnly = False)and(sMess <> '') then
    begin
      frmLinkedDocs.cxMemo1.Text := sMess;
      frmLinkedDocs.laMessage.Caption := aMessage;
      frmLinkedDocs.laMessage.Visible := aMessage <> '';
      frmLinkedDocs.cxMemo1.SelStart := 1;
      frmLinkedDocs.ShowModal;
    end;
  finally
    frmLinkedDocs.Free;
  end;
  Result := sMess;
end;
//------------------------------------------------------------------------------
function CheckDocKol(aDPID: integer; aDocDate : TDateTime; aMessage : string = ''): string;
var
  i : integer;
  sMess : string;
  frmLinkedDocs: TfrmLinkedDocs;
//  Old_FD_DATA2 : TDateTime;
begin
  sMess := '';
  frmLinkedDocs := TfrmLinkedDocs.Create(Application.MainForm);
  try
    // переключаем остатки на дату документа
    dmMain.oqOstRefreshInit.SetVariable('CUR_DATE',     aDocDate);
    dmMain.oqOstRefreshInit.SetVariable('CUR_MO_GROUP', dmMain.FK_CurMO_GROUP);
    dmMain.oqOstRefreshInit.Execute;

    frmLinkedDocs.odsDocKol.SetVariable('aDPID', aDPID);
    frmLinkedDocs.odsDocKol.Filtered := False;
    frmLinkedDocs.odsDocKol.Open;
    frmLinkedDocs.odsDocKol.First;
    i := 0;
    while (not frmLinkedDocs.odsDocKol.Eof) do
    begin
      if frmLinkedDocs.odsDocKol.FieldByName('DIFF_KOL').AsFloat < 0 then
      begin
        Inc( i );
        sMess := sMess +#13#10+ IntToStr(i)+') '+frmLinkedDocs.odsDocKol.FieldByName('FC_MEDIC_NAME').AsString+' = '+FloatToStr(-frmLinkedDocs.odsDocKol.FieldByName('DIFF_KOL').AsFloat);
      end;
      frmLinkedDocs.odsDocKol.Next;
    end;
    Delete(sMess, 1,2);
    frmLinkedDocs.odsDocKol.Close;

    dmMain.oqOstRefreshFinish.SetVariable('CUR_MO_GROUP', dmMain.FK_CurMO_GROUP); // сбрасываем период MEDSES.GET_DATA1 и MEDSES.GET_DATA2 (как в остатках)
    dmMain.oqOstRefreshFinish.Execute;                                         

    if sMess <> '' then
    begin
      frmLinkedDocs.Caption := 'Список позиций, расходуемых сверх остатка на ' + FormatDateTime ( 'dd.mm.yyyy', aDocDate ) + 'г.';
      frmLinkedDocs.cxLabel1.Caption := 'Цифра, после названия наименования, показывает сколько единиц не хватило';
      frmLinkedDocs.cxMemo1.Text := sMess;
      frmLinkedDocs.laMessage.Caption := aMessage;
      frmLinkedDocs.laMessage.Visible := aMessage <> '';
      frmLinkedDocs.cxMemo1.SelStart := 1;
      frmLinkedDocs.ShowModal;
    end;
  finally
    frmLinkedDocs.Free;
  end;
  Result := sMess;
end;
//------------------------------------------------------------------------------
end.
