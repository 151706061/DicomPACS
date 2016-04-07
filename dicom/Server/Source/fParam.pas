unit fParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxSkinsCore, dxSkinsDefaultPainters, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxLabel, Menus, cxLookAndFeelPainters,
  StdCtrls, cxButtons, ActnList, JvBaseDlg, JvBrowseFolder, cxMaskEdit,
  cxSpinEdit, ComCtrls, dxSkinscxPCPainter, cxImage, JvExExtCtrls,
  JvExtComponent, JvPanel, cxPC, cxTreeView, cxGroupBox, cxCheckBox, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxSkinsdxBarPainter, dxBar,
  ImgList, FIBDataSet, pFIBDataSet, JvDBUtils, FIBQuery, pFIBQuery, pFIBProps, cxGridExportLink,
  frxClass, frxDBSet, dxSkinOffice2007Green, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue;

type
  TfrmParam = class(TForm)
    al: TActionList;
    aSave: TAction;
    aCancel: TAction;
    jvod: TJvBrowseForFolderDialog;
    jvRemoteOd: TJvBrowseForFolderDialog;
    Panel1: TPanel;
    pcParam: TcxPageControl;
    cxTabSheet2: TcxTabSheet;
    JvPanel2: TJvPanel;
    cxImage2: TcxImage;
    cxLabel10: TcxLabel;
    cxLabel1: TcxLabel;
    cxPort: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxTitle: TcxTextEdit;
    cxDir: TcxTextEdit;
    bFolder: TcxButton;
    teRemoteDir: TcxTextEdit;
    bRemoteFolder: TcxButton;
    cxLabel5: TcxLabel;
    seDaysArchive: TcxSpinEdit;
    cxLabel6: TcxLabel;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    odPathBD: TOpenDialog;
    tvTree: TcxTreeView;
    cxTabSheet1: TcxTabSheet;
    JvPanel1: TJvPanel;
    cxImage1: TcxImage;
    cxLabel7: TcxLabel;
    cbDevices: TcxCheckBox;
    BM: TdxBarManager;
    BMBar1: TdxBar;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    aAddDevice: TAction;
    aEditDevice: TAction;
    aDelDevice: TAction;
    aRefreshDevices: TAction;
    aPrintDevices: TAction;
    IL: TImageList;
    dxBarDockControl1: TdxBarDockControl;
    cxGr: TcxGrid;
    TVDEVICES: TcxGridDBTableView;
    VDEVICES_TITLE: TcxGridDBColumn;
    VDEVICES_IP: TcxGridDBColumn;
    VDEVICES_PORT: TcxGridDBColumn;
    cxGrLevel1: TcxGridLevel;
    sDevices: TDataSource;
    dsDevices: TpFIBDataSet;
    dsDevicesFK_ID: TFIBIntegerField;
    dsDevicesFC_IP: TFIBStringField;
    dsDevicesFN_PORT: TFIBIntegerField;
    dsDevicesFC_TITLE: TFIBStringField;
    pmDevice: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aXLS: TAction;
    sdPopUp: TSaveDialog;
    N4: TMenuItem;
    Web1: TMenuItem;
    XML1: TMenuItem;
    Excel1: TMenuItem;
    frxDevices: TfrxReport;
    frxDBDevices: TfrxDBDataset;
    Panel2: TPanel;
    bSave: TcxButton;
    bClose: TcxButton;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure bFolderClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxPortPropertiesChange(Sender: TObject);
    procedure cxTitlePropertiesChange(Sender: TObject);
    procedure cxDirPropertiesChange(Sender: TObject);
    procedure teRemoteDirPropertiesChange(Sender: TObject);
    procedure bRemoteFolderClick(Sender: TObject);
    procedure seDaysArchivePropertiesEditValueChanged(Sender: TObject);
    procedure tvTreeChange(Sender: TObject; Node: TTreeNode);
    procedure cbDevicesPropertiesChange(Sender: TObject);
    procedure cbDevicesPropertiesEditValueChanged(Sender: TObject);
    procedure aAddDeviceExecute(Sender: TObject);
    procedure aEditDeviceExecute(Sender: TObject);
    procedure aDelDeviceExecute(Sender: TObject);
    procedure aRefreshDevicesExecute(Sender: TObject);
    procedure aPrintDevicesExecute(Sender: TObject);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N3Click(Sender: TObject);
    procedure frxDevicesGetValue(const VarName: string; var Value: Variant);
  private
    { Private declarations }
  public
    procedure CheckEnabledButtons;
    { Public declarations }
  end;

var
  frmParam: TfrmParam;

implementation

uses fMain, fAddEditDevice;

{$R *.dfm}

