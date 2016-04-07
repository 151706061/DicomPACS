unit fInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxStyles, cxGraphics, cxEdit, dxSkinsCore,
  dxSkinOffice2007Green, cxControls, cxInplaceContainer, cxVGrid, Menus,
  cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons, Oracle, OracleData,
  cxCalendar, cxTimeEdit, cxDBLookupComboBox, cxButtonEdit, cxDropDownEdit,
  cxCheckBox, cxTextEdit, dxSkinCaramel;

type
  TfrmInfo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxVerticalGrid1: TcxVerticalGrid;
    cxVerticalGrid2: TcxVerticalGrid;
    bClose: TcxButton;
    al: TActionList;
    aClose: TAction;
    catMain: TcxCategoryRow;
    rowDate: TcxEditorRow;
    rowNumTel: TcxEditorRow;
    rowAdr1: TcxEditorRow;
    rowAdr2: TcxEditorRow;
    rowNum: TcxEditorRow;
    rowFics: TcxEditorRow;
    rowTimeTrip: TcxEditorRow;
    rowCalc: TcxEditorRow;
    rowFact: TcxEditorRow;
    rowFactMG: TcxEditorRow;
    rowSum: TcxEditorRow;
    catDop: TcxCategoryRow;
    rowDopTime: TcxEditorRow;
    rowStopDrv: TcxEditorRow;
    rowStopClt: TcxEditorRow;
    rowBag: TcxEditorRow;
    rowKm: TcxEditorRow;
    rowFree: TcxEditorRow;
    rowPeregon: TcxEditorRow;
    rowNeopl: TcxEditorRow;
    stRep: TcxStyleRepository;
    stSum: TcxStyle;
    stNeopl: TcxStyle;
    catSpecial: TcxCategoryRow;
    stBold: TcxStyle;
    rowSetDrv: TcxEditorRow;
    procedure aCloseExecute(Sender: TObject);
  private
    { Private declarations }
  public
    procedure DoShowForm(pID : Integer);
    { Public declarations }
  end;

var
  frmInfo: TfrmInfo;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmInfo.aCloseExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmInfo.DoShowForm(pID: Integer);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select to_char(t1.fd_datein, ''dd.mm.yyyy hh24:mi'') as fd_datein, to_char(t1.fd_setdrv, ''dd.mm.yyyy hh24:mi'') as fd_setdrv, '+#13+
                    '        decode(t1.fd_setdrv, null, '''', round((t1.fd_setdrv-t1.fd_datein)*60*24)) as timesetdrv, '+#13+
                    '        t1.fc_phone, t1.fc_adr1||'' ''||decode(to_char(fn_stop), 0, '''', null, '''', ''(+''||to_char(fn_stop)||'')'') as fc_adr1, t1.fc_adr2, '+#13+
                    '        nvl(decode(t1.fl_bagage_real, '+#13+
                    '                   0, t2.fc_name||decode(t1.fk_drvid2, 0, null, '', ''||(select fc_name from taxi.ts_drivers where fk_id = fk_drvid2)), '+#13+
                    '                   1, t2.fc_name||decode(t1.fk_drvid2, 0, null, '', ''||(select fc_name from taxi.ts_drivers where fk_id = fk_drvid2))||'' (Б)''), '' '') as numdrv, '+#13+
                    '        to_char(t1.fd_datef, ''hh24:mi'') as fd_datef_str, '+#13+
                    '        to_char(t1.fd_dater, ''hh24:mi'') as fd_dater_str, t1.fn_time_trip, '+#13+
                    '        t1.fn_sumf, t1.fn_sumfmg, '+#13+
                    '        round(decode(t1.fn_sumf, null, t1.fn_sumr+t1.fn_sumfmg, 0, t1.fn_sumr+t1.fn_sumfmg, t1.fn_sumf+t1.fn_sumfmg)) as sum_ras, '+#13+
                    '        t1.fn_time, '+#13+
                    '        t1.fn_km1, t1.fn_km2, '+#13+
                    '        t1.fl_peregon, t1.fl_free, t1.fn_sos '+#13+
                    '   from taxi.tjournal t1, taxi.ts_drivers t2 '+#13+
                    '  where t1.fk_id = :pfk_id '+#13+
                    '    and t1.fk_drvid = t2.fk_id ';
    ods.DeclareAndSet('pfk_id', otInteger, pID);
    ods.Open;
    rowNeopl.Visible := ods.FieldByName('fn_sos').AsInteger = 4;
    rowDate.Properties.Value := ods.FieldByName('fd_datein').AsString;
    rowNumTel.Properties.Value := ods.FieldByName('fc_phone').AsString;
    rowAdr1.Properties.Value := ods.FieldByName('fc_adr1').AsString;
    rowAdr2.Properties.Value := ods.FieldByName('fc_adr2').AsString;
    if ods.FieldByName('fd_setdrv').AsString = '' then
      rowSetDrv.Properties.Value := ''
    else
      rowSetDrv.Properties.Value := ods.FieldByName('fd_setdrv').AsString+' ('+ods.FieldByName('timesetdrv').AsString+' мин.)';
    rowNum.Properties.Value := ods.FieldByName('numdrv').AsString;
    rowFics.Properties.Value := ods.FieldByName('fd_datef_str').AsString;
    rowTimeTrip.Properties.Value := IntToStr(ods.FieldByName('fn_time_trip').AsInteger)+' мин.';
    rowCalc.Properties.Value := ods.FieldByName('fd_dater_str').AsString;
    rowFact.Properties.Value := IntToStr(ods.FieldByName('fn_sumf').AsInteger);
    rowFactMG.Properties.Value := IntToStr(ods.FieldByName('fn_sumfmg').AsInteger);
    rowSum.Properties.Value := IntToStr(ods.FieldByName('sum_ras').AsInteger);
    rowDopTime.Properties.Value := IntToStr(ods.FieldByName('fn_time').AsInteger)+' мин.';
    if ods.FieldByName('fn_km2').AsInteger <> 0 then
      begin
        rowKM.Properties.Value := IntToStr(ods.FieldByName('fn_km1').AsInteger)+'/'+IntToStr(ods.FieldByName('fn_km2').AsInteger)+' км';
      end else
      begin
        if ods.FieldByName('fn_km1').AsInteger = 0 then
          rowKM.Properties.Value := '--'
        else
          rowKM.Properties.Value := IntToStr(ods.FieldByName('fn_km1').AsInteger)+' км';
      end;
    rowFree.Visible := ods.FieldByName('fl_free').AsInteger = 1;
    rowPeregon.Visible := ods.FieldByName('fl_peregon').AsInteger = 1;
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select fn_stopdrv, fn_stopclt, fn_baggage from taxi.tstops where fk_jurid = :pfk_jurid ';
    ods.DeclareAndSet('pfk_jurid', otInteger, pID);
    ods.Open;
    rowStopDrv.Properties.Value := IntToStr(ods.FieldByName('fn_stopdrv').AsInteger)+' мин.';
    rowStopClt.Properties.Value := IntToStr(ods.FieldByName('fn_stopclt').AsInteger)+' мин.';
    rowBag.Properties.Value := IntToStr(ods.FieldByName('fn_baggage').AsInteger)+' мин.';
  finally
    ods.Free;
  end;
end;

end.
