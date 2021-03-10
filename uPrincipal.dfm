object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'WK Teste - Danilo Antonio Castelhano'
  ClientHeight = 510
  ClientWidth = 724
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mmPrincipal
  OldCreateOrder = False
  Position = poMainFormCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object mmPrincipal: TMainMenu
    Left = 360
    Top = 264
    object Vendas1: TMenuItem
      Caption = 'Pedidos'
      object LanPedidos: TMenuItem
        Caption = 'Lan'#231'ar Pedidos'
        OnClick = LanPedidosClick
      end
    end
  end
end
