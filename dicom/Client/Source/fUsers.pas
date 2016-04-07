unit fUsers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, dxBar,
  cxClasses, cxStyles, dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, ActnList, ImgList, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery, pFIBProps,
  JvDBUtils, IBServices, IB_Services, uMD5, StrUtils, Menus, cxGridExportLink,
  frxClass, frxDBSet, dxSkinOffice2007Green, dxBarExtItems, cxLabel,
  cxContainer, cxImage, ExtCtrls, JvExExtCtrls, JvExtComponent, JvPanel,
  dxSkinBlack, Medotrade, OracleData, Oracle, MemDS, DBAccess, Uni, DateUtils;

type
  TfrmUsers = class(TForm)
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    BMBar1: TdxBar;
    TVLIST: TcxGridDBTableView;
    cxGrLevel1: TcxGridLevel;
    cxGr: TcxGrid;
    AL: TActionList;
    aAdd: TAction;
    aEdit: TAction;
    aDelete: TAction;
    aRefresh: TAction;
    aPrint: TAction;
    aClose: TAction;
    IL: TImageList;
    dsList: TpFIBDataSet;
    dsSource: TDataSource;
    VFAM: TcxGridDBColumn;
    VIM: TcxGridDBColumn;
    VOTCH: TcxGridDBColumn;
    VDATEROJD: TcxGridDBColumn;
    VADDRESS: TcxGridDBColumn;
    VTEL: TcxGridDBColumn;
    dsListFC_LOGIN: TFIBStringField;
    dsListFC_FAM: TFIBStringField;
    dsListFC_IM: TFIBStringField;
    dsListFC_OTCH: TFIBStringField;
    dsListFD_ROJD: TFIBDateTimeField;
    dsListFC_ADDRESS: TFIBStringField;
    dsListFC_TEL: TFIBStringField;
    dsListFN_ADM: TFIBIntegerField;
    dsListFK_ID: TFIBIntegerField;
    pm: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    sdPopUp: TSaveDialog;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aXLS: TAction;
    N4: TMenuItem;
    Web1: TMenuItem;
    XML1: TMenuItem;
    Excel1: TMenuItem;
    frxRep: TfrxReport;
    frxDB: TfrxDBDataset;
    dsListFIO: TFIBStringField;
    bbAdd: TdxBarLargeButton;
    bbEdit: TdxBarLargeButton;
    bbDel: TdxBarLargeButton;
    bbRef: TdxBarLargeButton;
    bbPrint: TdxBarLargeButton;
    bbClose: TdxBarLargeButton;
    UniList: TUniQuery;
    OraList: TOracleDataSet;
    VLOGIN: TcxGridDBColumn;
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsListAfterOpen(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N3Click(Sender: TObject);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure frxRepGetValue(const VarName: string; var Value: Variant);
    procedure FormCreate(Sender: TObject);
  private
    procedure CheckEnabledButtons;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUsers: TfrmUsers;

implementation
uses fMain, fuserInfo, DB_CMN;
{$R *.dfm}

procedure TfrmUsers.aAddExecute(Sender: TObject); // добавление пользователя
var qFIB, qGrant : TpFIBQuery; qORA : TOracleDataSet; q1 : TOracleQuery;
    ss : TpFIBSecurityService; v_UniQr : TUniQuery;
begin
  Application.CreateForm(TfrmUserInfo, frmUserInfo);
  frmUserInfo.teLogin.Text := '';
  frmUserInfo.teFam.Text := '';
  frmUserInfo.teName.Text := '';
  frmUserInfo.teOtch.Text := '';
  frmUserInfo.teAddress.Text := '';
  frmUserInfo.teTel.Text := '';
  frmUserInfo.deDate.Date := Now;
  //
  frmUserInfo.Login := '';
  frmUserInfo.fk_id := -1;
  frmUserInfo.vRej  := 1;
  //
  try
    frmUserInfo.ShowModal;
    if frmUserInfo.ModalResult = mrOk then
      begin
        if v_isOracle then     // ORACLE
        begin
          with TOracleQuery.Create(nil) do
          try
            Session:=DB_CMN.OraConn;
            SQL.Text := 'create user '+frmUserInfo.teLogin.Text+' identified by '+frmUserInfo.tePass.Text;
            try
              Execute;
            except
              on e: Exception do
                  MessageDlg('Ошибка! '+#13+#10+e.Message, mtError, [mbOK], 0);
            end;
          finally
            Free;
          end;
          // права не связанные с таблицами
          with TOracleQuery.Create(nil) do
          try
            Session:=DB_CMN.OraConn;
            SQL.Text := 'grant select any sequence to '+frmUserInfo.teLogin.Text+' with admin option';
            try Execute; except end;
            SQL.Text := 'grant alter user to '+frmUserInfo.teLogin.Text+' with admin option';
            try Execute; except end;
            SQL.Text := 'grant create user to '+frmUserInfo.teLogin.Text+' with admin option';
            try Execute; except end;
            SQL.Text := 'grant drop user to '+frmUserInfo.teLogin.Text+' with admin option';
            try Execute; except end;
            SQL.Text := 'grant alter session to '+frmUserInfo.teLogin.Text+' with admin option';
            try Execute; except end;
            SQL.Text := 'grant create session to '+frmUserInfo.teLogin.Text+' with admin option';
            try Execute; except end;
            SQL.Text := 'grant restricted session to '+frmUserInfo.teLogin.Text+' with admin option';
            try Execute; except end;
            SQL.Text := 'grant unlimited tablespace to '+frmUserInfo.teLogin.Text+' with admin option';
            try Execute; except end;
          finally
            Free;
          end;
          // права на все таблицы схемы pacs
          q1 := TOracleQuery.Create(nil);
          try
            q1.Session := DB_CMN.OraConn;
            q1.SQL.Text := 'select table_name from dba_tables where owner = :p_owner ';
            q1.DeclareAndSet( 'p_owner', otString, 'PACS' );
            q1.Execute;
            while not q1.Eof do begin
              with TOracleQuery.Create(nil) do
              try
                Session:=DB_CMN.OraConn;
                SQL.Text := 'grant select, insert, update, delete, references, alter, index on pacs.'+
                    q1.FieldAsString('table_name')+' to '+
                    frmUserInfo.teLogin.Text;
                try Execute; except end;
              finally
                Free;
              end;
              q1.Next;
            end;
          finally
            q1.Free; 
          end;
          //
          qORA := TOracleDataSet.Create(nil);
          try
            qORA.Session:=DB_CMN.OraConn;
            qORA.SQL.Add(' INSERT INTO USERS(FC_LOGIN, FC_FAM, FC_IM, FC_OTCH, FD_ROJD, FC_ADDRESS, FC_TEL, FN_ADM, FN_DEL) '+
                         ' VALUES(:FC_LOGIN, :FC_FAM, :FC_IM, :FC_OTCH, :FD_ROJD, :FC_ADDRESS, :FC_TEL, 0, 0) ');
            qORA.DeclareAndSet('FC_FAM',otString,frmUserInfo.teFam.Text);
            qORA.DeclareAndSet('FC_IM',otString,frmUserInfo.teName.Text);
            qORA.DeclareAndSet('FC_OTCH',otString,frmUserInfo.teOtch.Text);
            if Yearof(frmUserInfo.deDate.Date)<=1900 then
              qORA.DeclareAndSet('FD_ROJD',otDate,Now)
            else
              qORA.DeclareAndSet('FD_ROJD',otDate,frmUserInfo.deDate.Date);
            qORA.DeclareAndSet('FC_ADDRESS',otString,frmUserInfo.teAddress.Text);
            qORA.DeclareAndSet('FC_TEL',otString,frmUserInfo.teTel.Text);
            qORA.DeclareAndSet('FC_LOGIN',otString,frmUserInfo.teLogin.Text);
            try
              qORA.ExecSQL;
              qORA.Session.Commit;
            except
              on e: Exception do
                  MessageDlg('Ошибка! '+#13+#10+e.Message, mtError, [mbOK], 0);
            end;
            RefreshQuery(OraList);
          finally
            qORA.Free;
          end;
        end
        else if v_isPostgres then
        begin  // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                with TUniQuery.Create(nil) do
                try
                  Connection:=DB_CMN.PGconn;
                  Transaction:=DB_CMN.MnUniTransaction;
                  SQL.Text := 'CREATE USER '+frmUserInfo.teLogin.Text+' WITH PASSWORD '''+frmUserInfo.tePass.Text+'''';
                  ExecSQL;
                  SQL.Clear;
                  SQL.Text := 'GRANT ALL PRIVILEGES ON SCHEMA '+v_pg_Schema+' to '+frmUserInfo.teLogin.Text;
                  ExecSQL;
                finally
                  Free;
                end;
        //-->> 3 Добавлем пользователя в таблицу USERS с дополнительными параметрами
                v_UniQr := TUniQuery.Create(nil);
                try
                  v_UniQr.Connection:=DB_CMN.PGconn;
                  v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
                  v_UniQr.SQL.Text := ' insert into '+v_pg_Schema+'.users(fc_login, fc_fam, fc_im, fc_otch, fd_rojd, fc_address, fc_tel, fn_adm, fn_del) '+
                               ' values(:fc_login, :fc_fam, :fc_im, :fc_otch, :fd_rojd, :fc_address, :fc_tel, 0, 0) ';
                  v_UniQr.ParamByName('FC_LOGIN').AsString := frmUserInfo.teLogin.Text; // логин
                  v_UniQr.ParamByName('FC_FAM').AsString := frmUserInfo.teFam.Text; // фамилия пользователя
                  v_UniQr.ParamByName('FC_IM').AsString := frmUserInfo.teName.Text; // имя пользователя
                  v_UniQr.ParamByName('FC_OTCH').AsString := frmUserInfo.teOtch.Text; // отчество пользователя
                  if Yearof(frmUserInfo.deDate.Date)<=1900 then
                    v_UniQr.ParamByName('FD_ROJD').AsDate := Now
                  else
                    v_UniQr.ParamByName('FD_ROJD').AsDate := frmUserInfo.deDate.Date; // дата рождения пользователя
                  v_UniQr.ParamByName('FC_ADDRESS').AsString := frmUserInfo.teAddress.Text; // адрес пользователя
                  v_UniQr.ParamByName('FC_TEL').AsString := frmUserInfo.teTel.Text; // телефон
                  try
                    v_UniQr.ExecSQL;
                  except
                    on e: Exception do
                      begin
                        MessageDlg('Ошибка! '+#13+#10+e.Message, mtError, [mbOK], 0);
                      end;
                  end;
                  RefreshQuery(UniList);
                finally
                  v_UniQr.Free;
                end;
        end
        else
        begin
        //-->> 1 С помощью Security Service добавляем пользователя
                ss := TpFIBSecurityService.Create(nil);
                try
                  ss.LoginPrompt := False;
                  ss.Protocol := TCP;
                  ss.ServerName := frmMain.sIP; // устанавливаем IP-адрес к удаленной БД
                  ss.Params.Clear;
                  ss.Params.Add('user_name='+frmMain.sUser);
                  ss.Params.Add('password='+frmMain.sPass);
                  ss.UserName := frmUserInfo.teLogin.Text;
                  ss.Password := LeftStr(uMD5.MD5DigestToStr(MD5String(frmUserInfo.tePass.Text)),20);
                  ss.Active := True;
                  try
                    ss.AddUser; // метод управления пользователями в БД (добавление)
                  except
                    on e: Exception do
                      begin
                        MessageDlg('Ошибка! '+#13+#10+e.Message, mtError, [mbOK], 0);
                        Exit;
                      end;
                  end;
                  ss.Active := False;
                finally
                  ss.Free;
                end;
        //<<-- 1
        //-->> 2 Устанавливаем роль для созданного юзера
                qGrant := TpFIBQuery.Create(nil);
                try
                  qGrant.Database := DB_CMN.DB;
                  qGrant.Transaction := DB_CMN.trWrite;
                  qGrant.Options :=  qGrant.Options + [qoAutoCommit];
                  trWriteStart;
                  qGrant.Close;
                  qGrant.SQL.Clear;
                  qGrant.SQL.Add(' GRANT ROLE_USER TO '+frmUserInfo.teLogin.Text);
                  try
                    qGrant.ExecQuery;
                  except
                    on e: Exception do
                      begin
                        MessageDlg('Ошибка! '+#13+#10+e.Message, mtError, [mbOK], 0);
                        Exit;
                      end;
                  end;
                finally
                  qGrant.Free;
                end;
        //<<-- 2
        //-->> 3 Добавлем пользователя в таблицу USERS с дополнительными параметрами
                qFIB := TpFIBQuery.Create(nil);
                try
                  qFIB.Database := DB_CMN.DB;
                  qFIB.Transaction := DB_CMN.trWrite;
                  qFIB.Options :=  qFIB.Options + [qoAutoCommit];
                  trWriteStart;
                  qFIB.Close;
                  qFIB.SQL.Clear;
                  qFIB.SQL.Add(' INSERT INTO USERS(FC_LOGIN, FC_FAM, FC_IM, FC_OTCH, FD_ROJD, FC_ADDRESS, FC_TEL, FN_ADM, FN_DEL) '+
                               ' VALUES(:FC_LOGIN, :FC_FAM, :FC_IM, :FC_OTCH, :FD_ROJD, :FC_ADDRESS, :FC_TEL, 0, 0) ');
                  qFIB.ParamByName('FC_LOGIN').AsString := frmUserInfo.teLogin.Text; // логин
                  qFIB.ParamByName('FC_FAM').AsString := frmUserInfo.teFam.Text; // фамилия пользователя
                  qFIB.ParamByName('FC_IM').AsString := frmUserInfo.teName.Text; // имя пользователя
                  qFIB.ParamByName('FC_OTCH').AsString := frmUserInfo.teOtch.Text; // отчество пользователя
                  if Yearof(frmUserInfo.deDate.Date)<=1900 then
                    qFIB.ParamByName('FD_ROJD').AsDate := Now
                  else
                    qFIB.ParamByName('FD_ROJD').AsDate := frmUserInfo.deDate.Date; // дата рождения пользователя
                  qFIB.ParamByName('FC_ADDRESS').AsString := frmUserInfo.teAddress.Text; // адрес пользователя
                  qFIB.ParamByName('FC_TEL').AsString := frmUserInfo.teTel.Text; // телефон
                  try
                    qFIB.ExecQuery;
                  except
                    on e: Exception do
                      begin
                        MessageDlg('Ошибка! '+#13+#10+e.Message, mtError, [mbOK], 0);
                      end;
                  end;
                  RefreshQuery(dsList);
                finally
                  qFIB.Free;
                end;
        //<<-- 3
        end;

      end;
  finally
    frmUserInfo.Free;
  end;
end;

procedure TfrmUsers.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmUsers.aDeleteExecute(Sender: TObject);
var qFIB : TpFIBQuery; qORA : TOracleDataSet; v_UniQr : TUniQuery;
      ss : TpFIBSecurityService;
begin
  if Application.MessageBox('Вы действительно хотите удалить пользователя ?',
    'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
    begin
      if v_isOracle then     // ORACLE
      begin
        if OraList.RecordCount>0 then
        begin
          with TOracleQuery.Create(nil) do
          try
            Session:=DB_CMN.OraConn;
            SQL.Text := 'drop user '+OraList.FieldByName('FC_LOGIN').AsString;
            try
              Execute;
            except
              on e: Exception do
                  MessageDlg('Ошибка! '+#13+#10+e.Message, mtError, [mbOK], 0);
            end;
          finally
            Free;
          end;
          qORA := TOracleDataSet.Create(nil);
          try
            qORA.Session:=DB_CMN.OraConn;
            qORA.SQL.Add(' DELETE FROM USERS WHERE FK_ID = :FK_ID ');
            qORA.DeclareAndSet('FK_ID',otInteger, OraList.FieldByName('FK_ID').AsInteger );
            try
              qORA.ExecSQL;
              qORA.Session.Commit;
            except
              on e: Exception do
                begin
                  MessageDlg('Ошибка! '+#13+#10+e.Message, mtError, [mbOK], 0);
                end;
            end;
            RefreshQuery(OraList);
          finally
            qORA.Free;
          end;
        end;
      end else if v_isPostgres then
      begin
        if UniList.RecordCount>0 then
        begin
          with TUniQuery.Create(nil) do
          try
            Connection:=DB_CMN.PGconn;
            Transaction:=DB_CMN.MnUniTransaction;
            SQL.Text := 'REVOKE ALL PRIVILEGES ON SCHEMA '+v_pg_Schema+' from '+UniList.FieldByName('FC_LOGIN').AsString;
            try ExecSQL; except end;
            SQL.Clear;
            SQL.Text := 'DROP USER '+UniList.FieldByName('FC_LOGIN').AsString;
            try ExecSQL; except end;
          finally
            Free;
          end;
        //-->> 3 Добавлем пользователя в таблицу USERS с дополнительными параметрами
          v_UniQr := TUniQuery.Create(nil);
          try
            v_UniQr.Connection:=DB_CMN.PGconn;
            v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
            v_UniQr.SQL.Text := ' DELETE FROM '+v_pg_Schema+'.USERS WHERE FK_ID = :FK_ID ';
            v_UniQr.ParamByName('FK_ID').AsInteger := UniList.FieldByName('FK_ID').AsInteger;
            try
              v_UniQr.ExecSQL;
            except
              on e: Exception do
                begin
                  MessageDlg('Ошибка! '+#13+#10+e.Message, mtError, [mbOK], 0);
                end;
            end;
            RefreshQuery(UniList);
          finally
            v_UniQr.Free;
          end;
        end;
      end else
      begin
        if dsList.RecordCount>0 then
        begin
        //-->> 1. с помощью SecuritySrvice (динамически создается) удаляем юзера БД
              ss := TpFIBSecurityService.Create(nil);
              try
                ss.LoginPrompt := False;
                ss.Protocol := TCP;
                ss.ServerName := frmMain.sIP; // устанавливаем IP-адрес к удаленной БД
                ss.Params.Clear;
                ss.Params.Add('user_name='+frmMain.sUser);
                ss.Params.Add('password='+frmMain.sPass);
                ss.UserName := dsList.FieldByName('FC_LOGIN').AsString;
                ss.Active := True;
                try
                  ss.DeleteUser; // метод управления пользователями в БД (удаление)
                except
                  on e: Exception do
                    begin
                      MessageDlg('Ошибка! '+#13+#10+e.Message, mtError, [mbOK], 0);
                      Exit;
                    end;
                end;
                ss.Active := False;
              finally
                ss.Free;
              end;
        //<<-- 1
        //-->> 2 Удаляем пользователя из таблицы пользователей
              qFIB := TpFIBQuery.Create(nil);
                try
                  qFIB.Database := DB_CMN.DB;
                  qFIB.Transaction := DB_CMN.trWrite;
                  qFIB.Options :=  qFIB.Options + [qoAutoCommit];
                  trWriteStart;
                  qFIB.Close;
                  qFIB.SQL.Clear;
                  qFIB.SQL.Add(' DELETE FROM USERS WHERE FK_ID = :FK_ID ');
                  qFIB.ParamByName('FK_ID').AsInteger := frmUsers.dsList.FieldByName('FK_ID').AsInteger;
                  try
                    qFIB.ExecQuery;
                  except
                    on e: Exception do
                      begin
                        MessageDlg('Ошибка! '+#13+#10+e.Message, mtError, [mbOK], 0);
                      end;
                  end;
                  RefreshQuery(dsList);
                finally
                  qFIB.Free;
                end;
        //<<-- 2
        end;
      end;
    end;
end;

procedure TfrmUsers.aEditExecute(Sender: TObject);
var qFIB : TpFIBQuery; qORA : TOracleDataSet; v_UniQr : TUniQuery;
      ss : TpFIBSecurityService;
      id : Integer;
  procedure stCMN (pcmnDB:TDataSet);
  begin
    frmUserInfo.teLogin.Text := pcmnDB.FieldByName('FC_LOGIN').AsString;
    frmUserInfo.teFam.Text := pcmnDB.FieldByName('FC_FAM').AsString;
    frmUserInfo.teName.Text := pcmnDB.FieldByName('FC_IM').AsString;
    frmUserInfo.teOtch.Text := pcmnDB.FieldByName('FC_OTCH').AsString;
    frmUserInfo.deDate.Date := pcmnDB.FieldByName('FD_ROJD').AsDateTime;
    frmUserInfo.teAddress.Text := pcmnDB.FieldByName('FC_ADDRESS').AsString;
    frmUserInfo.teTel.Text := pcmnDB.FieldByName('FC_TEL').AsString;
    frmUserInfo.teLogin.Enabled := False; // имя уже созданного юзера БД менять нельзя (политика безопасности FireBird)
  end;
begin
  if v_isOracle then     // ORACLE
    id := OraList.FieldByName('FK_ID').AsInteger
  else if v_isPostgres then
    id := UniList.FieldByName('FK_ID').AsInteger
  else
    id := dsList.FieldByName('FK_ID').AsInteger;
  Application.CreateForm(TfrmUserInfo, frmUserInfo);
//-->> 1 из грида берем значения, которые будем изменять и ставим их в эдиты
  if v_isOracle then     // ORACLE
    stCMN (OraList)
  else if v_isPostgres then
    stCMN (UniList)
  else
    stCMN (dsList);
  //
  frmUserInfo.Login := frmUserInfo.teLogin.Text;
  frmUserInfo.fk_id := id;
  frmUserInfo.vRej  := 2;
  //
  frmUserInfo.teLogin.Enabled := False;
  frmUserInfo.teLogin.Properties.ReadOnly := True;
//<<-- 1
  try
    frmUserInfo.ShowModal;
    if frmUserInfo.ModalResult = mrOk then
      begin
        if v_isOracle then     // ORACLE
        begin
          with TOracleQuery.Create(nil) do
          try
            Session:=DB_CMN.OraConn;
            SQL.Text := 'alter user '+frmUserInfo.teLogin.Text+' identified by '''+frmUserInfo.tePass.Text+'''';
//            DeclareAndSet('p_passw',otString,frmMain.sPass);
            try
              Execute;
            except
              on e: Exception do
                  MessageDlg('Ошибка! '+#13+#10+e.Message, mtError, [mbOK], 0);
            end;
          finally
            Free;
          end;
          //
          qORA := TOracleDataSet.Create(nil);
          try
            qORA.Session:=DB_CMN.OraConn;
            qORA.SQL.Add(' UPDATE USERS SET FC_FAM = :FC_FAM, FC_IM = :FC_IM, '+
                         ' FC_OTCH = :FC_OTCH, FD_ROJD = :FD_ROJD, FC_ADDRESS = :FC_ADDRESS, FC_TEL = :FC_TEL, FN_ADM = 0 '+
                         ' WHERE FK_ID = :FK_ID');
            qORA.DeclareAndSet('FC_FAM',otString,frmUserInfo.teFam.Text);
            qORA.DeclareAndSet('FC_IM',otString,frmUserInfo.teName.Text);
            qORA.DeclareAndSet('FC_OTCH',otString,frmUserInfo.teOtch.Text);
            if Yearof(frmUserInfo.deDate.Date)<=1900 then
              qORA.DeclareAndSet('FD_ROJD',otDate,Now)
            else
              qORA.DeclareAndSet('FD_ROJD',otDate,frmUserInfo.deDate.Date);
            qORA.DeclareAndSet('FC_ADDRESS',otString,frmUserInfo.teAddress.Text);
            qORA.DeclareAndSet('FC_TEL',otString,frmUserInfo.teTel.Text);
            qORA.DeclareAndSet('FK_ID',otString,frmUsers.dsList.FieldByName('FK_ID').AsInteger);
            try
              qORA.ExecSQL;
              qORA.Session.Commit;
            except
              on e: Exception do
                  MessageDlg('Ошибка! '+#13+#10+e.Message, mtError, [mbOK], 0);
            end;
            RefreshQuery(OraList);
            OraList.Locate('FK_ID', id, []);
          finally
            qORA.Free;
          end;
        end else if v_isPostgres then begin  // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          with TUniQuery.Create(nil) do
          try
            Connection:=DB_CMN.PGconn;
            Transaction:=DB_CMN.MnUniTransaction;
            SQL.Text := 'alter user '+frmUserInfo.teLogin.Text+' WITH PASSWORD '''+frmUserInfo.tePass.Text+'''';
            try
              Execute;  
            except
              on e: Exception do
                  MessageDlg('Ошибка! '+#13+#10+e.Message, mtError, [mbOK], 0);
            end;
          finally
            Free;
          end; 
          //  
          v_UniQr := TUniQuery.Create(nil);
          try
            v_UniQr.Connection:=DB_CMN.PGconn;
            v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
            v_UniQr.SQL.Text := ' update '+v_pg_Schema+'.users set fc_fam = :fc_fam, fc_im = :fc_im, '+
                         ' fc_otch = :fc_otch, fd_rojd = :fd_rojd, fc_address = :fc_address, fc_tel = :fc_tel, fn_adm = 0 '+
                         ' where fk_id = :fk_id' ;
            v_UniQr.ParamByName('FC_FAM').AsString := frmUserInfo.teFam.Text;
            v_UniQr.ParamByName('FC_IM').AsString := frmUserInfo.teName.Text;
            v_UniQr.ParamByName('FC_OTCH').AsString := frmUserInfo.teOtch.Text;
            if Yearof(frmUserInfo.deDate.Date)<=1900 then
              v_UniQr.ParamByName('FD_ROJD').AsDate := Now
            else
              v_UniQr.ParamByName('FD_ROJD').AsDate := frmUserInfo.deDate.Date;
            v_UniQr.ParamByName('FC_ADDRESS').AsString := frmUserInfo.teAddress.Text;
            v_UniQr.ParamByName('FC_TEL').AsString := frmUserInfo.teTel.Text;;
            v_UniQr.ParamByName('FK_ID').AsInteger := frmUsers.dsList.FieldByName('FK_ID').AsInteger;
            try
              v_UniQr.ExecSQL;
            except
              on e: Exception do
                begin
                  MessageDlg('Ошибка! '+#13+#10+e.Message, mtError, [mbOK], 0);
                end;
            end;
            RefreshQuery(UniList);
          finally
            v_UniQr.Free;
          end;
        end else begin
//-->> 2 С помощью Security Service изменяем пользователя
          ss := TpFIBSecurityService.Create(nil);
          try
            ss.LoginPrompt := False;
            ss.Protocol := TCP;
            ss.ServerName := frmMain.sIP; // устанавливаем IP-адрес к удаленной БД
            ss.Params.Clear;
            ss.Params.Add('user_name='+frmMain.sUser);
            ss.Params.Add('password='+frmMain.sPass);
            ss.UserName := frmUserInfo.teLogin.Text;
            ss.Password := LeftStr(uMD5.MD5DigestToStr(MD5String(frmUserInfo.tePass.Text)),20);
            ss.Active := True;
            try
              ss.ModifyUser;
            except
              on e: Exception do
                begin
                  MessageDlg('Ошибка! '+#13+#10+e.Message, mtError, [mbOK], 0);
                  Exit;
                end;
            end;
            ss.Active := False;
          finally
            ss.Free;
          end;
//<<-- 2
//-->> 3 Изменяем дополнительные параметры пользователя в таблице USERS
          qFIB := TpFIBQuery.Create(nil);
          try
            qFIB.Database := DB_CMN.DB;
            qFIB.Transaction := DB_CMN.trWrite;
            qFIB.Options :=  qFIB.Options + [qoAutoCommit];
            trWriteStart;
            qFIB.Close;
            qFIB.SQL.Clear;
            qFIB.SQL.Add(' UPDATE USERS SET FC_FAM = :FC_FAM, FC_IM = :FC_IM, '+
                         ' FC_OTCH = :FC_OTCH, FD_ROJD = :FD_ROJD, FC_ADDRESS = :FC_ADDRESS, FC_TEL = :FC_TEL, FN_ADM = 0 '+
                         ' WHERE FK_ID = :FK_ID');
            qFIB.ParamByName('FC_FAM').AsString := frmUserInfo.teFam.Text;
            qFIB.ParamByName('FC_IM').AsString := frmUserInfo.teName.Text;
            qFIB.ParamByName('FC_OTCH').AsString := frmUserInfo.teOtch.Text;
            if Yearof(frmUserInfo.deDate.Date)<=1900 then
              qFIB.ParamByName('FD_ROJD').AsDate := Now
            else
              qFIB.ParamByName('FD_ROJD').AsDate := frmUserInfo.deDate.Date;
            qFIB.ParamByName('FC_ADDRESS').AsString := frmUserInfo.teAddress.Text;
            qFIB.ParamByName('FC_TEL').AsString := frmUserInfo.teTel.Text;;
            qFIB.ParamByName('FK_ID').AsInteger := frmUsers.dsList.FieldByName('FK_ID').AsInteger;
            try
              qFIB.ExecQuery;
            except
              on e: Exception do
                begin
                  MessageDlg('Ошибка! '+#13+#10+e.Message, mtError, [mbOK], 0);
                end;
            end;
            RefreshQuery(dsList);
            dsList.Locate('FK_ID', id, []);
          finally
            qFIB.Free;
          end;
//<<-- 3
        end;
      end;
  finally
    frmUserInfo.Free;
  end;
end;

procedure TfrmUsers.aPrintExecute(Sender: TObject);
begin
  frxRep.ShowReport;
end;

procedure TfrmUsers.aRefreshExecute(Sender: TObject);
begin
  if v_isOracle then     // ORACLE
  begin
    RefreshQuery(OraList);
  end else if v_isPostgres then
  begin
    RefreshQuery(UniList);
  end else
  begin
    RefreshQuery(dsList);
  end;
end;

procedure TfrmUsers.aTextExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    if TVList.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmUsers.aWebExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    if TVList.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmUsers.aXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TVList.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmUsers.aXMLExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    if TVList.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmUsers.CheckEnabledButtons;
  procedure cmnDS (pDS:TDataSet);
  begin
    aPrint.Enabled := pDS.RecordCount <> 0;
    aDelete.Enabled := pDS.RecordCount <> 0;
    aEdit.Enabled := pDS.RecordCount <> 0;
  end;
begin
  if v_isOracle then     // ORACLE
  begin
    cmnDS(OraList);
  end else if v_isPostgres then
  begin
    cmnDS(UniList);
  end else
  begin
    cmnDS(dsList);
  end;
end;

procedure TfrmUsers.dsListAfterOpen(DataSet: TDataSet);
begin
  CheckEnabledButtons;
end;

procedure TfrmUsers.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  TVList.StoreToRegistry('\SoftWare\SoftMaster\DicomClient\'+frmMain.sUser+'\TVListUsers', TRUE, [], 'TVListUsers');
  if v_isOracle then     // ORACLE
  begin
    OraList.Close;
  end else if v_isPostgres then
  begin
    UniList.Close;
  end else
  begin
    dsList.Close;
  end;
end;

procedure TfrmUsers.FormCreate(Sender: TObject);
begin
  if v_isOracle then     // ORACLE
  begin
    OraList.Session := DB_CMN.OraConn;
    dsSource.DataSet := OraList;
    frxDB.DataSet := OraList;
    OraList.SQL.Clear;
    OraList.SQL.Text := 'SELECT t.*, FC_FAM||'' ''||FC_IM||'' ''||FC_OTCH AS FIO FROM pacs.USERS t order by FC_FAM';
    if not OraList.Active then OraList.Open;
  end else if v_isPostgres then
  begin
    dsSource.DataSet := UniList;
    frxDB.DataSet := UniList;
    UniList.Connection:=DB_CMN.PGconn;
    UniList.Transaction:=DB_CMN.MnUniTransaction;
    UniList.SQL.Clear;
    UniList.SQL.Text  := 'SELECT t.*, fc_fam||'' ''||fc_im||'' ''||fc_otch AS FIO FROM '+v_pg_Schema+'.users t order by fc_fam';
    if not UniList.Active then UniList.Open;
  end else
  begin
    dsList.Database := DB_CMN.DB;
    dsList.Transaction := DB_CMN.trRead;
    dsSource.DataSet := dsList;
    frxDB.DataSet := dsList;
    dsList.SQLs.SelectSQL.Text := 'SELECT t.*, FC_FAM||'' ''||FC_IM||'' ''||FC_OTCH AS FIO FROM USERS t order by FC_FAM';
    if not dsList.Active then dsList.Open;
  end;
end;

procedure TfrmUsers.FormShow(Sender: TObject);
begin
  CheckEnabledButtons;
  TVList.StoreToRegistry('\SoftWare\SoftMaster\DicomClient\'+frmMain.sUser+'\TVListUsersDefault', TRUE, [], 'TVListUsers');
  TVList.RestoreFromRegistry('\SoftWare\SoftMaster\DicomClient\'+frmMain.sUser+'\TVListUsers', FALSE, FALSE, [], 'TVListUsers');
end;

procedure TfrmUsers.frxRepGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'DATESYS' then Value := Now;

end;

procedure TfrmUsers.N3Click(Sender: TObject);
begin
  TVList.RestoreFromRegistry('\SoftWare\SoftMaster\DicomClient\'+frmMain.sUser+'\TVListUsersDefault', FALSE, FALSE, [], 'TVListUsers');
end;

end.
