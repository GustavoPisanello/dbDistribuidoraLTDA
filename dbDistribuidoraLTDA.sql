create database dbDistribuidoraLTDA;
use dbDistribuidoraLTDA;

/* pedido, produto, fornecedor, nota fiscal, compraprod*/

create table Cliente(
	idCli int primary key,
    CNPJ bigint(14),
    CPF bigint(11),
    CEP bigint(9),
    Email varchar(30),
    telefone bigint(20),
    endereco varchar(50)
);

create table ProdutoVenda(
	ValorItem decimal (6,2),
    Qtd int not null,
	codBarras varchar(20),
    foreign key (codBarras) references codBarras (Produto),
    idVenda int,
    foreign key (idVenda) references idVenda(Venda)
);
create table Venda(
	idVenda int primary key,
    dataVenda date,
    valorTot decimal(6,2)
);

create table NotaFiscal(
	idNota int primary key,
	dataEmissao date,
    totalNota decimal(6,2),
    idVenda int not null,
	foreign key (idVenda) references idVenda (Venda)
);

create table Fornecedor(
	idFornec int primary key,
    CNPJ bigint(14),
    nomeFornec varchar(20),
    telefone bigint(11)
);

create table Produto(
    codBarras varchar(20) primary key,
    nomeProd varchar(50),
    valorProd decimal(6,2),
    Qtd int not null
);

create table CompraProduto(
	ValorItem decimal (6,2) not null,
    Qtd int not null,
	codBarras varchar(20),
    foreign key (codBarras) references codBarras (Produto),
    notaFiscal int not null,
    foreign key (notaFiscal) references notaFiscal (Compra)
);

create table Compra(
    idFornec int not null,
    foreign key (idFornec) references idFornec (Fornecedor),
    notaFiscal int primary key,
    dataCompra date not null,
    valorTotal decimal (6,2),
    quantTotal int not null
);