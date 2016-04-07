unit fControlProtocol;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, dxBar,
  cxClasses, ImgList, ActnList, RVScroll, RichView, RVEdit, cxGraphics,
  cxTextEdit, cxSpinEdit, cxTimeEdit, cxDropDownEdit, cxCalendar, cxMaskEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxCurrencyEdit, cxControls,
  cxContainer, cxEdit, cxLabel, StdCtrls, ExtCtrls, RVStyle, DB, OracleData, Oracle,
  frxClass, Menus, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue;

type
  TfrmControlProtocol = class(TForm)
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    BMBar1: TdxBar;
    il: TImageList;
    bbSave: TdxBarButton;
    bbCancel: TdxBarButton;
    al: TActionList;
    aSave: TAction;
    aCancel: TAction;
    rveText: TRichViewEdit;
    Panel8: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    cxSotr: TcxLookupComboBox;
    cxdeDateProtocol: TcxDateEdit;
    cxteTimeProtocol: TcxTimeEdit;
    cxLabel28: TcxLabel;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    aSaveTemplate: TAction;
    aLoadTemplate: TAction;
    rvs: TRVStyle;
    odsRVData: TOracleDataSet;
    odsRVDataFK_ID: TFloatField;
    odsRVDataFK_PACID: TFloatField;
    odsRVDataFB_BLOB: TBlobField;
    odsRVDataFN_COMPRESS: TFloatField;
    odsRVDataFB_HTML: TBlobField;
    odsRVDataFB_TEXT: TMemoField;
    odsSotr: TOracleDataSet;
    dsSotr: TDataSource;
    paName: TPanel;
    bbPrint: TdxBarButton;
    aPrint: TAction;
    frxRepControlProtocol: TfrxReport;
    pmRveText: TPopupMenu;
    N3: TMenuItem;
    N2: TMenuItem;
    N1: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    bbDel: TdxBarButton;
    aDel: TAction;
    cxName: TcxLabel;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aLoadTemplateExecute(Sender: TObject);
    procedure aSaveTemplateExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure frxRepControlProtocolGetValue(const VarName: string;
      var Value: Variant);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure rveTextChange(Sender: TObject);
    procedure odsSotrBeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    pSMIDID : Integer;
    pNAZID : Integer;
    procedure DoTextControlProtocol;
    procedure DoSetParameters;
    { Private declarations }
  public
    INSERT_MODE : Boolean;
    procedure DoShowFormControlProtocol(nSMID : Integer; nNAZID: Integer; sNumIssl : String);
    { Public declarations }
  end;

var
  frmControlProtocol: TfrmControlProtocol;

implementation
uses fMedEditorTemplates, fMain, fProtocol;
{$R *.dfm}

