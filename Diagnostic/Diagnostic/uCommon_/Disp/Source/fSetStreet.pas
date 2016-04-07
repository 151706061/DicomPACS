unit fSetStreet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, dxSkinsCore, dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid, OracleData,
  dxSkinCaramel, dxSkinCoffee, dxSkinOffice2007Green;

type
  TfrmSetStreet = class(TForm)
    grListRaion: TcxGrid;
    tvList: TcxGridDBTableView;
    tvListName: TcxGridDBColumn;
    grListRaionLevel1: TcxGridLevel;
    tvListPreffix: TcxGridDBColumn;
    odsAdr: TOracleDataSet;
    dsAdr: TDataSource;
    odsStreet: TOracleDataSet;
    odsAll: TOracleDataSet;
    procedure tvListCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure tvListKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetStreet: TfrmSetStreet;

implementation
uses fSetAdr1, fSetPhoneAdr1;
{$R *.dfm}

procedure TfrmSetStreet.tvListCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if Assigned(frmSetAdr1) then
    begin
      if frmSetAdr1.pStreet = 1 then
        begin
          frmSetAdr1.teAdr1.Tag := frmSetStreet.odsAdr.FieldByName('fk_id').AsInteger;
          frmSetAdr1.sPrefix := frmSetStreet.odsAdr.FieldByName('fc_preffix').AsString;
          frmSetAdr1.pRaion := frmSetStreet.odsAdr.FieldByName('fk_raionid').AsInteger;
          frmSetAdr1.pType := frmSetStreet.odsAdr.FieldByName('fl_type').AsInteger; // (1-Улица, 2-Организация, 3-Стоянка)
          frmSetAdr1.pCost := frmSetStreet.odsAdr.FieldByName('fn_cost').AsInteger;
          frmSetAdr1.teAdr1.Text := frmSetStreet.odsAdr.FieldByName('fc_name').AsString;
          frmSetAdr1.sAddress := frmSetStreet.odsAdr.FieldByName('fc_adr').AsString;
          frmSetStreet.Close;
          frmSetAdr1.aOk.Enabled := True;
        end;
      if frmSetAdr1.pStreet = 2 then
        begin
          frmSetAdr1.teAdr2.Tag := frmSetStreet.odsAdr.FieldByName('fk_id').AsInteger;
          frmSetAdr1.teAdr2.Text := frmSetStreet.odsAdr.FieldByName('fc_name').AsString;
          frmSetStreet.Close;
          frmSetAdr1.aOk.Enabled := True;
        end;
    end;
  if Assigned(frmSetPhoneAdr1) then
    begin
      frmSetPhoneAdr1.teAdr1.Tag := frmSetStreet.odsAdr.FieldByName('fk_id').AsInteger;
      frmSetPhoneAdr1.sPrefix := frmSetStreet.odsAdr.FieldByName('fc_preffix').AsString;
      frmSetPhoneAdr1.pRaion := frmSetStreet.odsAdr.FieldByName('fk_raionid').AsInteger;
      frmSetPhoneAdr1.pType := frmSetStreet.odsAdr.FieldByName('fl_type').AsInteger; // (1-Улица, 2-Организация, 3-Стоянка)
      frmSetPhoneAdr1.pCost := frmSetStreet.odsAdr.FieldByName('fn_cost').AsInteger;
      frmSetPhoneAdr1.teAdr1.Text := frmSetStreet.odsAdr.FieldByName('fc_name').AsString;
      frmSetPhoneAdr1.sAddress := frmSetStreet.odsAdr.FieldByName('fc_adr').AsString;
      frmSetStreet.Close;
      frmSetPhoneAdr1.aOk.Enabled := True;
    end;
end;

procedure TfrmSetStreet.tvListKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Assigned(frmSetAdr1) then
    begin
      frmSetAdr1.teAdr1.Tag := frmSetStreet.odsAdr.FieldByName('fk_id').AsInteger;
      frmSetAdr1.sPrefix := frmSetStreet.odsAdr.FieldByName('fc_preffix').AsString;
      frmSetAdr1.pRaion := frmSetStreet.odsAdr.FieldByName('fk_raionid').AsInteger;
      frmSetAdr1.pType := frmSetStreet.odsAdr.FieldByName('fl_type').AsInteger; // (1-Улица, 2-Организация, 3-Стоянка)
      frmSetAdr1.pCost := frmSetStreet.odsAdr.FieldByName('fn_cost').AsInteger;
      frmSetAdr1.teAdr1.Text := frmSetStreet.odsAdr.FieldByName('fc_name').AsString;
      frmSetAdr1.sAddress := frmSetStreet.odsAdr.FieldByName('fc_adr').AsString;
      frmSetStreet.Close;
      frmSetAdr1.aOk.Enabled := True;
    end;
  if Assigned(frmSetPhoneAdr1) then
    begin
      frmSetPhoneAdr1.teAdr1.Tag := frmSetStreet.odsAdr.FieldByName('fk_id').AsInteger;
      frmSetPhoneAdr1.sPrefix := frmSetStreet.odsAdr.FieldByName('fc_preffix').AsString;
      frmSetPhoneAdr1.pRaion := frmSetStreet.odsAdr.FieldByName('fk_raionid').AsInteger;
      frmSetPhoneAdr1.pType := frmSetStreet.odsAdr.FieldByName('fl_type').AsInteger; // (1-Улица, 2-Организация, 3-Стоянка)
      frmSetPhoneAdr1.pCost := frmSetStreet.odsAdr.FieldByName('fn_cost').AsInteger;
      frmSetPhoneAdr1.teAdr1.Text := frmSetStreet.odsAdr.FieldByName('fc_name').AsString;
      frmSetPhoneAdr1.sAddress := frmSetStreet.odsAdr.FieldByName('fc_adr').AsString;
      frmSetStreet.Close;
      frmSetPhoneAdr1.aOk.Enabled := True;
    end;    
end;

end.
