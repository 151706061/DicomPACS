object frmCapture: TfrmCapture
  Left = 241
  Top = 49
  Caption = #1047#1072#1093#1074#1072#1090' '#1074#1080#1076#1077#1086
  ClientHeight = 573
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 526
    Top = 3
    Width = 263
    Height = 510
    Align = alRight
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object lbFrames: TLabel
      Left = 442
      Top = 43
      Width = 3
      Height = 13
      Caption = ' '
    end
    object dxBarDockControl1: TdxBarDockControl
      AlignWithMargins = True
      Left = 5
      Top = 448
      Width = 253
      Height = 57
      Align = dalBottom
      BarManager = BM
      SunkenBorder = True
      UseOwnSunkenBorder = True
    end
    object cxGroupBox3: TcxGroupBox
      Left = 2
      Top = 281
      Align = alBottom
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 1
      Height = 164
      Width = 259
      object cxButton1: TcxButton
        AlignWithMargins = True
        Left = 132
        Top = 6
        Width = 124
        Height = 45
        Margins.Bottom = 0
        Action = aCapture
        Caption = #1057#1085#1080#1084#1086#1082
        TabOrder = 0
        Glyph.Data = {
          361B0000424D361B000000000000360000002800000030000000300000000100
          180000000000001B0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEB7AC
          D6A89DD6A59CD4A59AD4A39AD5A49AD3A29AD3A39BD4A199D2A299D2A098D3A1
          98D19F98D1A099D29E97D09F97D09D97D19D97CF9C97CF9C98CF9B96D09B96CE
          9A96CE9A97CC9997CC9996CC9896CD9896CB9896CB9796CC9797CA9695CA9695
          CB9595C99595C99495C99495C99496C99496C99496C99496C99496C99496CA94
          96CB9697CC9999FFFFFFFFFFFFDDB7ABF1DACDFBEEE0FAEEDFFAEDE1FAEDE0FA
          EDE0FAEDE0FAEDE0FAEDE2FAEDE1FAEEE1FAECE1FBECE1F9ECE1F9EDE2F9EDE0
          F9EDE0F9EDE0F9EDE0F9EDE1F9EDDFF9EDDFFAECE0FAECDEFAECDDFAEBDEFAEB
          DCFAEBDDFAEADBFAEADAFAE9D8FAE9D9F9E9D8F9E8D6F9E8D5F9E8D4F9E7D5F9
          E7D3F9E6D2F9E6D1F9E6D0F9E6CFF9E6CFF4DCC7CB9697FFFFFFFFFFFFDEB5AB
          F3E1D3FFF8EBFFF7E9FFF7E9FFF7EAFFF7EAFFF7EAFFF7EBFFF7EBFFF7EBFFF7
          EBFFF7EBFFF7EBFFF7EBFFF7EBFFF7EBFFF7EBFFF7EBFFF7EAFFF7EAFFF7EAFF
          F7E9FFF7E9FFF6E8FFF6E8FFF6E7FFF5E6FFF5E6FFF5E5FFF4E4FFF4E3FFF4E2
          FFF3E1FFF3E0FFF3DFFFF2DEFFF2DDFFF1DCFFF1DBFFF1DAFFF0D9FFF0D8FFF0
          D8F9E4CDC99496FFFFFFFFFFFFDEB6ABF4E0D3FFF8EBFFF6E9FFF7EBFFF9EDFF
          F9EDFFFBEEFFFAEEFFFAEEFFFAEEFFFAEEFFFAEEFFFAEEFFFAEDFFFAEDFFFAED
          FFFAEDFFFAEEFFFAECFFF9ECFFF9EDFFF9EBFFF9ECFFF9EAFFF9EAFFF7E8FFF7
          E9FFF8E7FFF6E6FFF6E5FFF7E4FFF5E3FFF5E4FFF5E2FFF3E1FFF4DFFFF2DEFF
          F3DDFFF1DCFFF1DBFFF1D9FFEFD8FFF0D8F9E5CEC99496FFFFFFFFFFFFDFB7AB
          F4E1D4FFF7ECFFF6EAF9F1E6D3CCC9DBCECFDDCFD1DDCFD2DFD0D2DED0D3E0D1
          D5E0D1D5E1D2D6E1D2D6E2D3D7E2D3D7E4D5D7E3D4D9E5D6D9E5D6DBE7D7DBE6
          D7DBE8D8DCE9D8DDE9DADDEAD9DFEADBDFECDBDFEBDBDFEDDDE0EDDDE0EEDEE0
          EEE0E0EFE0E0F0E2E0F0E3E0F1E3E1F1E4E1F1E4DFE9DFD9FCEDDBFFEFD9FFF0
          D9F9E5CFC99496FFFFFFFFFFFFDFB7ABF4E3D5FFF9EDFFF8EBFFFAF1719F7E20
          B34022B44222B24123B34021B13F22B23E20B03B1FAF3B1EAE381CAD361BAB34
          1AAA3119A92F18A82D17A72B16A62915A52615A42413A32212A22011A11C10A0
          1B0FA1190E9F160C9B130B930D098A0B088409087D0909770A0D740E0E710F0F
          7010106F11729E76FDEFDFFFF1DAFFF0D9F9E5D0C99496FFFFFFFFFFFFE0B8AC
          F4E2D6FFF8EEFFF7ECFFFCF372A47E1CBE4222BB4622BC4621BA4421BB4320B9
          411FB93F1DB63C1CB53A1BB53718B23418B23215AF2F14AE2C14AE2911AB2710
          AA2410AA210EA81E0DA91C0AA41705970D028B05008101007900007700007500
          007300007200007000006E00006C00006B00006400679A6AFFEEE1FFF1DBFFF1
          DAF9E6D2C99496FFFFFFFFFFFFE0B9ACF4E4D8FFF8EFFFF9EDFFFBF473A37F20
          C04824BD4A24BD4923BC4822BB4621BA4420B9421FB83F1DB63D1CB53A1AB337
          19B23417B03116AF2E15AE2B13AD2913AD2611AB240B9D15038D07008100007F
          00007F00007D00007B00007900007700007500007300007100006F00006D0000
          6C00006800689C6BFFF0E2FFF2DDFFF1DBF9E6D1C99596FFFFFFFFFFFFE0B9AC
          F4E3D7FFFAF0FFF8EEFFFBF573A38020C04B26BF4E26BF4D25BE4B24BD4923BC
          4722BB4520B9421FB83F1DB63C1CB5391AB33618B13317B03116AF2F15AF2C0A
          9B15018901008400008300008200008000007F00007E00007C00007A00007800
          007600007400007200007000006F00006E00006A00689C6BFFEFE3FFF2DCFFF1
          DCF9E6D2CB9596FFFFFFFFFFFFE0BAACF5E3D8FFF9F1FFFAF1FFFBF673A48123
          C24F28C15227C05027C04F26BF4D24BD4A23BC4721BA4520B9421EB73E1DB63B
          1BB43819B3351AB43510A521018C030087000087000085000084000082000081
          00007F00007E00007C00007B0000790000770000750000730000720000710000
          7000006C00699D6AFFEFE3FFF2DDFFF2DDF9E7D4CA9696FFFFFFFFFFFFE0BBAD
          F5E5D9FFFBF2FFF9F1FFFCF672A48125C5532AC35529C25428C15227C05026BF
          4D24BD4A23BC4721BA441FB8401EB83E1DB63A1AB438089A11008B00008A0000
          8A00008800008700008500008300008100008000007F00007D00007C00007A00
          007800007600007500007400007200007100006E00679E6AFFEFE4FFF3DEFFF2
          DEF9E6D3CC9797FFFFFFFFFFFFE3BBADF5E4DBFFFAF3FFF9F2FFFCF774A48227
          C7572CC5592BC4572AC35528C15227C04F25BE4C24BD4922BB4520B9431FB841
          18B133029205008E00008C00008D00008B00007D00006E0006710F19804E2089
          6C208F6C138C3E007D00007D00007B0000790000780000770000750000740000
          7300007000679E6AFFF1E5FFF3DFFFF2DEF8E6D4CB9997FFFFFFFFFFFFE2BCAD
          F5E5DAFFFAF4FFFBF3FFFCF873A38329C95C2EC75C2DC65A2BC4582AC35528C1
          5126BF4E25BE4C24BD4824BF4813AB26009200009100009100008B0000770000
          64001B7F623EA3DC4EB3FF4DB3FF4CB1FF4DB1FF4DB1FF3BA5D5078213007C00
          007B00007900007800007700007600007500007200679E69FFF0E5FFF3E1FFF3
          DFF8E8D6CD9897FFFFFFFFFFFFE4BDADF5E7DBFFFCF5FFFAF4FFFEFA75A5842B
          CB5F2FC8612EC75D2CC55A2BC45729C25328C14F26C14E24BE490B7F14006D00
          007A00007700006C00005F00157A563CA2F244AAFF41A7FF40A6FF40A6FF40A6
          FF40A6FF41A6FF42A7FF42A8FF0B8529007B00007B00007A0000790000780000
          7800007400689F69FFF0E7FFF2E0FFF3E0FAE9D5CD9996FFFFFFFFFFFFE3BDAE
          F5E6DDFFFBF6FFFAF5FFFDFB74A4832ECE6432CB622FC85F2DC65D2BC4592AC3
          552AC6551BA938006600005E00005F00005E00016501468A4957A4D739A1FF39
          9FFF389EFF389EFF389EFF389EFF389EFF389EFF389EFF389EFF399FFF3B9FFF
          0B842E007D00007C00007B00007A00007A0000760066A169FFF0E6FFF4E2FFF3
          E0FAE8D7CE9A98FFFFFFFFFFFFE5BFAEF6E8DCFFFDF7FFFCF6FFFFFC75A5832F
          CF6531CA652FC9612EC85E2FCB5D24BD4D017E0E0C670A5D966595B5A3B6C5C8
          C1CCD6CCD1E3CED3E183B5EC2C96FF3197FF3197FF3197FF3197FF3197FF3197
          FF3197FF3197FF3197FF3197FF3298FF3399FF088429007E00007D00007C0000
          7C0000780066A068FFF0E6FFF4E1FFF3E1F9E8D6CE9C97FFFFFFFFFFFFE4C0AD
          F6E7DDFFFCF8FFFBF8FFFFFD74A58331D46835D16A31CD6321AF450583160F6B
          0E8AAA90D3D3E0CED1DBCACFD7C8CDD5C6CDD3C4CCD4C6CDD3B5C5D91F8CFF2A
          90FF2A90FF2A90FF2A90FF2A90FF2A90FF2A90FF2A90FF2A90FF2A90FF2A90FF
          2B91FF2B90FF088335007D00007E00007E00007B0066A168FFF0E8FFF4E2FFF4
          E2F9E8D8D09B97FFFFFFFFFFFFE5BFADF6E7DFFFFCFAFFFDF7FFFFFF68856700
          6300006902005C00005E00729E73D8D1DAD1CFD4CACDCFC9CCCEC9CCCEC8CCCF
          C8CCCFC8CCCFC9CCCFD1CFCF4C9AF41E87FF2288FF2288FF2288FF2288FF2288
          FF2288FF2288FF2288FF2288FF2288FF2288FF2288FF248AFF62A66B007F0000
          7B000078005F9F62FDF0E6FFF4E4FFF4E2F9EAD7CF9C99FFFFFFFFFFFFE5C0AF
          F6E8DEFFFEF9FFFCF8FFFFFF638564005B000D6C0C61965DCCCBC8D7D1D2CECD
          CACDCCCBCDCCCACCCCCACCCCCBCCCCCBCCCCCBCBCCCCCBCCCCCECDCCC4C8CF19
          81FF1A82FF1C82FF1C82FF1C82FF1C82FF1C82FF1C82FF1C82FF1C82FF1C82FF
          1C82FF0F7DFF89B1E4D5D2D9CDCFD9A1BEAAA3BFADC4C5CCF8EEE1FFF5E3FFF4
          E3F9E9D9D19D98FFFFFFFFFFFFE5C2AEF6E8E0FFFDFAFFFCF9FFFFFFA2A19ED3
          CCC3E0D2D1DBD1CED5CDC8D2CDC6D4CEC8D4CFC8D1CDC7D0CCC8D0CCC7CFCCC7
          CFCCC8CFCCC8CECCC8CECCC9D4CFC9AABBD50F78FF0F79FF147AFF147AFF147A
          FF147AFF147AFF147AFF147AFF137AFF0674FF68A0E8D5D0CBCBCCCECACDCFCC
          CDD1CCCED2C3C5C7F7EDE1FFF5E3FFF4E3F9E9D8D09F98FFFFFFFFFFFFE6C1AE
          F6E9DFFFFDFCFFFCFBFFFFFEA8A3A1DACFC3D7CDC2D7CDC2D8CFC4DCD2C8B4AD
          A6BCB5ADAEA7A1D7CEC4D3CCC3D3CCC5D4CDC5D2CCC4D2CCC6D3CCC6D2CDC6D8
          CFC6C2C4CB3384F3006BFF056FFF0971FF0B72FF0A71FF0770FF016DFF0F74FE
          91B0DBD9D0C7CECDCACDCCCACCCCCACCCCCBCCCCCCC4C5C5F7EFE0FFF5E5FFF4
          E3F9E9D8D29E98FFFFFFFFFFFFE5C2AEF7E9E1FFFDFBFFFEFAFFFFFFA6A29EDD
          CFBFDBCDBEC6B8ADBBB0A567625E716A64A0978EDDD0C3DCD0C2DACFC3DDD2C5
          CFC6BADDD1C6DFD5C8DACFC5C7BEB5D6CDC3D7CDC2E1D2C0ABB8D05993E6277B
          F41674FA1D77F84388ED86A8DAD6CEC5D8CFC4D2CDC6D1CCC6D0CCC6D0CCC7D0
          CCC7CFCCC7C5C3C4F7EDE0FFF5E4FFF4E4F9E9DAD19F9AFFFFFFFFFFFFE7C4AE
          F7EAE0FFFFFDFFFDFCFFFFFFA7A39DE2CFBADDCCBBDDCCBBAFA396CDBDADE5D4
          C3E1D1C0CCBEAF968C83C5B7AAA99D932B2B2A323130726B666D6961D9CCBFD8
          CCBED8CCBFD9CDBFDCCFBFE0D1BFE4D2BDE5D3BDE4D3BFE1D1C0DBCFC0D6CDC2
          D5CCC2D5CCC2D4CCC2D4CCC3D4CCC3D3CCC3D4CCC4C6C3C2F7EDE0FFF5E4FFF5
          E4F9EBD9D3A099FFFFFFFFFFFFE6C3AEF7E9E2FFFEFCFFFDFBFFFFFFA8A19DE5
          CFB8E1CCB6E1CDB7E3CFBAE1CDB8E1CCB7DFCCB9E2CFBBCCBBA9766C647B7369
          D0BFAEE5D3C1D3C3B1E2D1BFDDCDBBDCCCBBDCCCBBDBCCBBDBCCBCDBCCBCDACC
          BCDACCBDDACCBDD9CCBDD9CCBED9CCBED9CCBED8CCBFD8CCBFD7CCBFD7CCBFD7
          CCC0D8CCC0C8C4C0F5EDE1FFF5E6FFF5E4F9EAD9D2A299FFFFFFFFFFFFE9C4B0
          F7E9E2FFFEFEFFFDFDFFFFFFA9A19AEACFB3E4CCB2E4CCB3E4CCB3E3CCB3E3CC
          B4E4CDB5EBD2BAECD5BDEDD6BEEFD7BFDEC9B3BEAD9BE4CFB8E0CCB6E0CCB7E0
          CCB7DFCCB7DFCCB8DFCCB8DECCB8DECCB9DECCB9DDCCB9DDCCBADDCCBADCCCBA
          DCCCBBDCCCBBDCCCBBDBCCBCDBCCBCDBCCBCDBCCBDC9C2BEF5EDE3FFF5E6FFF5
          E4FBEAD9D4A199FFFFFFFFFFFFE8C6AFF7EBE1FFFEFDFFFFFCFFFFFFAAA29AEC
          CFAFE9CBB0EBCEB1E8CDB0E7CDB1EACFB2F7D9BC635A52796D62C4AE98AF9D89
          534C46EACFB6E4CCB2E4CCB3E4CCB3E3CCB3E3CCB4E3CCB4E2CCB4E2CCB5E2CC
          B5E1CCB5E1CCB6E1CCB6E0CCB6E0CCB7E0CCB7E0CCB7DFCCB8DFCCB8DFCCB8DE
          CCB8DFCCB9CBC2BCF5EDE2FFF5E5FFF5E5FAEADBD3A39BFFFFFFFFFFFFEAC5AF
          F7EAE3FFFEFDFFFEFCFFFFFFA9A098F1CFACEDCCACAF9983E9C9AAFAD8B6E7C9
          AA685E531B1C1D61574E4D47406F6358E2C6A9EBCEB1E8CCAFE8CCAFE7CCAFE7
          CCB0E7CCB0E6CCB0E6CCB1E6CCB1E5CCB1E5CCB2E5CCB2E4CCB2E4CCB3E4CCB3
          E3CCB3E3CCB4E3CCB4E3CCB4E2CCB5E2CCB5E4CCB5CCC2BAF5EDE3FFF5E5FFF5
          E5FAECDAD5A49AFFFFFFFFFFFFE9C6AFF8EAE3FFFEFDFFFEFCFFFFFFAAA097F5
          CFA8F1CDA8EBC7A56F6053312D2B19191B5F554AE3C4A3FAD7B3F8D5B2F6D3B0
          EECEACECCCABECCCABEBCCACEBCCACEBCCACEACCACEACCADEACCADE9CCADE9CC
          AEE9CCAEE8CCAEE8CCAFE8CCAFE8CCAFE7CCB0E7CCB0E7CCB0E6CCB1E6CCB1E6
          CCB1E6CDB2CCC3B8F4EDE3FFF5E5FFF5E5FAEBDAD4A69AFFFFFFFFFFFFEBC8B1
          F8EAE3FFFEFDFFFEFCFFFFFFABA195F9CFA3F3CCA5F5CEA5FCD3AAFFD6ADFFD7
          ADFDD5ACF4CFA8F1CCA6F1CCA6F0CCA7F0CCA7F0CCA7EFCCA8EFCCA8EFCCA8EE
          CCA9EECCA9EECCA9EDCCA9EDCCAAEDCCAAEDCCAAECCCABECCCABECCCABEBCCAC
          EBCCACEBCCACEACCADEACCADEACCADE9CCAEEBCDAECFC1B6F4EDE2FFF5E5FFF5
          E5FAEBDAD6A59CFFFFFFFFFFFFEAC7B0F8ECE2FFFEFDFFFFFCFFFFFFAC9F94FD
          CFA1F8CCA0F8CCA0F7CCA1F7CCA1F7CCA1F6CCA2F6CCA2F6CCA2F4CCA3F5CCA3
          F5CCA3F3CCA4F3CCA4F4CCA4F2CCA5F2CCA5F3CCA5F1CCA5F1CCA6F2CCA6F0CC
          A6F0CCA7F0CCA7F1CCA7EFCCA8EFCCA8F0CCA8EECCA9EECCA9EFCCA9EDCCAAED
          CCAAF0CDAAD0C1B4F4EDE2FFF5E6FFF5E5FAEBDAD5A69BFFFFFFFFFFFFEBC8B0
          F8EBE3FFFEFDFFFDFCFFFFFFAA9E91FCCA9BF7C99CF5C89BF5C89BF5C89DF5C8
          9CF6C89CF4C89EF4C89DF4C89DF4C89EF3C89EF3C89FF3C99FF3C99EF3C9A0F2
          C99FF2C99FF2C9A1F2C9A1F2C9A2F1C9A2F1C9A2F1C9A3F0C9A3F1CAA3EFCAA5
          EFCAA4EFCAA6EFCAA5F0CAA5EECAA7EECAA6F0CAA5CEC0B1F4EDE2FFF5E6FFF5
          E4FAEADAD7A79BFFFFFFFFFFFFEBCAB0F7EBE1FFFEFEFFFDFDFFFFFFB4B5B6B5
          B8BCB5B9BDB7BABEB6BABEB7BBBFB9BCC0B8BCC0BABDC1BCBFC2BBBEC2BDC0C3
          BEC2C5BEC1C4BFC2C5C0C4C7C0C3C6C1C5C7C3C5C7C2C5C8C3C6C8C5C6C8C4C7
          C8C6C7C9C8C8C9C7C8C9C9C9C9CACBCACACACACBCCCACCCCCBCCCECBCDCDCBCE
          CFCDD0CFCCCFCECBF8EFE2FFF4E5FFF5E4FAEADAD6A99BFFFFFFFFFFFFEBCAB2
          F9EBE1FFFFFCFFFDFBFFFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFEFFFFFDFFFFFCFFFFF9FFFFF8FFFDF7FFFEF6FFFCF5FFFCF4
          FFFDF3FFFBF1FFFCF0FFFAEFFFFAEEFFF9EDFFF9ECFFF8E9FFF6E7FFF4E5FFF5
          E4FAEADBD8A89DFFFFFFFFFFFFECCBB2F9ECE2FFFFFDFFFEFCFFFEFDFFFFFEFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFEFFFFFDFFFEFCFFFEFBFFFDFAFFFDF9FFFDF8FFFC
          F7FFFCF6FFFBF5FFFBF4FFFAF3FFFAF1FFF9F0FFF9EFFFF9EEFFF8EDFFF8ECFF
          F7EBFFF7E9FFF6E8FFF6E7FFF5E5FFF5E5FAECDAD8A99DFFFFFFFFFFFFECCDB2
          F7E7DBFCF7F2FCF6F2FCF6F1FCF7F3FCF7F4FCF7F5FCF7F5FCF7F5FCF7F5FCF7
          F5FBF7F5FBF7F5FBF7F5FBF7F5FBF7F5FBF8F5FBF6F5FBF6F4FBF7F3FBF5F3FB
          F5F2FBF6F1FBF4F0FBF5EFFBF3EEFBF3ECFCF4EBFAF2EAFAF3E9FAF1E8FAF2E9
          FAF0E7FAF1E6FAEFE5FAF0E4FAEEE3FAEFE2FAEDE1FAEEE0FBECDDFBEDDCFCED
          DDF7E4D2D9AB9DFFFFFFFFFFFFECC8ACEAC4A6E8C2A4E8C1A3E9C0A3E7C0A2E7
          BFA2E8BFA2E6BEA2E6BEA2E7BDA2E5BDA1E5BCA1E6BCA1E4BBA1E4BBA1E5BAA1
          E3BAA0E3B9A0E4B9A0E2B8A0E2B6A0E1B69FE1B79FE1B59FE0B69FE0B49FE0B5
          A0DFB39EDFB49EDFB29EDEB19EDEB29EDEB09FDDB19DDDAF9EDDB09EDCAE9EDC
          AF9EDCAD9FDBAE9DDBAC9DDAAD9EDAAC9EDAAD9FDBAFA1FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        LookAndFeel.SkinName = 'Office2007Green'
      end
      object cbCleanData: TcxCheckBox
        Left = 3
        Top = 126
        Caption = #1054#1095#1080#1097#1072#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1087#1086#1089#1083#1077' '#1086#1090#1087#1088#1072#1074#1082#1080
        ParentShowHint = False
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        ShowHint = True
        State = cbsGrayed
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.SkinName = 'Black'
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.SkinName = 'Black'
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.SkinName = 'Black'
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.SkinName = 'Black'
        TabOrder = 1
        Transparent = True
        Width = 192
      end
      object cbCheckedImages: TcxCheckBox
        Left = 3
        Top = 142
        Caption = #1088#1072#1073#1086#1090#1072#1090#1100' '#1089' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1084#1080
        ParentShowHint = False
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        ShowHint = True
        State = cbsGrayed
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.SkinName = 'Black'
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.SkinName = 'Black'
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.SkinName = 'Black'
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.SkinName = 'Black'
        TabOrder = 2
        Transparent = True
        Width = 159
      end
      object cxButton2: TcxButton
        AlignWithMargins = True
        Left = 5
        Top = 6
        Width = 124
        Height = 45
        Margins.Bottom = 0
        Action = aDelChecked
        TabOrder = 3
        LookAndFeel.SkinName = 'Office2007Green'
      end
      object cxButton3: TcxButton
        AlignWithMargins = True
        Left = 132
        Top = 52
        Width = 124
        Height = 36
        Margins.Bottom = 0
        Action = aStopCapVideo
        TabOrder = 4
        LookAndFeel.SkinName = 'Office2007Green'
      end
      object cxButton4: TcxButton
        AlignWithMargins = True
        Left = 5
        Top = 52
        Width = 124
        Height = 36
        Margins.Bottom = 0
        Action = aStartCapVideo
        TabOrder = 5
        LookAndFeel.SkinName = 'Office2007Green'
      end
      object cxButton5: TcxButton
        AlignWithMargins = True
        Left = 132
        Top = 91
        Width = 124
        Height = 32
        Margins.Bottom = 0
        Action = aSetHotKeys
        TabOrder = 6
        LookAndFeel.SkinName = 'Office2007Green'
      end
      object cxButton6: TcxButton
        AlignWithMargins = True
        Left = 5
        Top = 91
        Width = 124
        Height = 32
        Margins.Bottom = 0
        Action = aChngRejim
        TabOrder = 7
        LookAndFeel.SkinName = 'Office2007Green'
      end
    end
    object cxPageControl2: TcxPageControl
      Left = 2
      Top = 2
      Width = 259
      Height = 279
      ActivePage = cxTabSheet3
      Align = alClient
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 2
      ClientRectBottom = 273
      ClientRectLeft = 3
      ClientRectRight = 253
      ClientRectTop = 26
      object cxTabSheet1: TcxTabSheet
        Caption = #1055#1072#1094#1080#1077#1085#1090
        ImageIndex = 0
        object cxLabel4: TcxLabel
          Left = 0
          Top = 35
          Caption = 'N '#1084#1077#1076#1082#1072#1088#1090#1099':'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cxLabel5: TcxLabel
          Left = 0
          Top = 62
          Caption = #1055#1086#1083' (M = male F = female O = other):'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cxLabel6: TcxLabel
          Left = 0
          Top = 86
          Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076'.:'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cxlbl1: TcxLabel
          Left = 0
          Top = 9
          Caption = #1055#1072#1094#1080#1077#1085#1090':'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object dtP_DATEBORN: TcxDateEdit
          Left = 74
          Top = 86
          ParentFont = False
          Properties.DateButtons = [btnToday]
          Properties.DateOnError = deToday
          Properties.ImmediatePost = True
          Properties.PostPopupValueOnTab = True
          Properties.SaveTime = False
          Properties.ShowTime = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.SkinName = 'Black'
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.SkinName = 'Black'
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.SkinName = 'Black'
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.SkinName = 'Black'
          TabOrder = 4
          Width = 165
        end
        object teP_ENAME: TcxTextEdit
          Left = 71
          Top = 6
          Style.BorderStyle = ebsNone
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.SkinName = 'Office2007Green'
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.SkinName = 'Office2007Green'
          TabOrder = 5
          Width = 168
        end
        object teP_PID: TcxTextEdit
          Left = 71
          Top = 32
          Properties.OnChange = teP_PIDPropertiesChange
          Style.BorderStyle = ebsNone
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.SkinName = 'Black'
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.SkinName = 'Black'
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.SkinName = 'Black'
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.SkinName = 'Black'
          TabOrder = 6
          Width = 168
        end
        object teP_SEX: TcxComboBox
          Left = 194
          Top = 59
          Properties.Items.Strings = (
            'M'
            'F'
            'O')
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.SkinName = 'Black'
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.SkinName = 'Black'
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.SkinName = 'Black'
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.SkinName = 'Black'
          TabOrder = 7
          Text = 'M'
          Width = 45
        end
      end
      object cxTabSheet2: TcxTabSheet
        Caption = #1048#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1077
        ImageIndex = 1
        object cxLabel1: TcxLabel
          Left = 1
          Top = 174
          Caption = 'STUDYUID:'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cxLabel2: TcxLabel
          Left = 195
          Top = 117
          Caption = ':'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cxLabel22: TcxLabel
          Left = 1
          Top = 147
          Caption = 'ACCESSIONNUMBER:'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cxLabel23: TcxLabel
          Left = 1
          Top = 38
          Caption = #1042#1088#1072#1095':'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cxLabel24: TcxLabel
          Left = 1
          Top = 8
          Caption = 'MODALITY:'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cxLabel26: TcxLabel
          Left = 1
          Top = 117
          Caption = #1042#1088#1077#1084#1103' '#1085#1072#1095#1072#1083#1072' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103':'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cxLabel28: TcxLabel
          Left = 1
          Top = 92
          Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103':'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cxLabel29: TcxLabel
          Left = 1
          Top = 197
          Caption = #1054#1087#1080#1089#1072#1085#1080#1077':'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cxLabel30: TcxLabel
          Left = 1
          Top = 65
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1088#1072#1073'.'#1089#1090#1072#1085#1094#1080#1080':'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object deStartDateWorklist: TcxDateEdit
          Left = 158
          Top = 92
          ParentFont = False
          Properties.DateButtons = [btnToday]
          Properties.DateOnError = deToday
          Properties.ImmediatePost = True
          Properties.PostPopupValueOnTab = True
          Properties.SaveTime = False
          Properties.ShowTime = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.SkinName = 'Office2007Green'
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.SkinName = 'Office2007Green'
          TabOrder = 3
          Width = 88
        end
        object seHour: TcxSpinEdit
          Left = 154
          Top = 117
          Properties.AssignedValues.MinValue = True
          Properties.MaxValue = 23.000000000000000000
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.SkinName = 'Office2007Green'
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.SkinName = 'Office2007Green'
          TabOrder = 4
          Width = 34
        end
        object seMin: TcxSpinEdit
          Left = 210
          Top = 117
          Properties.AssignedValues.MinValue = True
          Properties.MaxValue = 59.000000000000000000
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.SkinName = 'Office2007Green'
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.SkinName = 'Office2007Green'
          TabOrder = 5
          Width = 36
        end
        object teAccessionNumber: TcxTextEdit
          Left = 111
          Top = 144
          Style.BorderStyle = ebsNone
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.SkinName = 'Office2007Green'
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.SkinName = 'Office2007Green'
          TabOrder = 6
          Width = 135
        end
        object teModality: TcxComboBox
          Left = 76
          Top = 5
          Properties.Items.Strings = (
            ''
            'CT'
            'CR'
            'DR'
            'OT'
            'US'
            'XA'
            'VR'
            'MR'
            'MG'
            'NM'
            'SC'
            'DX'
            'ES')
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.SkinName = 'Office2007Green'
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.SkinName = 'Office2007Green'
          TabOrder = 0
          Width = 61
        end
        object tePhysiciansName: TcxTextEdit
          Left = 75
          Top = 35
          Style.BorderStyle = ebsNone
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.SkinName = 'Office2007Green'
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.SkinName = 'Office2007Green'
          TabOrder = 1
          Width = 171
        end
        object teProcDescription: TcxTextEdit
          Left = 1
          Top = 217
          Style.BorderStyle = ebsNone
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.SkinName = 'Office2007Green'
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.SkinName = 'Office2007Green'
          TabOrder = 8
          Width = 245
        end
        object teStationName: TcxTextEdit
          Left = 154
          Top = 62
          Style.BorderStyle = ebsNone
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.SkinName = 'Office2007Green'
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.SkinName = 'Office2007Green'
          TabOrder = 2
          Width = 92
        end
        object teStudyUID: TcxTextEdit
          Left = 65
          Top = 171
          Enabled = False
          Style.BorderStyle = ebsNone
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.SkinName = 'Office2007Green'
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.SkinName = 'Office2007Green'
          TabOrder = 7
          Width = 181
        end
      end
      object cxTabSheet3: TcxTabSheet
        Caption = 'WorkList'
        ImageIndex = 2
        object cxButton7: TcxButton
          AlignWithMargins = True
          Left = 5
          Top = 3
          Width = 76
          Height = 21
          Margins.Bottom = 0
          Action = aWLRefresh
          TabOrder = 0
          LookAndFeel.SkinName = 'Office2007Green'
        end
        object cxButton8: TcxButton
          AlignWithMargins = True
          Left = 87
          Top = 3
          Width = 106
          Height = 21
          Margins.Bottom = 0
          Action = aWLCheck
          TabOrder = 1
          LookAndFeel.SkinName = 'Office2007Green'
        end
        object cxGr: TcxGrid
          Left = 0
          Top = 27
          Width = 250
          Height = 220
          Align = alBottom
          TabOrder = 2
          LookAndFeel.Kind = lfOffice11
          LookAndFeel.NativeStyle = False
          LookAndFeel.SkinName = 'Black'
          object TV: TcxGridTableView
            NavigatorButtons.ConfirmDelete = False
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Kind = skCount
                Column = VAccessionNumber
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.CellHints = True
            OptionsBehavior.IncSearch = True
            OptionsCustomize.ColumnsQuickCustomization = True
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.Footer = True
            OptionsView.Indicator = True
            object vPatientName: TcxGridColumn
              Caption = #1060#1048#1054
              Width = 159
            end
            object VPatientBirthDate: TcxGridColumn
              Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076'.'
              Width = 77
            end
            object VPatientID: TcxGridColumn
              Caption = #8470' '#1052#1050
              Visible = False
              Width = 50
            end
            object VAccessionNumber: TcxGridColumn
              Caption = #1053#1086#1084#1077#1088' '#1087#1088#1086#1090#1086#1082#1086#1083#1072
              Visible = False
              Width = 200
            end
            object VPatientSex: TcxGridColumn
              Caption = #1055#1086#1083
              Visible = False
              Width = 69
            end
            object VStudyInstanceUID: TcxGridColumn
              Caption = 'StudyUID'
              Visible = False
              Width = 100
            end
            object VModality: TcxGridColumn
              Caption = #1052#1086#1076#1072#1083#1100#1085#1086#1089#1090#1100
              Visible = False
              Width = 20
            end
            object VStationAETitle: TcxGridColumn
              Caption = 'AETitle '#1089#1090#1072#1085#1094#1080#1080
              Visible = False
              Width = 51
            end
            object VScheduledProcedureStepStartDate: TcxGridColumn
              Caption = #1044#1072#1090#1072' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103
              Visible = False
              Width = 50
            end
          end
          object cxGrLevel1: TcxGridLevel
            GridView = TV
          end
        end
      end
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 554
    Width = 792
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object CaptureView: TDCMMultiImage
    Left = 414
    Top = 0
    Width = 109
    Height = 516
    AutoChangeSeriesMode = True
    AutoGrid = True
    CanDelete = False
    GridVisible = True
    ViewGridSetting = '1,2'
    LeftMouseInteract = miNone
    ShowSeriesDescription = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Align = alRight
    Color = clCream
    ParentColor = False
    TabOrder = 2
    Bitmaps = <>
    Row = 1
    Column = 4
    OnClick = CaptureViewClick
    OnDblClick = CaptureViewDblClick
    DicomDatasets = CnsDMTable1
    ViewGridMode = vgmStandardGrid
  end
  object Panel2: TPanel
    Left = 0
    Top = 516
    Width = 792
    Height = 38
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    object SpeedButton1: TSpeedButton
      Left = 369
      Top = 10
      Width = 23
      Height = 22
      OnClick = SpeedButton1Click
    end
    object cbVModes: TComboBox
      Left = 6
      Top = 10
      Width = 138
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = cbVModesChange
    end
    object Button2: TButton
      Left = 147
      Top = 8
      Width = 48
      Height = 25
      Caption = 'Conf.Gr.'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button1: TButton
      Left = 200
      Top = 8
      Width = 48
      Height = 25
      Caption = 'SaveGr.'
      TabOrder = 2
      OnClick = Button1Click
    end
    object lbDialogs: TComboBox
      Left = 253
      Top = 10
      Width = 111
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
    end
    object cbNastr: TCheckBox
      Left = 406
      Top = 12
      Width = 131
      Height = 17
      Caption = #1087#1086#1082#1072#1079#1072#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '
      TabOrder = 4
      OnClick = cbNastrClick
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 406
    Top = 0
    Width = 8
    Height = 516
    HotZoneClassName = 'TcxXPTaskBarStyle'
    HotZone.SizePercent = 58
    AlignSplitter = salRight
    Control = CaptureView
  end
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 0
    Width = 406
    Height = 516
    ActivePage = TSVIDOECAPTURE
    Align = alClient
    HideTabs = True
    TabOrder = 9
    ClientRectBottom = 516
    ClientRectRight = 406
    ClientRectTop = 0
    object TSVIDOECAPTURE: TcxTabSheet
      ImageIndex = 0
      object cap: TDicomVideoCapture
        Left = 0
        Top = 0
        Width = 406
        Height = 516
        DVResolution = dvrDontWorry
        WantBitmaps = True
        BitmapPixelFormat = pf24bit
        WantAudio = False
        WantDVAudio = True
        WantAudioPreview = False
        WantPreview = True
        WantCapture = True
        UseFrameRate = False
        FrameRate = 25.000000000000000000
        CaptureFileName = 'capture.avi'
        UseTempFile = True
        TempCaptureFileName = 'captemp.avi'
        UseTimeLimit = True
        TimeLimit = 30
        DoPreallocFile = False
        PreallocFileSize = 1
        OnChangeDevice = capChangeDevice
        OnCaptureProgress = capCaptureProgress
        OnStopPreview = capStopPreview
        OnStartPreview = capStartPreview
        OnBitmapGrabbed = capBitmapGrabbed
        OnFrameRendered = capFrameRendered
        Align = alClient
        Color = clBlack
      end
    end
    object TSSHOW: TcxTabSheet
      ImageIndex = 1
      object Panel3: TPanel
        Left = 0
        Top = 495
        Width = 406
        Height = 21
        Align = alBottom
        TabOrder = 0
        object Button3: TButton
          Left = 482
          Top = 2
          Width = 104
          Height = 17
          Caption = #1056#1077#1078#1080#1084' capture'
          TabOrder = 0
          OnClick = Button3Click
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 406
        Height = 495
        Align = alClient
        TabOrder = 1
        object DicomMultiVIewer1: TDicomMultiViewer
          Left = 1
          Top = 1
          Width = 404
          Height = 493
          DisplayLabel = True
          DisplayWLLabel = True
          DisplayRuler = True
          DisplayRightRuler = True
          DisplayBottomRuler = True
          TextOverlayMode = False
          UpdateAllImageProperty = True
          CanMultiSelect = True
          WhiteGrid = False
          MultiViewMode = mvmSTANDARDView
          AutoGrid = False
          ScrollBarVisible = True
          CanCheckSize = True
          Align = alClient
          Color = clBlack
          TabOrder = 0
          CurrentImage = 0
          Columns = 1
          Rows = 1
          DicomDatasets = CnsDMTable2
        end
      end
    end
  end
  object Timer: TTimer
    Enabled = False
    Interval = 200
    OnTimer = TimerTimer
    Left = 123
    Top = 251
  end
  object al: TActionList
    Left = 404
    Top = 64
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091
      ShortCut = 27
      OnExecute = aCloseExecute
    end
    object aAttach: TAction
      Caption = #1055#1088#1080#1082#1088#1077#1087#1080#1090#1100
      Hint = #1042#1089#1090#1072#1074#1080#1090#1100' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1103' '#1074' '#1086#1089#1084#1086#1090#1088
      ShortCut = 113
      Visible = False
      OnExecute = aAttachExecute
    end
    object aSend: TAction
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
      Hint = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1074' '#1093#1088#1072#1085#1080#1083#1080#1097#1077' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1081
      OnExecute = aSendExecute
    end
    object aCapture: TAction
      Caption = #1047#1072#1093#1074#1072#1090
      Hint = #1047#1072#1093#1074#1072#1090' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1103
      ShortCut = 13
      OnExecute = aCaptureExecute
    end
    object aSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      OnExecute = aSaveExecute
    end
    object aStartCapVideo: TAction
      Caption = #1057#1090#1072#1088#1090' '#1079#1072#1093#1074#1072#1090#1072' '#1074#1080#1076#1077#1086
      OnExecute = aStartCapVideoExecute
    end
    object aStopCapVideo: TAction
      Caption = #1057#1090#1086#1087' '#1079#1072#1093#1074#1072#1090#1072' '#1074#1080#1076#1077#1086
      OnExecute = aStopCapVideoExecute
    end
    object aChngRejim: TAction
      Caption = #1091#1089#1090'/'#1089#1085#1103#1090#1100' '#1075#1086#1088'.'#1082#1083#1072#1074#1080#1096#1080
      OnExecute = aChngRejimExecute
    end
    object aPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1100' '#1089#1085#1080#1084#1082#1086#1074' ('#1074#1080#1076#1077#1086' '#1085#1077' '#1087#1077#1095#1072#1090#1072#1077#1090#1089#1103')'
      OnExecute = aPrintExecute
    end
    object aDelChecked: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1077
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1077' '#1089#1085#1080#1084#1082#1080'/'#1074#1080#1076#1077#1086
      OnExecute = aDelCheckedExecute
    end
    object aSetHotKeys: TAction
      Caption = 'HotKeys'
      OnExecute = aSetHotKeysExecute
    end
    object aWLRefresh: TAction
      Caption = #1055#1086#1080#1089#1082
      OnExecute = aWLRefreshExecute
    end
    object aWLCheck: TAction
      Caption = #1042#1099#1073#1086#1088' '#1087#1072#1094#1080#1077#1085#1090#1072
      OnExecute = aWLCheckExecute
    end
  end
  object BM: TdxBarManager
    AllowReset = False
    AutoDockColor = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Categories.Strings = (
      #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102)
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    DockColor = clBtnFace
    LookAndFeel.SkinName = 'Office2007Green'
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 488
    Top = 56
    DockControlHeights = (
      0
      0
      0
      0)
    object BMBar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Main'
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 192
      FloatTop = 33
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbAttach'
        end
        item
          Visible = True
          ItemName = 'bbSend'
        end
        item
          Visible = True
          ItemName = 'dxBarLargeButton1'
        end
        item
          Visible = True
          ItemName = 'dxBarLargeButton2'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbClose'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object bbAttach: TdxBarLargeButton
      Action = aAttach
      Category = 0
      AutoGrayScale = False
      HotGlyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF84615086615084604F84604F84604F84604F84604F83604F8360
        4F83604F835F4E825F4E825F4E815F4E815E4D805E4D805D4E7F5D4C7F5D4D7E
        5C4B7E5C4C7D5B4B7E5D4D7B5B4BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF856150F8E4D3F2DECCF2DECCF2DECCF2DECCF2DECCF2DECCF2DE
        CCF2DFCCF2DDCCF2DDCBF2DDCBF2DECAF2DCCAF2DCC7F3DBC7F1DAC4F1D9C2F2
        D8C0F0D7BEF1D6BDF5D9BD7C5B4BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF866150FFFDF2FAF4E8F2EBE2D0CAC2D8D2C9E0D9D0E8E2D9F1EA
        E0F9F3E7FAF2E8FAF2E7FAF2E7FAF3E6FAF1E6FAF2E5FAF2E4F9F1E2F9F0E0F9
        EFDEF8ECDBF9EDD9F4DCC47B5A49FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF866150FFFEF5FBF6EADDD8D0AAA7A2A09C98AEAAA4BAB6AFBEB9
        B1BFBBB2C6C0B9CFC9C0D8D2C9E0DBCFE9E2D9F2EADFFBF3E5FAF2E5FAF1E5F9
        F0E1F9EFE0FAF0DEF4DEC67D5B4AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF876351FFFEF7FBF5ECBEBAB38283828FBEBE829696807C7B8D88
        869C9794ACA8A2B9B5ADBCB8AFBDB8B0BEB9B0BEB9B0C1BBB2DFD8CEFAF2E6FA
        F2E6FAF1E2FAF0E1F3DFC97C5B4AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF886251FFFFF7F1EBE3938F8D95C7C7A3FFFF9EFFFF9BFFFF96E1
        E18FB8B88391917A77768985839B9692ADA9A2BBB6AEBDB8AFF0E9DEFBF3E7FA
        F3E6FAF2E5FBF3E4F5E0CC7D5C4BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF896352FFFFFAD3CFC9848B8BA8FBFBA1F6F69DF9F99AFDFD9EFF
        FFA8FFFFB2FFFFB8FFFFABDDDD99B4B4838C8C777474898684BFBBB5E4DED4FA
        F2E6FBF3E6FBF4E7F4E2CE7E5B4CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF8A6453FFFFFAAAA7A49DC9C9A9F8F8A4F7F79FFBFB9CFDFD9AFF
        FFA2FFFFA9FFFFB2FFFFBAFFFFC3FFFFCDFFFFCEFFFFB7D7D79BAEAE7C7F7F82
        807FF6EEE3FCF5E8F6E3D2805D4BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF84604FCACAC76C6C6C87BDBD8BCACA8AD2D28EDCDC90EAEA94F6
        F6A0FFFFA8FFFFAEFFFFB4FFFFBBFFFFC1FFFFC6FFFFCDFFFFD8FFFF828A8ACF
        CAC3FBF4E8FCF4E9F5E4D37F5C4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        F9F9F9A1A1A15554535252524F4D4D4D47474942424A4C4C4D5D5D5672725B86
        8665A1A17AC2C28CD7D7A0EBEBB5FFFFBAFFFFBFFFFFC5FFFF9FBEBEA19D9AFB
        F5EAFBF4E9FCF6EAF5E4D2805E4CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE
        92929262626273605894929297B5B59EC8C89CC1C19DB8B896A6A68586867168
        685C5252473E3E4C55556283837FBABAA8F1F1B8FFFFB8FCFC7B7777F0EAE2FB
        F5EBFBF5EAFCF5EBF5E4D3825D4CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDC
        707070CCCCCC8F67549B9797B2E4E4B0EDEDAEF0F0ABF5F5A8F9F9A4FFFF9DF7
        F794E0E08BC3C36E88884D45454E4E4E79B2B2B5FFFF8FAEAEBDB9B5FCF6EEFC
        F6ECFBF5EBFCF5ECF5E4D4815F4EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7C7C7
        878787FAFAFA926D5C8D9090B7EBEBAEE5E59ED7D79FE0E0A2EAEAA4F3F3A3FA
        FAA3FFFFA1FFFFA1FFFF90ECEC575353648181ABFFFF7F7B7BF5F0EAFCF7EFFC
        F6EDFBF5ECFCF7EDF5E5D6835E4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2D2D2
        8B8B8BF4F4F48F726598A4A4B9EAEA94B2B26F7E7E6F86866D89896A8E8E6B95
        956B9B9B6A9C9C689494657E7E5E545483C3C391C7C7B5B1AFFCF8F1FCF7EFFC
        F6EEFCF6EDFCF6EDF5E5D583604DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEE
        949494C7C7C7936A56A0B1B1BAE7E78D9C9C7F7D7D837E7E898282928C8C968E
        8E8C8484827979776D6D706F6F83B2B29EFFFF818E8EE8E4DFFCF8F1FCF7F0FC
        F7EFFCF6EDFCF6EEF5E5D7845F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        C9C9C98D8D8D946C57A9BBBBBAE0E0B9E5E5B6EBEBB3EEEEAEE8E8A6E1E1A2DD
        DD9DDBDB9DDFDF9FEEEEA3FFFFA2FEFE9BF4F4958E8DFCF8F3FCF8F2FCF8F1FC
        F7EFFCF6EEFDF8EFF7E6D6845F4EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFE5E5E591827CB0C2C2BCDDDDB8DEDEB5E0E0B3E3E3B0E5E5AFE9E9ABEB
        EBAAEEEEA8F1F1A5F1F1A4F2F2A3F8F896CCCCB5B1B0FDF9F4FDF9F3FCF8F1FC
        F7F0FCF7EFFDF7EFF6E6D885614EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF978983B5C7C7BEDBDBBADCDCB8DEDEB5E0E0B3E3E3B1E5E5AEE7
        E7ACE9E9AAEBEBA8EDEDA7EFEFA6F5F591B3B3CCC9C7FDFAF5FDF9F3FCF8F2FC
        F8F1FCF7EFFDF7F0F6E6D8856050FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF9B8E88B9C6C6C4DDDDC0DEDEBDE1E1BBE3E3B7E4E4B5E6E6B2E7
        E7B0E9E9AEEBEBADECECAAEEEEACF4F48EA1A1DFDDDAFDFAF5FDF9F4FDF9F2FC
        F8F1FCF7EFFDF7F0F6E6D786604FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFA4928AA7A6A69A9999969797979A9A99A1A19CA8A89EB0B09FB7
        B7A2BFBFA4C8C8A5D1D1A8DBDBADEBEB8C9696EBE9E6FDFAF6FDF9F4FDF9F3FC
        F8F1FDF8F1FDF8F1F7E7D9866150FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF99705AFFFFFFFDFDFDF9F9F9F2F1F1E9E9E9E1E1E1D7D7D7CFCE
        CEC7C6C6BEBCBCB4B2B1ABA7A7A09C9C999797F4F3EFFFFDF9FFFDF7FEFBF7FD
        F8F3F9F5EDF5F0E8E9D6C8886452FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF9A6F5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFEFEFEFEFDFCFEFCFAFFFDFBE6DCD7D9CBC2E0D3CCDACCC5D5
        C5BEC8B6ADBBA49A977565A98F83FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF9B705BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFEFEFDFEFDFCFEFCFAFFFFFFBBA295A18072A78978A5836FA3
        7F67B08866936C54A5887BF8F6F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF9C725DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFEFEFEFEFEFDFEFDFCFEFCFAFFFFFFCBB7ADC5AD9FFFF5E0F9E1BBF8
        D69CC59E6EA6897DFAF7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF9E725CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFEFEFEFEFEFEFEFDFCFEFDFBFEFCFAFFFFFCCCBAB0BEA18BF6DFB8F3CF96C0
        986A9E8074F9F6F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF9C725CFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
        FEFEFEFEFEFDFDFEFDFCFEFCFAFEFCF9FFFEFCD7C9C1B28D72F6D39AC89F6EA1
        8377F8F5F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF9D715DFFFFFFFEFEFDFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFEFE
        FEFEFDFDFEFDFCFEFCFBFEFCFAFDFBF8FFFFFBD3C2B9B7906ACBA16FA28276F8
        F5F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF9B715BFFFFFFFEFDFCFEFDFDFEFEFDFEFEFDFEFEFDFEFEFDFEFD
        FCFEFDFCFEFCFBFEFCFAFDFBF9FDFBF7FFFEFBCEBAB1A2795AA18171F5F1EFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF9C715DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB39789A28172F7F2F1FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF9A715D9D725F9B715D9C715D9A715D9A715D99705B98705C986F
        5A976D5B966E59956C5A946B59936A58936C59AD9184F6F2F0FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object bbSend: TdxBarLargeButton
      Action = aSend
      Category = 0
      AutoGrayScale = False
      HotGlyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDD7D7D7ADADAD9A9A9A87878771
        71716B6B6B6C6C6C7E7E7EB7B7B7FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDC7C7C7DFDFDFECECECDFDFDFA4A4A486
        8686838383828282717171555555B5B5B5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCE7E7E7FFFFFFF6F6F6AAAAAA79797961
        61617777778D8D8D8D8D8D7F7F7FE2E2E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFE7E7E7D2D2D281
        81816C6C6CD4D4D4D9D9D9F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFD0D0D0C5C5C5C4C4C4BEBEBEDCDCDCD3D3D387
        8787A4A4A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFBFBFBCECFCF9D9D9D8E8E8E83838376767675757577
        77778484849B9B9BA1A1A1A6A6A6AFAFAFBBBBBBDFDFDFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFECECECD9DADAA5A8AAA9B1B9ACB5BFAEB6BFAAB2BAA7
        AEB6A4AAB1A2A8AFA1A6ACA0A5AA9DA0A49A9C9D808181FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFE6E6E6DBDCDD9C9E9DDA8021D68D3EDA9850DA9E5EDB
        A36AD9A671D4A879CFAA7FCBA986C7A887BBB7B4828384FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFDEDEDEDCDEE0A29C94E38929DD8F39DE903BDD903ADE
        8E39DD8C34DD872EDB8326DA7D1CDA7003C4B6A9888A8CFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFD9D9D9DEE1E4A99B8BE5963DE0994BE19B4EE19C4EE1
        9B4DE09A4ADE9546DC903FDA8B37DD7E1ABEBEBE949496FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFD3D3D3E0E3E7B09B83E89F4EE4A359E5A55EE5A65DE5
        A55CE4A258E29E52E0994ADD9341DF8725BAC3CB9D9D9DFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFCFCFCFE2E5EAB59C7DECA85DE8AE67E9B16BEAB06CE9
        AF6CE8AD67E6A860E3A257E09A4CE2933CB0BBC5AAAAAAFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD6C7C7A185859F8C8CAC9999C0B3B3D6CFCFEFECECFEFEFEFFFF
        FFFFFFFFFFFFFFFFFFFFCECECEDFE4E9BD9D77F0B26AECB676EDBA7BEEBC7BED
        B979ECB573E9AF6CE6A862E4A054E5A054A8B1BAB8B8B8FFFFFFFFFFFFFFFFFF
        FFFFFFE3D4D4B38383C28D8D966262996363935F5F8A5B5B825959866262947A
        7A9F9393B3ACACD4D2D2DBDBDBD8DDE3C6A077F1B977F0C083F3C588F2C58BF1
        C488F0C48BECB877E9B06BE6A65AE6AB6A9DA3ACC7C7C7FFFFFFFFFFFFFFFFFF
        EADADAB48282D5A1A1BF8D8D9869699C6C6C9B69699C6868996666956060915B
        5B8D55559A70708E9A838BC68BD6DADFD0A878F4C181F3C88EF7CE98F6D09BF7
        D4A4CAC793F1C38AEBB572E9AA60E2B17892979FD7D7D7FFFFFFFFFFFFE9DCDC
        B68888D7AAAAD2A4A8C3979E9972799C747B9E71769C6F729B6B6D9969699764
        64B28E8E85A6710D96106DBE6DD2D5D9E0B075FBC784FDD095FFDBA4FFE5B5DA
        D9AD3F872EFBD8ADF5BA71F3AE5EDAAB788A8E94E3E3E3FFFFFFFFFFFFB08888
        DDB5B6D6B1B7D6A496CE7725BB6B29B57040AF7254A774669D7377997181BDA3
        AB64A15A1BB2294DE6726AB76ADCDDDFC3B8ABC6BDB1C8C1B7CFCBC5B5C7B11C
        771C337F32C9C6C2A9A5A0A8A39DA9A7A4959698F2F2F2FFFFFFFFFFFFB48F8F
        DFC1C7D7A48DCF6300D28D53C06C21C96A0CCF6500D76800DE7B16DFB2694A97
        2533C94C63FE9646DD6834933480BA818BBE8C8EBC8F80B5815098500C7A0E10
        A418528F52D2D4D4C2C4C5C4C4C6BBBCBCC7C7C7FEFEFEFFFFFFFFFFFFB3969C
        E5B496DB7E1BDDB8B3D1AFC4A18FA4A38FA4A28CA2B29BADB0BAA1239C1D50E9
        7866FF9A59F28450E9783AD1572DC04424B4361FAC2D1CAA2A1DB42E1BBC2A0C
        981292BB92FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB937F
        F2AA5EE4CFD8DA9C70D16D00C86502C66E1BC9864D9BB16D18A91B64FD976CFF
        A15EF78E55EE804EE77547E16B41DB6139D35532CC4A29C33D20BB3119B82608
        7C08DBEADBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBA9B92
        EFDFE6D78A41D27517DBA68DBA8257C07B40D2925774AB4034D04D74FFB067FF
        9A5CF58B54ED7F4DE67345DE683DD65C35CE502EC74526BF391EBA3015AE2247
        9347FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8A09E
        ECA050E2A267EEE8FCDFB8BAAFA6B5B0ABBFADA5BBC8C1D05FB86135D2516FFF
        A75EF78C54ED7E4CE57244DD673DD65B35CE4F2FC84428C23B21C0310C7B0ED3
        E7D3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB967D
        F8D7BDEFE9F2D58334D06600CE5400CF5C00CC6400CB6F0DDCAA735AAB3A3CD6
        5A64FD9854ED7F4FE87649E36C41DB6038D45633D04D23BC350E7F0FAED3AEFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBCB3BC
        F7DCC8D46D03DD9956E8C5C7BBA69CC09C86C0916DC28955C4823EDCB07C50A2
        2D3ED55C5DF78C3ED55E1DAB2A20AE2F17A0230E8B1351A251D5EBD5FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBA9A86
        EF9D47F1D8C4F7F5FFE9C4C7BCB7BABEB4B8BBAFB5B8AAB1B2A2ABB09CA7CABF
        C440A03E3FD7603DD05A6DB56DBCDFBCCBE7CBF3F9F3FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBCACA2
        FFFFFFFBF7FBF5EDEEEAC7C7BFBCBCC2B8B8BDB0B0BBA9A9B6A3A3B29A9AB097
        97C8BBB6379B3226B83A8DCE8DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBCB6B8
        FFFFFFF6F2F2F2EAEAEAC8C8BDC1C1BCBABAB8B0B0B6AAAAB3A2A2B09A9AAE94
        94AE9090C4BAB32F942A8CD08CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDB7B7
        FFF7F7F7E1E1FCD3D3FDD3D3FBD1D1F8CCCCF4CACAEFC5C5E3B9B9D1A7A7C198
        98B58C8CB08A8AB9A79FB7E1B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFABA4A4
        DBC3C3FFE9E9FEF5F5F9EEEEF5E5E5EFDCDCECD5D5E7CDCDE5C6C6E5C2C2D4AD
        ADBC8F8FC09797DCC4C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAD7D7
        CDCBCBC4C1C1BEBABABDB5B5BAB0B0BAAAAAB9A4A4B69D9DB39696B79D9DD0C0
        C0F4EFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object bbClose: TdxBarLargeButton
      Action = aClose
      Category = 0
      AutoGrayScale = False
      HotGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000120B0000120B0000000100000000000000000000FFFF
        FF00FF00FF004E1E1F00BF4C4D00BD4B4C00C04D4E00C14E4F00C4505100C24F
        5000C5515200B64B4C00C9545500C7535400C6525300CA555600CB565700CE58
        5900CC575800C5545500D05A5B00CF595A00D35C5D00D15B5C00D55E5F00D45D
        5E00D8606200D75F6000AF4E4F00D9626300DD656600DC646500DA636400E067
        6800DE666700E2696A00E1686900E56B6C00E36A6B00E96E6F00E76D6E00E66C
        6D009F4B4C00EA6F7000A04C4D00EB707200A34E4F00EE737400ED7273009C4B
        4C00F2767700F0757600EF747500E06D6E00A6515200F6797A00F4787900F377
        7800A9535400F87B7D00F77A7B00FB7E7F00FA7D7E00AF585900AC5657009A4D
        4E00FF818200FE808100FC7F8000F77E7F00B25B5C00EE7A7B00D56F7000B860
        6200B6626300AF5E5F00FE8B8C0091515200FC929300EF909100FB9A9C00E690
        9100EB959600FAA3A400F8AAAB00F2A9AA00EEA6A700F7B5B600A5505000994B
        4B00AB555500B15A5A00B55D5D00B75F5F00914B4B00BB636300BF666600BD65
        65008C4B4B00894B4B009F58580098555500824B4B00EB9C9C00F7B1B100EECE
        AF00FFFFD300D9F6BD00B7EBAA0058A55B003F9E4C005ED3770045CA67001EBC
        4C00000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000020202020202
        02020202026603020202020202020202020202020202020202026666625E0302
        020202020202020202020202020202666663310B052A03020202020202020202
        02020202026666411C070604042A03596666666666666666020202020266130C
        0D0E0A08092C034C4E505354685757660202020202661112100F0C0D0E2E036E
        71717171717157660202020202661714151112100F58036E7171717171715766
        0202020202661818191617141536036E7171717171715766020202020266201D
        1A1B1819163A036E7171717171715766020202020266221E1F201D1A1B5A036E
        71717171717157660202020202662324212235511F40036D7171717171715766
        020202020266282925265601673F03696C6F6F70707057660202020202662D2B
        27285501525B03696A6A6A6A6B6B5766020202020266342F302D2B4F28460369
        6A6A6A6A6A6A576602020202026639393233342F305C03696A6A6A6A6A6A5766
        0202020202663B3C37383932335D03696A6A6A6A6A6A5766020202020266443D
        3E3B3C37384903696A6A6A6A6A6A576602020202026642424344443D3E5F0369
        6A6A6A6A6A6A5766020202020266424242424243436103696A6A6A6A6A6A5766
        020202020266454242424242426003696A6A6A6A6A6A5766020202020266664B
        48424242426003696A6A6A6A6A6A57660202020202020266664D4A474260035E
        6666666666666666020202020202020202026666656403020202020202020202
        0202020202020202020202020266030202020202020202020202}
    end
    object dxBarButton1: TdxBarButton
      Caption = #1053#1086#1074#1072#1103' '#1082#1085#1086#1087#1082#1072
      Category = 0
      Hint = #1053#1086#1074#1072#1103' '#1082#1085#1086#1087#1082#1072
      Visible = ivAlways
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Action = aSave
      Category = 0
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074#1089#1077' '#1076#1072#1085#1085#1099#1077' '#1074' '#1087#1072#1087#1082#1091
      AutoGrayScale = False
      HotGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7CB1CE1370A0
        3E88AF9EC3D7F3F8FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF75
        B3D31282B50D96C80082B50072A50D6E9E60A0C3C2DCEBFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF78BBDA1087BA34B7EB1194C40084B70082B50080B30076A9006A9D62
        A2C5B0D0E2F3F8FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF93CFE6108CC032B4E733B4E71697C40085B80082B5007F
        B2007CAF007CB007587E006CA00D6C9A62A0C3C3DCEAFEFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF7AC8E806749D2EB2E631B3E635B4E81C99C5
        0084B80083B60080B3007DB0007DB2144355007AAF0074A7006C9F0167993183
        AEE4EFF5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7DCEEB119ED42B5E7234B8ED34
        B3E639B6EA1F9BC70085B90084B70081B4007EB1007FB513475B0078AC0075A8
        0073A60073A6006DA082B4CFFFFFFFFFFFFFFFFFFFFFFFFF94D9F1109DD037BC
        F12A5D7236BBF037B4E740BBEE1F9FC90088BC0085B80082B50080B30082B711
        4B630177AA0077AB0076A90075A80076A9579ABFFFFFFFFFFFFFFFFFFFFFFFFF
        57BEE337B6E936BBF02A5B7039BCF139BAEE42B3E4256F87027CAA008BC20087
        BD0084B80082B71051690274A5007BAE0078AB0078AB0078AB1272A5FFFFFFFF
        FFFFFFFFFFFFFFFF13A3D63CB6E939BCF12D5C703CC4FC3690B53C535B1E7897
        1652661D3F4B16506705739E008AC10E5A780374A3007DB1007BAE007AAD007B
        AE036899FAFBFDFFFFFFFFFFFFFFFFFF0C9BCE3CB9EC3BBEF42E617531698030
        698161D2FF189ECC008FC40090C6047DA913576F1843511E31390B63870082B6
        0083B80080B50080B300699CEBF3F7FFFFFFFFFFFFFFFFFF0E9DD041BDF23CB4
        E528363E3A99C141C0F66BCEF6159CC9008EC1008CBF008BBF008BC0008DC40D
        6080144E6518404F193D4A1055700476A5016DA0FFFFFFFFFFFFFFFFFFFFFFFF
        14A2D63A94BA2E526231647A43C3F943BBEE77D1F5129BCA0090C3008EC1008C
        BF008ABD008CC00B698A086E95008CC30089BE066F98134F6409699AFFFFFFFF
        FFFFFFFFFFFFFFFF0A92C033728C47BCEE366B8446C2F843BBEF82D6F70D9CCA
        0092C50090C3008FC2008DC0008DC1086E930B6B8D0089BD0088BB0087BC008B
        BF0072A5FFFFFFFFFFFFFFFFFFFFFFFF14A2D548C3F947B7E835647849C2F746
        BEF18EDBFA0A9BCD0095C80093C60091C4008FC20090C407759E0D6888008DC1
        008ABD0089BC008ABD0078ABFFFFFFFFFFFFFFFFFFFFFFFF26AADD49C0F449B8
        EA376E864BC2F748BEF297DEFA069CCD0097CA0095C80093C60092C50091C505
        7CA61063800090C5008DC0008CBF008DC0007CAFFFFFFFFFFFFFFFFFFFFFFFFF
        2CAEE14CC2F648B1DF3A76914DC3F848BEF4AFE6FE0C9FCE0093C90096CB0095
        C90095C80094C70484B0115F7A0093C80090C3008FC20090C30081B4FFFFFFFF
        FFFFFFFFFFFFFFFF34B1E44EC4F948AEDB3C809E59C7FDA4E1FDB5E7FCACE4FA
        8DD7EF71CBE547BADA0D9FCE0095C9008EBF1158700096CB0093C60092C50092
        C50087BAFFFFFFFFFFFFFFFFFFFFFFFF3AB6E950C5FA48ABD86692A99FE6FF5C
        C9FD4BC2F949BFF448BDF247BCF155C5F675D7FD71CCEB3D646D3E91AD2AAED7
        0599CA0094C70095C8008DC0FFFFFFFFFFFFFFFFFFFFFFFF4BBEF277D3FF79CC
        F45797B43261763462773B7A964099C045B9EB44C0F53990B62D5B722D667E35
        A3D337B9EF35B3E848BDEA3DB9E628AEDE3FA8CFFFFFFFFFFFFFFFFFFFFFFFFF
        6FCAEF47BBEE4EC0F555C7FC52C6FC4EC3F844ADDB367590231D1B2B505F2941
        4B2D657C307997328FB632A7D62BAEE11DA2D50D90C21C8FB3C8E2EDFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF64C7E93CB8E315ABDE0FA0D413A3D60F85B01B6B89
        30B1E638BCF23CBEF338BBF0299FCE157A9C087BA348B6DE79C6E2C9E9F2FEFE
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBF8FCE0
        F2F9C0E5F28AD0E767C0DF44B0D620A1CE159ECD50B5D89AD4E8E4F4FBFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Action = aPrint
      Category = 0
      HotGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFA08C7DA08C7DA08C7DA08C7DA08C7DA08C7DA08C7DA08C7D
        A08C7DA08C7DA08C7DA08C7DA08C7DA08C7DA08C7DA08C7DD1B4A0FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFA08C7DFEFCFBB9A596B9A596B9A596B9A596B9
        A596B9A596B9A596B9A596B9A596B9A596B9A596B9A596B9A596B9A596B9A596
        A08C7D86624DFF00FFFF00FFFF00FFFF00FFFF00FFA08C7DFFFFFFFEFCFBFDF7
        F3FBF1EAF9EBE2F7E6DAF5E0D2F4DDCEF3D8C6F2D3BEF0CDB5EEC8ADECC2A535
        3590353590E9B895A08C7D715A4886624DFF00FFFF00FFFF00FFFF00FFA08C7D
        FFFFFFFFFFFFFFFFFFFDF9F7FCF4EEFAEEE6F8E9DEF6E3D6F4DDCEF3D8C6F2D3
        BEF0CDB5EEC8AD0030F8353590E9B895A08C7D78604E876E5C86624DFF00FFFF
        00FFFF00FFA08C7DFFFFFFFFFFFFFFFFFFFFFFFFFDF9F7FCF4EEFAEEE6F8E9DE
        F6E3D6F4DDCEF3D8C6F2D3BEF0CDB5009800009800EABD9DA08C7D876E5C957B
        69A2887486624DFF00FFFF00FFA08C7DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD
        F9F7FCF4EEFAEEE6F8E9DEF6E3D6F4DDCEF3D8C6F2D3BE30C860009800ECC2A5
        A08C7D957B69A28874AE948086624DFF00FFFF00FFA08C7DFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFDF9F7FCF4EEFAEEE6F8E9DEF6E3D6F4DDCEF3D8C6F2
        D3BEF0CDB5EEC8ADA08C7DA28874AE9480BBA08B86624DFF00FFFF00FFA08C7D
        A08C7DA08C7DA08C7DA08C7DA08C7DA08C7DA08C7DA08C7DA08C7DA08C7DA08C
        7DA08C7DA08C7DA08C7DA08C7DA08C7DA08C7DAE9480BBA08BC7AB9786624DFF
        00FFFF00FFA08C7DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FDF9F7FCF4EEFAEEE6F8E9DEF6E3D6F4DDCEF3D8C6F2D3BEA08C7D86624DC7AB
        97C7AB9786624DFF00FFFF00FFA08C7DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFDF9F7FCF4EEFAEEE6F8E9DEF7E6DAF5E0D2F4DBCA
        A08C7DC7AB9786624DC7AB9786624DFF00FFFF00FFA39082A08C7DA08C7DA08C
        7DA08C7DA08C7DA08C7DA08C7DA08C7DA08C7DA08C7DA08C7DA08C7DA08C7DA0
        8C7DA08C7DA08C7DA48F80C7AB97C7AB9786624D86624DFF00FFFF00FFFF00FF
        A08C7DD2B9ABFFFFFEFEFDFCFCFBF9FBF9F7F9F7F4F8F5F2F6F3F0F6F1EEF5EF
        ECF3EDE9F2EBE7F0E9E4EFE7E286624DF4DDCEA08C7DC7AB97C7AB9786624DFF
        00FFFF00FFFF00FFFF00FFFF00FFD2B9ABFFFFFFFEFEFDDDCAC0D2B9ABD2B9AB
        D2B9ABD2B9ABD2B9ABD2B9ABD2B9ABDDCAC0F1EAE686624DE9B895F4DDCEA08C
        7DC7AB9786624DFF00FFFF00FFFF00FFFF00FFFF00FFD2B9ABFFFFFFFFFFFFFE
        FEFDFDFCFAFBFAF8FAF8F6F8F6F3F7F4F1F6F2EFF5F0EDF4EEEAF2ECE8DDCAC0
        86624DE9B895F4DDCEA08C7D86624DFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFD2B9ABFFFFFFFFFFFFFEFEFDFDFCFAFBFAF8FAF8F6F8F6F3F7F4F1F6F2EFF5
        F0EDF4EEEAF2ECE886624D856D5C998779A08D7FD2B9ABFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFD2B9ABFFFFFFFFFFFFDDCAC0D2B9ABD2B9ABD2B9ABD2B9
        ABD2B9ABD2B9ABD2B9ABDDCAC0F4EEEADDCAC086624DFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD2B9ABFFFFFFFFFFFFFFFFFF
        FEFEFDFDFCFAFBFAF8FAF8F6F8F6F3F7F4F1F6F2EFF5F0EDF4EEEA86624DFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD2B9ABFF
        FFFFFFFFFFFFFFFFFFFFFFFEFEFDFDFCFAFBFAF8FAF8F6F8F6F3F7F4F1F6F2EF
        F5F0EDDDCAC086624DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFD2B9ABFFFFFFDDCAC0D2B9ABD2B9ABD2B9ABD2B9ABD2B9ABD2
        B9ABD2B9ABDDCAC0F6F2EFF5F0ED86624DFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFD2B9ABFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFEFEFDFCFCFBF9FBF9F7F9F7F4F8F5F2F6F3F0DDCAC086624DFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD2B9ABD2B9AB
        D2B9ABD2B9ABD2B9ABD2B9ABD2B9ABD2B9ABD2B9ABD2B9ABD2B9ABD2B9ABD2B9
        ABD2B9ABFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
  end
  object CnsDMTable1: TCnsDMTable
    AutoShowReffrenceLine = False
    Currentindex = 0
    FetchCount = -1
    Left = 304
    Top = 192
  end
  object cxPropertiesStore1: TcxPropertiesStore
    Components = <>
    StorageName = 'cxPropertiesStore1'
    Left = 104
    Top = 344
  end
  object CnsDMTable2: TCnsDMTable
    AutoShowReffrenceLine = False
    Currentindex = 0
    FetchCount = -1
    Left = 280
    Top = 280
  end
  object FileOpenDialogDCM: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = []
    Left = 280
    Top = 360
  end
  object dxMemData1: TdxMemData
    Indexes = <>
    Persistent.Option = poLoad
    SortOptions = []
    Left = 440
    Top = 280
    object dxMemData1npp: TIntegerField
      FieldName = 'npp'
    end
    object dxMemData1fvideo: TBlobField
      FieldName = 'fvideo'
    end
    object dxMemData1filename: TStringField
      FieldName = 'filename'
      Size = 250
    end
  end
  object frxReport1: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41989.703559363430000000
    ReportOptions.LastChange = 41990.604619479160000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'procedure Picture1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  Picture1.LoadFromFile(<frxDBDataset1."filename">);            ' +
        '          '
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frxReport1GetValue
    Left = 448
    Top = 352
    Datasets = <
      item
        DataSet = dbPrintList
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      object PageHeader1: TfrxPageHeader
        Height = 88.165430000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 5.118120000000000000
          Top = 2.118120000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8 = (
            #1056#1119#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218)
        end
        object Memo2: TfrxMemoView
          Left = 95.826840000000000000
          Top = 2.118120000000000000
          Width = 355.275820000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8 = (
            '[teP_ENAME]')
        end
        object Memo3: TfrxMemoView
          Left = 5.118120000000000000
          Top = 23.795300000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8 = (
            'N '#1056#1114#1056#1113)
        end
        object Memo4: TfrxMemoView
          Left = 95.826840000000000000
          Top = 23.795300000000000000
          Width = 355.275820000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8 = (
            '[teP_PID]')
        end
        object Memo5: TfrxMemoView
          Left = 460.984540000000000000
          Top = 2.118120000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#187)
        end
        object Memo6: TfrxMemoView
          Left = 578.149970000000000000
          Top = 2.118120000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8 = (
            '[teP_SEX]')
        end
        object Memo7: TfrxMemoView
          Left = 460.984540000000000000
          Top = 23.795300000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' '#1057#1026#1056#1109#1056#182#1056#1169#1056#181#1056#1029#1056#1105#1057#1039)
        end
        object Memo8: TfrxMemoView
          Left = 578.149970000000000000
          Top = 23.795300000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8 = (
            '[dtP_DATEBORN]')
        end
        object Memo9: TfrxMemoView
          Left = 5.118120000000000000
          Top = 46.252010000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8 = (
            'N '#1056#1111#1057#1026#1056#1109#1057#8218#1056#1109#1056#1108#1056#1109#1056#187#1056#176)
        end
        object Memo10: TfrxMemoView
          Left = 107.165430000000000000
          Top = 46.252010000000000000
          Width = 343.937230000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8 = (
            '[teAccessionNumber]')
        end
        object Memo11: TfrxMemoView
          Left = 460.984540000000000000
          Top = 46.252010000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' '#1056#1105#1057#1027#1057#1027#1056#187#1056#181#1056#1169'.')
        end
        object Memo12: TfrxMemoView
          Left = 578.149970000000000000
          Top = 46.252010000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8 = (
            '[deStartDateWorklist]')
        end
        object Memo13: TfrxMemoView
          Top = 69.267780000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#152#1056#8250#1056#8250#1056#174#1056#1038#1056#1118#1056#160#1056#1106#1056#166#1056#152#1056#152' '#1056#1113' '#1056#8217#1056#160#1056#1106#1056#167#1056#8226#1056#8216#1056#1116#1056#1115#1056#1114#1056#1032' '#1056#8212#1056#1106#1056#1113#1056#8250#1056#174#1056#167#1056#8226#1056#1116#1056 +
              #152#1056#174)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 340.157700000000000000
        Top = 166.299320000000000000
        Width = 718.110700000000000000
        DataSet = dbPrintList
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Picture1: TfrxPictureView
          Left = 7.559060000000000000
          Width = 449.764070000000000000
          Height = 332.598640000000000000
          OnBeforePrint = 'Picture1OnBeforePrint'
          ShowHint = False
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
      end
    end
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    ExportEMF = True
    Wysiwyg = True
    Creator = 'FastReport'
    SuppressPageHeadersFooters = False
    HeaderFooterMode = hfText
    AutoSize = False
    Left = 448
    Top = 408
  end
  object mdPrintList: TdxMemData
    Indexes = <>
    Persistent.Option = poLoad
    SortOptions = []
    Left = 320
    Top = 16
    object IntegerField1: TIntegerField
      FieldName = 'npp'
    end
    object StringField1: TStringField
      FieldName = 'filename'
      Size = 250
    end
  end
  object dbPrintList: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSource = dsPrintList
    BCDToCurrency = False
    Left = 448
    Top = 456
  end
  object dsPrintList: TDataSource
    DataSet = mdPrintList
    Left = 320
    Top = 56
  end
  object CnsDMTable3: TCnsDMTable
    AutoShowReffrenceLine = False
    Currentindex = 0
    FetchCount = -1
    Left = 360
    Top = 192
  end
end
