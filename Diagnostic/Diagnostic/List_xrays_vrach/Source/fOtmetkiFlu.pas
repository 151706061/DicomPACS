// !!! избавиться от переменных IDSMIDZAKL1 и IDSMIDZAKL2
unit fOtmetkiFlu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, cxControls, cxContainer, cxEdit, cxLabel,
  ExtCtrls, cxMemo, cxRichEdit, cxTextEdit, cxGraphics, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxSpinEdit, cxGroupBox, cxCheckGroup, cxCalendar, ActnList, DB,
  OracleData, cxCurrencyEdit, Oracle, Menus, cxLookAndFeelPainters,
  StdCtrls, cxButtons, frxClass, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinsdxBarPainter, cxClasses, ClipBrd, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue;

type
  TfrmOtmetkiFlu = class(TForm)
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    bbSave: TdxBarButton;
    bbCancel: TdxBarButton;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    Panel2: TPanel;
    cxLabel3: TcxLabel;
    cxResume1: TcxRichEdit;
    cxLabel6: TcxLabel;
    cxSotr1: TcxLookupComboBox;
    al: TActionList;
    aSave: TAction;
    aCancel: TAction;
    odsSotr1: TOracleDataSet;
    dsSotr1: TDataSource;
    bbResume1: TcxButton;
    actResume1: TAction;
    cxLabel7: TcxLabel;
    cxDate1: TcxDateEdit;
    cxLabel2: TcxLabel;
    Panel3: TPanel;
    cxLabel4: TcxLabel;
    cxResume2: TcxRichEdit;
    cxLabel5: TcxLabel;
    cxSotr2: TcxLookupComboBox;
    bbResume2: TcxButton;
    cxDate2: TcxDateEdit;
    cxLabel8: TcxLabel;
    actResume2: TAction;
    pmZakl2: TPopupMenu;
    dsSotr2: TDataSource;
    odsSotr2: TOracleDataSet;
    bbPrint: TdxBarButton;
    actPrint: TAction;
    frxRepOtmetkiFlu: TfrxReport;
    cxLbDays: TcxLabel;
    pmDate: TPopupMenu;
    pmNum: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    cxNumIssl: TcxLabel;
    cxDateRun: TcxLabel;
    lbTub: TcxLabel;
    bDelZakl1: TcxButton;
    aDelResume1: TAction;
    aDelResume2: TAction;
    bDelZakl2: TcxButton;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure actResume1Execute(Sender: TObject);
    procedure actResume2Execute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure frxRepOtmetkiFluGetValue(const VarName: String;
      var Value: Variant);
    procedure odsSotr1BeforeOpen(DataSet: TDataSet);
    procedure odsSotr2BeforeOpen(DataSet: TDataSet);
    procedure cxDateRunMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure cxNumIsslMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure cxNumIsslMouseLeave(Sender: TObject);
    procedure cxDateRunMouseLeave(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure aDelResume1Execute(Sender: TObject);
    procedure aDelResume2Execute(Sender: TObject);
  private
    Russian : HKL;
    pNAZID : Integer;
    pPACID : Integer;
    IDSMID1, IDSMID2, IDSMIDZAKL1, IDSMIDZAKL2 : Integer;
    procedure DoSetEditRights;
    procedure DoTub;
    procedure DoInsertEditParametersNaz;
    procedure DoTypeParametersNaz;
    { Private declarations }
  public
    procedure DoShowfrmOtmetki(nNAZID, nPACID : Integer);
    { Public declarations }
  end;

var
  frmOtmetkiFlu: TfrmOtmetkiFlu;

implementation
uses fMain, fSetResume;
{$R *.dfm}

procedure TfrmOtmetkiFlu.aSaveExecute(Sender: TObject);
begin
  try
    Screen.Cursor := crSQLWait;
    DoInsertEditParametersNaz;
    ModalResult := MrOK;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmOtmetkiFlu.cxDateRunMouseLeave(Sender: TObject);
begin
  cxDateRun.Style.BorderStyle := ebsNone;
  cxDateRun.Style.BorderColor := clBtnFace;
end;

procedure TfrmOtmetkiFlu.cxDateRunMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  cxDateRun.Style.BorderStyle := ebsUltraFlat;
  cxDateRun.Style.BorderColor := clGray;
end;

procedure TfrmOtmetkiFlu.cxNumIsslMouseLeave(Sender: TObject);
begin
  cxNumIssl.Style.BorderStyle := ebsNone;
  cxNumIssl.Style.BorderColor := clBtnFace;
end;

procedure TfrmOtmetkiFlu.cxNumIsslMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  cxNumIssl.Style.BorderStyle := ebsUltraFlat;
  cxNumIssl.Style.BorderColor := clGray;
end;

procedure TfrmOtmetkiFlu.aCancelExecute(Sender: TObject);
begin
  ModalResult := MrCancel;
end;

procedure TfrmOtmetkiFlu.DoSetEditRights;
var ods : TOracleDataSet;
    kolvoParam : Integer;
    kolvoDays : Integer;
begin
  if frmMain.bIsAdmin <> 1 then
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''KOLVODAYS_EDIT'' ';
        ods.Open;
        kolvoParam := StrToInt(ods.FieldByName('FC_VALUE').AsString);
        ods.DeleteVariables;
        ods.Close;
        ods.SQL.Text := ' SELECT ROUND(sysdate - (SELECT MAX(FD_DATE) FROM ASU.TPODPISNAZ WHERE FK_SOS = ASU.GET_VIPNAZ AND FK_NAZID = :PFK_NAZID)) AS CNT '+#13+
                        '   FROM ASU.TNAZIS WHERE FK_ID = :PFK_NAZID ';
        ods.DeclareAndSet('PFK_NAZID', otInteger, pNAZID);
        ods.Open;
        kolvoDays := ods.FieldByName('CNT').AsInteger;
        if KolvoDays >= kolvoParam then
          begin
            cxLbDays.Visible := True;
            cxLbDays.Caption := ' Прошло более '+IntToStr(KolvoParam)+' суток! Изменить отметки нельзя! ';
            cxResume1.Enabled := False;
            actResume1.Enabled := False;
            aDelResume1.Enabled := False;
            aDelResume2.Enabled := False;
            cxSotr1.Enabled := False;
            cxDate1.Enabled := False;
            cxResume2.Enabled := False;
            actResume2.Enabled := False;
            cxSotr2.Enabled := False;
            cxDate2.Enabled := False;
            aSave.Enabled := False;
           end else
          begin
            cxLbDays.Visible := False;
            cxLbDays.Caption := '';
            cxResume1.Enabled := True;
            actResume1.Enabled := True;
            aDelResume1.Enabled := True;
            aDelResume2.Enabled := True;
            cxSotr1.Enabled := True;
            cxDate1.Enabled := True;
            cxResume2.Enabled := True;
            actResume2.Enabled := True;
            cxSotr2.Enabled := True;
            cxDate2.Enabled := True;
            aSave.Enabled := True;
          end;
      finally
        ods.Free;
      end;
    end;
end;

procedure TfrmOtmetkiFlu.DoShowfrmOtmetki(nNAZID, nPACID: Integer);
begin
  pNAZID := nNAZID;
  pPACID := nPACID;
  DoTypeParametersNaz;
  DoSetEditRights;
  DoTub;
end;

procedure TfrmOtmetkiFlu.DoInsertEditParametersNaz;
var oqNaz : TOracleQuery;
begin
    oqNaz := TOracleQuery.Create(nil);
      try
        oqNaz.Session := frmMain.os;
//--- дата 1
        if cxDate1.Text <> '' then
          begin
            oqNaz.DeleteVariables;
            oqNaz.SQL.Text := ' DECLARE '+
                              '   nSMID10 NUMBER; '+
                              '   Cnt10 NUMBER; '+
                              ' BEGIN '+
			                        '   SELECT COUNT(FK_ID) INTO Cnt10 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_DATE1''); '+
                              ' IF Cnt10 > 0 THEN '+
                              '   UPDATE TIB SET FD_DATE = :pFD_DATE10, FK_VRACHID = :pFK_VRACHID WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_DATE1''); '+
                              ' ELSE '+
                              '   SELECT FK_ID INTO nSMID10 FROM TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_DATE1''; '+
                              '   INSERT INTO TIB(FK_PACID, FD_DATE, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_ID, :PFD_DATE10, nSMID10, nSMID10, :pFK_VRACHID); '+
                              ' END IF; '+
                              ' END; ';
            oqNaz.DeclareAndSet('PFK_ID', otInteger, pNAZID);
            oqNaz.DeclareAndSet('pFD_DATE10', otDate, cxDate1.Date);
            oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
            oqNaz.Execute;
            frmMain.os.Commit;
          end;
//--- дата 2
        if cxDate2.Text <> '' then 
          begin
            oqNaz.DeleteVariables;
            oqNaz.SQL.Text := ' DECLARE '+
                              '   nSMID10 NUMBER; '+
                              '   Cnt10 NUMBER; '+
                              ' BEGIN '+
                              '   SELECT COUNT(FK_ID) INTO Cnt10 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_DATE2''); '+
                              ' IF Cnt10 > 0 THEN '+
                              '   UPDATE TIB SET FD_DATE = :pFD_DATE10, FK_VRACHID = :pFK_VRACHID WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_DATE2''); '+
                              ' ELSE '+
                              '   SELECT FK_ID INTO nSMID10 FROM TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_DATE2''; '+
                              '   INSERT INTO TIB(FK_PACID, FD_DATE, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_ID, :PFD_DATE10, nSMID10, nSMID10, :pFK_VRACHID); '+
                              ' END IF; '+
                              ' END; ';
            oqNaz.DeclareAndSet('PFK_ID', otInteger, pNAZID);
            oqNaz.DeclareAndSet('pFD_DATE10', otDate, cxDate2.Date);
            oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
            oqNaz.Execute;
            frmMain.os.Commit;
          end;
//--- заключение 1
        if cxResume1.Text <> '' then
          begin
	          if IDSMIDZAKL1 = 0 then
	            begin
		            oqNaz.DeleteVariables;
		            oqNaz.SQL.Text := ' DECLARE '+
		     	                        '   nSMID11 NUMBER; '+
				                          '   Cnt11 NUMBER; '+
				                          ' BEGIN '+
				                          '   SELECT COUNT(FK_ID) INTO Cnt11 '+
                                  '     FROM ASU.TIB '+
                                  '    WHERE FK_PACID = :pFK_ID '+
                                  '      AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_RESUME1''); '+
				                          '   IF Cnt11 > 0 THEN '+
				                          '     UPDATE ASU.TIB SET FN_NUM = :pFN_NUM11, '+
                                  '                        FC_CHAR = :pFC_CHAR11, '+
                                  '                        FK_VRACHID = :pFK_VRACHID '+
                                  '                  WHERE FK_PACID = :pFK_ID '+
                                  '                    AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_RESUME1''); '+
				                          '   ELSE '+
				                          '     SELECT FK_ID INTO nSMID11 FROM TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_RESUME1''; '+
				                          '     INSERT INTO TIB(FK_PACID, FN_NUM, FC_CHAR, FK_SMID, FK_SMEDITID, FK_VRACHID) '+
                                  '     VALUES(:pFK_ID, :pFN_NUM11, :PFC_CHAR11, nSMID11, nSMID11, :pFK_VRACHID); '+
                        				  '   END IF; '+
				                          ' END; ';
                oqNaz.DeclareAndSet('PFK_ID', otInteger, pNAZID);
		            oqNaz.DeclareAndSet('PFN_NUM11', otInteger, IDSMID1);
		            oqNaz.DeclareAndSet('pFC_CHAR11', otString, cxResume1.Text);
		            oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, cxSotr1.EditValue);
		            oqNaz.Execute;
		            frmMain.os.Commit;
	            end else
	            begin
		            oqNaz.DeleteVariables;
		            oqNaz.SQL.Text := ' DECLARE '+#13+
				                          '   nSMID11 NUMBER; '+#13+
				                          '   Cnt11 NUMBER; '+#13+
				                          ' BEGIN '+#13+
				                          '   SELECT COUNT(FK_ID) INTO Cnt11 '+#13+
                                  '     FROM asu.TIB '+#13+
                                  '    WHERE FK_PACID = :pFK_ID '+#13+
                                  '      AND FK_SMID IN (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_RESUME1''); '+#13+
                        				  '   IF Cnt11 > 0 THEN '+#13+
				                          '     UPDATE TIB SET FN_NUM = :pFN_NUM11, '+#13+
                                  '                    FK_BID = :PFK_BID11, '+#13+
                                  '                    FC_CHAR = :pFC_CHAR11, '+#13+
                                  '                    FK_VRACHID = :pFK_VRACHID '+#13+
                                  '                WHERE FK_PACID = :pFK_ID '+#13+
                                  '                  AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_RESUME1''); '+#13+
                         				  '   ELSE '+#13+
				                          '     SELECT FK_ID INTO nSMID11 FROM TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_RESUME1''; '+#13+
                        				  '     INSERT INTO asu.TIB(FK_PACID, FN_NUM, FK_BID, FC_CHAR, FK_SMID, FK_SMEDITID, FK_VRACHID) '+#13+
                                  '     VALUES(:pFK_ID, :pFN_NUM11, :PFK_BID11, :PFC_CHAR11, nSMID11, nSMID11, :pFK_VRACHID); '+#13+
                        				  '   END IF; '+#13+
				                          ' END; ';
								oqNaz.DeclareAndSet('PFK_ID', otInteger, pNAZID);
								oqNaz.DeclareAndSet('PFN_NUM11', otInteger, IDSMID1);
								oqNaz.DeclareAndSet('PFK_BID11', otInteger, IDSMIDZAKL1);
								oqNaz.DeclareAndSet('pFC_CHAR11', otString, cxResume1.Text);
								oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, cxSotr1.EditValue);
								oqNaz.Execute;
                frmMain.os.Commit;
							end;
					end;
