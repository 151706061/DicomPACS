unit fPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, OleCtrls, SHDocVw, ImgList, ActnList, dxBar, Word2000, cxClasses,
  ExtCtrls, uReportUtils, Oracle, OracleData,
  uPrintDocument, dxSkinsCore, dxSkinsdxBarPainter, dxBarExtItems, cxLabel,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxSpinEdit,
  JvComponentBase, JvFormPlacement, JvAppStorage, JvAppRegistryStorage, Registry,
  cxDBLookupComboBox, cxCheckBox, cxButtonEdit, cxBarEditItem;

type
  TMyWordDocument = class(TWordDocument)
   public
   procedure ClosePrintPreview;virtual;//  override;
  end;


type
  TfrmPreview = class(TForm)
    wb: TWebBrowser;
    ilOKCancel: TImageList;
    alOkCancel: TActionList;
    aPrint: TAction;
    aCancel: TAction;
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    bbPrint: TdxBarButton;
    bbCancel: TdxBarButton;
    bbFormat: TdxBarCombo;
    btnPreview: TdxBarButton;
    WordTimer: TTimer;
    PanelKolvoCopy: TPanel;
    cxKolvoCopy: TcxSpinEdit;
    lbl1: TcxLabel;
    dxBarContainerItem1: TdxBarContainerItem;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    procedure aPrintExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure WordTimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    WordApp : TWordApplication;
    WordDoc : TMyWordDocument{TWordDocument};
  public
   Margins: TMargins;
   vDocFileName : string;
  end;

var
  frmPreview: TfrmPreview;

implementation
  uses SMMainAPI, fGetValue, uGlobals, uDBTableUtils, uPrintType, fMain;
{$R *.dfm}

function GetRegisryKey : string;
begin
  RESULT := 'PrintPriemCount'+IntToStr(N_APPSOTRID);
end;



////////////////////////////////////////////////////////////////////////////////
procedure TMyWordDocument.ClosePrintPreview; //override;
var
SaveChanges, OriginalFormat, RouteDocument:OleVariant;
begin
 inherited;
 SaveChanges := WdDoNotSaveChanges;
 Self.Application.Quit(SaveChanges, OriginalFormat, RouteDocument);
