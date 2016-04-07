unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, ADODB, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, OracleData, Oracle, cxTextEdit, cxSpinEdit,
  cxCurrencyEdit, ComCtrls, StdCtrls, Buttons, ExtCtrls, oracleMonitor,
  ActnList, fdmTheirTables, cxCalendar;

type
  TForm1 = class(TForm)
    dsAddedDocs: TDataSource;
    OracleSession1: TOracleSession;
    oqMakeImportNaklMedics: TOracleQuery;
    oqAdd_TMEDIC: TOracleQuery;
    oqAdd_TEI: TOracleQuery;
    oqAdd_TFARMGR: TOracleQuery;
    oqAdd_TUCHGR: TOracleQuery;
    oqAdd_TMO_GROUP: TOracleQuery;
    oqAdd_TKART_TDPC: TOracleQuery;
    oqAdd_TDOCS: TOracleQuery;
    oqUpdateTDOCS_FN_PRICE: TOracleQuery;
    oqTDOCS_Commit: TOracleQuery;
    oqTMEDIC_Commit: TOracleQuery;
    oqTKART_Commit: TOracleQuery;
    odsTMEDIC: TOracleDataSet;
    odsTEI: TOracleDataSet;
    odsTFARMGR: TOracleDataSet;
    odsTUCHGR: TOracleDataSet;
    odsTMO_GROUP: TOracleDataSet;
    odsAddedParties: TOracleDataSet;
    dsAddedParties: TDataSource;
    Panel1: TPanel;
    bbuStart: TBitBtn;
    bbuExit: TBitBtn;
    bbuSaveToDB: TBitBtn;
    PageControl1: TPageControl;
    tsFarmGr: TTabSheet;
    tsMedics: TTabSheet;
    tsDocs: TTabSheet;
    tsEdIzm: TTabSheet;
    tsUchGr: TTabSheet;
    oqAdd_TPOSTAV: TOracleQuery;
    OpenDialog1: TOpenDialog;
    tsPost: TTabSheet;
    grEdIzm: TcxGrid;
    grEdIzmTableView1: TcxGridTableView;
    grEdIzmTableView1Key: TcxGridColumn;
    grEdIzmTableView1Name: TcxGridColumn;
    grEdIzmTableView1EIID: TcxGridColumn;
    grEdIzmLevel1: TcxGridLevel;
    tsMOGroup: TTabSheet;
    grFarmGr: TcxGrid;
    grFarmGrTableView1: TcxGridTableView;
    key: TcxGridColumn;
    name: TcxGridColumn;
    farmgr_id: TcxGridColumn;
    cxGridLevel3: TcxGridLevel;
    grUchGr: TcxGrid;
    grUchGrTableView: TcxGridTableView;
    grUchGrKey: TcxGridColumn;
    grUchGrName: TcxGridColumn;
    grUchGrUchgrID: TcxGridColumn;
    cxGridLevel4: TcxGridLevel;
    grPostav: TcxGrid;
    grPostavTableView: TcxGridTableView;
    grPostavKey: TcxGridColumn;
    grPostavName: TcxGridColumn;
    grPostavPostavID: TcxGridColumn;
    cxGridLevel5: TcxGridLevel;
    grMO_GROUP: TcxGrid;
    grMO_GROUPTableView: TcxGridTableView;
    grMO_GROUP_Key: TcxGridColumn;
    grMO_GROUP_NAME: TcxGridColumn;
    grMO_GROUP_ID: TcxGridColumn;
    cxGridLevel6: TcxGridLevel;
    Splitter1: TSplitter;
    odsTPostav: TOracleDataSet;
    oqInsTLINK_IMPNAKL: TOracleQuery;
    odsTLINK_IMPNAKL: TOracleDataSet;
    grMEDIC: TcxGrid;
    grMEDICTableView1: TcxGridTableView;
    grMEDICTheirKey: TcxGridColumn;
    grMEDICTorgName: TcxGridColumn;
    grMEDICOurID: TcxGridColumn;
    cxGridLevel2: TcxGridLevel;
    grMEDICUchGr: TcxGridColumn;
    grMEDICFarmGr: TcxGridColumn;
    grMEDICEdIzm: TcxGridColumn;
    grMEDICLatName: TcxGridColumn;
    grMEDICKolInUp: TcxGridColumn;
    odsAddedDocs: TOracleDataSet;
    grParties: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBTableView2FC_NAME: TcxGridDBColumn;
    cxGridDBTableView2FC_UEDIZM: TcxGridDBColumn;
    cxGridDBTableView2FN_KOL: TcxGridDBColumn;
    cxGridDBTableView2FN_PRICE: TcxGridDBColumn;
    cxGridDBTableView2FD_GODEN: TcxGridDBColumn;
    cxGridDBTableView2FC_SERIAL: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView2Column1: TcxGridDBColumn;
    grDocs: TcxGrid;
    grDocsDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridLevel7: TcxGridLevel;
    grDocsDBTableView1Column1: TcxGridDBColumn;
    grDocsDBTableView1Column2: TcxGridDBColumn;
    cxGridDBTableView2Column2: TcxGridDBColumn;
    Button1: TButton;
    ActionList1: TActionList;
    acRefreshDocs: TAction;
    oqClearOst: TOracleQuery;
    tsFinSource: TTabSheet;
    grFinSource: TcxGrid;
    grFinSourceTableView1: TcxGridTableView;
    grFinSourceTheirKey: TcxGridColumn;
    grFinSourceName: TcxGridColumn;
    grFinSourceOurKey: TcxGridColumn;
    cxGridLevel8: TcxGridLevel;
    odsTFinSource: TOracleDataSet;
    odsTPayCond: TOracleDataSet;
    oqAddTFinSource: TOracleQuery;
    tsPayCond: TTabSheet;
    grPayCond: TcxGrid;
    grPayCondTableView: TcxGridTableView;
    grPayCondTheirID: TcxGridColumn;
    grPayCondName: TcxGridColumn;
    grPayCondOurID: TcxGridColumn;
    cxGridLevel9: TcxGridLevel;
    oqAddTPayCond: TOracleQuery;
    oqDelDocs_Dpc_Karts: TOracleQuery;
    odsTProdCert: TOracleDataSet;
    oqTProdCert: TOracleQuery;
    grPostavFC_KONTRAKT_N: TcxGridColumn;
    grPostavFD_KONTRAKT_BEGIN: TcxGridColumn;
    grPostavFD_KONTRAKT_END: TcxGridColumn;
    grPostavFC_ADDRESS: TcxGridColumn;
    grPostavFC_PHONE: TcxGridColumn;
    grPostavFC_R_S: TcxGridColumn;
    grPostavFC_K_S: TcxGridColumn;
    grPostavFC_INN: TcxGridColumn;
    grPostavFC_BIK: TcxGridColumn;
    grPostavFC_OKPO: TcxGridColumn;
    grPostavFC_OKONH: TcxGridColumn;
    grPostavFC_BANK: TcxGridColumn;
    grPostavFC_LICENSE_N: TcxGridColumn;
    grPostavFD_LICENSE: TcxGridColumn;
    tsGroup_LF: TTabSheet;
    grGROUP_LF: TcxGrid;
    grGROUP_LFTableView: TcxGridTableView;
    grGROUP_LFTableViewKey: TcxGridColumn;
    grGROUP_LFTableViewName: TcxGridColumn;
    grGROUP_LFTableViewTheirCode: TcxGridColumn;
    cxGridLevel10: TcxGridLevel;
    oqAdd_TGROUP_LF: TOracleQuery;
    odsTGROUP_LF: TOracleDataSet;
    grMEDICGroup_LF: TcxGridColumn;
    procedure bbuStartClick(Sender: TObject);
    procedure bbuExitClick(Sender: TObject);
    procedure bbuSaveToDBClick(Sender: TObject);
    procedure odsAddedDocsAfterScroll(DataSet: TDataSet);
    procedure odsAddedDocsBeforeOpen(DataSet: TDataSet);
    procedure odsAddedDocsAfterOpen(DataSet: TDataSet);
    procedure acRefreshDocsExecute(Sender: TObject);
  private
    MO_GROUP_APTEKA_ID : integer;
    procedure InsTLINK_IMPNAKL(afn_our_table_num, afk_our_key_field_value,
      afk_post_id, afn_their_table_num, afk_their_key_field_value,
      afc_their_value: variant);
    procedure GetTLINK_IMPNAKL(afk_post_id, afn_their_table_num, afk_their_key_field_value, afn_our_table_num: variant);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  uTLINK_IMPNAKL;
  
