unit frmRlsChosePrep2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frmRlsChosePrep_B, ExtCtrls,
  StdCtrls, Db, OracleData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, fdmMain;

type
  TframeRlsChosePrep2 = class(TframeRlsChosePrep_B)
    Panel4: TPanel;
    Panel1: TPanel;
    edFilter: TEdit;
    rgFilter: TRadioGroup;
    Panel2: TPanel;
    Splitter1: TSplitter;
    dsRlsPreps: TDataSource;
    odsPrepSelect: TOracleDataSet;
    dsPrepSelect: TDataSource;
    cxGridRlsPrepsDBTableView1: TcxGridDBTableView;
    cxGridRlsPrepsLevel1: TcxGridLevel;
    cxGridRlsPreps: TcxGrid;
    odsRlsPreps: TOracleDataSet;
    cxGridRlsPrepsDBTableView1Column1: TcxGridDBColumn;
    cxGridRlsPrepsDBTableView1Column2: TcxGridDBColumn;
    cxGridRlsPrepsDBTableView1Column3: TcxGridDBColumn;
    cxGridPrepSelectDBTableView1: TcxGridDBTableView;
    cxGridPrepSelectLevel1: TcxGridLevel;
    cxGridPrepSelect: TcxGrid;
    cxGridPrepSelectDBTableView1Column1: TcxGridDBColumn;
    cxGridPrepSelectDBTableView1Column2: TcxGridDBColumn;
    cxGridPrepSelectDBTableView1Column3: TcxGridDBColumn;
    procedure odsRlsPrepsAfterOpen(DataSet: TDataSet);
    procedure odsRlsPrepsBeforeOpen(DataSet: TDataSet);
    procedure odsRlsPrepsAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    sSelectRestriction: String;
    sWhereAdition: String;
  public
    { Public declarations }
    procedure OnFormShow(aEanCode : String = ''; aNomenID : Integer = -1; aFilterChoice : Integer = 0; aFilterText : string = '' );       override;
    procedure OnFormApplyFilterExecute;                                           override;
    procedure OnFormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);  override;
    procedure UpdateCurrentPrep(var aPrepInfo  : TPrepInfo );                     override;
    procedure GetCurrentFilter(var aFilterChoice : Integer; var aFilterText : string); override;

  end;

var
  frameRlsChosePrep2: TframeRlsChosePrep2;

implementation

{$R *.DFM}

{ TframeRlsChosePrep2 }

