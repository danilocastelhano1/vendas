object dmDados: TdmDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 280
  Width = 456
  object conn: TFDConnection
    Params.Strings = (
      'Database=wk_teste_danilo'
      'User_Name=root'
      'Password=!Dann346534'
      'Server=192.168.0.123'
      'DriverID=MySQL')
    LoginPrompt = False
    AfterConnect = connAfterConnect
    Left = 32
    Top = 16
  end
  object myDriver: TFDPhysMySQLDriverLink
    VendorLib = 'E:\Danilo\WK_TESTE\Win32\Debug\libmysql.dll'
    Left = 80
    Top = 16
  end
  object qVenda: TFDQuery
    Connection = conn
    SQL.Strings = (
      'Select * from Venda')
    Left = 232
    Top = 80
    object qVendaNumPed: TFDAutoIncField
      FieldName = 'NumPed'
      Origin = 'NumPed'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qVendaCodCli: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CodCli'
      Origin = 'CodCli'
    end
    object qVendaNomeCli: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NomeCli'
      Origin = 'NomeCli'
      Size = 255
    end
    object qVendaDtEmissao: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DtEmissao'
      Origin = 'DtEmissao'
    end
    object qVendaVlrTotal: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'VlrTotal'
      Origin = 'VlrTotal'
    end
  end
  object qVendaItem: TFDQuery
    Connection = conn
    SQL.Strings = (
      'Select * From Venda_Item')
    Left = 232
    Top = 136
    object qVendaItemChave: TFDAutoIncField
      FieldName = 'Chave'
      Origin = 'Chave'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qVendaItemNumPed: TIntegerField
      FieldName = 'NumPed'
      Origin = 'NumPed'
      Required = True
    end
    object qVendaItemCodProd: TIntegerField
      FieldName = 'CodProd'
      Origin = 'CodProd'
      Required = True
    end
    object qVendaItemDescrProd: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DescrProd'
      Origin = 'DescrProd'
      Size = 255
    end
    object qVendaItemQtde: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'Qtde'
      Origin = 'Qtde'
      Precision = 12
      Size = 2
    end
    object qVendaItemUnitario: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'Unitario'
      Origin = 'Unitario'
      Precision = 12
      Size = 2
    end
    object qVendaItemTotal: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'Total'
      Origin = 'Total'
      Precision = 12
      Size = 2
    end
  end
  object dsVenda: TDataSource
    DataSet = qVenda
    Left = 304
    Top = 80
  end
  object dsVendaItem: TDataSource
    Left = 304
    Top = 136
  end
  object qClientes: TFDQuery
    Connection = conn
    SQL.Strings = (
      'Select * from Clientes')
    Left = 32
    Top = 88
    object qClientesCodigo: TFDAutoIncField
      FieldName = 'Codigo'
      Origin = 'Codigo'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qClientesNome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Nome'
      Origin = 'Nome'
      Size = 255
    end
    object qClientesCidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Cidade'
      Origin = 'Cidade'
      Size = 150
    end
    object qClientesUF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
  end
  object dsClientes: TDataSource
    DataSet = qClientes
    Left = 88
    Top = 88
  end
end
