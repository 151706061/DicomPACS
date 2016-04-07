object Plot3DForm: TPlot3DForm
  Left = 292
  Top = 192
  Width = 833
  Height = 650
  Caption = 'Plot3DForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Graph3D1: TGraph3D
    Left = 0
    Top = 0
    Width = 825
    Height = 623
    DataColor = clBlack
    UseColors = False
    AxesColor = clBlue
    DrawAxes = True
    LabelX = 'X'
    LabelY = 'Y'
    LabelZ = 'Val'
    Theta = 60
    Phi = 330
    ZoomX = 0.550000011920929
    ZoomY = 0.550000011920929
    MouseControl = mcRotate
    ViewPercentage = 100
    FirstLine = -10
    LastLine = -9
    ScrollSpeed = 0
    IncrementalScroll = True
    DrawHiddenLines = True
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
end
