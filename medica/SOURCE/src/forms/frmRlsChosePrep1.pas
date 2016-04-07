unit frmRlsChosePrep1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frmRlsChosePrep_B, StdCtrls, ComCtrls, ExtCtrls,
  Db, OracleData, fdmMain, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxMaskEdit, cxTextEdit, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGridLevel,
  cxGrid;

type
  TframeRlsChosePrep1 = class(TframeRlsChosePrep_B)
    Panel4: TPanel;
    Panel1: TPanel;
    edFilter: TEdit;
    rgFilter: TRadioGroup;
    Panel2: TPanel;
    Panel3: TPanel;
    Splitter1: TSplitter;
    gbDescription: TGroupBox;
    reDescription: TRichEdit;
    odsRlsPreps: TOracleDataSet;
    odsRlsPrepsFK_ID: TFloatField;
    odsRlsPrepsFC_EANCODE: TStringField;
    odsRlsPrepsFC_PREP: TStringField;
    odsRlsPrepsFC_TRADENAME: TStringField;
    odsRlsPrepsFC_LATINNAME: TStringField;
    odsRlsPrepsDFMASS: TFloatField;
    odsRlsPrepsFK_DFMASS: TFloatField;
    odsRlsPrepsDRUGSINPPACK: TFloatField;
    odsRlsPrepsFK_MASSUNIT: TFloatField;
    dsRlsPreps: TDataSource;
    odsDescription: TOracleDataSet;
    odsDescriptionDSDesigner: TFloatField;
    odsDescriptionDSDesigner2: TFloatField;
    odsDescriptionDSDesigner3: TStringField;
    odsDescriptionDSDesigner4: TStringField;
    odsDescriptionDSDesigner5: TStringField;
    odsDescriptionDSDesigner6: TStringField;
    odsDescriptionDSDesigner10: TStringField;
    odsDescriptionDSDesigner7: TStringField;
    odsDescriptionDSDesigner8: TMemoField;
    odsDescriptionDSDesigner9: TMemoField;
    odsDescriptionDSDesigner11: TMemoField;
    odsDescriptionDSDesigner12: TStringField;
    odsDescriptionDSDesigner13: TMemoField;
    odsDescriptionDSDesigner14: TMemoField;
    odsDescriptionDSDesigner15: TMemoField;
    odsDescriptionDSDesigner16: TMemoField;
    odsDescriptionDSDesigner17: TMemoField;
    odsDescriptionDSDesigner18: TMemoField;
    odsDescriptionDSDesigner19: TMemoField;
    odsDescriptionDSDesigner20: TMemoField;
    odsDescriptionDSDesigner21: TMemoField;
    odsDescriptionDSDesigner22: TMemoField;
    odsDescriptionDSDesigner23: TMemoField;
    odsDescriptionDSDesigner24: TMemoField;
    odsDescriptionDSDesigner25: TMemoField;
    odsDescriptionDSDesigner26: TMemoField;
    odsDescriptionDSDesigner27: TMemoField;
    odsDescriptionDSDesigner28: TMemoField;
    odsDescriptionDSDesigner29: TMemoField;
    odsDescriptionDSDesigner30: TMemoField;
    odsDescriptionDSDesigner31: TStringField;
    odsDescriptionDSDesigner32: TStringField;
    odsDescriptionEAN: TStringField;
    odsDescriptionDSDesigner33: TStringField;
    odsDescriptionLATINE_NAME_NDV: TStringField;
    grRlsPreps: TcxGrid;
    grRlsPrepsLevel1: TcxGridLevel;
    grRlsPrepsDBTableView1: TcxGridDBTableView;
    grRlsPrepsDBTableView1FK_ID: TcxGridDBColumn;
    grRlsPrepsDBTableView1FC_PREP: TcxGridDBColumn;
    grRlsPrepsDBTableView1FC_EANCODE: TcxGridDBColumn;
    grRlsPrepsDBTableView1FC_TRADENAME: TcxGridDBColumn;
    grRlsPrepsDBTableView1FC_LATINNAME: TcxGridDBColumn;
    odsRlsPrepsFARMGRID: TFloatField;
    procedure odsRlsPrepsAfterOpen(DataSet: TDataSet);
    procedure odsRlsPrepsAfterScroll(DataSet: TDataSet);
    procedure odsRlsPrepsBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    sSelectRestriction: String;    
  public
    { Public declarations }
       
    procedure OnFormShow(aEanCode : String = ''; aNomenID : Integer = -1; aFilterChoice : Integer = 0; aFilterText : string = '' );       override;
    procedure OnFormApplyFilterExecute;                                           override;
    procedure OnFormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);  override;
    procedure UpdateCurrentPrep(var aPrepInfo  : TPrepInfo );                     override;
    procedure GetCurrentFilter(var aFilterChoice : Integer; var aFilterText : string); override;
  end;

