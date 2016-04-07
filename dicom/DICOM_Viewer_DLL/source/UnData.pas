unit UnData;

interface

uses
  SysUtils, Classes, Oracle, Dialogs, Forms, DCM_Server, DCM_Attributes,
  KXString, KXServerCore, CmnUnit, UnFrmProgressBar, DICOM_CMN, fSnimok,
  DCM_Client, fSnimki;

type
  TDataModule1 = class(TDataModule)
    DicomServerCore1: TDicomServerCore;
    procedure DicomServerCore1DicomImage(AClientThread: TDicomClientThread;
      AAddress: string; ADataset: TDicomDataset);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;
  v_OracleSession1 : TOracleSession;
  v_AppHandl : THandle;
  v_is_old_form : Boolean;

procedure setSession (p_OracleSession1: pointer);
procedure oraDisconnect;
function f_gtTSMINI ( p_key : string; p_section : string ) : string;
procedure DicomServerCoreCREATE;
procedure DicomServerCoreFREE;

implementation

{$R *.dfm}

procedure DicomServerCoreCREATE;
begin
  DataModule1 := TDataModule1.Create(nil);
  DataModule1.DicomServerCore1.ServerPort:=-1;
  DataModule1.DicomServerCore1.Stop;
  DataModule1.DicomServerCore1.OnDicomImage := DataModule1.DicomServerCore1DicomImage;
end;

procedure DicomServerCoreFREE;
begin
  FreeAndNil(DataModule1);
end;

procedure setSession (p_OracleSession1: pointer);
begin
  if v_OracleSession1=nil then
    v_OracleSession1 := TOracleSession.Create(nil);
  v_OracleSession1.ExternalSVC := p_OracleSession1 ;
end;

procedure oraDisconnect;
begin
  if v_OracleSession1<>nil then
    v_OracleSession1.Free;
end;


function f_gtTSMINI ( p_key : string; p_section : string ) : string;
var v_OraclePackage : TOraclePackage;
begin
  v_OraclePackage := TOraclePackage.Create(nil);
  try
    v_OraclePackage.Session := v_OracleSession1;
    v_OraclePackage.PackageName:='asu.PKG_SMINI';
    try
      Result:=v_OraclePackage.CallStringFunction('READSTRING',[p_key,p_section,'']);
    except
      on E:Exception do
        MessageDlg('������ '+E.Message, mtError, [mbOK], 0);
    end;
  finally
    v_OraclePackage.Free;
  end; 
end;

procedure TDataModule1.DicomServerCore1DicomImage(
  AClientThread: TDicomClientThread; AAddress: string; ADataset: TDicomDataset);
begin
 {  MnLg_ev('DicomServerDicomImage port='+inttostr(DicomServerCore1.ServerPort)+#13+
          ' AAddress='+AAddress); }
  // ��������� ������� ��������������� ������ - ���������������
  // � ����� ��������
  if CmnUnit.v_exit_progressbar=1 then // ���������� �����
  begin
    DataModule1.DicomServerCore1.Stop;
  end else begin  // ����� ���������� �����������
   { MnLg_ev('DicomServerDicomImage MoveImageCount '+inttostr(MoveImageCount)+
             ' / curr_count='+inttostr(v_amm_img_loaded),
             ExtractFilePath(paramstr(0))+'c_move.log',
             False ); }
    // ���� �������� ������� ������ ������
    // ���������� ������� ��������� �������
    // �������� ������ � �������
//    frmSnimok.CnsDMTable1.Add(ADataset); //
      frmSnimok.CnsDMTable1.Add(ADataset);
    // ������� ��������� ��� ������ ������ ��������� - 0
    AClientThread.Association.SendStatus(0);
   // if v_amm_img_loaded<=MoveImageCount then begin
      inc(v_amm_img_loaded);
      // ���� ������ ��������� - ��������� �����
      if ((v_amm_img_loaded>=MoveImageCount) and (MoveImageCount>0))
      then
      begin
        CmnUnit.v_exit_progressbar:=2;  // ��������� ��������
        DataModule1.DicomServerCore1.Stop;
      end;
      FrmProgressBar.MyIncPos; // ����������� ���������
   // end;
  end;
end;

end.
