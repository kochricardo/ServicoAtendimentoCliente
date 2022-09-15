object FCadastroGeral: TFCadastroGeral
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'SAC -  Cadastro Geral'
  ClientHeight = 539
  ClientWidth = 1015
  Color = clWhite
  DockSite = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object StatusBar1: TStatusBar
    Left = 0
    Top = 520
    Width = 1015
    Height = 19
    Panels = <>
  end
  object tvwTipoDeCadastro: TTreeView
    Left = 0
    Top = 0
    Width = 233
    Height = 520
    Cursor = crHandPoint
    Align = alLeft
    Indent = 19
    ReadOnly = True
    TabOrder = 2
    OnClick = tvwTipoDeCadastroClick
    Items.NodeData = {
      030C0000001E0000000000000000000000FFFFFFFFFFFFFFFF00000000000000
      00000000000100460000000000000000000000FFFFFFFFFFFFFFFF0000000000
      00000000000000011453007400610074007500730020006400610020004F0063
      006F0072007200EA006E00630069006100420000000000000000000000FFFFFF
      FFFFFFFFFF000000000000000000000000011245006D00620061006C00610067
      0065006D002000280056006F006C0075006D0065002900420000000000000000
      000000FFFFFFFFFFFFFFFF00000000000000000100000001125400690070006F
      0020006400650020004F0063006F0072007200EA006E00630069006100480000
      000000000000000000FFFFFFFFFFFFFFFF000000000000000000000000011553
      00750062005400690070006F0020006400650020004F0063006F0072007200EA
      006E006300690061002C0000000000000000000000FFFFFFFFFFFFFFFF000000
      000000000001000000010753006F006C007500E700E3006F0056000000000000
      0000000000FFFFFFFFFFFFFFFF000000000000000000000000011C5300750062
      005400690070006F0020004F0063006F0072007200EA006E0063006900610020
      005800200053006F006C007500E700E3006F00280000000000000000000000FF
      FFFFFFFFFFFFFF00000000000000000100000001054300610075007300610052
      0000000000000000000000FFFFFFFFFFFFFFFF00000000000000000000000001
      1A5300750062005400690070006F0020004F0063006F0072007200EA006E0063
      0069006100200058002000430061007500730061004000000000000000000000
      00FFFFFFFFFFFFFFFF00000000000000000000000001115300650074006F0072
      0020006400650020005000650073007100750069007300610030000000000000
      0000000000FFFFFFFFFFFFFFFF00000000000000000000000001095000650072
      00670075006E007400610073002E0000000000000000000000FFFFFFFFFFFFFF
      FF00000000000000000000000001085000650073007100750069007300610036
      0000000000000000000000FFFFFFFFFFFFFFFF00000000000000000200000001
      0C44006500700061007200740061006D0065006E0074006F0036000000000000
      0000000000FFFFFFFFFFFFFFFF000000000000000000000000010CC100720065
      006100200028004C006F00630061006C002900360000000000000000000000FF
      FFFFFFFFFFFFFF000000000000000000000000010C53006F006C007500630069
      006F006E00610064006F0072001E0000000000000000000000FFFFFFFFFFFFFF
      FF0000000000000000000000000100440000000000000000000000FFFFFFFFFF
      FFFFFF00000000000000000000000001134D006F007400690076006F00200043
      0061006E00630065006C0061006D0065006E0074006F00}
  end
  object pnlPrincipal: TPanel
    Left = 233
    Top = 0
    Width = 782
    Height = 520
    Align = alClient
    TabOrder = 0
    object ntbControle: TNotebook
      Left = 6
      Top = 50
      Width = 780
      Height = 235
      Enabled = False
      PageIndex = 15
      TabOrder = 0
      object TPage
        Left = 0
        Top = 0
        Caption = 'cadAreaOrigem'
        object pnlCadAreaOrigem: TPanel
          Left = 0
          Top = 0
          Width = 780
          Height = 235
          Align = alClient
          TabOrder = 0
          object gbxCadAreaOrigem: TGroupBox
            Left = 1
            Top = 1
            Width = 778
            Height = 233
            Align = alClient
            Caption = '  Dados - '#193'rea de Origem  '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label1: TLabel
              Left = 10
              Top = 20
              Width = 39
              Height = 16
              Caption = 'C'#243'digo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label2: TLabel
              Left = 10
              Top = 67
              Width = 104
              Height = 16
              Caption = 'Descri'#231#227'o da '#193'rea'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label3: TLabel
              Left = 532
              Top = 67
              Width = 40
              Height = 16
              Caption = 'Padr'#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object edtCodigoAreaOrigem: TEdit
              Left = 10
              Top = 37
              Width = 70
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnKeyDown = edtCodigoAreaOrigemKeyDown
            end
            object edtDescAreaDeOrigem: TEdit
              Left = 10
              Top = 85
              Width = 515
              Height = 24
              CharCase = ecUpperCase
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnKeyDown = edtDescAreaDeOrigemKeyDown
            end
            object cbxAreaPadrao: TComboBox
              Left = 532
              Top = 85
              Width = 67
              Height = 24
              CharCase = ecUpperCase
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              OnCloseUp = cbxAreaPadraoCloseUp
              Items.Strings = (
                'SIM'
                'NAO')
            end
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'cadStatus'
        object pnlCadStatus: TPanel
          Left = 0
          Top = 0
          Width = 780
          Height = 235
          Align = alClient
          TabOrder = 0
          object gbxCadStatus: TGroupBox
            Left = 1
            Top = 1
            Width = 778
            Height = 233
            Align = alClient
            Caption = '  Dados - Status  da Ocorr'#234'ncia  '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object lblCodigoCadStatus: TLabel
              Left = 10
              Top = 20
              Width = 39
              Height = 16
              Caption = 'C'#243'digo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblDescCadStatus: TLabel
              Left = 10
              Top = 67
              Width = 113
              Height = 16
              Caption = 'Descri'#231#227'o do Status'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object edtCodigoStatusOcorrencia: TEdit
              Left = 10
              Top = 37
              Width = 70
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object edtDescStatusOcorrencia: TEdit
              Left = 10
              Top = 85
              Width = 515
              Height = 24
              CharCase = ecUpperCase
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnChange = edtDescStatusOcorrenciaChange
            end
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'cadEmbalagem'
        object pnlCadEmbalagem: TPanel
          Left = 0
          Top = 0
          Width = 780
          Height = 235
          Align = alClient
          TabOrder = 0
          object gbxCadEmbalgem: TGroupBox
            Left = 1
            Top = 1
            Width = 778
            Height = 233
            Align = alClient
            Caption = '  Dados - Embalagem (Volume)  '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label6: TLabel
              Left = 10
              Top = 20
              Width = 39
              Height = 16
              Caption = 'C'#243'digo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label7: TLabel
              Left = 10
              Top = 67
              Width = 55
              Height = 16
              Caption = 'Descri'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object edtCodigoSitEmbalagem: TEdit
              Left = 10
              Top = 37
              Width = 70
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object edtDescSitEmbalagem: TEdit
              Left = 10
              Top = 85
              Width = 515
              Height = 24
              CharCase = ecUpperCase
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnChange = edtDescSitEmbalagemChange
            end
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'cadTipoOcorrencia'
        object pnlCadTipoOcorrencia: TPanel
          Left = 0
          Top = 0
          Width = 780
          Height = 235
          Align = alClient
          TabOrder = 0
          object gbxTipoOcorrencia: TGroupBox
            Left = 1
            Top = 1
            Width = 778
            Height = 233
            Align = alClient
            Caption = '  Dados - Tipo de Ocorr'#234'ncia'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label4: TLabel
              Left = 10
              Top = 20
              Width = 39
              Height = 16
              Caption = 'C'#243'digo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label5: TLabel
              Left = 10
              Top = 67
              Width = 55
              Height = 16
              Caption = 'Descri'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label8: TLabel
              Left = 531
              Top = 67
              Width = 28
              Height = 16
              Caption = 'Ativo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label9: TLabel
              Left = 10
              Top = 115
              Width = 156
              Height = 16
              Caption = 'Departamento Respons'#225'vel'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object edtCodigoTipoOcorrencia: TEdit
              Left = 10
              Top = 37
              Width = 70
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object edtDescTipoOcorrencia: TEdit
              Left = 10
              Top = 85
              Width = 515
              Height = 24
              CharCase = ecUpperCase
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnChange = edtDescTipoOcorrenciaChange
            end
            object cbxSituacaoStatusTipoOcorrencia: TComboBox
              Left = 531
              Top = 85
              Width = 67
              Height = 24
              CharCase = ecUpperCase
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              Items.Strings = (
                'SIM'
                'NAO')
            end
            object dblkDepResponsavelTipoOcorrencia: TDBLookupComboBox
              Left = 10
              Top = 134
              Width = 215
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              KeyField = 'CD_DEPTO'
              ListField = 'DS_DEPTO'
              ListSource = DM.dsListaDepartamento
              ParentFont = False
              TabOrder = 3
            end
            object ckbIdCausa: TCheckBox
              Left = 310
              Top = 120
              Width = 61
              Height = 17
              Caption = 'Causa'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 6
            end
            object ckbIdVerFilmagem: TCheckBox
              Left = 310
              Top = 142
              Width = 78
              Height = 17
              Caption = 'Filmagem'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 7
            end
            object ckbIdContaEstoque: TCheckBox
              Left = 394
              Top = 120
              Width = 65
              Height = 17
              Caption = 'Estoque'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 8
            end
            object ckbIdGravacaoTlv: TCheckBox
              Left = 394
              Top = 142
              Width = 88
              Height = 17
              Caption = 'TeleVendas'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 9
            end
            object ckbIdTransportador: TCheckBox
              Left = 488
              Top = 120
              Width = 85
              Height = 17
              Caption = 'Transporte'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 10
            end
            object ckbIdEmbalagem: TCheckBox
              Left = 488
              Top = 142
              Width = 88
              Height = 17
              Caption = 'Embalagem'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 11
            end
            object ckbIdNecesSubTipoOcorrencia: TCheckBox
              Left = 239
              Top = 142
              Width = 65
              Height = 17
              Caption = 'SubTipo'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
            end
            object ckbIdSolucao: TCheckBox
              Left = 239
              Top = 120
              Width = 61
              Height = 17
              Caption = 'Solu'#231#227'o'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
            end
            object ckbIdRecolherMercadoria: TCheckBox
              Left = 239
              Top = 161
              Width = 141
              Height = 17
              Caption = 'Recolher Mercadoria'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 12
            end
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'cadSubTipoOcorrencia'
        object pnlSubTipoOcorrencia: TPanel
          Left = 0
          Top = 0
          Width = 780
          Height = 235
          Align = alClient
          TabOrder = 0
          object gbxSubTipoOcorrencia: TGroupBox
            Left = 1
            Top = 1
            Width = 778
            Height = 233
            Align = alClient
            Caption = '  Dados - SubTipo de Ocorr'#234'ncia  '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label10: TLabel
              Left = 10
              Top = 20
              Width = 109
              Height = 16
              Caption = 'Tipo de Ocorr'#234'ncia'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label11: TLabel
              Left = 303
              Top = 19
              Width = 39
              Height = 16
              Caption = 'C'#243'digo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label12: TLabel
              Left = 10
              Top = 67
              Width = 55
              Height = 16
              Caption = 'Descri'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label13: TLabel
              Left = 531
              Top = 67
              Width = 28
              Height = 16
              Caption = 'Ativo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object dbLkpTipoOcorrencia: TDBLookupComboBox
              Left = 10
              Top = 37
              Width = 287
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              KeyField = 'CD_TIPO_OCORRENCIA'
              ListField = 'NM_TIPO_OCORRENCIA'
              ListSource = DM.dsTipoOcorrencia
              ParentFont = False
              TabOrder = 1
              OnCloseUp = dbLkpTipoOcorrenciaCloseUp
            end
            object edtCodigoSubTipoOcorrencia: TEdit
              Left = 303
              Top = 37
              Width = 70
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object edtDescSubTipoOcorrencia: TEdit
              Left = 10
              Top = 84
              Width = 515
              Height = 24
              CharCase = ecUpperCase
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              OnChange = edtDescSubTipoOcorrenciaChange
            end
            object cbxSituacaoSubTipo: TComboBox
              Left = 531
              Top = 84
              Width = 67
              Height = 24
              CharCase = ecUpperCase
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              Items.Strings = (
                'SIM'
                'NAO')
            end
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'cadSolucao'
        object pnlCadSolucao: TPanel
          Left = 0
          Top = 0
          Width = 780
          Height = 235
          Align = alClient
          TabOrder = 0
          object gbxSolucao: TGroupBox
            Left = 1
            Top = 1
            Width = 778
            Height = 233
            Align = alClient
            Caption = '  Dados - Solu'#231#227'o da Ocorr'#234'ncia  '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label14: TLabel
              Left = 10
              Top = 20
              Width = 39
              Height = 16
              Caption = 'C'#243'digo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label15: TLabel
              Left = 10
              Top = 67
              Width = 113
              Height = 16
              Caption = 'Descri'#231#227'o do Status'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label16: TLabel
              Left = 476
              Top = 67
              Width = 28
              Height = 16
              Caption = 'Ativo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object edtCodigoSolucao: TEdit
              Left = 10
              Top = 37
              Width = 70
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object edtDescSolucao: TEdit
              Left = 10
              Top = 85
              Width = 460
              Height = 24
              CharCase = ecUpperCase
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnChange = edtDescSolucaoChange
            end
            object cbxSituacaoSolucao: TComboBox
              Left = 476
              Top = 84
              Width = 67
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              Items.Strings = (
                'SIM'
                'NAO')
            end
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'cadCausa'
        object pnlCadCausa: TPanel
          Left = 0
          Top = 0
          Width = 780
          Height = 235
          Align = alClient
          TabOrder = 0
          object gbxCadCausa: TGroupBox
            Left = 1
            Top = 1
            Width = 778
            Height = 233
            Align = alClient
            Caption = '  Dados - Causa da Ocorr'#234'ncia  '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label17: TLabel
              Left = 10
              Top = 20
              Width = 39
              Height = 16
              Caption = 'C'#243'digo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label18: TLabel
              Left = 10
              Top = 67
              Width = 113
              Height = 16
              Caption = 'Descri'#231#227'o do Status'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label19: TLabel
              Left = 476
              Top = 68
              Width = 28
              Height = 16
              Caption = 'Ativo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object edtCodigoCausa: TEdit
              Left = 10
              Top = 37
              Width = 70
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object edtDescCausa: TEdit
              Left = 10
              Top = 85
              Width = 460
              Height = 24
              CharCase = ecUpperCase
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnChange = edtDescCausaChange
            end
            object cbxSituacaoCausa: TComboBox
              Left = 476
              Top = 86
              Width = 67
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              Items.Strings = (
                'SIM'
                'NAO')
            end
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'cadSubTipoXCausa'
        object pnlSubTipoXCausa: TPanel
          Left = 0
          Top = 0
          Width = 780
          Height = 235
          Align = alClient
          TabOrder = 0
          object gbxSubTipoXCausa: TGroupBox
            Left = 1
            Top = 1
            Width = 778
            Height = 233
            Align = alClient
            Caption = '  Dados - SubTipo de Ocorr'#234'ncia X Causa  '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label24: TLabel
              Left = 10
              Top = 69
              Width = 131
              Height = 16
              Caption = 'SubTipo de Ocorr'#234'ncia'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label25: TLabel
              Left = 10
              Top = 20
              Width = 39
              Height = 16
              Caption = 'C'#243'digo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label26: TLabel
              Left = 10
              Top = 119
              Width = 35
              Height = 16
              Caption = 'Causa'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label27: TLabel
              Left = 86
              Top = 19
              Width = 109
              Height = 16
              Caption = 'Tipo de Ocorr'#234'ncia'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object edtCodigoSubTipoOcXCausa: TEdit
              Left = 10
              Top = 38
              Width = 70
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnKeyDown = edtCodigoSubTipoOcXCausaKeyDown
            end
            object dblkSolucaoSOxCausa: TDBLookupComboBox
              Left = 10
              Top = 138
              Width = 540
              Height = 24
              Cursor = crHandPoint
              DropDownRows = 20
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              KeyField = 'CD_CAUSA'
              ListField = 'DS_CAUSA'
              ListSource = DM.dsListaCausa
              ParentFont = False
              TabOrder = 3
              OnCloseUp = dblkSolucaoSOxCausaCloseUp
            end
            object dbLkSubTipoOcorrenciaSOxCausa: TDBLookupComboBox
              Left = 10
              Top = 89
              Width = 540
              Height = 24
              DropDownRows = 20
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              KeyField = 'CD_SUBTIPO_OCORRENCIA'
              ListField = 'NM_SUBTIPO_OCORRENCIA'
              ListSource = DM.dsSubTipoOcorrencia
              ParentFont = False
              TabOrder = 2
              OnCloseUp = dbLkSubTipoOcorrenciaSOxCausaCloseUp
            end
            object dbLkTipoOcorrenciaSOxCausa: TDBLookupComboBox
              Left = 86
              Top = 38
              Width = 464
              Height = 24
              DropDownRows = 20
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              KeyField = 'CD_TIPO_OCORRENCIA'
              ListField = 'NM_TIPO_OCORRENCIA'
              ListSource = DM.dsTipoOcorrencia
              ParentFont = False
              TabOrder = 1
              OnCloseUp = dbLkTipoOcorrenciaSOxCausaCloseUp
            end
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'cadSubTipoXSolucao'
        object pnlSubTipoXSolucao: TPanel
          Left = 0
          Top = 0
          Width = 780
          Height = 235
          Align = alClient
          TabOrder = 0
          object gbxSubTipoSolucao: TGroupBox
            Left = 1
            Top = 1
            Width = 778
            Height = 233
            Align = alClient
            Caption = '  Dados - SubTipo de Ocorr'#234'ncia X Solu'#231#227'o  '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label20: TLabel
              Left = 10
              Top = 69
              Width = 131
              Height = 16
              Caption = 'SubTipo de Ocorr'#234'ncia'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label21: TLabel
              Left = 10
              Top = 20
              Width = 39
              Height = 16
              Caption = 'C'#243'digo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label22: TLabel
              Left = 10
              Top = 119
              Width = 45
              Height = 16
              Caption = 'Solu'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label23: TLabel
              Left = 86
              Top = 19
              Width = 109
              Height = 16
              Caption = 'Tipo de Ocorr'#234'ncia'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label49: TLabel
              Left = 10
              Top = 169
              Width = 137
              Height = 16
              Caption = 'Aceita o Recolhimento ?'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object edtCodigoSubTipoOcXSolucao: TEdit
              Left = 10
              Top = 38
              Width = 70
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object dblkSolucaoSOxSolucao: TDBLookupComboBox
              Left = 10
              Top = 139
              Width = 515
              Height = 24
              Cursor = crHandPoint
              DropDownRows = 20
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              KeyField = 'CD_SOLUCAO'
              ListField = 'DS_SOLUCAO'
              ListSource = DM.dsListaSolucao
              ParentFont = False
              TabOrder = 3
              OnCloseUp = dblkSolucaoSOxSolucaoCloseUp
            end
            object dbLkSubTipoOcorrenciaSOxSolucao: TDBLookupComboBox
              Left = 10
              Top = 88
              Width = 515
              Height = 24
              DropDownRows = 20
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              KeyField = 'CD_SUBTIPO_OCORRENCIA'
              ListField = 'NM_SUBTIPO_OCORRENCIA'
              ListSource = DM.dsSubTipoOcorrencia
              ParentFont = False
              TabOrder = 2
              OnCloseUp = dbLkSubTipoOcorrenciaSOxSolucaoCloseUp
            end
            object dbLkTipoOcorrenciaSOxSolucao: TDBLookupComboBox
              Left = 86
              Top = 38
              Width = 439
              Height = 24
              DropDownRows = 20
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              KeyField = 'CD_TIPO_OCORRENCIA'
              ListField = 'NM_TIPO_OCORRENCIA'
              ListSource = DM.dsTipoOcorrencia
              ParentFont = False
              TabOrder = 1
              OnCloseUp = dbLkTipoOcorrenciaSOxSolucaoCloseUp
            end
            object cbxIdAceite: TComboBox
              Left = 10
              Top = 186
              Width = 111
              Height = 24
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 4
              OnCloseUp = cbxIdAceiteCloseUp
              OnKeyDown = cbxIdAceiteKeyDown
              Items.Strings = (
                'N'#227'o'
                'Sim')
            end
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'cadSetorPesquisa'
        object pnlCadSetorPesquisa: TPanel
          Left = 0
          Top = 0
          Width = 780
          Height = 235
          Align = alClient
          TabOrder = 0
          object gbxCadSetorPesquisa: TGroupBox
            Left = 1
            Top = 1
            Width = 778
            Height = 233
            Align = alClient
            Caption = '  Dados - Setor de Pesquisa'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label28: TLabel
              Left = 10
              Top = 20
              Width = 39
              Height = 16
              Caption = 'C'#243'digo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label29: TLabel
              Left = 10
              Top = 67
              Width = 55
              Height = 16
              Caption = 'Descri'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Edit6: TEdit
              Left = 10
              Top = 37
              Width = 70
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object Edit7: TEdit
              Left = 10
              Top = 85
              Width = 460
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'cadPerguntaPesquisa'
        object pnlCadPerguntaPesquisa: TPanel
          Left = 0
          Top = 0
          Width = 780
          Height = 235
          Align = alClient
          TabOrder = 0
          object gbxPerguntaPesquisa: TGroupBox
            Left = 1
            Top = 1
            Width = 778
            Height = 233
            Align = alClient
            Caption = '  Dados - Perguntas da Pesquisa  '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label30: TLabel
              Left = 10
              Top = 20
              Width = 39
              Height = 16
              Caption = 'C'#243'digo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label31: TLabel
              Left = 10
              Top = 67
              Width = 55
              Height = 16
              Caption = 'Descri'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Edit8: TEdit
              Left = 10
              Top = 37
              Width = 70
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object Edit9: TEdit
              Left = 10
              Top = 85
              Width = 460
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'cadPesquisa'
        object pnlCadPesquisa: TPanel
          Left = 0
          Top = 0
          Width = 780
          Height = 235
          Align = alClient
          TabOrder = 0
          object gbxPesquisa: TGroupBox
            Left = 1
            Top = 1
            Width = 778
            Height = 233
            Align = alClient
            Caption = '  Dados - Pesquisa  '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label32: TLabel
              Left = 10
              Top = 20
              Width = 39
              Height = 16
              Caption = 'C'#243'digo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label33: TLabel
              Left = 10
              Top = 67
              Width = 55
              Height = 16
              Caption = 'Descri'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Edit10: TEdit
              Left = 10
              Top = 37
              Width = 70
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object Edit11: TEdit
              Left = 10
              Top = 85
              Width = 460
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'cadDepartamento'
        object pnlCadDepartamento: TPanel
          Left = 0
          Top = 0
          Width = 780
          Height = 235
          Align = alClient
          TabOrder = 0
          object gbxCadDepartamento: TGroupBox
            Left = 1
            Top = 1
            Width = 778
            Height = 233
            Align = alClient
            Caption = '  Dados - Departamento  '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            ExplicitLeft = 0
            ExplicitTop = 0
            object Label34: TLabel
              Left = 10
              Top = 67
              Width = 45
              Height = 16
              Caption = 'Gerente'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label35: TLabel
              Left = 10
              Top = 20
              Width = 39
              Height = 16
              Caption = 'C'#243'digo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label36: TLabel
              Left = 86
              Top = 20
              Width = 55
              Height = 16
              Caption = 'Descri'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object dblkGerenteDepartamento: TDBLookupComboBox
              Left = 4
              Top = 83
              Width = 367
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              KeyField = 'NR_MATRICULA'
              ListField = 'NM_GERENTE'
              ListSource = DM.dsListaGerenteDepto
              ParentFont = False
              TabOrder = 2
              OnCloseUp = dblkGerenteDepartamentoCloseUp
            end
            object edtCodigoDepartamento: TEdit
              Left = 10
              Top = 37
              Width = 70
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object edtDescDepartamento: TEdit
              Left = 86
              Top = 37
              Width = 515
              Height = 24
              CharCase = ecUpperCase
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnChange = edtDescSubTipoOcorrenciaChange
            end
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'cadAreaDepto'
        object pnlCadAreaDepto: TPanel
          Left = 0
          Top = 0
          Width = 780
          Height = 235
          Align = alClient
          TabOrder = 0
          object gbxAreaDepto: TGroupBox
            Left = 1
            Top = 1
            Width = 778
            Height = 233
            Align = alClient
            Caption = '  Dados - '#193'rea do Departamento  '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label37: TLabel
              Left = 10
              Top = 67
              Width = 81
              Height = 16
              Caption = 'Departamento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label38: TLabel
              Left = 10
              Top = 20
              Width = 39
              Height = 16
              Caption = 'C'#243'digo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label39: TLabel
              Left = 86
              Top = 20
              Width = 55
              Height = 16
              Caption = 'Descri'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label40: TLabel
              Left = 274
              Top = 67
              Width = 61
              Height = 16
              Caption = 'Supervisor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label41: TLabel
              Left = 487
              Top = 20
              Width = 81
              Height = 16
              Caption = 'Prazo Solu'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label48: TLabel
              Left = 10
              Top = 115
              Width = 91
              Height = 16
              Caption = #193'rea de Origem'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object dblkAreaDepto: TDBLookupComboBox
              Left = 10
              Top = 85
              Width = 258
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              KeyField = 'CD_DEPTO'
              ListField = 'DS_DEPTO'
              ListSource = DM.dsListaDepartamento
              ParentFont = False
              TabOrder = 3
              OnCloseUp = dblkAreaDeptoCloseUp
            end
            object edtCodigoAreaDepartamento: TEdit
              Left = 10
              Top = 37
              Width = 70
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object edtDescAreaDepartamento: TEdit
              Left = 86
              Top = 37
              Width = 395
              Height = 24
              CharCase = ecUpperCase
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnChange = edtDescSubTipoOcorrenciaChange
            end
            object dblkSupervisorAreaDepto: TDBLookupComboBox
              Left = 274
              Top = 85
              Width = 305
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              KeyField = 'NR_MATRICULA'
              ListField = 'NM_SUPERVISOR'
              ListSource = DM.dsListaSupervisorArea
              ParentFont = False
              TabOrder = 4
              OnCloseUp = dblkSupervisorAreaDeptoCloseUp
            end
            object cbxPrazoSoucao: TComboBox
              Left = 487
              Top = 37
              Width = 92
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              Items.Strings = (
                '01 Dia'
                '02 Dias'
                '03 Dias'
                '04 Dias'
                '05 Dias')
            end
            object dblkAreaOrigemDepartamento: TDBLookupComboBox
              Left = 10
              Top = 134
              Width = 218
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              KeyField = 'CD_AREA_ORIGEM'
              ListField = 'DS_AREA_ORIGEM'
              ListSource = DM.dsListaAreaOrigem
              ParentFont = False
              TabOrder = 5
              OnCloseUp = dblkAreaOrigemDepartamentoCloseUp
            end
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'cadSolucionador'
        object pnlSolucionador: TPanel
          Left = 0
          Top = 0
          Width = 780
          Height = 235
          Align = alClient
          TabOrder = 0
          object gbxSolucionador: TGroupBox
            Left = 1
            Top = 1
            Width = 778
            Height = 233
            Align = alClient
            Caption = '  Dados - Solucionador  '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label42: TLabel
              Left = 10
              Top = 67
              Width = 81
              Height = 16
              Caption = 'Departamento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label44: TLabel
              Left = 10
              Top = 20
              Width = 33
              Height = 16
              Caption = 'Nome'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label45: TLabel
              Left = 274
              Top = 67
              Width = 130
              Height = 16
              Caption = #193'rea do Departamento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label43: TLabel
              Left = 10
              Top = 115
              Width = 97
              Height = 16
              Caption = 'Email de Contato'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label46: TLabel
              Left = 512
              Top = 114
              Width = 28
              Height = 16
              Caption = 'Ativo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label47: TLabel
              Left = 415
              Top = 20
              Width = 52
              Height = 16
              Caption = 'Matricula'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object dblkDeptoSolucionador: TDBLookupComboBox
              Left = 10
              Top = 85
              Width = 258
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              KeyField = 'CD_DEPTO'
              ListField = 'DS_DEPTO'
              ListSource = DM.dsListaDepartamento
              ParentFont = False
              TabOrder = 2
              OnCloseUp = dblkDeptoSolucionadorCloseUp
            end
            object dblkAreaDeptoSolucionador: TDBLookupComboBox
              Left = 274
              Top = 85
              Width = 305
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              KeyField = 'CD_AREA_DEPTO'
              ListField = 'DS_AREA_DEPTO'
              ListSource = DM.dsListaAreaDepto
              ParentFont = False
              TabOrder = 3
              OnCloseUp = dblkAreaDeptoSolucionadorCloseUp
            end
            object dblkNomeSolucionador: TDBLookupComboBox
              Left = 10
              Top = 37
              Width = 399
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              KeyField = 'NR_MATRICULA'
              ListField = 'NM_USUARIO_MATRICULA'
              ListSource = DM.dsListaUsuario
              ParentFont = False
              TabOrder = 0
              OnCloseUp = dblkNomeSolucionadorCloseUp
            end
            object edtEmailSolucionador: TEdit
              Left = 10
              Top = 132
              Width = 496
              Height = 24
              CharCase = ecLowerCase
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
              OnChange = edtEmailSolucionadorChange
              OnKeyDown = edtEmailSolucionadorKeyDown
            end
            object cbxSituacaoSolucionador: TComboBox
              Left = 512
              Top = 132
              Width = 67
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
              Items.Strings = (
                'SIM'
                'NAO')
            end
            object edtMatriculaSolucionador: TEdit
              Left = 415
              Top = 37
              Width = 70
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnKeyDown = edtCodigoSubTipoOcXCausaKeyDown
            end
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'cadMotivo'
        object pnCadMotivo: TPanel
          Left = 0
          Top = 0
          Width = 780
          Height = 235
          Align = alClient
          TabOrder = 0
          object gbxMotivoCancelamento: TGroupBox
            Left = 1
            Top = 1
            Width = 778
            Height = 233
            Align = alClient
            Caption = 'Dados - Cadastro Motivo Cancelamento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label50: TLabel
              Left = 10
              Top = 20
              Width = 39
              Height = 16
              Caption = 'C'#243'digo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label51: TLabel
              Left = 86
              Top = 20
              Width = 55
              Height = 16
              Caption = 'Descri'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object edtCodigoMotivo: TEdit
              Left = 10
              Top = 37
              Width = 70
              Height = 24
              Alignment = taRightJustify
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object edtDescricaoMotivo: TEdit
              Left = 86
              Top = 37
              Width = 515
              Height = 24
              CharCase = ecUpperCase
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnChange = edtDescSubTipoOcorrenciaChange
            end
          end
        end
      end
    end
    object tBarCadstroGeral: TToolBar
      Left = 1
      Top = 1
      Width = 780
      Height = 43
      Cursor = crHandPoint
      ButtonHeight = 39
      ButtonWidth = 94
      Caption = 'tbarAtendimento'
      DrawingStyle = dsGradient
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Images = ImageList1
      ParentFont = False
      ShowCaptions = True
      TabOrder = 1
      Transparent = True
      object tBtnNovo: TToolButton
        Left = 0
        Top = 0
        Caption = '&Novo'
        Enabled = False
        ImageIndex = 11
        OnClick = tBtnNovoClick
      end
      object tbtnSalvar: TToolButton
        Left = 94
        Top = 0
        Caption = 'Salva&r'
        Enabled = False
        ImageIndex = 7
        OnClick = tbtnSalvarClick
      end
      object tBtnCancelar: TToolButton
        Left = 188
        Top = 0
        Caption = '&Limpar'
        Enabled = False
        ImageIndex = 18
        OnClick = tBtnCancelarClick
      end
      object tBtnExcluirItem: TToolButton
        Left = 282
        Top = 0
        Caption = '&Excluir'
        Enabled = False
        ImageIndex = 9
        OnClick = tBtnExcluirItemClick
      end
      object tbtnAlterar: TToolButton
        Left = 376
        Top = 0
        Caption = '     &Alterar     '
        Enabled = False
        ImageIndex = 0
        OnClick = tbtnAlterarClick
      end
      object tBtnFechar: TToolButton
        Left = 470
        Top = 0
        Caption = '&Fechar'
        ImageIndex = 20
        OnClick = tBtnFecharClick
      end
    end
    object gbxRelacaoGenerico: TGroupBox
      AlignWithMargins = True
      Left = 4
      Top = 288
      Width = 774
      Height = 228
      Align = alBottom
      Caption = '  Rela'#231#227'o de Status  '
      TabOrder = 2
      object dbgRelacaoGenerico: TDBGrid
        Left = 2
        Top = 18
        Width = 770
        Height = 208
        Cursor = crHandPoint
        Align = alClient
        DataSource = DM.dsGenericaCadastro
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = dbgRelacaoGenericoDblClick
        OnTitleClick = dbgRelacaoGenericoTitleClick
      end
    end
  end
  object ImageList1: TImageList
    Left = 184
    Top = 16
    Bitmap = {
      494C010115001E003C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000006000000001002000000000000060
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      800000008000000080000000800000008000000080000000800000FFFF000000
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      800000008000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      800000008000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      800000008000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      FF00000080000000FF0000000000000000000000000000000000000000000000
      00000000FF000000800000008000000080000000800000008000000080000000
      8000000080000000000000000000000000000000000000FFFF0000FFFF000000
      00000000FF000000800000008000000080000000800000008000000080000000
      8000000080000000000000FFFF0000FFFF000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000080808000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      FF00000080000000FF0000000000008080000000000000008000000080000000
      00000000FF00C0C0C00000000000C0C0C00000000000C0C0C00000000000C0C0
      C000000080000000000000000000000000000000000000008000000080000000
      00000000FF00C0C0C00000000000C0C0C00000000000C0C0C00000000000C0C0
      C000000080000000000000FFFF00000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000008080800000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      FF00000080000000FF0000808000008080000000800000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000080000000000000000000000000000000800000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000800000000000000000000000000000000000000000000000FF000000
      FF000000FF0000000000808080000000000080808000000000000000FF000000
      FF000000FF0000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      FF00000080000000FF0000808000008080000000800000000000000000000000
      0000000000000000FF00C0C0C00000000000C0C0C00000000000C0C0C0000000
      FF00000000000000000000000000000000000000800000000000000000000000
      0000000000000000FF00C0C0C00000000000C0C0C00000000000C0C0C0000000
      FF0000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      FF00000080000000FF0000808000000000000000800000000000000000000000
      000000008000000000000000FF000000FF000000FF000000FF000000FF000000
      0000000080000000000000000000000000000000800000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000000080808000000000008080800000000000000000000000
      00000000FF000000FF0000000000000000000000000080808000000000000000
      000000000000FFFFFF00000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000008080800000000000000080000000
      8000000080000000000000000000000000000000000000000000000000000000
      00000000800000008000000080000000000000FFFF0000000000000080000000
      800000FFFF000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000808080000000
      0000FFFFFF000000000080808000000000000000000000000000000080000000
      80000000800000008000000080000000000000000000000000000000FF000000
      FF000000FF000000000000008000000080000000800000008000000080000000
      00000000FF000000FF000000FF000000000000FFFF0000000000000080000000
      8000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      000000FFFF0000FFFF0000FFFF0000FFFF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000008080800000000000000000000000000000808000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000080000000
      80000000800000000000C0C0C00000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000000080808000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080800000808000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000008000000000000000000000000000000000000000FF000000
      FF0000008000000080000000800000FFFF0000FFFF0000000000000000000000
      8000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000000000008000000000000000800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008080000080800000808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000080000000
      FF000000FF000000FF0000008000000000000000000000008000000000000000
      8000000080000000800000000000000000000000FF000000FF00000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000808000008080000080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF00000080000000
      FF000000FF000000FF000000000000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000080800000808000008080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0080808000000080000000000000000000000080000000FF000000
      FF0000008000000080000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000808000000000000000000000000000000000008080
      8000000000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000000000000000000000000000FFFF0000FFFF0080808000000000000000
      80000000800000FFFF00000000000000000000000000000000000000FF000000
      FF000000FF0000000000808080000000000080808000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000000000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      00000000000000FFFF0000FFFF00000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF0000000000000000000000FF00000000000000000000000000008080000000
      0000000000000000000000000000808080000000000000000000000000008080
      8000000000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF00000000000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000FFFF00000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080808000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF000000000000000000FFFFFF00808080008080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008080800080808000FFFFFF00000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFFFF0000000000000000000000000000000000FFFFFF00FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF000080800000FFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00808080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000080800000FFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFFFF0000000000000000000000000000000000FFFFFF0000000000FFFF
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000FFFF00000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000080
      800000FFFF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00808080000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF00808080008080800080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF000000
      000000000000FFFFFF0000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF000080800000FF
      FF000000000000000000000000000000000000000000FFFFFF00808080000000
      000080808000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFFFF0000000000000000000000000000000000FFFFFF00FFFF00000000
      000000FFFF000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000FFFF00000000000080808000000000000000
      000000000000000000000000000000000000000000000080800000FFFF000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      0000FFFF0000FFFF000000000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF0080808000FFFFFF00808080008080800080808000FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000FFFF0000808080000000000000FFFF0000FF
      FF0000FFFF00000000000000000000FFFF000080800000FFFF00000000000000
      0000000000000000000000000000000000000000000080808000808080008080
      8000808080008080800000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFFFF0000000000000000000000000000000000FFFFFF00FFFF0000FFFF
      0000FFFF00000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000FFFF0000000000FFFF00000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF000080800000FFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      0000FFFF0000FFFF000000000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF008080800080808000FFFFFF0080808000FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000FFFF00000000000000000000FFFF00FFFF
      FF0000FFFF000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      000080808000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFFFF0000000000000000000000000000000000FFFFFF00FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF00000000000000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000000
      0000000000000080800000FFFF0000FFFF000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080000000000000000000FFFFFF00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FFFF00000000000000
      000000000000000000000000000000000000808080008080800000FFFF000000
      0000000000000080800000FFFF0000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF0000000000FFFFFF0000000000FFFFFF000000000000FFFF000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF00008080000080800000FFFF0000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000008080800000000000808080000000000080808000000000008080
      8000000000000000000000000000000000000000000000000000808080000000
      00008080800000000000808080000000000080808000000000000000000000FF
      FF00000000000000000000000000000000000000000000000000000000008080
      800000FFFF0000FFFF0000FFFF0000FFFF000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000008080800000000000808080000000000080808000000000008080
      8000000000000000000000000000000000000000000000000000808080000000
      0000808080000000000080808000000000008080800000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000008080
      8000000000000000000000000000000000008080800000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000808080000000000080808000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF008080800000000000808080000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFFFF000000
      00000000000000000000FFFFFF0000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF00000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF00000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000FFFFFF0000000000C0C0C000000000000000
      0000FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF0000000000000000000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000080000000000000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000000000000000000000000000
      000000000000000000000000FF000000800000000000000080000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF0000000000FFFFFF000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000000000000000000000000000FF000000
      FF0000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF0000000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000000000000000000000000000FF000000
      FF000000FF00000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF0000000000C0C0C000FFFFFF000000
      0000FFFFFF0000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      FF000000FF000000FF000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF0000000000FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000808080000000000080808000000000000000
      00000000FF000000FF000000FF0000000000000000000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000808080000000
      0000808080008080800000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C0000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C0000000
      0000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000C0C0
      C000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      000000FFFF0000000000000000000000000000FFFF0000000000008080000000
      0000C0C0C0000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000000000808080008080800000FFFF0000FFFF0000FFFF00808080008080
      80000000000000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000000000008080000080
      8000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF0000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00000000000000
      0000FFFFFF00000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000000000000000000000000000000000FFFF000000
      0000000000000000000000FFFF0000000000C0C0C00000000000008080000080
      8000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000FFFF0000FFFF0000FFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF00000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000000000C0C0C00000000000008080000080
      8000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000C0C0C00000000000FF000000FF000000FF00
      00000000FF00FF000000FF0000000000000000000000FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000FF000000
      FF0000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      FF000000FF000000FF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      00000000000000000000FFFFFF0000000000FFFFFF00000000000000FF000000
      FF000000FF000000FF000000FF000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00808080008080800000000000008080000080
      800000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF00000000000000000000000000FFFFFF0000000000C0C0
      C000FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000808080008080800080808000808080008080800080808000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00808080008080800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF000000000000000000000000000000
      FF000000FF000000FF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000080800000FFFF000080800000FFFF000080800000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF0000000000C0C0
      C000FFFFFF0000000000FFFFFF00000000000000000000000000808080000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000080800000FFFF000080800000FF
      FF00000000000000000000000000000000000000000000000000000000008080
      8000808080008080800080808000808080008080800000000000000000000000
      00008080800000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000000000000000
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
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C00000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000808080000000000080808000C0C0C00080808000000000000000
      00000000000000000000000000000000FF0000000000000000000000FF000000
      FF000000000000000000808080000000000080808000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000808080008080800000000000C0C0C000C0C0C000C0C0C000000000000000
      000000000000000000000000FF0000000000000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000808080008080800000000000C0C0C000C0C0C000C0C0C000000000000000
      0000000000000000FF000000000000000000000000000000FF00000000000000
      FF000000FF000000FF0080808000000000008080800000000000000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000800000008000000000000000
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000000000000000000000FF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000008080
      800080808000808080000000000000000000C0C0C000C0C0C000000000000000
      00000000FF000000000000000000000000000000FF000000FF00000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000080000000
      000000000000000000000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF0000000000000000008080800000000000C0C0
      C000C0C0C000C0C0C00000000000C0C0C00000000000C0C0C000808080000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      800000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000080808000000000008080
      8000808080008080800000000000C0C0C00000000000C0C0C000808080000000
      00000000FF000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000080808000000000008080800000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      00000080800000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00000000000000000000FFFF0000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF000000000000000000C0C0C00000000000C0C0
      C000C0C0C000C0C0C00000000000C0C0C00000000000C0C0C000808080000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000000000800000000000000080000000FF00000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000000000FF
      FF00000000000080800000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000000000C0C0
      C000C0C0C000C0C0C0000000000000000000C0C0C000C0C0C000000000000000
      00000000FF000000000000000000000000000000FF000000FF00000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      000000FFFF000000000000808000000000000000000000000000000000000000
      0000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000C0C0C000C0C0C0000000000080808000C0C0C000C0C0C000000000000000
      0000000000000000FF000000000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000FF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF000000000000FFFF0000808000008080000000000000000000000000000000
      00000000000000FFFF0000000000FFFFFF00FFFFFF000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C0C0C000C0C0C000000000008080800080808000C0C0C000000000000000
      000000000000000000000000FF0000000000000000000000FF000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00008080000000000000000000000000000000
      000000FFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000C0C0C00080808000808080008080800080808000000000000000
      00000000000000000000000000000000FF0000000000000000000000FF000000
      FF000000FF000000000080808000000000008080800000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF000000000000000000000000000000
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C0C0C000000000008080800000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF00424D3E000000000000003E000000
      2800000040000000600000000100010000000000000300000000000000000000
      000000000000000000000000FFFFFF00C007000000000000C007000000000000
      C007000000000000C007000000000000C007000000000000C007000000000000
      C007000000000000C007000000000000C007000000000000C007000000000000
      C007000000000000C007000000000000C007000000000000C007000000000000
      C007000000000000C007000000000000E003A002FFFFF862E0038000F83F80E0
      80038001E00F01E060036003C44701E0700770078C6331E10000780F9C7331C1
      000000003FF9C181800000003EF9C307C001807F3C7FFE17E00380433C7FCC37
      FFFFC0013C41A877FFFFE0019C6140F7FFFFE0038C7101E3FFFFCE03C441C1E3
      FFFF9E79E00DC0E3FFFF3E7CF83FC83FFFF88000F007803FFFF80000C003001F
      FFE0000080030004FFE0000080030000FF81000080030000FF03000080030000
      FF07000080030000840F000080030000001F000080030000003F800080030000
      007FC00080030007003FF0008003001F003FFC008003000F803FFC01B0078007
      C03FFC03D0078023E07FFC07EAAF5577FFFFFFFFFFFFFFFFFFF8FFFFFC00E7F8
      20F8C631FC00E7F8007FE223FC0081FF007CF007FC0081FC003CF88FEC00E7FC
      000FFC1FE400E7FF0004FE3FE000FFFC000CFC1F0000FEFC01FFF80F0001FE7F
      E3FCF00700038013FFFCE22300078013FFFFC631000FFE7FFFF8FFFFE3FFFEF8
      FFF8FFFFE7FFFFF8FFFFFFFFEFFFFFFFFFDFC01F8001FF00FFCFC00F0000FF00
      FFC7E0070000FF000003E0030000FF0000018003000000000000800700000000
      000180070000000000038007000000000007800700000023000F800700000001
      001FE00780010000007FC007C003002300FFC007C003006301FFE007C00300C3
      03FFF803C0030107FFFFFC03C00303FFFC00FFFFFFFF847FFC00FC7BF83F00EF
      2000F837E00F31BF0000F03ECC4739FF0000E01D8463993F0000E01BA073CA1F
      0000801731F9F40F0000001F38F99C07000000103C7996030000001F3C39CB01
      E00080173C19FF80F800E01B9C0BF7C0F000E01D8C43FFE0E001F03EC467EFF0
      C403F837E00FFFF8EC07FC7BF83FFFFC00000000000000000000000000000000
      000000000000}
  end
end
