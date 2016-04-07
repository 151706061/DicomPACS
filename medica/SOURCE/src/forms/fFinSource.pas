unit fFinSource;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, ComCtrls, ToolWin, Db, OracleData, Grids,
  JvFormPlacement, Oracle, JvDBUtils, HtmlHlp,
  JvComponentBase, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxTextEdit, cxDBLookupComboBox;

type
  TfmFinSource = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    al: TActionList;
    acClose: TAction;
    acDel: TAction;
    acAdd: TAction;
    acRefresh: TAction;
    ToolButton5: TToolButton;
    FormStorage: TJvFormStorage;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1_FK_ID: TcxGridDBColumn;
    cxGrid1DBTableView1_FC_NAME: TcxGridDBColumn;
    cxGrid1DBTableView1_FC_SYNONIM: TcxGridDBColumn;
    cxGrid1DBTableView1_FK_TYPEDOC_ID: TcxGridDBColumn;
    odsTtypedoc: TOracleDataSet;
    dsTtypedoc: TDataSource;
    odsTFinSource: TOracleDataSet;
    dsTFinSource: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acDelExecute(Sender: TObject);
    procedure acAddExecute(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
    procedure alUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure odsTFinSourceBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    bCanEdit : Boolean;
  public
    { Public declarations }
  end;

procedure DoShowFinSource;
var
  fmFinSource : TfmFinSource;

implementation

uses fmainform, fdmMain;

{$R *.DFM}

{********************************************************************************************************}
{        DoShowUchGr
{********************************************************************************************************}

procedure DoShowFinSource;
begin
  frmMain.CreateChild(TfmFinSource, fmFinSource);
  fmFinSource.odsTtypedoc.Open;
  fmFinSource.Show;
end;

procedure TfmFinSource.FormActivate(Sender: TObject);
begin
  cxGrid1DBTableView1.OptionsData.Appending := bCanEdit;
  cxGrid1DBTableView1.OptionsData.Inserting := bCanEdit;
  cxGrid1DBTableView1.OptionsData.Deleting := bCanEdit;
  cxGrid1DBTableView1.OptionsData.Editing := bCanEdit;

  acRefresh.Execute;
end;

procedure TfmFinSource.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TfmFinSource.FormCreate(Sender: TObject);
begin
  bCanEdit := dmMain.ConfigParams.GetParamValue('FUNC_CAN_EDIT_TFINSOURCE', False );
end;

procedure TfmFinSource.acDelExecute(Sender: TObject);
var
  s : string;
begin
  try
    if (Application.MessageBox('Вы действительно хотите удалить этот источник финансирования?',
                                     'Подвердите действие', MB_YESNO + MB_ICONQUESTION) = IDYES) then begin

      cxGrid1DBTableView1.DataController.DeleteFocused;
      dmMain.os.Commit;
    end;
  except
    on E: EOracleError do
    begin
      s := 'Невозможно удалить источник финансирования "'+cxGrid1DBTableView1_FC_NAME.EditValue+'", т.к. имеются принадлежащие ей приходные документы и партии!'#13#10+
           'Для успешного удаления, необходимо предварительно удалить все приходные документы, имеющие этот источник финансирования.';
      Application.MessageBox(PChar(s),'Ошибка',MB_OK + MB_ICONERROR);
    end;
  end;
end;

procedure TfmFinSource.acAddExecute(Sender: TObject);
begin
  cxGrid1DBTableView1.DataController.Insert;
end;

procedure TfmFinSource.acCloseExecute(Sender: TObject);
begin
  if odsTFinSource.State in ( [dsEdit, dsInsert] ) then
    odsTFinSource.Post;

  Close;
end;

procedure TfmFinSource.acRefreshExecute(Sender: TObject);
begin
  if odsTFinSource.State in ( [dsEdit, dsInsert] ) then
    odsTFinSource.Post;

  try
    odsTFinSource.Close;
    odsTFinSource.Open;
  except
    Application.MessageBox( PAnsiChar('Ошибка при получении списка источников финансирования!'), 'Ошибка', MB_OK + MB_ICONWARNING )
  end;
end;

procedure TfmFinSource.alUpdate(Action: TBasicAction; var Handled: Boolean);

begin
  acAdd.Enabled := ( bCanEdit);

  acDel.Enabled := ( bCanEdit ) and ( cxGrid1DBTableView1.DataController.Active ) and
    not ( cxGrid1DBTableView1.DataController.FocusedRecordIndex < 0) ;
end;

function TfmFinSource.FormHelp(Command: Word; Data: Integer;
  var CallHelp: Boolean): Boolean;
begin
  Result := False;
//  try
//    // TODo Подумать насчет праметра  Command
//    if Data = -1 then
//      HtmlHelp(0, PChar('Medica.chm'), HH_DISPLAY_TOPIC, 0)
//    else
//      HtmlHelp(0, PChar('Medica.chm'), HH_HELP_CONTEXT, Data);
//    CallHelp := False;
//    Result := True;
//  except
//    on EConvertError do
//      ShowMessage('Справка не найдена');
//  end;
end;

procedure TfmFinSource.odsTFinSourceBeforePost(DataSet: TDataSet);
begin
  if Application.MessageBox ( 'Сохранить изменения?', 'Внимание', MB_YESNO + MB_ICONQUESTION) <> mrYes   then
    odsTFinSource.CancelUpdates;
end;

end.
