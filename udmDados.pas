unit udmDados;

interface

uses
  Dialogs, System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  Vcl.Forms, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TdmDados = class(TDataModule)
    conn: TFDConnection;
    myDriver: TFDPhysMySQLDriverLink;
    qVenda: TFDQuery;
    qVendaItem: TFDQuery;
    dsVenda: TDataSource;
    dsVendaItem: TDataSource;
    qClientes: TFDQuery;
    qClientesCodigo: TFDAutoIncField;
    qClientesNome: TStringField;
    qClientesCidade: TStringField;
    qClientesUF: TStringField;
    dsClientes: TDataSource;
    qVendaNumPed: TFDAutoIncField;
    qVendaCodCli: TIntegerField;
    qVendaNomeCli: TStringField;
    qVendaDtEmissao: TDateTimeField;
    qVendaVlrTotal: TSingleField;
    qVendaItemChave: TFDAutoIncField;
    qVendaItemNumPed: TIntegerField;
    qVendaItemCodProd: TIntegerField;
    qVendaItemDescrProd: TStringField;
    qVendaItemQtde: TBCDField;
    qVendaItemUnitario: TBCDField;
    qVendaItemTotal: TBCDField;
    procedure DataModuleCreate(Sender: TObject);
    procedure connAfterConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDados: TdmDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmDados.connAfterConnect(Sender: TObject);
begin
 qClientes.Open;
end;

procedure TdmDados.DataModuleCreate(Sender: TObject);
begin
  try
    conn.Connected := False;
    myDriver.VendorLib := GetCurrentDir + '\libmysql.dll';
    conn.Connected := True;
  Except on E:Exception do
    begin
      ShowMessage('Erro ao Conectar com o MySQL, Erro: '+#13+#10+E.Message);
      Application.Terminate;
    end;

  end;
end;

end.