procedure TForm1.InsTLINK_IMPNAKL(afn_our_table_num,
  afk_our_key_field_value, afk_post_id, afn_their_table_num,
  afk_their_key_field_value, afc_their_value: variant);
begin
  oqInsTLINK_IMPNAKL.ClearVariables;
  oqInsTLINK_IMPNAKL.SetVariable('pfn_our_table_num', afn_our_table_num);
  oqInsTLINK_IMPNAKL.SetVariable('pfk_our_key_field_value', afk_our_key_field_value);
  oqInsTLINK_IMPNAKL.SetVariable('pfk_post_id', afk_post_id);
  oqInsTLINK_IMPNAKL.SetVariable('pfn_their_table_num', afn_their_table_num);
  oqInsTLINK_IMPNAKL.SetVariable('pfk_their_key_field_value', afk_their_key_field_value);
  oqInsTLINK_IMPNAKL.SetVariable('pfc_their_value', afc_their_value);
  oqInsTLINK_IMPNAKL.Execute;
end;

procedure TForm1.bbuStartClick(Sender: TObject);
var
  s : string;
  FK_ID, RecNum, FK_DOCID, FK_PROIZV_ID, FK_SERT_ID : integer;
  //----------------------------------------------------------------------------
  // ищем или вставляем строчку в таблицу
  // считается что : 1) в датасете ключ называется FK_ID
  //                 2) искомое поле в датасете и переменная в квери назваются одинаково
  function LocateOrIns( aLocateDataSet : TOracleDataSet; aInsQuery : TOracleQuery; const aLocateField, aLocateValue : string; var aFK_ID : Integer ) : Boolean;
  begin
    try
      if (aLocateValue <> '')and(aLocateDataSet.Locate(aLocateField, aLocateValue, [loCaseInsensitive] ))  then
      begin
        aFK_ID := aLocateDataSet.FieldByName('FK_ID').AsInteger;
        Result := True;
      end
      else
      begin
        if aLocateValue <> '' then
        begin
          aInsQuery.SetVariable(aLocateField, aLocateValue);
          aInsQuery.Execute;
          aFK_ID:= aInsQuery.GetVariable('FK_ID');
          aLocateDataSet.Close; aLocateDataSet.Open;
        end;
        Result := False;
      end;
    except
      aFK_ID := -1;  // а вдрух че не так?!
      Result := False;
    end;
  end;
  //----------------------------------------------------------------------------
