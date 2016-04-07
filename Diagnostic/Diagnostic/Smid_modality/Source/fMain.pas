unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxMaskEdit, cxTextEdit,
  dxSkinsCore, cxInplaceContainer, cxDBTL, cxControls, cxTLData, DB, OracleData,
  Oracle, JclFileUtils, SMMainAPI, dxSkinscxPCPainter, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  cxDBLookupComboBox, dxSkinsdxBarPainter, dxBar, jvDBUtils, ActnList, ImgList,
  Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxContainer, cxLabel,
  ExtCtrls, dxSkinOffice2007Green, cxCheckBox;

type
  TfrmMain = class(TForm)
    os: TOracleSession;
    dsTree: TDataSource;
    odsTree: TOracleDataSet;
    tvList: TcxGridDBTableView;
    grListLevel1: TcxGridLevel;
    grList: TcxGrid;
    tvListName: TcxGridDBColumn;
    tvListModal: TcxGridDBColumn;
    dsModal: TDataSource;
    odsModal: TOracleDataSet;
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    BMBar1: TdxBar;
    al: TActionList;
    IL: TImageList;
    bbRef: TdxBarButton;
    bbClose: TdxBarButton;
    aClose: TAction;
    aRef: TAction;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    teFilter: TcxTextEdit;
    cxButton1: TcxButton;
    aClear: TAction;
    Button1: TButton;
    tvListId: TcxGridDBColumn;
    tvListmodal_str: TcxGridDBColumn;
    Button2: TButton;
    procedure osAfterLogOn(Sender: TOracleSession);
    procedure FormCreate(Sender: TObject);
    procedure odsTreeApplyRecord(Sender: TOracleDataSet; Action: Char;
      var Applied: Boolean; var NewRowId: string);
    procedure aRefExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aClearExecute(Sender: TObject);
    procedure teFilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tvListMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure cbUnSetPropertiesChange(Sender: TObject);
  private
    pAPPSOTRID : Integer;
    { Private declarations }
  public
    pSOTRID : Integer;
    sSOTRFIO : String;
    procedure DoShowForm;
    procedure pModalitySet ( pfk_modality, pfk_smid : integer );
    procedure pModalityClr ( pfk_smid : integer );
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.aClearExecute(Sender: TObject);
begin
  teFilter.Text := '';
  odsTree.Filtered := False;
end;

procedure TfrmMain.aCloseExecute(Sender: TObject);
begin
  odsTree.First;
  close;
end;

procedure TfrmMain.aRefExecute(Sender: TObject);
begin
  RefreshQuery(odsTree);
end;

procedure TfrmMain.pModalityClr ( pfk_smid : integer );
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
   oq.Session := frmMain.os;
   oq.Cursor := crSQLWait;
   oq.SQL.Text := 'delete from asu.tsmid_modality where fk_smid = :pfk_smid ';
   oq.DeclareAndSet('pfk_smid', otInteger, pfk_smid);
   oq.Execute;
   frmMain.os.Commit;
  finally
   oq.Free;
  end;
end;

procedure TfrmMain.pModalitySet ( pfk_modality, pfk_smid : integer );
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
   oq.Session := frmMain.os;
   oq.Cursor := crSQLWait;
   oq.SQL.Text := ' merge into asu.tsmid_modality using dual on (fk_smid = :pfk_smid) '+#13+
                  '   when not matched then insert(fk_smid, fk_modality) values(:pfk_smid, :pfk_modality) '+#13+
                  '   when matched then update set fk_modality = :pfk_modality where fk_smid = :pfk_smid ';
   oq.DeclareAndSet('pfk_modality', otInteger, pfk_modality);
   oq.DeclareAndSet('pfk_smid', otInteger, pfk_smid);
   oq.Execute;
   frmMain.os.Commit;
  finally
   oq.Free;
  end;
end;

procedure TfrmMain.Button1Click(Sender: TObject);
var vFocusedRowIndex, vVal, i, vValTmp : integer;
    vIdStr : ansistring;
    vTextMsgSet : string;
    oq : TOracleQuery;
    vIsClr : Boolean;
