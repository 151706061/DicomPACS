unit fMain;

{
  параметры в реестре в процедуре CmnUnit.Read_Registry_Params
  MyprepareResponse                  - reject
  DicomServerCore1NormalisedReceived - обработка сообщений устройств
  DicomServerCore1DicomFind          - запрос списка / по пациенту
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, SvcMgr, Dialogs,
  KXString, KXServerCore, DCM_Server, IniFiles, DCM_Connection, DCM_UID, DCM_Attributes,
  DB, DCM_Dict, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery, pFIBProps,
  IBDatabase, DCM_Client, DBAccess, Uni, PostgreSQLUniProvider, MemDS, ExtCtrls;

type
  TDicomWLServer = class(TService)
    DicomServerCore1: TDicomServerCore;
    TimerAuotLoadWl: TTimer;
    procedure ServiceExecute(Sender: TService);
    procedure DicomServerCore1DicomAssociation(
      AClientThread: TDicomClientThread; AAddress: string; AReg: TRequest;
      var AHandleType: Integer);
    procedure DicomServerCore1DicomFind(AClientThread: TDicomClientThread;
      AAddress: string; ACommand: TDicomAttributes; ARequestDatasets,
      AResponseDatasets: TList);
    procedure DicomServerCore1ClientNewCommand(Sender: TObject;
      AAssociation: TAssociation; ADataset: TDicomAttributes;
      APosition: Integer; AStream: TStream);
    procedure DicomServerCore1ClientNewData(Sender: TObject;
      AAssociation: TAssociation; ADataset: TDicomAttributes;
      APosition: Integer; AStream: TStream);
    procedure DicomServerCore1DicomGet(AClientThread: TDicomClientThread;
      AAddress: string; ACommand: TDicomAttributes; ARequestDatasets,
      AResponseDatasets: TList);
    procedure DicomServerCore1DicomLogit(AClientThread: TDicomClientThread; AIP,
      Msg: string);
    procedure DicomServerCore1NormalisedReceived(
      AClientThread: TDicomClientThread; AAddress: string;
      ACommand: TDicomAttributes; ARequestDatasets, AResponseDatasets: TList);
    procedure ServiceShutdown(Sender: TService);
    procedure ServiceDestroy(Sender: TObject);
    procedure DicomServerCore1NormalisedReceivedNCreate(
      AClientThread: TDicomClientThread; AAddress: string;
      ACommand: TDicomAttributes; ARequestDatasets, AResponseDatasets: TList);
    procedure DicomServerCore1NormalisedReceivedNDelete(
      AClientThread: TDicomClientThread; AAddress: string;
      ACommand: TDicomAttributes; ARequestDatasets, AResponseDatasets: TList);
    procedure DicomServerCore1NormalisedReceivedNSet(
      AClientThread: TDicomClientThread; AAddress: string;
      ACommand: TDicomAttributes; ARequestDatasets, AResponseDatasets: TList);
    procedure ServiceCreate(Sender: TObject);
    procedure TimerAuotLoadWlTimer(Sender: TObject);
  private
    vAmmConnections : Integer;
    vUseSync        : Boolean;
    vDateTimeLastCheck : TDateTime;
    function fStopExecution:Boolean;
    procedure MyOnTerminate(Sender: TObject);
  public
    { Public declarations }
    nPort : Integer; // порт подключение
    vcodepage : string; // путь к БД
    procedure fParseTextDate ( pStr:string; var pDt1:TDateTime; var pDt2:TDateTime );
    procedure IncConnections;
    procedure DecConnections;
    function GetServiceController: TServiceController; override;
    procedure DoQueryInsert(sEvent : string; nType : Integer; dDate : TDateTime; sRemark : string; AClientThread: TDicomClientThread = nil );
    procedure p_free_conn_fb ( p_DB : TpFIBDatabase;
                               p_trWrite: TpFIBTransaction;
                               p_trRead: TpFIBTransaction
                             );
  end;

const c_pk_log = 'query_log'; // папка где будут храниться дополнительные логи

var
  DicomWLServer: TDicomWLServer;
  //
  v_i : Integer;
  v_F:TextFile;
  //
  v_is_ds_log ,
  v_is_log    ,
  v_is_db_log : boolean;

implementation

uses DicomDatabaseLinkIBX, DateUtils, CmnUnit, CmnUnit1, DICOM_CMN, DICOM_charset, pFIBDataSet,
  DB_CMN;

{$R *.DFM}

function TDicomWLServer.fStopExecution:Boolean;
begin
  if ((vAmmConnections>vWL_max_connections) and (vWL_max_connections>0)) then    // 1 - проверка на кол-во соединений
  begin
    Result:=True;
  end else
  if ( (vWLMinFreeMemory>0) and (gtFreeVirtualMemory<vWLMinFreeMemory) ) then // 2 - проверка на свободную память
  begin
    Result:=True;
  end else
    Result:=False;
end;

procedure TDicomWLServer.IncConnections;
var vTime : TDateTime;
begin
  vTime:=Now;
  if ((vAmmConnections>0) and (Abs(MinutesBetween(vDateTimeLastCheck,vTime))>30)) then
  begin
    vAmmConnections:=0;
    vDateTimeLastCheck:=Now;
  end;
  while (vUseSync or fStopExecution) and (SecondsBetween(vTime,Now)<=vWLMaxTimeoutThreadWait)
    do Sleep(100);
  vUseSync:=True;
  Inc(vAmmConnections);
  Lg_ev('inc vAmmConnections : '+inttostr(vAmmConnections));
  vUseSync:=False;
end;

procedure TDicomWLServer.DecConnections;
var vTime : TDateTime;
begin
  vTime:=Now;
  while vUseSync and (SecondsBetween(vTime,Now)<=vWLMaxTimeoutThreadWait)
    do Sleep(100);
  vUseSync:=True;
  if vAmmConnections>0 then
    Dec(vAmmConnections);
  Lg_ev('Dec vAmmConnections : '+inttostr(vAmmConnections));
  vUseSync:=False;
end;

procedure TDicomWLServer.p_free_conn_fb ( p_DB : TpFIBDatabase;
                                          p_trWrite: TpFIBTransaction;
                                          p_trRead: TpFIBTransaction
                                        );
begin
  DB_CMN.p_free_conn_fb ( p_DB ,
                   p_trWrite,
                   p_trRead
                 );
end;

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  DicomWLServer.Controller(CtrlCode);
end;

function MyprepareResponse( const request: TRequest;
                            const s: string;
                            const astr: TStrings;
                            const flag: Boolean;
                            const AAddress: string;
                            AClientThread: TDicomClientThread ): TDicomResponse;
var l, k, j1{, i1}: Integer;
    acknowledge: TAcknowledge;
    uidentry, uidentry1: TUIDEntry;
//    flag2: Boolean;
    str1: string;
    v_filename_resp : AnsiString;
begin
  v_filename_resp:=ExtractFilePath(paramstr(0))+'WLresponse.log';
  if fMain.v_is_log then
  begin
    CmnUnit1.Lg_ev('MyprepareResponse');
    CmnUnit1.Lg_ev( 'request : '+request.Text, v_filename_resp, True );
    CmnUnit1.Lg_ev('Проверка 1 ApplicationContextUid='''+request.ApplicationContextUid+'''');
  end;
  if request.isPrivateApplicationContext then
    begin
      if fMain.v_is_log then
        CmnUnit1.Lg_ev('MyprepareResponse : USER_APPLICATIONCONTEXTNAME_NOT_SUPPORTED');
      result := TDicomReject.Create(REJECTED_PERMANENT, DICOM_UL_SERVICE_USER_reject, USER_APPLICATIONCONTEXTNAME_NOT_SUPPORTED);
      if fMain.v_is_log then
        CmnUnit1.Lg_ev( result.Text, v_filename_resp, True );
      if fMain.v_is_db_log then
        EventLogIns( 'Событие: REJECTED_PERMANENT', 3, Now,
                   'ApplicationContextUid='''+request.ApplicationContextUid+''''+
                   ' USER_APPLICATIONCONTEXTNAME_NOT_SUPPORTED' );
      exit;
    end;
  // проверка CALLEDAETITLE CALLINGAETITLE
  if fMain.v_is_log then
    CmnUnit1.Lg_ev('Признак проверки AETITLE chk_AETITLE='+inttostr(CmnUnit1.v_chk_AETITLE));
  if (CmnUnit1.v_chk_AETITLE=1) then begin
    // проверим AETITLE WL сервера
    if fMain.v_is_log then
      CmnUnit1.Lg_ev('Проверка 2 v_AE_TITLE_WL='+v_AE_TITLE_WL+' request.CalledTitle='+request.CalledTitle);
    if ( Trim(v_AE_TITLE_WL) <> '') and (request.CalledTitle <> v_AE_TITLE_WL) then
    begin
      if fMain.v_is_log then
        CmnUnit1.Lg_ev('MyprepareResponse : USER_CALLED_AETITLE_NOT_RECOGNIZED');
      result := TDicomReject.Create(REJECTED_PERMANENT, DICOM_UL_SERVICE_USER_reject, USER_CALLED_AETITLE_NOT_RECOGNIZED);
      if fMain.v_is_log then
        CmnUnit1.Lg_ev( result.Text, v_filename_resp, True );
      if fMain.v_is_db_log then
        EventLogIns( 'Событие: REJECTED_PERMANENT', 3, Now,
                   'request.CalledTitle='''+request.CalledTitle+''''+
                   ' MY_AETITLE='+v_AE_TITLE_WL+
                   ' USER_CALLED_AETITLE_NOT_RECOGNIZED' );
      exit;
    end;
    // проверим AETITLE в списке устройств
    if fMain.v_is_log then
      CmnUnit1.Lg_ev('Проверка 3 request.CallingTitle='+request.CallingTitle);
    if ((not CmnUnit1.chk_AETITLE_lst(request.CallingTitle, AAddress, AClientThread))
      and (Trim(request.CallingTitle)<>''))
    then begin
      if fMain.v_is_log then
        CmnUnit1.Lg_ev('MyprepareResponse : USER_CALLED_AETITLE_NOT_RECOGNIZED');
      result := TDicomReject.Create(REJECTED_PERMANENT, DICOM_UL_SERVICE_USER_reject, USER_CALLING_AETITLE_NOT_RECOGNIZED);
      if fMain.v_is_log then
        CmnUnit1.Lg_ev( result.Text, v_filename_resp, True );
      if fMain.v_is_db_log then
        EventLogIns( 'Событие: REJECTED_PERMANENT', 3, Now,
                   ' request.CallingTitle='''+request.CallingTitle+''''+
                   ' USER_CALLING_AETITLE_NOT_RECOGNIZED' );
      exit;
    end;
  end;

  acknowledge := TAcknowledge.Create;
  acknowledge.MaxPduSize := request.MaxPduSize;
  acknowledge.CalledTitle := trim(request.CalledTitle);
  acknowledge.CallingTitle := trim(request.CallingTitle);
  acknowledge.ApplicationContextUid := request.ApplicationContextUid;
  // 24_08_2012 FOMIN
  // взято из исходников компонентов
  if acknowledge.MaxPduSize<1048576 then
  begin
    acknowledge.MaxPduSize:=1048576; // 1048576;    16384
  end;
  //
  if fMain.v_is_log then
    CmnUnit1.Lg_ev( ' ApplicationContextUid '+request.ApplicationContextUid);
  //
  for k := 0 to request.getPresentationContexts - 1 do
    begin
      uidentry := request.getAbstractSyntax(k);
      if (uidentry.UIDType = 1) or (uidentry.UIDType = 4) then
        begin
          l := 0;
          for j1 := 0 to request.getTransferSyntaxes(k) - 1 do
            begin
              uidentry1 := request.getTransferSyntax(k, j1);
              str1 := Uppercase(request.CalledTitle);
              //
              if k=0 then CmnUnit1.Lg_ev( ' PRESENTATIONCONTEXTUid '+uidentry1.AsString);
              //
              if (uidentry1.Constant = ImplicitVRLittleEndian) then
                begin
                  acknowledge.addPresentationContext(request.getPresentationContextID(k), 0, uidentry1.Constant);
                  inc(l);
                end;
            end;
          if l <= 0 then
            acknowledge.addPresentationContext(request.getPresentationContextID(k), 4, ExplicitVRLittleEndian);
        end;
    end;
  {
  if flag then
    begin
      flag2 := TRUE;
      for i1 := 0 to acknowledge.getPresentationContexts - 1 do
        begin
          if acknowledge.getResult(i1) = 0 then
            flag2 := FALSE;
        end;
      if flag2 then
        begin
          CmnUnit1.Lg_ev('MyprepareResponse : REJECTED_PERMANENT, DICOM_UL_SERVICE_USER_reject, USER_NO_REASON_GIVEN');
          result := TDicomReject.Create(REJECTED_PERMANENT, DICOM_UL_SERVICE_USER_reject, USER_NO_REASON_GIVEN);
          CmnUnit1.Lg_ev( result.Text, v_filename_resp, True );
          exit;
        end;
    end; }
  if fMain.v_is_log then
    CmnUnit1.Lg_ev('MyprepareResponse : CalledTitle : '+acknowledge.CalledTitle+
                           ', CallingTitle : '+acknowledge.CallingTitle+
                           ', Reason : '+inttostr(acknowledge.Reason)+
                           ', Text : ' + acknowledge.Text, v_filename_resp, True );
  result := acknowledge;
  if fMain.v_is_log then
    CmnUnit1.Lg_ev( result.Text, v_filename_resp, True );
end;

procedure TDicomWLServer.DicomServerCore1ClientNewCommand(Sender: TObject;
  AAssociation: TAssociation; ADataset: TDicomAttributes; APosition: Integer;
  AStream: TStream);
//var cn1:integer;
begin
  if fMain.v_is_log then
    CmnUnit1.Lg_ev('DicomServerCore1ClientNewCommand');
  if not DB_CMN.v_isPostgres then begin
    CmtTrans(DB_CMN.trRead);
    CmtTrans(DB_CMN.trWrite);
  end;
  if fMain.v_is_ds_log then
    ds_sav ( ADataset, nil,nil,'.command' );
  if fMain.v_is_log then
    CmnUnit1.Lg_ev('DicomServerClientNewCommand command= '+
    inttostr(ADataset.getInteger(dCommandField))+' '+
    gt_cmd_name(ADataset.getInteger(dCommandField)) );
  if fMain.v_is_log then
    CmnUnit1.Lg_ev('Request '+#13+AAssociation.Request.Text,ExtractFilePath(paramstr(0))+c_pk_log+'\request.log');
end;

procedure TDicomWLServer.DicomServerCore1ClientNewData(Sender: TObject;
  AAssociation: TAssociation; ADataset: TDicomAttributes; APosition: Integer;
  AStream: TStream);
begin
  if fMain.v_is_log then
    CmnUnit1.Lg_ev('DicomServerCore1ClientNewData');
  if fMain.v_is_ds_log then
    ds_sav ( ADataset, nil,nil,'.Data' );  //  ADataset.count
end;

procedure TDicomWLServer.MyOnTerminate(Sender: TObject);
begin
  if v_isPostgres then
  begin
    (Sender as TDicomClientThread).PGconn.Close;
    (Sender as TDicomClientThread).PGTrans.Free;
    (Sender as TDicomClientThread).PGconn.Free;
  end else
  begin
    p_free_conn_fb ( (Sender as TDicomClientThread).v_ClThr_DB as TpFIBDatabase ,
                     (Sender as TDicomClientThread).v_ClThr_trWrite as TpFIBTransaction ,
                     (Sender as TDicomClientThread).v_ClThr_trRead as TpFIBTransaction
                    );
    p_free_conn_fb ( (Sender as TDicomClientThread).v_ClThr_LOGDB as TpFIBDatabase ,
                     (Sender as TDicomClientThread).v_ClThr_LOGtrWrite as TpFIBTransaction ,
                     (Sender as TDicomClientThread).v_ClThr_LOGtrRead as TpFIBTransaction
                    );
  end;
end;

procedure TDicomWLServer.DicomServerCore1DicomAssociation(
         AClientThread: TDicomClientThread;
         AAddress: string;
         AReg: TRequest;
         var AHandleType: Integer
         );
var r: TDicomResponse;
  v_trRead: TpFIBTransaction;
  v_trWrite: TpFIBTransaction;
  v_DB: TpFIBDatabase;
  v_LOGtrRead: TpFIBTransaction;
  v_LOGtrWrite: TpFIBTransaction;
  v_LOGDB: TpFIBDatabase;
  v_PGconn: TUniConnection;
  v_PGTrans : TUniTransaction;
begin
  AClientThread.isPg := v_isPostgres;
  if v_isPostgres then
  begin
    v_PGconn := DB_CMN.PgConnCrt;
    v_PGTrans := PGTransCreate (v_PGconn) ;
    v_PGTrans.DefaultConnection:=v_PGconn;
    AClientThread.PGconn := v_PGconn;
    AClientThread.PGTrans := v_PGTrans;
  end else
  begin
    v_DB:=f_fb_db_crt(c_wlalias);
    v_trRead:= f_FbReadTransactCreate( v_DB );
    v_trWrite:= f_FbWriteTransactCreate( v_DB );
    //
    AClientThread.v_ClThr_trRead  := v_trRead ;
    AClientThread.v_ClThr_trWrite := v_trWrite ;
    AClientThread.v_ClThr_DB      := v_DB ;
    //
    v_LOGDB:=f_fb_db_crt(c_alias);
    v_LOGtrRead:= f_FbReadTransactCreate( v_LOGDB );
    v_LOGtrWrite:= f_FbWriteTransactCreate( v_LOGDB );
    //
    AClientThread.v_ClThr_LOGtrRead  := v_LOGtrRead ;
    AClientThread.v_ClThr_LOGtrWrite := v_LOGtrWrite ;
    AClientThread.v_ClThr_LOGDB      := v_LOGDB ;
  end;
  //
  if not assigned(AClientThread.OnTerminate) then
    AClientThread.OnTerminate := MyOnTerminate; // определяем разрыв соединения
  //
  if fMain.v_is_log then
    CmnUnit1.Lg_ev('DicomServerCore1DicomAssociation address: '+AAddress+' AHandleType: '+IntToStr(AHandleType));
  AHandleType := 1; // Access
  AHandleType := -1; //Custom
  r := MyPrepareResponse(AReg, '', nil, true, AAddress, AClientThread);
  TDicomClientThread(AClientThread).Association.sendAssociateResponse(r);
  if fMain.v_is_db_log then
    DoQueryInsert('Событие. DicomAssociation',
                1,
                Now,
                'Событие сервера DicomAssociation'+#13+
                'AAddress: '+AAddress+#13+
                'AHandleType: '+IntToStr(AHandleType),
                AClientThread  );
end;

function GetAge(AD1, AD2: TDatetime): string;
var
  y, m, d, y1, m1, d1: word;
begin
  DecodeDate(ad1, y, m, d);
  DecodeDate(ad2, y1, m1, d1);
  Result := Format('%3dY', [(y1 - y)]);
  for d := 1 to 3 do
    if Result[d] = ' ' then
      Result[d] := '0'
end;

procedure TDicomWLServer.fParseTextDate ( pStr:string; var pDt1:TDateTime; var pDt2:TDateTime );
var vStr:string; vPos:Integer;
function fGtMinDate():TDateTime;
begin
  Result:=EncodeDate(1900,1,1);
end;
function fGtMaxDate():TDateTime;
begin
  Result:=EncodeDate(2100,1,1);
end;
begin
  vStr:=trim(pStr);
  vPos:=Pos('-',vStr);
  if vPos=0 then // нет разделителя - дата одна
  begin
    if not TryStrToDate(vStr,pDt1) then
      pDt1:=Date;
    pDt2:=pDt1;
  end else if vPos=1 then // разделитель на первой позиции - выборка до указанной даты
  begin
    pDt1:=fGtMinDate();
    vStr:=copy(vStr,2,Length(vStr)-1);
    if not TryStrToDate(vStr,pDt2) then
      pDt2:=Date;
  end else if vPos=Length(vStr) then // разделитель на последней позиции - выборка начиная с указанной даты
  begin
    pDt2:=fGtMaxDate();
    vStr:=copy(vStr,1,Length(vStr)-1);
    if not TryStrToDate(vStr,pDt1) then
      pDt1:=Date;
  end else
  begin
    if not TryStrToDate(copy(vStr,1,vPos-1),pDt1) then
      pDt1:=fGtMinDate();
    if not TryStrToDate(copy(vStr,vPos+1,Length(vStr)),pDt2) then
      pDt2:=fGtMaxDate();
  end;
end;

procedure TDicomWLServer.DicomServerCore1DicomFind(AClientThread: TDicomClientThread; AAddress: string; ACommand: TDicomAttributes;
                                                   ARequestDatasets, AResponseDatasets: TList);
var z1, d1, da1, rq, seq: TDicomAttributes;
    x1, x2, at, at1: TDicomAttribute;
    kk, Root: Integer;
    str1, Level, sql1, modility, APPLY_NO, PatientID, Pname, psex : string;
  //  Query1: TDataset;
    date1: TDatetime;
    sDate1, sDate2 : string;
    FIBDataset : TpFIBDataset;
  //  FIBQuery : TpFIBQuery;
  procedure SetParamAsDatetime(AName: string; AValue: TDatetime);
  var i: integer;
      str1: string;
      dasx1, dasx2: TDicomAttributes;
  begin
    dasx1 := nil;
    for i := 0 to at1.GetCount - 1 do
    begin
      dasx2 := at1.Attributes[i];
      str1 := dasx2.GetString($2809, $28);
      if str1 = AName then
      begin
        dasx2.Item[$2809, $25].AsDatetime[0] := AValue;
        //        dasx1 := dasx2;
        exit;
      end;
    end;
    if not assigned(dasx1) then
    begin
      dasx1 := TDicomAttributes.Create;
      dasx1.Add($2809, $28).asString[0] := AName;
      dasx1.Add($2809, $29).asInteger[0] := 3;
      dasx1.Add($2809, $25).asDatetime[0] := AValue;
      at1.AddData(dasx1);
    end;
  end;
  procedure DicomApplyTable;
  var xxda1: TDicomAttribute;
      xxdas1: TDicomAttributes;
      vDD, vDBeg, vDEnd : TDateTime;
    function fStr(pstr:string):string;
    begin
      Result:=StringReplace(pstr,'^','',[rfReplaceAll, rfIgnoreCase]);
    end;  
    procedure chkDS (p_DS:TDataset);
    var dd, dd1, dd2 : TDicomAttribute; da2 : TDicomAttributes;
    begin
      try
      p_DS.Open;
      except
      on E:Exception do
        Lg_ev('SQL_ERROR '+E.Message);
      end;
      p_DS.First;
      if p_DS.Eof then
        Lg_ev('Not found records')
      else
        Lg_ev('Found '+inttostr(p_DS.RecordCount)+' records');
      while not p_DS.Eof do
      begin
        da1 := TDicomAttributes.Create;
        AResponseDatasets.Add(da1);
      //  da1.ImageData:=nil;

        if (Trim(vcodepage)<>'') then da1.AddVariant(dSpecificCharacterSet, vcodepage);

        da1.Add($0008, $0050); // (AccessionNumber)SH=<0>NULL
        if (Trim(p_DS.FieldByName('ACCESSIONNUMBER').asstring)<>'') then
          da1.Add($0008, $0050).AsString[0] := p_DS.FieldByName('ACCESSIONNUMBER').asstring
        else
          da1.Add($0008, $0050);
        da1.Add($0010, $0010); // tePacFIO Пациент
        if (Trim(p_DS.FieldByName('P_ENAME').asstring)<>'') then
          da1.Add($0010, $0010).AsString[0] := fStr(p_DS.FieldByName('P_ENAME').asstring)
        else
          da1.Add($0010, $0010);
        da1.Add($0010, $0020); // tePatientID
        if (Trim(p_DS.FieldByName('P_PID').asstring)<>'') then
          da1.Add($0010, $0020).AsString[0] := p_DS.FieldByName('P_PID').asstring
        else
          da1.Add($0010, $0020);
        da1.Add($0010, $0030); // (PatientBirthDate)DA=<0>NULL
        if ( Yearof(p_DS.FieldByName('P_DATEBORN').AsDateTime)>1900 ) then
          da1.Add($0010, $0030).AsString[0] := DateToStr( p_DS.FieldByName('P_DATEBORN').AsDateTime )
        else
          da1.Add($0010, $0030);
        da1.Add($0010, $0040); // Patient's Sex  Enumerated Values: M = male F = female O = other
        if (Trim(p_DS.FieldByName('P_SEX').asstring)<>'') then
          da1.Add($0010, $0040).AsString[0] := p_DS.FieldByName('P_SEX').asstring
        else
          da1.Add($0010, $0040);
        da1.Add($0020, $000D); // STUDYUID
        if (Trim(p_DS.FieldByName('STUDYUID').asstring)<>'') then
          da1.Add($0020, $000D).AsString[0] := p_DS.FieldByName('STUDYUID').asstring
        else
          da1.Add($0020, $000D);
        //
        da1.Add($0040, $1001); // Requested Procedure ID (0040,1001) O 1
        if (Trim(p_DS.FieldByName('ProcedureID').asstring)<>'') then
          da1.Add($0040, $1001).AsString[0] := p_DS.FieldByName('ProcedureID').asstring
        else
          da1.Add($0040, $1001);
        da1.Add($0032, $1060); // The Requested Procedure Description
        if (Trim(p_DS.FieldByName('ProcDescription').asstring)<>'') then
          da1.Add($0032, $1060).AsString[0] := p_DS.FieldByName('ProcDescription').asstring
        else
          da1.Add($0032, $1060);
        da1.Add($0040,$1003); //  Requested Procedure Priority (0040,1003) Requested Procedure Type Urgency. Defined
                               //  Terms are: STAT, HIGH, ROUTINE, MEDIUM, LOW
        if (Trim(p_DS.FieldByName('ProcPriority').asstring)<>'') then
          da1.Add($0040,$1003).AsString[0] := p_DS.FieldByName('ProcPriority').asstring
        else
          da1.Add($0040,$1003);
        // Performed Procedure Step Status (0040,0252) Contains the state of the Performed Procedure Step.
        // Enumerated Values: IN PROGRESS = Started but not complete DISCONTINUED = Canceled or unsuccessfully terminated COMPLETED = Successfully completed
        // cWorklistStateInProgress = 'IN PROGRESS';
        // cWorklistStateDiscounted = 'DISCONTINUED';
        // cWorklistStateCompleted  = 'COMPLETED';
        da1.Add($0040, $0252);
        if (Trim(p_DS.FieldByName('STATUS').asstring)<>'') then
          da1.Add($0040, $0252).AsString[0] := p_DS.FieldByName('STATUS').asstring
        else
          da1.Add($0040, $0252);
        // STARTDATEWORKLIST StepStartTime
        if not TryEncodeDateTime( YearOf(p_DS.FieldByName('STARTDATEWORKLIST').asDateTime) ,
                                  MonthOf(p_DS.FieldByName('STARTDATEWORKLIST').asDateTime),
                                  DayOf(p_DS.FieldByName('STARTDATEWORKLIST').asDateTime),
                                  HourOf(crtTimeFromStr(p_DS.FieldByName('StepStartTime').AsString)),
                                  MinuteOf(crtTimeFromStr(p_DS.FieldByName('StepStartTime').AsString)),
                                  0,
                                  0,
                                  vDBeg )
        then vDBeg := now;
        // ENDDATEWORKLIST StepFinishTime
        if not TryEncodeDateTime( YearOf(p_DS.FieldByName('ENDDATEWORKLIST').asDateTime) ,
                                  MonthOf(p_DS.FieldByName('ENDDATEWORKLIST').asDateTime),
                                  DayOf(p_DS.FieldByName('ENDDATEWORKLIST').asDateTime),
                                  HourOf(crtTimeFromStr(p_DS.FieldByName('StepFinishTime').AsString)),
                                  MinuteOf(crtTimeFromStr(p_DS.FieldByName('StepFinishTime').AsString)),
                                  0,
                                  0,
                                  vDEnd )
        then vDEnd := now;
        //
        da1.Add( $0040, $0002 );
        da1.Add( $0040, $0002 ).AsDatetime[0] := vDBeg;
        da1.Add( $0040, $0002 ).AsDatetime[1] := vDEnd;
        da1.Add( $0040, $0003 );
        da1.Add( $0040, $0003 ).AsDatetime[0] := vDBeg;
        da1.Add( $0040, $0003 ).AsDatetime[1] := vDEnd;
        //
        dd := da1.Add($0040, $0100); //(ScheduledProcedureStepSequence)SQ=<1>Sequence Data
        da2 := TDicomAttributes.Create;
        //
          da2.Add($0008, $0060); // (Modality)CS=<1>DX
          if (Trim(p_DS.FieldByName('MODALITY').asstring)<>'') then
            da2.Add($0008, $0060).AsString[0] := p_DS.FieldByName('MODALITY').asstring
          else
            da2.Add($0008, $0060);
          da2.Add($0040, $0001); // (ScheduledStationAETitle)AE=<1>HBLB
          if (Trim(p_DS.FieldByName('STATIONAETITLE').asstring)<>'') then
            da2.Add($0040, $0001).AsString[0] := p_DS.FieldByName('STATIONAETITLE').asstring
          else
            da2.Add($0040, $0001);
          da2.Add($0040, $0006); // (ScheduledPerformingPhysiciansName)PN=<0>NULL
          if (Trim(p_DS.FieldByName('PhysiciansName').asstring)<>'') then
            da2.Add($0040, $0006).AsString[0] := p_DS.FieldByName('PhysiciansName').asstring
          else
            da2.Add($0040, $0006);
          da2.Add($0040, $0007); //(ScheduledProcedureStepDescription)LO=<0>NULL
          if (Trim(p_DS.FieldByName('StepDescription').asstring)<>'') then
            da2.Add($0040, $0007).AsString[0] := p_DS.FieldByName('StepDescription').asstring
          else
            da2.Add($0040, $0007);
          da2.Add($0040, $0009); //(ScheduledProcedureStepID)SH=<0>NULL
          if (Trim(p_DS.FieldByName('StepID').asstring)<>'') then
            da2.Add($0040, $0009).AsString[0] := p_DS.FieldByName('StepID').asstring
          else
            da2.Add($0040, $0009);

          da2.Add($0040, $0010); //(ScheduledStationName)SH=<0>NULL
          if (Trim(p_DS.FieldByName('StationName').asstring)<>'') then
            da2.Add($0040, $0010).AsString[0] := p_DS.FieldByName('StationName').asstring
          else
            da2.Add($0040, $0010);
          //
          da2.Add( $0040, $0002 );
          da2.Add( $0040, $0002 ).AsDatetime[0] := vDBeg;
          da2.Add( $0040, $0002 ).AsDatetime[1] := vDEnd;
          da2.Add( $0040, $0003 );                         // доработать потом
        //  da2.Add( $0040, $0003 ).AsDatetime[0] := vDBeg;
        //  da2.Add( $0040, $0003 ).AsDatetime[1] := vDEnd;
        //
        dd.AddData(da2);
        //
        if fMain.v_is_ds_log then
          ds_sav(da1,nil,nil,'.WLrecords');
        p_DS.Next;
      end;
    end;
  var v_UniQr : TUniQuery;
      vDicomAttribute, dd : TDicomAttribute;
      da2 : TDicomAttributes;
      vAccessionnumber, vPacFIO, vPatientID,
      vModality, vDate, vStatus, vStrDateTmp,
      vstrdt : string;
      vStartDateWorklist, vEndDateWorklist,
      vd1, vd2, vdTmp1, vdTmp2  : TDateTime;
      x1 : TDicomAttribute;
      vPosDtRzd : Integer;
  begin
    if fMain.v_is_log then
      Lg_ev('DicomWorklistApplyTable');

    str1 := ' (STUDYUID is not null) ';
    //(AccessionNumber)SH=<0>NULL
    if assigned(rq.Item[$0008, $0050]) then
    begin
      vAccessionnumber := rq.GetString($0008, $0050);
      if Trim(vAccessionnumber)<>'' then
        str1 := str1+' and (ACCESSIONNUMBER=:p_ACCESSIONNUMBER) ';
    end;
    // tePacFIO Пациент
    if assigned(rq.Item[$0010, $0010]) then
    begin
      vPacFIO := rq.GetString($0010, $0010);
      if Trim(vPacFIO)<>'' then
        str1 := str1+' and (P_ENAME like :P_ENAME) ';
    end;
    // tePatientID
    if assigned(rq.Item[$0010, $0020]) then
    begin
      vPatientID := rq.GetString($0010, $0020);
      if Trim(vPatientID)<>'' then
        str1 := str1+' and (P_PID=:P_PID) ';
    end;
    if assigned(rq.Item[$8, $20]) then
    begin
      str1 := str1+' and (STARTDATEWORKLIST >= :p_d1) and (STARTDATEWORKLIST < :p_d2) ';
    end;
    // Sequence Data
    if assigned(rq.Item[$0040, $0100]) then
    begin
      vDicomAttribute:=rq.Item[ $0040, $0100 ];
      da2:=vDicomAttribute.Attributes[0];
      //(Modality)CS=<1>DX
      if assigned(da2.Item[$0008, $0060]) then
      begin
        vModality := da2.GetString($0008, $0060);
        if Trim(vModality)<>'' then
          str1 := str1+' and (MODALITY=:p_MODALITY) ';
      end;
      if assigned(da2.Item[$0040, $0002]) then
        str1 := str1+' and (STARTDATEWORKLIST >= :p_dTmp1) and (STARTDATEWORKLIST < :p_dTmp2) ';
    end;
    // STATUS
    if assigned(rq.Item[$0040, $0252]) then
    begin
      vStatus := rq.GetString($0040, $0252);
      if Trim(vStatus)<>'' then
        str1 := str1+' and (Status=:p_Status) ';
    end;

    if v_isPostgres then begin
      v_UniQr := TUniQuery.Create(nil);
      try
        if AClientThread=nil then begin
          v_UniQr.Connection:=DB_CMN.PGconn;
          v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
        end else begin
          v_UniQr.Connection:=AClientThread.PGconn;
          v_UniQr.Transaction:=AClientThread.PGTrans;
        end;
        v_UniQr.SQL.Text := 'SELECT * FROM '+v_pg_Schema+'.worklist WHERE '+str1;
        Lg_ev('SQL text : '+v_UniQr.SQL.Text);
        if assigned(rq.Item[$0008, $0050]) then
          if Trim(vAccessionnumber)<>'' then
            v_UniQr.ParamByName('p_ACCESSIONNUMBER').AsString := vAccessionnumber;
        if assigned(rq.Item[$0010, $0010]) then
          if Trim(vPacFIO)<>'' then
            v_UniQr.ParamByName('P_ENAME').AsString := '%' + SpSymbRepl(vPacFIO) + '%';
        if assigned(rq.Item[$0010, $0020]) then
          if Trim(vPatientID)<>'' then
            v_UniQr.ParamByName('P_PID').AsString := vPatientID;
        if assigned(rq.Item[$0040, $0252]) then
          if Trim(vStatus)<>'' then
            v_UniQr.ParamByName('p_Status').AsString := Trim(vStatus);
        if assigned(rq.Item[$8, $20]) then
        begin
          vd1 := rq.Item[$8, $20].AsDatetime[0];
          vd2 := rq.Item[$8, $20].AsDatetime[1];
         // if Dayof(vd1)>=DayOf(vd2) then vd2:=vd1;
          v_UniQr.ParamByName('p_d1').AsDateTime := vd1;
          v_UniQr.ParamByName('p_d2').AsDateTime := IncDay(vd2,1);  //
        end;
        // Sequence Data
        if assigned(rq.Item[$0040, $0100]) then
        begin
          vDicomAttribute:=rq.Item[ $0040, $0100 ];
          da2:=vDicomAttribute.Attributes[0];
          //(Modality)CS=<1>DX
          if assigned(da2.Item[$0008, $0060]) then
            if Trim(vModality)<>'' then
              v_UniQr.ParamByName('p_MODALITY').AsString := vModality;
          // deStartDateWorklist   deEndDateWorklist
          x1 := da2.Item[$0040, $0002]; // дата исследования
          if assigned(x1) then
          begin
            vstrdt:=x1.AsString[0];
            Lg_ev('da2.Item[$0040, $0002].AsString[0]='+vstrdt );
            fParseTextDate(vstrdt,vdTmp1,vdTmp2);
            Lg_ev('studydate1 = '+datetostr(vdTmp1)+'  studydate2 = '+datetostr(vdTmp2));
            v_UniQr.ParamByName('p_dTmp1').AsDateTime := vdTmp1;
            v_UniQr.ParamByName('p_dTmp2').AsDateTime := IncDay(vdTmp2,1);
          end;
        end;
        try
          v_UniQr.Transaction.StartTransaction;
          chkDS(v_UniQr);
          if v_UniQr.Transaction.Active then
              v_UniQr.Transaction.Commit;
        except
          on e:Exception do
            begin
              v_UniQr.Transaction.Rollback;
              Lg_ev(e.Message);
              Exit;
            end;
        end;
      finally
        v_UniQr.Free;
      end;
    end else begin // FIREBIRD
      FIBDataset:=TpFIBDataset.Create(nil);
      try
        FIBDataSet.AutoCommit := True;
        if AClientThread=nil then begin
          FIBDataset.Database    := (AClientThread.v_ClThr_DB as TpFIBDatabase);
          FIBDataset.Transaction := (AClientThread.v_ClThr_trRead as TpFIBTransaction);
        end else begin
          FIBDataset.Database    := DB_CMN.DB;
          FIBDataset.Transaction := DB_CMN.trRead;
        end;
        if not FIBDataset.Transaction.Active then
          FIBDataset.Transaction.Active:=True;

        FIBDataset.SQLs.SelectSQL.Text := 'SELECT * FROM WORKLIST WHERE '+str1;
        Lg_ev('SQL text : '+FIBDataset.SQLs.SelectSQL.Text);
        if assigned(rq.Item[$0008, $0050]) then
          if Trim(vAccessionnumber)<>'' then
            FIBDataset.ParamByName('p_ACCESSIONNUMBER').AsString := vAccessionnumber;
        if assigned(rq.Item[$0010, $0010]) then
          if Trim(vPacFIO)<>'' then
            FIBDataset.ParamByName('P_ENAME').AsString := '%' + SpSymbRepl(vPacFIO) + '%';
        if assigned(rq.Item[$0010, $0020]) then
          if Trim(vPatientID)<>'' then
            FIBDataset.ParamByName('P_PID').AsString := vPatientID;
        if assigned(rq.Item[$0040, $0252]) then
          if Trim(vStatus)<>'' then
            FIBDataset.ParamByName('p_Status').AsString := Trim(vStatus);
        // Sequence Data
        if assigned(rq.Item[$0040, $0100]) then
        begin
          vDicomAttribute:=rq.Item[ $0040, $0100 ];
          da2:=vDicomAttribute.Attributes[0];
          //(Modality)CS=<1>DX
          if assigned(da2.Item[$0008, $0060]) then
            if Trim(vModality)<>'' then
              FIBDataset.ParamByName('p_MODALITY').AsString := vModality;
          // deStartDateWorklist   deEndDateWorklist
          if assigned(da2.Item[$8, $20]) then
          begin
            if YearOf(vd1)>1900 then
              FIBDataset.ParamByName('p_d1').AsDateTime := vd1;
            if YearOf(vd2)>1900 then
              FIBDataset.ParamByName('p_d2').AsDateTime := vd2;
          end;
          x1 := da2.Item[$0040, $0002]; // дата исследования
          if assigned(x1) then
          begin
            vstrdt:=x1.AsString[0];
            Lg_ev('da2.Item[$0040, $0002].AsString[0]='+vstrdt );
            fParseTextDate(vstrdt,vdTmp1,vdTmp2);
            Lg_ev('studydate1 = '+datetostr(vdTmp1)+'  studydate2 = '+datetostr(vdTmp2));
            FIBDataset.ParamByName('p_dTmp1').AsDateTime := vdTmp1;
            FIBDataset.ParamByName('p_dTmp2').AsDateTime := IncDay(vdTmp2,1);
          end;
        end;
        chkDS(FIBDataset);
      finally
        FIBDataset.Free;
      end;
    end;
    
    if fMain.v_is_db_log then
      DoQueryInsert('Событие. DicomFind WL Request - ApplyTable',
                    1,
                    Now,
                    'Событие сервера DicomFind WL Request - ApplyTable '+#13+
                    'SQL: '+sql1+#13+
                    'Date1: '+sDate1+'; Date2: '+sDate2,
                    AClientThread );

  //  Log_test_ins('END PROCEDURE');

  end; //cns pacs mwl
begin
  IncConnections;
  try
    if fMain.v_is_log then
      CmnUnit1.Lg_ev('DicomServerCore1DicomFind');
    if fMain.v_is_ds_log then
      ds_sav ( ACommand, ARequestDatasets, AResponseDatasets, '.find' );
    //
    Root := getAffectedSOPClass(ACommand);
    rq := TDicomAttributes(ARequestDatasets[0]);
    Level := Trim(rq.GetString(78));
    modility := '';
    at1 := TDicomAttribute.Create(nil, $2809, $2B);
    //
    if fMain.v_is_log then
      CmnUnit1.Lg_ev('request codepage = '+rq.GetString(dSpecificCharacterSet));
    DicomApplyTable;
  finally
    DecConnections;
  end;
end;

procedure TDicomWLServer.DicomServerCore1DicomGet(
  AClientThread: TDicomClientThread; AAddress: string;
  ACommand: TDicomAttributes; ARequestDatasets, AResponseDatasets: TList);
begin
  IncConnections;
  try
    if fMain.v_is_log then
      CmnUnit1.Lg_ev('DicomServerCore1DicomGet');
    if fMain.v_is_ds_log then
      ds_sav ( ACommand, ARequestDatasets, AResponseDatasets, '.dicomget' );
  finally
    DecConnections;
  end;
end;

procedure TDicomWLServer.DicomServerCore1DicomLogit(
  AClientThread: TDicomClientThread; AIP, Msg: string);
begin
  if fMain.v_is_log then
    CmnUnit1.Lg_ev('DicomServerDicomLogit '+#13+' AIP: '+AIP+#13+' Messsage: '+Msg);
end;

procedure TDicomWLServer.DicomServerCore1NormalisedReceived(
  AClientThread: TDicomClientThread; AAddress: string;
  ACommand: TDicomAttributes; ARequestDatasets, AResponseDatasets: TList);
var v_Command: Integer; rq: TDicomAttributes;
    v_pid, v_UIDFIELD, v_stat, v_codepage,
    v_PerformedProcedureStepStatus : AnsiString;
    v_ok : Boolean;
begin
  IncConnections;
  try
    if fMain.v_is_log then
      CmnUnit1.Lg_ev('DicomServerCore1NormalisedReceived');
    v_ok:=False;
    // обработка запросов pack-устройства
    v_Command := getCommandType(ACommand);
    rq := TDicomAttributes(ARequestDatasets[0]);
    //
    v_PerformedProcedureStepStatus := rq.GetString($40,$252) ;
    v_pid:=rq.GetString($10, $20);      {P_PID}
    v_UIDFIELD:=rq.GetString($20, $10); {p_UIDFIELD}
    v_codepage:=rq.GetString($08, $05);
    //
    if fMain.v_is_log then
      CmnUnit1.Lg_ev('STATUS = '+v_PerformedProcedureStepStatus+' codepage='''+v_codepage+'''');
   { if v_PerformedProcedureStepStatus='IN PROGRESS' then
    begin
      v_stat:=IntToStr(c_BSTATE_INPROGRESS); v_ok:=True;
    end else }
    if v_PerformedProcedureStepStatus='COMPLETED' then
    begin
      v_stat:=IntToStr(c_BSTATE_COMPLETE); v_ok:=True;
    end else begin
      v_stat:=IntToStr(c_BSTATE_INPROGRESS); v_ok:=True;
    end;
    if v_ok then
    case v_Command of
      N_SET_REQUEST:
        begin
          if fMain.v_is_log then
            CmnUnit1.Lg_ev('N_SET_REQUEST'); // DicomServerCore1NormalisedReceivedNSet
          // In progress PatientID StudyID
          //  Update APPLYTABLE set BSTATE=1 where P_PID='+rq.GetString($10, $20))+' and UIDFIELD='+rq.GetString($20, $10))
        //  f_upd_status( v_stat           {p_BSTATE},
        //                v_pid            {P_PID},
        //                v_UIDFIELD       {p_UIDFIELD},
        //                AClientThread
        //              );
          if fMain.v_is_db_log then
            DoQueryInsert('Событие. N_SET_REQUEST',
                                1,
                                Now,
                                ' STATUS = '''+v_PerformedProcedureStepStatus+''''+#13+
                                ' PID='''+v_pid+''''+#13+
                                ' UIDFIELD='''+v_UIDFIELD+''''+#13+
                                ' codepage='''+v_codepage+'''',
                                AClientThread
                                );
        end;
      N_CREATE_REQUEST: // DicomServerCore1NormalisedReceivedNCreate
        begin
          // Complete PatientID StudyID
          if fMain.v_is_log then
            CmnUnit1.Lg_ev('N_CREATE_REQUEST');
          //  Update APPLYTABLE set BSTATE=2 where P_PID='+rq.GetString($10, $20))+' and UIDFIELD='+rq.GetString($20, $10))
        //  f_upd_status( v_stat             {p_BSTATE},
        //                v_pid              {P_PID},
        //                v_UIDFIELD         {p_UIDFIELD} ,
        //                AClientThread
        //              ); }
          if fMain.v_is_db_log then
            DoQueryInsert('Событие. N_CREATE_REQUEST',
                                1,
                                Now,
                                ' STATUS = '''+v_PerformedProcedureStepStatus+''''+#13+
                                ' PID='''+v_pid+''''+#13+
                                ' UIDFIELD='''+v_UIDFIELD+''''+
                                ' codepage='''+v_codepage+'''',
                                AClientThread );
        end;
    end;
    //
    if fMain.v_is_ds_log then
      ds_sav ( ACommand, ARequestDatasets, AResponseDatasets, 'NormalisedReceived' );
  finally
    DecConnections;
  end;
end;

procedure TDicomWLServer.DicomServerCore1NormalisedReceivedNCreate(
  AClientThread: TDicomClientThread; AAddress: string;
  ACommand: TDicomAttributes; ARequestDatasets, AResponseDatasets: TList);
var i:integer; vAttr, da2 : TDicomAttributes; vAttrSeq : TDicomAttribute;
    vAccessionNumber, vPatientName, vPatientID,
    vPatientSex, vSTUDYUID, vProcDescription,
    vRequestedProcedurePriority, vModality,
    vScheduledStationAETitle, vScheduledPerformingPhysiciansName,
    vScheduledProcedureStepDescription,
    vScheduledProcedureStepID,
    vScheduledStationName
    : string;
    vPatientBirthDate,
    vSTARTDATEWORKLIST, vSTARTTIMEWORKLIST : TDateTime;
    v_UniQr : TUniQuery;
begin
  IncConnections;
  try
    try
      vAttr := TDicomAttributes(ARequestDatasets[0]);
      if Assigned( vAttr.Item[$0008, $0050] ) then                 // (AccessionNumber)SH=<0>NULL
        vAccessionNumber := vAttr.GetString(dAccessionNumber)
      else
        vAccessionNumber:='';
      if Assigned( vAttr.Item[$0010, $0010] ) then                 // tePacFIO Пациент
        vPatientName := vAttr.GetString(dPatientName)
      else
        vPatientName:='';
      if Assigned( vAttr.Item[$0010, $0020] ) then                 // tePatientID
        vPatientID := vAttr.GetString(dPatientID)
      else
        vPatientID:='';
      if Assigned( vAttr.Item[$0010, $0030] ) then                 // (PatientBirthDate)DA=<0>NULL
        vPatientBirthDate := vAttr.Item[$0010, $0030].AsDatetime[0]
      else
        vPatientBirthDate:=EncodeDate(1900,1,1);
      if Assigned( vAttr.Item[$0010, $0040] ) then                 // Patient's Sex  Enumerated Values: M = male F = female O = other
        vPatientSex := vAttr.GetString(dPatientSex)
      else
        vPatientSex:='O';
      if Assigned( vAttr.Item[$0020, $000D] ) then                 // STUDYUID
        vSTUDYUID := vAttr.GetString(dStudyInstanceUID)
      else
        vSTUDYUID:=gt_uniq_StudyUID;
      // Requested Procedure ID (0040,1001) O 1           - ПРОПУЩЕНО - пока не нужно
      if Assigned( vAttr.Item[$0032, $1060] ) then                 // The Requested Procedure Description
        vProcDescription := vAttr.GetString(dRequestedProcedureDescription)
      else
        vProcDescription:='';
      if Assigned( vAttr.Item[$0040,$1003] ) then                 //  Requested Procedure Priority (0040,1003) Requested Procedure Type Urgency. Defined
        vRequestedProcedurePriority := vAttr.GetString(dRequestedProcedurePriority)  //  Terms are: STAT, HIGH, ROUTINE, MEDIUM, LOW
      else
        vRequestedProcedurePriority:='';
      // Performed Procedure Step Status (0040,0252)      - ПРОПУЩЕНО - пока не нужно
      // -----------------------------------------------------------------------------
      if Assigned( vAttr.Item[$0040, $0002] ) then                 // STARTDATEWORKLIST
      begin
        vSTARTDATEWORKLIST := vAttr.Item[$0040, $0002].AsDatetime[0]
      end else begin
        vSTARTDATEWORKLIST:=EncodeDate(1900,1,1);
      end;
      if Assigned( vAttr.Item[$0040, $0003] ) then                 // STARTTIMEWORKLIST
        vSTARTTIMEWORKLIST := vAttr.Item[$0040, $0003].AsDatetime[0]
      else
        vSTARTTIMEWORKLIST:=EncodeDate(1900,1,1);
      if Assigned( vAttr.Item[$0040, $0001] ) then                 // (ScheduledStationAETitle)AE=<1>HBLB
          vScheduledStationAETitle := vAttr.Item[$0040, $0001].AsString[0]  // da2.GetString(dScheduledStationAETitle)
        else
          vScheduledStationAETitle:='TEST';
      if Assigned( vAttr.Item[$0008, $0060] ) then                 // (Modality)CS=<1>DX
        vModality := vAttr.GetString(dModality)
      else
        vModality:='OT';
      // -----------------------------------------------------------------------------
      if Assigned( vAttr.Item[$0040, $0100] ) then
      begin  //(ScheduledProcedureStepSequence)SQ=<1>Sequence Data
        vAttrSeq:=vAttr.Item[ $0040, $0100 ];
        for i := 0 to vAttrSeq.GetCount - 1 do //
        begin
          da2:=vAttrSeq.Attributes[i];
          if Assigned( da2.Item[$0008, $0060] ) then                 // (Modality)CS=<1>DX
            if da2.GetString(dModality)<>'' then
              vModality := da2.GetString(dModality)
          else
            vModality:='';
          if Assigned( da2.Item[$0040, $0001] ) then                 // (ScheduledStationAETitle)AE=<1>HBLB
            if da2.Item[$0040, $0001].AsString[0]<>'' then
              vScheduledStationAETitle := da2.Item[$0040, $0001].AsString[0]  // da2.GetString(dScheduledStationAETitle)
          else
            vScheduledStationAETitle:='';
          if Assigned( da2.Item[$0040, $0006] ) then                 // (ScheduledPerformingPhysiciansName)PN=<0>NULL
            vScheduledPerformingPhysiciansName := da2.GetString(dScheduledPerformingPhysiciansName)
          else
            vScheduledPerformingPhysiciansName:='';
          if Assigned( da2.Item[$0040, $0007] ) then                 //(ScheduledProcedureStepDescription)LO=<0>NULL
            vScheduledProcedureStepDescription := da2.GetString(dScheduledProcedureStepDescription)
          else
            vScheduledProcedureStepDescription:='';
          if Assigned( da2.Item[$0040, $0009] ) then                 // ScheduledProcedureStepID
            vScheduledProcedureStepID := da2.GetString(dScheduledProcedureStepID)
          else
            vScheduledProcedureStepID:='';
          if Assigned( da2.Item[$0040, $0010] ) then                 // (ScheduledPerformingPhysiciansName)PN=<0>NULL
            vScheduledStationName := da2.GetString(dScheduledStationName)
          else
            vScheduledStationName:='';
        end;
      end;
      // запись в базу
      // ---------------------------------------------------------------------------
      if v_isPostgres then begin
        v_UniQr := TUniQuery.Create(nil);
        try
          if AClientThread=nil then begin
            v_UniQr.Connection:=DB_CMN.PGconn;
            v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
          end else begin
            v_UniQr.Connection:=AClientThread.PGconn;
            v_UniQr.Transaction:=AClientThread.PGTrans;
          end;
          v_UniQr.SQL.Text :=  'insert into '+v_pg_Schema+'.worklist ('+
                       ' P_ENAME, P_SEX, P_PID, P_DATEBORN, '+
                       ' STUDYUID, ACCESSIONNUMBER,         '+
                       ' MODALITY, STARTDATEWORKLIST,       '+
                       ' ENDDATEWORKLIST, STEPSTARTTIME,    '+
                       ' STEPFINISHTIME, PHYSICIANSNAME,    '+
                       ' STEPDESCRIPTION,            '+  //   STEPID,
                       ' STATIONNAME,           '+  // PROCEDUREID,
                       ' PROCDESCRIPTION, PROCPRIORITY,     '+
                       ' STATIONAETITLE                     '+
                       ' ) values ( '+
                       ' :P_ENAME, :P_SEX, :P_PID, :P_DATEBORN, '+
                       ' :STUDYUID, :ACCESSIONNUMBER,         '+
                       ' :MODALITY, :STARTDATEWORKLIST,       '+
                       ' :ENDDATEWORKLIST, :STEPSTARTTIME,    '+
                       ' :STEPFINISHTIME, :PHYSICIANSNAME,    '+
                       ' :STEPDESCRIPTION,            '+   //  :STEPID,
                       ' :STATIONNAME,           '+  //   :PROCEDUREID,
                       ' :PROCDESCRIPTION, :PROCPRIORITY,     '+
                       ' :STATIONAETITLE                     '+
                       ' )';
          v_UniQr.ParamByName('P_ENAME').AsString := vPatientName;
          v_UniQr.ParamByName('P_SEX').AsString := vPatientSex;
          v_UniQr.ParamByName('P_PID').AsString := vPatientID;
          v_UniQr.ParamByName('P_DATEBORN').AsDateTime := vPatientBirthDate;
          v_UniQr.ParamByName('STUDYUID').AsString := vSTUDYUID;
          v_UniQr.ParamByName('ACCESSIONNUMBER').AsString := vAccessionNumber ;
          v_UniQr.ParamByName('MODALITY').AsString := vModality ;
          v_UniQr.ParamByName('STARTDATEWORKLIST').AsDateTime := vSTARTDATEWORKLIST ;
          v_UniQr.ParamByName('ENDDATEWORKLIST').AsDateTime := vSTARTDATEWORKLIST ;
          v_UniQr.ParamByName('STEPSTARTTIME').AsDateTime := vSTARTTIMEWORKLIST;
          v_UniQr.ParamByName('STEPFINISHTIME').AsDateTime := vSTARTTIMEWORKLIST;
          v_UniQr.ParamByName('PHYSICIANSNAME').AsString := vScheduledPerformingPhysiciansName;
          v_UniQr.ParamByName('STEPDESCRIPTION').AsString := vScheduledProcedureStepDescription ;
        //  ParamByName('STEPID').AsString :=
          v_UniQr.ParamByName('STATIONNAME').AsString := vScheduledStationName ;
        //  ParamByName('PROCEDUREID').AsString :=
          v_UniQr.ParamByName('PROCDESCRIPTION').AsString := vProcDescription ;
          v_UniQr.ParamByName('PROCPRIORITY').AsString := vRequestedProcedurePriority ;
          v_UniQr.ParamByName('STATIONAETITLE').AsString := vScheduledStationAETitle ;
          try
            v_UniQr.Transaction.StartTransaction;
            v_UniQr.ExecSQL;
            if v_UniQr.Transaction.Active then
              v_UniQr.Transaction.Commit;
          except
            on e:Exception do
              begin
                v_UniQr.Transaction.Rollback;
                Lg_ev(e.Message);
                Exit;
              end;
          end;
        finally
          v_UniQr.Free;
        end;
      end else begin // FIREBIRD
        With TpFIBQuery.Create(nil) do
        begin
          if AClientThread=nil then begin
            Database    := (AClientThread.v_ClThr_DB as TpFIBDatabase);
            Transaction := (AClientThread.v_ClThr_trWrite as TpFIBTransaction);
          end else begin
            Database    := DB_CMN.DB;
            Transaction := DB_CMN.trWrite;
          end;
        //  CmtTrans( Transaction );
          try
            if Transaction.Active then begin
              Transaction.Commit;
            end;
            Transaction.StartTransaction;
          except
            on E : Exception do
              if fMain.v_is_log then
                Lg_ev('ERROR '+E.ClassName+' CmtTrans - transaction error raised, with message : '+E.Message);
          end;
          Options := Options + [qoAutoCommit];
          SQL.Text :=  'insert into WORKLIST ('+
                       ' P_ENAME, P_SEX, P_PID, P_DATEBORN, '+
                       ' STUDYUID, ACCESSIONNUMBER,         '+
                       ' MODALITY, STARTDATEWORKLIST,       '+
                       ' ENDDATEWORKLIST, STEPSTARTTIME,    '+
                       ' STEPFINISHTIME, PHYSICIANSNAME,    '+
                       ' STEPDESCRIPTION,            '+  //   STEPID,
                       ' STATIONNAME,           '+  // PROCEDUREID,
                       ' PROCDESCRIPTION, PROCPRIORITY,     '+
                       ' STATIONAETITLE                     '+
                       ' ) values ( '+
                       ' :P_ENAME, :P_SEX, :P_PID, :P_DATEBORN, '+
                       ' :STUDYUID, :ACCESSIONNUMBER,         '+
                       ' :MODALITY, :STARTDATEWORKLIST,       '+
                       ' :ENDDATEWORKLIST, :STEPSTARTTIME,    '+
                       ' :STEPFINISHTIME, :PHYSICIANSNAME,    '+
                       ' :STEPDESCRIPTION,            '+   //  :STEPID,
                       ' :STATIONNAME,           '+  //   :PROCEDUREID,
                       ' :PROCDESCRIPTION, :PROCPRIORITY,     '+
                       ' :STATIONAETITLE                     '+
                       ' )';

          ParamByName('P_ENAME').AsString := vPatientName;
          ParamByName('P_SEX').AsString := vPatientSex;
          ParamByName('P_PID').AsString := vPatientID;
          ParamByName('P_DATEBORN').AsDateTime := vPatientBirthDate;
          ParamByName('STUDYUID').AsString := vSTUDYUID;
          ParamByName('ACCESSIONNUMBER').AsString := vAccessionNumber ;
          ParamByName('MODALITY').AsString := vModality ;
          ParamByName('STARTDATEWORKLIST').AsDateTime := vSTARTDATEWORKLIST ;
          ParamByName('ENDDATEWORKLIST').AsDateTime := vSTARTDATEWORKLIST ;
          ParamByName('STEPSTARTTIME').AsDateTime := vSTARTTIMEWORKLIST;
          ParamByName('STEPFINISHTIME').AsDateTime := vSTARTTIMEWORKLIST;
          ParamByName('PHYSICIANSNAME').AsString := vScheduledPerformingPhysiciansName;
          ParamByName('STEPDESCRIPTION').AsString := vScheduledProcedureStepDescription ;
        //  ParamByName('STEPID').AsString :=
          ParamByName('STATIONNAME').AsString := vScheduledStationName ;
        //  ParamByName('PROCEDUREID').AsString :=
          ParamByName('PROCDESCRIPTION').AsString := vProcDescription ;
          ParamByName('PROCPRIORITY').AsString := vRequestedProcedurePriority ;
          ParamByName('STATIONAETITLE').AsString := vScheduledStationAETitle ;
          try
            ExecQuery;
          except
            on e:Exception do
              begin
                if fMain.v_is_log then
                  Lg_ev('error in DicomServerCore1NormalisedReceivedNCreate: '+#13+
                      ' SQL : '+SQL.Text+#13+
                      ' ' + e.Message);
                Exit;
              end;
          end;
        end;
      end;

      if fMain.v_is_db_log then
        DoQueryInsert('Событие. DicomServerCore1NormalisedReceivedNCreate',
                    1,
                    Now,
                    'Событие сервера DicomServerCore1NormalisedReceivedNCreate : '+#13+
                    ' AccessionNumber = '+vAccessionNumber+#13+
                    ' STUDYUID='+vSTUDYUID,
                    AClientThread );
      // ---------------------------------------------------------------------------
    except
      on E:Exception do
        if fMain.v_is_log then
          Lg_ev('error in DicomServerCore1NormalisedReceivedNCreate: '+#13+
                  ' ' + e.Message);
    end;
  finally
    DecConnections;
  end;
end;

procedure TDicomWLServer.DicomServerCore1NormalisedReceivedNDelete(
  AClientThread: TDicomClientThread; AAddress: string;
  ACommand: TDicomAttributes; ARequestDatasets, AResponseDatasets: TList);
var vSTUDYUID : string; vAttr : TDicomAttributes;  v_UniQr : TUniQuery;
begin // удаление записи из worklist
  IncConnections;
  try
    if ARequestDatasets.Count=0 then
    begin
      if fMain.v_is_log then
        Lg_ev('DicomServerCore1NormalisedReceivedNDelete: '+#13+
              'Empty DataSet');
      if fMain.v_is_db_log then
        DoQueryInsert('Событие. DicomServerCore1NormalisedReceivedNDelete',
                    1,
                    Now,
                    'Событие сервера DicomServerCore1NormalisedReceivedNDelete : '+#13+
                    'Empty DataSet',
                    AClientThread );
      Exit;
    end;
    //
    vAttr := ARequestDatasets[0];
    if Assigned(vAttr.Item[ $0020, $000D ]) then
    begin
      vSTUDYUID := vAttr.GetString( dStudyInstanceUID );
      if fMain.v_is_log then
        Lg_ev('DicomServerCore1NormalisedReceivedNDelete: '+#13+
              ' STUDYUID='+vSTUDYUID);
      if fMain.v_is_db_log then
        DoQueryInsert('Событие. DicomServerCore1NormalisedReceivedNDelete',
                    1,
                    Now,
                    'Событие сервера DicomServerCore1NormalisedReceivedNDelete : '+#13+
                    ' STUDYUID='+vSTUDYUID,
                    AClientThread );
      // ---------------------------------------------------------------------------
      if v_isPostgres then begin
        v_UniQr := TUniQuery.Create(nil);
        try
          if AClientThread=nil then begin
            v_UniQr.Connection:=DB_CMN.PGconn;
            v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
          end else begin
            v_UniQr.Connection:=AClientThread.PGconn;
            v_UniQr.Transaction:=AClientThread.PGTrans;
          end;
          v_UniQr.SQL.Text :=  'delete from '+v_pg_Schema+'.worklist where STUDYUID = :STUDYUID';
          v_UniQr.ParamByName('STUDYUID').AsString := vSTUDYUID;
          try
            v_UniQr.Transaction.StartTransaction;
            v_UniQr.ExecSQL;
            if v_UniQr.Transaction.Active then
              v_UniQr.Transaction.Commit;
          except
            on e:Exception do
              begin
                v_UniQr.Transaction.Rollback;
                Lg_ev(e.Message);
                Exit;
              end;
          end;
        finally
          v_UniQr.Free;
        end;
      end else begin // FIREBIRD
        With TpFIBQuery.Create(nil) do
        begin
          if AClientThread=nil then begin
            Database    := (AClientThread.v_ClThr_DB as TpFIBDatabase);
            Transaction := (AClientThread.v_ClThr_trWrite as TpFIBTransaction);
          end else begin
            Database    := DB_CMN.DB;
            Transaction := DB_CMN.trWrite;
          end;
          try
            if Transaction.Active then begin
              Transaction.Commit;
            end;
            Transaction.StartTransaction;
          except
            on E : Exception do
              if fMain.v_is_log then
                Lg_ev('ERROR '+E.ClassName+' CmtTrans - transaction error raised, with message : '+E.Message);
          end;
          Options := Options + [qoAutoCommit];
          SQL.Text :=  'delete from WORKLIST where STUDYUID = :STUDYUID';
          ParamByName('STUDYUID').AsString := vSTUDYUID;
          try
            ExecQuery;
          except
            on e:Exception do
              begin
                if fMain.v_is_log then
                  Lg_ev('error in DicomServerCore1NormalisedReceivedNDelete: '+#13+
                      ' SQL : '+SQL.Text+#13+
                      ' ' + e.Message);
                Exit;
              end;
          end;
        end;
      end;
      if fMain.v_is_db_log then
        DoQueryInsert('Событие. Execute DicomServerCore1NormalisedReceivedNDelete',
                    1,
                    Now,
                    'Событие сервера DicomServerCore1NormalisedReceivedNCreate : '+#13+
                    ' STUDYUID='+vSTUDYUID,
                    AClientThread );
      // ---------------------------------------------------------------------------
    end;
  finally
    DecConnections;
  end;
end;

procedure TDicomWLServer.DicomServerCore1NormalisedReceivedNSet(
  AClientThread: TDicomClientThread; AAddress: string;
  ACommand: TDicomAttributes; ARequestDatasets, AResponseDatasets: TList);
var vSTUDYUID, vStatus : string; vAttr : TDicomAttributes;
    v_UniQr : TUniQuery;
begin
  IncConnections;
  try
    if ARequestDatasets.Count=0 then
    begin
      if fMain.v_is_log then
        Lg_ev('DicomServerCore1NormalisedReceivedNSet: '+#13+
              'Empty DataSet');
      if fMain.v_is_db_log then
        DoQueryInsert('Событие. DicomServerCore1NormalisedReceivedNSet',
                    1,
                    Now,
                    'Событие сервера DicomServerCore1NormalisedReceivedNSet : '+#13+
                    'Empty DataSet',
                    AClientThread );
      Exit;
    end;
    //
    vAttr := ARequestDatasets[0];
    if Assigned(vAttr.Item[ $0020, $000D ]) and Assigned(vAttr.Item[ $0040, $0252 ]) then
    begin
      vSTUDYUID := vAttr.GetString( dStudyInstanceUID );
      vStatus   := vAttr.GetString( dPerformedProcedureStepStatus );
      if fMain.v_is_log then
        Lg_ev('DicomServerCore1NormalisedReceivedNSet: '+#13+
              ' STUDYUID='+vSTUDYUID);
      if fMain.v_is_db_log then
        DoQueryInsert('Событие. DicomServerCore1NormalisedReceivedNSet',
                    1,
                    Now,
                    'Событие сервера DicomServerCore1NormalisedReceivedNSet : '+#13+
                    ' STUDYUID='+vSTUDYUID,
                    AClientThread );
      // ---------------------------------------------------------------------------
      if v_isPostgres then begin
        v_UniQr := TUniQuery.Create(nil);
        try
          if AClientThread=nil then begin
            v_UniQr.Connection:=DB_CMN.PGconn;
            v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
          end else begin
            v_UniQr.Connection:=AClientThread.PGconn;
            v_UniQr.Transaction:=AClientThread.PGTrans;
          end;
          v_UniQr.SQL.Text := 'update '+v_pg_Schema+'.worklist set status=:status where STUDYUID = :STUDYUID';
          v_UniQr.ParamByName('STUDYUID').AsString := vSTUDYUID;
          v_UniQr.ParamByName('status').AsString := vStatus;
          try
            v_UniQr.Transaction.StartTransaction;
            v_UniQr.ExecSQL;
            if v_UniQr.Transaction.Active then
                v_UniQr.Transaction.Commit;
          except
            on e:Exception do
              begin
                if fMain.v_is_log then
                  Lg_ev('error in DicomServerCore1NormalisedReceivedNSet: '+#13+
                      ' SQL : '+v_UniQr.SQL.Text+#13+
                      ' ' + e.Message);
                Exit;
              end;
          end;
        finally
          v_UniQr.Free;
        end;
      end else begin // FIREBIRD
        With TpFIBQuery.Create(nil) do
        begin
          if AClientThread=nil then begin
            Database    := (AClientThread.v_ClThr_DB as TpFIBDatabase);
            Transaction := (AClientThread.v_ClThr_trWrite as TpFIBTransaction);
          end else begin
            Database    := DB_CMN.DB;
            Transaction := DB_CMN.trWrite;
          end;
          try
            if Transaction.Active then begin
              Transaction.Commit;
            end;
            Transaction.StartTransaction;
          except
            on E : Exception do
              if fMain.v_is_log then
                Lg_ev('ERROR '+E.ClassName+' CmtTrans - transaction error raised, with message : '+E.Message);
          end;
          Options := Options + [qoAutoCommit];
          SQL.Text :=  'update WORKLIST set status=:status where STUDYUID = :STUDYUID';
          ParamByName('STUDYUID').AsString := vSTUDYUID;
          ParamByName('status').AsString := vStatus;
          try
            ExecQuery;
          except
            on e:Exception do
              begin
                if fMain.v_is_log then
                  Lg_ev('error in DicomServerCore1NormalisedReceivedNSet: '+#13+
                      ' SQL : '+SQL.Text+#13+
                      ' ' + e.Message);
                Exit;
              end;
          end;
        end;
      end;
      if fMain.v_is_db_log then
        DoQueryInsert('Событие. Execute DicomServerCore1NormalisedReceivedNSet',
                    1,
                    Now,
                    'Событие сервера DicomServerCore1NormalisedReceivedNSet : '+#13+
                    ' STUDYUID = '+vSTUDYUID+#13+
                    'status = '+ vStatus,
                    AClientThread );
      // ---------------------------------------------------------------------------
    end;
  finally
    DecConnections;
  end;
end;

procedure TDicomWLServer.DoQueryInsert(sEvent: string; nType: Integer; dDate: TDateTime; sRemark: string; AClientThread: TDicomClientThread = nil);
begin
  if fMain.v_is_db_log then
    EventLogIns( sEvent, nType, dDate, sRemark, AClientThread );
end;

function TDicomWLServer.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TDicomWLServer.ServiceCreate(Sender: TObject);
begin
  if fMain.v_is_log then
    CmnUnit1.Lg_ev(DateTimeToStr(Now)+' ServiceCreate');
end;

procedure TDicomWLServer.ServiceDestroy(Sender: TObject);
begin
  if fMain.v_is_db_log then
    EventLogIns('STOP WorkList',
                  0,
                  Now,
                  'Остановка WorkList сервера');
  if v_isPostgres then
  begin
    PgFree ( PGconn, MnUniTransaction );
  end else
  begin
    p_free_conn_fb ( DB_CMN.DB ,
                     DB_CMN.trWrite ,
                     DB_CMN.trRead
                    );
    p_free_conn_fb ( DB_CMN.LOGDB ,
                     DB_CMN.LOGtrWrite ,
                     DB_CMN.LOGtrRead
                    );
  end;
end;

procedure TDicomWLServer.ServiceExecute(Sender: TService);
var str, strs : TStringList;
    Ini : TIniFile; v_IsActive : boolean;
const c_4_razdel   = 'WORKLIST' ;
      c_4_1_IP_Worklist = 'IP_Worklist';
      c_4_2_PORT_Worklist   = 'PORT_Worklist';
      c_4_3_AETITLE_Worklist = 'AETITLE_Worklist';
      c_4_4_CheckAE_Worklist = 'CheckAE_Worklist';
      c_4_5_LOGWorklist = 'LOG_Worklist';    
begin
  vDateTimeLastCheck:=Now;
  vAmmConnections:=0;
  vUseSync:=False;
  v_is_wl_pacs:=0; // установим признак что запущен worklist
  CmnUnit1.v_ds_i:=0;
  sleep(20000);  // !!! нужно для дебага, запускаем сервис в службах, потом лезем в проект и делаем attach
  //
  TimerAuotLoadWl.Enabled := False;
  //
  str := TStringList.Create;
  try
    Log_ins(c_delim);
    Log_ins(' Start service WL');
    Log_ins(' Start set settings WL');
//-- 1. Поднимаем настройки
    Ini := TIniFile.Create(ExtractFilePath(paramstr(0))+'Settings.ini');
    try
      nPort := Ini.ReadInteger(c_4_razdel, c_4_2_PORT_Worklist, 777);
      vcodepage := Ini.ReadString(c_4_razdel, 'CODEPAGE', 'ISO_IR 144');
      v_chk_AETITLE:=Ini.ReadInteger(c_4_razdel, c_4_4_CheckAE_Worklist, 0);
      v_AE_TITLE_WL:=Ini.ReadString(c_4_razdel, c_4_3_AETITLE_Worklist, 'WLSERVER');
      cmn_db_params_read(Ini);
      //
      v_pg_database := vWL_pg_database;
      v_pg_port     := vWL_pg_port;
      v_pg_server   := vWL_pg_server;
      v_pg_user     := vWL_pg_user;
      v_pg_password := vWL_pg_password;
      v_pg_Schema   := vWL_pg_Schema;
      //
      try
        Ini.WriteInteger(c_4_razdel, c_4_2_PORT_Worklist, nPort);
        Ini.WriteString(c_4_razdel, 'CODEPAGE', vcodepage);
        Ini.WriteInteger(c_4_razdel, c_4_4_CheckAE_Worklist, v_chk_AETITLE);
        Ini.WriteString(c_4_razdel, c_4_3_AETITLE_Worklist, v_AE_TITLE_WL);
      except
      end;
      //
      ini_log_read;
      //
      Log_ins(' codepage: '+vcodepage);
      Log_ins(' Port:'+IntToStr(Ini.ReadInteger(c_4_razdel, c_4_2_PORT_Worklist, 777)));
      if v_isPostgres then
      begin
        Log_ins('database: '+v_pg_database +#13+
        'port='+inttostr(v_pg_port) +#13+
        'server='+v_pg_server+#13+
        'user'+v_pg_user );
      end else begin  
        Log_ins(' Base:'+sBase+' для соединения с БД используется alias="'+c_alias+'"');
      end;
    finally
      Ini.Free;
    end;
    Log_ins(' End set settings WL');

  // -- 2. Создаем коннект к БД (для подключения аппаратов извне)
  Log_ins(' Start set connect to BD ');
  DicomServerCore1.DatabaseOperator := TIBXDicomDatabaseOperator.Create(nil);
  if DicomServerCore1.DatabaseOperator = nil then
    begin
      Log_ins(' No DB Link create');
    end else
    begin
      Log_ins(' DB Link create success ');
    end;
  strs := TStringList.Create;
  try
    {$I PacsDBSQL.inc}     //Add the image index database define.
    if strs.Count > 0 then
      DicomServerCore1.AddSQLDefine(strs.Text);
  finally
    strs.Free;
  end;
  Log_ins(' End set connect to BD ');

//-- 3. Создаем БД (для сохранения логов)
  Log_ins(' Start connect database');
  if v_isPostgres then
  begin
    DB_CMN.PGconn := DB_CMN.PgConnCrt;
  end else
  begin
    DB_CMN.DB := f_fb_db_crt(c_wlalias);
    DB_CMN.trRead:= f_FbReadTransactCreate( DB_CMN.DB );
    DB_CMN.trWrite:= f_FbWriteTransactCreate( DB_CMN.DB );
    DB_CMN.LOGDB := f_fb_db_crt(c_logalias);
    DB_CMN.LOGtrRead:= f_FbReadTransactCreate( DB_CMN.LOGDB );
    DB_CMN.LOGtrWrite:= f_FbWriteTransactCreate( DB_CMN.LOGDB );
  end;
  Log_ins(' End connect database');

  Log_ins(' Start create transaction');
  if v_isPostgres then
  begin
    DB_CMN.MnUniTransaction := PGTransCreate (DB_CMN.PGconn) ;
  end else
  begin
    try
      DB_CMN.trRead.StartTransaction;
      DB_CMN.trWrite.StartTransaction;
    except
      on e:Exception do
        begin
          Log_ins(e.Message);
          Exit;
        end;
    end;
  end;
  Log_ins(' End create transaction');
  //
  if v_WLTimeCheckPacNet>0 then
  begin
    TimerAuotLoadWl.Interval := v_WLTimeCheckPacNet; // Trunc(v_WLTimeCheckPacNet); // каждые 55 минут 1000*60*
    TimerAuotLoadWl.Enabled := True;
  end;
  //
//-- 4. Стартуем сервер
    Log_ins(' Start server WL ServerPort='+inttostr(nPort));
    DicomServerCore1.ServerPort := nPort;
    try
      DicomServerCore1.Start;
    except
      on e: Exception do begin
        Log_ins('ERROR start DicomServerCore1.Start '+E.Message);
        raise;
      end;
    end;
    try
      v_IsActive:=DicomServerCore1.IsActive;
    except
      v_IsActive:=False;
    end;
    if v_IsActive then
      begin
        Log_ins(' Server WL start success ');
      end else
      begin
        Log_ins(' Server WL not start ');
      end;
  finally
    str.Free;
  end;
  if fMain.v_is_db_log then
    EventLogIns( 'START WorkList',
               0,
               Now,
               'Запуск WorkList сервера');
  while not terminated do
    ServiceThread.ProcessRequests(true);
end;

procedure TDicomWLServer.ServiceShutdown(Sender: TService);
begin
  if fMain.v_is_log then
    CmnUnit1.Lg_ev('ServiceShutdown');
end;

procedure TDicomWLServer.TimerAuotLoadWlTimer(Sender: TObject);
var v_PGconn : TUniConnection;
    v_PGTrans : TUniTransaction;
    v_UniQr, v_UniQr1, v_UniQr2 : TUniQuery;
    vStrLst : TStringList;
    i : Integer;
  function f_check_AN (pprescid:string):Boolean;
  var v_UniQr : TUniQuery; vres:Boolean;
  begin
    v_UniQr := TUniQuery.Create(nil);
    try
      v_UniQr.Connection:=DB_CMN.PGconn;
      v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
      v_UniQr.SQL.Text := 'select 1 from '+v_pg_Schema+'.worklist where prescid=:prescid';
      v_UniQr.ParamByName('prescid').AsString := pprescid;
      try
        v_UniQr.Transaction.StartTransaction;
        v_UniQr.Open;
        vres := not v_UniQr.Eof;
        if v_UniQr.Transaction.Active then
          v_UniQr.Transaction.Commit;
      except
      on e:Exception do
        begin
          v_UniQr.Transaction.Rollback;
          Lg_ev(e.Message);
          vres := False;
        end;
      end;
    finally
      v_UniQr.Free;
    end;
    Result := vres;
  end;
  procedure ANdel (pprescid:string);
  var v_UniQr2 : TUniQuery;
  begin
    v_UniQr2 := TUniQuery.Create(nil);
    try
      v_UniQr2.Connection:=v_PGconn;
      v_UniQr2.Transaction:=v_PGTrans;
      v_UniQr2.SQL.Text := 'delete from '+v_WLSend_pg_Schema+
          '.dicom_wl_buffer where prescid=:prescid';
      v_UniQr2.ParamByName('prescid').AsString := pprescid;
      try
        v_UniQr2.Transaction.StartTransaction;
        v_UniQr2.ExecSQL;
        if v_UniQr2.Transaction.Active then
          v_UniQr2.Transaction.Commit;
      except
      on e:Exception do
        begin
          v_UniQr2.Transaction.Rollback;
          Lg_ev(e.Message);
        end;
      end;
    finally
      v_UniQr2.Free;
    end;
  end;
var vddd : TDateTime;
begin  // check buffer table in pacient NET for worklist records
  if vIsSendWlToMisPacNet then
  begin
    TimerAuotLoadWl.Enabled := False;
    Lg_ev('vIsSendWlToMisPacNet=True');
    vStrLst := TStringList.Create;
    try
      try
        v_PGconn:= TUniConnection.Create(nil);
      //  v_PGconn.Options.
        v_PGconn.LoginPrompt:=False;
        v_PGconn.ProviderName := 'PostgreSQL';
        v_PGconn.Database := v_WLSend_pg_database;
        v_PGconn.Port := v_WLSend_pg_port;
        v_PGconn.Server := v_WLSend_pg_server;
        v_PGconn.SpecificOptions.Values['Schema'] := v_WLSend_pg_Schema;
        v_PGconn.SpecificOptions.Values['UseUnicode'] := 'True';
        v_PGconn.Username := v_WLSend_pg_user;
        v_PGconn.Password := v_WLSend_pg_password;
        v_PGconn.Connected := True;
        //
      //  Lg_ev('Проверка назначений');
        v_PGTrans := PGTransCreate (v_PGconn) ;
        v_PGTrans.DefaultConnection:=v_PGconn;
        try
          if v_PGconn<>nil then
          begin
            if v_PGconn.Connected then
            begin
              Lg_ev('Connected');
              try
                v_UniQr1 := TUniQuery.Create(nil);
                try
                  v_UniQr1.Connection:=v_PGconn;
                  v_UniQr1.Transaction:=v_PGTrans;
                  if v_WLAmmStoreDays>0 then
                  begin
                    Lg_ev('v_WLAmmStoreDays>0');
                    v_UniQr1.SQL.Text := 'select * from '+v_WLSend_pg_Schema+
                        '.dicom_wl_buffer where create_date>=:p_fdate limit 100';
                    v_UniQr1.ParamByName('p_fdate').AsDateTime := IncDay(Date,(-1)*v_WLAmmStoreDays);
                  end else
                  begin
                    Lg_ev('v_WLAmmStoreDays=0');
                    v_UniQr1.SQL.Text := 'select * from '+v_WLSend_pg_Schema+
                        '.dicom_wl_buffer where (patientnameeng is not null) '+
                        ' and (accessionnumber is not null) limit 100';
                  end;
                  try
                    v_UniQr1.Open;
                    Lg_ev('try to Open list to send');
                    while not v_UniQr1.Eof do
                    begin
                      Lg_ev('Get prescid='+v_UniQr1.FieldByName('prescid').AsString);
                      Lg_ev('Get accessionnumber='+v_UniQr1.FieldByName('accessionnumber').AsString);
                      if v_UniQr1.FieldByName('prescid').AsString='-1' then
                      begin
                        v_UniQr := TUniQuery.Create(nil);
                        try
                          v_UniQr.Connection:=DB_CMN.PGconn;
                          v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
                          v_UniQr.SQL.Text := 'delete from '+v_pg_Schema+'.worklist where prescid=:prescid ';
                          v_UniQr.ParamByName('prescid').AsString := v_UniQr1.FieldByName('prescid').AsString;
                          try
                            v_UniQr.Transaction.StartTransaction;
                            v_UniQr.ExecSQL;
                            Lg_ev( 'deleted prescid='+v_UniQr1.FieldByName('prescid').AsString );
                            if v_UniQr.Transaction.Active then
                                v_UniQr.Transaction.Commit;
                          except
                            on e:Exception do
                              begin
                                v_UniQr.Transaction.Rollback;
                                Lg_ev(e.Message);
                              end;
                          end;
                        finally
                          v_UniQr.Free;
                        end;
                      end else begin
                        if not f_check_AN(v_UniQr1.FieldByName('prescid').AsString) then
                        begin
                          Lg_ev('to insert');
                          v_UniQr := TUniQuery.Create(nil);
                          try
                            v_UniQr.Connection:=DB_CMN.PGconn;
                            v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
                            v_UniQr.SQL.Text := 'insert into '+v_pg_Schema+'.worklist ( '+
                             ' p_ename, p_sex, p_pid, p_dateborn, p_fam, p_im, p_otch, p_ename_rus, '+
                             ' p_patientsex, accessionnumber, modality, studyuid, '+
                             ' p_st_dt, status, procedureid, startdateworklist, enddateworklist, '+
                             ' stepstarttime, stepfinishtime, physiciansname, stepdescription, '+
                             ' stepid, stationname, procdescription, procpriority, '+
                             ' stationaetitle, prescid ) values ( '+
                             ' :p_ename ,  '+
                             ' :p_sex ,  '+
                             ' :p_pid ,  '+
                             ' :p_dateborn ,  '+
                             ' :p_fam ,  '+
                             ' :p_im ,  '+
                             ' :p_otch ,  '+
                             ' :p_ename_rus ,  '+
                             ' :p_patientsex ,  '+
                             ' :accessionnumber ,  '+
                             ' :modality ,  '+
                             ' :studyuid ,  '+
                             ' :p_st_dt ,  '+
                             ' :status ,  '+
                             ' :procedureid ,  '+
                             ' :startdateworklist ,  '+
                             ' :enddateworklist ,  '+
                             ' :stepstarttime ,  '+
                             ' :stepfinishtime ,  '+
                             ' :physiciansname ,  '+
                             ' :stepdescription ,  '+
                             ' :stepid ,  '+
                             ' :stationname ,  '+
                             ' :procdescription ,  '+
                             ' :procpriority,  '+
                             ' :stationaetitle, :prescid '+
                             ' ) ';
                            try
                              v_UniQr.ParamByName('p_ename').AsString := v_UniQr1.FieldByName('patientnameeng').AsString;
                              if v_UniQr1.FieldByName('sex').AsInteger=2 then begin
                                v_UniQr.ParamByName('p_sex').AsString := 'M';
                                v_UniQr.ParamByName('p_patientsex').AsString := 'M';
                              end else if v_UniQr1.FieldByName('sex').AsInteger=1 then begin
                                v_UniQr.ParamByName('p_sex').AsString := 'F';
                                v_UniQr.ParamByName('p_patientsex').AsString := 'F';
                              end;
                              if Trim(v_UniQr1.FieldByName('patientid').AsString)='' then
                                v_UniQr.ParamByName('p_pid').AsString := 'UNKNOWN'
                              else
                                v_UniQr.ParamByName('p_pid').AsString := v_UniQr1.FieldByName('patientid').AsString;
                              v_UniQr.ParamByName('p_dateborn').AsDateTime := v_UniQr1.FieldByName('birthday').AsDateTime ;
                              v_UniQr.ParamByName('p_fam').AsString := v_UniQr1.FieldByName('middlename').AsString;
                              v_UniQr.ParamByName('p_im').AsString := v_UniQr1.FieldByName('firstname').AsString;
                              v_UniQr.ParamByName('p_otch').AsString := v_UniQr1.FieldByName('lastname').AsString;
                              v_UniQr.ParamByName('p_ename_rus').AsString := v_UniQr1.FieldByName('patientname').AsString;
                              v_UniQr.ParamByName('accessionnumber').AsString := v_UniQr1.FieldByName('accessionnumber').AsString;
                              v_UniQr.ParamByName('modality').AsString := v_UniQr1.FieldByName('modality').AsString;
                              v_UniQr.ParamByName('studyuid').AsString := v_UniQr1.FieldByName('studyuid').AsString;
                              v_UniQr.ParamByName('p_st_dt').AsDateTime := v_UniQr1.FieldByName('runbeg_dt').AsDateTime ;
                              v_UniQr.ParamByName('status').AsString := '';
                              v_UniQr.ParamByName('procedureid').AsInteger := 0 ;
                              v_UniQr.ParamByName('startdateworklist').AsDateTime := v_UniQr1.FieldByName('runbeg_dt').AsDateTime ;
                              v_UniQr.ParamByName('enddateworklist').AsDateTime := v_UniQr1.FieldByName('runbeg_dt').AsDateTime ;
                              v_UniQr.ParamByName('stepstarttime').AsString := '';
                              v_UniQr.ParamByName('stepfinishtime').AsString := '';
                              v_UniQr.ParamByName('physiciansname').AsString := '';
                              v_UniQr.ParamByName('stepdescription').AsString := v_UniQr1.FieldByName('studydescription').AsString;
                              v_UniQr.ParamByName('stepid').AsString := '';
                              v_UniQr.ParamByName('stationname').AsString := v_UniQr1.FieldByName('stationname').AsString;
                              v_UniQr.ParamByName('procdescription').AsString := v_UniQr1.FieldByName('studydescription').AsString;
                              v_UniQr.ParamByName('procpriority').AsString := '';
                              v_UniQr.ParamByName('prescid').AsString := v_UniQr1.FieldByName('prescid').AsString;
                              if Trim(v_UniQr1.FieldByName('stationaetitle').AsString)='' then
                                v_UniQr.ParamByName('stationaetitle').AsString := 'UNKNOWN'
                              else
                                v_UniQr.ParamByName('stationaetitle').AsString := v_UniQr1.FieldByName('stationaetitle').AsString;
                            except
                              on e:Exception do
                                begin
                                  Lg_ev('#1 !!!ERROR : '+e.Message);
                                end;
                            end;
                            try
                              v_UniQr.Transaction.StartTransaction;
                              Lg_ev('#1945 before insert');
                              v_UniQr.ExecSQL;
                              Lg_ev('#1947 inserted');
                              if v_UniQr.Transaction.Active then
                                  v_UniQr.Transaction.Commit;
                            except
                              on e:Exception do
                                begin
                                  Lg_ev('#1954 !!!ERROR : '+e.Message);
                                  v_UniQr.Transaction.Rollback;
                                end;
                            end;
                          finally
                            v_UniQr.Free;
                          end;
                        end else begin    // UPDATE
                         // vddd := ;
                          Lg_ev('to update');
                          v_UniQr := TUniQuery.Create(nil);
                          try
                            v_UniQr.Connection:=DB_CMN.PGconn;
                            v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
                            v_UniQr.SQL.Text := 'update '+v_pg_Schema+'.worklist set '+
                             ' accessionnumber=:accessionnumber, '+
                             ' startdateworklist=:startdateworklist, '+
                             ' enddateworklist=:enddateworklist, p_st_dt=:p_st_dt '+
                             ' where prescid=:prescid';
                            try
                              v_UniQr.ParamByName('accessionnumber').AsString := v_UniQr1.FieldByName('accessionnumber').AsString;
                              v_UniQr.ParamByName('startdateworklist').AsDateTime := v_UniQr1.FieldByName('runbeg_dt').AsDateTime ;
                              v_UniQr.ParamByName('p_st_dt').AsDateTime := v_UniQr1.FieldByName('runbeg_dt').AsDateTime ;
                              v_UniQr.ParamByName('enddateworklist').AsDateTime := v_UniQr1.FieldByName('runbeg_dt').AsDateTime ;
                              v_UniQr.ParamByName('prescid').AsString := v_UniQr1.FieldByName('prescid').AsString;
                            except
                              on e:Exception do
                                begin
                                  Lg_ev('#1 !!!ERROR : '+e.Message);
                                end;
                            end;
                            try
                              v_UniQr.Transaction.StartTransaction;
                              v_UniQr.ExecSQL;
                              Lg_ev('inserted');
                              if v_UniQr.Transaction.Active then
                                  v_UniQr.Transaction.Commit;
                            except
                              on e:Exception do
                                begin
                                  Lg_ev('#1993 !!!ERROR '+e.Message);
                                  v_UniQr.Transaction.Rollback;
                                end;
                            end;
                          finally
                            v_UniQr.Free;
                          end;


                        end;
                      end;
                      vStrLst.Append(v_UniQr1.FieldByName('prescid').AsString);
                      v_UniQr1.Next;
                    end;
                  except
                  on e:Exception do
                    Lg_ev( 'ERROR '+E.Message+' SQL: '+v_UniQr.SQL.Text);
                  end;
                finally
                  v_UniQr1.Free;
                end;
              except
                on E:Exception do
                  Lg_ev ( '!!! ERROR!!! - '+E.Message );
              end;
              if v_WLAmmStoreDays>0 then
                try
                  v_UniQr := TUniQuery.Create(nil);
                  try
                    v_UniQr.Connection:=v_PGconn;
                    v_UniQr.Transaction:=v_PGTrans;
                    Lg_ev('delete from '+v_WLSend_pg_Schema+
                        '.dicom_wl_buffer where create_date<:p_fdate');
                    Lg_ev(':p_fdate='+DateToStr(IncDay(Date,Trunc((-1)*v_WLAmmStoreDays-1))));
                    v_UniQr.SQL.Text := 'delete from '+v_WLSend_pg_Schema+
                        '.dicom_wl_buffer where create_date<:p_fdate';
                    v_UniQr.ParamByName('p_fdate').AsDateTime := IncDay(Date,Trunc((-1)*v_WLAmmStoreDays-1));
                    try
                      v_UniQr.ExecSQL;
                    except
                    on e:Exception do
                      Lg_ev( 'ERROR '+E.Message+' SQL: '+v_UniQr.SQL.Text);
                    end;
                  finally
                    v_UniQr.Free;
                  end;
                except
                  on E:Exception do
                    Lg_ev ( '!!! ERROR!!! - '+E.Message );
                end;
            end else
              Lg_ev('NOT Connected');
          end;
        finally
          for I := 0 to vStrLst.Count - 1 do
            ANdel(vStrLst[i]);
          DB_CMN.PgFree(v_PGconn,v_PGTrans);
        end;
      except
        on E:Exception do
          Lg_ev ( '!!! ERROR!!! - '+E.Message );
      end;
    finally
      vStrLst.Free;
      TimerAuotLoadWl.Enabled := True;
    end;
  end else
    Lg_ev('vIsSendWlToMisPacNet=False');
end;

end.
