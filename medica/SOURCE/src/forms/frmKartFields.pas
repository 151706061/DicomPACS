unit frmKartFields;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Mask, JvToolEdit, OracleData, Oracle, ExtCtrls,
  DBCtrls, Db, JvBaseEdits, dxCntner, dxEditor, dxExEdtr, dxEdLib, cxControls,
  cxContainer, cxEdit, cxGroupBox;

type
  TFrameKartFields = class(TFrame)
    dsEdizm: TDataSource;
    odsEdizm: TOracleDataSet;
    cxGroupBox2: TcxGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    sePrice_: TdxSpinEdit;
    seKol: TdxSpinEdit;
    sesumm: TJvValidateEdit;
    cePriceView: TJvValidateEdit;
    cxGroupBox1: TcxGroupBox;
    Label1: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lblProducer: TLabel;
    lblCertificate: TLabel;
    lbPartyID: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label3: TLabel;
    edMedic: TJvComboEdit;
    edSerial: TEdit;
    edGoden: TDateTimePicker;
    edProducer: TJvComboEdit;
    edCertificate: TJvComboEdit;
    cbProdCert: TCheckBox;
    edPartyID: TEdit;
    edEdIzm: TEdit;
    edMO_NAME: TEdit;
    lcbEdizm: TDBLookupComboBox;
    procedure edMedicButtonClick(Sender: TObject);
    procedure edProducerCertificateButtonClick(Sender: TObject);
    procedure cbProdCertClick(Sender: TObject);
    procedure edMedicChange(Sender: TObject);
  private
    { Private declarations }
    FnMedicID: integer;
    orQuery : TOracleQuery;
    FIsMedicChanged : Boolean;  // флаг изменения медикамента
    procedure SetnMedicID(const Value: integer);

  public
    { Public declarations }
    nID, PartyNum: Integer;
    m_nProdCertID : Double;
    m_bAdding : Boolean;

    property nMedicID: integer read FnMedicID write SetnMedicID;
    procedure FillForm;

    function DoSave : Integer;    

    procedure InitEventsHandlers; // процедура для привязывания обработчиков - необходимо вызывать с формы, содержащей фрейм
  end;

implementation
uses
  fMedic,
  uProdCertDlg, fdmMain;
{$R *.DFM}
//------------------------------------------------------------------------------
procedure TFrameKartFields.edMedicButtonClick(Sender: TObject);
var
	nTmp: Integer;
begin
	if nMedicID > 0 then begin
		nTmp := DoShowMedic( nMedicID );
	end
	else begin
		nTmp := DoShowMedic(0);
	end;

        FIsMedicChanged := nTmp <> nMedicID;

	if nTmp > 0 then begin
		nMedicID := nTmp;
	end;
//	edName.Text := edMedic.Text;
end;
//------------------------------------------------------------------------------
procedure TFrameKartFields.edMedicChange(Sender: TObject);
begin
// устанавливаем единицы измерения препарата
  odsEdizm.SetVariable('MEDICID', nMedicID);
  odsEdizm.Refresh;
  if odsEdizm.RecordCount > 0 then edEdIzm.Text := odsEdizm.Fields[0].AsString else edEdIzm.Text := '';

// вычисляем будущий номер партии - запрос взят из тригера MED.TKART_INS
  if (nID > 0)and(not FIsMedicChanged) then Exit; // если запись редактируется, то номер партии уже есть, его не надо вычислять
  FIsMedicChanged := False;
  orQuery := TOracleQuery.Create( self );
  orQuery.Session := odsEdizm.Session;
  orQuery.SQL.Text := 'select (NVL(MAX(NVL(TKart.fn_party_num,0)),0) + 1) as New_Party from MED.TKart where TKart.medicid = '+IntTostr(nMedicID);
  orQuery.Execute;
  if not orQuery.Eof then
  begin
    PartyNum       := orQuery.FieldAsInteger(0);
    edPartyID.Text := IntToStr(PartyNum);
  end
  else
  begin
    PartyNum       := 0;
    edPartyID.Text := '';
  end;
  orQuery.Free;
end;
//------------------------------------------------------------------------------
procedure TFrameKartFields.edProducerCertificateButtonClick(Sender: TObject);
var
	dlg : TProdCertDlg;
begin
	dlg := TProdCertDlg.Create(Self);
	if dlg.ShowModal = mrOK then begin
		m_nProdCertID := dlg.m_ID;
		edProducer.Text := dlg.m_strProd;
		edCertificate.Text := dlg.m_strCert;
	end;
	dlg.Free;
end;
//------------------------------------------------------------------------------
procedure TFrameKartFields.cbProdCertClick(Sender: TObject);
begin
	if cbProdCert.Checked then begin
		edProducer.Enabled := True;
		edCertificate.Enabled := True;
	end
	else begin
		edProducer.Enabled := False;
		edCertificate.Enabled := False;
	end;
end;
//------------------------------------------------------------------------------
procedure TFrameKartFields.InitEventsHandlers;
begin
  nID := -1;  // это делать обязательно  - см. PKGMEDKART.DOSET - недочет в условии. незачот
  PartyNum := 0;
  FIsMedicChanged := False;
  edMedic.OnButtonClick        := edMedicButtonClick;
  edMedic.OnChange             := edMedicChange;
  edProducer.OnButtonClick     := edProducerCertificateButtonClick;
  edCertificate.OnButtonClick  := edProducerCertificateButtonClick;
  cbProdCert.OnClick           := cbProdCertClick;
  odsEdizm.Open;  
