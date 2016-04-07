unit fActions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, dxSkinsCore, dxSkinCaramel, dxSkinscxPCPainter,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC,
  OracleData, Oracle, ActnList, ExtCtrls, cxContainer, cxLabel, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, JvComponentBase, JvFormPlacement,
  jvDBUtils, dxSkinCoffee, dxSkinOffice2007Green;

type
  TfrmActions = class(TForm)
    pcMain: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    grActions: TcxGrid;
    tvActions: TcxGridDBTableView;
    tvActionsName: TcxGridDBColumn;
    grActionsLevel1: TcxGridLevel;
    dsActions: TDataSource;
    odsActions: TOracleDataSet;
    dsRaion: TDataSource;
    odsRaion: TOracleDataSet;
    grRaion: TcxGrid;
    tvRaion: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    Panel1: TPanel;
    lbCapAct: TcxLabel;
    bMove: TcxButton;
    bClose: TcxButton;
    jvFrmStor: TJvFormStorage;
    al: TActionList;
    aClose: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tvActionsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tvRaionKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pcMainChange(Sender: TObject);
    procedure tvActionsCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure tvRaionCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure bMoveMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure aCloseExecute(Sender: TObject);
  private
    v_listIndex : Integer;
    procedure DoVihod(pDriverId : Integer);
    procedure ChangeTaxiEvent(AOs:TOracleSession; Adriver:Integer; AEventSyn:string; AToPlace:Variant; Ajournal:Variant);
    { Private declarations }
  public
    iDriverId : Integer;
    { Public declarations }
  end;

var
  frmActions: TfrmActions;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmActions.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmActions.ChangeTaxiEvent(AOs: TOracleSession; Adriver: Integer; AEventSyn: string; AToPlace, Ajournal: Variant);
begin
  with TOracleQuery.Create(nil) do
    begin
      try
        Session := AOs;
        SQL.Text := ' insert into taxi.tdriverevent(fk_driver, fk_drivereventtype, fk_place, fk_journal) '+#13+
                    ' values(:pdriver, (select max(fk_id) from taxi.ts_drivereventtype t where t.fc_synonym = :psyn), :pplace, :pjournal) ';
        DeclareAndSet('pdriver', otInteger, Adriver);
        DeclareAndSet('pplace', otInteger, AToPlace);
        DeclareAndSet('psyn', otString, AEventSyn);
        if VarToStr(Ajournal) = '' then
          begin
            DeclareAndSet('pjournal', otInteger, null);
          end else
          begin
            DeclareAndSet('pjournal', otInteger, Ajournal);
          end;
        Execute;
        Aos.Commit;
      finally
        Free;
      end;
    end;
end;

procedure TfrmActions.bMoveMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(WM_SYSCOMMAND, $F012, 0);
end;

procedure TfrmActions.DoVihod(pDriverId : Integer);
begin
  ChangeTaxiEvent(frmMain.os, pDriverId, 'ARRIVED', odsRaion.FieldByName('fk_id').AsInteger, null);
  ChangeTaxiEvent(frmMain.os, pDriverId, 'MOVED', odsRaion.FieldByName('fk_id').AsInteger, null);
end;

procedure TfrmActions.pcMainChange(Sender: TObject);
begin
  if odsRaion.Active = False then
    odsRaion.Active := True;
  if pcMain.ActivePageIndex = 0 then
    lbCapAct.Caption := '�������';
  if pcMain.ActivePageIndex = 1 then
    lbCapAct.Caption := '����� ������';
end;

procedure TfrmActions.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TfrmActions.FormCreate(Sender: TObject);
begin
  pcMain.HideTabs := True;
  pcMain.ActivePageIndex := 0;
  if odsActions.Active = False then
    odsActions.Active := True;
  tvActionsName.Focused := True;
  v_ListIndex := -1;
end;

procedure TfrmActions.FormDestroy(Sender: TObject);
begin
  frmActions := nil;
end;

procedure TfrmActions.tvActionsCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var sTmp : string;
    oq : TOracleQuery; 