procedure TfrmParam.aAddDeviceExecute(Sender: TObject);
var qFIB : TpFIBQuery;
begin
  if pcParam.ActivePageIndex = 1 then
    begin
      Application.CreateForm(TfrmAddEditDevice, frmAddEditDevice);
      try
        frmAddEditDevice.Caption := 'Добавить терминал';
        frmAddEditDevice.aAdd.Visible := True;
        frmAddEditDevice.mePort.Text := '104';
        frmAddEditDevice.ShowModal;
        if frmAddEditDevice.ModalResult = mrOk then
          begin
            qFIB := TpFIBQuery.Create(nil);
            try
              qFIB.Database := frmMain.DB;
              if frmMain.trWrite.Active = False then
                frmMain.trWrite.Active := True;
              qFIB.Transaction := frmMain.trWrite;
              qFIB.Options := qFIB.Options + [qoAutoCommit];
              qFIB.SQL.Text := ' INSERT INTO DEVICES(FC_TITLE, FC_IP, FN_PORT) '+
                               ' VALUES(:PFC_TITLE, :PFC_IP, :PFN_PORT) ';
              qFIB.ParamByName('PFC_TITLE').AsString := frmAddEditDevice.teTitle.Text;
              qFIB.ParamByName('PFC_IP').AsString := frmAddEditDevice.teIP.Text;
              qFIB.ParamByName('PFN_PORT').AsInteger := frmAddEditDevice.mePort.EditValue;
              qFIB.ExecQuery;
              RefreshQuery(dsDevices);
              CheckEnabledButtons;
            finally
              qFIB.Free;
            end;
          end;
      finally
        frmAddEditDevice.Free;
      end;
    end;
end;

procedure TfrmParam.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmParam.aDelDeviceExecute(Sender: TObject);
var qFIB : TpFIBQuery;
begin
  if pcParam.ActivePageIndex = 1 then
    begin
      if Application.MessageBox('Вы действительно хотите удалить выбранный терминал?', 'Вопрос', MB_YESNO+MB_ICONQUESTION) = mrYes then
        begin
          qFIB := TpFIBQuery.Create(nil);
          try
            qFIB.Database := frmMain.DB;
            if frmMain.trWrite.Active = False then
              frmMain.trWrite.Active := True;
            qFIB.Transaction := frmMain.trWrite;
            qFIB.Options := qFIB.Options + [qoAutoCommit];
            qFIB.SQL.Text := ' DELETE FROM DEVICES WHERE FK_ID = :PFK_ID ';
            qFIB.ParamByName('PFK_ID').AsInteger := dsDevices.FieldByName('FK_ID').AsInteger;
            qFIB.ExecQuery;
            RefreshQuery(dsDevices);
            CheckEnabledButtons;
          finally
            qFIB.Free;
          end;
        end;
    end;
end;

procedure TfrmParam.aEditDeviceExecute(Sender: TObject);
var qFIB : TpFIBQuery;
    id : Integer;
begin
  if pcParam.ActivePageIndex = 1 then
    begin
      Application.CreateForm(TfrmAddEditDevice, frmAddEditDevice);
      try
        frmAddEditDevice.Caption := 'Изменить терминал';
        frmAddEditDevice.teTitle.Text := dsDevices.FieldByName('FC_TITLE').AsString;
        frmAddEditDevice.teIP.Text := dsDevices.FieldByName('FC_IP').AsString;
        frmAddEditDevice.mePort.EditValue := dsDevices.FieldByName('FN_PORT').AsInteger;
        frmAddEditDevice.aAdd.Visible := False;
        frmAddEditDevice.ShowModal;
        if frmAddEditDevice.ModalResult = mrOk then
          begin
            qFIB := TpFIBQuery.Create(nil);
            try
              qFIB.Database := frmMain.DB;
              if frmMain.trWrite.Active = False then
                frmMain.trWrite.Active := True;
              qFIB.Transaction := frmMain.trWrite;
              qFIB.Options := qFIB.Options + [qoAutoCommit];
              qFIB.SQL.Text := ' UPDATE DEVICES '+
                               '    SET FC_TITLE = :PFC_TITLE, '+
                               '        FC_IP = :PFC_IP, '+
                               '        FN_PORT = :PFN_PORT '+
                               '  WHERE FK_ID = :PFK_ID ';
              qFIB.ParamByName('PFC_TITLE').AsString := frmAddEditDevice.teTitle.Text;
              qFIB.ParamByName('PFC_IP').AsString := frmAddEditDevice.teIP.Text;
              qFIB.ParamByName('PFN_PORT').AsInteger := frmAddEditDevice.mePort.EditValue;
              qFIB.ParamByName('PFK_ID').AsInteger := dsDevices.FieldByName('FK_ID').AsInteger;
              qFIB.ExecQuery;
              id := dsDevices.FieldByName('FK_ID').AsInteger;
              RefreshQuery(dsDevices);
              dsDevices.Locate('FK_ID', id, []);
              CheckEnabledButtons;
            finally
              qFIB.Free;
            end;
          end;
      finally
        frmAddEditDevice.Free;
      end;
    end;
end;

procedure TfrmParam.aPrintDevicesExecute(Sender: TObject);
begin
  if pcParam.ActivePageIndex = 1 then
    begin
      frxDevices.ShowReport;
    end;
end;

procedure TfrmParam.aRefreshDevicesExecute(Sender: TObject);
begin
  if pcParam.ActivePageIndex = 1 then
    begin
      RefreshQuery(dsDevices);
      CheckEnabledButtons;
    end;
