use stefaninifood
go
INSERT INTO tCliente(Nome, CPF, DataNascimento, Sexo, Telefone, Carteira) VALUES ('Diogo Marcelo', '77789876600', '1998-07-17', 'M', '83996586204', 500);
INSERT INTO tCliente(Nome, CPF, DataNascimento, Sexo, Telefone, Carteira) VALUES ('Aluska Monteiro', '29307364532', '1998-07-17', 'F', '83996586205', 200);
INSERT INTO tCliente(Nome, CPF, DataNascimento, Sexo, Telefone, Carteira) VALUES ('Henry Monteiro', '84848764114', '1998-07-17', 'M', '83996586206', 0);
INSERT INTO tCliente(Nome, CPF, DataNascimento, Sexo, Telefone, Carteira) VALUES ('Dener Matheus', '17277153065', '1998-07-17', 'M', '83996586207', 400);
INSERT INTO tCliente(Nome, CPF, DataNascimento, Sexo, Telefone, Carteira) VALUES ('Jessika Monteiro', '66792782955', '1998-07-17', 'F', '83996586208', 20);
INSERT INTO tCliente(Nome, CPF, DataNascimento, Sexo, Telefone, Carteira) VALUES ('Djaci Viana', '46844129890', '1998-07-17', 'M', '83996586209', 100);


SELECT * FROM tCliente



INSERT INTO tLoja(Nome, CNPJ, Telefone) VALUES ('Rango', '67507698000107', '83999121212');
INSERT INTO tLoja(Nome, CNPJ, Telefone) VALUES ('Hora10', '86034141000140', '83999121213');
INSERT INTO tLoja(Nome, CNPJ, Telefone) VALUES ('Saborear', '94365398000103', '83999121214');
INSERT INTO tLoja(Nome, CNPJ, Telefone) VALUES ('Boi&Brasa', '54352633000198', '83999121215');

SELECT * FROM tLoja

INSERT INTO tEndereco(IDCliente, IDLoja, Estado, Cidade, Rua, Bairro, Numero, Complemento, CEP) VALUES (1, 1, 'PB', 'Monteiro', 'Tobias Remigio Gomes', 'Alto São Vicente', 10, 'Casa', '58500000');
INSERT INTO tEndereco(IDCliente, IDLoja, Estado, Cidade, Rua, Bairro, Numero, Complemento, CEP) VALUES (2, 2, 'PB', 'Monteiro', 'Coronel Manoel Rafael', 'Centro', 15, 'Casa', '58500000');
INSERT INTO tEndereco(IDCliente, IDLoja, Estado, Cidade, Rua, Bairro, Numero, Complemento, CEP) VALUES (3, 3, 'PB', 'Monteiro', 'Projetada', 'Alto da Serra', 20, 'Casa', '58500000');
INSERT INTO tEndereco(IDCliente, IDLoja, Estado, Cidade, Rua, Bairro, Numero, Complemento, CEP) VALUES (4, 4, 'PB', 'Monteiro', 'Givonaldo Cavalcante', 'Alto São Vicente', 25, 'Casa', '58500000');


SELECT * FROM tEndereco

UPDATE tLoja SET IDEndereco = 1  WHERE IDLoja = 1
UPDATE tLoja SET IDEndereco = 2  WHERE IDLoja = 2
UPDATE tLoja SET IDEndereco = 3  WHERE IDLoja = 3
UPDATE tLoja SET IDEndereco = 4  WHERE IDLoja = 4



INSERT INTO tCategoria(NomeCategoria) VALUES ('Conveniência')
INSERT INTO tCategoria(NomeCategoria) VALUES ('Lanchonete')
INSERT INTO tCategoria(NomeCategoria) VALUES ('Restaurante')
INSERT INTO tCategoria(NomeCategoria) VALUES ('Churrascaria')

SELECT * FROM tCategoria

INSERT INTO tProduto(IDCategoria, NomeProduto, Descricao, Disponibilidade, ValorUnitario) VALUES (1, 'Heineken Long Neck', 'Cerveja 350ml', 'Sim', 7);
INSERT INTO tProduto(IDCategoria, NomeProduto, Descricao, Disponibilidade, ValorUnitario) VALUES (2, 'X-Tudo', 'Hamburguer completo', 'Sim', 15);
INSERT INTO tProduto(IDCategoria, NomeProduto, Descricao, Disponibilidade, ValorUnitario) VALUES (3, 'Filé com Fritas', 'Petisco', 'Sim', 30);
INSERT INTO tProduto(IDCategoria, NomeProduto, Descricao, Disponibilidade, ValorUnitario) VALUES (4, 'Espetinho Franbacon', 'Frango com bacon', 'Sim', 5);

SELECT * FROM tProduto

INSERT INTO tPedido(IDCliente, IDLoja, DataPedido) VALUES (1,1, '2022-09-23');
INSERT INTO tPedido(IDCliente, IDLoja, DataPedido) VALUES (2,2, '2022-09-23');
INSERT INTO tPedido(IDCliente, IDLoja, DataPedido) VALUES (3,3, '2022-09-23');
INSERT INTO tPedido(IDCliente, IDLoja, DataPedido) VALUES (3,3, '2022-09-23');

SELECT * FROM tPedido

SELECT * FROM tPedidoItem

INSERT INTO tPagamento(IDCliente, IDPedido, IDEndereco, DataCobranca) VALUES (1, 1, 1, '2022-09-23');
INSERT INTO tPagamento(IDCliente, IDPedido, IDEndereco, DataCobranca) VALUES (2, 2, 2, '2022-09-23');
INSERT INTO tPagamento(IDCliente, IDPedido, IDEndereco, DataCobranca) VALUES (3, 3, 3, '2022-09-23');
INSERT INTO tPagamento(IDCliente, IDPedido, IDEndereco, DataCobranca) VALUES (4, 4, 4, '2022-09-23');

SELECT * FROM tPagamento