begin
  if odsActions.FieldByName('fn_order').AsInteger = 1 then // �� �����
        begin
          if iDriverId > 0 then
            begin
              if frmMain.FindDrv(frmMain.teVvod.Text) = True then // ���� ����� ������� ��� �� ����� �� ������� ���������
                begin
                  frmMain.DoShowRemark('�������� �'+frmMain.teVvod.Text+' ��� �� �����!', frmMain.stError);
                  beep;
                  frmMain.teVvod.Style.Color := clRed;
                  frmMain.tColorError.Enabled := True;
                  frmMain.teVvod.Clear;
                  close;
                end else
                begin
                  v_listIndex := 1;
                  pcMain.ActivePageIndex := 1;
                end;
            end else
            begin
              sTmp := Format('�������� � �������� %s �� ������', [frmMain.teVvod.Text]);
              Application.MessageBox(PChar(sTmp), '��������', MB_OK + MB_ICONQUESTION);
            end;
        end;
      if odsActions.FieldByName('fn_order').AsInteger = 2 then // ����� ���������
        begin
          if iDriverId > 0 then
            begin
              if frmMain.FindDrv(frmMain.teVvod.Text) = True then
                begin
                  ChangeTaxiEvent(frmMain.os, iDriverId, 'DAY_END', null, null); // !!! ������ �������� ���� �� �������� � ������� ��� �� ������������
                  frmMain.DoShowRemark('�������� � '+frmMain.teVvod.Text+' ����� ��������', frmMain.stOk);
                  frmMain.teVvod.Clear;
                  close;
                end else
                begin
                  frmMain.DoShowRemark('�������� �'+frmMain.teVvod.Text+' �� �� �����!', frmMain.stError);
                  beep;
                  frmMain.teVvod.Style.Color := clRed;
                  frmMain.tColorError.Enabled := True;
                  frmMain.teVvod.Clear;
                  close;
                end;
            end else
            begin
              sTmp := Format('�������� � �������� %s �� ������', [frmMain.teVvod.Text]);
              Application.MessageBox(PChar(sTmp), '��������', MB_OK + MB_ICONQUESTION);
            end;
        end;
      if odsActions.FieldByName('fn_order').AsInteger = 3 then // �� ����
        begin
          if iDriverId > 0 then
            begin
              if frmMain.FindDrv(frmMain.teVvod.Text) = True then
                begin
                  ChangeTaxiEvent(frmMain.os, iDriverId, 'GO_DINNER', null, null); // ������ �������� ���� �� �������� � ������� ��� �� ������������
                  frmMain.DoShowRemark('�������� � '+frmMain.teVvod.Text+' ���� �� ����', frmMain.stOk);
                  frmMain.teVvod.Clear;
                  close;
                end else
                begin
                  frmMain.DoShowRemark('�������� �'+frmMain.teVvod.Text+' �� �� �����!', frmMain.stError);
                  beep;
                  frmMain.teVvod.Style.Color := clRed;
                  frmMain.tColorError.Enabled := True;
                  frmMain.teVvod.Clear;
                  close;
                end;
            end else
            begin
              sTmp := Format('�������� � �������� %s �� ������', [frmMain.teVvod.Text]);
              Application.MessageBox(PChar(sTmp), '��������', MB_OK + MB_ICONQUESTION);
            end;
        end;
      if odsActions.FieldByName('fn_order').AsInteger = 4 then // �������� � �����
        begin
          if iDriverId > 0 then
            begin
              if frmMain.FindDrv(frmMain.teVvod.Text) = True then
                begin
                  v_listIndex := 4;
                  pcMain.ActivePageIndex := 1;