//--- заключение 2
				if cxResume2.Text <> '' then
					begin
						if IDSMIDZAKL2 = 0 then
							begin
								oqNaz.DeleteVariables;
								oqNaz.SQL.Text := ' DECLARE '+#13+
																	'   nSMID11 NUMBER; '+#13+
																	'   Cnt11 NUMBER; '+#13+
																	' BEGIN '+#13+
																	'   SELECT COUNT(FK_ID) INTO Cnt11 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_RESUME2''); '+#13+
																	' IF Cnt11 > 0 THEN '+#13+
																	'   UPDATE TIB SET FN_NUM = :pFN_NUM11, FC_CHAR = :pFC_CHAR11, FK_VRACHID = :pFK_VRACHID WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_RESUME2''); '+#13+
																	' ELSE '+#13+
																	'   SELECT FK_ID INTO nSMID11 FROM TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_RESUME2''; '+#13+
																	'   INSERT INTO TIB(FK_PACID, FN_NUM, FC_CHAR, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_ID, :pFN_NUM11, :PFC_CHAR11, nSMID11, nSMID11, :pFK_VRACHID); '+#13+
																	' END IF; '+#13+
																	' END; ';
								oqNaz.DeclareAndSet('PFK_ID', otInteger, pNAZID);
								oqNaz.DeclareAndSet('PFN_NUM11', otInteger, IDSMID2);
								oqNaz.DeclareAndSet('pFC_CHAR11', otString, cxResume2.Text);
								oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, cxSotr2.EditValue);
								oqNaz.Execute;
								frmMain.os.Commit;
							end else
							begin
								oqNaz.DeleteVariables;
								oqNaz.SQL.Text := ' DECLARE '+#13+
																	'   nSMID11 NUMBER; '+#13+
																	'   Cnt11 NUMBER; '+#13+
																	' BEGIN '+#13+
																	'   SELECT COUNT(FK_ID) INTO Cnt11 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_RESUME2''); '+#13+
																	' IF Cnt11 > 0 THEN '+#13+
																	'   UPDATE asu.TIB SET FN_NUM = :pFN_NUM11, FK_BID = :PFK_BID11, FC_CHAR = :pFC_CHAR11, FK_VRACHID = :pFK_VRACHID WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_RESUME2''); '+#13+
																	' ELSE '+#13+
																	'   SELECT FK_ID INTO nSMID11 FROM asu.TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_RESUME2''; '+#13+
																	'   INSERT INTO TIB(FK_PACID, FN_NUM, FK_BID, FC_CHAR, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_ID, :pFN_NUM11, :PFK_BID11, :PFC_CHAR11, nSMID11, nSMID11, :pFK_VRACHID); '+#13+
																	' END IF; '+#13+
																	' END; ';
								oqNaz.DeclareAndSet('PFK_ID', otInteger, pNAZID);
								oqNaz.DeclareAndSet('PFN_NUM11', otInteger, IDSMID2);
								oqNaz.DeclareAndSet('PFK_BID11', otInteger, IDSMIDZAKL2);
								oqNaz.DeclareAndSet('pFC_CHAR11', otString, cxResume2.Text);
								oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, cxSotr2.EditValue);
								oqNaz.Execute;
								frmMain.os.Commit;
							end;
					end;
