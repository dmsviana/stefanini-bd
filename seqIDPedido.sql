USE stefaninifood
GO

SELECT * FROM tPedido

CREATE SEQUENCE seqIDPedido
	START WITH 5
	INCREMENT BY 1;

--SELECT NEXT VALUE FOR seqIDPEDIDO;

--DROP SEQUENCE seqIDPedido