begin
  OracleSession1.LogOn;
  dmTheirTables.ADOConnection1.Connected := True;

  if dmTheirTables.ADOConnection1.Connected then
  begin
    PageControl1.ActivePage := tsEdIzm;
    odsTEI.Open;
    dmTheirTables.ADOquEI.Active := True;
    dmTheirTables.ADOquEI.First;
    while not dmTheirTables.ADOquEI.Eof do
    begin
      self.Caption := 'Импорт ед. изм.: '+ IntTOStr(dmTheirTables.ADOquEI.RecNo)+' из '+IntTOStr(dmTheirTables.ADOquEI.RecordCount);
      FK_ID := -1;
      s := dmTheirTables.ADOquEI.FieldByName('name').AsString;
      LocateOrIns(odsTEI, oqAdd_TEI, 'fc_name', s, FK_ID);
      if FK_ID >=0 then
      begin
        grEdIzmTableView1.DataController.RecordCount := grEdIzmTableView1.DataController.RecordCount + 1;
        RecNum := grEdIzmTableView1.DataController.RecordCount-1;
        grEdIzmTableView1.DataController.Values[RecNum, grEdIzmTableView1Key.Index]  :=  dmTheirTables.ADOquEI.FieldByName('key').AsInteger;
        grEdIzmTableView1.DataController.Values[RecNum, grEdIzmTableView1Name.Index] :=  s;
        grEdIzmTableView1.DataController.Values[RecNum, grEdIzmTableView1EIID.Index] :=  FK_ID;
        InsTLINK_IMPNAKL(TCO_TEI, FK_ID, SPC_EKATERINBURG, TCT_EKAT_Edizm, dmTheirTables.ADOquEI.FieldByName('key').AsInteger, null);

        Application.ProcessMessages;
      end;
      dmTheirTables.ADOquEI.Next;
    end;
    dmTheirTables.ADOquEI.Active := False;
    odsTEI.Close;
    odsTLINK_IMPNAKL.Close;
    Self.Caption := '';          


    PageControl1.ActivePage := tsFarmGr;
    odsTFARMGR.Open;
    dmTheirTables.ADOquFARMGR.Active := True;
    dmTheirTables.ADOquFARMGR.First;
    while not dmTheirTables.ADOquFARMGR.Eof do
    begin
      self.Caption := 'Импорт фарм. групп: '+ IntTOStr(dmTheirTables.ADOquFARMGR.RecNo)+' из '+IntTOStr(dmTheirTables.ADOquFARMGR.RecordCount);
      FK_ID := -1;
      s := dmTheirTables.ADOquFARMGR.FieldByName('name').AsString;
      LocateOrIns(odsTFARMGR, oqAdd_TFARMGR, 'fc_farmgr', s, FK_ID);
      if FK_ID >=0 then
      begin
        grFarmGrTableView1.DataController.RecordCount := grFarmGrTableView1.DataController.RecordCount + 1;
        RecNum := grFarmGrTableView1.DataController.RecordCount-1;
        grFarmGrTableView1.DataController.Values[RecNum, key.Index]       :=  dmTheirTables.ADOquFARMGR.FieldByName('key').AsInteger;
        grFarmGrTableView1.DataController.Values[RecNum, Name.Index]      :=  s;
        grFarmGrTableView1.DataController.Values[RecNum, farmgr_id.Index] :=  FK_ID;
        InsTLINK_IMPNAKL(TCO_TFARMGR, FK_ID, SPC_EKATERINBURG, TCT_EKAT_PHARMGR, dmTheirTables.ADOquFARMGR.FieldByName('key').AsInteger, null);
        Application.ProcessMessages;
      end;
      dmTheirTables.ADOquFARMGR.Next;
    end;
    dmTheirTables.ADOquFARMGR.Active := False;
    odsTFARMGR.Close;
    odsTLINK_IMPNAKL.Close;
    Self.Caption := '';


    PageControl1.ActivePage := tsUchGr;
    odsTUCHGR.Open;
    dmTheirTables.ADOquUCHGR.Active := True;
    dmTheirTables.ADOquUCHGR.First;
    while not dmTheirTables.ADOquUCHGR.Eof do
    begin
      self.Caption := 'Импорт уч. групп: '+ IntTOStr(dmTheirTables.ADOquUCHGR.RecNo)+' из '+IntTOStr(dmTheirTables.ADOquUCHGR.RecordCount);
      FK_ID := -1;
      s := dmTheirTables.ADOquUCHGR.FieldByName('name').AsString;
      LocateOrIns(odsTUCHGR, oqAdd_TUCHGR, 'fc_uchgr', s, FK_ID);
      if FK_ID >=0 then
      begin
        grUchGrTableView.DataController.RecordCount := grUchGrTableView.DataController.RecordCount + 1;
        RecNum := grUchGrTableView.DataController.RecordCount-1;
        grUchGrTableView.DataController.Values[RecNum, grUchGrkey.Index]  :=  dmTheirTables.ADOquUCHGR.FieldByName('key').AsInteger;
        grUchGrTableView.DataController.Values[RecNum, grUchGrName.Index] :=  s;
        grUchGrTableView.DataController.Values[RecNum, grUchGrUchgrID.Index] :=  FK_ID;
        InsTLINK_IMPNAKL(TCO_TUCHGR, FK_ID, SPC_EKATERINBURG, TCT_EKAT_TypeOfReg, dmTheirTables.ADOquUCHGR.FieldByName('key').AsInteger, null);
        Application.ProcessMessages;
      end;
      dmTheirTables.ADOquUCHGR.Next;
    end;
    dmTheirTables.ADOquUCHGR.Active := False;
    odsTUCHGR.Close;
    odsTLINK_IMPNAKL.Close;
    Self.Caption := '';


    PageControl1.ActivePage := tsGroup_LF;
    odsTGROUP_LF.Open;
    dmTheirTables.ADOquGroups.Active := True;
    dmTheirTables.ADOquGroups.First;
    while not dmTheirTables.ADOquGroups.Eof do
    begin
      self.Caption := 'Импорт групп ЛФ: '+ IntTOStr(dmTheirTables.ADOquGroups.RecNo)+' из '+IntTOStr(dmTheirTables.ADOquGroups.RecordCount);
      FK_ID := -1;
      s := dmTheirTables.ADOquGroups.FieldByName('name').AsString;
      LocateOrIns(odsTGROUP_LF, oqAdd_TGROUP_LF, 'fc_GROUP_LF', s, FK_ID);
      if FK_ID >=0 then
      begin
        grGROUP_LFTableView.DataController.RecordCount := grGROUP_LFTableView.DataController.RecordCount + 1;
        RecNum := grGROUP_LFTableView.DataController.RecordCount-1;
        grGROUP_LFTableView.DataController.Values[RecNum, grGROUP_LFTableViewTheirCode.Index]  :=  dmTheirTables.ADOquGroups.FieldByName('key').AsInteger;
        grGROUP_LFTableView.DataController.Values[RecNum, grGROUP_LFTableViewName.Index] :=  s;
        grGROUP_LFTableView.DataController.Values[RecNum, grUchGrKey.Index] :=  FK_ID;
        InsTLINK_IMPNAKL(TCO_TGROUP_LF, FK_ID, SPC_EKATERINBURG, TCT_EKAT_GROUPS, dmTheirTables.ADOquGroups.FieldByName('key').AsInteger, null);
        Application.ProcessMessages;
      end;
      dmTheirTables.ADOquGroups.Next;
    end;
    dmTheirTables.ADOquGroups.Active := False;
    odsTGROUP_LF.Close;
    odsTLINK_IMPNAKL.Close;
    Self.Caption := '';


    PageControl1.ActivePage := tsPost;
    odsTPostav.Open;
    dmTheirTables.ADOquPOSTAV.Active := True;
    dmTheirTables.ADOquPOSTAV.First;
    while not dmTheirTables.ADOquPOSTAV.Eof do
    begin
      oqAdd_TPOSTAV.ClearVariables;
      self.Caption := 'Импорт поставщиков: '+ IntTOStr(dmTheirTables.ADOquPOSTAV.RecNo)+' из '+IntTOStr(dmTheirTables.ADOquPOSTAV.RecordCount);
      FK_ID := -1;
      s := dmTheirTables.ADOquPOSTAV.FieldByName('name').AsString;
      oqAdd_TPOSTAV.SetVariable('FC_KONTRAKT_N',     dmTheirTables.ADOquPOSTAV.FieldByName('ContractN').AsVariant);
      oqAdd_TPOSTAV.SetVariable('FD_KONTRAKT_BEGIN', dmTheirTables.ADOquPOSTAV.FieldByName('ContractDateBegin').AsVariant);
      oqAdd_TPOSTAV.SetVariable('FD_KONTRAKT_END',   dmTheirTables.ADOquPOSTAV.FieldByName('ContractDateEnd').AsVariant);
      oqAdd_TPOSTAV.SetVariable('FC_ADDRESS',        dmTheirTables.ADOquPOSTAV.FieldByName('Address').AsVariant);
      oqAdd_TPOSTAV.SetVariable('FC_PHONE',          dmTheirTables.ADOquPOSTAV.FieldByName('Phone').AsVariant);
      oqAdd_TPOSTAV.SetVariable('FC_R_S',            dmTheirTables.ADOquPOSTAV.FieldByName('R_S').AsVariant);
      oqAdd_TPOSTAV.SetVariable('FC_K_S',            dmTheirTables.ADOquPOSTAV.FieldByName('K_S').AsVariant);
      oqAdd_TPOSTAV.SetVariable('FC_INN',            dmTheirTables.ADOquPOSTAV.FieldByName('INN').AsVariant);
      oqAdd_TPOSTAV.SetVariable('FC_BIK',            dmTheirTables.ADOquPOSTAV.FieldByName('BIK').AsVariant);
      oqAdd_TPOSTAV.SetVariable('FC_OKPO',           dmTheirTables.ADOquPOSTAV.FieldByName('OKPO').AsVariant);
      oqAdd_TPOSTAV.SetVariable('FC_OKONH',          dmTheirTables.ADOquPOSTAV.FieldByName('OKONH').AsVariant);
      oqAdd_TPOSTAV.SetVariable('FC_BANK',           dmTheirTables.ADOquPOSTAV.FieldByName('BANK').AsVariant);
      oqAdd_TPOSTAV.SetVariable('FC_LICENSE_N',      dmTheirTables.ADOquPOSTAV.FieldByName('LicenseN').AsVariant);
      oqAdd_TPOSTAV.SetVariable('FD_LICENSE',        dmTheirTables.ADOquPOSTAV.FieldByName('LicenseDate').AsVariant);

      LocateOrIns(odsTPostav, oqAdd_TPOSTAV, 'fc_name', s, FK_ID);
      if FK_ID >=0 then
      begin
        grPostavTableView.DataController.RecordCount := grPostavTableView.DataController.RecordCount + 1;
        RecNum := grPostavTableView.DataController.RecordCount-1;
        grPostavTableView.DataController.Values[RecNum, grPostavKey.Index]               :=  dmTheirTables.ADOquPOSTAV.FieldByName('key').AsInteger;
        grPostavTableView.DataController.Values[RecNum, grPostavName.Index]              :=  s;
        grPostavTableView.DataController.Values[RecNum, grPostavFC_KONTRAKT_N.Index]     :=  dmTheirTables.ADOquPOSTAV.FieldByName('ContractN').AsVariant;
        grPostavTableView.DataController.Values[RecNum, grPostavFD_KONTRAKT_BEGIN.Index] :=  dmTheirTables.ADOquPOSTAV.FieldByName('ContractDateBegin').AsVariant;
        grPostavTableView.DataController.Values[RecNum, grPostavFD_KONTRAKT_END.Index]   :=  dmTheirTables.ADOquPOSTAV.FieldByName('ContractDateEnd').AsVariant;
        grPostavTableView.DataController.Values[RecNum, grPostavFC_ADDRESS.Index]        :=  dmTheirTables.ADOquPOSTAV.FieldByName('Address').AsVariant;
        grPostavTableView.DataController.Values[RecNum, grPostavFC_PHONE.Index]          :=  dmTheirTables.ADOquPOSTAV.FieldByName('Phone').AsVariant;
        grPostavTableView.DataController.Values[RecNum, grPostavFC_R_S.Index]            :=  dmTheirTables.ADOquPOSTAV.FieldByName('R_S').AsVariant;
        grPostavTableView.DataController.Values[RecNum, grPostavFC_K_S.Index]            :=  dmTheirTables.ADOquPOSTAV.FieldByName('K_S').AsVariant;
        grPostavTableView.DataController.Values[RecNum, grPostavFC_INN.Index]            :=  dmTheirTables.ADOquPOSTAV.FieldByName('INN').AsVariant;
        grPostavTableView.DataController.Values[RecNum, grPostavFC_BIK.Index]            :=  dmTheirTables.ADOquPOSTAV.FieldByName('BIK').AsVariant;
        grPostavTableView.DataController.Values[RecNum, grPostavFC_OKPO.Index]           :=  dmTheirTables.ADOquPOSTAV.FieldByName('OKPO').AsVariant;
        grPostavTableView.DataController.Values[RecNum, grPostavFC_OKONH.Index]          :=  dmTheirTables.ADOquPOSTAV.FieldByName('OKONH').AsVariant;
        grPostavTableView.DataController.Values[RecNum, grPostavFC_BANK.Index]           :=  dmTheirTables.ADOquPOSTAV.FieldByName('BANK').AsVariant;
        grPostavTableView.DataController.Values[RecNum, grPostavFC_LICENSE_N.Index]      :=  dmTheirTables.ADOquPOSTAV.FieldByName('LicenseN').AsVariant;
        grPostavTableView.DataController.Values[RecNum, grPostavFD_LICENSE.Index]        :=  dmTheirTables.ADOquPOSTAV.FieldByName('LicenseDate').AsVariant;
        grPostavTableView.DataController.Values[RecNum, grPostavPostavID.Index]          :=  FK_ID;
        InsTLINK_IMPNAKL(TCO_TPOSTAV, FK_ID, SPC_EKATERINBURG, TCT_EKAT_Suppliers, dmTheirTables.ADOquPOSTAV.FieldByName('key').AsInteger, null);
        Application.ProcessMessages;
      end;
      dmTheirTables.ADOquPOSTAV.Next;
    end;
    dmTheirTables.ADOquPOSTAV.Active := False;
    odsTPostav.Close;
    odsTLINK_IMPNAKL.Close;
    self.Caption := '';


    PageControl1.ActivePage := tsMOGroup;
    odsTMO_GROUP.Open;
    LocateOrIns(odsTMO_GROUP, oqAdd_TMO_GROUP, 'fc_group', 'АПТЕКА', MO_GROUP_APTEKA_ID);

    dmTheirTables.ADOquMO_GROUP.Active := True;
    dmTheirTables.ADOquMO_GROUP.First;
    while not dmTheirTables.ADOquMO_GROUP.Eof do
    begin
      self.Caption := 'Импорт групп мат. отв.: '+ IntTOStr(dmTheirTables.ADOquMO_GROUP.RecNo)+' из '+IntTOStr(dmTheirTables.ADOquMO_GROUP.RecordCount);    
      FK_ID := -1;
      s := dmTheirTables.ADOquMO_GROUP.FieldByName('name').AsString;
      LocateOrIns(odsTMO_GROUP, oqAdd_TMO_GROUP, 'fc_group', s, FK_ID);
      if FK_ID >=0 then
      begin
        grMO_GROUPTableView.DataController.RecordCount := grMO_GROUPTableView.DataController.RecordCount + 1;
        RecNum := grMO_GROUPTableView.DataController.RecordCount-1;
        grMO_GROUPTableView.DataController.Values[RecNum, grMO_GROUP_Key.Index]  :=  dmTheirTables.ADOquMO_GROUP.FieldByName('key').AsInteger;
        grMO_GROUPTableView.DataController.Values[RecNum, grMO_GROUP_NAME.Index] :=  s;
        grMO_GROUPTableView.DataController.Values[RecNum, grMO_GROUP_ID.Index] :=  FK_ID;
        InsTLINK_IMPNAKL(TCO_TMO_GROUP, FK_ID, SPC_EKATERINBURG, TCT_EKAT_Customers_Dept, dmTheirTables.ADOquMO_GROUP.FieldByName('key').AsInteger, null);
        Application.ProcessMessages;
      end;
      dmTheirTables.ADOquMO_GROUP.Next;
    end;
    dmTheirTables.ADOquMO_GROUP.Active := False;
    odsTMO_GROUP.Close;
    odsTLINK_IMPNAKL.Close;
    self.Caption := '';

    
    PageControl1.ActivePage := tsMedics;
    odsTMEDIC.Open;
    dmTheirTables.ADOquMEDIC.Active := True;
    dmTheirTables.ADOquMEDIC.First;
    grMEDIC.BeginUpdate;
    while not dmTheirTables.ADOquMEDIC.Eof do
    begin
    self.Caption := 'Импорт медикаментов: '+ IntTOStr(dmTheirTables.ADOquMEDIC.RecNo)+' из '+IntTOStr(dmTheirTables.ADOquMEDIC.RecordCount);
      FK_ID := -1;
      s := dmTheirTables.ADOquMEDIC.FieldByName('name').AsString;
      if odsTMEDIC.Locate('FC_NAME', s, []) then
      begin
        FK_ID := odsTMEDIC.FieldByName('medicid').AsInteger;
      end
      else
      begin
        oqAdd_TMEDIC.ClearVariables;
        oqAdd_TMEDIC.SetVariable('fc_name', s);

        GetTLINK_IMPNAKL(SPC_EKATERINBURG, TCT_EKAT_TypeOfReg, dmTheirTables.ADOquMEDIC.FieldByName('UchGrID').AsVariant, TCO_TUCHGR);
        if (odsTLINK_IMPNAKL.Active)and(odsTLINK_IMPNAKL.RecordCount > 0) then
          oqAdd_TMEDIC.SetVariable('uchgrid', odsTLINK_IMPNAKL.FieldByName('fk_our_key_field_value').AsVariant);

        GetTLINK_IMPNAKL(SPC_EKATERINBURG, TCT_EKAT_Edizm, dmTheirTables.ADOquMEDIC.FieldByName('fk_edizm').AsVariant, TCO_TEI);
        if (odsTLINK_IMPNAKL.Active)and(odsTLINK_IMPNAKL.RecordCount > 0) then
          oqAdd_TMEDIC.SetVariable('eiid', odsTLINK_IMPNAKL.FieldByName('fk_our_key_field_value').AsVariant);

        GetTLINK_IMPNAKL(SPC_EKATERINBURG, TCT_EKAT_PHARMGR, dmTheirTables.ADOquMEDIC.FieldByName('PharmGr').AsVariant, TCO_TFARMGR);
        if (odsTLINK_IMPNAKL.Active)and(odsTLINK_IMPNAKL.RecordCount > 0) then
          oqAdd_TMEDIC.SetVariable('farmgrid', odsTLINK_IMPNAKL.FieldByName('fk_our_key_field_value').AsVariant );

        GetTLINK_IMPNAKL(SPC_EKATERINBURG, TCT_EKAT_GROUPS, dmTheirTables.ADOquMEDIC.FieldByName('Group').AsVariant, TCO_TGROUP_LF);
        if (odsTLINK_IMPNAKL.Active)and(odsTLINK_IMPNAKL.RecordCount > 0) then
          oqAdd_TMEDIC.SetVariable('fk_group_lf', odsTLINK_IMPNAKL.FieldByName('fk_our_key_field_value').AsVariant);

