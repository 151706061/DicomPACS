unit fUchGrEdit_new;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, OracleData, Oracle, cxGraphics, cxCustomData, cxStyles, cxTL, cxMaskEdit, cxInplaceContainer, cxDBTL, cxContainer, cxEdit,
  cxTextEdit, cxDropDownEdit, cxTLData, cxControls, cxPC, ComCtrls, ToolWin, Menus, cxLookAndFeelPainters, cxButtons, ExtCtrls,
  dxLayoutControl;

type
  TfrmUchGrEdit_new = class(TForm)
    m_edName: TEdit;
    m_btnOK: TButton;
    m_btnCancel: TButton;
    m_edQuotaCode: TEdit;
    odsParentUchGr: TOracleDataSet;
    dsParentUchGr: TDataSource;
    grdUchGrTreeList: TcxDBTreeList;
    edtParentUchGr: TcxPopupEdit;
    grdUchGrTreeListFC_UCHGR: TcxDBTreeListColumn;
    grdUchGrTreeListUCHGRID: TcxDBTreeListColumn;
    btnCLoseList: TcxButton;
    btnSelect: TcxButton;
    btnParentClear: TcxButton;
    lcParentTreeListGroup_Root: TdxLayoutGroup;
    lcParentTreeList: TdxLayoutControl;
    lcParentTreeListItem3: TdxLayoutItem;
    lcParentTreeListItem4: TdxLayoutItem;
    lcParentTreeListItem5: TdxLayoutItem;
    lcParentTreeListGroup1: TdxLayoutGroup;
    lcMainGroup_Root: TdxLayoutGroup;
    lcMain: TdxLayoutControl;
    lciedtParentUchGr: TdxLayoutItem;
    lcibtnParentClear: TdxLayoutItem;
    lcgParentsGroup: TdxLayoutGroup;
    lcim_edName: TdxLayoutItem;
    lcgNameGroup: TdxLayoutGroup;
    lcgQuotaGroup: TdxLayoutGroup;
    lcim_edQuotaCode: TdxLayoutItem;
    lcBottomGroup_Root: TdxLayoutGroup;
    lcBottom: TdxLayoutControl;
    lcBottomItem1: TdxLayoutItem;
    lcBottomItem2: TdxLayoutItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure m_btnOKClick(Sender: TObject);
    procedure m_btnCancelClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure btnCLoseListClick(Sender: TObject);

    procedure btnParentClearClick(Sender: TObject);
    procedure grdUchGrTreeListDblClick(Sender: TObject);
  private
    { Private declarations }
    fUchGrId : Integer; // ид
    fParentId : Integer;

    function GetCode : String;
    function GetName : String;
		procedure SetCode(strCode : String);
    procedure SetName(strName : String);

    function CheckData: Boolean ;
  public
    { Public declarations }

    property UchGrCode: string  read GetCode write SetCode;
    property UchGrName: String  read GetName write SetName;
    property ParentId : Integer read fParentId write fParentId ;
    property UchGrId: Integer  read fUchGrId write fUchGrId;

  end;

var
  frmUchGrEdit_new: TfrmUchGrEdit_new;

const
  PARENTID_NULL = 0;
  CAPTION_ERRROR = 'Ошибка';

implementation

uses fdmMain;

{$R *.dfm}

procedure TfrmUchGrEdit_new.btnCLoseListClick(Sender: TObject);
begin
  edtParentUchGr.PopupWindow.ClosePopup;
end;

procedure TfrmUchGrEdit_new.btnParentClearClick(Sender: TObject);
begin
  edtParentUchGr.Text :=  EmptyStr;
  ParentId := PARENTID_NULL;
end;

// выбираем родителя
procedure TfrmUchGrEdit_new.btnSelectClick(Sender: TObject);
begin
  if ( grdUchGrTreeList.FocusedNode <> nil ) then
  begin
    edtParentUchGr.Text :=  grdUchGrTreeList.FocusedNode.Values [ grdUchGrTreeListFC_UCHGR.ItemIndex ];
    ParentId := grdUchGrTreeList.FocusedNode.Values [ grdUchGrTreeListUCHGRID.ItemIndex ];
  end;

  edtParentUchGr.PopupWindow.ClosePopup;
end;

function TfrmUchGrEdit_new.CheckData: Boolean;
begin
  Result := True;

  if ( UchGrName = EmptyStr ) then
  begin
    Application.MessageBox( PAnsiChar ( 'Не указано название учетной группы'), PAnsiChar( CAPTION_ERRROR ), MB_OK + MB_ICONERROR );

    Result := False;
    Exit;
  end;

  if ( dmMain.odsUchGrListByUchgrId.Locate( 'UCHGRID', ParentId, [] )  ) then
  begin
    Application.MessageBox( PAnsiChar ( 'Нельзя в качестве родительского узла указывать этот же или подчиненный. Будет нарушена структура дерева справочника.'),
      PAnsiChar( CAPTION_ERRROR ), MB_OK + MB_ICONERROR );

    Result := False;
    Exit;
  end;        
end;

procedure TfrmUchGrEdit_new.FormCreate(Sender: TObject);
begin
  fParentId := PARENTID_NULL;
  fUchGrId := -1;
  m_edName.MaxLength := dmMain.GetFieldLength('med', 'TUCHGR', 'FC_UCHGR');
  m_edQuotaCode.MaxLength := dmMain.GetFieldLength('med', 'TUCHGR', 'FC_QUOTA_CODE_2');

  lcParentTreeList.Width := edtParentUchGr.Width;

  with odsParentUchGr do
  try
    Close;
    Open;
  except
    Application.MessageBox( PAnsiChar('Ошибка при открытии дерева родителей!'), PAnsiChar ( CAPTION_ERRROR ), MB_OK + MB_ICONERROR);
  end;
end;

procedure TfrmUchGrEdit_new.FormShow(Sender: TObject);
begin
  if ( odsParentUchGr.Locate( 'UCHGRID', ParentId, [] ) ) then
    edtParentUchGr.Text := odsParentUchGr.FieldByName( 'FC_UCHGR' ).AsString;

  // список узлов, которых нельзя выбирать в качестве родителя
  with dmMain.odsUchGrListByUchgrId do
  try
    Close;
    DeclareAndSet ( 'pUCHGRID', otInteger, UchGrId );
    Open;
  except
    Application.MessageBox( PAnsiChar('Ошибка при открытии ветки дерева!'), PAnsiChar ( CAPTION_ERRROR ), MB_OK + MB_ICONERROR);
  end;
end;

function TfrmUchGrEdit_new.GetCode : String;
begin
	Result := Trim(m_edQuotaCode.Text);
end;

function TfrmUchGrEdit_new.GetName : String;
begin
	Result := Trim(m_edName.Text);
end;

procedure TfrmUchGrEdit_new.grdUchGrTreeListDblClick(Sender: TObject);
begin
  // при двойном клике выбираем родителя
  btnSelectClick( Sender );
end;

procedure TfrmUchGrEdit_new.m_btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmUchGrEdit_new.m_btnOKClick(Sender: TObject);
begin
  if CheckData then
    ModalResult := mrOk;
end;

procedure TfrmUchGrEdit_new.SetCode(strCode : String);
begin
	m_edQuotaCode.Text := strCode;
end;

procedure TfrmUchGrEdit_new.SetName(strName : String);
begin
	m_edName.Text := strName;
end;

end.
