object fmSelect_UchGr: TfmSelect_UchGr
  Left = 372
  Top = 170
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = #1042#1099#1073#1086#1088' '#1091#1095#1077#1090#1085#1086#1081' '#1075#1088#1091#1087#1087#1099
  ClientHeight = 33
  ClientWidth = 387
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  DesignSize = (
    387
    33)
  PixelsPerInch = 96
  TextHeight = 13
  object cxButton1: TcxButton
    Left = 264
    Top = 3
    Width = 55
    Height = 25
    Action = acOk
    Anchors = [akTop, akRight]
    TabOrder = 0
  end
  object cxButton2: TcxButton
    Left = 328
    Top = 3
    Width = 55
    Height = 25
    Action = acCancel
    Anchors = [akTop, akRight]
    TabOrder = 1
  end
  object tlUchGr: TcxDBTreeList
    Left = 25
    Top = 8
    Width = 210
    Height = 31
    Bands = <
      item
      end>
    BufferedPaint = False
    DataController.DataSource = dmMain.dsUchGr
    DataController.ParentField = 'PARENTID'
    DataController.KeyField = 'UCHGRID'
    OptionsBehavior.ExpandOnIncSearch = True
    OptionsBehavior.IncSearch = True
    OptionsData.Editing = False
    OptionsData.Deleting = False
    OptionsView.ColumnAutoWidth = True
    OptionsView.Headers = False
    RootValue = 0
    TabOrder = 2
    Visible = False
    OnDblClick = tlUchGrDblClick
    OnKeyPress = tlUchGrKeyPress
    object tlUchGrFC_UCHGR: TcxDBTreeListColumn
      DataBinding.FieldName = 'FC_UCHGR'
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
  end
  object peUchGr: TcxPopupEdit
    Tag = -1
    Left = 4
    Top = 7
    Properties.PopupAutoSize = False
    Properties.PopupControl = tlUchGr
    Properties.PopupWidth = 245
    TabOrder = 3
    Width = 245
  end
  object ActionList1: TActionList
    Left = 188
    Top = 2
    object acOk: TAction
      Caption = 'OK'
      ShortCut = 13
      OnExecute = acOkExecute
    end
    object acCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      ShortCut = 32883
      OnExecute = acCancelExecute
    end
  end
end
