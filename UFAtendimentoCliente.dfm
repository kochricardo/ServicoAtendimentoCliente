object FAtendimentoCliente: TFAtendimentoCliente
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize, biHelp]
  Caption = 'SAC - Atendimento '
  ClientHeight = 610
  ClientWidth = 1248
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TStatusBar
    Left = 0
    Top = 591
    Width = 1248
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object gbxPrincipal: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 48
    Width = 1242
    Height = 540
    Align = alClient
    Caption = '  Dados do Atendimento  '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object gbxDadosOcorrencia: TGroupBox
      AlignWithMargins = True
      Left = 5
      Top = 344
      Width = 1232
      Height = 191
      Align = alBottom
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = ' Dados da Ocorr'#234'ncia  '
      Enabled = False
      TabOrder = 0
      object gbxItemOcorrencia: TGroupBox
        Left = 2
        Top = 18
        Width = 1228
        Height = 171
        Align = alClient
        Caption = '  Lista de Itens  '
        TabOrder = 0
        object wbLigacaoAuto: TWebBrowser
          Left = 20
          Top = 160
          Width = 300
          Height = 30
          TabOrder = 1
          OnDownloadBegin = wbLigacaoAutoDownloadBegin
          OnDocumentComplete = wbLigacaoAutoDocumentComplete
          OnQuit = wbLigacaoAutoQuit
          ControlData = {
            4C000000021F00001A0300000000000000000000000000000000000000000000
            000000004C000000000000000000000001000000E0D057007335CF11AE690800
            2B2E126208000000000000004C0000000114020000000000C000000000000046
            8000000000000000000000000000000000000000000000000000000000000000
            00000000000000000100000000000000000000000000000000000000}
        end
        object dbgrItemOcorrencia: TDBGrid
          AlignWithMargins = True
          Left = 5
          Top = 21
          Width = 1218
          Height = 145
          Align = alClient
          DataSource = DM.dsItemOcorrencia
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = dbgrItemOcorrenciaDrawColumnCell
          OnKeyDown = dbgrItemOcorrenciaKeyDown
          OnTitleClick = dbgrItemOcorrenciaTitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'nrSequencia'
              Title.Alignment = taCenter
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dsTipoOcorrencia'
              Title.Alignment = taCenter
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dsSubTipoOcorrencia'
              Title.Alignment = taCenter
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dsProduto'
              Title.Alignment = taCenter
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dsTipoProduto'
              Title.Alignment = taCenter
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cdEmpresa'
              Title.Alignment = taCenter
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nrNFe'
              Title.Alignment = taCenter
              Title.Caption = 'NFe'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dataEmissao'
              Title.Alignment = taCenter
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dsOrigemPedido'
              Title.Alignment = taCenter
              Width = 110
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'quantProduto'
              Title.Alignment = taCenter
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dataValidadeProduto'
              Title.Alignment = taCenter
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'prazoValidade'
              Title.Alignment = taCenter
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dsSituacaoEmbalagem'
              Title.Alignment = taCenter
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'descricaoOcorrencia'
              Title.Alignment = taCenter
              Width = 500
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nomeSolucionador'
              Title.Alignment = taCenter
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cdSetor'
              Title.Alignment = taCenter
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nomeTransportador'
              Title.Alignment = taCenter
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dsTransbordoCarga'
              Title.Alignment = taCenter
              Width = 500
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dsStatusSolucao'
              Title.Alignment = taCenter
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dsStatusCausa'
              Title.Alignment = taCenter
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dataLimite'
              Title.Alignment = taCenter
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dsAreaOrigem'
              Title.Alignment = taCenter
              Width = 150
              Visible = True
            end>
        end
      end
    end
    object gbxDadosCliente: TGroupBox
      AlignWithMargins = True
      Left = 5
      Top = 106
      Width = 695
      Height = 232
      Align = alLeft
      Caption = '  Dados do Cliente  '
      TabOrder = 1
      object lblEdtRazaoSocial: TLabeledEdit
        Left = 199
        Top = 36
        Width = 365
        Height = 21
        CharCase = ecUpperCase
        Color = clCream
        EditLabel.Width = 73
        EditLabel.Height = 16
        EditLabel.Caption = 'Raz'#227'o Social'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object lblEdtCidade: TLabeledEdit
        Left = 374
        Top = 77
        Width = 283
        Height = 21
        CharCase = ecUpperCase
        Color = clCream
        EditLabel.Width = 39
        EditLabel.Height = 16
        EditLabel.Caption = 'Cidade'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object lblEdtUF: TLabeledEdit
        Left = 663
        Top = 77
        Width = 25
        Height = 21
        Color = clCream
        EditLabel.Width = 15
        EditLabel.Height = 16
        EditLabel.Caption = 'UF'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object lblEdtSetor: TLabeledEdit
        Left = 10
        Top = 118
        Width = 333
        Height = 21
        CharCase = ecUpperCase
        Color = clCream
        EditLabel.Width = 31
        EditLabel.Height = 16
        EditLabel.Caption = 'Setor'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object lblEdtDtUltimaCompra: TLabeledEdit
        Left = 514
        Top = 118
        Width = 84
        Height = 21
        Color = clCream
        EditLabel.Width = 85
        EditLabel.Height = 16
        EditLabel.Caption = #218'ltima Compra'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object lblEdtVencAlvara: TLabeledEdit
        Left = 604
        Top = 118
        Width = 84
        Height = 21
        Color = clCream
        EditLabel.Width = 72
        EditLabel.Height = 16
        EditLabel.Caption = 'Venc. Alvar'#225
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
        OnChange = lblEdtVencAlvaraChange
      end
      object lblEdtSituacaoCliente: TLabeledEdit
        Left = 570
        Top = 36
        Width = 118
        Height = 21
        CharCase = ecUpperCase
        Color = clCream
        EditLabel.Width = 92
        EditLabel.Height = 16
        EditLabel.Caption = 'Situa'#231#227'o Cliente'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
      end
      object lblEdtCodigoCliente: TLabeledEdit
        Left = 10
        Top = 36
        Width = 55
        Height = 21
        Color = clCream
        EditLabel.Width = 39
        EditLabel.Height = 16
        EditLabel.Caption = 'C'#243'digo'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
      end
      object lblEdtCNPJ: TLabeledEdit
        Left = 71
        Top = 36
        Width = 122
        Height = 21
        Color = clCream
        EditLabel.Width = 28
        EditLabel.Height = 16
        EditLabel.Caption = 'CNPJ'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
      end
      object lblEdtEnderecoCliente: TLabeledEdit
        Left = 10
        Top = 77
        Width = 358
        Height = 21
        Color = clCream
        EditLabel.Width = 53
        EditLabel.Height = 16
        EditLabel.Caption = 'Endere'#231'o'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 10
      end
      object lblEdtEmailNFe1: TLabeledEdit
        Left = 10
        Top = 160
        Width = 336
        Height = 21
        Color = clCream
        EditLabel.Width = 109
        EditLabel.Height = 16
        EditLabel.Caption = 'Email NFe Principal'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 11
      end
      object lblEdtEmailNFe2: TLabeledEdit
        Left = 352
        Top = 160
        Width = 336
        Height = 21
        Color = clCream
        EditLabel.Width = 93
        EditLabel.Height = 16
        EditLabel.Caption = 'Email NFe C'#243'pia'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 12
      end
      object lblEdtEntregador: TLabeledEdit
        Left = 349
        Top = 118
        Width = 159
        Height = 21
        CharCase = ecUpperCase
        Color = clCream
        EditLabel.Width = 119
        EditLabel.Height = 16
        EditLabel.Caption = 'Cam Sec/Entregador'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
    end
    object gbxIdentificacaoCliente: TGroupBox
      AlignWithMargins = True
      Left = 5
      Top = 21
      Width = 1232
      Height = 79
      Align = alTop
      Caption = '  Identifica'#231#227'o   '
      Color = clWhite
      ParentBackground = False
      ParentColor = False
      TabOrder = 2
      object gbxControleOcorrencia: TGroupBox
        AlignWithMargins = True
        Left = 686
        Top = 21
        Width = 540
        Height = 53
        Align = alLeft
        Anchors = [akLeft, akTop, akRight, akBottom]
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
        TabOrder = 0
        object lblControle: TLabel
          Left = 6
          Top = 15
          Width = 102
          Height = 33
          Caption = '000000'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -27
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object lblHorarioAtual: TLabel
          Left = 118
          Top = 22
          Width = 172
          Height = 18
          Alignment = taCenter
          Caption = '99/99/9999 00:00:00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object rdpFiltroPesquisa: TRadioGroup
        AlignWithMargins = True
        Left = 5
        Top = 21
        Width = 473
        Height = 53
        Align = alLeft
        Caption = '  Tipo de Pesquisa  '
        Columns = 5
        Enabled = False
        Items.Strings = (
          '&Codigo'
          'CNP&J'
          '&NFe'
          '&Duplicata'
          '&Raz'#227'o Social')
        TabOrder = 1
        OnClick = rdpFiltroPesquisaClick
      end
      object gbxFiltroPesquisa: TGroupBox
        AlignWithMargins = True
        Left = 484
        Top = 21
        Width = 196
        Height = 53
        Align = alLeft
        Caption = '  Filtro da Pesquisa  '
        TabOrder = 2
        object lblFiltroPesquisa: TLabel
          Left = 7
          Top = 26
          Width = 39
          Height = 16
          Caption = 'C'#243'digo'
        end
        object edtFiltroPesquisa: TEdit
          Left = 52
          Top = 21
          Width = 133
          Height = 24
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 0
          OnKeyDown = edtFiltroPesquisaKeyDown
        end
      end
    end
    object gbxInformacaoAdicional: TGroupBox
      AlignWithMargins = True
      Left = 706
      Top = 106
      Width = 531
      Height = 232
      Align = alRight
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = '  Informa'#231#245'es Adicionais    '
      TabOrder = 3
      DesignSize = (
        531
        232)
      object lblObservacao: TLabel
        Left = 149
        Top = 111
        Width = 119
        Height = 16
        Caption = 'Observa'#231#227'o Principal'
      end
      object lblContMemo: TLabel
        Left = 484
        Top = 111
        Width = 33
        Height = 16
        Anchors = [akTop, akRight]
        Caption = '0/200'
        ExplicitLeft = 307
      end
      object memObsOcorrencia: TMemo
        AlignWithMargins = True
        Left = 149
        Top = 133
        Width = 374
        Height = 52
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        MaxLength = 200
        ParentShowHint = False
        ScrollBars = ssVertical
        ShowHint = False
        TabOrder = 4
        OnChange = memObsOcorrenciaChange
        OnKeyDown = memObsOcorrenciaKeyDown
        OnKeyPress = memObsOcorrenciaKeyPress
      end
      object rdpPrioridade: TRadioGroup
        AlignWithMargins = True
        Left = 5
        Top = 118
        Width = 138
        Height = 68
        Caption = '  Prioridade '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          '&Normal'
          '&Alta Prioridade')
        ParentFont = False
        TabOrder = 5
        OnClick = rdpPrioridadeClick
      end
      object lblEdtContato: TLabeledEdit
        Left = 272
        Top = 36
        Width = 165
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 44
        EditLabel.Height = 16
        EditLabel.Caption = 'Contato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnEnter = lblEdtTelefoneClienteEnter
        OnKeyPress = lblEdtContatoKeyPress
      end
      object btnAdicioaritemOcorrencia: TBitBtn
        AlignWithMargins = True
        Left = 441
        Top = 31
        Width = 122
        Height = 35
        Cursor = crHandPoint
        Hint = 'Iniciar Ocorr'#234'ncia'
        Caption = 'Adicionar Item'
        DoubleBuffered = True
        Enabled = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333FF33333333FF333993333333300033377F3333333777333993333333
          300033F77FFF3333377739999993333333333777777F3333333F399999933333
          33003777777333333377333993333333330033377F3333333377333993333333
          3333333773333333333F333333333333330033333333F33333773333333C3333
          330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
          993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
          333333333337733333FF3333333C333330003333333733333777333333333333
          3000333333333333377733333333333333333333333333333333}
        NumGlyphs = 2
        ParentDoubleBuffered = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        WordWrap = True
        OnClick = btnAdicioaritemOcorrenciaClick
      end
      object lblEdtTelefoneCliente: TLabeledEdit
        Left = 149
        Top = 36
        Width = 117
        Height = 21
        CharCase = ecUpperCase
        EditLabel.Width = 50
        EditLabel.Height = 16
        EditLabel.Caption = 'Telefone'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnEnter = lblEdtTelefoneClienteEnter
        OnExit = lblEdtTelefoneClienteExit
        OnKeyPress = lblEdtContatoKeyPress
      end
      object lblEdtEmailSacCliente: TLabeledEdit
        Left = 149
        Top = 80
        Width = 372
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecLowerCase
        EditLabel.Width = 59
        EditLabel.Height = 16
        EditLabel.Caption = 'Email SAC'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnEnter = lblEdtTelefoneClienteEnter
        OnKeyPress = lblEdtContatoKeyPress
      end
      object rdpMeioDeContato: TRadioGroup
        Left = 5
        Top = 18
        Width = 138
        Height = 95
        Caption = 'Meio de Contato  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          'Solicita'#231#227'o &Interna'
          '&Email'
          '&Telefone - SAC')
        ParentFont = False
        TabOrder = 6
      end
      object _lbeArquivoOcorrencia: TLabeledEdit
        Left = 12
        Top = 208
        Width = 372
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecLowerCase
        EditLabel.Width = 147
        EditLabel.Height = 16
        EditLabel.Caption = 'Arquivo Ref. a Ocorrencia'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        Visible = False
        OnEnter = lblEdtTelefoneClienteEnter
        OnKeyPress = lblEdtContatoKeyPress
      end
      object _btnLocalizaArquivo: TBitBtn
        Left = 390
        Top = 206
        Width = 41
        Height = 23
        Hint = 'Seleciona Arquivo'
        Anchors = [akTop, akRight]
        DoubleBuffered = True
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888800000088888008888888888800000088880FF000000000080000008880
          F0080FFFFFFF08000000880F0FF00F00000F0800000080F0F0080FFFFFFF0800
          0000880F0FF00F00000F0800000080F0F0080FFFFFFF08000000880F0FB00F00
          F0000800000080F0FBFB0FFFF0F088000000880FBFBF0FFFF0088800000080FB
          FBFB00000088880000008800BFBFBFBF088888000000888800FBFBF088888800
          000088888800B808888888000000888888880088888888000000888888888888
          888888000000888888888888888888000000}
        ParentDoubleBuffered = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        Visible = False
        OnClick = _btnLocalizaArquivoClick
      end
    end
  end
  object TBarAtendimento: TToolBar
    Left = 0
    Top = 0
    Width = 1248
    Height = 45
    Cursor = crHandPoint
    ButtonHeight = 39
    ButtonWidth = 165
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
    ShowCaptions = True
    TabOrder = 0
    Transparent = True
    object tBtnInicar: TToolButton
      Left = 0
      Top = 0
      AutoSize = True
      Caption = 'Iniciar Atendimento [F1]'
      ImageIndex = 18
      OnClick = tBtnInicarClick
    end
    object tBtnCancelar: TToolButton
      Left = 169
      Top = 0
      Caption = '&Limpar'
      Enabled = False
      ImageIndex = 4
      OnClick = tBtnCancelarClick
    end
    object tBtnSalvar: TToolButton
      Left = 334
      Top = 0
      Caption = 'Salva&r'
      Enabled = False
      ImageIndex = 8
      OnClick = tBtnSalvarClick
    end
    object tBtnInicarPesquisaSatisfacao: TToolButton
      Left = 499
      Top = 0
      Caption = '&Pesquisa de Satisfa'#231#227'o'
      Enabled = False
      ImageIndex = 16
    end
    object tBtnFechar: TToolButton
      Left = 664
      Top = 0
      Caption = '&Fechar'
      ImageIndex = 21
      OnClick = tBtnFecharClick
    end
  end
  object tmrHorario: TTimer
    Enabled = False
    OnTimer = tmrHorarioTimer
    Left = 216
    Top = 448
  end
  object ImageList: TImageList
    Left = 88
    Top = 448
    Bitmap = {
      494C010116001E00A00010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
  object _opdLocalizaArquivo: TOpenDialog
    Filter = 'Todos|*.*|Arquivos PDF|*.PDF'
    OptionsEx = [ofExNoPlacesBar]
    Left = 1136
    Top = 352
  end
  object _IdFTP: TIdFTP
    IPVersion = Id_IPv4
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 1176
    Top = 344
  end
end
