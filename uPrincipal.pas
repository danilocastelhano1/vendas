unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TFrmPrincipal = class(TForm)
    mmPrincipal: TMainMenu;
    Vendas1: TMenuItem;
    LanPedidos: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure LanPedidosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses uLanctoVendas, udmDados;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  Application.CreateForm(TdmDados, dmDados);
end;

procedure TFrmPrincipal.LanPedidosClick(Sender: TObject);
begin
  Application.CreateForm(TFrmLanctoVendas, FrmLanctoVendas);
  FrmLanctoVendas.Show;
end;

end.
