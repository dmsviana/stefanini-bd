USE stefaninifood
GO
CREATE TABLE tCliente(
  IDCliente INT IDENTITY,
  Nome	 VARCHAR(45) NOT NULL,
  CPF	 VARCHAR(11) UNIQUE NOT NULL,
  DataNascimento DATE NOT NULL,
  Sexo	 CHAR(1) NOT NULL,
  Telefone	 VARCHAR(15) NOT NULL,
  Carteira smallmoney NULL,
  PRIMARY KEY (IDCliente),

);


CREATE TABLE tLoja(
	IDLoja INT IDENTITY,
	Nome VARCHAR(45) NOT NULL,
	CNPJ VARCHAR(14) UNIQUE NOT NULL,
	Telefone VARCHAR(15) NOT NULL,
	IDEndereco INT NULL
	PRIMARY KEY (IDLoja)
);

CREATE TABLE tEndereco(
	IDEndereco INT IDENTITY,
	IDCliente INT NULL,
	IDLoja INT NULL,
	Rua VARCHAR(45) NOT NULL,
	Bairro VARCHAR(45) NOT NULL,
	Numero SMALLINT NOT NULL,
	Complemento VARCHAR(45) DEFAULT NULL,
	Cidade  VARCHAR(30) NOT NULL,
	Estado VARCHAR(2) NOT NULL,
	CEP   INT NOT NULL,
	PRIMARY KEY (IDEndereco)
);


ALTER TABLE tEndereco
	ADD CONSTRAINT FK1_ClienteEndereco
	FOREIGN KEY (IDCliente) REFERENCES tCliente(IDCliente)
	ON DELETE CASCADE;

ALTER TABLE tEndereco
	ADD CONSTRAINT FK2_LojaEndereco
	FOREIGN KEY (IDLoja) REFERENCES tLoja(IDLoja)
	ON DELETE CASCADE;


CREATE TABLE tPedido(
	 IDPedido INT IDENTITY,
	 IDCliente INT NOT NULL,
	 IDLoja INT NOT NULL,
	 DataPedido DATE,
	 PRIMARY KEY (IDPedido),
	 CONSTRAINT FK1_ClientePedido
	 FOREIGN KEY (IDCliente) REFERENCES tCliente(IDCliente),
	 CONSTRAINT FK2_LojaPedido
	 FOREIGN KEY (IDLoja) REFERENCES tLoja(IDLoja),

)

CREATE TABLE tPagamento (
  IDPagamento INT IDENTITY,
  IDCliente INT NOT NULL,
  IDPedido INT NOT NULL,
  DataCobranca DATE,
  PRIMARY KEY (IDPagamento),
  CONSTRAINT FK1_ClientePagamento FOREIGN KEY (IDCliente) REFERENCES tCliente(IDCliente),
  CONSTRAINT FK2_PedidoPagamento    FOREIGN KEY (IDPedido) REFERENCES tPedido(IDPedido),
)

CREATE TABLE tCategoria(
	IDCategoria INT IDENTITY,
	NomeCategoria VARCHAR(45),
	PRIMARY KEY (IDCategoria),
);

CREATE TABLE tProduto(
	IDProduto INT IDENTITY,
	IDCategoria INT NOT NULL,
	NomeProduto VARCHAR (45),
	Descricao VARCHAR(45),
	ValorUnitario SMALLMONEY NOT NULL,
	Disponibilidade VARCHAR(45) NOT NULL,
	PRIMARY KEY (IDProduto),
	CONSTRAINT FK1_CategoriaProduto
	FOREIGN KEY (IDCategoria) REFERENCES tCategoria(IDCategoria),
)


CREATE TABLE tPedidoItem (
	IDPedidoItem INT IDENTITY,
	IDPedido INT NOT NULL,
	IDProduto INT NOT NULL,
	Quantidade INT NOT NULL,
	Valor Decimal(12,2),
	PRIMARY KEY (IDPedidoItem),
	CONSTRAINT FK1_PedidoItem
	FOREIGN KEY (IDPedido) REFERENCES tPedido(IDPedido),
	CONSTRAINT FK2_ProdutoPedido
	FOREIGN KEY (IDProduto) REFERENCES tProduto(IDProduto),
)

--DROP TABLE tLoja
--DROP TABLE tCliente
--DROP TABLE tEndereco
--DROP TABLE tPedido
--DROP TABLE tPedidoItem
--DROP TABLE tCategoria
--DROP TABLE tProduto
--DROP TABLE tPagamento