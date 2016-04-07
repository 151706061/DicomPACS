unit fNazRgOne1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, OracleData, Oracle, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ActnList, ImgList, dxBar,
  cxImageComboBox, ExtCtrls, dxBarExtItems, cxLabel, cxContainer,
  cxTextEdit, Registry, fMain, cxSplitter, StrUtils, dxSkinsCore, dxSkinscxPCPainter,
  dxSkinsdxBarPainter, uDBTableUtils;

type
  TfrmNazRg1 = class(TForm)
    ds: TDataSource;
    odsChild: TOracleDataSet;
    al: TActionList;
    dxBarDockControl1: TdxBarDockControl;
    BM: TdxBarManager;
    bbExit: TdxBarButton;
    IL: TImageList;
    aClose: TAction;
    ILChilds: TImageList;
    Panel1: TPanel;
    TVGROUPS: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    Splitter1: TSplitter;
    VGROUPNAME: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    Panel2: TPanel;
    cxGrid1: TcxGrid;
    TV: TcxGridDBTableView;
    TVNAME: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    dxBarDockControl2: TdxBarDockControl;
    stName: TdxBarStatic;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    paPacFIO: TPanel;
    cxPacFIO: TcxTextEdit;
    cxLabel1: TcxLabel;
    odsGroups: TOracleDataSet;
    dsGroups: TDataSource;
    odsCheckNazHeal: TOracleDataSet;
    procedure TVKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure aCloseExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure odsGroupsBeforeOpen(DataSet: TDataSet);
    procedure odsGroupsAfterScroll(DataSet: TDataSet);
    procedure TVCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    pAmbul : Integer;
    { Private declarations }
  public
    IsKonsult, isNotKonsult : Boolean;
    pPACID, pSOTRID, PKABID, pNAZID : Integer;
    sDOCID : String;
    FDDOCID : String;
    FDNazID : Integer;
    procedure DoShowfrmNazRg(nAmbul : Integer; nPACID, nSOTRID, nKABID : Integer; sFIOPAC : String; nNAZID : Integer=0; nDOCID : String='');
    procedure DoUpdateNaz;
    procedure DoInsertNaz(nROOMID : Integer; nDATE : TDateTime);
    { Public declarations }
  end;

var
  frmNazRg1: TfrmNazRg1;

implementation

uses fNazParamRegist, fLabNaprav;

{$R *.dfm}

procedure TfrmNazRg1.TVCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if frmMain.odsKab.FieldByName('is_flu').AsInteger = 1 then
    begin
      if frmMain.Update = TRUE then
        begin
          DoUpdateNaz;
        end else
        begin
          DoInsertNaz(frmMain.odsKab.FieldByName('fk_id').AsInteger, Date);
        end;
      close;
    end else
    begin
      Application.CreateForm(TfrmNazParamRegist, frmNazParamRegist);
      frmNazParamRegist.cbKonsult.Visible := pAmbul = 1;

      frmNazParamRegist.cbKonsult.Enabled := (isKonsult = False) and (frmMain.get_def_konsult <> '-1');
      frmNazParamRegist.cbKonsult.Checked := ((isKonsult = True) or (frmMain.get_def_konsult = '-1')) and (pAmbul = 1);
      frmNazParamRegist.DoShowFormParam(odsChild.FieldByName('FK_SMID').AsInteger, pSOTRID, pKABID, pSOTRID);
      frmNazParamRegist.ShowModal;
      if frmNazParamRegist.ModalResult = MrOK then
        begin
          if frmNazParamRegist.cbKonsult.Checked = True then
            isKonsult := True
          else
            isKonsult := False;
          if frmMain.Update = TRUE then
            begin
              DoUpdateNaz;
            end else
            begin
              DoInsertNaz(frmNazParamRegist.cxlcRoom.EditValue,
                          StrToDateTime(DateToStr(frmNazParamRegist.cxdeDate.Date)+' '+FormatDateTime('hh:nn', frmNazParamRegist.cxteTime.Time)));
            end;
          frmNazParamRegist.Free;
          close;
        end;
    end;
end;