//        oqAdd_TMEDIC.SetVariable('fc_eancone',  OstList[i].ImpFields[IMPFIELD_EAN]                  );
//        sMes := ' Столбец: "Кол-во фас. ед. в уп."';
        if VarIsNull(dmTheirTables.ADOquMEDIC.FieldByName('Number').AsVariant) then
          oqAdd_TMEDIC.SetVariable('kolfinu', 1 )
        else
          oqAdd_TMEDIC.SetVariable('kolfinu', dmTheirTables.ADOquMEDIC.FieldByName('Number').AsVariant );

//        oqAdd_TMEDIC.SetVariable('fedizmid',    OstList[i].FK_EDIZM_FAS                             );
//        sMes := ' Столбец: "Масса лек. формы"';
//        oqAdd_TMEDIC.SetVariable('fn_dozka',    StrToFloat(ExcludeNonFloatChars(OstList[i].ImpFields[IMPFIELD_MAS_LEK_F])));
//        oqAdd_TMEDIC.SetVariable('fk_dozkaunit',OstList[i].FK_ED_IZM_LEK_F                          );
        oqAdd_TMEDIC.SetVariable('fc_name_lat', dmTheirTables.ADOquMEDIC.FieldByName('Name_Latin').AsVariant );
        oqAdd_TMEDIC.Execute;
        FK_ID := oqAdd_TMEDIC.GetVariable('FK_ID');

        if FK_ID >=0 then
        begin
          grMEDICTableView1.DataController.RecordCount := grMEDICTableView1.DataController.RecordCount + 1;
          RecNum := grMEDICTableView1.DataController.RecordCount-1;

          grMEDICTableView1.DataController.Values[RecNum, grMEDICTheirKey.Index]  :=  dmTheirTables.ADOquMEDIC.FieldByName('key').AsInteger;
          grMEDICTableView1.DataController.Values[RecNum, grMEDICTorgName.Index]  :=  s;
          grMEDICTableView1.DataController.Values[RecNum, grMEDICOurID.Index]     :=  FK_ID;
          grMEDICTableView1.DataController.Values[RecNum, grMEDICLatName.Index]   :=  oqAdd_TMEDIC.GetVariable('fc_name_lat');
          grMEDICTableView1.DataController.Values[RecNum, grMEDICUchGr.Index]     :=  oqAdd_TMEDIC.GetVariable('uchgrid');
          grMEDICTableView1.DataController.Values[RecNum, grMEDICFarmGr.Index]    :=  oqAdd_TMEDIC.GetVariable('farmgrid');
          grMEDICTableView1.DataController.Values[RecNum, grMEDICEdIzm.Index]     :=  oqAdd_TMEDIC.GetVariable('eiid');
          grMEDICTableView1.DataController.Values[RecNum, grMEDICKolInUp.Index]   :=  oqAdd_TMEDIC.GetVariable('kolfinu');
          grMEDICTableView1.DataController.Values[RecNum, grMEDICGroup_LF.Index]  :=  oqAdd_TMEDIC.GetVariable('fk_group_lf');


          InsTLINK_IMPNAKL(TCO_TMEDIC, FK_ID, SPC_EKATERINBURG, TCT_EKAT_Medication, dmTheirTables.ADOquMEDIC.FieldByName('key').AsInteger, null);
          Application.ProcessMessages;
