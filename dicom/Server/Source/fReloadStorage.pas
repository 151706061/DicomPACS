unit fReloadStorage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, Menus, cxLookAndFeelPainters,
  StdCtrls, cxButtons, cxProgressBar, cxRadioGroup, cxImage, cxControls,
  cxContainer, cxEdit, cxLabel, ExtCtrls, JvExExtCtrls, JvExtComponent, JvPanel,
  cxGroupBox, cxTextEdit, ActnList, JvBaseDlg, JvBrowseFolder, FIBDataSet, pFIBDataSet,
  FIBQuery, pFIBQuery, JvJCLUtils, pFIBProps;

type
  TfrmReloadStorage = class(TForm)
    paAdmin: TJvPanel;
    JvPanel1: TJvPanel;
    cxLabel3: TcxLabel;
    cxImage2: TcxImage;
    bCancel: TcxButton;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    lbNow: TcxLabel;
    cxLabel2: TcxLabel;
    lStart: TcxLabel;
    lStartNear: TcxLabel;
    lbStatus: TcxLabel;
    lbLast: TcxLabel;
    pbProgress: TcxProgressBar;
    teNewRemoteDir: TcxTextEdit;
    bRemoteFolder: TcxButton;
    al: TActionList;
    aClose: TAction;
    aRun: TAction;
    jvRemoteOd: TJvBrowseForFolderDialog;
    procedure aCloseExecute(Sender: TObject);
    procedure lStartMouseLeave(Sender: TObject);
    procedure lStartMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure aRunExecute(Sender: TObject);
    procedure lStartClick(Sender: TObject);
    procedure bRemoteFolderClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReloadStorage: TfrmReloadStorage;

implementation

uses fMain;

{$R *.dfm}

procedure TfrmReloadStorage.aCloseExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmReloadStorage.aRunExecute(Sender: TObject);
begin
//
end;

procedure TfrmReloadStorage.bRemoteFolderClick(Sender: TObject);
begin
  if jvRemoteOd.Execute then
    teNewRemoteDir.Text := jvRemoteOd.Directory;  
end;

procedure TfrmReloadStorage.lStartClick(Sender: TObject);
var sDirNow, sDirNew, sDir2 : string;
    sFrom, sTo : string;
    dsFIB, dsFIB1 : TpFIBDataSet;
    qFIB : TpFIBQuery;
    i : Integer; 
begin
  if (lbNow.Caption = '') or (lbNow.Caption = '--') then
    begin
      Application.MessageBox('�� ������� ������� �������������� ���������!'+#13#10+
                             '������ �������� ����������!', '��������', MB_OK+MB_ICONWARNING);
      Exit;
    end;
  if (teNewRemoteDir.Text = '') or (teNewRemoteDir.Text = '--') then
    begin
      Application.MessageBox('�� ������� ����� �������������� ���������!'+#13#10+
                             '������ �������� ����������!', '��������', MB_OK+MB_ICONWARNING);
      bRemoteFolder.SetFocus;
      Exit;
    end;
  if Application.MessageBox('������� �������� ���� ������� � ����� �������������� ��������� ����� ������ ���������� �����!'+#13#10+
                            '��������� ������� ������� �� ����� �������� ����� ����������!'+#13#10+
                            '����������?', '��������', MB_YESNO) = IDYES then
    begin
      Screen.Cursor := crSQLWait;
      aClose.Enabled := False;
      lbLast.Visible := False;
      lStart.Enabled := False;
      teNewRemoteDir.Enabled := False;
      bRemoteFolder.Enabled := False;
      lbStatus.Visible := True;
      pbProgress.Visible := True;
      pbProgress.Position := 0;
      sDirNow := lbNow.Caption + '\';
      sDirNew := teNewRemoteDir.Text + '\';
      dsFIB := TpFIBDataSet.Create(nil);
      dsFIB1 := TpFIBDataSet.Create(nil);
      qFIB := TpFIBQuery.Create(nil);
      try
//-->> 1. ������� ������
        dsFIB.Database := frmMain.DB;
        dsFIB.Transaction := frmMain.trRead;
        dsFIB.AutoCommit := True;
        dsFIB.SQLs.SelectSQL.Text := ' SELECT CAST(STUDIES.LDATE AS DATE) AS DATEISSL, '+
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
                                     '    AND STUDIES.STATUS = 1 ';
                                  //   '    AND (CURRENT_DATE - CAST(STUDIES.LDATE AS DATE)) >= :PDAYS '+
                                  //   ' ORDER BY IMAGES.INSTANCEUID ';