end;
////////////////////////////////////////////////////////////////////////////////
(*
procedure TfrmPreview.DoWordProcess(path: String; FormatPr: Integer = 0; bLandscape: Boolean = false; pPreview:boolean = false);
var
	Template, NewTemplate, FileName,
  ConfirmConversions, ReadOnly, AddToRecentFiles,
  PasswordDocument, PasswordTemplate, Revert,
  WritePasswordDocument, WritePasswordTemplate,
  Format, Encoding, EmPar, Visible,
  Background, time,SaveCHanges,OriginalFormat,
  RouteDocument{,DocIndx}  : OleVariant;
  DoDisconnect:boolean;
  AString:AnsiString;
  h:HWND;
  DocumentPassword: OleVariant;
  //TempFileNameSave:OleVariant;
begin
 if (WordDoc<>nil) or  (WordApp<>nil) then
  Begin
   AString :=  '«акройте документ ' + WordDoc.Name;
   Application.MessageBox( pAnsiChar(AString),
                           '»нформаци€',
                           MB_OK + MB_ICONINFORMATION);
   WordApp.Activate;
   exit;
  End;

  Screen.Cursor := crHourGlass;
  EmPar:='';


  WordApp:=TWordApplication.Create(Self);
  WordDoc:=TMyWordDocument.Create(Self);
  WordApp.OnDocumentChange := OnMyDocumentChange;
  try
    Template:='';
    NewTemplate:=TRUE;
    try
      WordApp.Connect;
    except
      //DoDisconnect:=TRUE;
      WordDoc.Close;
      WordDoc.Free;
      Wordapp.Quit;
      WordApp.Free;
//      Application.Terminate;  //??? нужна ли здесь эта строка
    end;

    //Wordapp.Visible:=FALSE;--

    WordApp.Options.CheckSpellingAsYouType:=FALSE;
    WordApp.Options.CheckGrammarAsYouType:=FALSE;

    FileName:=path;

    //ѕечатаем копию
    //TempFileNameSave :=GetTempFile('.htm');
    //CopyFile(FileName,TempFileNameSave);
    //FileName := TempFileNameSave;

    ConfirmConversions:=FALSE;
    ReadOnly:=TRUE;
    AddToRecentFiles:=FALSE;
    PasswordDocument:= '';
    PasswordTemplate:= '';
    Revert:=FALSE;
    WritePasswordDocument:= '';
    WritePasswordTemplate:= '';
    Format:=wdOpenFormatAuto;
    Encoding := EmptyParam;
    Visible:=TRUE;


    //WordDoc.ConnectTo(WordApp.Documents.Add(FileName,ConfirmConversions,Format,Visible));
    //WordDoc.ConnectTo(WordApp.Documents.AddOld(FileName, ConfirmConversions));
    WordDoc.ConnectTo(WordApp.Documents.Open(FileName,
    ConfirmConversions, ReadOnly,
    AddToRecentFiles, PasswordDocument, PasswordTemplate, Revert, WritePasswordDocument, WritePasswordTemplate, Format, Encoding, visible));
    BackGround:=FALSE;
    Time := 1; // ≈сли делать ADD то у только что открытого документа будет 1-й индекс
    //Time:=WordApp.Documents.Count;


    //≈сли ранее были открыты документы (WordApp.Documents.Count > 1 ), то тогда
    //не нужно делать дисконнект, делать дисконнект только при условии, что
    //печатаемый документ - первый (при дисконнекте убиваютс€ все остальные ворды)
    DoDisconnect := WordApp.Documents.Count = 1;

    //------------------------------------------------------------------------------
    if FormatPr = 0 then
      begin
        WordApp.Documents.Item(Time).PageSetup.Orientation:= wdOrientPortrait;
        WordApp.Documents.Item(Time).PageSetup.TextColumns.SetCount(1);
      end;
    if FormatPr = 1 then
      begin
        WordDoc.PageSetup.LineNumbering.Active := 0;
        WordDoc.PageSetup.Orientation := wdOrientLandscape;
        WordDoc.PageSetup.TopMargin := 22.5;
        WordDoc.PageSetup.BottomMargin := 22.5;
        WordDoc.PageSetup.LeftMargin := 56.7;
        WordDoc.PageSetup.RightMargin := 56.7;
        WordDoc.PageSetup.Gutter := 0;
        WordDoc.PageSetup.HeaderDistance := 35.4;
        WordDoc.PageSetup.FooterDistance := 35.4;
        WordDoc.PageSetup.PageWidth := 595.35;
        WordDoc.PageSetup.PageHeight := 419.55;
        WordDoc.PageSetup.FirstPageTray := wdPrinterDefaultBin;
        WordDoc.PageSetup.OtherPagesTray := wdPrinterDefaultBin;
        WordDoc.PageSetup.SectionStart := wdSectionNewPage;
        WordDoc.PageSetup.OddAndEvenPagesHeaderFooter := 0;
        WordDoc.PageSetup.DifferentFirstPageHeaderFooter := 0;
        WordDoc.PageSetup.VerticalAlignment := wdAlignVerticalTop;
        WordDoc.PageSetup.SuppressEndnotes := 0;
        WordDoc.PageSetup.MirrorMargins := 0;
        WordDoc.PageSetup.TwoPagesOnOne := FALSE;
        WordDoc.PageSetup.GutterPos := wdGutterPosLeft;
      end;
    if FormatPr = 2 then
      begin
        WordDoc.PageSetup.LineNumbering.Active := 0;
        WordDoc.PageSetup.Orientation := wdOrientPortrait;
        WordDoc.PageSetup.Gutter := 0;
        WordDoc.PageSetup.FirstPageTray := wdPrinterDefaultBin;
        WordDoc.PageSetup.OtherPagesTray := wdPrinterDefaultBin;
        WordDoc.PageSetup.SectionStart := wdSectionNewPage;
        WordDoc.PageSetup.OddAndEvenPagesHeaderFooter := 0;
        WordDoc.PageSetup.DifferentFirstPageHeaderFooter := 0;
        WordDoc.PageSetup.VerticalAlignment := wdAlignVerticalTop;
        WordDoc.PageSetup.SuppressEndnotes := 0;
        WordDoc.PageSetup.MirrorMargins := 0;
        WordDoc.PageSetup.TwoPagesOnOne := True;
        WordDoc.PageSetup.GutterPos := wdGutterPosTop;
      end;
    if FormatPr = 3 then
      begin
        WordDoc.PageSetup.LineNumbering.Active := 0;
        WordDoc.PageSetup.Orientation := wdOrientPortrait;
        WordDoc.PageSetup.TopMargin := 300;
        WordDoc.PageSetup.BottomMargin := 0.5;
        WordDoc.PageSetup.LeftMargin := 20;
        WordDoc.PageSetup.RightMargin := 20;
        WordDoc.PageSetup.Gutter := 0;
        WordDoc.PageSetup.HeaderDistance := 35.4;
        WordDoc.PageSetup.FooterDistance := 35.4;
        WordDoc.PageSetup.PageWidth := 419.55;
        WordDoc.PageSetup.PageHeight := 595.35;
        WordDoc.PageSetup.FirstPageTray := wdPrinterDefaultBin;
        WordDoc.PageSetup.OtherPagesTray := wdPrinterDefaultBin;
        WordDoc.PageSetup.SectionStart := wdSectionNewPage;
        WordDoc.PageSetup.OddAndEvenPagesHeaderFooter := 0;
        WordDoc.PageSetup.DifferentFirstPageHeaderFooter := 0;
        WordDoc.PageSetup.VerticalAlignment := wdAlignVerticalTop;
        WordDoc.PageSetup.SuppressEndnotes := 0;
        WordDoc.PageSetup.MirrorMargins := 0;
        WordDoc.PageSetup.TwoPagesOnOne := FALSE;
        WordDoc.PageSetup.GutterPos := wdGutterPosLeft;
      end;
//------------------------------------------------------------------------------
    WordApp.ActiveWindow.View.Type_:=wdPageView;

    // ≈фимов ¬.ј. 28.05.2009 ƒобавлен MedotradeSign
    TReportUtils.AddMedotradeSign(WordApp);

    Try
     if not pPreview then
      Begin
        WordApp.PrintOut(BackGround);
      End
     else
      Begin
       Wordapp.Visible:=TRUE;
       DocumentPassword := '[jxegbdf';
       WordDoc.Protect(wdAllowOnlyComments, EmptyParam, DocumentPassword);
       WordDoc.PrintPreview;
       WordApp.ActiveWindow.ActivePane.View.Zoom.Percentage := 100;
       AString:=WordApp.ActiveWindow.Caption + ' - Microsoft Word';
       h:=FindWindow(nil, pAnsiChar(AString));
       if h <> 0 then
        Begin
         //ShowMEssage('ѕробуем');
         //ShowWindow(h, SW_SHOWMINIMIZED);
         ShowWindow(h, SW_SHOWMAXIMIZED);
        End;

       WordApp.ActiveWindow.ActivePane.View.Zoom.Percentage := 100;
       WordTimer.Enabled := TRUE;
      End;
    except
       WordDoc.Close;
       WordDoc.Free;
       Wordapp.Quit;
       WordApp.Free;
       Exit;
    End;
    //WordApp.Activate;
    SaveChanges := WdDoNotSaveChanges; //WdSaveChanges; //xside 17.07.2006

    //WordApp.Quit(SaveChanges,OriginalFormat,RouteDocument) ;   // -----
    //≈сли наш документ единственный, то потом грохаем ворд, иначе будет висеть
    // в пам€ти
    if DoDisconnect and (not pPreview)then
     Begin
      WordApp.Quit(SaveChanges,OriginalFormat,RouteDocument) ;   // -----
     End
    else
     Begin
      if (not pPreview) then
       Begin
        //Wordapp.Visible:=TRUE;
        //DocIndx := 0;
        //≈сли есть еще открытые документы, то тогда закрываем только наш документ.
        WordApp.Documents.Item(Time).Close(SaveChanges,OriginalFormat,RouteDocument);
       End
      else
       Begin
        Wordapp.Visible:=TRUE;
        WordApp.Activate;
        WordTimer.Enabled := TRUE;
       End;
     End;



  except
    on E: Exception do
      begin
        ShowMessage(E.Message);
        //WordApp.Disconnect;
      end;
  end;

   //WordApp.Quit(SaveChanges,OriginalFormat,RouteDocument) ;
  try
    //WordDoc.free;
    //WordApp.free;
  finally
    Screen.Cursor := crArrow;
  end;
end;
*)
(*
procedure TfrmPreview.OnMyDocumentChange(Sender: TObject);
Begin
 //ShowMEssage('1');
End;
*)
/////////////////////////////////////////////////////////////////////////////////
procedure TfrmPreview.WordTimerTimer(Sender: TObject);
var
Time: Integer;
SaveChanges : OleVariant;
OriginalFormat : OleVariant;
RouteDocument : OleVariant;
i:integer;
MyIndex:OleVariant;
AllNAme:string;
MyDocName:string;
pFound:boolean;