//          grMEDICTableView1.DataController.GotoNext;
        end;
      end;
      dmTheirTables.ADOquMEDIC.Next;
    end;
    grMEDIC.EndUpdate;    
    dmTheirTables.ADOquMEDIC.Active := False;
    odsTMEDIC.Close;
    odsTLINK_IMPNAKL.Close;
    self.Caption := '';


    PageControl1.ActivePage := tsFinSource;
    odsTFinSource.Open;
    dmTheirTables.ADOquFinSource.Active := True;
    dmTheirTables.ADOquFinSource.First;
    while not dmTheirTables.ADOquFinSource.Eof do
    begin
      self.Caption := 'Импорт источников финансирования: '+ IntTOStr(dmTheirTables.ADOquFinSource.RecNo)+' из '+IntTOStr(dmTheirTables.ADOquFinSource.RecordCount);
      FK_ID := -1;
      s := dmTheirTables.ADOquFinSource.FieldByName('name').AsString;
      LocateOrIns(odsTFinSource, oqAddTFinSource, 'fc_name', s, FK_ID);
      if FK_ID >=0 then
      begin
        grFinSourceTableView1.DataController.RecordCount := grFinSourceTableView1.DataController.RecordCount + 1;
        RecNum := grFinSourceTableView1.DataController.RecordCount-1;
        grFinSourceTableView1.DataController.Values[RecNum, grFinSourceTheirKey.Index]  :=  dmTheirTables.ADOquFinSource.FieldByName('key').AsInteger;
        grFinSourceTableView1.DataController.Values[RecNum, grFinSourceName.Index] :=  s;
        grFinSourceTableView1.DataController.Values[RecNum, grFinSourceOurKey.Index] :=  FK_ID;
        InsTLINK_IMPNAKL(TCO_TFINSOURCE, FK_ID, SPC_EKATERINBURG, TCT_EKAT_FINSOURCE, dmTheirTables.ADOquFinSource.FieldByName('key').AsInteger, null);
        Application.ProcessMessages;
      end;
      dmTheirTables.ADOquFinSource.Next;
    end;
    dmTheirTables.ADOquFinSource.Active := False;
    odsTFinSource.Close;
    odsTLINK_IMPNAKL.Close;
    self.Caption := '';


    PageControl1.ActivePage := tsPayCond;
    odsTPayCond.Open;
    dmTheirTables.ADOquPaymentCond.Active := True;
    dmTheirTables.ADOquPaymentCond.First;
    while not dmTheirTables.ADOquPaymentCond.Eof do
    begin
      self.Caption := 'Импорт условий оплаты: '+ IntTOStr(dmTheirTables.ADOquPaymentCond.RecNo)+' из '+IntTOStr(dmTheirTables.ADOquPaymentCond.RecordCount);
      FK_ID := -1;
      s := dmTheirTables.ADOquPaymentCond.FieldByName('name').AsString;
      LocateOrIns(odsTPayCond, oqAddTPayCond, 'fc_name', s, FK_ID);
      if FK_ID >=0 then
      begin
        grPayCondTableView.DataController.RecordCount := grPayCondTableView.DataController.RecordCount + 1;
        RecNum := grPayCondTableView.DataController.RecordCount-1;
        grPayCondTableView.DataController.Values[RecNum, grPayCondTheirID.Index]  :=  dmTheirTables.ADOquPaymentCond.FieldByName('key').AsInteger;
        grPayCondTableView.DataController.Values[RecNum, grPayCondName.Index] :=  s;
        grPayCondTableView.DataController.Values[RecNum, grPayCondOurID.Index] :=  FK_ID;
        InsTLINK_IMPNAKL(TCO_TPAYCOND, FK_ID, SPC_EKATERINBURG, TCT_EKAT_PAYMENTCOND, dmTheirTables.ADOquPaymentCond.FieldByName('key').AsInteger, null);
        Application.ProcessMessages;
      end;
      dmTheirTables.ADOquPaymentCond.Next;
    end;
    dmTheirTables.ADOquPaymentCond.Active := False;
    odsTPayCond.Close;
    odsTLINK_IMPNAKL.Close;
    self.Caption := '';

    OracleSession1.Commit;

    FK_PROIZV_ID := -1;
    odsTProdCert.SetVariable('PISCERT', 0);
    odsTProdCert.Open;
    oqTProdCert.SetVariable('fn_parent', 0);
    LocateOrIns(odsTProdCert, oqTProdCert, 'fc_name', 'Не указан', FK_PROIZV_ID);
    odsTProdCert.Close;
    oqTProdCert.SetVariable('fn_parent', FK_PROIZV_ID);

    // для поиска сертификатов
    odsTProdCert.SetVariable('PISCERT', 1);
    odsTProdCert.Open;

    PageControl1.ActivePage := tsDocs;
    if Application.MessageBox('Удалить уже имеющиеся документы и партии?', 'ПОДТВЕРЖДЕНИЕ', MB_YESNO+MB_ICONQUESTION)=IDYES then
      oqDelDocs_Dpc_Karts.Execute;
    dmTheirTables.ADOquDOCS_IN.Active := True;
    dmTheirTables.ADOquDOCS_IN.First;
    while not dmTheirTables.ADOquDOCS_IN.Eof do
    begin
      self.Caption := 'Импорт прих. документов: '+ IntTOStr(dmTheirTables.ADOquDOCS_IN.RecNo)+' из '+IntTOStr(dmTheirTables.ADOquDOCS_IN.RecordCount);
      try
        oqAdd_TDOCS.ClearVariables;
        oqAdd_TDOCS.SetVariable('PFD_DATA', dmTheirTables.ADOquDOCS_IN.FieldByName('Date').AsVariant);
        oqAdd_TDOCS.SetVariable('PFC_DOC',  dmTheirTables.ADOquDOCS_IN.FieldByName('InvoiceN').AsVariant);
        oqAdd_TDOCS.SetVariable('PFP_VID',  1);
        oqAdd_TDOCS.SetVariable('PFP_VIDMOVE', 1);

        GetTLINK_IMPNAKL(SPC_EKATERINBURG, TCT_EKAT_Suppliers, dmTheirTables.ADOquDOCS_IN.FieldByName('Supplier').AsVariant, TCO_TPOSTAV);
        if (odsTLINK_IMPNAKL.Active)and(odsTLINK_IMPNAKL.RecordCount > 0) then
          oqAdd_TDOCS.SetVariable('ppostavid', odsTLINK_IMPNAKL.FieldByName('fk_our_key_field_value').AsVariant);

        GetTLINK_IMPNAKL(SPC_EKATERINBURG, TCT_EKAT_FINSOURCE, dmTheirTables.ADOquDOCS_IN.FieldByName('FinSourceKey').AsVariant, TCO_TFINSOURCE);
        if (odsTLINK_IMPNAKL.Active)and(odsTLINK_IMPNAKL.RecordCount > 0) then
          oqAdd_TDOCS.SetVariable('pFK_FINSOURCE_ID', odsTLINK_IMPNAKL.FieldByName('fk_our_key_field_value').AsVariant);

        GetTLINK_IMPNAKL(SPC_EKATERINBURG, TCT_EKAT_PAYMENTCOND, dmTheirTables.ADOquDOCS_IN.FieldByName('PayCondKey').AsVariant, TCO_TPAYCOND);
        if (odsTLINK_IMPNAKL.Active)and(odsTLINK_IMPNAKL.RecordCount > 0) then
          oqAdd_TDOCS.SetVariable('pFK_PAYCOND_ID', odsTLINK_IMPNAKL.FieldByName('fk_our_key_field_value').AsVariant);

        oqAdd_TDOCS.SetVariable('PFK_MOGROUPID', MO_GROUP_APTEKA_ID);
        oqAdd_TDOCS.SetVariable('PFK_MOGROUPID_TO', MO_GROUP_APTEKA_ID);
        oqAdd_TDOCS.SetVariable('PMOFROMID', SPC_EKATERINBURG);        

        oqAdd_TDOCS.SetVariable('PFC_KONTRAKT', dmTheirTables.ADOquDOCS_IN.FieldByName('Tender').AsVariant); // !!!! че сюда положить??
        oqAdd_TDOCS.SetVariable('PFC_COMMENT', null); // !!!! че сюда положить??

        oqAdd_TDOCS.Execute;
      except
        Application.MessageBox(pANSIChar('Возникла ошибка при создании приходного документа №'+dmTheirTables.ADOquDOCS_IN.FieldByName('InvoiceN').AsString+' дата: '+dmTheirTables.ADOquDOCS_IN.FieldByName('Date').AsString+' (DOCID = '+dmTheirTables.ADOquDOCS_IN.FieldByName('Key').Asstring+')'), 'ОШИБКА', MB_OK+MB_ICONERROR);
        Exit;
      end;
      FK_DOCID := oqAdd_TDOCS.GetVariable('FK_ID');
      InsTLINK_IMPNAKL(TCO_TDOCS, FK_DOCID, SPC_EKATERINBURG, TCT_EKAT_StoreIn, dmTheirTables.ADOquDOCS_IN.FieldByName('key').AsInteger, null);

