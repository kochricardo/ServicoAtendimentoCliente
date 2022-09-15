object FVisualizacaoOcorrencia: TFVisualizacaoOcorrencia
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  Caption = 'SAC - Visualiza'#231#227'o de Ocorr'#234'ncia'
  ClientHeight = 660
  ClientWidth = 1279
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object StatusBar1: TStatusBar
    Left = 0
    Top = 641
    Width = 1279
    Height = 19
    Panels = <>
  end
  object gbxOcorrencia: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 46
    Width = 1273
    Height = 592
    Align = alClient
    Caption = '  Ocorr'#234'ncia  '
    TabOrder = 1
    object gbxDadosPrincipais: TGroupBox
      AlignWithMargins = True
      Left = 5
      Top = 21
      Width = 1263
      Height = 178
      Align = alTop
      Caption = '  Dados Principais  '
      TabOrder = 0
      DesignSize = (
        1263
        178)
      object Label12: TLabel
        Left = 10
        Top = 18
        Width = 62
        Height = 16
        Caption = 'Ocorrencia'
        FocusControl = DBEdit3
      end
      object Label13: TLabel
        Left = 78
        Top = 18
        Width = 73
        Height = 16
        Caption = 'Razao Social'
        FocusControl = DBEdit4
      end
      object Label14: TLabel
        Left = 443
        Top = 18
        Width = 44
        Height = 16
        Caption = 'Contato'
        FocusControl = DBEdit12
      end
      object Label15: TLabel
        Left = 629
        Top = 18
        Width = 77
        Height = 16
        Caption = 'Data Registro'
        FocusControl = DBEdit13
      end
      object Label16: TLabel
        Left = 785
        Top = 18
        Width = 64
        Height = 16
        Caption = 'Data Limite'
        FocusControl = DBEdit14
      end
      object Label17: TLabel
        Left = 412
        Top = 65
        Width = 58
        Height = 16
        Caption = 'Prioridade'
        FocusControl = dbEdtPrioridade
      end
      object Label18: TLabel
        Left = 10
        Top = 64
        Width = 103
        Height = 16
        Caption = 'Status da Solu'#231#227'o'
        FocusControl = dbEdtStatusSolucao
      end
      object Label19: TLabel
        Left = 211
        Top = 64
        Width = 93
        Height = 16
        Caption = 'Status da Causa'
        FocusControl = dbEdtStatusCausa
      end
      object imgMaisInformOcorrencia: TImage
        Left = 541
        Top = 74
        Width = 32
        Height = 32
        Cursor = crHandPoint
        CustomHint = BalloonHint
        DragCursor = crHandPoint
        ParentShowHint = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF4000000097048597300000B1300000B1301009A9C18
          0000000467414D410000B18E7CFB5193000004F54944415478DAB5970D4C5565
          18C7FF07BA740191AF2056362C53A08D6C65B166B6B9C5D2855A3AA3B4652E1D
          A1608C362BBF5A899AC694A4A1060988CC58A0086A2353B36034CC855C11F05E
          3E4C54BAC205F570BFCF393DEFBD870B13B8E77AB567FBEF9CF39EF79CFFEF3C
          EFF39E735E4E92240C05C771182B5232B75FA073CF42214C46BEB278CF5769B4
          DB4BB228F567DEDC4880F573B850952FBE8584E705093C6B137D5530C46E4988
          8C08435464F8B837EBD1F7417FD300FFA6756D6ACE3EE8EB031B6BB70BE83E7D
          19EB1BAEE01F3A3433DF7101BE7C83FB3D2A7AD2AC59EF6C827F50387AFBEEE0
          D89966E82D11489C9D8029931F475868D068F37F0D68D176A1BE418320A91D8B
          5FBE86F0203BCC260BFE38710EBA0EBE35FB14DEA5AE9749C67101362771525A
          7E3342FC9B3078B30E1B0B27C16CF541CCD4C998F9523CE2A6452330403D0AE0
          D6ED41683BBA5147006D04A2F613B16EC9753C124C104633B23FD98F4DC7914A
          5D7F265D710BB0B1A205923E17BF9C9F88CADA30CC782E16CFC43EA5349CAE68
          D468D1D4AC45FAC21EC43D6176B465A5E631801DB47B90A4F108A0E5AA1AB987
          A33C361E192C039B977723502DC8007B18400EED1633468F0058347506C3680D
          BE27731A764C8EBC89E84707210902381F1F6C5DBDCF3B00BBA8026F0EF5D05A
          72D637272240D50B1F58E99801A8B02D3DDF3B80B122E7F0EBF79491B4A4A3F8
          FAE3FD0F16E085F9F3158D6DA60118749DE8EEBC0AFEE482070B30C303803BB7
          FA31255285D6C68BE8D0EA9199B1E0FE014449C4EE237391F09632008B70498F
          C09008D49E3C831BD7780631979A6B49FC3D013063902441446EF53CCC5CE819
          404C84043F5FA0F3C66DFC56F3A7CD62B4A808E2153A758141280048642C394C
          59354B245114917762115E5DAC0CE04BDFB598500BD40FFBD15406AEF5DBF16B
          D5699BC5340C41DEFC6880F21608FA1CD958741A0B6CEBD4DE9A64CC7E5B19C0
          CCDF419BE63CDA756DE837F4E2B1A8483C392D1E379CF5F02975394CDEBA5100
          1BCA9B61BFBE13A09788280330635106FAFED47B484C5606E81F30A0AFE73A06
          06FA60E479584C26FA32DAF090259001ECA22E07C8BB7134C04F1761BDBADDF9
          C464EA1A7F914940C1D9E598BB441940A4EFB9D1C8C36A3543B0DBE95880CD66
          83A64EE39A116302AC2BD3C07A65ABEBE921A75F94810AEB562269A967453856
          1C2BAD5200F8B111A68E2C79FC878D1D30B45F54BF0A6FBEEF04A83C50E5B1F1
          C86BDC031CFA0BC6F62C47CA860A6F64164ACEADC1A265F3BCCE404571B57B80
          CF4BEBC16BB35C35008731C1D098B2B6D2BF3391FC81F70065454A0007CFE276
          EB16D95874198B72260E69D662E9874E80D21FAA3D361E798D5B80CF4A4EE2D6
          A56DE42F1B53E5B31930541365CDEBB16C85F719282E5002283A8EFE4BDB1D6F
          3D97B1C84024472196B77D81E529DE0314EE5300585B780406CD37B2B9201B0F
          C354E83663E5474E80FCBD9E0FC1C86BDC031494A14F93ED3416875FC1706441
          4465D736A4AEF23E037BF2140056EF2A84B16B1F449B499E8292FC5272166455
          F70EA4A7790F90FB9D1B800D73B886A7E3A25F4C5A910295A08368A115966471
          142411801050D2908E8C35DE03E4EC7603307D1217FF5A0C2A42FC3175BC1B4C
          483CFAFF01D00234803671A4045234C9EFEE1BECCC399AE1B5BB1CEE00D8F2D8
          9F14419A48F21DE37AB65A992E6FBD0D1DA966D4FFC078CBF3BB62826C3EE13E
          00D83F610FFB23FA0FF48108FDF16B778E0000000049454E44AE426082}
        ShowHint = True
        OnMouseEnter = imgMaisInformOcorrenciaMouseEnter
      end
      object imgAlertaRecorrencia: TImage
        Left = 591
        Top = 74
        Width = 32
        Height = 32
        Cursor = crHandPoint
        CustomHint = BalloonHint
        ParentShowHint = False
        Picture.Data = {
          07544269746D6170360C0000424D360C00000000000036000000280000002000
          0000200000000100180000000000000C0000C40E0000C40E0000000000000000
          0000F9F9F9F3FFFFD5F1F2E3FFFFDDFFF50424230F3448001B40002F37002533
          00203700224000224300203C00213700273800233504293707293903213E011C
          48001F4C002040001C2E0015380E295B00294B00171900343B0A1D42ECEAFFFF
          FFF7FFFDFBFFF8FFFBF8FFEBE9FF2C2546261D480B06430A0D580D1A480C1645
          0B15450D17460D1A460A1A44081B40061C3F001B43001F43002042001C430019
          48001D4E01234E02284A1329241928480008370D2E4F122F540010450F1F36E6
          FFE3FDF1E7FDFCFE16212F000310000203000600001809000900030012020010
          00000B0000060001040005070003070000060C000B0C00080C00040C00010E00
          010E000110000314000700000E00002300002C0F1B3D000A2900124523406506
          3231E1EAFF0414780A20A70C22BE1524C70812B60313B90C23CC0421BF0427BD
          0028B70025AF0027B3002DBD002BC10023BE0028C30024BF0028BE0031BD0034
          B5002DAC0027B00127BB12238A2E34A542479600000D15302C011A3A00003300
          20540000830014B4001FD30018D2001EC70026B7002EB000259D051DBD0320BF
          001EBD001EBC001FBF0622C70920C9091BC6001DC00015C20011C6001BC70024
          C00026BB011EBF0219C90028C9000DB71A2BAA314875000B0C112941041D4F01
          2253070F7A1327AA0624C30018CB0117CD0D1ED30A1AD10E21DC0027C30024C1
          0025C6002ACB002BC70027B60323A508229E132DB50D23C80016D40011D00018
          C20022C0031DC70214CD0021B6042BE50001B02F3EA500002204153613294202
          23260200911215BD2037E7000AB90013B70B22BA0C21B80010AB0C1BBD0412B8
          0914BC1921C21D20A7130F6F0F063F16082A102D82192FB11325D60018D40019
          C10025BD0524C10016C20033BA000FC3272EE3121D8C0000220F203B17293AE6
          FEFC0000831433C4000EAA0022BE0133CB0023BC0011B50527D50028C7001CBF
          001FC3102FC0102B93000E3B000700001100000A36061E821325C6041BCF001D
          BD022DB8062CBA001CB70319AE0F15C62224BF22357900070C12272F151E3FE6
          EEFFF9FFF70100840018C7002BBA0025CD0014BD0220B40A28D3001BCA000DCA
          052BB30120D51827A60D031415001D04000300142F0109980612D4002BB7002D
          A5001BC70418D10E28B20816BC002DD82225B00E0006051F2D002152FBFFF1FF
          F8FFFFFFFE090E6B0012AC0023C60022CA0825C60626BF000BB40428D40C22C8
          0020BD001BAE0830A6202E580A1B1200000F1538781726BC0D1DDB0025BD0028
          AB001DC1021ACA0621B80C26CC0015B6303E9002001C0E1F3A102C3DE9EBF5FB
          F5F0FFF9FFE4F0FF061A910010C9000EB9001DB3001BBB062CD00026A30A17CD
          0025BB0019C80019F32D35C50A1587091DC91035AD0C26C6041AD00019C10021
          B50025BD0322C5001CC5001CC4171995000011051D4B0B1338E6F0EAF6F5FFFF
          FFEAFFF5FFE5F5E40D1A680E11CA0721C70027B90429D1001DBC0026B80520B0
          0012D6002FA9001BCE1212B8001412102AC4001CBE0019C00016C50016C90521
          C20629B90123BD0017C9062ED4443B74000900001F4B222442FFFDFEE5E6FFEF
          FDD9FFF9FFFEFFE5ECF3FF000095061CB7001BB00016C4001FBD0236BE0011D2
          001BB30029AD041BCF272585000008182183001AC8001DC5001EC9071FCD0620
          C60322B9001FB8001ABF0221AC000001192E3600243DF4F6FFFFF5FFFAFFFCFB
          FFF2F5EEF3FFFFEEFAFAFF00035E0A1EA51233D60020CE0424C30017B50322BB
          081FD90026B20C15BC330D8F17061325087D0324BA001EC3001DC60021BF001D
          BC0019BE0520BE0E2DB8344392000D05000C2C10363BFDFFFBFFE8FFFFFFF0FA
          FDFFFFFFFBFDF2FCFFFFFEECFAFF0C20950000AF021EC9061EBE0014BC0C16D8
          153BB90024B300177F0109000E0700000F00122E9D051AB90017C00025AF0022
          B50014CC0B1EC51B3BA4000003072A4C112E53EBF4F1F9FEF5FFFFFEFAF3EAFB
          F8FFF1FBEBFFF2FFFFFFF8E4FAE7000A73081DD7041EC80316B9102DD50411BB
          0220A70324CE1830A7020318050018000006273F911422BB021CC60033AE002F
          B80013DA0818C516388B1B1400000658001E3BFFFEFCF6FAF5F2FFE2FFF8FFFD
          F8FFFDFFF9F4F5F9FFFFF7FFFFE8FBF6FF06007C1322CC0020B30020A80015D0
          0029D00A13C10D065B10002F1300070B001608126A0117B30829CC0E21C80005
          AA1042B4160CD1000C000322410C243AEFFEFFFBFFFEFFFFF9FFFEF4FFFFFBF9
          FEFCFFFFFEF7F9FAFFFFF8FFFFF3F0EBFF0F0C680F1FB2001EC40B24C0001DCB
          0023C00012AD00031E0000060811000113000000240613C30022B50013C72037
          CF0018B2203A86030817001D3810283CE1EEF6FBFFFEF0F1E8FFFFF9FEFFFBF9
          FEFCEFEDF3FDFFFCF8FCF6FFFFFFFDFCFFDFE8FF000A79081CD50D1BC80023BB
          0025BC0B1FBA000800000400000600000F00110707131DC80025C4001ABB0F13
          C91823A90012000A0D441C3349DAECFDF3FFFFFBFFFFFBFBF5FAFAF4FFFFFCF9
          FEFDFFFAFFFDFFF9EEF4EFFFFBFFFDFEFAF3FFFB000D560F11C90513C90028AD
          0023BB1923CF00060005001005001D0000041703000D21AF0028DA0036BC220F
          E8304670000F00111E52041424F1FDFFE2EBEFFDFFFFFFFFFCFCFBF7FFFFFEF5
          F7F7FEF6FFFBFFF9FAFFFFFDFBFFFFFFF8F4FFE8E4EFFF0400910719D2002CB5
          001CB51115C10006001300091900171B0B051000001027B90020BA0013B0311D
          CD000900173240071E34F4FDFFF8FEFFF7FCFFFCFEFEEEEFEDFAFBF9FFFFFFFD
          FFFFFFFBFFFDFFFFF8FFFFF0F4F5FBFAF0FFFFF7F4F6FF0604560115C10229C1
          0021B60B18B40012050B05000E0400070D000000150011C60040AF252BE22F32
          7D00070102123C1F3237FDFFFFEEF0F1F6F8F8FFFFFFFFFFFFFFFFFFFCFCFCF5
          F7F7FFFFFCF6F6FCF4FCFCFBFFF7FFFFF8FFF2FFF2EAFFF6FCFF000A910620C0
          0127C10A1DC4112B610B0F4200001300032124418B091ADF032AAA231F9C0000
          14172F47152750ECF2F9F1ECE9FFFFFCF7F5F4F5F5F5FDFFFFF8FAFBFFFEFFFF
          FFFFFFFAF1FBFAFFF6FFFFF9FFECFFFFFCFFE7FFFFF6FFFBFFE7000C69071AB9
          0022C50212DA2233C0191CB4031C940724C3002998011DD61012CB3B46610402
          2C001332091C42FFFBFFFFFFF9FAF6F1FFFEFDFFFFFFF2F4F5FDFFFFF5F4F6FF
          FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4FDFF000071
          0A28E10008B20838CC001CC10007B50227C50026B4171DE22F24A00011000018
          3D071C5AEAFFDDFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F1F30F1366
          091FBA0020CA000FAD031EBC1935D60426C6002CBB0B10C934368A0000081024
          4D153344D5E8D7FFFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBF0EFFF
          0009790A1BC6192DDE000DA4001AAF0014BD001DAE1422B100093015194A0C1C
          41E8FFF0F8FBFFFFF5F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCECEDFBFDFF
          00034D090FB40816D41032CB0028BA0018C90E25B718357A0000141C175C0513
          25F1FFEAF6F3FFFFFFF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFFFAFFFE
          E8F3FF0000880E1CD20019B8001CB50020D11E20A4001B19131C41151145F4FF
          FBEAF5EDFFFFFCF9F2EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFCFFEAF1EE
          F3FAFF050E650516A5112ECF0E2DCA0012AE3A2F85000F0004092AE9ECFFFAFF
          F1FFF9FFFFFFFBFFFFFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAF1F4FFFFFE
          FFFCF8F1F9FF000D660210A62830CA2C33AE11041AF1F5F0F8FEFFF8FFFBFFFF
          F2FFF8FFF1ECFFF8FFF5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFFFBFFFAF7
          FFFFECFEFFEDE6F2FF000089000087120A69FFFFEEFFEEFFF1FDE7EEFAE4FFFF
          F8FCF5FCFBEFFFEFFFE9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF}
        ShowHint = True
        Visible = False
        OnClick = imgAlertaRecorrenciaClick
        OnMouseEnter = imgAlertaRecorrenciaMouseEnter
      end
      object lblMsgRegistroDeDevolucao: TLabel
        Left = 648
        Top = 76
        Width = 351
        Height = 25
        Caption = 'Registro de Devolu'#231#227'o Localizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object Label4: TLabel
        Left = 889
        Top = 17
        Width = 109
        Height = 16
        Caption = 'Arquivo Ocorrencia'
        FocusControl = DBEdit14
      end
      object DBEdit3: TDBEdit
        Left = 10
        Top = 34
        Width = 62
        Height = 24
        DataField = 'cdOcorrencia'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit4: TDBEdit
        Left = 78
        Top = 34
        Width = 361
        Height = 24
        DataField = 'razaoSocial'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit12: TDBEdit
        Left = 443
        Top = 34
        Width = 182
        Height = 24
        DataField = 'dsContato'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object DBEdit13: TDBEdit
        Left = 629
        Top = 34
        Width = 150
        Height = 24
        DataField = 'dataRegistro'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object DBEdit14: TDBEdit
        Left = 783
        Top = 34
        Width = 100
        Height = 24
        DataField = 'dataLimite'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object dbEdtPrioridade: TDBEdit
        Left = 412
        Top = 80
        Width = 122
        Height = 24
        DataField = 'dsPrioridade'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object dbEdtStatusSolucao: TDBEdit
        Left = 10
        Top = 80
        Width = 195
        Height = 24
        DataField = 'dsStatusSolucao'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
        OnChange = dbEdtStatusSolucaoChange
      end
      object dbEdtStatusCausa: TDBEdit
        Left = 211
        Top = 80
        Width = 195
        Height = 24
        DataField = 'dsStatusCausa'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
        OnChange = dbEdtStatusCausaChange
      end
      object gbxOrdemDeColeta: TGroupBox
        Left = 3
        Top = 107
        Width = 1204
        Height = 58
        Caption = '  Ordem de Coleta  '
        TabOrder = 8
        object lblSituacaoDaOrdemDeColeta: TLabel
          Left = 10
          Top = 27
          Width = 134
          Height = 18
          Alignment = taCenter
          Caption = 'Aguardando envio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnReEnviarOrdemDeColeta: TBitBtn
          Left = 1081
          Top = 18
          Width = 108
          Height = 29
          Caption = 'Reenviar'
          DoubleBuffered = True
          Enabled = False
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333333333333333333FFFFFFFFFFFFFFF000000000000
            000077777777777777770FFFFFFFFFFFFFF07F3333FFF33333370FFFF777FFFF
            FFF07F333777333333370FFFFFFFFFFFFFF07F3333FFFFFF33370FFFF777777F
            FFF07F33377777733FF70FFFFFFFFFFF99907F3FFF33333377770F777FFFFFFF
            9CA07F77733333337F370FFFFFFFFFFF9A907FFFFFFFFFFF7FF7000000000000
            0000777777777777777733333333333333333333333333333333333333333333
            3333333333333333333333333333333333333333333333333333333333333333
            3333333333333333333333333333333333333333333333333333}
          NumGlyphs = 2
          ParentDoubleBuffered = False
          TabOrder = 0
          OnClick = btnReEnviarOrdemDeColetaClick
        end
        object edtEnderecoEmailContato: TEdit
          Left = 323
          Top = 23
          Width = 449
          Height = 24
          Hint = 'Email do destin'#225'rio da Ordem de Coleta'
          CharCase = ecLowerCase
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
        object rdgDestinatarioEmailOrdemDeColeta: TRadioGroup
          Left = 783
          Top = 10
          Width = 287
          Height = 41
          Caption = '  Destinat'#225'rio do Email   '
          Columns = 3
          ItemIndex = 0
          Items.Strings = (
            'Todos'
            'Cliente'
            'Entregador')
          TabOrder = 2
        end
      end
      object DBEdit5: TDBEdit
        Left = 889
        Top = 34
        Width = 256
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        DataField = 'dsNomeArquivo'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
      end
      object _btnLocalizaArquivo: TBitBtn
        Left = 1151
        Top = 35
        Width = 41
        Height = 23
        Hint = 'Faz DownLoad Arquivo'
        Anchors = [akTop, akRight]
        DoubleBuffered = True
        Enabled = False
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
        TabOrder = 10
        OnClick = _btnLocalizaArquivoClick
      end
    end
    object gbxItem: TGroupBox
      Left = 2
      Top = 202
      Width = 1269
      Height = 184
      Align = alClient
      Caption = '  Itens  '
      TabOrder = 1
      object dbgItem: TDBGrid
        Left = 2
        Top = 18
        Width = 1265
        Height = 164
        Cursor = crHandPoint
        CustomHint = BalloonHint
        Align = alClient
        DataSource = DM.dsItemOcorrencia
        ParentShowHint = False
        ReadOnly = True
        ShowHint = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnCellClick = dbgItemCellClick
        OnDrawColumnCell = dbgItemDrawColumnCell
        OnDblClick = dbgItemDblClick
        OnKeyPress = dbgItemKeyPress
        OnMouseEnter = dbgItemMouseEnter
        OnTitleClick = dbgItemTitleClick
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
            FieldName = 'dsStatusSolucao'
            Title.Alignment = taCenter
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dsTipoOcorrencia'
            Title.Alignment = taCenter
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dsSubTipoOcorrencia'
            Title.Alignment = taCenter
            Width = 300
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
            FieldName = 'quantProduto'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nrOrdemDevolucao'
            Title.Alignment = taCenter
            Title.Caption = 'Nro. Devolu'#231#227'o'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dsDetalheDevolucao'
            Title.Alignment = taCenter
            Title.Caption = 'Detalhe da Devolu'#231#227'o'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dsSituacaoDevolucao'
            Title.Caption = 'Situa'#231#227'o da Devolu'#231#227'o'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dsTipoProduto'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dsOrigemPedido'
            Title.Alignment = taCenter
            Width = 150
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
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nrNFe'
            Title.Alignment = taCenter
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nrSerieNFe'
            Title.Alignment = taCenter
            Width = 70
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
            FieldName = 'cdEmpresa'
            Title.Alignment = taCenter
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
            FieldName = 'nomeTransportador'
            Title.Alignment = taCenter
            Width = 150
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
            FieldName = 'dataLimite'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dsAreaOrigem'
            Title.Alignment = taCenter
            Visible = True
          end>
      end
    end
    object gbxCausa: TGroupBox
      AlignWithMargins = True
      Left = 5
      Top = 513
      Width = 1263
      Height = 74
      Align = alBottom
      Caption = '  Causa  '
      TabOrder = 3
      object Label1: TLabel
        Left = 10
        Top = 18
        Width = 112
        Height = 16
        Caption = 'Descri'#231#227'o da Causa'
        FocusControl = DBEdit1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 584
        Top = 18
        Width = 77
        Height = 16
        Caption = 'Data Registro'
        FocusControl = DBEdit6
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object imgMaisInformCausa: TImage
        Left = 745
        Top = 31
        Width = 32
        Height = 32
        Cursor = crHandPoint
        CustomHint = BalloonHint
        DragCursor = crHandPoint
        ParentShowHint = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF4000000097048597300000B1300000B1301009A9C18
          0000000467414D410000B18E7CFB5193000004F54944415478DAB5970D4C5565
          18C7FF07BA740191AF2056362C53A08D6C65B166B6B9C5D2855A3AA3B4652E1D
          A1608C362BBF5A899AC694A4A1060988CC58A0086A2353B36034CC855C11F05E
          3E4C54BAC205F570BFCF393DEFBD870B13B8E77AB567FBEF9CF39EF79CFFEF3C
          EFF39E735E4E92240C05C771182B5232B75FA073CF42214C46BEB278CF5769B4
          DB4BB228F567DEDC4880F573B850952FBE8584E705093C6B137D5530C46E4988
          8C08435464F8B837EBD1F7417FD300FFA6756D6ACE3EE8EB031B6BB70BE83E7D
          19EB1BAEE01F3A3433DF7101BE7C83FB3D2A7AD2AC59EF6C827F50387AFBEEE0
          D89966E82D11489C9D8029931F475868D068F37F0D68D176A1BE418320A91D8B
          5FBE86F0203BCC260BFE38710EBA0EBE35FB14DEA5AE9749C67101362771525A
          7E3342FC9B3078B30E1B0B27C16CF541CCD4C998F9523CE2A6452330403D0AE0
          D6ED41683BBA5147006D04A2F613B16EC9753C124C104633B23FD98F4DC7914A
          5D7F265D710BB0B1A205923E17BF9C9F88CADA30CC782E16CFC43EA5349CAE68
          D468D1D4AC45FAC21EC43D6176B465A5E631801DB47B90A4F108A0E5AA1AB987
          A33C361E192C039B977723502DC8007B18400EED1633468F0058347506C3680D
          BE27731A764C8EBC89E84707210902381F1F6C5DBDCF3B00BBA8026F0EF5D05A
          72D637272240D50B1F58E99801A8B02D3DDF3B80B122E7F0EBF79491B4A4A3F8
          FAE3FD0F16E085F9F3158D6DA60118749DE8EEBC0AFEE482070B30C303803BB7
          FA31255285D6C68BE8D0EA9199B1E0FE014449C4EE237391F09632008B70498F
          C09008D49E3C831BD7780631979A6B49FC3D013063902441446EF53CCC5CE819
          404C84043F5FA0F3C66DFC56F3A7CD62B4A808E2153A758141280048642C394C
          59354B245114917762115E5DAC0CE04BDFB598500BD40FFBD15406AEF5DBF16B
          D5699BC5340C41DEFC6880F21608FA1CD958741A0B6CEBD4DE9A64CC7E5B19C0
          CCDF419BE63CDA756DE837F4E2B1A8483C392D1E379CF5F02975394CDEBA5100
          1BCA9B61BFBE13A09788280330635106FAFED47B484C5606E81F30A0AFE73A06
          06FA60E479584C26FA32DAF090259001ECA22E07C8BB7134C04F1761BDBADDF9
          C464EA1A7F914940C1D9E598BB441940A4EFB9D1C8C36A3543B0DBE95880CD66
          83A64EE39A116302AC2BD3C07A65ABEBE921A75F94810AEB562269A967453856
          1C2BAD5200F8B111A68E2C79FC878D1D30B45F54BF0A6FBEEF04A83C50E5B1F1
          C86BDC031CFA0BC6F62C47CA860A6F64164ACEADC1A265F3BCCE404571B57B80
          CF4BEBC16BB35C35008731C1D098B2B6D2BF3391FC81F70065454A0007CFE276
          EB16D95874198B72260E69D662E9874E80D21FAA3D361E798D5B80CF4A4EE2D6
          A56DE42F1B53E5B31930541365CDEBB16C85F719282E5002283A8EFE4BDB1D6F
          3D97B1C84024472196B77D81E529DE0314EE5300585B780406CD37B2B9201B0F
          C354E83663E5474E80FCBD9E0FC1C86BDC031494A14F93ED3416875FC1706441
          4465D736A4AEF23E037BF2140056EF2A84B16B1F449B499E8292FC5272166455
          F70EA4A7790F90FB9D1B800D73B886A7E3A25F4C5A910295A08368A115966471
          142411801050D2908E8C35DE03E4EC7603307D1217FF5A0C2A42FC3175BC1B4C
          483CFAFF01D00234803671A4045234C9EFEE1BECCC399AE1B5BB1CEE00D8F2D8
          9F14419A48F21DE37AB65A992E6FBD0D1DA966D4FFC078CBF3BB62826C3EE13E
          00D83F610FFB23FA0FF48108FDF16B778E0000000049454E44AE426082}
        ShowHint = True
        OnMouseEnter = imgMaisInformCausaMouseEnter
      end
      object DBEdit1: TDBEdit
        Left = 10
        Top = 38
        Width = 568
        Height = 24
        DataField = 'dsSubTipoCausaItemOcorrencia'
        DataSource = DM.dsSolucaoItem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit6: TDBEdit
        Left = 584
        Top = 38
        Width = 155
        Height = 24
        DataField = 'dataRegistroCausa'
        DataSource = DM.dsSolucaoItem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
    object gbxSolucao: TGroupBox
      AlignWithMargins = True
      Left = 5
      Top = 389
      Width = 1263
      Height = 118
      Align = alBottom
      Caption = '  Solu'#231#227'o  '
      TabOrder = 2
      DesignSize = (
        1263
        118)
      object Label2: TLabel
        Left = 585
        Top = 19
        Width = 122
        Height = 16
        Caption = 'Descri'#231#227'o da Solu'#231#227'o'
        FocusControl = dbEdtDescSolucao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 585
        Top = 67
        Width = 77
        Height = 16
        Caption = 'Data Registro'
        FocusControl = DBEdit8
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object imgMaisInformSolucao: TImage
        Left = 746
        Top = 79
        Width = 32
        Height = 32
        Cursor = crHandPoint
        CustomHint = BalloonHint
        DragCursor = crHandPoint
        ParentShowHint = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF4000000097048597300000B1300000B1301009A9C18
          0000000467414D410000B18E7CFB5193000004F54944415478DAB5970D4C5565
          18C7FF07BA740191AF2056362C53A08D6C65B166B6B9C5D2855A3AA3B4652E1D
          A1608C362BBF5A899AC694A4A1060988CC58A0086A2353B36034CC855C11F05E
          3E4C54BAC205F570BFCF393DEFBD870B13B8E77AB567FBEF9CF39EF79CFFEF3C
          EFF39E735E4E92240C05C771182B5232B75FA073CF42214C46BEB278CF5769B4
          DB4BB228F567DEDC4880F573B850952FBE8584E705093C6B137D5530C46E4988
          8C08435464F8B837EBD1F7417FD300FFA6756D6ACE3EE8EB031B6BB70BE83E7D
          19EB1BAEE01F3A3433DF7101BE7C83FB3D2A7AD2AC59EF6C827F50387AFBEEE0
          D89966E82D11489C9D8029931F475868D068F37F0D68D176A1BE418320A91D8B
          5FBE86F0203BCC260BFE38710EBA0EBE35FB14DEA5AE9749C67101362771525A
          7E3342FC9B3078B30E1B0B27C16CF541CCD4C998F9523CE2A6452330403D0AE0
          D6ED41683BBA5147006D04A2F613B16EC9753C124C104633B23FD98F4DC7914A
          5D7F265D710BB0B1A205923E17BF9C9F88CADA30CC782E16CFC43EA5349CAE68
          D468D1D4AC45FAC21EC43D6176B465A5E631801DB47B90A4F108A0E5AA1AB987
          A33C361E192C039B977723502DC8007B18400EED1633468F0058347506C3680D
          BE27731A764C8EBC89E84707210902381F1F6C5DBDCF3B00BBA8026F0EF5D05A
          72D637272240D50B1F58E99801A8B02D3DDF3B80B122E7F0EBF79491B4A4A3F8
          FAE3FD0F16E085F9F3158D6DA60118749DE8EEBC0AFEE482070B30C303803BB7
          FA31255285D6C68BE8D0EA9199B1E0FE014449C4EE237391F09632008B70498F
          C09008D49E3C831BD7780631979A6B49FC3D013063902441446EF53CCC5CE819
          404C84043F5FA0F3C66DFC56F3A7CD62B4A808E2153A758141280048642C394C
          59354B245114917762115E5DAC0CE04BDFB598500BD40FFBD15406AEF5DBF16B
          D5699BC5340C41DEFC6880F21608FA1CD958741A0B6CEBD4DE9A64CC7E5B19C0
          CCDF419BE63CDA756DE837F4E2B1A8483C392D1E379CF5F02975394CDEBA5100
          1BCA9B61BFBE13A09788280330635106FAFED47B484C5606E81F30A0AFE73A06
          06FA60E479584C26FA32DAF090259001ECA22E07C8BB7134C04F1761BDBADDF9
          C464EA1A7F914940C1D9E598BB441940A4EFB9D1C8C36A3543B0DBE95880CD66
          83A64EE39A116302AC2BD3C07A65ABEBE921A75F94810AEB562269A967453856
          1C2BAD5200F8B111A68E2C79FC878D1D30B45F54BF0A6FBEEF04A83C50E5B1F1
          C86BDC031CFA0BC6F62C47CA860A6F64164ACEADC1A265F3BCCE404571B57B80
          CF4BEBC16BB35C35008731C1D098B2B6D2BF3391FC81F70065454A0007CFE276
          EB16D95874198B72260E69D662E9874E80D21FAA3D361E798D5B80CF4A4EE2D6
          A56DE42F1B53E5B31930541365CDEBB16C85F719282E5002283A8EFE4BDB1D6F
          3D97B1C84024472196B77D81E529DE0314EE5300585B780406CD37B2B9201B0F
          C354E83663E5474E80FCBD9E0FC1C86BDC031494A14F93ED3416875FC1706441
          4465D736A4AEF23E037BF2140056EF2A84B16B1F449B499E8292FC5272166455
          F70EA4A7790F90FB9D1B800D73B886A7E3A25F4C5A910295A08368A115966471
          142411801050D2908E8C35DE03E4EC7603307D1217FF5A0C2A42FC3175BC1B4C
          483CFAFF01D00234803671A4045234C9EFEE1BECCC399AE1B5BB1CEE00D8F2D8
          9F14419A48F21DE37AB65A992E6FBD0D1DA966D4FFC078CBF3BB62826C3EE13E
          00D83F610FFB23FA0FF48108FDF16B778E0000000049454E44AE426082}
        ShowHint = True
        OnMouseEnter = imgMaisInformSolucaoMouseEnter
      end
      object Label3: TLabel
        Left = 801
        Top = 67
        Width = 118
        Height = 16
        Caption = 'Recolher Mercadoria'
        FocusControl = DBEdit2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object dbEdtDescSolucao: TDBEdit
        Left = 584
        Top = 37
        Width = 667
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        DataField = 'dsSubTipoSolucaoItemOcorrencia'
        DataSource = DM.dsSolucaoItem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit8: TDBEdit
        Left = 585
        Top = 86
        Width = 155
        Height = 24
        DataField = 'dataRegistroSolucao'
        DataSource = DM.dsSolucaoItem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object gbxSolucaoChekOut: TGroupBox
        AlignWithMargins = True
        Left = 5
        Top = 21
        Width = 251
        Height = 92
        Align = alLeft
        Caption = '  Check Out  '
        Enabled = False
        TabOrder = 2
        object Label7: TLabel
          Left = 9
          Top = 41
          Width = 63
          Height = 16
          Caption = 'N'#186' Camera'
          FocusControl = DBEdit7
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 78
          Top = 41
          Width = 118
          Height = 16
          Caption = 'Nome do Conferente'
          FocusControl = DBEdit10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object DBEdit7: TDBEdit
          Left = 9
          Top = 60
          Width = 63
          Height = 24
          DataField = 'nrCamera'
          DataSource = DM.dsSolucaoItem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object DBEdit10: TDBEdit
          Left = 78
          Top = 60
          Width = 164
          Height = 24
          DataField = 'nomeConferente'
          DataSource = DM.dsSolucaoItem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object DBCheckBox1: TDBCheckBox
          Left = 10
          Top = 23
          Width = 123
          Height = 17
          Caption = 'Conf. Filmagem?'
          DataField = 'idFilamgem'
          DataSource = DM.dsSolucaoItem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBox2: TDBCheckBox
          Left = 137
          Top = 22
          Width = 105
          Height = 19
          Caption = 'Film. Correta?'
          DataField = 'idImagemVisivel'
          DataSource = DM.dsSolucaoItem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
      end
      object gbxSolucaoEstoque: TGroupBox
        AlignWithMargins = True
        Left = 262
        Top = 21
        Width = 155
        Height = 92
        Align = alLeft
        Caption = '  Estoque  '
        Enabled = False
        TabOrder = 3
        object Label21: TLabel
          Left = 10
          Top = 41
          Width = 49
          Height = 16
          Caption = 'Situa'#231#227'o'
          FocusControl = dbEdtSituacaoEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object DBCheckBox3: TDBCheckBox
          Left = 10
          Top = 24
          Width = 115
          Height = 17
          Caption = 'Conf. Estoque?'
          DataField = 'idContagemEstoque'
          DataSource = DM.dsSolucaoItem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object dbEdtSituacaoEstoque: TDBEdit
          Left = 10
          Top = 60
          Width = 137
          Height = 24
          DataField = 'dsSituacaoEstoque'
          DataSource = DM.dsSolucaoItem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
      end
      object gbxSolucaoTelevendas: TGroupBox
        AlignWithMargins = True
        Left = 423
        Top = 21
        Width = 155
        Height = 92
        Align = alLeft
        Caption = '  TeleVendas  '
        Enabled = False
        TabOrder = 4
        object DBCheckBox5: TDBCheckBox
          Left = 10
          Top = 50
          Width = 129
          Height = 17
          Caption = 'Conf. Grava'#231#227'o?'
          DataField = 'idEscutaGravacaoTlv'
          DataSource = DM.dsSolucaoItem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBox6: TDBCheckBox
          Left = 10
          Top = 24
          Width = 140
          Height = 17
          Caption = 'Grava'#231#227'o Correta?'
          DataField = 'idResultadoGravacaoTlv'
          DataSource = DM.dsSolucaoItem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
      end
      object DBEdit2: TDBEdit
        Left = 801
        Top = 86
        Width = 198
        Height = 24
        DataField = 'idRecolheMercadoria'
        DataSource = DM.dsSolucaoItem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
    end
  end
  object tBarAtendimento: TToolBar
    Left = 0
    Top = 0
    Width = 1279
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
    TabOrder = 2
    Transparent = True
    object tBtnCancelar: TToolButton
      Left = 0
      Top = 0
      Caption = '&Limpar'
      Enabled = False
      ImageIndex = 19
    end
    object tBtnExcluirOcorrencia: TToolButton
      Left = 122
      Top = 0
      Hint = 'Excluir Ocorr'#234'ncia'
      Caption = '&Excluir'
      Enabled = False
      ImageIndex = 10
      ParentShowHint = False
      ShowHint = True
      OnClick = tBtnExcluirOcorrenciaClick
    end
    object tbtnRecorrencia: TToolButton
      Left = 244
      Top = 0
      Hint = 'Registrar Recorrencia'
      Caption = 'Re&correncia'
      ImageIndex = 14
      ParentShowHint = False
      ShowHint = True
      OnClick = tbtnRecorrenciaClick
    end
    object tBtnCancelarOcorrencia: TToolButton
      Left = 366
      Top = 0
      Hint = 'Cancelar Ocorr'#234'ncia'
      AutoSize = True
      Caption = 'Ca&ncelar Registro'
      ImageIndex = 7
      ParentShowHint = False
      ShowHint = True
      OnClick = tBtnCancelarOcorrenciaClick
    end
    object tBtnFechar: TToolButton
      Left = 492
      Top = 0
      Caption = '&Fechar'
      ImageIndex = 21
      OnClick = tBtnFecharClick
    end
  end
  object DataSource1: TDataSource
    DataSet = DM.cdsOcorrencia
    Left = 440
    Top = 272
  end
  object BalloonHint: TBalloonHint
    Left = 576
    Top = 48
  end
  object ImageList: TImageList
    Left = 296
    Top = 280
    Bitmap = {
      494C010116001E00480010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000006000000001002000000000000060
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      FF00000080000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      FF00000080000000FF0000000000008080000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      FF00000080000000FF0000808000008080000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      FF00000080000000FF0000808000008080000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      FF00000080000000FF0000808000000000000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000000000000000
      000000000000FFFFFF00000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      0000FFFFFF000000000080808000000000000000000000000000000080000000
      8000000080000000800000008000000000000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800000000000000000000000000000808000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      800000008000000080000000800000008000000080000000800000FFFF000000
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080800000808000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008080000080800000808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000808000008080000080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      800000008000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000080800000808000008080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      800000008000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000808000000000000000000000000000000000008080
      8000000000008080800000000000000000000000000000000000000000000000
      800000008000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000000000008080800000000000000000000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000000
      0000000000000000000000000000808080000000000000000000000000008080
      8000000000008080800000000000000000000000000000000000000000000000
      8000000080000000800000008000000080000000800000008000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000800000008000000080000000800000008000000080000000
      8000000080000000000000000000000000000000000000FFFF0000FFFF000000
      00000000FF000000800000008000000080000000800000008000000080000000
      8000000080000000000000FFFF0000FFFF000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000008000000080000000
      00000000FF00C0C0C00000000000C0C0C00000000000C0C0C00000000000C0C0
      C000000080000000000000000000000000000000000000008000000080000000
      00000000FF00C0C0C00000000000C0C0C00000000000C0C0C00000000000C0C0
      C000000080000000000000FFFF00000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000000000FFFF00000000800000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000080000000000000000000000000000000800000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000800000000000000000000000000000000000000000000000FF000000
      FF000000FF0000000000808080000000000080808000000000000000FF000000
      FF000000FF0000000000000000000000000000000000FFFFFF0000000000FFFF
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000FFFF00000000800000000000000000000000
      0000000000000000FF00C0C0C00000000000C0C0C00000000000C0C0C0000000
      FF00000000000000000000000000000000000000800000000000000000000000
      0000000000000000FF00C0C0C00000000000C0C0C00000000000C0C0C0000000
      FF0000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF00000000000000000000000000FFFFFF00FFFFFF000000
      000000000000FFFFFF0000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000FFFF00000000800000000000000000000000
      000000008000000000000000FF000000FF000000FF000000FF000000FF000000
      0000000080000000000000000000000000000000800000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000000080808000000000008080800000000000000000000000
      00000000FF000000FF00000000000000000000000000FFFFFF00FFFF00000000
      000000FFFF000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000FFFF00008080800000000000000080000000
      8000000080000000000000000000000000000000000000000000000000000000
      00000000800000008000000080000000000000FFFF0000000000000080000000
      800000FFFF000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000FFFF000000000000000000000000FF000000
      FF000000FF000000000000008000000080000000800000008000000080000000
      00000000FF000000FF000000FF000000000000FFFF0000000000000080000000
      8000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      000000FFFF0000FFFF0000FFFF0000FFFF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000000000000000FFFFFF00FFFF0000FFFF
      0000FFFF00000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000FFFF0000000000FFFF00000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000080000000
      80000000800000000000C0C0C00000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000000080808000000000008080800000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000FFFF00000000000000000000FFFF00FFFF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000008000000000000000000000000000000000000000FF000000
      FF0000008000000080000000800000FFFF0000FFFF0000000000000000000000
      8000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000000000008000000000000000800000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF00000000000000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000080000000
      FF000000FF000000FF0000008000000000000000000000008000000000000000
      8000000080000000800000000000000000000000FF000000FF00000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF00000080000000
      FF000000FF000000FF000000000000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF00000000000000000000000000FFFFFF000000
      0000FFFFFF0000000000FFFFFF0000000000FFFFFF000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0080808000000080000000000000000000000080000000FF000000
      FF0000008000000080000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000808080000000
      00008080800000000000808080000000000080808000000000000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000000000000000000000000000FFFF0000FFFF0080808000000000000000
      80000000800000FFFF00000000000000000000000000000000000000FF000000
      FF000000FF0000000000808080000000000080808000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000808080000000
      0000808080000000000080808000000000008080800000000000000000000000
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
      0000000000000000000000FFFF00000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080808000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF000000000000000000FFFFFF00808080008080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008080800080808000FFFFFF00000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFFFF00000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF000080800000FFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00808080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000080800000FFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000080
      800000FFFF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00808080000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF00808080008080800080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF000080800000FF
      FF000000000000000000000000000000000000000000FFFFFF00808080000000
      000080808000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000000000000000
      000000000000000000000000000000000000000000000080800000FFFF000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      0000FFFF0000FFFF000000000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF0080808000FFFFFF00808080008080800080808000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      000000000000000000000000000000000000808080000000000000FFFF0000FF
      FF0000FFFF00000000000000000000FFFF000080800000FFFF00000000000000
      0000000000000000000000000000000000000000000080808000808080008080
      8000808080008080800000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF000080800000FFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      0000FFFF0000FFFF000000000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF008080800080808000FFFFFF0080808000FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      00000000FF000000FF0000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      000080808000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFFFF0000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      00000000FF000000FF0000000000000000000000000000FFFF0000FFFF000000
      0000000000000080800000FFFF0000FFFF000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080000000000000000000FFFFFF00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF00000000000000000000000000
      000000000000000000000000000000000000808080008080800000FFFF000000
      0000000000000080800000FFFF0000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF00008080000080800000FFFF0000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000008080800000000000808080000000000080808000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      800000FFFF0000FFFF0000FFFF0000FFFF000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000008080800000000000808080000000000080808000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000000000000000000000000000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      0000808080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C0000000
      0000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000808080000000000080808000000000000000
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
      00000000FF000000FF000000FF008080800000000000808080000000FF000000
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
      FF00000000000000000000000000FFFFFF0000000000C0C0C000000000000000
      0000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000C0C0C00000000000FF000000FF000000FF00
      00000000FF00FF000000FF00000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF0000000000000000000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000080000000000000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      FF000000FF000000FF000000000000000000FFFF00000000000000FFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000000000000000000000000000
      000000000000000000000000FF000000800000000000000080000000FF000000
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
      FF000000FF000000FF000000FF000000FF0000000000C0C0C000FFFFFF000000
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
      FF000000FF000000000000000000808080000000000080808000000000000000
      00000000FF000000FF000000FF0000000000000000000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000C0C0
      C000FFFFFF0000000000FFFFFF00000000000000000000000000808080000000
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
      0000000000000000000000000000000000000000000000000000C0C0C0000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000C0C0
      C000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000800000008000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF0000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000080000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF00000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000000000000000000000000000000000FFFF000000
      0000000000000000000000FFFF0000000000C0C0C00000000000008080000080
      8000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      80000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF00000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000000000C0C0C00000000000008080000080
      8000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      00000080800000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000FF000000
      FF0000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000000000FF
      FF000000000000808000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      000000FFFF0000000000008080000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00808080008080800000000000008080000080
      800000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF000000000000FFFF00008080000080800000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF000080800000000000FFFFFF0000000000C0C0
      C000FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000808080008080800080808000808080008080800080808000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00808080008080800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000080800000FFFF000080800000FFFF000080800000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000080800000FFFF000080800000FF
      FF00000000000000000000000000000000000000000000000000000000008080
      8000808080008080800080808000808080008080800000000000000000000000
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
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
      000000000000000000000000000000000000C0C0C00000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF0000000000000000000000000000000000FFFF0000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000808080008080800000000000000000000000000000000000000000000000
      000000000000808080000000000080808000C0C0C00080808000000000000000
      00000000000000000000000000000000FF0000000000000000000000FF000000
      FF000000000000000000808080000000000080808000000000000000FF000000
      FF000000FF00000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080008080800000000000C0C0C000C0C0C000C0C0C000000000000000
      000000000000000000000000FF0000000000000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF000000
      000000000000FFFFFF00FFFFFF000000000000000000000000000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000808080008080800000000000C0C0C000C0C0C000C0C0C000000000000000
      0000000000000000FF000000000000000000000000000000FF00000000000000
      FF000000FF000000FF0080808000000000008080800000000000000000000000
      00000000FF000000FF000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000000000000000000000FF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      800080808000808080000000000000000000C0C0C000C0C0C000000000000000
      00000000FF000000000000000000000000000000FF000000FF00000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF0000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000008080800000000000C0C0
      C000C0C0C000C0C0C00000000000C0C0C00000000000C0C0C000808080000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF0000000000FFFF00000000000000FFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000000000008080
      8000808080008080800000000000C0C0C00000000000C0C0C000808080000000
      00000000FF000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000080808000000000008080800000000000000000000000
      0000000000000000FF000000FF000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00000000000000000000FFFF0000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00000000000000000000000000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      00008080800080808000000000000000000000000000C0C0C00000000000C0C0
      C000C0C0C000C0C0C00000000000C0C0C00000000000C0C0C000808080000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000000000800000000000000080000000FF00000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C000C0C0C0000000000000000000C0C0C000C0C0C000000000000000
      00000000FF000000000000000000000000000000FF000000FF00000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000C0C0C000C0C0C0000000000080808000C0C0C000C0C0C000000000000000
      0000000000000000FF000000000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000FF0000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000FFFFFF00FFFFFF000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF000000000000000000000000000000FF000000
      FF000000FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000C0C0C000C0C0C000000000008080800080808000C0C0C000000000000000
      000000000000000000000000FF0000000000000000000000FF000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      000000FFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00080808000808080008080800080808000000000000000
      00000000000000000000000000000000FF0000000000000000000000FF000000
      FF000000FF000000000080808000000000008080800000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C0C0C000000000008080800000000000000000000000
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
  object PopupMenu: TPopupMenu
    Left = 728
    Top = 8
    object menuReabrirOcorrencia: TMenuItem
      Caption = 'Reabrir Ocorr'#234'ncia'
      Enabled = False
      OnClick = menuReabrirOcorrenciaClick
    end
  end
end
