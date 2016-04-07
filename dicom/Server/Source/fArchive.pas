unit fArchive;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, cxTextEdit, cxMemo, cxImage,
  cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls, JvExExtCtrls,
  JvExtComponent, JvPanel, cxCheckBox, StdCtrls, cxRadioGroup, cxProgressBar,
  FIBQuery, pFIBQuery, FIBDataSet, pFIBDataSet, pFIBProps, JvJCLUtils, Menus,
  cxLookAndFeelPainters, ActnList, cxButtons, dxSkinscxPCPainter, cxPC,
  JvBaseDlg, JvBrowseFolder, dxSkinOffice2007Green;

type
  TfrmArchive = class(TForm)
    paAdmin: TJvPanel;
    JvPanel1: TJvPanel;
    lbCaption: TcxLabel;
    imMain: TcxImage;
    bOK: TcxButton;
    bCancel: TcxButton;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    aRun: TAction;
    aConfig: TAction;
    aReload: TAction;
    pcMain: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxImage1: TcxImage;
    rbHand: TcxRadioButton;
    cxLabel2: TcxLabel;
    lbHandLocal: TcxLabel;
    cxLabel3: TcxLabel;
    lbHandRemote: TcxLabel;
    lbStatus: TcxLabel;
    lStart: TcxLabel;
    lStartNear: TcxLabel;
    pbProgress: TcxProgressBar;
    lbLast: TcxLabel;
    shHand: TShape;
    shAuto: TShape;
    cxImage2: TcxImage;
    rbAuto: TcxRadioButton;
    cxLabel1: TcxLabel;
    lbAutoLocal: TcxLabel;
    cxLabel4: TcxLabel;
    lbAutoRemote: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    lbParams: TcxLabel;
    lbParamsNear: TcxLabel;
    imVar: TcxImage;
    cxLabel6: TcxLabel;
    lbNow: TcxLabel;
    cxLabel10: TcxLabel;
    bRemoteFolder: TcxButton;
    teNewRemoteDir: TcxTextEdit;
    lbStatus1: TcxLabel;
    cxLabel13: TcxLabel;
    pbProgress1: TcxProgressBar;
    jvRemoteOd: TJvBrowseForFolderDialog;
    lbLast1: TcxLabel;
    lStartPerenos: TcxLabel;
    lb1: TcxLabel;
    im1: TcxImage;
    im2: TcxImage;
    lb2: TcxLabel;
    im3: TcxImage;
    lb3: TcxLabel;
    imok1: TcxImage;
    imok2: TcxImage;
    imok3: TcxImage;
    procedure rbHandClick(Sender: TObject);
    procedure rbAutoClick(Sender: TObject);
    procedure lStartMouseLeave(Sender: TObject);
    procedure lStartMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lStartClick(Sender: TObject);
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure lbParamsMouseLeave(Sender: TObject);
    procedure lbParamsMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lbParamsClick(Sender: TObject);
    procedure aRunExecute(Sender: TObject);
    procedure aConfigExecute(Sender: TObject);
    procedure pcMainChange(Sender: TObject);
    procedure bRemoteFolderClick(Sender: TObject);
    procedure lStartPerenosClick(Sender: TObject);
    procedure lStartPerenosMouseLeave(Sender: TObject);
    procedure lStartPerenosMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    allcount, count, fcount : Integer;
    sFrom, sTo : string;
    procedure CountFiles;
    procedure Perenos;
    { Private declarations }
  public
    procedure DoShowForm;
    { Public declarations }
  end;

var
  frmArchive: TfrmArchive;

implementation

uses fMain, fReloadStorage;

{$R *.dfm}

procedure TfrmArchive.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmArchive.aConfigExecute(Sender: TObject);
begin
  if lbParams.Visible = True then
    lbParamsClick(nil);
end;

procedure TfrmArchive.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmArchive.aRunExecute(Sender: TObject);
begin
  if pcMain.ActivePageIndex = 0 then
    begin
      if lStart.Visible = True then
        lStartClick(nil);
    end;
  if pcMain.ActivePageIndex = 1 then
    begin
      if lStartPerenos.Enabled = True then
        lStartPerenosClick(nil);
    end;