//      :FK_ID, PFC_COMMENT
//       StoreIn.Key, StoreIn.Date, StoreIn.InvoiceN, StoreIn.Supplier, StoreIn.PayCondKey, StoreIn.FinSourceKey, StoreIn.DateOfPayment, StoreIn.Tender
      dmTheirTables.ADOquDOC_IN_ITEMS.Close;
      dmTheirTables.ADOquDOC_IN_ITEMS.Parameters.ParamValues['pStoreInKey'] := dmTheirTables.ADOquDOCS_IN.FieldByName('key').AsVariant;
      dmTheirTables.ADOquDOC_IN_ITEMS.Open;
      dmTheirTables.ADOquDOC_IN_ITEMS.First;

      while not dmTheirTables.ADOquDOC_IN_ITEMS.Eof do
      begin
        try
  //        :PMEDICID, :PFC_SERIAL, :PFD_GODEN_DO, :PFN_PRICE, :PFN_KOL, :PFK_PRS_PARTY_SERTIFIKAT, :PFK_DOCID, :PDPCID
          oqAdd_TKART_TDPC.ClearVariables;
          oqAdd_TKART_TDPC.SetVariable('PFK_DOCID', FK_DOCID);

          GetTLINK_IMPNAKL(SPC_EKATERINBURG, TCT_EKAT_Medication, dmTheirTables.ADOquDOC_IN_ITEMS.FieldByName('MedicationKey').AsVariant, TCO_TMEDIC);
          if (odsTLINK_IMPNAKL.Active)and(odsTLINK_IMPNAKL.RecordCount > 0) then
            oqAdd_TKART_TDPC.SetVariable('PMEDICID',       odsTLINK_IMPNAKL.FieldByName('fk_our_key_field_value').AsVariant);

  //        StoreInSub.Key, StoreInSub.StoreInKey, StoreInSub.MedicationKey, StoreInSub.Series, StoreInSub.DateDeadline, StoreInSub.Certificate, StoreInSub.Quantity, StoreInSub.Price
          oqAdd_TKART_TDPC.SetVariable('PFC_SERIAL',       dmTheirTables.ADOquDOC_IN_ITEMS.FieldByName('Series').AsVariant);
          oqAdd_TKART_TDPC.SetVariable('PFD_GODEN_DO',     dmTheirTables.ADOquDOC_IN_ITEMS.FieldByName('DateDeadline').AsVariant);
          oqAdd_TKART_TDPC.SetVariable('PFN_PRICE',        dmTheirTables.ADOquDOC_IN_ITEMS.FieldByName('Price').AsVariant);
          oqAdd_TKART_TDPC.SetVariable('PFN_KOL',          dmTheirTables.ADOquDOC_IN_ITEMS.FieldByName('Quantity').AsVariant);

          FK_SERT_ID := -1; // поиск сертификата
          LocateOrIns(odsTProdCert, oqTProdCert, 'fc_name', dmTheirTables.ADOquDOC_IN_ITEMS.FieldByName('Certificate').AsString, FK_SERT_ID);
          oqAdd_TKART_TDPC.SetVariable('pFN_PRODCERTID',   FK_SERT_ID);

          oqAdd_TKART_TDPC.SetVariable('pFK_FINSOURCE_ID', oqAdd_TDOCS.GetVariable('pFK_FINSOURCE_ID'));
          oqAdd_TKART_TDPC.Execute;
          
          FK_ID := oqAdd_TKART_TDPC.GetVariable('pDPCID');
          InsTLINK_IMPNAKL(TCO_TDPC, FK_ID, SPC_EKATERINBURG, TCT_EKAT_StoreInSub, dmTheirTables.ADOquDOC_IN_ITEMS.FieldByName('key').AsInteger, null);
          InsTLINK_IMPNAKL(TCO_TKART, oqAdd_TKART_TDPC.GetVariable('pFK_KartID'), SPC_EKATERINBURG, TCT_EKAT_StoreInSub, dmTheirTables.ADOquDOC_IN_ITEMS.FieldByName('key').AsInteger, null);
