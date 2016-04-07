unit UnECGMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, DCM_Attributes, DCM_Client, StdCtrls, DCM_Dict,
  DCM_UID, ExtCtrls, Math, OleCtrls, SHDocVw, Dcm_View, DCM32, DicomVFWView,
  cxGraphics, cxCustomData, cxStyles, cxTL, cxControls, cxInplaceContainer,
  fHeader , DICOM_charset, cxTextEdit, dxSkinsCore, Medotrade,
  dxSkinOffice2007Black, dxSkinOffice2007Green, RVScroll, RichView, RVStyle,
  dxSkinBlack, xmldom, XMLIntf, msxmldom, XMLDoc ;

type
  TfrmECGMain = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Memo1: TMemo;
    TabSheet3: TTabSheet;
    Label1: TLabel;
    edModality: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edCodeValue1: TEdit;
    Label6: TLabel;
    edCodingSchemeDesignator1: TEdit;
    Label7: TLabel;
    edCodeMeaning1: TEdit;
    memAcquisitionContextSequence: TMemo;
    memConceptCodeSequence: TMemo;
    tsGraph: TTabSheet;
    ScrollBox1: TScrollBox;
    pb1: TPaintBox;
    TEST: TTabSheet;
    Memo2: TMemo;
    Panel1: TPanel;
    Label3: TLabel;
    Panel2: TPanel;
    rv15: TRadioButton;
    rv20: TRadioButton;
    rv25: TRadioButton;
    Panel3: TPanel;
    Label8: TLabel;
    rb25: TRadioButton;
    rb50: TRadioButton;
    rb100: TRadioButton;
    rv40: TRadioButton;
    rv75: TRadioButton;
    rv10: TRadioButton;
    Button1: TButton;
    rv5: TRadioButton;
    Label9: TLabel;
    Label10: TLabel;
    tsPDF: TTabSheet;
    WebBrowser1: TWebBrowser;
    Panel4: TPanel;
    Button2: TButton;
    rb200: TRadioButton;
    rb400: TRadioButton;
    TabSheet4: TTabSheet;
    Panel5: TPanel;
    Button3: TButton;
    ScrollBox2: TScrollBox;
    Button4: TButton;
    cbCUT: TCheckBox;
    Button5: TButton;
    Button6: TButton;
    Image1: TImage;
    Label11: TLabel;
    edTimeMs: TEdit;
    edValMax: TEdit;
    Label13: TLabel;
    N3: TMenuItem;
    Button7: TButton;
    TabSheet5: TTabSheet;
    PaintBox1: TPaintBox;
    tsVCL: TTabSheet;
    DicomMultiViewer1: TDicomMultiViewer;
    CnsDMTable1: TCnsDMTable;
    GroupBox1: TGroupBox;
    Button8: TButton;
    cxTreeList1: TcxTreeList;
    TabSheet6: TTabSheet;
    cxTreeList1cxTreeListColumn1: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn2: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn3: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn4: TcxTreeListColumn;
    TabSheet7: TTabSheet;
    Label12: TLabel;
    edTransferSyntax: TEdit;
    Memo3: TMemo;
    Memo4: TMemo;
    Button9: TButton;
    Label14: TLabel;
    edTransferSyntaxID: TEdit;
    rvs: TRVStyle;
    TabSheet9: TTabSheet;
    WB: TWebBrowser;
    XML1: TMenuItem;
    tsXML: TTabSheet;
    XML: TXMLDocument;
    memXML: TMemo;
    procedure N2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pb1Paint(Sender: TObject);
    procedure tsGraphShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure tsPDFShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button5Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure TabSheet7Show(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure XML1Click(Sender: TObject);
  private
    procedure ShowEcgData(p_filename:string);
  public
    vX1,vY1,
    vX2,vY2,
    vH,vW : Integer;
    vFileName : AnsiString;
    vCutImg : TImage;
    vColorECGGet : Boolean;
    procedure FrmCutImgRefresh;
    procedure ImgIni;
    procedure drawX ( x,y, Xwidth : integer );
    function GetRValue(rgb: DWORD): Byte;
    function GetGValue(rgb: DWORD): Byte;
    function GetBValue(rgb: DWORD): Byte;
    function RgbToGray(RGBColor: TColor): TColor;
    procedure loadImageToCanvas (FileName:AnsiString);
    procedure showEcgArray;
    function gt_frmtMy ( p_str:string; p_size:integer ) : string;

  end;

var
  frmECGMain: TfrmECGMain;
  v_MainFilename : string;

type MyType = SmallInt;
     r_channel = record
              r_chann_cmn  : Integer; // номер канала
              r_name       : string;  // наименование канала
              r_channel    : Integer; // номер канала в группе
              r_edizm_shrt : string;  // ед.изм - короткое наименование
              r_edizm_lrg  : string;  // ед.изм - длинное наименование
              r_SamplingFrequency : Integer; // частота измерений в секунду
     end;
     r_cmn = record            // v_n_channel, v_n_group
              r_amm        : Integer; // кол-во измерений
//              r_freq       : Integer; // частота измерений
              r_channel : array of r_channel;
              r_data : array of array of Integer;  // массив измерений
     end;
var v_data : array of r_cmn;
    v_min_val, v_max_val, v_cmn_amm, v_amm_pnt, v_max_pnt_in_group,
    v_SamplingFrequency : Integer;
    v_kx, v_ky :Extended;
    das: TDicomDataset;
    v_ts : string;

const c_dir = 'c:\Delphi\Trunk_AUTH\ASU2\Dicom\MyEcgViewer\data\mytest\';
      c_DicomIniFile = 'c:\Delphi\Trunk_AUTH\ASU2\Dicom\MyEcgViewer\data\Кардиоджет\25_02_2013\export_ecg_cardiojet_with_binary_data_32708.dcm';
      c_ImageFile = 'c:\Delphi\Trunk_AUTH\ASU2\Dicom\MyEcgViewer\data\mytest\1.bmp';
      cTempFile = c_dir+'tmp$.bmp';
      c_partition = 3;
      c_kletka = 15;   // шаг клетки в пикселях
      c_height = 2*3*2*c_kletka ; // 3 вверх и 3 вниз от центральной линии

implementation

{$R *.dfm}

procedure TfrmECGMain.ShowEcgData(p_filename:string);
var v_cur : TCursor;
    i, l, m, n, o, fBufferSize,
    v_Datalen,x,y, v_ll, ppp,
    v_cmn_ln,
    v_amm, v_AmmChannels, v_amms,
    v_n_channel, v_n_group, x1,y1,
    i1,i2, i3,i4 : Integer;
    DA, da1, da2, da3, da4, da5,
    daDATA, da6, da7, daPDF : TDicomAttribute;
    b1: TOBStream;
    fBuffer, pp : Pointer;
    MemStream : Tmemorystream;
    v_var_tmp, v_var_tmp1 : MyType;
    F : File of MyType;
    v_str, v_str_tmp, vValueType : string;
    vb1,vb2 : Byte;
    v_height, v_width ,
    v_x_top, v_y_bottom,
    v_x_cur, v_y_cur,
    v_k_x, v_k_y, x2,y2, i22  : integer;
    vFileName : ansistring;
    FF : TextFile;
    //vStrLst : TStringList;

const c_rzd = '-------------------------------------------------------------------------';
      c_tb  = '        ';
  procedure wrtHead;
  begin
    Writeln( FF, '<html><head><title>Comprehensive SR Document</title>'+
                 '<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">'+
                 '<meta name="generator" content="Dicom VCL"></head><body>' );
  end;
  procedure wrtFooter;
  begin
    Writeln( FF, '</body>' );
  end;    
  // Сохранение текста в файл для вывода в браузере
  // pTxt          - текст
  // pTypeText     - тип шрифта 0-обычный 1-обычный BOLD 2-большой bold 3-маленький 4-under 5-upper small
  // pIsBreakLine  - =True перенос строки после текста
  procedure wrtSrText ( pTxt : AnsiString; pTypeText:Integer=0; pIsBreakLine:Boolean=False );
  begin
    if ((Trim(pTxt)='') and pIsBreakLine) then Exit;    
    if pTypeText=0 then
      Writeln( FF, pTxt )
    else if pTypeText=1 then
      Writeln( FF, '<b>'+pTxt+'</b>' )
    else if pTypeText=2 then
      Writeln( FF, '<h1>'+pTxt+'</h1>' )
    else if pTypeText=3 then
      Writeln( FF, '<p><small>'+pTxt+'</small></p>' )
    else if pTypeText=4 then
      Writeln( FF, '<p><small><span class="under">'+pTxt+'</span></small></p>' )
    else if pTypeText=5 then
      Writeln( FF, '<a><sup><small>'+pTxt+'</a></sup></small>' );
    if pIsBreakLine then  Writeln( FF, '</BR>' );    
  end;    
  procedure sh_part1 ( p_mem : TMemo; p_da_mn : TDicomAttribute; p_ind_mn1, p_ind_mn2 : integer; p_str : string  );
  var m : Integer; p_da_prt : TDicomAttribute;
  begin
    p_da_prt := p_da_mn.Attributes[I].Item[ p_ind_mn1, p_ind_mn2 ];
    if assigned(p_da_prt) then
    for m := 0 to p_da_prt.GetCount - 1 do
    begin
      p_mem.Lines.Append(' ');
      p_mem.Lines.Append( p_str+' ITEM = '+inttostr(m) );
      p_mem.Lines.Append( '3 CodeValue = '+ p_da_prt.Attributes[m].GetString( $0008,$0100 ) );
      p_mem.Lines.Append( '3 CodingSchemeDesignator = '+ p_da_prt.Attributes[m].GetString( $0008,$0102 ) );
      p_mem.Lines.Append( '3 CodingSchemeVersion = '+ p_da_prt.Attributes[m].GetString( $0008,$0103 ) );
      p_mem.Lines.Append( '3 CodeMeaning = '+ p_da_prt.Attributes[m].GetString( $0008,$0104 ) );
      p_mem.Lines.Append( '3 NumericValue = '+ p_da_prt.Attributes[m].GetString( $40,$A30A ) );
    end;
  end;
  //
  procedure showUSmodality;
//  var vCnt : Integer;
  begin
    if das.Attributes.GetString( $8, $60 )='US' then
    begin
      PageControl1.ActivePageIndex := 7 ;

    {  DicomMultiViewer1.DicomDatasets := nil;
      CnsDMTable1.LoadFromFile(p_filename);

      CnsDMTable1[0].Attributes.Remove($2, $10);

      CnsDMTable1[0].Attributes.AddVariant($2, $10, edTransferSyntax.Text);

      DicomMultiViewer1.DicomDatasets := CnsDMTable1;  }

      DicomMultiViewer1.Align := alClient;

    end;
  end;
  function add_nl ( p_str:string; p_amm:Integer ):string;
  var s:string; ii:Integer;
  begin
    s:=p_str;
    for Ii := 1 to p_amm do s:='0'+s;
    Result:=s;
  end;
  procedure attr_tree_crt ( p_DicomAttributes : TDicomAttributes;
                            p_parent : TcxTreeListNode = nil
                          );
  var i, v_Index :Integer;
      v_cxTreeListNode : TcxTreeListNode;
      v_Group, v_Element : string;
    procedure line_add;
    begin
      v_Group   := IntToStr(p_DicomAttributes.ItemByIndex[i].FDict.getGroup);
      v_Element := IntToStr(p_DicomAttributes.ItemByIndex[i].FDict.getElement);
      cxTreeList1.BeginUpdate;
      if p_parent=nil then
        v_cxTreeListNode := cxTreeList1.Add
      else
        v_cxTreeListNode := p_parent.AddChild;
      v_cxTreeListNode.Texts[0] := add_nl(v_Group,4-length(v_Group))+':'+
                                 add_nl(v_Element,4-length(v_Element));
      v_cxTreeListNode.Texts[1] := p_DicomAttributes.ItemByIndex[i].FDict.getVR ;
      if v_cxTreeListNode.Texts[1]<>'UNKNOWN' then
        if not v_strList.Find(add_nl(v_Group,4-length(v_Group)),v_Index) then
          v_strList.Add(add_nl(v_Group,4-length(v_Group)));
      v_cxTreeListNode.Texts[2] := p_DicomAttributes.ItemByIndex[i].FDict.Description ;
      v_cxTreeListNode.Texts[3] := Copy(gt_charset_value(p_DicomAttributes, p_DicomAttributes.ItemByIndex[i].AsString[0]), 1, 100) ;
      cxTreeList1.EndUpdate;
    end;
  begin
    if not assigned(p_DicomAttributes) then
      exit;
    p_DicomAttributes.Sort;
    for I := 0 to p_DicomAttributes.Count - 1 do // Iterate
    begin
      if p_DicomAttributes.ItemByIndex[i].DataType <> ddtAttributes then
      begin
        line_add;
      end else
      begin
        line_add;
        attr_tree_crt( p_DicomAttributes.ItemByIndex[i].Attributes[0], v_cxTreeListNode );
      end;
    end;
  end;
  //
  procedure DcmFrmTree ( pDicomAttribute : TDicomAttribute; pShowTextTags:Boolean=False );
  var i:Integer;
    procedure strTagWrt ( pfsDicomAttribute : TDicomAttribute;
                          pi       : Integer;
                          pGrp     : Word;
                          pEl      : Word;
                          pStr     : string ='';
                          pStrAft  : string ='';
                          pFont    : integer = 0;
                          pNewLine : boolean = True );
    begin
      if Assigned(pfsDicomAttribute.Attributes[pi].Item[ pGrp, pEl ] ) then
        if pfsDicomAttribute.Attributes[pi].GetString( pGrp, pEl )<>'' then
          if pStr='' then
            wrtSrText ( Trim( pfsDicomAttribute.Attributes[pi].GetString( pGrp, pEl )+' '+pStrAft ) , pFont, pNewLine )
          else
            wrtSrText ( Trim( pStr+' '+pfsDicomAttribute.Attributes[pi].GetString( pGrp, pEl )+' '+pStrAft ) , pFont, pNewLine );
    end;
    function GtStrTag ( pfsDicomAttribute : TDicomAttribute; pi:Integer; pGrp, pEl : Word; pStr:string ='' ):string;
    begin
      if Assigned(pfsDicomAttribute.Attributes[pi].Item[ pGrp, pEl ] ) then
        Result := pStr+pfsDicomAttribute.Attributes[pi].GetString( pGrp, pEl )
      else
        Result := '';
    end;
    procedure strTagTreeLoop ( pfsDicomAttribute : TDicomAttribute; pi:Integer; pGrp, pEl : Word; pNewLine:Boolean=True );
    begin
      if Assigned(pfsDicomAttribute.Attributes[pi].Item[ pGrp, pEl ] ) then
      begin
        if pNewLine then wrtSrText ( '', 0, True );
        DcmFrmTree( pfsDicomAttribute.Attributes[pi].Item[ pGrp, pEl ] );
      end;
    end;
    procedure pValTypeShow ( pHeaderStr:string; pfDicomAttribute : TDicomAttribute; pi:Integer; pValueType:string; pRelShow:Word=0 );
    var vStrTmp, vStrTmp1 :string;
      function MyChkAss ( pGrp,pEl:Integer ):Boolean;
      begin
        Result:=Assigned(pfDicomAttribute.Attributes[pi].Item[ pGrp, pEl ] );
      end;
      function gtStr( pStr:string ):string;
      begin
        if pStr='Text Code' then Result:=''
        else if pStr='Code' then Result:=''
        else Result:=pStr;
      end;
    begin
      if pHeaderStr<>'' then wrtSrText ( pHeaderStr, 0, True );
    //  strTagWrt ( pfDicomAttribute, pi, $40, $A30A );   // NumericValue
      strTagTreeLoop( pfDicomAttribute, pi, $40, $A073 );
      strTagTreeLoop( pfDicomAttribute, pi, $40, $A043 );

      strTagTreeLoop( pfDicomAttribute, pi, $40, $A300 );
      strTagTreeLoop( pfDicomAttribute, pi, $40, $A730 ); // ContentSequence
      strTagTreeLoop( pfDicomAttribute, pi, $8, $1199 );  // ReferencedSOPSequence
    //  strTagTreeLoop( pfDicomAttribute, pi, $40, $A168 );
      //
      if MyChkAss( $40, $A168 ) then
      begin
        vStrTmp := gtStr ( TDicomAttribute(pfDicomAttribute.Attributes[pi].Item[ $0040, $A168 ]).Attributes[0].GetString($0008, $0104) ) ;
        if vStrTmp<>'Sample Code' then                         // !!!!!!!!!!!!!!!!!!!!
          wrtSrText ( Trim( vStrTmp ) , 0, True );
      end else
      if ((pValueType='TEXT') and MyChkAss($0040, $A160 ) and MyChkAss($0040, $A043 ) )
      then begin
        vStrTmp := ''; // gtStr ( TDicomAttribute(pfDicomAttribute.Attributes[pi].Item[ $0040, $A043 ]).Attributes[0].GetString($0008, $0104) ) ;
        strTagWrt ( pDicomAttribute, i, $40, $A160, vStrTmp );
      end else
      //
      if MyChkAss( $0040, $A043 ) and  MyChkAss( $0040, $A300 )
      then begin
        vStrTmp := gtStr ( TDicomAttribute(pfDicomAttribute.Attributes[pi].Item[ $0040, $A043 ]).Attributes[0].GetString($0008, $0104) ) ;
        wrtSrText ( Trim( vStrTmp ) , 0, True );
      end else
      if ( Assigned(pfDicomAttribute.Attributes[pi].Item[ $0040, $A30A ] ) and
           Assigned(pfDicomAttribute.Attributes[pi].Item[ $0040, $08EA ] ) )    // MeasurementUnitsCodeSequence
      then begin
        vStrTmp := TDicomAttribute(pfDicomAttribute.Attributes[pi].Item[ $0040, $08EA ]).Attributes[0].GetString($0008, $0100) ;
        strTagWrt ( pDicomAttribute, i, $40, $A30A, '', vStrTmp);
      end else
      //
     if Assigned(pDicomAttribute.Attributes[i].Item[ $0040, $A043 ] ) and // Sequence Data
         Assigned(pDicomAttribute.Attributes[i].Item[ $0040, $A120 ] )    // DateTime
     then begin
        strTagWrt ( pDicomAttribute, i, $40, $A120, ' ' );
      end else
      if Assigned(pDicomAttribute.Attributes[i].Item[ $0040, $A043 ] ) and // Sequence Data
         Assigned(pDicomAttribute.Attributes[i].Item[ $0040, $A121 ] )    // Date
      then begin
        strTagWrt ( pDicomAttribute, i, $40, $A121, ' ' );
      end else
      if Assigned(pDicomAttribute.Attributes[i].Item[ $0040, $A043 ] ) and // Sequence Data
         Assigned(pDicomAttribute.Attributes[i].Item[ $40, $A122 ] )      // Time
      then begin
        strTagWrt ( pDicomAttribute, i, $40, $A122, ' ' );
      end else
      if Assigned(pDicomAttribute.Attributes[i].Item[ $0040, $A043 ] ) and // Sequence Data
         Assigned(pDicomAttribute.Attributes[i].Item[ $40, $A123 ] )      // PersonName
      then begin
        strTagWrt ( pDicomAttribute, i, $40, $A123, ' ' );
      end else
      if pValueType='UIDREF' then begin
        vStrTmp := '' ; // TDicomAttribute(pfDicomAttribute.Attributes[pi].Item[ $0040, $A043 ]).Attributes[0].GetString($0008, $0104) ;
        if Assigned(pfDicomAttribute.Attributes[pi].Item[ $0040, $A043 ]) then
          strTagWrt ( pfDicomAttribute, pi, $40, $A124, vStrTmp )
        else
          strTagWrt ( pfDicomAttribute, pi, $40, $A124, '' );
      end else if pValueType='CONTAINER' then begin
        strTagTreeLoop( pfDicomAttribute, pi, $40, $A124, False );  
      end else if pValueType='TEXT' then begin
        if Assigned(pfDicomAttribute.Attributes[pi].Item[ $08, $0104 ] ) then
          if ((pfDicomAttribute.Attributes[pi].GetString( $08, $0104 ) <> 'Text Code')
          and (pfDicomAttribute.Attributes[pi].GetString( $08, $0104 ) <> 'Code')
          and (pfDicomAttribute.Attributes[pi].GetString( $08, $0104 ) <> 'Sample Code'))
          then
            strTagWrt ( pfDicomAttribute, pi, $08, $0104, '', '', 1, False );
      end else if pValueType='COMPOSITE' then begin
        wrtSrText ( 'COMPOSITE (references to other composite objects, such as reports) : ', 0, True );
      end else if pValueType='IMAGE' then begin
      //  RichView1.AddNL( 'Снимок (references to image objects) :' ,0,0);
      end else if pValueType='CODE' then begin
      //  RichView1.AddNL( 'coded entries :' ,0,0);
      end else if pValueType='NUM' then begin
      //  RichView1.AddNL( 'numeric measurements with units :' ,0,0);
      end else if pValueType='PNAME' then begin
        strTagWrt ( pfDicomAttribute, pi, $0040, $A123, 'Person Name :' );
      end else if pValueType='DATE' then begin
        strTagWrt ( pfDicomAttribute, pi, $40, $A121 );
      end else if pValueType='TIME' then begin
        strTagWrt ( pfDicomAttribute, pi, $40, $A122 );
      end else if pValueType='DATETIME' then begin
        strTagWrt ( pfDicomAttribute, pi, $40, $A120 );
      end else if pValueType='WAVEFORM' then begin
        wrtSrText ( 'references to waveforms :', 0, True );
      end else if pValueType='SCOORD' then begin
        wrtSrText ( 'spatial coordinates :', 0, True );
      end else if pValueType='TCOORD' then begin
        wrtSrText ( 'temporal coordinates :', 0, True );
      end else begin
     {   if vValueType<>'' then
          wrtSrText ( ' ОШИБКА : ТИП НЕ ОПРЕДЕЛЕН : '+vValueType, 0, True );
      end else
      begin  }
      //  strTagWrt ( pfDicomAttribute, pi, $40, $A160 );   // TextValue
        strTagWrt ( pDicomAttribute, i, $08, $0104, '', ' ', 1, True );  // CodeMeaning - text comment
      end;
    end;
  var v_tmp : string;
  begin
    if (Assigned(pDicomAttribute) and (pDicomAttribute<>nil)) then
    for I := 0 to pDicomAttribute.GetCount - 1 do
    begin
      if pDicomAttribute.Attributes[i].GetString( $8, $A104 )='Length Unit'
      then begin
        strTagWrt ( pDicomAttribute, i, $8, $100, '', ' ' );
      end else
      if Assigned(pDicomAttribute.Attributes[i].Item[ $08, $0104 ] ) and pShowTextTags then
        strTagWrt ( pDicomAttribute, i, $08, $0104, '', ' ', 1, False );
      vValueType:=GtStrTag ( pDicomAttribute, i, $40, $A040 );
      v_str := GtStrTag ( pDicomAttribute, i, $40, $A030 )+' '+
                          StringReplace( GtStrTag ( pDicomAttribute, i, $40, $A075, ' ' ), '^',' ', [rfReplaceAll, rfIgnoreCase])+' '+
                          GtStrTag ( pDicomAttribute, i, $40, $A027, ' ' ) ;
      if Trim(v_str)<>'' then wrtSrText ( 'Verifying Observers : '+v_str, 0, True );
      if Assigned(pDicomAttribute.Attributes[i].Item[ $40, $A010 ] ) then begin  //  Relationship Types
        v_tmp := pDicomAttribute.Attributes[i].GetString( $40, $A010 ) ;
        if v_tmp='HAS OBS CONTEXT' then begin
          pValTypeShow ( 'OBSERVATION CONTEXT :', pDicomAttribute, i, vValueType, 1 );
        end else if v_tmp='HAS ACQ CONTEXT' then begin
          pValTypeShow ( 'ACQUISITION CONTEXT :', pDicomAttribute, i, vValueType, 2 );
        end else if v_tmp='CONTAINS' then begin
          pValTypeShow ( '', pDicomAttribute, i, vValueType, 3 );
        end else if v_tmp='INFERRED FROM' then begin
          pValTypeShow ( 'INFERRED : ', pDicomAttribute, i, vValueType, 4 );
        end else if v_tmp='HAS PROPERTIES' then begin
          pValTypeShow ( 'Properties : ', pDicomAttribute, i, vValueType, 5 );
        end else if v_tmp='SELECTED FROM' then begin
          pValTypeShow ( 'SELECTED FROM : ', pDicomAttribute, i, vValueType, 6 );
        end else if v_tmp='HAS CONCEPT MOD' then begin
          pValTypeShow ( '', pDicomAttribute, i, vValueType, 7 ); //  Concept Modifier :
        end else begin
          pValTypeShow ( '', pDicomAttribute, i, vValueType );
        end;
      end else
        pValTypeShow ( '', pDicomAttribute, i, vValueType );
      strTagWrt ( pDicomAttribute, i, $8, $1150, 'SOPClassUID :' );      // ReferencedSOPClassUID
      strTagWrt ( pDicomAttribute, i, $8, $1155, 'SOPInstanceUID :' );   // ReferencedSOPInstanceUID
    end;
  end;
var nn : Integer;
  procedure shHeadInfo ( pGrp, pEl : Integer; pTxt : string );
  begin
    if Assigned(das.Attributes.Item[ pGrp, pEl ] ) then
        if das.Attributes.GetString( pGrp, pEl )<>'' then
        begin
          wrtSrText ( pTxt, 1, False );
          wrtSrText ( das.Attributes.GetString( pGrp, pEl ), 0, True );
        end;
  end;
begin // Загрузка данных после открытия файла
  v_cur := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    Memo1.Lines.Clear;
   // CnsDMTable1.LoadFromFile(p_filename);
    //
//    das := TDicomDataset.Create;
    das.LoadFromFile(p_filename);


//    das.Attributes.WaveFormData;


    v_MainFilename := p_filename;
    Memo1.Visible:=False;
     { if das.InfoAttributes.Count=0 then
      begin
        if das.Attributes.ImageData<>nil then
          das.PrepareInfoAttributes(
             das.Attributes.ImageData.ImageData[0].TransferSyntax
             );
      end;  }
      attr_tree_crt( das.InfoAttributes );
      // FAttributes
      attr_tree_crt( das.Attributes );

    das.Attributes.ListAttrinute('', Memo1.Lines);
    Memo1.Visible:=True;
    //
    edModality.Text := das.Attributes.GetString(8, $60);
    // -----------------Meta-----------------
    v_ts := das.Attributes.GetString( $2, $10 );

    memAcquisitionContextSequence.Lines.Append(c_rzd);
    memConceptCodeSequence.Lines.Append('(0002,0001) [OB] File Meta Information Version = ' + das.Attributes.GetString( $2, $1 ) );
    memConceptCodeSequence.Lines.Append('(0002,0002) [UI] Media Storage SOP Class UID = ' + das.Attributes.GetString( $2, $2 ) );
    memConceptCodeSequence.Lines.Append('(0002,0003) [UI] Media Storage SOP Instance UID = ' + das.Attributes.GetString( $2, $3 ) );
    memConceptCodeSequence.Lines.Append('(0002,0010) [UI] Transfer Syntax UID = ' + das.Attributes.GetString( $2, $10 ) );
    memConceptCodeSequence.Lines.Append('(0002,0012) [UI] Implementation Class UID = ' + das.Attributes.GetString( $2, $12 ) );
    memConceptCodeSequence.Lines.Append('(0002,0013) [SH] Implementation Version Name = ' + das.Attributes.GetString( $2, $13 ) );
    memConceptCodeSequence.Lines.Append('(0002,0016) [AE] Source Application Entity Title = ' + das.Attributes.GetString( $2, $16 ) );
    memAcquisitionContextSequence.Lines.Append(c_rzd);
    // -----------------Data-----------------
    memConceptCodeSequence.Lines.Append('(0008,0005) [CS] Specific Character Set = ' + das.Attributes.GetString( $8, $5 ) ); 
    memConceptCodeSequence.Lines.Append('(0008,0012) [DA] Instance Creation Date = ' + das.Attributes.GetString( $8, $12 ) );
    memConceptCodeSequence.Lines.Append('(0008,0013) [TM] Instance Creation Time = ' + das.Attributes.GetString( $8, $13 ) );
    memConceptCodeSequence.Lines.Append('(0008,0016) [UI] SOP Class UID = ' + das.Attributes.GetString( $8, $16 ) );
    memConceptCodeSequence.Lines.Append('(0008,0018) [UI] SOP Instance UID = ' + das.Attributes.GetString( $8, $18 ) );
    memConceptCodeSequence.Lines.Append('(0008,0020) [DA] Study Date = ' + das.Attributes.GetString( $8, $20 ) );
    memConceptCodeSequence.Lines.Append('(0008,0021) [DA] Series Date = ' + das.Attributes.GetString( $8, $21 ) );
    memConceptCodeSequence.Lines.Append('(0008,0030) [TM] Study Time = ' + das.Attributes.GetString( $8, $30 ) );
    memConceptCodeSequence.Lines.Append('(0008,0031) [TM] Series Time = ' + das.Attributes.GetString( $8, $31 ) );
    memConceptCodeSequence.Lines.Append('(0008,0060) [CS] Modality = ' + das.Attributes.GetString( $8, $60 ) );
    memConceptCodeSequence.Lines.Append('(0008,0064) [CS] Conversion Type = ' + das.Attributes.GetString( $8, $64 ) );
    memConceptCodeSequence.Lines.Append('(0008,0070) [LO] Manufacturer = ' + das.Attributes.GetString( $8, $70 ) );
    memConceptCodeSequence.Lines.Append('(0008,0080) [LO] Institution Name = ' + das.Attributes.GetString( $8, $80 ) );
    memConceptCodeSequence.Lines.Append('(0008,0090) [PN] Referring Physician?s Name = ' + das.Attributes.GetString( $8, $90 ) );
    memConceptCodeSequence.Lines.Append('(0008,1030) [LO] Study Description = ' + das.Attributes.GetString( $8, $1030 ) );
    memConceptCodeSequence.Lines.Append('(0010,0010) [PN] Patient''s Name = ' + das.Attributes.GetString( $10, $10 ) );
    memConceptCodeSequence.Lines.Append('(0010,0030) [DA] Patient''s Birth Date = ' + das.Attributes.GetString( $10, $30 ) );
    memConceptCodeSequence.Lines.Append('(0010,0032) [TM] Patient''s Birth Time = ' + das.Attributes.GetString( $10, $32 ) );
    memConceptCodeSequence.Lines.Append('(0010,0040) [CS] Patient''s Sex = ' + das.Attributes.GetString( $10, $40 ) );
    memConceptCodeSequence.Lines.Append('(0020,000D) [UI] Study Instance UID = ' + das.Attributes.GetString( $20, $D ) );
    memConceptCodeSequence.Lines.Append('(0020,000E) [UI] Series Instance UID = ' + das.Attributes.GetString( $20, $E ) );
    memConceptCodeSequence.Lines.Append('(0020,0011) [IS] Series Number = ' + das.Attributes.GetString( $20, $11 ) );
    // -------------------------------------------------------------------------
    if das.Attributes.GetString( $8, $60 )='OT' then
    begin  // модальность прочие -  для PDF
      memConceptCodeSequence.Lines.Append('($42, $12) [LO] type of encapsulated document = ' + das.Attributes.GetString( $42, $12 ) );
      if das.Attributes.GetString( $42, $12 )='application/pdf' then
      begin
        memConceptCodeSequence.Lines.Append('(0042,0010) [ST] Document Title = ' + das.Attributes.GetString( $42, $10 ) );
        daPDF := das.Attributes.Item[ $42,$11 ];
        if assigned(daPDF) then
        begin
          daPDF.SaveToFile('c:\1.pdf');
        end
        else
          memConceptCodeSequence.Lines.Append('!!! not assigned PDF tag ($42,$11)');
      end;
    //  das.Free;
      Screen.Cursor := v_cur;
      Exit;
    // -------------------------------------------------------------------------
    end else if das.Attributes.GetString( $8, $60 )='SR' then   // ULTRASOUND
    begin
      vFileName := 'c:\SR'+inttostr( GetTickCount )+'.tmp';
      AssignFile( FF, vFileName );
      Rewrite(FF); wrtHead;

      if Assigned(das.Attributes.Item[ $10, $10 ] ) then
      begin
        wrtSrText ( 'Пациент : ', 1, False );
        wrtSrText ( StringReplace( das.Attributes.GetString( $10, $10 ), '^',' ',[rfReplaceAll, rfIgnoreCase]), 0, True );
      end;

      shHeadInfo ( $10, $30, 'Дата рождения : ' );

      if Assigned(das.Attributes.Item[ $10, $40 ] ) then
        if das.Attributes.GetString( $10, $40 )='F' then begin
          wrtSrText ( 'Пол : ', 1, False );
          wrtSrText ( 'женский', 0, True );
        end else begin
          wrtSrText ( 'Пол : ', 1, False );
          wrtSrText ( 'мужской', 0, True );
        end;

      shHeadInfo ( $8, $1030, 'Исследование : ' );
      shHeadInfo ( $8, $103E, 'Серия : ' );
      shHeadInfo ( $40, $A491, 'Completion Flag : ' );
      shHeadInfo ( $40, $A493, 'Verification Flag : ' );

      if das.Attributes.GetString( $8, $20 )<>'' then
      begin
        wrtSrText ( 'Дата исследования : ', 1, False );
        wrtSrText ( das.Attributes.GetString( $8, $20 )+' '+das.Attributes.GetString( $8, $30 ), 0, True );
      end;

      shHeadInfo ( $40, $A032, 'Observation Date : ' );

      if das.Attributes.GetString( $8, $23 )<>'' then
      begin
        wrtSrText ( 'Content Date : ', 1, False );
        wrtSrText ( das.Attributes.GetString( $8, $23 )+' '+das.Attributes.GetString( $8, $33 ), 0, True );
      end;

      shHeadInfo ( $0040, $A027, 'Verifying Organization : ' );
      shHeadInfo ( $0040, $A030, 'Verification Date Time : ' );
      shHeadInfo ( $0040, $A032, 'Observation Date Time : ' );

      wrtSrText ( '<hr>', 0, True );

      if Assigned(das.Attributes.Item[ $8, $1199 ] ) then
        DcmFrmTree( das.Attributes.Item[ $8, $1199 ] );
      if Assigned(das.Attributes.Item[ $40, $A073 ] ) then
        DcmFrmTree( das.Attributes.Item[ $40, $A073 ] );
      if Assigned(das.Attributes.Item[ $40,$A043 ]) then
        DcmFrmTree ( das.Attributes.Item[ $40,$A043 ] ); //
      if Assigned(das.Attributes.Item[ $40,$A730 ]) then
        DcmFrmTree ( das.Attributes.Item[ $40,$A730 ] ); //

      PageControl1.ActivePageIndex:=11;
      Screen.Cursor := v_cur;

      wrtFooter;CloseFile(FF);
      WB.Navigate( 'file:///'+vFileName );

      Exit;
    end;
    // -------------------------------------------------------------------------
    v_n_group:=0;
    v_n_channel:=0;
    v_cmn_amm := 0;
    v_amm_pnt:=0;
    v_max_pnt_in_group:=0;
    v_SamplingFrequency:=0;
    da6 := das.Attributes.Item[ $40,$B020 ]; // (0040,B020) [SQ] Waveform Annotation Sequence
    if assigned(da6) then
    for I := 0 to da6.GetCount - 1 do
    begin
      // Группы ----------------------------------------------------------------
      Inc(v_n_group);
      // -----------------------------------------------------------------------
      da7 := da6.Attributes[i].Item[ $3A, $208 ];  // 1479[003A:0208](ChannelSourceSequence)SQ=<1>Sequence Data    // тег описания каналов
      if assigned(da7) then
      for n := 0 to da7.GetCount - 1 do
      begin
          memConceptCodeSequence.Lines.Append(' ');
          memConceptCodeSequence.Lines.Append( c_tb + 'ChannelSourceSequence ITEM = '+inttostr(n) );

          memConceptCodeSequence.Lines.Append( c_tb + c_tb + 'from($3A,$208) CodeValue ( $8,$0100 ) = '+ da7.Attributes[n].GetString( $8,$0100 ) );
          memConceptCodeSequence.Lines.Append( c_tb + c_tb + 'from($3A,$208) CodingSchemeDesignator ( $8,$0102 ) = '+ da7.Attributes[n].GetString( $8,$0102 ) );
          memConceptCodeSequence.Lines.Append( c_tb + c_tb + 'from($3A,$208) CodingSchemeVersion ( $8,$0103 ) = '+ da7.Attributes[n].GetString( $8,$0103 ) );
          memConceptCodeSequence.Lines.Append( c_tb + c_tb + 'from($3A,$208) CodeMeaning ( $8,$0104 ) = '+ da7.Attributes[n].GetString( $8,$0104 ) );

      end;
      da7 := da6.Attributes[i].Item[ $3A, $211 ];  // 1484[003A:0211](ChannelSensitivityUnitsSequence)SQ=<1>Sequence Data
      if assigned(da7) then
      for n := 0 to da7.GetCount - 1 do
      begin
          memConceptCodeSequence.Lines.Append(' ');
          memConceptCodeSequence.Lines.Append( c_tb + 'ChannelSensitivityUnitsSequence ITEM = '+inttostr(n) );

          memConceptCodeSequence.Lines.Append( c_tb + c_tb + 'from($3A,$211) CodeValue ( $8,$0100 ) = '+ da7.Attributes[n].GetString( $8,$0100 ) );
          memConceptCodeSequence.Lines.Append( c_tb + c_tb + 'from($3A,$211) CodingSchemeDesignator ( $8,$0102 ) = '+ da7.Attributes[n].GetString( $8,$0102 ) );
          memConceptCodeSequence.Lines.Append( c_tb + c_tb + 'from($3A,$211) CodingSchemeVersion ( $8,$0103 )= '+ da7.Attributes[n].GetString( $8,$0103 ) );
          memConceptCodeSequence.Lines.Append( c_tb + c_tb + 'from($3A,$211) CodeMeaning ( $8,$0104 ) = '+ da7.Attributes[n].GetString( $8,$0104 ) );

      end;

      memConceptCodeSequence.Lines.Append( c_tb + '1495[0040:A0B0](ReferencedWaveformChannels)US=<1>1 = '+ da6.Attributes[m].GetString( $40,$A0B0 ) );
      memConceptCodeSequence.Lines.Append( c_tb + '1496[0040:A180](AnnotationGroupNumber)US=<1>1 = '+ da6.Attributes[m].GetString( $40,$A180 ) );
      memConceptCodeSequence.Lines.Append( c_tb + '1329[0040:A30A](NumericValue)DS=<1>5,00 = '+ da6.Attributes[m].GetString( $40,$A30A ) );

    end;
    // PerformedActionItemSequence - SEQ
    DA := das.Attributes.Item[ $40, $260 ];
    if assigned(DA) then
    begin
      try
        edCodeValue1.Text := DA.Attributes[0].GetString(8, $100);
        edCodingSchemeDesignator1.Text := DA.Attributes[0].GetString(8, $102);
        edCodeMeaning1.Text := DA.Attributes[0].GetString(8, $104);
      finally

      end;
    end;
    // -------------------------------------------------------------------------
    //AcquisitionContextSequence
    da2 := das.Attributes.Item[ $40,$555 ]; // 319[0040:0555](AcquisitionContextSequence)SQ=<2>Sequence Data
    if assigned(da2) then
    for I := 0 to da2.GetCount - 1 do
    begin
      memAcquisitionContextSequence.Lines.Append(c_rzd);
      memAcquisitionContextSequence.Lines.Append( 'ITEM = '+inttostr(I) );
      memAcquisitionContextSequence.Lines.Append('');
      memAcquisitionContextSequence.Lines.Append('ValueType = ' + da2.Attributes[I].GetString( $40,$A040 ) );

      sh_part1( memAcquisitionContextSequence, da2,  $40,$A043, 'ConceptNameCodeSequence' );
      sh_part1( memAcquisitionContextSequence, da2,  $40,$A168, 'ConceptCodeSequence' );
      sh_part1( memAcquisitionContextSequence, da2,  $40,$8EA,  'MeasurementUnitsCodeSequence' );
      sh_part1( memAcquisitionContextSequence, da2,  $40,$A043, 'ConceptNameCodeSequence' );

    end;

    memConceptCodeSequence.Lines.Append(' ');
    memConceptCodeSequence.Lines.Append( 'Device Serial Number = '+ das.Attributes.GetString( $18,$1000 ) );
    memConceptCodeSequence.Lines.Append(' ');

    // SEQ Waveform Sequence
    da1 := das.Attributes.Item[ $5400,$100 ];
    if assigned(da1) then
    for I := 0 to da1.GetCount - 1 do
    begin
      memConceptCodeSequence.Lines.Append(c_rzd);
      memConceptCodeSequence.Lines.Append( 'ITEM = '+inttostr(I) );
      memConceptCodeSequence.Lines.Append('');

      memConceptCodeSequence.Lines.Append('WaveformBitsAllocated = ' + da1.Attributes[I].GetString( $5400, $1004 ) );
      memConceptCodeSequence.Lines.Append('WaveformSampleInterpretation = ' + da1.Attributes[I].GetString( $5400, $1006 ) );
      memConceptCodeSequence.Lines.Append('');

      memConceptCodeSequence.Lines.Append('WaveformOriginality ( $3A,$4 ) = ' + da1.Attributes[I].GetString( $3A,$4 ) );
      // NumberofWaveformChannels ----------------------------------------------
      memConceptCodeSequence.Lines.Append('NumberofWaveformChannels ( $3A,$5 ) = ' + da1.Attributes[I].GetString( $3A,$5 ) );
      v_AmmChannels := da1.Attributes[I].GetInteger( $3A,$5 );
      if v_AmmChannels=0 then v_AmmChannels:=1;
      //
      v_amms:=0;
      if trim(da1.Attributes[I].GetString( $3A,$10 ))<>'' then v_amms:= strtoint(trim(da1.Attributes[I].GetString( $3A,$10 )));
      memConceptCodeSequence.Lines.Append('NumberofWaveformSamples ( $3A,$10 ) = ' + da1.Attributes[I].GetString( $3A,$10 ) );
      //
      v_str_tmp:=da1.Attributes[I].GetString( $3A,$1A );
      memConceptCodeSequence.Lines.Append('SamplingFrequency ( $3A,$1A ) = ' + v_str_tmp );
      if Trim(v_str_tmp)<>'' then
      begin
        v_str_tmp := StringReplace( v_str_tmp, Chr($A0), '',                        [rfReplaceAll, rfIgnoreCase] );
        v_str_tmp := StringReplace( v_str_tmp, '.', SysUtils.decimalSeparator, [rfReplaceAll, rfIgnoreCase] );
        v_str_tmp := StringReplace( v_str_tmp, ',', SysUtils.decimalSeparator, [rfReplaceAll, rfIgnoreCase] );
        v_SamplingFrequency := Trunc(StrToFloat( v_str_tmp ));
      end;
      // Каналы --------------------------------------------------------------
      Inc(v_n_channel);
      SetLength( v_data, v_n_channel );
      // ---------------------------------------------------------------------
      //
      da3 := da1.Attributes[I].Item[ $3A, $200 ];  // ChannelDefinitionSequence
      if assigned(da3) then
      for m := 0 to da3.GetCount - 1 do
      begin
        SetLength( v_data[v_n_channel-1].r_channel, da3.GetCount );
        v_data[v_n_channel-1].r_amm := da3.GetCount ;
        //
        memConceptCodeSequence.Lines.Append(' ');
        memConceptCodeSequence.Lines.Append( c_tb + 'ChannelDefinitionSequence GetCount = '+inttostr(da3.GetCount) );
        memConceptCodeSequence.Lines.Append( c_tb + 'ChannelDefinitionSequence ITEM of ChannelDefinitionSequence = '+inttostr(m) );

        da4 := da3.Attributes[m].Item[ $3A, $208 ];  // ChannelSourceSequence
        if assigned(da4) then
        for n := 0 to da4.GetCount - 1 do
        begin
          memConceptCodeSequence.Lines.Append(' ');
          memConceptCodeSequence.Lines.Append( c_tb + c_tb + 'ChannelSourceSequence ITEM = '+inttostr(n) );

          memConceptCodeSequence.Lines.Append( c_tb + c_tb + 'from($3A,$200 - $3A,$208) CodeValue = '+ da4.Attributes[n].GetString( $8,$0100 ) );
          memConceptCodeSequence.Lines.Append( c_tb + c_tb + 'from($3A,$200 - $3A,$208) CodingSchemeDesignator = '+ da4.Attributes[n].GetString( $8,$0102 ) );
          //
          if da4.Attributes[n].GetString( $8,$0102 ) = 'SCPECG' then  // --------------------------------------------------------
          begin
            v_data[v_n_channel-1].r_channel[m].r_channel := m+1 ;
            v_data[v_n_channel-1].r_channel[m].r_chann_cmn := v_n_channel ;
            v_data[v_n_channel-1].r_channel[m].r_name := da4.Attributes[n].GetString( $8,$0104 ) ;
            if v_SamplingFrequency=0 then v_SamplingFrequency:=500;            
            v_data[v_n_channel-1].r_channel[m].r_SamplingFrequency:=v_SamplingFrequency;
            Inc(v_cmn_amm);
          end;
          //
          memConceptCodeSequence.Lines.Append( c_tb + c_tb + 'from($3A,$200 - $3A,$208) CodeMeaning = '+ da4.Attributes[n].GetString( $8,$0104 ) );

        end;
        memConceptCodeSequence.Lines.Append( c_tb + 'ChannelSensitivity ( $3A,$210 ) = '+ da3.Attributes[m].GetString( $3A,$210 ) );

        da5 := da3.Attributes[m].Item[ $3A, $211 ];  // ChannelSensitivityUnitsSequence
        if assigned(da5) then
        for o := 0 to da5.GetCount - 1 do
        begin
          memConceptCodeSequence.Lines.Append(' ');
          memConceptCodeSequence.Lines.Append( c_tb + 'ChannelDefinitionSequence ITEM = '+inttostr(o) );

          memConceptCodeSequence.Lines.Append( c_tb + c_tb + 'from($3A,$200 - $3A,$211)  CodeValue ( $8,$0100 ) = '+ da5.Attributes[o].GetString( $8,$0100 ) );
          memConceptCodeSequence.Lines.Append( c_tb + c_tb + 'from($3A,$200 - $3A,$211)  CodingSchemeDesignator ( $8,$0102 ) = '+ da5.Attributes[o].GetString( $8,$0102 ) );
          memConceptCodeSequence.Lines.Append( c_tb + c_tb + 'from($3A,$200 - $3A,$211)  CodingSchemeVersion = '+ da5.Attributes[o].GetString( $8,$0103 ) );
          memConceptCodeSequence.Lines.Append( c_tb + c_tb + 'from($3A,$200 - $3A,$211)  CodeMeaning ( $8,$0104 ) = '+ da5.Attributes[o].GetString( $8,$0104 ) );

        end;

        memConceptCodeSequence.Lines.Append( c_tb + 'ChannelSensitivityCorrectionFactor ( $3A,$212 ) = '+ da3.Attributes[m].GetString( $3A,$212 ) );
        memConceptCodeSequence.Lines.Append( c_tb + 'ChannelBaseline ( $3A,$213 ) = '+ da3.Attributes[m].GetString( $3A,$213 ) );
        memConceptCodeSequence.Lines.Append( c_tb + 'ChannelSampleSkew ( $3A,$0215 ) = '+ da3.Attributes[m].GetString( $3A,$0215 ) );
        memConceptCodeSequence.Lines.Append( c_tb + 'WaveformBitsStored ( $3A,$021A ) = '+ da3.Attributes[m].GetString( $3A,$021A ) );
        memConceptCodeSequence.Lines.Append( c_tb + 'FilterLowFrequency ( $3A,$220 ) = '+ da3.Attributes[m].GetString( $3A,$220 ) );
        memConceptCodeSequence.Lines.Append( c_tb + 'FilterHighFrequency ( $3A,$221 ) = '+ da3.Attributes[m].GetString( $3A,$221 ) );

        // ???
        memConceptCodeSequence.Lines.Append( c_tb + 'Channel Minimum Value ($5400,$0110) = '+ da3.Attributes[m].GetString($5400,$0110) );
        memConceptCodeSequence.Lines.Append( c_tb + 'Channel Maximum Value ($5400,$0112) = '+ da3.Attributes[m].GetString($5400,$0112) );
        memConceptCodeSequence.Lines.Append( c_tb + 'Waveform Padding Value ($5400,$100A) = '+ da3.Attributes[m].GetString($5400,$100A) );
      
      end;
      memConceptCodeSequence.Lines.Append(' ');
      // DATA
      // >>1505[5400:1010](WaveformData)OW=<1>OB/OW Data 120000Byte

      // Waveform Bits Allocated (5400,1004)
      // Allowed values are 8 and 16 bits
      memConceptCodeSequence.Lines.Append( 'Waveform Bits Allocated (8/16) ( $5400,$1004 ) = '+ da1.Attributes[I].GetString( $5400,$1004 ) );

      //  memConceptCodeSequence.Lines.Append( 'Bits Allocated = '+ das.Attributes.GetString( $0028,$1000 ) );
      //  memConceptCodeSequence.Lines.Append( 'Bits Stored = '+ das.Attributes.GetString( $0028,$1001 ) );
      //  memConceptCodeSequence.Lines.Append( 'High Bit = '+ das.Attributes.GetString( $0028,$1002 ) );

      //
      v_Datalen := da1.Attributes[I].GetDatalen( $5400,$1010 );
      memConceptCodeSequence.Lines.Append( 'WaveformData data length = '+ IntToStr( v_Datalen ) );
      //
      memConceptCodeSequence.Lines.Append(' ');
      if v_Datalen > 0 then
      begin
        daDATA := da1.Attributes[I].Item[$5400, $1010];
        if (daDATA <> nil) then
        begin
          memConceptCodeSequence.Lines.Append('daDATA not nil ; DataArray.Count = '+inttostr(daDATA.DataArray.Count) );
          b1 := daDATA.AsOBData[0];
          if b1 <> nil then
          begin
            memConceptCodeSequence.Lines.Append('b1 not nil ');
            fBuffer := b1.Memory;
            fBufferSize := b1.Size;
            memConceptCodeSequence.Lines.Append( 'fBufferSize = '+ IntToStr( fBufferSize ) );
            memConceptCodeSequence.Lines.Append(' ');
            //
            b1.Position := 0;
            v_cmn_ln := Trunc(v_Datalen/2) ; // 16 - длина в байтах одного значения
            memConceptCodeSequence.Lines.Append( '--------------------- v_amms='+inttostr(v_amms)+' v_AmmChannels='+inttostr(v_AmmChannels) );
            v_amms:=v_amms*v_AmmChannels;
            if v_amms=0 then v_amms:=v_cmn_ln;
            v_str:='';
            v_min_val := 0;
            v_max_val := 0;
            v_amm := 0;
            SetLength( v_data[v_n_channel-1].r_data, 0 );
            SetLength( v_data[v_n_channel-1].r_data, trunc(v_amms/v_AmmChannels) );
            //
            if v_amm_pnt<v_amms then v_amm_pnt := v_amms;
            //            
            if v_AmmChannels>0 then
            for y := 0 to v_amms - 1 do
            begin
              //
              y1 := y mod v_data[v_n_channel-1].r_amm ;
              x1 := Trunc(y/v_data[v_n_channel-1].r_amm) ;
              SetLength( v_data[v_n_channel-1].r_data[x1], v_data[v_n_channel-1].r_amm );
              //
              b1.Read( v_var_tmp, 2 );
              //
              if v_max_val<Abs(v_var_tmp) then v_max_val:=Abs(v_var_tmp);
              if v_min_val=0 then v_min_val:=v_var_tmp;
              if ((v_var_tmp<>0) and (v_min_val>v_var_tmp)) then v_min_val:=v_var_tmp;
              v_str:=v_str+gt_frmtMy(VarToStr(v_var_tmp),20)+' ';
              //
              v_data[v_n_channel-1].r_data[ x1, y1 ] := v_var_tmp ;
              //
              if (Trunc((y+1)/v_AmmChannels)=(y+1)/v_AmmChannels)  then
              begin
                Inc(v_amm);
                memConceptCodeSequence.Lines.Append( IntToStr(y)+' '+v_str);
                v_str:='';
              end;
            end;
            //
            memConceptCodeSequence.Lines.Append(v_str);
            v_str:='';
            //
            memConceptCodeSequence.Lines.Append(' ');
            memConceptCodeSequence.Lines.Append('amm = '+inttostr(v_amm));
            memConceptCodeSequence.Lines.Append('max_val = '+inttostr(v_max_val));
            memConceptCodeSequence.Lines.Append('min_val = '+inttostr(v_min_val));
            //
          end;



        end;
      end;
      // END DATA

    end;

    memConceptCodeSequence.Lines.Append(' ');
    for I := 0 to Length(v_data) - 1 do // по записям
    begin
    //  memConceptCodeSequence.Lines.Append('n channel_cmn = '+inttostr(v_data[i].r_chann_cmn) );
    //  memConceptCodeSequence.Lines.Append('n channel = '+inttostr(v_data[i].r_channel) );
    //  memConceptCodeSequence.Lines.Append('name = '+v_data[i].r_name);
      memConceptCodeSequence.Lines.Append('n amm = '+inttostr(v_data[i].r_amm) );
      for I4 := 0 to v_data[i].r_amm-1 do     // High(v_data[i].r_channel)-1 do
      begin
        memConceptCodeSequence.Lines.Append( 'канал '+inttostr( v_data[i].r_channel[i4].r_channel)+' '+v_data[i].r_channel[i4].r_name );
      end;
      for i1 := 0 to High(v_data[i].r_data)-1 do
      begin
        v_str:='';
        for i2 := 0 to v_data[i].r_amm-1 do
        begin
          v_str:=v_str+gt_frmtMy(VarToStr( v_data[i].r_data[i1,i2] ),20);
        end;
        memConceptCodeSequence.Lines.Append( inttostr(i1) + ' : ' + v_str );
      end;
    end;

    showUSmodality;
    
  finally
  //  das.Free;
    Screen.Cursor := v_cur;
  end;
end;

procedure TfrmECGMain.TabSheet7Show(Sender: TObject);
begin // set transfer syntax
  edTransferSyntax.Text := v_ts;
  Application.ProcessMessages;
end;

procedure TfrmECGMain.Button1Click(Sender: TObject);
begin
  tsGraphShow(Self);
  pb1Paint(Self);
end;

procedure TfrmECGMain.Button2Click(Sender: TObject);
begin //
  MessageDlg('qeweqweqw', mtError, [mbOK], 0);
 // Application.MessageBox('You`ll never see this Text / Diesen Text wirst du nie sehen', '...', MB_OK);
end;

procedure TfrmECGMain.drawX ( x,y, Xwidth : integer );
begin
  Image1.Canvas.Brush.Color:=clRed;
  Image1.Canvas.Pen.Color:=clRed;
  Image1.Canvas.MoveTo( x-Xwidth, y );
  Image1.Canvas.LineTo( x+Xwidth, y );
  Image1.Canvas.MoveTo( x, y-Xwidth );
  Image1.Canvas.LineTo( x, y+Xwidth );
end;

function TfrmECGMain.GetRValue(rgb: DWORD): Byte;
begin
 Result := Byte(rgb);
end;

function TfrmECGMain.GetGValue(rgb: DWORD): Byte;
begin
 Result := Byte(rgb shr 8);
end;

function TfrmECGMain.GetBValue(rgb: DWORD): Byte;
begin
 Result := Byte(rgb shr 16);
end;

function TfrmECGMain.RgbToGray(RGBColor: TColor): TColor;
var Gray: byte;
begin // преобразовать в оттенки серого, используя рекомендуемый метод:
  // http://en.wikipedia.org/wiki/Grayscale#Converting_color_to_grayscale
  Gray := Round((0.299 * GetRValue(RGBColor)) +
  (0.587 * GetGValue(RGBColor)) +
  (0.114 * GetBValue(RGBColor )));
  Result := RGB(Gray, Gray, Gray);
end;

procedure TfrmECGMain.Button3Click(Sender: TObject);
var vTmp3, vTmp2, vTmp, vTmp1 : Extended;
    vFnd : Boolean;
    x, y, maxX,maxY, vTimeS, vValMax,
    vAmmPnt, i, vSredLine, i1, vMinF,
    v_Datalen, fBufferSize, v_cmn_ln,
    v_AmmChannels, v_amms, v_n_channel,
    v_amm, x1, y1  : Integer;
    vColor:TColor;
    vR,vG,vB : Byte;
    vArr : array of Integer;
    DA, da1, da2, da3, da4, da5,
    daDATA, da6, da7, daPDF : TDicomAttribute;
    b1: TOBStream;
    fBuffer, pp : Pointer;
    MemStream : Tmemorystream;
    v_str_tmp, v_str : string;
    v_var_tmp, v_var_tmp1 : MyType;
const c_delta = 5;
      c_k1 = 1.6;
      c_k2 = 0.2;
      c_k3 = 0.1;
      c_k4 = 0.05;
      c_k5 = 0.02;
      c_k6 = 0.01;
begin  // Сохранить в 1 канал
  // цикл по пикселям
  Image1.Canvas.Pen.Color := clRed;
  Image1.Canvas.Brush.Style := bsClear;
  maxX:=0;maxY:=0; vSredLine:=Trunc(Image1.Picture.Bitmap.Height/2);
  SetLength(vArr,Image1.Picture.Bitmap.Width);
  for I := 0 to High(vArr) - 1 do vArr[i]:=0;
  vMinF:=vArr[0];
  for x := 0 to Image1.Picture.Bitmap.Width - 1 do
  begin
    vFnd:=False;
    for y := 0 to Image1.Picture.Bitmap.Height- 1 do
    begin
      vColor := RgbToGray(Image1.Picture.Bitmap.Canvas.Pixels[x,y]);
     // Image1.Picture.Bitmap.Canvas.Pixels[x,y] := vColor ;
     // vR := GetRValue(vColor); vG := GetRValue(vColor); vB := GetRValue(vColor);
      // найдем максимальный пиксель
      if vColor=clBlack then  // тупо черный - потом на доработку ... если понадобится
      begin
        maxX:=x;maxY:=y; vFnd:=True; Break;
      end;
    end;
    vArr[x] := vSredLine - maxY;
    if vMinF>vArr[0] then vMinF:=vArr[0];
    if vFnd then
    begin
      drawX(maxX,maxY,5);
    end else
    begin
      drawX(x,maxY,5);
    end;
  end;
  if vMinF>0 then vMinF:=0;  
  // сохраним в массив DICOM в первый канал
  vTimeS := StrToInt(edTimeMs.Text);    // общее время, сек
  vValMax := Trunc( StrToInt(edValMax.Text)/2 );   // максимальное значение
  // всего точек - Image1.Picture.Bitmap.Width
  // частота в канале - 500 точек в секунду (1000 мс) == 1 точка за 2 мс
  vTmp:=(Image1.Picture.Bitmap.Width/vTimeS); // кол-во точек в сек
  vTmp1:=500; // 500 точек в секунду
  // сколько точек канала приходится на точку Image
  vAmmPnt:=Trunc(vTmp1/vTmp);
  // пересчитаем массив в показания
  vTmp3:=vValMax/vSredLine;
  for I := 0 to High(vArr) - 1 do
  begin
    vTmp2 := vArr[i]*vTmp3;
    vArr[i] := Trunc(vTmp2);
  end;
  if High(v_data)=0 then
  begin
    MessageDlg('Не загружен DICOM файл ЭКГ', mtWarning, [mbOK], 0);
    Exit;
  end;
  // присвоим и сохраним в массив DICOM
  for i1 := 0 to High(v_data[0].r_data) - 1 do v_data[0].r_data[i1,0] := 0;
  for i1 := 0 to High(v_data[0].r_data) - 1 do
    if Trunc(i1/vAmmPnt)<High(vArr) then
      v_data[0].r_data[i1,0] := Trunc( vArr[Trunc(i1/vAmmPnt)] );
  // фильтр - усреднение с коеффициентами
  for i1 := 0 to High(v_data[0].r_data) - 1 do
  begin
    if ((i1>c_delta) and (i1<(High(v_data[0].r_data)-1-c_delta))) then
      v_data[0].r_data[i1,0] := Trunc( ( c_k5*v_data[0].r_data[i1-4,0]+
                                         c_k4*v_data[0].r_data[i1-3,0]+
                                         c_k3*v_data[0].r_data[i1-2,0]+
                                         c_k2*v_data[0].r_data[i1-1,0]+
                                         c_k1*v_data[0].r_data[i1,0]+
                                         c_k2*v_data[0].r_data[i1+1,0]+
                                         c_k3*v_data[0].r_data[i1+2,0]+
                                         c_k4*v_data[0].r_data[i1+3,0]+
                                         c_k5*v_data[0].r_data[i1+4,0]
                                       ) );     //    /c_delta
  end;
  // отобразим данные на Canvas
  tsGraphShow(Self);
  pb1Paint(Self);
  // сохраним в файл
  if ( MessageDlg('Сохранить в DICOM файл ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes )
  then
  begin
    // -------------------------------------------------------------------------
    // das.LoadFromFile(p_filename);
    // -------------------------------------------------------------------------
    // SEQ Waveform Sequence
    da1 := TDicomAttribute(das.Attributes.Item[ $5400,$100 ]);
    v_n_channel:=1;  // пишем в 1 канал
    I := 0;
    v_AmmChannels := da1.Attributes[I].GetInteger( $3A,$5 );
    if assigned(da1) then
    begin
      v_Datalen := da1.Attributes[I].GetDatalen( $5400,$1010 );
      v_amms:=0;
      if trim(da1.Attributes[I].GetString( $3A,$10 ))<>'' then v_amms:= strtoint(trim(da1.Attributes[I].GetString( $3A,$10 )));
      if v_Datalen > 0 then
      begin
        daDATA := da1.Attributes[I].Item[$5400, $1010];
        if (daDATA <> nil) then
        begin
          b1 := daDATA.AsOBData[0];
          if b1 <> nil then
          begin
            fBuffer := b1.Memory;
            fBufferSize := b1.Size;
            b1.Position := 0;
//            TOBStream(TDicomAttribute(TDicomAttribute(das.Attributes.Item[ $5400,$100 ]).Attributes[I].Item[$5400, $1010]).AsOBData[0]).Position := 0;
            v_cmn_ln := Trunc(v_Datalen/2) ; // 16 - длина в байтах одного значения
            v_amms:=v_amms*v_AmmChannels;
            if v_amms=0 then v_amms:=v_cmn_ln;
            for y := 0 to v_amms - 1 do
            begin
              y1 := y mod v_data[v_n_channel-1].r_amm ;
              x1 := Trunc(y/v_data[v_n_channel-1].r_amm) ;
              v_var_tmp := v_data[v_n_channel-1].r_data[ x1, y1 ];
//              b1.SaveToFile('c:\Delphi\Trunk_AUTH\ASU2\Dicom\MyEcgViewer\data\test_save\1.fil');
              b1.Write(v_var_tmp ,2);
//              TOBStream(TDicomAttribute(TDicomAttribute(das.Attributes.Item[ $5400,$100 ]).Attributes[I].Item[$5400, $1010]).AsOBData[0]).Write(v_var_tmp ,2);
            end;
          end;
        end;
        das.SaveToFile('c:\Delphi\Trunk_AUTH\ASU2\Dicom\MyEcgViewer\data\test_save\1.dcm', True, 8197, 100 );
      end;
    end;
  end;
end;

procedure TfrmECGMain.loadImageToCanvas (FileName:AnsiString);
begin
  Image1.Picture.LoadFromFile(FileName);
  vCutImg.Picture.LoadFromFile(FileName);
  vH := Image1.Picture.Height ;
  vW := Image1.Picture.Width ;
  vFileName := FileName;
end;

procedure TfrmECGMain.Button4Click(Sender: TObject);
begin // Загрузить изображение из файла
  with TOpenDialog.Create(Self) do
  try
    // Установка начального каталога, чтобы сделать его текущим
    InitialDir := c_dir; // GetCurrentDir;
    // Только разрешенные существующие файлы могут быть выбраны
    Options := [ofFileMustExist];
    // Разрешено выбрать только .dpr и .pas файлы
    Filter := 'Image files|*.bmp';
    // Загрузка данных после открытия файла
    if Execute then
      loadImageToCanvas(FileName);
  finally
    Free;
  end;
end;

procedure TfrmECGMain.FormCreate(Sender: TObject);
begin
  das := TDicomDataset.Create;
  PageControl1.ActivePageIndex := 0;
  //
  Image1.Height := TabSheet4.Height+100;
  Image1.Width  := TabSheet4.Width+100;
  Image1.Top:=0;
  Image1.Left:=0;
  //
  ScrollBox2.Height := TabSheet4.Height;
  ScrollBox2.Width  := TabSheet4.Width;
  ScrollBox2.Top:=Panel5.Height+1;
  ScrollBox2.Left:=0;
  // нарисуем квадратик
  Image1.Canvas.Brush.Color := RGB( 255, 237, 196 ); // цвет фона белый  clWhite
  Image1.Canvas.FillRect(Rect(0,0,Image1.Width,Image1.Height)); // заливка всей рабочей области
  Image1.Canvas.Brush.Color := clBlack;
  Image1.Canvas.Brush.Style := bsClear;
  Image1.Canvas.Pen.Color := RGB( 182, 182, 182 );
  Image1.Canvas.Pen.Width := 1;
  Image1.Canvas.Rectangle( 0, 0, Image1.Width, Image1.Height );  // нарисуем границу
  vCutImg := TImage.Create(Self);
  ImgIni;
  Image1.Picture.LoadFromFile(cTempFile);
  vCutImg.Picture.LoadFromFile(cTempFile);
  vH := Image1.Picture.Height ;
  vW := Image1.Picture.Width ;
  vFileName := cTempFile;
end;

procedure TfrmECGMain.FormDestroy(Sender: TObject);
begin
  das.Free;
  vCutImg.Free;
  Image1.Picture.SaveToFile(cTempFile);
end;

procedure TfrmECGMain.ImgIni;
begin
  vX1:=-1; vY1:=-1; vX2:=-1; vY2:=-1;
  FrmCutImgRefresh;
end;

procedure TfrmECGMain.Button5Click(Sender: TObject);
begin // Убрать отметку
  Image1.Width := vW ;
  Image1.Height := vH ;
  Image1.Picture.Assign(vCutImg.Picture);
  ImgIni;
end;

procedure TfrmECGMain.Button6Click(Sender: TObject);
var vBmp: TBitmap;
begin // Оставить вырезку
  vBmp := TBitmap.Create;
  try
    vBmp.Width  := Abs(vX1-vX2);
    vBmp.Height := Abs(vY1-vY2);
    vBmp.Canvas.CopyRect( Rect(0, 0, vBmp.Width, vBmp.Height), Image1.Canvas, Rect( vX1, vY1, vX2, vY2 ) );
    Image1.Width  := vBmp.Width;
    Image1.Height := vBmp.Height;
    Image1.Picture.Assign(vBmp);
  finally
    vBmp.Free;
  end;
  FrmCutImgRefresh;
end;

procedure TfrmECGMain.Button7Click(Sender: TObject);
begin
  loadImageToCanvas(c_ImageFile);
end;

procedure TfrmECGMain.Button8Click(Sender: TObject);
begin
  DicomMultiViewer1.Refresh;
end;

procedure TfrmECGMain.Button9Click(Sender: TObject);
begin //  SET and SAVE
  das.LoadFromFile(v_MainFilename);
  das.Attributes.AddVariant($2, $10, edTransferSyntax.Text );
  das.Attributes.Sort;

  das.SaveToFile( 'd:\__to_delete\1.dcm', True, StrToInt( edTransferSyntaxID.Text ) , 100 );

end;

procedure TfrmECGMain.FrmCutImgRefresh;
begin
  Image1.Refresh;
end;

procedure TfrmECGMain.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const cStp = 5;
procedure DrwX (px,py:integer);
begin
  Image1.Canvas.MoveTo(px,py-cStp);
  Image1.Canvas.LineTo(px,py+cStp);
  Image1.Canvas.MoveTo(px-cStp,py);
  Image1.Canvas.LineTo(px+cStp,py);
end;
begin   // ОТМЕТКА
  if cbCUT.Checked then
  begin
    Image1.Canvas.Brush.Color:=clRed;
    Image1.Canvas.Pen.Color:=clRed;
    Image1.Canvas.Font.Color:=clRed;
    Image1.Canvas.Brush.Style := bsClear;
    Image1.Canvas.Pen.Width := 1;
    if vX1=-1 then
    begin
      vX1:=X; vY1:=Y;
      DrwX(X, Y);
    end else if vX2=-1 then
    begin
      vX2:=X; vY2:=Y;
      Image1.Canvas.Rectangle(vX1,vY1,vX2,vY2);
      cbCUT.Checked:=False;
    end;
  end;
end;

procedure TfrmECGMain.N1Click(Sender: TObject);
begin  // load file
  with TOpenDialog.Create(Self) do
  try
    // Установка начального каталога, чтобы сделать его текущим
  //  InitialDir := 'c:\Delphi\Trunk_AUTH\ASU2\Dicom\MyEcgViewer\data\__BACULEV\ERROR_СМ_HD11XE___Шрифт_боьшой_и все поехало\____00\';
    InitialDir := 'd:\__\';
// c_dir; // GetCurrentDir;
    // Только разрешенные существующие файлы могут быть выбраны
    Options := [ofFileMustExist];
    // Разрешено выбрать только .dpr и .pas файлы
   // Filter := 'DICOM files|*.dcm';
    // Загрузка данных после открытия файла
    if Execute then ShowEcgData(FileName);

  //  ShowEcgData('d:\__\AVDEENKO_ZM_1nnn');

//    ShowEcgData(c_dir+'export_ecg_cardiojet_with_binary_data_26043.dcm');
//   ShowEcgData(c_dir+'Example.dcm');
  finally
    Free;
  end;
end;

procedure TfrmECGMain.N2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmECGMain.N3Click(Sender: TObject);
begin    
  if FileExists(c_DicomIniFile) then
    ShowEcgData(c_DicomIniFile);
end;

procedure TfrmECGMain.tsGraphShow(Sender: TObject);
var i,v_width, vLengthTmp : Integer;
begin
  v_max_pnt_in_group:=0;
  for I := 0 to Length(v_data) - 1 do // по записям
  begin
    vLengthTmp := High(v_data[i].r_data) ;
    if v_max_pnt_in_group<vLengthTmp then
      v_max_pnt_in_group := vLengthTmp ;
  end;
  pb1.Height := Trunc( v_cmn_amm*c_height + c_partition*2 ) ;
  // c_kletka = 15;   // шаг клетки в пикселях  1сек - 5 клеток
  v_kx := 0.125 ;
  v_width:=Trunc(v_max_pnt_in_group*v_kx)+30;
  if v_width<ScrollBox1.Width then v_width:=ScrollBox1.Width;
  pb1.Width  := v_width ;
end;

procedure TfrmECGMain.tsPDFShow(Sender: TObject);
begin // pdf viewer
  // 'd:\1.pdf'
  WebBrowser1.Navigate('c:\1.pdf');
end;

procedure TfrmECGMain.XML1Click(Sender: TObject);
  procedure ChkNode ( pNode : IXMLNode );
  var vNode, vNode1, vNode2, vNode3, vNode4 : IXMLNode;
      vNodeName1, Value: string;
      Y, X, Z, L : Integer;
    procedure p_patdata ( pNodeTmp : IXMLNode );
    begin
      memXML.Lines.Append( 'id = '+pNodeTmp.ChildNodes['id'].Text );
      memXML.Lines.Append( 'lastname = '+pNodeTmp.ChildNodes['lastname'].Text );
      memXML.Lines.Append( 'firstname = '+pNodeTmp.ChildNodes['firstname'].Text );
      memXML.Lines.Append( 'birthdate = '+pNodeTmp.ChildNodes['birthdate'].Text );
      memXML.Lines.Append( 'gender = '+pNodeTmp.ChildNodes['gender'].Text );
      memXML.Lines.Append( 'ethnic = '+pNodeTmp.ChildNodes['ethnic'].Text );

      memXML.Lines.Append( 'weight = '+pNodeTmp.ChildNodes['weight'].ChildNodes['value'].Text+' '+
                                       pNodeTmp.ChildNodes['weight'].ChildNodes['unit'].Text
                         );
      memXML.Lines.Append( 'height = '+pNodeTmp.ChildNodes['height'].ChildNodes['value'].Text+' '+
                                       pNodeTmp.ChildNodes['height'].ChildNodes['unit'].Text
                         );
      memXML.Lines.Append( 'pacemaker = '+pNodeTmp.ChildNodes['weight'].ChildNodes['value'].Text+' '+
                                          pNodeTmp.ChildNodes['weight'].ChildNodes['unit'].Text
                         );
    end;
    procedure p_examdescript ( pNodeTmp : IXMLNode );
    begin
      memXML.Lines.Append( 'startdate = '+pNodeTmp.ChildNodes['startdatetime'].ChildNodes['date'].Text );
      memXML.Lines.Append( 'starttime = '+pNodeTmp.ChildNodes['startdatetime'].ChildNodes['time'].Text );
      memXML.Lines.Append( 'rectype = '+pNodeTmp.ChildNodes['rectype'].Text );
      memXML.Lines.Append( 'job_id = '+pNodeTmp.ChildNodes['job_id'].Text );

      memXML.Lines.Append( 'aquiring_user id = '+
         pNodeTmp.ChildNodes['idu'].ChildNodes['aquiring_user'].ChildNodes['id'].Text );
      memXML.Lines.Append( 'aquiring_user name = '+
         pNodeTmp.ChildNodes['idu'].ChildNodes['aquiring_user'].ChildNodes['name'].Text );

      memXML.Lines.Append( 'aquiring_department id = '+
         pNodeTmp.ChildNodes['idu'].ChildNodes['aquiring_department'].ChildNodes['id'].Text );
      memXML.Lines.Append( 'aquiring_department name = '+
         pNodeTmp.ChildNodes['idu'].ChildNodes['aquiring_department'].ChildNodes['name'].Text );

      memXML.Lines.Append( 'aquiring_institute id = '+
         pNodeTmp.ChildNodes['idu'].ChildNodes['aquiring_institute'].ChildNodes['id'].Text );
      memXML.Lines.Append( 'aquiring_institute name = '+
         pNodeTmp.ChildNodes['idu'].ChildNodes['aquiring_institute'].ChildNodes['name'].Text );

      memXML.Lines.Append( 'referring_user id = '+
         pNodeTmp.ChildNodes['idu'].ChildNodes['referring_user'].ChildNodes['id'].Text );
      memXML.Lines.Append( 'referring_user name = '+
         pNodeTmp.ChildNodes['idu'].ChildNodes['referring_user'].ChildNodes['name'].Text );

      memXML.Lines.Append( 'requesting_institute id = '+
         pNodeTmp.ChildNodes['idu'].ChildNodes['requesting_institute'].ChildNodes['id'].Text );
      memXML.Lines.Append( 'requesting_institute name = '+
         pNodeTmp.ChildNodes['idu'].ChildNodes['requesting_institute'].ChildNodes['name'].Text );

      memXML.Lines.Append( 'requesting_department id = '+
         pNodeTmp.ChildNodes['idu'].ChildNodes['requesting_department'].ChildNodes['id'].Text );
      memXML.Lines.Append( 'requesting_department name = '+
         pNodeTmp.ChildNodes['idu'].ChildNodes['requesting_department'].ChildNodes['name'].Text );

      memXML.Lines.Append( 'analyzing_institute id = '+
         pNodeTmp.ChildNodes['idu'].ChildNodes['analyzing_institute'].ChildNodes['id'].Text );
      memXML.Lines.Append( 'analyzing_institute name = '+
         pNodeTmp.ChildNodes['idu'].ChildNodes['analyzing_institute'].ChildNodes['name'].Text );

      memXML.Lines.Append( 'analyzing_department id = '+
         pNodeTmp.ChildNodes['idu'].ChildNodes['analyzing_department'].ChildNodes['id'].Text );
      memXML.Lines.Append( 'analyzing_department name = '+
         pNodeTmp.ChildNodes['idu'].ChildNodes['analyzing_department'].ChildNodes['name'].Text );

      memXML.Lines.Append( 'analyzing_user id = '+
         pNodeTmp.ChildNodes['idu'].ChildNodes['analyzing_user'].ChildNodes['id'].Text );
      memXML.Lines.Append( 'analyzing_user name = '+
         pNodeTmp.ChildNodes['idu'].ChildNodes['analyzing_user'].ChildNodes['name'].Text );

      memXML.Lines.Append( 'aquiringdevice hardware vendor = '+
         pNodeTmp.ChildNodes['aquiringdevice'].ChildNodes['hardware'].ChildNodes['vendor'].Text );
      memXML.Lines.Append( 'aquiringdevice hardware type = '+
         pNodeTmp.ChildNodes['aquiringdevice'].ChildNodes['hardware'].ChildNodes['type'].Text );
      memXML.Lines.Append( 'aquiringdevice hardware model = '+
         pNodeTmp.ChildNodes['aquiringdevice'].ChildNodes['hardware'].ChildNodes['model'].Text );

      memXML.Lines.Append( 'aquiringdevice software vendor = '+
         pNodeTmp.ChildNodes['aquiringdevice'].ChildNodes['software'].ChildNodes['vendor'].Text );
      memXML.Lines.Append( 'aquiringdevice software model = '+
         pNodeTmp.ChildNodes['aquiringdevice'].ChildNodes['software'].ChildNodes['model'].Text );
      memXML.Lines.Append( 'aquiringdevice software version = '+
         pNodeTmp.ChildNodes['aquiringdevice'].ChildNodes['software'].ChildNodes['version'].Text );
    end;
    procedure p_eventdata_Head ( pNodeTmp : IXMLNode );
    begin
      memXML.Lines.Append( 'offset = '+
         pNodeTmp.ChildNodes['event'].ChildNodes['offset'].Text );
      memXML.Lines.Append( 'reason = '+
         pNodeTmp.ChildNodes['event'].ChildNodes['reason'].Text );
      memXML.Lines.Append( 'step = '+
         pNodeTmp.ChildNodes['event'].ChildNodes['step'].Text );

      memXML.Lines.Append( 'wavedata type = '+
         pNodeTmp.ChildNodes['event'].ChildNodes['wavedata'].ChildNodes['type'].Text );

      memXML.Lines.Append( 'wavedata resolution samplerate exponent = '+
         pNodeTmp.ChildNodes['event'].ChildNodes['wavedata'].ChildNodes['resolution'].ChildNodes['samplerate'].ChildNodes['exponent'].Text );
      memXML.Lines.Append( 'wavedata resolution samplerate value = '+
         pNodeTmp.ChildNodes['event'].ChildNodes['wavedata'].ChildNodes['resolution'].ChildNodes['samplerate'].ChildNodes['value'].Text );
      if Trim( pNodeTmp.ChildNodes['event'].ChildNodes['wavedata'].ChildNodes['resolution'].ChildNodes['samplerate'].ChildNodes['value'].Text )<>'' then      
        v_SamplingFrequency := StrToInt( pNodeTmp.ChildNodes['event'].ChildNodes['wavedata'].ChildNodes['resolution'].ChildNodes['samplerate'].ChildNodes['value'].Text );
      memXML.Lines.Append( 'wavedata resolution yres unitperbit = '+
         pNodeTmp.ChildNodes['event'].ChildNodes['wavedata'].ChildNodes['resolution'].ChildNodes['yres'].ChildNodes['unitperbit'].Text );
      memXML.Lines.Append( 'wavedata resolution yres units = '+
         pNodeTmp.ChildNodes['event'].ChildNodes['wavedata'].ChildNodes['resolution'].ChildNodes['yres'].ChildNodes['units'].Text );
    end;
  var v_n_channel, v_SamplingFrequency, y1,x1, q1, v_AmmChannels, v_amms : Integer;
      v_vStrTmp : string;
      vStrTmp : TStringList ;
    function CountPos(const subtext: string; Text: string): Integer;
    begin
      if (Length(subtext) = 0) or (Length(Text) = 0) or (Pos(subtext, Text) = 0) then
        Result := 0
      else
        Result := (Length(Text) - Length(StringReplace(Text, subtext, '', [rfReplaceAll]))) div
          Length(subtext);
    end;
  begin
    v_n_channel:=0; v_SamplingFrequency := 500; v_cmn_amm:=0;
    // посчитаем v_AmmChannels
    v_AmmChannels := CountPos('<channel>',XML.XML.Text);
    //
    for Y :=  0 to pNode.ChildNodes.Count - 1 do
    begin
      vNode := pNode.ChildNodes[Y];
      if vNode<>nil then
      begin
        if vNode.ParentNode.NodeName='com.xiriuz.sema.xml.schillerEDI.SchillerEDI' then
        begin
          if ( vNode.NodeName = 'patdata' ) then
          begin
            p_patdata( vNode );
          end else if ( vNode.NodeName = 'examdescript' ) then
          begin
            p_examdescript( vNode );
          end else if ( vNode.NodeName = 'eventdata' ) then
          begin
            p_eventdata_Head( vNode );
            vNode1 := vNode.ChildNodes['event'].ChildNodes['wavedata'];
            for X :=  0 to vNode1.ChildNodes.Count - 1 do
            begin
              vNodeName1 := vNode1.ChildNodes[X].NodeName ;
              vNode2 := vNode1.ChildNodes[X];
              if vNodeName1 = 'channel'
              then
              begin
                for Z :=  0 to vNode2.ChildNodes.Count - 1 do
                begin
                  vNode3 := vNode2.ChildNodes[Z] ;
                  if vNode3.NodeName='annotation_lead' then
                  begin
                    memXML.Lines.Append( vNode3.ChildNodes['name'].Text+' '+vNode3.ChildNodes['value'].Text );
                  end else
                  if vNode3.NodeName='name' then
                  begin
                    memXML.Lines.Append( 'name : '+vNode3.Text );
                    //
                    Inc(v_n_channel);
                    Inc(v_cmn_amm);

                    SetLength( v_data, v_n_channel );
                    SetLength( v_data[v_n_channel-1].r_channel, 1 );

                    SetLength( v_data[v_n_channel-1].r_data, 0 );
                    SetLength( v_data[v_n_channel-1].r_data, 1  ); // {trunc(v_amms/v_AmmChannels))

                    // r_amm
                    v_data[v_n_channel-1].r_amm := 1;
                    v_data[v_n_channel-1].r_channel[0].r_channel := 1 ; // в каждой группе только 1 канал
                    v_data[v_n_channel-1].r_channel[0].r_name := vNode3.Text ;
                    //
                  end else
                  if vNode3.NodeName='data' then
                  begin
                    //  v_n_channel == 0
                    v_data[v_n_channel-1].r_channel[0].r_channel := v_n_channel ;
                    v_data[v_n_channel-1].r_channel[0].r_chann_cmn := v_n_channel ;
                  //  v_data[v_n_channel-1].r_channel[0].r_name := da4.Attributes[n].GetString( $8,$0104 ) ;
                    if v_SamplingFrequency=0 then v_SamplingFrequency:=500;
                    v_data[v_n_channel-1].r_channel[0].r_SamplingFrequency:=v_SamplingFrequency;
                    //
                    memXML.Lines.Append( '!!! data : '+vNode3.Text );
                    //
                    vStrTmp := TStringList.Create;
                    try
                      vStrTmp.Delimiter:=',';
                      vStrTmp.DelimitedText := vNode3.Text;
                      SetLength( v_data[v_n_channel-1].r_data, vStrTmp.Count );
                    //  SetLength( v_data[v_n_channel-1].r_data[0], vStrTmp.Count );
                    //  v_data[v_n_channel-1].r_amm := vStrTmp.Count;
                      if v_data[v_n_channel-1].r_channel[0].r_SamplingFrequency=0 then
                        v_data[v_n_channel-1].r_channel[0].r_SamplingFrequency:= 500;
                      for q1 := 0 to vStrTmp.Count - 1 do
                      begin
                        SetLength( v_data[v_n_channel-1].r_data[q1], 1 );
                        v_vStrTmp := vStrTmp[q1];
                        if Trim(v_vStrTmp)='' then v_vStrTmp := '0' ;
//                        v_data[v_n_channel-1].r_data[q1,0] := 0 ;
//                        TryStrToInt( v_vStrTmp, v_data[v_n_channel-1].r_data[q1,0] ) ;
                        v_data[v_n_channel-1].r_data[q1,0] := 0 ;
                        TryStrToInt( v_vStrTmp, v_data[v_n_channel-1].r_data[q1,0] ) ;
                      end;
                    finally
                      vStrTmp.Free;
                    end;
                  end else
                  if vNode3.NodeName='datastype' then
                  begin
                    memXML.Lines.Append( 'datastype : '+vNode3.Text );
                  end else
                  if vNode3.NodeName='samplecount' then
                  begin
                    memXML.Lines.Append( 'samplecount : '+vNode3.Text );
                  end;
                end;
              end else if vNodeName1 = 'channelconfiguration' then
              begin
                memXML.Lines.Append( 'channelconfiguration : '+vNode2.Text );
              end;
            end;
            vNode1 := vNode.ChildNodes['event'];
            for X :=  0 to vNode1.ChildNodes.Count - 1 do
            begin
              vNode2 := vNode1.ChildNodes[X];
              if vNode2.NodeName = 'annotation_global'
              then
              begin
                memXML.Lines.Append( 'annotation_global : '+vNode2.ChildNodes['name'].Text+' '+vNode2.ChildNodes['value'].Text );
              end else if vNode2.NodeName = 'rhythm_global' then
              begin
                for L :=  0 to vNode2.ChildNodes.Count - 1 do
                begin
                  vNode4 := vNode2.ChildNodes[L];
                  if vNode4.NodeName='name' then memXML.Lines.Append( 'name = '+ vNode4.Text );
                  if vNode4.NodeName='value' then memXML.Lines.Append( 'value = '+ vNode4.Text );
                end;
              end else if vNode2.NodeName = 'filters_data' then
              begin
                for L :=  0 to vNode2.ChildNodes.Count - 1 do
                begin
                  vNode4 := vNode2.ChildNodes[L];
                  if vNode4.NodeName='filter' then
                  begin
                    memXML.Lines.Append( 'filter : '+ vNode4.ChildNodes['name'].Text+' : '+ vNode4.ChildNodes['value'].Text );
                  end;
                end;
              end else if vNode2.NodeName = 'textdata' then
              begin
                memXML.Lines.Append( vNode2.ChildNodes['type'].Text+' : '+ vNode2.ChildNodes['textdata'].Text );
              end;
            end;
          end
        end else
        begin
          Value := ''; // vNode.Text;
          memXML.Lines.Append( vNode.NodeName + Value);
          if vNode.HasChildNodes then ChkNode( vNode );
        end;
      end;
    end;
  end;
var Iq, i4, i1, i2, iTmp : Integer; v_str : string;
begin  // Загрузить XML от ШИЛЛЕР.РУ
  XML.Active;
{  with TOpenDialog.Create(Self) do
  try
    InitialDir := 'c:\Delphi\Trunk_AUTH\ASU2\Dicom\MyEcgViewer\data\XML\';
    // Только разрешенные существующие файлы могут быть выбраны
    Options := [ofFileMustExist];
    // Разрешено выбрать только .dpr и .pas файлы
    // Filter := 'DICOM files|*.dcm';
    // Загрузка данных после открытия файла
    Execute;
    if FileName<>'' then
      XML.LoadFromFile(FileName);
  finally
    Free;
  end;  }

  XML.LoadFromFile('c:\Delphi\Trunk_AUTH\ASU2\Dicom\MyEcgViewer\data\XML\A341312C-38DE-4949-80F5-136C99AC94C9.xml');

  memXML.Lines.BeginUpdate;
  try
    ChkNode ( XML.DocumentElement );
  finally
    XML.Active := False;
    memXML.Lines.EndUpdate;
  end;

  showEcgArray;

  tsGraphShow(Self);
  pb1Paint(Self);

//  PageControl1.ActivePageIndex := tsXML.PageIndex;
//  PageControl1.ActivePageIndex := tsGraph.PageIndex;

end;

function TfrmECGMain.gt_frmtMy ( p_str:string; p_size:integer ) : string;
var v_s : string;
begin
  v_s:=p_str;
  while Length(v_s)<p_size do v_s:=' '+v_s;
  Result:=v_s;
end;

procedure TfrmECGMain.showEcgArray;
var Iq, I4, iTmp, i1 : Integer;
    v_str : string;
begin
  memConceptCodeSequence.Lines.Append(' ');
    for Iq := 0 to Length(v_data) - 1 do // по записям
    begin
      for I4 := 0 to Length(v_data[Iq].r_channel)-1 do // v_data[Iq].r_amm-1 do     // High(v_data[i].r_channel)-1 do
      begin
        memConceptCodeSequence.Lines.Append( 'канал '+inttostr( v_data[Iq].r_channel[i4].r_channel)+' '+v_data[Iq].r_channel[i4].r_name );
      end;
      iTmp := Length(v_data[Iq].r_data);
      for i1 := 0 to iTmp-1 do
      begin
        v_str:='';
      //  for i2 := 0 to v_data[Iq].r_amm-1 do
      //  begin
          v_str:=v_str+gt_frmtMy(VarToStr( v_data[Iq].r_data[i1,0] ),20);
//          v_str:=v_str+gt_frmtMy(VarToStr( v_data[Iq].r_data[i1,i2] ),20);
      //  end;
        memConceptCodeSequence.Lines.Append( inttostr(i1) + ' : ' + v_str );
      end;
    end;
end;

procedure TfrmECGMain.pb1Paint(Sender: TObject);
var i, x2,y2,i4, v_height, v_width, i1,i2,
    v_x_top, v_y_top, v_n_chnl, p5, vLen1,
    v_xx, v_yy, v_y_c, v_n_bg, ik, v_i,
    v_y1,v_y2, v_tmp1, v_tmp2, v_amm,
    vXBefore,vYBefore, vTmps, vLenDataTmp : Integer;
    v_dt : array of Integer;
    v_dt_max, v_dt_min, vPos : array of Integer;
    v_dt_sr : array of Extended;
begin
  ScrollBox1.Enabled:=False;
  try
    pb1.Canvas.Brush.Color := RGB( 255, 237, 196 ); // цвет фона белый  clWhite
    pb1.Canvas.FillRect(Rect(0,0,pb1.Width,pb1.Height)); // заливка всей рабочей области

    v_n_chnl:=0;
    vLenDataTmp := Length(v_data) ;
    for I := 0 to vLenDataTmp - 1 do // по записям   
    begin
    //  memConceptCodeSequence.Lines.Append('n channel_cmn = '+inttostr(v_data[i].r_chann_cmn) );
    //  memConceptCodeSequence.Lines.Append('n channel = '+inttostr(v_data[i].r_channel) );
    //  memConceptCodeSequence.Lines.Append('name = '+v_data[i].r_name);
      memConceptCodeSequence.Lines.Append('n amm = '+inttostr(v_data[i].r_amm) );
      pb1.Canvas.Brush.Color := clBlack;
      pb1.Canvas.Brush.Style := bsClear;
      v_height := c_height ; // Trunc( tsGraph.Height/v_cmn_amm - c_partition ) ;
      v_width  := v_data[i].r_amm;
      v_n_bg:=v_n_chnl;
      for I4 := 0 to v_width-1 do    
      begin
        inc(v_n_chnl);
        memConceptCodeSequence.Lines.Append( 'канал '+inttostr( v_data[i].r_channel[i4].r_channel)+' '+v_data[i].r_channel[i4].r_name );
        v_x_top  := 3;
        v_y_top  := (v_height+c_partition)*(v_n_chnl-1);
        pb1.Canvas.Pen.Color := RGB( 182, 182, 182 );
        pb1.Canvas.Pen.Width := 1;
        vTmps := High(v_data[i].r_data) ;
        pb1.Canvas.Rectangle( v_x_top, v_y_top, v_x_top+vTmps, v_y_top+v_height );  // нарисуем границу
        //
        x2:=v_x_top;
        p5:=0;
        while x2<pb1.Width do // по оси абцисс
        begin
          if rb25.Checked then Inc(x2,c_kletka)
          else if rb50.Checked  then Inc( x2, Trunc(c_kletka*2) )
          else if rb100.Checked then Inc( x2, Trunc(c_kletka*4) )
          else if rb200.Checked then Inc( x2, Trunc(c_kletka*8) )
          else if rb400.Checked then Inc( x2, Trunc(c_kletka*16) );
          Inc(p5);
          if ( p5 mod 5 )=0 then
            pb1.Canvas.Pen.Color := RGB( 182, 182, 182 )
          else
            pb1.Canvas.Pen.Color := RGB( 220, 220, 220 );
          pb1.Canvas.MoveTo( x2 , v_y_top );
          pb1.Canvas.LineTo( x2 , v_y_top+v_height );
          Application.ProcessMessages;
        end;
        v_y_c := Trunc( v_y_top+v_height/2 );
        x2:=v_x_top;
        pb1.Canvas.MoveTo( x2 , v_y_c );
        pb1.Canvas.Pen.Color := RGB( 182, 182, 182 );
        pb1.Canvas.LineTo( pb1.Width , v_y_c );
        y2:=v_y_c; p5:=0;
        while y2<(v_y_top+v_height) do // рисуем разметку гориз линии вниз от центральной линии
        begin
          if rv5.Checked then        Inc(y2,Trunc(c_kletka/(10/5)))
          else if rv10.Checked then  Inc(y2,c_kletka)
          else if rv15.Checked then  Inc(y2,Trunc(c_kletka/(10/15)))
          else if rv20.Checked then  Inc(y2,Trunc(c_kletka/(10/20)))
          else if rv25.Checked then  Inc(y2,Trunc(c_kletka/(10/25)))
          else if rv40.Checked then  Inc(y2,Trunc(c_kletka/(10/40)))
          else if rv75.Checked then  Inc(y2,Trunc(c_kletka/(10/75)));
          Inc(p5);
          if ( p5 mod 2 )=0 then
            pb1.Canvas.Pen.Color := RGB( 182, 182, 182 )
          else
            pb1.Canvas.Pen.Color := RGB( 220, 220, 220 );
          pb1.Canvas.MoveTo( v_x_top , y2 );
          pb1.Canvas.LineTo( pb1.Width , y2 );
          Application.ProcessMessages;
        end;
        y2:=v_y_c; p5:=0;
        while y2>v_y_top do            // рисуем разметку гориз линии вверх от центральной линии
        begin
         // Inc(y2,(-1)*c_kletka);
          if rv5.Checked then        Inc(y2,(-1)*Trunc(c_kletka/(10/5)))
          else if rv10.Checked then  Inc(y2,(-1)*c_kletka)
          else if rv15.Checked then  Inc(y2,(-1)*Trunc(c_kletka/(10/15)))
          else if rv20.Checked then  Inc(y2,(-1)*Trunc(c_kletka/(10/20)))
          else if rv25.Checked then  Inc(y2,(-1)*Trunc(c_kletka/(10/25)))
          else if rv40.Checked then  Inc(y2,(-1)*Trunc(c_kletka/(10/40)))
          else if rv75.Checked then  Inc(y2,(-1)*Trunc(c_kletka/(10/75)));
          Inc(p5);
          if ( p5 mod 2 )=0 then
            pb1.Canvas.Pen.Color := RGB( 182, 182, 182 )
          else
            pb1.Canvas.Pen.Color := RGB( 220, 220, 220 );
          pb1.Canvas.MoveTo( v_x_top , y2 );
          pb1.Canvas.LineTo( pb1.Width , y2 );
          Application.ProcessMessages;
        end;
        pb1.Canvas.Pen.Color := clBlack;
        pb1.Canvas.Font.Color := clBlack;
        pb1.Canvas.TextOut( Trunc(v_x_top+c_partition*4), Trunc(v_y_top+c_partition*4), v_data[i].r_channel[i4].r_name );
      end;
      //
      SetLength(v_dt,v_data[0].r_amm);
      pb1.Canvas.Pen.Color := clRed;
      for ik := 0 to High(v_dt) - 1 do v_dt[ik]:=0;
      { v_ky := c_height/v_max_val; // old
        1 мв = 2 клетки
        значения записаны - надо / на 1000
        1 px = 1 значение
      }
      v_ky := 0.001 * 2 * c_kletka ;
      if rv5.Checked then        v_ky := v_ky / (10/5)
      else if rv15.Checked then  v_ky := v_ky / (10/15)
      else if rv20.Checked then  v_ky := v_ky / (10/20)
      else if rv25.Checked then  v_ky := v_ky / (10/25)
      else if rv40.Checked then  v_ky := v_ky / (10/40)
      else if rv75.Checked then  v_ky := v_ky / (10/75) ;
      //
      SetLength(v_dt_max,v_data[0].r_amm);
      for ik := 0 to High(v_dt_max) - 1 do v_dt_max[ik]:=0;
      SetLength(v_dt_min,v_data[0].r_amm);
      for ik := 0 to High(v_dt_min) - 1 do v_dt_min[ik]:=0;
      SetLength(v_dt_sr,v_data[0].r_amm);
      for ik := 0 to High(v_dt_sr) - 1 do v_dt_sr[ik]:=0;
      v_amm := High(v_data[i].r_data);
      //
      vLen1 := High(v_data[i].r_data);
      for i1 := 0 to vLen1-1 do
        for i2 := 0 to v_data[i].r_amm-1 do
        begin
          if v_dt_max[i2]<v_data[i].r_data[i1,i2] then v_dt_max[i2]:=v_data[i].r_data[i1,i2];
          if v_dt_min[i2]>v_data[i].r_data[i1,i2] then v_dt_min[i2]:=v_data[i].r_data[i1,i2];
          v_dt_sr[i2] := v_dt_sr[i2] + v_data[i].r_data[i1,i2]/v_amm;
        end;
      //
      for i1 := 0 to High(v_data[i].r_data)-1 do
      begin
        for i2 := 0 to v_data[i].r_amm-1 do
        begin
          if v_data[I].r_channel[i2].r_SamplingFrequency=0 then
          begin
          //  MessageDlg('Не задана частота r_SamplingFrequency ...', mtError, [mbOK], 0);
            v_kx := (5*c_kletka) / 500 ;
          end else
            v_kx := (5*c_kletka) / v_data[I].r_channel[i2].r_SamplingFrequency ;//   1 сек = 5 клеток
          if rb50.Checked then v_kx := v_kx*2
          else if rb100.Checked then v_kx := v_kx*4
          else if rb200.Checked then v_kx := v_kx*8
          else if rb400.Checked then v_kx := v_kx*16 ;
          {  1 клетка = 1/5 сек
             5 клеток = r_SamplingFrequency точек
             5*c_kletka = r_SamplingFrequency точек
             r_SamplingFrequency/5*c_kletka          }
          v_y_top  := trunc( v_height*( v_n_bg + i2 ) );
          v_y_c := Trunc( v_y_top+v_height/2 );   // v_n_bg+i2 - номер канала
          if True then
          begin
            if (i1>0) then
            begin
              v_x_top  := 3;
              v_y_top  := (v_height+c_partition)*(v_n_bg+i2);
              v_tmp1    := Trunc( v_dt[i2]                - v_dt_sr[i2] ) ;
              if i1>0 then v_tmp1    := Trunc( v_data[i].r_data[i1-1,i2] - v_dt_sr[i2] ) ;
              v_tmp2    := Trunc( v_data[i].r_data[i1,i2] - v_dt_sr[i2] ) ;
              if v_tmp1>0 then
              begin
                v_y1  := Trunc( v_y_top  - v_height/2+(v_height-abs(v_tmp1) * v_ky) ) ;
                v_y2  := Trunc( v_y_top  - v_height/2+(v_height-abs(v_tmp2) * v_ky) ) ;
              end else
              begin
                v_y1  := Trunc( v_y_top  + (v_height/2+abs(v_tmp1) * v_ky) ) ;
                v_y2  := Trunc( v_y_top  + (v_height/2+abs(v_tmp2) * v_ky) ) ;
              end;
              pb1.Canvas.Pen.Color := clRed; // RGB( 151, 194, 240);  // clRed;
              if i1>0 then
              begin
                pb1.Canvas.MoveTo( Trunc( (i1-1)*v_kx ) , v_y1 );
                pb1.Canvas.LineTo( Trunc( i1*v_kx )     , v_y2 );
                Application.ProcessMessages;
              end;
            end;
            v_dt[i2] := v_data[i].r_data[i1,i2] ;
          end else
          begin
            pb1.Canvas.Font.Color := clBlue;
            pb1.Canvas.TextOut( c_partition*4, v_y_c, 'Данных нет' );
          end;
        end;
        Application.ProcessMessages; // Обработка всей очереди сообщений
      end;

    //  Break;

    end;
    Application.ProcessMessages; // Обработка всей очереди сообщений

  finally
    ScrollBox1.Enabled:=True;
  end;
end;

{ 29, 60 Private Creator Data Element

}





end.
