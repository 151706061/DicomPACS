object dmSkladSelect: TdmSkladSelect
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 491
  Top = 403
  Height = 151
  Width = 153
  object pmSkladSelect: TPopupMenu
    Left = 36
    Top = 10
    object miSkladAll: TMenuItem
      AutoCheck = True
      Caption = #1042#1089#1077' '#1089#1082#1083#1072#1076#1099
      Checked = True
      RadioItem = True
      OnClick = miSkladAllClick
    end
    object N2: TMenuItem
      Tag = -1
      Caption = '-'
      Enabled = False
    end
  end
end