//-- дообследование
        oqNaz.DeleteVariables;
        oqNaz.SQL.Text := ' declare '+#13+
                          '   cntZakl number; '+#13+
                          '   sDate varchar2(20); '+#13+
                          ' begin '+#13+
                          '   select count(*) into cntZakl from asu.tshablon_xray_zakl '+#13+
                          '   where fk_id = (select fk_bid from asu.tib where fk_pacid = :pfk_nazid and fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''OTMETKI_FLU_RESUME1'')) '+#13+
                          '      or fk_id = (select fk_bid from asu.tib where fk_pacid = :pfk_nazid and fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''OTMETKI_FLU_RESUME2'')) '+#13+
                          '   start with fk_id = (select fc_value from asu.tsmini where fc_key = ''DOOBSLEDOVAN'') '+#13+
                          '   connect by prior fk_id = fk_owner; '+#13+
                          '   if cntZakl > 0 then '+#13+
                          '     merge into asu.tnazid_doobsl using dual on (fk_nazid = :pfk_nazid ) '+#13+
                          '       when not matched then insert(fk_nazid) values(:pfk_nazid); '+#13+
                          '     select asu.get_last_fluoro_date(asu.get_peplid(:pfk_pacid), 1) into sDate from dual; '+#13+
                          '     if sDate is null then '+#13+
                          '       delete from asu.tlastfluoro where fk_peplid = asu.get_peplid(:pfk_pacid); '+#13+
                          '     else '+#13+
                          '       update asu.tlastfluoro '+#13+
                          '          set fd_date = to_date(sDate, ''dd.mm.yyyy''), '+#13+
                          '              fc_num = asu.get_last_fluoro_num(asu.get_peplid(:pfk_pacid)) '+#13+
                          '        where fk_peplid = asu.get_peplid(:pfk_pacid); '+#13+
                          '     end if; '+#13+
                          '   else '+#13+
                          '     delete from asu.tnazid_doobsl where fk_nazid = :pfk_nazid; '+#13+ // на всякий пожарный удаляем
                          '   end if; '+#13+
                          ' end; ';
        oqNaz.DeclareAndSet('pfk_nazid', otInteger, pNAZID);
        oqNaz.DeclareAndSet('pfk_pacid', otInteger, pPACID);
        oqNaz.Execute;
        frmMain.os.Commit;
