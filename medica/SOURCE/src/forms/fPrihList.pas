unit fPrihList;

interface

uses
  Windows,Messages,SysUtils,Classes,Graphics,Controls,Forms,Dialogs,ComCtrls,
  ToolWin,Db, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxCalendar, cxTextEdit, cxCurrencyEdit,
  cxDBLookupComboBox, cxSpinEdit, Menus, JvComponentBase, JvFormPlacement,
  Oracle, FR_Class, FR_DSet, FR_DBSet, ActnList, OracleData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, StdCtrls, HtmlHlp, ExtCtrls, Mask,
  JvExMask, JvToolEdit, JvMaskEdit, JvCheckedMaskEdit, JvDatePickerEdit,
  JvExControls, JvArrowButton, cxCheckBox, cxContainer, cxMaskEdit,
  cxDropDownEdit, frxClass, frxDBSet, dxSkinsCore, dxSkinBlack,
  dxSkinOffice2007Green, dxSkinscxPCPainter, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue;

type
  TfrmPrihList = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    dsSelDoc: TDataSource;
    odsPostav: TOracleDataSet;
    al: TActionList;
    esc: TAction;
    ins: TAction;
    del: TAction;
    edit: TAction;
    odsSelDocPrih: TOracleDataSet;
    ToolButton6: TToolButton;
    refresh: TAction;
    tbuAdd: TToolButton;
    ToolButton9: TToolButton;
    ToolButton2: TToolButton;
    ToolButton13: TToolButton;
    sbSum: TStatusBar;
    tbuPrint: TToolButton;
    ToolButton4: TToolButton;
    odsNakl: TOracleDataSet;
    frDBdsNakl: TfrDBDataSet;
    frNakl: TfrReport;
    Action1: TAction;
    oq: TOracleQuery;
    FormStorage: TJvFormStorage;
    pmAdd: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    acInsOst: TAction;
    odsOstAct: TOracleDataSet;
    frOstAct: TfrReport;
    acPrintNakl: TAction;
    tbuSign: TToolButton;
    acSign: TAction;
    ToolButton5: TToolButton;
    frLittleKart: TfrReport;
    frDBDataSet: TfrDBDataSet;
    odsMedKart: TOracleDataSet;
    pmPrint: TPopupMenu;
    miNakl: TMenuItem;
    acPrintLittleKart: TAction;
    miLittleKart: TMenuItem;
    cxDBgPrihList: TcxGrid;
    cxDBgPrihListLevel1: TcxGridLevel;
    cxDBgPrihListDBTableView1: TcxGridDBTableView;
    cxDBgPrihListDBTableView1FD_DATA: TcxGridDBColumn;
    cxDBgPrihListDBTableView1FC_DOCMIX: TcxGridDBColumn;
    cxDBgPrihListDBTableView1FN_PRICE: TcxGridDBColumn;
    cxDBgPrihListDBTableView1FC_NAME: TcxGridDBColumn;
    cxDBgPrihListDBTableView1FC_COMMENT: TcxGridDBColumn;
    cxDBgPrihListDBTableView1FC_DOC: TcxGridDBColumn;
    cxDBgPrihListDBTableView1POD: TcxGridDBColumn;
    cxDBgPrihListDBTableView1FC_MOGROUPID_FROM: TcxGridDBColumn;
    acGodMode: TAction;
    odsKart: TOracleDataSet;
    dsKart: TDataSource;
    Splitter1: TSplitter;
    cxDBgPrihKart: TcxGrid;
    cxDBgPrihKartDBTableView1: TcxGridDBTableView;
    cxDBgPrihKartDBTableView1ROWNUM: TcxGridDBColumn;
    cxDBgPrihKartDBTableView1NAMEKART: TcxGridDBColumn;
    cxDBgPrihKartDBTableView1FN_PARTY_NUM: TcxGridDBColumn;
    cxDBgPrihKartDBTableView1FC_SERIAL: TcxGridDBColumn;
    cxDBgPrihKartDBTableView1lkeiname: TcxGridDBColumn;
    cxDBgPrihKartDBTableView1FN_KOL: TcxGridDBColumn;
    cxDBgPrihKartDBTableView1FN_PRICE: TcxGridDBColumn;
    cxDBgPrihKartDBTableView1FN_SUMM: TcxGridDBColumn;
    cxDBgPrihKartLevel1: TcxGridLevel;
    Panel1: TPanel;
    abuSetDocPeriod: TJvArrowButton;
    pmDocsFilterPeriod: TPopupMenu;
    N19: TMenuItem;
    N14: TMenuItem;
    N20: TMenuItem;
    N18: TMenuItem;
    N16: TMenuItem;
    N21: TMenuItem;
    N17: TMenuItem;
    N15: TMenuItem;
    tbuDel: TToolButton;
    frReturnRep: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    frDBdsInvoice: TfrDBDataSet;
    odsInvoice2: TOracleDataSet;
    frInvoice2: TfrReport;
    acPrnInvoice: TAction;
    cxDBgPrihListDBTableView1FC_DOCNAME: TcxGridDBColumn;
    frReport1: TfrReport;
    tbuTreb: TToolButton;
    acTreb: TAction;
    frReport2: TfrReport;
    cxDBgPrihListDBTableView1FD_INVOICE: TcxGridDBColumn;
    odsDocFromReserv: TOracleDataSet;
    acFromRezerv: TAction;
    miRezervSeparator: TMenuItem;
    miFromRezerv: TMenuItem;
    Panel2: TPanel;
    dedDate1: TcxDateEdit;
    dedDate2: TcxDateEdit;
    chbDate1: TcxCheckBox;
    chbDate2: TcxCheckBox;
    ToolButton3: TToolButton;
    cxDBgPrihListDBTableView1DPID: TcxGridDBColumn;
    cxDBgPrihKartDBTableView1KARTID: TcxGridDBColumn;
    cxDBgPrihKartDBTableView1MEDICID: TcxGridDBColumn;
    cxDBgPrihKartDBTableView1FD_GODEN: TcxGridDBColumn;
    pmTrebSklad: TPopupMenu;
    cxDBgPrihListDBTableView1FK_VID_POST: TcxGridDBColumn;
    cxDBgPrihListDBTableView1FC_KONTRAKT: TcxGridDBColumn;
    cxDBgPrihListDBTableView1FC_SCHET_FAKTURA: TcxGridDBColumn;
    acImpNakl: TAction;
    miImpNakl: TMenuItem;
    miImpNaklSeparator: TMenuItem;
    cxDBgPrihListDBTableView1FK_FINSOURCE_ID: TcxGridDBColumn;
    cxDBgPrihListDBTableView1FK_PAYCOND_ID: TcxGridDBColumn;
    cxDBgPrihKartDBTableView1FK_FINSOURCE_ID: TcxGridDBColumn;
    cxDBgPrihKartDBTableView1fc_inv_nomer: TcxGridDBColumn;
    cxDBgPrihKartDBTableView1FC_QUOTA_CODE: TcxGridDBColumn;
    cxDBgPrihKartDBTableView1FN_NDS: TcxGridDBColumn;
    cxDBgPrihKartDBTableView1FN_PRICE_MNF: TcxGridDBColumn;
    cxDBgPrihKartDBTableView1FN_NACENKA: TcxGridDBColumn;
    cxDBgPrihKartDBTableView1FL_JNVLS: TcxGridDBColumn;
    pmTrebNaklV2: TPopupMenu;
    MenuItem1: TMenuItem;
    miNaklPeriod: TMenuItem;
    acPrintNaklsInPeriod: TAction;
    odsNaklsInPeriod: TOracleDataSet;
    frNaklsInPeriod: TfrReport;
    pmPrintTrebNakl: TPopupMenu;
    N29: TMenuItem;
    miPrintTrebWithDetail: TMenuItem;
    cxDBgPrihKartDBTableView1FC_PRODUCER: TcxGridDBColumn;
    cxDBgPrihKartDBTableView1FL_MIBP: TcxGridDBColumn;
    frDBdsFinsource_in_Doc: TfrDBDataSet;
    frxNakl: TfrxReport;
    frxdsNakl: TfrxDBDataset;
    frxdsSelDocPrih: TfrxDBDataset;
    frxOstAct: TfrxReport;
    frxdsOstAct: TfrxDBDataset;
    frxLittleKart: TfrxReport;
    frxdsMedKart: TfrxDBDataset;
    cxDBgPrihKartDBTableView1FC_INTERNATIONAL_NAME: TcxGridDBColumn;
    cxDBgPrihKartDBTableView1FL_FORMULAR: TcxGridDBColumn;
    miNaklM4: TMenuItem;
    acPrintNaklM4: TAction;
    miLittleKart1: TMenuItem;
    acPrintLittleKart1: TAction;
    frxLittleKart1: TfrxReport;
    TEST: TfrxReport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure escExecute(Sender: TObject);
    procedure insExecute(Sender: TObject);
    procedure delExecute(Sender: TObject);
    procedure editExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure refreshExecute(Sender: TObject);
    procedure delUpdate(Sender: TObject);