//                  ChangeTaxiEvent(frmMain.os, iDriverId, 'BACK_DINNER', null, null); // ������ �������� ���� �� �������� � ������� ��� �� ������������
//                  frmMain.DoShowRemark('�������� � '+frmMain.teVvod.Text+' �������� � �����', frmMain.stOk);
//                  frmMain.teVvod.Clear;
//                  close;
                end else
                begin
                  frmMain.DoShowRemark('�������� �'+frmMain.teVvod.Text+' �� �� �����!', frmMain.stError);
                  beep;
                  frmMain.teVvod.Style.Color := clRed;
                  frmMain.tColorError.Enabled := True;
                  frmMain.teVvod.Clear;
                  close;
                end;
            end else
            begin
              sTmp := Format('�������� � �������� %s �� ������', [frmMain.teVvod.Text]);
              Application.MessageBox(PChar(sTmp), '��������', MB_OK + MB_ICONQUESTION);
            end;
        end;
      if odsActions.FieldByName('fn_order').AsInteger = 5 then // ���������
        begin
          if iDriverId > 0 then
            begin
              if frmMain.FindDrv(frmMain.teVvod.Text) = True then
                begin
                  ChangeTaxiEvent(frmMain.os, iDriverId, 'MOVE_OUT', null, null); // ������ �������� ���� �� �������� � ������� ��� �� ������������
                  frmMain.DoShowRemark('�������� � '+frmMain.teVvod.Text+' ���������', frmMain.stOk);
                  frmMain.teVvod.Clear;
                  close;
                end else
                begin
                  frmMain.DoShowRemark('�������� �'+frmMain.teVvod.Text+' �� �� �����!', frmMain.stError);
                  beep;
                  frmMain.teVvod.Style.Color := clRed;
                  frmMain.tColorError.Enabled := True;
                  frmMain.teVvod.Clear;
                  close;
                end;
            end else
            begin
              sTmp := Format('�������� � �������� %s �� ������', [frmMain.teVvod.Text]);
              Application.MessageBox(PChar(sTmp), '��������', MB_OK + MB_ICONQUESTION);
            end;
        end;
      if odsActions.FieldByName('fn_order').AsInteger = 6 then // �� ������
        begin
          if iDriverId > 0 then
            begin
              if frmMain.FindDrv(frmMain.teVvod.Text) = True then
                begin
                  ChangeTaxiEvent(frmMain.os, iDriverId, 'GO_FROM_CAR', null, null); // ������ �������� ���� �� �������� � ������� ��� �� ������������
                  frmMain.DoShowRemark('�������� � '+frmMain.teVvod.Text+' ����� �� ������', frmMain.stOk);
                  frmMain.teVvod.Clear;
                  close;
                end else
                begin
                  frmMain.DoShowRemark('�������� �'+frmMain.teVvod.Text+' �� �� �����!', frmMain.stError);
                  beep;
                  frmMain.teVvod.Style.Color := clRed;
                  frmMain.tColorError.Enabled := True;
                  frmMain.teVvod.Clear;
                  close;
                end;
            end else
            begin
              sTmp := Format('�������� � �������� %s �� ������', [frmMain.teVvod.Text]);
              Application.MessageBox(PChar(sTmp), '��������', MB_OK + MB_ICONQUESTION);
            end;
        end;
      if odsActions.FieldByName('fn_order').AsInteger = 7 then // �������� � ������
        begin
          if iDriverId > 0 then
            begin
              if frmMain.FindDrv(frmMain.teVvod.Text) = True then
                begin
                  ChangeTaxiEvent(frmMain.os, iDriverId, 'BACK_TO_CAR', null, null); // ������ �������� ���� �� �������� � ������� ��� �� ������������
                  frmMain.DoShowRemark('�������� � '+frmMain.teVvod.Text+' �������� � ������', frmMain.stOk);
                  frmMain.teVvod.Clear;
                  close;
                end else
                begin
                  frmMain.DoShowRemark('�������� �'+frmMain.teVvod.Text+' �� �� �����!', frmMain.stError);
                  beep;
                  frmMain.teVvod.Style.Color := clRed;
                  frmMain.tColorError.Enabled := True;
                  frmMain.teVvod.Clear;
                  close;
                end;
            end else
            begin
              sTmp := Format('�������� � �������� %s �� ������', [frmMain.teVvod.Text]);
              Application.MessageBox(PChar(sTmp), '��������', MB_OK + MB_ICONQUESTION);
            end;
        end;
      if odsActions.FieldByName('fn_order').AsInteger = 8 then // �������
        begin
          if iDriverId > 0 then
            begin
              if frmMain.FindDrv(frmMain.teVvod.Text) = True then
                begin
                  ChangeTaxiEvent(frmMain.os, iDriverId, 'GET_DAMAGE', null, null); // ������ �������� ���� �� �������� � ������� ��� �� ������������
                  frmMain.DoShowRemark('�������� � '+frmMain.teVvod.Text+' ���������', frmMain.stOk);
                  frmMain.teVvod.Clear;
                  close;
                end else
                begin
                  frmMain.DoShowRemark('�������� �'+frmMain.teVvod.Text+' �� �� �����!', frmMain.stError);
                  beep;
                  frmMain.teVvod.Style.Color := clRed;
                  frmMain.tColorError.Enabled := True;
                  frmMain.teVvod.Clear;
                  close;
                end;
            end else
            begin
              sTmp := Format('�������� � �������� %s �� ������', [frmMain.teVvod.Text]);
              Application.MessageBox(PChar(sTmp), '��������', MB_OK + MB_ICONQUESTION);
            end;
        end;
      if odsActions.FieldByName('fn_order').AsInteger = 9 then // ����������������
        begin
          if iDriverId > 0 then
            begin
              if frmMain.FindDrv(frmMain.teVvod.Text) = True then
                begin
                  ChangeTaxiEvent(frmMain.os, iDriverId, 'REPEAR_DAMAGE', null, null); // ������ �������� ���� �� �������� � ������� ��� �� ������������
                  frmMain.DoShowRemark('�������� � '+frmMain.teVvod.Text+' ���������', frmMain.stOk);
                  frmMain.teVvod.Clear;
                  close;
                end else
                begin
                  frmMain.DoShowRemark('�������� �'+frmMain.teVvod.Text+' �� �� �����!', frmMain.stError);
                  beep;
                  frmMain.teVvod.Style.Color := clRed;
                  frmMain.tColorError.Enabled := True;
                  frmMain.teVvod.Clear;
                  close;
                end;
            end else
            begin
              sTmp := Format('�������� � �������� %s �� ������', [frmMain.teVvod.Text]);
              Application.MessageBox(PChar(sTmp), '��������', MB_OK + MB_ICONQUESTION);
            end;
        end;
      if odsActions.FieldByName('fn_order').AsInteger = 10 then // ���� � �����
        begin
          if iDriverId > 0 then
            begin
              ChangeTaxiEvent(frmMain.os, iDriverId, 'TAKE_OFF_FROM_LINE', null, null);
              frmMain.DoShowRemark('�������� � '+frmMain.teVvod.Text+' ���� � �����', frmMain.stOk);
              frmMain.teVvod.Clear;
              close;
            end else
            begin
              sTmp := Format('�������� � �������� %s �� ������', [frmMain.teVvod.Text]);
              Application.MessageBox(PChar(sTmp), '��������', MB_OK + MB_ICONQUESTION);
            end;
        end;
      if odsActions.FieldByName('fn_order').AsInteger = 11 then // �� ����������
        begin
          if iDriverId > 0 then
            begin
              if frmMain.FindDrv(frmMain.teVvod.Text) = True then
                begin
                  oq := TOracleQuery.Create(nil);
                  try
                    oq.Session := frmMain.os;
                    oq.Cursor := crSQLWait;
                    oq.SQL.Text := ' insert into taxi.tjournal '+#13+
                                   '   (fd_datein, fn_sos, fc_phone, fk_clientid, fk_sotrid, fk_taxiid, fk_drvid, fk_adr1id, fc_adr1, fk_raionid, fn_stop) '+#13+
                                   ' values '+#13+
                                   '   (sysdate, 8, null, 0, :pfk_sotrid, :pfk_taxiid, :pfk_drvid, :pfk_adr1id, (select fc_name from taxi.tstreet where fk_id = :pfk_adr1id), :pfk_raionid, (select decode(fn_cost, null, 0, fn_cost) from taxi.ts_places where fk_id = :pfk_raionid)) '+#13+
                                   ' returning fk_id into :pfk_id ';
                    oq.DeclareAndSet('pfk_sotrid', otInteger, frmMain.pSOTRID);
                    oq.DeclareAndSet('pfk_taxiid', otInteger, frmMain.pTaxiID);
                    oq.DeclareAndSet('pfk_drvid', otInteger, iDriverId);
                    oq.DeclareAndSet('pfk_adr1id', otInteger, frmMain.pPERS);
                    oq.DeclareAndSet('pfk_raionid', otInteger, 0); // �� ����� � ����� ������ !!! ???
                    oq.DeclareVariable('pfk_id', otInteger);
                    oq.Execute;
                    frmMain.DoDriverEvent(oq.GetVariable('pfk_id'),
                                          iDriverId,
                                          0,
                                          0,
                                          'MOVE_TO_CLIENT');
                    frmMain.odsJur.AfterScroll := nil;
                    RefreshQuery(frmMain.odsJur);
                    frmMain.odsJur.AfterScroll := frmMain.odsJurAfterScroll; // ����� �� ����� �������� ������� AfterScroll
                    frmMain.os.Commit;
                  finally
                    oq.Free;
                  end;
                  frmMain.DoShowRemark('�������� � '+frmMain.teVvod.Text+' ������ �� ����������', frmMain.stOk);
                  frmMain.teVvod.Clear;
                  close;
                end else
                begin
                  frmMain.DoShowRemark('�������� �'+frmMain.teVvod.Text+' �� �� �����!', frmMain.stError);
                  beep;
                  frmMain.teVvod.Style.Color := clRed;
                  frmMain.tColorError.Enabled := True;
                  frmMain.teVvod.Clear;
                  close;
                end;
            end else
            begin
              sTmp := Format('�������� � �������� %s �� ������', [frmMain.teVvod.Text]);
              Application.MessageBox(PChar(sTmp), '��������', MB_OK + MB_ICONQUESTION);
            end;
        end;
  frmMain.VJOURNAL_DATEIN.Focused := True;
  frmMain.grJournal.SetFocus;