//--- врач 1
      if cxSotr1.Text <> '' then
	      begin
          oqNaz.DeleteVariables;
          oqNaz.SQL.Text := ' DECLARE '+
                            '   nSMID15 NUMBER; '+
                            '   Cnt15 NUMBER; '+
                            ' BEGIN '+
                            '   SELECT COUNT(FK_ID) INTO Cnt15 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_VRACH1''); '+
                            ' IF Cnt15 > 0 THEN '+
                            '   UPDATE TIB SET FN_NUM = :pFN_NUM15, FK_VRACHID = :pFK_VRACHID WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_VRACH1''); '+
                            ' ELSE '+
                            '   SELECT FK_ID INTO nSMID15 FROM TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_VRACH1''; '+
                            '   INSERT INTO TIB(FK_PACID, FN_NUM, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_ID, :pFN_NUM15, nSMID15, nSMID15, :pFK_VRACHID); '+
                            ' END IF; '+
                            ' END; ';
          oqNaz.DeclareAndSet('pFN_NUM15', otInteger, cxSotr1.EditValue);
          oqNaz.DeclareAndSet('PFK_ID', otInteger, pNAZID);
          oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
          oqNaz.Execute;
          frmMain.os.Commit;
        end;
//--- врач 2
      if cxSotr2.Text <> '' then
        begin
          oqNaz.DeleteVariables;
          oqNaz.SQL.Text := ' DECLARE '+
                            '   nSMID15 NUMBER; '+
                            '   Cnt15 NUMBER; '+
                            ' BEGIN '+
                            '   SELECT COUNT(FK_ID) INTO Cnt15 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_VRACH2''); '+
                            ' IF Cnt15 > 0 THEN '+
                            '   UPDATE TIB SET FN_NUM = :pFN_NUM15, FK_VRACHID = :pFK_VRACHID WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_VRACH2''); '+
                            ' ELSE '+
                            '   SELECT FK_ID INTO nSMID15 FROM TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_VRACH2''; '+
                            '   INSERT INTO TIB(FK_PACID, FN_NUM, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_ID, :pFN_NUM15, nSMID15, nSMID15, :pFK_VRACHID); '+
                            ' END IF; '+
                            ' END; ';
          oqNaz.DeclareAndSet('pFN_NUM15', otInteger, cxSotr2.EditValue);
          oqNaz.DeclareAndSet('PFK_ID', otInteger, pNAZID);
          oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
          oqNaz.Execute;
          frmMain.os.Commit;
        end;
      finally
        oqNaz.Free;
      end;
