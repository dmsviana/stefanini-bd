USE stefaninifood
GO
CREATE OR ALTER VIEW vw_ProdutosCategoria
AS SELECT tProduto.NomeProduto AS NomeProduto, 
tProduto.Descricao AS Descricao,
tCategoria.NomeCategoria AS Categoria, 
tProduto.ValorUnitario AS Valor
FROM tProduto
INNER JOIN tCategoria
ON tProduto.IDCategoria = tCategoria.IDCategoria
GO

SELECT * FROM vw_ProdutosCategoria


USE stefaninifood
GO
	CREATE OR ALTER VIEW vw_PedidosClientesLojas
	AS SELECT tLoja.Nome AS Loja,
	tCliente.Nome AS Cliente,
	tPedido.IDPedido AS Pedido
	FROM tPedido
	INNER JOIN tCliente
	ON tPedido.IDCliente = tCliente.IDCliente
	INNER JOIN tLoja
	ON tPedido.IDLoja  = tLoja.IDLoja
	
GO

SELECT * FROM vw_PedidosClientesLojas