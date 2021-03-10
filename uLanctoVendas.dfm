object FrmLanctoVendas: TFrmLanctoVendas
  Left = 0
  Top = 0
  Caption = 'Lan'#231'amento de Vendas'
  ClientHeight = 472
  ClientWidth = 1034
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 407
    Width = 268
    Height = 23
    Caption = '[F2] Inicia uma Venda Nova'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label8: TLabel
    Left = 8
    Top = 436
    Width = 181
    Height = 23
    Caption = '[F3] Gravar Pedido'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object pnlVendas: TPanel
    Left = 0
    Top = 0
    Width = 1034
    Height = 377
    Align = alTop
    Caption = 'btn'
    TabOrder = 0
    object Label9: TLabel
      Left = 528
      Top = 309
      Width = 159
      Height = 23
      Caption = 'R$ Total Pedido:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTotalPedido: TLabel
      Left = 752
      Top = 308
      Width = 74
      Height = 23
      Alignment = taRightJustify
      Caption = 'R$ 0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 60
      Width = 1032
      Height = 245
      Align = alTop
      Caption = 'Itens da Venda'
      TabOrder = 0
      object DBGrid1: TDBGrid
        Left = 2
        Top = 81
        Width = 1028
        Height = 162
        Align = alClient
        DataSource = dsMem
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnKeyDown = DBGrid1KeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'CodProd'
            Title.Caption = 'C'#243'd. Produto'
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DescrProd'
            Title.Caption = 'Descri'#231#227'o do Produto'
            Width = 396
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Qtde'
            Title.Alignment = taRightJustify
            Width = 109
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Unitario'
            Title.Alignment = taRightJustify
            Title.Caption = 'R$ Unit'#225'rio'
            Width = 105
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Total'
            Title.Alignment = taRightJustify
            Title.Caption = 'R$ Total'
            Width = 114
            Visible = True
          end>
      end
      object Panel1: TPanel
        Left = 2
        Top = 15
        Width = 1028
        Height = 66
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitWidth = 597
        object Label3: TLabel
          Left = 86
          Top = 8
          Width = 60
          Height = 13
          Caption = 'C'#243'd Produto'
        end
        object Label4: TLabel
          Left = 166
          Top = 8
          Width = 72
          Height = 13
          Caption = 'Descr. Produto'
        end
        object Label5: TLabel
          Left = 486
          Top = 8
          Width = 24
          Height = 13
          Caption = 'Qtde'
        end
        object Label6: TLabel
          Left = 566
          Top = 8
          Width = 37
          Height = 13
          Caption = 'Unit'#225'rio'
        end
        object Label7: TLabel
          Left = 646
          Top = 8
          Width = 24
          Height = 13
          Caption = 'Total'
        end
        object DBEdit1: TDBEdit
          Left = 86
          Top = 27
          Width = 60
          Height = 21
          DataField = 'CodProd'
          DataSource = dsMem
          TabOrder = 1
          OnExit = DBEdit1Exit
        end
        object DBEdit2: TDBEdit
          Left = 166
          Top = 27
          Width = 305
          Height = 21
          DataField = 'DescrProd'
          DataSource = dsMem
          Enabled = False
          TabOrder = 2
        end
        object DBEdit3: TDBEdit
          Left = 486
          Top = 27
          Width = 65
          Height = 21
          DataField = 'Qtde'
          DataSource = dsMem
          TabOrder = 3
          OnExit = DBEdit3Exit
        end
        object DBEdit4: TDBEdit
          Left = 566
          Top = 27
          Width = 65
          Height = 21
          DataField = 'Unitario'
          DataSource = dsMem
          TabOrder = 4
        end
        object DBEdit5: TDBEdit
          Left = 646
          Top = 27
          Width = 97
          Height = 21
          DataField = 'Total'
          DataSource = dsMem
          Enabled = False
          TabOrder = 5
        end
        object btnSalvar: TButton
          Left = 749
          Top = 27
          Width = 75
          Height = 25
          Caption = 'Salvar Item'
          TabOrder = 6
          OnClick = btnSalvarClick
        end
        object btnDeletar: TButton
          Left = 911
          Top = 27
          Width = 75
          Height = 25
          Caption = 'Deletar Item'
          TabOrder = 8
          OnClick = btnDeletarClick
        end
        object btnInserir: TButton
          Left = 5
          Top = 27
          Width = 75
          Height = 25
          Caption = 'Inserir Item'
          TabOrder = 0
          OnClick = btnInserirClick
        end
        object btnEditar: TButton
          Left = 830
          Top = 27
          Width = 75
          Height = 25
          Caption = 'Editar Item'
          TabOrder = 7
          OnClick = btnEditarClick
        end
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 1032
      Height = 59
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitWidth = 955
      object Label2: TLabel
        Left = 17
        Top = 9
        Width = 78
        Height = 13
        Caption = 'Nome do Cliente'
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 17
        Top = 25
        Width = 353
        Height = 21
        DataField = 'CodCli'
        DataSource = dmDados.dsVenda
        KeyField = 'Codigo'
        ListField = 'Nome'
        ListSource = dmDados.dsClientes
        TabOrder = 0
        OnExit = DBLookupComboBox1Exit
      end
    end
    object Button3: TButton
      Left = 8
      Top = 311
      Width = 178
      Height = 49
      Caption = '[F3] Gravar Pedido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button5: TButton
      Left = 956
      Top = 311
      Width = 75
      Height = 25
      Caption = 'Sair'
      TabOrder = 3
      OnClick = Button5Click
    end
  end
  object btnCancelarPedido: TButton
    Left = 320
    Top = 410
    Width = 105
    Height = 25
    Caption = 'Cancelar Pedido'
    TabOrder = 1
    OnClick = btnCancelarPedidoClick
  end
  object memItens: TFDMemTable
    AfterRefresh = memItensAfterRefresh
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    FormatOptions.AssignedValues = [fvMaxBcdPrecision, fvMaxBcdScale]
    FormatOptions.MaxBcdPrecision = 2147483647
    FormatOptions.MaxBcdScale = 2147483647
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable, uvAutoCommitUpdates]
    UpdateOptions.LockWait = True
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 688
    Top = 48
    object memItensIdVenda: TIntegerField
      FieldName = 'IdVenda'
      Required = True
    end
    object memItensCodProd: TIntegerField
      FieldName = 'CodProd'
    end
    object memItensDescrProd: TStringField
      FieldName = 'DescrProd'
      Size = 255
    end
    object memItensQtde: TBCDField
      FieldName = 'Qtde'
      DisplayFormat = '###,##0.00'
      Precision = 12
      Size = 2
    end
    object memItensUnitario: TBCDField
      FieldName = 'Unitario'
      DisplayFormat = '###,##0.00'
      Precision = 12
      Size = 2
    end
    object memItensTotal: TBCDField
      FieldName = 'Total'
      DisplayFormat = '###,##0.00'
      Precision = 12
      Size = 2
    end
  end
  object dsMem: TDataSource
    DataSet = memItens
    Left = 632
    Top = 48
  end
end