Begin
 try
   { pFound := FALSE;
    for I :=  1 to WordApp.Windows.Count do
     Begin
       MyIndex := i;
       AllNAme:=WordApp.Documents.Item(MyIndex).Name;
       MyDocName:=WordDoc.Name;
       if AllNAme = MyDocName then
        Begin
         pFound := TRUE;        
         break;
        End;
     End;   }
    pFound := FALSE;
    MyDocName:= WordDoc.Name;
    DELETE(MyDocName,POS('.',MyDocName),length(MyDocName)-POS('.',MyDocName)+1);
    for I :=  1 to WordApp.Windows.Count do
     Begin
       MyIndex := i;
       {
        AllNAme:=WordApp.Documents.Item(MyIndex).Name;
       }
       AllNAme := WordApp.Windows.Item(MyIndex).Caption;
       if POS(MyDocName, AllNAme) > 0 then
       //if AllNAme = MyDocName then
        Begin
         pFound := TRUE;
         break;
        End;
     End;


// закроем документ
     if pFound then
      if pos('(просмотр)',AnsiLowerCase(WordApp.Windows.Item(MyIndex).Caption)) <= 0  then
       Begin
        Time:=WordApp.Documents.Count;
        SaveChanges := WdDoNotSaveChanges;
        OriginalFormat := UnAssigned;
        RouteDocument := UnAssigned;
        // если были открытые документы вернем их..     }
        if (Time>1)  then
         BEgin
          WordApp.Windows.Item(MyIndex).Close(SaveChanges,RouteDocument);
          //WordDoc.ActiveWindow.c (SaveChanges,OriginalFormat,RouteDocument);
          Wordapp.Visible:=true
         End
        else
         Begin
          Wordapp.Quit(SaveChanges,OriginalFormat,RouteDocument);
         End;


        WordApp.Disconnect;
        FreeAndNil(WordDoc);
        FreeAndNil(WordApp);
        WordTimer.Enabled := FALSE;
       End;
 except
  WordTimer.Enabled := FALSE;
 end;