//          :pFK_KartID
  //        oqAdd_TKART_TDPC.SetVariable('PFK_PRS_PARTY_SERTIFIKAT', FK_DOCID); !!!! добавить сертификат
        except
          Application.MessageBox(pANSIChar('Возникла ошибка при создании добавлении в приходный документ №'+dmTheirTables.ADOquDOCS_IN.FieldByName('InvoiceN').AsString+
                                           ' дата: '+dmTheirTables.ADOquDOCS_IN.FieldByName('Date').AsString+' (DOCID = '+dmTheirTables.ADOquDOCS_IN.FieldByName('Key').Asstring+')'#13#10+
                                           'Медикамент: '+dmTheirTables.ADOquDOC_IN_ITEMS.FieldByName('FC_MEDIC_NAME').Asstring+' (DOCITEMID = '+dmTheirTables.ADOquDOC_IN_ITEMS.FieldByName('Key').Asstring+')' ), 'ОШИБКА', MB_OK+MB_ICONERROR);
          Exit;                                           
        end;
        Application.ProcessMessages;
        dmTheirTables.ADOquDOC_IN_ITEMS.Next;
      end;
      oqUpdateTDOCS_FN_PRICE.SetVariable('DPID', FK_DOCID);
      oqUpdateTDOCS_FN_PRICE.Execute;
      dmTheirTables.ADOquDOCS_IN.Next;
    end;
    odsTProdCert.Close;    
    self.Caption := '';

    OracleSession1.commit;
        
//    bbuSaveToDBClick(nil);
//    odsAddedDocs.Close;
//    odsAddedDocs.Open;   


    PageControl1.ActivePage := tsDocs;
    dmTheirTables.ADOquDOCS_OUT_DEBTS.Active := True;
    dmTheirTables.ADOquDOCS_OUT_DEBTS.First;
    while not dmTheirTables.ADOquDOCS_OUT_DEBTS.Eof do
    begin
      self.Caption := 'Импорт расх. документов (в отделения): '+ IntTOStr(dmTheirTables.ADOquDOCS_OUT_DEBTS.RecNo)+' из '+IntTOStr(dmTheirTables.ADOquDOCS_OUT_DEBTS.RecordCount);
      try
        oqAdd_TDOCS.ClearVariables;
        oqAdd_TDOCS.SetVariable('PFD_DATA', dmTheirTables.ADOquDOCS_OUT_DEBTS.FieldByName('Date').AsVariant);
        oqAdd_TDOCS.SetVariable('PFC_DOC',  dmTheirTables.ADOquDOCS_OUT_DEBTS.FieldByName('InvoiceN').AsVariant);
        oqAdd_TDOCS.SetVariable('PFP_VID',  2);
        oqAdd_TDOCS.SetVariable('PFP_VIDMOVE', 2);

        GetTLINK_IMPNAKL(SPC_EKATERINBURG, TCT_EKAT_Customers_Dept, dmTheirTables.ADOquDOCS_OUT_DEBTS.FieldByName('DeptKey').AsVariant, TCO_TMO_GROUP);
        if (odsTLINK_IMPNAKL.Active)and(odsTLINK_IMPNAKL.RecordCount > 0) then
          oqAdd_TDOCS.SetVariable('PFK_MOGROUPID_TO', odsTLINK_IMPNAKL.FieldByName('fk_our_key_field_value').AsVariant);

        oqAdd_TDOCS.SetVariable('PFK_MOGROUPID', MO_GROUP_APTEKA_ID);
        oqAdd_TDOCS.SetVariable('PFK_MOGROUPID_FROM', MO_GROUP_APTEKA_ID);
        oqAdd_TDOCS.SetVariable('PMOFROMID', SPC_EKATERINBURG);

        oqAdd_TDOCS.SetVariable('PFC_COMMENT', 'Через: '+dmTheirTables.ADOquDOCS_OUT_DEBTS.FieldByName('MOL').AsVariant);
        oqAdd_TDOCS.Execute;
      except
        Application.MessageBox(pANSIChar('Возникла ошибка при создании приходного документа №'+dmTheirTables.ADOquDOCS_OUT_DEBTS.FieldByName('InvoiceN').AsString+' дата: '+dmTheirTables.ADOquDOCS_OUT_DEBTS.FieldByName('Date').AsString+' (DOCID = '+dmTheirTables.ADOquDOCS_OUT_DEBTS.FieldByName('Key').Asstring+')'), 'ОШИБКА', MB_OK+MB_ICONERROR);
        Exit;
      end;
      FK_DOCID := oqAdd_TDOCS.GetVariable('FK_ID');
      InsTLINK_IMPNAKL(TCO_TDOCS, FK_DOCID, SPC_EKATERINBURG, TCT_EKAT_StoreOutDebts, dmTheirTables.ADOquDOCS_OUT_DEBTS.FieldByName('key').AsInteger, null);

      dmTheirTables.ADOquDOC_OUT_DEBTS_ITEMS.Close;
      dmTheirTables.ADOquDOC_OUT_DEBTS_ITEMS.Parameters.ParamValues['pStoreOutDeptKey'] := dmTheirTables.ADOquDOCS_OUT_DEBTS.FieldByName('key').AsVariant;
      dmTheirTables.ADOquDOC_OUT_DEBTS_ITEMS.Open;
      dmTheirTables.ADOquDOC_OUT_DEBTS_ITEMS.First;
      while not dmTheirTables.ADOquDOC_OUT_DEBTS_ITEMS.Eof do
      begin
        try
          oqAdd_TKART_TDPC.ClearVariables;
          oqAdd_TKART_TDPC.SetVariable('PFK_DOCID', FK_DOCID);

          GetTLINK_IMPNAKL(SPC_EKATERINBURG, TCT_EKAT_StoreInSub, dmTheirTables.ADOquDOC_OUT_DEBTS_ITEMS.FieldByName('StoreInSubKey').AsVariant, TCO_TKART);
          if (odsTLINK_IMPNAKL.Active)and(odsTLINK_IMPNAKL.RecordCount > 0) then
            oqAdd_TKART_TDPC.SetVariable('pFK_KartID', odsTLINK_IMPNAKL.FieldByName('fk_our_key_field_value').AsVariant);

          oqAdd_TKART_TDPC.SetVariable('PFN_KOL',      dmTheirTables.ADOquDOC_OUT_DEBTS_ITEMS.FieldByName('Quantity').AsVariant);
          oqAdd_TKART_TDPC.Execute;
          FK_ID := oqAdd_TKART_TDPC.GetVariable('pDPCID');
          InsTLINK_IMPNAKL(TCO_TDPC, FK_ID, SPC_EKATERINBURG, TCT_EKAT_StoreOutSub, dmTheirTables.ADOquDOC_OUT_DEBTS_ITEMS.FieldByName('key').AsInteger, null);
        except
          Application.MessageBox(pANSIChar('Возникла ошибка при создании добавлении в расходный документ №'+dmTheirTables.ADOquDOC_OUT_DEBTS_ITEMS.FieldByName('InvoiceN').AsString+
                                           ' дата: '+dmTheirTables.ADOquDOC_OUT_DEBTS_ITEMS.FieldByName('Date').AsString+' (DOCID = '+dmTheirTables.ADOquDOC_OUT_DEBTS_ITEMS.FieldByName('Key').Asstring+')'#13#10+
                                           'Медикамент: '+dmTheirTables.ADOquDOC_OUT_DEBTS_ITEMS.FieldByName('FC_MEDIC_NAME').Asstring+' (DOCITEMID = '+dmTheirTables.ADOquDOC_OUT_DEBTS_ITEMS.FieldByName('Key').Asstring+')' ), 'ОШИБКА', MB_OK+MB_ICONERROR);
          Exit;
        end;
        Application.ProcessMessages;
        dmTheirTables.ADOquDOC_OUT_DEBTS_ITEMS.Next;
      end;
      oqUpdateTDOCS_FN_PRICE.SetVariable('DPID', FK_DOCID);
      oqUpdateTDOCS_FN_PRICE.Execute;
      dmTheirTables.ADOquDOCS_OUT_DEBTS.Next;
    end;
    self.Caption := '';


    OracleSession1.commit;


    PageControl1.ActivePage := tsDocs;
    dmTheirTables.ADOquDOCS_OUT_CUST.Active := True;
    dmTheirTables.ADOquDOCS_OUT_CUST.First;
    while not dmTheirTables.ADOquDOCS_OUT_CUST.Eof do
    begin
      self.Caption := 'Импорт расх. документов (отпуск на сторону): '+ IntTOStr(dmTheirTables.ADOquDOCS_OUT_CUST.RecNo)+' из '+IntTOStr(dmTheirTables.ADOquDOCS_OUT_CUST.RecordCount);
      try
        oqAdd_TDOCS.ClearVariables;
        oqAdd_TDOCS.SetVariable('PFD_DATA', dmTheirTables.ADOquDOCS_OUT_CUST.FieldByName('Date').AsVariant);
        oqAdd_TDOCS.SetVariable('PFC_DOC',  dmTheirTables.ADOquDOCS_OUT_CUST.FieldByName('InvoiceN').AsVariant);
        oqAdd_TDOCS.SetVariable('PFP_VID',  3);
        oqAdd_TDOCS.SetVariable('PFP_VIDMOVE', 8);

        oqAdd_TDOCS.SetVariable('PFK_MOGROUPID', MO_GROUP_APTEKA_ID);
        oqAdd_TDOCS.SetVariable('PFK_MOGROUPID_FROM', MO_GROUP_APTEKA_ID);
        oqAdd_TDOCS.SetVariable('PMOFROMID', SPC_EKATERINBURG);

        oqAdd_TDOCS.SetVariable('PFC_COMMENT', dmTheirTables.ADOquDOCS_OUT_CUST.FieldByName('FC_CustName').AsVariant + ', через: '+dmTheirTables.ADOquDOCS_OUT_CUST.FieldByName('MOL').AsVariant+', доверенность: '+dmTheirTables.ADOquDOCS_OUT_CUST.FieldByName('MOL2').AsVariant  );
        oqAdd_TDOCS.Execute;
      except
        Application.MessageBox(pANSIChar('Возникла ошибка при создании приходного документа №'+dmTheirTables.ADOquDOCS_OUT_CUST.FieldByName('InvoiceN').AsString+' дата: '+dmTheirTables.ADOquDOCS_OUT_CUST.FieldByName('Date').AsString+' (DOCID = '+dmTheirTables.ADOquDOCS_OUT_CUST.FieldByName('Key').Asstring+')'), 'ОШИБКА', MB_OK+MB_ICONERROR);
        Exit;
      end;
      FK_DOCID := oqAdd_TDOCS.GetVariable('FK_ID');
      InsTLINK_IMPNAKL(TCO_TDOCS, FK_DOCID, SPC_EKATERINBURG, TCT_EKAT_StoreOutCust, dmTheirTables.ADOquDOCS_OUT_CUST.FieldByName('key').AsInteger, null);
      

      dmTheirTables.ADOquDOC_OUT_CUST_ITEMS.Close;
      dmTheirTables.ADOquDOC_OUT_CUST_ITEMS.Parameters.ParamValues['pStoreOutCustKey'] := dmTheirTables.ADOquDOCS_OUT_CUST.FieldByName('key').AsVariant;
      dmTheirTables.ADOquDOC_OUT_CUST_ITEMS.Open;
      dmTheirTables.ADOquDOC_OUT_CUST_ITEMS.First;
      while not dmTheirTables.ADOquDOC_OUT_CUST_ITEMS.Eof do
      begin
        try
          oqAdd_TKART_TDPC.ClearVariables;
          oqAdd_TKART_TDPC.SetVariable('PFK_DOCID', FK_DOCID);

          GetTLINK_IMPNAKL(SPC_EKATERINBURG, TCT_EKAT_StoreInSub, dmTheirTables.ADOquDOC_OUT_CUST_ITEMS.FieldByName('StoreInSubKey').AsVariant, TCO_TKART);
          if (odsTLINK_IMPNAKL.Active)and(odsTLINK_IMPNAKL.RecordCount > 0) then
            oqAdd_TKART_TDPC.SetVariable('pFK_KartID', odsTLINK_IMPNAKL.FieldByName('fk_our_key_field_value').AsVariant);

          oqAdd_TKART_TDPC.SetVariable('PFN_KOL',      dmTheirTables.ADOquDOC_OUT_CUST_ITEMS.FieldByName('Quantity').AsVariant);
          oqAdd_TKART_TDPC.Execute;
          FK_ID := oqAdd_TKART_TDPC.GetVariable('pDPCID');
          InsTLINK_IMPNAKL(TCO_TDPC, FK_ID, SPC_EKATERINBURG, TCT_EKAT_StoreOutSub, dmTheirTables.ADOquDOC_OUT_CUST_ITEMS.FieldByName('key').AsInteger, null);
        except
          Application.MessageBox(pANSIChar('Возникла ошибка при создании добавлении в расходный документ №'+dmTheirTables.ADOquDOC_OUT_CUST_ITEMS.FieldByName('InvoiceN').AsString+
                                           ' дата: '+dmTheirTables.ADOquDOC_OUT_CUST_ITEMS.FieldByName('Date').AsString+' (DOCID = '+dmTheirTables.ADOquDOC_OUT_CUST_ITEMS.FieldByName('Key').Asstring+')'#13#10+
                                           'Медикамент: '+dmTheirTables.ADOquDOC_OUT_CUST_ITEMS.FieldByName('FC_MEDIC_NAME').Asstring+' (DOCITEMID = '+dmTheirTables.ADOquDOC_OUT_CUST_ITEMS.FieldByName('Key').Asstring+')' ), 'ОШИБКА', MB_OK+MB_ICONERROR);
          Exit;                                           
        end;
        Application.ProcessMessages;
        dmTheirTables.ADOquDOC_OUT_CUST_ITEMS.Next;
      end;
      oqUpdateTDOCS_FN_PRICE.SetVariable('DPID', FK_DOCID);
      oqUpdateTDOCS_FN_PRICE.Execute;
      dmTheirTables.ADOquDOCS_OUT_CUST.Next;
    end;
    self.Caption := '';

    // чистим мелкие несхождения остатков
    oqClearOst.SetVariable('PAPTEKAID', MO_GROUP_APTEKA_ID);
    oqClearOst.Execute;
    
    acRefreshDocs.Execute;

    bbuSaveToDB.Enabled := True;
    bbuStart.Enabled := False;

    OracleSession1.commit;

        
    Application.MessageBox('Импорт прошел успешно. Не забудьте сохранить в БД полученные данные.', 'Импорт', MB_OK+MB_ICONINFORMATION);
  end;