procedure TfrmNazRg1.TVKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
    begin
      if frmMain.odsKab.FieldByName('is_flu').AsInteger = 1 then
        begin
          if frmMain.Update = TRUE then
            begin
              DoUpdateNaz;
            end else
            begin
              DoInsertNaz(frmMain.odsKab.FieldByName('fk_id').AsInteger, Date);
            end;
          close;
        end else
        begin
          Application.CreateForm(TfrmNazParamRegist, frmNazParamRegist);
          frmNazParamRegist.cbKonsult.Visible := pAmbul = 1;
          frmNazParamRegist.cbKonsult.Enabled := (isKonsult = False) and (frmMain.get_def_konsult <> '-1');
          frmNazParamRegist.cbKonsult.Checked := ((isKonsult = True) or (frmMain.get_def_konsult = '-1')) and (pAmbul = 1);
          frmNazParamRegist.DoShowFormParam(odsChild.FieldByName('FK_SMID').AsInteger, pSOTRID, pKABID, pSOTRID);
          frmNazParamRegist.ShowModal;
          if frmNazParamRegist.ModalResult = MrOK then
            begin
              if frmNazParamRegist.cbKonsult.Checked = True then
                isKonsult := True
              else
                isKonsult := False;
              if frmMain.Update = TRUE then
                begin
                  DoUpdateNaz;
                end else
                begin
                  DoInsertNaz(frmNazParamRegist.cxlcRoom.EditValue,
                            StrToDateTime(DateToStr(frmNazParamRegist.cxdeDate.Date)+' '+FormatDateTime('hh:nn', frmNazParamRegist.cxteTime.Time)));
                end;
              frmNazParamRegist.Free;
              close;
            end;
        end;
    end;
end;

procedure TfrmNazRg1.aCloseExecute(Sender: TObject);
begin
  ModalResult := MrCancel;
end;

procedure TfrmNazRg1.FormCreate(Sender: TObject);
begin
  odsGroups.AfterScroll := nil;
  if odsGroups.Active = FALSE then
    odsGroups.Open;
  odsGroups.AfterScroll := odsGroupsAfterScroll;  
end;

procedure TfrmNazRg1.DoShowfrmNazRg(nAmbul : Integer; nPACID, nSOTRID, nKABID: Integer; sFIOPAC : String; nNAZID : Integer; nDOCID : String);
var ods : TOracleDataSet;
    id : Integer;
    Reg : TRegIniFile;
begin
  pPACID := nPACID;
  pSOTRID := nSOTRID;
  pKABID := nKABID;
  pNAZID := nNAZID;
  sDOCID := nDOCID;
  pAmbul := nAmbul;
  if sFIOPAC = '' then
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT PKG_REGIST_PACFUNC.GET_PAC_FIO(:PFK_PACID) AS PACFIO FROM DUAL ';
        ods.DeclareAndSet('PFK_PACID', otInteger, pPACID);
        ods.Open;
        cxPacFIO.Text := ods.FieldByName('PACFIO').AsString;
      finally
        ods.Free;
      end;
    end else
    begin
      cxPacFIO.Text := sFIOPAC;
    end;
//------------------------------------------------------------------------------
  Reg:=TRegIniFile.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
  Reg.OpenKey('\Software\Softmaster\fNazRg\ID_VIDNAZ'+IntToStr(pSOTRID), True);
  id := Reg.ReadInteger('\Software\Softmaster\fNazRg\ID_VIDNAZ'+IntToStr(pSOTRID), 'ID_VIDNAZ', 0);
  odsGroups.AfterScroll := nil;
  if id <> 0 then
    odsGroups.Locate('FK_ID', id, []);
  odsChild.Close;
  odsChild.SetVariable('PFK_GROUP', odsGroups.FieldByName('FK_ID').AsInteger);
  odsChild.SetVariable('PFK_KABINET', frmMain.odsKab.FieldByName('FK_ID').AsInteger);
  odsChild.SetVariable('PFK_SOTR', pSOTRID);
  odsChild.Open;
  stName.Caption := odsGroups.FieldByName('FC_NAME').AsString;
  odsGroups.AfterScroll := odsGroupsAfterScroll;
  Reg.Free;
