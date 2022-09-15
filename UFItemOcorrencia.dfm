object FItemOcorrencia: TFItemOcorrencia
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'SAC - Item da Ocorr'#234'ncia'
  ClientHeight = 680
  ClientWidth = 1001
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object StatusBar: TStatusBar
    Left = 0
    Top = 661
    Width = 1001
    Height = 19
    Panels = <>
  end
  object gbxPrincipal: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 46
    Width = 995
    Height = 612
    Align = alClient
    Caption = '  Item da Ocorr'#234'ncia  '
    TabOrder = 2
    object gbxDadosCliente: TGroupBox
      AlignWithMargins = True
      Left = 5
      Top = 21
      Width = 985
      Height = 70
      Align = alTop
      Caption = '  Identifica'#231#227'o do Cliente  '
      TabOrder = 0
      object lblEdtCodigoCliente: TLabeledEdit
        Left = 10
        Top = 36
        Width = 55
        Height = 24
        Color = clCream
        EditLabel.Width = 43
        EditLabel.Height = 16
        EditLabel.Caption = 'C'#243'digo'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = [fsBold]
        EditLabel.ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object lblEdtRazaoSocial: TLabeledEdit
        Left = 71
        Top = 36
        Width = 356
        Height = 24
        CharCase = ecUpperCase
        Color = clCream
        EditLabel.Width = 81
        EditLabel.Height = 16
        EditLabel.Caption = 'Raz'#227'o Social'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = [fsBold]
        EditLabel.ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object lblEdtContatoCliente: TLabeledEdit
        Left = 433
        Top = 36
        Width = 179
        Height = 24
        CharCase = ecUpperCase
        Color = clCream
        EditLabel.Width = 52
        EditLabel.Height = 16
        EditLabel.Caption = 'Contato'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = [fsBold]
        EditLabel.ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object gbxControleOcorrencia: TGroupBox
        AlignWithMargins = True
        Left = 618
        Top = 11
        Width = 354
        Height = 53
        Caption = '  Controle de Ocorr'#234'ncia  '
        Color = clCream
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        TabOrder = 3
        DesignSize = (
          354
          53)
        object lblControle: TLabel
          AlignWithMargins = True
          Left = 5
          Top = 21
          Width = 102
          Height = 27
          Align = alLeft
          Caption = '000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -27
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitHeight = 33
        end
        object lblHorarioAtual: TLabel
          Left = 121
          Top = 22
          Width = 187
          Height = 19
          Alignment = taCenter
          Anchors = [akRight]
          Caption = '99/99/9999 - 00:00:00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitTop = 26
        end
      end
    end
    object gbxConsulta: TGroupBox
      AlignWithMargins = True
      Left = 5
      Top = 97
      Width = 551
      Height = 67
      Align = alLeft
      Caption = '  Consultas  '
      TabOrder = 1
      object lblTipoFiltro: TLabel
        Left = 280
        Top = 11
        Width = 62
        Height = 16
        Caption = 'N'#186' Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 366
        Top = 11
        Width = 47
        Height = 16
        Caption = 'Emiss'#227'o'
      end
      object rbtNFe: TRadioButton
        Left = 102
        Top = 29
        Width = 62
        Height = 17
        Cursor = crHandPoint
        Caption = 'N'#186' &NFe'
        TabOrder = 0
        OnClick = rbtPedidoClick
      end
      object rbtDuplicata: TRadioButton
        Left = 178
        Top = 29
        Width = 94
        Height = 17
        Cursor = crHandPoint
        Caption = 'N'#186' &Duplicata'
        TabOrder = 1
        OnClick = rbtPedidoClick
      end
      object rbtPedido: TRadioButton
        Left = 13
        Top = 29
        Width = 76
        Height = 17
        Cursor = crHandPoint
        Caption = 'N'#186' &Pedido'
        TabOrder = 2
        OnClick = rbtPedidoClick
      end
      object edtConsulta: TEdit
        Left = 280
        Top = 27
        Width = 80
        Height = 24
        NumbersOnly = True
        TabOrder = 3
        OnExit = edtConsultaExit
      end
      object btnBuscar: TBitBtn
        Left = 444
        Top = 20
        Width = 103
        Height = 35
        Cursor = crHandPoint
        Caption = 'Buscar'
        DoubleBuffered = True
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7F7F7F7FFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FD7D8
          D88E8E8E7F7F7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          808080C1C2C2ABABAB6465658B8B8CFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF7F7F7FAAABABBABABA5F60608F9191FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF808080959696C5C5C55D5E5E8E9090FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080C5C5C5606060898B8BFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF828383BCBDBD666666
          828484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF828383AC
          ADAD6F6F6F7B7D7DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF7472737472736562636966686A6869706E6F7676
          768283839C9C9C797A7A737474FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF6F6F6F636263A1A1A1E3E2E3FFFFFFFFFFFF
          FFFFFFD5D4D4ABA9A96E6C6D8C8B8C686969FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6F6F6F5A5958DCD9D8FFFEFCFF
          FEFCFFFEFCFFFEFEFFFFFEFFFFFEF0EFEFC9C6C67F7B7E767676FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6F6F6F52504FDED8
          D1FEFAF4FEFBF7FEFBF7FEFBF7FEFBF7FEFBF8FEFBF8FEFBF8F6F4F0CCCACA77
          74767B7B7BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          5D5B5BA9A198FCF2E6FEF7EFFEF7F0FEF7F0FEF7F0FEF8F0FEF8F2FEF8F2FEF8
          F3FEF8F3F3EFEAADA7A9727072FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF6B6B6B4F4B47F2E2D1FCEEE0FEF4EAFEF4EAFEF4EAFEF4EBFEF4EB
          FEF6EBFEF6EBFEF6EDFEF6EDFEF7EEDAD4CF7A76788E8E8EFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF545453776E64FBE7D0FCEBD9FCF0E3FCF2E3FC
          F2E5FCF2E5FCF2E5FCF2E5FCF2E6FCF2E6FCF3E7FCF3E7EAE2D88C87876D6D6D
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF545453867969FAE2C6FBE7
          D1FCEEDDFCEEDDFCEEDEFCEEDEFCEFE0FCEFE0FCEFE0FCEFE0FCEFE1FCEFE1F2
          E3D497908C6D6D6DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF555453
          867664FADDBCFBE3CAFCEBD8FCEBD8FCEBD8FCEBD8FCEBD9FCEBD9FCEBD9FBE7
          D1FBE7D1FBE9D4EFE1D1958C8A6D6D6DFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF6F6E6F5D5144F8D9B6FADDBDFAE1C5FAE1C5FAE1C5FAE1C5FAE0C1
          FAE2C6FAE2C7FBE7D1FBEAD4FBEAD5E3D5C58C8686919191FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF585047BCA58AF8DCBAFBE5CBFBE5CBFB
          E5CBFBE7D1FBE9D3FBE9D3FBE9D3FBE9D3FBE9D3FBE9D3CEC2B5726E6FFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF5F5C5B736352EED0
          AFFBE7CFFBE9D3FBE9D3FBE9D3FBE9D3FBE9D3FBE9D3FBE9D3FBE9D3E2D4C29F
          9692726E6FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF625A547D6B58EFD8BCFBE9D3FBE9D3FBE9D3FBE9D3FBE9D3FBE9D3FBE9
          D3E6D7C5ACA198767474FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF68605A786958CEBCA9F7E5CFFBE9D3FBE9D3
          FBE9D3EDDDC9C6B8A9A09389736E6EFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF756F6E74685F80
          7468998C7BA79988998C7E8E8075766D68766D68FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FF838282838282838282838282838282FF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        ParentDoubleBuffered = False
        TabOrder = 5
        OnClick = btnBuscarClick
      end
      object mEdtDataEmissaoConsulta: TMaskEdit
        Left = 366
        Top = 27
        Width = 72
        Height = 24
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 4
        Text = '  /  /    '
      end
    end
    object gbxControleItem: TGroupBox
      AlignWithMargins = True
      Left = 562
      Top = 97
      Width = 428
      Height = 67
      Align = alLeft
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = '  Controle de Item  '
      TabOrder = 2
      object lblSeqItem: TLabel
        AlignWithMargins = True
        Left = 5
        Top = 21
        Width = 67
        Height = 41
        Align = alLeft
        Alignment = taCenter
        AutoSize = False
        Caption = '000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lblEdtStatusSolucao: TLabeledEdit
        Left = 79
        Top = 33
        Width = 170
        Height = 27
        Color = clCream
        EditLabel.Width = 50
        EditLabel.Height = 16
        EditLabel.Caption = 'Solu'#231#227'o'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = [fsBold]
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object lblEdtStatusCausaProblema: TLabeledEdit
        Left = 255
        Top = 33
        Width = 170
        Height = 27
        Color = clCream
        EditLabel.Width = 39
        EditLabel.Height = 16
        EditLabel.Caption = 'Causa'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = [fsBold]
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
    object gbxDadosItem: TGroupBox
      AlignWithMargins = True
      Left = 5
      Top = 170
      Width = 985
      Height = 437
      Align = alBottom
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = '  Dados do Item  '
      TabOrder = 3
      DesignSize = (
        985
        437)
      object Label1: TLabel
        Left = 89
        Top = 112
        Width = 109
        Height = 16
        Caption = 'Tipo de Ocorr'#234'ncia'
      end
      object Label2: TLabel
        Left = 286
        Top = 112
        Width = 131
        Height = 16
        Caption = 'SubTipo de Ocorr'#234'ncia'
      end
      object Label3: TLabel
        Left = 719
        Top = 112
        Width = 138
        Height = 16
        Caption = 'Situa'#231#227'o da Embalagem'
      end
      object Label4: TLabel
        Left = 558
        Top = 161
        Width = 74
        Height = 16
        Caption = 'Solucionador'
      end
      object Label5: TLabel
        Left = 10
        Top = 161
        Width = 122
        Height = 16
        Caption = 'Observa'#231#227'o Adicional'
      end
      object lblContMemo: TLabel
        Left = 509
        Top = 161
        Width = 33
        Height = 16
        Anchors = [akLeft, akTop, akRight]
        Caption = '0/300'
      end
      object imgSolucionador: TImage
        Left = 947
        Top = 183
        Width = 25
        Height = 22
        Cursor = crHandPoint
        CustomHint = BalloonHint
        Enabled = False
        ParentShowHint = False
        Picture.Data = {
          0A544A504547496D61676536020000FFD8FFE000104A46494600010100000100
          010000FFDB004300090607080706090807080A0A090B0D160F0D0C0C0D1B1415
          1016201D2222201D1F1F2428342C242631271F1F2D3D2D3135373A3A3A232B3F
          443F384334393A37FFDB0043010A0A0A0D0C0D1A0F0F1A37251F253737373737
          3737373737373737373737373737373737373737373737373737373737373737
          37373737373737373737373737FFC00011080018001803012200021101031101
          FFC400190001010003010000000000000000000000000501030407FFC4002910
          0002010303020407000000000000000001030200040511122141510613617114
          2231324281A1FFC4001501010100000000000000000000000000000405FFC400
          1E110002030001050000000000000000000001020003112122314191A1FFDA00
          0C03010002110311003F00F4DF1ADE5C26DED6CED99357C5308631674908446A
          403D09D47F6A5CF0F688429D86532DAEC725F191DC4FAF7F635BFC6D958F9E8C
          7D9A832F1738B0B25F6AB5E87B9209E3A03AF6AEF742E9B8294553521B381065
          1D6463C74A9F690F6B0DEC3D413E358DE73E4AF8ABA95EE36D6EA71DB26AA339
          0EC48E6951BC3195790AC7DFAD62420628628691908FD6247420687D47B52995
          38750C22AB70CA0890321182B26E378E52262E5D2979D2D9B819FC9204F046CD
          A38ED576D2FB1F3B6DA720891D34016C1327F43534A501542DAD04BD2E667196
          7376490F521B0B74B0B4B5B1D9BC984A2046279FCB5D4F6A5294FA9022E08CAD
          405E27FFD9}
        ShowHint = True
        Stretch = True
        OnClick = imgSolucionadorClick
        OnMouseEnter = imgSolucionadorMouseEnter
      end
      object lblEdtNFe: TLabeledEdit
        Left = 10
        Top = 36
        Width = 84
        Height = 24
        EditLabel.Width = 22
        EditLabel.Height = 16
        EditLabel.Caption = 'NFe'
        EditLabel.Transparent = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object lblEdtDataEmissaoNFe: TLabeledEdit
        Left = 100
        Top = 36
        Width = 87
        Height = 24
        EditLabel.Width = 77
        EditLabel.Height = 16
        EditLabel.Caption = 'Data Emissao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object lblEdtOrigemPedido: TLabeledEdit
        Left = 193
        Top = 36
        Width = 176
        Height = 24
        EditLabel.Width = 102
        EditLabel.Height = 16
        EditLabel.Caption = 'Origem do Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object lblEdtCodigoProduto: TLabeledEdit
        Left = 10
        Top = 82
        Width = 71
        Height = 24
        EditLabel.Width = 39
        EditLabel.Height = 16
        EditLabel.Caption = 'Codigo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        NumbersOnly = True
        ParentFont = False
        TabOrder = 3
      end
      object lblEdtNomeProduto: TLabeledEdit
        Left = 87
        Top = 82
        Width = 353
        Height = 24
        EditLabel.Width = 99
        EditLabel.Height = 16
        EditLabel.Caption = 'Nome do Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object lblEdtTipoProduto: TLabeledEdit
        Left = 446
        Top = 82
        Width = 132
        Height = 24
        EditLabel.Width = 91
        EditLabel.Height = 16
        EditLabel.Caption = 'Tipo de Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object lblEdtDataValidadeProduto: TLabeledEdit
        Left = 763
        Top = 82
        Width = 102
        Height = 24
        EditLabel.Width = 79
        EditLabel.Height = 16
        EditLabel.Caption = 'Data Validade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
      object lblEdtPeriodoValidade: TLabeledEdit
        Left = 871
        Top = 82
        Width = 101
        Height = 24
        EditLabel.Width = 96
        EditLabel.Height = 16
        EditLabel.Caption = 'Periodo Validade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
      end
      object lblEdtQuantProduto: TLabeledEdit
        Left = 11
        Top = 131
        Width = 70
        Height = 24
        EditLabel.Width = 65
        EditLabel.Height = 16
        EditLabel.Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        OnKeyDown = lblEdtQuantProdutoKeyDown
      end
      object dbLcbTipoOcorrencia: TDBLookupComboBox
        Left = 87
        Top = 131
        Width = 192
        Height = 24
        Cursor = crHandPoint
        CustomHint = BalloonHint
        DropDownRows = 15
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        KeyField = 'CD_TIPO_OCORRENCIA'
        ListField = 'NM_TIPO_OCORRENCIA'
        ListSource = DM.dsTipoOcorrencia
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
        OnClick = dbLcbTipoOcorrenciaClick
        OnEnter = dbLcbTipoOcorrenciaEnter
        OnKeyDown = dbLcbTipoOcorrenciaKeyDown
        OnMouseEnter = dbLcbTipoOcorrenciaMouseEnter
      end
      object dbLcbSubTipoOcorrencia: TDBLookupComboBox
        Left = 285
        Top = 131
        Width = 427
        Height = 24
        Cursor = crHandPoint
        CustomHint = BalloonHint
        DropDownRows = 15
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        KeyField = 'CD_SUBTIPO_OCORRENCIA'
        ListField = 'NM_SUBTIPO_OCORRENCIA'
        ListSource = DM.dsSubTipoOcorrencia
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
        OnClick = dbLcbSubTipoOcorrenciaClick
        OnEnter = dbLcbSubTipoOcorrenciaEnter
        OnKeyDown = dbLcbSubTipoOcorrenciaKeyDown
        OnMouseEnter = dbLcbSubTipoOcorrenciaMouseEnter
      end
      object dbLcbSituacaoEmbalagem: TDBLookupComboBox
        Left = 719
        Top = 131
        Width = 253
        Height = 24
        Cursor = crHandPoint
        DropDownRows = 15
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        KeyField = 'CD_SITUACAO_EMBALAGEM'
        ListField = 'DS_SITUACAO_EMBALAGEM'
        ListSource = DM.dsSituacaoEmbalagem
        ParentFont = False
        TabOrder = 11
        OnClick = dbLcbSituacaoEmbalagemClick
        OnEnter = dbLcbSituacaoEmbalagemEnter
        OnKeyDown = dbLcbSituacaoEmbalagemKeyDown
      end
      object dbLcbSolucionador: TDBLookupComboBox
        Left = 558
        Top = 183
        Width = 383
        Height = 24
        Cursor = crHandPoint
        DropDownRows = 10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        KeyField = 'NR_MATRIC_SOLUCIONADOR'
        ListField = 'NM_SOLUCIONADOR'
        ListSource = DM.dsSolucionador
        ParentFont = False
        TabOrder = 12
        OnClick = dbLcbSolucionadorClick
        OnEnter = dbLcbSolucionadorEnter
        OnKeyDown = dbLcbSolucionadorKeyDown
      end
      object lblEdtNomeCoordenadorSolucionador: TLabeledEdit
        Left = 558
        Top = 229
        Width = 414
        Height = 24
        EditLabel.Width = 157
        EditLabel.Height = 16
        EditLabel.Caption = 'Supervisor do Solucionador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 13
      end
      object lblEdtDataLimiteSolucao: TLabeledEdit
        Left = 558
        Top = 276
        Width = 115
        Height = 24
        EditLabel.Width = 113
        EditLabel.Height = 16
        EditLabel.Caption = 'Data Limite Solu'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 14
      end
      object lblEdtNomeRepresentante: TLabeledEdit
        Left = 679
        Top = 276
        Width = 293
        Height = 24
        EditLabel.Width = 138
        EditLabel.Height = 16
        EditLabel.Caption = 'Nome do Representante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 15
      end
      object lblEdtTransportador: TLabeledEdit
        Left = 376
        Top = 36
        Width = 329
        Height = 24
        EditLabel.Width = 82
        EditLabel.Height = 16
        EditLabel.Caption = 'Transportador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 16
      end
      object lblEdtDadosTransbordo: TLabeledEdit
        Left = 712
        Top = 36
        Width = 260
        Height = 24
        Cursor = crHandPoint
        Hint = 'Visualizar Informa'#231#227'o de Transbordo da Carga'
        EditLabel.Width = 123
        EditLabel.Height = 16
        EditLabel.Caption = 'Dados de Transbordo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 17
        OnClick = lblEdtDadosTransbordoClick
      end
      object memObservacao: TMemo
        Left = 13
        Top = 183
        Width = 539
        Height = 247
        CustomHint = BalloonHint
        Anchors = [akLeft, akTop, akBottom]
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        MaxLength = 300
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 20
        OnChange = memObservacaoChange
        OnKeyDown = memObservacaoKeyDown
        OnKeyPress = memObservacaoKeyPress
        OnMouseEnter = memObservacaoMouseEnter
      end
      object lblEdtLoteProduto: TLabeledEdit
        Left = 584
        Top = 82
        Width = 173
        Height = 24
        EditLabel.Width = 90
        EditLabel.Height = 16
        EditLabel.Caption = 'Lote do Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 21
      end
      object lblEdtEmailExtra: TLabeledEdit
        Left = 558
        Top = 363
        Width = 414
        Height = 24
        CharCase = ecLowerCase
        EditLabel.Width = 64
        EditLabel.Height = 16
        EditLabel.Caption = 'Email Extra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 18
        OnChange = lblEdtEmailExtraChange
        OnEnter = lblEdtEmailExtraEnter
        OnKeyDown = lblEdtEmailExtraKeyDown
      end
      object dblkEmailExtra: TDBLookupListBox
        Left = 558
        Top = 386
        Width = 414
        Height = 36
        Cursor = crHandPoint
        KeyField = 'DS_EMAIL'
        ListField = 'NM_USUARIO'
        ListSource = DM.dsListaEmailusuario
        TabOrder = 19
        Visible = False
        OnDblClick = dblkEmailExtraDblClick
        OnKeyDown = dblkEmailExtraKeyDown
      end
      object cbxAutorizarRecMercadoria: TCheckBox
        Left = 558
        Top = 306
        Width = 243
        Height = 17
        Hint = 'Utilize a tecla "F4" para marcar e desmarcar esta op'#231#227'o !!!'
        Caption = 'Autorizar Recolhimento da Mercadoria'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 22
      end
      object cbxAlertarRegistroForaPrazo: TCheckBox
        Left = 558
        Top = 325
        Width = 199
        Height = 17
        Caption = 'Alertar Registro Fora do Prazo'
        TabOrder = 23
      end
      object chkIncluirEmailDoTransportador: TCheckBox
        Left = 763
        Top = 325
        Width = 197
        Height = 17
        Hint = 'Utilize a tecla "F6" para marcar e desmarcar esta op'#231#227'o !!!'
        Caption = 'Incluir Email do Transportador'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 24
      end
      object chkIncluirTodosItens: TCheckBox
        Left = 800
        Top = 306
        Width = 197
        Height = 17
        Hint = 'Utilize a tecla "F7" para marcar e desmarcar esta op'#231#227'o !!!'
        Caption = 'Incluir todos os Itens da NFe'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 25
      end
    end
    object gbxConsultaGenerica: TGroupBox
      Left = 34
      Top = 353
      Width = 498
      Height = 227
      Caption = '  Consulta  '
      TabOrder = 4
      Visible = False
      object dbgConsultaGenerica: TDBGrid
        AlignWithMargins = True
        Left = 5
        Top = 21
        Width = 488
        Height = 182
        Cursor = crHandPoint
        CustomHint = BalloonHint
        Align = alClient
        Ctl3D = True
        DataSource = DM.dsGenerica
        DrawingStyle = gdsGradient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = [fsBold]
        OnDblClick = dbgConsultaGenericaDblClick
        OnKeyDown = dbgConsultaGenericaKeyDown
        OnMouseEnter = dbgConsultaGenericaMouseEnter
        OnTitleClick = dbgConsultaGenericaTitleClick
      end
      object StatusBarGridConsultaGenerica: TStatusBar
        Left = 2
        Top = 206
        Width = 494
        Height = 19
        Panels = <>
        SimpleText = 
          '[F1]=Incluir a NFe na Ocorr'#234'ncia - [F2]=Inf. de Volumes - [Duplo' +
          ' Click/Enter] = Visualizar Item   '
      end
    end
    object gbxRelacaoItemNFe: TGroupBox
      Left = 94
      Top = 381
      Width = 469
      Height = 172
      Caption = '  Rela'#231#227'o de Itens  NFe  '
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 5
      Visible = False
      object dbgItemNFe: TDBGrid
        AlignWithMargins = True
        Left = 4
        Top = 20
        Width = 461
        Height = 129
        Cursor = crHandPoint
        CustomHint = BalloonHint
        Align = alClient
        Ctl3D = True
        DataSource = DM.dsItemNFe
        DrawingStyle = gdsGradient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = dbgItemNFeDrawColumnCell
        OnDblClick = dbgItemNFeDblClick
        OnKeyDown = dbgItemNFeKeyDown
        OnMouseEnter = dbgItemNFeMouseEnter
        OnTitleClick = dbgItemNFeTitleClick
      end
      object StatusBarItemConsulta: TStatusBar
        Left = 1
        Top = 152
        Width = 467
        Height = 19
        Panels = <>
        SimplePanel = True
      end
    end
  end
  object tBarAtendimento: TToolBar
    Left = 0
    Top = 0
    Width = 1001
    Height = 43
    Cursor = crHandPoint
    ButtonHeight = 39
    ButtonWidth = 122
    Caption = 'tbarAtendimento'
    DrawingStyle = dsGradient
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Images = ImageList
    ParentFont = False
    PopupMenu = PopupMenu
    ShowCaptions = True
    TabOrder = 0
    Transparent = True
    object tBtnLimpar: TToolButton
      Left = 0
      Top = 0
      Caption = '&Limpar'
      ImageIndex = 19
      OnClick = tBtnLimparClick
    end
    object tBtnSalvarItem: TToolButton
      Left = 122
      Top = 0
      Caption = '&Salvar Item'
      Enabled = False
      ImageIndex = 8
      OnClick = tBtnSalvarItemClick
    end
    object tBtnExcluiritem: TToolButton
      Left = 244
      Top = 0
      Caption = '&Excluir Item'
      Enabled = False
      ImageIndex = 10
      OnClick = tBtnExcluiritemClick
    end
    object tBtnSolucao: TToolButton
      Left = 366
      Top = 0
      Caption = 'Solu&'#231#227'o'
      ImageIndex = 20
      OnClick = tBtnSolucaoClick
    end
    object tbtnCausa: TToolButton
      Left = 488
      Top = 0
      Caption = '&Causa'
      ImageIndex = 16
      OnClick = tbtnCausaClick
    end
    object tBtnCancelarRegistro: TToolButton
      Left = 610
      Top = 0
      Caption = 'Can&celar Registro'
      Enabled = False
      ImageIndex = 7
      OnClick = tBtnCancelarRegistroClick
    end
    object tBtnFechar: TToolButton
      Left = 732
      Top = 0
      AutoSize = True
      Caption = '        &Fechar        '
      ImageIndex = 21
      OnClick = tBtnFecharClick
    end
  end
  object tmrHorario: TTimer
    OnTimer = tmrHorarioTimer
    Left = 240
    Top = 472
  end
  object BalloonHint: TBalloonHint
    Images = ImageList
    HideAfter = 2000
    Left = 416
    Top = 472
  end
  object PopupMenu: TPopupMenu
    Left = 872
    Top = 8
    object AtualizarDadosExternos1: TMenuItem
      Caption = 'Atualizar Dados Externos'
      OnClick = AtualizarDadosExternos1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object menuReEnviarEmail: TMenuItem
      Caption = 'ReEnviar Email'
      Enabled = False
      OnClick = menuReEnviarEmailClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object menuReabrirOcorrencia: TMenuItem
      Caption = 'Reabrir Item'
      Enabled = False
      OnClick = menuReabrirOcorrenciaClick
    end
  end
  object ImageList: TImageList
    Left = 312
    Top = 480
    Bitmap = {
      494C010116001E00C80110001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000006000000001002000000000000060
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      FF00000084000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084828400000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      FF00000084000000FF0000000000008284000000000000000000000000000000
      8400000084000000840000008400000084000000840000008400000084000000
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008482840000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      FF00000084000000FF0000828400008284000000000000000000000000000000
      8400000084000000840000008400000084000000840000008400000084000000
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      FF00000084000000FF0000828400008284000000000000000000000000000000
      8400000084000000840000008400000084000000840000008400000084000000
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      FF00000084000000FF0000828400000000000000000000000000000000000000
      8400000084000000840000008400000084000000840000008400000084000000
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084828400000000000000
      000000000000FFFFFF00000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      8400000084000000840000008400000084000000840000008400000084000000
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848284000000
      0000FFFFFF000000000084828400000000000000000000000000000084000000
      8400000084000000840000008400000000000000000000000000000000000000
      8400000084000000840000008400000084000000840000008400000084000000
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008482840000000000000000000000000000828400008284000082
      8400000000000000000000000000000000000000000000000000000000000000
      840000008400000084000000840000008400000084000000840000FFFF000000
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000082840000828400008284000000
      0000000000000000000000000000000000000000000000000000000000000000
      8400000084000000840000008400000084000000840000008400000084000000
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008284000082840000828400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8400000084000000840000008400000084000000840000008400000084000000
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000828400008284000082840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      840000008400FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000084000000
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000082840000828400008284000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      840000008400FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000084000000
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000828400000000000000000000000000000000008482
      8400000000008482840000000000000000000000000000000000000000000000
      840000008400FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000084000000
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008482
      8400000000008482840000000000000000000000000000000000000000000000
      8400000084000000840000008400000084000000840000008400000084000000
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008284000000
      0000000000000000000000000000848284000000000000000000000000008482
      8400000000008482840000000000000000000000000000000000000000000000
      8400000084000000840000008400000084000000840000008400000084000000
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008284000082
      8400000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000840000008400000084000000840000008400000084000000
      8400000084000000000000000000000000000000000000FFFF0000FFFF000000
      00000000FF000000840000008400000084000000840000008400000084000000
      8400000084000000000000FFFF0000FFFF000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000008400000084000000
      00000000FF00C6C3C60000000000C6C3C60000000000C6C3C60000000000C6C3
      C600000084000000000000000000000000000000000000008400000084000000
      00000000FF00C6C3C60000000000C6C3C60000000000C6C3C60000000000C6C3
      C600000084000000000000FFFF00000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000000000FFFF00000000840000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000084000000000000000000000000000000840000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000840000000000000000000000000000000000000000000000FF000000
      FF000000FF0000000000848284000000000084828400000000000000FF000000
      FF000000FF0000000000000000000000000000000000FFFFFF0000000000FFFF
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000FFFF00000000840000000000000000000000
      0000000000000000FF00C6C3C60000000000C6C3C60000000000C6C3C6000000
      FF00000000000000000000000000000000000000840000000000000000000000
      0000000000000000FF00C6C3C60000000000C6C3C60000000000C6C3C6000000
      FF0000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF00000000000000000000000000FFFFFF00FFFFFF000000
      000000000000FFFFFF0000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000FFFF00000000840000000000000000000000
      000000008400000000000000FF000000FF000000FF000000FF000000FF000000
      0000000084000000000000000000000000000000840000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000000084828400000000008482840000000000000000000000
      00000000FF000000FF00000000000000000000000000FFFFFF00FFFF00000000
      000000FFFF000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000FFFF00008482840000000000000084000000
      8400000084000000000000000000000000000000000000000000000000000000
      00000000840000008400000084000000000000FFFF0000000000000084000000
      840000FFFF000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000FFFF000000000000000000000000FF000000
      FF000000FF000000000000008400000084000000840000008400000084000000
      00000000FF000000FF000000FF000000000000FFFF0000000000000084000000
      8400000084000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      000000FFFF0000FFFF0000FFFF0000FFFF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000000000000000FFFFFF00FFFF0000FFFF
      0000FFFF00000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000FFFF0000000000FFFF00000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000084000000
      84000000840000000000C6C3C60000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000000084828400000000008482840000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000FFFF00000000000000000000FFFF00FFFF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000000008400000000000000000000000000000000000000FF000000
      FF0000008400000084000000840000FFFF0000FFFF0000000000000000000000
      8400000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000000000008400000000000000840000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF00000000000000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000084000000
      FF000000FF000000FF0000008400000000000000000000008400000000000000
      8400000084000000840000000000000000000000FF000000FF00000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF00000084000000
      FF000000FF000000FF000000000000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF00000000000000000000000000FFFFFF000000
      0000FFFFFF0000000000FFFFFF0000000000FFFFFF000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0084828400000084000000000000000000000084000000FF000000
      FF0000008400000084000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000848284000000
      00008482840000000000848284000000000084828400000000000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000000000000000000000000000FFFF0000FFFF0084828400000000000000
      84000000840000FFFF00000000000000000000000000000000000000FF000000
      FF000000FF0000000000848284000000000084828400000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000848284000000
      0000848284000000000084828400000000008482840000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      00000000000000FFFF0000FFFF00000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF0000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF00000000000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF00000000000000000084828400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084828400000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF000000000000000000FFFFFF00848284008482
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008482840084828400FFFFFF00000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFFFF00000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF000082840000FFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00848284008482840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000082840000FFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000082
      840000FFFF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00848284000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF00848284008482840084828400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF000082840000FF
      FF000000000000000000000000000000000000000000FFFFFF00848284000000
      000084828400FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084828400000000000000
      000000000000000000000000000000000000000000000082840000FFFF000000
      000000000000000000000000000000000000000000000000000084828400FFFF
      0000FFFF0000FFFF000000000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF0084828400FFFFFF00848284008482840084828400FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      000000000000000000000000000000000000848284000000000000FFFF0000FF
      FF0000FFFF00000000000000000000FFFF000082840000FFFF00000000000000
      0000000000000000000000000000000000000000000084828400848284008482
      8400848284008482840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF000082840000FFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000084828400FFFF
      0000FFFF0000FFFF000000000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF008482840084828400FFFFFF0084828400FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      00000000FF000000FF0000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848284000000
      000084828400FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFFFF0000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      00000000FF000000FF0000000000000000000000000000FFFF0000FFFF000000
      0000000000000082840000FFFF0000FFFF000000000084828400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848284000000000000000000FFFFFF00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF00000000000000000000000000
      000000000000000000000000000000000000848284008482840000FFFF000000
      0000000000000082840000FFFF0000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF00008284000082840000FFFF0000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000008482840000000000848284000000000084828400000000008482
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008482
      840000FFFF0000FFFF0000FFFF0000FFFF000000000084828400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000008482840000000000848284000000000084828400000000008482
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008482
      8400000000000000000000000000000000008482840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848284000000
      0000848284008482840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C3C6000000
      0000C6C3C600C6C3C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C3C600C6C3
      C600C6C3C600C6C3C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000848284000000000084828400000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF008482840000000000848284000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFFFF000000
      00000000000000000000FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF00000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF00000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000FFFFFF0000000000C6C3C600000000000000
      0000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000C6C3C60000000000FF000000FF000000FF00
      00000000FF00FF000000FF00000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF0000000000000000000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000084000000000000008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      FF000000FF000000FF000000000000000000FFFF00000000000000FFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000000000000000000000000000
      000000000000000000000000FF000000840000000000000084000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF0000000000FFFFFF000000000000000000FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      00000000000000000000FFFFFF0000000000FFFFFF00000000000000FF000000
      FF000000FF000000FF000000FF000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000000000000000000000000000FF000000
      FF0000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF0000000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000000000000000000000000000FF000000
      FF000000FF00000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF0000000000C6C3C600FFFFFF000000
      0000FFFFFF0000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      FF000000FF000000FF000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF0000000000FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000848284000000000084828400000000000000
      00000000FF000000FF000000FF0000000000000000000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000C6C3
      C600FFFFFF0000000000FFFFFF00000000000000000000000000848284000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C3C6000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000C6C3
      C600000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      000000FFFF0000000000000000000000000000FFFF0000000000008284000000
      0000C6C3C6000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000000000848284008482840000FFFF0000FFFF0000FFFF00848284008482
      84000000000000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000000000008284000082
      8400000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000840000008400000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF0000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000008284000082
      8400000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000084000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF00000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000000000000000000000000000000000FFFF000000
      0000000000000000000000FFFF0000000000C6C3C60000000000008284000082
      8400000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      84000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF00000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000000000C6C3C60000000000008284000082
      8400000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      00000082840000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000FF000000
      FF0000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000008284000082
      8400000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000000000FF
      FF000000000000828400000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008482840000000000008284000082
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      000000FFFF0000000000008284000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00848284008482840000000000008284000082
      840000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF000000000000FFFF00008284000082840000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000082
      8400000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF000082840000000000FFFFFF0000000000C6C3
      C600FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008482
      8400848284008482840084828400848284008482840084828400000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00848284008482840084828400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000082840000FFFF000082840000FFFF000082840000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000082840000FFFF000082840000FF
      FF00000000000000000000000000000000000000000000000000000000008482
      8400848284008482840084828400848284008482840000000000000000000000
      0000848284000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084828400000000000000000000000000000000000000
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
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000FF000000FF000000FF000000FF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C3C60000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF0000000000000000000000000000000000FFFF0000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000848284008482
      8400000000000000000000000000000000000000000000000000000000000000
      0000848284008482840000000000000000000000000000000000000000000000
      000000000000848284000000000084828400C6C3C60084828400000000000000
      00000000000000000000000000000000FF0000000000000000000000FF000000
      FF000000000000000000848284000000000084828400000000000000FF000000
      FF000000FF00000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848284008482840000000000C6C3C600C6C3C600C6C3C600000000000000
      000000000000000000000000FF0000000000000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF000000
      000000000000FFFFFF00FFFFFF000000000000000000000000000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000848284008482840000000000C6C3C600C6C3C600C6C3C600000000000000
      0000000000000000FF000000000000000000000000000000FF00000000000000
      FF000000FF000000FF0084828400000000008482840000000000000000000000
      00000000FF000000FF000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000000000000000000000FF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008482
      840084828400848284000000000000000000C6C3C600C6C3C600000000000000
      00000000FF000000000000000000000000000000FF000000FF00000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF0000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000008482840000000000C6C3
      C600C6C3C600C6C3C60000000000C6C3C60000000000C6C3C600848284000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF0000000000FFFF00000000000000FFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084828400000000008482
      8400848284008482840000000000C6C3C60000000000C6C3C600848284000000
      00000000FF000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000084828400000000008482840000000000000000000000
      0000000000000000FF000000FF000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00000000000000000000FFFF0000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00000000000000000000000000848284008482
      8400000000000000000000000000000000000000000000000000000000000000
      00008482840084828400000000000000000000000000C6C3C60000000000C6C3
      C600C6C3C600C6C3C60000000000C6C3C60000000000C6C3C600848284000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000000000840000000000000084000000FF00000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C3
      C600C6C3C600C6C3C6000000000000000000C6C3C600C6C3C600000000000000
      00000000FF000000000000000000000000000000FF000000FF00000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000C6C3C600C6C3C6000000000084828400C6C3C600C6C3C600000000000000
      0000000000000000FF000000000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000FF0000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000FFFFFF00FFFFFF000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF000000000000000000000000000000FF000000
      FF000000FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000C6C3C600C6C3C600000000008482840084828400C6C3C600000000000000
      000000000000000000000000FF0000000000000000000000FF000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      000000FFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      000000000000C6C3C60084828400848284008482840084828400000000000000
      00000000000000000000000000000000FF0000000000000000000000FF000000
      FF000000FF000000000084828400000000008482840000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848284008482840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C3C600000000008482840000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000600000000100010000000000000300000000000000000000
      000000000000000000000000FFFFFF00F862C0070000000080E0C00700000000
      01E0C0070000000001E0C0070000000031E1C0070000000031C1C00700000000
      C181C00700000000C307C00700000000FE17C00700000000CC37C00700000000
      A877C0070000000040F7C0070000000001E3C00700000000C1E3C00700000000
      C0E3C00700000000C83FC00700000000803FE003A002FFFF001FE0038000F83F
      000480038001E00F000060036003C4470000700770078C6300000000780F9C73
      0000000000003FF90000800000003EF90000C001807F3C7F0000E00380433C7F
      0007FFFFC0013C41001FFFFFE0019C61000FFFFFE0038C718007FFFFCE03C441
      8023FFFF9E79E00D5577FFFF3E7CF83FFFFFFFF88000F007E7F8FFF80000C003
      E7F8FFE00000800381FFFFE00000800381FCFF8100008003E7FCFF0300008003
      E7FFFF0700008003FFFC840F00008003FEFC001F00008003FE7F003F80008003
      8013007FC00080038013003FF0008003FE7F003FFC008003FEF8803FFC01B007
      FFF8C03FFC03D007FFFFE07FFC07EAAFFF00FFFFFFFFFFFFFF00FFF8FFFFFC00
      FF0020F8C631FC00FF00007FE223FC000000007CF007FC000000003CF88FEC00
      0000000FFC1FE40000000004FE3FE0000023000CFC1F0000000101FFF80F0001
      0000E3FCF00700030023FFFCE22300070063FFFFC631000F00C3FFF8FFFFE3FF
      0107FFF8FFFFE7FF03FFFFFFFFFFEFFF847FFFDFC01F800100EFFFCFC00F0000
      31BFFFC7E007000039FF0003E0030000993F000180030000CA1F000080070000
      F40F0001800700009C070003800700009603000780070000CB01000F80070000
      FF80001FE0078001F7C0007FC007C003FFE000FFC007C003EFF001FFE007C003
      FFF803FFF803C003FFFCFFFFFC03C003FC0083C0FFFFFFFFFC000000FC7BF83F
      200003C0F837E00F000087E1F03ECC47000087E1E01D84630000CFF3E01BA073
      000003C0801731F9000003C0001F38F9000003C000103C79000087E1001F3C39
      E00087E180173C19F800D81BE01B9C0BF000C003E01D8C43E001E007F03EC467
      C403FC3FF837E00FEC07FC3FFC7BF83F00000000000000000000000000000000
      000000000000}
  end
end