//    procedure dxDBgPrihListColumnSorting(Sender: TObject;
//      Column: TdxDBTreeListColumn; var Allow: Boolean);
//    procedure dxDBgPrihListCompare(Sender: TObject; Node1,
//      Node2: TdxTreeListNode; var Compare: Integer);
    procedure Action1Execute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
    procedure acInsOstExecute(Sender: TObject);
    procedure acPrintNaklExecute(Sender: TObject);
    procedure acSignExecute(Sender: TObject);
    procedure odsSelDocPrihAfterOpen(DataSet: TDataSet);
    procedure tbuPrintClick(Sender: TObject);
    procedure acPrintLittleKartExecute(Sender: TObject);
    procedure cxDBgPrihListDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure tbuAddClick(Sender: TObject);
    procedure acGodModeExecute(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure acPrnInvoiceExecute(Sender: TObject);
    procedure acTrebExecute(Sender: TObject);
    procedure frInvoice2GetValue(const ParName: String;
      var ParValue: Variant);
    procedure acFromRezervExecute(Sender: TObject);
    procedure odsSelDocPrihBeforeOpen(DataSet: TDataSet);
    procedure chbDate1Click(Sender: TObject);
    procedure chbDate2Click(Sender: TObject);
    procedure dedDate1PropertiesEditValueChanged(Sender: TObject);
    procedure dedDate1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dedDate1PropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxDBgPrihListDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure acImpNaklExecute(Sender: TObject);
    procedure cxDBgPrihListDBTableView1DblClick(Sender: TObject);
    procedure cxDBgPrihListDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure MenuItem1Click(Sender: TObject);
    procedure acPrintNaklsInPeriodExecute(Sender: TObject);
    procedure frNaklGetValue(const ParName: string; var ParValue: Variant);
    procedure miPrintTrebWithDetailClick(Sender: TObject);
    procedure cxDBgPrihKartDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure frxNaklGetValue(const VarName: string; var Value: Variant);
    procedure acPrintLittleKart1Execute(Sender: TObject);
  private
    FGodMode : Boolean;
    FNotRefresh : Boolean; // фильтр установлен при выборе из списка
    FL_UNSIGN_RIGHT : boolean; // право отменять подпись
  public
    idDocs: Integer;   //  код текущего документа
    procedure MnLg_ev ( const p_strs : ansistring;
                        const p_filename : ansistring = '_prihlist.err';
                        const p_is_delim : Boolean = False;
                        const p_is_DT : boolean = True );
  end;
procedure DoShowPrihList;

const c_is_debug = True;  // вывод отладки в файл

var
  frmPrihList: TfrmPrihList;

implementation

{$R *.DFM}

uses fmainform, fFIONakl, fTrebLst, fMoveEdit,
     DateUtils, fFioZav, fdmPrintReports, FR_View, FR_Utils, FR_Const, fdmMain,
     fLinkedDocs, fdmPrintSelect, fImportNakl;

// процедура записи в лог-файл
procedure TfrmPrihList.MnLg_ev ( const p_strs : ansistring;
                  const p_filename : ansistring = '_prihlist.err';
                  const p_is_delim : Boolean = False;
                  const p_is_DT : boolean = True );
var F : TextFile; v_is_ex : Boolean;
const c_delim = '-------------------------------------------------------------------------------';
  procedure wrt_err(p_str:ansistring);
  begin
    try
        AssignFile(F, p_filename+IntToStr(GetTickCount)+'_err');
        rewrite(F);
        writeln(F,DateTimeToStr(Now)+' '+p_str);
        Flush(F);
        CloseFile(F);
      except
      end;
  end;
begin
  if c_is_debug then  
  try
    if Trim(p_filename)<>'' then begin
      v_is_ex:=FileExists(p_filename);
      AssignFile(F, p_filename);
      try
        try
          if v_is_ex then
          begin
            Append(F);
          end else
          begin
            rewrite(F);
          end;
          if p_is_delim then writeln(F,c_delim);
          if p_is_DT then
            writeln(F,DateTimeToStr(Now)+' '+p_strs)
          else
            writeln(F,p_strs);
          Flush(F);
        except
          on E:Exception do
            wrt_err(DateTimeToStr(Now)+' ERROR (append/rewrite): '+E.Message+#13+
                 ' original message : '+p_strs);
        end;
      finally
        try
          CloseFile(F);
        except
          on E:Exception do
            wrt_err(DateTimeToStr(Now)+' ERROR (CloseFile) : '+E.Message+#13+
                 ' original message : '+p_strs);
        end;
      end;
    end;
  except
    on E:Exception do
      wrt_err(DateTimeToStr(Now)+' ERROR (summary): '+E.Message+#13+
                 ' original message : '+p_strs);
  end;   
end;

//procedure DoSetEditDoc;
//var id: integer;
//begin

//oqUpdDoc.Sql.Text
//update tdocs set fl_edit=0
//where dpid=:adpid


//  id := frmPrihList.odsSelDocPrihDPID.AsInteger;
//  frmPrihList.oqUpdDoc.SetVariable('adpid',
//    frmPrihList.odsSelDocPrihDPID.AsInteger);
//  frmPrihList.oqUpdDoc.Execute;
//  dmMain.os.Commit;
//  frmPrihList.odsSelDocPrih.refresh;
//  frmPrihList.odsSelDocPrih.Locate('dpid', id, []);
//end;

//****************************************************************************************
//                                 DoShowPrihDoc
//****************************************************************************************

procedure DoShowPrihList;
begin
  if not frmMain.RestoreMDI_Window('frmPrihList') then
  begin
    frmPrihList := TfrmPrihList.Create(Application);
//    frmPrihList.Show;
    frmPrihList.FormStyle := fsMDIChild;
  end;

//    Application.CreateForm(TfrmPrihList, frmPrihList);
//  frmMain.CreateChild(TfrmPrihList, frmPrihList);
end;

//******************************************************************************
//                                 FormClose
//******************************************************************************
procedure TfrmPrihList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // проверки на валидность дат
  dedDate1.PostEditValue;
  dedDate2.PostEditValue;  

  FormStorage.AppStorage.Flush;
  IniWriteString( iniFileName, Self.Name, 'dpeDate1Checked',  BoolToStr(chbDate1.Checked, True) );  // сохраняем  булеан в виде слов
  IniWriteString( iniFileName, Self.Name, 'dpeDate2Checked',  BoolToStr(chbDate2.Checked, True) );
  IniWriteString( iniFileName, Self.Name, 'dpeDate1Date',     DateToStr(TRUNC(dedDate1.EditValue))   );
  IniWriteString( iniFileName, Self.Name, 'dpeDate2Date',     DateToStr(TRUNC(dedDate2.EditValue))   );
//  cxDBgPrihListDBTableView1.StoreToRegistry('\SoftWare\SoftMaster\Medica\'+Self.Name, False, [gsoUseFilter]);
  cxDBgPrihListDBTableView1.StoreToIniFile(iniFileName, False, [gsoUseFilter]);

  frmMain.tbPrih.ImageIndex := 51;
  Action := caFree;
end;

// Закрыть
procedure TfrmPrihList.escExecute(Sender: TObject);
begin
  Close;
end;

// Добавить
procedure TfrmPrihList.insExecute(Sender: TObject);
begin
  idDocs := -1;
  try
    dmmain.ncomment := 'добавление';
    Screen.Cursor := crSQLWait;
    dmMain.os.Savepoint('prihAdd');
    if DoShowMoveEdit(idDocs, True, 1, 1) = mrOk then
    begin
      odsSelDocPrih.Close;
      odsSelDocPrih.Open;
      odsSelDocPrih.Locate('dpid', idDocs, []);
  //      dmMain.pkgkl.SetPostavid(frmprihEdit.odsPostav.fieldbyname('postavid').asinteger);
      del.Enabled := true;
      edit.Enabled := true;
      dmMain.os.Commit;
//      cxDBgPrihListDBTableView1.ApplyBestFit(nil);
      if MessageBoxEx(Application.MainForm.Handle, PChar('Распечатать стеллажные карточки для данного прихода?'),PChar('Подтверждение'), MB_YESNO + MB_ICONQUESTION + MB_APPLMODAL ,$0419 {Russian}) = ID_YES then
        acPrintLittleKart.Execute;
    end
    else
      try
        dmMain.os.RollbackToSavepoint('prihAdd');
      except
      end;  
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrihList.MenuItem1Click(Sender: TObject);
begin
  dmPrintReports.PRINT_TREB_NAKL_V2_FNAME := 'frxTrebNakl_v2.fr3';
  dmPrintSelect.PrintFlag := 2;
  dmPrintReports.PrintTreb(odsSelDocPrih.FieldByName('DPID').AsInteger,
                           odsSelDocPrih.FieldByName('FC_DOC').AsString,
                           odsSelDocPrih.FieldByName('FD_INVOICE').AsDateTime,
                           odsSelDocPrih.FieldByName('FC_MOGROUPID_FROM').AsString,
                           odsSelDocPrih.FieldByName('FC_MOGROUPID_TO').AsString,
                           odsSelDocPrih.FieldByName('FC_DOCMIX').AsString+'.xls',
                           odsSelDocPrih.FieldByName('NAMEFROM').AsString,
                           odsSelDocPrih.FieldByName('NAMETO').AsString,
                           (dmMain.ConfigParams.GetParamValue('FUNC_IS_PRINT_TREB_NAKL_ABSENT_MEDICS', False)),
                           fdmMain.nvl(odsSelDocPrih.FieldByName('mogr_from_FK_SKLAD_ID').AsInteger,-1));
  dmPrintSelect.PrintFlag := 0;                           
  dmPrintReports.PRINT_TREB_NAKL_V2_FNAME := '';                           
end;

procedure TfrmPrihList.miPrintTrebWithDetailClick(Sender: TObject);
begin
  dmPrintReports.PrintTreb( odsSelDocPrih.FieldByName('DPID').AsInteger,
                            odsSelDocPrih.FieldByName('FC_DOC').AsString,
                            odsSelDocPrih.FieldByName('FD_INVOICE').AsDateTime,
                            odsSelDocPrih.FieldByName('FC_MOGROUPID_FROM').AsString,
                            odsSelDocPrih.FieldByName('FC_MOGROUPID_TO').AsString,
                            odsSelDocPrih.FieldByName('FC_DOCMIX').AsString+'.xls',
                            odsSelDocPrih.FieldByName('NAMEFROM').AsString,
                            odsSelDocPrih.FieldByName('NAMETO').AsString,
                           (dmMain.ConfigParams.GetParamValue('FUNC_IS_PRINT_TREB_NAKL_ABSENT_MEDICS', False)),
                            fdmMain.nvl(odsSelDocPrih.FieldByName('mogr_from_fk_sklad_id').AsInteger,-1),
                            -1, //TrebID
                            true //aIsPrintDecode
                          );
end;

//------------------------------------------------------------------------------
// Ввести остатки
//------------------------------------------------------------------------------
procedure TfrmPrihList.acInsOstExecute(Sender: TObject);
begin
{	Application.CreateForm(TfrmActOstEdit, frmActOstEdit);
	frmActOstEdit.thisformcalledfrom_frmMedKartLst:=false;
}  try
    dmmain.ncomment := 'Ввод остатков';
    Screen.Cursor := crSQLWait;
    dmMain.os.Savepoint('PrihAddOst');
    // Добавим шаблон акта ввода остатка документа
{    idDocs := dmMain.PkgPrihRash.Createshablon(1, 9);

    frmActOstEdit.idDocs := idDocs;

    dDate := ServerDate(dmMain.os);
    frmActOstEdit.deInvoiceDate.Date := Trunc(dDate);
    frmActOstEdit.deRegistrDate.Date := Trunc(dDate);
    frmActOstEdit.deRegistrTime.Time := dDate - trunc(dDate);
    frmActOstEdit.lcbActMaker.KeyValue := dmMain.pkgMedses.GetCurMo;
    frmActOstEdit.lcbMO_GROUP_TO.KeyValue := dmMain.pkgMedses.GET_CUR_MOGROUP_BY_CUR_MO;
//    frmPrihEdit.bEnableEdit := True;
    frmActOstEdit.HelpContext:=24;

    if frmActOstEdit.ShowModal = mrOk then
    begin
      // Обновим приходной документ
      dmMain.PkgPrihRash.DoSet(
              dmMain.PkgPrihRash.Getsumdoc(idDocs, 1),
              frmActOstEdit.mComment.text,
              frmActOstEdit.eNumDoc.text,
              frmActOstEdit.deInvoiceDate.Date,
              frmActOstEdit.deRegistrDate.Date + frmActOstEdit.deRegistrTime.Time - trunc(frmActOstEdit.deRegistrTime.Time),
              frmActOstEdit.odsActMaker.fieldbyname('moid').AsInteger,
              nvl(frmActOstEdit.lcbMO_GROUP_TO.KeyValue, -1),
              idDocs,
              dmMain.pkgMedses.GETCURMO, // поставщик
              dmMain.pkgMedses.GET_CUR_MOGROUP_BY_CUR_MO,
              1); }
        idDocs := -1;
        if DoShowMoveEdit(idDocs, True, 1, 9) = mrOk then
        begin
          odsSelDocPrih.Close;
          odsSelDocPrih.Open;
          odsSelDocPrih.Locate('dpid', idDocs, []);
          del.Enabled := true;
          edit.Enabled := true;
          dmMain.os.Commit;
//          cxDBgPrihListDBTableView1.ApplyBestFit(nil);
          if (frmMain.ProvisorState = 1)and (Application.MessageBox(PChar('Распечатать стеллажные карточки для данного прихода?'),PChar('Подтверждение'), MB_YESNO + MB_ICONQUESTION + MB_APPLMODAL) = ID_YES) then
            acPrintLittleKart.Execute;
          if Application.MessageBox(PChar('Распечатать этот акт ввода остатков?'),PChar('Подтверждение'), MB_YESNO + MB_ICONQUESTION + MB_APPLMODAL) = ID_YES then acPrintNakl.Execute;

//        end  // if frmMoveEdit.ShowModal = mrok then
//        else dmMain.os.Rollback;

{
//      odsSelDocPrih.refresh;
      odsSelDocPrih.Close;
      odsSelDocPrih.Open;
      odsSelDocPrih.Locate('dpid', idDocs, []);
//      dmMain.pkgkl.SetPostavid(frmprihEdit.odsPostav.fieldbyname('postavid').asinteger);
      del.Enabled := true;
      edit.Enabled := true;
      dmMain.os.Commit;
      cxDBgPrihListDBTableView1.ApplyBestFit(nil);

      if MessageBoxEx(Application.MainForm.Handle, PChar('Распечатать стеллажные карточки для медикаментов данного прихода?'),PChar('Подтверждение'), MB_YESNO + MB_ICONQUESTION + MB_APPLMODAL ,$0419 ) = ID_YES then
        acPrintLittleKart.Execute;}
    end
    else
      try
        dmMain.os.RollbackToSavepoint('PrihAddOst');
      except
      end;

  finally
    Screen.Cursor := crDefault;
//    if frmActOstEdit.IsNeedPrint then acPrintNakl.Execute;
//    frmActOstEdit.free;
  end;
end;
//------------------------------------------------------------------------------
// Удалить
procedure TfrmPrihList.delExecute(Sender: TObject);
begin
  if (trunc(odsSelDocPrih.FieldByName('DATA').AsDateTime) <= trunc(dateclose)) and (not FGodMode) then
  begin
    windows.MessageBox(Self.Handle, PChar('Удаление не возможно!' + #10#13 +
      'Период закрыт (' + FormatDateTime('dd.mm.yyyy',DateClose) + ')'), 'Предупреждение', MB_OK);
    exit;
  end;

  if (odsSelDocPrih.FieldByName('FL_EDIT').AsInteger = 0) and (not FGodMode) then
  begin
    windows.MessageBox(Self.Handle, PChar('Удаление невозможно!' + #10#13 +
      'Документ подписан.'), 'Предупреждение', MB_OK);
    exit;
  end;

//  if int(odsSelDocPrihDATA.AsDateTime) <= int(dateclose) then exit;
  dmmain.ncomment := 'удаление';
  if Windows.MessageBox(Self.Handle,
    PChar('Вы действительно хотите удалить данную запись ?'), 'Предупреждение',
		MB_YESNO + MB_ICONQUESTION + mb_defbutton2) = mrYes then
  begin
//    dmMain.PkgPrihRash.dodel(odsSelDocPrih.fieldbyname('dpid').asinteger);
    if (odsSelDocPrih.FieldByName('FP_VID').AsInteger = VID_DVIJENIE) then  // движения нельзя валить полностью !!!!
      dmMain.PkgPrihRash.dodel(odsSelDocPrih.fieldbyname('dpid').AsInteger) // для возврата из резерва нельзя удалять партии!!!
    else
      dmMain.PkgPrihRash.doDel_DOC_DPC_Kart(odsSelDocPrih.fieldbyname('dpid').asinteger);

    dmMain.os.Commit;

//    odsSelDocPrih.refresh;
    odsSelDocPrih.Close;
    odsSelDocPrih.Open;
    if odsSelDocPrih.RecordCount <= 0 then
    begin
      del.Enabled := false;
      edit.Enabled := false;
    end;
  end;
end;

// Изменить
procedure TfrmPrihList.editExecute(Sender: TObject);
var
  IsCanEdit : Boolean;
//	str : String;
//	postavid, Vidmove:integer;

begin
  idDocs := odsSelDocPrih.fieldbyname('DPID').AsInteger;
  try
    dmmain.ncomment := 'изменение прихода';
    Screen.Cursor := crSQLWait;
    dmMain.os.Savepoint('PrihEdit');
    if odsSelDocPrih.fieldbyname('FP_VIDMOVE').AsInteger = VIDMOVE_NAKL_TREB then
      IsCanEdit := (odsSelDocPrih.FieldByName('FL_EDIT').AsInteger = 1)and(frmMain.ProvisorState = 1)
    else
      IsCanEdit := (odsSelDocPrih.FieldByName('FL_EDIT').AsInteger = 1);
    if DoShowMoveEdit(idDocs, IsCanEdit, odsSelDocPrih.fieldbyname('FP_VID').AsInteger, odsSelDocPrih.fieldbyname('FP_VIDMOVE').AsInteger) = mrOk then
    begin
      odsSelDocPrih.Close;
      odsSelDocPrih.Open;
      odsSelDocPrih.Locate('dpid', idDocs, []);
  //      dmMain.pkgkl.SetPostavid(frmprihEdit.odsPostav.fieldbyname('postavid').asinteger);
      del.Enabled := true;
      edit.Enabled := true;
      dmMain.os.Commit;
//      cxDBgPrihListDBTableView1.ApplyBestFit(nil);
      if MessageBoxEx(Application.MainForm.Handle, PChar('Распечатать стеллажные карточки для данного прихода?'),PChar('Подтверждение'), MB_YESNO + MB_ICONQUESTION + MB_APPLMODAL ,$0419 {Russian}) = ID_YES then
        acPrintLittleKart.Execute;
    end
    else
      try
        dmMain.os.RollbackToSavepoint('PrihEdit');
      except
      end;
  finally
    Screen.Cursor := crDefault;
  end;

{  dmmain.ncomment := 'изменение';
  Screen.Cursor := crSQLWait;

  Vidmove := odsSelDocPrih.fieldbyname('FP_VIDMOVE').AsInteger;
  case  Vidmove of
    9:  // акт ввода остатков
    begin
      dmMain.os.Savepoint('ActOst');
      Application.CreateForm(TfrmActOstEdit, frmActOstEdit);
      frmActOstEdit.thisformcalledfrom_frmMedKartLst:=false;
      frmActOstEdit.odskart.SetVariable('adpid', odsSelDocPrih.fieldbyname('dpid').asinteger);
//      frmActOstEdit.odskart.refresh;
      frmActOstEdit.odskart.Close;
      frmActOstEdit.odskart.Open;
      idDocs := odsSelDocPrih.fieldbyname('dpid').asinteger;
      frmActOstEdit.idDocs := idDocs;
            frmActOstEdit.cePriceDoc.Value := odsSelDocPrih.FieldByName('FN_PRICE').AsFloat;
//            postavid := -1;//round(dmMain.pkgPOSTAV.GETPRODUCEPOSTAV);
//            if postavid=odsSelDocPrih.fieldbyname('idpostav').asinteger then
//                    Begin // Отдел РПО
//                            frmActOstEdit.odsPostav.SQL.Text:='SELECT POSTAVID, FC_NAME, FC_BOSSDOLG, FC_BOSSFIO FROM TPOSTAV WHERE FL_DEL = 0';
//                            frmActOstEdit.LCBPostav.enabled:=false;
//                    end
//            else
//                    Begin // Не отдел РПО
//                            frmActOstEdit.odsPostav.SQL.Text:='SELECT POSTAVID, FC_NAME, FC_BOSSDOLG, FC_BOSSFIO FROM TPOSTAV WHERE FL_DEL = 0 AND POSTAVID<>PKGTPOSTAV.GET_PRODUCE_POSTAV';
//                            frmActOstEdit.LCBPostav.enabled:=true;
//                    end;

      frmActOstEdit.lcbActMaker.KeyValue := odsSelDocPrih.fieldbyname('motoid').asinteger;
      frmActOstEdit.lcbMO_GROUP_TO.KeyValue := odsSelDocPrih.fieldbyname('FK_MOGROUPID_TO').AsInteger;
      frmActOstEdit.deRegistrDate.Date := odsSelDocPrih.fieldbyname('data').asdatetime;
      frmActOstEdit.deRegistrTime.Time := odsSelDocPrih.fieldbyname('fd_data').asdatetime -
        trunc(odsSelDocPrih.fieldbyname('fd_data').asdatetime);
      frmActOstEdit.eNumDoc.Text := odsSelDocPrih.fieldbyname('fc_doc').asstring;
      frmActOstEdit.deInvoiceDate.Date := odsSelDocPrih.fieldbyname('fd_invoice').AsDateTime;

      frmActOstEdit.mComment.Text := odsSelDocPrih.fieldbyname('fc_comment').asstring;

      // Документ дата документа находится в закрытом периоде или документ подписан
      if (odsSelDocPrih.FieldByName('FD_DATA').AsDateTime <= dateclose)or(odsSelDocPrih.FieldByName('FL_EDIT').AsInteger = 0) then
      begin
        frmActOstEdit.eNumDoc.Enabled := false;
        frmActOstEdit.deInvoiceDate.Enabled := frmActOstEdit.eNumDoc.Enabled;
        frmActOstEdit.deRegistrDate.Enabled := false;
        frmActOstEdit.deRegistrTime.Enabled := false;
//        frmActOstEdit.LCBpostav.Enabled := false;
        frmActOstEdit.lcbActMaker.Enabled := false;
        frmActOstEdit.lcbMO_GROUP_TO.Enabled := False;
        frmActOstEdit.mComment.Enabled := false;
        frmActOstEdit.bEnableEdit := False;
        frmActOstEdit.acedit.Enabled := false;
//        frmActOstEdit.cxGridPrihKart.OnDblClick := nil;
        frmActOstEdit.cxGridPrihKartDBTableView1.OnDblClick := nil;
//        frmActOstEdit.dxDBgprihKart.OnDblClick := nil;
        frmActOstEdit.btnEdit.Enabled := false;
      end;

      frmActOstEdit.HelpContext:=25;

      if frmActOstEdit.ShowModal = mrOk then
      begin
        // Добавляем приходной документ
        dmMain.PkgPrihRash.DoSet( dmMain.PkgPrihRash.Getsumdoc(idDocs, 1),
                                  frmActOstEdit.mComment.text,
                                  frmActOstEdit.eNumDoc.text,
                                  frmActOstEdit.deInvoiceDate.Date,
                                  frmActOstEdit.deRegistrDate.Date + frmActOstEdit.deRegistrTime.Time - trunc(frmActOstEdit.deRegistrTime.Time),
                                  frmActOstEdit.odsActMaker.fieldbyname('moid').AsInteger,
                                  nvl(frmActOstEdit.lcbMO_GROUP_TO.KeyValue, 0),
                                  idDocs,
                                  -1,
                                  0,
                                  1);
//        odsSelDocPrih.refresh;
        odsSelDocPrih.Close;
        odsSelDocPrih.Open;
        odsSelDocPrih.Locate('dpid', idDocs, []);
    //    dmMain.pkgkl.SetPostavid(frmprihEdit.odsPostav.fieldbyname('postavid').asinteger);
        dmMain.os.Commit;
        if frmActOstEdit.IsNeedPrint then acPrintNakl.Execute;
// Убиарем за ненадобностью. Воронов О.А. 15.06.2007
//        if frmActOstEdit.datechange then
//        begin
//          str := 'Будет произведен пересчет остатков за период c %s по %s . Суммы в расходных документах будут изменены! Продолжить?';
//          str := Format(str, [DateToStr(dateclose), DateToStr(date)]);
//          if windows.MessageBoxEx(Self.Handle, PChar(str), 'Предупреждение', MB_YESNO + MB_ICONQUESTION,$0419 ) = mrYes then
//          begin
//            oq.SetVariable('adpid', idDocs);
//            oq.SetVariable('adata1', dateclose + 1);
//            oq.SetVariable('adata2', date + time + 14);
//            Screen.Cursor := crSQLWait;
//            oq.Execute;
//            screen.Cursor := crDefault;
//            dmMain.os.Commit;
//          end;
//        end;
        cxDBgPrihListDBTableView1.ApplyBestFit(nil);
      end
      else dmMain.os.RollbackToSavepoint('ActOst');
    end;

    else
    begin
      dmMain.os.Savepoint('prih');
            Application.CreateForm(TfrmPrihEdit, frmPrihEdit);
            frmPrihEdit.thisformcalledfrom_frmMedKartLst:=false;
      frmPrihEdit.odskart.SetVariable('adpid', odsSelDocPrih.fieldbyname('dpid').asinteger);

//      frmPrihEdit.odskart.refresh;
      frmPrihEdit.odskart.Close;
      frmPrihEdit.odskart.Open;
      idDocs := odsSelDocPrih.fieldbyname('dpid').asinteger;
      frmPrihEdit.idDocs := idDocs;
            frmPrihEdit.cePriceDoc.Value := odsSelDocPrih.FieldByName('FN_PRICE').AsFloat;
            postavid := round(dmMain.pkgPOSTAV.GETPRODUCEPOSTAV);
            frmPrihEdit.odsPostav.Close;
            if postavid=odsSelDocPrih.fieldbyname('idpostav').asinteger then
                    Begin // Отдел РПО
                            frmPrihEdit.odsPostav.SQL.Text:='SELECT POSTAVID, FC_NAME, FC_BOSSDOLG, FC_BOSSFIO FROM MED.TPOSTAV WHERE FL_DEL = 0';
                            frmPrihEdit.LCBPostav.enabled:=false;
                    end
            else
                    Begin // Не отдел РПО
                            frmPrihEdit.odsPostav.SQL.Text:='SELECT POSTAVID, FC_NAME, FC_BOSSDOLG, FC_BOSSFIO FROM MED.TPOSTAV WHERE FL_DEL = 0 AND POSTAVID<>MED.PKGTPOSTAV.GET_PRODUCE_POSTAV';
                            frmPrihEdit.LCBPostav.enabled:=true;
                    end;
            frmPrihEdit.odsPostav.Open;

      frmPrihEdit.LCBPostav.KeyValue := odsSelDocPrih.fieldbyname('idpostav').asinteger;
//      frmPrihEdit.LCBNameto.KeyValue := odsSelDocPrih.fieldbyname('motoid').asinteger;
      frmPrihEdit.lcbMO_GROUP_TO.KeyValue := odsSelDocPrih.fieldbyname('FK_MOGROUPID_TO').AsInteger;
      frmPrihEdit.deRegistrDate.Date := odsSelDocPrih.fieldbyname('data').asdatetime;
      frmPrihEdit.deRegistrTime.Time := odsSelDocPrih.fieldbyname('fd_data').asdatetime -
        trunc(odsSelDocPrih.fieldbyname('fd_data').asdatetime);
      frmPrihEdit.eNumDoc.Text := odsSelDocPrih.fieldbyname('fc_doc').asstring;
      frmPrihEdit.deInvoiceDate.Date := odsSelDocPrih.fieldbyname('fd_invoice').AsDateTime;

      frmPrihEdit.mComment.Text := odsSelDocPrih.fieldbyname('fc_comment').asstring;
      // Документ дата документа находится в закрытом периоде или документ подписан
      if (odsSelDocPrih.FieldByName('FD_DATA').AsDateTime <= dateclose)or(odsSelDocPrih.FieldByName('FL_EDIT').AsInteger = 0) then
      begin
        frmPrihEdit.eNumDoc.Enabled := false;
        frmPrihEdit.deInvoiceDate.Enabled := frmPrihEdit.eNumDoc.Enabled;
        frmPrihEdit.deRegistrDate.Enabled := false;
        frmPrihEdit.deRegistrTime.Enabled := false;
        frmPrihEdit.LCBpostav.Enabled := false;
//        frmPrihEdit.LCBnameTo.Enabled := false;
        frmPrihEdit.lcbMO_GROUP_TO.Enabled := False;
        frmPrihEdit.mComment.Enabled := false;
        frmPrihEdit.bEnableEdit := False;
        frmPrihEdit.acedit.Enabled := false;
        frmPrihEdit.cxDBgPrihKartDBTableView1.OnDblClick := nil;
        frmPrihEdit.btnEdit.Enabled := false;
            end;

            frmPrihEdit.HelpContext:=25;
	
            if frmPrihEdit.ShowModal = mrOk then
      begin
        // Добавляем приходной документ
        dmMain.PkgPrihRash.DoSet(
                dmMain.PkgPrihRash.Getsumdoc(idDocs, 1),
                frmprihEdit.mComment.text,
                frmprihEdit.eNumDoc.text,
                frmprihEdit.deInvoiceDate.Date,
                frmprihEdit.deRegistrDate.Date + frmPrihEdit.deRegistrTime.Time - trunc(frmPrihEdit.deRegistrTime.Time),
                -1, //frmprihEdit.odsNametoPrih.fieldbyname('moid').AsInteger,
                nvl(frmprihEdit.lcbMO_GROUP_TO.KeyValue, 0),
                idDocs,
                frmprihEdit.odsPostav.fieldbyname('postavid').asinteger,
                0,
                1
            );
//        odsSelDocPrih.refresh;
        odsSelDocPrih.Close;
        odsSelDocPrih.Open;
        odsSelDocPrih.Locate('dpid', idDocs, []);
    //    dmMain.pkgkl.SetPostavid(frmprihEdit.odsPostav.fieldbyname('postavid').asinteger);
        dmMain.os.Commit;
// Убиарем за ненадобностью. Воронов О.А. 15.06.2007        
//        if frmPrihEdit.datechange then
//        begin
//          str := 'Будет произведен пересчет остатков за период c %s по %s . Суммы в расходных документах будут изменены! Продолжить?';
//          str := Format(str, [DateToStr(dateclose), DateToStr(date)]);
//          if windows.MessageBoxEx(Self.Handle, PChar(str), 'Предупреждение', MB_YESNO + MB_ICONQUESTION,$0419 ) = mrYes then
//          begin
//            oq.SetVariable('adpid', idDocs);
//            oq.SetVariable('adata1', dateclose + 1);
//            oq.SetVariable('adata2', date + time + 14);
//            Screen.Cursor := crSQLWait;
//            oq.Execute;
//            screen.Cursor := crDefault;
//            dmMain.os.Commit;
//          end;
//        end;
        cxDBgPrihListDBTableView1.ApplyBestFit(nil);
      end
      else dmMain.os.RollbackToSavepoint('prih');
    end;
  end; }

end;
//******************************************************************************
//                           FormActivate
//******************************************************************************
procedure TfrmPrihList.FormActivate(Sender: TObject);
begin
  //  ShowMessage('BActivate');
//  if odsSelDocPrih.RecordCount <= 0 then begin
//      del.Enabled := false;
//      edit.Enabled := false;
//    end;
  idDocs := 1;
  odsSelDocPrih.First;
  
  // odsSelDocPrihAfterScroll(odsseldocprih);
//* sill
//  dmMain.pkgkl.SetPostavid(odsSelDocPrihPOSTAVID.AsInteger);
//  sbSum.SimpleText := 'Сумма по текущему конкурентному листу: ' +
//    floattostr(dmMain.PkgPrihRash.GetSumcurkl);
//-
  //  ShowMessage('AActivate');
//  dxDBgPrihList.ApplyBestFit(nil);
end;

// Обновить
procedure TfrmPrihList.refreshExecute(Sender: TObject);
var
  s : string;
  date_temp : TDate;
begin
  if FNotRefresh then Exit;
  
  odsPostav.Close;
  odsPostav.Open;

  odsSelDocPrih.Close;
//  cxDBgPrihList.BeginUpdate;
  if TRUNC(dedDate1.Date) > TRUNC(dedDate2.Date) then
  begin
    date_temp := dedDate1.Date;
    dedDate1.Date := dedDate2.Date;
    dedDate2.Date := date_temp;
  end;
  odsSelDocPrih.SetVariable('DATE1', TRUNC(dedDate1.Date));
  odsSelDocPrih.SetVariable('DATE2', TRUNC(dedDate2.Date));
  s := 'Список приходных документов :: Период:';
  case chbDate1.Checked of
    TRUE :
    begin
      odsSelDocPrih.SetVariable('FILTERED_BY_DATE1', 1);
      s := s + ' c '+DateToStr(dedDate1.Date);
    end;

    FALSE: odsSelDocPrih.SetVariable('FILTERED_BY_DATE1', 0);
  end;
  case chbDate2.Checked of
    TRUE :
    begin
      odsSelDocPrih.SetVariable('FILTERED_BY_DATE2', 1);
      s := s + ' по '+DateToStr(dedDate2.Date);
    end;

    FALSE: odsSelDocPrih.SetVariable('FILTERED_BY_DATE2', 0);
  end;
  if (chbDate1.Checked or chbDate2.Checked) = False then
    s := 'Список приходных документов :: Без периода';

  Self.Caption := s;
//  cxDBgPrihList.EndUpdate;

  try
    odsSelDocPrih.Open;
  except
    on e:Exception do 
      ShowMessage( E.Message );
  end;

end;
// Печать
procedure TfrmPrihList.delUpdate(Sender: TObject);
begin
//  del.Enabled := trunc(odsSelDocPrih.FieldByName('DATA').AsDateTime) > trunc(dateclose);
end;

//procedure TfrmPrihList.dxDBgPrihListColumnSorting(Sender: TObject;
//  Column: TdxDBTreeListColumn; var Allow: Boolean);
//begin
//  if Column.FieldName = 'FC_DOCMIX' then
//    dxDBgPrihList.OnCompare := dxDBgPrihListCompare
//  else
//    dxDBgPrihList.OnCompare := nil;
//end;

//procedure TfrmPrihList.dxDBgPrihListCompare(Sender: TObject; Node1,
//  Node2: TdxTreeListNode; var Compare: Integer);
//var ColIndex      : Integer;
//    SortDirection : Integer;
//begin
//  ColIndex := dxDBgPrihList.ColumnByFieldName('FC_DOC').Index;
//  SortDirection := 0;
//  Case dxDBgPrihList.ColumnByFieldName('FC_DOCMIX').Sorted of
//    csUp   : SortDirection := 1;
//    csDown : SortDirection := -1;
//  end;
//  if StrToIntDef(Node1.Strings[ColIndex],0) > StrToIntDef(Node2.Strings[ColIndex],0) then
//    Compare := SortDirection
//  else if StrToIntDef(Node1.Strings[ColIndex],0) < StrToIntDef(Node2.Strings[ColIndex],0) then
//    Compare := -SortDirection
//  else if StrToIntDef(Node1.Strings[ColIndex],0) = StrToIntDef(Node2.Strings[ColIndex],0) then
//    Compare := 0;


//  if Node1.Strings[ColIndex] > Node2.Strings[ColIndex] then Compare := SortDirection
//  else if Node1.Strings[ColIndex] < Node2.Strings[ColIndex] then Compare := -SortDirection
//  else if Node1.Strings[ColIndex] = Node2.Strings[ColIndex] then Compare := 0;

//end;

procedure TfrmPrihList.Action1Execute(Sender: TObject);
begin
  dmmain.ncomment := 'удаление';
  if Windows.MessageBox(Self.Handle,
    PChar('Вы действительно хотите удалить данную запись ?'), 'Предупреждение',
		MB_YESNO + MB_ICONQUESTION + mb_defbutton2) = mrYes then
  begin
    dmMain.PkgPrihRash.dodel(odsSelDocPrih.fieldbyname('dpid').asinteger);
    dmMain.os.Commit;

//    odsSelDocPrih.refresh;
    odsSelDocPrih.Close;
    odsSelDocPrih.Open;
    if odsSelDocPrih.RecordCount <= 0 then
    begin
      del.Enabled := false;
      edit.Enabled := false;
    end;
  end;
end;

procedure TfrmPrihList.FormCreate(Sender: TObject);
var
  CurDate : TDate;
begin
  // FOMIN 30.05.2013
  miLittleKart1.Visible:=((dmMain.sDB_NAME='SO') or (dmMain.sDB_NAME='X'));
  //
//  fmainform.FormStorageRestorePlacement(FormStorage, TForm(self));
//  fmainform.CheckOnMaximize(TForm(self));
  CurDate := Trunc(ServerDate(dmMain.os));
  FNotRefresh := True;
  chbDate1.Checked := UpperCase(IniReadString( iniFileName, Self.Name, 'dpeDate1Checked',  'TRUE')) = 'TRUE';
  chbDate2.Checked := UpperCase(IniReadString( iniFileName, Self.Name, 'dpeDate2Checked',  'TRUE')) = 'TRUE';
  dedDate1.EditValue := StrToDate(IniReadString( iniFileName, Self.Name, 'dpeDate1Date', DateToStr(CurDate)));
  dedDate2.EditValue := StrToDate(IniReadString( iniFileName, Self.Name, 'dpeDate2Date', DateToStr(CurDate)));
  // если дата из настроек не влючает сегодняшний день, то ставим периодом текущий день
  if (chbDate1.Checked)and(Trunc(dedDate1.Date) > CurDate)or(Trunc(dedDate2.Date) < CurDate)and(chbDate2.Checked) then
  begin
    dedDate1.EditValue := CurDate;
    dedDate2.EditValue := CurDate;
  end;
  FNotRefresh := False;

  acTreb.Enabled := (frmMain.ProvisorState = 0)and(dmMain.ConfigParams.GetParamValue('FUNC_USE_RASH_BY_TREB', 1) = 1); // требования в приходе у СМС
  acTreb.Visible := acTreb.Enabled;

  miRezervSeparator.Visible := frmMain.ProvisorState = 1;
  acFromRezerv.Visible      := ((frmMain.ProvisorState = 1) and (dmMain.ConfigParams.GetParamValue('FUNC_RESTRICT_REZERV', 0) = 0))
                                or ((dmMain.ConfigParams.GetParamValue('FUNC_RESTRICT_REZERV', 0) = 1) and (dmMain.ConfigParams.GetParamValue('FUNC_MOVE_TO_OR_FROM_REZERV', false)));
  acFromRezerv.Enabled      := acFromRezerv.Visible;

  miImpNaklSeparator.Visible := False;
  acImpNakl.Visible          := False;

  acPrintNaklM4.Visible     := FileExists('frNaklM4.frf');

  // прячем столбик если не в складе ИМН
  if (dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1)and(dmMain.CurMO_SKLAD_SYNONIM = cSKLAD_SYNONIM_IMN) then
  begin
    cxDBgPrihListDBTableView1FK_VID_POST.VisibleForCustomization := True;
  end
  else
  begin
    cxDBgPrihListDBTableView1FK_VID_POST.Visible := False;
  end;

  if dmMain.ConfigParams.GetParamValue('FUNC_SHOW_KONTRAKT', 0) = 1 then
    cxDBgPrihListDBTableView1FC_KONTRAKT.VisibleForCustomization := True
  else
    cxDBgPrihListDBTableView1FC_KONTRAKT.Visible := False;

  if dmMain.ConfigParams.GetParamValue('FUNC_SHOW_SCHET_FAKTURA', 0) = 1 then
    cxDBgPrihListDBTableView1FC_SCHET_FAKTURA.VisibleForCustomization := True
  else
    cxDBgPrihListDBTableView1FC_SCHET_FAKTURA.Visible := False;

  if dmMain.ConfigParams.GetParamValue('FUNC_SHOW_PAY_COND', 0) = 0 then
  begin
    cxDBgPrihListDBTableView1FK_PAYCOND_ID.Visible := False;
    cxDBgPrihListDBTableView1FK_PAYCOND_ID.VisibleForCustomization := False;
  end;

  if dmMain.ConfigParams.GetParamValue('FUNC_SHOW_INV_NOMER', 0) = 0 then
  begin
    cxDBgPrihKartDBTableView1fc_inv_nomer.Visible := False;
    cxDBgPrihKartDBTableView1fc_inv_nomer.VisibleForCustomization := False;
  end;

  if (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_QUOTA_CODE', 0) = 0) then
  begin
    cxDBgPrihKartDBTableView1FC_QUOTA_CODE.Visible := False;
    cxDBgPrihKartDBTableView1FC_QUOTA_CODE.VisibleForCustomization := False;    
  end;

  if dmMain.ConfigParams.GetParamValue('FUNC_USE_NDS', 0) = 0 then
  begin
    cxDBgPrihKartDBTableView1FN_NDS.VisibleForCustomization := False;
    cxDBgPrihKartDBTableView1FN_NDS.Visible                 := False;
  end;

  if dmMain.ConfigParams.GetParamValue('FUNC_USE_NACENKA', 0) = 0 then
  begin
    cxDBgPrihKartDBTableView1FN_NACENKA.VisibleForCustomization := False;
    cxDBgPrihKartDBTableView1FN_NACENKA.Visible                 := False;
    cxDBgPrihKartDBTableView1FN_PRICE_MNF.VisibleForCustomization := False;
    cxDBgPrihKartDBTableView1FN_PRICE_MNF.Visible                 := False;
  end;

  if dmMain.ConfigParams.GetParamValue('FUNC_USE_JNVLS', 0) = 0 then
  begin
    cxDBgPrihKartDBTableView1FL_JNVLS.VisibleForCustomization := False;
    cxDBgPrihKartDBTableView1FL_JNVLS.Visible                 := False;
  end;     

  if dmMain.ConfigParams.GetParamValue('FUNC_USE_MIBP', 0) = 0 then
  begin
    cxDBgPrihKartDBTableView1FL_MIBP.VisibleForCustomization := False;
    cxDBgPrihKartDBTableView1FL_MIBP.Visible                 := False;
  end;       

  if dmMain.ConfigParams.GetParamValue('FUNC_USE_FORMULAR', 0) = 0 then
  begin
    cxDBgPrihKartDBTableView1FL_FORMULAR.VisibleForCustomization := False;
    cxDBgPrihKartDBTableView1FL_FORMULAR.Visible                 := False;
  end;

  FL_UNSIGN_RIGHT := dmMain.ConfigParams.GetParamValue('FUNC_UNSIGN_DOC_RIGHT', False);

  {if frmMain.ProvisorState = 0 then
  begin
    tbuPrint.DropdownMenu := nil;
    tbuPrint.Style := tbsButton;
  end;}

  FGodMode := False; // всемогущий режим изначально должен быть выключен
  ins.Enabled := frmMain.ProvisorState = 1;
  ins.Visible := ins.Enabled;
  odsPostav.Open;
  odsKart.Open;
//  odsDocFromReserv.Open;
  refresh.Execute;
//  cxDBgPrihListDBTableView1.RestoreFromRegistry('\SoftWare\SoftMaster\Medica\'+Self.Name,True,False, [gsoUseFilter]);
  try
    cxDBgPrihListDBTableView1.RestoreFromIniFile(iniFileName,True,False, [gsoUseFilter]);
  except
  end;

  if dmMain.ConfigParams.GetParamValue('FUNC_SHOW_FIN_SOURCE', 0) = 0 then
  begin
    cxDBgPrihListDBTableView1FK_FINSOURCE_ID.Visible := False;
    cxDBgPrihListDBTableView1FK_FINSOURCE_ID.VisibleForCustomization := False;

    cxDBgPrihKartDBTableView1FK_FINSOURCE_ID.Visible := False;
    cxDBgPrihKartDBTableView1FK_FINSOURCE_ID.VisibleForCustomization := False;
  end;


end;

function TfrmPrihList.FormHelp(Command: Word; Data: Integer;
  var CallHelp: Boolean): Boolean;
begin
	Result := False;
  try
    // TODo Подумать насчет праметра  Command
    if Data = -1 then
      HtmlHelp(0, PChar('Medica.chm'), HH_DISPLAY_TOPIC, 0)
    else
      HtmlHelp(0, PChar('Medica.chm'), HH_HELP_CONTEXT, Data);
    CallHelp := False;
    Result := True;
  except
    on EConvertError do
      ShowMessage('Справка не найдена');
	end;
end;

procedure TfrmPrihList.acPrintNaklExecute(Sender: TObject);
var
  P : TPoint;
  isM4: boolean;
begin
  // для М-11 заколебался менять эксельник - главное что он никому не нужен Воронов О.А. 05.12.2008

  // Для Травмы есть возможность печати требования-накладной в 2-х видах
  //if dmMain.sDB_NAME = 'T' then
  //begin

    if odsSelDocPrih.FieldByName('FP_VIDMOVE').AsInteger = VIDMOVE_NAKL_TREB then
    begin
      if fdmMain.nvl(odsSelDocPrih.FieldByName('mogr_from_fk_sklad_id').AsInteger,-1) > 0 then  // если склады используются
      begin
        dmMain.odsSklad.Locate('fk_id', fdmMain.nvl(odsSelDocPrih.FieldByName('mogr_from_fk_sklad_id').AsInteger,-1), []);

        if FileExists('frxTrebNakl_'+dmMain.odsSklad.FieldByName('FC_SYNONIM').AsString+'_WITH_DECODE.fr3') then
        begin
          dmPrintSelect.PrintFlag := 2;
          P.X := 0;
          P.Y := tbuPrint.Height;
          P := tbuPrint.ClientToScreen(P);
          pmPrintTrebNakl.Popup(P.X, P.Y);
          Application.ProcessMessages;

          exit; // Здесь выходим из процедуры
        end;
      end;
    end;
  //end;

  if odsSelDocPrih.FieldByName('FP_VIDMOVE').AsInteger = VIDMOVE_NAKL_TREB then dmPrintSelect.PrintFlag := 2;

  if dmPrintSelect.PrintFlag = 0 then
  begin
    P.X := 0;
    P.Y := tbuPrint.Height;
    P := tbuPrint.ClientToScreen(P);
    dmPrintSelect.pmPrintSelect.Popup(P.X, P.Y);
    Application.ProcessMessages; // только после этого срабатывает событие TdmPrintReports.miPrintToExcelClick(Sender: TObject);
  end;                           // и проставляется флаг - далее проверки на номер флага должны быть внутри каждой функции печати
  if dmPrintSelect.PrintFlag = 0 then Exit;
  try
    case odsSelDocPrih.FieldByName('FP_VIDMOVE').AsInteger of
      VIDMOVE_PRIH_POST, VIDMOVE_PRIH_RPO:  // приход
      begin
        try
          isM4 := TMenuItem(Sender).Tag = 1;
        except
          isM4 := false;
        end;
        Application.CreateForm(tfrmfionakl, frmfionakl);
        frmFIONakl.ePro.Visible:=false;
        frmFIONakl.lPro.Visible:=false;
        frmFIONakl.Constraints.MaxHeight := 230;
        frmFIONakl.HelpContext:=26;
        frmFIONakl.ePol.text    := IniReadString(iniFileName, 'frmFIONakl', 'ePol',    '');
        frmFIONakl.eOtp.text    := IniReadString(iniFileName, 'frmFIONakl', 'eOtp',    '');
        frmFIONakl.eDolpol.text := IniReadString(iniFileName, 'frmFIONakl', 'eDolpol', '');
        frmFIONakl.eDolotp.text := IniReadString(iniFileName, 'frmFIONakl', 'eDolotp', '');

        if frmFIONakl.ShowModal = mrOk then
        begin
          IniWriteString( iniFileName, 'frmFIONakl', 'ePol',     frmFIONakl.ePol.text    );
          IniWriteString( iniFileName, 'frmFIONakl', 'eOtp',     frmFIONakl.eOtp.text    );
          IniWriteString( iniFileName, 'frmFIONakl', 'eDolpol',  frmFIONakl.eDolpol.text );
          IniWriteString( iniFileName, 'frmFIONakl', 'eDolotp',  frmFIONakl.eDolotp.text );
          odsNakl.SetVariable('pol', frmFIONakl.ePol.text);
          odsNakl.SetVariable('otp', frmFIONakl.eOtp.text);
          odsNakl.SetVariable('dolpol', frmFIONakl.eDolpol.text);
          odsNakl.SetVariable('dolotp', frmFIONakl.eDolotp.text);
          odsNakl.SetVariable('adpid', odsSelDocPrih.FieldByName('DPID').AsInteger);
          odsNakl.Close;
          odsNakl.Open;
          frDBdsNakl.DataSet := odsNakl;
          frNakl.Dataset := frDBdsNakl;

          dmPrintReports.odsFinsource_in_Doc.SetVariable('adpid', odsSelDocPrih.FieldByName('DPID').AsInteger);
          dmPrintReports.odsFinsource_in_Doc.Close;
          dmPrintReports.odsFinsource_in_Doc.Open;

          if (dmMain.ConfigParams.GetParamValue('FUNC_USE_ONLY_FR4', 0) = 1) then     //Переход на FastReport 4
          begin
            if (odsSelDocPrih.FieldByName('FP_VIDMOVE').AsInteger = VIDMOVE_PRIH_RPO) and FileExists('frxNaklPrihRPO.fr3') then
              frxNakl.LoadFromFile('frxNaklPrihRPO.fr3');

            if (odsSelDocPrih.FieldByName('FP_VIDMOVE').AsInteger = VIDMOVE_PRIH_POST) and FileExists('frxNakl.fr3') then
              frxNakl.LoadFromFile('frxNakl.fr3');

            frxNakl.PrepareReport;
            case dmPrintSelect.PrintFlag of // флаг куда печатать
              1: ExportFRToExcel( frxNakl, odsSelDocPrih.FieldByName('FC_DOCMIX').AsString);
              2: frxNakl.ShowPreparedReport;
            end;
          end
          else
          begin
            if (odsSelDocPrih.FieldByName('FP_VIDMOVE').AsInteger = VIDMOVE_PRIH_RPO) and FileExists('frNaklPrihRPO.frf') then
            begin
              frNakl.LoadFromFile('frNaklPrihRPO.frf');
            end;

            if (odsSelDocPrih.FieldByName('FP_VIDMOVE').AsInteger = VIDMOVE_PRIH_POST) and FileExists('frNakl.frf') then
            begin
              frNakl.LoadFromFile('frNakl.frf');  //
            end;

            if (odsSelDocPrih.FieldByName('FP_VIDMOVE').AsInteger = VIDMOVE_PRIH_POST) and isM4 and FileExists('frNaklM4.frf') then
            begin
              frNakl.LoadFromFile('frNaklM4.frf');
            end;

            frNakl.PrepareReport;

            case dmPrintSelect.PrintFlag of // флаг куда печатать
              1: ExportFRToExcel( frNakl, odsSelDocPrih.FieldByName('FC_DOCMIX').AsString+'.xls' );
              2: frNakl.ShowPreparedReport;
            end;
          end;
        end;
        frmFIONakl.free;
      end;

      VIDMOVE_VVOD_OST:  // остатки
      begin
        odsOstAct.SetVariable('adpid', odsSelDocPrih.FieldByName('DPID').AsInteger);
        odsOstAct.Close;
        frDBdsNakl.DataSet := odsOstAct;
        frOstAct.Dataset := frDBdsNakl;
        odsOstAct.Open;
        
        if (dmMain.ConfigParams.GetParamValue('FUNC_USE_ONLY_FR4', 0) = 1) then     //Переход на FastReport 4
        begin
          frxOstAct.PrepareReport;
          case dmPrintSelect.PrintFlag of // флаг куда печатать
            1: ExportFRToExcel( frxOstAct, odsSelDocPrih.FieldByName('FC_DOCMIX').AsString );
            2: frxOstAct.ShowPreparedReport;
          end;
        end
        else
        begin
          frOstAct.PrepareReport;
          case dmPrintSelect.PrintFlag of // флаг куда печатать
            1: ExportFRToExcel( frOstAct, odsSelDocPrih.FieldByName('FC_DOCMIX').AsString+'.xls' );
            2: frOstAct.ShowPreparedReport;
          end;
        end;
      end;

      VIDMOVE_NAKL_TREB: acPrnInvoice.Execute;
  //    VIEW_MODE_RETURN : acPrnReturn.Execute;

    end;
  finally
    dmPrintSelect.PrintFlag := 0;
  end;
end;

procedure TfrmPrihList.acPrintNaklsInPeriodExecute(Sender: TObject);
var
  P : TPoint;
begin
  if dmPrintSelect.PrintFlag = 0 then
  begin
    P.X := 0;
    P.Y := tbuPrint.Height;
    P := tbuPrint.ClientToScreen(P);
    dmPrintSelect.pmPrintSelect.Popup(P.X, P.Y);
    Application.ProcessMessages; // только после этого срабатывает событие TdmPrintReports.miPrintToExcelClick(Sender: TObject);
  end;                           // и проставляется флаг - далее проверки на номер флага должны быть внутри каждой функции печати
  if dmPrintSelect.PrintFlag = 0 then Exit;
  try
    case odsSelDocPrih.FieldByName('FP_VIDMOVE').AsInteger of
      VIDMOVE_PRIH_POST, VIDMOVE_PRIH_RPO:  // приход
      begin
        Application.CreateForm(tfrmfionakl, frmfionakl);
        frmFIONakl.ePro.Visible:=false;
        frmFIONakl.lPro.Visible:=false;
        frmFIONakl.Constraints.MaxHeight := 230;
        frmFIONakl.HelpContext:=26;    
        frmFIONakl.ePol.text    := IniReadString(iniFileName, 'frmFIONakl', 'ePol',    '');
        frmFIONakl.eOtp.text    := IniReadString(iniFileName, 'frmFIONakl', 'eOtp',    '');
        frmFIONakl.eDolpol.text := IniReadString(iniFileName, 'frmFIONakl', 'eDolpol', '');
        frmFIONakl.eDolotp.text := IniReadString(iniFileName, 'frmFIONakl', 'eDolotp', '');
        if frmFIONakl.ShowModal = mrOk then
        begin                                             
          IniWriteString( iniFileName, 'frmFIONakl', 'ePol',     frmFIONakl.ePol.text    );
          IniWriteString( iniFileName, 'frmFIONakl', 'eOtp',     frmFIONakl.eOtp.text    );
          IniWriteString( iniFileName, 'frmFIONakl', 'eDolpol',  frmFIONakl.eDolpol.text );
          IniWriteString( iniFileName, 'frmFIONakl', 'eDolotp',  frmFIONakl.eDolotp.text );
          odsNaklsInPeriod.SetVariable('pol', frmFIONakl.ePol.text);
          odsNaklsInPeriod.SetVariable('otp', frmFIONakl.eOtp.text);
          odsNaklsInPeriod.SetVariable('dolpol', frmFIONakl.eDolpol.text);
          odsNaklsInPeriod.SetVariable('dolotp', frmFIONakl.eDolotp.text);
          odsNaklsInPeriod.SetVariable('vidmove', odsSelDocPrih.FieldByName('FP_VIDMOVE').AsInteger);
          odsNaklsInPeriod.SetVariable('FC_MOGROUPID_FROM', odsSelDocPrih.FieldByName('FC_MOGROUPID_FROM').AsString);


          odsNaklsInPeriod.SetVariable('DATE1', TRUNC(dedDate1.Date));
          odsNaklsInPeriod.SetVariable('DATE2', TRUNC(dedDate2.Date));
          case chbDate1.Checked of
            TRUE : odsNaklsInPeriod.SetVariable('FILTERED_BY_DATE1', 1);
            FALSE: odsNaklsInPeriod.SetVariable('FILTERED_BY_DATE1', 0);
          end;
          case chbDate2.Checked of
            TRUE : odsNaklsInPeriod.SetVariable('FILTERED_BY_DATE2', 1);
            FALSE: odsNaklsInPeriod.SetVariable('FILTERED_BY_DATE2', 0);
          end;

          odsNaklsInPeriod.Close;
          odsNaklsInPeriod.Open;
          frDBdsNakl.DataSet := odsNaklsInPeriod;

          if (odsSelDocPrih.FieldByName('FP_VIDMOVE').AsInteger = VIDMOVE_PRIH_RPO) and FileExists('frNaklPrihRPOInPeriod.frf') then
            frNaklsInPeriod.LoadFromFile('frNaklPrihRPOInPeriod.frf');

          if (odsSelDocPrih.FieldByName('FP_VIDMOVE').AsInteger = VIDMOVE_PRIH_POST) and FileExists('frNaklsInPeriod.frf') then
            frNaklsInPeriod.LoadFromFile('frNaklsInPeriod.frf');

          frNaklsInPeriod.Dataset := frDBdsNakl;

          frNaklsInPeriod.PrepareReport;
          case dmPrintSelect.PrintFlag of // флаг куда печатать
            1: ExportFRToExcel( frNaklsInPeriod, odsSelDocPrih.FieldByName('FC_DOCMIX').AsString+'.xls' );
            2: frNaklsInPeriod.ShowPreparedReport;
          end;
        end;
        frmFIONakl.free;
      end;
    end;
  finally
    dmPrintSelect.PrintFlag := 0;
  end;
end;

procedure TfrmPrihList.acSignExecute(Sender: TObject);
var
  DocID : Integer;
  oq2 : TOracleQuery;
  sMess : string;
begin
  if odsSelDocPrih.Eof then Exit;

// теперь выводим сообщение в зависимости от подписанности документа
  case odsSelDocPrih.FieldByName('fl_edit').AsInteger of
    0 :
    begin
      sMess := CheckAndShowLinkedDocs( odsSelDocPrih.FieldByName('DPID').AsInteger, nil, True, 'Обратите внимание на зависимые документы:' );
//      if sMess <> '' then Exit;
//      if sMess <> '' then
//        Application.MessageBox(pChar('Обратите внимание на зависимые документы:'#13#10#13#10+sMess),'Внимание', MB_OK + MB_ICONINFORMATION);
      sMess := 'Отменить подпись в документе № ' + odsSelDocPrih.FieldByName('FC_DOC').AsString + '?';
    end  
  else
  begin
// Этой проверки в приходных документах быть не должно!!!!
//    if CheckDocKol(odsSelDocPrih.FieldByName('DPID').AsInteger, 'Обратите внимание на нехватку остатков:' ) <> '' then Exit;
    sMess := 'Утвердить документ № ' + odsSelDocPrih.FieldByName('FC_DOC').AsString + '?';
  end;

  end;

  if Application.MessageBox(pChar(sMess),'Внимание',
                            mb_yesno + mb_iconquestion + mb_defbutton1) = idyes  then
  begin
    oq2 := TOracleQuery.Create( self );
    oq2.Session := dmMain.os;
    DocID := odsSelDocPrih.FieldByName('DPID').AsInteger;
    case odsSelDocPrih.FieldByName('FL_EDIT').AsInteger of
      1: oq2.Sql.Text := 'UPDATE MED.TDOCS SET FL_EDIT=0 WHERE DPID='+IntToStr(DocID); //подписать
    else
         oq2.Sql.Text := 'UPDATE MED.TDOCS SET FL_EDIT=1 WHERE DPID='+IntToStr(DocID); //отменить подпись
    end;
    try
      oq2.Execute;
      oq2.Session.Commit;
//      odsSelDocPrih.refresh;
      dmMain.pkgprihrash.SetUchgrInKartsByDoc( odsSelDocPrih.FieldByName('DPID').AsInteger );

      odsSelDocPrih.Close;
      odsSelDocPrih.Open;
      odsSelDocPrih.Locate('dpid', DocID, []);
    finally
      oq2.Free;
    end;
  end;
end;

procedure TfrmPrihList.odsSelDocPrihAfterOpen(DataSet: TDataSet);
var
  DocIsSign : Boolean;
begin
  DocIsSign := True;
  if (not DataSet.IsEmpty) then DocIsSign := odsSelDocPrih.FieldByName('FL_EDIT').AsInteger = 0;
  if  (not DocIsSign) then
  begin
    acSign.Caption := '  Утвердить  ';
    edit.Caption := 'Изменить';
  end
  else
  begin
    acSign.Caption := 'Отм. утверж.';
    edit.Caption := 'Просмотр';
  end;

  acPrintLittleKart.Enabled := (odsSelDocPrih.FieldByName('FP_VID').AsInteger = 1) or
                               (odsSelDocPrih.FieldByName('FP_VIDMOVE').AsInteger = VIDMOVE_NAKL_TREB);
  acPrintLittleKart1.Enabled := acPrintLittleKart.Enabled;
//  tbuPrint.Enabled := acPrintLittleKart.Enabled; // пока что печатаем только стеллажные карточки
                                                                                                                 // подписывать кроме прихода от РПО
  if (FL_UNSIGN_RIGHT = False)and(DocIsSign) then
    acSign.Enabled := False
  else
    acSign.Enabled := (not( (frmMain.ProvisorState = 0)and(odsSelDocPrih.FieldByName('FP_VID').AsInteger = 2) ))and
                      (odsSelDocPrih.FieldByName('FP_VIDMOVE').AsInteger <> 10)and
                      (odsSelDocPrih.FieldByName('FC_COMMENT').AsString <> 'Возврат из резерва (сделан автоматически)')and
                      (odsSelDocPrih.FieldByName('FL_IN_CLOSED_PERIOD').AsInteger = 0)
                      or (FGodMode); // подписывать требование-приход может только провизор

  del.Enabled := (odsSelDocPrih.RecordCount > 0) and (not DocIsSign);

  acPrintNakl.Enabled := (odsSelDocPrih.RecordCount > 0) and ( not (odsSelDocPrih.FieldByName('FP_VIDMOVE').AsInteger in [VIDMOVE_KARD_LIST, VIDMOVE_TO_REZERV, VIDMOVE_FROM_REZERV]) );
  acPrintNaklM4.Enabled := acPrintNakl.Enabled;
  acPrintNaklsInPeriod.Enabled := (odsSelDocPrih.RecordCount > 0) and ( (odsSelDocPrih.FieldByName('FP_VIDMOVE').AsInteger in [VIDMOVE_PRIH_POST, VIDMOVE_PRIH_RPO]) );
end;

procedure TfrmPrihList.tbuPrintClick(Sender: TObject);
begin
//  if frmMain.ProvisorState = 1 then acPrintNakl.Execute else acPrintLittleKart.Execute;
  acPrintNakl.Execute;
end;

procedure TfrmPrihList.acPrintLittleKart1Execute(Sender: TObject);
const c_file_frx = 'Стеллажная_карточка_ст_медсестры.fr3';
begin
  if FileExists(c_file_frx) then frxLittleKart1.LoadFromFile(c_file_frx);
    odsMedKart.Close;
    odsMedKart.SetVariable('DOC_ID', odsSelDocPrih.FieldByName('DPID').AsInteger);
    odsMedKart.Open;
    frxLittleKart1.ShowReport;
end;

procedure TfrmPrihList.acPrintLittleKartExecute(Sender: TObject);
begin
  if (dmMain.ConfigParams.GetParamValue('FUNC_USE_ONLY_FR4', 0) = 1) then     //Переход на FastReport 4
  begin
    if dmMain.CurMO_SKLAD_SYNONIM = cSKLAD_SYNONIM_IMN then
    begin
      if FileExists('Стеллажная карточка_ИМН.fr3') then           // если найден файл
        frxLittleKart.LoadFromFile('Стеллажная карточка_ИМН.fr3'); // загружаем его
    end
    else
    begin
      if FileExists('Стеллажная карточка.fr3') then           // если найден файл
          frxLittleKart.LoadFromFile('Стеллажная карточка.fr3'); // загружаем его
    end;
    odsMedKart.Close;
    odsMedKart.SetVariable('DOC_ID', odsSelDocPrih.FieldByName('DPID').AsInteger);
    odsMedKart.Open;
    if not odsMedKart.Eof then
      frxLittleKart.ShowReport;
  end
  else
  begin
    if dmMain.CurMO_SKLAD_SYNONIM = cSKLAD_SYNONIM_IMN then
    begin
      if FileExists('Стеллажная карточка_ИМН.frf') then           // если найден файл
        frLittleKart.LoadFromFile('Стеллажная карточка_ИМН.frf'); // загружаем его
    end
    else
    if ( dmMain.CurMO_SKLAD_SYNONIM = cSKLAD_SYNONIM_APTEKA ) and
       ( FileExists('Стеллажная карточка_АПТЕКА.frf') )then          // если найден файл
    begin
        frLittleKart.LoadFromFile('Стеллажная карточка_АПТЕКА.frf'); // загружаем его
    end
    else
    begin
      if FileExists('Стеллажная карточка.frf') then           // если найден файл
        frLittleKart.LoadFromFile('Стеллажная карточка.frf'); // загружаем его
    end;
    odsMedKart.Close;
    odsMedKart.SetVariable('DOC_ID', odsSelDocPrih.FieldByName('DPID').AsInteger);
    odsMedKart.Open;
    if not odsMedKart.Eof then
      frLittleKart.ShowReport;
  end;
end;

procedure TfrmPrihList.cxDBgPrihKartDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if (dmMain.sDB_NAME = 'SK') then
  begin
    if trim(AnsiLowerCase(AViewInfo.GridRecord.DisplayTexts[cxDBgPrihKartDBTableView1FK_FINSOURCE_ID.Index ])) = 'федеральный бюджет' then
    begin
      ACanvas.Brush.Color := $00FFAAAA;
    end;   
  end;
end;

procedure TfrmPrihList.cxDBgPrihListDBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  case AButton of
    mbRight:
    begin
      if odsSelDocPrih.FieldByName('FP_VIDMOVE').AsInteger = VIDMOVE_NAKL_TREB then
      begin
        if dmMain.ConfigParams.GetParamValue('FUNC_PRINT_TREB_NAKL_V2', False) = True then
        begin
          pmTrebNaklV2.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y );
        end;
      end;
    end;
  end;
end;

procedure TfrmPrihList.cxDBgPrihListDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AnsiLowerCase(AViewInfo.Text)=AnsiLowerCase('Нет') then
		ACanvas.Brush.Color := clRed;
end;

procedure TfrmPrihList.cxDBgPrihListDBTableView1DblClick(Sender: TObject);
begin
  edit.Execute;
end;

procedure TfrmPrihList.tbuAddClick(Sender: TObject);
var
  P : TPoint;
begin
  P.X := 0;
  P.Y := tbuAdd.Height;
  P := tbuAdd.ClientToScreen(P);
  tbuAdd.DropdownMenu.Popup(P.X, P.Y);
//  if not ins.Execute then
//    acInsOst.Execute;
end;

procedure TfrmPrihList.acGodModeExecute(Sender: TObject);
begin
  FGodMode := not FGodMode;
  if FGodMode then
    Self.Caption :=  Self.Caption + ' (God mode)'
  else
    Self.Caption := StringReplace(Self.Caption, ' (God mode)', '',[]);
end;

procedure TfrmPrihList.N19Click(Sender: TObject);
var
  CurDate : TDate;
begin
  if not Assigned(Sender) then Exit;
  FNotRefresh := True;
  CurDate := ServerDate(dmMain.os);
  case TMenuItem(Sender).Tag of
    1:  // прошлый год
    begin
      dedDate1.EditValue := Trunc(StartOfTheYear(IncYear(CurDate, -1)));
      dedDate2.EditValue := Trunc(EndOfTheYear(IncYear(CurDate, -1)));
    end;

    2:  // Текущий год
    begin
      dedDate1.EditValue := Trunc(StartOfTheYear(CurDate));
      dedDate2.EditValue := Trunc(EndOfTheYear(CurDate));
    end;

    3:  // прошлый месяц
    begin
      dedDate1.EditValue := Trunc(StartOfTheMonth(IncMonth(CurDate,-1)));
      dedDate2.EditValue := Trunc(EndOfTheMonth(IncMonth(CurDate,-1)));
    end;

    4:  // текущий месяц
    begin
      dedDate1.EditValue := Trunc(StartOfTheMonth(CurDate));
      dedDate2.EditValue := Trunc(EndOfTheMonth(CurDate));
    end;

    5:  // текущий день
    begin
      dedDate1.EditValue := Trunc(CurDate);
      dedDate2.EditValue := Trunc(CurDate);
    end;
  end;

  chbDate1.Checked := (TMenuItem(Sender).Tag <> 0);
  chbDate2.Checked := (TMenuItem(Sender).Tag <> 0);
  FNotRefresh := False;
  refresh.Execute;  
end;

procedure TfrmPrihList.acPrnInvoiceExecute(Sender: TObject);
//var p         : TfrPreview;
//    s         : String;
//    frmFioZav : TfrmFioZav;
begin
  case dmMain.ConfigParams.GetParamValue('Func_Set', 0) of
    FUNC_SET_MID:
    begin
//      odsInvoice2.Close;
//      odsInvoice2.SetVariable('adpid', odsSelDocPrih.FieldByName('DPID').AsInteger);
//      odsInvoice2.Open;
//
//      frInvoice2.PrepareReport;
//      p := TfrPreview.Create(frInvoice2);
//      CurReport := frInvoice2;
//      MasterReport := frInvoice2;
//      DocMode := dmPrinting;
//      CurBand := nil;
//      if frInvoice2.EMFPages.Count = 0 then Exit;
//      s := frLoadStr(SPreview);
//      if frInvoice2.Title <> '' then s := s + ' - ' + frInvoice2.Title;
//      p.Window.Caption := s;
//      frInvoice2.Preview := p;
//
//      frInvoice2.Preview.Window.Show_Modal(frInvoice2);
//      Application.ProcessMessages;
//      frInvoice2.Preview.Window := nil;
//      odsInvoice2.Close;
      dmPrintReports.PrintTrebOld(odsSelDocPrih.FieldByName('DPID').AsInteger,
                                  odsSelDocPrih.FieldByName('FC_DOC').AsString,
                                  odsSelDocPrih.FieldByName('FD_INVOICE').AsDateTime,
                                  odsSelDocPrih.FieldByName('FC_MOGROUPID_FROM').AsString,
                                  odsSelDocPrih.FieldByName('FC_MOGROUPID_TO').AsString,
                                  odsSelDocPrih.FieldByName('NAMEFROM').AsString,
                                  odsSelDocPrih.FieldByName('NAMETO').AsString);
    end
    else
      dmPrintReports.PrintTreb(odsSelDocPrih.FieldByName('DPID').AsInteger,
                               odsSelDocPrih.FieldByName('FC_DOC').AsString,
                               odsSelDocPrih.FieldByName('FD_INVOICE').AsDateTime,
                               odsSelDocPrih.FieldByName('FC_MOGROUPID_FROM').AsString,
                               odsSelDocPrih.FieldByName('FC_MOGROUPID_TO').AsString,
                               odsSelDocPrih.FieldByName('FC_DOCMIX').AsString+'.xls',
                               odsSelDocPrih.FieldByName('NAMEFROM').AsString,
                               odsSelDocPrih.FieldByName('NAMETO').AsString,
                               (dmMain.ConfigParams.GetParamValue('FUNC_IS_PRINT_TREB_NAKL_ABSENT_MEDICS', False)),
//                               (cSKLAD_SYNONIM_IMN <> dmMain.CurMO_SKLAD_SYNONIM),
                               fdmMain.nvl(odsSelDocPrih.FieldByName('mogr_from_FK_SKLAD_ID').AsInteger,-1)
                               );
  end;

//------------------------------------------------------------------------------
//  if ((GetKeyState(VK_SHIFT) and $8000) <> 0) //зажата клавиша шифт
//    or (IniReadString(iniFileName,'ZavOtdel','bShow','1') = '1') then
//  begin
//    frmFioZav := TfrmFioZav.Create(nil);
//    try
//      frmFioZav.edFam.Text := IniReadString(iniFileName,'ZavOtdel','FIO');
//      frmFioZav.cbDontShow.Checked := not Boolean(StrToInt(IniReadString(iniFileName,'ZavOtdel','bShow','1')));
//      if frmFioZav.ShowModal = mrCancel then Exit;
//      if frmFioZav.cbDontShow.Checked and (Application.MessageBox('Вы уверены что не хотите больше выводить это окно?',
//        'Внимание', mb_yesno + mb_iconquestion + mb_defbutton2) = idyes) then
//        IniWriteString(iniFileName,'ZavOtdel','bShow','0');
//      if not frmFioZav.cbDontShow.Checked then
//        IniWriteString(iniFileName,'ZavOtdel','bShow','1');
//      IniWriteString(iniFileName,'ZavOtdel','FIO',frmFioZav.edFam.Text);
//    finally
//      frmFioZav.Free;
//    end;
//  end;

//  frInvoice2.ShowReport;

end;

procedure TfrmPrihList.acTrebExecute(Sender: TObject);
begin
  DoShowTrebLst;
end;

procedure TfrmPrihList.frInvoice2GetValue(const ParName: String;  var ParValue: Variant);
begin
  if ParName = 'var_sender' then
         ParValue :=  dmMain.pkgSmini.Readstring('CONFIG', 'SENDER', '')
  else if ParName = 'var_receiver' then
         ParValue :=  dmMain.pkgSmini.Readstring('MANAGER_DOC', 'CLIENT_NAME_SMS', '')
  else if ParName = 'var_MagOtd' then
         ParValue :=  dmMain.pkgSmini.Readstring('MANAGER_DOC', 'ZAV_APTEKA', '')
  else if ParName = 'var_zam_gl_vra4' then
         ParValue := dmMain.pkgSmini.Readstring('MANAGER_DOC', 'ZAM_GL_VRA4', '');
end;

procedure TfrmPrihList.frNaklGetValue(const ParName: string;
  var ParValue: Variant);
begin
  if ParName = 'S_NAME' then
    ParValue :=  dmMain.pkgSmini.Readstring('CONFIG', 'S_NAME', '');
end;

procedure TfrmPrihList.frxNaklGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'S_NAME' then
    Value :=  dmMain.pkgSmini.Readstring('CONFIG', 'S_NAME', '');
end;

procedure TfrmPrihList.acFromRezervExecute(Sender: TObject);
begin
	ndata:=dmmain.pkgprihrash.GETRASHDATA(ServerDate(dmMain.os));
  dmmain.ncomment:='добавление';
  Screen.Cursor := crSQLWait;
  dmMain.os.Savepoint('VIDMOVE_FROM_REZERV');

  idDocs := -1;
  if DoShowMoveEdit(idDocs, True, VID_DVIJENIE, VIDMOVE_FROM_REZERV) = mrOk then
  begin
		odsSelDocPrih.refresh;
    odsSelDocPrih.Locate('dpid', idDocs, []);
    del.Enabled := true;
    edit.Enabled := true;
		dmMain.os.Commit;
  end
  else
    try
      dmMain.os.RollbackToSavepoint('VIDMOVE_FROM_REZERV');
    except
    end;
end;

procedure TfrmPrihList.odsSelDocPrihBeforeOpen(DataSet: TDataSet);
begin
  if frmMain.ProvisorState = 0 then // для мс скрываем неподписанные требования Воронов О.А. 25.01.2008 - по просьбе Прошиной (МИД)
  begin
    odsSelDocPrih.Filter := 'not ((fp_vidmove = 2)and(fl_edit=1))';
    odsSelDocPrih.Filtered := True;
  end;  
end;

procedure TfrmPrihList.chbDate1Click(Sender: TObject);
begin
  dedDate1.Enabled := chbDate1.Checked;
  refresh.Execute;
end;

procedure TfrmPrihList.chbDate2Click(Sender: TObject);
begin
  dedDate2.Enabled := chbDate2.Checked;
  refresh.Execute;  
end;

procedure TfrmPrihList.dedDate1PropertiesEditValueChanged(Sender: TObject);
begin
  refresh.Execute;
end;

procedure TfrmPrihList.dedDate1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then refresh.Execute;
end;

procedure TfrmPrihList.dedDate1PropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  cxDateEdit_PropertiesValidate(Sender, DisplayValue, ErrorText, Error);
end;

procedure TfrmPrihList.cxDBgPrihListDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  odsKart.Close;
  if (cxDBgPrihListDBTableView1.DataController.RecordCount >0)and(cxDBgPrihListDBTableView1.Controller.SelectedRowCount > 0)and(cxDBgPrihListDBTableView1.Controller.SelectedRows[0].Expandable = False) then
    odsKart.SetVariable('ADPID', cxDBgPrihListDBTableView1.Controller.SelectedRows[0].Values[cxDBgPrihListDBTableView1DPID.Index])
  else
    odsKart.SetVariable('ADPID', -1);
  odsKart.Open;
end;

procedure TfrmPrihList.acImpNaklExecute(Sender: TObject);
begin
  if not frmMain.RestoreMDI_Window('fmImportNakl') then
  begin
    fmImportNakl := TfmImportNakl.Create(Application);
    fmImportNakl.FormStyle := fsMDIChild;
  end;
end;

end.

