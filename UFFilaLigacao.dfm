object FFilaLigacao: TFFilaLigacao
  Left = 547
  Top = 400
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'SAC - Controle Fila de Atendimento'
  ClientHeight = 451
  ClientWidth = 629
  Color = clWindow
  Ctl3D = False
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
    Top = 432
    Width = 629
    Height = 19
    Panels = <>
  end
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 623
    Height = 426
    Align = alClient
    Caption = '  Fila de Espera  '
    TabOrder = 1
    object gbxControleLigacao: TGroupBox
      AlignWithMargins = True
      Left = 361
      Top = 279
      Width = 258
      Height = 143
      Align = alRight
      Caption = '  Controle de Liga'#231#245'es  '
      TabOrder = 0
      object dbgControleLigacao: TDBGrid
        AlignWithMargins = True
        Left = 4
        Top = 20
        Width = 250
        Height = 119
        Cursor = crHandPoint
        Align = alClient
        Ctl3D = True
        DataSource = DM.dsControleLigacao
        DrawingStyle = gdsGradient
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = dbgControleLigacaoDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'DS_TIPO_ATENDIMENTO'
            Title.Alignment = taCenter
            Width = 160
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTAL'
            Title.Alignment = taCenter
            Width = 50
            Visible = True
          end>
      end
    end
    object dbgFilaAtendimento: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 20
      Width = 615
      Height = 253
      Cursor = crHandPoint
      Align = alTop
      Ctl3D = True
      DataSource = DM.dsConsultaFilaLigacao
      DrawingStyle = gdsGradient
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = dbgFilaAtendimentoCellClick
      OnKeyDown = dbgFilaAtendimentoKeyDown
      OnMouseEnter = dbgFilaAtendimentoMouseEnter
      OnMouseLeave = dbgFilaAtendimentoMouseLeave
      OnTitleClick = dbgFilaAtendimentoTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TELEFONE'
          Title.Alignment = taCenter
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HORARIO'
          Title.Alignment = taCenter
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RAZAO_SOCIAL'
          Title.Alignment = taCenter
          Width = 290
          Visible = True
        end>
    end
    object rdgTipoAtendimento: TRadioGroup
      AlignWithMargins = True
      Left = 4
      Top = 279
      Width = 349
      Height = 48
      Caption = '  Tipo de Atendimento  '
      Columns = 3
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Items.Strings = (
        'NORMAL'
        'RETORNO'
        'SEM RETORNO')
      ParentFont = False
      TabOrder = 2
      OnClick = rdgTipoAtendimentoClick
    end
    object btnAtualizaDados: TBitBtn
      Left = 29
      Top = 349
      Width = 305
      Height = 54
      Cursor = crHandPoint
      Caption = '&Atualizar Fila de Espera'
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        3333333777333777FF33339993707399933333773337F3777FF3399933000339
        9933377333777F3377F3399333707333993337733337333337FF993333333333
        399377F33333F333377F993333303333399377F33337FF333373993333707333
        333377F333777F333333993333101333333377F333777F3FFFFF993333000399
        999377FF33777F77777F3993330003399993373FF3777F37777F399933000333
        99933773FF777F3F777F339993707399999333773F373F77777F333999999999
        3393333777333777337333333999993333333333377777333333}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 3
      OnClick = btnAtualizaDadosClick
    end
  end
  object tmrAtualizaFiladeEspera: TTimer
    Interval = 15000
    OnTimer = tmrAtualizaFiladeEsperaTimer
    Left = 104
    Top = 104
  end
end