end;

procedure TfrmArchive.bRemoteFolderClick(Sender: TObject);
begin
  if jvRemoteOd.Execute then
    teNewRemoteDir.Text := jvRemoteOd.Directory; 
end;

procedure TfrmArchive.lStartPerenosClick(Sender: TObject);
var qFIB : TpFIBQuery;
    dsFIB1 : TpFIBDataSet;
begin
  if (lbNow.Caption = '') or (lbNow.Caption = '--') then
    begin
      Application.MessageBox('Не указано текущее долговременное хранилище!'+#13#10+
                             'Запуск переноса невозможен!', 'Внимание', MB_OK+MB_ICONWARNING);
      Exit;
    end;
  if (teNewRemoteDir.Text = '') or (teNewRemoteDir.Text = '--') then
    begin
      Application.MessageBox('Не указано новое долговременное хранилище!'+#13#10+
                             'Запуск переноса невозможен!', 'Внимание', MB_OK+MB_ICONWARNING);
      bRemoteFolder.SetFocus;
      Exit;
    end;
  if Application.MessageBox('Процесс переноса всех снимков в новое долговременное хранилище может занять длительное время!'+#13#10+
                            'Остальные функции сервера на время переноса будут недоступны!'+#13#10+
                            'Продолжить?', 'Внимание', MB_YESNO) = IDYES then
    begin
      Screen.Cursor := crSQLWait;
      pcMain.Enabled := False;
      aOk.Enabled := False;
      aCancel.Enabled := False;
      lbLast1.Visible := False;
      lStartPerenos.Enabled := False;
      teNewRemoteDir.Enabled := False;
      bRemoteFolder.Enabled := False;
      lbStatus1.Visible := True;
      pbProgress1.Visible := True;
      pbProgress1.Position := 0;
      qFIB := TpFIBQuery.Create(nil);
      dsFIB1 := TpFIBDataSet.Create(nil);
      try
//-->> 1. Останавливаем сервер
        lb1.Visible := True;
        lb2.Visible := True;
        lb3.Visible := True;
        im1.Visible := True;
        Sleep(2000);
        Application.ProcessMessages;
        if frmMain.DicomServer.IsActive = True then
          begin
            frmMain.DicomServer.Stop;
            if frmMain.DicomServer.IsActive = False then
              begin
                frmMain.DoQueryInsert('Сервер остановлен!',
                                      2,
                                      Now,
                                      DateTimeToStr(Now)+#13+
                                      'Сервер остановлен!'+#13+
                                      'Причина остановки сервера:'+#13+
                                      'Перенос хранилища');
                frmMain.isStarted := 0;
                frmMain.aStart.Enabled := True;
                frmMain.lStart.Caption := 'Запуск';
                frmMain.lStatusServer.Caption := 'остановлен';
                frmMain.Timer1.Enabled := False;
                frmMain.lTimeServer.Caption := '00:00:00';

                frmMain.imGreen.Visible := False;
                frmMain.imRed.Visible := True;
                frmMain.lWarnings.Caption := 'Угроза работы Dicom-сервера';
                frmMain.lWarnings.Style.Font.Color := clRed;
                frmMain.im2_ok.Visible := False;
                frmMain.im2_er.Visible := True;
                frmMain.lWarServer.Caption := 'Сервер не запущен';
                frmMain.lWarServer.Style.Font.Color := clRed;
                frmMain.paWar.FlatBorderColor := clRed;
                frmMain.lStartWar.Visible := True;
              end;
          end;
        im1.Visible := False;
        imok1.Visible := True;
        im2.Visible := True;
