unit Main.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Produto.Entity, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, DMDataModule, Datasnap.DBClient,
  Produto.Controller, Produto.Service, Vcl.ExtCtrls;

type
  TvMain = class(TForm)
    btnFindAll: TButton;
    btnInsert: TButton;
    btnUpdate: TButton;
    btnDelete: TButton;
    btnFindByID: TButton;
    DBGridProd: TDBGrid;
    DS: TDataSource;
    btnFindLike: TButton;
    edtPesquisa: TEdit;
    procedure btnFindAllClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnFindByIDClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFindLikeClick(Sender: TObject);
  private
    MemProdutos: TFDMemTable;
  public
    { Public declarations }
  end;

var
  vMain: TvMain;

implementation

{$R *.dfm}

procedure TvMain.btnDeleteClick(Sender: TObject);
var
  oProduto: TProdutoEntity;
begin
  oProduto := TProdutoEntity.New;
  try
    try
      with oProduto do
      begin
        SetID(MemProdutos.FieldByName('id').AsInteger)
          .SetDescricao('UpdateTesteMarcelo').SetCodigoBarra('1234')
          .SetIdCadastro('123456');
      end;
      TProdutoController.New.Delete(oProduto);
      btnFindAllClick(Sender);
    except
      on E: Exception do
        Application.MessageBox(PWideChar(E.Message),
          'Mensagem do Sistema', MB_OK);
    end;
  finally
    oProduto.Free;
  end;
end;

procedure TvMain.btnFindAllClick(Sender: TObject);
begin
  TProdutoController.New.FindAll(MemProdutos);
  DBGridProd.DataSource.DataSet := MemProdutos;
end;

procedure TvMain.btnFindByIDClick(Sender: TObject);
begin
  TProdutoController.New.FindByID(MemProdutos, MemProdutos.FieldByName('id')
    .AsInteger);
  DBGridProd.DataSource.DataSet := MemProdutos;
end;

procedure TvMain.btnFindLikeClick(Sender: TObject);
var
  oProdutoController: TProdutoController;
begin
  oProdutoController := TProdutoController.Create;
  try
    oProdutoController.FindLike(MemProdutos, edtPesquisa.Text);
    DBGridProd.DataSource.DataSet := MemProdutos;
  finally
    oProdutoController.Free;
  end;
end;

procedure TvMain.btnInsertClick(Sender: TObject);
var
  oProduto: TProdutoEntity;
begin
  oProduto := TProdutoEntity.New;
  try
    try
      with oProduto do
      begin
        SetDescricao('TesteMarcelo').SetCodigoBarra('12345')
          .SetIdCadastro('123456');
      end;

      TProdutoController.New.Insert(oProduto);
      btnFindAllClick(Sender);
    except
      on E: Exception do
        Application.MessageBox(PWideChar(E.Message),
          'Mensagem do Sistema', MB_OK);
    end;
  finally
    oProduto.Free;
  end;
end;

procedure TvMain.btnUpdateClick(Sender: TObject);
var
  oProduto: TProdutoEntity;
begin
  oProduto := TProdutoEntity.New;
  try
    try
      with oProduto do
      begin
        SetID(MemProdutos.FieldByName('id').AsInteger)
          .SetDescricao('UpdateTesteMarcelo').SetCodigoBarra('1234')
          .SetIdCadastro('123456');
      end;
      TProdutoController.New.Update(oProduto);
      btnFindAllClick(Sender);
    except
      on E: Exception do
        Application.MessageBox(PWideChar(E.Message),
          'Mensagem do Sistema', MB_OK);
    end;
  finally
    oProduto.Free;
  end;
end;

procedure TvMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MemProdutos.Free;
end;

procedure TvMain.FormCreate(Sender: TObject);
begin
  MemProdutos := TFDMemTable.Create(nil);
end;

end.
