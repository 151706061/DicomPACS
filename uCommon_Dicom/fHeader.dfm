object frmHeader: TfrmHeader
  Left = 435
  Top = 9
  BorderStyle = bsDialog
  Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' DICOM-'#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1080' (DICOM header)'
  ClientHeight = 654
  ClientWidth = 657
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object memHead: TcxMemo
    AlignWithMargins = True
    Left = 3
    Top = 536
    Lines.Strings = (
      '')
    ParentShowHint = False
    Properties.ScrollBars = ssVertical
    ShowHint = True
    Style.LookAndFeel.Kind = lfOffice11
    Style.LookAndFeel.SkinName = 'Office2007Black'
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Black'
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.SkinName = 'Office2007Black'
    StyleHot.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.SkinName = 'Office2007Black'
    TabOrder = 0
    Height = 65
    Width = 526
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 616
    Width = 651
    Height = 35
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object bClose: TcxButton
      Left = 571
      Top = 4
      Width = 75
      Height = 27
      Action = aClose
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object cxTreeList1: TcxTreeList
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 651
    Height = 607
    Align = alClient
    Bands = <
      item
      end>
    BufferedPaint = False
    LookAndFeel.Kind = lfFlat
    OptionsData.Editing = False
    OptionsData.Deleting = False
    OptionsSelection.CellSelect = False
    ParentColor = False
    TabOrder = 2
    OnCustomDrawCell = cxTreeList1CustomDrawCell
    object cxTreeList1cxTreeListColumn3: TcxTreeListColumn
      Caption.Text = #1053#1086#1084#1077#1088
      DataBinding.ValueType = 'String'
      Width = 94
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxTreeList1cxTreeListColumn4: TcxTreeListColumn
      Caption.Text = #1058#1080#1087
      DataBinding.ValueType = 'String'
      Width = 67
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxTreeList1cxTreeListColumn5: TcxTreeListColumn
      Caption.Text = #1054#1087#1080#1089#1072#1085#1080#1077
      DataBinding.ValueType = 'String'
      Width = 196
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxTreeList1cxTreeListColumn7: TcxTreeListColumn
      DataBinding.ValueType = 'String'
      Width = 426
      Position.ColIndex = 3
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
  end
  object al: TActionList
    Left = 400
    Top = 96
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091
      ShortCut = 27
      OnExecute = aCloseExecute
    end
  end
end