//<<--
//-->> 2. Сначала считаем, потом переносим файлы
        if lbNow.Caption[length(lbNow.Caption)]<>'\' then
          sFrom := lbNow.Caption + '\'
        else
          sFrom := lbNow.Caption;
        if teNewRemoteDir.Text[length(teNewRemoteDir.Text)]<>'\' then
          sTo := teNewRemoteDir.Text + '\'
        else
          sTo := teNewRemoteDir.Text;
        count:=0;
        fcount:=0;
        CountFiles;
        pbProgress1.Properties.Max := count;
        allcount := count;
        if lbNow.Caption[length(lbNow.Caption)]<>'\' then
          sFrom := lbNow.Caption + '\'
        else
          sFrom := lbNow.Caption;
        if teNewRemoteDir.Text[length(teNewRemoteDir.Text)]<>'\' then
          sTo := teNewRemoteDir.Text + '\'
        else
          sTo := teNewRemoteDir.Text;
        count:=0;
        fcount:=0;
        Perenos;
        im2.Visible := False;
        imok2.Visible := True;
        Sleep(2000);
        Application.ProcessMessages;
        im3.Visible := True;
//-->> 3. Добавление записи о последнем переносе
        qFIB.Database := frmMain.DB;
        qFIB.Transaction := frmMain.trWrite;
        qFIB.Options := qFIB.Options + [qoAutoCommit];
        dsFIB1.Database := frmMain.DB;
        dsFIB1.Transaction := frmMain.trRead;
        dsFIB1.AutoCommit := True;
        dsFIB1.SQLs.SelectSQL.Text := ' SELECT COUNT(*) AS CNT FROM PARAMS WHERE FC_SECTION = ''ARCHIVE'' AND FC_KEY = ''LASTDATEPERENOS'' ';
        dsFIB1.Open;
        if dsFIB1.FieldByName('CNT').AsInteger = 0 then
          begin
            qFIB.SQL.Text := ' INSERT INTO PARAMS(FC_SECTION, FC_KEY, FC_VALUE) '+
                             ' VALUES(''ARCHIVE'', ''LASTDATEPERENOS'', :PFC_VALUE) ';
            qFIB.ParamByName('PFC_VALUE').AsString := DateTimeToStr(Now);
            if frmMain.trWrite.Active = False then
              frmMain.trWrite.Active := True;
            qFIB.ExecQuery;
            lbLast1.Caption := 'Последний перенос: '+DateTimeToStr(Now);
            lbLast1.Visible := True;
          end else
          begin
            qFIB.SQL.Text := ' UPDATE PARAMS '+
                             '    SET FC_VALUE = :PFC_VALUE '+
                             '  WHERE FC_SECTION = ''ARCHIVE'' '+
                             '    AND FC_KEY = ''LASTDATEPERENOS'' ';
            qFIB.ParamByName('PFC_VALUE').AsString := DateTimeToStr(Now);
            if frmMain.trWrite.Active = False then
              frmMain.trWrite.Active := True;
            qFIB.ExecQuery;
            lbLast1.Caption := 'Последний перенос: '+DateTimeToStr(Now);
            lbLast1.Visible := True;
          end;
        sleep(5000);
        Application.ProcessMessages;
        im3.Visible := False;
        imok3.Visible := True;
      finally
        qFIB.Free;
        pcMain.Enabled := True;
        aOk.Enabled := True;
        aCancel.Enabled := True;
        lbLast1.Visible := True;
        lStartPerenos.Enabled := True;
        teNewRemoteDir.Enabled := True;
        bRemoteFolder.Enabled := True;
        lbStatus1.Visible := False;
        pbProgress1.Visible := False;
        Screen.Cursor := crDefault;
        imok1.Visible := False;
        lb1.Visible := False;
        imok2.Visible := False;
        lb2.Visible := False;
        imok3.Visible := False;
        lb3.Visible := False;
      end;
    end;
end;

procedure TfrmArchive.lStartPerenosMouseLeave(Sender: TObject);
begin
  lStartPerenos.Style.Font.Style := lStartPerenos.Style.Font.Style - [fsUnderline];
end;

procedure TfrmArchive.lStartPerenosMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  lStartPerenos.Style.Font.Style := lStartPerenos.Style.Font.Style + [fsUnderline];
end;