begin // Назначить для списка
  vFocusedRowIndex := tvList.DataController.FocusedRowIndex;
  if ( vFocusedRowIndex>-1 ) then
  begin
    if VarIsNull(tvList.DataController.Values[vFocusedRowIndex, tvListModal.Index]) then
    begin
      vIsClr:=True;
      vTextMsgSet := 'Очистить модальность '+ #13+'для каждой записи списка ?';
    end else
    begin
      vIsClr:=False;
      vTextMsgSet := 'Назначить текущую модальность '+ #13+
                     'для каждой записи списка ?';
      vVal := tvList.DataController.Values[vFocusedRowIndex, tvListModal.Index];
    end;
    if Application.MessageBox(PChar(vTextMsgSet), 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
    begin
      if odsTree.State in [dsEdit] then odsTree.Post;
//      odsTree.ApplyUpdates;
      odsTree.DisableControls;
      odsModal.DisableControls;

    //  showmessage('tvList.DataController.FilteredRecordCount='+inttostr(tvList.DataController.FilteredRecordCount));

      try
        for I := 0 to tvList.DataController.FilteredRecordCount - 1 do
        begin
          if vIsClr then
          begin
            if not VarIsNull(tvList.ViewData.Rows[I].Values[tvListId.Index]) then
              pModalityClr(tvList.ViewData.Rows[I].Values[tvListId.Index])
          end else begin
            if VarIsNull(tvList.DataController.Values[i, tvListModal.Index]) then
              vValTmp := -1
            else
              vValTmp := tvList.DataController.Values[i, tvListModal.Index];
            if vVal<>vValTmp then
            begin
              pModalitySet ( vVal, tvList.ViewData.Rows[I].Values[tvListId.Index] );
            end;
          end;
        end;
        Application.MessageBox('Выполнено ...' , 'Внимание', MB_ICONWARNING+MB_OK);
      finally
        odsTree.EnableControls;
        odsModal.EnableControls;
        RefreshQuery(odsTree);
      end;
    end;
  end else
  begin
    Application.MessageBox('Список пуст !' , 'Внимание', MB_ICONWARNING+MB_OK);
  end;
end;

procedure TfrmMain.Button2Click(Sender: TObject);
var vFocusedRowIndex : integer;
    vTextMsgSet: string;
begin // clear one record
  vFocusedRowIndex := tvList.DataController.FocusedRowIndex;
  if ( vFocusedRowIndex>-1 ) then
  begin
    vTextMsgSet := 'Очистить модальность ?';
    if Application.MessageBox(PChar(vTextMsgSet), 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
    begin
      odsTree.DisableControls;
      odsModal.DisableControls;
      if vartostr(tvList.ViewData.Rows[vFocusedRowIndex].Values[tvListId.Index])<>'' then
        try
          pModalityClr(tvList.ViewData.Rows[vFocusedRowIndex].Values[tvListId.Index])
        finally
          odsTree.EnableControls;
          odsModal.EnableControls;
          RefreshQuery(odsTree);
          Application.MessageBox('Выполнено ...' , 'Внимание', MB_ICONWARNING+MB_OK);
        end;
    end;
  end else
  begin
    Application.MessageBox('Список пуст !' , 'Внимание', MB_ICONWARNING+MB_OK);
  end;
end;

procedure TfrmMain.cbUnSetPropertiesChange(Sender: TObject);
begin
  RefreshQuery(odsTree);
end;

procedure TfrmMain.DoShowForm;
var ods : TOracleDataSet;
    Ver : TJclFileVersionInfo;
begin
  pAPPSOTRID := StrToInt(paramstr(1));
  ods := TOracleDataSet.Create(nil);
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FK_SOTRID, '+#13+
                    '        ASU.DO_VRACHFIO(FK_SOTRID) AS SOTRFIO '+#13+
                    '   FROM LOGIN.TAPPSOTR '+#13+
                    '  WHERE FL_DEL <> 1 AND FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pAPPSOTRID);
    ods.Open;
    pSOTRID := ods.FieldByName('FK_SOTRID').AsInteger;
    sSOTRFIO := ods.FieldByName('SOTRFIO').AsString;
    frmMain.Caption := 'Назначения и модальности('+Ver.FileVersion+'). Пользователь: '+sSOTRFIO;
  finally
    Ver.Free;
    ods.Free;
  end;

//  tvAp.StoreToRegistry('\SoftWare\SoftMaster\Xray_param\tvApVrach_' + IntToStr(pSOTRID)+'Default', TRUE, [], 'tvAp');
//  tvAp.RestoreFromRegistry('\SoftWare\SoftMaster\Xray_param\tvApVrach_' + IntToStr(pSOTRID), FALSE, FALSE, [], 'tvAp');
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Вы хотите выйти из приложения ?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
    action := caFree
  else
    action := caNone;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  GetSession(os, 'ASU');
  if odsTree.Active = False then
    odsTree.Active := True;
  if odsModal.Active = False then
    odsModal.Active := True;
end;

procedure TfrmMain.odsTreeApplyRecord(Sender: TOracleDataSet; Action: Char;
  var Applied: Boolean; var NewRowId: string);
var oq : TOracleQuery;
begin
  case Action of
    'U':
       begin
         if tvListModal.Focused then
           begin
             pModalitySet ( tvListModal.DataBinding.Field.Value, odsTree.FieldByName('fk_id').AsInteger );
             RefreshQuery(odsTree);
           end;
       end;
  end;
  Applied := True;
end;

procedure TfrmMain.osAfterLogOn(Sender: TOracleSession);
var Ver: TJclFileVersionInfo;
begin
  Sender.DBMS_Application_Info.Set_Client_Info(ParamStr(1));
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  try
    Sender.DBMS_Application_Info.Set_Module(ExtractFileName(ParamStr(0)) + ' (' + Ver.FileVersion + ')', Self.Name + ' "' + Self.Caption + '"');
  finally
    Ver.Free;
  end;
end;

procedure TfrmMain.teFilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Length(teFilter.Text) > 0 then
    begin
      odsTree.Filter := 'fc_name_up = ''*' + AnsiUpperCase(teFilter.Text) + '*'' ';
      odsTree.Filtered := true;
      aClear.Enabled := True;
    end else
      aClear.Enabled := False;
end;

procedure TfrmMain.tvListMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
//
end;

end.
