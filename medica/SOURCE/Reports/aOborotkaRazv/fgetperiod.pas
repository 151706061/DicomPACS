unit fgetperiod;

interface

uses
  Windows, Db, OracleData, Classes, ActnList, ImgList, Controls, DBCtrls,
  ComCtrls, ToolWin, StdCtrls, Mask, ExtCtrls, Forms, JvExMask, JvToolEdit,
  cxGraphics, Menus, cxLookAndFeelPainters, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCheckComboBox, Oracle, cxCheckBox, cxGroupBox;

type
  TfrmGetPeriod = class(TForm)
    Panel1: TPanel;
    rbM1: TRadioButton;
    rbM2: TRadioButton;
    rbM3: TRadioButton;
    rbM4: TRadioButton;
    rbM5: TRadioButton;
    rbM6: TRadioButton;
    rbM7: TRadioButton;
    rbM8: TRadioButton;
    rbM9: TRadioButton;
    rbM10: TRadioButton;
    rbM11: TRadioButton;
    rbM12: TRadioButton;
    rbK1: TRadioButton;
    rbK2: TRadioButton;
    rbK3: TRadioButton;
    rbK4: TRadioButton;
    rbG1: TRadioButton;
    rbG2: TRadioButton;
    rbG3: TRadioButton;
    Panel2: TPanel;
    Label1: TLabel;
    dDate1: TJvDateEdit;
    dDate2: TJvDateEdit;
    Label2: TLabel;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ilImages: TImageList;
    alActions: TActionList;
    acApply: TAction;
    acCancel: TAction;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Panel3: TPanel;
    Label3: TLabel;
    ods: TOracleDataSet;
    odsM: TStringField;
    odsType: TOracleDataSet;
    dsType: TDataSource;
    odsGroupMo: TOracleDataSet;
    odsGroupMoGROUPID: TFloatField;
    odsGroupMoFC_GROUP: TStringField;
    odsGroupMoFL_DEL: TFloatField;
    dsGroupMo: TDataSource;
    lcbMO_GROUP: TDBLookupComboBox;
    Panel4: TPanel;
    lbType: TLabel;
    ccbMedType: TcxCheckComboBox;
    buTypeClear: TcxButton;
    buTypeSelectAll: TcxButton;
    oqInitMO: TOracleQuery;
    gbFINSOURCE: TcxGroupBox;
    chbShowFinsource: TcxCheckBox;
    chbShowFarmgr: TcxCheckBox;
    pFarmgr: TPanel;
    Label4: TLabel;
    ccbFarmgr: TcxCheckComboBox;
    buFarmgrClear: TcxButton;
    buFarmgrSelectAll: TcxButton;
    odsFarmgr: TOracleDataSet;
    dsFarmgr: TDataSource;
    procedure rbAllClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acApplyExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure lcbCloseUp(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure odsGroupMoAfterOpen(DataSet: TDataSet);
    procedure odsTypeAfterOpen(DataSet: TDataSet);
    procedure buTypeClearClick(Sender: TObject);
    procedure buTypeSelectAllClick(Sender: TObject);
    procedure odsFarmgrAfterOpen(DataSet: TDataSet);
    procedure buFarmgrSelectAllClick(Sender: TObject);
    procedure buFarmgrClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    IDn : Integer;
    IDs : string;    
    FarmgrIDn : Integer;
    FarmgrIDs : string;
  end;

//var
//  frmGetPeriod      : TfrmGetPeriod;

implementation

uses fMain, Sysutils, IniFiles, fCheckedListEdit;
{$R *.DFM}
//==============================================================================
function IniReadString(sIniFile: string; Section, Ident: string; Default: string = ''): string;
var
	ini: TIniFile;
begin
	ini := TIniFile.Create(sIniFile);
	Result := ini.ReadString(Section, Ident, Default);
	ini.free;
end;

procedure IniWriteString(sIniFile: string; Section, Ident: string; val: string = '');
var
	ini: TIniFile;
begin
	ini := TIniFile.Create(sIniFile);
	ini.WriteString(Section, Ident, val);
	ini.free;
end;
//==============================================================================
procedure TfrmGetPeriod.rbAllClick(Sender: TObject);
var
  cName             : string;
  dDate             : tdate;
  nMon              : word;
  nYear             : word;
begin
  cName:=uppercase(tcomponent(Sender).getnamepath);
  dDate:=0;
  decodedate(date, nYear, nMon, nMon);
  if cName = 'RBM1' then begin
    dDate:=encodedate(nYear, 1, 1);
    nMon:=1
  end
  else
    if cName = 'RBM2' then begin
      dDate:=encodedate(nYear, 2, 1);
      nMon:=1
    end
    else
      if cName = 'RBM3' then begin
        dDate:=encodedate(nYear, 3, 1);
        nMon:=1
      end
      else
        if cName = 'RBM4' then begin
          dDate:=encodedate(nYear, 4, 1);
          nMon:=1
        end
        else
          if cName = 'RBM5' then begin
            dDate:=encodedate(nYear, 5, 1);
            nMon:=1
          end
          else
            if cName = 'RBM6' then begin
              dDate:=encodedate(nYear, 6, 1);
              nMon:=1
            end
            else
              if cName = 'RBM7' then begin
                dDate:=encodedate(nYear, 7, 1);
                nMon:=1
              end
              else
                if cName = 'RBM8' then begin
                  dDate:=encodedate(nYear, 8, 1);
                  nMon:=1
                end
                else
                  if cName = 'RBM9' then begin
                    dDate:=encodedate(nYear, 9, 1);
                    nMon:=1
                  end
                  else
                    if cName = 'RBM10' then begin
                      dDate:=encodedate(nYear, 10, 1);
                      nMon:=1
                    end
                    else
                      if cName = 'RBM11' then begin
                        dDate:=encodedate(nYear, 11, 1);
                        nMon:=1
                      end
                      else
                        if cName = 'RBM12' then begin
                          dDate:=encodedate(nYear, 12, 1);
                          nMon:=1
                        end
                        else
                          if cName = 'RBK1' then begin
                            dDate:=encodedate(nYear, 1, 1);
                            nMon:=3
                          end
                          else
                            if cName = 'RBK2' then begin
                              dDate:=encodedate(nYear, 4, 1);
                              nMon:=3
                            end
                            else
                              if cName = 'RBK3' then begin
                                dDate:=encodedate(nYear, 7, 1);
                                nMon:=3
                              end
                              else
                                if cName = 'RBK4' then begin
                                  dDate:=encodedate(nYear, 10, 1);
                                  nMon:=3
                                end
                                else
                                  if cName = 'RBG1' then begin
                                    dDate:=encodedate(nYear, 1, 1);
                                    nMon:=6
                                  end
                                  else
                                    if cName = 'RBG2' then begin
                                      dDate:=encodedate(nYear, 7, 1);
                                      nMon:=6
                                    end
                                    else
                                      if cName = 'RBG3' then begin
                                        dDate:=encodedate(nYear, 1, 1);
                                        nMon:=12
                                      end;
  Self.dDate1.date:=dDate;
  Self.dDate2.date:=incmonth(dDate, nMon) - 1;
end;

procedure TfrmGetPeriod.FormCreate(Sender: TObject);
var d, FK_APPSOTR_ID: integer;

begin
  ods.open;
  d:=strtoint(ods.FieldByName('M').AsString);
//  d := 9; //#todo1 убрать
  case d of
    1: rbm1.Checked:=true;
    2: rbm2.Checked:=true;
    3: rbm3.Checked:=true;
    4: rbm4.Checked:=true;
    5: rbm5.Checked:=true;
    6: rbm6.Checked:=true;
    7: rbm7.Checked:=true;
    8: rbm8.Checked:=true;
    9: rbm9.Checked:=true;
    10: rbm10.Checked:=true;
    11: rbm11.Checked:=true;
    12: rbm12.Checked:=true;
  else
     rbm1.Checked:=true;
  end;

  if TryStrToInt(ParamStr(1), FK_APPSOTR_ID) = False then
    FK_APPSOTR_ID := -1;
  oqInitMO.SetVariable('PAPPSOTRID', FK_APPSOTR_ID);
  oqInitMO.Execute;

  odsGroupMo.Open;
  lcbMO_GROUP.KeyValue := oqInitMO.GetVariable('nMO_GROUP');

  odsType.Open;   
  odsFarmgr.Open;
  Self.Caption := Application.Title;  
end;

procedure TfrmGetPeriod.acApplyExecute(Sender: TObject);
//var frmFIOTreb: TfrmFIOTreb;
var
  i : Integer;
begin
  try
//    Self.dDate1.CheckValiddate;
  StrToDate( dDate1.Text );
  except
    on EConvertError do begin
      Application.MessageBox('Неверно введена начальная дата периода', 'Ошибка', MB_OK + MB_ICONERROR);
      Self.dDate1.SetFocus;
      Exit;
    end;
  end;
  try
//    Self.dDate2.CheckValiddate;
  StrToDate( dDate2.Text );
  except
    on EConvertError do begin
      Application.MessageBox('Неверно введена конечная дата периода', 'Ошибка', MB_OK + MB_ICONERROR);
      Self.dDate2.SetFocus;
      Exit;
    end;
  end;
  if Self.dDate1.date > Self.dDate2.date then begin
    Application.MessageBox('Неверно задан период', 'Ошибка', MB_OK + MB_ICONERROR);
    Self.dDate1.SetFocus;
    Exit;
  end;

  if (ccbMedType.Text = ccbMedType.Properties.EmptySelectionText) then
  begin
    ccbMedType.SetFocus;
    Application.MessageBox('Не выбраны группы учетности', 'Ошибка', MB_OK + MB_ICONERROR);
    Exit;
  end;   

  if chbShowFarmgr.Checked and (ccbFarmgr.Text = ccbFarmgr.Properties.EmptySelectionText) then
  begin
    ccbFarmgr.SetFocus;
    Application.MessageBox('Не выбраны фармакологические группы', 'Ошибка', MB_OK + MB_ICONERROR);
    Exit;
  end;

// проверка на выбор типа медикамента
  IDn := 0;
  for i := 0 to ccbMedType.Properties.Items.Count - 1 do
  begin
    if ccbMedType.States[i] = cbsChecked then
    begin
      Inc(IDn);
      IDs := IDs + ', '+IntToStr(ccbMedType.Properties.Items[i].Tag);
    end;
  end;
  Delete(IDs, 1, 2); // удаляем первую запятую и пробел - они лишние  

// проверка на выбор фарм групп
  FarmgrIDn := 0;
  for i := 0 to ccbFarmgr.Properties.Items.Count - 1 do
  begin
    if ccbFarmgr.States[i] = cbsChecked then
    begin
      Inc(FarmgrIDn);
      FarmgrIDs := FarmgrIDs + ', '+IntToStr(ccbFarmgr.Properties.Items[i].Tag);
    end;
  end;
  Delete(FarmgrIDs, 1, 2); // удаляем первую запятую и пробел - они лишние

//  if IDn = 0 then
//  begin
//    Application.MessageBox('Не выбран тип медикамента', 'Ошибка', MB_OK + MB_ICONERROR);
//    Self.ccbMedType.SetFocus;
//    Exit;
//  end;

  ModalResult := mrOk;
end;

procedure TfrmGetPeriod.acCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGetPeriod.lcbCloseUp(Sender: TObject);
begin
  acApply.Enabled := (lcbMO_GROUP.Text <> '');// and (lcbType.Text <> '');
  lcbMO_GROUP.Hint := lcbMO_GROUP.Text;
end;

procedure TfrmGetPeriod.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If ModalResult <> mrOk then
  begin
    ModalResult := mrCancel;
    Application.Terminate;
  end;
end;

procedure TfrmGetPeriod.odsFarmgrAfterOpen(DataSet: TDataSet);
var
  ChBox : TcxCheckComboBoxItem;
  StrList : TStrings;
  i : Integer;
  sID : string;
begin
//  lcbType.KeyValue := StrToInt(IniReadString(ChangeFileExt(Application.ExeName,'.ini'),'Params', 'LastTypeID', '-1'));
  StrList := TStringList.Create;
  StrList.Text := StringToListStr(IniReadString(ChangeFileExt(Application.ExeName,'.ini'),'Params', 'LastFarmgrID', '-1'));
  odsFarmgr.First;  // записываем все фармгруппы в чеклист
  ccbFarmgr.Properties.Items.Clear;
  while not odsFarmgr.Eof do
  begin
    ChBox := ccbFarmgr.Properties.Items.Add;
    ChBox.Description := odsFarmgr.FieldByName('FC_FARMGR').AsString;
    ChBox.Tag := odsFarmgr.FieldByName('FARMGRID').AsInteger; // в теге храним ID группы
    // проставляем галочку на текущем чекбоксе
    sID := IntToStr( ChBox.Tag );
    i := 0;
    while (i < StrList.Count)and(sID <> StrList.Strings[i]) do
      Inc( i );
    if (i < StrList.Count) then ccbFarmgr.States[ ChBox.Index ] := cbsChecked else ccbFarmgr.States[ ChBox.Index ] := cbsUnchecked;
    odsFarmgr.Next;
  end;
  odsFarmgr.First;
  StrList.Free;

  lcbCloseUp(nil);
end;

procedure TfrmGetPeriod.odsGroupMoAfterOpen(DataSet: TDataSet);
begin
  lcbMO_GROUP.KeyValue := StrToInt(IniReadString(ChangeFileExt(Application.ExeName,'.ini'),'Params', 'LastMOGroupID', '-1'));
  lcbCloseUp(nil);
end;

procedure TfrmGetPeriod.odsTypeAfterOpen(DataSet: TDataSet);
var
  ChBox : TcxCheckComboBoxItem;
  StrList : TStrings;
  i : Integer;
  sID : string;
begin
//  lcbType.KeyValue := StrToInt(IniReadString(ChangeFileExt(Application.ExeName,'.ini'),'Params', 'LastTypeID', '-1'));
  StrList := TStringList.Create;
  StrList.Text := StringToListStr(IniReadString(ChangeFileExt(Application.ExeName,'.ini'),'Params', 'LastTypeID', '-1'));
  odsType.First;  // записываем все типы медикаментов в чеклист
  ccbMedType.Properties.Items.Clear;
  while not odsType.Eof do
  begin
    ChBox := ccbMedType.Properties.Items.Add;
    ChBox.Description := odsType.FieldByName('FC_UCHGR').AsString;
    ChBox.Tag := odsType.FieldByName('UCHGRID').AsInteger; // в теге храним ID типа
    // проставляем галочку на текущем чекбоксе
    sID := IntToStr( ChBox.Tag );
    i := 0;
    while (i < StrList.Count)and(sID <> StrList.Strings[i]) do
      Inc( i );
    if (i < StrList.Count) then ccbMedType.States[ ChBox.Index ] := cbsChecked else ccbMedType.States[ ChBox.Index ] := cbsUnchecked;
    odsType.Next;
  end;
  odsType.First;
  StrList.Free;

  lcbCloseUp(nil);
end;

procedure TfrmGetPeriod.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  IDs : string;
  i : Integer;
begin
  lcbMO_GROUP.CloseUp(False);
//  lcbType.CloseUp(False);

  IniWriteString(ChangeFileExt(Application.ExeName,'.ini'),'Params', 'LastMOGroupID', IntToStr(lcbMO_GROUP.KeyValue));

  IDs := '';
  for i := 0 to ccbMedType.Properties.Items.Count - 1 do
  begin
    if ccbMedType.States[i] = cbsChecked then
      IDs := IDs + '|'+IntToStr(ccbMedType.Properties.Items[i].Tag);
  end;
  Delete(IDs, 1, 1);
  IniWriteString(ChangeFileExt(Application.ExeName,'.ini'),'Params', 'LastTypeID', IDs);  

  IDs := '';
  for i := 0 to ccbFarmgr.Properties.Items.Count - 1 do
  begin
    if ccbFarmgr.States[i] = cbsChecked then
      IDs := IDs + '|'+IntToStr(ccbFarmgr.Properties.Items[i].Tag);
  end;
  Delete(IDs, 1, 1);
  IniWriteString(ChangeFileExt(Application.ExeName,'.ini'),'Params', 'LastFarmgrID', IDs);
end;

procedure TfrmGetPeriod.buFarmgrClearClick(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to ccbFarmgr.Properties.Items.Count - 1 do
    ccbFarmgr.States[i] := cbsUnChecked;
end;

procedure TfrmGetPeriod.buFarmgrSelectAllClick(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to ccbFarmgr.Properties.Items.Count - 1 do
    ccbFarmgr.States[i] := cbsChecked;
end;

procedure TfrmGetPeriod.buTypeClearClick(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to ccbMedType.Properties.Items.Count - 1 do
    ccbMedType.States[i] := cbsUnChecked;
end;

procedure TfrmGetPeriod.buTypeSelectAllClick(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to ccbMedType.Properties.Items.Count - 1 do
    ccbMedType.States[i] := cbsChecked;
end;

end.