procedure TfrmArchive.pcMainChange(Sender: TObject);
begin
  if pcMain.ActivePageIndex = 0 then
    begin
      imMain.Visible := True;
      imVar.Visible := False;
      lbCaption.Caption := 'Архивирование';
    end;
  if pcMain.ActivePageIndex = 1 then
    begin
      imMain.Visible := False;
      imVar.Visible := True;
      lbCaption.Caption := 'Перенос снимков в новое хранилище';
    end;
end;

procedure TfrmArchive.CountFiles;
var Sr : TSearchRec;
    Err : integer;
    fFile : string;
    mask : shortstring;
    i : Integer;
begin
  mask:='*.*';
  Err:=FindFirst(sFrom + mask,faAnyFile,Sr);
  while (Err = 0) do
    begin
      if Sr.Attr <> faDirectory then
        begin
          fFile:=sFrom + Sr.Name;
          if Sr.Attr<>faDirectory then
            begin
              inc(count);
            end;
        end;
      if (Sr.Attr = faDirectory) and (Sr.Name[1] <> '.') then
        begin
          sFrom:=sFrom + Sr.Name + '\';
          sTo := sTo+sr.Name + '\';
          inc(fcount);
          CountFiles;
          for i:=length(sFrom) - 1 downto 1 do
            if sFrom[i]='\' then break;
          delete(sFrom,i+1,length(sFrom)-i);
        end;
      Err:=FindNext(Sr) ;
    end;
  FindClose(sr);
end;

procedure TfrmArchive.Perenos;
var Sr : TSearchRec;
    Err : integer;
    fFile : string;
    mask : shortstring;
    i : Integer;
begin
  mask:='*.*';
  Err:=FindFirst(sFrom + mask,faAnyFile,Sr);
  while (Err = 0) do
    begin
      if Sr.Attr <> faDirectory then
        begin
          fFile:=sFrom + Sr.Name;
          if Sr.Attr<>faDirectory then
            begin
              inc(count);
              if not DirectoryExists(sTo) then
                ForceDirectories(sTo);
              movefile(PAnsiChar(sFrom+sr.Name), PAnsiChar(sTo+sr.Name));
              pbProgress1.Position := pbProgress1.Position + 1;
              lbStatus1.Caption := 'Перенос файлов-изображений... перенесено '+IntToStr(count)+' из '+IntToStr(allcount);
              Application.ProcessMessages;
            end;
        end;
      if (Sr.Attr = faDirectory) and (Sr.Name[1] <> '.') then
        begin
          sFrom:=sFrom + Sr.Name + '\';
          sTo := sTo+sr.Name + '\';
          inc(fcount);
          Perenos ;
          for i:=length(sFrom) - 1 downto 1 do
            if sFrom[i]='\' then break;
              delete(sFrom,i+1,length(sFrom)-i);
          for i:=length(sTo) - 1 downto 1 do
            if sTo[i]='\' then break;
          delete(sTo,i+1,length(sTo)-i);
        end;
      Err:=FindNext(Sr) ;
   end;
  FindClose(sr);
end;

procedure TfrmArchive.DoShowForm;
var dsFIB : TpFIBDataSet;
begin
  pcMain.ActivePageIndex := 0;
  imVar.Visible := False;
  dsFIB := TpFIBDataSet.Create(nil);
  try
    dsFIB.Database := frmMain.DB;
    dsFIB.Transaction := frmMain.trWrite;
    dsFIB.AutoCommit := True;
// -->> 1. "Поднимаем" тип архивирования (ручной или автоматический)
    dsFIB.SQLs.SelectSQL.Text := ' SELECT FC_VALUE FROM PARAMS WHERE FC_SECTION = ''ARCHIVE'' AND FC_KEY = ''TYPE'' ';
    dsFIB.Open;
    if dsFIB.RecordCountFromSrv > 0 then
      begin
        case StrToInt(dsFIB.FieldByName('FC_VALUE').AsString) of
          1 : rbHand.Checked := True; // ручной тип архивирования
          2 : rbAuto.Checked := True; // автоматический тип архивирования
        end;
      end else
      begin
        rbHand.Checked := True;
      end;
