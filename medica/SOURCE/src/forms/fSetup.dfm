object frmSetup: TfrmSetup
  Left = 361
  Top = 217
  HelpContext = 1
  BorderStyle = bsDialog
  Caption = #1055#1077#1088#1080#1086#1076' '#1088#1072#1073#1086#1090#1099
  ClientHeight = 122
  ClientWidth = 299
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  HelpFile = 'StMedsestra.chm'
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnActivate = FormActivate
  OnHelp = FormHelp
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 60
    Width = 85
    Height = 13
    Caption = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072':'
  end
  object Label2: TLabel
    Left = 13
    Top = 89
    Width = 79
    Height = 13
    Caption = #1050#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072':'
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 299
    Height = 44
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 40
        Width = 295
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 282
      Height = 40
      AutoSize = True
      BorderWidth = 1
      ButtonHeight = 36
      ButtonWidth = 60
      Caption = 'ToolBar1'
      EdgeBorders = []
      Flat = True
      Images = dmMain.ilMain
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      object ToolButton2: TToolButton
        Left = 0
        Top = 0
        Action = acSave
      end
      object ToolButton5: TToolButton
        Left = 60
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object ToolButton3: TToolButton
        Left = 68
        Top = 0
        Action = acCancel
      end
    end
  end
  object edD1: TcxDateEdit
    Left = 96
    Top = 56
    EditValue = 36892d
    Properties.DateButtons = [btnToday]
    Properties.DateOnError = deToday
    Properties.ImmediatePost = True
    Properties.InputKind = ikMask
    Properties.PostPopupValueOnTab = True
    Properties.SaveTime = False
    Properties.ShowTime = False
    Style.BorderStyle = ebs3D
    TabOrder = 1
    Width = 186
  end
  object edD2: TcxDateEdit
    Left = 96
    Top = 85
    EditValue = 37349d
    Properties.DateButtons = [btnToday]
    Properties.DateOnError = deToday
    Properties.ImmediatePost = True
    Properties.InputKind = ikMask
    Properties.PostPopupValueOnTab = True
    Properties.SaveTime = False
    Properties.ShowTime = False
    Style.BorderStyle = ebs3D
    TabOrder = 2
    Width = 186
  end
  object al: TActionList
    Images = dmMain.ilMain
    Left = 152
    Top = 8
    object acSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1080' '#1079#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086
      ImageIndex = 9
      ShortCut = 113
      OnExecute = acSaveExecute
    end
    object acCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086' '#1073#1077#1079' '#1080#1079#1084#1077#1085#1077#1085#1080#1081
      ImageIndex = 8
      ShortCut = 27
      OnExecute = acCancelExecute
    end
  end
  object oqUpdDate: TOracleQuery
    SQL.Strings = (
      
        'UPDATE MED.tdate set fd_data1=:afd_data1, fd_data2=:afd_data2 wh' +
        'ere id=1')
    Session = dmMain.os
    Variables.Data = {
      03000000020000000A0000003A4146445F44415441310C000000000000000000
      00000A0000003A4146445F44415441320C0000000000000000000000}
    Cursor = crSQLWait
    Left = 232
    Top = 8
  end
end
