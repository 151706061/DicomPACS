unit fEditNaz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxSpinEdit, cxTimeEdit, StdCtrls, ExtCtrls, dxBar, cxGraphics,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, DB,
  Oracle, OracleData, ActnList, ImgList, cxCalendar, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, DBUtils;

type
  TfrmEditNaz = class(TForm)
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    bbOK: TdxBarButton;
    bbCancel: TdxBarButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    cxteTime: TcxTimeEdit;
    cxlcKabinet: TcxLookupComboBox;
    odsKabinet: TOracleDataSet;
    osEdit: TOracleSession;
    dsKabinet: TDataSource;
    IL: TImageList;
    al: TActionList;
    aOK: TAction;
    aCancel: TAction;
    Label3: TLabel;
    cxdeDate: TcxDateEdit;
    Panel2: TPanel;
    TVTIME: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    VTIMENAZ: TcxGridDBColumn;
    VTIMEISSL: TcxGridDBColumn;
    dsTime: TDataSource;
    odsTime: TOracleDataSet;
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure odsKabinetBeforeOpen(DataSet: TDataSet);
    procedure cxlcKabinetPropertiesChange(Sender: TObject);
    procedure cxdeDatePropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    pPACID : Integer;
    pSOTRID : Integer;
    pPEPLID : Integer;
    pVRACHFIO : String;
    procedure DoShowEditNaz(nPACID : Integer; nSOTRID: Integer; nPEPLID: Integer; sVRACHFIO: String);
    { Public declarations }
  end;

var
  frmEditNaz: TfrmEditNaz;

implementation

uses fMain;

{$R *.dfm}

{ TfrmEditNaz }

procedure TfrmEditNaz.DoShowEditNaz(nPACID, nSOTRID, nPEPLID: Integer; sVRACHFIO: String);
begin
  pPACID := nPACID;
  pSOTRID := nSOTRID;
  pPEPLID := nPEPLID;
  pVRACHFIO := sVRACHFIO;
  if odsKabinet.Active = FALSE
    then odsKabinet.Open;
//------------------------------------------------------------------------------
  cxlcKabinet.Properties.OnChange := nil;
  cxdeDate.Properties.OnChange := nil;
  cxlcKabinet.EditValue := frmMain.odsList.FieldByName('FK_ROOMID').AsInteger;
  cxdeDate.Date := frmMain.odsList.FieldByName('FD_RUN').AsDateTime;
  cxlcKabinet.Properties.OnChange := cxlcKabinetPropertiesChange;
  cxdeDate.Properties.OnChange := cxdeDatePropertiesChange;

  cxteTime.Time := frmMain.odsList.FieldByName('TIME_ISL').AsDateTime;

  odsTime.SetVariable('PFK_ROOMID', cxlcKabinet.EditValue);
  odsTime.SetVariable('PFD_DATE', cxdeDate.Date);

  if odsTime.Active = FALSE
    then odsTime.Open;
end;

procedure TfrmEditNaz.aOKExecute(Sender: TObject);
begin
  ModalResult := MrOk;
end;

procedure TfrmEditNaz.aCancelExecute(Sender: TObject);
begin
  ModalResult := MrCancel;
end;

procedure TfrmEditNaz.odsKabinetBeforeOpen(DataSet: TDataSet);
begin
  odsKabinet.SetVariable('pSOTR', pSOTRID);
end;

procedure TfrmEditNaz.cxlcKabinetPropertiesChange(Sender: TObject);
begin
  odsTime.Close;
  odsTime.SetVariable('PFK_ROOMID', cxlcKabinet.EditValue);
  odsTime.SetVariable('PFD_DATE', cxdeDate.Date);
  odsTime.Open;
end;

procedure TfrmEditNaz.cxdeDatePropertiesChange(Sender: TObject);
begin
  odsTime.Close;
  odsTime.SetVariable('PFK_ROOMID', cxlcKabinet.EditValue);
  odsTime.SetVariable('PFD_DATE', cxdeDate.Date);
  odsTime.Open;
end;

end.