// -->> 2. "Поднимаем" последнюю дату архивирования
    dsFIB.Close;
    dsFIB.SQLs.SelectSQL.Clear;
    dsFIB.SQLs.SelectSQL.Text := ' SELECT FC_VALUE FROM PARAMS WHERE FC_SECTION = ''ARCHIVE'' AND FC_KEY = ''LASTDATE'' ';
    dsFIB.Open;
    lbLast.Caption := 'Последнее архивирование: '+dsFIB.FieldByName('FC_VALUE').AsString;
// -->> 3. "Поднимаем" оперативное хранилище снимков
    dsFIB.Close;
    dsFIB.SQLs.SelectSQL.Clear;
    dsFIB.SQLs.SelectSQL.Text := ' SELECT FC_VALUE FROM PARAMS WHERE FC_SECTION = ''SERVER'' AND FC_KEY = ''STORAGESCP'' ';
    dsFIB.Open;
    lbHandLocal.Caption := dsFIB.FieldByName('FC_VALUE').AsString;
    lbAutoLocal.Caption := dsFIB.FieldByName('FC_VALUE').AsString;
// -->> 4. "Поднимаем" долговременное хранилище снимков
    dsFIB.Close;
    dsFIB.SQLs.SelectSQL.Clear;
    dsFIB.SQLs.SelectSQL.Text := ' SELECT FC_VALUE FROM PARAMS WHERE FC_SECTION = ''SERVER'' AND FC_KEY = ''REMOTESTORAGESCP'' ';
    dsFIB.Open;
    lbHandRemote.Caption := dsFIB.FieldByName('FC_VALUE').AsString;
    lbAutoRemote.Caption := dsFIB.FieldByName('FC_VALUE').AsString;
    lbNow.Caption := dsFIB.FieldByName('FC_VALUE').AsString;
// -->> 5. "Поднимаем" последнюю дату переноса снимков в новое хранилище
    dsFIB.Close;
    dsFIB.SQLs.SelectSQL.Clear;
    dsFIB.SQLs.SelectSQL.Text := ' SELECT FC_VALUE FROM PARAMS WHERE FC_SECTION = ''ARCHIVE'' AND FC_KEY = ''LASTDATEPERENOS'' ';
    dsFIB.Open;
    lbLast1.Caption := 'Последний перенос: '+dsFIB.FieldByName('FC_VALUE').AsString;
//    cxLabel11.Caption := 'Последний перенос: '+dsFIB.FieldByName('FC_VALUE').AsString;
  finally
    dsFIB.Free;
  end;
end;

procedure TfrmArchive.lbParamsClick(Sender: TObject);
begin
  ShowMessage('Эта функция находится в стадии разработки!');
end;

procedure TfrmArchive.lbParamsMouseLeave(Sender: TObject);
begin
  lbParams.Style.Font.Style := lbParams.Style.Font.Style - [fsUnderline];
end;

procedure TfrmArchive.lbParamsMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  lbParams.Style.Font.Style := lbParams.Style.Font.Style + [fsUnderline];
end;

procedure TfrmArchive.lStartClick(Sender: TObject);
var FIBDataSet: TpFIBDataSet;
    FIBDataSetDel : TpFIBDataSet;
    FIBQuery : TpFIBQuery;
    FIBDataSetIns : TpFIBDataSet;
    FIBQueryIns : TpFIBQuery;
    sDirLocal : string;
    sDirRemote : string;
    sDir2 : string;
    sFrom, sTo : string;
    i : Integer;