end;

procedure TfrmOtmetkiFlu.DoTub;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' SELECT NAZ.FK_ID, TUB.FN_COUNTYEAR, TUB.FD_END, ASU.GET_SMIDNAME(TUB.FK_PERIODID_REC) AS REC '+#13+
                    '   FROM ASU.TNAZIS NAZ, ASU.TTUBPARAM TUB '+#13+
                    '  WHERE NAZ.FK_SMID = ASU.GET_XRAY_TUBDISPANCER '+#13+
                    '    AND NAZ.FK_PACID = ASU.GET_PEPLID(:PFK_PACID) '+#13+
                    '    AND NAZ.FK_ID = TUB.FK_NAZID '+#13+
                    '    AND SYSDATE >= TUB.FD_BEGIN '+#13+
                    '    AND SYSDATE < TO_DATE(TUB.FD_END)+1 '+#13+
                    ' ORDER BY NAZ.FK_ID ASC ';
    ods.DeclareAndSet('PFK_PACID', otInteger, pPACID);
    ods.Open;
    ods.Last;
    if ods.RecordCount > 0 then
      begin
        lbTub.Visible := True;
        lbTub.Caption := 'На учете в тубдиспансере. '+'Периодичность: '+ods.FieldByName('REC').AsString+
                         ' до '+DateTimeToStr(ods.FieldByName('FD_END').AsDateTime);
      end else
      begin
        lbTub.Visible := False;
      end;
  finally
    ods.Free;
  end;
