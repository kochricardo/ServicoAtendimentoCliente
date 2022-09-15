object FRelacaoCliente: TFRelacaoCliente
  Left = 0
  Top = 0
  Caption = 'Rela'#231#227'o de Clientes'
  ClientHeight = 438
  ClientWidth = 621
  Color = clWindow
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 419
    Width = 621
    Height = 19
    Panels = <>
    ExplicitWidth = 604
  end
  object dbgRelacaoCliente: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 615
    Height = 413
    Align = alClient
    DataSource = DM.dsConsultaCliente
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    OnDblClick = dbgRelacaoClienteDblClick
    OnKeyDown = dbgRelacaoClienteKeyDown
    OnTitleClick = dbgRelacaoClienteTitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'NROC_C'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIGC_C'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMP_P'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CGCP_P'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MUNP_P'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UFEP_P'
        Title.Alignment = taCenter
        Width = 25
        Visible = True
      end>
  end
end