begin
  if (lbHandLocal.Caption = '--') or (lbHandLocal.Caption = '') then
    begin
      Application.MessageBox('Не указано оперативное хранилище снимков!'+#13#10+
                             'Запуск архивации невозможен!', 'Предупреждение', MB_ICONWARNING+MB_OK);
      Exit;
    end;
  if (lbHandRemote.Caption = '--') or (lbHandRemote.Caption = '') then
    begin
      Application.MessageBox('Не указано долговременное хранилище снимков!'+#13#10+
                             'Запуск архивации невозможен!', 'Предупреждение', MB_ICONWARNING+MB_OK);
      Exit;
    end;
  if frmMain.nDaysArchive = 0 then
    begin
      Application.MessageBox('Не указано количество дней, после которого исследование считается устаревшим!'+#13#10+
                             'Запуск архивации невозможен!', 'Предупреждение', MB_ICONWARNING+MB_OK);
      Exit;
    end;
  Screen.Cursor := crSQLWait;
  aOk.Enabled := False;
  aCancel.Enabled := False;
  lStart.Enabled := False;
  rbAuto.Enabled := False;

  lbLast.Visible := False;
  lbStatus.Visible := True;
  pbProgress.Visible := True;
  pbProgress.Position := 0;
  sDirLocal := lbHandLocal.Caption+'\'; //локальная база изображений
  sDirRemote := lbHandRemote.Caption+'\'; //удаленная база изображений
  FIBDataSet := TpFIBDataSet.Create(nil);
  FIBDataSetDel := TpFIBDataSet.Create(nil);
  FIBQuery := TpFIBQuery.Create(nil);
  FIBDataSetIns := TpFIBDataSet.Create(nil);
  FIBQueryIns := TpFIBQuery.Create(nil);
  i := 0;
  try
// -->> 1. перенос файлов
    FIBDataSet.Database := frmMain.DB;
    FIBDataSet.Transaction := frmMain.trRead;
    FIBDataSet.AutoCommit := True;
    FIBDataSet.SQLs.SelectSQL.Text := ' SELECT CAST(STUDIES.LDATE AS DATE) AS DATEISSL, '+
                                      '        EXTRACT(DAY FROM STUDIES.LDATE) AS DAY_ISSL, '+
                                      '        EXTRACT(MONTH FROM STUDIES.LDATE) AS MONTH_ISSL, '+
                                      '        EXTRACT (YEAR FROM STUDIES.LDATE) AS YEAR_ISSL, '+
                                      '        STUDIES.STUDIES_IMAGE_TYPE, '+
                                      '        STUDIES.STUDYUID, '+
                                      '        SERIES.SERIESUID, '+
                                      '        IMAGES.INSTANCEUID '+
                                      '   FROM STUDIES, SERIES, IMAGES '+
                                      '  WHERE STUDIES.STUDYUID = SERIES.STUDYUID '+
                                      '    AND STUDIES.STUDYUID = IMAGES.STUDYUID '+
                                      '    AND STUDIES.STATUS = 0 '+
                                      '    AND (CURRENT_DATE - CAST(STUDIES.LDATE AS DATE)) >= :PDAYS '+
                                      ' ORDER BY IMAGES.INSTANCEUID ';
    FIBDataSet.ParamByName('PDAYS').AsInteger := frmMain.nDaysArchive;
    FIBDataSet.Open;
    pbProgress.Properties.Max := FIBDataSet.RecordCountFromSrv; 
    lbStatus.Caption := 'Перенос файлов-изображений... перенесено 0 из '+IntToStr(FIBDataSet.RecordCountFromSrv);
    FIBDataSet.First;
    while not FIBDataSet.Eof do
      begin
// файл, который переносим
        sFrom := sDirlocal+FIBDataSet.FieldByName('STUDIES_IMAGE_TYPE').AsString+'\'+
                           FIBDataSet.FieldByName('YEAR_ISSL').AsString+'\'+
                           FIBDataSet.FieldByName('MONTH_ISSL').AsString+'\'+
                           FIBDataSet.FieldByName('DAY_ISSL').AsString+'\'+
                           FIBDataSet.FieldByName('STUDYUID').AsString+'\'+
                           FIBDataSet.FieldByName('SERIESUID').AsString+'\'+
                           FIBDataSet.FieldByName('INSTANCEUID').AsString+'.dcm';