procedure TframeRlsChosePrep2.OnFormApplyFilterExecute;
//var
//  FK_ID: Integer;
begin
  sWhereAdition := '';
  edFilter.Text := Trim(edFilter.Text); 
  if (edFilter.Text = '') and
    (Application.MessageBox(pChar('Будут выбраны все записи c заполненым полем: "'+
     rgFilter.Items[rgFilter.ItemIndex] +'"' + #10#13 +  'Вы уверены?'),
    'Внимание...', mb_yesno + mb_defbutton1 + mb_iconwarning) = idno) then exit;

  edFilter.Text := Trim(edFilter.Text);
  sWhereAdition := ' AND ' + sWhereAdition;
  Case rgFilter.ItemIndex of
    0: sWhereAdition := sWhereAdition + ' tn.iname LIKE ''%' + trim(AnsiUpperCase(edFilter.Text)) + '%''';
    1: sWhereAdition := sWhereAdition + ' UPPER(latn.name) LIKE ''%' + trim(AnsiUpperCase(edFilter.Text)) + '%''';
    2: sWhereAdition := sWhereAdition + ' n.eancode LIKE ''%' + trim(AnsiUpperCase(edFilter.Text)) + '%''';
  end;
  odsRlsPreps.Close;
  odsRlsPreps.Sql.Text := sSelectRestriction + sWhereAdition;
//  FK_ID := odsRlsPreps.FieldByName('FK_ID').AsInteger;
  odsRlsPreps.Open;

//  if odsRlsPreps.Lookup('FK_ID',FK_ID,'FK_ID') > -1 then
//  begin
//    odsRlsPreps.AfterScroll := nil;
//    odsRlsPreps.Locate('FK_ID',FK_ID,[]);
//    odsRlsPreps.AfterScroll := odsRlsPrepsAfterScroll;
//    odsRlsPrepsAfterScroll(odsRlsPreps);
//  end;
//  cxGridRlsPrepsDBTableView1.ApplyBestFit(nil);
end;

procedure TframeRlsChosePrep2.OnFormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Case Key of
    vk_F5: rgFilter.ItemIndex := 0;
    vk_F6:  rgFilter.ItemIndex := 1;
    vk_F7:  rgFilter.ItemIndex := 2;
  end;
end;

procedure TframeRlsChosePrep2.OnFormShow(aEanCode : String = ''; aNomenID : Integer = -1; aFilterChoice : Integer = 0; aFilterText : string = '' );
begin
// прикол фрейма - нужно вручную задать обработчики Воронов О.А. 15.03.2007
  odsRlsPreps.BeforeOpen  := odsRlsPrepsBeforeOpen;
  odsRlsPreps.AfterOpen   := odsRlsPrepsAfterOpen;
  odsRlsPreps.AfterScroll := odsRlsPrepsAfterScroll;
//----------------------

  rgFilter.ItemIndex := aFilterChoice;
  edFilter.Text := aFilterText;
  edFilter.SetFocus;

  sSelectRestriction := {'SELECT DISTINCT '+
//                        'VNOMENRLS.FK_ID, '+
                        'VPREPRLS.TRADENAME AS FC_TRADENAME, '+
                        'RLS.Get_ActmattersList(VNOMENRLS.FK_ID) AS FC_INT_NAME, '+
                        'VPREPRLS.LATINNAME AS FC_LATINNAME '+
    '  FROM RLS.VPREPRLS, RLS.VNOMENRLS, RLS.TPREP_PHARMAGROUP, MED.TFARMGR ' +
    ' WHERE VPREPRLS.FK_ID = VNOMENRLS.FK_PREP(+) ' +
    '   AND VPREPRLS.FK_ID = TPREP_PHARMAGROUP.FK_PREP(+) ' +
    '   AND TFARMGR.FK_FRMGR_RLS(+) = TPREP_PHARMAGROUP.FK_PHARMGROUP';}
    ' SELECT DISTINCT n.id as FK_ID, '#13#10 +
    '        substr(a.RUSNAME || DECODE(a.LATNAME,'''','''','' (''||a.LATNAME||'')''),1,150) as FC_INT_NAME,'#13#10+
    '        p.tradenameid, substr(tn.name,1,150) as FC_TRADENAME, '#13#10 +
    '        p.latinnameid, substr(latn.name,1,110) as FC_LATINNAME '#13#10 +
    '   FROM rls.nomen n, rls.prep p, RLS.tradenames tn, RLS.latinnames latn, '#13#10 +
    '        rls.prep_atc pa, rls.actmatters a  '#13#10+
    '  WHERE n.prepid = p.id  '#13#10 +
    '  and p.tradenameid = tn.id '#13#10 +
    '  and p.latinnameid = latn.id '#13#10 +
    '  AND p.id = pa.prepid(+)'#13#10 +
    '  AND pa.uniqid = a.id(+)'#13#10;


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

procedure TframeRlsChosePrep2.UpdateCurrentPrep(var aPrepInfo: TPrepInfo);
begin
  aPrepInfo.FC_PREP := odsPrepSelect.FieldByName('FC_PREP').AsString;
  aPrepInfo.FK_ID   := odsPrepSelect.FieldByName('FK_ID').AsInteger;

  aPrepInfo.NAME_INTERNATIONAL := odsRlsPreps.FieldByName('FC_INT_NAME').AsString;
  aPrepInfo.LATINE_NAME_NDV := odsRlsPreps.FieldByName('FC_LATINNAME').AsString;
  aPrepInfo.FC_EANCODE      := odsPrepSelect.FieldByName('FC_EANCODE').AsString;

//------------------------------------------------------------------------------
  aPrepInfo.FK_DFMASS_IS_NULL := odsPrepSelect.FieldByName('FK_DFMASS').IsNull;
  if not aPrepInfo.FK_DFMASS_IS_NULL then
  begin
    aPrepInfo.DFMASS    := odsPrepSelect.FieldByName('DFMASS').AsFloat;
    aPrepInfo.FK_DFMASS := odsPrepSelect.FieldByName('FK_DFMASS').AsInteger;
  end;

  aPrepInfo.FK_MASSUNIT_IS_NULL := odsPrepSelect.FieldByName('FK_MASSUNIT').IsNull;
  if not aPrepInfo.FK_MASSUNIT_IS_NULL then
  begin
    aPrepInfo.DRUGSINPPACK := odsPrepSelect.FieldByName('DRUGSINPPACK').AsFloat;
    aPrepInfo.FK_MASSUNIT  := odsPrepSelect.FieldByName('FK_MASSUNIT').AsInteger;
  end;
  aPrepInfo.FARMGRID := odsPrepSelect.FieldByName('FARMGRID').AsVariant;
end;

procedure TframeRlsChosePrep2.odsRlsPrepsAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if DataSet.IsEmpty then odsPrepSelect.Close;
  DataSet.AfterScroll := odsRlsPrepsAfterScroll;
end;

procedure TframeRlsChosePrep2.odsRlsPrepsBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  DataSet.AfterScroll := nil;
end;

procedure TframeRlsChosePrep2.odsRlsPrepsAfterScroll(DataSet: TDataSet);
//var
//  FC_INT_NAME, LATINNAME : string;

begin
  inherited;
// этот гемор нужен для корректного сравнивания значения null с пустой строкой - null = ''
//  FC_INT_NAME := odsRlsPreps.FieldByName('FC_INT_NAME').AsString;
//  if FC_INT_NAME = '' then FC_INT_NAME := ' ';
//  LATINNAME := odsRlsPreps.FieldByName('FC_LATINNAME').AsString;
//  if LATINNAME = '' then LATINNAME := ' ';

//-------------------
  odsPrepSelect.Close;
  odsPrepSelect.SQL.Text :=
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
    '        p.DFMASS, -- /*ДОЗИРОВКА ВЕЩЕСТВА*/'#13#10 +
    '        p.DFMASSID as FK_DFMASS,  -- /*ЕД массы ЛВ*/'#13#10 +
    '        n.DRUGSINPPACK,  -- /*ФАС В УПАК*/'#13#10 +
    '        n.PPACKMASSUNID as FK_MASSUNIT, -- /*ЕД. МАСС*/'#13#10 +
    '        null as FARMGRID,  -- /*ФАРМ. ГР.*/'#13#10 +
    '        p.DRUGFORMID as FK_DRUGFORM, --Код формы выпуска (вторичная упаковка)'#13#10 +
    '        n.PPACKID as FK_DRUGPACK_P --Код первичной упаковки'#13#10 +
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
    '  AND n.UPACKID = dp2.id(+)'#13#10+
    '  and p.tradenameid = '+odsRlsPreps.FieldByName('tradenameid').AsString+#13#10+
      sWhereAdition;

{    'SELECT VNOMENRLS.FK_ID, ' +
    '       VNOMENRLS.EANCODE AS FC_EANCODE, ' +
    '       VPREPRLS.RESULT || VNOMENRLS.RESULT AS FC_PREP, ' +
    '       VPREPRLS.DFMASS, /*ДОЗИРОВКА ВЕЩЕСТВА*/ ' +
    '       VPREPRLS.FK_DFMASS, /*ЕД ДОЗИРОВКИ*/ ' +
    '  VNOMENRLS.DRUGSINPPACK, /*ФАС В УПАК*/ ' +
    '  VNOMENRLS.FK_MASSUNIT,  /*ЕД. МАСС*/ ' +
    '  TFARMGR.FARMGRID /*ФАРМ. ГР.*/ ' +
    '  FROM RLS.VPREPRLS, RLS.VNOMENRLS, RLS.TPREP_PHARMAGROUP, MED.TFARMGR ' +
    ' WHERE VPREPRLS.FK_ID = VNOMENRLS.FK_PREP(+) ' +
    '   AND VPREPRLS.FK_ID = TPREP_PHARMAGROUP.FK_PREP(+) ' +
    '   AND TFARMGR.FK_FRMGR_RLS(+) = TPREP_PHARMAGROUP.FK_PHARMGROUP '+

    ' and VPREPRLS.TRADENAME = '#39+odsRlsPreps.FieldByName('FC_TRADENAME').AsString+#39+
    ' and DECODE(RLS.Get_ActmattersList(VNOMENRLS.FK_ID), null,'#39+' '+#39', '#39#39','#39+' '+#39', RLS.Get_ActmattersList(VNOMENRLS.FK_ID)) = '#39+FC_INT_NAME+#39+
    ' and DECODE(VPREPRLS.LATINNAME, null,'#39+' '+#39', '#39#39','#39+' '+#39', VPREPRLS.LATINNAME) = '#39+LATINNAME+#39+

    sWhereAdition;}
    odsPrepSelect.Open;
end;

procedure TframeRlsChosePrep2.GetCurrentFilter( var aFilterChoice: Integer; var aFilterText: string);
begin
  aFilterChoice := rgFilter.ItemIndex;
  aFilterText := edFilter.Text;
end;

end.
