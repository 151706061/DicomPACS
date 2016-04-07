// $Id: FCHMO.PAS,v 1.1 2007/03/12 13:44:37 delphi5 Exp $
//

{***************************************************************
 *
 * Unit Name: fChoosePostavshik
 * Purpose  :
 * Author   : Собянин А.А.  sobjanin_alex@chat.ru
 * History  :
 *
 ****************************************************************}

unit fchmo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ActnList, ImgList, ToolWin, Oracle, Db, OracleData, Grids,
  JvFormPlacement, HtmlHlp, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid;

type
  TfrmChmo = class(TForm)
    CoolBar1: TCoolBar;
    al: TActionList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    acSave: TAction;
    acCancel: TAction;
    acRefresh: TAction;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton; //TDBEhSortGrid;
    odsChmo: TOracleDataSet;
    dsChmo: TDataSource;
    odsChmoMOID: TIntegerField;
    odsChmoFC_NAME: TStringField;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1_FC_NAME: TcxGridDBColumn;
    cxGrid1DBTableView1_MOID: TcxGridDBColumn;
    procedure acRefreshExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure acSaveExecute(Sender: TObject);
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function getChmoID(pID: integer = -1): Integer;

//var
//  frmChmo: TfrmChmo;

implementation

uses fdmMain;

{$R *.DFM}

{********************************************************************************************************}
{        getPostavshikID
{********************************************************************************************************}

function getChmoID(pID: integer = -1): Integer;
var frmChmo : TfrmChmo;
begin
  frmChmo := TfrmChmo.Create(nil);
  try
    frmChmo.odsChmo.Session := dmMain.os;
    frmChmo.odsChmo.Close;
    frmChmo.odsChmo.Open;
    frmChmo.odsChmo.Locate('MOID', pID, []);
    frmChmo.acSave.Enabled := not frmChmo.odsChmo.IsEmpty;
    if frmChmo.ShowModal = mrOk then
    begin
      result := frmChmo.odsChmo.FieldByName('MOID').AsInteger;
      IniWriteString(iniFileName, 'config', 'nMatOtvID', IntToStr(Result));
    end
    else result := -1;
  finally
    frmChmo.Free;
  end;
end;

{********************************************************************************************************}
{        TfrmChmo.acRefershExecute
{********************************************************************************************************}

procedure TfrmChmo.acRefreshExecute(Sender: TObject);
begin
  cxGrid1.Refresh;
end;

{********************************************************************************************************}
{        TfrmChmo.acCancelExecute
{********************************************************************************************************}

procedure TfrmChmo.acCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

{********************************************************************************************************}
{        TfrmChmo.acSaveExecute
{********************************************************************************************************}

procedure TfrmChmo.acSaveExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

function TfrmChmo.FormHelp(Command: Word; Data: Integer;
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

end.
