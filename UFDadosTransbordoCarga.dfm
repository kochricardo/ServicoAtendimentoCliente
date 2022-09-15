object FDadosTransbordoCarga: TFDadosTransbordoCarga
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Visualizar DadosTransbordo de Carga'
  ClientHeight = 236
  ClientWidth = 565
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 217
    Width = 565
    Height = 19
    Panels = <>
    ExplicitLeft = 448
    ExplicitTop = 200
    ExplicitWidth = 0
  end
  object gbxDadosTransbordo: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 559
    Height = 211
    Align = alClient
    Caption = '  Informa'#231#245'es de Transbordo da Carga  '
    TabOrder = 1
    ExplicitLeft = -2
    ExplicitTop = 0
    object memInformacaoTransbordo: TMemo
      Left = 2
      Top = 15
      Width = 555
      Height = 194
      Align = alClient
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
end