end;

procedure TfrmOtmetkiFlu.DoTypeParametersNaz;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FK_NAZTYPEID, TRUNC(FD_RUN) AS FD_RUN, TRUNC(SYSDATE) AS SYS_DATE, '+#13+
                    '       (SELECT MAX(FC_CHAR) FROM ASU.TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_FLU_NUMBER'')) AS NUMISSL, '+#13+
                    '       (SELECT MAX(FC_CHAR) FROM ASU.TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_RESUME1'')) AS RESUME1, '+#13+
                    '       (SELECT MAX(FC_CHAR) FROM ASU.TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_RESUME2'')) AS RESUME2, '+#13+
                    '       (SELECT MAX(FN_NUM) FROM ASU.TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_VRACH1'')) AS SOTR1, '+#13+
                    '       (SELECT MAX(FN_NUM) FROM ASU.TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_VRACH2'')) AS SOTR2, '+#13+
                    '       (SELECT DECODE(MAX(FD_DATE), NULL, TRUNC(SYSDATE), MAX(FD_DATE)) FROM ASU.TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_DATE1'')) AS DATE1, '+#13+
                    '       (SELECT DECODE(MAX(FD_DATE), NULL, TRUNC(SYSDATE), MAX(FD_DATE)) FROM ASU.TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_DATE2'')) AS DATE2 '+#13+
                    '   FROM ASU.TNAZIS WHERE FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pNAZID);
    ods.Open;
    cxDateRun.Caption := DateTimeToStr(ods.FieldByName('FD_RUN').AsDateTime);
    cxNumIssl.Caption := ods.FieldByName('NUMISSL').AsString;
    cxResume1.Text := ods.FieldByName('RESUME1').AsString;
    cxResume2.Text := ods.FieldByName('RESUME2').AsString;
    cxSotr1.EditValue := ods.FieldByName('SOTR1').AsInteger;
    cxSotr2.EditValue := ods.FieldByName('SOTR2').AsInteger;
    cxDate1.Date := ods.FieldByName('DATE1').AsDateTime;
    cxDate2.Date := ods.FieldByName('DATE2').AsDateTime;
  finally
    ods.Free;
  end;
