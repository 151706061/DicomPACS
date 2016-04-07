unit globals;

interface

uses Messages, windows, forms, controls;

type
  TActionsForTable=(uNothing,uAdd,uDel,uChange);

  TTestVid=record
    nVid:TActionsForTable;
    FK_ID:integer;
    FC_TEST:string[40];
    FN_TEST:integer;
    FN_GRPRIB:integer;
    FN_GRVYB:integer;
  end;

  TUfaVid=record
    nVid:TActionsForTable;
    nId:integer;
    nIdGr:integer;
    cUfa:string;
    nTime:integer;
    nKoef:real;
  end;

  TBnk=record
    nVid:TActionsForTable;
    FK_ID,
    FK_COUNTRYID,
    FK_REGIONID,
    FK_TOWNID:integer;
    FC_NAME:string[100];
    FC_SHORT:string[30];
    FC_ADR:string[90];
    FC_BIK,
    FC_OKONH,
    FC_OKPO,
    FC_INN,
    FC_RS,
    FC_KS:string[15];
  end;

  TPut=record
    nVid:TActionsForTable;
    FK_ID:integer;
    FC_FAM,
    FC_IM,
    FC_OTCH:string[30];
    FC_PUT:string[10];
    FP_TEK_COC,
    FP_SEX:byte;
    FD_DATA1:TDate;
    FN_KOL,
    FK_PALATAID:integer;
    FC_PALATA:string[10];
  end;

  TRoomVid=record
    nVid:TActionsForTable;
    FK_ID:integer;
    FD_DATA1,
    FD_DATA2:TDate;
    FN_MESTA,
    FK_VIDID:integer;
    FC_VID:string[30];
  end;

const
  WM_GOTOP=WM_USER+1;
  WM_PREV=WM_USER+2;
  WM_NEXT=WM_USER+3;
  WM_GOBOTTOM=WM_USER+4;
  WM_ADD=WM_USER+5;
  WM_EDIT=WM_USER+6;
  WM_DEL=WM_USER+7;
  WM_UPDATE=WM_USER+8;
  WM_SELECT=WM_USER+9;
  WM_SETSTATE=WM_USER+10;
  WM_CLEAR=WM_USER+11;
  WM_RECOVER=WM_USER+12;
  WM_VYPISKA=WM_USER+13;
  WM_EAT=WM_USER+14;

procedure PostActiveWin(kMess:cardinal; P1:integer=0; P2:integer=0);
procedure MakeWinOpen(oForm:TForm);
{----------------------------------------}
implementation

procedure PostActiveWin(kMess:cardinal; P1:integer=0; P2:integer=0);
begin
  postmessage(screen.activeform.handle,kMess,P1,P2);
end;

procedure MakeWinOpen(oForm:TForm);
begin
  oForm.show;
  oForm.windowstate:=wsNormal;
end;

end.