end;

procedure TForm1.bbuExitClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.GetTLINK_IMPNAKL(afk_post_id, afn_their_table_num, afk_their_key_field_value, afn_our_table_num: variant);
begin
  odsTLINK_IMPNAKL.Close;
  odsTLINK_IMPNAKL.SetVariable('pfk_post_id', afk_post_id );
  odsTLINK_IMPNAKL.SetVariable('pfn_their_table_num', afn_their_table_num);
  odsTLINK_IMPNAKL.SetVariable('pfk_their_key_field_value', afk_their_key_field_value);
  odsTLINK_IMPNAKL.SetVariable('pfn_our_table_num', afn_our_table_num);
  odsTLINK_IMPNAKL.Open;
end;

procedure TForm1.bbuSaveToDBClick(Sender: TObject);
begin
  OracleSession1.Commit;
end;

procedure TForm1.odsAddedDocsAfterScroll(DataSet: TDataSet);
begin
  odsAddedParties.Close;
  odsAddedParties.SetVariable('PDPID', odsAddedDocs.FieldByName('DPID').AsVariant);
  odsAddedParties.Open;
end;

procedure TForm1.odsAddedDocsBeforeOpen(DataSet: TDataSet);
begin
  odsAddedDocs.AfterScroll := nil;
end;

procedure TForm1.odsAddedDocsAfterOpen(DataSet: TDataSet);
begin
  odsAddedDocs.AfterScroll := odsAddedDocsAfterScroll;
  odsAddedDocsAfterScroll( DataSet );
end;

procedure TForm1.acRefreshDocsExecute(Sender: TObject);
begin
  odsAddedDocs.Close;
  odsAddedDocs.Open;
end;

end.
