object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 387
  ClientWidth = 614
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 54
    Height = 13
    Caption = 'Chave PIX:'
  end
  object Label2: TLabel
    Left = 16
    Top = 64
    Width = 59
    Height = 13
    Caption = 'Benefici'#225'rio:'
  end
  object Label3: TLabel
    Left = 16
    Top = 120
    Width = 37
    Height = 13
    Caption = 'Cidade:'
  end
  object Label4: TLabel
    Left = 16
    Top = 168
    Width = 28
    Height = 13
    Caption = 'Valor:'
  end
  object Label5: TLabel
    Left = 16
    Top = 224
    Width = 116
    Height = 13
    Caption = 'C'#243'digo da Tranfer'#234'ncia:'
  end
  object LabelPayLoad: TLabel
    Left = 8
    Top = 317
    Width = 44
    Height = 13
    Caption = 'PALOAD:'
  end
  object ImgQrCodePIX: TImage
    Left = 320
    Top = 24
    Width = 265
    Height = 273
    Proportional = True
    Stretch = True
  end
  object edtChave: TEdit
    Left = 16
    Top = 32
    Width = 185
    Height = 21
    TabOrder = 0
  end
  object edtBeneficiario: TEdit
    Left = 16
    Top = 80
    Width = 185
    Height = 21
    TabOrder = 1
  end
  object edtCidade: TEdit
    Left = 16
    Top = 136
    Width = 185
    Height = 21
    TabOrder = 2
  end
  object edtValor: TEdit
    Left = 16
    Top = 184
    Width = 185
    Height = 21
    TabOrder = 3
  end
  object Button1: TButton
    Left = 176
    Top = 288
    Width = 113
    Height = 25
    Caption = 'Gerar PayLoad'
    TabOrder = 5
    OnClick = Button1Click
  end
  object edtpayload: TEdit
    Left = 8
    Top = 336
    Width = 433
    Height = 21
    TabOrder = 6
  end
  object edtCodTrans: TEdit
    Left = 16
    Top = 240
    Width = 185
    Height = 21
    TabOrder = 4
  end
  object frxReport1: TfrxReport
    Version = '2024.1.2'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45427.495232523150000000
    ReportOptions.LastChange = 45427.495232523150000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 240
    Top = 88
    Datasets = <
      item
        DataSet = frxQRCode
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
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      OnBeforePrint = 'Page1OnBeforePrint'
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 102.047310000000000000
        Width = 718.110700000000000000
        DataSet = frxQRCode
        DataSetName = 'frxDBDataset1'
        RowCount = 0
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 185.196970000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
        end
      end
      object QRCode: TfrxBarcode2DView
        AllowVectorExport = True
        Left = 219.212740000000000000
        Top = 241.889920000000000000
        Width = 84.000000000000000000
        Height = 100.000000000000000000
        OnBeforePrint = 'QRCodeOnBeforePrint'
        StretchMode = smActualHeight
        BarType = bcCodeQR
        BarProperties.Encoding = qrAuto
        BarProperties.QuietZone = 0
        BarProperties.ErrorLevels = ecL
        BarProperties.PixelSize = 4
        BarProperties.CodePage = 0
        DataField = 'payload'
        DataSet = frxQRCode
        DataSetName = 'frxDBDataset1'
        Frame.Typ = []
        Rotation = 0
        ShowText = False
        HexData = '31003200330034003500360037003800'
        Zoom = 1.000000000000000000
        FontScaled = True
        QuietZone = 0
        ColorBar = clBlack
        BarcodeText.TextSettings.BarTextPos = btpBottom
        BarcodeText.SupSettings.BarTextPos = btpTop
      end
    end
  end
  object frxQRCode: TfrxDBDataset
    Left = 240.000000000000000000
    Top = 24.000000000000000000
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = ClientDataSet1
    BCDToCurrency = False
    DataSetOptions = []
    Left = 240
    Top = 24
    FieldDefs = <
      item
        FieldName = 'payload'
        FieldAlias = 'payload'
      end>
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 160
    object ClientDataSet1payload: TStringField
      FieldName = 'payload'
      Size = 150
    end
  end
end