//        dsFIB.ParamByName('PDAYS').AsInteger := frmMain.nDaysArchive;
        dsFIB.Open;
        pbProgress.Properties.Max := dsFIB.RecordCountFromSrv;
        lbStatus.Caption := '������� ������-�����������... ���������� 0 �� '+IntToStr(dsFIB.RecordCountFromSrv);
        dsFIB.First;
        i := 0;
        while not dsFIB.Eof do
          begin
// ����, ������� ���������
            sFrom := sDirNow+dsFIB.FieldByName('STUDIES_IMAGE_TYPE').AsString+'\'+
                     dsFIB.FieldByName('YEAR_ISSL').AsString+'\'+
                     dsFIB.FieldByName('MONTH_ISSL').AsString+'\'+
                     dsFIB.FieldByName('DAY_ISSL').AsString+'\'+
                     dsFIB.FieldByName('STUDYUID').AsString+'\'+
                     dsFIB.FieldByName('SERIESUID').AsString+'\'+
                     dsFIB.FieldByName('INSTANCEUID').AsString+'.dcm';
// ����, ���� ���������
            sTo := sDirNew+dsFIB.FieldByName('STUDIES_IMAGE_TYPE').AsString+'\'+
                   dsFIB.FieldByName('YEAR_ISSL').AsString+'\'+
                   dsFIB.FieldByName('MONTH_ISSL').AsString+'\'+
                   dsFIB.FieldByName('DAY_ISSL').AsString+'\'+
                   dsFIB.FieldByName('STUDYUID').AsString+'\'+
                   dsFIB.FieldByName('SERIESUID').AsString+'\'+
                   dsFIB.FieldByName('INSTANCEUID').AsString+'.dcm';
// ����������� ���� ��������� �����
            sDir2 := sDirNew+dsFIB.FieldByName('STUDIES_IMAGE_TYPE').AsString+'\'+
                     dsFIB.FieldByName('YEAR_ISSL').AsString+'\'+
                     dsFIB.FieldByName('MONTH_ISSL').AsString+'\'+
                     dsFIB.FieldByName('DAY_ISSL').AsString+'\'+
                     dsFIB.FieldByName('STUDYUID').AsString+'\'+
                     dsFIB.FieldByName('SERIESUID').AsString;
// ���� ����������� ���� ��������� �� ����������, �� ������ �
            if not DirectoryExists(sDir2) then
              ForceDirectories(sDir2);
            MoveFile(PAnsiChar(sFrom), PAnsiChar(sTo)); // ��������� ����
            pbProgress.Position := pbProgress.Position + 1;
            Application.ProcessMessages;
            i := i + 1;
            lbStatus.Caption := '������� ������-�����������... ���������� '+IntToStr(i)+' �� '+IntToStr(dsFIB.RecordCountFromSrv);
            dsFIB.Next;
          end;
//-->> 2. �������� �����������
        pbProgress.Position := 0;
        Application.ProcessMessages;
        dsFIB.Close;
        dsFIB.Open;
        pbProgress.Properties.Max := dsFIB.RecordCount;
        lbStatus.Caption := '�������� ������ ���������...';
        dsFIB.First;
        while not dsFIB.Eof do
          begin
            DeleteDir(sDirNow+dsFIB.FieldByName('STUDIES_IMAGE_TYPE').AsString+'\'+
                      dsFIB.FieldByName('YEAR_ISSL').AsString+'\'+
                      dsFIB.FieldByName('MONTH_ISSL').AsString+'\'+
                      dsFIB.FieldByName('DAY_ISSL').AsString+'\'+
                      dsFIB.FieldByName('STUDYUID').AsString);
            pbProgress.Position := pbProgress.Position + 1;
            Application.ProcessMessages;
            dsFIB.Next;
          end;
//-->> 3. ���������� ������ � ��������� ��������
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
            lbLast.Caption := '��������� �������: '+DateTimeToStr(Now);
            lbLast.Visible := True;
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
            lbLast.Caption := '��������� �������: '+DateTimeToStr(Now);
            lbLast.Visible := True;
          end;
      finally
        dsFIB.Free;
        dsFIB1.Free;
        qFIB.Free;
        aClose.Enabled := True;
        lbLast.Visible := True;
        lStart.Enabled := True;
        teNewRemoteDir.Enabled := True;
        bRemoteFolder.Enabled := True;
        lbStatus.Visible := False;
        pbProgress.Visible := False;
        Screen.Cursor := crDefault;
      end;
    end;
end;

procedure TfrmReloadStorage.lStartMouseLeave(Sender: TObject);
begin
  lStart.Style.Font.Style := lStart.Style.Font.Style - [fsUnderline];
end;

procedure TfrmReloadStorage.lStartMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  lStart.Style.Font.Style := lStart.Style.Font.Style + [fsUnderline];
end;

end.