end;

procedure TfrmActions.tvActionsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var sTmp : string;
    oq : TOracleQuery;
begin
  if key = vk_escape then // esc
    begin
      close;
      frmMain.VJOURNAL_DATEIN.Focused := True;
      frmMain.grJournal.SetFocus;
    end;
  if key = vk_return then
    begin
      if odsActions.FieldByName('fn_order').AsInteger = 1 then // �� �����
        begin
          if iDriverId > 0 then
            begin
              if frmMain.FindDrv(frmMain.teVvod.Text) = True then // ���� ����� ������� ��� �� ����� �� ������� ���������
                begin
                  frmMain.DoShowRemark('�������� �'+frmMain.teVvod.Text+' ��� �� �����!', frmMain.stError);
                  beep;
                  frmMain.teVvod.Style.Color := clRed;
                  frmMain.tColorError.Enabled := True;
                  frmMain.teVvod.Clear;
                  close;
                end else
                begin
                  v_listIndex := 4;
                  pcMain.ActivePageIndex := 1;
                end;
            end else
            begin
              sTmp := Format('�������� � �������� %s �� ������', [frmMain.teVvod.Text]);
              Application.MessageBox(PChar(sTmp), '��������', MB_OK + MB_ICONQUESTION);
            end;
        end;
      if odsActions.FieldByName('fn_order').AsInteger = 2 then // ����� ���������
        begin
          if iDriverId > 0 then
            begin
              if frmMain.FindDrv(frmMain.teVvod.Text) = True then
                begin
                  ChangeTaxiEvent(frmMain.os, iDriverId, 'DAY_END', null, null); // ������ �������� ���� �� �������� � ������� ��� �� ������������
                  frmMain.DoShowRemark('�������� � '+frmMain.teVvod.Text+' ����� ��������', frmMain.stOk);
                  frmMain.teVvod.Clear;
                  close;
                end else
                begin
                  frmMain.DoShowRemark('�������� �'+frmMain.teVvod.Text+' �� �� �����!', frmMain.stError);
                  beep;
                  frmMain.teVvod.Style.Color := clRed;
                  frmMain.tColorError.Enabled := True;
                  frmMain.teVvod.Clear;
                  close;
                end;
            end else
            begin
              sTmp := Format('�������� � �������� %s �� ������', [frmMain.teVvod.Text]);
              Application.MessageBox(PChar(sTmp), '��������', MB_OK + MB_ICONQUESTION);
            end;
        end;
      if odsActions.FieldByName('fn_order').AsInteger = 3 then // �� ����
        begin
          if iDriverId > 0 then
            begin
              if frmMain.FindDrv(frmMain.teVvod.Text) = True then
                begin
                  ChangeTaxiEvent(frmMain.os, iDriverId, 'GO_DINNER', null, null); // ������ �������� ���� �� �������� � ������� ��� �� ������������
                  frmMain.DoShowRemark('�������� � '+frmMain.teVvod.Text+' ���� �� ����', frmMain.stOk);
                  frmMain.teVvod.Clear;
                  close;
                end else
                begin
                  frmMain.DoShowRemark('�������� �'+frmMain.teVvod.Text+' �� �� �����!', frmMain.stError);
                  beep;
                  frmMain.teVvod.Style.Color := clRed;
                  frmMain.tColorError.Enabled := True;
                  frmMain.teVvod.Clear;
                  close;
                end;
            end else
            begin
              sTmp := Format('�������� � �������� %s �� ������', [frmMain.teVvod.Text]);
              Application.MessageBox(PChar(sTmp), '��������', MB_OK + MB_ICONQUESTION);
            end;
        end;
      if odsActions.FieldByName('fn_order').AsInteger = 4 then // �������� � �����
        begin
          if iDriverId > 0 then
            begin
              if frmMain.FindDrv(frmMain.teVvod.Text) = True then
                begin
                  v_listIndex := 4;
                  pcMain.ActivePageIndex := 1;