var
  frameRlsChosePrep1: TframeRlsChosePrep1;

implementation

{$R *.DFM}

//==============================================================================
// TTframeRlsChosePrep1
//==============================================================================
procedure TframeRlsChosePrep1.OnFormApplyFilterExecute;
var  sWhereAdition: String;
     FK_ID: Integer;
begin
  edFilter.Text := Trim(edFilter.Text); 
  if (edFilter.Text = '') and
    (Application.MessageBox(pChar('Будут выбраны все записи c заполненым полем: "'+
     rgFilter.Items[rgFilter.ItemIndex] +'"' + #10#13 +  'Вы уверены?'),
    'Внимание...', mb_yesno + mb_defbutton1 + mb_iconwarning) = idno) then exit;
  sWhereAdition := ' AND ' + sWhereAdition;
  Case rgFilter.ItemIndex of
    0: sWhereAdition := sWhereAdition + ' tn.iname LIKE ''%' + trim(AnsiUpperCase(edFilter.Text)) + '%''';
    1: sWhereAdition := sWhereAdition + ' UPPER(latn.name) LIKE ''%' + trim(AnsiUpperCase(edFilter.Text)) + '%''';
    2: sWhereAdition := sWhereAdition + ' n.eancode LIKE ''%' + trim(AnsiUpperCase(edFilter.Text)) + '%''';
  end;
  odsRlsPreps.Sql.Text := sSelectRestriction + sWhereAdition;

  if (odsRlsPreps.Active)and(odsRlsPreps.RecordCount > 0) then
    FK_ID := odsRlsPreps.FieldByName('FK_ID').AsInteger
  else
    FK_ID := -1;
    
  odsRlsPreps.Close;
  odsRlsPreps.Open;

  if FK_ID <> -1 then
  begin
    odsRlsPreps.AfterScroll := nil;
    odsRlsPreps.Locate('FK_ID',FK_ID,[]);
    odsRlsPreps.AfterScroll := odsRlsPrepsAfterScroll;
    odsRlsPrepsAfterScroll(odsRlsPreps);
  end;
//  grRlsPrepsDBTableView1.ApplyBestFit(nil);
end;
//------------------------------------------------------------------------------
procedure TframeRlsChosePrep1.OnFormShow(aEanCode : String = ''; aNomenID : Integer = -1; aFilterChoice : Integer = 0; aFilterText : string = '' );
begin
// прикол фрейма - нужно вручную задать обработчики Воронов О.А. 15.03.2007
  odsRlsPreps.BeforeOpen  := odsRlsPrepsBeforeOpen;
  odsRlsPreps.AfterOpen   := odsRlsPrepsAfterOpen;
  odsRlsPreps.AfterScroll := odsRlsPrepsAfterScroll;
//----------------------

  rgFilter.ItemIndex := aFilterChoice;
  edFilter.Text      := aFilterText;
  edFilter.SetFocus;

  sSelectRestriction :=
      ' SELECT n.id as FK_ID, '#13#10 +
    '        n.eancode as FC_EANCODE, '#13#10 +
    '        substr(tn.name,1,150)||'' ''||CASE WHEN nvl(p.dfmass,0) > 0 THEN '' ''||p.dfmass||'' ''||substr(mup.shortname,1,6) ELSE '''' END|| '#13#10 +
    '      CASE WHEN nvl(p.dfconc,0) > 0 THEN '' ''||p.dfconc||'' ''||substr(cn.shortname,1,20) ELSE '''' END|| '#13#10 +
    '      CASE WHEN p.DFSIZE is not null THEN '' ''||substr(p.dfsize,1,30)||'' ''||substr(su.shortname,1,30) ELSE '''' END || '#13#10 +
    '      '' ''||CASE WHEN nvl(n.PPACKID,0) = 0 AND nvl(n.drugsinppack,0) = 0 THEN '''' '#13#10 +
    '                WHEN nvl(n.PPACKID,0) = 0 AND nvl(n.drugsinppack,0) > 0 THEN '' ''||n.drugsinppack||'' шт/перв.уп.'' '#13#10 +
    '                WHEN nvl(n.PPACKID,0) > 0 AND nvl(n.drugsinppack,0) = 0 THEN '' ''||substr(dp.name,1,50) '#13#10 +
    '      ELSE '' ''||n.drugsinppack||'' шт/''||substr(dp.name,1,50) END|| '#13#10 +
    '      CASE WHEN n.PPACKMASSUNID > 0 THEN '' ''||n.ppackmass||'' ''||substr(mun.shortname,1,6) ELSE '''' END|| '#13#10 +
    '      CASE WHEN n.PPACKCUBUNID > 0 THEN '' ''||n.ppackvolume||'' ''||substr(cu.shortname,1,8) ELSE '''' END|| '#13#10 +
    '      CASE WHEN N.UPACKID = 0 AND nvl(n.ppackinupack,0) = 0 THEN '''' '#13#10 +
    '           WHEN N.UPACKID = 0 AND nvl(n.ppackinupack,0) > 0 THEN '' ''||n.ppackinupack||'' шт/втор.уп.'' '#13#10 +
    '           WHEN N.UPACKID > 0 AND nvl(n.ppackinupack,0) = 0 THEN '' ''||substr(dp2.NAME,1,50) '#13#10 +
    '      ELSE '' ''||n.ppackinupack||'' шт/''||substr(dp2.NAME,1,50) END '#13#10 +
    '      AS FC_PREP, '#13#10 +
    '        substr(tn.name,1,150) as FC_TRADENAME, '#13#10 +
    '        substr(latn.name,1,110) as FC_LATINNAME, '#13#10 +
//--------------инновационное :)------------------------------------------------
    '        p.DFMASS, -- /*ДОЗИРОВКА ВЕЩЕСТВА*/'#13#10 +
    '        p.DFMASSID as FK_DFMASS,  -- /*ЕД массы ЛВ*/'#13#10 +
    '        n.DRUGSINPPACK,  -- /*ФАС В УПАК*/'#13#10 +
    '        n.PPACKMASSUNID as FK_MASSUNIT, -- /*ЕД. МАСС*/'#13#10 +
    '        -1 as FARMGRID,  -- /*ФАРМ. ГР.*/'#13#10 +
    '        p.DRUGFORMID as FK_DRUGFORM, --Код формы выпуска (вторичная упаковка)'#13#10 +
    '        n.PPACKID as FK_DRUGPACK_P --Код первичной упаковки'#13#10 +
//------------------------------------------------------------------------------

    '   FROM rls.nomen n, rls.prep p, RLS.tradenames tn, RLS.latinnames latn, '#13#10 +
    '        RLS.massunits mup, rls.massunits mun, rls.drugpack dp, rls.drugpack dp2, RLS.sizeunits su, RLS.CONCENUNITS cn,  '#13#10 +
    '        rls.cubicunits cu  '#13#10 +
    '  WHERE n.prepid = p.id  '#13#10 +
    '  and p.tradenameid = tn.id '#13#10 +
    '  and p.latinnameid = latn.id '#13#10 +
    '  AND p.dfconcid = cn.id(+)'#13#10 +
    '  AND p.dfsizeid = su.id(+)'#13#10 +
    '  AND n.PPACKCUBUNID = cu.id(+)'#13#10 +
    '  AND n.PPACKMASSUNID = mun.id(+)'#13#10 +
    '  AND p.dfmassid = mup.id(+)'#13#10 +
    '  AND n.PPACKID = dp.id(+)'#13#10 +
    '  AND n.UPACKID = dp2.id(+)'#13#10;


  odsRlsPreps.Sql.Text := sSelectRestriction;
  if Length(aEanCode) > 0 then
  begin
    rgFilter.ItemIndex := 2;
    edFilter.Text := aEanCode;
    OnFormApplyFilterExecute;
  end
  else if aNomenID > 0 then
  begin
    odsRlsPreps.Sql.Text := sSelectRestriction +
      ' AND n.ID = ' + IntToStr(aNomenID);
    odsRlsPreps.Open;
  end;

  if aFilterText <> '' then OnFormApplyFilterExecute;
end;
//------------------------------------------------------------------------------
procedure TframeRlsChosePrep1.odsRlsPrepsAfterScroll(DataSet: TDataSet);
var I            : Integer;
    sBoldText    : String;
    sCommonText  : String;
begin
  inherited;
  odsDescription.SetVariable('FK_ID',odsRlsPreps.FieldByName('FK_ID').AsInteger);
  odsDescription.Close;
  odsDescription.Open;
  reDescription.Clear;
  For I := 2 to odsDescription.FieldCount - 1 do //пропускаются коды препаратов и номентклатуры
  begin
    if I = 11 then Continue;//пропускаем "Описание ф.д."(11) будет добавлятся к "Фармакологическое действие"(12)
    if (trim(odsDescription.Fields[I].AsString) <> '')and(odsDescription.Fields[I].FieldName <>'LATINE_NAME_NDV') then
    begin
      sBoldText := odsDescription.Fields[I].DisplayName + ':';
      sCommonText := odsDescription.Fields[I].AsString;
      if I = 12 then sCommonText := odsDescription.Fields[I-1].AsString + sCommonText; //добавление
      reDescription.Lines.Add(sBoldText + ' ' + sCommonText);
      reDescription.SelStart := Length(reDescription.Text) - Length(sBoldText + ' ' + sCommonText) - 2;
      reDescription.SelLength := Length(sBoldText);
      reDescription.SelAttributes.Style := reDescription.SelAttributes.Style + [fsBold];
      reDescription.SelAttributes.Color := clBlue;
    end;
  end;
  reDescription.SelLength := 0;
end;
//------------------------------------------------------------------------------
procedure TframeRlsChosePrep1.odsRlsPrepsAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if DataSet.IsEmpty then reDescription.Clear;
  DataSet.AfterScroll := odsRlsPrepsAfterScroll;
end;
//------------------------------------------------------------------------------
procedure TframeRlsChosePrep1.odsRlsPrepsBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  DataSet.AfterScroll := nil;
end;
//------------------------------------------------------------------------------
procedure TframeRlsChosePrep1.OnFormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Case Key of
    vk_F5: rgFilter.ItemIndex := 0;
    vk_F6:  rgFilter.ItemIndex := 1;
    vk_F7:  rgFilter.ItemIndex := 2;
  end;
end;
//------------------------------------------------------------------------------
procedure TframeRlsChosePrep1.UpdateCurrentPrep(var aPrepInfo  : TPrepInfo );
begin
  aPrepInfo.FC_PREP := odsRlsPreps.FieldByName('FC_PREP').AsString;
  aPrepInfo.FK_ID   := odsRlsPreps.FieldByName('FK_ID').AsInteger;

  aPrepInfo.NAME_INTERNATIONAL := odsDescription.FieldByName('НДВ').AsString;
  aPrepInfo.LATINE_NAME_NDV := odsDescription.FieldByName('LATINE_NAME_NDV').AsString;
  aPrepInfo.FC_EANCODE      := odsRlsPreps.FieldByName('FC_EANCODE').AsString;

//------------------------------------------------------------------------------
  aPrepInfo.FK_DFMASS_IS_NULL := odsRlsPreps.FieldByName('FK_DFMASS').IsNull;
  if not aPrepInfo.FK_DFMASS_IS_NULL then
  begin
    aPrepInfo.DFMASS    := odsRlsPreps.FieldByName('DFMASS').AsFloat;
    aPrepInfo.FK_DFMASS := odsRlsPreps.FieldByName('FK_DFMASS').AsInteger;
  end;

  aPrepInfo.FK_MASSUNIT_IS_NULL := odsRlsPreps.FieldByName('FK_MASSUNIT').IsNull;
  if not aPrepInfo.FK_MASSUNIT_IS_NULL then
  begin
    aPrepInfo.DRUGSINPPACK := odsRlsPreps.FieldByName('DRUGSINPPACK').AsFloat;
    aPrepInfo.FK_MASSUNIT  := odsRlsPreps.FieldByName('FK_MASSUNIT').AsInteger;
  end;
  aPrepInfo.FARMGRID := odsRlsPreps.FieldByName('FARMGRID').AsVariant;
end;
//------------------------------------------------------------------------------
procedure TframeRlsChosePrep1.GetCurrentFilter( var aFilterChoice: Integer; var aFilterText: string);
begin
  aFilterChoice := rgFilter.ItemIndex;
  aFilterText := edFilter.Text;
end;

end.