// файл, куда переносим
        sTo := sDirRemote+FIBDataSet.FieldByName('STUDIES_IMAGE_TYPE').AsString+'\'+
                          FIBDataSet.FieldByName('YEAR_ISSL').AsString+'\'+
                          FIBDataSet.FieldByName('MONTH_ISSL').AsString+'\'+
                          FIBDataSet.FieldByName('DAY_ISSL').AsString+'\'+
                          FIBDataSet.FieldByName('STUDYUID').AsString+'\'+
                          FIBDataSet.FieldByName('SERIESUID').AsString+'\'+
                          FIBDataSet.FieldByName('INSTANCEUID').AsString+'.dcm';
// дирректория куда переносим файлы
        sDir2 := sDirRemote+FIBDataSet.FieldByName('STUDIES_IMAGE_TYPE').AsString+'\'+
                            FIBDataSet.FieldByName('YEAR_ISSL').AsString+'\'+
                            FIBDataSet.FieldByName('MONTH_ISSL').AsString+'\'+
                            FIBDataSet.FieldByName('DAY_ISSL').AsString+'\'+
                            FIBDataSet.FieldByName('STUDYUID').AsString+'\'+
                            FIBDataSet.FieldByName('SERIESUID').AsString;
// если дирректории куда переносим не существует, то создаём её
        if not DirectoryExists(sDir2) then
          ForceDirectories(sDir2);
        MoveFile(PAnsiChar(sFrom), PAnsiChar(sTo)); // переносим файл
        pbProgress.Position := pbProgress.Position + 1;
        Application.ProcessMessages;
        i := i + 1;
        lbStatus.Caption := 'Перенос файлов-изображений... перенесено '+IntToStr(i)+' из '+IntToStr(FIBDataSet.RecordCountFromSrv);
        FIBDataSet.Next;
      end;
// -->> 2. удаление дирректорий и отметка о том, что исследования в архиве
    pbProgress.Position := 0;
    Application.ProcessMessages;
    FIBQuery.Database := frmMain.DB;
    FIBQuery.Transaction := frmMain.trWrite;
    FIBQuery.Options := FIBQuery.Options + [qoAutoCommit];
    FIBQuery.SQL.Text := ' UPDATE STUDIES SET STATUS = 1 WHERE STUDYUID = :PSTUDYUID ';
    FIBDataSetDel.Database := frmMain.DB;
    FIBDataSetDel.Transaction := frmMain.trRead;
    FIBDataSetDel.AutoCommit := True;
    FIBDataSetDel.SQLs.SelectSQL.Text := ' SELECT EXTRACT(DAY FROM STUDIES.LDATE) AS DAY_ISSL, '+
                                         '        EXTRACT(MONTH FROM STUDIES.LDATE) AS MONTH_ISSL, '+
                                         '        EXTRACT (YEAR FROM STUDIES.LDATE) AS YEAR_ISSL, '+
                                         '        STUDIES.STUDIES_IMAGE_TYPE, '+
                                         '        STUDYUID '+
                                         '   FROM STUDIES '+
                                         '  WHERE STUDIES.STATUS = 0 '+
                                         '    AND (CURRENT_DATE - CAST(STUDIES.LDATE AS DATE)) >= :PDAYS ';
    FIBDataSetDel.ParamByName('PDAYS').AsInteger := frmMain.nDaysArchive;
    FIBDataSetDel.Open;
    pbProgress.Properties.Max := FIBDataSetDel.RecordCount;
    lbStatus.Caption := 'Удаление старых каталогов и отметка в БД...';
    FIBDataSetDel.First;
    while not FIBDataSetDel.Eof do
      begin
        DeleteDir(sDirlocal+FIBDataSetDel.FieldByName('STUDIES_IMAGE_TYPE').AsString+'\'+
                            FIBDataSetDel.FieldByName('YEAR_ISSL').AsString+'\'+
                            FIBDataSetDel.FieldByName('MONTH_ISSL').AsString+'\'+
                            FIBDataSetDel.FieldByName('DAY_ISSL').AsString+'\'+
                            FIBDataSetDel.FieldByName('STUDYUID').AsString);
        FIBQuery.ParamByName('PSTUDYUID').AsString := FIBDataSetDel.FieldByName('STUDYUID').AsString;
        if frmMain.trWrite.Active = False then
          frmMain.trWrite.Active := True;
        FIBQuery.ExecQuery;
        pbProgress.Position := pbProgress.Position + 1;
        Application.ProcessMessages;
        FIBDataSetDel.Next;
      end;