//                  ChangeTaxiEvent(frmMain.os, iDriverId, 'BACK_DINNER', null, null); // ������ �������� ���� �� �������� � ������� ��� �� ������������ � ��� �� �� ������ �� �����
//                  frmMain.DoShowRemark('�������� � '+frmMain.teVvod.Text+' �������� � �����', frmMain.stOk);
//                  frmMain.teVvod.Clear;
//                  close;
                end else
                begin
                  frmMain.DoShowRemark('�������� �'+frmMain.teVvod.Text+' �� �� �����!', frmMain.stError);
                  beep;
                  frmMain.teVvod.Style.Color := clRed;
                  frmMain.tColorError.Enabled := True;
                  frmMain.teVvod.Clear;
                  close;
                end;
            end else
            begin
              sTmp := Format('�������� � �������� %s �� ������', [frmMain.teVvod.Text]);
              Application.MessageBox(PChar(sTmp), '��������', MB_OK + MB_ICONQUESTION);
            end;
        end;
      if odsActions.FieldByName('fn_order').AsInteger = 5 then // ���������
        begin
          if iDriverId > 0 then
            begin
              if frmMain.FindDrv(frmMain.teVvod.Text) = True then
                begin
                  ChangeTaxiEvent(frmMain.os, iDriverId, 'MOVE_OUT', null, null); // ������ �������� ���� �� �������� � ������� ��� �� ������������
                  frmMain.DoShowRemark('�������� � '+frmMain.teVvod.Text+' ���������', frmMain.stOk);
                  frmMain.teVvod.Clear;
                  close;
                end else
                begin
                  frmMain.DoShowRemark('�������� �'+frmMain.teVvod.Text+' �� �� �����!', frmMain.stError);
                  beep;
                  frmMain.teVvod.Style.Color := clRed;
                  frmMain.tColorError.Enabled := True;
                  frmMain.teVvod.Clear;
                  close;
                end;
            end else
            begin
              sTmp := Format('�������� � �������� %s �� ������', [frmMain.teVvod.Text]);
              Application.MessageBox(PChar(sTmp), '��������', MB_OK + MB_ICONQUESTION);
            end;
        end;
      if odsActions.FieldByName('fn_order').AsInteger = 6 then // �� ������
        begin
          if iDriverId > 0 then
            begin
              if frmMain.FindDrv(frmMain.teVvod.Text) = True then
                begin
                  ChangeTaxiEvent(frmMain.os, iDriverId, 'GO_FROM_CAR', null, null); // ������ �������� ���� �� �������� � ������� ��� �� ������������
                  frmMain.DoShowRemark('�������� � '+frmMain.teVvod.Text+' ����� �� ������', frmMain.stOk);
                  frmMain.teVvod.Clear;
                  close;
                end else
                begin
                  frmMain.DoShowRemark('�������� �'+frmMain.teVvod.Text+' �� �� �����!', frmMain.stError);
                  beep;
                  frmMain.teVvod.Style.Color := clRed;
                  frmMain.tColorError.Enabled := True;
                  frmMain.teVvod.Clear;
                  close;
                end;
            end else
            begin
              sTmp := Format('�������� � �������� %s �� ������', [frmMain.teVvod.Text]);
              Application.MessageBox(PChar(sTmp), '��������', MB_OK + MB_ICONQUESTION);
            end;
        end;
      if odsActions.FieldByName('fn_order').AsInteger = 7 then // � ������
        begin
          if iDriverId > 0 then
            begin
              if frmMain.FindDrv(frmMain.teVvod.Text) = True then
                begin
                  ChangeTaxiEvent(frmMain.os, iDriverId, 'BACK_TO_CAR', null, null); // ������ �������� ���� �� �������� � ������� ��� �� ������������
                  frmMain.DoShowRemark('�������� � '+frmMain.teVvod.Text+' �������� � ������', frmMain.stOk);
                  frmMain.teVvod.Clear;
                  close;
                end else
                begin
                  frmMain.DoShowRemark('�������� �'+frmMain.teVvod.Text+' �� �� �����!', frmMain.stError);
                  beep;
                  frmMain.teVvod.Style.Color := clRed;
                  frmMain.tColorError.Enabled := True;
                  frmMain.teVvod.Clear;
                  close;
                end;
            end else
            begin
              sTmp := Format('�������� � �������� %s �� ������', [frmMain.teVvod.Text]);
              Application.MessageBox(PChar(sTmp), '��������', MB_OK + MB_ICONQUESTION);
            end;
        end;
      if odsActions.FieldByName('fn_order').AsInteger = 8 then // �������
        begin
          if iDriverId > 0 then
            begin
              if frmMain.FindDrv(frmMain.teVvod.Text) = True then
                begin
                  ChangeTaxiEvent(frmMain.os, iDriverId, 'GET_DAMAGE', null, null); // ������ �������� ���� �� �������� � ������� ��� �� ������������
                  frmMain.DoShowRemark('�������� � '+frmMain.teVvod.Text+' ���������', frmMain.stOk);
                  frmMain.teVvod.Clear;
                  close;
                end else
                begin
                  frmMain.DoShowRemark('�������� �'+frmMain.teVvod.Text+' �� �� �����!', frmMain.stError);
                  beep;
                  frmMain.teVvod.Style.Color := clRed;
                  frmMain.tColorError.Enabled := True;
                  frmMain.teVvod.Clear;
                  close;
                end;
            end else
            begin
              sTmp := Format('�������� � �������� %s �� ������', [frmMain.teVvod.Text]);
              Application.MessageBox(PChar(sTmp), '��������', MB_OK + MB_ICONQUESTION);
            end;
        end;
      if odsActions.FieldByName('fn_order').AsInteger = 9 then // ����������������
        begin
          if iDriverId > 0 then
            begin
              if frmMain.FindDrv(frmMain.teVvod.Text) = True then
                begin
                  ChangeTaxiEvent(frmMain.os, iDriverId, 'REPEAR_DAMAGE', null, null); // ������ �������� ���� �� �������� � ������� ��� �� ������������
                  frmMain.DoShowRemark('�������� � '+frmMain.teVvod.Text+' ����������������', frmMain.stOk);
                  frmMain.teVvod.Clear;
                  close;
                end else
                begin
                  frmMain.DoShowRemark('�������� �'+frmMain.teVvod.Text+' �� �� �����!', frmMain.stError);
                  beep;
                  frmMain.teVvod.Style.Color := clRed;
                  frmMain.tColorError.Enabled := True;
                  frmMain.teVvod.Clear;
                  close;
                end;
            end else
            begin
              sTmp := Format('�������� � �������� %s �� ������', [frmMain.teVvod.Text]);
              Application.MessageBox(PChar(sTmp), '��������', MB_OK + MB_ICONQUESTION);
            end;
        end;
      if odsActions.FieldByName('fn_order').AsInteger = 10 then // ���� � �����
        begin
          if iDriverId > 0 then
            begin
              ChangeTaxiEvent(frmMain.os, iDriverId, 'TAKE_OFF_FROM_LINE', null, null);
              frmMain.DoShowRemark('�������� � '+frmMain.teVvod.Text+' ���� � �����', frmMain.stOk);
              frmMain.teVvod.Clear;
              close;
            end else
            begin
              sTmp := Format('�������� � �������� %s �� ������', [frmMain.teVvod.Text]);
              Application.MessageBox(PChar(sTmp), '��������', MB_OK + MB_ICONQUESTION);
            end;
        end;
      if odsActions.FieldByName('fn_order').AsInteger = 11 then // �� ����������
        begin
          if iDriverId > 0 then
            begin
              if frmMain.FindDrv(frmMain.teVvod.Text) = True then
                begin
                  oq := TOracleQuery.Create(nil);
                  try
                    oq.Session := frmMain.os;
                    oq.Cursor := crSQLWait;
                    oq.SQL.Text := ' insert into taxi.tjournal '+#13+
                                   '   (fd_datein, fn_sos, fc_phone, fk_clientid, fk_sotrid, fk_taxiid, fk_drvid, fk_adr1id, fc_adr1, fk_raionid, fn_stop) '+#13+
                                   ' values '+#13+
                                   '   (sysdate, 8, null, 0, :pfk_sotrid, :pfk_taxiid, :pfk_drvid, :pfk_adr1id, (select fc_name from taxi.tstreet where fk_id = :pfk_adr1id), :pfk_raionid, (select decode(fn_cost, null, 0, fn_cost) from taxi.ts_places where fk_id = :pfk_raionid)) '+#13+
                                   ' returning fk_id into :pfk_id ';
                    oq.DeclareAndSet('pfk_sotrid', otInteger, frmMain.pSOTRID);
                    oq.DeclareAndSet('pfk_taxiid', otInteger, frmMain.pTaxiID);
                    oq.DeclareAndSet('pfk_drvid', otInteger, iDriverId);
                    oq.DeclareAndSet('pfk_adr1id', otInteger, frmMain.pPERS);
                    oq.DeclareAndSet('pfk_raionid', otInteger, 0); // �� ����� � ����� ������ !!! ???
                    oq.DeclareVariable('pfk_id', otInteger);
                    oq.Execute;
                    frmMain.DoDriverEvent(oq.GetVariable('pfk_id'),
                                          iDriverId,
                                          0,
                                          0,
                                          'MOVE_TO_CLIENT');
                    frmMain.odsJur.AfterScroll := nil;
                    RefreshQuery(frmMain.odsJur);
                    frmMain.odsJur.AfterScroll := frmMain.odsJurAfterScroll; // ����� �� ����� �������� ������� AfterScroll
                    frmMain.os.Commit;
                  finally
                    oq.Free;
                  end;
                  frmMain.DoShowRemark('�������� � '+frmMain.teVvod.Text+' ������ �� ����������', frmMain.stOk);
                  frmMain.teVvod.Clear;
                  close;
                end else
                begin
                  frmMain.DoShowRemark('�������� �'+frmMain.teVvod.Text+' �� �� �����!', frmMain.stError);
                  beep;
                  frmMain.teVvod.Style.Color := clRed;
                  frmMain.tColorError.Enabled := True;
                  frmMain.teVvod.Clear;
                  close;
                end;
            end else
            begin
              sTmp := Format('�������� � �������� %s �� ������', [frmMain.teVvod.Text]);
              Application.MessageBox(PChar(sTmp), '��������', MB_OK + MB_ICONQUESTION);
            end;
        end;
    end;                                                      
