// $Id: fPostavLst.pas,v 1.2 2007/05/17 08:08:22 delphi5 Exp $
//

{***************************************************************
 *
 * Unit Name: fPostavLst
 * Purpose  :
 * Author   : Alexander A. Sobjanin sobjanin_alex@chat.ru
 * History  :
 *
 ****************************************************************}

unit fPostavLst;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, ComCtrls, ToolWin, db, JvFormPlacement, HtmlHlp, JvComponentBase, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxMaskEdit, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGridLevel,
  cxGrid, cxTextEdit;

type
  TfrmPostavLst = class(TForm)
    al: TActionList;
    acClose: TAction;
    acDel: TAction;
    acEdit: TAction;
    acAdd: TAction;
    acRefresh: TAction;
    acSelect: TAction;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton3: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton7: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton1: TToolButton;
    FormStorage: TJvFormStorage;
    cxGrid1: TcxGrid;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1POSTAVID: TcxGridDBColumn;
    cxGrid1DBTableView1FC_NAME: TcxGridDBColumn;
    cxGrid1DBTableView1FC_BOSSDOLG: TcxGridDBColumn;
    cxGrid1DBTableView1FC_BOSSFIO: TcxGridDBColumn;
    cxGrid1DBTableView1FC_REKVIZITI: TcxGridDBColumn;
    cxGrid1DBTableView1FC_KONTRAKT_N: TcxGridDBColumn;
    cxGrid1DBTableView1FD_KONTRAKT_BEGIN: TcxGridDBColumn;
    cxGrid1DBTableView1FD_KONTRAKT_END: TcxGridDBColumn;
    cxGrid1DBTableView1FC_ADDRESS: TcxGridDBColumn;
    cxGrid1DBTableView1FC_PHONE: TcxGridDBColumn;
    cxGrid1DBTableView1FC_R_S: TcxGridDBColumn;
    cxGrid1DBTableView1FC_K_S: TcxGridDBColumn;
    cxGrid1DBTableView1FC_INN: TcxGridDBColumn;
    cxGrid1DBTableView1FC_BIK: TcxGridDBColumn;
    cxGrid1DBTableView1FC_OKPO: TcxGridDBColumn;
    cxGrid1DBTableView1FC_OKONH: TcxGridDBColumn;
    cxGrid1DBTableView1FC_BANK: TcxGridDBColumn;
    cxGrid1DBTableView1FC_LICENSE_N: TcxGridDBColumn;
    cxGrid1DBTableView1FD_LICENSE: TcxGridDBColumn;
    cxGrid1DBTableView1FC_PM_VENDOR_ID: TcxGridDBColumn;
    procedure acSelectExecute(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    procedure acEditExecute(Sender: TObject);
    procedure acDelExecute(Sender: TObject);
    procedure acAddExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acCloseExecute(Sender: TObject);
    procedure dxDBGrid1DblClick(Sender: TObject);
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
    procedure FormCreate(Sender: TObject);
    procedure cxGrid1DBTableView1DataControllerDataChanged(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    nID: Integer;
    procedure odslistafteropen(DataSet: tdataset);
  end;

var
  frmPostavLst: TfrmPostavLst;
  SelectedPostavID : Integer;

function DoShowPostavLst(pID: integer = -1; pSelect : Boolean = False; aFormTitle : string = 'Поставщики'): integer;
implementation

uses fdmMain, fMainForm, JvDBUtils, fPostavEdit;

{$R *.DFM}

{********************************************************************************************************}
{        DoShowPostavLst
{********************************************************************************************************}

function DoShowPostavLst(pID: integer = -1; pSelect : Boolean = False; aFormTitle : string = 'Поставщики'): integer;
var
  frmPostavLstModal: TfrmPostavLst;
begin
  dmMain.odsPostav.First;

  if pSelect = True then
  begin
    Application.CreateForm(TfrmPostavLst, frmPostavLstModal);
    frmPostavLstModal.Caption := aFormTitle;

    frmPostavLstModal.FormStyle := fsNormal;
    frmPostavLstModal.nid := pID;

    frmPostavLstModal.acRefresh.Execute;
//    SelectedPostavID := pID;

    if pID > 0 then
      dmMain.odsPostav.Locate('POSTAVID', pID, []);
    frmPostavLstModal.odslistafteropen(nil);
    frmPostavLstModal.acSelect.Visible := pSelect;
    if frmPostavLstModal.ShowModal = mrOK then
      Result := SelectedPostavID
    else
      Result := -1;  
  end
  else
  begin
    Application.CreateForm(TfrmPostavLst, frmPostavLst);
    frmPostavLst.Caption := aFormTitle;    
    frmPostavLst.FormStyle := fsMDIChild;
    frmPostavLst.acRefresh.Execute;
    frmPostavLst.nID := pID;
    if pID > 0 then
      dmMain.odsPostav.Locate('POSTAVID', pID, []);
    frmPostavLst.odslistafteropen(nil);
    frmPostavLst.acSelect.Visible := pSelect;
    frmPostavLst.Show;
    result := frmPostavLst.nid;
  end;
end;

//****************************************************************************************
//                                 TfrmPostavLst.acSaveExecute
//****************************************************************************************

procedure TfrmPostavLst.acSelectExecute(Sender: TObject);
begin
  SelectedPostavID := dmMain.odsPostav.FieldByName('POSTAVID').AsInteger;
  nID := SelectedPostavID;
  ModalResult := mrOk;
end;

procedure TfrmPostavLst.cxGrid1DBTableView1DataControllerDataChanged(
  Sender: TObject);
begin
  acDel.Enabled := (dmMain.odsPostav.RecordCount <> 0);
  acEdit.Enabled := (dmMain.odsPostav.RecordCount <> 0);
end;

//****************************************************************************************
//                                 TfrmPostavLst.odslistafteropen
//****************************************************************************************

procedure TfrmPostavLst.odslistafteropen(DataSet: tdataset);
begin
  acSelect.Enabled := (dmMain.odsPostav.RecordCount <> 0) and (FormStyle = fsNormal);
end;

{****************************************************************************************}
{                                 TfrmPostavLst.acRefreshExecute
{****************************************************************************************}

procedure TfrmPostavLst.acRefreshExecute(Sender: TObject);
begin
  dmMain.odsPostav.Close;
  dmMain.odsPostav.Open;  
end;

{****************************************************************************************}
{                                 TfrmPostavLst.acEditExecute
{****************************************************************************************}

procedure TfrmPostavLst.acEditExecute(Sender: TObject);
var
  PostID : Integer;
begin

  PostID := dmMain.odsPostav.FieldByName('POSTAVID').AsInteger;
  DoShowPostavEdit(PostID);
  acRefresh.Execute;
  dmMain.odsPostav.Locate('POSTAVID', PostID, []);
end;

{****************************************************************************************}
{                                 TfrmPostavLst.acDelExecute
{****************************************************************************************}

procedure TfrmPostavLst.acDelExecute(Sender: TObject);
begin

  if Windows.MessageBoxEx(Handle, 'Вы действительно хотите удалить этого поставщика?', 'Внимание', MB_YESNO + MB_ICONQUESTION, $0419 {Russian}) = mrYes then begin
    dmMain.pkgPOSTAV.TPOSTAVDEL(dmMain.odsPostav.FieldByName('POSTAVID').AsInteger);
    dmMain.os.Commit;
    acRefresh.Execute;
  end;
end;

{****************************************************************************************}
{                                 TfrmPostavLst.acAddExecute
{****************************************************************************************}

procedure TfrmPostavLst.acAddExecute(Sender: TObject);
var
  PostID : Integer;
begin
  PostID := DoShowPostavEdit(-1);
  acRefresh.Execute;
  dmMain.odsPostav.Locate('POSTAVID', PostID, []);
end;

{****************************************************************************************}
{                                 TfrmPostavLst.FormClose
{****************************************************************************************}

procedure TfrmPostavLst.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

{****************************************************************************************}
{                                 TfrmPostavLst.acCloseExecute
{****************************************************************************************}

procedure TfrmPostavLst.acCloseExecute(Sender: TObject);
begin
  Close;
  SelectedPostavID := -1;
end;

procedure TfrmPostavLst.dxDBGrid1DblClick(Sender: TObject);
begin
  if acEdit.Enabled and not acSelect.Enabled then
    acEdit.Execute
  else
    if acSelect.Enabled then
      acSelect.Execute;
end;

function TfrmPostavLst.FormHelp(Command: Word; Data: Integer;
  var CallHelp: Boolean): Boolean;
begin
	Result := False;
  try
    // TODo Подумать насчет праметра  Command
    if Data = -1 then
      HtmlHelp(0, PChar('Medica.chm'), HH_DISPLAY_TOPIC, 0)
    else
      HtmlHelp(0, PChar('Medica.chm'), HH_HELP_CONTEXT, Data);
    CallHelp := False;
    Result := True;
  except
    on EConvertError do
      ShowMessage('Справка не найдена');
  end;
end;

procedure TfrmPostavLst.FormCreate(Sender: TObject);
begin
  SelectedPostavID := -1;
end;

end.