end;

procedure TfrmOtmetkiFlu.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  IDSMID1 := 0;
  IDSMID2 := 0;
end;

procedure TfrmOtmetkiFlu.FormCreate(Sender: TObject);
begin
  russian:=LoadKeyboardLayout('00000419', 0);
  if odsSotr1.Active = False then
    odsSotr1.Active := True;
  if odsSotr2.Active = False then
    odsSotr2.Active := True;
end;

procedure TfrmOtmetkiFlu.actResume1Execute(Sender: TObject);
begin
  Application.CreateForm(TfrmSetResume, frmSetResume);
  try
    frmSetResume.DoShowForm;
    frmSetResume.ShowModal;
    if frmSetResume.ModalResult = MrOK then
      begin
			  cxResume1.Text := cxResume1.Text +' '+ frmSetResume.odsTree.FieldByName('FC_NAME').AsString;
			  IDSMIDZAKL1 := frmSetResume.odsTree.FieldByName('FK_ID').AsInteger;
      end;
  finally
    frmSetResume.Free;
  end;
end;

procedure TfrmOtmetkiFlu.actResume2Execute(Sender: TObject);
begin
  Application.CreateForm(TfrmSetResume, frmSetResume);
  try
    frmSetResume.DoShowForm;
    frmSetResume.ShowModal;
    if frmSetResume.ModalResult = MrOK then
      begin
			  cxResume2.Text := cxResume2.Text +' '+ frmSetResume.odsTree.FieldByName('FC_NAME').AsString;
			  IDSMIDZAKL2 := frmSetResume.odsTree.FieldByName('FK_ID').AsInteger;
      end;
  finally
    frmSetResume.Free;
  end;
end;