end;

procedure TfrmActions.tvRaionCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  try
    if v_listIndex = 1 then // ����� �� �����
      begin
        DoVihod(iDriverId);
        frmMain.DoShowRemark('�������� � '+frmMain.teVvod.Text+' �� ����� ->'+odsRaion.FieldByName('fc_name').AsString, frmMain.stOk);
      end;
    if v_listIndex = 4 then // �������� � �����
      begin
        ChangeTaxiEvent(frmMain.os, iDriverId, 'BACK_DINNER', odsRaion.FieldByName('fk_id').AsInteger, null);
        frmMain.DoShowRemark('�������� � '+frmMain.teVvod.Text+' �������� � ����� ->'+odsRaion.FieldByName('fc_name').AsString, frmMain.stOk);
      end;
  finally
    frmMain.teVvod.Clear;
    v_listIndex := -1;
    close;
  end;
end;

procedure TfrmActions.tvRaionKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_escape then // esc
    begin
      close;
      frmMain.VJOURNAL_DATEIN.Focused := True;
      frmMain.grJournal.SetFocus;
    end;
  if key = VK_BACK then
    begin
      pcMain.ActivePageIndex := 0;
    end;
  if key = vk_return then
    begin
      try
        if v_listIndex = 1 then // ����� �� �����
          begin
            DoVihod(iDriverId);
            frmMain.DoShowRemark('�������� � '+frmMain.teVvod.Text+' �� ����� -> '+odsRaion.FieldByName('fc_name').AsString, frmMain.stOk);
          end;
        if v_listIndex = 4 then // �������� � �����
          begin
            ChangeTaxiEvent(frmMain.os, iDriverId, 'BACK_DINNER', odsRaion.FieldByName('fk_id').AsInteger, null);
            frmMain.DoShowRemark('�������� � '+frmMain.teVvod.Text+' �������� � ����� ->'+odsRaion.FieldByName('fc_name').AsString, frmMain.stOk);
          end;
      finally
        frmMain.teVvod.Clear;
        v_listIndex := -1;
        close;
      end;
    end;
end;

end.