procedure TfrmControlProtocol.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmControlProtocol.aDelExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  if Application.MessageBox('Вы действительно хотите удалить контрольное описание ?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' DELETE FROM ASU.VNAZ WHERE FK_ID = :PFK_ID ';
        oq.DeclareAndSet('PFK_ID', otInteger, pNAZID);
        oq.Execute;
        frmMain.os.Commit;
      finally
        oq.Free;
      end;
      pNAZID := -1;
      rveText.Clear;
      rveText.Format;
      rveText.SetFocus;
    end;
  ModalResult := mrCancel; 
end;

procedure TfrmControlProtocol.aLoadTemplateExecute(Sender: TObject);
var memStream: TMemoryStream;
begin
  memStream := TMemoryStream.Create;
  memStream.Position := 0;
  if LoadMedEditorFromTemplate(pSMIDID, memStream, rvs) then
  begin
    memStream.Position := 0;
    rveText.Reformat;
    if not rveText.InsertRVFFromStreamEd(memStream) then
      MessageDlg('Внимание. При загрузке шаблона возникли проблемы', mtError,
        [mbOK], 0);

    rveText.Format; 
  end;
  memStream.Free;
end;

procedure TfrmControlProtocol.aPrintExecute(Sender: TObject);
begin
  rveText.SetSelectionBounds(0, rveText.GetOffsBeforeItem(0), rveText.ItemCount - 1,
    rveText.GetOffsAfterItem(rveText.ItemCount - 1));
  Application.ProcessMessages;
  frxRepControlProtocol.ShowReport;
end;

procedure TfrmControlProtocol.aSaveExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmControlProtocol.aSaveTemplateExecute(Sender: TObject);
var memStream: TMemoryStream;
begin
  memStream := TMemoryStream.Create;
  rveText.SaveRVFToStream(memStream, False);
  memStream.Position := 0;
  SaveMedEditorAsTemplate(pSMIDID, memStream, rvs);
  memStream.Free;
end;

procedure TfrmControlProtocol.DoSetParameters;
var ods : TOracleDataSet;
begin
  if INSERT_MODE = True then
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT SYSDATE FROM DUAL ';
        ods.Open;
        cxdeDateProtocol.Date := ods.FieldByName('SYSDATE').AsDateTime;
        cxteTimeProtocol.Time := ods.FieldByName('SYSDATE').AsDateTime;
        cxSotr.EditValue := frmMain.pSOTRID;
      finally
        ods.Free;
      end;
    end else
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT FD_RUN, FK_ISPOLID FROM VNAZ WHERE FK_ID = :PFK_ID ';
        ods.DeclareAndSet('PFK_ID', otInteger, pNAZID);
        ods.Open;
        cxdeDateProtocol.Date := ods.FieldByName('FD_RUN').AsDateTime;
        cxteTimeProtocol.Time := ods.FieldByName('FD_RUN').AsDateTime;
        cxSotr.EditValue := ods.FieldByName('FK_ISPOLID').AsInteger;
      finally
        ods.Free;
      end;
    end;
end;

procedure TfrmControlProtocol.DoShowFormControlProtocol(nSMID: Integer; nNAZID: Integer; sNumIssl : String);
begin
  if INSERT_MODE = True then
    begin
      aDel.Visible := False;
      aPrint.Enabled := False;
    end else
    begin
      aDel.Visible := True;
      aPrint.Enabled := True;
    end;
  pSMIDID := nSMID;
  pNAZID := nNAZID;
  cxName.Caption := 'Контрольное описание к протоколу № '+sNumIssl;
  DoTextControlProtocol;
  DoSetParameters;
end;

procedure TfrmControlProtocol.DoTextControlProtocol;
var ods : TOracleDataSet;
    memStream : TMemoryStream;
begin
//------------------------------------------------------------------------------
  memStream :=  TMemoryStream.Create;
  odsRVData.Close;
  odsRVData.SetVariable('FK_PACID', pNAZID);
  odsRVData.Open;
  TBlobField(odsRVData.FieldByName('FB_BLOB')).SaveToStream(memStream);
  memStream.Position := 0;
  rveText.Clear;
  if pNAZID <> 0 then
    begin
      rveText.LoadRVFFromStream(memStream);
      rveText.Format;
    end;
  memStream.Free;
//------------------------------------------------------------------------------ 
  if (odsRVData.RecordCount = 0) or (pNAZID = 0) then
  begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FB_BLOB FROM TRICHVIEW_TEMPL_DEF, TRICHVIEW_TEMPL '+
                    '  WHERE TRICHVIEW_TEMPL_DEF.FK_SOTR = :PFK_SOTR '+
                    '    AND TRICHVIEW_TEMPL_DEF.FK_SMID = :PFK_SMID '+
                    '    AND TRICHVIEW_TEMPL_DEF.FK_RICHVIEW_TEML = TRICHVIEW_TEMPL.FK_ID '+
                    ' ORDER BY TRICHVIEW_TEMPL.FN_ORDER DESC ';
    ods.DeclareAndSet('PFK_SOTR', otInteger, frmMain.pSOTRID);
    ods.DeclareAndSet('PFK_SMID', otInteger, pSMIDID);
    ods.Open;
    ods.First;
    if ods.RecordCount > 0 then
      begin
        while not ods.Eof do
          begin
            memStream := TMemoryStream.Create;
            memStream.Position := 0;
            TBlobField(ods.FieldByName('FB_BLOB')).SaveToStream(memStream);
            memStream.Position := 0;
            rveText.InsertRVFFromStreamEd(memStream);
            rveText.Format;
            memStream.Clear;
            ods.Next;
          end;
      end;
  finally
    ods.Free;
  end;
  end;
end;

procedure TfrmControlProtocol.FormCreate(Sender: TObject);
begin
  if odsRVData.Active = False then
    odsRVData.Active := True;
   if odsSotr.Active = False then
    odsSotr.Active := True;
end;

procedure TfrmControlProtocol.frxRepControlProtocolGetValue(
  const VarName: string; var Value: Variant);
begin
  if VarName = 'PACFIO' then Value := frmProtocol.merFIOMK.Properties.Editors[0].Value;
  if VarName = 'DATE_ROJD' then Value := frmProtocol.merDateAgeSex.Properties.Editors[1].Value;
  if VarName = 'NUMISSL' then Value := frmProtocol.rowNumProt.Properties.Value;
  if VarName = 'NAMEISSL' then Value := frmProtocol.rowNumProt.Properties.Value;
  if VarName = 'DATEISSL' then Value := DateToStr(cxdeDateProtocol.Date)+ ' '+ cxteTimeProtocol.Text;
  if VarName = 'SOTR' then Value := cxSotr.Text;
  if VarName = 'TEXTISSL' then Value := rveText.GetSelText;
  if VarName = 'KABINET' then Value := frmMain.odsKab.FieldByName('FC_NAME').AsString;
  if VarName = 'PHONEKAB' then Value := frmMain.odsKab.FieldByName('FC_PHONE').AsString;
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;  
end;

procedure TfrmControlProtocol.N1Click(Sender: TObject);
begin
  rveText.PasteText;
  rveText.Reformat;
end;

procedure TfrmControlProtocol.N2Click(Sender: TObject);
begin
  rveText.CopyText;
end;

procedure TfrmControlProtocol.N3Click(Sender: TObject);
begin
  rveText.CutDef;
end;

procedure TfrmControlProtocol.N5Click(Sender: TObject);
begin
  if Application.MessageBox('Вы собираетесь очистить текст контрольного описания.' + #13 + #10 + 'Уверены?', 'Вопрос', MB_ICONQUESTION+MB_OKCANCEL)= IDOk then
    begin
      rveText.Clear;
      rveText.Format;
      rveText.SetFocus;
    end;
end;

procedure TfrmControlProtocol.odsSotrBeforeOpen(DataSet: TDataSet);
begin
  odsSotr.SetVariable('PFK_OTDELID', frmMain.pOTDELID);
end;

procedure TfrmControlProtocol.rveTextChange(Sender: TObject);
begin
  aPrint.Enabled := True;
end;

end.