// -->> 3. добавление записи о последнем архивировании
    FIBQueryIns.Database := frmMain.DB;
    FIBQueryIns.Transaction := frmMain.trWrite;
    FIBQueryIns.Options := FIBQueryIns.Options + [qoAutoCommit];
    FIBDataSetIns.Database := frmMain.DB;
    FIBDataSetIns.Transaction := frmMain.trRead;
    FIBDataSetIns.AutoCommit := True;
    FIBDataSetIns.SQLs.SelectSQL.Text := ' SELECT COUNT(*) AS CNT FROM PARAMS WHERE FC_SECTION = ''ARCHIVE'' AND FC_KEY = ''LASTDATE'' ';
    FIBDataSetIns.Open;
    if FIBDataSetIns.FieldByName('CNT').AsInteger = 0 then
      begin
        FIBQueryIns.SQL.Text := ' INSERT INTO PARAMS(FC_SECTION, FC_KEY, FC_VALUE) '+
                                ' VALUES(''ARCHIVE'', ''LASTDATE'', :PFC_VALUE) ';
        FIBQueryIns.ParamByName('PFC_VALUE').AsString := DateTimeToStr(Now);
        if frmMain.trWrite.Active = False then
          frmMain.trWrite.Active := True;
        FIBQueryIns.ExecQuery;
        lbLast.Caption := 'Последнее архивирование: '+DateTimeToStr(Now);
        lbLast.Visible := True;
      end else
      begin
        FIBQueryIns.SQL.Text := ' UPDATE PARAMS '+
                                '    SET FC_VALUE = :PFC_VALUE '+
                                '  WHERE FC_SECTION = ''ARCHIVE'' '+
                                '    AND FC_KEY = ''LASTDATE'' ';
        FIBQueryIns.ParamByName('PFC_VALUE').AsString := DateTimeToStr(Now);
        if frmMain.trWrite.Active = False then
          frmMain.trWrite.Active := True;
        FIBQueryIns.ExecQuery;
        lbLast.Caption := 'Последнее архивирование: '+DateTimeToStr(Now);
        lbLast.Visible := True;
      end;
  finally
    lbStatus.Visible := False;
    pbProgress.Visible := False;
    FIBDataSet.Free;
    FIBDataSetDel.Free;
    FIBDataSetIns.Free;
    FIBQueryIns.Free;
    FIBQuery.Free;
    aOk.Enabled := True;
    aCancel.Enabled := True;
    lStart.Enabled := True;
    rbAuto.Enabled := True;
    Screen.Cursor := crDefault;
    showmessage('Заархивировано '+IntToStr(i)+' файлов-изображений');
  end;
end;

procedure TfrmArchive.lStartMouseLeave(Sender: TObject);
begin
  lStart.Style.Font.Style := lStart.Style.Font.Style - [fsUnderline];
end;

procedure TfrmArchive.lStartMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  lStart.Style.Font.Style := lStart.Style.Font.Style + [fsUnderline];
end;

procedure TfrmArchive.rbAutoClick(Sender: TObject);
begin
  cxImage1.Visible := False;
  shHand.Visible := False;
  cxImage2.Visible := True;
  shAuto.Visible := True;
  lbParams.Visible := True;
  lbParamsNear.Visible := True;
  lStart.Visible := False;
  lStartNear.Visible := False;
  lbLast.Visible := False;
end;

procedure TfrmArchive.rbHandClick(Sender: TObject);
begin
  cxImage2.Visible := False;
  shAuto.Visible := False;
  cxImage1.Visible := True;
  shHand.Visible := True;
  lStart.Visible := True;
  lStartNear.Visible := True;
  lbParams.Visible := False;
  lbParamsNear.Visible := False;
  lbLast.Visible := True;
end;

end.
