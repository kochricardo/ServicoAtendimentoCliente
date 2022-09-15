object FEnvioEmailOcorrenciaPendente: TFEnvioEmailOcorrenciaPendente
  Left = 223
  Top = 107
  BorderIcons = [biSystemMenu]
  Caption = 'Envio de Email - Ocorr'#234'ncias Pendentes'
  ClientHeight = 91
  ClientWidth = 394
  Color = clWindow
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblMsgEnvio: TLabel
    Left = 19
    Top = 29
    Width = 367
    Height = 19
    Caption = 'Enviando email de ocorr'#234'ncias pendentes .....'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 72
    Width = 394
    Height = 19
    Panels = <>
  end
end
