unit uLanctoVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Stan.StorageBin, Vcl.Grids, Vcl.DBGrids;

type
  TFrmLanctoVendas = class(TForm)
    pnlVendas: TPanel;
    Label1: TLabel;
    memItens: TFDMemTable;
    memItensIdVenda: TIntegerField;
    memItensCodProd: TIntegerField;
    memItensDescrProd: TStringField;
    memItensQtde: TBCDField;
    memItensUnitario: TBCDField;
    memItensTotal: TBCDField;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    dsMem: TDataSource;
    btnSalvar: TButton;
    btnDeletar: TButton;
    Panel2: TPanel;
    Label2: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    btnInserir: TButton;
    btnEditar: TButton;
    Label8: TLabel;
    Button3: TButton;
    Button5: TButton;
    Label9: TLabel;
    lblTotalPedido: TLabel;
    btnCancelarPedido: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSalvarClick(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure memItensAfterRefresh(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarPedidoClick(Sender: TObject);
  private
    { Private declarations }
    procedure iniciar_venda;
    procedure limpar_edits;
    procedure gravar_pedido;
    procedure AttribuiValorTotalALabel(txt:String);
    function GetValorTotalItens:Real;
  public
    { Public declarations }
  end;

var
  FrmLanctoVendas: TFrmLanctoVendas;

implementation

{$R *.dfm}

uses udmDados;

procedure TFrmLanctoVendas.btnSalvarClick(Sender: TObject);
begin
  memItens.Post;
  memItens.Refresh;
  btnInserir.SetFocus;
end;

procedure TFrmLanctoVendas.btnCancelarPedidoClick(Sender: TObject);
Var
  NumPedStr: String;
  NumPedInt: integer;
  qry: TFDQuery;
begin
  NumPedStr := '';
  NumPedStr := InputBox('Cancelar Pedido','Informe o Nº do Pedido: ', NumPedStr);

  if NumPedStr <> '' then
  begin
    try
      NumPedInt := StrToInt(NumPedStr);
      qry := TFDQuery.Create(self);
      qry.Connection := dmDados.conn;
      qry.SQL.Clear;
      qry.SQL.Add('Select NumPed From venda where NumPed='+NumPedStr);
      qry.Open;
      if qry.RecordCount = 0 then
      begin
        ShowMessage('Venda não Localizada no Sistema');
        exit;
      end;

      if MessageDlg('Confirma o Cancelamento dessa Venda?', mtConfirmation, [mbYes, MbNo], 0) = mrYes then
      begin
        qry.SQL.Clear;
        qry.SQL.Add('delete From venda where NumPed='+NumPedStr);
        qry.ExecSQL;

        ShowMessage('Venda Cancelada com Sucesso!');
      end;

      qry.Free;
    Except on E:Exception do
      begin
        ShowMessage('Informe Somente Números!');
      end;

    end;
  end;
end;

procedure TFrmLanctoVendas.btnDeletarClick(Sender: TObject);
begin
  if memItens.RecordCount > 0 then
    if MessageDlg('Confirma a Exclusão desse Item?', mtConfirmation, [mbYes, MbNo], 0) = mrYes then
    begin
      memItens.Delete;
      memItens.Refresh;
    end;
end;

procedure TFrmLanctoVendas.Button3Click(Sender: TObject);
begin
  gravar_pedido();
end;

procedure TFrmLanctoVendas.AttribuiValorTotalALabel(txt: String);
begin
  lblTotalPedido.Caption := txt;
end;

procedure TFrmLanctoVendas.btnInserirClick(Sender: TObject);
begin
  if memItens.State in [dsBrowse] then
  begin
    memItens.Append;
    DBEdit1.SetFocus;
  end;

end;

procedure TFrmLanctoVendas.btnEditarClick(Sender: TObject);
begin
  memItens.Edit;
  DBEdit1.SetFocus;
end;

procedure TFrmLanctoVendas.Button5Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmLanctoVendas.DBEdit1Exit(Sender: TObject);
var
  qry:TFDQuery;
begin
  if memItensCodProd.AsString <> '' then
  begin
    qry := TFDQuery.Create(self);
    qry.Connection := dmDados.conn;
    qry.SQL.Clear;
    qry.SQL.Add('Select descricao, prvenda from produtos where Codigo='+memItensCodProd.AsString);
    qry.open;

    if qry.RecordCount = 0 then
    begin
      ShowMessage('Produto não Localizado, Refaça a Busca!');
      exit;
    end;

    memItensDescrProd.AsString := qry.FieldByName('descricao').AsString;
    memItensUnitario.AsFloat := qry.FieldByName('prvenda').AsFloat;
    DBEdit3.SetFocus;
  end;
end;

procedure TFrmLanctoVendas.DBEdit3Exit(Sender: TObject);
begin
  if memItensQtde.AsFloat > 0  then
  begin
    memItensTotal.AsFloat := memItensQtde.AsFloat * memItensUnitario.AsFloat;
    btnSalvar.SetFocus;
  end;
end;

procedure TFrmLanctoVendas.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_DELETE then
  begin
    if MessageDlg('Confirma a Exclusão do Item: '+memItensDescrProd.AsString+' ?', mtConfirmation, [mbYes, MbNo], 0) = mrYes then
    begin
      memItens.Delete;
      memItens.Refresh;
    end;
  end;
  if key = VK_RETURN then
  begin
    memItens.Edit;
    DBEdit1.SetFocus;
  end;
end;

procedure TFrmLanctoVendas.DBLookupComboBox1Exit(Sender: TObject);
var
  qry:TFDQuery;
begin
  if dmDados.qVendaCodCli.AsInteger > 0 then
  begin
    qry := TFDQuery.Create(self);
    qry.Connection := dmDados.conn;
    qry.SQL.Clear;
    qry.SQL.Add('Select nome from clientes where Codigo='+dmDados.qVendaCodCli.AsString);
    qry.open;

    if qry.RecordCount > 0 then
      dmDados.qVendaNomeCli.AsString := qry.FieldByName('nome').AsString;

    btnInserir.SetFocus;
  end;
end;

procedure TFrmLanctoVendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree
end;

procedure TFrmLanctoVendas.FormCreate(Sender: TObject);
begin
  AttribuiValorTotalALabel('');
  pnlVendas.Enabled := False;
end;

procedure TFrmLanctoVendas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F2 then
    iniciar_venda()
  else if key = VK_F3 then
    gravar_pedido();
end;

procedure TFrmLanctoVendas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 1, 0);
  end;
end;

function TFrmLanctoVendas.GetValorTotalItens: Real;
var
  total: real;
begin
  total := 0;
  memItens.First;
  while not memItens.Eof do
  begin
    total := total + memItensTotal.AsFloat;
    memItens.Next;
  end;
  memItens.First;
  result := total;
end;

procedure TFrmLanctoVendas.gravar_pedido;
begin
  if dmDados.qVenda.State in [dsInsert] then
  begin
    if MessageDlg('Confirma a Gravação dessa Venda?', mtConfirmation, [mbYes, MbNo], 0) = mrYes then
    begin
      dmDados.qVendaDtEmissao.AsDateTime := Now;
      dmDados.qVendaVlrTotal.AsFloat := GetValorTotalItens;
      dmDados.qVenda.Post;
      dmDados.qVenda.Last;

      dmDados.qVendaItem.Close;
      dmDados.qVendaItem.Open;

      memItens.First;
      while not memItens.Eof do
      begin
        with dmDados do
        begin
          qVendaItem.Append;
          qVendaItemNumPed.AsInteger   := dmDados.qVendaNumPed.AsInteger;
          qVendaItemCodProd.AsInteger  := memItensCodProd.AsInteger;
          qVendaItemDescrProd.AsString := memItensDescrProd.AsString;
          qVendaItemQtde.AsFloat       := memItensQtde.AsFloat;
          qVendaItemUnitario.AsFloat   := memItensUnitario.AsFloat;
          qVendaItemTotal.AsFloat      := memItensTotal.AsFloat;
          qVendaItem.Post;
        end;
        memItens.Next;
      end;
      ShowMessage('Venda Concluída com Sucesso!');

      dmDados.qVenda.Close;
      dmDados.qVendaItem.Close;
      memItens.EmptyDataSet;
      memItens.Close;
      AttribuiValorTotalALabel('');
      pnlVendas.Enabled := false;
      btnCancelarPedido.Visible := true;
    end;
  end;
end;

procedure TFrmLanctoVendas.iniciar_venda;
begin
  pnlVendas.Enabled := true;
  btnCancelarPedido.Visible := false;

  dmDados.qVenda.Open;
  dmDados.qVenda.Append;

  memItens.Open;
  memItens.EmptyDataSet;

  DBLookupComboBox1.SetFocus;
end;

procedure TFrmLanctoVendas.limpar_edits;
var
  i:integer;
begin
  for i:=0 to ComponentCount-1 do
  begin
    if (Components[i]).ClassName = 'TEdit' then
      Tedit(Components[i]).Clear;
  end;
end;

procedure TFrmLanctoVendas.memItensAfterRefresh(DataSet: TDataSet);
var
  total:real;
begin
  total := 0;
  memItens.First;
  while not memItens.Eof do
  begin
    total := total + memItensTotal.AsFloat;
    memItens.Next;
  end;
  AttribuiValorTotalALabel(FormatFloat('###,##0.00', total));
end;

end.
