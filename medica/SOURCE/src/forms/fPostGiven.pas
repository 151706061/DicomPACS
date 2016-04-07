unit fPostGiven;

{
  Список медикаментов, выданных постовой медсестрой пациенту за период
  27-12-2007 - A.Nakorjakov - Initial development
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ActnList, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, OracleData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid, StdCtrls,
  Mask, JvExMask, JvToolEdit, JvMaskEdit, JvCheckedMaskEdit,
  JvDatePickerEdit, JvExControls, JvArrowButton, ExtCtrls, Menus, DateUtils,
  JvComponentBase, JvFormPlacement;

type
  RMedicInfo = record
    ID:Integer; //ИД медикамента
    Name:string; //Название меди-та
    Kol:Double; //Кол-во - если IsNew = 1 - то кол-во, которое установил пользователь
                //IsNew = 0 - кол-во, которое выдала постовая медсестра
    IsNew:Boolean; //Не был передан при инициализации, т.е. пользователь его ещё не выбирал/добавлял в расход
    Checked:Integer; //Выбран 1 = true, 0 = false
    EdIsmName:string; //Единицы измерения
  end;
type
  TArrayOfMedicInfo = array of RMedicInfo;
  PArrayOfMedicInfo = ^TArrayOfMedicInfo;
type
  TfrmPostGiven = class(TForm)
    alActions: TActionList;
    aChoose: TAction;
    aClose: TAction;
    CoolBar2: TCoolBar;
    ToolBar2: TToolBar;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    tvPostGiven: TcxGridDBTableView;
    gPostGivenL: TcxGridLevel;
    gPostGiven: TcxGrid;
    odsPostGiven: TOracleDataSet;
    dsPostGiven: TDataSource;
    tvPostGivenColChecked: TcxGridDBColumn;
    tvPostGivenColName: TcxGridDBColumn;
    tvPostGivenColKol: TcxGridDBColumn;
    Panel1: TPanel;
    abuSetDocPeriod: TJvArrowButton;
    dpeDate1: TJvDatePickerEdit;
    dpeDate2: TJvDatePickerEdit;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    aCheckAll: TAction;
    aUnCheckAll: TAction;
    ToolButton7: TToolButton;
    pmDocsFilterPeriod: TPopupMenu;
    N20: TMenuItem;
    N18: TMenuItem;
    N16: TMenuItem;
    N21: TMenuItem;
    N17: TMenuItem;
    N15: TMenuItem;
    ToolButton8: TToolButton;
    aRefresh: TAction;
    FormStorage: TJvFormStorage;
    procedure N15Click(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure tvPostGivenColCheckedPropertiesEditValueChanged(
      Sender: TObject);
    procedure aCheckAllExecute(Sender: TObject);
    procedure aUnCheckAllExecute(Sender: TObject);
    procedure aChooseExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure alActionsUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure tvPostGivenCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FMedInfo:PArrayOfMedicInfo;
    FIsInitNow:Boolean;
    FArrayOfMedicInfo: TArrayOfMedicInfo;
    procedure SetCheck(AChecked:Integer);
    procedure AddEditMedicInfo(AID:Integer;AName:string;AKol:Double;ACheck:Integer;AEdName:string);
  public
    { Public declarations }
    procedure Init(AMedInfo:PArrayOfMedicInfo);
    procedure SaveChooseArray();
  end;

  function GetPostGiven(AMedInfo:PArrayOfMedicInfo):Boolean;

implementation

uses fdmMain, fMainForm;

{$R *.dfm}

function GetPostGiven(AMedInfo:PArrayOfMedicInfo):Boolean;
begin
  with TfrmPostGiven.Create(nil) do
  begin
    try
      Init(AMedInfo);
      Result := ShowModal = mrOk;
      if Result then
      begin
        SaveChooseArray();
      end;
    finally
      Free;
    end;
  end;
end;

procedure TfrmPostGiven.Init(AMedInfo:PArrayOfMedicInfo);
var
  i:Integer;
begin
  FMedInfo := AMedInfo;
  if Assigned(FMedInfo) then
  begin
    SetLength(FArrayOfMedicInfo,Length(FMedInfo^));
    for i:=0 to Length(FMedInfo^) - 1 do
    begin
      FArrayOfMedicInfo[i].ID := (FMedInfo^)[i].ID;
      FArrayOfMedicInfo[i].Name := (FMedInfo^)[i].Name;
      FArrayOfMedicInfo[i].Kol := (FMedInfo^)[i].Kol;
      FArrayOfMedicInfo[i].IsNew := (FMedInfo^)[i].IsNew;
      FArrayOfMedicInfo[i].Checked := (FMedInfo^)[i].Checked;
      FArrayOfMedicInfo[i].EdIsmName := (FMedInfo^)[i].EdIsmName;
    end;
  end
  else begin
    SetLength(FArrayOfMedicInfo,0);
  end;

  dpeDate1.Date := StrToDate(IniReadString( iniFileName, Self.Name, 'dpeDate1Date', DateToStr( Trunc(ServerDate(dmMain.os)))) );
  dpeDate2.Date := StrToDate(IniReadString( iniFileName, Self.Name, 'dpeDate2Date', DateToStr( Trunc(ServerDate(dmMain.os)))) );
  aRefresh.Execute;
end;

procedure TfrmPostGiven.N15Click(Sender: TObject);
var
  CurDate : TDate;
begin
  if not Assigned(Sender) then Exit;
  CurDate := ServerDate(dmMain.os);
  case TMenuItem(Sender).Tag of
    1:  // прошлый год
    begin
      dpeDate1.Date := Trunc(StartOfTheYear(IncYear(CurDate, -1)));
      dpeDate2.Date := Trunc(EndOfTheYear(IncYear(CurDate, -1)));
    end;

    2:  // Текущий год
    begin
      dpeDate1.Date := Trunc(StartOfTheYear(CurDate));
      dpeDate2.Date := Trunc(EndOfTheYear(CurDate));
    end;

    3:  // прошлый месяц
    begin
      dpeDate1.Date := Trunc(StartOfTheMonth(IncMonth(CurDate,-1)));
      dpeDate2.Date := Trunc(EndOfTheMonth(IncMonth(CurDate,-1)));
    end;

    4:  // текущий месяц
    begin
      dpeDate1.Date := Trunc(StartOfTheMonth(CurDate));
      dpeDate2.Date := Trunc(EndOfTheMonth(CurDate));
    end;

    5:  // текущий день
    begin
      dpeDate1.Date := Trunc(CurDate);
      dpeDate2.Date := Trunc(CurDate);
    end;
  end;
end;

procedure TfrmPostGiven.aRefreshExecute(Sender: TObject);
var
   i,PrevID:Integer;
begin
  if odsPostGiven.Active then
    PrevID := odsPostGiven.FieldByName('fk_id').AsInteger
  else
    PrevID := -1;
  odsPostGiven.Close;
  odsPostGiven.SetVariable('PS',dpeDate1.Date);
  odsPostGiven.SetVariable('PPO',dpeDate2.Date);
  odsPostGiven.SetVariable('pMode',dmMain.ConfigParams.GetParamValue('Medses_Give_Mode', 0));  
  odsPostGiven.Open;

  {Проставляем чеки в гриде}
  FIsInitNow := True;
  Screen.Cursor := crSQLWait;
  tvPostGiven.BeginUpdate;
  try
    for i:=0 to Length(FArrayOfMedicInfo) - 1 do
    begin
      if FArrayOfMedicInfo[i].Checked = 1  then //Был выбран?
      begin
        if odsPostGiven.Locate('fk_id',FArrayOfMedicInfo[i].ID,[]) then //Есть в списке?
        begin
          if odsPostGiven.FieldByName('ischeck').AsInteger <> 1 then
          begin
            try
              odsPostGiven.Edit;
              odsPostGiven.FieldByName('ischeck').asInteger:=1;
            finally
              odsPostGiven.Post;
            end;
          end;
        end //if odsPostGiven.Locate(
        else begin
          if odsPostGiven.FieldByName('ischeck').AsInteger <> 0 then
          begin
            try
              odsPostGiven.Edit;
              odsPostGiven.FieldByName('ischeck').asInteger:=0;
            finally
              odsPostGiven.Post;
            end;
          end;        end; //if odsPostGiven.Locate() else
      end //FArrayOfMedicInfo)[i].Checked
      else begin
        odsPostGiven.FieldByName('ischeck').asInteger:=0;
      end; //if FArrayOfMedicInfo)[i].Checked else
    end; //i
  finally
    FIsInitNow := False;
    Screen.Cursor := crDefault;
    odsPostGiven.Locate('fk_id',PrevID,[]);
    tvPostGiven.EndUpdate;
  end; //try
end;

procedure TfrmPostGiven.tvPostGivenColCheckedPropertiesEditValueChanged(
  Sender: TObject);
var
  AChecked:Integer;
begin
  if TcxCheckBox(Sender).Checked then AChecked := 1 else AChecked := 0;
  AddEditMedicInfo(
        odsPostGiven.FieldByName('fk_id').AsInteger,
        odsPostGiven.FieldByName('fc_name').AsString,
        odsPostGiven.FieldByName('fn_kol').AsFloat,
        AChecked,
        odsPostGiven.FieldByName('fc_einame').AsString
        );
end;

procedure TfrmPostGiven.AddEditMedicInfo(AID:Integer;AName:string;AKol:Double;ACheck:Integer;AEdName:string);
var
  i:Integer;
  WasFound:Boolean;
  LenArrayOfMedicInfo:Integer;
begin
  WasFound := False;
  if not(FIsInitNow) then
  begin
    //Поиск медикамента в массиве
    for i:= 0 to Length(FArrayOfMedicInfo) - 1 do
    begin
      if FArrayOfMedicInfo[i].ID = AID then
      begin
        //Нашли - изменяем его
        WasFound := True;
        FArrayOfMedicInfo[i].Name := AName;
        if FArrayOfMedicInfo[i].IsNew then
          FArrayOfMedicInfo[i].Kol := AKol;
        FArrayOfMedicInfo[i].Checked := ACheck;
        FArrayOfMedicInfo[i].EdIsmName := AEdName;
        Break;
      end;
    end;
  end;

  if not(WasFound) then
  begin
    //Если медикамент в массиве не найден, то добавляем его
    LenArrayOfMedicInfo := Length(FArrayOfMedicInfo);
    SetLength(FArrayOfMedicInfo,LenArrayOfMedicInfo +1);
    FArrayOfMedicInfo[LenArrayOfMedicInfo].ID := AID;
    FArrayOfMedicInfo[LenArrayOfMedicInfo].Name := AName;
    FArrayOfMedicInfo[LenArrayOfMedicInfo].Kol := AKol;
    FArrayOfMedicInfo[LenArrayOfMedicInfo].IsNew := True;
    FArrayOfMedicInfo[LenArrayOfMedicInfo].Checked := ACheck;
    FArrayOfMedicInfo[LenArrayOfMedicInfo].EdIsmName := AEdName;
  end;
end;

procedure TfrmPostGiven.aCheckAllExecute(Sender: TObject);
begin
  SetCheck(1);
end;

procedure TfrmPostGiven.SetCheck(AChecked:Integer);
var
  i,PrevID:Integer;
begin
  //Проверки
  if not(odsPostGiven.Active) then Exit;
  if odsPostGiven.RecordCount = 0 then Exit;
  PrevID := odsPostGiven.FieldByName('fk_id').AsInteger;
  try
    Screen.Cursor := crSQLWait;
    tvPostGiven.BeginUpdate;
    odsPostGiven.First;
    for i:=0 to odsPostGiven.RecordCount -1 do
    begin
      Application.ProcessMessages;
      if odsPostGiven.FieldByName('ischeck').asInteger<>AChecked then
      begin
        try
          odsPostGiven.Edit;
          odsPostGiven.FieldByName('ischeck').asInteger:=AChecked;
          AddEditMedicInfo(
            odsPostGiven.FieldByName('fk_id').AsInteger,
            odsPostGiven.FieldByName('fc_name').AsString,
            odsPostGiven.FieldByName('fn_kol').AsFloat,
            AChecked,
            odsPostGiven.FieldByName('fc_einame').AsString);
        finally
          odsPostGiven.Post;
        end;
      end; //if odsPostGiven.FieldByName('ischeck').asInteger<>AChecked then
      odsPostGiven.Next;
    end; //i
  finally
    Screen.Cursor := crDefault;
    odsPostGiven.Locate('fk_id',PrevID,[]);
    tvPostGiven.EndUpdate;
  end;
end;

procedure TfrmPostGiven.aUnCheckAllExecute(Sender: TObject);
begin
  SetCheck(0);
end;

procedure TfrmPostGiven.aChooseExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmPostGiven.aCloseExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmPostGiven.SaveChooseArray();
var
  i,j,nLen:Integer;
  FTmpArray,FTmpArrayKol:TArrayOfMedicInfo;
begin
  if Assigned(FMedInfo) then
  begin
    //Копируем ранее добавленные
    SetLength(FTmpArrayKol,Length(FMedInfo^)) ;
    for i := 0 to Length(FMedInfo^) - 1 do
    begin
      FTmpArrayKol[i].ID := (FMedInfo^)[i].ID;
      FTmpArrayKol[i].Name := (FMedInfo^)[i].Name;
      FTmpArrayKol[i].Kol := (FMedInfo^)[i].Kol;
      FTmpArrayKol[i].IsNew := (FMedInfo^)[i].IsNew;
      FTmpArrayKol[i].Checked := (FMedInfo^)[i].Checked;
      FTmpArrayKol[i].EdIsmName := (FMedInfo^)[i].EdIsmName;
    end;


    //Копируем ранее добавленные, но которые сейчас не отображаются в списке во временный массив
    SetLength(FTmpArray,0);
    for i := 0 to Length(FMedInfo^) - 1 do
    begin
      if odsPostGiven.Lookup('fk_id',(FMedInfo^)[i].ID,'fk_id') = null then
      begin
        nLen := Length(FTmpArray);
        SetLength(FTmpArray,nLen+1);
        FTmpArray[nLen].ID := (FMedInfo^)[i].ID;
        FTmpArray[nLen].Name := (FMedInfo^)[i].Name;
        FTmpArray[nLen].Kol := (FMedInfo^)[i].Kol;
        FTmpArray[nLen].IsNew := (FMedInfo^)[i].IsNew;
        FTmpArray[nLen].Checked := (FMedInfo^)[i].Checked;
        FTmpArray[nLen].EdIsmName := (FMedInfo^)[i].EdIsmName;
      end;
    end;

    //Переданные данные уже не нужны, удаляем их и добавляем в массив элементы временного массива
    SetLength(FMedInfo^,Length(FTmpArray));
    for i:=0 to Length(FTmpArray) - 1 do
    begin
      (FMedInfo^)[i].ID := FTmpArray[i].ID;
      (FMedInfo^)[i].Name := FTmpArray[i].Name;
      (FMedInfo^)[i].Kol := FTmpArray[i].Kol;
      (FMedInfo^)[i].IsNew := FTmpArray[i].IsNew;
      (FMedInfo^)[i].Checked := FTmpArray[i].Checked;
      (FMedInfo^)[i].EdIsmName := FTmpArray[i].EdIsmName;
    end;

    //Прочеканные элементы добавляем в массив
    tvPostGiven.BeginUpdate;
    try
      odsPostGiven.First;
      for i := 0 to odsPostGiven.RecordCount - 1 do
      begin
        if odsPostGiven.FieldByName('ISCHECK').AsInteger = 1 then
        begin
          nLen := Length(FMedInfo^);
          SetLength(FMedInfo^,nLen+1);
          (FMedInfo^)[nLen].ID := odsPostGiven.FieldByName('fk_id').AsInteger;
          (FMedInfo^)[nLen].Name := odsPostGiven.FieldByName('fc_name').AsString;
          (FMedInfo^)[nLen].Kol := odsPostGiven.FieldByName('fn_kol').AsFloat;
          (FMedInfo^)[nLen].EdIsmName := odsPostGiven.FieldByName('fc_einame').AsString;
          (FMedInfo^)[nLen].IsNew := True;
          (FMedInfo^)[nLen].Checked := 1;
        end;
        odsPostGiven.Next;
      end;
    finally
      tvPostGiven.EndUpdate;
    end;

    //Для поднятия ранее сохранённых данных
    for i := 0 to Length(FTmpArrayKol) - 1 do
    begin
      for j := 0 to Length(FMedInfo^) - 1 do
      begin
        if FTmpArrayKol[i].ID = (FMedInfo^)[i].ID then
        begin
          (FMedInfo^)[i].Kol := FTmpArrayKol[i].Kol; //Восстанавливаем кол-во, установленное ранее
          Break;
        end;
      end;
    end;  
  end;
end;  

procedure TfrmPostGiven.alActionsUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  if odsPostGiven.Active then
  begin
    aCheckAll.Enabled := odsPostGiven.RecordCount > 0;
    aUnCheckAll.Enabled := odsPostGiven.RecordCount > 0;
    aChoose.Enabled := odsPostGiven.RecordCount > 0;
  end
  else begin
    aCheckAll.Enabled := False;
    aUnCheckAll.Enabled := False;
    aChoose.Enabled := False;
  end;
end;

procedure TfrmPostGiven.tvPostGivenCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
  AChecked:Integer;
begin
  if ACellViewInfo.Item = tvPostGivenColChecked then Exit;
  if odsPostGiven.FieldByName('ischeck').AsInteger = 0 then AChecked := 1 else AChecked := 0; //было 0 стало 1
  try
    odsPostGiven.Edit;
    odsPostGiven.FieldByName('ischeck').asInteger:=AChecked;
    AddEditMedicInfo(
        odsPostGiven.FieldByName('fk_id').AsInteger,
        odsPostGiven.FieldByName('fc_name').AsString,
        odsPostGiven.FieldByName('fn_kol').AsFloat,
        AChecked,
        odsPostGiven.FieldByName('fc_einame').AsString
        );
  finally
    odsPostGiven.Post;
  end;
end;

procedure TfrmPostGiven.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IniWriteString( iniFileName, Self.Name, 'dpeDate1Date',     DateToStr(TRUNC(dpeDate1.Date))   );
  IniWriteString( iniFileName, Self.Name, 'dpeDate2Date',     DateToStr(TRUNC(dpeDate2.Date))   );
end;

end.