procedure TfrmOtmetkiFlu.aDelResume1Execute(Sender: TObject);
var oq : TOracleQuery;
begin
  if Application.MessageBox('Вы действительно хотите удалить заключение 1?', 'Вопрос', MB_YESNO+MB_ICONQUESTION) = mrYes then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid and fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''OTMETKI_FLU_RESUME1'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNAZID);
        oq.Execute;
        oq.DeleteVariables;
        oq.SQL.Text := ' declare '+#13+
                       '   cntZakl number; '+#13+
                       ' begin '+#13+
                       '   select count(*) into cntZakl from asu.tshablon_xray_zakl '+#13+
                       '    where fk_id = (select fk_bid from asu.tib where fk_pacid = :pfk_nazid '+#13+
                       '                   and fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''OTMETKI_FLU_RESUME2'')) '+#13+
                       '   start with fk_id = (select fc_value from asu.tsmini where fc_key = ''DOOBSLEDOVAN'') '+#13+
                       '   connect by prior fk_id = fk_owner; '+#13+
                       '   if cntZakl = 0 then '+#13+
                       '     delete from asu.tnazid_doobsl where fk_nazid = :pfk_nazid; '+#13+
                       '     merge into asu.tlastfluoro using dual on (fk_peplid = asu.get_peplid(:pfk_pacid)) '+#13+
                       '       when not matched then '+#13+
                       '         insert(fk_peplid, fd_date, fc_num) '+#13+
                       '         values(asu.get_peplid(:pfk_pacid), to_date(asu.get_last_fluoro_date(asu.get_peplid(:pfk_pacid), 1), ''dd.mm.yyyy''), asu.get_last_fluoro_num(asu.get_peplid(:pfk_pacid))) '+#13+
                       '       when matched then '+#13+
                       '         update set fd_date = to_date(asu.get_last_fluoro_date(asu.get_peplid(:pfk_pacid), 1), ''dd.mm.yyyy''), '+#13+
                       '                    fc_num = asu.get_last_fluoro_num(asu.get_peplid(:pfk_pacid)) '+#13+
                       '          where fk_peplid = asu.get_peplid(:pfk_pacid); '+#13+
                       '   end if; '+#13+
                       ' end; ';
        oq.DeclareAndSet('pfk_nazid', otInteger, pNAZID);
        oq.DeclareAndSet('pfk_pacid', otInteger, pPACID);
        oq.Execute;
        frmMain.os.Commit;
        cxResume1.Clear;
        IDSMIDZAKL1 := 0;
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmOtmetkiFlu.aDelResume2Execute(Sender: TObject);
var oq : TOracleQuery;
begin
  if Application.MessageBox('Вы действительно хотите удалить заключение 2?', 'Вопрос', MB_YESNO+MB_ICONQUESTION) = mrYes then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' delete from asu.tib '+#13+
                       '  where fk_pacid = :pfk_pacid and fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''OTMETKI_FLU_RESUME2'') ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pNAZID);
        oq.Execute;
        oq.DeleteVariables;
        oq.SQL.Text := ' declare '+#13+
                       '   cntZakl number; '+#13+
                       ' begin '+#13+
                       '   select count(*) into cntZakl from asu.tshablon_xray_zakl '+#13+
                       '   where fk_id = (select fk_bid from asu.tib where fk_pacid = :pfk_nazid '+#13+
                       '                  and fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''OTMETKI_FLU_RESUME1'')) '+#13+
                       '   start with fk_id = (select fc_value from asu.tsmini where fc_key = ''DOOBSLEDOVAN'') '+#13+
                       '   connect by prior fk_id = fk_owner; '+#13+
                       '   if cntZakl = 0 then '+#13+
                       '     delete from asu.tnazid_doobsl where fk_nazid = :pfk_nazid; '+#13+
                       '     merge into asu.tlastfluoro using dual on (fk_peplid = asu.get_peplid(:pfk_pacid)) '+#13+
                       '       when not matched then '+#13+
                       '         insert(fk_peplid, fd_date, fc_num) '+#13+
                       '         values(asu.get_peplid(:pfk_pacid), to_date(asu.get_last_fluoro_date(asu.get_peplid(:pfk_pacid), 1), ''dd.mm.yyyy''), asu.get_last_fluoro_num(asu.get_peplid(:pfk_pacid))) '+#13+
                       '       when matched then '+#13+
                       '         update set fd_date = to_date(asu.get_last_fluoro_date(asu.get_peplid(:pfk_pacid), 1), ''dd.mm.yyyy''), '+#13+
                       '                    fc_num = asu.get_last_fluoro_num(asu.get_peplid(:pfk_pacid)) '+#13+
                       '          where fk_peplid = asu.get_peplid(:pfk_pacid); '+#13+
                       '   end if; '+#13+
                       ' end; ';
        oq.DeclareAndSet('pfk_nazid', otInteger, pNAZID);
        oq.DeclareAndSet('pfk_pacid', otInteger, pPACID);
        oq.Execute;
        frmMain.os.Commit;
        cxResume2.Clear;
        IDSMIDZAKL2 := 0;
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmOtmetkiFlu.actPrintExecute(Sender: TObject);
begin
  frxRepOtmetkiFlu.ShowReport;
end;

procedure TfrmOtmetkiFlu.frxRepOtmetkiFluGetValue(const VarName: String; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'DATE_ISSL' then Value := cxDateRun.Caption;
  if VarName = 'NUM_KADR' then Value := cxNumIssl.Caption;
  if VarName = 'ZAKL1' then Value := cxResume1.Text;
  if VarName = 'VRACH1' then Value := cxSotr1.Text;
  if VarName = 'DATE1' then Value := cxDate1.Date;
  if VarName = 'ZAKL2' then Value := cxResume2.Text;
  if VarName = 'VRACH2' then Value := cxSotr2.Text;
  if VarName = 'DATE2' then Value := cxDate2.Date;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;  
end;

procedure TfrmOtmetkiFlu.N1Click(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
  Clipboard.AsText := cxDateRun.Caption;
end;

procedure TfrmOtmetkiFlu.N2Click(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
  Clipboard.AsText := cxNumIssl.Caption;
end;

procedure TfrmOtmetkiFlu.odsSotr1BeforeOpen(DataSet: TDataSet);
begin
  odsSotr1.SetVariable('PFK_OTDELID', frmMain.pOTDELID);
end;

procedure TfrmOtmetkiFlu.odsSotr2BeforeOpen(DataSet: TDataSet);
begin
  odsSotr2.SetVariable('PFK_OTDELID', frmMain.pOTDELID);
end;

end.