end;
{********************************************************************************************************}
{        TfrmMedKardEdit.FillForm
{********************************************************************************************************}

procedure TFrameKartFields.FillForm;
var
  lnPostavID, lnMedicID: double;
  sName, sSerial: string;
	dGoden: TDateTime;
	strProd, strCert : String;
begin
        orQuery := TOracleQuery.Create( self );
        orQuery.Session := dmMain.os;
	if nID > 0 then begin
		dmMain.pkgMedKart.GETBYID(sName, lnMedicID, lnPostavID, dGoden, sSerial, strProd, strCert, nID);

                orQuery.SQL.Text := 'select tk.kartid, tk.fn_party_num, (select mogr.fc_group from MED.TMO_GROUP mogr where tk.fk_mogroupid = mogr.groupid) fc_group from MED.tkart tk where tk.kartid = '+IntTostr(nID);
                orQuery.Execute;
                if not orQuery.Eof then
                begin
                  PartyNum       := orQuery.FieldAsInteger('fn_party_num');
                  edPartyID.Text := IntToStr(PartyNum);
                  edMO_NAME.Text := orQuery.FieldAsString('fc_group');
                end;

		edSerial.Text := sSerial;
		edGoden.DateTime := dGoden;
		edProducer.Text := strProd;
		edCertificate.Text := strCert;
		if (strProd <> '') or (strCert <> '') then begin
			cbProdCert.Checked := True;
			edProducer.Enabled := True;
			edCertificate.Enabled := True;
		end;
		nMedicID := Round(lnMedicID);
	end
	else
        begin
//                PartyNum := 0;
//                edPartyID.Text   := '';
                edGoden.Checked := False;
		edGoden.DateTime := Now;

                orQuery.SQL.Text := 'SELECT mogr.fc_group FROM MED.TMO_GROUP mogr, MED.TMO WHERE TMO.MOID = MED.PKG_MEDSES.GET_CURMO AND  mogr.groupid = tmo.FK_CURMOGROUPID';
                orQuery.Execute; // название группы мат. отв.
                if not orQuery.Eof then  edMO_NAME.Text := orQuery.FieldAsString('fc_group');
        end;
        orQuery.Free;

end;

{********************************************************************************************************}
{        TfrmMedKardEdit.SetnMedicID
{********************************************************************************************************}

procedure TFrameKartFields.SetnMedicID(const Value: integer);
var
  q: TOracleDataSet;
begin
  FnMedicID := Value;
  q := TOracleDataSet.Create(self);
  q.Session := dmMain.os;
  q.SQL.Text := 'select fc_name from MED.tmedic where medicid = :fk_id';
  q.DeclareVariable('FK_ID', otInteger);
  q.SetVariable('FK_ID', Value);
  q.close;
  q.Open;
  edMedic.Text := q.fieldbyname('FC_NAME').AsString;
  q.free;
  edMedic.Tag := Value;

  odsEdizm.Close;
  odsEdizm.SetVariable('MEDICID', FnMedicID);
  odsEdizm.Open;
end;
//------------------------------------------------------------------------------
function TFrameKartFields.DoSave : Integer;
begin
{  orQuery := TOracleQuery.Create( self );
  with orQuery do
  begin
    Session := dmMain.os;
    DeclareVariable('function_result', otFloat);
    DeclareVariable('PFC_NAME', otString);
    SetVariable('PFC_NAME', '');
    DeclareVariable('PMEDICID', otFloat);
    SetVariable('PMEDICID', nMedicID);
    DeclareVariable('PMOID', otFloat);
    SetVariable('PMOID', dmMain.pkgMedSes.GETCURMO);
    DeclareVariable('PFD_GODEN', otDate);
    SetVariable('PFD_GODEN', edGoden.Date);
    DeclareVariable('PFC_SERIAL', otString);
    SetVariable('PFC_SERIAL', edSerial.Text);
    DeclareVariable('PKARTID', otFloat);
    SetVariable('PKARTID', nID);
    DeclareVariable('PRODCERTID', otFloat);
    SetVariable('PRODCERTID', m_nProdCertID);
    DeclareVariable('PPARTYNUM', otFloat);
    SetVariable('PPARTYNUM', PartyNum);

    SQL.Add('begin');
    SQL.Add('  :function_result := "PKGMEDKART"."DOSET"(');
    SQL.Add('    PFC_NAME => :PFC_NAME,');
    SQL.Add('    PMEDICID => :PMEDICID,');
    SQL.Add('    PMOID => :PMOID,');
    SQL.Add('    PFD_GODEN => :PFD_GODEN,');
    SQL.Add('    PFC_SERIAL => :PFC_SERIAL,');
    SQL.Add('    PKARTID => :PKARTID,');
    SQL.Add('    PRODCERTID => :PRODCERTID,');
    SQL.Add('    PPARTYNUM => :PPARTYNUM);');
    SQL.Add('end;');
    Execute;
    Result := ConvertVariant(OCPQuery.GetVariable('function_result'));
  end;
}

//  Result := nID;
end;
//------------------------------------------------------------------------------
end.