end;

procedure TfrmParam.aSaveExecute(Sender: TObject);
begin
  if DirectoryExists(Trim(cxDir.Text)) = False then
    begin
      Application.MessageBox('Внимание!'+#13+'Такой дирректории для оперативного хранилища данных не существует! Создайте её или укажите другой путь!', 'Внимание!', MB_ICONWARNING + MB_OK);
      cxDir.SetFocus;
      Exit;
    end;
  ModalResult := mrOk;
end;

procedure TfrmParam.aTextExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    if TVDEVICES.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmParam.aWebExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    if TVDEVICES.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmParam.aXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TVDEVICES.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmParam.aXMLExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    if TVDEVICES.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmParam.bFolderClick(Sender: TObject);
begin
  if jvod.Execute then
    cxDir.Text := jvod.Directory;
end;

procedure TfrmParam.bRemoteFolderClick(Sender: TObject);
begin
  if jvRemoteOd.Execute then
    teRemoteDir.Text := jvRemoteOd.Directory;
end;

procedure TfrmParam.cbDevicesPropertiesChange(Sender: TObject);
begin
  aSave.Enabled := True;
end;

procedure TfrmParam.cbDevicesPropertiesEditValueChanged(Sender: TObject);
begin
  if cbDevices.EditValue = 0 then
    begin
      dsDevices.Active := False;
      cxGr.Enabled := False;
      aAddDevice.Enabled := False;
      aEditDevice.Enabled := False;
      aDelDevice.Enabled := False;
      aRefreshDevices.Enabled := False;
      aPrintDevices.Enabled := False;
    end;
  if cbDevices.EditValue = 1 then
    begin
      dsDevices.Active := True;
      cxGr.Enabled := True;
      aAddDevice.Enabled := True;
      aEditDevice.Enabled := True;
      aDelDevice.Enabled := True;
      aRefreshDevices.Enabled := True;
      aPrintDevices.Enabled := True;
      CheckEnabledButtons;
    end;
end;

procedure TfrmParam.CheckEnabledButtons;
begin
  aEditDevice.Enabled := dsDevices.RecordCountFromSrv <> 0;
  aDelDevice.Enabled := dsDevices.RecordCountFromSrv <> 0;
  aPrintDevices.Enabled := dsDevices.RecordCountFromSrv <> 0;
end;

procedure TfrmParam.cxDirPropertiesChange(Sender: TObject);
begin
  aSave.Enabled := True;
end;

procedure TfrmParam.cxPortPropertiesChange(Sender: TObject);
begin
  if cxPort.Text <> '' then
    aSave.Enabled := True
  else
    aSave.Enabled := False;
end;

procedure TfrmParam.cxTitlePropertiesChange(Sender: TObject);
begin
  aSave.Enabled := True;
end;

procedure TfrmParam.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  TVDEVICES.StoreToRegistry('\SoftWare\SoftMaster\DicomServer\TVDEVICES\cxGr', TRUE, [], 'cxGr');
end;

procedure TfrmParam.FormShow(Sender: TObject);
begin
  pcParam.HideTabs := True;
  aSave.Enabled := False;
//  lbSizeLocalStor.Caption := '`'+FormatFloat('#,##0.00 MB', frmMain.GetDirSize(cxDir.Text+'\')/ 1024 / 1024);
//  lbSizeRemoteStor.Caption := '`'+FormatFloat('#,##0.00 MB', frmMain.GetDirSize(teRemoteDir.Text+'\')/ 1024 / 1024); // из-за этого были тормоза
  TVDEVICES.StoreToRegistry('\SoftWare\SoftMaster\DicomServer\TVDEVICES\cxGrDefault', TRUE, [], 'cxGr');
  TVDEVICES.RestoreFromRegistry('\SoftWare\SoftMaster\DicomServer\TVDEVICES\cxGr', FALSE, FALSE, [], 'cxGr');
  pcParam.ActivePageIndex := 0;
end;

procedure TfrmParam.frxDevicesGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'VSEGO' then Value := dsDevices.RecordCountFromSrv;
  if VarName = 'DATESYS' then Value := FormatDateTime('dd.mm.yyyy hh:mm', Now); 
end;

procedure TfrmParam.N3Click(Sender: TObject);
begin
  TVDEVICES.RestoreFromRegistry('\SoftWare\SoftMaster\DicomServer\TVDEVICES\cxGrDefault', FALSE, FALSE, [], 'cxGr');
end;

procedure TfrmParam.seDaysArchivePropertiesEditValueChanged(Sender: TObject);
begin
  aSave.Enabled := True;
end;

procedure TfrmParam.teRemoteDirPropertiesChange(Sender: TObject);
begin
  aSave.Enabled := True;
end;

procedure TfrmParam.tvTreeChange(Sender: TObject; Node: TTreeNode);
begin
  if Node.StateIndex = 1 then
    begin
      pcParam.ActivePageIndex := 0;
    end;
  if Node.StateIndex = 2 then
    begin
      pcParam.ActivePageIndex := 1;
    end;
end;

end.