End;
////////////////////////////////////////////////////////////////////////////////

procedure TfrmPreview.FormClose(Sender: TObject; var Action: TCloseAction);
var
 Registry: TRegistry;
 Value: integer;
begin
 if Assigned(WordApp) then
  Begin
   WordApp.Disconnect;

   if Assigned(WordDoc) then
    Begin
     WordDoc.free;
    End;


   WordApp.free;
  End;


  WordDoc := nil;
  WordApp := nil;
  Registry := TRegistry.Create;
  Registry.RootKey := HKEY_CURRENT_USER;
  if Registry.OpenKey('Software\Softmaster\Priem', TRUE) then
   begin
    Value := cxKolvoCopy.Value;
    Registry.WriteInteger(GetRegisryKey, Value);
    Registry.CloseKey;
   end;
  Registry.Free;

end;

procedure TfrmPreview.FormCreate(Sender: TObject);
var
 Registry: TRegistry;
begin
 WordDoc := nil;
 WordApp := nil;
 Registry := TRegistry.Create;
 Registry.RootKey := HKEY_CURRENT_USER;
 if Registry.OpenKey('Software\Softmaster\Priem', TRUE) then
  begin
   Try
    cxKolvoCopy.Value := Registry.ReadInteger(GetRegisryKey);
   except
    cxKolvoCopy.Value := 1;
   End;
   Registry.CloseKey;
  end;
 Registry.Free;
end;

procedure TfrmPreview.aPrintExecute(Sender: TObject);
begin
  ModalResult := MrOK;
end;

procedure TfrmPreview.btnPreviewClick(Sender: TObject);
var
  pShowTopMargin: boolean;
  os: TOracleSession;
  aBeforePrintCallBack: TBeforePrintCallBack;
  iFormat : integer;
begin
  aBeforePrintCallBack := nil;
  os := TOracleSession.Create(nil);
  try
   GetSession(os, 'ASU');
   pShowTopMargin := TDBUtils.GetFunctionDef('GET_TOP_MARGIN_PRIEM_VIEW', OS,0) = 1;
  finally
   os.Free;
  end;
  iFormat := Self.bbFormat.ItemIndex;
  if iFormat = 5 then
   iFormat := 7;
  DoPrintDocument(vDocFileName, iFormat, FALSE, TRUE, aBeforePrintCallBack, 1, false, true, pShowTopMargin);
end;

procedure TfrmPreview.aCancelExecute(Sender: TObject);
begin
  ModalResult := MrCancel;
end;

end.