//------------------------------------------------------------------------------
  frmNazRg1.Caption := 'Методики исследований. Кабинет -- ' + frmMain.odsKab.FieldByName('FC_NAME').AsString;
end;

procedure TfrmNazRg1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var Reg : TRegIniFile;
begin
  Reg := TRegIniFile.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
  if not Reg.OpenKey('\Software\Softmaster\fNazRg\', FALSE) then
   begin
     Reg.CreateKey('\Software\Softmaster\fNazRg');
   end;
  try
    Reg.WriteInteger('\Software\Softmaster\fNazRg'+'\ID_VIDNAZ'+IntToStr(pSOTRID), 'ID_VIDNAZ', odsGroups.FieldByName('FK_ID').AsInteger);
  except
  end;
  Reg.Free;
end;

procedure TfrmNazRg1.DoUpdateNaz;
var
  oq : TOracleQuery;
  ods: TOracleDataSet;
  oldSMID: Integer;
  oldName, newName: String;
begin
  odsCheckNazHeal.Close;
  odsCheckNazHeal.ClearVariables;
  odsCheckNazHeal.SetVariable('pFK_PACID', pPACID);
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := frmMain.os;
    oq.Cursor := crSQLWait;

    //--проверка на оплаченную услугу
    if not CAN_UPDATE_NAZ_SMID
    then begin
      try
        ods := TOracleDataSet.Create(nil);
        ods.Session := frmMain.os;
        ods.SQL.Text := 'SELECT FK_SMID, asu.get_smidname(FK_SMID) as SMID_NAME FROM ASU.VNAZ WHERE FK_ID = :pFK_ID';

        if pNAZID = 0
        then ods.DeclareAndSet('pFK_ID', otInteger, frmMain.IDNaz)
        else ods.DeclareAndSet('pFK_ID', otInteger, pNAZID);

        ods.Open;

        if ods.RecordCount > 0
        then begin
          oldSMID := ods.FieldByName('FK_SMID').AsInteger;
          oldName := ods.FieldByName('SMID_NAME').AsString;
        end
        else oldSMID := -1979;

        ods.Close;

        if oldSMID <> odsChild.FieldByName('FK_SMID').AsInteger
        then begin
          ods.DeleteVariables;
          ods.SQL.Text := 'SELECT 1 AS N' + #13#10 +
            'FROM ASU.TAPPENDIX_NAZ tn INNER JOIN ASU.TBILL tb' + #13#10 +
            'ON tn.fk_appendixid = tb.fk_appendix' + #13#10 +
            'WHERE tn.fk_nazid = :pFK_NAZID AND FP_PAY = 1';

          if pNAZID = 0
          then ods.DeclareAndSet('pFK_NAZID', otInteger, frmMain.IDNaz)
          else ods.DeclareAndSet('pFK_NAZID', otInteger, pNAZID);

          ods.Open;

          if ods.RecordCount > 0
          then begin
            newName := odsChild.FieldByName('FK_SMID').AsString;
            Application.MessageBox(PAnsiChar('Назначение "' + oldName + '" невозможно изменить на "' + newName +
              '", т.к. для данного назначения имеются оплаченные платные услуги!'),
              'Информация', MB_ICONWARNING + MB_OK);
            ods.Free;
            oq.Free;
            exit;
          end;          
        end;
      finally
        ods.Free;
      end;
    end;    

    if frmMain.odsKab.FieldByName('is_flu').AsInteger = 1 then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' UPDATE ASU.TNAZIS '+#13+
                       '    SET FK_SMID = :PFK_SMID, '+#13+
                       '        FK_ROOMID = :PFK_ROOMID, '+#13+ 
                       '        FC_NAME = asu.GET_SMIDNAME(:PFK_SMID), '+#13+
                       '        FD_RUN = SYSDATE, '+#13+
                       '        FC_TYPE = :PFC_TYPE, '+#13+
                       '        fc_accessionnumber = :Pfc_accessionnumber '+#13+
                       '  WHERE FK_ID = :PFK_ID ';
        oq.DeclareAndSet('PFK_SMID', otInteger, odsChild.FieldByName('FK_SMID').AsInteger);
        if pNAZID = 0 then
          oq.DeclareAndSet('PFK_ID', otInteger, frmMain.IDNaz)
        else
          oq.DeclareAndSet('PFK_ID', otInteger, pNAZID);
        oq.DeclareAndSet('PFC_TYPE', otString, sDOCID);
        oq.DeclareAndSet('Pfc_accessionnumber', otString, sDOCID);
        oq.DeclareAndSet('PFK_ROOMID', otInteger, frmMain.odsKab.FieldByName('fk_id').AsInteger);
        oq.Execute;
      end else
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' UPDATE ASU.TNAZIS '+#13+
                       '    SET FK_SMID = :PFK_SMID, '+#13+
                       '        FK_ROOMID = :PFK_ROOMID, '+#13+
                       '        FC_NAME = asu.GET_SMIDNAME(:PFK_SMID), '+#13+
                       '        FD_RUN = :PFD_RUN, '+#13+
                       '        FC_TYPE = :PFC_TYPE  '+#13+
                       '  WHERE FK_ID = :PFK_ID ';
        oq.DeclareAndSet('PFK_SMID', otInteger, odsChild.FieldByName('FK_SMID').AsInteger);
        if pNAZID = 0 then
          oq.DeclareAndSet('PFK_ID', otInteger, frmMain.IDNaz)
        else
          oq.DeclareAndSet('PFK_ID', otInteger, pNAZID);
        oq.DeclareAndSet('PFK_ROOMID', otInteger, frmNazParamRegist.cxlcRoom.EditValue);
        oq.DeclareAndSet('PFD_RUN', otDate, StrToDateTime(DateToStr(frmNazParamRegist.cxdeDate.Date)+' '+FormatDateTime('hh:nn', frmNazParamRegist.cxteTime.Time)));
        oq.DeclareAndSet('PFC_TYPE', otString, sDOCID);
        oq.Execute;
      end;
    if pNAZID = 0 then
      odsCheckNazHeal.SetVariable('pNazID', frmMain.IDNaz)
    else
      odsCheckNazHeal.SetVariable('pNazID', pNAZID);

    odsCheckNazHeal.Open;
    if not odsCheckNazHeal.IsEmpty then
    begin
      oq.DeleteVariables;
      if odsCheckNazHeal.FieldByName('HT').AsInteger <> uDBTableUtils.TDBUtils.GetFunctionDef('TYPEDOC_NAL', frmMain.os, 21) then
        oq.SQL.Text := 'delete from asu.tnazheal where fk_id='+odsCheckNazHeal.FieldByName('fk_nazhealid').AsString
      else
        oq.SQL.Text := 'update asu.tnazheal set fk_healid = ' + odsCheckNazHeal.FieldByName('NewFK_HEALID').AsString +
                       ' where fk_id = ' + odsCheckNazHeal.FieldByName('fk_nazhealid').AsString;
      oq.Execute;
    end;

    frmMain.os.Commit;
    FDDOCID := sDOCID;
    if pNAZID = 0 then
      FDNazID := frmMain.IDNaz
    else
      FDNazID := pNAZID;
  finally
    oq.Free;
  end;  
end;

procedure TfrmNazRg1.DoInsertNaz(nROOMID : Integer; nDATE : TDateTime);
var v_is_exist_nazn : boolean;
    v_docidtmp:string;
  procedure cmn_part_tmp1;
  begin
    With TOracleQuery.Create(nil) do
    try
      Session := frmMain.os;
      Cursor := crSQLWait;
      if frmMain.odsKab.FieldByName('is_flu').AsInteger = 1 then
      begin
        SQL.Text := ' INSERT INTO ASU.TNAZIS(FK_SMID, FD_NAZ, FD_RUN, FK_ROOMID, FK_ISPOLID, FK_VRACHID, FK_NAZSOSID, FK_PACID, FC_NAME, FK_NAZTYPEID, FK_NAZOWNER, FC_TYPE) '+#13+
                       ' VALUES(:PFK_SMID, SYSDATE, SYSDATE, :PFK_ROOMID, 0, :PFK_VRACHID, GET_NEVIP, :PFK_PACID, GET_SMIDNAME(:PFK_SMID), GET_NAZPLAN, -1, :PFC_TYPE) '+#13+
                       ' RETURNING FK_ID INTO :PFK_ID ';
      end else
      begin
        SQL.Text := ' INSERT INTO ASU.TNAZIS(FK_SMID, FD_NAZ, FD_RUN, FK_ROOMID, FK_ISPOLID, FK_VRACHID, FK_NAZSOSID, FK_PACID, FC_NAME, FK_NAZTYPEID, FK_NAZOWNER, FC_TYPE) '+
                       ' VALUES(:PFK_SMID, SYSDATE, :PFD_RUN, :PFK_ROOMID, 0, :PFK_VRACHID, GET_NEVIP, :PFK_PACID, GET_SMIDNAME(:PFK_SMID), GET_NAZPLAN, -1, :PFC_TYPE) '+
                       ' RETURNING FK_ID INTO :PFK_ID ';
        DeclareAndSet('PFD_RUN', otDate, nDATE);
      end;
      DeclareAndSet('PFK_SMID', otInteger, odsChild.FieldByName('FK_SMID').AsInteger);
      DeclareAndSet('PFK_ROOMID', otInteger, nROOMID);
      DeclareAndSet('PFK_VRACHID', otInteger, pSOTRID);
      DeclareAndSet('PFK_PACID', otInteger, pPACID);
      DeclareAndSet('PFC_TYPE', otString, sDOCID);
      DeclareVariable('PFK_ID', otInteger);
      Execute;
      FDNazID := GetVariable('PFK_ID');
      FDDOCID := sDOCID;
      frmMain.os.Commit;
    finally
      Free;
    end;
  end;
begin
  v_docidtmp:=sDOCID;
  if frmmain.USE_METODICS_IN_NAZN=1 then
  begin
    With TOracleQuery.Create(nil) do
    try
      Session := frmMain.os;
      Cursor := crSQLWait;
      SQL.Text := 'select 1 from asu.tnazis where fc_type=:p_fc_type and (asu.check_nazn(TNAZIS.FK_ID,1)=1) ';
      DeclareAndSet('p_fc_type', otString, sDOCID);
      Execute;
      v_is_exist_nazn:=Eof;
      frmMain.os.Commit;
    finally
      Free;
    end;
  end else
    v_is_exist_nazn := True;
  if v_is_exist_nazn then
    cmn_part_tmp1;
  if frmmain.USE_METODICS_IN_NAZN=1 then
  begin
    cmn_part_tmp1;
    With TOracleQuery.Create(nil) do
    try
      Session := frmMain.os;
      Cursor := crSQLWait;
      SQL.Text := 'insert into asu.TNAZMETODICS ( FK_NAZISID, FL_PR_NAZN ) values ( :p_FK_NAZISID, 0 )';
      DeclareAndSet('p_FK_NAZISID', otInteger, FDNazID);
      Execute;
      frmMain.os.Commit;
    finally
      Free;
    end;
  end;
end;

procedure TfrmNazRg1.odsGroupsBeforeOpen(DataSet: TDataSet);
begin
  odsGroups.SetVariable('PFK_KABINET', frmMain.odsKab.FieldByName('FK_ID').AsInteger);
  odsGroups.SetVariable('PFK_SOTRID', frmMain.pSOTRID);
end;

procedure TfrmNazRg1.odsGroupsAfterScroll(DataSet: TDataSet);
begin
  odsChild.Close;
  odsChild.SetVariable('PFK_GROUP', odsGroups.FieldByName('FK_ID').AsInteger);
  odsChild.SetVariable('PFK_KABINET', frmMain.odsKab.FieldByName('FK_ID').AsInteger);
  odsChild.SetVariable('PFK_SOTR', pSOTRID);
  odsChild.Open;
  stName.Caption := odsGroups.FieldByName('FC_NAME').AsString;
end;

end.
