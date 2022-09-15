object FRelacaoVolumeDaNota: TFRelacaoVolumeDaNota
  Left = 177
  Top = 108
  BorderStyle = bsDialog
  Caption = 'Rela'#231#227'o de Volume na Nota'
  ClientHeight = 553
  ClientWidth = 645
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object _grBoxVolume: TGroupBox
    Left = 0
    Top = 0
    Width = 645
    Height = 553
    Align = alClient
    Caption = 'Rela'#231#227'o de Volume na Nota'
    TabOrder = 0
    ExplicitLeft = -2
    ExplicitTop = -2
    object _dbgVolumes: TDBGrid
      Left = 2
      Top = 15
      Width = 641
      Height = 515
      Align = alClient
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = _dbgVolumesDrawColumnCell
    end
    object StatusBar1: TStatusBar
      Left = 2
      Top = 530
      Width = 641
      Height = 21
      Panels = <>
      ExplicitLeft = 3
      ExplicitTop = 526
      ExplicitWidth = 631
    end
  end
  object _dsRelacaoVolume: TDataSource
    Left = 496
    Top = 112
  end
  object _cdsTemp2: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 408
    Top = 264
  end
end
