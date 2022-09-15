object FVisualizacaoRecorrencia: TFVisualizacaoRecorrencia
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'SAC - Visualizacao de Recorrencia'
  ClientHeight = 243
  ClientWidth = 454
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 16
  object StatusBar1: TStatusBar
    Left = 0
    Top = 224
    Width = 454
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = '   F2 - Excluir Item da Recorr'#234'ncia'
  end
  object gbxPrincipal: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 448
    Height = 218
    Align = alClient
    Caption = '  Dados da Recorrencia  '
    TabOrder = 0
    object dbgRelacaoRecorrencia: TDBGrid
      AlignWithMargins = True
      Left = 5
      Top = 21
      Width = 438
      Height = 97
      Align = alClient
      DataSource = DM.dsRecorrenciaItem
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnKeyDown = dbgRelacaoRecorrenciaKeyDown
      OnTitleClick = dbgRelacaoRecorrenciaTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CD_RECORRENCIA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CD_ITEM_OCORRENCIA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_RECORRENCIA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_TIPO_RECORRENCIA'
          Visible = True
        end>
    end
    object dbMemObservacaoRecorrencia: TDBMemo
      AlignWithMargins = True
      Left = 5
      Top = 124
      Width = 438
      Height = 89
      Align = alBottom
      DataField = 'DS_RECORRENCIA'
      DataSource = DM.dsRecorrenciaItem
      TabOrder = 1
    end
  end
end
