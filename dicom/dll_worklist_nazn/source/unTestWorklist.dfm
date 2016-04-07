object frmTestWorklist: TfrmTestWorklist
  Left = 0
  Top = 0
  Caption = 'frmTestWorklist'
  ClientHeight = 638
  ClientWidth = 820
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma,204'
  Font.Style = []
  OldCreateOrder = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 14
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 0
    Width = 820
    Height = 638
    ActivePage = cxTabSheet3
    Align = alClient
    TabOrder = 0
    ClientRectBottom = 638
    ClientRectRight = 820
    ClientRectTop = 25
    object cxTabSheet1: TcxTabSheet
      Caption = #1057#1085#1080#1084#1082#1080
      ImageIndex = 0
      object Label10: TLabel
        Left = 8
        Top = 179
        Width = 41
        Height = 14
        Caption = 'patientID'
      end
      object Label11: TLabel
        Left = 8
        Top = 207
        Width = 89
        Height = 14
        Caption = 'AccessionNumber'
      end
      object Label12: TLabel
        Left = 8
        Top = 235
        Width = 43
        Height = 14
        Caption = 'studyUID'
      end
      object Label4: TLabel
        Left = 8
        Top = 11
        Width = 46
        Height = 14
        Caption = 'webpage'
      end
      object Label6: TLabel
        Left = 8
        Top = 67
        Width = 44
        Height = 14
        Caption = 'webuser'
      end
      object Label7: TLabel
        Left = 8
        Top = 95
        Width = 72
        Height = 14
        Caption = 'webpassword'
      end
      object Label8: TLabel
        Left = 8
        Top = 123
        Width = 45
        Height = 14
        Caption = 'atris_use'
      end
      object Label9: TLabel
        Left = 8
        Top = 146
        Width = 62
        Height = 14
        Caption = 'web_timeout'
      end
      object Button2: TButton
        Left = 360
        Top = 132
        Width = 97
        Height = 33
        Caption = #1089#1085#1080#1084#1082#1080' HTTP'
        TabOrder = 0
        OnClick = Button2Click
      end
      object edAccessionNumber: TEdit
        Left = 109
        Top = 199
        Width = 347
        Height = 22
        TabOrder = 1
      end
      object edatris_use: TEdit
        Left = 109
        Top = 115
        Width = 31
        Height = 22
        TabOrder = 2
        Text = '1'
      end
      object edpatientID: TEdit
        Left = 109
        Top = 171
        Width = 347
        Height = 22
        TabOrder = 3
      end
      object edstudyUID: TEdit
        Left = 109
        Top = 227
        Width = 347
        Height = 22
        TabOrder = 4
        Text = '1.2.392.200036.9116.2.5.1.48.1221423353.1386845216.3233'
      end
      object edweb_timeout: TEdit
        Left = 109
        Top = 143
        Width = 63
        Height = 22
        TabOrder = 5
        Text = '20000'
      end
      object edwebpage: TEdit
        Left = 109
        Top = 3
        Width = 347
        Height = 22
        TabOrder = 6
        Text = 'http://10.1.1.18:8887/'
      end
      object edwebpassword: TEdit
        Left = 109
        Top = 87
        Width = 208
        Height = 22
        TabOrder = 7
        Text = 'Allpax'
      end
      object edwebuser: TEdit
        Left = 109
        Top = 59
        Width = 208
        Height = 22
        TabOrder = 8
        Text = 'Allpax'
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'ORACLE'
      ImageIndex = 1
      object Label1: TLabel
        Left = 16
        Top = 19
        Width = 55
        Height = 14
        Caption = 'DATABASE'
      end
      object Label2: TLabel
        Left = 16
        Top = 47
        Width = 22
        Height = 14
        Caption = 'user'
      end
      object Label3: TLabel
        Left = 16
        Top = 70
        Width = 50
        Height = 14
        Caption = 'password'
      end
      object Button1: TButton
        Left = 337
        Top = 11
        Width = 97
        Height = 33
        Caption = #1089#1085#1080#1084#1082#1080
        TabOrder = 0
        OnClick = Button1Click
      end
      object edDB: TEdit
        Left = 85
        Top = 11
        Width = 246
        Height = 22
        TabOrder = 1
        Text = 'ASU_HABAROVSK_KKB2'
      end
      object edUser: TEdit
        Left = 85
        Top = 39
        Width = 246
        Height = 22
        TabOrder = 2
        Text = 'ASU'
      end
      object edPassword: TEdit
        Left = 85
        Top = 67
        Width = 246
        Height = 22
        TabOrder = 3
        Text = 'ASU'
      end
    end
    object cxTabSheet3: TcxTabSheet
      Caption = 'MS SQL'
      ImageIndex = 2
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 820
        Height = 193
        Align = alTop
        TabOrder = 0
        object Label5: TLabel
          Left = 8
          Top = 15
          Width = 77
          Height = 14
          Caption = 'mssql_conn_str'
        end
        object Label13: TLabel
          Left = 633
          Top = 82
          Width = 78
          Height = 14
          Caption = #1082#1086#1083'-'#1074#1086' '#1079#1072#1087#1080#1089#1077#1081
        end
        object Label14: TLabel
          Left = 260
          Top = 83
          Width = 43
          Height = 14
          Caption = 'patient id'
        end
        object Label15: TLabel
          Left = 449
          Top = 83
          Width = 55
          Height = 14
          Caption = 'patient num'
        end
        object Label16: TLabel
          Left = 470
          Top = 144
          Width = 40
          Height = 14
          Caption = 'modatity'
        end
        object Label17: TLabel
          Left = 431
          Top = 169
          Width = 82
          Height = 14
          Caption = 'studyinstanceuid'
        end
        object Label18: TLabel
          Left = 607
          Top = 144
          Width = 60
          Height = 14
          Caption = 'stationaetitle'
        end
        object Button3: TButton
          Left = 712
          Top = 35
          Width = 97
          Height = 33
          Caption = 'connect'
          TabOrder = 0
          OnClick = Button3Click
        end
        object Button4: TButton
          Left = 8
          Top = 68
          Width = 239
          Height = 33
          Caption = 'Patient ID (PatientID)'
          TabOrder = 1
          OnClick = Button4Click
        end
        object Button5: TButton
          Left = 8
          Top = 107
          Width = 239
          Height = 33
          Caption = 'Studies (AccessionNbmber, PatNUM)'
          TabOrder = 2
          OnClick = Button5Click
        end
        object edAccessionNumberFnd: TEdit
          Left = 256
          Top = 112
          Width = 423
          Height = 22
          TabOrder = 3
        end
        object edmssql_conn_str: TEdit
          Left = 109
          Top = 7
          Width = 700
          Height = 22
          TabOrder = 4
          Text = 
            'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
            'fo=False;User ID=sa;Initial Catalog=ClusterPacsServer;Data Sourc' +
            'e=AFOMIN\MSSQL2012'
        end
        object edPatientIdFnd: TEdit
          Left = 309
          Top = 79
          Width = 111
          Height = 22
          TabOrder = 5
        end
        object edAmmRecs: TEdit
          Left = 717
          Top = 74
          Width = 92
          Height = 22
          TabOrder = 6
          Text = '100'
        end
        object rbFomin: TRadioButton
          Left = 109
          Top = 35
          Width = 113
          Height = 17
          Caption = 'AFOMIN'
          Checked = True
          TabOrder = 7
          TabStop = True
          OnClick = rbFominClick
        end
        object rbATRIS: TRadioButton
          Left = 174
          Top = 35
          Width = 113
          Height = 17
          Caption = 'ATRIS'
          TabOrder = 8
          OnClick = rbATRISClick
        end
        object edPatientNumFnd: TEdit
          Left = 510
          Top = 79
          Width = 81
          Height = 22
          TabOrder = 9
        end
        object Button6: TButton
          Left = 8
          Top = 146
          Width = 412
          Height = 33
          Caption = 
            'WORKLIST (patid,accessionnumber,studyinstanceuid,modatity,statio' +
            'naetitle )'
          TabOrder = 10
          OnClick = Button6Click
        end
        object edmodatity: TEdit
          Left = 519
          Top = 140
          Width = 72
          Height = 22
          TabOrder = 11
        end
        object edstudyinstanceuid: TEdit
          Left = 519
          Top = 165
          Width = 290
          Height = 22
          TabOrder = 12
        end
        object edstationaetitle: TEdit
          Left = 677
          Top = 140
          Width = 132
          Height = 22
          TabOrder = 13
        end
      end
      object cxGrid1: TcxGrid
        Left = 0
        Top = 193
        Width = 820
        Height = 420
        Align = alClient
        TabOrder = 1
        object cxGrid1TableView1: TcxGridTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1TableView1
        end
      end
    end
    object cxTabSheet4: TcxTabSheet
      Caption = 'GUIDE WORKLIST'
      ImageIndex = 3
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 820
        Height = 54
        Align = alTop
        TabOrder = 0
        object Label36e: TLabel
          Left = 16
          Top = 7
          Width = 86
          Height = 14
          Caption = 'accessionnumber'
        end
        object Label36: TLabel
          Left = 16
          Top = 27
          Width = 86
          Height = 14
          Caption = 'studyunstanceuid'
        end
        object edaccessionnumberDLT: TEdit
          Left = 108
          Top = 4
          Width = 437
          Height = 22
          TabOrder = 0
        end
        object Button7: TButton
          Left = 567
          Top = 6
          Width = 239
          Height = 33
          Caption = 'DELETE'
          TabOrder = 1
          OnClick = Button7Click
        end
        object edstudyunstanceuidDLT: TEdit
          Left = 108
          Top = 27
          Width = 437
          Height = 22
          TabOrder = 2
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 54
        Width = 820
        Height = 559
        Align = alClient
        TabOrder = 1
        object Label21: TLabel
          Left = 16
          Top = 28
          Width = 126
          Height = 14
          Caption = #1053#1086#1084#1077#1088' '#1050#1072#1088#1090#1099' -> PatientID'
        end
        object Label22: TLabel
          Left = 16
          Top = 50
          Width = 87
          Height = 14
          Caption = 'patPrefix ('#1085#1077' '#1080#1089#1087')'
        end
        object Label23: TLabel
          Left = 16
          Top = 72
          Width = 121
          Height = 14
          Caption = #1060#1072#1084#1080#1083#1080#1103' -> PatientName'
        end
        object Label24: TLabel
          Left = 16
          Top = 94
          Width = 98
          Height = 14
          Caption = #1048#1084#1103' -> PatientName'
        end
        object Label25: TLabel
          Left = 16
          Top = 116
          Width = 126
          Height = 14
          Caption = #1054#1090#1095#1077#1089#1090#1074#1086' -> PatientName'
        end
        object Label26: TLabel
          Left = 16
          Top = 138
          Width = 171
          Height = 14
          Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103' -> PatientBirthDate'
        end
        object Label27: TLabel
          Left = 16
          Top = 160
          Width = 99
          Height = 14
          Caption = #39'M'#39' || '#39'F'#39' -> PatientSex'
        end
        object Label28: TLabel
          Left = 16
          Top = 182
          Width = 33
          Height = 14
          Caption = 'AETitle'
        end
        object Label29: TLabel
          Left = 16
          Top = 204
          Width = 89
          Height = 14
          Caption = #1050#1086#1084#1085#1072#1090#1072' ('#1085#1077' '#1080#1089#1087')'
        end
        object Label30: TLabel
          Left = 16
          Top = 226
          Width = 202
          Height = 14
          Caption = #1050#1086#1076' '#1085#1072#1087#1088'. '#1076#1080#1072#1075#1085#1086#1079#1072' '#1087#1086' '#1052#1050#1041'-10 -> '#1085#1077' '#1080#1089#1087
        end
        object Label31: TLabel
          Left = 16
          Top = 270
          Width = 157
          Height = 14
          Caption = #1060#1072#1084#1080#1083#1080#1103' '#1085#1072#1087#1088#1072#1074#1080#1074#1096#1077#1075#1086' '#1074#1088#1072#1095#1072
        end
        object Label32: TLabel
          Left = 16
          Top = 314
          Width = 162
          Height = 14
          Caption = #1054#1090#1095#1077#1089#1090#1074#1086' '#1085#1072#1087#1088#1072#1074#1080#1074#1096#1077#1075#1086' '#1074#1088#1072#1095#1072
        end
        object Label33: TLabel
          Left = 16
          Top = 358
          Width = 180
          Height = 14
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1080#1089#1089#1083#1077#1076#1091#1077#1084#1086#1081' '#1095#1072#1089#1090#1080' '#1090#1077#1083#1072
        end
        object Label34: TLabel
          Left = 16
          Top = 402
          Width = 179
          Height = 14
          Caption = #1069#1082#1089#1090#1088#1077#1085#1085#1099#1081' (1/0)-> '#1085#1077' '#1080#1089#1087' (integer)'
        end
        object Label35: TLabel
          Left = 16
          Top = 446
          Width = 158
          Height = 14
          Caption = '0 - '#1055#1086#1083#1080#1082#1083#1080#1085#1080#1082#1072', 1 - '#1057#1090#1072#1094#1080#1086#1085#1072#1088
        end
        object Label37: TLabel
          Left = 16
          Top = 424
          Width = 103
          Height = 14
          Caption = #1042#1088#1077#1084#1103' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1103
        end
        object Label38: TLabel
          Left = 16
          Top = 380
          Width = 125
          Height = 14
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103
        end
        object Label39: TLabel
          Left = 16
          Top = 336
          Width = 39
          Height = 14
          Caption = 'Modality'
        end
        object Label40: TLabel
          Left = 16
          Top = 292
          Width = 134
          Height = 14
          Caption = #1048#1084#1103' '#1085#1072#1087#1088#1072#1074#1080#1074#1096#1077#1075#1086' '#1074#1088#1072#1095#1072
        end
        object Label41: TLabel
          Left = 16
          Top = 248
          Width = 151
          Height = 14
          Caption = #1053#1072#1087#1088#1072#1074#1080#1074#1096#1077#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
        end
        object Label19: TLabel
          Left = 16
          Top = 470
          Width = 89
          Height = 14
          Caption = 'AccessionNumber'
        end
        object Label42: TLabel
          Left = 16
          Top = 493
          Width = 85
          Height = 14
          Caption = 'StudyInstanceUID'
        end
        object Button8: TButton
          Left = 567
          Top = 520
          Width = 239
          Height = 33
          Caption = #1044#1054#1041#1040#1042#1048#1058#1068' '#1042' WORKLIST'
          TabOrder = 0
          OnClick = Button8Click
        end
        object edPatientIDINS: TEdit
          Left = 272
          Top = 25
          Width = 495
          Height = 22
          TabOrder = 1
        end
        object edpatPrefix: TEdit
          Left = 272
          Top = 47
          Width = 495
          Height = 22
          TabOrder = 2
        end
        object edPatientFamily: TEdit
          Left = 272
          Top = 69
          Width = 495
          Height = 22
          TabOrder = 3
        end
        object edSex: TEdit
          Left = 272
          Top = 157
          Width = 33
          Height = 22
          TabOrder = 4
        end
        object edPatientSurname: TEdit
          Left = 272
          Top = 113
          Width = 495
          Height = 22
          TabOrder = 5
        end
        object edPatientNAME: TEdit
          Left = 272
          Top = 91
          Width = 495
          Height = 22
          TabOrder = 6
        end
        object edModality: TEdit
          Left = 272
          Top = 333
          Width = 33
          Height = 22
          TabOrder = 7
        end
        object edVrachOtch: TEdit
          Left = 272
          Top = 311
          Width = 495
          Height = 22
          TabOrder = 8
        end
        object edVrachIm: TEdit
          Left = 272
          Top = 289
          Width = 495
          Height = 22
          TabOrder = 9
        end
        object edVrachFam: TEdit
          Left = 272
          Top = 267
          Width = 495
          Height = 22
          TabOrder = 10
        end
        object edPodrazdelenie: TEdit
          Left = 272
          Top = 245
          Width = 495
          Height = 22
          TabOrder = 11
        end
        object edDiagnMKB10: TEdit
          Left = 272
          Top = 223
          Width = 105
          Height = 22
          TabOrder = 12
        end
        object edRoom: TEdit
          Left = 272
          Top = 201
          Width = 495
          Height = 22
          TabOrder = 13
        end
        object edAETitle: TEdit
          Left = 272
          Top = 179
          Width = 225
          Height = 22
          TabOrder = 14
        end
        object ed_Polikl_Statsionar: TEdit
          Left = 272
          Top = 443
          Width = 33
          Height = 22
          TabOrder = 15
        end
        object edFASTEST: TEdit
          Left = 272
          Top = 399
          Width = 33
          Height = 22
          TabOrder = 16
        end
        object edStudyName: TEdit
          Left = 272
          Top = 377
          Width = 495
          Height = 22
          TabOrder = 17
        end
        object edBodyPart: TEdit
          Left = 272
          Top = 355
          Width = 495
          Height = 22
          TabOrder = 18
        end
        object Button9: TButton
          Left = 272
          Top = 520
          Width = 239
          Height = 33
          Caption = #1047#1040#1055#1054#1051#1053#1048#1058#1068' '#1087#1086'-'#1091#1084#1086#1083#1095#1072#1085#1080#1102
          TabOrder = 19
          OnClick = Button9Click
        end
        object edAccessionNumberINS: TEdit
          Left = 272
          Top = 467
          Width = 495
          Height = 22
          TabOrder = 20
        end
        object edBirthDate: TcxDateEdit
          Left = 272
          Top = 135
          TabOrder = 21
          Width = 121
        end
        object edTimeNapravl: TcxDateEdit
          Left = 272
          Top = 421
          TabOrder = 22
          Width = 121
        end
        object edStudyInstanceUIDINS: TEdit
          Left = 272
          Top = 490
          Width = 495
          Height = 22
          TabOrder = 23
        end
      end
    end
    object cxTabSheet5: TcxTabSheet
      Caption = #1060#1091#1085#1082#1094#1080#1080
      ImageIndex = 4
      object Label20: TLabel
        Left = 16
        Top = 7
        Width = 86
        Height = 14
        Caption = 'accessionnumber'
      end
      object lbSTUDYINSTANCEUID: TLabel
        Left = 16
        Top = 63
        Width = 100
        Height = 14
        Caption = 'STUDYINSTANCEUID'
      end
      object edaccessionnumberToStudyUID: TEdit
        Left = 108
        Top = 4
        Width = 437
        Height = 22
        TabOrder = 0
      end
      object Button10: TButton
        Left = 567
        Top = 6
        Width = 239
        Height = 33
        Caption = #1055#1086#1083#1091#1095#1080#1090#1100' STUDYINSTANCEUID'
        TabOrder = 1
        OnClick = Button10Click
      end
    end
  end
  object OracleSession1: TOracleSession
    LogonUsername = 'asu'
    LogonPassword = 'asu'
    LogonDatabase = 'ASU_HABAROVSK_KKB2'
    Left = 776
    Top = 80
  end
end
