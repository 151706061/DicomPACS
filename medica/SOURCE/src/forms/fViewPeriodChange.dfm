object fmViewPeriodChange: TfmViewPeriodChange
  Left = 755
  Top = 239
  BorderStyle = bsDialog
  Caption = #1055#1077#1088#1080#1086#1076' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1103
  ClientHeight = 117
  ClientWidth = 202
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 64
    Width = 81
    Height = 13
    Caption = #1053#1072#1095#1072#1083#1100#1085#1072#1103' '#1076#1072#1090#1072
  end
  object Label2: TLabel
    Left = 8
    Top = 90
    Width = 74
    Height = 13
    Caption = #1050#1086#1085#1077#1095#1085#1072#1103' '#1076#1072#1090#1072
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 202
    Height = 44
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 40
        Width = 198
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 185
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
  object dtStart: TcxDateEdit
    Left = 106
    Top = 60
    EditValue = 0d
    Properties.DateButtons = [btnToday]
    Properties.DateOnError = deToday
    Properties.ImmediatePost = True
    Properties.InputKind = ikMask
    Properties.SaveTime = False
    Properties.ShowTime = False
    Properties.OnChange = dtStartPropertiesChange
    Properties.OnValidate = dtStartPropertiesValidate
    Style.BorderStyle = ebs3D
    TabOrder = 1
    OnKeyPress = dtStartKeyPress
    Width = 87
  end
  object dtFinish: TcxDateEdit
    Left = 106
    Top = 86
    EditValue = 0d
    Properties.DateButtons = [btnToday]
    Properties.DateOnError = deToday
    Properties.ImmediatePost = True
    Properties.InputKind = ikMask
    Properties.SaveTime = False
    Properties.ShowTime = False
    Properties.OnChange = dtStartPropertiesChange
    Properties.OnValidate = dtStartPropertiesValidate
    Style.BorderStyle = ebs3D
    TabOrder = 2
    OnKeyPress = dtFinishKeyPress
    Width = 87
  end
  object al: TActionList
    Images = dmMain.ilMain
    Left = 158
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
end
