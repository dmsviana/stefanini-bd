USE stefaninifood
GO
CREATE OR ALTER PROCEDURE spIncluirPedido
@IDPedido int OUTPUT, --ID do Pedido
@IDCliente int, --Código do cliente que fez o pedido
@IDProduto int, --Código do produto comprado,
@IDLoja int, --Código da loja onde foi realizada a compra
@Quantidade int --Quantidade de produto

AS
BEGIN

	
	SET NOCOUNT ON

	DECLARE @Valor smallmoney --Valor do produto

	DECLARE @IncluirPedido bit = 0 --Testar se é possivel adicionar o pedido
	DECLARE @Retorno int = 0
	DECLARE @Debug bit = 0


	BEGIN
		BEGIN TRY 
			SELECT @Valor = (ValorUnitario * @Quantidade)
			FROM tProduto
			WHERE IDProduto = @IDProduto

	IF @@ROWCOUNT = 0 BEGIN
		RAISERROR('Produto não encontrado.', 16,1, @IDProduto)
	END

	--Se o parametro de pedido for NULL, gera um novo valor
	IF @IDPedido IS NULL BEGIN
		SELECT @IDPedido = NEXT VALUE FOR seqIDPedido
		SET @IncluirPedido = 1 -- Devo incluir o pedido
	END

	BEGIN TRANSACTION
		
		IF @IncluirPedido = 1 BEGIN
			
			IF @Debug = 1
				RAISERROR('Incluindo Pedido...',10,1) with nowait

		--Inserindo Pedido
		
		INSERT INTO tPedido(IDCliente, IDLoja, DataPedido) 
		VALUES (@IDCliente, @IDLoja, GETDATE())

		END

		IF @Debug = 1
			RAISERROR('Incluindo Item de Pedido...',10,1) with nowait

		--Inserindo ItemPedido
		INSERT INTO tPedidoItem(IDPedido, IDProduto, Quantidade, Valor)
		VALUES (@IDPedido, @IDProduto, @Quantidade, @Valor)

		IF @Debug = 1
            RAISERROR('Atualizando Carteira do Cliente...',10,1) with nowait

			UPDATE tCliente
			SET Carteira = Carteira - (@Valor * @Quantidade)
			WHERE IDCliente = @IDCliente
			COMMIT 
		END TRY
	
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK
			PRINT('As vezes dá errado!')

	END CATCH
END

	RETURN @Retorno

END
GO

USE stefaninifood
GO
EXECUTE spIncluirPedido @IDPedido =  null,
                                     @IDCliente = 1,
                                     @IDProduto = 2,
                                     @IDLoja = 1,
                                     @Quantidade = 1
GO

--SELECT * FROM tPedido
--SELECT * FROM tPedidoItem


